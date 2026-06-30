Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07931383310
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818343; cv=none; b=qh3LIicD3H+K3IIDvu2GzjuDMqaI4xqfhmA51yMckNh2+8r+lOuqf/kUT5eeeHDK01ysFeCuTE5jkoRyHKXQOHV+IbWH4p9KscE1rlFMYrH+ajLzrBfJvj3441XRM80zAo/m/Xh2ktRhogdyd1aj9ExRf+YHnWt4CYTbkURW2bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818343; c=relaxed/simple;
	bh=5AKlnB/JYn38pa1De++ya76vSkvKoNfImnI+X75k+GA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X7HqA5IVsKeHOvByOQ8O4CPiVDBWMewwnfvuHjVeWVYKO6eKDbspG5ibpnrKMRdj815iwd8LIXEPKdZPwTpu833RZ2snHnOJZTwcbHMj0Qyd6nBaobF5fxyM4zB7Nx9uhBQDGCcpxLvglymJZQaHvquPCVFPgFc4k1JY66BZqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ly6tjeHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ly6tjeHk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D5C1F000E9;
	Tue, 30 Jun 2026 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818341;
	bh=TsF35u4D7lQRb+/A0XPPvlWBHVtrVw+ih5nYD/XML4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ly6tjeHkSva7pqdXV2v7PSzTTOrzLGYXqH7NS4ezNJFE0ikQv9mj8lHab+pOy6n+a
	 l9PWS25Zvx/j3vatbEUrXLKhOe//4EsNdp7EKxsBGLPCWM2t3b+QG7NTMlGy8kGt46
	 VklThAHhqy7uUHjABFvg9VCIbOqB3+3GsZ0lZl9t+uvM8SAJvAfnh9uLd6bV6QWvRK
	 CpCQUhaqpmLiZDsa6rlM0lIoz5K3YM71pzdpwDMjwobE29le9xwr4ZMkVAAjIxN2BR
	 Zz8gY/ecve9OsUWP8Vb/HcDdGkSZ7hiqxFmAEKoECYABRhsWMfg2YItmYq2ZzNXliO
	 2JCN7iWbtOj9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe
 issue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-4-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-4-7201e1841e94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 11:19:01 +0000
Message-Id: <20260630111901.B1D5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Leaked coresight trace ID on driver unbind for platform devices.
- [Medium] Unconditional free of trace ID in AMBA remove triggers WARN on u=
nallocated IDs.
--

commit 95ddd2ab120783ca669e4302a341bf092ecf6485
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: sm8750: fix traceNoC probe issue

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. The AMBA peripheral
ID probing fails on this platform, so the device never probes.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
Dropping "arm,primecell" makes the device probe through the platform
driver instead of the AMBA bus, which resolves the probe failure while
keeping it an Aggregator TNOC that retains ATID functionality.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
>  		};
> =20
>  		tn@109ab000 {
> -			compatible =3D "qcom,coresight-tnoc", "arm,primecell";
> +			compatible =3D "qcom,coresight-agtnoc";

[Severity: High]
Does switching to the platform driver probe path introduce a trace ID leak =
on
device unbind?

When the device probes via the platform driver due to this compatible string
change, _tnoc_probe() calls trace_noc_init_default_data() which successfully
allocates a trace ID via coresight_trace_id_get_system_id().

However, looking at the driver's platform remove callback:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_platform_remove() {
	struct trace_noc_drvdata *drvdata =3D platform_get_drvdata(pdev);

	coresight_unregister(drvdata->csdev);
	pm_runtime_disable(&pdev->dev);
}

The allocated system trace ID is never released via
coresight_trace_id_put_system_id(). Will this eventually exhaust the global=
ly
limited pool of hardware trace IDs if the driver is unbound?

[Severity: Medium]
For configurations that still probe via the AMBA bus (retaining the
"arm,primecell" compatible), does the AMBA remove callback unconditionally =
free
unallocated trace IDs?

If a device node uses a compatible that results in atid being assigned
-EOPNOTSUPP, the _tnoc_probe() error path safely checks if (drvdata->atid >=
 0)
before freeing it. However, trace_noc_remove() does not:

drivers/hwtracing/coresight/coresight-tnoc.c:trace_noc_remove() {
	struct trace_noc_drvdata *drvdata =3D dev_get_drvdata(&adev->dev);

	coresight_unregister(drvdata->csdev);
	coresight_trace_id_put_system_id(drvdata->atid);
}

Because coresight_trace_id_free() validates the ID and fires a kernel WARN =
if
it is invalid, will this trigger a warning during AMBA device unbind?

>  			reg =3D <0x0 0x109ab000 0x0 0x4200>;
> =20
>  			clocks =3D <&aoss_qmp>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-fix-tracen=
oc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com?part=3D4

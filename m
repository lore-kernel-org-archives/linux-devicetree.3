Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFF2382298
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817682; cv=none; b=INO9Qo5kzMh+9juMnAOb7AT2VsFS39UlCttSBgkFWpprZOQrvXw2MuzpVNBFtK5TzXeXeO9CxUCft2FYiK0ivlFwG251iHTTCYsU9+4o0fAEwEc83XH1v+UYqGif6x0j7VJLF4EN+km7fnidr1QORZC6E3w/1jndQpxa3aRC0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817682; c=relaxed/simple;
	bh=qdigVaqFigTwOzQS+EoOPxe45+j74Wq/enSNJ0Fxa7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AshrSyxg4Y8QG+xAuI60ykyaQroXbYAl5GcdEJwOJMzO3B6bhBdkGODF6nzvB8xbgKgh1ZcwunE/aR2Hq8oVhdefONFVT0mNShkqOc1g3ZQJmRQLZG0x7BK8T/sCxGjroLqH1rrMhPnuwrR+hq53MCpvWvEkqHz5/+3wUMinhHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2WJi6/y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2WJi6/y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7331F000E9;
	Tue, 30 Jun 2026 11:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782817681;
	bh=EqSRGRe08svyJYIZMarld5jBgUCEg4zUujNHBWFsZlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m2WJi6/y212yMEzHxeEA/UtK/I+ImbyX+RuSB7fBK6HVTG51i0t/Wz/3mZuqJuNt3
	 Mx0Z0cJKdah6H66WOHoWDTIK82cC/X3AzfvxRYw59Cd/yNt9WvnlFF9A/+bLVu4N6V
	 xrtWJbHD1RpKspMuNRfjVS13lMv1hZC+6VzvWV4/C34ITXEmaz4EyuKWgntskUdjc3
	 p12k/VGFUVOVVrRqcL3YWxuWEE4KVFVWVOAlV+6+Q2iUomoTLs0qwhlHCETdwVcmzV
	 6uUqOFkzi9czECWsNbqUIDklO2Oh0Y2zXogD1a0Ca1satA+r1pbe3G/WbnBwYkDYii
	 mvRMdFKPZSffg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 11:08:00 +0000
Message-Id: <20260630110801.0B7331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Trace ID (ATID) leak on driver unbind when using the `qcom,coresig=
ht-agtnoc` compatible with the platform driver.

Pre-existing issues:
- [High] Switching the device to the platform driver exposes an unbalanced =
clock disable during probe error paths and driver unbind due to a conflict =
between devm_clk_get_optional_enabled() and manual PM runtime clock managem=
ent.
--

commit 6dd81dc5c2c5997c8cc48dc9206b866b99451df0
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: fix traceNoC probe issue

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell" compatibl=
e,
which failed probing on the AMBA bus. This patch switches the node to the
"qcom,coresight-agtnoc" compatible so it probes through the platform driver.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7aa9653bd456e..e98f4aa4b141a 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
>  		};
> =20
>  		tn@111b8000 {
> -			compatible =3D "qcom,coresight-tnoc", "arm,primecell";
> +			compatible =3D "qcom,coresight-agtnoc";

[Severity: High]
This is a pre-existing issue, but switching to the platform driver exposes
an unbalanced clock disable during probe error paths and driver unbind.

When probe uses devm_clk_get_optional_enabled(), it queues a devres cleanup
action to call clk_disable_unprepare(). However, the driver also manually
disables the clock during runtime suspend:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_runtime_suspend() {
    ...
	clk_disable_unprepare(drvdata->pclk);
	return 0;
}

When unbinding the platform driver, tnoc_platform_remove() doesn't wake the
device up before disabling PM runtime:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_platform_remove() {
    ...
	coresight_unregister(drvdata->csdev);
	pm_runtime_disable(&pdev->dev);
}

If the device is runtime suspended during unbind, the clock is already
manually disabled. The devres cleanup will then run and double-disable the
clock. Does tnoc_platform_remove() need a pm_runtime_get_sync() call to
ensure the clock is enabled before devres takes over?


[Severity: High]
Does switching to the platform driver expose a trace ID (ATID) leak on
driver unbind?

The platform driver allocates a system trace ID for agtnoc devices during
probe:

drivers/hwtracing/coresight/coresight-tnoc.c:trace_noc_init_default_data() {
    ...
	atid =3D coresight_trace_id_get_system_id();
	if (atid < 0)
		return atid;

	drvdata->atid =3D atid;
}

But the platform remove callback doesn't seem to free it, unlike the AMBA
driver's remove function:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_platform_remove() {
    ...
	coresight_unregister(drvdata->csdev);
	pm_runtime_disable(&pdev->dev);
}

Could this exhaust the system trace ID pool if the device is repeatedly
unbound and bound?

>  			reg =3D <0x0 0x111b8000 0x0 0x4200>;
> =20
>  			clocks =3D <&aoss_qmp>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-fix-tracen=
oc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com?part=3D3

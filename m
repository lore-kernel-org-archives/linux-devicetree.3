Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E16FC3
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 02:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871679; cv=none; b=IbJY2aRbrUd0NU8kD9JBNrG27krcMrgrxUJIZj8W7aZRWspY55KZ4aIBD7/lc/W1B6obnRAISKJ3pgodJurgMBYaVy32EmWc7Om4zkacqef7mkJp4uaxzNpDDPq1Vai1E5UslpAmYeOAyi6I1gsHRtxyJRoEl6RBC8josztaZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871679; c=relaxed/simple;
	bh=6b8ucR701iCaXpLcY6Q95bvS95gPirJkHKVgkhxcxLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=POKK/0SNvgqxuyRCxXu8NiW6ATLXFP+8XthwuoVUW6+BINF83KzxmWKTbF3byNU+ntf6wy8QMY0fgQTHKKUtpGC5W9mfeLCL35JeVVXc2MuYA3PjpFMTWFWeBkvmF+OUtwtPNeZqt84DEq0KcGe3hq51ecTYDc7lX3ZRxs8rixw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SathwX6n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SathwX6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90331F000E9;
	Wed,  1 Jul 2026 02:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782871678;
	bh=gX/+//H8khSSp6zh8twSxAvMCdAGIjvjJKwMUtaRU5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SathwX6ng+hwGoiX9nbaoo/pzfALYflQ5gjweRmcFmvYIV1jRFRAxYEbc3nzq4VmZ
	 6OZeX6Ay/06F/ce8rwIqD2flR2tEz59puRM+mjCjvxU2kF7qdoT10NeL10GZ2UnfeN
	 cFoeZl0RyfTeKk6yPHNKrUjd83CeMyU+okoJb2zoQNjd343L9gvEZ4GhbbFHlwO3Kv
	 BDsfsWXG6O7boaakX3aenXR+1qReOPQovAut+FpM2cGh/FnqYF16e4vxGe1kh6jBh1
	 Ht0ladKIsC6tGnCrR54FaIprxOiPYjBnnV1ghWWLHa5ZbNeOjgmi9CCxKLmJU4Eiq5
	 QWuslt8/od+Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-3-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-3-aefab449a470@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 02:07:57 +0000
Message-Id: <20260701020757.B90331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Switching the Trace NOC from an AMBA device to a platform device e=
xposes a double clock disable bug during driver unbind due to mixing devm-m=
anaged clocks with manual PM runtime callbacks.
--

commit dec424aa5c224444a6c7946ea25210a9094f968f
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: fix traceNoC probe issue

This commit switches the traceNoC node from an AMBA device to a platform
device to fix an issue where the device is stuck in deferred probe due to
missing CID registers.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> @@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
>  		};
> =20
>  		tn@111b8000 {
> -			compatible =3D "qcom,coresight-tnoc", "arm,primecell";
> +			compatible =3D "qcom,coresight-agtnoc";

[Severity: High]
This isn't a bug introduced by this patch, but does migrating this node to
the platform driver expose a double clock disable issue during unbind?

When the driver binds via the platform device, if a user unbinds the driver
via sysfs while the device is runtime suspended, it seems to trigger an
unbalanced clk_disable_unprepare() call.

Looking at tnoc_platform_remove() in drivers/hwtracing/coresight/coresight-=
tnoc.c:

static void tnoc_platform_remove(struct platform_device *pdev)
{
	struct trace_noc_drvdata *drvdata =3D platform_get_drvdata(pdev);

	coresight_unregister(drvdata->csdev);
	pm_runtime_disable(&pdev->dev);
	if (drvdata->atid > 0)
		coresight_trace_id_put_system_id(drvdata->atid);
}

Since tnoc_platform_remove() calls pm_runtime_disable() without first
waking the device (e.g. via pm_runtime_get_sync()), the device remains
suspended and its clock remains disabled by tnoc_runtime_suspend().=20
   =20
When the driver finishes unbinding, the devres framework executes the
cleanup action for devm_clk_get_optional_enabled(), which calls
clk_disable_unprepare() a second time.

Could this lead to a clock subsystem underflow?

>  			reg =3D <0x0 0x111b8000 0x0 0x4200>;
> =20
>  			clocks =3D <&aoss_qmp>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-fix-tracen=
oc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com?part=3D3

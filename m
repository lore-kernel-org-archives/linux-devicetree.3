Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9059A343D7F
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926954; cv=none; b=QZ5svacNEoWewgsmiZdKwG+C711AizNmtWMj8zv+JMIcvr5E8q1qrj4HGTIbSuQ62Y7d+XWh1ONQIcGrV7gax2D2b51l6PCkDuLQwnDL/4SdxekNATYRT+wwdEZw80kkaOriPq1T47KdnsQz6bdZxv+unFp1Ds51s0FISPuDvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926954; c=relaxed/simple;
	bh=9LmVv53Own3MgB2FtGCCfVEydOOBMPurDJtKvfAvosc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DSKSKIkMMn5SpS2HfO238xSZtXPAhrHERtyO15X/oYBPU7hNLaJhNsNjJniRMwrPbn7xsIsItx43S9HInPEXKWGg9W44ptlHfxaR2FLUtJ4EKrhxCNJ7JOlvwx86r+KRYWQISn6enRqEsaMAgVPqycO/qQIYo60wGKYVfHMabsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oj39tixe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oj39tixe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AD01F000E9;
	Fri, 28 Aug 2026 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787926952;
	bh=USIBPZIIitxiDbYgG5g1JltFJ3mijD2CH92KveFVOAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oj39tixeZdYZ3eLCW62ianppzXL/2NVm3BNkjFOES2g9dJkkH5SsxB/6kJqEhEEKd
	 8zASF8Y0xtahPOkCVxHZklFa5CNoFkIaaXV8mia95EPOBoljXFmtI+E7zlar1jDfip
	 GXfkmp4Jxwwxy414GBiNZYyMM2VPMd7JKXuq+loAZUgAfrTqTyTE8by/tsJqzW4glG
	 Xj4kcsQ/+WIfaE8Vg+oI1TmYo+tazuOY3AxE3KHDg7H/scGtcH4mJNjlHZ0hLg0iQ2
	 txBjJd0f1yrzSJxTKnX3G/NDzZRa9OuzJdPo/1A9mYdIEuPEEFDbDU1nKkOQ9In0dQ
	 lzxrgRT/vTxdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC/DO NOT MERGE 07/12] drm/msm/hdmi: Split PHY init
 from power up
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-7-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-7-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 14:22:31 +0000
Message-Id: <20260828142231.81AD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The HDMI pixel clock is disabled before the 20ms vblank delay, bre=
aking the intended shutdown sequence and risking hardware hangs.
- [Medium] Unconditional clock disable and PHY deinitialization can cause u=
nbalanced clock teardown or CCF warnings.

Pre-existing issues:
- [High] Hardware registers are accessed after dropping the runtime PM refe=
rence.
- [High] Missing return value checks for hardware initialization functions,=
 such as `pm_runtime_resume_and_get()` and `msm_hdmi_phy_resource_enable()`.
--

commit 821f230494b55344c7aaf6bb73ba3e416ff8cb25
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: drm/msm/hdmi: Split PHY init from power up

This commit reworks and splits the msm_hdmi_power_on() sequence into
smaller steps. It separates out runtime PM enablement, introduces a new
msm_hdmi_phy_init() step, and splits clock preparation and reparenting into
msm_hdmi_clk_prepare() which runs after PHY initialization.

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm=
/hdmi/hdmi_bridge.c
> index 9d027f96ae243..ead6ba3b8192a 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -15,12 +15,18 @@
> =20
>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
>  {
> -	struct drm_device *dev =3D bridge->dev;
>  	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
>  	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
> -	int ret;
> =20
>  	pm_runtime_resume_and_get(&hdmi->pdev->dev);

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
pm_runtime_resume_and_get() here?

If it fails, the power domain is not enabled and the PM usage count is not
incremented. Proceeding to access hardware registers will cause an SError
or panic, and the subsequent pm_runtime_put() in the disable path will
underflow the usage count.

> +}

[ ... ]

> @@ -341,6 +359,8 @@ static void msm_hdmi_bridge_atomic_post_disable(struc=
t drm_bridge *bridge,
>  	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
> =20
>  	msm_hdmi_phy_powerdown(phy);
> +	msm_hdmi_clk_unprepare(bridge);
> +	msm_hdmi_phy_deinit(phy);
> =20
>  	if (hdmi->power_on) {

[Severity: Medium]
Can this unconditional clock disable and PHY deinitialization cause
unbalanced clock teardown or Common Clock Framework warnings?

If atomic_post_disable() is called to sanitize the hardware during initial
modeset (where hdmi->power_on is false), msm_hdmi_clk_unprepare() will be
called without a matching prior enable. This bypasses the state tracking
guard and triggers a WARN in the CCF.

[Severity: High]
Does this code disable the HDMI pixel clock before the 20ms vblank delay
inside power_off()?

Because msm_hdmi_clk_unprepare() is called before power_off(), the
pipeline is frozen mid-frame before the delay executes. Powering down a
frozen display controller mid-frame frequently causes system-wide bus hangs
(AXI bus stalls) on ARM SoCs.

>  		power_off(bridge);

[Severity: High]
This is a pre-existing issue, but can the code following power_off() access
hardware registers after the runtime PM reference has been dropped?

The power_off() function drops the runtime PM reference via
pm_runtime_put(). Immediately after, msm_hdmi_bridge_atomic_post_disable()
calls msm_hdmi_audio_update() if the display info is HDMI.

This accesses MMIO registers via hdmi_read() and hdmi_write(). It risks an
asynchronous SError (kernel panic) if the power domain is turned off in the
background before the accesses complete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-drm-msm-hd=
mi-eliza-v1-0-67843277de17@oss.qualcomm.com?part=3D7

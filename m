Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2086838F633
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852171; cv=none; b=lx6Uu+BHEUt4rpiNjAYnZYwpPzOk9vfN7wzwxfWOX5eg22x77xrFLAqjZu5+4DsIR9GY+xFz29GdlJmw2LdGD6cHXyqB27+CfuUOp46WJCA+rWnfge2lSKqojJoE3kTQmLZQqXOw/aXvUmTHULr0Ewi59megb7oNUqQZiqiPDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852171; c=relaxed/simple;
	bh=hjrlLuKKGUfdW/Ch2HbP3JjxCQZjP/A009LrKpTkEFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MLu1aWYdlI5hNQP8l1QkkwToHSNh+xSXxjhlCXnBORWmfWNv32o4d7qlI0mpHCwCIoPmaOntAXkJpvn+cXGYfNvg2+YV+IJmD5/BKxNIi0a/gGI6J4qNQTBrIuv7HMb3BjNLDz98O8MhBRFHqN0medUh8y/69PLm7H+14h8uTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYD5uTiL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYD5uTiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C5B1F00A3A;
	Tue,  8 Sep 2026 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788852169;
	bh=iZ3HFLDmzP191HKMjkSGl5UNPb9KoynZv0pdk3OBJno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OYD5uTiLtUBFu5OUJt+cK+dlbL2wVLqtaNEYa3dG3KZRnaQFHIkqBoci3TYf6Z4Jc
	 1LWF/Q8QOZx6URIeWVgpkSWMppzX/q6XyO7souv2e+PGwV8ChWkMcrN15ZKmSez1BW
	 vdvdv1WlF3MKDNTm2RXkuk29pWoZSk2QEfcv+qvFxpOB5useq1/9tRmBw0A4jqJfv4
	 Ve9ZdcqepeUCbM3x3HijTmGPOU3o18x1MX0m6Y7Q5fA5xLS0zZOS5ZbIrQoNZhlCbg
	 QF7eLvZd7BBicU2A3CBbkJ0KpCBmNxx3SWQeDgIefeNU6NKsc9nIsD0hsGM6wDauHs
	 wWOiHRrx4PSdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:22:49 +0000
Message-Id: <20260908072249.83C5B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unclocked register access in `msm_hdmi_bridge_atomic_post_disable`=
 if `atomic_pre_enable` fails, leading to a system crash.
--

commit cf37fcc44eb6e3ec93e18234643d645b17ce8c49
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: display/msm: hdmi: Correct name of disallowed supplies

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead.

> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Do=
cumentation/devicetree/bindings/display/msm/hdmi.yaml
> index dfec6c3480f3f..02d27ccad0247 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -113,7 +113,7 @@ allOf:
>              - const: core
>              - const: master_iface
>              - const: slave_iface
> -        core-vcc-supplies: false
> +        core-vcc-supply: false

[Severity: High]
Can this series cause an unclocked register access regression if
atomic_pre_enable fails?

When a userspace DRM atomic commit triggers atomic_pre_enable, if
msm_hdmi_power_on() fails (e.g., clk_prepare_enable failure), the error path
introduced earlier in this patch series disables PHY resources and returns
early:

drivers/gpu/drm/msm/hdmi/hdmi_bridge.c:msm_hdmi_bridge_atomic_pre_enable() {
			if (msm_hdmi_power_on(bridge)) {
				msm_hdmi_phy_resource_disable(phy);
				return;
			}
}

This leaves hdmi->power_on as false. Since DRM core continues because
atomic_pre_enable returns void, later when the pipeline is disabled,
msm_hdmi_bridge_atomic_post_disable() is called unconditionally:

drivers/gpu/drm/msm/hdmi/hdmi_bridge.c:msm_hdmi_bridge_atomic_post_disable(=
) {
	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);

	msm_hdmi_phy_powerdown(phy);

	if (hdmi->power_on) {
}

These functions execute register writes without being guarded by
hdmi->power_on. Since PHY resources were dropped on error, it writes to
unclocked and unpowered hardware, which can cause a bus error or synchronous
external abort.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-drm-msm-hd=
mi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D6D36C9C2
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778553660; cv=none; b=PGOcY4qpfRM0D5znT6JvAvKh0c00bBGTk8qHZZb4G5TTC7w7bNm4UniiqOqgv97H/cZXKCjO2OsRDHz118ccLnNgBsczKj6qAlR0T0cSdpB2yh2puYpCUCCYMZdn+SAfEVpwPCUpSWBE0IPYpdFSgLfJiNozdm6AkDLjrNwPpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778553660; c=relaxed/simple;
	bh=QbevVUI01BotMwttwVy4/2jaGVcoyB+q0AGV7QjcxEE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FWZAAtMlRBL2PrkzaeNPxBuT4HZmM7KfwhjIjR29UxIzkdI4OPamQHsJxS41KlVTUi5ZqmrBhJ3Y0U4eihQcD4/J33hGnQtiJ89auZTLZxLqvf2aD/beDwjycfGC+WQK51UnLCUvHVQMPdKzOWdvsYfFl8Z0Do4Rk+so3vrGLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHFHH9As; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHFHH9As"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD730C2BCF5;
	Tue, 12 May 2026 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778553660;
	bh=QbevVUI01BotMwttwVy4/2jaGVcoyB+q0AGV7QjcxEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eHFHH9AsGlocKXdIZ1QeBQyihBnqgcxLQ+By/4sN6DR3w/FumPWrhAV0BxcZgYYMI
	 Lj/mr1A0wD/VHLACvqcEZaSfl9F1sE+v8b6vKpsAyqMdY5duTVEB4KZEpIfWFLAEMO
	 qTfgTjd2CAE8s0axjW3cLIAF7hDF3ozSsYySnV7cxQkvN/v0b8EWS2ERPVcxh7KbP4
	 82dEEIPjPW/M75w7FORdC+X2jMQMFxUZyZH0fvvY0jOudz+/fSiqdtJXbWg/HCD8p5
	 NF+9PZQp12sVCL1JrnaRW/jB+cNQCcEXmn8RJ58AmeiVwHsC+zHhzbyRvbTWgffxT9
	 xAJ8LLP38aoVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/9 RESEND] ARM: tegra: transformers: Add connector
 node for common trees
Reply-To: sashiko@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511074859.24930-7-clamor95@gmail.com>
References: <20260511074859.24930-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:40:59 +0000
Message-Id: <20260512024059.BD730C2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Migrating to the DRM bridge framework silently breaks HDMI CEC, au=
dio, and AVI infoframes.
- [High] Strict removal of legacy `nvidia,hpd-gpio` and `nvidia,ddc-i2c-bus=
` breaks older kernels, while retaining them exposes a probe conflict.
--

commit fb3e359e4dd58d87afe7ba7cf548657a8457080f
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: transformers: Add connector node for common trees

This commit adds a micro-HDMI connector node to the ASUS Transformers
device trees to use the connector framework, now that Tegra HDMI has
bridge/connector support. It replaces the legacy hpd and ddc properties
with an endpoint connecting to the new hdmi-connector node.

> diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dts=
i b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
> index b48f53c00efae..5b758aad8d150 100644
> --- a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
> @@ -79,9 +79,11 @@ hdmi@54280000 {
>  			pll-supply =3D <&hdmi_pll_reg>;
>  			hdmi-supply =3D <&vdd_hdmi_en>;
> =20
> -			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> -			nvidia,hpd-gpio =3D <&gpio TEGRA_GPIO(N, 7)
> -				GPIO_ACTIVE_HIGH>;

Does the removal of nvidia,hpd-gpio and nvidia,ddc-i2c-bus cause a regressi=
on
in device tree ABI backward compatibility for older kernels that lack
hdmi-connector bridge support?

If these legacy properties are retained to preserve compatibility, will
tegra_output_probe() unconditionally request the nvidia,hpd GPIO and confli=
ct
with the display-connector driver requesting the same GPIO via hpd-gpios?

Since GPIOs are requested exclusively, this might result in an -EBUSY error
that fails the DRM probe entirely.

Does the DRM driver need to be patched to ignore legacy properties when a
bridge is present before applying this DT migration?

> +			port {
> +				hdmi_out: endpoint {
> +					remote-endpoint =3D <&hdmi_connector_in>;
> +				};
> +			};
>  		};
>  	};

Does migrating to the DRM bridge framework here cause a regression with HDMI
CEC, audio, and AVI infoframes?

When hdmi->output.bridge is used, tegra_hdmi_init() dynamically allocates a
connector, leaving the internal legacy hdmi->output.connector structure
zero-initialized.

Could this cause tegra_output_init() to skip CEC notifier registration beca=
use
connector_type evaluates to 0?

Additionally, does this cause tegra_output_is_hdmi() to return false (since
display_info.is_hdmi is 0), which would force DVI fallback mode in
tegra_hdmi_encoder_enable() by setting hdmi->dvi =3D true?

This fallback mode appears to bypass tegra_hdmi_setup_audio() and skip all
AVI and audio infoframe configurations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511074859.2493=
0-1-clamor95@gmail.com?part=3D6

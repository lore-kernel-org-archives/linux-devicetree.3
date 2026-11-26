Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657096;
	b=NJw6WgFO84LJXs49twoLgANs7hk1GkroKfrg53iCC+YtDLnlMHzeS8aooHWB9OtgogmJ
	 EXNW8DmUGfLi27DzWMKQEnUZVUyi2VMYZOSLJHKEMWeIB/vyMNLTnR98to2xYtFJBsm+4
	 CgktrR6CZx5I7OmX0Xr55+xIq1f8vPu+n7ilm/nD6Kdjg6F13OcW/GB0Xbl2U93p+ryUA
	 PyuSjEvqqXH4ZQqc56cofpmo0aAmj6qaVrN8gHLJae/VdUdVIldaCySMTNMqMibFQZiJs
	 3YJMS/Nwk5jc3lv8dn9uHyopibge1HJtNzZt8/JrzOIcfPEbGL1WRlaAGUyyGDpmZyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657096;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+lad4pCjCdG1H/0L034S+uQS+f0EyMnw+hfLC5ytP0M=;
	b=p5vFvL3DALcNSBau0NJ49J82EsftJ7TszWa+VJolq0EhGWE2F+C7GzFQ6ykgHlc7FuGy
	 OQm803hOR8KlMmrSqK4n79JUZt37/vq2+3JnGXV9hospz+s5TYxceZu7B+Uk3q1sMouzK
	 M7OLHNQlSwJPOJzv5tSqZIZN4Kcoxx9jJlZJDubRaPik9m53lcOkJiHyJSHgJNh+I+djB
	 3+B+C4HZGQ+MFHH0+T4gjfa27sNoY8KRRjaoqY0C52TKdVRMBKGRZ2Uym3XsyFve0nlFo
	 dQIWAyvn4ZxqrHS+Y4zz3gZiI2OMwFMq+i5uFaHcLee8gKQd6kd0L3qZ0daL1owbbOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BiSMgeHy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958B8606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BiSMgeHy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFE51F000C6;
	Thu, 26 Nov 2026 01:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795657096;
	bh=+lad4pCjCdG1H/0L034S+uQS+f0EyMnw+hfLC5ytP0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BiSMgeHyUaho7M4PuYXGcq1UZWc3QpvGzupwKyMsOKQlY6BeCrFjD2ztMeyCT71gd
	 3/N5IslUaAdF2gtzT2xRE/mCuh5cSQGYlfBW+1C1n96+7Y42BztoN3IpLs9ToGRb0t
	 ICNRRCVgRZcqzz3CinV3k2wEkiOxXtW9AeHfoUVnyGWCfngonNQC7GAScgxJTqhfFr
	 csTVdjz3ixEZArmNgp1KnakuC5RI64/KI4VZjh7ynJc6mNVoSDMlN8pD0rQI7nUhBr
	 sHIwncn9th9gB5n/oT0FOFJC5NgEcGIo3B9pb6d5cbyg5B4LobEDdrz5XYwbtak7Ck
	 KmbTWo7IKxtFA==
Message-ID: <sashiko-outbox-234571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RK3588 Jaguar
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-11-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
 <20261126-rockchip-usb-c-dp-altmode-v1-11-7991eb5bb426@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 01:38:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: rockchip: missing altmodes node in rk3588-jaguar
  usb-c connectors
--

commit 6630f46c0f1c921c9b89f36aebb088fca287fca2
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

arm64: dts: rockchip: Add USB-C DP AltMode for RK3588 Jaguar

This commit enables the DisplayPort controllers and updates the USB-C
connector, USBDP PHY, and USB host controller port graphs to support
DisplayPort AltMode on the RK3588 Jaguar board.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/=
boot/dts/rockchip/rk3588-jaguar.dts
> index 0446834e84d5d..fcc4a043b2990 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
[ ... ]
> @@ -375,7 +407,7 @@ port@0 {
>  					reg =3D <0>;
> =20
>  					usbc0_hs: endpoint {
> -						remote-endpoint =3D <&usb_host0_xhci_drd_sw>;
> +						remote-endpoint =3D <&usb_host0_xhci_hs>;
>  					};
>  				};
> =20
> @@ -383,7 +415,7 @@ port@1 {
>  					reg =3D <1>;
> =20
>  					usbc0_ss: endpoint {
> -						remote-endpoint =3D <&usbdp_phy0_typec_ss>;
> +						remote-endpoint =3D <&usbdp_phy0_ss_out>;
>  					};
>  				};
> =20
> @@ -391,7 +423,7 @@ port@2 {
>  					reg =3D <2>;
> =20
>  					usbc0_sbu: endpoint {
> -						remote-endpoint =3D <&usbdp_phy0_typec_sbu>;
> +						remote-endpoint =3D <&usbdp_phy0_dp_out>;
>  					};
>  				};
>  			};
> @@ -488,7 +520,7 @@ port@0 {
>  					reg =3D <0>;
> =20
>  					usbc1_hs: endpoint {
> -						remote-endpoint =3D <&usb_host1_xhci_drd_sw>;
> +						remote-endpoint =3D <&usb_host1_xhci_hs>;
>  					};
>  				};
> =20
> @@ -496,7 +528,7 @@ port@1 {
>  					reg =3D <1>;
> =20
>  					usbc1_ss: endpoint {
> -						remote-endpoint =3D <&usbdp_phy1_typec_ss>;
> +						remote-endpoint =3D <&usbdp_phy1_ss_out>;
>  					};
>  				};
> =20
> @@ -504,7 +536,7 @@ port@2 {
>  					reg =3D <2>;
> =20
>  					usbc1_sbu: endpoint {
> -						remote-endpoint =3D <&usbdp_phy1_typec_sbu>;
> +						remote-endpoint =3D <&usbdp_phy1_dp_out>;
>  					};
>  				};
>  			};

[Severity: High]
Are both usb-c-connector nodes missing an altmodes child node with a
displayport subnode (svid 0xff01)?

During port registration, tcpm_register_port() ->
typec_port_register_altmodes() looks up the "altmodes" child node on the
connector fwnode and registers no port alternate modes when it is absent.
When a DisplayPort AltMode partner is attached, typec_altmode_set_partner()
finds no matching port altmode and leaves altmode->partner NULL, causing
typec_probe() to fail with -ENODEV before dp_altmode_probe() can bind and
switch the USBDP PHY mux.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-rockchip-u=
sb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com?part=3D11

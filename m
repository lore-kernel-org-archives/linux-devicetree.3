Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696075;
	b=BKHVWKXrPg/u9uFVjWjYoYEdT03v6HaFLoUJa6F5xe4K1xx5slga9mnre3jrS0X9kzQc
	 Ie9J7c3wJz/AQTcqhdQMqCYgMll1T9NWM9CGCMdV42IXNff6SOHTqG2+X+S1erl7uON1S
	 fJ2ftYzq1j72LvuYQDb+3YYJ3NWH9sYCVnuRdu45IDH5f+QYZl8YqfMT6FHryXw5ygBk3
	 PeTZMrgqFGD78CphQyuShSuMc+1KnjezuHZZVhPkedlGqc/I1XJ4IOG1zIa34xmW3cZY2
	 1IQP7tS0Yu7ibboryzpAZKUWJTCiQFjU5Oq5bdS0Rb5GDCKbt/6dntbD9Yr9Fi1w8CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SzRb8gxs5rhfvZRxfyzyGCLFYGZVHtAW1hWtV88plgU=;
	b=1G27iJ5GXbZpbQrdXK+uD/Rn4sQd2peI7NjGhM5wG32f1/6it1JkgeygPyvYhp+V2RFB
	 IdGAosigZOEgMQylnbnU8SFdbe2r8D3X7KHluq6tys7Vku5zP4Kv+NAVz6K28OBGzLPe7
	 uD3lUWah3duilqv8oRqW9nxwHMzN6mJxcucjNGzesGE9jQLxvufDY7y1dvHWEMno8ZpHL
	 Nkmdp3OaMEPlbFdZX/c+EE0avLWC5P5cs9X8bYfAFta4Y1BzUGX2iQjKGrjQzrXTrPUTH
	 leoO9yRQfSuaf1tTaSFTBvP/r398JVVvXLegVJV32BGT9weaV7o5X9Idgv9QAENWRig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgiPBMRy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8E606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgiPBMRy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEA51F000C1;
	Tue,  3 Nov 2026 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696074;
	bh=SzRb8gxs5rhfvZRxfyzyGCLFYGZVHtAW1hWtV88plgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JgiPBMRygaKMhjQQ5sIUWpdhswTahTnVPoUp4dVBbgFsCOChLTvsQbtbv3g5/ryDK
	 1HRIqCA/we/T6oV+vQXs4Z3bF76Qs0bWuypbvwgNkXoqbE+8BR1VDQI5yyNLffhRVl
	 7Bm2BQk409cBZwW/V6jwwjXdxL1dp+UVah+HkZD3eGxrov/H7Ix8mWIHpcAbugiS8S
	 VE7Q2kRA3N0YtrjIIJ9+Vr5p7x2zHCp19ZamiYFH8nnG1mw5BkCTNvMz1WW6/Kxo1u
	 VcIvGopqgPm22njcuhXxznBsQ7rN44ZFluIW9Jpes/9pxX5SJNE0a0lRG2SwKl7SwK
	 UNn8+fVcQ929g==
Message-ID: <sashiko-outbox-194895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8390-genio-common: Fix type
 C port mode and connection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103083335.2944847-2-wenst@chromium.org>
References: <20261103083335.2944847-1-wenst@chromium.org>
 <20261103083335.2944847-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:54:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] arm64: dts: mediatek: mt8390-genio: swapped HS and SS USB-C hub =
endpoints
- [Medium] arm64: dts: mediatek: mt8390-genio: host data-role breaks TCPM s=
ink and PDOs
- [Medium] arm64: dts: mediatek: mt8390-genio: partial hub ports graph mark=
s port 1 unused
- [Low] arm64: dts: mediatek: mt8390-genio: hub ports nodes violate ti,usb8=
020b schema
--

commit ef02f781783f3c2d23b3aa255937ed902c67f777
Author: Chen-Yu Tsai <wenst@chromium.org>

arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connect=
ion

This commit changes the ssusb1 controller's operating mode to "host", drops
its usb-role-switch property, updates the Type-C connector's data-role to
"host", and routes the Type-C port data endpoints through the onboard USB
hub nodes under xhci1.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f33..821dbf9d3fc5d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -512,7 +512,7 @@ rt1715@4e {
>  		connector {
>  			compatible =3D "usb-c-connector";
>  			label =3D "USB-C";
> -			data-role =3D "dual";
> +			data-role =3D "host";
>  			op-sink-microwatt =3D <10000000>;
>  			power-role =3D "dual";
>  			try-power-role  =3D "sink";

[Severity: Medium]
When data-role is changed to "host" (setting port->typec_caps.data to
TYPEC_PORT_DFP) while power-role =3D "dual", try-power-role =3D "sink", and
PDO_FIXED_DATA_SWAP in sink-pdos and source-pdos remain set, won't this
cause a data role mismatch and PD capability inconsistency when attaching to
a USB PD power source?

When the port attaches as a Sink in tcpm_snk_attach(), it initializes the
roles using tcpm_data_role_for_sink():

drivers/usb/typec/tcpm/tcpm.c:
#define tcpm_data_role_for_sink(port) \
	((port)->typec_caps.data =3D=3D TYPEC_PORT_DFP ? \
	TYPEC_HOST : TYPEC_DEVICE)

Because port->typec_caps.data is TYPEC_PORT_DFP, tcpm_snk_attach() ->
tcpm_set_roles() sets port->data_role =3D TYPEC_HOST and programs the TCPC
message header data role to DFP while attached as a Sink. When the remote PD
Source (which also starts as DFP/host per the USB PD specification) sends
its initial Source_Capabilities message with PD_HEADER_DATA_ROLE =3D 1,
tcpm_pd_rx_handler() sees both sides as DFP:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_rx_handler() {
	...
		if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) =3D=3D
		    (port->data_role =3D=3D TYPEC_HOST) && rx_sop_type =3D=3D TCPC_TX_SOP=
) {
			tcpm_log(port,
				 "Data role mismatch, initiating error recovery");
			tcpm_set_state(port, ERROR_RECOVERY, 0);
	...
}

In addition, sink-pdos and source-pdos in this connector node still include
PDO_FIXED_DATA_SWAP, which advertises DR_Swap support to the partner via
tcpm_pd_send_sink_caps() / tcpm_pd_send_source_caps() and exposes
dual_role_data =3D 1 in sysfs, even though tcpm_pd_ctrl_request() rejects
incoming PD_CTRL_DR_SWAP requests when port->typec_caps.data !=3D
TYPEC_PORT_DRD.

[ ... ]

> @@ -1555,6 +1548,19 @@ hub_2_0: hub@1 {
>  		peer-hub =3D <&hub_3_0>;
>  		reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
>  		vdd-supply =3D <&usb_hub_fixed_3v3>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				usb_2_0_p2: endpoint {
> +					remote-endpoint =3D <&typec_con_hs>;
> +				};
> +			};
> +		};
>  	};
> =20
>  	hub_3_0: hub@2 {
> @@ -1563,11 +1569,18 @@ hub_3_0: hub@2 {
>  		peer-hub =3D <&hub_2_0>;
>  		reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
>  		vdd-supply =3D <&usb_hub_fixed_3v3>;
> -	};
> =20
> -	port {
> -		xhci_ss_ep: endpoint {
> -			remote-endpoint =3D <&typec_con_ss>;
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				usb_3_0_p2: endpoint {
> +					remote-endpoint =3D <&typec_con_ss>;
> +				};
> +			};
>  		};
>  	};
>  };

[Severity: Medium]
Are the High-Speed and SuperSpeed endpoints connected to the wrong hubs her=
e?

In drivers/usb/misc/onboard_usb_dev.c (onboard_dev_id_table) and
Documentation/devicetree/bindings/usb/ti,usb8020b.yaml, TI USB8020B product
ID 0x8025 (compatible "usb451,8025") is the USB 3.0 SuperSpeed hub and
product ID 0x8027 (compatible "usb451,8027") is the USB 2.0 High-Speed hub:

drivers/usb/misc/onboard_usb_dev.c:
	{ USB_DEVICE(VENDOR_ID_TI, 0x8025) }, /* TI USB8020B 3.0 HUB */
	{ USB_DEVICE(VENDOR_ID_TI, 0x8027) }, /* TI USB8020B 2.0 HUB */

In mt8390-genio-common.dtsi, hub@1 has compatible =3D "usb451,8025" (the 3.0
hub) and hub@2 has compatible =3D "usb451,8027" (the 2.0 hub), even though
their pre-existing DT labels hub_2_0 and hub_3_0 are reversed. Placing
usb_2_0_p2 (linked to typec_con_hs, port@0) under hub@1 and usb_3_0_p2
(linked to typec_con_ss, port@1) under hub@2 connects the High-Speed Type-C
endpoint to the SuperSpeed hub and the SuperSpeed Type-C endpoint to the
High-Speed hub.

[Severity: Medium]
Does adding a ports node containing only port@2 to hub@1 and hub@2 cause
downstream port 1 of the TI USB8020B hub to be marked as USB_PORT_NOT_USED
and non-removable?

When a USB hub is enumerated, usb_hub_create_port_device() calls
usb_of_get_connect_type() for each downstream port:

drivers/usb/core/of.c:usb_of_get_connect_type() {
	...
	/* Only set connect_type if binding has ports/hardwired devices. */
	if (!usb_of_has_devices_or_graph(hub))
		return USB_PORT_CONNECT_TYPE_UNKNOWN;

	/* Assume port is unused if there's a graph or a child node. */
	connect_type =3D USB_PORT_NOT_USED;
	...
}

Previously, hub@1 and hub@2 had no child nodes or OF graph, so all
downstream ports defaulted to USB_PORT_CONNECT_TYPE_UNKNOWN. Once ports is
added with only port@2 defined, usb_of_has_devices_or_graph(hub) returns
true and downstream port 1 (which has neither a port@1 graph node nor a
child device node) returns USB_PORT_NOT_USED, causing
set_usb_port_removable() in drivers/usb/core/hub.c to mark any device plugg=
ed
into downstream port 1 as DEVICE_FIXED.

[Severity: Low]
Also, does adding ports child nodes to hub@1 ("usb451,8025") and hub@2
("usb451,8027") fail dtbs_check against
Documentation/devicetree/bindings/usb/ti,usb8020b.yaml?

Unlike ti,usb8041.yaml (which references usb-hub.yaml# and uses
unevaluatedProperties: false), ti,usb8020b.yaml only references
usb-device.yaml# and sets additionalProperties: false without defining a
ports property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103083335.2944=
847-1-wenst@chromium.org?part=3D1

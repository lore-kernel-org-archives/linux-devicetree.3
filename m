Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704691;
	b=IAFquvckJUyzkKyRYity6aWWD3iUR5MQLhEztf5owD/Lq/oo+jobv6eCcdSc4etctdkh
	 ArPM7G2on7ynrDeBEYJkHdYy46sW7/n1KYmUxSU5YI6n+MDYnXhoF1GbbdwywjiFebeRM
	 Oc4b+MgjZk9H437VRMltKtkxQse0hVmuD8csJ37KYxQigK7ia6t6S3Np0ZK2FCUY4dP48
	 yeNiPOVDlFN21sztVHImWgJzYXToHtX2TAJHn6a/KoaLT2ILnc1j822HKi7Mg/Og75HdP
	 f8h2ngbX3n4Ax8HytcB38KBmKFDoRpR125GqH2e8mMZLPVTrzBz8YXFGqxWmjEucLrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
	b=IgW7ogEB4JEel0oiKn6R9oMjtflbIccfZxBPUSo0yX3ASiRa/NJQrmgBmBwHf7N0AGcR
	 9pWSslz7uA9U7A6YrAHUI19dNFK4Iy7gBoh937ObUkExTHF+l4t5cbNK3gXECIVAZIH9P
	 3eubDOPXpH3QSlAPVzgSaNYsc5QivsOib4GQXWmDqlmQWKZLe8/nv5M+yibS8Q9w4ds62
	 sbZy0Za+0w0/YRaXivSBNPWSYP/xbmVtmCbCeEAXTUqW1DgNl4EaiTjzyJo1PyVznZyp5
	 /m2oUxacCINoOQs8mBpu0OVUvrqPTxw793rtv8p5FEkJ7Ki8hBZn5CNp6qDnFRYUBGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QDEA09iH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E4606FAD3
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0E4606FAD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QDEA09iH
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ae8607e8afso29612117b3.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704689; cv=none;
        d=google.com; s=arc-20260327;
        b=ByLxB5o2RGq59IBgy/pbfkO92A9XvWa90ZmiaRiTk7w6Ta1ycJ7LZzVbbKMG3KtbJz
         srOEN85PmevhdJD6VEsH6BPppBxLnVjhFYZwNcLijg8NnxkIGsoxyQa+G+R8s2+bPfPb
         Gz9XUDjDj/gqHG+i+p6q23LBm1hhaT52jFiQ22EuiJxaqAvwZlIdiyT0fQpoxWshe3rM
         deFauqJdNDyMLh9/+2YRKNrDS3WjjbvmhAjZw35Ju+D9xBpZxkYeVJQD9RtFVocSVSCO
         iKCFbx9hrCeZX0LyOcWIsBMzfNrX2kLyvXkFmCrMKsIuiOMkzBQ0ayoLfdPnFfHm9lvK
         toyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=mh/28phIRWFoqFEJxPbiD9NaxJrFNrAnz0Y2iS9zDIEzPhLsrH88F2CXwKnehYH5i9
         m8rjFk/G2f2n6PU/PEgmzRDdLz9Ckh3G46XOntoSm7/F/0Du7f1UgpppVgtEqPHr0kmH
         oJExR1NIMQR5uyY4jZIWBIOxkDzylEPYhDBjqfR5M1XkMynPw/Jp8a/WTC+Q+yV0ul3c
         lFMAm+Swr6TwIqiFylqzUwkSTm6To99BdT/XBj0+ZKBJogyjcdtLNZpGORrTAfHYEemv
         hG4pdSA8oezLErok6hkdRkCy+aZKhtlawj/O2vq0MMj//zUx+/+0cw1zs3LQUl8yjbRI
         xcWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793704689; x=1794309489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
        b=QDEA09iHgChxaq4s4z/Sa2X96e9pBQllNmvXMemLieo1z4biRLgQz/T7BCmc7GEJve
         bhbOSS6jCNdeXgKEfCbjadEnuHaVBNl7pNV35j8OJ43Ps6VA+1D6+nt1uuCPLpQ9nk6E
         WnI+XhTk/IypptwXopUFx98SH50VW10Ox8n9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704689; x=1794309489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
        b=IwyvV6+Xm78hh+PJPMj7QZlhjMphJl3Q1fyVUmJClqHMNIPoXrJ61MnPG4mDj9md3F
         wjf8QEpr53wFe0sJ4kJ829RkDBFLFtrHeh10JUMMy/9j9zuUDiwOeIZbbaS56hlw2BbZ
         Z+ZKZH3uRAf7Rj6fTWmok6DXoDB3ZN+syFhkmWdxacQKxxzSwPLhz6zhM9Sz8e5mu3VS
         e8ND6UfZK1OoU3FkO1yr0Mz6h4UCZ8mXYQ6rj9cAXTyMvqgXtQiTNlPOV1UryeJsqSd8
         N4MNfc3FKWPailyWb8svRtqyh0bes4MAkmfD+92JzbgdKfQYOSt15FU6Uu1CkklXbyKD
         vYww==
X-Gm-Message-State: APuU4Z8cKbHr1+fIb0ggR/XXp5uJQBkzlluwv6wtDAwtY3Q9XJ8sTs+t
	FqFQe10+VP9NQ1rwj+EQeUtt/NcgKd8lAdQYOd4VtKV9M+Qh9Dxljk5pwE/f+goQzpwKi450bJ3
	IiOMKnRhvRPgC/x9+uORRRLJlcgqUhKpLWPoxfY8Mejut5IS/DkOaiA==
X-Gm-Gg: AYBFou1rgtGLhbDYPTqI7u2wiq7GKr+OHZswPV8xFbxJVF9g5jLdZGq9XKwykKAUf2f
	p5Pgir0uJBMDmpZ4HKu/em9ZhYDMA6i0CigEkQAKbUcLXH7MgzcQiud0Meqt9VZxribV5KwYYTk
	xm1JZ3LQ8xRDTn9PC6LmNkAqwhnN3Bq3QW/VhlFf4J+ImsPmSavIQ4CW1KcNEoHJp/rZne7uPU6
	DxhUrC28lYEqBy5FAhgaKRWeqfIYgZ7hd0Bq4aAAGSDRJew/0qg0bHMhdcFFD0FQkWi5nP7Xg4C
	MS+1Y8qN6eC9WtR8o6mkOrgytK/rF70ldOApzIs5qFhCruFTYmFk2sF48HVSzqV2LMrlFRna6Da
	lWqPCBmFH+tMh0OuLyHG567FnnOzOTA5uK5Z0D0H1mV415q5VjiOIY7CrCTR9mAgW2Xo=
X-Received: by 2002:a05:690e:4399:b0:679:a03c:3cef with SMTP id
 956f58d0204a3-67ba504fe78mr5463048d50.102.1793704688774; Tue, 03 Nov 2026
 03:18:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103083335.2944847-1-wenst@chromium.org> <20261103083335.2944847-2-wenst@chromium.org>
 <sashiko-outbox-194895@kernel.org>
In-Reply-To: <sashiko-outbox-194895@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 3 Nov 2026 19:17:57 +0800
X-Gm-Features: AclHuK8VonHN09LTCcS6FUt195JMCTKb0pPmw_Dq8fBSu-WL_nXW9IV_jyyzdms
Message-ID: <CAGXv+5GPGs=GOyEsdG9xqHTACSboizTBxg+J0q+tdVsW46Aidw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8390-genio-common: Fix type C
 port mode and connection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 4:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [Medium] arm64: dts: mediatek: mt8390-genio: swapped HS and SS USB-C hu=
b endpoints
> - [Medium] arm64: dts: mediatek: mt8390-genio: host data-role breaks TCPM=
 sink and PDOs
> - [Medium] arm64: dts: mediatek: mt8390-genio: partial hub ports graph ma=
rks port 1 unused
> - [Low] arm64: dts: mediatek: mt8390-genio: hub ports nodes violate ti,us=
b8020b schema
> --
>
> commit ef02f781783f3c2d23b3aa255937ed902c67f777
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and conne=
ction
>
> This commit changes the ssusb1 controller's operating mode to "host", dro=
ps
> its usb-role-switch property, updates the Type-C connector's data-role to
> "host", and routes the Type-C port data endpoints through the onboard USB
> hub nodes under xhci1.
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/ar=
ch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > index 669eaec662f33..821dbf9d3fc5d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > @@ -512,7 +512,7 @@ rt1715@4e {
> >               connector {
> >                       compatible =3D "usb-c-connector";
> >                       label =3D "USB-C";
> > -                     data-role =3D "dual";
> > +                     data-role =3D "host";
> >                       op-sink-microwatt =3D <10000000>;
> >                       power-role =3D "dual";
> >                       try-power-role  =3D "sink";
>
> [Severity: Medium]
> When data-role is changed to "host" (setting port->typec_caps.data to
> TYPEC_PORT_DFP) while power-role =3D "dual", try-power-role =3D "sink", a=
nd
> PDO_FIXED_DATA_SWAP in sink-pdos and source-pdos remain set, won't this
> cause a data role mismatch and PD capability inconsistency when attaching=
 to
> a USB PD power source?

Rechecked the public documents [1], and it only shows this port supplying
power at 5V/1A. This port is marked as "USB 3.1 PD" on the board, and as
"USB-C 3.1 Host & DisplayPort". The sink / charging type C port is a
different port altogether, marked as "USB-C (charger)".

So the PD description for this port is completely wrong.

[1] https://genio.mediatek.com/doc/iot-yocto/latest/hw/g700-evk.html

> When the port attaches as a Sink in tcpm_snk_attach(), it initializes the
> roles using tcpm_data_role_for_sink():
>
> drivers/usb/typec/tcpm/tcpm.c:
> #define tcpm_data_role_for_sink(port) \
>         ((port)->typec_caps.data =3D=3D TYPEC_PORT_DFP ? \
>         TYPEC_HOST : TYPEC_DEVICE)
>
> Because port->typec_caps.data is TYPEC_PORT_DFP, tcpm_snk_attach() ->
> tcpm_set_roles() sets port->data_role =3D TYPEC_HOST and programs the TCP=
C
> message header data role to DFP while attached as a Sink. When the remote=
 PD
> Source (which also starts as DFP/host per the USB PD specification) sends
> its initial Source_Capabilities message with PD_HEADER_DATA_ROLE =3D 1,
> tcpm_pd_rx_handler() sees both sides as DFP:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_rx_handler() {
>         ...
>                 if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) =
=3D=3D
>                     (port->data_role =3D=3D TYPEC_HOST) && rx_sop_type =
=3D=3D TCPC_TX_SOP) {
>                         tcpm_log(port,
>                                  "Data role mismatch, initiating error re=
covery");
>                         tcpm_set_state(port, ERROR_RECOVERY, 0);
>         ...
> }
>
> In addition, sink-pdos and source-pdos in this connector node still inclu=
de
> PDO_FIXED_DATA_SWAP, which advertises DR_Swap support to the partner via
> tcpm_pd_send_sink_caps() / tcpm_pd_send_source_caps() and exposes
> dual_role_data =3D 1 in sysfs, even though tcpm_pd_ctrl_request() rejects
> incoming PD_CTRL_DR_SWAP requests when port->typec_caps.data !=3D
> TYPEC_PORT_DRD.
>
> [ ... ]
>
> > @@ -1555,6 +1548,19 @@ hub_2_0: hub@1 {
> >               peer-hub =3D <&hub_3_0>;
> >               reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> >               vdd-supply =3D <&usb_hub_fixed_3v3>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_2_0_p2: endpoint {
> > +                                     remote-endpoint =3D <&typec_con_h=
s>;
> > +                             };
> > +                     };
> > +             };
> >       };
> >
> >       hub_3_0: hub@2 {
> > @@ -1563,11 +1569,18 @@ hub_3_0: hub@2 {
> >               peer-hub =3D <&hub_2_0>;
> >               reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> >               vdd-supply =3D <&usb_hub_fixed_3v3>;
> > -     };
> >
> > -     port {
> > -             xhci_ss_ep: endpoint {
> > -                     remote-endpoint =3D <&typec_con_ss>;
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_3_0_p2: endpoint {
> > +                                     remote-endpoint =3D <&typec_con_s=
s>;
> > +                             };
> > +                     };
> >               };
> >       };
> >  };
>
> [Severity: Medium]
> Are the High-Speed and SuperSpeed endpoints connected to the wrong hubs h=
ere?
>
> In drivers/usb/misc/onboard_usb_dev.c (onboard_dev_id_table) and
> Documentation/devicetree/bindings/usb/ti,usb8020b.yaml, TI USB8020B produ=
ct
> ID 0x8025 (compatible "usb451,8025") is the USB 3.0 SuperSpeed hub and
> product ID 0x8027 (compatible "usb451,8027") is the USB 2.0 High-Speed hu=
b:
>
> drivers/usb/misc/onboard_usb_dev.c:
>         { USB_DEVICE(VENDOR_ID_TI, 0x8025) }, /* TI USB8020B 3.0 HUB */
>         { USB_DEVICE(VENDOR_ID_TI, 0x8027) }, /* TI USB8020B 2.0 HUB */
>
> In mt8390-genio-common.dtsi, hub@1 has compatible =3D "usb451,8025" (the =
3.0
> hub) and hub@2 has compatible =3D "usb451,8027" (the 2.0 hub), even thoug=
h
> their pre-existing DT labels hub_2_0 and hub_3_0 are reversed. Placing
> usb_2_0_p2 (linked to typec_con_hs, port@0) under hub@1 and usb_3_0_p2
> (linked to typec_con_ss, port@1) under hub@2 connects the High-Speed Type=
-C
> endpoint to the SuperSpeed hub and the SuperSpeed Type-C endpoint to the
> High-Speed hub.

Yeah, they are definitely swapped. 0x8025 is the default PID for USB 3.0
while the default PID for USB 2.0 is the 3.0 one XOR 0x2.

> [Severity: Medium]
> Does adding a ports node containing only port@2 to hub@1 and hub@2 cause
> downstream port 1 of the TI USB8020B hub to be marked as USB_PORT_NOT_USE=
D
> and non-removable?
>
> When a USB hub is enumerated, usb_hub_create_port_device() calls
> usb_of_get_connect_type() for each downstream port:
>
> drivers/usb/core/of.c:usb_of_get_connect_type() {
>         ...
>         /* Only set connect_type if binding has ports/hardwired devices. =
*/
>         if (!usb_of_has_devices_or_graph(hub))
>                 return USB_PORT_CONNECT_TYPE_UNKNOWN;
>
>         /* Assume port is unused if there's a graph or a child node. */
>         connect_type =3D USB_PORT_NOT_USED;
>         ...
> }
>
> Previously, hub@1 and hub@2 had no child nodes or OF graph, so all
> downstream ports defaulted to USB_PORT_CONNECT_TYPE_UNKNOWN. Once ports i=
s
> added with only port@2 defined, usb_of_has_devices_or_graph(hub) returns
> true and downstream port 1 (which has neither a port@1 graph node nor a
> child device node) returns USB_PORT_NOT_USED, causing
> set_usb_port_removable() in drivers/usb/core/hub.c to mark any device plu=
gged
> into downstream port 1 as DEVICE_FIXED.

The other port seems to be tied to a M.2 B-key slot on the reverse side
of the board. Currently, we still lack proper M.2 slot USB integration,
so this is going to be a slight problem.

> [Severity: Low]
> Also, does adding ports child nodes to hub@1 ("usb451,8025") and hub@2
> ("usb451,8027") fail dtbs_check against
> Documentation/devicetree/bindings/usb/ti,usb8020b.yaml?
>
> Unlike ti,usb8041.yaml (which references usb-hub.yaml# and uses
> unevaluatedProperties: false), ti,usb8020b.yaml only references
> usb-device.yaml# and sets additionalProperties: false without defining a
> ports property.

I sent a separate patch to address this by merging ti,usb8020b into
ti,usb8041.


The AI review is certainly digging up more problems with the DT.

ChenYu

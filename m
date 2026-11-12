Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470925;
	b=nubWRM2QQLiXP42bBPHaDxeTt1SqNSHh/LjqA0KaOgq+l5bfLVB3NTwMNxd21IyX+Oez
	 Yjgy0nezgtnH6/wpfLpEpWa+pPswk+nM0GeD+gT/NWA+k3G+Y0g8kd3EMX467A6tRRd0u
	 Ud1QLnh1ma4WwJjT96Akx+8Vn5B4M7X6Atx6bXZMFBi38ZD98xxFMUXNFqtVBpmfgJl5i
	 DVHZsr05+3phLQiOjcjoxR2woRTS5OMMZZm6yrULu4Z+7ap7dL4F4uQH2v/THciu8Xb2J
	 Tad+Ej9LNZ6ijMWtcOp8j2GutmrJs94KsNLSZ95LrkkResU6aRYcE6hJIsEop9w898A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470925;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f/K/dT4G7j/2V0oqueVsADMWh93CbLx6C63d9vDA5x8=;
	b=VOBohMs0MP5FhhjAsX9cOyuuNwyHMnb+01BmRYQURsQ6MzNB5K5ZuBUBt/sEVrXe/ifO
	 SKNBrT0pW0+q39m9YrKMz9WzshnHUGWpmWwZTRbJANuzSg2S6hJZ551vUzUHp9vm20GCT
	 a9FEFiJwbHrqGspNr/4okgfBg2BmYygWRjvaEO5jPc3P++fYL4vvFme4gEKDqSKxizP3g
	 O7sphcZae1FjMZLuB/YF9WuHAWkQB+N4NKoTiv1/Scd8fBAGYZsZblVrulW14mPxqxi5Y
	 93PnzElHDw5Mp1BrM1pKLlu6AjMTjf+kicBYukckU+sYNldUs2SmwBotQ58cyKYPDBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dov5eEhJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44092606A32E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dov5eEhJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7F41F00A05
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794470924;
	bh=f/K/dT4G7j/2V0oqueVsADMWh93CbLx6C63d9vDA5x8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Dov5eEhJPw9J1UHAeJgAmdh8myoy8L7sxELnUxlL/7fc3MfsnL3rY+pt0+8hcD/OX
	 NfKVKmZHCSPoyWy7mkKoLnoIxDvrxRcNuwJaJ9nUegaE+61xlN8qMxTFSaSlBvNVnM
	 gC8nuPC892qUwVuaHk/xtalK+nZ69SYCg9ic+yG4lnTAG2TEzmO6zRtZcNRgERsSEa
	 f4s1T3y4PWKuTZHs3r2JvaQZMdIEGarXDsPEIPQ2w+5RPQzKNCKE3W65gGTBhc8RhV
	 pZcgN21CCgADnpJFba1R4Eg+I1DPL3CxzqpVrpcroyk8Fpo0RI9VkvMLVOWn6sVHZh
	 DApu0rN2toQBg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so1169991fa.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:08:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE524QOR9wGg2T2cyzlOwm0E5vW6IqqqcWrTNhdycLEC4XwgV1ddDF7X1KH75C79NaQn4RMPNXkyp72@vger.kernel.org
X-Gm-Message-State: APuU4Z/1yG8d008RXXZ61mPDXGf+bpNfoto0RoejNfU1vQnThGZdigzu
	Ix9+C0/yqKKctdH7+xaTpekmczod+H4xtmm75agG8qzkNLE+6VRYSYNzPB0R6ic/QJcmFTQOqXT
	AnSbrVYk1ULcnUYF2fZafYeD+32nmOkU=
X-Received: by 2002:a05:651c:31cb:b0:3ac:ff0a:9d9f with SMTP id
 38308e7fff4ca-3ae1266bd28mr10702011fa.5.1794470923286; Thu, 12 Nov 2026
 00:08:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
 <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
In-Reply-To: <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 17:08:31 +0900
X-Gmail-Original-Message-ID: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
X-Gm-Features: AclHuK-4Nt4Ya-T8NosoJJyqrIsgDGmHMB4Vbzc5kPzl1tQ_x9NWcs04d9vsDrI
Message-ID: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:00=E2=80=AFPM Arun Iyengar <aiyengar1990@gmail.co=
m> wrote:
>
> Hi Chen-Yu,
>
> On Wed, Nov 11, 2026 at 02:35 UTC, Chen-Yu Tsai wrote:
> > Would this patch covering all HCDs be better?
> >
> > https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org=
/
> >
> > Also see Rob's comment about covering the port numbers.
>
> Yes, yours is better: it covers every host controller, and
> generic-ehci.yaml gets it through usb-hcd.yaml. Rob's point about the
> port numbers applies to my patch too.
>
> v2 drops this patch and builds on your patch 1 instead. Only the
> Orange Pi 5/5B DT patch, which now goes to the Rockchip tree on its
> own, needs it; that DT passes dtbs_check with your patch applied, and
> also with 'reg' limited to 1 and up as Rob suggested.
>
> The v2 cover has one question for you: patch 1 there looks the graph
> ports up by root hub port number, while you have said root hub graph
> ports should use the raw xHCI port number. Which one do you want?

I don't see a v2 yet. So that's patch 2 of v1.

It should definitely use the raw port number, since that is what is
supposed to be used in DT (and what is used in ACPI).

FWIW I'm also pushing a series to wire up USB on M.2 connectors [1].
That also has some code that does OF graph lookup. I still need to
push a v10. And I have a few other patches that fix up port lookup
in other bits of USB OF code.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org=
/

> Thanks,
> Arun
>
> On Tue, Nov 10, 2026 at 6:35=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
> > <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> > >
> > > From: Arun Iyengar <aiyengar1990@gmail.com>
> > >
> > > The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> > > always reach the same host controller. On the Rockchip RK3588, the
> > > SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> > > of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> > > which EHCI root hub port shares a connector with which SuperSpeed por=
t.
> > >
> > > The USB core already reads a hub's OF graph, with one graph port per
> > > downstream port, and uses it for the port connect type. Allow the sam=
e
> > > "ports" node on EHCI controllers, so that a root hub port can be link=
ed
> > > to its usb-connector node.
> > >
> > > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++=
++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml =
b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > index 908b02d9175e..9dcba539d60d 100644
> > > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > @@ -160,6 +160,19 @@ properties:
> > >        - host
> > >        - otg
> > >
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description:
> > > +      The root hub's downstream facing ports, linked to the connecto=
rs they
> > > +      are wired to. Needed when a connector's SuperSpeed lanes go to=
 a
> > > +      different host controller, which then pairs with the root hub =
port
> > > +      through the connector.
> > > +
> > > +    patternProperties:
> > > +      "^port@[1-9a-f][0-9a-f]*$":
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Root hub port, numbered from 1.
> > > +
> >
> > Would this patch covering all HCDs be better?
> >
> > https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org=
/
> >
> > Also see Rob's comment about covering the port numbers.
> >
> > ChenYu
> >
> > >  required:
> > >    - compatible
> > >    - reg
> > >
> > > --
> > > 2.55.0
> > >
> > >
> > >

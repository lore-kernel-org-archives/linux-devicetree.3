Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697734;
	b=vm7zE0nrHntzEC+kmcsoyMg64SYw1ZXBPJeyuSCGbfzUohl1of/EefT6a2qZ8jMn6vnT
	 YbuC7t/iQcRcL0YUpApxuJonvmH7xVmNuk/bfrr3G2yAvGHHA9GX+plub4HFjHcu5NbAh
	 +H1doeMTPoHFR2ArT8v7Ec9PxlvxXKJR+XeQ8aFBCPddFjPt0ruPF/FhBrDI2bXG1GHSP
	 RuiSmb1XzqRTC60FojIc/HNWSZvhiQNyJ1Td5WqFtQ/FCE1w1wGCYQjHSZZ/QMlcNCPpv
	 rHL6FjkX91KPJz2yfMtrvbgsua2EMer4/bHdi4k/zedmWLsM5IBkOi+OfPvvyBXQGkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697734;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
	b=czXKOO2P3GbtuW3DmjDb39M8T/P0WrhJaSV7u/DrGy43+thlNDgylR6xw4e86cKsryil
	 0c8U+Ea+xzL95s8N9eKicJnfqwD9kmlpeyin4NVCUsbRwpi1nnEC0j000GakWgXocwK1K
	 Aq8lgipsXG28oUjfiW42Kp5y9Bdd5FeFZhBXKqitQC43tYEDpP+UFu74UjrZ3WZj7hKxG
	 nwWR7mpmE3vg0WdOeJmLeBUOD33+zAMU52bBOQDdBhr4Nfn0ONIYkTkrPpYYuR72f1bPg
	 +gizvqaePBQA5wBRSnfv7LKFj7yh12uIy8ml1DlFvGqS9K8V+CdSL7YF12E7g1b4hPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD80606A334
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD80606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-94a08e4f95eso135742985a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697732; x=1796302532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
        b=fCP6ZV8zOchG3dej5ePZJ59U6i6AvCseRhVB17xQ1HB07ekK56ckD1kpopF7BH4waS
         egANnM2xcph6YungOGS60XDNpAjTpcIlbFDScZPaLMuczRFKAc4g3ySfr9xOC62Nameb
         CsdrQMISiC4jXsxwKo4klcLCDpPOFdunPbyk6KDVlZgxg9yPuXIfFC0LeeZYmj8k/z4B
         PYviiLy6t4njM2r5LgOBD951g6lAkXGXfdIQ/yIf6vRhCJGSoy+PTntzGeqxISE5s3Yw
         E9/TtR7IIWbe+N220+ntWwSRDUBYmLygfti8+iie5O6uqrwH39GkcdN145h0kEOq66Ue
         uBoQ==
X-Forwarded-Encrypted: i=1; AL+hErEEXcV743QtXTiTG44kDalaat6JAGbHHnlyM1HMzn+b7aIJ24YL7e3shXUrUblU8OQrnQnEbcnhlofF@vger.kernel.org
X-Gm-Message-State: APuU4Z+oJsd9/Jup5KbXdahCLNKTaftRKNhkxOEhHIlettfXApySh+2w
	Ga1ylUI6v5PmHti5p6tangkAnTUy8/OWeOVImZ0OfraimH7m99ULqU2o8p/teqi3Xpo=
X-Gm-Gg: AZFdTZcuaSOuB3EIXjGHBHXRG3xojo06DfO9weG64r0wTIekkIICCkHqtTHggSOhXum
	70mMMQLqaMFLNAG2d0/raZZWcFBLC2Rml9k0wozLjO0Zlo6QfSG5wyOjnNAS4DGG1rW6d10IY/P
	qkg57mFSF6S0ew7ivnXeuzAqGx+7KFQP4A9sPrCbTqbXMsnNDEk3B11svxhW9+G8FWR3JkIWltM
	+rBUtFE2ou9EBtyeS448EXAC2TvR5s4nxGH/2a/+Xf65EqBmEQ962tIEMtAcaDE7250PxQOCeiG
	z2EaymPEjsgx1Ju8Y8KbP74S4PGylsPMcd+J8v19hBt9fZIE96qEghVSKrNXzoIvXhrUZ0tZaii
	1rBacSLo3XU7iUqYfSWgXvxGhEWFE5lhxMQ2rxoyNtDIoqToe/eVH5UffsfuN529vkWCX7w/zBp
	mXZHmhHO+5VkysZCcn1XoE++dMxcnBIqEKGVol4imD4/A1BOUtgLriohNA5ZNmqkFxSWfhwP2vR
	SpKpbSL2hMTpBA0wjM65QpcWseYgssT7K0LoHaUvf74/gP6q1HuZ9RT3kZ3/f8CmJiWWP0cLXzQ
	wOtqsqx2TIvQ82WmDIUmeKSKsSezSqtCWcUfLtJAMR3lop1GIf1kk1WPKqV1nA9QWxsqiRN/pnd
	RWUH/Sa1G9gdcgF2DQpxs6CAGN55DCfFRtJPGfd//0BqHWnQMYklEudI28g==
X-Received: by 2002:a05:620a:600a:b0:949:698f:8bea with SMTP id af79cd13be357-949ba9e3582mr3754422885a.34.1795697732397;
        Thu, 26 Nov 2026 04:55:32 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm1579248885a.5.2026.11.26.04.55.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:55:32 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949589c1495so613357885a.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFNY+V+24LV7Ne239iZFwxKkZHpk8aZs1SXvnu8wTvOBEtdh65eXV9m0AO/MIjhd7PY+GJmZP9kbtsK@vger.kernel.org
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr79381047b3.42.1795697368796; Thu, 26 Nov 2026
 04:49:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-5-tanure@linux.com> <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <179561837863.3135.7453763060716815613@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:49:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
X-Gm-Features: Aa3M54rVCY5vVqL26ka6o_i4OGggk-NPYkWlLazpuMdrAcDWKkBH6Cp6PaCVWDk
Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: netdev-bot+sashiko@kernel.org
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:53=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit says it enables the Khadas VIM4 ethernet port.
>
> --
>
> arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
>
> This patch enables the T7 ethernet MAC and the MDIO multiplexer on the
> Khadas VIM4. It also describes the RTL8211F RGMII PHY at address 1 on the
> external MDIO bus, with its interrupt on GPIOH_6. With phy-mode =3D
> "rgmii-id", the PHY adds both RGMII delays.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.=
dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > index 0fa83362b4179..7b86ab2579aaa 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>
> [ ... ]
>
> > @@ -256,6 +257,28 @@ xtal: xtal-clk {
> >       };
> >  };
> >
> > +&ethmac {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> > +     pinctrl-names =3D "default";
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&external_phy>;
> > +};
> > +
> > +&eth_phy {
> > +     status =3D "okay";
> > +};
>
> [Severity: Medium]
> Can any driver at this revision bind to the ethmac node this enables?

Yes. c4c851a3325e ("net: stmmac: dwmac-meson8b: add support for the
Amlogic T7"), in net-next since 2026-11-20, matches amlogic,t7-dwmac,
and 18029931478b documents it; the cover letter lists both. Tested on
this board on top of them: the PHY attaches at mdio_mux-0.0:01 and
iperf3 runs at 941/944 Mbit/s.

>
> The node in amlogic-t7.dtsi has:
>
> arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:
>                 ethmac: ethernet@fdc00000 {
>                         compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> The amlogic,t7-dwmac string appears only in amlogic-t7.dtsi. The Amlogic
> glue driver's match table, meson8b_dwmac_match[] in dwmac-meson8b.c, ends
> at g12a:
>
>         {
>                 .compatible =3D "amlogic,meson-g12a-dwmac",
>                 .data =3D &meson_g12a_dwmac_data,
>         },
>         { }
>
> dwmac_generic_match[] in dwmac-generic.c ends at snps,dwmac-4.10a, plus
> snps,dwmac and the snps,dwxgmac entries. Under drivers/, the only place
> that names snps,dwmac-5.10a is stmmac_gmac4_compats[] in
> stmmac_platform.c. That list detects the core version. It is not an
> of_match_table.
>
> If nothing probes ethmac, its mdio0 child bus is never registered. The
> eth_phy mux enabled just above binds through the amlogic,g12a-mdio-mux
> fallback and has mdio-parent-bus =3D <&mdio0>. So mdio_mux_init() would
> defer on every attempt:
>
> drivers/net/mdio/mdio-mux.c:mdio_mux_init() {
>     ...
>                 parent_bus =3D of_mdio_find_bus(parent_bus_node);
>                 if (!parent_bus) {
>                         ret_val =3D -EPROBE_DEFER;
>                         goto err_parent_bus;
>                 }
>     ...
> }
>
> Wouldn't that leave ext_mdio and external_phy unregistered, so that
> phy-handle never resolves?
>
> Also, nothing would program the PRG_ETH glue window, which is the second
> reg region at 0xfe024000. That window holds the RGMII mode select, the
> clkin0/clkin1 TX clock mux and the MAC-side delays.
>
> Nothing would claim the pipeline clock (CLKID_SYS_AMPIPE_ETH) either. The
> previous patch in the series, "arm64: dts: amlogic: t7: add the ethernet
> controller", says this gate is otherwise turned off as unused. It also
> says the port keeps the bootloader's delays unless the controller
> programs them.
>
> amlogic,meson-dwmac.yaml does not document amlogic,t7-dwmac, so
> dtbs_check would report the now-enabled node as undocumented.
>
> Does this patch depend on a separate glue driver and binding series? If
> so, could the commit message name that prerequisite, or could this patch
> be sent together with it?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com

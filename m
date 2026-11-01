Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793563931;
	b=37NZASo41JdoCsCF6I7YS0ipG0pMt711K2dh/i8NKQlee33t+wqw/LtJ7e/4UniENp2h
	 kAmUwIK4MHjfGKHpxCQDJk5AQ7E6fRUDc1bYB0k3VKvJg2H5iv6BcObIeE3oAR2ywkAvn
	 DMjPpblLsD8hRuw+Ff+i6UizfjPZIWjzu3JhfRSUlnZ2jc3oaW4XMZjFC6ffI3flRoCFL
	 87FGArer8vtjz58Nm4PSBaawIjHGFDuoBAqU0/42YO2O8A5D7EcAllGQu/xeOt4+BdE6L
	 4VpL7rAs65VuUU+vy9+xgERMldRbiFCfoHPcXyr1ZEOPl5pfSzk2WjQPWF1KKbaycKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
	b=yYi7txjg/PpED/lCJ4jpo+RfDRChSdBg+VKeb+bONOSCQ4c79RCHj+gHELMJZDTFG/G+
	 3K6c4xQd7grcyvR/E0o7c4bZeJ7XybN/VtDOVqbskjLlHLQ58xXSx+LsfeUUDXhTq6woY
	 RerhdCaIaRZsbND6RcHxr81KBdWSJbE1SESyCG5uTxXF0eYiu2fzTgrPCBIXD1bdOMdVw
	 fXZdw+Kqi92ERgBslrp9iM3C29kYfmw6gqlY93hAmELM/gPFCpmUSybMqttCUmh/g+knB
	 UhaFtRHgU0u1rX3sp58vPhzkZYHL5hzb0+HqsdxWi21rkMfKexMABl3TapT8ptoT9qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOLTTBOH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.74
Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849C606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 20:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E849C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOLTTBOH
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-6acbccc0fa4so1838516a12.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 12:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793563929; cv=none;
        d=google.com; s=arc-20260327;
        b=TFquD4jztwOuSHyV+JHYjabczNKQjUCez0TXPzVDOjF2yGf1IBBTuPIHz8HVXVb/K9
         4JswPCos2F5lalkqzIGkRGPkaRbUDPbdtu4Xe1Rlli5X5As5Csv2CcxybT7Lqq1GhTR8
         v7ReAXFyVcApnG8cHUDtQjN4xOiuZN0wvi4D+iwTiRWoRk3PsdFsJYy2YfcikRsKlnex
         oOJBh7Mn3qMq6X9wnwtZTMTTl7sOvKE5e4Tqn8lJ3VdCzBJUcODnXL/V8QKu6xCxWiGx
         yZVx67w04/YwI0h8/wbgnVxjORiOgOGXni7U8PnFlJKIl/GoLQUNxgqwjrtckNGVpaqD
         pAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        fh=rnGN+vqS7GUC5cHL8EzdFX+uRlmWZ5oec1t4ig+dfzc=;
        b=cqccMEdW682/Qr76ecTKPpwBMN5yGp6hpl7Riq65A5K5V+BQM8sxyHJ9CbOIl+xexj
         79JxmqR1N1r2Sd5x1UNdhU/WTeDWLP/LATcJt/IE185iFyamtiYz+lLGThk4NRI/Zmou
         RloIroV1TmnGz1QPisCZ8SIm4kP/gKWwKvZlfSbFLGTkfH+ahSUgazmO5McF2kjfTpPZ
         adsHkQ5+ypPehl+FDco4gWj+Yqc1uuBqF4JRn9y4tBhmjnyvDy0RjA2hRLtmph0OBg9f
         PwmuFnApeQ69McHMo7Nqea6Lx3ALEJCENEbCVFaype1RwL8QzYzeJTr6G3EzkOG54ksm
         awMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563929; x=1794168729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        b=YOLTTBOHApAKN/AqSUNDP85asCDKPWvrY62AbY5QUnR4bOgBmNQYnlK24wl9UrXM84
         DCZ9o4EcnVZMBJSQZ3WC0XKc21bQysHY4cilSf8JEMA/CzbxRC6PDuerz3owJ5qc5Tpq
         PD+IFIsyfGlLrl+N46djT2S+DseP4Sw51Xn1xDBENzSq+U53meooMqiBI6PL5gykWNEP
         F21g1LQKZx2wT6mqHY2bdCCI4Uisse1Xvq0fmJnCpB432rAMAtwC0pR7YFSqh/9QSsdz
         1upUOrw5CehyT8MmSx5PRrxejFcG4VgoSJ6+Kl2hjhzxBhebpJbtFmqVDUWC+4H3oJlB
         TwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563929; x=1794168729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        b=PdfJeUTFaDENniKpA+dxodGQCkzVkHem7ScDIS4lnSTu448aSm9uclkPCR3SzqhRkM
         9K7fGr3e+eMIq5hUN6cDWCZOtMb4RMoqDmKU20FUjqzEDWnEbxHv1rMhyuVjacV9EQaO
         r7LGgXS6XsiOgy2z94u2aD83HsEOrpivArNdWXdxpcGbkPb6sBMIXzxp4zyY4qvE/NMz
         kizmCooDNhxzf4cTmhTfUk4lKXCC/CCwCm/iGhOvutwIjL+25ctK3GoeLOsUI37T3oRe
         D0uHiWW77tkHYQN6bC/q+CQRrZc8l2GquKeZXPnQlQW3ZdYu/Rdua191PEsilVWFxZ7W
         kmVA==
X-Forwarded-Encrypted: i=1; AKwUvBzEZOh5GEjA9X1KajL4nvHe6MBG4x0GEGQ6KHTtMUdMc4wUxSrZ+cydqkZ3ys82NwqD8E7+5TbcBTNu@vger.kernel.org
X-Gm-Message-State: AFq9FYIwRqaqeco2vvKQBM2mshQlx2AJs4xVkyfQnlyFh2AcxRnmFwJt
	1YsK6NGAb+DzERXh5JdhGqjAaEFXBNVDhIpSQSfyQdsxzREnAQeCTvU9VDWYeNEqXSUKSZss85a
	/Th/mNrG2gUbRCrvRde44BxaqeNGkNXv4EldEHrg=
X-Gm-Gg: AYBFou1vH3ot4+mGdpkMixlMoNTziTMG5Geno17rUU151SLzpcR+lQ8Zlg9DlU2eSSk
	FBsPpNCTiw5ugnF0p16jO3P57/qkqcs0h4UYsJzlX3ZZkVkz0Ba3MAbgrA2sm5dm8toKNQvsZ93
	w/To0sG8RgSsM1PrEN8gf9CJTUR2vh4KkTKJcIZ91osjyyLEj3MJ/Org6KmntcJzlBxQM8Qy4ZS
	Eyqm0Nyy4YKAQPKoioD1UPT+n7hjS+WiKmMyytn+5dGA1aP6JIstWkJJ2hSyjqF0HskDj9dUDnx
	UwjFx1yKyqLY+CcmPKysYwHbp0ab2hbIOWbFxw8GgF6MuDqc0MK+ZimasKUsUiNY68RXDRBxZok
	J/p5xpJrOJJR04jfuSwBjY12jcZPgURkicO7+MNE5
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id
 a640c23a62f3a-c4ca7acfb41mr639189266b.44.1793563928992; Sun, 01 Nov 2026
 12:12:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023053548.1595033-1-coiaprant@gmail.com> <20261023053548.1595033-2-coiaprant@gmail.com>
 <2977688.AiC22s8V5E@phil>
In-Reply-To: <2977688.AiC22s8V5E@phil>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 2 Nov 2026 04:11:56 +0800
X-Gm-Features: AclHuK9JsP_sappSiOI-OzoOwsqicY7ddXohMyF8cGA-5NNfJ9GwpFb4-3V7qU0
Message-ID: <CALj3r0g5twZNEiO5b1hHpxy3kAVBxLZNt55E2dxSSeZ5GgXisA@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B411=E6=9C=881=E6=97=
=A5=E5=91=A8=E6=97=A5 22:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> Am Freitag, 23. Oktober 2026, 07:35:46 Mitteleurop=C3=A4ische Normalzeit =
schrieb Coia Prant:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> > the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> > interfaces via its four MII ports.  Add the XPCS device node to the
> > SoC device tree.
> >
> > The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> > requires the CSR clock (PCLK_XPCS) for register access and the EEE
> > clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> > PD_PIPE power domain must be enabled before any register access.
> >
> > Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
> > labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
> > 125 MHz reference clock for the GMACs when operating with XPCS.  Their
> > clock-output-names match the CRU mux parent names in clk-rk3568.c, so
> > boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
> > assigned-clock-parents.
> >
> > The XPCS node is disabled by default and must be enabled at the board
> > level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
> > are always present and do not have a status property, as they are
> > static clock sources.
> >
> > The XPCS node requires a reference to the appropriate Naneng Combo PHY
> > via the phys property.  dtbs_check only validates required properties
> > for enabled nodes, so the SoC dtsi does not provide phys: boards that
> > enable the XPCS must supply it, since the SerDes link is a board-level
> > design choice (combphy1 on some boards, combphy2 on others).
> >
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..20a72785adbc2 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > @@ -8,6 +8,20 @@
> >  / {
> >       compatible =3D "rockchip,rk3568";
> >
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
>
> these clocks don't belong here.
>
> When you place these nodes in the main, they seem to come out of
> thin air, while that might be true for some boards, that they
> have dedicated oscillators for that, this will likely not be true
> for all.
>
> So these should be defined in the board dts, to match the actual
> hardware.
>
>
> Heiko
>

Hi Heiko,

Okay, these are board-level clock sources, not something the SoC
provides. Moving both fixed-clock nodes to the Photonicat DTS and
leaving only the xpcs node in rk3568.dtsi.

I'll respin.

Coia

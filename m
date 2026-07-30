Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66222410D0F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411553; cv=pass; b=T5caTsIxpFUWbLNUZ4+K0uhXrPVOM/yIon1n9WPRHmQp949W1Of0mQjG9KkZ4XfdVJrE4/lbcrPHVXx+FVEHmE8w/N3w5QA/wlrq0lxATmg6288Le5HuXGuvHjSkQ6QnnYK/4mHlomZGBIPweVwL6vCKI3BN+pZCuJI8yRfD8XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411553; c=relaxed/simple;
	bh=ME/is5f2x3bVVRap9DaBRmHa3BSV8SR739rjkJab5+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OucdcKWDCRpw2nK3tHVHsf/O7IsyZ3c2pY9pVU5VvejMrAtb/uVOa3rz85pYwEl/SlpP2alI2cex/gjCDqxtT9MsnzqTKdXNoE2k72B0yX3RE0RqFmCrZ2c17N7bQ2sqNhOrohD5+65q9tFcWtH1xk06JFWWM1e+0CiUM2GZAJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJfnhqQJ; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJfnhqQJ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81e6f2ee60bso9857597b3.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785411551; cv=none;
        d=google.com; s=arc-20260327;
        b=UdSxiLZvvFDHbk/Lyd6smeUu7CQbEv5CQ6S+07jjmMgyHoqpp1yQipa1C4Ik38zMSl
         YQfcl9IkdMCwpSTIDzDTqOMki7z2gYARCHZ0VZUXVbMnUs4WjGTcpc90OBzPal7qNTmd
         6alAwZafrYaTMagEaI+CqSNV3bpzZrrH0P3xFcUmvEQIv9NKiSXY1Hi9iqq8f1sbax0b
         5BdoZH1ROhyJOQArkJNAu/kzTK0l5O+0qJN3h0f4IDv4xEB8cBpduWbIS4rokg3v6wXC
         sbPciCMpzVCb1FktvPKNiHOctQb0NZpHP6vuUJxOVIqomk2zI6v/Pg7ijTgIaSXEs3F1
         VGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOxhSnayK8QxbrD63cf2oNZmoFkPournY0d5EVv7OdM=;
        fh=02LDNSw4o+skrF2XiVDqNnHWjl/kxoOnbD1NSsuhWIk=;
        b=Ib4f2n/ZlNHX45b/NobV1xl4MJcWD5Hz3qG4JTYcmnpJKElNgGfgNCjbb9WENkzQaA
         rwoRHFg/f6L5P2rVDS8q0b4AZYlGFoSzhnfBSXjHxDQoIFN7JglLX6MYjicCQkEa4RLd
         ZA+9Y68s8SNlH/497FMwFByMfp4pdRg32/lJOINHbjVraUDmpfko7CiXd9PSJ5fhjH+k
         qUvbaQ9AbnZptknL0DmSKH1BeikPEe39jGoOY7EnQFIi2d48bdQ3OGG+MWk3sY/wxaNG
         PffX7rStBt0IcdEnMcPA+rqo21qqp+AwSwerK/zmnJ/9Qn9JQ9MDaYTIYaJLp211LlbG
         6iuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411551; x=1786016351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOxhSnayK8QxbrD63cf2oNZmoFkPournY0d5EVv7OdM=;
        b=KJfnhqQJAQUxSf/WQlgztU6OSmEeLNUeLCYZUi1pwpKyxtzna0dHGSsn/l7yOkp5/A
         C5cf6NKBlzFw/D6CsZ21W+xWPLhV27nupmlafuusDrBt1vrYKsi9mFc9kTabiuSa/skH
         ch/aZCLAP438wb0nLzLFhmJs2KrDPcK37QqxU4hDcH1NkfO1BeOagUs1ynkEQYGJwxab
         jVgEDhlNL59sgObpkrF6n+Z5wxuteQ5FB+yuhw+VgdDXgG2ogCQ5qA/JSA0/IGUWv5Do
         2i2LSxURvuNWRVXVFDjH8AA85BhhIWQxIXmq069SM1kYtiCb+6LOlb22IW1LRIUJ2kRq
         qNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411551; x=1786016351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOxhSnayK8QxbrD63cf2oNZmoFkPournY0d5EVv7OdM=;
        b=r9AqjTKY9VH2CjfMHTtRVOxIQ1GJ+4QpeXQBkJHNxrxOA5hVE2XRHoOLxuUUK553Uw
         7DItyCTOLtdwkuWMmi8QKbdsN6SAIDH3OcHLnjmFm15sUQbdofG4ghT++M5X50NicMBx
         Udfu3HTy7/Qs3NTigyAHh6YPhkJTRctW7n1siYy0iTbd6vTwEt1pNEQYYuG56vkfi7H1
         U7uAASh56VeYF05zsv8aWuNZsQnOIrYzTzLfdFEsl/NSG+t4MK44mz1GllEbtE5KNMqg
         bv2XtUfPLElpHmuVI983C2Kam8zn7sa5Amgob2O+TO/U49a0I9eoeKkZV70al3zG0UTe
         Ihxg==
X-Forwarded-Encrypted: i=1; AHgh+Rrcnv9EsGp+QuvEo83seV+0/KIL+dZ+C2ut7gFGelTyi1YFTWWTOxA9k2hK5bG4EiMgj47mNhDnJ4y7@vger.kernel.org
X-Gm-Message-State: AOJu0YylucdIrWjLL0ELv+IHl/KAqtvT4LgMgciAKg7lknhrcB3brWIq
	86toa2yAP2tPWXNCrqrYaJSfETaT0vDLIsT3agivLw+ODgd+cKUvtIELz4CIJ8BSS6gBA+OX2ef
	leiG0X3jGGpp9QH7Ac8+MZXb1oH3MOVs=
X-Gm-Gg: AR+sD11jdttrKtMP9z1lqgYIbd8y6IDbSDLAMNv6cx1ibR3YuCX1b/NZhoGi0qtKGTi
	ySSgddsFzkaN5nGvW97cIgWRHrELby2CdGbH8udX9+JSAYouBti/adceTK/tG1B4bTb5frlK2M8
	btSNHZlCaCDzrPwskno/LsBd9X4ZReI8COsEQHx04T9Z28VOPMirBo7ctC3Y5nqJkHCBWF8Kof6
	4kiujD8WmpcPOmVCJQ0u4MCpBuWP1pq4/K1MBtau1aqsWFr7UMMJBIOPQS0UOueU/8DT9LQLS1S
	yof+SBve+v3QJb6JIPZ5V/wCuZl1TsZNCPHJJqn1zOwv
X-Received: by 2002:a05:690c:6b01:b0:7fd:5508:b2dd with SMTP id
 00721157ae682-81fb97f7a2emr12051367b3.22.1785411551310; Thu, 30 Jul 2026
 04:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
 <20260727021048.3375444-2-attinagaoxu@gmail.com> <20260730-lucky-strict-oryx-9ce8de@quoll>
In-Reply-To: <20260730-lucky-strict-oryx-9ce8de@quoll>
From: Gavin Gao <attinagaoxu@gmail.com>
Date: Thu, 30 Jul 2026 19:38:57 +0800
X-Gm-Features: AUfX_mzaCwnwh8yAtjVvunPNaTB-XiGKKcyJxT9ge1AJjv97-ODm4c4wF7ehf-4
Message-ID: <CAK2JjQVoaHjzf4Z=_LDVzTj0R-ey1Z4T+1OF_xYACdz1C4yReQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: rockchip-dwmac: Add 25M
 refout clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	nicolas.frattaroli@collabora.com, sebastian.reichel@collabora.com, 
	sashal@kernel.org, alchark@gmail.com, chaoyi.chen@rock-chips.com, 
	amadeus@jmu.edu.cn, rmk+kernel@armlinux.org.uk, horms@kernel.org, 
	alok.a.tiwari@oracle.com, david.wu@rock-chips.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 4:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Jul 27, 2026 at 10:10:45AM +0800, Gavin Gao wrote:
> > Some Rockchip GMAC instances can provide a 25 MHz reference clock outpu=
t
> > for an external RGMII PHY.
> >
> > Add a clock name for this 25 MHz reference output so SoC dtsi files can
> > describe it separately from the existing MAC reference clocks.
> >
> > Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml =
b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> > index 0ac7c4b47d6b..074ac274f2e0 100644
> > --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> > @@ -81,6 +81,7 @@ properties:
> >          - pclk_mac
> >          - clk_mac_ref
> >          - clk_mac_refout
> > +        - clk_mac_25m_refout
>
> That's the same as clk_mac_ref and clk_mac_refout. clocks are not
> outputs but inputs, so explain how does the device take three SAME
> clocks: clk_mac_ref, clk_mac_refout and clk_mac_25m_refout?
>
> Best regards,
> Krzysztof
>

This is not the existing clk_mac_refout clock. On RK3576 the
REFCLKO25M_GMAC[01]_OUT clocks are separate 25 MHz reference clock outputs
intended for RGMII PHYs, while clk_mac_refout is the existing refout clock
used by the Rockchip DWMAC binding for the RMII reference output path.

--=20
Best Regards,
Gavin Gao

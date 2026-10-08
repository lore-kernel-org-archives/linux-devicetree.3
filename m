Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C47471431
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449213; cv=pass; b=Z8ZEvamiRfHsuJkjcPgLtT+oJXtLpI6yLJE7H143IuxTJyI29nGw0zJcV6Mh1WNXmWzKGniAy49NzIeQj9TsTwuGf/ssn83G/LYf522L2hQNqhNt3Xdx3VYRL3RbRKeTR4TOfvZOPw6rSW5EVIcvRz842FukqqTtM8pP7WBh5DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449213; c=relaxed/simple;
	bh=wnGY+XHH6HDJ4wz0G2ps9VHtwY0746+c1EU1QVcGcMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/aT3Zpa81l7wnHaNAKioD/4rn9VGOq8h8SiWZ5F4OR/DzgVBB8XumP/tY71B/Shgi7skDS1ucyvwH6Je0xzx+Q3cN3yMy8qR91TJ9jGKc4cAtpoIPMkDV4K6tPOFwVssPRJsDgfaZetG3AHRsbfnU1RhK5xwzRdZr/k1URQCVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YN5vNcFH; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YN5vNcFH"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af173320f9so2766699b6e.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791449209; cv=none;
        d=google.com; s=arc-20260327;
        b=TOkOO9AulaciSFJ1k6mIhw51JHRyCUfgjVCVHysDORyd0mgHXqbaImlpb8XqrAKlMa
         iTniuc4j8ui1BRudWUXNx5INh69C6rHmafSBlunwfwWkePcI6NLDZhOhTWrFfWsH+EoA
         L+pGjU17ghj/E4xXbd/SKbNRDx1Ogbyej8/MCSwo4FP5x7aXf8Qq58LbnuB7LZJbezlT
         GAt+aL9Mhgv+Dk0AvucNzLweajQKYmvrYwALwql6/IftDTvgYcdRe+TREI4q0xs8dxtV
         XfzZGk10eqkyeX3HOaXbNLFp0bCl4GJr+oq2rxHboc3RLmw9MUdhncuPnWxP2NDFbg1m
         7ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        fh=rbj9MY3NjrBSINkX0ycZezYTYde16PuvEuqM1/f9yCg=;
        b=HHY4GmC+Kl69OXoW+N7mxVjebF7bs9kvZzlLCTRLfrfz/jyAU2lZ2Q/+XyxSuD1ZSG
         RFoJTobq+b/omgz1vfIX+ojo8P1DDeweZWNJxGcgbrlpmjbE1FNXMqhjXunk/r8vaBYO
         H2dEVqgRCwu0yFp0c8fO4UxZazLIs8ZCZiVlm8cAqEy5Khf+qMPcW34U14XBiJzSBDm+
         dUXnoSDpZE67DkNKSlQ55FCXz/stxb+3m6XIu2sdoqdsC/pvGQJthaA/nJhyaoeuHhLc
         nKZr45coWjTxm7RG0mtTpq7+/0yRAIziyEUZIr5fzP2YT9BI+aE13uLe3S9mkF5tcqYJ
         0G5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449209; x=1792054009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=YN5vNcFHN6IYyr86NzMr24Ebg3iUFLvJ54CzyveA3G5SeVCYuUKGNYTvbV+yQr1d1W
         oM0NM4r7IrvcwGAj3Mg5udBIgVygQ9g3OmJK7PXtP94IyusoXNVaX86R9xFQQX384iSg
         rdj7kWkisR8fDl3OVCq1YaQteAhLddcwSJkddwDSv0csvpNN+An7Ln9PrBOO6KRLrkLB
         YXiGZ6zR1Xqi7ortkzrvOVDogcUf6Uw+2GM/MFr2QnnC7RB16K2kqaTA/91L1VH5aLM0
         3hA4evbnop4fBkDfzGIRbRVvHl42LXVAb5fyC9AKc+7HfvZ7+S8w/uAxoJC6AOzv9usI
         /pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449209; x=1792054009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=NePS7Ia4D/eabS0RxUCpEWpffdprE9XGH3CFvwrSzgSsLJEWVxykx8vYKw4J8sjxmI
         I/oV5w35/dLdyGUm1Se25f8AEMhnTJj0z/T5ZcpEQiWBFvliJtb9O3FHPTw87BDMMV73
         xO+Vg7U9QA3FFRU13uPkeYSDBwxxJuzE7OTgE2unW+bbd8dbcn/qP87IMFWvyNSItvlB
         4sxzkiSyQblnupP2iOzYrrjFC4H12bX5d+72q9MwvoOKpnMRtoHXTivZnQp/7glUVzDy
         vtHegGnkC355rlOjffMltoYRbRZzx49Pxe8gTZJNesv5ZrIyT5zgjpv9HJuOoMymwXZZ
         gPGA==
X-Forwarded-Encrypted: i=1; AKwUvBzAdsaOM1qqvmvDvJ0zAsUv/Jdckt4CGMspNHOaxmSfinUEaensyUBji15mLQpd+exeWTaCCojxF77f@vger.kernel.org
X-Gm-Message-State: AFuF++lo5qnCPnwCfguibx4YUZDcgre/dBJ4j47CyoS/ckitjf4048U5
	mfZU2wzmQMqpuFOq4bqMw8bduCzliTCB07Js23tTUZOhECZICD4l95hV/rRBFKfiXrXMOg05sA1
	SsLYzeqr5X0WqHGD51njrYIO2kECUM1M=
X-Gm-Gg: AYBFou1dsqtwHA+CP5AiMMzfQHP+j7LYFr3Pfm0GdjVHGw22bUUJmqgmZLT5xlWf2Im
	RSCiObnReti5dhzVsDd3nVhcEICNggTM7kY6wGBUQlOIlbCzsFeOu3cAkoZrOdAU7I4vBCa9rqT
	FExQO6XQQJSOw5/a1kf4txH1YcbaPee/wpodaGXYxD9f3TU3n9Q2qca9H+2inu7mz+WnER6lSpg
	++2uPqlsT8ByhxP+w9t/tvuqdA0+YgXff937SUHCZx7vK3M83mXgiaj6xvwV6ZLC62RZE06ythF
	yvzZuvJS1E+SbNVwuSMWgD1wp3FYClMckXslKB/Z4/huB9Udow9ZT+ibyf+kgcSCARbBDDyHDUD
	AWSq7KSyQs3KeeeMDwYHxrEvBoYU0SzPmCO8+jR5RKdCfcGgba7wFEgZWILl1fwTJDKxb+PH2zh
	SbFmeB1EQ9x8UxMjheT+UTkD3hD2fgJl7xHnMuwdNuV2agHecmxA0=
X-Received: by 2002:a05:6808:2e43:b0:4f3:36ff:e521 with SMTP id
 5614622812f47-4fc46c92bc4mr4767586b6e.58.1791449209535; Thu, 08 Oct 2026
 01:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com> <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
In-Reply-To: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 8 Oct 2026 18:46:37 +1000
X-Gm-Features: AclHuK9CHquST79ZWASmiEF-eCVAGlz1SqIt2DEtZen9lPzYSl_ASrQBijUe-o4
Message-ID: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 4:33=E2=80=AFAM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:
>
>
>
> On 10/4/2026 11:33 AM, James Calligeros wrote:
> > +&i2c3 {
> > +     status =3D "okay";
> > +
> > +     speaker_right: codec@34 {
> > +             compatible =3D "ti,tas5770l";
> > +             reg =3D <0x34>;
> > +             interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_L=
OW>;
> > +             shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> > +             #sound-dai-cells =3D <0>;
>
> Both speaker codec nodes reference the same shutdown GPIO. Is that
> intentional for this board?
>
> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
> GPIO requests are exclusive by default. So I would expect only one codec
> instance to own this line, while the other appears to fall back to the
> register-only path after the GPIO request fails.
>
> If GPIO181 is a shared physical shutdown line for both amps, how is the
> power/reset ordering expected to work across probe, suspend, and resume
> when only one of the two codec driver instances controls that line?

We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.

[1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e1=
8ce@gmail.com/

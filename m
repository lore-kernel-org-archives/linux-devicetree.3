Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841F30CD92
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431230; cv=pass; b=HlMs6pjFGSkvKTKGDJAkEYr8TFTenvIblJN4aHxcP80rbgpLRJi9JmlTVYgrw3QTh8P7YrV2TJYg1akvQFwl6JX5BkBTVcG7kf/uarBh1OTTw6e27wjeR9kCnPN44KlhWWKRtCMitPmgeCP0zGDISnLbYss3zMWsvCLSy828lgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431230; c=relaxed/simple;
	bh=+EKnHhRrK3CoSwAJkOxB7dEn+eWaxbzYXodW5WETKj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOZYaGyj9bt/tj+Z14c8oYssmAmeuV9EmhWoYcCzwR4FvAcCzbH/tBNgQLYt83Z6+3CbWdd0WxWtsMCT8l2iKCQazrIZLAaIwBp6330Yvo4lQSUqSok5u/OVVB6eO7RrkEVCtsyExiqrEUl+B1+Y6usmCDAT8WLGhUYmv1DKF2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iVqW+6R0; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iVqW+6R0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dcdf60427so2256500e87.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431227; cv=none;
        d=google.com; s=arc-20240605;
        b=X57MjRIfRT3UsqYXVWRNZMyFLqV33PPzowIzlNdheaqrqlVVgafYjDf3eYP5OigpWm
         XL53BBgI5R6PQMc2Y919Rt9p/QqRxo9EP17C3lAijMB3FpRA6RGLpD7BzniEgaOWsCef
         p80fFDdmjmQmo7QsqBUpIKO3suM8CI+bnI/mACfo6qENctDz9TCej4INbQ+kGp6d50O/
         S3E4mik2m8H111zPfXbzaFpSMWggUvxpN1+OProk2DvIurzUEukwvs+o6Z70kjk7v8Is
         Nyqx15mt24b6BzyhAT5WjHIxZ7fkh1MXDcXkKyU4iAdfqf3j6KgyjxIGxLR7Xyj09k9l
         Xucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        fh=9MYqQqjJJHenMKV2dWnbW0nuNDhayOyYgOmOw0xOpoc=;
        b=CO3MxT3xoxtKbzC8NLeq+Jaj81iYHKxIdqUGSwR0IpnWNgBMXWsmJDHfZMc5GhVFpP
         DLLbY4HZiaM0xLyMOu1TSiUY4jH/6JjpMCGW3h7GPojeW0SwxZTNgimPlV58zMA51KSt
         f9wJtx8cdgMP0RhT8S8cADGt1eAlkVPGFYFiaAsHR3dOoUNBQnZouatwc21jumuzyI8A
         ZJ8lYn7qU7kegbuhyeuFhF/qKUTX1ebghh3mYWAu6TvaovIO0uYHTTEj6o+BuBUSq++8
         P2xxsfdT7cMCtYS+qAzKPU/rfejcQAL5Vn+TTuq6TI/zb1E6CfxW7E3D/KWQU44x8Lzl
         1seg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774431227; x=1775036027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        b=iVqW+6R0FMm408Hl1lZN/gi0nIcuZQBSRosZgfM68+eHNWUFNsaboC1wS1n5AxEmde
         u4PwnMLMoijV54YoZVB7iQ+LEy491keeA+p1q0hdJxxvP0I1UBjX5SVHvYeVV6nH5TRG
         8k5S5wSrWgd+h51Lzvz58eusVDlO5IlfhMTRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431227; x=1775036027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        b=UBIXJg4OzFnWzsNbvD0S8bJ1dHSeMybMo8sJFyfIbQYm8ktzISVuyJJk1GwTeAE1gI
         Gqcc7qULBuiumUSTOaKAjz/wHuEeBZD+uNtPcP8vk3gVISyV4fIfIQZlTcCQuIEBFcP4
         T0Du8S+VHV54csFkBOeCL5POkklede4vvXfUBqJf5EeRJVtsNuzN1RWQ3+djE4ZQyJfN
         QCRklabmVuHTixnK4K4lrHpCFQi4cKZVd6KMM/ibSrIbjBbSfkX3ZXSpHxYjFPY0mjyY
         opz051EHedRdp75i2LbHDMTgb2ONHMxXPC/r5poos1ed++tHmRDMFGCwLgcdk7bq4dam
         WlEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhZWbPXVio056333Vzahq63oswNGrIOkU0uLqAZMaVmSguIl8nCGrlerV44Bvu8Y4fbkoSWuZrwwPB@vger.kernel.org
X-Gm-Message-State: AOJu0Yww7OcQv6+JaPFwK9Tb4rGRM4XiBUdLRzEujenQA6mF61GEa6Yf
	w+JfVeWdzgFJA41DOu4JcuO1a4uCiMKR+wAJoP1KM7nVAXabxuouHplx8iZmu7EDh4uin97spzM
	QH83/BP3AV9EQQkjRvUWrT5cHfB32ZlqvaR7eF0J9
X-Gm-Gg: ATEYQzxlB1SS3lUZmYXum4cLNBr7TXBPE3iOOqPLQEoZYgMUKqfmSUWVkedC+vpfa3O
	J1BFqncNuafZKDh6TGO/n1KPhkdXYgSOZQ07C0IKkTS9HpwixMOLECucNMgeD//SbiAt3+9gh2a
	eBX2TllQiNBjOXWR1j60SMXsLRDcf6OstRs4NeGkgd8uCHZEliZe5/cYRqaBKb3iDKzUssygbPX
	JYcHhdmckaPs/Sk7a+KkiwQq6y70ygv3OBsv8zjANmxBsaYGZKnD9Syy//Mh7BXZTOfqMVuTOdh
	9eXi+JYQUhTXB1LW/r1u88NT4XqHvb+mzyDz
X-Received: by 2002:a05:6512:3e11:b0:5a1:3864:9306 with SMTP id
 2adb3069b0e04-5a29b99fe3emr1149914e87.43.1774431227426; Wed, 25 Mar 2026
 02:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:33:35 +0800
X-Gm-Features: AQROBzCBmtM1crEyyFCRfioph5HGsVEx0Ru6HUQh1CoBPOQAq272r89mllAysys
Message-ID: <CAGXv+5GwR69W5FVWzFYzdybdXv53ub-o9doDQOwey4O1HE6jCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mateusz Koza <mateusz.koza@grinn-global.com>, Frank Wunderlich <frank-w@public-files.de>, 
	Gary Bisson <bisson.gary@gmail.com>, Cristian Cozzolino <cristian_ci@protonmail.com>, 
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
	Max Shevchenko <wctrl@proton.me>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:25=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> My Lenovo Flex 11 Chromebook contains a board with revision ID 2.
>
> Add rev2 to the compatible list of base hana DTB to allow depthcharge to
> match the DTB.

By consumer electronics standards, this device is ancient.

I couldn't dig up which revisions were commercially available, but
our downstream kernel says that regvisions 0 through 6 are all
compatible.

Acked-by: Chen-Yu Tsai <wenst@chromium.org>

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - Added Conor's A-b.
> - Changed mailbox to ISCAS one.
>
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 382d0eb4d0af6..2894c8a16c78c 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -148,6 +148,7 @@ properties:
>            - const: google,hana-rev5
>            - const: google,hana-rev4
>            - const: google,hana-rev3
> +          - const: google,hana-rev2
>            - const: google,hana
>            - const: mediatek,mt8173
>        - description: Google Hana rev7 (Poin2 Chromebook 11C)
> --
> 2.52.0
>

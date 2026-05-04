Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A732C21F1
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880091; cv=pass; b=gUvioJKZnjl9szdzH5z4qdFC2P0MF+PFoyjePQxVxeO4IPTbmslbDNIPIUDBR8KtHbA+3J+5Rv+tn4xtlWSG5gfuIoHOnvtaLa9VWwS568ajWJd4WHMnJXrF1sBM6X8IfatSaskFCrkjXewja6OfTspf372VAN6FPyIBjmiQ7HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880091; c=relaxed/simple;
	bh=mImTrtDwrEXC7X93ncElFhdb+XQUNNI1BSOw9cTkKyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyZsdvHQUlWUPiWSKTLEyyYKcFloXx884e+p/oikSCYzD01ALjI4ZpSDu/O702HaA9fWeG35rdsJWZUTaoTINEwyJJEKntEWLFNYE0tnKH3s2u5Tr60kjHfLz369tVM+iqbYb8+cH8UGGmvcOCGa7ybXgrp60Y/Zy/Zr9LepUB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gVbAOi/w; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gVbAOi/w"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a283c44478so4993630e87.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880087; cv=none;
        d=google.com; s=arc-20240605;
        b=ee/IefiRfA9HNw4EZG2ISCydTkWV2IDPgb9B+9uDEAiXCNeweMuU0XfpqRN8qrLKO/
         A938NvZbuRE45jGqxbF5GURdZ8xLBAl/lI5ggjv5OROqSOGPU6zviY8TM3ABCdD58c5/
         XSHDbGc/4/4bUCvbkmOanw72vuPScjKyWrgXXZAHHxel37/s9v7qWuHxgnigPamxh9co
         FN+YvW5qWOfu4tCHUC8CUjTz93VzLTWETuqlhNXMtTn+1ghWSkaL9BatLuybu7qRbeUY
         zzw4dOzCTLAuw34xOAPCwG7T/dVKJyg014d9IVipXF0MpA92Xw/Bt3H/Um1z8SBRnhUz
         Nt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        fh=vDsE/IpSGKj2q7ie657hXwyZx6hnz8yRYE1G+88FnYs=;
        b=YPGifJbhSIp5GQmM07AxNdXpSPqAFqqU84bDnaCwQkEztkObQkWqNMqnbdxuVO1ITp
         86ON5TqvnPw7CP26p1ZkdbaGZTjsPQUV1Nl0Lqyr+cMbS2hTioLUaQKytaws8QSsUmeR
         yTa9vcNGD2rWqXyr8Np2UI6dcUFSCCZ2Qghtt9DnEMfbkgdRf3e0beqTQSnBv8wjUsDh
         Y9c6BEnl/XcdwfWcQvkE31b+eEV9vzFNd/coJoQ0fd24SXP0H7+EISTZmk0HAhk5yLFJ
         SJqywMTvy8tXcXmNwwpfkWcMg9QjLH3VGIHMyBa4faEr6DRqQx8HMNkjBKDGf01UMvNn
         Y5Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777880087; x=1778484887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=gVbAOi/wwclWQqbPw7DlfjZ+9+9Tsd+A6szBIUo4DdnMXM9Bmu0V049sNNDEmeLhU4
         BrqiEaiihyBmc53ZTEv3IhU4ZoP3GOEUapLUYY6mkBqTLjohaIhLIFgZuA6LxV9HgevN
         zl4k0Kj9D2qHcJVMmHL2TkRf0O3rQBur/yrQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880087; x=1778484887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=RSFhb5klqJ6DzZEf4U+00l63tdE8e/IhqtTkHeTHvo09R3eXopx6KHuOjdktVkYhFu
         gWYjeXdXP5aXdNDII2GtmswrHUFkD5dBhLfpxCMC7nEuJpg1udxly3Wc6qsHEvPgymdb
         MLUD8dshtYYQXwKDVxqFKtmHvETpSRKFelKYU2k0xrLrmTM3d/FpYIx4Pgo/5iXUJR/e
         nwSMohnIk8Uhx5om2HCkpCrqSvmTb4wZuWoI7bSB7GGfXh25pcNu+pBHdNbHTXNuQDYG
         b6pYOhS8UjSm/1T+NOG1KxDszRQZk8dfMHf+9s/6psVBkNzASwoDw/+flLFJq04oErEK
         DgXg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y9p4CWR984WnwVJ/SgaZSvesqFfmX1sYQfrU+ta3x22EYXnF9rFWKHKejRAaBt3CApkO5WGWlRt7d@vger.kernel.org
X-Gm-Message-State: AOJu0YxDwsnM7RUPsha1/YANRJxNDgUwxIH3hqhjGQNVquAo8QTI+7ph
	d3LLg6M3G7s9CE20nxzLul9FsY3VfBN/F2QWhpobDdCnph6q8pUH+IQ9QHcDjgWVOP91HGD5Dl1
	hbjSyqKp0F9nHSN+mMbEyarNG+nsd1L8pcRLUGH3d
X-Gm-Gg: AeBDieufvQJimen085Kp5+3dFg/ESDgBoaQI5zGvYVOzoEH/N4EPCfPW2DXH60KcrBW
	lbn7OcvodcNWFF2KgRITThoLISvgy8ZWqEwz4FPrxBiLP5jBJjP48EufTb/NkG+Xj6VtzylCWXl
	dOYjolo8czBBxlQ/5S6dpT2vije5ekBVkPriR9wHdZHoAMOjFON7zMVwT/EGLbbdbWaOCB6HJqp
	nD8rWEmEmIqHGCGJf5l1X0db3vgRaao/wXExMnR29syQzq6AZd+CS6L8ICv4JO46gaW3aat6vMG
	NuiKzjb8FMqTkFpqKC1vGmvHgB4l8G0TFKs3wFWdBVEO6uws
X-Received: by 2002:a05:6512:3b84:b0:5a2:a3dc:51e3 with SMTP id
 2adb3069b0e04-5a862ec11b8mr2434888e87.12.1777880087115; Mon, 04 May 2026
 00:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn> <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 May 2026 15:34:35 +0800
X-Gm-Features: AVHnY4IuKDBbAkS85uOVR5vEB6IDbpI4Sjzup8SfiFFfaDlz9Xmq5t63cjYsvnU
Message-ID: <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi card
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> The mainline pcie-mediatek-gen3 driver does not have code managing
> downstream device power / reset.
>
> As the Wi-Fi card on ciri is a fixed device, set the related regulator
> to always-on and use GPIO hog to set the status of its reset pin.

The plan now is to model it as an M.2 E-key slot (even though the chip
is actually soldered on the main board).

I have some of the patches ready, but I'm still working out the USB
side of it.


ChenYu

> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index 8e423504ec052..c25780098103b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -544,6 +544,11 @@ &mt6359codec {
>         mediatek,mic-type-2 =3D <2>; /* DMIC */
>  };
>
> +&mt6359_vcn18_ldo_reg {
> +       /* Used by WLAN */
> +       regulator-always-on;
> +};
> +
>  &mt6359_vcore_buck_reg {
>         regulator-always-on;
>  };
> @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
>                         output-low;
>                 };
>         };
> +
> +       wlan-reset-hog {
> +               gpio-hog;
> +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
>  };
>
>  &pmic {
> --
> 2.52.0
>
>

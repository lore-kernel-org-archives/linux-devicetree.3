Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B41FE471
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568516; cv=pass; b=a5b95kdmdRbo1TQsueR3jQKTugr8kNlXgXxE3WOLsbmiNUJfk64kPiZqvBkH6VuClSa8J7qUE1A+GDMOmSZZ0Fw8T3NXmV5xistoYgDw5re4C59A5WWUqB8fmFOM2sJHXuZWwl4BmdyyNleM2TMcq3/uLtij9fzAspxUaBGQbl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568516; c=relaxed/simple;
	bh=LfcVaG8MSoLybwq7I+cGS/0geSQDT90LoxEK6iJoQms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLMEaM94oK0YYHuP9Q47B4ag4IWNO23HJh0X65f3GyGBo3n8m43xM13lotUOml8qENRMV99vKHmPNLjLmPx6GK1eMccgR18NCX4VHOXBGVyT8VAHPI305ZN0tQe7S79/fF+hcOc3s52/arGBmD5UVksik2jSAvTOjCk0XN05mwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLjXtwIT; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLjXtwIT"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso2438067a12.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568502; cv=none;
        d=google.com; s=arc-20240605;
        b=lJKHyk9IM8ixooDlHAaxGYw0pjbLDbwheBoXHaTakstGZnezV8Z5TwcIPL0KdxxhIE
         Bw/VGba08IDdQYXKtXVdYIyV1/zGMmKKGfvbxYQAjYwb/jUpZN44CVwZXV9MwZe43ztT
         VLzaZtteP352TA+qJOhGaDPq+4RWKBuDmfbWzeKbMUaPetEfEIM98yrDtMdPv8IGtxep
         h4p4ZwPwv6lijab1QD9ZhcS1zkpN51clTyHlHSOyFaPUwIs7f06hEC1/3spF6EJzyNwF
         crJe3alAJj9qszgcpF5E4s/FQQxrth9P/CsKVeERGYsQTWSNurLxugYdNt5rDkQMqkJ7
         io5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        fh=Y4/hS9Bc1O82+2AsHDxSKyboVrzLOPJxfQ+lyL2QGSY=;
        b=UVsoOtSLPPLM5k4FVVb7blZkQRuJ+nH0pzn3nJhFET66kN7IhP/Gkc2wEvPTWIs8zr
         eKHa6ruknRGPIUvqW9mj+6xgxVOdAaK2X2+fhwdxvki6mEXFofkdBwMyeg77tdL8S5+a
         ObUo6OdeC98CmFKAtKXlmCzj7N/TAO1z53Vj4QNxcn7axDPyIiNLEHiub6wuUS0yWeKY
         HHBVmN5FXUWaxpi2DbiMdRdIfp8k8uSvDDF6Uw3zZQtk/III2iQm7o7eWkPsCLiDLeAs
         s7LENEESQ2NSALRiEdw4H2Ai14m9XbqzY/IFZGLN8MIL/qT1lnpKLUK5Q7Tv1AM3g63v
         xcmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568502; x=1779173302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        b=iLjXtwIT6b7SSIH0nK2u0LKJaeuHqdrTkDrh+Eg1uqTroYRxJIqBDEY8nA3nHFnVfb
         sjYcvc84dcUaMKVebF/nekYCZL4+yo+4wJD3I/ahGzaterqThvytQ3a1dbMuV8BwlFLz
         NUMnfaZcJZuuqhNaWKaDgcmEd6aqgUlQYXIHOuYoZlHTi+B1HBE/5P4rUy3crQvRdidh
         PFi6N0U7G5f/BxgGVajjSnU07dbmKFPIHInHEc/iJipbWV5iEp9F8g4cFqjRb11nkHoH
         0id/m6rTcJTUXie2WkuDUd6Z0J0e8DP1ibNxfBS+RdT8YKiOGUrEGW9WGuLEqeMcwZ8F
         Yt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568502; x=1779173302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        b=gaLN5FBWzAcjMEhkGuoyE+bNLchaRUpAr8bWiaeBfD9+bHTMEp6e9DbLml3WsEk2Wo
         GH5hZLKMkUchKLJS+9VXS9pngPlotYEZ5FWa19WzCXfTOVWMhVrIXgApwBEgCSdaQ/PO
         IQ40t7sli1wlS5bg0jQhWS1s1iYFqQ8ZY1Mb7Y6ifAJ+keMTUSUfqtph4C0k8tpaax/s
         SoSurKFQgMuS/kwC7YTXRrMiwGLaDGiInxzXOreKaqYgGx0yeS16LoM6cKkuBWlB5yRe
         ACWo30iNbn2718GNKNdqs9xLh7yBbDueljzud8vfM+9WTPYwo16xBObR8PSjW9ZvW3fR
         WFHw==
X-Forwarded-Encrypted: i=1; AFNElJ98iDkRcEhlD1984mTyRXHaecpoLV7mq7fPsN8NdsvFI//Zdp2LW/zaeh1IkO+t3vK6QA9qus7hf9+E@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJQsj/ml8zmhnV8/5h2Qd0YFDdgPdPiD3MWlQW3DVf6lLg7Vv
	zvO4UE780w7/Pakx38yVCpfVUr1DiCD+uqMPVmxrhpHyxBAc9omL6nMi5sFjjFPMICA638zXojD
	7keY/HvNj8Gx8SK/yaX8oAAjP0y5Mx+A=
X-Gm-Gg: Acq92OFAu5C89N50CPnmKO7RldnCjMYK+l1GSyfwSTYZdvL/olv+c9ZfvJXg5yyEXJv
	v3IWMXgTFQM6pP52lwKiod2CK2k6DJZy44ujaE1kxUO0X56PAQDxFAqqN2CcPfyPDA3HhWTaulD
	apsWBjzeFoIq8IZHCTedx4ujlwOPSagkUxEH5p3KPXPwbIE8klrpvGcR/e8oBiLdbRPF0CNHZZZ
	x3JAIiEWwxF2H127sjxm6iO3LpQ2NJ4X5iwxxNTbMMJz6D7SHqb79YHGS+ZzHv6wonyOzqG2tdJ
	0dk1jRRmPXPmQUdmzKqFPIELwl/NIHucnU2wYRJjBSe6IGXRJaORxpy60DKT/4YH6I6vdLxGQwQ
	eDmPaR+M=
X-Received: by 2002:a17:907:809:b0:bca:48de:5cce with SMTP id
 a640c23a62f3a-bcc1499a53cmr609442966b.36.1778568501606; Mon, 11 May 2026
 23:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 09:47:44 +0300
X-Gm-Features: AVHnY4LmZe6op_7Q9Zb_x2R3mJ89A3uDVU-76OXP9otXVwwfDX_cH9Q0T5k4R6I
Message-ID: <CAHp75VcR2pzdT-JbNXE_nOM-XC--4y8D81tk+7rvjA71ugTkzA@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] nvmem: add mt6323 PMIC EFUSE driver
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.

...

> +#include <linux/err.h>

> +#include <linux/errno.h>

Doesn't seem to be used as err.h implies asm/errno.h that provides
basic error codes.

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>

...

> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +                            size_t bytes)
> +{
> +       struct regmap *map =3D context;
> +       u32 tmp;
> +       u16 *buf =3D val;
> +       int ret;
> +
> +       /*
> +        * Manual regmap_read with loop is needed, because PWRAP is not
> +        * a continuous MMIO space, but rather FSM which doesn't implemen=
t
> +        * necessary read callback for the regmap_read_raw and regmap_rea=
d_bulk
> +        * functions.
> +        */
> +       for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
> +               ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset =
+ i, &tmp);
> +               if (ret)
> +                       return ret;

> +               *buf++ =3D (u16)tmp;

Why explicit casting?

> +       }
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

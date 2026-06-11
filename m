Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57130380FCC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194460; cv=pass; b=DOLkRDhNDer23aVaMylKcD5OKtzOffyNOfiQB4ug22yOeyMI4fMuIZ4FmoSDheGps2Aw8cYfjZ66IkyQciC0DuhucVzb4wU3l5K4JzJQslk/K38mm1B6hhhTYMc/k/ZyhkjFcP0iW9qeL8g7FgkUUwLAj0lQ1SQs8fIQz5m5qCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194460; c=relaxed/simple;
	bh=bM7fgF89Mfg55QAbv7Np1pn0Ifafuy7Q5O6SGbzZY7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ol5iJPUza9srwFqKR+gB+7TcJGU0SX1sSwkvT0HGGr9k/Hf8C6Vfp2aSYI2LMrMYS5Cd4pxDriSvOQoHqLtBPxhmlDop7t68q0Tq9+MW6P77cY8o6QubQI+idGtzhgCq0xIXd4DsdPyd+GhaOhx66hMXh7xaTF1S2lJi11NZDeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csrYIUTU; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csrYIUTU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec429c2bb1so2067766b.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781194457; cv=none;
        d=google.com; s=arc-20240605;
        b=c/vD4tuizMhhD590OO928kzi+DHvoyp+xhDNhMxAsDT0uGRtmm+aLOxN1/XweBDhcZ
         on1uk++7fud+r+v/ysg6lGzKNJ4uxfjZM/kmYMUKUqXCDMZMZXImMtLq7zKCE/2MPPvJ
         hcZemMlugyD3r6vPXPt3OsJy/8voEgwD7jZTO7b8C1ohLN8Knj8pLvmpkk1YDfeCh3Ji
         yv6DaW5nKlemJGocxb6Y9Uabulg0noancRAxDQ3DYnjWTZZ3E0npCQ0WBWjhOXmKoYo7
         0V7PypcN0uUFxaCkQrEQPId+DJOnKh9sLBDFHcL2brmXLgtlGvzPAWDUrM1OACs/Ihmu
         Lmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        fh=h4Zn45iWgGJjD24YDNeYOGNWs3d8ax/hKeOhpMZQT3s=;
        b=dGWrHsUL4puF2Kz1nT5vJMqrMmtJmxxJKPdZ3C9FMKt11l6sA2xufJbMRxGARCHCeK
         l8EzcuhEq/0Skhj5Awai8WRcukIpx6Z/VK82mxmDMNQsXn/VUAZ2Y5A+uDTGJWQVBGBh
         6k6Ygw03VXNX7WDeHXj9sG23xEQcw1Dbt3pEq8WJYScPBVxcSO9+zmnBJHEi48ISmo42
         gH3KuC3fZND//QUVVc9VY109Af48AulVWXPALnCgeb867vM/bEaUbeoL4Hv4mvIxTFh8
         SetW/PtZGBnN+v+BB8DHnneEbKA2CqeoQ9sEYUpduiMUCeUo4zhlh8L17SVbCVuzsEOv
         T0pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194457; x=1781799257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        b=csrYIUTUvioqqU96P6dT9j0vfOFShvwyMDC+4d/UT5vtTblncii8Pnd+OrFz617lUL
         2H5qgyj5WFcQhuoBi1Rag8qCrt6Vod0q+n4CLmgDgeiIrTwyFO2E55k01UdXcoKWnqJ3
         AMujSDl1L1dcxgekniYE5xBo9PeoHWfkaXP9ID0k5kSmS7MVV7NwpQr9tekf1zO1PPp1
         kD2Owyq5n+FP2mYSQ5LTeWl6aiebiu7hJKeSIT8b7eONVjvzCx084IaIwMYZuPWZ5JGJ
         /Qe2tB0EEohvzJAuKSCglU+H7xe9d+Bso4SJcEBz/xpRSN2LpaEVY88O0B4TyBLN8ys3
         lM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194457; x=1781799257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        b=ZbV27j4Hoxg9XEMHZoyxGF1QkMcjjF6mErEv5qXi2mSBPBL6946UR3+NLPAQcFo6ya
         lfr6y7lFLuKgD2yfg+8FqmiKlxn49rHzLIXTKUS8cJlkiaJMwe3rCb7sPkMVHGnclEqr
         PyXJNQ9Bl1ifk6x8J93BBmPo3OXxzuub24K3SYFS1eqZqDLU0GmZEYdKlg1vZT9Y9Pvw
         oGPJe78dcuXf04Pa8h616vTkAJHM6C9E8NKXvZs1rFvCemGq3PtpXSizuWsoxnD3zXjq
         oKJYsfmWPewhtAAk+HyeM6WUJwUyFtWul50tMWoF5bgee6k2x0YcZzlSSz/bSoqDaAP3
         Puqg==
X-Forwarded-Encrypted: i=1; AFNElJ/7uJc2UzG5zDlAR/ELfSPqh07c3NDvQRjPqAZEOSdz+wkA2TpfeVApTTRJqvoSiDs19wRpy85Oypx2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyynr8PlF3Hk9+sVyGwfkvE+5rSNRj6xAR3+3IBi7Bk4UxWP533
	fva7k3Ii2jdjpXuEqjxlrTtaOe/5igHa2yWYMuT26P5yeWbfypRqe5rMknA/o7GopbKTZaN9h6p
	B12idJjzAt2kjWCNnoVpqXQh27e/DigE=
X-Gm-Gg: Acq92OH8WV02BUT7DgzzcVFT4u+mbj5AQdr598MVIHzO43QwO/xwUiUdSVpo2G2UxC7
	DMuqm8g5Dt59wEaCVXNMiwybLg3HYaZG/jipRXqcc4Q8BTy0v3EKk0UPGGauBDCnFG4hFD2KNMZ
	KDJGFy0X5Dezr2HTIqPyTJBu+f5bjGgl3XQIKhdTvvBklKCz5qfrKd0CkNWfTzdieJc/Kr0fH1g
	/7aNKY5ryYfVI5KPBCVjG+hLdPxU4ms+MPIzL5GXJFYqQjU0aYzLsHosx6x5xaTu4jYcoHGcz/f
	X8UKvgJscKx3EeNuZPkVkBDfuu+K7zG3Hbw4Kk5cSnee63uY4elocVssEArRYjVMZG8FoHUVpGz
	Ng3dketi2/3PVM+3xSRocnOS0bs8m0ThklnivVXsRxtUDpfuUaLRbNk1R8VzuoHKza7HmBZnzku
	2iUHw=
X-Received: by 2002:a17:907:7ba7:b0:bef:1e83:8228 with SMTP id
 a640c23a62f3a-bfc87c0f243mr220203466b.39.1781194456320; Thu, 11 Jun 2026
 09:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com> <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
In-Reply-To: <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 11 Jun 2026 19:13:38 +0300
X-Gm-Features: AVVi8Ces8T60xoHtEoplh69CdNS4vvYPyDhO6krvEnoKRWh_ilPPLEaS_PgToaY
Message-ID: <CAHp75Ve-+-xaWoktFO_qG1Xkyzh7D9JsBFw_qH9zcUXWhk_qNQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] nvmem: add mt6323 PMIC EFUSE driver
To: rva333@protonmail.com
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 1:21=E2=80=AFPM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +                            size_t bytes)
> +{
> +       struct regmap *map =3D context;
> +       u32 tmp;
> +       u16 *buf =3D val;
> +       int ret;

Perhaps reversed xmas tree order? And it's actually better to see
assignments first.

> +       /*
> +        * A manual loop using regmap_read is required because PWRAP is n=
ot
> +        * a continuous MMIO space, but rather a FSM that doesn't impleme=
nt the
> +        * necessary read callback for the regmap_read_raw and regmap_rea=
d_bulk
> +        * functions.
> +        */
> +       for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
> +               ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset =
+ i, &tmp);
> +               if (ret)
> +                       return ret;
> +
> +               *buf++ =3D tmp;
> +       }
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

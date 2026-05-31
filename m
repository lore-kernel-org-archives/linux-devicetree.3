Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456D19E992
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234879; cv=pass; b=FKeJ6Nbjet08qIKEbfjY2Rs1WjCEXtP+eIcME8sdLpUdwTqjQAPtMYekVLrEU8Nm1t6C4lkmo5D+F96CRqxm+OlCKd25EaYmo7RJ0n2Za2XRHo5XiCJBg4vHGp2aZnb5CdyKKazzBkx6DsSatP+GkLDhGu92Mx9EptccswiDE+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234879; c=relaxed/simple;
	bh=sRKrVpOBYWRz1+LYXhppMZyOZPgVxDKjQ5CHY9lps6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJi+ov9pLsNnqseeB90IZB3fVg5JAnItJ4sHTXPF9Pk+jQgqSRmyIEwd+YO/LJO96E3Eu8GEqPwOiQDuhxA4xCum7MO+WCN7c5sC1lM2nkhOMEbOMLJCI+z+mBHXF/OkR9yFPJdkF2dXphUhJxNK//RrOFZlLBA4E0vqesB09c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtMzZ9HF; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtMzZ9HF"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6606678420bso742465d50.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 06:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780234877; cv=none;
        d=google.com; s=arc-20240605;
        b=RxFYru2FHdt72O0q0qKD+hyL30TNBcaUKmri0VjcYwEcUsnIfn3iScbCj+3BeTFcfA
         ZJYCj/cBW3ArjE+bmn7Pe+OYtzZ5PGDW6y+zSbvGpQvyLfhdIhQmJW7oC6Tyygt9K+vD
         v6AwSYxIG2ghMUsipZIwEqjsPeO8g8LMB9q52ltVZNA5rHkm7FbFTRDkHNyJKpjCjrnk
         /Ct1XFcPAORVcBCCJq9VunYxyzuKUmeDDT1vtslMbO0NSkQ12o4k9aMc4J9WkXvt5Qry
         FbR/9un5QDPQlz0TWIGVbiy1zymfCo+TaJSeDo6Idf0+7cv5Rxoew4SjLFZ0LyUxkQJ2
         skNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        fh=gnvc2+7c1iz5e0LDLovyfFk9ldDb13iYJaDEopiEGrU=;
        b=Q3cCn8JVLvsNTFjCLVjBx6b0LD97HG9bIxBMEAx9pEhFKk6OvSMFBJWvyOeD94oFp9
         YU43hOWACj4fjYn3PYhXvdXjb+jnaYf+FyMTjZQUhh2b5P4g/DavI+1ZhKkPqw33VWQ5
         j0PdA5pFpCiInOd+4KaL7hFFWYRClp8IeAVv2wdQkIy5WryU6WJqnshIhJ/GzIGyriEL
         /ta3NmcuYYkBm0AYIjFXt2QnIV6enAGO9JB63kHBOavlhIrLNSutkq1lJbbIjnfisOXt
         IhQOX/ItgB6Dsnd2SzewkVU5hAL9vTDsFDGeGsKQlgW+2Uj0FHQpwIC9i5q5DX44QlNk
         GGzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780234877; x=1780839677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        b=FtMzZ9HFZDMN2kwFsjP8e0I/CBTYJ3/APA242K+sISQ/fc3isA4IZv+46x+7o++SHM
         9WCJcm3udwJtAD9DF+emVwCch9DK2ZimfNmcCrCMxq0mjzSgMDBwxbUzuQIDa1f2J1x6
         7IqB6L/kPzim3vg4CBuOMG1aQ2jwN0XKUCakYElGFC9pSn6TtG67yM9SvEOpJ06r0EBl
         KJ5LwLAgVMT3VWfDjs2OJCYz1D6FiNYsRcTZ4LMdCeiQAc7cEhJQTygnhJPGJ6D40I0r
         m4mQUEKKLwUN+/4CynkCwrterLC04XKnbDMqvD9AWSNpiWZFkO1BXMn2mQUYltwiphgN
         0xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234877; x=1780839677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        b=AUgvP5YWY0A/Wl9ytajM/05HbCgFDd8nyGPm9VUgATpcRPsrtfXInW0oLNqtjhu8y5
         nx4FDRxZ0+6Tsk18oxujd8yIm/xGKezA2OZqp1X4BhUTMMcPbsnlnIlcsWLAJJWDvZUu
         wI9nJn5vInb53Rz2K22PZ/mZ4wuONTKFEg6f+qO6QDGX0o7iYygJ0EAKwQ/68aUbuoRJ
         jcn+MEOKAR19/muQIEbgW59bH6NRSnhk84pZt+GaoHj+2ID1C7kM45+7BeEMMi11dqvp
         bnA+0pts/byO5V6ogD5LtR8nwdknkxP3XOtNSqVBpdY7fS4uFVShVussa1BodgighGJi
         vIxw==
X-Forwarded-Encrypted: i=1; AFNElJ+S7jpOGUGVoCOpJG1Gm6uWOXg6eh6cTNWf1Oh8ff0MC3IwYjni+DmaNFMbQQG9c/RxTiAVfxlxuEiZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCIMYb0nppIyX8dsVW3KpfW3gzNyptj+AkPJo5raGeIBw3H47b
	lHez4JXyas+A6MypjkzTBEDAZ4TpZyzzuMoq99lgIZAFkaujKQ/9OVAtNFnKk6n6QJd1/B5sw7b
	lBZz1NfUt4CoZWh9CE+8EkcN4+T52R8U=
X-Gm-Gg: Acq92OGa2gw+lZN9oG9yOEsSIKwunf4k7cwvoJGT7IR0twmZV8xlkWnWg1zCeHtNF9G
	Yrv5A9bgNqetidKPJfxv/U12mklxHixY5EN/CIECxFBmkgmXWF9F7psMIpZC97f4CmnTAJFsfA6
	KDYD69vkWL7k+Fh9cUASn30B4ergX8GxF0ZsCVgLL62M3T5+fQ5QA2sSLbBCh2WsJPfbH+kfPjz
	Mhblh090sJD3FRd66b7id7lPtjpxctW+yvUJ6iTKHp1uGzOX+DwcOZ6MQxSiRixDmnVBXMGeaVj
	680Xs6DPshVmy4w21b8DWIoRTH2otoKDMjllASXvCY0n48ghBR354C2UwDfq3N0+zTIFdO/HpqD
	Itw==
X-Received: by 2002:a05:690c:c4d1:b0:7bd:5af9:f0a1 with SMTP id
 00721157ae682-7e05d3f3c57mr59371557b3.25.1780234877079; Sun, 31 May 2026
 06:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525033258.144291-1-ninadnaik07@gmail.com>
In-Reply-To: <20260525033258.144291-1-ninadnaik07@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 31 May 2026 15:41:05 +0200
X-Gm-Features: AVHnY4KJfn3MZPFX_KGyjh71dDrddHBfvkTmSAHTLi-XV7OebVew5E4SYYsjU94
Message-ID: <CAOiHx=kdH5TFUxTZdyphy9Xd+i8Gh7nU1Ab9wxLvK1och=JAhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, me@brighamcampbell.com, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

for some reason my email filter didn't catch this ...

On Mon, May 25, 2026 at 5:33=E2=80=AFAM Ninad Naik <ninadnaik07@gmail.com> =
wrote:
>
> Convert the brcm,bcm6358 to DT schema.
>
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>
> Referred to this thread:
> https://lore.kernel.org/all/20250930-brcm6358-to-dt-v1-1-ba833ceb1575@the=
goodpenguin.co.uk/
> and added the fixes suggested.
>
>  .../bindings/leds/brcm,bcm6358-leds.yaml      |  98 ++++++++++++
>  .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
>  2 files changed, 98 insertions(+), 143 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-l=
eds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.t=
xt
>
> diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yam=
l b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> new file mode 100644
> index 000000000000..a61417e5690b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to Broadcom BCM6358 controller
> +
> +description: |
> +  This controller is present on BCM6358 and BCM6368.
> +  In these SoCs there are Serial LEDs (LEDs connected to a 74x164 contro=
ller),
> +  which can either be controlled by software (exporting the 74x164 as sp=
i-gpio.
> +  See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
> +  by hardware using this driver.
> +
> +maintainers:
> +  - Jonas Gorski <jonas.gorski@gmail.com>

The driver and .txt schema were originally submitted by =C3=81lvaro (added
to cc), so I would have expected him to be the (suggested) maintainer.

Best regards,
Jonas

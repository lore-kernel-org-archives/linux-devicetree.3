Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB5E1BD00C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753703; cv=pass; b=cMFeZh7Iqm1nkTP8dFFJM+3zc4sA+I4rJgDxFnN5mknNRswCisMPnu3ka7BksJ9bKC8OTXcCKnqhRP7b8jOpIkSPURN35CKKo6wSFpQ3fAPeY2snro/garbLpEKfjaaDLZ0exc3FdYwg1mzqt3Olbwxbt5H+33qKAAXdBVDOOtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753703; c=relaxed/simple;
	bh=dxycI7gyGZDLAZBpb9cvJBzlyunbEEN3dk8hL+6bedc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCjAb4lGeHst4uQDD9sKqVK54RlFb/0L8+HbEeuK85WwjhQ2M9CLb6z1UjqcUw0j7/a089jvCyutvCJdTT6lnOFdP+6IZyhm3llR8GsOhV393zoSW2sdOUq4qqSGiEsQe4WxlCz+oZUVyFmmo/sZChiKIk1iJ3FV6So4DA+6gYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOfFfqJE; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOfFfqJE"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6737f0593faso4204659d50.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753700; cv=none;
        d=google.com; s=arc-20260327;
        b=Meug4P77oYj40DxhGVRAy6I8wwXrqnCRseTPcg5uO8/9uOL6LgXAc1xg+yqFKLqBrC
         3Y3i3eeJ9NFg2Ptm4Q7IC/OTcMr/THvf3zbcqASVJnzZyXTfC9k7r9hUHRPBun1I37mF
         kglAfX2oDZzzk1S33vhH4trBnNHxyD2Vc+s3lurSKfo4HTZG+VymaY1AEVFAAYWLMNh7
         9PoV32GUeBv5aDx/Scmv3XMFT8bSwYF0GccOJ08hYtJ1IoBzXmj/xi/RpVwOtVR3av3Q
         xLJdIOu/3SlVJYi2J/5WVOxNf7YN/0/gWLUQ2oL46cjAI2gudR+l1i50btMYZ41tbIfn
         BtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        fh=R+ncv4wHfqXyYTCQ4p0qb2cndDrIao80CN+zGEZzAAg=;
        b=lENh/y59KoHOC1sFYRGKygYlBlKvt6FqkAOVhhOx3ayAd0/YMYRFHHXxy4PUneZajz
         K/EyCKVAuA810TLtS2rapSAVU/BQt7NSjzdSm6RLVV32sPoRfg+1TKGadIyL0IdJwjQB
         RN0nRL8avdeqwUIuUcUO2f9x7gJ5BkDbxf0sP2jswOjwVI1iF1Now8mVgP8I38YBOutZ
         2KLOOj0nERK4mXvDRqOEqWLki3ioVmTI1ifjekgH7SWrVGmAcSXwn0U3TqFR3/ucQCV8
         wqeYMRJ34xoBB/z5xozVVL7eGTdt/Q0179HUQjXlsjqaXEGwQbU/AbbPod4DFy36/J6z
         riwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753700; x=1791358500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=QOfFfqJE44gEacuFIuNWStyD5onsRGHGxwx7qtjYYMax58VZC/aVsh5UICjzAjvfdu
         lWgZfKq3KWTAJ9ucQIxTl/EaHBogKcJgutjZBhcDFJ47tFZIiChAyGMyQNyo0CdkMIDb
         7wZjU4kNvPBAl0gHT5dR5XRHjzgBT3I5jgvCm37YsS+PKP8+kSsUNQWEjJYaID3NYZZ0
         Y5fpf7gJ2leVJru70rl+Jluq2EYxM9VXPuOorAI1oW/ZiVndCVQNu41yHTQkoXFx5Dzx
         9S7x56btwXHdshBTATDzBJ2n6S1K+1wDc2O7lj43H/N6AFgYKMlGyP3DqLTfMnsvr7zd
         NUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753700; x=1791358500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=MWje5hp3B7n7n+re7vulrn7LgSf8vPMO3V234Ah8f4UpIGZ+o8ZU24rsv3MCW95VK1
         vIGmnJe71R/8run1ySMd9u4p5izGSTDupmc6muFICAGB0qbIk5Z7awRW8Pt56HVbB3Bw
         T6+wJ+joNc9PNHOZ4gv1sB3vdoeR1bPraNAcHLnN4gf9R1jVh5TvfHV5tKYT7gjQkDKK
         w/5T8OPTm8f2AOsIXov1HWtr1n8oo2qxxMJb2PhtsH+bZLg26UT1FmK3cPmay5HhQK0x
         ETsJqM/JWKrHidra7zDwGa/UAsv3GTdDlWTjCxX7A3aud9jeaL8HRRVW15hPcaW5wPnp
         9kuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEQYMD6zmzMC//+JeZZd14u5TmjFeiIz40Ka4e4r/O9NCBrKNKao9fTeNHQTyJnxssaXg/BvJk6uvx@vger.kernel.org
X-Gm-Message-State: AFq9FYJIgrlQBvd19TIVHiSu8c/HBCaCmWFtdHBea/OVMJ1Bzm210mVE
	V8g7RqFTqGyHeLi2rerEjQa6GWH2ICYofhmpyQ00uDI4MqvezVgyyK3nXP13IDLbWJzf6ZWxjHX
	SOlsymGfZ0pyfTvofwohOCzYC6e+Dt8E=
X-Gm-Gg: AYBFou2xINuy6LqY6j5zBnC6HER4LoQtA+0Tf1WPSLK8j46LwLtd7h4g5p/CMVcyBab
	6LswP5yb2t//9jZCl7c+wbrEm2/PDTTgsmn21SavUafi9tnqOwTnJjSmPz5JmhqDL4nqin6Iizj
	4WRxHbee5xifusoAAseLn5OpfHsq6SNclpY5dABRFEoqsiq0ggPLjLat8tCyWyQNmA2dSxqvG6f
	hhbRLi832CyJetHmfpBzcqntN0S9V6fqQZ5RMhLFb2gMxHGXTU9jBq3cnsb2WuWqtGafhAEErkS
	UO5G+p0Ah3hGhvWNEARie7wZR3TZ+jBRQFa0ZUecPjN8uT+uoggO4HI=
X-Received: by 2002:a05:690e:400c:b0:675:7032:8062 with SMTP id
 956f58d0204a3-67683474481mr300251d50.44.1790753700150; Wed, 30 Sep 2026
 00:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929120227.1791356-1-jberring@redhat.com>
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 30 Sep 2026 09:34:48 +0200
X-Gm-Features: AclHuK_3trlIGgLtvQDHQQi_YWTxQaLNnpU_H3rtwKQgUONqn5KgGLq9lRZ6SJ0
Message-ID: <CABdCQ=PvdfX+ZwF1VbQR+LSh0ZwhP4T8zSb-8+Wh4Y=L67LjUA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on
 OrangePi RV2
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mar, 29 sept 2026 a las 14:10, Jennifer Berringer
(<jberring@redhat.com>) escribi=C3=B3:
>
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
>
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board devic=
e tree")
> Tested-by: Vincent Legoll <legoll@online.fr>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> ---
> Changes in v2:
> - Collect tags
> - Rebase onto spacemit/dt-for-next
>
> Link to v1: https://lore.kernel.org/spacemit/20260520111150.3300707-1-jbe=
rring@redhat.com/
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 0cf60d1985604..d8b2cace4e7a3 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -25,7 +25,7 @@ aliases {
>         };
>
>         chosen {
> -               stdout-path =3D "serial0";
> +               stdout-path =3D "serial0:115200n8";
>         };
>
>         leds {
>
> base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
> --
> 2.55.0
>
>

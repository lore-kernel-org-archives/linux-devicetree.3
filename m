Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356A843CEF5
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128022; cv=pass; b=A3NtFJDmYrXaOEA5owXIzjnDDEHq0DaPyorPgrcrxXFknMwVvhnmL064IpqJu4Q0GItdi1aXfhIYotYAEUZYgknmFJstJmw4kyfxcWx+jnWebvIkQ1xV34y61npf8WHzVVCW8xCLSwvfJbiod+T4mrxy1IejMbjimer+09UBmzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128022; c=relaxed/simple;
	bh=3SyHymAnrjlvPO2mb9pb0A4ZCmnI2yTAOAi1u/9obmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StexulJ3c5q9QDXyyltRxnWJfdGNH7HyTw/MdInCWpQiA1viTKPCd73cFNvrVkgDOhOsgYLZkVOaG+vUUOJsis53QOhJUy/VknkQOll+joihPWjTO6ht5Mxwh3YBxQFrcqm5+dSMYsaSGZq/tHChiiHhwuu1/SXhApcydfqHFJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsjxNPWK; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsjxNPWK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so265779a91.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128018; cv=none;
        d=google.com; s=arc-20260327;
        b=HzjLWBBI3LE9SLsZs/S8Mm8VEN5H+xtzd7q8ECHKCzrmr1NtSwRig6sniMv9bMseWB
         OWHkkqrpaaNso2OdLAaCnNi658akl/Lgk9V/6ToJgPVu1KBCYIhyEyQ4j2UlFtx9UZIO
         BQT/amEpzkfghRJYciMF0c/jlYlUg+Nro2V5QXjHAu8T5eABM5pQiroK2ymr+FG9GZ7l
         SQ9NiGyzuUxiTM3tmDvb2rS3hGHzAvzKkfD8LTOfRzB12rBec7qN/jmJ1pFt0t1XWDLu
         rQkvdvvO8biNNOY24H84NCxprhZOmiNKGGsiozAvUAIBcO+O0gGEQ/GgL8NXFmqeTFDZ
         rb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        fh=D43nIITBLs9DfPNjiOy49Xc9PnLQZiPsFS+6o9M4adg=;
        b=ZOwivXiNRod3lyYIaDU7cmei57/xH+i7YoFtx4gFEmavBogNmBZs95EgoJjNUcNhaR
         xJOt5vk0dBRNhT1uSoIZCohIBFU4joWrWoa4VafhHg+0Ap9oWhS8CfrMYYLJGDSKb4Ob
         WtHX1YrlDMotMBf9Ku1V5yd3y7cWFVCo8WLtUlsIBoieOaIJoz/85e9DYejyAaikQ402
         RRsh/wUXhOyra+c2DOdGRxFXXFLXe0035AW8jVWr0rGl4vKVV2RzutzFMLUMfpVl2LNQ
         VCga6tMMecUur35tD35FIE7yJMQiKQhnLYRz5MEGNgX9GXLXD4Ms6IY0P8I4gIx9aN2D
         7Zdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128018; x=1789732818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=XsjxNPWKVU+SEBQ4ttILvNxW1KOKWAyxwUkq4ow+OPnVU8LDga3zj55RaGYg8ikKXB
         pgG5rYGLaEi88C33CMbFLS4X7GO2lfDXcFTGeJ5q/dvM5QMooREgH7dm1vMCmzF6wWLf
         6/tBMFihkrnnaTn0lILpm3orBG+z/tHpZj+7NajSMUWhA0TJgbPnBVT+BB67vAVCtxzs
         UtlPpBYods1rLXxvo+ws+5v5KbiQW4mc8iurg91vXm6Gtr2JBsRbAvdK7QLWCpBuK++d
         9K9vy5O2Od/WRtoCyL/tWdSvu6M8yW3HmKFXmINI6GNm3zdf2zfkZZQpti1V9b4N0woN
         US7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128018; x=1789732818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=hmLUBHPsMzkR/VgINsLq/K5j354KAHbPNjRUGi5mwOXs2cROi/1N2HoB0Zg20Ro5Xj
         XGY0oQpAz9sOQg8hsjzwwCCuV4BVyWDnnsK+lJPfNBJY5ybTQSxemxLqDqCQO/FxRstl
         nB9TlBdocGlH4QT/+SE9rEvW93XxeVqjimpmU6LQSLrFKpKKTCkUBrWVoCh9hcsyYH7G
         1SPLp10/WV++eRSNLqkl5c6TjdYQnq6S8q+7Al8UZ3vyqUnbN4mD2WKzOEOSjI04DfzW
         uobarFjdCFAX0matGmHzIPvppHTn5rjHDTDi1CsFB54TAu8sytE/XwFxcjM0s9XBM6cA
         WRRA==
X-Forwarded-Encrypted: i=1; AKwUvBwkSzdzut1mJf4vfuxpQQ4ME18IRtNcUVRFxD6YzQqcACIWuObhaiDs01tMoFInmx0XwB+hY1wgci69@vger.kernel.org
X-Gm-Message-State: AFuF++lRhSl8Jfj4BZvV5lbl1BnwMVB3Tce8RTD+dt+r5asBGW7tle6y
	wDGmzKA46CWQYLJB/hfxKTbKZgqHCXcY944f3d9mL5vSy+algt9JwgYrsYzdMq9+Q5PGGviIbQJ
	1uB3nJHgR2oEaB6j/VeIRze7ajQ51Lc0=
X-Gm-Gg: AYBFou2qgB8n/Eh+TobHDjUueebaJR2K583rPxdoG7iplWrRcun0/41dyZrGR1eGNB3
	07XqxjAfDIgeqoiDH8bd9tgMSaY3K2YYBk1PzB4priTitQArFFkVSVnP0ZbuvfQgfakiwEO3ap1
	9xj97INQUkOlH8XryUGcNCSfKS/AGSjthXWkpIkhPiZadoy72JaWw0VrNpaHWxVoeP0Y4YcqCGG
	/+YlhITgUkLbolfTYdPR7h7r3h7YHr5BQvaS4PZcTg31VlpsrM+oVBovEph+V+bll8EBmYQt8WT
	d/GITcunCKKUiY7itSjwnCYX1YSdixEbrtz2KVvtLC1XKuY0WhlRejwhH0irsh37Qss0MGNLUVU
	I7kDd6BhMQllAfx83ykQybGZKDlJrHWhhvm8358o7ohpnq/vFTIEZnp3936a+1Lcy7L4=
X-Received: by 2002:a17:90b:5108:b0:38f:657:6823 with SMTP id
 98e67ed59e1d1-39d97f392d3mr3889515a91.8.1789128018117; Fri, 11 Sep 2026
 05:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Fri, 11 Sep 2026 09:00:01 -0300
X-Gm-Features: AcwNN1UryKTs1Lw-KY6R7BmulMcgHb-91PJOnn7PiBP850ZNAVItrIcXBzp-x6o
Message-ID: <CAK+owog22cPgYj9muDUJXcTx+k9eBmPz1jfi8D9cx3H-xo1mKQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>, 
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Beleswar Padhi <b-padhi@ti.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Sebin Francis <sebin.francis@ti.com>, 
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:40=E2=80=AFAM Markus Schneider-Pargmann (TI)
<msp@baylibre.com> wrote:
>
> The wkup_r5fss0_core0_memory_region was reserved with
> 0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62P defines the DM code/data DDR footprint differently:
>
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN =3D 0x9CAA5000 LENGTH =3D 0x1B63=
000
>
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
>
>     0x9e608000 - 0x9c900000 =3D 0x1d08000
>
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/ex=
amples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti=
-arm-clang/linker.cmd
> Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-A=
M62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> index 8a8dec80cb30..3d1a2c5bc464 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c8=
00000 {
>
>                 wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>                         compatible =3D "shared-dma-pool";
> -                       reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +                       reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
>                         no-map;
>                 };
>
>
> --
> 2.55.0
>

Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>

Thanks!

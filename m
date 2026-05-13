Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8250A39B491
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672655; cv=none; b=bnEOPT4LIoVBRJasjZcZneq5oguIF5AdIMsB4ftxhjpyZEJ24OV+0dWUZDvLqW7I4i0XFxHXCQSf8X00D1eXSPilvBgnjmoR04X+CBlQ4s88S3KEWKZtg747HDigxbg3mHbCOgasEuNCmPh4BL+46rxP35tWfvYFCt6os69AdUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672655; c=relaxed/simple;
	bh=1a+V7SN5Ad1tvDfgTgTwhX+lul4htUJKibU3Otb53LQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BWOgkp+OlB6JVsAN2fAepjSUKx2/V5cg8d/OIPCtpmx0BgQd3/OJD6g71fkqbJ9RV0QzhIFhpHvc/7esxXKixJPan855K8YRsmhMW5DcxLvbwt31ou9yO2NyFhtlxWC/qesyau0jLCUqqTDfsSPZLvNjq6xvsxRNyIAF26ZthJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEq1hdHh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEq1hdHh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba4efedbeaso46928055ad.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778672652; x=1779277452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qYAcfX5TZQ1aO/tUlnMIN+1pF6qLETPLwxG8ZHIUVfI=;
        b=gEq1hdHhXaN9hfUHDRC7spe2P68YK/n731u3tq7uWrGdzINNnmUDOW8Oh9KoWScOJQ
         DN+ORe3jW3HsyQaZlizJ061yElkn9LWzIsSBZXdnsVWC//Z4qEac0uH3WC7WtQt/r6Lp
         LpJbgi/L7q30rhoCdMLKlMEArpOvB3gabBHhgdz7oLPiDlUXRwVYuIgNL96jLwq6F+s7
         V0LzfBYxepKqOYbH7jtH0yybby9sEZnliRKesNpyzUdmDLqSxybjHEGu5z6TA4izw8ag
         KJjuiM5FQBkGf9fvN5lPrNRGAsfzfPNAVXIOiZxizw0YMfntq/c89OBKQfIN7XwvTy4U
         FTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672652; x=1779277452;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYAcfX5TZQ1aO/tUlnMIN+1pF6qLETPLwxG8ZHIUVfI=;
        b=i+pS3h3OVO3bYodkRJgm1Dc3xNmA1fNKXw6tqq2bacTUV+JHVQ1mnh9JiWDsHRpO1S
         T9Qi8WbKSZFbzVAaEIiFEU2OzG2oaP4tBYD8COUHAO3OCWRDWdAT1ZnEkjsMHrUf5a7Q
         tNQXZP511auPzxBL6DxiNopeoHXNGaR36DI4WbtrJOcUlxWwON1M8eyI6MB9QCClAbjW
         rHqj9XMqa/JpgrSjrxRt1wwrOTb0Q88xszUB86I262q68y+BIsXsbcxJT0b2t9sk5xxW
         efshmnouqIFuAGB8LKkWNsbXy0Cj1srDoTKVgPv1LLt0GWKPXTKrMc3G39wd97LKrIK/
         noyA==
X-Forwarded-Encrypted: i=1; AFNElJ8FXfyGpo+vQ6s74oXBpFlP2XiGspI3G+8E02yQVhBSCRr1MGTgQwOHrPtpXdLK4U7waRsXZTcshX8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IUItR0e/NEJcyURYnZrX+blawBeOYRW6+VtR1O3Y1t5iYR2i
	nr/cBI45dy7xuMLBvf08XCwB+PdWlSv53mMIOluaug7ezrOhSSQypcBo
X-Gm-Gg: Acq92OHYRLQo8lfku8104OEnDMloWsd1cob7Ro3oQY8T9vi5QCmEDkQ/HHn8jOR1WNY
	mi0zIavLWf5LFiOHxBOKVa7TBMjAaRWcqJ8MKSBmhSRTAEqMxbzI8iVfObpY327ZySD9xS7zyW7
	VigiKOG6bsoeUr5wmrfqc+cybcQA4BCK2Y9vvEBPUgx8E1td/wkrOriEhtixzwajExyGLty0pCO
	XmOy54K+hMAdKMYIasUDkHwDThGNwePEh9Rp+BQI/LnFPK7Rhn0yJSKPvYKBp2M5+H27aPryA+a
	jX7VCmJgAefnl9Mvbv2+OJFAoDuVLW4upuY7eXocVQZFoShe1HpCN6K1MJgmCz2QM6oBzvcvFHa
	PJzB0OIXPqRLHa4uLPdOpZ/pGxAAWuO0sUpOj+ytt3mlEJCMBpDhk2q7859Bx+Xp2GCcG0MQkn8
	s9UWFrgkhPtn6+rVK+U2eFQtopB3mNfSgNyg40cjqG74A3sT4=
X-Received: by 2002:a17:903:9ce:b0:2bd:56c:97ad with SMTP id d9443c01a7336-2bd2ec5abd3mr25711825ad.0.1778672651705;
        Wed, 13 May 2026 04:44:11 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:ac0f:c362:ceaf:f4a4:19f1:7e92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm204870005ad.36.2026.05.13.04.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:44:11 -0700 (PDT)
Date: Wed, 13 May 2026 17:14:05 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maksim Kiselev <bigunclemax@gmail.com>
CC: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
User-Agent: Thunderbird for Android
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl> <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
Message-ID: <A7772824-E704-4BFD-A796-BCD81197E5A2@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 13 May 2026 10:29:43=E2=80=AFam IST, Michal Piekos <michal=2Epiekos@mmp=
systems=2Epl> wrote:
>A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
>clock and module clock=2E
>
>Change driver to enable all clocks=2E
>
>Signed-off-by: Michal Piekos <michal=2Epiekos@mmpsystems=2Epl>
>---
> drivers/iio/adc/sun20i-gpadc-iio=2Ec | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/iio/adc/sun20i-gpadc-iio=2Ec b/drivers/iio/adc/sun20=
i-gpadc-iio=2Ec
>index 861c14da75ad=2E=2E3f1f07b3a385 100644
>--- a/drivers/iio/adc/sun20i-gpadc-iio=2Ec
>+++ b/drivers/iio/adc/sun20i-gpadc-iio=2Ec
>@@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_device =
*pdev)
> 	struct iio_dev *indio_dev;
> 	struct sun20i_gpadc_iio *info;
> 	struct reset_control *rst;
>-	struct clk *clk;
>+	struct clk_bulk_data *clks;
> 	int irq;
> 	int ret;
>=20
>@@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_device=
 *pdev)
> 	if (IS_ERR(info->regs))
> 		return PTR_ERR(info->regs);
>=20
>-	clk =3D devm_clk_get_enabled(dev, NULL);
>-	if (IS_ERR(clk))
>-		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n"=
);
>+	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
>+	if (ret <=3D 0)

Thank you Michal for the change=2E

Have you validated the changes ?
It looks while success ret would be 0 and it would give return error=2E

Thanks, Sanjay


>+		return dev_err_probe(
>+			dev, ret,
>+			"failed to enable clocks or no clocks defined\n");
>=20
> 	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> 	if (IS_ERR(rst))
>@@ -243,6 +245,7 @@ static int sun20i_gpadc_probe(struct platform_device =
*pdev)
>=20
> static const struct of_device_id sun20i_gpadc_of_id[] =3D {
> 	{ =2Ecompatible =3D "allwinner,sun20i-d1-gpadc" },
>+	{ =2Ecompatible =3D "allwinner,sun55i-a523-gpadc" },
> 	{ }
> };
> MODULE_DEVICE_TABLE(of, sun20i_gpadc_of_id);
>

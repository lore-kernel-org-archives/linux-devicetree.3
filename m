Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6E25333F
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922413; cv=none; b=TbO3DqhvvjFcVy2LRkV/iImS1IbCEwLnOkJo9PyFz3PtTiflK74dQP6RA0pURNNEiW/h+bVUVCF0Nw6w9CVWFBJ7sgy9Yiy9bDlZfBGOi0MYdEH8IoRNCt237vHeWfVJfClmRRmGWYuknCe4pil/cBRm4HXXjA5tOPxZu7kU1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922413; c=relaxed/simple;
	bh=9HEjywerj9dI1DMv8TmODXVCvgIjH29ELxBcAtzoHqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tjJZHwgKUSe2XkOvyFGziDVGs8YBdj+gYpgdLrprexCGHZ4DfNvgqRrLBMtl1KmcQx9CDi5IwpwdsQeGNpUhDjP8ESRHHautjP9s4d1fsKgq+sSnv1Cbkk3gMKK3sQxKl0pXnBsEZsbUe+6lJmRXeToDNPgOK1AX4VMtoduucHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nv+FsJm2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nv+FsJm2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so6889025e9.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787922409; x=1788527209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=nv+FsJm2Xny0Kz2h5URMPSe+TQtqERGUG3F/y2he0ggZJClP1DOkIb20WnsmG9lxl6
         UZ0kCMBQmk88yz/ijX/7GYgZIEOCXisRbpWGCDF/TT8c+ksWVzz0iqbjRGbkjdg5PQ3l
         AfjSSO88PRIr7dPa9flydD5M0JF+5c+lTpx63DC3eW411nscK3BcpFp9fa0t6AWpfOqQ
         AkcXACFHLTCiEcWq0Tc6eUtaA+8DgpENaiQKUBsKSPY9EVEnVqAtjtlUpWgxAnKxq6ER
         9VzwcoJqkVlXOfSMwW+5ZnOwLd5DoHKzIowr5U6sTC/xVzWZmes9EfJBUv3xG1pEDMuQ
         pIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922409; x=1788527209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=iw6p4u7vOf83jZjnta+uIytf+A0U7gZV7+FBbhtQ24jr59JW/4K2u7XvCw5OYthwOx
         Z7Q0yyTD6QB0VwtiVUerdSwAstt4mwWIVkw9NPlFoY4FhrXxAEEVNWFKW80zqat57sMc
         7CrhueczW0zHow9qGtCgsYpDzxFai+0Yy5LmDWWCPDheaT9MOxZB8eXbtYahdj+AG4nV
         2mS6jVkoSrrJTF3u6v2ws5Z50WtooBuuLpr1mrntug6lP1jAhpNuBdbZaGKUDBfS/m/8
         tW73TEZsMr8QZuMBqv4z0PPyAH6flU3oSIIo+EwWIb+YqXP/L8PPOc5x4IoSKyudYFb6
         nt7g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4liVr318ZuVe1XP0LhWXPs/HO4oD4AYerVUFxGCzgJqg5oESwscWkeR6VwEsT60bX9sIux0vwCA1e@vger.kernel.org
X-Gm-Message-State: AFuF++k6sPWyZklJ8WXegE2P78UEWtiEfsDtunnWWvxWgQ6b/Dn994FA
	YMWwciaMSF8VD8L4xcQ730y6IFWUZ7joa1m6Obk+A/Tt6SpMKMxU4FrG
X-Gm-Gg: AR+sD12z+WOju0xsSjeBhkRnyIZCfp2c7RfJGxE03cH6cWdUMkWmsFrzUf3LlHJxV75
	eykmlR7YVxr6EVGkOfRR20Ru3TR8+dCmit0dk3dlxHYzqXu6c+kYAJDsmbFAzoX3k4VO/nZWtuq
	cx58DWO6VIuObckXfsgOZ24IjdyAbFdBMjYeLW7+VGj3oVi8fj/1VPUbHj/tdLcMncz/gWsaaSi
	wyCa0Vmf390bw/Gkggaevb6ddxJEByHw2kRGvMCm2M9z1I81mGlytjnhVeCpn+icwbHJQR5cDFf
	GoA5InRBm/DaB5ClmigHPkP6Vq3Hos+U783beg/YInzur/kQC8vOxA4/8tyKuXzFQPm78cyK3sa
	m3oVSrhR1iLRfbNwURQ45eZ7Pwc1pIodORu8fyhH4deYyBNI25QbX3U2EqIz6i+6P8KSuUX6jF9
	fW05apm2O9EEhgeXPU8c+/PIXzUnft+uK/AU5v8C41OSoH4WaT3Rzrvv3Fhl7m4cTKVsPw0VhBe
	ibQdEq9cCvr51O2RNEdEi/8VFMycq3YGPvJpNz5bnBj9CcHPwQLUuffdib1VMBlcnFgVwxf3Bpg
	d9lg+EKoj0eIa/ZWUDSxkwlP2o7tw0ya/4fi2djzU53WdAcSku4CVuSrmwEssDDRLWBKnc9gNUb
	aVX9B18iLBjKmLdVAc8pcl5bmn9uDsysX5lS1/ItZpRoJs1xmJGKLb1hompotZu3CGu0uwVw=
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr97741555e9.5.1787922408578;
        Fri, 28 Aug 2026 06:06:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm53999285e9.11.2026.08.28.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:06:47 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:06:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 0/2] iio: adc: Add Axiado SARADC driver
Message-ID: <20260828150644.00005d5c@gmail.com>
In-Reply-To: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
References: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 05:28:27 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> This series adds support for the SAR ADC controller found on Axiado
> AX3000 and AX3005 SoCs.
> 
> A new driver is needed because this SAR ADC controller is a SoC-specific
> hardware block used on Axiado SoCs. It has its own register layout,
> channel enable handling, conversion control, and data readout sequence,
> and it does not match any existing upstream IIO ADC driver.
> 
> AX3000 provides sixteen input channels, while AX3005 provides eight
> input channels. The driver uses SoC match data to select the number of
> available channels for each compatible.
> 
> The driver supports single-shot voltage reads through the IIO subsystem
> and uses the reference voltage regulator for scale calculation.
> 
> The datasheet is not publicly available. Public high-level product
> information is available at:
> 
>   https://axiado.com/products/#AX3080
> 
> The register definitions and programming sequence used by this driver
> are based on Axiado internal SoC documentation.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---

You didn't have to send a new version, Jonathan tweaked the commit and
applied it:

https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=839dc31a0c6508354b18d09a9e5aa5d8f4c05860
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=205f4aeaae3148848c153a0d98a6f604b39aba7c

-- 
Kind regards,
Joshua Crofts

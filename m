Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FE1420478
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120575; cv=none; b=Xbth0FuMcDfTWLAKLTrWK+4nezhgX21r328qNCzQBMOyLfkRcFwV295mgjQuLzEve0eIdCyfuUqyBc2YUU0e6Zo8FiDAbXqrBcawjDe7J2gkenwdkbfXIDF1jiCMR9/UHVC3XMoVqqXZlH8slfp/7S2tD4s/VeouVoLWuRyA6IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120575; c=relaxed/simple;
	bh=N6LMn7MiHopKnkA5J0zJufKQOBomiCLsVyYHDoryQig=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LN6pO79I3dm+xaJFOdte3JXf7zHcWYOd6Z9/oFNmmVZjmXZZU8OObcipZpzqQbk5yoqxZxAz6yZDaPtz/tj+RTKUOKBoUXhWwsKDCgldKYjpEm4ckJ6DRgzaxkZdEk5Iq7xS9UvHQZAfnFxRElmvHd07r5yr4AGhtvqdzq/Y0U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qskU76sR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qskU76sR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso32536505e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784120572; x=1784725372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFKJnPmVhYGXGMLsUKcHXY8gMyHNPu+ws0DPBz7tk5w=;
        b=qskU76sR6uy5ICQPo8G72/iavH0pxao0P6LeXHLBaPhItLlp0ZJ7gMdQ6E/+ZDQPmm
         YqS2JJlm2h5ZDUwdiDetqrSS6E90zAL84AUnBucIx21RgzHyZWj0ItEIfWtndJOB3pJH
         scQrq53XhDBxFcytcKLVp6M7MMEGMC6w9mL0r7RcUs7v2Wmp8zMdZ2G4uYpZyrMGNpl0
         eyr3V8t8tkP7qrBNII+zTCHBW8olgxX5SUVEn8/q63ZUrWlNjtLfHE6mt7Mbaazn8Epr
         AXvps0dxN1yJXT7+nnEG0dOYQoNSQswPkQtpBmw8RmZ2RBqnAKUcP0TOjqluCwlClGqa
         zXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120572; x=1784725372;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFKJnPmVhYGXGMLsUKcHXY8gMyHNPu+ws0DPBz7tk5w=;
        b=JPWO4qYY2mZ+yIOenCZhVrdSwpCwAAPPGVuLG1Ctp3m+ddAmiG75joKTBh8sDPDOHJ
         /taUbgSn84N1qv60g40UFqH1Hfv8yrRMQNFfhcdkTnxZDM2SrxFE6G+nF4H4H3X/qyGF
         PRq186RUgzzYjD22TOQDFy9EbSU4uqvzBEt3UVffGEZ8wL/gAh2IvdpP30XetiJrrFnA
         marEV1LOSacK9HAHFcTV2jB+T7XVDH/lHz+EFx00JZkiGTYCPfKEtxD1vte60r+wuSBi
         6wxEyfgeu5SXNkENBu6TmBF0krG6XI2LCYUq07f6pTnxdsWGCa6QKDnmhR5iRal+aSkS
         tZWw==
X-Forwarded-Encrypted: i=1; AHgh+RpMd0JfIO/IgJTMPwep74DPmgx7rhwnczowCpWSUV1i66vhVjmf4050Y8bDn/dZu9y7xzzw8J5VKoO3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2obc4U+8aA/oWEnQDvoj/DJkP5pB4MMrCvr294nd9I47+j0m
	2HeUnmVU9POfbH4oDSfJHjW9NxQF8wEFUmKHO6eZKN6TJbBkIPZsaEol
X-Gm-Gg: AfdE7ck1oonqe6CAOUXUrDoQxon9KgrvdsW7W8Q54UFa3njit9ljzboi1n8HZUhDpbf
	JxHKEFOgglRyYTbIdiYAl53wQYtoVdAOszn6a1ZLfDVCsWhVjOFRlqZFzkKnhJBk+W3Cwf8u70v
	Yy6yp34hCPjf/0Svgu+Prani16tuS7wdTarGBxzxXL9YkAwFf9+pPrDCLq7sYGNmWlOtH7DVeE/
	lt8YltkMe2NvWxR86++7JOsaD6Elgo26BjDWXXiCiIcWi/molr6eMIBBaeoUj03RwlZpn8qsB5q
	xJFJnkKsWWo3zfsLCjBoMNixJK9xptPkS2+iFXLPvVghKX1MWTQHJjcjpMoXDDV9uX0W3niEq3i
	D66vvTFaxvlrkYokthEjgYe7Qffhmd2XKnae5oqIJ9shdkgy3Ntss5rAw7WrypqxNNe+6MTXvDM
	fE2w63taTh0+L63hYLmUJmbuF0DzVLmcENM//gWM7OijtfwI0Kkaf9ef2/QngYTpfwvDY1/5h18
	0a47wAmCmsGEeDYfgF7qzEWrpSWFHL+V9SlO4MqfBTdfkyWGfru4JGw/ykM+RGTNjSFRTEu2ya2
	jX/YGWTLJ+Lxj3XtR0+s5WorkeoeKbMO0PzArsBD5puWmZTUbzXeald/WaeGt1ecCufdPWp9LsH
	EbSykiekB98dR3cqZgg8ns2s=
X-Received: by 2002:a05:600c:64c5:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-49539824f8amr62710375e9.21.1784120572059;
        Wed, 15 Jul 2026 06:02:52 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm219530045e9.12.2026.07.15.06.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:02:51 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:02:50 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: accel: mma8452: Optimize struct mm8452_data
 member orders
Message-ID: <20260715150250.00002307@gmail.com>
In-Reply-To: <20260715-mma8452-open-drain-v2-3-95be9f5f4795@geanix.com>
References: <20260715-mma8452-open-drain-v2-0-95be9f5f4795@geanix.com>
	<20260715-mma8452-open-drain-v2-3-95be9f5f4795@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 14:33:29 +0200
Esben Haabendal <esben@geanix.com> wrote:

> Reorder struct mma8452_data members to avoid holes.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/accel/mma8452.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index fdf7364d7fed..537263085215 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -108,11 +108,7 @@ struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;
>  	struct iio_mount_matrix orientation;
> -	u8 ctrl_reg1;
> -	u8 data_cfg;
> -	bool open_drain;
>  	const struct mma_chip_info *chip_info;
> -	int sleep_val;
>  	struct regulator *vdd_reg;
>  	struct regulator *vddio_reg;
>  
> @@ -121,6 +117,11 @@ struct mma8452_data {
>  		__be16 channels[3];
>  		aligned_s64 ts;
>  	} buffer;
> +
> +	int sleep_val;
> +	u8 ctrl_reg1;
> +	u8 data_cfg;
> +	bool open_drain;
>  };
>  
>   /**
> 

LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD

Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078F384CFE
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106054; cv=none; b=Tx8mEiAGyD9eEK3CCaixDkpFwxV1Z2HQNZAM6TmV1KrpkI81eBFVDaiHPAf9lsk9jFcG69a/TTgZEtBxdojHnCGk+KR/m9VLXN/3VlaFkf7+visFaEhWqzBInHbXL/tzCXYAa294J4pgJvzAPHg9Wk/g2EeAhWya+DPQ8ww5Dr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106054; c=relaxed/simple;
	bh=oeOPqOOHX4vx7wNAoVD/Owj8kJ4/yJGKi9yRp2ITc1w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZUTjWtMIXbbseTbu6yReSeGoQTxFBWp9pi1M868Lmck1xL3IX108oEuwCReQc7Gej4fdkC5xZBIDUS/RNNHsSaN8iosQ2zRT1J7CDoOJW5eTMvYa6hVAW9B+RJXKh2ihYaXT4/wSuticJsdDF575Z8Tf0DoNbAddGRrncEKV3MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRnIy1Os; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRnIy1Os"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2825407f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784106048; x=1784710848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVH1oge+oUXjz7fA2PBFdWN8ikRwkxQ+DXDLXhR5jCc=;
        b=RRnIy1OsV3arEGLXhqfR4/ih6kB3MSCZBooSSe1uM8iOMSW5dmSLF/8lZzMTbG5ZJW
         XN96D3NhQGXOGY6Yr3rYaiSugE6r2KXlLjspuwYtVuTXlZMHw7CSkPw1eYl31+hogFgq
         K64ZgRz/5GgkS9/KKZrOlglPh5MaZJS4nw3xSy0b50bu8sfQ0DG704vaFN9+sYhyW0qF
         5FngJc1ldmX3vhjFf2OGsE2W8mWi01Qy9RrlIQTUtM2+8KulOL/Wx4vv8noNQL5f1dIJ
         a34PP6zSu/GBn1tedi4O4abvQStmPjHM6PsB7S8GkmSPnRIgWddDRpuZ45jcordgFap8
         DVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106048; x=1784710848;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVH1oge+oUXjz7fA2PBFdWN8ikRwkxQ+DXDLXhR5jCc=;
        b=q2hNFjCdxtCKmw9WpYTJdiAhdbh1OrA1rAGwe8Npa/FZxqeLOcbGf+BOCz8Nv60lBq
         DXSPWq9aXzbjCljf0cC0btBddnR+KRm6LC1lc+j9Ra5QH1qHfX2wuM6NY9tKTZBg22Fa
         TQVFR3oCoQ5oDuUZ1m8Lbk1pW5TKcWpOl+vL1HarLHqJjYkLTRr0BSjN05NC5P/tmbXR
         yD3k1yyw1897ERu6NCtR18oA3Svq/6/WYWmiLX+3nN2V2naRcfLrIlDyzQDTHaG62IgH
         CkSlp12tvffTahmlDRocWZdc6P6cxB9yF5Hq3CpkRVTcb1OATDDoUmvFQ99uV9Vhb0Zd
         Gf+A==
X-Forwarded-Encrypted: i=1; AHgh+RrTH+4OqIlSklnijRN4IGaE9tyrHNv1v9qd4Ac0mmgP7knY9gnaFH41w58Pq4M9o0TVkWvi9EgLbuaC@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTEDQhdNGPnZUnyH1e0WTRziKtK9m8yf4tQpiK1Fe2sW6DTiZ
	GwKebrnCnG18U/eLKTqeorKwTWA3WoviZ9aA2mBtGHDadut83VJJeCd/
X-Gm-Gg: AfdE7cmD/L75YgkDao6z8R+hFv9VOXKCMBp2tJVbKfjeF/O9e1b+4fLF0Ee4K2wGnZE
	9qBBA/nK+LKPzBhP+ai6497FqCXsUJee1gu/b2ZChQDH+QdAJ9C7855SXu+UJt7CT4NU6bgQ14d
	STaC14RVpQheboR0JzoCSwNkD+dFGwESl8EhgFFhSLGtBtl1C1gLtW54Ahs9MkdHqz5ibCtbF90
	3xZrmUFwMGa92iMmXPSicMkC/vtFexPr6zwuFwIEoQX5NlwIacxPMzAY499VjMGatWI4aR6creu
	KhJN8zoEzPtzgTRYvYJzdhRdd2uo5H+0ARL2Qg3+gYhl7w84fhjqX3HhQhQ5G52Ez7XVlmC8wop
	cMBhN13kWL2VLK/Gx+6pjFRUvOCM3+byWR1hRXBYLKR2EYnfB4vo6bVYGQlhYTxj/WOxVb5P2jw
	q3H1p6Gi/AGeXi1UhsNI6R/DJ9aLzmP7pY5gS+4gIcyz9cu0VicIo0HMEe04mI7MDBLP2haB6Sc
	OPrS9EG6zNd/2MeHLd6fvHwYwjwrQ4nm0zKlvHQ2bid/TAsFGK6GnoTp+TTwsDJBqTR1IZicK0t
	n3B4g+8MD/uUR3L79Yo44YGj4WZAZH4KKw7VLYMtOUbZcmV2j5GOnmswHdGxpm6bkJqFlCzatZC
	4Yh493qJkyh2hfo0FCorfZ+k=
X-Received: by 2002:a05:6000:2086:b0:46f:7d90:8114 with SMTP id ffacd0b85a97d-47f4fcb5992mr1968563f8f.14.1784106048085;
        Wed, 15 Jul 2026 02:00:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635c86csm14503414f8f.16.2026.07.15.02.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:00:47 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:00:46 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nikita
 Travkin <nikita@trvn.ru>, Maslov Dmitry <maslovdmitry@seeed.cc>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] iio: light: ltr501: Add ltr329 driver support
Message-ID: <20260715110046.00001aa8@gmail.com>
In-Reply-To: <20260715-liteon-ltr329-v1-3-31f027051594@geanix.com>
References: <20260715-liteon-ltr329-v1-0-31f027051594@geanix.com>
	<20260715-liteon-ltr329-v1-3-31f027051594@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 10:23:50 +0200
Esben Haabendal <esben@geanix.com> wrote:
> @@ -1257,6 +1269,18 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
>  		.channels = ltr301_channels,
>  		.no_channels = ARRAY_SIZE(ltr301_channels),
>  	},
> +	[ltr329] = {
> +		.partid = 0x0A,
> +		.als_gain = ltr559_als_gain_tbl,
> +		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),

While you're at it, add `#include <linux/array_size.h>`

> +		.als_mode_active = BIT(0),
> +		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
> +		.als_gain_shift = 2,
> +		.info = &ltr301_info_no_irq,
> +		.info_no_irq = &ltr301_info_no_irq,
> +		.channels = ltr301_channels,
> +		.no_channels = ARRAY_SIZE(ltr301_channels),
> +	},
>  };
>  
>  static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 ps_val)
> @@ -1531,6 +1555,11 @@ static int ltr501_probe(struct i2c_client *client)
>  		return ret;
>  
>  	if (client->irq > 0) {
> +		if (!ltr501_has_irq_support(data->chip_info)) {
> +			dev_err(&client->dev, "chip does not support irq\n");
> +			return -EINVAL;

Shouldn't this jump to the powerdown_on_error label instead of returning?

-- 
Kind regards

CJD

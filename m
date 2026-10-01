Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858EB3BED32
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839110; cv=none; b=mh3JZfdAa+J5vJebz6gfLakSUeKTyQ9wfwKWqIg3j8B5drEnJootfWOP1QnkOeM0T/B3RKGgHkgrEhi7nUHgZg/H+PNoZmzLk3eWNwPKuz6U1uvHS6pXAGKXUqtox3r3g8Qpp424CM/54PimX4WKSz5wXqizYQhrPZvKwBX6ipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839110; c=relaxed/simple;
	bh=AVqk6eIbFK8uDoowGzu8wB740SP5bVkVCUg8XnZAsHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIYSSOLUHQTu+DJk7g+5yHyN3phQz4bwQlLuN3gUMYRKgOKs8nRvBDdYRDzoXju8BLVXQqIpNWDvNHYSawsQwgVqhSH9l44I2pBZPxwbvxVHwwO6MYyrcVIYRYCac59QMJiWzp34qWch2zzPQglVnEd8tMEFOxAdBni2VB72j2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmJR3dDg; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmJR3dDg"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0f4efe31so64218f8f.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 00:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790839107; x=1791443907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=;
        b=mmJR3dDgiVXM+hdlk7vychW5uyiGr8cv70PVc7kNi8Lfx0ZHmU5g4NIPNW0SliuWAc
         y0Rf/6JNs2gprTZE3or6R0IBnXwDhYs2hsxOA6RZJu5U6R1/U4Bj15/uYWGsn0ILCSrE
         IrZA1t1H0i9yNyRNrExFTCFk5BVMqWS9mXmqdEomfQ+2tkVITkd4zlADEGIbiSl0/bg8
         BZlzSLX7UG6IDwlNjQP+AD05ErVg3Fgb9tBN3XBcRPZuMZ+JB1sUy57IhoClwTEdCzBF
         kd5AuxUpBJmOEsCjcs7mxy9hcNVEBwldm+QdzKDtEwzrMIP9YkI7O4V0HgBu5VJPOMLB
         /FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839107; x=1791443907;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=;
        b=oSMskHVcgCczDjXjvBk+mF8GQAp33bWvdr5bNB3ZdOSt8VdSxdAXh+ZzjOeVf5W4Pl
         qJFVz+i6F/fe+2SYeP+9Sl1h8CL7aidpGwE+hwXRjO9kZFFptaUXQOLYbxX16qXnI8+0
         9i4c4bU4zqXcanJePrFf77Cr9lmrURyikV9D+4q/upPV91jiaV8ns1LL6Z6vaq298iSU
         6/DOAaU3ra//SaYArUK9i9/VCWzoOtDQvAL3bLGr3n3zrAaQ2jcIhmZs5f4s+sPQN54i
         BkYPRh4kin26T/TWkZzch4ohaY1BDvGOvLUJnNcvdCKiHl4E9hezg1kwgrfldPzLeABF
         7sMA==
X-Forwarded-Encrypted: i=1; AKwUvByKXvUOi5r4wbZNlKfFYINsHKfsQLRuagpG3bIC4pKv2cZYwR76m6imGZ/bG6a8udzidgXsBohNUl6K@vger.kernel.org
X-Gm-Message-State: AFuF++mp2KD3Wmrs9IMwainkGA7Q6Q0W5cfCQgiCrMB1uKUCBpGlFdbd
	YBKDZYjoKYmvExIl6g1IBbyFK/d5ISySOwxR/+6UXVnYvjWhtHynWpJk
X-Gm-Gg: AYBFou3QfIRdfDG7B2SUBpKATcI27ya6OqRIhtxDVan0B+D753LsgGjUtZ7wBLmigsX
	xvYRkYorM3S3HuhmcJFpzt+2rxodjI/5eFnDDWlIV9WpIKuNcoBLWcC3iOsd4Rfr7D0F7HwD3KG
	rj6FKf3wTLQBdXmd1km+xyfefXf0ulrDl5Hg2eCiFJtnDUACSrbL29KyKmFxAE4HeYueN5pVT/r
	F8C0Ql4fLyu7rehXol+7+L+UKO9eCfTI+CpiWlLW/WzWYcniTkjPJstv5wvA8GflVgxZF4MmR+L
	DPGDUkVYK9UA3qfr3AVoeUMfb7bozOd2JmKEOWk+Wd8wIH/+apdDJxhQdzvN4/95bLsKkUnhU/r
	TwS3M/c75E4H0OnEhyBpo6AVUZSZd0V/tIsEjU7ILpdBU0qiypyj27/IdzrcHe2jUNgE2QLVsd/
	yNjWEHPO4H5aSBBeHoCEvbUNld1/6kTh1fWqvjmQ7EEdQd4MM7uVf+GC2jeu0XE0lT/P69ZTrXP
	FXphqqaTFqjtawyiL6UX5XliC5x30tIKC24cOswYagFGGCRInX3JckEWGDri6zonAR/xjBJM/00
	YZUzw0LLWBdQGaqlaP2hJRh/LEOZ4zfJPDGDNQJpLO8om993PZftUQUmRClOPC2Q981iYov95RU
	OEt3SgrIMqiPWEcPi+m02Vd1zWVTqtzbDg6XKeWKb93KYaiD3ijpGlRiDDLlSCzAMiAbm0F2l+E
	HfH6sZ
X-Received: by 2002:a05:600c:c162:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-4a01ad907efmr63944185e9.4.1790839106608;
        Thu, 01 Oct 2026 00:18:26 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ecef86sm8562995e9.3.2026.10.01.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:18:26 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:18:27 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, "Ryan Chen" <ryan_chen@aspeedtech.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU
 AST2700
Message-ID: <20261001091827.00001410@gmail.com>
In-Reply-To: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
References: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Oct 2026 11:28:43 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The ADC's reference-voltage trimming data lives in a SCU register. The
> driver has always located that SCU with a global, name-based
> device-tree search, which works as long as a platform only has a
> single node named "syscon". AST2700 splits its SCU into two
> instances, syscon0 and syscon1, that share that same node name and
> differ only by label and unit address, so the lookup always resolves
> to syscon0 even when the ADC's trimming data lives in syscon1.
> 
> This series adds an explicit "syscon" phandle property so multi-SCU
> platforms can point the ADC at the right SCU, keeps the existing
> global lookup as a fallback for single-SCU platforms and already
> deployed device trees, and wires the new property up on AST2700.
> 
> Patch summary:
> 1. dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
> 2. iio: adc: aspeed: Use syscon phandle for trimming data when available
> 3. arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
> Assisted-by: Claude:claude-sonnet-5

All Assisted-by tags in your series should be changed to "Assisted-by: LLM"

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> Billy Tsai (3):
>       dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
>       iio: adc: aspeed: Use syscon phandle for trimming data when available
>       arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml       | 28 ++++++++++++++++++++++
>  arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi     |  2 ++
>  drivers/iio/adc/aspeed_adc.c                       | 20 +++++++++++-----
>  3 files changed, 44 insertions(+), 6 deletions(-)
> ---
> base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
> change-id: 20261001-ast27xx-adc-upstream-34b3d9e8e27b
> 
> Best regards,



-- 
Kind regards,
Joshua Crofts

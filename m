Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA04CE67C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780107; cv=none; b=QdBsqWFjpbIKNIJEG8mNQJM6W/8MDLocMqP1I1jUFmlkqLmVQnCsupbFpbDEc6AncLUBRHd9Y4044bcHi5pHgKOpjb6WYScoUJKSHb6Qx/Efs8u10ODFo1euYJLCFXpr6sOYDs3kHhUCfezq+mp/xYa41mlrSJ8ligEONiidLHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780107; c=relaxed/simple;
	bh=wD3NZssZMW68AQJrY2P8J4DOvVjSGsMzgeQD9NT7T6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFhUlM7e74kNOvUTQ15L6HKmirhRk78O4vta1ebRvpzyZ/UAOgbol92+7DpDrsBY4WEKjLyvQPEccCpPIdWm/VxjHldWPctOYUTPhO09iNPLq1qNgZObFe2TVW8nFKUNXvmCVaU1Essq43H4XsOGwin2qpJ6sS+bh4S6Qtzey+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiE/dC+P; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiE/dC+P"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso23850545e9.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780089; x=1791384889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fX+GMtVZvZFwpjXU+kCF5PX/DfKN7b04TfWCfb65nWU=;
        b=WiE/dC+P1u6L1CgCGkblchR3yrMX0NqAzRZBCzQW5V78MPzOFdb1bsbsutjKINcbxD
         gbkU2Nf9Tl+ktDF5KPPmRrMXrpzB5QgfJDn2OAqPk8rnTbf2CZ3j+9eRh/UVebVWwuUx
         ZJytVWsb1VNXr8Hcy2lvzUYUbgpAyu7/49E5XW35CNFX+deuYLXncyQQH0Z+Kf6Zu57W
         ZV17UXPhq3LtKj0t+Gh7Iyvjq99lxtOTJd02qFNF12/oDURewlD/c4rYufodIcZH0r0m
         xZwuAB7jCVZBoSEK6tqpU38AxcOdELhPJujTdws/7VIU/rTJ4vM8IG+MVMQfnntF3jMs
         t8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780089; x=1791384889;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX+GMtVZvZFwpjXU+kCF5PX/DfKN7b04TfWCfb65nWU=;
        b=QriNoui5ygJzVim5rpnzqFLnrtVzKH6fOUWuXLR9mk3G+Ja7Seg9HZWvRvXHz40t4a
         y1Fa8ti8ev81+6whtQF3C/b/oIeb+IWBga/7lzi9MhpgqMEk5E8YVAapASlTsae/dmmG
         nLVbv04I6h8GhhUcF5DwAS9FWdL+9eVuYIRqv3fYVvhuZueKGvSdMmH1MvGhrhNI4SLe
         Bpg5gPW/UWzwpeM95H40DvNWW/Coo0yIe0MUoSekf1mTvtiDfmq5I7UfeoWs2McBtErK
         e6NJtQIa9S1oIAGIXc1p1t/XdRDo71vyutKiIxL2/4suTyX0bOLPgVod7o1uNAzCxyIO
         94fw==
X-Forwarded-Encrypted: i=1; AKwUvBwQHWKxkmCtTklFQCyCBDoyrLUGi9uqDsiDs6Vy0Ujkrzf46VVtBrAQR4jt9dskpL/P6wqEQF6dY2y2@vger.kernel.org
X-Gm-Message-State: AFuF++nWfKksBJbOTKArzRUG8Z5zR2+QpywGT0Yw1QVL/6MeD8MmmY2R
	KayuMdO3rpJVVZyTLlX0FSvrsw80yeRxsHTfHycw3c1nCKtFQqW/tZCc
X-Gm-Gg: AYBFou3Znlzyev8+x4p84mTCHQb4Jnn3Saab24pAmgAAcBrZzSIXCz4kijG5yq8ftXo
	UKWmvaBzLUvFwer1QyJD8v1UVPMTsIXnb9dS0Or9d35bvSEUpT8mk6m9McoMSAugXDowkK87FkM
	XA2jqtz8MRZwOBynmcWUcdECqA2frPGBv8ytF9pnlyqfyxZr8BcyC9BQ/bDIunaiwMjxieuPs7d
	hlbQcYlvOBGnLXeWV6gK9p3TY8X7xFaFAu6Vc+n/xJKAvOkrWZgje0i4nGa9oP2Nyj58R3NW/se
	DKenCVq+ypMOcQsNWV/I6+A62Jnw2jpVd7+z1GuAK2MzGvC+F29bu2HGO5fXSW/8k4kxODTwtYu
	5J/W+Qy54+WXTGH2mOUDhFQiH/nlegqNKr9MG7gHDU9aBJ3rikfjnERK1xMgNDrnMxddh+NTZKy
	TMPKigqBrgS+U5UxpGKiOMrYMef0Ac4tiAW/BjyX+5ZD5uc+LvRf1UDqcy3A7m5pX1b4B1zKG55
	KCWzAp3xfRZPqL79fhsmJREZy+jCP33b4ntKwqu35GMkqZCIXYA7bKeJcXzA44t1eHmiWqs0C7p
	A2cwjw8yheLVWVM61MT+A1tEAhiAHv0n8Sr3nTzc/lEhn5Vl0pC7bs1sx2VK+zQ5o4J8gO7XKq4
	xlBIc7qGOLpW/XMyyH8ikDhLkepmR5RWUCDAUt0+FRfbhxnv76cJTXQoPRwvsIfB6GqAFyACgru
	OJguqH
X-Received: by 2002:a05:600c:a00b:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a01c69f64dmr14101255e9.29.1790780088847;
        Wed, 30 Sep 2026 07:54:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e6622e1sm4236005e9.3.2026.09.30.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:54:48 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:54:47 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v3 04/15] iio: adc: stm32-adc: manage characterization
 voltage diversity
Message-ID: <20260930165447.000046e4@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-4-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-4-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 16:18:25 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> From: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> The characterization voltage used to calibrate vrefint depends
> on SoC family. Add vref_charac_mv field in stm32_adc_cfg structure
> to store the characterization voltage for each SoC, and use it
> in Vref computation formula.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v2:
> - Andy's review comments: rename variable to vref_charac_mv (unit suffix).
>   Drop the const attribute.
> ---
>  drivers/iio/adc/stm32-adc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 600f975f1d7b..fa46803d54be 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -43,7 +43,6 @@
>  #define STM32_ADC_TIMEOUT_US		100000
>  #define STM32_ADC_TIMEOUT	(msecs_to_jiffies(STM32_ADC_TIMEOUT_US / 1000))
>  #define STM32_ADC_HW_STOP_DELAY_MS	100
> -#define STM32_ADC_VREFINT_VOLTAGE	3300
>  
>  #define STM32_DMA_BUFFER_SIZE		PAGE_SIZE
>  
> @@ -211,6 +210,7 @@ struct stm32_adc;
>   * @set_ovs:		routine to set oversampling configuration
>   * @smp_cycles:		programmable sampling time (ADC clock cycles)
>   * @ts_int_ch:		pointer to array of internal channels minimum sampling time in ns
> + * @vref_charac_mv:	Vref characterization voltage used to measure vrefint calibration value
>   */
>  struct stm32_adc_cfg {
>  	const struct stm32_adc_regspec	*regs;
> @@ -230,6 +230,7 @@ struct stm32_adc_cfg {
>  	void (*set_ovs)(struct iio_dev *indio_dev, u32 ovs_idx);
>  	const unsigned int *smp_cycles;
>  	const unsigned int *ts_int_ch;
> +	int vref_charac_mv;

Case-sensitive units if it's SI is preferred in IIO, therefore *_mV.
(checkpatch warns against this, but just ignore it).

-- 
Kind regards,
Joshua Crofts

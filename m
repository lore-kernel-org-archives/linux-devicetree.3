Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A820DD51
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205035; cv=none; b=Qjl97GITeoNXiijStPKNY4VScXfe35yLqkCzYm3pLLIcvTLPpcfdaSNUQ5PVj11ZR6192+5Ep4gTyd5/m7CavP5UzIXN/JSVpXAZL3Ro9+/x5lDkRFSbojF56GBzCuM/hcu6QnAVB/nhbuOh6YLd32GQZsbMNWET+LAW03qqeSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205035; c=relaxed/simple;
	bh=0i91wvPsoFNz5NqYStg6Ytvr9GyMmPyJSl+LIKrKv/0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qP6kC23ODAMV/zm6Z94Y2MmW/8ufH+zHAqVJlU3uPQJK1PPhtK48OC2m77RHWk1GLATWJMF0oXfZ2iYlTky3vi6eC/l0xvk3dAdzpBzSP36E1aXovwHJHta0mPYZn8AjVX4JWrUBLV0lWODzLeqJwVkw9uLWoq/BXnCje3tVfUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWryWPyt; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWryWPyt"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51780bbc560so11150801cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781205033; x=1781809833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1akxBa9Yj2eO0ezJOdd0PYMsv5JHqMaTxTbB2PVknqc=;
        b=PWryWPytKiNqSIwCJek3s5jXpIzc8dTdnKWtrb/UsrCbVZ/pjn5/aL11z2E/lSOt2M
         CzgeSqAMUZYnFteoc7fvhKVESI0W3NkYA1MTzooNi74PnKie0Y2MH9TTW+85ctWY9SPY
         JaCOfVWroKRHIuWg6GkEJQCCvIfk3QkOWRJmV2j/f1zisD+6c/0U9qfpsys3OxHrX++d
         4Wek+hV3aohJVK6AXfZhSQBgViA9eyaFNlD8q6cT1accQEGm2mkaPJLLegxaR19vMaGY
         ssn/TUAbwNxFM1FxqE5s35SFp7S1McJygBqUPNqlnQ9W7xUHHAMtp+JoWh34mFTSI7WY
         ycug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781205033; x=1781809833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1akxBa9Yj2eO0ezJOdd0PYMsv5JHqMaTxTbB2PVknqc=;
        b=lmWGnVUCA3QyUMe0t0OWtcI387hmcIHgbCJGIGgpvYn9JoFJxIGze8pv1jev+5kV2u
         41ohbU3l6yfMcHvB5XxdyJqR8i82vH/jHz82JvVSAHsDPqzrnsaqDHu9Gf/LkOcmqKvN
         PYomQvw+3WWdi1ycuaHxJgUVF2BSCwr4zJAGK5KzcwdH0aZEjeAcXhHim3vycaKvV6xu
         a3MXWstSII6DwuRQLSpdlynzHDLkB4zPKf2LwmtPczaWZTbTruFLtwaErrxUJvW1vz6v
         bF8YBhkyZTUl0GKORI/Syx9bEMgvYlSMjI4vURjCgyYGS7Uk6DpNR4sGixYe1ZndwuFc
         vjJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eLWNulPUDur7lDpWvjVbeGbWTnAkmpnOja+SvNpgCWnHGE2hLuVxhlYJXTSTG4jzXmb3asQHgsJ7T@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0B9+2BI90LGmqrolje4lxrcbvYVtyjVhJ5XnqfpPztEU/FPB
	2p8T+10vBo7SLksD7qGs54D6ONyjVTE370kKvrh70EMMOGji1JawxPRK
X-Gm-Gg: Acq92OGM2fazs8v0bIo+GwhsCOdNQk/mnYYt0xKtakglyWdyyRMa9ZgCiIjPcMbmcoZ
	ipnwvVCmMcwGKM/3BWjMd3eNfk8OlhMo6fhoQ3FqYoVpAL7K+C1g6K5h/UuSE75p2W/pI4wwYa9
	aRjU+R6ApekIR5oi7eU0QaVTG6+7ywAq1hOaZNyOv2HOTx8MK1Y3APwlRqOXVd+pBk0mRjOIHyK
	zMJs6aRXzhRQLXk4NiaiGwuXTToWE/lKx37VX7ePzyLZ21+Vbaku1pVZBJaxLvzLVViep0Nnniq
	+dDXseFYeWMkTTwCj0PR4aUFaMteuD7C74LCDZR9iL6zLOvkSGhXtJIL1i4XTamHwxkqEMoYcqX
	xLl1tABLWl26sW9jt5o1nYf0yTQSzMIp2EDs6VIYGUe7WEcaP/jxXNgHZGh+5BM3qXX5dIXZnqZ
	o9WMycX+LK8nVcYIAGx8GVU2s5Z+JtkWKjzLVLQLQNP7WkEuU=
X-Received: by 2002:a05:622a:c18:b0:517:5f11:b353 with SMTP id d75a77b69052e-517ef177b41mr47422321cf.41.1781205033020;
        Thu, 11 Jun 2026 12:10:33 -0700 (PDT)
Received: from louisarchdesktop ([2601:184:417f:5ad5:c570:9008:5a2b:8db7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb63e594sm1333661cf.8.2026.06.11.12.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:10:32 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:10:26 -0400
From: Louis Adamian <adamianlouis@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: pressure: ms5637: Add variant specific
 temperature compensation
Message-ID: <20260611151026.4abf8804@louisarchdesktop>
In-Reply-To: <aimvBvJp8CsNKlPU@ashevche-desk.local>
References: <20260610020458.104818-1-adamianlouis@gmail.com>
	<20260610020458.104818-3-adamianlouis@gmail.com>
	<aimvBvJp8CsNKlPU@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026 21:37:58 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Jun 09, 2026 at 10:04:58PM -0400, Louis Adamian wrote:
> > Add correct temperature compensation for ms5637-30BA,
> > MS5803-01BA,02BA, 05BA, 14BA, 30BA, MS5837-30BA. The temperature
> > compensation formula is shared across these sensors but with
> > different constants. Add ms_tp_comp_consts to capture these
> > per-device differences. Add pressure variant specific pressure
> > scale variable.  
> 
> Is there SPI driver? If so, why only i2c is affected?

As Jonathan noted, there is no SPI driver currently and the
modified function is only used by i2c. 

> > +		s64 tmp = (s64)temp - 2000;  
> 
> Why casting?

This is extraneous, I will remove it.

> Overall this all needs a good comment or even comments to explain all
> calculations with the references to the respective sections / tables
> / pages in the datasheet.

I'll add comments here explaining the shared equations. There are
also references to the individual datasheets in the constant structures
because they differ per device.

> >  struct ms_tp_dev {
> >  	struct i2c_client *client;  
> 
> >  	const struct ms_tp_hw_data *hw;
> >  	u16 prom[MS_SENSORS_TP_PROM_WORDS_NB];
> >  	u8 res_index;
> > +	const struct ms_tp_comp_consts *comp_consts;  
> 
> Please, check with `pahole` if this is the best layout.

I will correct the packing on this per pahole's finding.
> >  struct ms_tp_data {
> >  	const char *name;
> >  	const struct ms_tp_hw_data *hw;
> > +	const struct ms_tp_comp_consts *comp_consts;
> >  };  
> 
> Can this be simply embedded into ms_tp_dev (and copied there if
> required)?

Copying in ms_tp_comp_consts provides no benefit over
referencing the pointer; the values are per-descriptor, not
per-instance and never modified. I'll keep the pointer (same as
ms_tp_hw_data).

> Have you considered to prepare the infrastructure in one patch and add
> the actual compensation data tables in another?

I can split this patch for V3 and I will fix the other formatting
issues.

Thanks,
Louis

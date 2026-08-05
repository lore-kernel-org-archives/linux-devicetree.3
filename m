Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D684854E9
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949622; cv=none; b=qUEZQ0Xzmip0qAzUPp5aBEz0JPnhPvTbrAEw73QVIAECpJ/VAyoMKpWa20lfujWSANVk5ETdamMWyMXue35bSImQanNPEXU/JGxLzKGeMt8j/pVxHYzJD9Ie8SmiwPT2FvjMVknGJgFdKKclzPngrh8DDPJltaczufilBvbst10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949622; c=relaxed/simple;
	bh=m8q6OK/anRR6LU8bDyid2t7U6ZwpjLrM3FKrURqspZA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fkjka3hgTCTrVXdcEJ58+WQZXSFJpzbTM2TPhgrQO2FWIi07sRl9vfHHlPC39q5hlCMapd2SwakXoFJ7noQI6ZDyGbd0WekJLldjT1xVDCnLAlKtsS2pxAGepE7gLBFg7icyWeNGCiQagjwNFE6hP+gjhSSivBrqBPlKGiDG2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsYu42+q; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsYu42+q"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c928bf172so7881981cf.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785949615; x=1786554415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcCQ5yjpmgh/+ucZRtqgqUFJTrSq89wHY1nMeO3mD/g=;
        b=KsYu42+q3tt+0iiTxfKwjivK9ZY90Er/7pNhJEcE0WnfYN6ctkGNMRNcolNjUqjVQy
         Cd2DMXHuMGlzpifuY8fz8qKIKdt0bf/NqmHrBAAqZPOI3SkYzHH1Y2yP8Zm+7N3oglFb
         bPt7MwzdqRBQeGLDKM6JmhCKgYY9i5aoslo8l6uFUkf1wGV6tAoLn419wInfF2HGyF/D
         8BBBJSuwz6zuoH/o0s67OffZJEcX3/U+fN41RHdgQb4YGFNOtbyFl3E3wbfjZ8h0OaHC
         u7Go54Xq7vTqtXkSjszwt2DOpPjFjVxw+k1bxhIV5+kxPaRLXVOdD3r9G+pcbOwUCmQZ
         VNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785949615; x=1786554415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcCQ5yjpmgh/+ucZRtqgqUFJTrSq89wHY1nMeO3mD/g=;
        b=qwNIBQgQL5HTOthuLWjrWHStbFR8vHgedWYjN+gqXzZ1nN5F4EBt6Onmmen2kXDw2M
         02Zp8SmcK1B20r8FIsztBRiX4LLKSK8EaOPjtnFMptwABTFUHKMbR5/kEP8MK7FRPvZo
         qtbcSPXHXKMR2f9hz8WH+GyEZv5EzdEloKCw+2LiEuSymm6uAhA5JBqg7sDZ56KG4W2N
         MAbk59dnKduEILtXFU9sJyFtHz5KnkfH9nAwEE9cPQdQJwUuejsdzOz2wsALKpg+LPkF
         eWX8cStvb/zCKFWvT0Qo48PLHw8RbC0KVebZgSKxxH9rWgU5YwOBj4FAVpkIQUyyEoOO
         DWmg==
X-Forwarded-Encrypted: i=1; AHgh+RqGvLXJt47EWaf30Mlx5SS8VNKCcA+ktDW5agwNrKFv1gbYAS+VkkODrZCd/3+HZ3f3QjZS+MTkMtR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qF4c6fbjU0xEIZQbjk6+Z08v1JhJaOpjfZbUJ1F9xpprlJ9u
	A+tq0rl1U6iqRu/oQmyjgZBB2ndWUHNcNKMJsZOPX0Ef9i8oxl+QbRqU
X-Gm-Gg: AR+sD1141FhVft59z3IWSSjhvwuURcXkAUX41Ola1mKBXpvY57gSb8+909SfBd24iDV
	g517u4AtVoyAjJv9jyfpCfE59DnBf639EL8TKdvyjrJuCIJIz9gvSYDBaa6qaumftJOaSfwAQUz
	2ePXC+pg1yMPEHXHLW/2n3u1LXH4/YUMppBJSpIWzRk8ejiB2d0zyWIEKnu1mxdE4vsJzYzbTw+
	718L2HZTgD1zpT92UHkvBc/Fr4QEQ10roTJu8Gr+WfIF0J0RQtx7Z3cqGS//WD4R0FIqTBNfi8w
	KJ4PDOgE3/Sjh278GCXdVzulifcPgjtLUSzbty4Ak7a5s+dSCeqxYXi3QFRuotelV5i30FFvf4i
	nNi0RLWIs+W0x5QkcfRJPDZIcDVJLuqxMLH47akLh9Cemyo3RSXL/FD9fgK8AToF3zTl66zs94g
	kstXWbykL8Fcn2h9jDT74sghTTPmYXXU0cH2tiW6nSIeN+4iO0S6XXYOS12eBnI+1VkWZvw7PBa
	D+9QS4PslT3Og==
X-Received: by 2002:a05:620a:a502:b0:923:7821:dc0d with SMTP id af79cd13be357-93649267a9fmr689507285a.33.1785949615468;
        Wed, 05 Aug 2026 10:06:55 -0700 (PDT)
Received: from louisarchdesktop ([2601:184:417f:5ad5:c570:9008:5a2b:8db7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a3fc9bbsm196220785a.10.2026.08.05.10.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 10:06:55 -0700 (PDT)
Date: Wed, 5 Aug 2026 13:06:51 -0400
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
Message-ID: <20260805130651.4aceb71f@louisarchdesktop>
In-Reply-To: <aisNMmwMREF7Iga6@ashevche-desk.local>
References: <20260610020458.104818-1-adamianlouis@gmail.com>
	<20260610020458.104818-3-adamianlouis@gmail.com>
	<aimvBvJp8CsNKlPU@ashevche-desk.local>
	<20260611151026.4abf8804@louisarchdesktop>
	<aisNMmwMREF7Iga6@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Jun 2026 22:32:02 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Jun 11, 2026 at 03:10:26PM -0400, Louis Adamian wrote:
> > On Wed, 10 Jun 2026 21:37:58 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > On Tue, Jun 09, 2026 at 10:04:58PM -0400, Louis Adamian wrote:  
> 
> ...
> 
> > > >  struct ms_tp_dev {
> > > >  	struct i2c_client *client;    
> > >   
> > > >  	const struct ms_tp_hw_data *hw;
> > > >  	u16 prom[MS_SENSORS_TP_PROM_WORDS_NB];
> > > >  	u8 res_index;
> > > > +	const struct ms_tp_comp_consts *comp_consts;    
> > > 
> > > Please, check with `pahole` if this is the best layout.  
> > 
> > I will correct the packing on this per pahole's finding.  
> > > >  struct ms_tp_data {
> > > >  	const char *name;
> > > >  	const struct ms_tp_hw_data *hw;
> > > > +	const struct ms_tp_comp_consts *comp_consts;
> > > >  };    
> > > 
> > > Can this be simply embedded into ms_tp_dev (and copied there if
> > > required)?  
> > 
> > Copying in ms_tp_comp_consts provides no benefit over
> > referencing the pointer; the values are per-descriptor, not
> > per-instance and never modified. I'll keep the pointer (same as
> > ms_tp_hw_data).  
> 
> Okay, let me ask differently then: Can we use the same data type in
> ms_tp_dev instead of adding basically the same fields as in
> ms_tp_data?
> 
Sorry for the very slow reply. Yes, for v3 ms_tp_dev will hold a single
const ms_tp_data *data instead of its own hw and comp_consts. This
drops the duplicated hw that predates this series. 

One thing worth noting before I do that: ms_tp_data is currently
private to ms5637.c and will need to be moved to ms_sensors_i2c.h for
ms_tp_dev to point to it. I don't think this is a problem; it matches
how ms_tp_hw_data is defined now, but let me know if you would like to
avoid it.

Thanks,
Louis 

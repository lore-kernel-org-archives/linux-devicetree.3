Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4EB377015
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127549; cv=none; b=GEvTkWmwOUswSg7/vTtt2NM06ZrQ7WIsCz/JVZT+J5DODTB9rsl/3I4M7sYqWa6fQQewlOsMd5hhGNq0Feo9QwP3hhJYEHvcp+SL/OmfXGTvqI1vBMoQ970L7iWRehk8sRTjl+YbUE/M0lYQkZdwxO71fBpkbkomN1o8WR25u9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127549; c=relaxed/simple;
	bh=LVRpvRWQSaxHfSgYe3MtbFfNAnOMtlsZRIWS10Dv0GE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k7+VDbhPXHwfNZpPS1YUsxV2v+IlwupBZUIgNEL7CXgjiWU+KL2WicTjL7ByB4yJj9fXoWd/WRF60tifBwtQOVEJmhfsJuGYvKKcUdJzjCP+6H1r/i+SZFFwaTMkpUgKIGBiTwJZwun0a8+Oufilb8jWyScKU0cmXHjS/cez0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Odgy0yVA; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odgy0yVA"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfad59921so24799621cf.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127547; x=1786732347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCdCLUuBP8/CkfxUK6b74oN1gwbSsaQEa9gHG9eOXxo=;
        b=Odgy0yVAwz1f6T3u3e6D5aLzpKR0SEszq4Ybvk6ObUU2mm2Sz57aPamD6C7rMrk0hD
         CHS+0uO6eil35GKH9+tCdcaS33dREJ9EGdwj1oId3uNifKKlmHi/0TYetDGGd9s841pm
         VZIuGYlLaetZuD0e9kjLobf0s/UD2gSxIPAx8c1RLM4f9hlBkvGTzYhg1K8SqevQbEl/
         I/NNYRiWJHt4kT6u71v9eybwr1dOfa1KAZuA1ZqTqyO4eCzWFZEsT/Dn2T2nZXNAiB4Q
         ByMY7h39Xydh710GiBRwYVBsOOQoFfh4IFsWiYAgLsLpUe2oy9N6FePWwGkN8oToTMNN
         Veew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127547; x=1786732347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCdCLUuBP8/CkfxUK6b74oN1gwbSsaQEa9gHG9eOXxo=;
        b=dBrZioQrzieWdIL1LsCGjfsGfkA3iKgHAkDbOHjiuScgIDbTAvxq3ARtGZm6nYeUI6
         x1tItbO35DgkDNhDzuPJh6MRRhDB5Gs9XTCyniq5ZqOZjmFSbJ0QbMaLC7rtkHHjMCNa
         JOajHdCGJuJJ/7wGAJoNMCSNbqQOz3rRv0CHcc183be9s6NJ4VGkB9RHCaGA1F8uzXFo
         n1ZzK7/UPObNELQDX/KnSOTnRlbRx77g+J4VL+uSV9zLJI62gm/FB2n0aZ4NmCYkjmxP
         dUHy14O21EhdH90W42WHFC6zpQbvWwCKnB4o0KvtfU4TXv08L00t6sqb0FNTDQgTj5Aw
         M1dQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpem1US4sW0R4OHDCvEdEFFwO1kfVc9FluUxem6LA4LdUQtRBpp/Qe6sur8rI9oCmun3pZzfeOcS2rh@vger.kernel.org
X-Gm-Message-State: AOJu0YwcM51buuB2siMik5CAz6+jVjTMM8OAXk2QazsYR4qIh1ST5fhZ
	rIqJvnYSkoeKKMb6RgkRZ6z5OdNVIgSatAVcvtq06BW8bi3quwftlPLV
X-Gm-Gg: AR+sD12t0kwGgBaeBIWBx3aCjaZnjp7hjRL/lBFVBicRq3/s6GQr68BIe9Nwk+X+DYg
	7uoHYfMaCKFt4U0cDRSruRdRqpSVXKNvq0HP2Ib80huOCGaHLCleA7oHRi1FU6Gu96HYitFwlxw
	l76lAhUJ7/DcmBi3zYs1kmQmzVnTgjuLyPMk+coor6tjRvhMTRVyGKdeKF9wnxDuQ2IYfRwwuc+
	v6HuJdy8WTjharspVdlvPW76dJEHLMAY+4NbbogPllfIiByj2E0CI6UGBXKg4WBQZT3Ik136rNw
	40xtDB4yFHCnZFXtQ7OkPPMAwJ8WHsp+keBaRPgHuW6BLZAUyjGqD/WuSqnC04UNET6ZozTfFiv
	X5edtJDtMeaiY96Wcg6NP7vYhuATrh0lMiaDk20TrAMvgpCqnqW+9PVqCRH12PVu3sVrpQn6Y+R
	vZkJGOFaZTJumcj2jbN4XvgLaxvNIg2AKW1FwV3xldzuKL9YH2ZPd4lGD7icYEFZG2yIjXuSohN
	g==
X-Received: by 2002:a05:622a:1487:b0:516:dff5:68c4 with SMTP id d75a77b69052e-52ce5f449d4mr258294841cf.7.1786127546775;
        Fri, 07 Aug 2026 11:32:26 -0700 (PDT)
Received: from louisarchdesktop ([2601:184:417f:5ad5:c570:9008:5a2b:8db7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1637f4a1sm17779741cf.9.2026.08.07.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:32:24 -0700 (PDT)
Date: Fri, 7 Aug 2026 14:32:20 -0400
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
Message-ID: <20260807143220.409fe4ec@louisarchdesktop>
In-Reply-To: <anT8Qs1ga7ayvtWZ@ashevche-desk.local>
References: <20260610020458.104818-1-adamianlouis@gmail.com>
	<20260610020458.104818-3-adamianlouis@gmail.com>
	<aimvBvJp8CsNKlPU@ashevche-desk.local>
	<20260611151026.4abf8804@louisarchdesktop>
	<aisNMmwMREF7Iga6@ashevche-desk.local>
	<20260805130651.4aceb71f@louisarchdesktop>
	<anT8Qs1ga7ayvtWZ@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Aug 2026 00:27:30 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Aug 05, 2026 at 01:06:51PM -0400, Louis Adamian wrote:
> > On Thu, 11 Jun 2026 22:32:02 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > On Thu, Jun 11, 2026 at 03:10:26PM -0400, Louis Adamian wrote:  
> > > > On Wed, 10 Jun 2026 21:37:58 +0300
> > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:    
> > > > > On Tue, Jun 09, 2026 at 10:04:58PM -0400, Louis Adamian
> > > > > wrote:    
> 
> ...
> 
> > > > > >  struct ms_tp_dev {
> > > > > >  	struct i2c_client *client;      
> > > > >     
>  [...]  
> > > > > 
> > > > > Please, check with `pahole` if this is the best layout.    
> > > > 
> > > > I will correct the packing on this per pahole's finding.    
>  [...]  
> > > > > 
> > > > > Can this be simply embedded into ms_tp_dev (and copied there
> > > > > if required)?    
> > > > 
> > > > Copying in ms_tp_comp_consts provides no benefit over
> > > > referencing the pointer; the values are per-descriptor, not
> > > > per-instance and never modified. I'll keep the pointer (same as
> > > > ms_tp_hw_data).    
> > > 
> > > Okay, let me ask differently then: Can we use the same data type
> > > in ms_tp_dev instead of adding basically the same fields as in
> > > ms_tp_data?
> > >   
> > Sorry for the very slow reply. Yes, for v3 ms_tp_dev will hold a
> > single const ms_tp_data *data instead of its own hw and
> > comp_consts. This drops the duplicated hw that predates this
> > series. 
> > 
> > One thing worth noting before I do that: ms_tp_data is currently
> > private to ms5637.c and will need to be moved to ms_sensors_i2c.h
> > for ms_tp_dev to point to it. I don't think this is a problem; it
> > matches how ms_tp_hw_data is defined now, but let me know if you
> > would like to avoid it.  
> 
> The pointer may be opaque, in that case it's not needed to be exposed.
> 

ms_sensors_i2c.c dereferences both ->hw->prom_len in
ms_sensors_tp_read_prom and ->comp_consts in
ms_sensors_read_temp_and_pressure, so an opaque ms_tp_data would require
passing both pointers as parameters. I plan on moving ms_tp_data into
ms_sensors_i2c.h, dropping the original duplicate hw, unless you prefer
otherwise.

-- 
Thanks,
Louis

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120355;
	b=l3mcxZucpGcy6ldS9vu854eRT8ZaajIGR2oibh35BgYAEwJJ8+9PbcHqFvwXx/oRYyUl
	 NVEe+HjWDUhWcRURNbUvUeCW3qrlHjPlHIlebPQKLOCrMxKIXgMApSu7nl5ol5V0eU1Ir
	 2RAZSQYNW8QZmZi6kUDRi3NthUFXU8sQXiUf+AMuCJKDy4oy9aPCZuDN64jz6cwQeNsB5
	 pvq6toApG4FdgH3zgQ3NpxTe++7KqKez/GoKuSfrbeSLmng5vS//aMZXCVh76pxaQXe17
	 x/5rDTWValDrEasGI/kcOFXgZxoCn65JB8cCNnJjSBUYcEm9QG80uIn1kGMw8SBcfAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xn5mhyBYyHW6lr80G2bcaHtch3y/eIfqPoTaMRbJI2o=;
	b=fAaqiqDMMJ5ydua5b13++iw/xh4i0SrsIrHqV+difYm+h2nqtT3P/8GSAaEl38fv5R6Y
	 8GhNPe1wVD2yR/0M7G2TXAmP6djLgbPIH9ZzwXWAYn+dzAOaR3Ny/vNRzXw3CUIbQP/KE
	 LQTKg8CiR6l99gQnng8ppkOoJbW5+VfRvG+Dlb5QpW/G56u4RQopSom8TgcNxVlVbozxU
	 H3kqFopW6Ph2fGUyKZRGwIIdpv96WmS49O6c67jzWs1oRWq0gnrOr21GtB5sm3mbBwPBw
	 D5mt9A57K5DsfnbKxt8WUXvx3yxy9C67byU1IRhTAzcdtoY4pv1xD/uWHjlRxdYcJMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glow8yZ9;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98B60A2634
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 20:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC98B60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glow8yZ9
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so296950eec.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795120354; x=1795725154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn5mhyBYyHW6lr80G2bcaHtch3y/eIfqPoTaMRbJI2o=;
        b=glow8yZ9x+fwdtBpevYvZuBcds4wjQwb5pkw7T5HxwXeXjjectDJKhqWkEEkXMUVAo
         iDkB1eQf65pA+YWetDavIjZxWu3D0CXdcLdC5zRdTXMVzWi3kNueRVgj6jRufzarTpv1
         gxCYBDvhbghHU4sAdIZRUE4ihqKc693X4BKNHm+kW0lNk74Bxx+PPCLkc4Z/A2urbqcR
         hI4dRLeUMIbg2L0hQHL4+a4rLN1b8DWdK78BNm7VRPUO3/6BRJfTKulUoE3DfsSi2BTu
         RSgs3Mzb6JyWNC2UFBk15BQOEpeSp47tIzg35P9FlIccQ72Bdl9/NdRjf33EW2kaivJ5
         jGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120354; x=1795725154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn5mhyBYyHW6lr80G2bcaHtch3y/eIfqPoTaMRbJI2o=;
        b=ZHQd4cUw69CL5XLZjFOIjLFj26KZcSJl/31f4edPOuy1XUdvry7lwTSiQu/Nk9mG75
         BFkwqWuFOP6ty58CfRtac2JQm5FUV40aBJtBvtalyNBDZ26rWXkRocUwzXQK52QUDF+j
         Oywn2qcp1ZR7emv9MhqO4VXD+ftHvMAO835j1jo/0Kl7RP+5aJ64u1ocFzRlZC/z+P7P
         Ow05h598VGm789uEuAGiGN2rJMWSFEJ8tclhiVK6cko4ef6ZL43bb7VES3EQ2TACv5jw
         YAvV/pL558FkwVUhmNKMaxi3UV3mh8RFLLzs5poaqmMc6ThmvA4ICdbF84nem4TM/NFP
         kDJA==
X-Forwarded-Encrypted: i=1; AL+hErGy/QrAAq5EBwYHhZGt/3BCelVjAQ+pi7+sjIeVbZbEU3BnF8A3kcGoEfjGYMuIMTOFa8nA+/d0fib1@vger.kernel.org
X-Gm-Message-State: APuU4Z/4kqnbmKujlb9x+twEpcKQmmy1XJ41q+u7Tg/0hiI9coI9ejOa
	nHbqFxlSEogMHu2ZA3TT2tGlTrhpBPQlX0w+JX9Xuf7sjuSwHz3mMLaLuzFA/mZc
X-Gm-Gg: AZFdTZcmnm5kHlu6+joeClkmpblvh5rxd77MtWhTrZTOcG7EGRJ6Kj5idCxl79Pfi9y
	7qe7pOhm8movVxgeqix97vArEC7HO/uYGiJL8UcD73rviT7Z/RQaGX65kAIKYsccYDgMkL5/Man
	siTH+KtikzcrMNz1DDHTTK0MDU8B0WHUzN/WsOT5o3GY2X5qU3C64Tiu15t6Cziuxcw4ys8fMgj
	9zBiiDeOOIy9JHwr9YSWZV6LBah1GJduhXQbRv2fBFCwgdwddJFxAA1g2DYtGa3ABd0DRwLNX4B
	u4HN8xNug9CIF9ESmW2azbVG82lemf071OxPcscXwF/wiR8pbpstCLsmPpOpdZjFyw6Al37jQjC
	xlRlbd0I81M18In1qiri/LE8/82/sZnN82NLnSHVX44gRE9IJaokeO1c53AGg3aKDfXfmIo2m0q
	vERZ6oKu9I5nBVKXAdOXjZZfe1dbZAJA8yLkI2tgtsldSUMy5zlBnDKp2fqOq3MYnbdOYpQdDJt
	HNo8eg+8oCS7ThEG6grm8kpzDsxLo9wPk4XX+DbehZNi3GE58ejPwh1e/SIOEJcyu//h1XB5X0d
	khNvTMVb9H9o/LYodaIF/61P2SO5gNttAp/h+g==
X-Received: by 2002:a05:7301:921:b0:375:c862:34e with SMTP id 5a478bee46e88-38570742392mr419227eec.20.1795120353679;
        Thu, 19 Nov 2026 12:32:33 -0800 (PST)
Received: from localhost ([2804:30c:914:4500:cd15:65cc:e2cc:7363])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm1101905eec.6.2026.11.19.12.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:32:33 -0800 (PST)
Date: Thu, 19 Nov 2026 17:33:58 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux@analog.com, Michael.Hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v1 1/5] iio: backend: Add calibration source interface
Message-ID: <av9dNvWzHlbvBZf4@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1795003864.git.marcelo.schmitt@analog.com>
 <67582938820d6f206006b16de71ad6bcdacfa863.1795003864.git.marcelo.schmitt@analog.com>
 <20261119025747.53b30ba4@jic23-hlaptop>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119025747.53b30ba4@jic23-hlaptop>

On 11/19, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 10:03:17 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 
> > Some ADC front-ends send data over a configurable number of LVDS serial
> > lanes and may also need to have the data frame calibrated before capture
> > can start.
> > 
> > Add a backend operation for selecting the calibration source (data lane or
> > data frame) so that device drivers can perform the calibration of both the
> > data frame and data lanes.
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
> >  drivers/iio/industrialio-backend.c | 23 +++++++++++++++++++++++
> >  include/linux/iio/backend.h        | 22 ++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> > index fbf5c39d7655..682d5f735071 100644
> > --- a/drivers/iio/industrialio-backend.c
> > +++ b/drivers/iio/industrialio-backend.c
> > @@ -869,6 +869,29 @@ int iio_backend_interface_data_align(struct iio_backend *back, u32 timeout_us)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(iio_backend_interface_data_align, "IIO_BACKEND");
> >  
> > +/**
> > + * iio_backend_calibration_source_set - Select the monitored error source
> > + * @back: Backend device
> > + * @source: Error source to monitor.
> > + * @lane: Data lane to monitor. Only meaningful for
> > + *	  %IIO_BACKEND_CALIB_SOURCE_DATA_LANE.
> > + *
> > + * Restrict the error reported through iio_backend_chan_status() to a single
> > + * source of the digital interface so that each lane can be calibrated
> > + * independently. Backends are expected to report every error source again
> > + * once %IIO_BACKEND_CALIB_SOURCE_NONE is selected.
> 
> I don't follow this description at all. If there is more than one how
> does it report 'every' error source? 
> 
> Add some explanation, probably to the commit message on how the
> flow using this works.  We might need more info here as well.

I've complemented the explanation about this new backend operation. I'll try
to further improve for v2 if the description below is still sounding confusing.


Some ADC front-ends group and send data from a single channel over a
configurable number of LVDS serial lanes and may also need to perform a
data frame calibration before capture can start. During a channel interface
calibration, the front-end device driver usually requests the channel
status multiple times to find out the optimal calibration point.

However, the backend channel status interface doesn't provide which
specific serial lane or data frame flagged errors when they occur. The lack
of error source information prevents proper calibration of channels
comprised of multiple serial lanes.

Instead, the backend may have a separate error source mask configuration to
restrict which digital interface source will have its errors reported
through iio_backend_chan_status(). With that, each serial lane can be
calibrated independently, enabling multiple lane LVDS channels to be
properly calibrated and supported.

Add a backend operation for selecting the calibration source (data lane or
data frame) so that device drivers can perform the calibration of both the
data frame and data lanes. Backends are expected to report every error source
when IIO_BACKEND_CALIB_SOURCE_NONE is selected.


sashiko comments seem to apply. Will, fix those for v2.


Thanks,
Marcelo

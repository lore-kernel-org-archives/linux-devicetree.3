Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4D9392814
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 18:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780250975; cv=none; b=be/PXNPb+VKeooKKCwZvRplAoEWAoq52y7agvuMGflUARBL3bT+7VUY43ncq5GdZdVmQO8fVUn0cFKgPVYhPffPf6x7l7lPSSW0fHmWYBwOKIMyW4zAn68jCNDh8IpJCL+NolZ04Q1BHKkUzkXJo86G1b/PJfIPkrJDt5sIEmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780250975; c=relaxed/simple;
	bh=9/xTQ86TP9KKDpmV3juKQ+8JETyHMqjxNNbNZJQ4CFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6B0kCkvtnef2C73/FRekTa1cwNmYltMsaHX7b2aocvPy0Yh7N7EuMzaF5AVChRxPoGuXO7IhiaG2gT7lkRN2s4DZ6sMsdE8C+zgJyqImQ3iXifirHSJrwHOmL6ONZO9b7nd9mkfvty83zyIMtQGreb1xlbEKRsGThdNNNkiM3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2juMyc1; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2juMyc1"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfcad4f979so602889137.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780250972; x=1780855772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mSzCvroumpiDFsos1xbPMHb6ldCMd++1hsQi+z4o/M=;
        b=l2juMyc1J9PAqFVSPVnZEBF92j/U3Tfgsd9K4jDp1I0FBRq7anTPun4gtWUEvEAPWi
         i2mzgMK91p06VdTgpST8rqwFokqC09vUa2edndK6vXVDYdnfK/CaaUd+7l29cam7lECp
         tP/wuSXKy9N8Z8lZabHVAvqvXtva0JnSvto39CFB1iqh0w22xJih4jvcQ/9Mo98+V3zx
         oXdd9ANYP73RohRayvZa63TwIJnVGcBSvHLDuV8AjJNh5al17qkt0OIt8fsXrd43eS1Z
         GkswvDR4SiBFOwsLxTDUkFgvLln8SjLshsDVB+tGhZW37eh1ahoi8JU1zHfN4/LAOw71
         on9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780250972; x=1780855772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mSzCvroumpiDFsos1xbPMHb6ldCMd++1hsQi+z4o/M=;
        b=m7nn4QlB0f+iiDgfBNdTTvFeo/8wxVEiyePQhey0ey+AnQtVKZRZ5nObfj+VRZx2LR
         Gf1uAPV4z8zShyZobQ4/BvxlTW4rYw3c6u3fX7qcV7dYfHyWYJAtkUXmjf69J4O6XS3T
         s13QrH4n3vIsaVFA4yzb98PnoGSMTZfWEMTXkovmzXbyzmf1awFa9faia83bwUTQpckp
         2KIttPDAP7ze3yglHLM0nRRVf2hgHwqim7nOEd55nQlwxERUYUHGbcTnIoZsp2VNvjZG
         GlGU5uGJztUBtiqDHFWXpzNscfpzzBrPFN46XM5fMZAbyNqt4eF0A2Ln2m3+M0xsomyP
         sDGg==
X-Forwarded-Encrypted: i=1; AFNElJ+j2Dzhcnt64rpAqWj3xECQDv9/Fd+2LVGFVfB0Qa1l3vJJlrhpBIRYJVj5g989R8BKtmTG0m4OwGIj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0AfouCNe/iS66yJy3Zmt4OSwsR0EzFCo7hr7xDAISy1SVJRuy
	yF0WCodD0v2oEudpzZJ25m77dW6ek0x/CtRBe3aYKmBcwg6l+w2E0eQL
X-Gm-Gg: Acq92OHYQof4MeaXTgyBYJjJdd3bY5vnR97g4Q5y3YEYKxIygRjxzBga1Syu8SGfYek
	HDoRyiROE/JpjEXaRB9g+/Wc15LngzQhG+AwShG7gti3L31PAk4CN24awztIBIs70ymqorwfQMn
	6Ego0Q71GSAv4vKZAfxZDQWmaoXYYeLrx3rsuBt1Z2SzYVyis83o0XCxyJWEKZwj5xBRRQT7pOb
	5Wpv63DzkyDmgye+aYbWcAHlZe/DuYgjS62zdqdXRN+2WlqyjZDWfzQynma3PM01IhQFj6LyZk4
	FP/iklgo5uifKr9pw2Rsx3DF6/BvU+fecezDWFDrxeQepcW/QNGex+tbiMI6bfOvqwQZR92d1Vi
	zFY/4A1AtCEZy0xxm5UsA6JUU8cj3vIzL9uhrxo6nuAI/POtt1knOrj2rQXa74dCxpZvTgwQVy9
	Os7M/2J47i0Bge5xznBvsw60yDf6t6GGmF+WJFtu+YHww=
X-Received: by 2002:a05:6102:3347:b0:631:b834:e051 with SMTP id ada2fe7eead31-6c6863e35e6mr3356217137.12.1780250972326;
        Sun, 31 May 2026 11:09:32 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfc81ab8a5sm4854666137.9.2026.05.31.11.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 11:09:30 -0700 (PDT)
Date: Sun, 31 May 2026 15:09:54 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iio: types: add IIO_VOLUMEFLOW channel type
Message-ID: <ahx5cuM1xlOVP6DT@debian-BULLSEYE-live-builder-AMD64>
References: <20260530205435.37326-1-wafgo01@gmail.com>
 <20260530205435.37326-2-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530205435.37326-2-wafgo01@gmail.com>

On 05/30, Wadim Mueller wrote:
> Add a new IIO channel type for liquid volumetric flow sensors.  The
> unit exposed via the standard _scale attribute is litres per second
> (l/s), so drivers reporting smaller native units (e.g. ml/min) only
> need to set a fractional scale.
> 
> Update iio-core's name table, the iio_event_monitor whitelist and
> the sysfs-bus-iio ABI document to match.  The new _scale attribute is
> folded into the existing shared _scale block; only the per-type _raw
> needs a fresh entry.
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio | 11 +++++++++++
>  drivers/iio/industrialio-core.c         |  1 +
>  include/uapi/linux/iio/types.h          |  1 +
>  tools/iio/iio_event_monitor.c           |  2 ++
>  4 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 5f87dcee7..2188557cb 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -507,6 +507,8 @@ What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_red_scale
>  What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_green_scale
>  What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_blue_scale
>  What:		/sys/bus/iio/devices/iio:deviceX/in_concentration_co2_scale
> +What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflow_scale
> +What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_scale
>  KernelVersion:	2.6.35
>  Contact:	linux-iio@vger.kernel.org
>  Description:
> @@ -2458,3 +2460,12 @@ Description:
>  		seconds, expressed as:
>  
>  		- a range specified as "[min step max]"
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflow_raw
> +What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_raw
> +KernelVersion:	6.19
This is probably only landing in kernel 7.2 (or later?), so bumping the version
seems appropriate.

> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Raw (unscaled) volumetric flow rate reading from the channel.
> +		To convert to standard units (litres per second) apply the
> +		channel's _scale (and _offset, when present).
Early reviews suggested to use SI units so I think we would have cubic meters
per second. Disregard if I missed some review accepting it as liters per second.

With best regards,
Marcelo

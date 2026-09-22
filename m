Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DDB5625F2
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093283; cv=none; b=R8TTatSXHmyT9aSm9NUiX5aUfNKV9WzHqhNDOOiZ21PGFWC0w5rzGYmUe1dw61eLeGNKgoidoezQaudcUdz/J0XSQQ0U8UuJwPkk7Xpzg/bW0n52Z1fI3HsrKj0z3HIyuIafYE8WwngYWRO+CipM+4RVEmNAUw7IoONX5ShbZhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093283; c=relaxed/simple;
	bh=GOaR3oRNiNzhSpbEcZWvDkegir/uIorFZ2eUkpF7mf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6vzZ5iQe+GxO4rW/kaSIC+n0Qbo9FQuAnMuiK4r4Na6gESLUYIWvU8RvvfCKep4LQybpN0rqrp1hYGpLGi6Hr8uBS4z9dfJ7soyUQ0OuH62rt7r6uyjza0iEbgLkcYBSNYMUb9CqZSIFpIjO+XxuMHqAKXvLGnlAtgap4QuXSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrZwnIRs; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrZwnIRs"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so32033a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093280; x=1790698080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HBbhvK2kEOBfPteB03TY1EsiSBGN3wG4ENtFO8lw2k4=;
        b=DrZwnIRsQ7NbvOs6gJ8be7d71msi9LrrXvn7cEfhcKrnmvRa2PcoxkUmACXZVYjy4R
         yxFcVTi9OAAhVF2+jXmO9UP6RWEXHK04xygvY2hSllV9vT9u+iV/TS7l4VGVF29xJAVW
         qp5YQay5V5F+TBX/P61+ibxiNNbMP8VsEdf8ViWdi6oPAduOvnxFKMfGkTAADWsvKw6b
         QtcsaXTeJ/i+ig9CluAxB7VIPQqeba5hQr8b0erWD/q/cmtOuUtgC/Ry2mhzvZfO6dwL
         FOUy7vhHcDQJ8nOoTK2DvtbJKCiTZMRu6vf8mJvBLAeDPbjtulp/221dgZgJ3GV9bnU/
         vkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093281; x=1790698081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBbhvK2kEOBfPteB03TY1EsiSBGN3wG4ENtFO8lw2k4=;
        b=OSCy0LI/iYbqpnuByCr37dANqGDlma02QeWz8cO0MbXCTDsk+szKsvSoie6d7yNylE
         zTleCz0Gmc4WAcmYHgalX17dnk4tT1uN59Jl/lNxbmKW/ZIeucRoib1706yFqSnFs7VL
         NuWFGz7pZLWcJH6Az2TErcylqBhyidJepgtvRtza3ZcHtf+S+Ln2sgaIyxrSUrxbCEi4
         U9b3oTAHUnoQzvvcNZlIHnseGi5F9KVLLgNlWNMpjM6mmpe7F/9arKY9IY/odpnIyvLo
         Jg7R4fq3DfjrQgMRYzJMxGIz3Q7sgGs74A1mreh8tQBTPV7mZlHPFFlChVBHN3qRZLsI
         8FRg==
X-Forwarded-Encrypted: i=1; AKwUvBza0Ory8MOTuuKM1C0RSHc1k9igufGX1h62Fmv6CwZoUdf7e56jiPJVwVdbeQ3BlyFzAZa11IF1EXmi@vger.kernel.org
X-Gm-Message-State: AFuF++m6/wvJjFiOk8QuLkj7UHGyN0dNmGpnOe46qsaz6wk3A+YcoK8X
	v3iBRsWZkZVW9AbucnXmtVjU5jjoTDl5bcv/D2ButDV2DxCyseT900m3
X-Gm-Gg: AYBFou0S+K/4epA4j9D1wUFOECfClf9n/Ocg7n2QWFjQAFVRNbJ+0LSRegf2/xRlI3V
	CTJcKMIAXTclPoj8YNxLrkgXLmt8ncOTrp111fchy+mDcPUUhH5R5F0aU2DCJaXkAH/GyyHJ4yY
	MxuQPi/N4jhsCdDn3WdIz9wCdn1F9W5OXafiFN+KRvHUNNRy7vIwwZaMHeiI4zu3+GRH9tkk2o7
	v8L1TMkjtJ5SYlHKxKii6jYrdfP76+Gj9UkGv0FJUDk6A33RPumtFf6U5vriVGFQyuDIwOkClaG
	wHJtFyyaSHe1y7UMavu2S1Ijtz0rf8hQqjXHxwQzS3hFUPLO+N4qBX+lQ2a6qxYRnsVh6Er2Wje
	q2qo3AhQFEaxY+KWlM5v9bIbXUVW5ZQZgOHw23fs5y2C7sL2dbZ11PX0+ww/QppjSphOfOeA0DJ
	gmoFhpR4dayiD0ZYwb9hPIaTCLc/7+Z6bOo1LB8FA6h5L1eyFf1lmR4U20jgJPapVN2D26CFegs
	NaIqFcCQDn2pL0Aqoz0ibLYMuLnyk/rJyBO8TNMJhAeaFQ8ZfS2bVY3XuE6DwKBqI+6Amz1za9u
	hf5sunw=
X-Received: by 2002:a17:90b:4ac2:b0:39e:6c68:fd8b with SMTP id 98e67ed59e1d1-3a0736ae0e5mr1221986a91.32.1790093280523;
        Tue, 22 Sep 2026 09:08:00 -0700 (PDT)
Received: from HYB-2NH2WFe09VB.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de20eb1sm63989a91.12.2026.09.22.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:07:59 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:07:45 +0100
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v10 04/17] iio: add IIO_FREQUENCY channel type
Message-ID: <bukynp5qvtqf5jgqnxzxesvt5vimm3i3lvqrwmffc7fecjnabx@rqyeho7v5cnn>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
 <20260729-ad9910-iio-driver-v10-4-aa1f6167729e@analog.com>
 <xevuqaudwm4hpnhbful263yx6r45liuch6yc7xjk2i7wly3oxo@xe2htu27rkl7>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xevuqaudwm4hpnhbful263yx6r45liuch6yc7xjk2i7wly3oxo@xe2htu27rkl7>

On 22/09/26 16:56, Rodrigo Alencar wrote:
> esOn 29/07/26 09:25, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add IIO_FREQUENCY channel type to support Direct Digital Synthesizer (DDS)
> > devices that handles frequency values written directly to its buffered
> > interface.
> 
> ...
> 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> >  drivers/iio/industrialio-core.c | 1 +
> >  include/uapi/linux/iio/types.h  | 1 +
> >  tools/iio/iio_event_monitor.c   | 2 ++
> >  3 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> > index bdf3d4c06331..a45277bc5d99 100644
> > --- a/drivers/iio/industrialio-core.c
> > +++ b/drivers/iio/industrialio-core.c
> > @@ -99,6 +99,7 @@ static const char * const iio_chan_type_name_spec[] = {
> >  	[IIO_ATTENTION] = "attention",
> >  	[IIO_ALTCURRENT] = "altcurrent",
> >  	[IIO_COVERAGE] = "coverage",
> > +	[IIO_FREQUENCY] = "frequency",
> 
> Hi Jonathan,
> 
> Thanks for not giving up on this one! Taking a look at the testing branch,
> I think this line was dropped during the rebase (addressing a conflict)

btw, now that we are at this again, it crossed my mind...
Is it fine to have a channel named the same way an attribute may be named?
wonder if userspace tools could get confused.
 
-- 
Kind regards,

Rodrigo Alencar

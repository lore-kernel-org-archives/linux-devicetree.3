Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2C3B6343
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416332; cv=none; b=TYgnrH+6XjummvuVZdP/16m6kfVdCigsZLSh5r48wr+Ni3ftqTnW5TR+sn/pf1mGIZu2Yn41o5rmo2tBuJ54d0czuv0+xhU42Ee5Se84uiT5TTqEAJyug8cCm/qQq5k9NopSNwY3AEPFmgd+f7sLyw5C5xM1rQ9xRzSQ51WuE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416332; c=relaxed/simple;
	bh=lX4DHJLmOFL2hJOsNkjbJDJK9Gej8ssxYmi+Jgr4XxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb8QBR8ABt8xfhBbCaDQXUsoyRHhM1zyBcyH8pyt5ygrHSVj61CXFMFnTEF/fLFABZobE6PzmEzH653wG9lDzfd3gX/veDVzjk2q2gHaxYFiX1Zxfm83yQdMqDEeI4sXEDQrIIbj6NroJjuC0WuhGQ8K6dqFVreBdJ5T7aRBIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6CB5ann; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6CB5ann"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca957432c7fso2493273a12.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786416321; x=1787021121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LhWDK5hddMROTflmtcNenCZqcdR+LSNsUsjL3zUAaNE=;
        b=o6CB5annWGCwgRV9gWqqHffxj8MtdMbCqK7ZywDheOG3P2hx46ms+xH14eP1D5KkwC
         TppXWbVHowRnzUO5Y5VSeBdhfFFPoBq8varq+vAgzqsFFZuN/cmvuW6kMAJL1s4Xu5Uz
         jRSz1JeOZeDhHeh8MxGCevor6J0KhWhlg1jCIUfqrkh2260I0g7d1BuYyTYt2Idw1Cct
         HRxnXSXPsy1qXq4S8c1l4ZxZEn1M7+4k1V9i1N1IQ+gwWPHw7IO5onQTdEfOcM8SYBtf
         /uSbFDlrQYesX/ygYvczqMzN6VsNyCtH1RACHRdliGHgMDQCOIkXgQjlGtZtU0QjzB1g
         qOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786416321; x=1787021121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhWDK5hddMROTflmtcNenCZqcdR+LSNsUsjL3zUAaNE=;
        b=C9jAIdrV/Z7JUIalXcstz0LCTnbrAoxVZG3VdU5S1uO2QYNW5P1ZKewZ6xughtaU5V
         1Y/pC8MLTAHN0SofwgbopVwu9Rf0gXkvC9GTdHQsjOgE0YNf53AmEczoLq9I6J92/MFq
         1UBafQbtmJH1CnoAMMlrEcu/VgI/88Qdb3mngJQo5tbnmVzmujP78bK4F05D1Hy3eZK4
         s3AnVyoxhFlG311LvDxVy8lkTCcqaOz9szyCyZfRkzQ+frL5iWNZQ+F5x0ERLnPphg/7
         cjKEKW9GNPHB2A3OQ2iEMx0oidfsxr6wMh8zNPfAA24pANkPuH0+VBzu/aJATr2iDyit
         ma+g==
X-Forwarded-Encrypted: i=1; AHgh+RoTNAJT9imEU8uS27v2Oe3qdnQ1k9EIbvFNl+3CSutjHoL+jbDGGhJzAvB+NmtmKuT89xvN8BiwFaID@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxlnsr+SrZjoj5WUkwNHGLpJQvy7dmSj/aI45O+2ZVTpnQpiS4
	Z4L+SUZ+czK3UmTdOsR8Cy6FirMarUBIaeygX41KbQH92IDY74xVNu+b
X-Gm-Gg: AR+sD12FF0HZ044GmiM2yDZ2GMx0u2p2OAo0k5wlW3eCKczdrdwegmNrKyujoX888g5
	PQPGtKOz5zIKUZlHJs7IhypTHMkmhK3hvv6sgq6SlFHW+EfueN/Y876jbVIV+QVk8ishLm2ZxqZ
	tB11ZxGdSJMBAv9qDt3aWyWeTS1Ro27G65+22LoIgnXFFxZhsVrdKlXIGvVzJAJjbM0UFArOdkF
	MvbxvoMUq6mvki+KfukfqNUPfFD9aR6E5wRx4g1AhZM/t84fRKB0B5lx7+do2MfNSaHHQgSHdNR
	tTxO1DupauAwXgZMqT9mZeKT15iXLE5/8tQPwm2nXq5q6qv3uP4WZLumQLwrudxntLR5KRZB6QY
	4/xOLjKGP5g3R9K4YtkeDqiZ4VXM+piUlZrwlLNsPMmgJY14wYFxUxgZKXjtap1M7wTaEZBRMYr
	ExCm4EfAb1iyGrojvo1pcaL7uWxTwTImH8+BIsy2z+dWMkhv5cEl5dgY4lo2AGIEMdslVprHrwK
	is7aIxg
X-Received: by 2002:a05:6a21:1fc5:b0:398:8870:b58f with SMTP id adf61e73a8af0-3cc2b872b58mr522952637.14.1786416320953;
        Mon, 10 Aug 2026 19:45:20 -0700 (PDT)
Received: from localhost ([2804:30c:4018:dc00:8be4:f5b8:4af1:4728])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412035e08dsm151216c88.1.2026.08.10.19.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:45:20 -0700 (PDT)
Date: Mon, 10 Aug 2026 23:45:55 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, julianbraha@gmail.com
Subject: Re: [PATCH v9 5/6] iio: adc: ltc2378: Add support for LTC2338-18
Message-ID: <anqM43NvcVhhkkWI@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1785186980.git.marcelo.schmitt@analog.com>
 <39f2ff86cf736ff97286d6451fcc45fdba6732f9.1785186980.git.marcelo.schmitt@analog.com>
 <anl_v428aTL6waBK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anl_v428aTL6waBK@ashevche-desk.local>

Hi Andy,

On 08/10, Andy Shevchenko wrote:
> On Mon, Jul 27, 2026 at 06:31:58PM -0300, Marcelo Schmitt wrote:
> > LTC2338-18 is similar to LTC2378-18, differentiating from the already
> > supported part mainly on the embedment of an internal voltage reference and
> > addition of a resistor divider network connected to the input signal path.
> > Extend the device driver, handling the internal reference and input signal
> > attenuation, enabling it to also support LTC2338-18.
> 
> ...
> 
> > +static int ltc2378_refin_setup(struct device *dev, struct ltc2378_state *st)
> > +{
> > +	int ret;
> > +
> > +	/*
> > +	 * The internal reference buffer amplifies both the internal reference
> > +	 * and REFIN by a factor of 2.
> > +	 */
> > +	ret = devm_regulator_get_enable_read_voltage(dev, "refin");
> > +	if (ret == -ENODEV) { /* refin is optional */
> > +		st->ref_uV = st->info->internal_ref_uV * 2;
> > +		return 0;
> > +	}
> > +
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
> > +
> > +	st->ref_uV = ret * 2;
> > +
> > +	return 0;
> 
> I'm not sure about others' preferences, but I would do it as if-else-if and
> remove dup return 0.
> 
> 	if (ret == -ENODEV) /* refin is optional */
> 		st->ref_uV = st->info->internal_ref_uV * 2;
> 	else if (ret < 0)
> 		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
> 	else
> 		st->ref_uV = ret * 2;
> 
> 	return 0;
> 
> It also makes code shorter (in amount of LoC).

This has already been applied to IIO testing. I do send another version of this
specific patch if that's okay.

With Best Regards,
Marcelo

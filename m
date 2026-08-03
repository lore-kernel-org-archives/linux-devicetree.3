Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8A426430
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786174; cv=none; b=sFA/ZGL+/pjaWTAKm2P2n7TZGLmDKuLMTrOGQars/oa1mpmj0BFPrfkwDVfVRNT6NsLeV+cJdPGqtkdi47mJstkXzIJWhxmkHqPdQgTqJRpukVUVrGUe0NhALHa++ytUau18Cjs86aSMiACxGLIIyt6HqprQRojCssFD7o/npSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786174; c=relaxed/simple;
	bh=BvCniH3Sbd0cmDdkACSU9x4ggDHaCilOtJtpFfl20KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXyLyuRRaTG/tfEP2CCGdc7XPARjZmOg19U2+hPkBuwzLK4liDfWomJ7OnMjcYrHRiIlsonKfhS4+pbZ4PcqmcjA2UpkzHiBMiCpLVk/1w2lEXuqXk/FB0Id5s5izyouPqBj7MvgcoVFY05QmE0Pw9F6cWCLUXy/SQkklN9/IxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ966Wpi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ966Wpi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso11629035e9.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786171; x=1786390971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08zz6IkbTGpUfV4/ganG7khNzW8wQ7cGp51Ff0F/wZA=;
        b=NZ966WpibfPxszsZpkiL1+2wd3w4WPlYebtPxRZnGxQoRJvyCp+L0gmubcbORtvSXx
         NtgQX7tPOg6+pIg1P8jZ07r5eA0AesmWWF1EW9d5gACEC0LD8S1tyaHyVic8+jz04oF/
         9p5CU1LPDvsfatd9bgax2EmyONiuPlOuE9DkY6UfNf1RkiN4MhO+1ifKDJPpn7L9sKN4
         6cBlwMvCffxgZ38Tc3O0iw3lxbf89Q+2bNvBYttRfYMXRisqp+DlQfbOUhE0lkakq06M
         IgfHW5ZBKXPp8xhYPO4E29//TIiXLdaCNDmNgFzyWR6lMlCNqRZwFgYVr6RZVYpQ7Pbo
         YVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786171; x=1786390971;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08zz6IkbTGpUfV4/ganG7khNzW8wQ7cGp51Ff0F/wZA=;
        b=J5cTeWFF/PXiPOXsIYEORg6G534AtW2UhErFdUucBS89v/Q6Q6NHOuoKkFCXmDRcmj
         K5HtIc5Zbu1twZYj034jAq6j2rWRVNhFsKYYz6akznV6IJq1pTx/iNWKKIheFBnFhaln
         2DlrAaE0vbwl0HU3Ud5mEI0lY3serCJ25dYxlbq1hUEEJZ8ALVwtJVCb+gE5So1dYR92
         TigwMkx+/IRU1ONcPvYw71qRP6iGrpXC8hAEwIhOPG3dg0mGihD8ULfTvPgq8otvUpNp
         HsKR/m0CulIaGmAJ1FJnEHo9zH7+b73sEZwkJEtqee0W+797HyMxxsVZ9FMu6o7roDyD
         3Izg==
X-Forwarded-Encrypted: i=1; AHgh+Rph/DenPOeCgmJceqjnuiwEUgyrASNKqpv9OmVB6QeolhJGsevsydr2fvX3VJCKkOsf1+fQgiPm5b+s@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1NH0VycrlF0w6yUgPBUqEGLDWuAG5v7bir2rxE5K/Jeelta8
	9pPG84Jtcw6zQPd6XUK1pRyrcjamEJyv7BSnUflKw46Is8eTAssfLKsq1C/wTK4CQoo=
X-Gm-Gg: AR+sD11/9twulArgV1OuaVDoZOo6AZtnw7Z88qJp09Kw3Maom7Aj/dKJlEUhK5vLo/J
	x3oCOSh+iAVhCWgVLrll9chAVagcKw/3hsSH2xWrnft1b/uYJFRFIG4GPrUEwicKo+C4thbY2UI
	TCa/eSHKSOcDk3HqPH01I3oy+0Iedv4/zmGbSGxRAzpQ3RlCDg8/QLfiCS17y3F7YfLN853ajOz
	y4TxJYd4hs+9S2ih3cz0zaeEIrAFU+m++PmpW1JpKVr5d8DhqdxYQ85XaTHjN9U/XGjhmeE805u
	RtWFHIx2SS0VEEGkuE/GU50i2XhGq09DHQAQsuVXb46X5785o85BHpTzv13mu3Ng2e9T+dZ/DUg
	0k2ml1pB1QdU1iLUrSGazTYRZalFUZ/2Wm3fzoTMnd/GNWQnsEv1SWVTrGY3/7R+Hz0LtS/RbR9
	X84jPzKFp/d51iAsDFXBFazWwJpn/nBK3gOrH0drgpBXIri0fiqu8J/xJ4J42KwRNulLmfm5rpX
	4e5RQy/ZUqjXuEFpeCzhi48Y/FSqJhNF82xvQ9Ut2lfGqP/GJG/r8SFvS1FmoROH1vD3ew7etmC
	+118gXL6PXOQDcBhL8LPmz4lkplR9Xk7kRWFqL3T0l5v2yKzOJJAD+Pl2mSGLt0WCqsh4FP+2HH
	fnb4vPGx9InSvNPK/E/kf4sj5eaiHTLWLQw==
X-Received: by 2002:a05:600c:34c6:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4980c66b50emr287430705e9.2.1785786170789;
        Mon, 03 Aug 2026 12:42:50 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm305796885e9.1.2026.08.03.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:42:50 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:42:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 andy@kernel.org, nuno.sa@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: dac: mcp47a1: add support for new device
Message-ID: <20260803214248.69c3c96b@systembl0wer>
In-Reply-To: <20260803174441.294171F000E9@smtp.kernel.org>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
	<20260803-mcp47a1-add-support-v3-2-540e71b4fd2e@gmail.com>
	<20260803174441.294171F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 03 Aug 2026 17:44:40 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incorrect SMBus commands send extra bytes and corrupt the DAC hardware state.
> --
> 
> --- Patch [2]: [PATCH v3 2/2] iio: dac: mcp47a1: add support for new device ---
> commit f73263d5ea24798a693c0c4cfa738627794988ba
> Author: Joshua Crofts <joshua.crofts1@gmail.com>
> 
> iio: dac: mcp47a1: add support for new device
> 
> This commit introduces a new driver for the Microchip MCP47A1 6-bit volatile
> DAC. It supports writing and reading the raw values and exposing the scale
> using I2C.
> 
> > diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> > new file mode 100644
> > index 0000000000000..0bf994aa0e4f5
> > --- /dev/null
> > +++ b/drivers/iio/dac/mcp47a1.c  
> 
> [ ... ]
> 
> > +static int mcp47a1_write(struct iio_dev *indio_dev,
> > +			 struct iio_chan_spec const *chan,
> > +			 int val, int val2, long mask)
> > +{
> > +	struct mcp47a1_data *data = iio_priv(indio_dev);
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (!in_range(val, 0, MCP47A1_MAX_STEPS))
> > +			return -EINVAL;
> > +
> > +		return i2c_smbus_write_byte_data(data->client, MCP47A1_CMD_CODE,
> > +						 val);  
> 
> [Severity: Medium]
> Could this corrupt the DAC hardware state by sending an extra byte?
> 
> If the MCP47A1 expects a single byte without a command code, using
> i2c_smbus_write_byte_data() will send a 2-byte payload, writing 0x00 to the
> DAC before the actual value. This could potentially cause an output glitch.
> 
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int mcp47a1_read(struct iio_dev *indio_dev,
> > +			struct iio_chan_spec const *chan,
> > +			int *val, int *val2, long mask)
> > +{
> > +	struct mcp47a1_data *data = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		ret = i2c_smbus_read_byte_data(data->client, MCP47A1_CMD_CODE);  
> 
> [Severity: Medium]
> Does this destructively reset the DAC on every read?
> 
> If the device does not expect a command code and interprets it as a data byte,
> calling i2c_smbus_read_byte_data() will perform a write of 0x00 before reading,
> destructively resetting the DAC output to 0.

No, this is a false positive. The MCP47A1 is SMBus compatible, it will interpret
the command as an instruction, not a data byte.

-- 
Kind regards,
Joshua Crofts

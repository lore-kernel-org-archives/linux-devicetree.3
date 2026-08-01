Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEAE2EAB6F
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 05:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785562136; cv=none; b=urqqfqxoCuYEHFBmwaFdTt32yqdajKvo540bB3+TiJyMPCWwuV5Ae8j0AuSGMQWHaKwF2mdBNg9w6PZek9rOU/EwnvRQdCcYElW+KHxsC7A3eKi0PAVSU75s5NoPyYWv520Vc/Cki1P6zYRvca4DJBilY3srdlJ+6dP1GnRNo5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785562136; c=relaxed/simple;
	bh=NKRiEWM7OmBlcThohq6rD6o3xFY86H5i1xR06buE38k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ym5cCLYysPkChS789Tp3dh9QW49yrE4NpXa0A4PZXqsDPd++9sxTiuUluae/sihUvJ75Xzmq43UNQlVbwFdt9bJzjmTnh+DlKe6vpdnOhPTGWfkTW1QG7xhelUHqMRbFB2OF8GdrnUBGe6p9HByPCDuEViL86UMS0GqMXgfYt8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmWu6LZs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmWu6LZs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1051567f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 22:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785562133; x=1786166933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VGWLDg96xg9X2R8tFVFYr1K1sw/dzYhsye3xehVIvdQ=;
        b=CmWu6LZsuZhcD01Ga1R13iKDSbcxHqqtUNyxZmduhrB0cme8EH1zpfnf6yAalWZzYW
         yZr6ocABG/0YiIWgWWcqXNQQUGE+Utlz83gxgvpU45kBntYIs537DFmvnqdMsWy+m5zd
         HSCsGMs5Kt2x0+viYVXfOCGWf7Hui2E6X8kdg8XU5jZryW1uh0k2+HcpBWo6QGwraOtD
         3noJDxHCM9cCtnEaC0Of8gMjnOZxcyWSRbMPPrQNDR3dc19/xFf7cqWHHe9L98MdpQB+
         sy3wEuFrzczNUy338VcYVpUEuLoVrv14g2rp7qkKMKgewdqt9kb/ERDUFMCiPiP6gRtN
         5cOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785562133; x=1786166933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGWLDg96xg9X2R8tFVFYr1K1sw/dzYhsye3xehVIvdQ=;
        b=YwG2itlk2i3YKyMKwpe9T34d/z2cjgNpfUMWXbqiiqgA8rMu+Sx+NDbYfDaZdzabB6
         ifditrQxZyayMHYqDlyqMQ0wuGjo+9lPCykBaYfrQvKilbr8DYtoz1+Jnn77h2POjCxk
         JJbXvb5vQwtuDEcz0wEOtCwYVzCZ+dlAynwC762LFL7RMHvlPksvXt3W2zZ9QDVQ2PAn
         +XHlcfg7ZUvDe7EADspt796iSzun8cAuY4c8wvqjpxz/xXsFuNOUqQgQh/GlVk55GqaI
         nwf7E76M09+elHFguNY/GXaaISDS+llhmNskPyOe62ZjFgL4w9NKZlO7uVKW5dPfTC61
         IBXQ==
X-Forwarded-Encrypted: i=1; AHgh+Robv+wHUdzdWEOnFeqn56TGag3uCa/eCJUrYBwIqyl9lc3WZjVPo7Y/ntpkql/tsN/sf2AZnwoREbz6@vger.kernel.org
X-Gm-Message-State: AOJu0YwLV05AGtBLQshTMt97R+LwYuWrhl9TyuwFDPKbUmW7RAlhHsmm
	WNmmSQXnw48gigFRBAvDUBMmOjheLQioutEs/bOAFLbWqlj8XlMZ9g84
X-Gm-Gg: AR+sD109ibxarIe1OsvYTlTwhczIzsKjVJCTu2iZhj5FqghMjTDR1OnH07TvDy3f4nQ
	Ksr7wVVuAiyuJHp7Wr3zbqSFccx7l6An6YiJiLuCkhVve8qlq8AsbZdtSiEnT6DnSZOHhqYq7v7
	5YF+8zpmnmhjp0v4+769FmVBuheJwPhVcujqx5RgvvTGJUumC9ubzVt/nLlwMG2KO6UdLXsTLd8
	Fxgjlgwe6qY2Xrp9cICjfrPMoKI61nsyVPeyEOI02xUdKsc1Cd5LJs8cGho9SSmNQ9OCkq1lsGZ
	vJtmdc7munNoKGSwWcIinW3Wx9T/QxA2V+ylKYU81l6nw2wfrBo8YlTcfI0E9PHQ1Dw3xgD2rZi
	7eIttk/6luJa9dRAFDOslx/vrKqKL3M/OqgZAZ2d6yHByg3HMSTVXHrydygAoMhTdoAPT7nT0Nt
	bzMqqwNR4OxDMXDIKT90+co3KqKV+QpvAyVwOxOvjj/tXPBOEd4dGQLT+yq+YiuIU1SV0hmAQ5j
	1eh7LX7Q9eBN2XJ7bzYcXNvEePGcJpzTHH3fYNKdI1QMzrgQs0LbgIFy8SRg5WIQ60h1/JxvULM
	2ExZNtQmdAf30xg2o2TPf07/HGPdkj7wCo+xZXztHNTR/ga2JF6vsbR5C+AFkx0sgrHE+ERWTUE
	avbvsnW/lUwA43bwKmapqJYX8RH3Pjnuix1QNjYcD3I2t7n+Ocfa+ReP/ArDmomA=
X-Received: by 2002:a05:6000:1946:b0:47f:56f7:7a57 with SMTP id ffacd0b85a97d-47fd7309159mr3519771f8f.28.1785562132890;
        Fri, 31 Jul 2026 22:28:52 -0700 (PDT)
Received: from systembl0wer (109-81-110-164.rct.o2.cz. [109.81.110.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm13028897f8f.11.2026.07.31.22.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:28:52 -0700 (PDT)
Date: Sat, 1 Aug 2026 07:28:50 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 linux-iio@vger.kernel.org, andy@kernel.org, nuno.sa@analog.com,
 dlechner@baylibre.com
Subject: Re: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device
Message-ID: <20260801072850.6f5d255e@systembl0wer>
In-Reply-To: <20260801033013.19ef2b2f@jic23-huawei>
References: <20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com>
	<20260727-mcp47a1-add-support-v2-2-d4591a2ce69e@gmail.com>
	<20260727184226.DFC1E1F000E9@smtp.kernel.org>
	<20260728151559.000067ef@gmail.com>
	<20260801033013.19ef2b2f@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 1 Aug 2026 03:30:13 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 28 Jul 2026 15:15:59 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > On Mon, 27 Jul 2026 18:42:26 +0000
> > sashiko-bot@kernel.org wrote:
> >   
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Potential off-by-one in DAC scale calculation denominator.
> > > --    
> > 
> > Responding to Sashiko's comment.
> >   
> > > --- Patch [2]: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device ---
> > > commit 38bec2fbb020c3f749c52a26e5cc3e78e72eeaf5
> > > Author: Joshua Crofts <joshua.crofts1@gmail.com>
> > > 
> > > iio: dac: mcp47a1: add support for new device
> > > 
> > > The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
> > > which communicates via I2C.
> > >     
> > > > diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> > > > new file mode 100644
> > > > index 0000000000000..140e93ff2ba01
> > > > --- /dev/null
> > > > +++ b/drivers/iio/dac/mcp47a1.c      
> > > [ ... ]    
> > > > +static int mcp47a1_read(struct iio_dev *indio_dev,
> > > > +			struct iio_chan_spec const *chan,
> > > > +			int *val, int *val2, long mask)
> > > > +{
> > > > +	struct mcp47a1_data *data = iio_priv(indio_dev);
> > > > +	int ret;
> > > > +
> > > > +	switch (mask) {      
> > > [ ... ]    
> > > > +	case IIO_CHAN_INFO_SCALE:
> > > > +		*val = data->vref_mV;
> > > > +		*val2 = MCP47A1_MAX_STEP;      
> > > 
> > > [Severity: Medium]
> > > Does this code use the correct denominator for the scale calculation?
> > > 
> > > Since this is a 6-bit DAC, shouldn't the scale denominator be 64 (2^6)
> > > instead of the maximum step value of 63? Using MCP47A1_MAX_STEP (63) here
> > > introduces an off-by-one error that could cause userspace to calculate
> > > output voltages with a ~1.5% LSB scaling error when reading the sysfs
> > > attribute.    
> > 
> > Yes, the max amount of steps is 64, which should be passed here. I'll
> > add a separate macro for this in v3.  
> I'd just use + 1 at this location given the clear relationship between
> the maximum value that can be taken and the number of steps.

Good to know, for some reason I thought that this type of stuff was
discouraged (MACRO_NAME + x would seem messy in most cases).

-- 
Kind regards,
Joshua Crofts

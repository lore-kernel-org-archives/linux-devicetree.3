Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD272621
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198560; cv=none; b=liklaXwHZ9oZQFcFw/LlG50v8r+VjsKKmqX0xkRon5JpBHSuEEZCYylMa+dVggXriG8p8kKfgvjFaZWlatfSy2toyrYamocZYvsrsJSAugZ6dVzlFDxxsTdSSzHjjUI70er69LfLL1WATgutlqW4tiJAJlGCKzBMqcHpGQO3MNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198560; c=relaxed/simple;
	bh=PbjlJHekCB32Q3mkt1M5NEoLD2mQfZVW4FTHYL8AmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrF+VPTvHzvuYOouqIaiBjstsh9z6tOcuZbhulu5oNzsoC/pZu6vLrAKb8ndNcidmcVj2gqORC+SiS84pH7ON97AJ1H6meBFN6/A2oqPT7b49OwAjkCiPDlB3YoVd2RKroB75WgprnzzNrbZIrpfwCQHaRVbLDWcNqVx0NAYyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ja3nuv4Y; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ja3nuv4Y"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so1195673eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 17:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792198558; x=1792803358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KG+QW60TgA6JIhij7lcxYutadNlvdPWNNLolkVy1zbI=;
        b=Ja3nuv4Yo4HjxADM6N2507xkzhBOawlkshBxbzMfn/oo2ZJ7B/1jIh+cogm2FOJl+y
         +URaNAeei3rj5SYzBPlRo7AzGcv0ywc382zUz39ruPnpRfEZAIdyVibpyicbbS/IQeyV
         5K+hK9dB5q5qd7AMIzSqIShYVyQos45sSgP1NRHW0uGM1mSbRDXQ81U6Xh8JZ791SXk7
         7cMsZS180iSoq6zHbj+r8Gr9+pmAIfgzoQI/kqaLe6uYi++IGbhmCKxL1M57m6syonTS
         A2Q7rX10ou0u5eZCIsbqOAYEID1bh9nJWF4hsVCgzUG7kH9pO3wk6xbJn62N5XYyp2jN
         8lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198558; x=1792803358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KG+QW60TgA6JIhij7lcxYutadNlvdPWNNLolkVy1zbI=;
        b=LMe5bPRKcf2WWftMYh/ZRxrA4h760Zk2Pu0QUSU69NO0zj+8igGxO7+Fi1CiL71OxM
         aGcU1YfScAc7MTLa4tPkoQp01rKlx/sRPXoo3FY0paIv43qNbLl+/HLeSVbUMPoGUskc
         5Y+PkR3iICeQzVGpnNUiyDqlkpWGCuT2Rf1xyzYtRq5E5vNYigdW5cIcw5VpreXJorlQ
         youoi6nZbWnVqD+DyJjG2rJWvQE5X/nqpZmpGyekhfrgymSP9s8JtuDZ5j1kcfs70vSV
         yWAZcOmAgG+81pg/ukn3FXTHX0I2NJqRm7KtpSydqQNfmWkIZn7AcylqRdzDmeC0o3+u
         bc9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxesKiOS0Vegh6hPdarQu3aZftt1i7tUenute1QSw9yJ50miEmBcHojXXsiMnkOpSIGuylLBBgsbtbp@vger.kernel.org
X-Gm-Message-State: AFq9FYKPnMngy7O4H0u1d+1AIoDWFWaTXs4Daxy+m/QO9WJfo6cwjJs3
	+CqKVQevoyz1Ec9LR0tvEmgDOaHCWCs2MnvYZAUJ4r7kXPD9WfDkBddu
X-Gm-Gg: AYBFou1K/0008liKTU6bblYEKQWVr7VlJW1T8m994eEEOY5Ggr9Z8v4sZiLRmc1ZD1c
	zwmb9l+uRUahZ4s6r5PhxAG1ZCu9aUm7BZup1Bjge9PthAyrrm4RNUbDBFuTjtPOFAWk+2cPAM9
	WywYul8CM8eLkC9WubMbEmfSnw0Mp6eG0P2N1EOXsECIM8798zvkDUD+Arc/u8HpzeqVYkdF0iP
	nM8/jbjaxBNIGg5vQH9T9rdWb/ReXDxVgo3gQhwZLUklUn56a72M+WxHuv+eWXP44XadO5bakMA
	TMy7wOANzZeBodQtVNEMHSZNWfLK4ptqTyVm7ZUfS3yjkNKbjkFKyJLBuCj6jrFh33YDOcb1m30
	CGO4ss4u32rQxDUWfYGaBhluvsw+4WFAC6y7jtI6c0RKsfXqF+lmudqVew5xJy8xuhvRiA6SSzq
	4g5ZJGli4N3iS+suHjfg2PPOudB0WN/lamHwjY9utVu+19jNxMfFehEJn38UXkAfmNNGxvEXrfn
	OiFEA==
X-Received: by 2002:a05:7301:3a8f:b0:360:8a6e:640f with SMTP id 5a478bee46e88-361a3719b9emr1823808eec.39.1792198558239;
        Fri, 16 Oct 2026 17:55:58 -0700 (PDT)
Received: from localhost ([2804:30c:4067:b00:a68b:4892:7af1:b51d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm11354769eec.6.2026.10.16.17.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:55:57 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:57:02 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@analog.com, jic23@kernel.org, dlechner@baylibre.com,
	andy@kernel.org, Michael.Hennerich@analog.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 10/13] iio: adc: ad4134: Support SPI 4-wire mode
Message-ID: <atLH3iWLXQqyctu7@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <ec26e0e1cbb6572c8eee391951c084a7c264887c.1791309733.git.marcelo.schmitt@analog.com>
 <179199692830.658576.14049229425648931434.b4-review@b4>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179199692830.658576.14049229425648931434.b4-review@b4>

On 10/14, Nuno Sá wrote:
> On Tue, 06 Oct 2026 15:19:00 -0300, Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> > diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> > index b5207f16054e..debc2ff02705 100644
> > --- a/drivers/iio/adc/ad4134.c
> > +++ b/drivers/iio/adc/ad4134.c
> > @@ -308,14 +423,18 @@ static int ad4134_register_read(struct ad4134_state *st, unsigned int reg,
> >  		.len = st->crc_en ? AD4134_SPI_MAX_XFER_LEN : 2,
> >  	};
> >  	unsigned int inst;
> > -	int ret;
> > +	int access_ret, ret;
> > +
> > +	ret = ad4134_claim_reg_access(st);
> > +	if (ret)
> > +		return ret;
> 
> Do we really need to claim/release for every register read? Can't we
> just select register mode at probe and leave it in that position by
> default?

Yeah, we could have it that way but then the error paths get trickier to handle.
For example, we might deselect reg mode and then fail to select sample mode.
Because of that, we would need to keep track of what mux_states we hold lock to
avoid deselecting a state that is not selected. 

After sample read, we are susceptible to succeed sample mode deselect and fail
reg mode select, so we actually also need to check we have reg mode selected
before register access anyway.

Not to mention we would need a driver .remove callback to check which (if any)
mode we have selected to correctly deselect any multiplexer state on driver detach.

> Then when starting to buffer, we deselect + select sample mode
> and when exiting do the reverse. Seems even more appropriate when the dt
> mode property does not want to use DOUT at all which means that all this
> select + deselect is really unneeded.
> 
The select/deselect dance is not needed for minimum I/O mode (no CS wiring) so
I made it skip the multiplexer switching entirely for that mode.

Thanks,
Marcelo

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1FE3D952E
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087706; cv=none; b=dARErRkNG6WokUYsB2iFu9N9GKql6hwS1WenTCA3GbohPYGhUK4saHjzBYRZv68sQ+ctbir7oUyssoGAMmbkR3dGfMtBz7B7Pwk2/Mk5JNXFm/dd1ejDxh01I21YIegpXQFM5Ls5fgeuNO8ECmtASuDwYggFSXD5MdAAulQgPTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087706; c=relaxed/simple;
	bh=sxt78hW/PsWxFDCcSOLlFJjgkvoHFNRhW6v7oBKogR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNHcS1XbDDu4kYNzYZ+AUucdMPsWoAA35hjXjdD3wmdLG26KZkFJ6BO7JFfeVf+YbouYfWgpV35d2FdPSwpMjDWKBF/fUUE1/9DONM5Hb6DE11Egejnqa6TelkUxirBDyyuOLkiI4VL/Mf2ZGTBxefJ8fQOOtUDFfBK7zJBMUnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+4u8vnx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+4u8vnx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46ed4f66256so561758f8f.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783087703; x=1783692503; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ff/YHnBqJa7Fo45VaTkgV0Ahz6JMeo4m1RJIBiXmpRg=;
        b=q+4u8vnxsIhU8W4cb6MxioztC1t5YtdadvtxxnTYqwq7gZZtqFy8rhqN5gOD3iJQ19
         DzQT3yv2NU1/R7armS+fI8RXXgtIeiogzz0yaJ9DeQusmRfZze5waXXEGpORwtVLf7si
         BkBTajDyPz2q9xZlblsl/lnTtNKlEFjR5n8HR+jLO7C5CxdoHQD2RD7+TfYGGWZ5J3KA
         mssgN8UreyxZUJCA3dyBPV/lXX3ASslA7BQxz+LEhbqrWdN/KtdseM1Nn1ckuOTJ4sBJ
         SQ0MilkYJkqjzEqI1VT160eto5kDgb/dkEU+WWZgCQuil6OXpVgK675+k7DDB+xDpdng
         cuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783087703; x=1783692503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff/YHnBqJa7Fo45VaTkgV0Ahz6JMeo4m1RJIBiXmpRg=;
        b=UugvXkcoNRJ3vBQSvtKURhr/UhPkPkFXj5G43G6mzwkPM7Ya/19lVY31FZ/ymHlQV/
         2EAc7wmzG8UGcjhNeFxORAVesPt7CMOljjHEOI14Frg+o3JAf/AmTYneJyQZKF2jJB4m
         7xOjkPnkmPFvfS7ESA4Hainr7CB2CbDHK7LHPhd6jmbiYXAyIPmduuK1O3JyvzIrVReP
         x4I5Sieo5LPFYf9L4j2hLRVxBOC0FZSl6cR6nJsBpZfGIDu2odw2IiiBJeppT+xa0KsG
         ViaAM1108qZIL1UK6oIUNbGFvvfYDSl5P//czRmg9utk3R9Mvw7Sa/a2AirX2nR2O9He
         WbNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCy2986UMXhfa3D5MdHKDH7C6wc0i8hsAnEb8dYrBcj2+FRwf4eRhBE0E9m6pCigJQlMTOrFlJniaW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Yo3mVPJQXkRpHU8p/iNk/I1NdiLUtvvR0EfPQ0tuN+n/mTic
	K87Bq8yij9Y1NmN2Sd0V7dAd4S4Z7Knae2RI/IQRfl9M6kLA7gZeayfZ
X-Gm-Gg: AfdE7clztj3f68q+jjJm6JriwPdiTNz7eYsduYGxRnGorCTXEeAOTRm9FoEmRs92kPh
	/nHP/q7sIUAmI6tSJ9USbuhkpRtMV9eebOsFiXIGM5r/YEhJoerzvjSAQBMgFRP+wnSobRxHpZq
	Y4onzPPBKHieKS5pkAGdkg420WxJ40Ap8ze5N/Rz2a1e9gTVeflrgMDTi0k34l76a5pfd27Rcya
	Xj1q4+KCiwZP5uRyBr0WF2mn6k8TpD9mpL9egaPhsAdOqQnfLMzyKZH3n/WRdUPog84WkaqnCrG
	lmgZ7jEc08dA09ju5aaBb58ukIrgQNVj5BY5DiAfws+QZV9Jo1sgMVgO4AXl/5tUokClc5hV+qD
	MpEYM0VIQSt3dQ92gDl7dtsVSSSNAiH4pCzvrqi+BYQFgvcYlqtzYbRNBvPbJND384Lv2JXibhb
	/xsZ+g
X-Received: by 2002:adf:e012:0:10b0:474:18d9:8371 with SMTP id ffacd0b85a97d-4775bd0ed70mr11785200f8f.28.1783087702435;
        Fri, 03 Jul 2026 07:08:22 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd46asm19665003f8f.36.2026.07.03.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:08:22 -0700 (PDT)
Date: Fri, 3 Jul 2026 15:09:26 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, 
	rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 12/16] iio: frequency: ad9910: add RAM mode support
Message-ID: <ake_YWfvVC9RQ3wu@nsa>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-12-79125ffbe430@analog.com>
 <20260703040544.08a8ea5e@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703040544.08a8ea5e@jic23-huawei>

On Fri, Jul 03, 2026 at 04:05:44AM +0100, Jonathan Cameron wrote:
> On Thu, 18 Jun 2026 14:27:28 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add RAM control channel, which includes:
> > - RAM data loading via firmware upload interface;
> > - Per-profile configuration and DDS core parameter destination as firmware
> >   metadata;
> > - Profile switching relying on profile channels;
> > - Sampling frequency control of the active profile;
> > - ram-enable-aware read/write paths that redirect single tone
> >   frequency/phase/amplitude access through reg_profile cache when RAM is
> >   active;
> > 
> > When RAM is enabled, the DDS profile parameters (frequency, phase,
> > amplitude) for the single tone mode are sourced from a shadow register
> > cache (reg_profile[]) since the profile registers are repurposed for RAM
> > control.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> > diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad9910.c
> > index 3fe97aa887c3..c4e179dda715 100644
> > --- a/drivers/iio/frequency/ad9910.c
> > +++ b/drivers/iio/frequency/ad9910.c
> 
> > +static enum fw_upload_err ad9910_ram_fwu_write(struct fw_upload *fw_upload,
> > +					       const u8 *data, u32 offset,
> > +					       u32 size, u32 *written)
> > +{
> > +	const struct ad9910_ram_fw *fw_data = (const struct ad9910_ram_fw *)data;
> > +	struct ad9910_state *st = fw_upload->dd_handle;
> > +	int ret, ret2, idx, wcount;
> > +	u64 tmp64, backup;
> > +
> > +	if (offset != 0)
> > +		return FW_UPLOAD_ERR_INVALID_SIZE;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	if (st->ram_fwu_cancel)
> > +		return FW_UPLOAD_ERR_CANCELED;
> > +
> > +	if (AD9910_RAM_ENABLED(st))
> > +		return FW_UPLOAD_ERR_HW_ERROR;
> > +
> > +	for (idx = 0; idx < AD9910_NUM_PROFILES; idx++)
> > +		st->reg_profile[idx] = get_unaligned_be64(&fw_data->profiles[idx]) |
> > +				       AD9910_PROFILE_RAM_OPEN_MSK;
> > +
> > +	ret = ad9910_reg32_update(st, AD9910_REG_CFR1,
> > +				  AD9910_CFR1_RAM_PLAYBACK_DEST_MSK |
> > +				  AD9910_CFR1_INT_PROFILE_CTL_MSK,
> > +				  get_unaligned_be32(&fw_data->cfr1), true);
> > +	if (ret)
> > +		return FW_UPLOAD_ERR_RW_ERROR;
> > +
> > +	wcount = get_unaligned_be16(&fw_data->wcount);
> > +	if (!wcount) {
> > +		*written = size;
> > +		return FW_UPLOAD_ERR_NONE; /* nothing else to write */
> > +	}
> > +
> > +	ret = ad9910_profile_set(st, st->profile);
> > +	if (ret)
> > +		return FW_UPLOAD_ERR_HW_ERROR;
> > +
> > +	/* backup profile register and update it with required address range */
> > +	backup = st->reg[AD9910_REG_PROFILE(st->profile)].val64;
> > +	tmp64 = AD9910_PROFILE_RAM_STEP_RATE_MSK |
> > +		FIELD_PREP(AD9910_PROFILE_RAM_START_ADDR_MSK, 0) |
> > +		FIELD_PREP(AD9910_PROFILE_RAM_END_ADDR_MSK, wcount - 1);
> > +	ret = ad9910_reg64_write(st, AD9910_REG_PROFILE(st->profile), tmp64, true);
> > +	if (ret)
> > +		return FW_UPLOAD_ERR_RW_ERROR;
> > +
> > +	memcpy(&st->tx_buf[1], fw_data->words, wcount * AD9910_RAM_WORD_SIZE);
> > +
> > +	/* write ram data and restore profile register */
> > +	ret = ad9910_spi_write(st, AD9910_REG_RAM,
> > +			       wcount * AD9910_RAM_WORD_SIZE, false);
> > +	ret2 = ad9910_reg64_write(st, AD9910_REG_PROFILE(st->profile), backup, true);
> > +	if (ret || ret2)
> > +		return FW_UPLOAD_ERR_RW_ERROR;
> > +
> > +	*written = size;
> 
> I'd like a blank line here. Mostly to make that 'good' return more obvious.
> 
> > +	return FW_UPLOAD_ERR_NONE;
> > +}
> 
> >  
> > +static inline void ad9910_debugfs_init(struct ad9910_state *st,
> > +				       struct iio_dev *indio_dev)
> > +{
> > +	struct dentry *d = iio_get_debugfs_dentry(indio_dev);
> > +	char buf[64];
> > +
> > +	/*
> > +	 * symlinks are created here so iio userspace tools can refer to them
> > +	 * as debug attributes.
> 
> Maybe worth a reference to appropriate ABI doc here (even if it is introduced
> in a later patch)

I'm not so sure about these links. I mean, I definitely agree we should
make it easy for userspace tools like libiio to be able to handle
these kind of attributes but using debugfs is questionable to me. Pretty
much because this is not a debug thing. It is a real setting for the
driver so ideally we would be able to control it (using the existent
tools) without enforcing one to mount debugfs (I know that most of the
times it's always mounted but still feels wrong to tie "real
functionality" to debugfs). 

Having said the above, some suggestions:

1. Make the iio_dev the parent so that the attr name is just "ram" and
it will be a subdir /sys/bus/iio/iio:deviceN/ram/.
2. Propose a new helper for the firmware_loader code so we can get
struct device from struct fw_upload then we can easily create a sysfs
symlink.
3. Name the attr as dev_name(iio_dev):attr so that it becomes
iio:deviceN:attr_name.

Now that I think about it, 2. does not make much sense when compared to
1. And If I'm not missing anything both 1. and 3. can be sanely parsable
from userspace (being 3. maybe a bit more reliable). And yes, both require
user space tools (in this case libiio) to support a new type of
attribute (firmware) but that is another problem.

- Nuno Sá
> 
> > +	 */
> > +	snprintf(buf, sizeof(buf), "/sys/class/firmware/%s/loading", st->ram_fwu_name);
> > +	debugfs_create_symlink("ram_loading", d, buf);
> > +
> > +	snprintf(buf, sizeof(buf), "/sys/class/firmware/%s/data", st->ram_fwu_name);
> > +	debugfs_create_symlink("ram_data", d, buf);
> > +}
> > +
> >  static int ad9910_probe(struct spi_device *spi)
> >  {
> >  	static const char * const supplies[] = {
> > @@ -1561,7 +1876,25 @@ static int ad9910_probe(struct spi_device *spi)
> ...
> 
> > +	ad9910_debugfs_init(st, indio_dev);
> 
> Blank line preferred before a simple return like this one.
> 
> > +	return 0;
> >  }
> >  
> >  static const struct spi_device_id ad9910_id[] = {
> > 
> 

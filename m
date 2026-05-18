Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D8C37EFF8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118055; cv=none; b=NWNIzBrIDFTzG1tO+C9Mn5Hl8q5yZOPTW1sbYbORQN5xQ0PFajEC54tV4bzHMNGTiG93aDgWjmrd4kohNs2gMU8aukwsegmZ4LeM0MOj0M2MzhF0scn0h5cAVuQ4yeVAq9LwmslKJTWehtfid1/M+yytPb+ViisU7echVpgbsTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118055; c=relaxed/simple;
	bh=b9Vk9qY/xav/EhSVPYY2GDfbqJukb+UtFNl3cAOu4qM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvXNH+gfY95T3XDtyyCTDsSlVNlKQAo692apY84s8yCDpMDR5tLmSwOd9ub59PZpfbUpXxU3QMbRxD6xdebQcrTrBinzlLL6tAQQrTZUcrqGNNkBcnF6iHlsFzlu8hSRqvIBnBb26K5SWHbIIzr4vFEn5bcupjzgRSnL0pwHtJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4XI2Zm2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4XI2Zm2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd56d108454so503349466b.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779118050; x=1779722850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5i5J5qLZGHdK+LXGjv6pdc5szyRrGvH9rm66LD4078=;
        b=C4XI2Zm2YVKNJzHaxQoHUZRGA332eu6se9fUFJuGXXxDKyVy1OBKMia0TXoz9Fxv2i
         l11awCVfc4uCLwbMA/suZ0ZqJqmysU56+6DwVtSAAQbJjDJjnUW7Qv8gB4VTKVuhJmGR
         YcHleXHieiMQhGWfi9wpISWADLQwYyEMbwB9tR9W8j9nzpz3IrRj6EN9J50RzfQ5vLKj
         2uKavpgwVcVJYnKGwklaeuyYy5lfWssK3xoA34bosK64HX5IvpQuaPmcXE1AaChx7/a8
         bAvmb6K1D/a9jsCsDC7+h4mgYMDBQIvZv4r2vI1J3x6J+lc41fF9grsERAaA/zVjVOIW
         D+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118050; x=1779722850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5i5J5qLZGHdK+LXGjv6pdc5szyRrGvH9rm66LD4078=;
        b=EZzED1iyOMnnZjwjzGWCHdgAUeri6JpvzLDYyqA8i+YgXWJu5MsczkJEa406syMVuQ
         x8K7YffLhclIMHGCYZ5HRXCQEzJZQwFZke7c5XE6Xzu75komNt+n3mkSW4XmNKq5P1KY
         1Zz+Ff492JTa2rplaLGHSRgh+l7VTfoo7lERgTI2ixN7SD1nkx7I1HGTbbvTsEJPcOu4
         wTgqmhzgB/6e2Bj9MXx00wdtk3C/LCEoPncOnNRJ0VBtzJRMuZYuwToCdvRGP6Vcpem6
         aYDLShZqOBKNUSHYTzr/4LN66CEAK0JQ95hTysp98drONYsYQGbz5psSPwkeeMXP7pjQ
         VRPA==
X-Forwarded-Encrypted: i=1; AFNElJ85N0T8RqzsMZikxmbHye4JzpNy4Z5LTrcfHcKL1D75TQRzepaYua2+lEAZ7mmUgyLnmKVT37oZuJbE@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXzQQ8+9zpr2RFIziR4+13ZdfirBA6BnMLMZnKs0CTmQjbYP2
	0XZqVHkQ9lYQEKmAEe4aY6HJxoG4ejiZ777rzrOkqKLvR5sxoA27S0BJ
X-Gm-Gg: Acq92OGPLt3iOsYHRAdQuexBMWdPRetzBY7gUr1nX21Fdg8YAbkl3Gsg9QN2LHjwo8T
	hcFLfa/uGmp+YPPANB2wVG749nlwVCp0Q7hYVMrDN7kKJwJ2mCM0g0ET/EnMPOj1EQReNXBBeIc
	pg4E4fiZwYSD5gw9trVxFxLp+YvTQxDzfJXg/SCxmSQTCd3DqyzdUp0IZG+w6Q0ecL6qeXkO2Du
	esNtluf3ZMm1yLJWcfjGrcoEEL6d7/SyfeVzpciDsFBLUgL2+bc/vVpJyx21Q58VkKBpAUMP786
	K6uqDgoB2Jnhy6l5TeUu+fDWWY585HyMsguu7q+Cg53u9Yr2hmVTkZvSaDt/ISediahESZeyGQg
	u38AxR8kfCJTFNizjgoAVv7D6WOJJm6S2iue3fRRvKvc3VfVuIdxD9umu55AQRghxMtapmynJK5
	U2sUEpRVk5MJVJTVtp2ujEH7ykI34hNdLhLdEtjDPFpIHC51g/Dng4dTb/RVYTkA1vicAjb7hiQ
	jYgIpTlun57B3+Hrh5Y40kBASjXg61zlRvWRswsziDHHGzneFaFluYActyg
X-Received: by 2002:a17:906:5145:10b0:bd5:5834:1d39 with SMTP id a640c23a62f3a-bd558341f32mr480464166b.45.1779118049379;
        Mon, 18 May 2026 08:27:29 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f28sm590371766b.34.2026.05.18.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:27:28 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 18 May 2026 16:27:23 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v4 09/10] Documentation: ABI: testing: add docs for
 ad9910 sysfs entries
Message-ID: <pkx5v4od3wkyyzxomfrjf4ei7leboadzth262xnl55fvu76pf3@yqrezmo6gtq7>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
 <20260508-ad9910-iio-driver-v4-9-d26bfd20ee3d@analog.com>
 <20260517155843.7f833658@jic23-huawei>
 <yrabhhhdkzmiuxlqzrrj6a47ftlzwvva7r2korzeszdy4yqrin@xl6obhhnnas4>
 <20260518144537.7c998308@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518144537.7c998308@jic23-huawei>

On 26/05/18 02:45PM, Jonathan Cameron wrote:
> On Sun, 17 May 2026 18:30:27 +0100
> Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> 
> > On 26/05/17 03:58PM, Jonathan Cameron wrote:
> > > On Fri, 08 May 2026 18:00:25 +0100
> > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > >   
> > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > 
> > > > Add custom ABI documentation file for the DDS AD9910 with sysfs entries to
> > > > control Parallel Port, Digital Ramp Generator and OSK parameters.
> > > > 
> > > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>  
> > > I'm fine with phase and frequency as defined, but for the scaling it made me wonder.
> > > For outvoltage0 channels the assumption the value is the peak voltage so if
> > > we know what input to be modulated by the ramp generator can we express them
> > > in volts (well milivolts) rather than as a scaling multiplier?  
> > 
> > The DAC output is current-based and differential. Voltage conversion would happen
> > outside the device...
> 
> Why aren't we representing this as out_altcurrentX-Y_xxxx?

Good point! altcurrent makes more sense than altvoltage if we want to use raw to
control the output level rather than scale, which would be a constant to convert
raw into current units (what is the one that is used in the sysfs ABI? Ampere, mA or uA?)

Not sure about the benefits on setting "differential" in channel spec.. the name would
become out_altcurrentX-altcurrentY_xxxxx...

Is there any modifier for amplitude/peak/envelope? I see IIO_MOD_RMS, which could be used
if adding a 1/sqrt(2) factor to the fixed scale.

Then, I would consider something like out_altcurrent_rms_xxxx as a good alternative.

"scale" would be a constant in the top-level phy channel

single tone profile channels would have:
- frequency
- phase
- raw

drg ramp up/down channels:
- frequency and frequency_roc
- phase and phase_roc
- raw and raw_roc

parallel port channel(s):
- frequency_scale and frequency_offset (frequency destination)
- phase_offset (polar destination)
- offset (polar destination)

osk channel:
- raw
- raw_roc

raw_roc could be just roc, but that sounds like it carries the scale and refers to
a current value? and maybe that breaks consistency with other destination attributes?
I am fine with just roc if that refers to the raw value, not (raw * scale).

With all the above, still using altvoltage is not incorrect, just a matter on how
we want to express the units. Note that using raw instead of scale to control the
amplitude is just another option to tackle the problem. I suppose that the
important thing here is being technically corrent and consistent in terms of
usage. Maybe out_altcurrent_rms_* is more clear in terms of amplitude level.

> 
> 
> > using a resistor load or an op-amp transimpedance stage,
> > and I am no expert on that, but that often requires impedance matching so voltage
> > levels may depend on the frequency. Then, I suppose that voltage is not the right
> > unit to use.
> 
> Understood that it can get complex!
> > 
> > The scale here controls the amplitude of the varying signal. Assuming the peak voltage
> > (amplitude) is constant means we have a constant envelope, but that should not mean
> > we can't control it or it should not mean that the hardware can have other ways to
> > control it. That said, scale behaves as a "gain multiplier".
> Understood. Given it's the envelope then if scale happened to be 1 always it would
> be presented as _processed. So this is consistent with other channel types.
> 
> > 
> > > 
> > > That seems to me like it fits better with the overall ABI.
> > >   
> > > > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_scale_offset
> > > > +KernelVersion:
> > > > +Contact:	linux-iio@vger.kernel.org
> > > > +Description:
> > > > +		For a channel that allows amplitude control through buffers, this
> > > > +		represents the value for a base amplitude scale. The actual output
> > > > +		amplitude scale is a result with the sum of this value.
> > > > +  
> > >   
> > > > +
> > > > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_scale_roc  
> > > 
> > > Silly question perhaps but can work out how this related to millivolts/sec
> > > That might make a more intuitive interface than scaling multiplier per sec
> > > Perhaps the combination with offset makes this impossible though maybe that
> > > could be a expressed as a voltage offset?  Afterall if the amplitude being
> > > scaled is 5V then 5 * (offset + scale) = 5 * offset + 5 * scale
> > >    
> > > > +KernelVersion:
> > > > +Contact:	linux-iio@vger.kernel.org
> > > > +Description:
> > > > +		Amplitude scale rate of change in 1/s for channels that ramp
> > > > +		amplitude. This value may be influenced by the channel's
> > > > +		sampling_frequency setting.  
> > > 
> > >   
> > 
> 

-- 
Kind regards,

Rodrigo Alencar

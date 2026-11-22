Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333977;
	b=bnvWpatlpyAGV2KFiQj8QSB7yLkMShJxnwJ/MFs5iACV7TKvfVTWEl6rJ0hnqc4pAGUp
	 6QHCy2g3x8fx7kgpoMFZ3P8xY9AYlCX/Jg6+WJhF8fPu15HkRa3MB9UpgyO71FVhnkF3Z
	 2j4aYjEgM1Xt/MzTHdSu5DCE4cOAQKqQsWQjIxJAuVFsa7hidyICJOOJK8nLZmrwnvdSm
	 hJ+4YZv1I09zc0vUnFgLUQ1UMIY8EZ53U192Ql9BjIPVkSeGbEYzf2Co6ZvrgELHR3uiN
	 tOfCj0dT6J10eh8dUVs4r1ud4//VIkxX30g9FqVKhmAZGL6Fhhg+9NGYzW62gAezhwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=14rx6L7AbATinETfU1F4W6Ph48Erak+Ha8RtpBp7c9I=;
	b=wYcYtXUBwk81ivUIdXgllk4zGuCb7FglSOOLWfZa5+5/TtTUgTCvcn9ihlxQbmCt6iOI
	 KTJHkoyqHK2K9GBtuPJEUbgviXlvVz6FAcrQpYLJbXFdchUoimit5WXz9elCJWdUJQlFE
	 YYXv7zTHoWK89KAJFF0hNa9VbgTp5TAofmkbDqM0PoVZJFmqfT+mdMZjrDaLfg9njfjlr
	 aNw9IlPIj6alRItOMfjg3AdGY3fwhpp3I0mlVC+2ruaIURaa6r/51hEJcdj3ZMcigYoVZ
	 MsDlmXd2rFqcXSRYiGdpb5NqL50z9s0KZDjSVBWEjnPpoJCjOaml7vDT3/ym8UrgpUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NbUiVnNV;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B798C606A33C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B798C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NbUiVnNV
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c513a854320so389988966b.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 23:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333975; x=1795938775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=14rx6L7AbATinETfU1F4W6Ph48Erak+Ha8RtpBp7c9I=;
        b=NbUiVnNVQrTuUtyE3ouGS/87WDA7PRN53f4qTS+yqR9rwInlVD9FkhBSjnwTY/qdCW
         gLb7mOLNov3CUQEYUlu5I/lr9Pg8bumIdqEnM6d++njRcC+kwOUtTcX4cNEDYw+0FmaW
         royCU1vda5BJLZNujRHpW5IUnInYBPnRMt7p3ERSTGE6YEmCxh2UtUzGP3LimmOpsIZL
         eINJJgN6daSYL8E4bgW75XMSdtFDSIIIx3Du3WY0B7I8Xx11vczvDZcfTmGn6W1V7Rzm
         ituF0TZIU+abXcWcsc4PFEegnGuzTsRnyWkofYopOemZmcbaBaM6meGyHiDTphDn1BFn
         I+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333975; x=1795938775;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14rx6L7AbATinETfU1F4W6Ph48Erak+Ha8RtpBp7c9I=;
        b=qQxLbm4iWtyG+4uuxzed7G8uILalYqrl2K6DaVqdzOSkUYUhmlotYuNgmD87YfscRU
         BsLUSsnTkKaMpoy6KPZPjxkmkO5Wb9l+PEZbh20WAq4mBWApVUV5pOZJ0S4+LiGDmSlP
         jWNcE5SUPzBv4ij8bdu9ihgcfRhNIGk+5uuFHMCabEKOI3SKtbfUb9BDblJn3frXT/SO
         wfE0IT3VWUkrKLQH3c4xhcSGm/fPBZLRt2NICnkyjAfeSNUV7jAOZwn4xOcb925atmh2
         1yZ4v40tzuQcMQNrA0HgP5Io9FkQ4t6vcCOaT3GHLnX7zKIZu9gXi/A6fODZC2h3OvAY
         5DaA==
X-Forwarded-Encrypted: i=1; AL+hErGf5Iy2PtzgYGPkntj/TjhCKzQyrmELByfQplJyDSVwAQ+rGJiAsAdyunFe+fhGIzFp8zWZm0bKTVZZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+eAKXhB+wbD09DJS+K8wUd/f4qJCaW7Hiw+dvJGBKj46f6vgqe
	F2uqschF84Sn5sx2WzsxQuNvV0/hK4nrOtiD63eeu1buvGOU7AiRtihT
X-Gm-Gg: AZFdTZcdEjHXtGxACipZOAiYEcmDfNgMpoRyoAKbXWdd0yzYvPWs0us7OYTrPuqHjTw
	mimZCz1+nmjrvQ3RzIlu2ZiF4zq3Nrz8i1cv/Y7+GiU8PSH5RlF9FBhqtiDsMYOOJ7mofb/79E6
	7drxgnDu1VLKBRWIzWE//GXs9YLevkKehDmYPjA9ZSedos+SZVlLzH+LW9N2liRmOuCB4XBesj6
	GV7dl7YrV4LaDzgZ0RKlsZTPk2sgX8He24oZY9RfBo+l3xcGwz9OZK0exT36oQjjDC70VIeC8ca
	5Lv38u82zz/61mU/W5pLFBhhe4JtjZvap6e8TLKZdW+90NZz1pufP796eDV1TgnGaj0FuXPwu+M
	AcOhfGm2Lp1uxR398rDib6ZEHayHL+wRiQoPAWmP2U968HHjOx3bh5m1fyNeiN5fFoDzzXIYqN9
	t+yESM763GWjT+e3QS81WQ1LHaMYvLDM/T7N51LmwrpgvOY5tPum0ikIUVRup6kaqMThjKZ5EZy
	369H8xglRCKHheiFrP3kq1dZ3YpBdx98E9t+LO8jO3kG0COdOp2hAs854G/0iTy79yiXcG2wbxS
	JYAfHUbwXWyOcfWA4u3KRY40mQ==
X-Received: by 2002:a17:906:d0cc:b0:c50:48b8:22bf with SMTP id a640c23a62f3a-c513aad45e3mr519084266b.36.1795333975118;
        Sat, 21 Nov 2026 23:52:55 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc316bsm280666466b.56.2026.11.21.23.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:52:54 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: proximity: add Imagis ISG5320A SAR sensor driver
Date: Sun, 22 Nov 2026 10:52:51 +0300
Message-ID: <20261122075251.2918277-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122024459.2c30cf99@jic23-hlaptop>
References: <20261116074013.355363-1-tadilhusrev@gmail.com> <20261117173333.1853986-1-tadilhusrev@gmail.com> <20261117173333.1853986-3-tadilhusrev@gmail.com> <20261122024459.2c30cf99@jic23-hlaptop>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 02:44:59 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Unfortunately this looks a bit too much like an aged vendor driver.
> I've called out a few things but Andy's earlier comment about
> making sure you read other recent drivers and threads will get you
> a long way.
>
> + as others have mentioned, for a new driver at least 1 week is
> appropriate between versions whether or sashiko is making noise.

Thanks for the thorough review, and point taken on the pacing. v4 won't
go out before the end of the week, and it will be a new thread.

I'll take all the style and structure comments: no vendor line
references, no dev_info()/dev_dbg() noise, fsleep(), dev from the
regmap, regmap_multi_reg_write() for the constant sequences,
get_unaligned_be16(), guard() held to the end of the function instead
of scoped_guard(), consistent pm_runtime get/put,
devm_pm_runtime_enable() without the manual dance, no
IRQF_TRIGGER_FALLING fallback, and the teardown split up. I'll also
check which init-table writes are reset defaults and drop those. A few
answers inline:

> > +	.cache_type = REGCACHE_NONE,
> Why? I'd expect a brief note if caching can't be used for some reason.

I don't have a reason beyond following the vendor driver. v4 will
either use a cache with the status/data registers marked volatile, or
say why it can't.

> > +	ret = devm_regulator_get_enable_optional(dev, "vdd");
> vdd isn't optional. Devices tend not to work great without power..

Agreed. On the XCover5 the sensor is on an always-on rail that isn't
in its DT yet. I'll describe that rail as a fixed regulator there and
make vdd required, with the power-up delay applied unconditionally.

> > +		*val = (int)data->thresh - (int)data->far_hyst;
> Does negative make sense? Any idea what the device does if we
> get to that?

I don't know what the chip does there, and I have no datasheet to check
it against. I'll clamp at 0 rather than report a value the hardware may
not honour.

> > +	disable_irq(data->irq);
> You've just written a register that sounds like it is preventing them at source.
> Why do you need to disable the irq?

I don't think it's needed; the IRQFUNC write stops them at the chip.
v4 drops it, keeping only a synchronize_irq() where resources go away.

> > +static void isg5320a_shutdown(struct i2c_client *client)
> Why do you care about shutdown?

It mirrors the vendor driver; I don't have a hardware reason for it, so
v4 drops it. That also removes the shutdown vs runtime-resume race
Sashiko flagged on v3.

> Ignore the vendor driver (which is doing it wrong) and research how
> wakeup sources work. They need to be deliberately registered rather
> than just relying on leaving stuff on and hoping right thing happens.
> Until that is in place, I would at least use the DEFINE_RUNTIME_DEV_PM_OPS
> so we get some power saving on suspend.

Ok. v4 uses DEFINE_RUNTIME_DEV_PM_OPS and has no wakeup support; I'll
add that later as a separate patch once it's done properly.

Thanks,
Adil

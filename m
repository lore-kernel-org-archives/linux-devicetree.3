Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793240368;
	b=oLFxnYlKWkIQceHRUzPYh6FxBLMUYdAuwK6IKGiGgKrdEJMdKY9xcTvyIfFgpp6d2wcD
	 k3vfzIZ6ChV4uV29nb2D+mfxS4xXMIb9CUm5ANOO6BRA56h3no71mM/1Z27387nyAdCDr
	 rse3ommKnjhmNOmwhJvmMPt5p9+0Avx6sYitT2oQrMufI5aurAjq5E0uEJM2/U+wflewJ
	 uW7z72n4hKgqU0CwvQlwJzWE8tGoaiX6dM8mtAE6HHr+vL8ZuXso34Ucc+cfp9DCgAXj7
	 nSsEkChJ/qC6tlSdVFzkMDrVKUYQ8NnqoiyQcEmFjB/yfex70hr6LCFWGVXU4hIzS9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
	b=Znwjr/cFcnu/eRBWAlmzc4h2UC9//qpN9hvHWGzM/uZj4B0ZYwGICtlWjiDVUygHuTig
	 NmzTq5jjhzqoDFpUBniKNdOrnzmWFh8t9cJEt3sRGii1oxsHJbHbCHdgqUlFnvTJCs0u2
	 ENLYqLmW9Pr8/CFiS6YZmRouJG4RCM1+Vmgxcv5pDR2FxgYqTCJeOXsUI1hZ+CMfJOwdK
	 M38Cvr/e5zfDPvZr19zmOG/SPRSxPOvwDFK6Y/2C3Ylwl7+ZCh4dyQ6llQzrDKYHuuCoF
	 EFwxQM0b24NzBWiDSqLOrIbmcAQXGH3nhe4SXxiXDYrrd11ANixKy1uxW/JbSGNTw9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j84zXx65;
	arc=fail smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB732606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB732606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j84zXx65
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6deb848ddd7so1284026eaf.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793240366; cv=none;
        d=google.com; s=arc-20260327;
        b=Rx0uqZtVpya5Axs8FLt9O5R/7kLvwy7CeHAKMZau5C4NPMzuU3dAlb8Suzfs7UNVdz
         1YkjLYuYswIEexzcocpVKZGQ6F4LwparSqvvf+OhF60zC+xB2cQmOM2CsZFMU2gr+RdG
         RTJWHk7jcqNzm15orBFT5Eck4HUh0G31IoIt9C8TCfRC27mdu+qXKa/RwqVOaB2IhTYf
         1F/UBllQaTyWWjLph5BVZT/axB2xeMQstO9wH6LLV8wwp4oZ3yD3nW7K6XJ8J27/MZAa
         XLy+0ut3Wcjl4Wk3uje9bYF9IGVW76Ib+2grJosNpNsozjypF4n+PBi2iCA9vLSCcmEX
         cHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
        fh=hKx5DoB/A2DTEYmvA9rxk8idZkNovZvJIKvQcQEquk0=;
        b=c+VlAv9aw7nU1C+Z50uvx4wwhJSAiv59kqbpwLfX/XiFZT7s9h/UxMn3fVS+JwmLcU
         E4SXLE0J4ZjecH8qyruhm0Sup3ggSvfjd5j8XPbH3dplfcRNuaAobjNsj3LNKPvqKIFi
         1US38qFaVbpJdzFBdbDWLHI7L7CK9h/8nam8Eb9PwVCOTViqger0aanUGjwShYFJdggZ
         mG/tgcVxgdUAbLgq5LUYSPaglOA7feTpOI6T0uJUajNc8r/CLxynjeTMx0BIPO2ck30Y
         RSP9WVtlDyWeGo9Asicij+nm0hDbZ7jnDeVh9V1f+hUAIM8c3XjppTrt6XrGXUkqWzTb
         lK0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240366; x=1793845166; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
        b=j84zXx659Vk9rM2x6lrM1tdsePSk4pdpzHRtnrW1nXb4Nsb4f7ZH87bcfqhCY0I1Ne
         D5vfvn9+fFjEbF1mzik6+c67LlccrlaFqbNdBSpyBSYb2Lp0r1589MY6K3Qvdjqe6WHp
         m1nFcJnmYiEBGfFcilJAEiEf2A4iXA5tLq4jGeCTqGDQuyISFoshfXRIXc8R4Q7Fhd+4
         6zYo30I4UmDIOjjo2NWg6t5zYYPkQ7WMO7WG9cU5+0+qygmSOSiz6jrX5wzsPAMXeJc9
         Ikam7P+XLUbKSvg2ZS90r3yBhYe8G+O2Ythgs/fAmJ9uArlV4Pu7evCxpAAwkJBqElYu
         NHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240366; x=1793845166;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
        b=ZiBj0iIANdU2yZI5HpvKUzjX1SU/pFUZ8s0JKZE/0wXcizPePpawVcCGWym6YuMOLN
         oWMkaiIVEd47c+PTexD5FVsKhocI9ivu9rZWqXycmCbwmqjSZIAqPEtIZwPRAcY1svCL
         K/mHKCDfCzDdieUhWI0ewPNExM+SErfZ+HqvDXTDfJ9b4PJ9BmUmZnbPtDXEY6ZlHg/e
         4roERHYuk3h98fNayQ4D6adZ9OAw/o/HXQIwFeryZEr44+ilnk5ykFvoJ9IgDQvyX0gt
         lXrpLS8++ThiThe/Fs15eYRsXmymc+t4YGqVvVXbA/9cngAnuYM0MNcKDrFK0B9YgQu/
         YeAw==
X-Forwarded-Encrypted: i=1; AKwUvBwYLdwJ095JvKd8d8oaL8nDt0+DcOTTe64rSSZk4+ALdho4vOcxcVBQA6oq6UgfoKl6e9pEZMAR8qyO@vger.kernel.org
X-Gm-Message-State: AFq9FYIYKQQ4/rIxR1tz4hkY3jNK+TWSbZ08yvQR0VC8568L7xJCyB0V
	Af76aQJonOUD+CraanthPfibA/KWutbPeM4iWq0vUxlLuLa8wqVNZs6ZRH+waaGnVOcmj/+YGHo
	GfTKdY8oGVkp6ebKpiaS4e/RtlQB6frk=
X-Gm-Gg: AYBFou1IofSkJ0FbDxvnnqt51N216oV6nI2jGhl2vbCVZi+6s1mlkRnKQYpG8/ofcut
	P+ve5BuJsFrpMQNsUe9G+FAD+dzqgZdPTrFaAS0y69Mh/M5Eo0DsJ38oa6wJra7yfGTk/Cav75m
	QAXRCiat/e0kl3osNlKZmLhrUnkgVotl5hGByb708kepnaZP0loEsUgVwXr8xUR69Rd4ASN/+xv
	p8cSelwQKOOq1ec9huba/ZmjQ5NSk9IXy37qE46GPidlR6EUE+TJAfeeWDvM4uJDuljkPc+YcD+
	iSM3GI+JgB4KUAPckc5tJE1gDyokHP5aw9Oj2Ge4TTXjM0Fkz2Y0xyoN6GjTcB9K4qIVp8BMLkG
	dovHSwG5CrUDRH2iMTWu5/eILGBIzKYn3K2yrtmP9PhgbTuTPQqKg9xYp14z7J/oIYCAMaDytvx
	2leD6CGyB4svPILzTg2nQadIqgoJM=
X-Received: by 2002:a05:6820:1501:b0:6df:2b6e:d57a with SMTP id
 006d021491bc7-713f04d5ab3mr2650404eaf.76.1793240366413; Wed, 28 Oct 2026
 19:19:26 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-tf-luna-v1-0-53a88f93db24@gmail.com> <20261020-tf-luna-v1-3-53a88f93db24@gmail.com>
 <20261020092316.00003339@gmail.com> <atcbe2O6REJqok2n@ashevche-desk.local>
In-Reply-To: <atcbe2O6REJqok2n@ashevche-desk.local>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Thu, 29 Oct 2026 07:49:15 +0530
X-Gm-Features: AclHuK-sDGs78YBOmA5Mf81isBK3M5HnFRdgXc0AbERqvLh0UlNiIFbXRQ4I_GQ
Message-ID: <CAFqz8L+fCc19aaUhs6k0a47y=oxhiM9PSgjMgjY0JYH8HN5wKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] iio: proximity: Add Benewake TF-Luna LiDAR driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, 
	Vidhu Sarwal via B4 Relay <devnull+vidhu.linux.gmail.com@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 10:42:51AM +0300, Andy Shevchenko wrote:
> > > +static const struct regmap_config tf_luna_regmap_config = {
> > > +       .reg_bits = 8,
> > > +       .val_bits = 8,
> > > +       .max_register = TF_LUNA_REG_SIGNATURE + 3,
>
> No cache?

Hi Andy,

The only configuration register the driver writes to is MODE, once
during probe. The other write is only a one shot trigger, and the
registers read afterwards contain measurement data that keeps
changing. also need to read MODE back from hardware since the sensor
can silently ignore writes that come too quickly. I was planning to
add caching later along with runtime PM to restore MODE , but I can
add it in v2 if you think its better added now.

I'll also address the other comments from you, Joshua and Jonathan
in v2.

Thanks,
Vidhu

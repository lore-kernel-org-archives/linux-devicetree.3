Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4913242D62
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033331; cv=none; b=l3CCJLQhsYofzIODF3KS7ggM7b/EKL5fFYDjRXPg+TQQ8gYhZBi+6VCp/tL3P2NFKBYaHDsinSrw+O19arL/dKL5otmg9/5BAbmb28xorzSfH9XP2it74nhfW18RrY1WagTAnnkEu5wbQ6JXm/kl7AjY+mvgEgkfODi3tMI9g0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033331; c=relaxed/simple;
	bh=PtTATevxmIUh63d4xOSqSI6Fh1p2atV5TSFEbDIi/jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGxPEUiM8ZGWYW33If4cx1SFnR3VNTyLub0/z4dcUODH5oV343xU3HoGlJBjQUBk5o0ZJEqXcDlFffhyK0eXZTzLDJsrCrKOnpB8+ZQ/XK1/aONwM4mAsC9Z+i27PepoLJFY5AX/f2byM5V31dNptUrAKDLFtzBI6YkRkwWP0Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJES2FUl; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJES2FUl"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304d555293aso55842eec.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033329; x=1780638129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz6zBQ1WuCUd89SpgtC5HEUuwrLsBEV1lrV5fai6fA0=;
        b=lJES2FUlgSuO1wV3I+HTbcPRPeCBPzNJL28n+l9wKGOtwb6q1GJwcnVuux/MybeSaR
         jqUCi4CszkzX1JN4Z9VA0pUhXJBOyjkcAW+S2BQjdb3BzQFn1ch6ipzsD+yFQZZDbrki
         S+guHDF8VrJ9H8icVm4dqDy0EcQYjaKlti2LM8vwnNCRz6it29fH7S2HxJ9nzKJxmhSR
         ZR46ohRfKQl6K5deqb4FI9boCSlSPcO/PhpmKetf/SiuNHWgHqOImIChvpt0PMkEdKOX
         EQLqz+3UkYC3w174GU1HMXmIIW7HQV4ee4WvCFY+mNa4nPzqyOy9Ejf8qcQmFeLbHXMO
         z2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033329; x=1780638129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz6zBQ1WuCUd89SpgtC5HEUuwrLsBEV1lrV5fai6fA0=;
        b=dCNLMJhJw/0j2gK40tbDpwC2FcEJzJWRzo947NWPScCifMQf2OSlf5UmI4gQYhN9ok
         U5lQBQGX1nC1UXQHxDCEmHINMn+4ZoWjoj7UsrTtjARlSyTeMTlaitOem5UbRMfa3ZRl
         GpRFigLD8DL0vy7GMj+ljctJyuv4mBDTmInSM5E6oWMjxVMKPZt5tgjIBBcJ/4ucWazT
         Jqq43WZyBScPmN27W0OEuFrnLbOx+y/CQ5oLqdsvfMwa6Wka9533dq3H+Tk7ltCdg4kP
         4JA2LcrB2zGpypcderasx9cRc9KYR+JTcWzdfq/2VgJo4UWpJnEqcTOTzrMdzpQYZx+B
         6nfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yGCci5eleJBpwxJ9rtLUMgeq6vHg4D0CaieWrSHeWypoNTgrqKz+YEx7sfkXd2WPgJgGQ9x+ueIph@vger.kernel.org
X-Gm-Message-State: AOJu0YxmofyXg/XuQcD7GcdHwpyKvXGNumQ86Ytx034r3BensCDxg9cx
	/MXJdt/cAr1PjIMAio/SO1HdBDFmMJUkOXC5P3HqmDnqok6JWW1dlcYZ
X-Gm-Gg: Acq92OEh86JLwhjnAJVMmLOlJ51nxn94Gx7mxSdAusMHoZf97pIxEmS01rDl61Dh2ZJ
	wKNKaLbRSLyhLg6GF+YO5PC9VkFb8OujtBFauDo99DdgZHW9t0EU1yjxnUWRBv55zVOpdTG0F5X
	TmNr0S1E6ClrfQ3yX0WL3jwNx/qXs1dX1fWZYJnyi0wZCsYFhaU9/UyfQuWc5qWF8cEzI5V3h2P
	hFTmlMMgGyXpRxkd7vJWcJDeY4JApkO59wpbnCmK7C2FOGoyYBfZj/J8cluCCSMcDJB7B7cUw1C
	OAOU+XyMbChCC9FM1Kvgug5PTJeOb14xanzDWkUSLI64UalCuiykjI4x3jEznxRGacRdA3I8QCq
	Lx04qebXbzON0Bprqv25Ygg4eqtCkFXYL827aDxXAVIyEm2wMitOQnzEgRXLmrof+ZCVeJBflt4
	CeZqh05DTMQ+4CIH4yviZpMMBA6rWHc5npAcRJP4bVpzkpErUMB4fWDhOp76NjXgJUZQjSZ4zqk
	Y4=
X-Received: by 2002:a05:7300:cb11:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-304eb115c56mr669142eec.11.1780033328984;
        Thu, 28 May 2026 22:42:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e169:a62b:d3ca:e8c5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed578c48sm596863eec.20.2026.05.28.22.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:42:07 -0700 (PDT)
Date: Thu, 28 May 2026 22:42:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hendrik Noack <hendrik-noack@gmx.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ferass El Hafidi <funderscore@postmarketos.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] Input: Add support for Wacom W9000-series
 penabled touchscreens
Message-ID: <ahkmPEEyF-AKKy6X@google.com>
References: <20260528074818.12151-1-hendrik-noack@gmx.de>
 <20260528074818.12151-3-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528074818.12151-3-hendrik-noack@gmx.de>

Hi Hendrik,

On Thu, May 28, 2026 at 09:48:18AM +0200, Hendrik Noack wrote:
> +
> +struct wacom_w9000_data {
> +	struct i2c_client *client;
> +	struct input_dev *input_dev;
> +	const struct wacom_w9000_variant *variant;
> +	u16 fw_version;
> +
> +	struct touchscreen_properties prop;
> +	u16 max_pressure;
> +
> +	struct regulator *regulator;
> +	bool powered;

We do not really need this flag as ling as you use
input_device_enabled() in wacom_w9000_suspend().

...

> +
> +	dev_dbg(dev, "max_x:%d, max_y:%d, max_pressure:%d, fw:%#x", wacom_data->prop.max_x,
> +		wacom_data->prop.max_y, wacom_data->max_pressure,
> +		wacom_data->fw_version);

Here and in couple of other places we miss '\n' in the diagnostic
messages.

> +
> +	input_dev->name = wacom_data->variant->name;
> +	input_dev->id.bustype = BUS_I2C;
> +	input_dev->dev.parent = dev;

This is not needed: devm_input_allocate_device() sets the patent for us.

No need to resubmit, I made edits on my end.

Thanks.

-- 
Dmitry

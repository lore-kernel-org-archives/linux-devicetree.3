Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB83EDE5D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779060; cv=none; b=hablaMjT9O+OklqgHmkSvmp0Dmwm7XshvZKd1iSpnsgHk9QtdB3t4TzBHa4b7Z2Yeh4DXLR/ElN8qv9DSHQmKkJVtA/PRM66LylTAiYu+I98jRr87XVrJS7U/lVl11pD2oGh84XpsyUIhutD089BHEe/Oe4KRCv/BjAPgsmN3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779060; c=relaxed/simple;
	bh=WaatnYQzAn1y5alEj6OiK/0aXjq78txcoSV151CVOB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mExPGfFl6LiBilsKjfqZ4558E5ZzgbvtpnqjoRO5qTQtCjg1V5fza1X7LIVsaWLKqjKzsKy9bvxa2ZsU5AfVwTuH5usCvnKl3YAXuDFleNtaqEcKfyDTa3qG3saeRH8fy7w0XhJPHXUzYBwrkfoBpVE3yX1bTtQqzKDp63hu32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4Ard0Q8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4Ard0Q8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so4760555e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779056; x=1782383856; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwEhTrq+qTzF8O+m1hCZfz1bJ+2UVVplvdeiwcSgpIs=;
        b=o4Ard0Q8G9T7KU+xO8QykTPVkQazez8iME+f9zZs9sn0uPq4XE8pQ4famyIRHt/0Lz
         SfJsZzbnLEn3+GJEvHcLLyyWTqF330Eu1jPKnL3HQYJB83SYTeSqQnKDWVPFtjjyBfhw
         37rhBHzRGs6TBfvPvK7yv7X9e1rFsN8aiyW0QeqjcTlWergFMGBqTIjN3OnFuxqnRc//
         +cXioGmT3oEyblCMUIaB3h5LWNY3AT0Taqz6uU6GrTiVrgm1xk4p5kEitf6Fa8Oqn2jW
         em4gRVJcw3YFuIXCO8wUPfGQwf0CckGJkNJON0TkYOApe/ItBqaa+8w7SgsMtM9qZ0sn
         EOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779056; x=1782383856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwEhTrq+qTzF8O+m1hCZfz1bJ+2UVVplvdeiwcSgpIs=;
        b=ox2fG80vCTg1kpTT1JZumIYb3j5lkav3koeziQbe6LKidhp6Pe5iLJ90sntIePssMT
         Glytq2opQ4jMxt9p6/ef8fsU3tFoOy46ubCXWKFFHJ1pLW5GeroRvLPo/Q/dc6F3NX8U
         10VKWzWWzUS69f96ft0J9IpnWfkhJAY4hJu8flKg/yRn1vQThGNa4OPcJvgW5tPNB8wD
         EF806z1lLwO2CiP2IouElFGYnl7adYT+OlQaagNVDcze3badQxhoami/L3RYumGNLl/a
         vzSmLNaXCeSKFEjr5XsJ1oWksMLTXQLQUDOIpDe9EJMFcTvRTl0NEQXKVBJ8UIsdJmth
         EnDg==
X-Forwarded-Encrypted: i=1; AFNElJ9kjQv3dWrhSHFwDfhEbeLrGldjyvqpSG1b00UfyUeEmdFVhANA45zOuQ9HonyOlXWnSP2jd1vF3YyS@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOZ9i5NeKJk4NrAOp95rslMWo5s8wLxb+Kfb+kkG1rpYitVEm
	M6CRxPjO3l3ClymggW4fqr3uvkBcOmOoMNIe3tp/Z0IV0xMku43Qkf5X
X-Gm-Gg: AfdE7cnBCUag8+MayTgdiPM9BpRRgjhRcVifndwfRHruzJFwmIxDDW7z/7J5szbyfnN
	dW8KurKrLQX4046L8Rox0JfrtTk4/HNvv9zBf+hyiLfJJTgJhnp7XMtKtOlj3JJwnVKgdpFb1Gd
	lLHAiUiPVbdOUKQWHWI2EPM27YdyXwwm4/nqpDmuEq0Ou4hkVrcbt0IB+ul8udizh7whk1ovgsW
	dZHM8g13NlqjC/sB7Qu8Zq6BEVLf1zV89tyRbX3IdCC5qUSzERO1vHbw96tCjGpuMBQ5MTvM24Q
	3TBXUj5FtT+pvRZPvxoaE6Vq67nYLOjUgrAmCjEP+EKQkVNiTbR87lx09cHfspAG/LWQ60HQUdk
	VF/aX764oBINDZT5bRGp5ciC9+t+CP1MKq+U10Or1PLLsKv2mNU9xqnxjAMp3oF9QDWwiAy7Als
	SzLXIg
X-Received: by 2002:a05:600c:a010:b0:492:329e:528 with SMTP id 5b1f17b1804b1-4923a9d5c61mr21645925e9.23.1781779055452;
        Thu, 18 Jun 2026 03:37:35 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923a154446sm26041375e9.0.2026.06.18.03.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:37:35 -0700 (PDT)
Date: Thu, 18 Jun 2026 11:38:37 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pop.ioan-daniel@analog.com, marcelo.schmitt1@gmail.com
Subject: Re: [RFC PATCH v3 3/5] iio: buffer: Extend DMAengine buffer
 interfaces to take extra sysfs attributes
Message-ID: <ajPJdoTgpw7Ndczh@nsa>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <a09f2cac2d26fe385f1f7790b0db64b7d9953ac6.1781661028.git.marcelo.schmitt@analog.com>
 <3b96ec10-b022-4135-9ade-6fd9eb6e78a6@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b96ec10-b022-4135-9ade-6fd9eb6e78a6@baylibre.com>

On Wed, Jun 17, 2026 at 04:43:18PM -0500, David Lechner wrote:
> On 6/16/26 9:03 PM, Marcelo Schmitt wrote:
> > Some devices using DMAengine buffers are connected to extra hardware that
> > allows setting how fast data is transferred to/from the buffer. However,
> > those extra pieces of harwdware are external to the sensor chip such that
> > supporting the transfer speed as a sensor property is a bit of an
> > inaccuracy. Expand IIO DMAengine buffer interfaces to take arguments for
> > extra sysfs attributes, enabling the transfer speed to be configured
> > through the buffer interface.
> 
> This message is a bit confusing. It sounds like it is attempting to
> control something about the DMA controller itself. But based on the
> later patches, it looks like this is just so we can add arbitrary
> sysfs attributes to the bufferX directory. And in this specific case,
> a sampling_frequency attribute.

Agreed. Seems like rate control comes from the buffer.

> 
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
> > New patch.
> > 
> > Now that I've come to this buffer "solution", I have pretty much convinced
> > myself it would be better to instead have some sort of IIO trigger to control
> > the signal source connected to SPI offloading trigger module.
> > 
> In the other chips with SPI offload we've done already, we just used
> IIO_CHAN_INFO_SAMP_FREQ to control the SPI offload trigger rate.
> Any reason why we can't do that here? In the original SPI offload
> discussions, IIRC the general consensus was that adding a trigger
> just to control that was overkill when I suggested the same.
> 

I tend to agree with David. Even if we come to a conclusion that we
can't use IIO_CHAN_INFO_SAMP_FREQ to control the trigger rate, I'm not
really convinced sysfs interfaces on the buffer itself are the place for
this.

- Nuno Sá


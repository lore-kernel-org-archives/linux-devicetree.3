Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0540D57D
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766007; cv=none; b=Jbl0f9JdveqQQlLQTfUe5VoxAwb0st2fP8goD7Eyc6vd0z90lK3amUYEmtMyG1EWkQj//oFMFLiFiFSxuOcvrPku7GP8cIB5xjj9fd44F08SzZ0nYNCX0pF/4KK4KK8DS7Dzh8QN7HgoEilBuyHAd5f/KjxGzDqzgT1duBvcSNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766007; c=relaxed/simple;
	bh=oIaVpra9xMtdelgZVCpUbmy/Ukn2n3p3s4KE0a0Mppk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jf7vVb5Lex0LeF+OoYI8lDMsRmlxFB0TvKEN8HyGOJdFqcxl4pdMuTsWkqle9jwvL3taaDGJBT8awwIYs6kWRlWq0nudteISDsUAgwwt3yp9Exx612vPN2mgmxsf98gptOqlWPXdvfJaBIlPyWwuE7DeWbS/+p9w0Uy9YFDUIsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhpvQPFc; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhpvQPFc"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so148959eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766005; x=1783370805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vZehTvB7/q/A8O6AeI86T/3FAK982m0Qh+Y627rtqU=;
        b=DhpvQPFcKxrbY9kR99SihTtstpzjjh6ypng8ZKtOarkL68llY29nW1qIpxZa+oRAWX
         aSSFoMTIyYTwgFQcfUyqSkAljEushl0sczIT4v9sxOnee4uZ2seKQWDAc75MrvH5KSrJ
         GnX9SxSmLbnZq51v5NRMsNX45mTVtXyyiKLON07Uax5QPc3EvQhIysKfPePoIOSrNaz+
         klxx6NjpbyFo7jQ9BBPvZsHiw0O5pJ0fdRMOuy6hKvEIxaPlHGztfzgt5CYg3ky85AHO
         2xJyBDCp6efgAHpQwVXobk3lIe/oWxpA6Y1JUgbKDf5YVv1d35EyAK3cd9oe1y0FlOFs
         86Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766005; x=1783370805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vZehTvB7/q/A8O6AeI86T/3FAK982m0Qh+Y627rtqU=;
        b=NCkaekU1clMCEmzFT8Aa1DI/v53Ri38zmhyzUGa/CkxPjUQQq+s0vNPK6jQptbdMWU
         mazG9bvEdTpHSN9yUu42Dw5TrXOt9QoUadeEo956xGG4Mhfu6Ys2sEa+rY536qVdqhkr
         Kyq/2Dh53Yw1i6Zhzt436vIEcubrNfC2TLAqqyZ52YGy7m/XRTYoWtasHjDr1QGMJL0q
         WivIEKitXBZQlB3jy0cgPk0gZnLEDZ3ZIf7/08xLBbrJt30eGpCxtzweWnlsbfSOGNsA
         ZjCoSjdfExOu28yI0A5L32d6zEdHK+xgTiluxvyAfuX+7tHE5wGP6O0bTC7Sz+ne+sLF
         sezg==
X-Forwarded-Encrypted: i=1; AHgh+RoMucdXqjCHlMJHKftEUHRtRpT7nIah2r3MxStDYv9ySotl65ZV4sKbshdE2kKgzjinC+usybSQ6NJl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwc+c1ZwujHx9QLKk9ErZKUqvWHx5xgPv82fOC6ysiwsoQw+Qq
	5ca2SHuFHYXQCj0hfDwvmgnTjBfgJIQbPh0TjMUU4PJP7gqcXNPxkJsx
X-Gm-Gg: AfdE7cmyUknRS/eumaA4xKsz16r8i5XKPXCyVqXBitCs7025DTxPtBnot8xX74rtgqP
	zWkkxJtcGAoqO062xkej6SanRiU95Dvq8a8E4RHfXgYELaiM841yVrv8ziEEUm4vjmBXuigIB2T
	CR3P9vaKU/8gMKL6aOFp41RNiY93L6A20DOXWa19Re2MhpSmDSvW8aHA/zkgGZkzkG+/rGCB07a
	R18ygnl/Y7VrjcjqKmfSEH+iI2Ier8MrGyFzZAnK8jW78vtFLcFO/3Y+Xb9A8pJ8+tDnSHtbRil
	qpNGG4WOhTC3aU2HRvVYY8bjeUxEDRPXtU1hTUTMneOy3d00V9vc6IgEdifMg//5omAfF/w7vfW
	Vjq7noDRqQ/l75ZVYwAJAoQvW8cTeV3M4s7EUISQbH8ruf8XsCO3ubFOqsrCC88oZw+OCYW5sxv
	lS1Lx7WHfEonS9Uox5mzBNm7xHjA==
X-Received: by 2002:a05:7301:9c83:b0:2ef:8b91:212 with SMTP id 5a478bee46e88-30ee128cd28mr682632eec.14.1782766005075;
        Mon, 29 Jun 2026 13:46:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee320827fsm715977eec.25.2026.06.29.13.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:46:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:46:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/9] hwmon: adm1275: Detect coefficient overflow
Message-ID: <dfce0e79-7a8d-4861-8343-27f4581eb044@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <d9e3320dbd62e094ff89598cb3aac5b5e716f9e7.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9e3320dbd62e094ff89598cb3aac5b5e716f9e7.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:23:58AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Sashiko detected potential coefficient overflow if large shunt resistor
> is used. When going unnoticed it can cause "drastically incorrect
> telemetry scaling factors" as Sashiko put it.
> 
> I am not convinced such "drastically incorrect telemetry scaling
> factors" could have gone unnoticed, so I suspect such large shunt
> resistors aren't really used. Well, it shouldn't hurt to detect the
> error and abort the probe before Really Wrong current / power -values
> are reported to user by the hwmon.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
> Revision history:
> v1 => v2:
>  - New patch
> 
> This patch returns -EOVERFLOW with an error print if overflow is
> detected. IF there really are systems where the overflow truly occurs,
> then this change will cause the probe to fail - which might hurt the
> boot process. It might be safer to only print the warning. One could
> also try changing the order of the shunt resistor value division (/1000)
> and the multiplication and see if overflow goes away - but it'll be
> somewhat more complex then. Hence, I just decided to error-out if this
> happens, and leave this for the people facing the real overflow to fix
> (if needed)... It's still fair to mention this might cause issues.

Let's see if it happens.

Applied.

Thanks,
Guenter

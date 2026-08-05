Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56D375ACB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941893; cv=none; b=WoccMve60TdLMkTtPq2uluI1wZsOicvvxaP68VoM46GAI0WqHvtBbF7/UTIR+MyTWesqBFmbkH94Tlr948E5fG45Hwu2QPVsrzrhZwwelCubbErhVEjmDrqTyGNOXQrcPw9lIxBvilfavwLuchOLl6wvqmGANnXEUhIfRB3BVlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941893; c=relaxed/simple;
	bh=9S/faSZXw85fr7ERVeNcmiX7A2STfXPOz+vsocu6na4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyE3YXg5cnBnK9is8srrd+lE7JMtDGpWS9KDD1fMr2ic9KzRridhpr9tCv9djWAbsIhQkYQhI7Nho0I/s5CyIPUOS6ya/4g/eG61uwSLfll2QEyJ8J0Oao5NVHqI24mEEDlYAw5X4SFeYlgGETcV0x8rTIGoJoIav8AUIxxEmik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA3v6CJ8; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA3v6CJ8"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38511175ad3so929048a91.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941892; x=1786546692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qoe2BAtQzV2Z/pr4B+d9y9nLNSXO+lcdy6rhWuxxDJo=;
        b=ZA3v6CJ8WbCrpq5kc4HNlWpTgSpNPnvhmavRSWGxkc87ofa6r+7LFxX7nr1e8DJvkg
         0N8BIUWK5O45niwHEffpF/zMr8smQo2pmFD4Ocmod70jpAMzlE4Hx5gsu7oj6Fm+jfS2
         ezKWXZMyW5lf1Exd4Ocfffrsc8YRK8tg6S2/ev35oURVGAVSfbEqZ2VSf0JujWkFbICk
         jFguACUJVfDXq3YGk50xP3GD4e9+xXK4hV7xKw9ev8wQLZK5x++L5mjkYl80T7NBXwr2
         fNUYpV3kwfImsDfVDQfGs0XXFMl3ImwUi1V6KbaHpUOOkaJL1+RgkHa89Hfk0H3EKPWG
         W6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941892; x=1786546692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoe2BAtQzV2Z/pr4B+d9y9nLNSXO+lcdy6rhWuxxDJo=;
        b=ZJxgjNXvWXHfQDriezFEIRfcvOk4mjVry5133UlncBKh+VDMEQXmi5+Ha3hPTdoQvp
         ADJdfaF0h9gJejSpX4TDYs6A8Em6bSJKQCtTDxZ2kfJUg95KEfCeIs6lL1BxL1kFN11p
         fXwu7l9tvJomEHcOeda7Yr8D4+urP3FWBABso3v1GWXHUmQ0t5L4eOfF4YP9ZPbp3I9a
         IdI9QMNLcLr8O/wTlNyQdYTatojqKqHn2QZVmNHaUVLsX0iJv0vTG2XfLPpYp4hQVvLJ
         he+Dhw/vUeFaq/OFQAWYWbwCWCqL3y3uhB7WJxePqdza8i/3HycTu7zdvCkHBA0Tl1/k
         VYng==
X-Forwarded-Encrypted: i=1; AHgh+RobH7U9G9lkgOvkpmfzhofcn2FqycR2Ds7X2l2OtZsnN/OIyvmJgPh6gNKsZeIiqlLSx6Q4dyC7aJSk@vger.kernel.org
X-Gm-Message-State: AOJu0YwN79sRAN8/k6jnecHmGRsxF5OfSGiCHcQBTcm5Imt90zBXFwdc
	wo7O9f6HGp6AUbAtj0z8x/2v3rTuJ3Er7F9+RddNwGENNzWy4b5EFoRk
X-Gm-Gg: AR+sD10/HcoPTvfVKh7RLc2vtfheSTJZ/kCE7E9LyUEylsQNUrIK9IjgGiAwtMvkvbr
	C0bbmzGET2hbt6Sw8ap6/oXhtDx2Ons6Mibm8O/PYoXcqEajE1eAE/esD5Q/W/EYipWOEuFp7lN
	GiDigB0YI0fpgwNptVyLmcMs3vjMRtVJ7I8D+eYosj0wuuNFMkXTjOk+22ArGZAuZG48MIItlnC
	rmMmtApG3Rgj7kP3HY5zIvYI/778PDdvhsWgUax9WZ9w7zZuGczXeu3LLybFusc0ymre7BUqAZ9
	sIv4J3cpuSnwSdgjZ3iG3S89EsXwZOBDd3Fwu2x1psXvkXDmAQP6/bIuDbx6cVlEdspEh7+ypTN
	QQzlAKiNf30CoKaH9LEHGHEEbZik2FMi+Z+qfIgsHhgqwnrIfJ3ZDbF8Vo/8QaIEC+QzeqcQQyB
	uAI6VG2+z9CxlYkr4lenwsVxgYwVMdCUP5wwp/i1z9qRWl+BNEwedHTbAumbO7+iaYvtXaaM9R1
	g==
X-Received: by 2002:a17:90b:280d:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3903c54fbebmr8588690a91.1.1785941891593;
        Wed, 05 Aug 2026 07:58:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df88csm13204639c88.11.2026.08.05.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:58:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Aug 2026 07:58:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [hwmon-next PATCH v6 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Message-ID: <f6ecb967-b77a-4983-ac2c-3b33822480c5@roeck-us.net>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-2-5605a5f95467@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-adt7470_thermalzone-v6-2-5605a5f95467@gmail.com>

On Wed, Aug 05, 2026 at 10:15:18AM -0300, Luiz Angelo Daros de Luca wrote:
> Instead of a magic 255, use a macro to refer to it.
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter

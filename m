Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C136EA99
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379303; cv=none; b=g60ny+uFDbBEXha7AoDDIJ90t/nwo0ZDmPOLpctJEJ4xDBf/MCVzCKPTlHP/E2m7Gy/k50/UFdRK5yxytf2EoYaiCZsTAG/l/hEExHR33K7E352XwMvG5z2/BYaJc7XxmOa2cw8Tj91PCSV0GR2NYS00X+HBejOLSDYxnOGqJ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379303; c=relaxed/simple;
	bh=eN76IaQNNsFMzboJ7uzkOsVyzXEKlJdV+OXL21gH28Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPC5My2hjUnu6eCc3JZHnad34nSnFDcBntIXTjpG+POvbTmK1EN4CwE93yuqGVBL8EzXEfLrYvgfBeyvA2ZKmS9p5XpjC2P+Ur6ORRNgOW6cTvmkCQ1R645Gpsbx0QI/BJt+d0Ysx6ue5bMxN5JUXPqvvnwAz+z84aopFfyHQ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+KtkYzD; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+KtkYzD"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb85186d43so807483a12.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 19:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785379302; x=1785984102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BAR4/j+FQtP8ZPELYelyiBjHkB/Toahtd7iUgZd+SOE=;
        b=V+KtkYzDABAtYgf5uqGPpVLVgjElqtzDhFgLuIRet43ZI3CVcDJn1Jn8zZ/F3s93kO
         8aT/zJh35brlaHHPAMzcNVqRP3kmxd8FLWPFSgTc16Ym4FDI9fzbkIamwsWGapbp2zuU
         hCwHc6GfaGjXi21nSjRw+8aBdx5xo6D/HWdFJaMrCChnvD5D/xk9yBuDoeSJ6wEuIg1+
         dI9OvCNRUV1TOnFWmaWw35t37ayf301WpQRyefLemO36U5Hjmskn/e7WHqzqmwXFzfqT
         C5LISPdLJw29GtYfKBF4TD2gc3QUhmdXrlGSqI3Gbd1oacqEoiUa2y/W6mpx+F75Q+Vy
         e55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379302; x=1785984102;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAR4/j+FQtP8ZPELYelyiBjHkB/Toahtd7iUgZd+SOE=;
        b=I4d5dffE9cIfY5Eo2rkitt/pDCR2c4bvqSqJafj57ZHw9J01gu9petpq6b1YkLbHWR
         y4gDGJO89mD2cYtTRqvhGNuupr41aE6zCtYg4KjhPQ0NzRHqrxLx/bFyBtvkanff9ZL+
         8cwkCZH3LdXQQkjZIF1x55pChmESWdU3izDK/uX09aNFGBvnDCM7YZrSuv8lV5VkVYMy
         cDZWvtPuk8vLELGZRFk3rZHN8BIMgply32aplWx7M/MVnKHzZCtZkVJDE59B8YQWPCLn
         8Tealgal7nmjSQIciuZu7GYup2p+47JK3uIFn5yxO9dCC0I/bAYkQlaAxJbdg90A2mQG
         GJKw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7dPqBmBwVISY8L1p+WdjmvhP0n+YspT0zhyJrdKVlrT+KXLF468Lgfn39UkhZgk+FWG7rrZ2e9Vdx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8H+581lOnhMochmAUJAIpLVyTh6voa4Uwi5BI4v4v5aZt+WHY
	1m7WU1ji8QDA2O6RosOjsC0PpnKOGk9wkZkd1lIrkBNd2/dFr0u/kFgA
X-Gm-Gg: AR+sD125lmHZ1NVpCnaxMGXB1UI4hMr7jUlUENFslXl2slxQVpWMIAXTjRy4h3VUp2q
	+1UKpmHyjME7SL1LV9/0k5iMzUHJ02uj9dV0ZTzQGEEyq2ghcrOTH3AoaEKoeMSHCzUD4pqj0Ok
	RyAAIYlQVMrgxMSLxX7/rK1n5SIGW5JwR9P+WIS8wWaFQYxrAW56llUbcvNxC4LgMZy0lgSrsNP
	bcpaggqo4p7Esqxu50qqIsD3VMeV5H936b7kvgL9bJhVz3X665Ui6vsAs/AMcDwF71Ish/W+E/7
	Ief5RTj1UmY6Mrb8mEUhEEfCgZosKB+dv7oZOz5Hyl0gKJc9CyUyQ6qV7PrhKxSnxl7iflD2xus
	4lFm2x/CbfVTJRlub9EmvJ1G1o3EJPIYfYRQv1At0oTP+K7sTZoiWSAckO9dO7JRAsOpWCPGiHK
	NRTsPE4F0gvE2GLzGSAjgBLrT/whsW6Tmfi6vG5Meq4Yf3rb8HaYTJzqS3giN5xao6BsQcltFeZ
	iv6HImqyjqB
X-Received: by 2002:a05:6a21:920d:b0:3bf:6237:4d46 with SMTP id adf61e73a8af0-3c900706611mr650626637.28.1785379301731;
        Wed, 29 Jul 2026 19:41:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm16154296eec.9.2026.07.29.19.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:41:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jul 2026 19:41:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Message-ID: <7f9190c5-8f7f-45e0-87f3-122fed3b2f55@roeck-us.net>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-3-a7553f84ee74@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-dev-max20830c-v5-3-a7553f84ee74@analog.com>

On Thu, Jul 30, 2026 at 09:03:35AM +0800, Alexis Czezar Torreno wrote:
> Add compatible strings for variants of MAX20830 which are MAX20830C
> and MAX20840C. These devices have the same register functionality with
> MAX20830 but with a longer IC_DEVICE_ID.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter

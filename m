Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD6493D24
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399601; cv=none; b=nm/VQ2bpkN3y002adXZ6LPQP+hX4ChBx0Lha8d/bcAkLWUDUmAq6qQ78QMP/zgAc+zzFrvabLMCMBiIogGY7h2mK2oQymt0hfIbEe30+R9rGrmOpcb5XoA0Wyldn3AFoSeSJOMVN2lNmImCMOB+goRiYThL2bTvv26d7aYaZvvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399601; c=relaxed/simple;
	bh=A+WJXH8LEWEmVEvHuluPt5ZSvK79HhNgL+/k4aL7GRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGseHAx0U4OhQgoyISzhkDcI5fSVraSRlY4UXk/MAAOPd0geqZE6FqdVod+CFurFVhdQ6xifRJZeIfsk1J2JwrAwpavd6QJPzGymCXfLpvh0wELuWrcCOxyg5VAngwPiXJ+Z8/QwlYdSL7ozU98hNze9vu5ZETtlvYA6dWbcBhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5rh4SYV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5rh4SYV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so30379535ad.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399599; x=1790004399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=D5rh4SYVfQYCkRVFKzGdB1L9V1OLhlOhCKclHkp+fpx02F4njrQeeIvyX4IjvkCoeN
         49UqSrnQcp10IlD0Xs4cpRY32d+DNCyFuq3RxJtRPQP5MY6wEZBAvX3hovhbeve12R7v
         yHHPP4vATJstE3HPnmqdMD/Df0viOU2smgRrg2FX5vjTT4B3RZIoyS4Y4m/2wtPgnNqv
         N+bJCFePE20bR6N2mPA5+hVEUi1AIFuTvS4g9sPD+tr7nsIKE1VUlz6MzXEILC7vrKgE
         iLhfMRVKMeoiAgUXinhCIck8ovROQigpouBcTItAOSRivEo99eVxvhBsC0v0wYbNk44g
         UOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399599; x=1790004399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=oKsl5eviW1uu6dNqGHrkECzvjCuTFFhPsaf8AWXrRt1GH8iWeejMkgp0ffk5wurgzZ
         RsahWpq0GCAJzv7ego2/PZcV+d1uZ58MJ6WM0E4hhhvGiZbY5YehhBbVdsRHrhHo++4q
         UQgoJbKuHdun50mRe/nW/8lm6ioeOchhkOIcN7HuC36naiMzOAhYUh9aAhv91ylu5i+g
         Qn1EGON4sLxXg2U43AkTSI6RQxAWrTKwn8tR+Xx/q3swiADJozqDDQSa9s37xHitdKmF
         gJFQsvNeEq8koYPDjepO6hMxzHnECOQtRdJR3q9PV2D1pQhQTvMg7soRvXB1+u+9TTP/
         oL6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIEV+9XFWrx6BHTDPH+BDmIgbp0nEf1usfKLKUn/Ph1gD9P597cOYbGTKIPEZ0Ly+B0U/+SdpFxUJm@vger.kernel.org
X-Gm-Message-State: AFuF++mydaRa7jVHIKDhrCzLNvMtQIYHqOLU8FOTNXHRyd18wGiZaEM4
	XUxUHqH+Lil++lBZXDXFJalX3VNGmK2Gy8Zd2rh3EHJumuZANf4dlQFW
X-Gm-Gg: AYBFou0NhXsaeuW65xCsBc7F47Padrd0fkn3yv+Qmf407FPHWRA/freVSXCafJahpON
	3JIz+NNDWxz9AbSoygiK3bi4x78/sGfxXO4gDz7v4l4riWp4CScjNWn/RjR8QUGWOAzH217Wq+Q
	TAz9cQjJqQ35Tw0w7iv98eA23Iq3QT7YKI5b4BkvHsbk+U4Fa1cnZiyRw+xUwbr+FQBeYViTjI7
	9z7VYX24ZTsLcXxs4GEs9hnC9O2yqUzGbUGpC7GkzsCC3pTcQ34Npj1hHcp4jbFfh5ETxUkdfLw
	AqDydGwSxjTjiyIpxZCw2iJhkHAB4WYtwGWC3GCIj5OutwBRrvQAtPjqYkBWfNlcurWGdDE9Jy9
	CdRoF0zfKnfa4HvEJh4/jXzFBT3JCMnR5P7q46nM1Gtbflh+W1YIC6UDY0GryFcE+G5sLSLsS5k
	Hnmuqpn69pGF3Q/O+Pxb5NzpbSmX2l1TNwDrpd+Bn/zfVpkkRctVLMPt1Gy/9EBZ4D57S6TXYDt
	KqchfZ3It2o
X-Received: by 2002:a17:903:35c6:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd6c6c0cc0mr59735695ad.10.1789399599255;
        Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm51211505ad.66.2026.09.14.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:26:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <35ea8534-5446-40fc-b1a7-72a115bc40b6@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:53PM +0800, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter

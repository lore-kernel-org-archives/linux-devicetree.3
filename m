Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208312BF002;
	Wed, 22 Jul 2026 06:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702308; cv=none; b=XbuMCJMoR9jsWikOMwHE62evj1+Eh/Pa/Pft/1LyFlLXeJfQsTL6HU6ikzltuHGvcimtFjt5un/gxHkW+JmaCY94BLPgfKt6apY1AsOqF4t7MDgQDCx/FPgHGCPe8nEOyTbzFUxGxVPSgm5zhJVmDKCXX3iIwj+daR+EE2JwJfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702308; c=relaxed/simple;
	bh=UZHtU7JphkQN4ftn7cqcvERcRP30Lbaq3drcx88y0TQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lNUyBqh2+SU4nyOacZOWu7PLHh/ui69liIFRITh2aRVJtCBY4vneD6TVj9GhAhZwzHRpVxFdu4cK0AuqdzMBqL17CkQzT3B8YwIkSvj4XnkgmW2g2Pjk4X7BWti6rAKT9G4SR+pQykbltrTa56a7Glfy90u38GxF+rCdMCgJBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=eSe99VQZ; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="eSe99VQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784702304;
	bh=+zb3qHEfQNdn/VPyYyBL6pEsHOl2hhCoI2rgqrXHwIU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eSe99VQZiVbw4Fq0s58JabWxbarccjIvszDKZhQLLk4Yv3U8Am0+gmICw1uqhhv0Z
	 KnM6wgUNlZ9d9PiqfqSXh1g9Km1CX+mzFtZgu9HSUL9UkzwSlfPQb9eCFD1zHVNQXt
	 93NC8NHw7PC8wQIfOm5iOjGORm4Hj+p/ckpQNSKuDvbYvABav4Ix4MdsxFaDuCIWGP
	 nh/5xBGWW8YceGIEX4AD1lRQeKjmFkx8o2+L2lUHRNZEPwnfw4ZHkOCa9EsDGOBztS
	 TcSoAFEQJNStXvrQJXB6sQe6v7vJew1xaCJgiMEJk3gf6mFoF/boTqiQgEGZtpYAS4
	 6zEWuZRMIe06g==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1FC0465B37;
	Wed, 22 Jul 2026 14:38:24 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>
In-Reply-To: <20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-v1-1-8287b306e02a@gmail.com>
References: <20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-v1-1-8287b306e02a@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: sanmiguel: fix PWRGD_RMC_N
 active-low hog configuration
Message-Id: <178470230401.777395.14157899070923881410.b4-ty@b4>
Date: Wed, 22 Jul 2026 16:08:24 +0930
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 16 Jul 2026 10:31:17 +0800, Potin Lai wrote:
> GPIO 14 on the fio_ioexp (pca9555) controller corresponds to the
> PWRGD_RMC_N signal, which is active-low.
> 
> The pwrgd-rmc-hog node currently specifies output-low for this GPIO
> with GPIO_ACTIVE_LOW flags. Under Linux gpiolib, configuring an
> active-low GPIO hog with output-low sets the logical value to inactive
> (0), causing the subsystem to drive the physical line high.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


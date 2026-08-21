Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472D84C0420
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321166; cv=none; b=fpxa8Ibqq/N312KqsPu6yzUfpdosexiWJYaN1SPsZmSAZzxmIg2+n87vTz6wvlWu+gWiC75BvQlx8+NTflp5NThBMSRJ5TPFvb+ztJP3f2MsxzHT0r/K8dozUWb3UAfC5iJ019hU3E0Vh8JzDVwMjdp5PQ/V8uRxRDWIrzB/Ovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321166; c=relaxed/simple;
	bh=pcfJ/3LskojaaUGgdCajL/g45ro6XHBxMEZHa9hKon4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s11Sca4d3GaJ0wkjQPcV9Nhc5HDuqEARdN8LykqHLarr6kAV2B4oIOLrK2/CEKQOLnYjuH1gxL8Rx2kMl8SktzN0OKDGZ8/+tDRSol+ufP3xpPGm6wqC9oUOxY46uEkQu4yW36tB7QPHctXDduuOOEpmUOcNmN79iFQSR1939wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEZarZWh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEZarZWh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49954b88fffso8818235e9.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787321163; x=1787925963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcfJ/3LskojaaUGgdCajL/g45ro6XHBxMEZHa9hKon4=;
        b=sEZarZWhbwplvrfm75T4nu/J2CJowI9F2kHL968xnnn3VZXD555iubxYTSkrQqH+1U
         BXYEDKiFnqswgqZxicuPKwpNnprNVaFl5bzz7s/fPpF9PMPhH54ul1AxIy5aoDAE3k6n
         Oh/IE1QN4KtdZa/7La8nSBPZoEsSPwCmJEZoNhwbq5RqsNgeFzN6ziXtzVMAmPCsgdOi
         UTzsDgcCmtFEzFmJmLIdGyJR0KRairWWMBVIMeQMF6izCl/9o5fpS3+86lIGHQ983s5m
         zuBC07uA0R/rdDczl77Qn3+Ged3ornYMrqQTCvHgvpKVMFCbm43pBUnBGlpWWSJMJ1C5
         gV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321163; x=1787925963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcfJ/3LskojaaUGgdCajL/g45ro6XHBxMEZHa9hKon4=;
        b=OEs8hKZjlA70LYkZ7CQzKZoA5WWJ6LcdtavHX053xZhPNQtkiR0mjRkw1N+fA/Esq/
         TVdSHBlkqfDSqjn9v/fKSdU0AUxg2vlZdQyKvvFI7fgVhX81TJOnSJWlu0benSvvb98/
         1a7X2wtu2ft63ywCJW0JNDc2gJqC7S6HSncasDF2npyiueW0VIXGB4ZRA9dZaoEdqWP6
         DqSFKIOxIkyIxym0Z6PxWRTXwA39o7KndEz1fMDWgj6EgUbL9s1X/t+z/dHz/swOD9FO
         UqpmHDuoZQkH5yjK2Z3u+Rc6f0OJmWplUw1n7ICBMhfes8eok6J7l18okIoFjQM8UDth
         q7vw==
X-Forwarded-Encrypted: i=1; AHgh+RrOz/SNr0hbOuyLhTDFzJuXb9boMl+c7T3Wak2N1qZ2EWK453u/nR3OJjFaL6XVHewb9tW3JNEfI3/V@vger.kernel.org
X-Gm-Message-State: AOJu0YzmIxD9v+6678U1y3W4lQyYDWA6lPY+brt5kjlQ/3ZdkZ+zrAh3
	SYKd8sK5OMrGeD9fkhld4n+8AulPWjc4nHSiet9oxiUtyBJQFA5J1Evg
X-Gm-Gg: AR+sD12vMvqANyCiPw/eaajwfyBiiNtJRRh4czAOPMBApzEBPFkDPdwcV1hKpJsXTFr
	Yo5+y0JUmDyQBjjjh1AroyUsZVBb1aE+Hte/O+j7ByG5DwXNk5z2yoSFjmOg9ivO45ySn69/yQ9
	ZRPwAO6FGmAr5fc56qxYQphj3p7t4PU5mI5z64YNgDE02Ns5hxvswnWYsritS67/Aohc38PWcQZ
	0wlSeM+gvk7YnYxSJkKNLFtpdkRfWdsWNqgvq6ALmF9fTjCvyoC/onx94VqCmauDrl61Y9cjP4S
	Jtd3ggNgVtoNzg0mdTNH3Wilo/ooCqVKdMz1Cf6rUIujnBkL6Hg5iVDT7vKRZTWIYX+Fn8LIiDy
	Hv9SQMXgSg00EMcrPyhJl7d7bYUfnEtixIxuzIhNTd6Xnwz8porFiywxTmi348VpRZi1ffsoasN
	m+mX/2elA1JaP7I3SPvEJVBK8C7GzcBbvNNlDJLoPjN3Vh3+Jnfxu6agWiPpYVq6w8p1I3kWmAB
	jdeXWpK2uaAfkEouOf6JQsB
X-Received: by 2002:a05:600c:8108:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-499b82f40b6mr113096785e9.2.1787321163184;
        Fri, 21 Aug 2026 07:06:03 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9111a5fsm28637435e9.12.2026.08.21.07.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:06:02 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: andriy.shevchenko@intel.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 5/6] iio: dac: ad5504: introduce local lock to protect state and spi transfers
Date: Fri, 21 Aug 2026 10:05:46 -0400
Message-ID: <20260821140546.96474-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aohTG8UxkmHSUzzh@ashevche-desk.local>
References: <aohTG8UxkmHSUzzh@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This part is not needed to be under the mutex. So, first convert the
> input, then acquire the lock.

Good point, will fix in v6. Sending tomorrow to leave a bit of room
for any other feedback on the series.

Best Regards,
Taha Ed-Dafili

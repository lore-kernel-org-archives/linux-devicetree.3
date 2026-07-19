Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC820E334
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470603; cv=none; b=gXGdbkU5TJ+yW4nLFzgnqtHpPf5gtXmCZBC+DcqslWP5wKPhNCREEDEQmu9DSkmrSQ/4EzTxZFFpq4QRX4kbDEpCTe9v/vunNmfz3C6mlSJ3COROShg9kqAbLMDZZP4VG7EGyWLf9m33BGsS0ahl6FPUnJSGK4gHhCM9LbcgxwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470603; c=relaxed/simple;
	bh=cwcFjwlC9XWGnFfo+mLll0vJJ0N+PQ/CNGhbgglWYAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iB1v2NPK8wDA0i6Vrqg9WpAJN8ufOrkiGn8nd3P00tt+MRS7ML+ptzBK8t/xWKPqMkws/k4YWyIyh7fodtPWdw8ebwrlHEV+u/FreA6ZQQEOdEsAD9VQDFJBFjIomD0fII2Tcyi7o4r3z4EwvEP23YR854aW48uwIJe2HUrIiMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W89bOnod; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W89bOnod"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so5258880a91.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470601; x=1785075401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHyN3ZHgdsiq85sCwYmC+VXiytirIyjYwu1Jlw0IBO8=;
        b=W89bOnodunSxy2TmXb6RVkXH7kAvAQSotMS1TtZul+achFwi+BxbOhhyKLSZZXV4IK
         +E/T1pdXcjOiM4+1UfOMwB8N3BuOsDJ3sv71sJfIbX7weuCihFE9vxOjgUMDvyG4XWUC
         i3xtHm/JzIem8J3k4r8GS+2wjBOTWDUAWut5EZI6nXY2igRub6UZgzs6Qfx4xgdEmwy1
         NUROJAi/23qOeNB7pTrzYSrOGMb+N64PU/4tG0+vImcQhXmApaXkjApc/wkb6M9U09ru
         QAFMfUrwNLKZSwt8ALIafOvTJr9gQZSDraxG24t2KnCxyC8+T0Biwu3OsxAmKq/eqOcq
         UqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470601; x=1785075401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHyN3ZHgdsiq85sCwYmC+VXiytirIyjYwu1Jlw0IBO8=;
        b=ZX6hIkNwzp3YuViEeQ5TrIWswtN93QcLAOlaz8XGmHEg4HJnteklITM8IRCv6IFUD4
         hMGY0S363eIrTAjgkdhcgPEisG87wunOwFEAhR26YGl+G4cu9KedQhOJ4D7DdgwvbZSA
         05VdR6xGXIlQNXtlykWHLYvmp1n/16H0P0uZQLqqxqJ9b2x73nWDfCpw9vsrRxiSImdw
         ODZ+lcODx1BPaX4xuj+UkYMqqH15g6ZQrDbyt4V2D3HYUj5WRXe6Lz9BNChZgnKdXxvb
         GMtR4aoNtlmF4kE6+UMg/Zzxwo+oXT4j62G/JS7scJBm396t/ItTi8HSeFOQpquGiIau
         gDkw==
X-Forwarded-Encrypted: i=1; AHgh+RqBgA05uzlZJ2J3aGKoiX0fAvSbRY9F2yem/zX0RNJFjpivJO18Kedd+DLBChd2PvALzrAdVW+sqEYI@vger.kernel.org
X-Gm-Message-State: AOJu0YzWaKBvKlFZ8bjh5mrvJsqRNeSTGqjRDFO6bc6W4E4Mu4p2uOjh
	nh6/fNdVVxEjD62d1d0eNJVjX/pWtkI1PONbRenhKDLY3igTLZgRPcMn
X-Gm-Gg: AfdE7cm1+R5hYLIemXjj2vCi/wR5m144a3UW1Bgt3oyqS8DT67+2r4TszwW7GmsDJt3
	m/eQCPfelKVLQHAKpPZfKHhUr7AQx5vyeHD/VtppJtqfscKsFSZVg2/f1cDwhjuHa5GRqdiikxQ
	mPdMyAXFOnw4cHz/CzD2HTXimW+00zioN6Mf7dS8C5IoChyfSZzgL+0qbZVdUBaqZ2UW7b15zbt
	l9AG4BE81jPvJArmvzJGLeU3reJJoBTWlg+F6OuqBR468u7b18xDabHmmCbfRL5U3Sq+2tJ8Lwv
	QH8zh7Wu1QpA6JqrjHOsQ0cFyjfr6QyX+GRbZbGeiXpCWg2D8Bvig7gaJQvdCr4zm2MoH2WeDbs
	mCKiouh+rKy2bVzpM3u1ZSf4OkaViDuJsJZ5AHFtEupzgxK5ipGGOxwr+bWNcTzzgECWlzaxr/X
	v95CotSYiA3/GKr83vfp8SElas7g==
X-Received: by 2002:a17:90b:17cc:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38e4b3db1bfmr11446884a91.2.1784470601299;
        Sun, 19 Jul 2026 07:16:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7790sm6151339a91.3.2026.07.19.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:16:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:16:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Message-ID: <a4253a11-2970-475a-93db-a09223c26759@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:56PM +0800, Zaixiang Xu wrote:
> Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
> The prefix was confirmed from the manufacturer's website:
> https://www.gxcas.com/en/index.html
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Applied.

Thanks,
Guenter

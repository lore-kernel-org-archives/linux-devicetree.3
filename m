Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3D49DBA0
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163752; cv=pass; b=ctZnhFgurCf0nCdviW0lRP08gaNOWH76Ruk/n12D8RQSI8IpTc43jq5TNM2O30GsftQv6z5RBfTFf+0DaGt6028iKWLdTPS3CIw5788zaMhjTD6stWzjD3iEEqh9IpSYlpJKewn+LBN5poHspizUZxnxl86FuKicedMCIa7WGis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163752; c=relaxed/simple;
	bh=nM7tbZ862fD4OC0Mg3Y7YqIbQSRAS6s7yXDWKfA5Yyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SedKmyKZ/oPOzdj/2kwLpfOCXX6TX17dRAkD317IBSHuFau0Zby1gZsrmViW7pi5eyBVuF34dfAhSd+0xv8o9RoSgvMiAW1ZYNlZGTlvUgt/JI813gpzNHwhKs2uICoJ4eOIKAHVWFpsW3UcAa+oDNk5XBczL4UHUTgyhd85Jn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwh+qwR5; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwh+qwR5"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cc46c4so87433085a.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790163738; cv=none;
        d=google.com; s=arc-20260327;
        b=R51iLq5+aLF4JWxycjcXQrxNymzdErnMXIAk+aQDUeP64+2E4xBJnrRiXHlhCtHVnI
         h9oCm0W2GnzCPZ6nwBY0dmkcNaFcLMdsPYzAdCOsXRc5eoGwEhEysUZ/t1kXxZbsDJDx
         Lj2Tpue7DXyW0MtKO1w8tgZ7ITicTscjz0PHpS4Gks/8bvS2Qo6WbnQyxSBRVWJ85otx
         1fdl1O8Rh7JIFc1XIUJ0uwNB71zVm+UVBPSAOzhp0F9ON6eak2Oxi31sbQX0PKjwefEI
         BQ7prGevosgqKySqDw305/lWiv+GRvlxvZnWb7Qnlc04smAjKFDpmtIpghoID6A1Cs3X
         lwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        fh=Sd5U4/lSdJj3EoPSgKvCmG6QXH/EX7tnn6K9PBhGfc8=;
        b=SwspiK5IfX+XsyuSN92fCYW4p9Rn+LQ90f96A+YPDVYfr9EbtwBNJDWQA0zNTLDnjj
         vcNZ9WeKny2b05I4awUdO6EvjxCSr9gjo0hWxtXYybfwcw6rG4QqNRoEbO0vM5R/AHvW
         +gwek26bEZD+N98jd+LkbAhFLGjgYvKry3nJJGr+QqY+uaQyimfBhbkTXOyJl9O9ZVkp
         zlAdJTq8r5BRtM/8ebSnK0gDPO1fVSV1CLy9mnV8VF9l7Ol1Z5C3q1pyRI8ix7rA0i9c
         E/L/BzsBpqpxD5iooC6IDlRLHj39mjjsE08Q+kIbTXKlmTLotnAiuUqN4Pn8p9hXpuqD
         OI7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790163738; x=1790768538; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        b=rwh+qwR5lVhQK2gHkHLNxELmmrXonjiF5TtFRPBwIwmx4uja5M5FCsDm/TtVqy61r+
         DxANn73DHJ1WBkPSfsQY5HRJsZH+rgawjVK9/cwAR6Zu7r90mZ/dWhMCl8BwLhBngAU8
         U3o4ib0g6fKZTlrQ9WemX7YwpAtdKFthH1iGbtGDIMSoD0iVVZZOyB8HFIvWi6sZEsIU
         tE8YeptdyQ+BflreDCoU45ESdCXG6OOAaV4VYruew25k58UEBEW+3R87YnX2fq50XNPz
         7VlCuUDlqx1A0wmIF3s36mNGuElLBJGf6YbPspZRfNMbyJU/tDI/lN68pPZbFD2zJyve
         0qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163738; x=1790768538;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        b=IDlePRfxrZoWyk73NJmlIvfF8x+9LpG31J/9HHBjmzBlDUED/2LgWvs4jFViLYWwKp
         zVgr+e95iVvHEJw4v5kvX07PByofttD54lJfHa+hzqVfpK+iIdyPPhkTsW1qByMNVB3P
         dq+tnbd9HfYDa70V1bZvwYt8G6/TJ9kCOAWJY00Q/wi+GwdR3noHbOlrQuTtcouKZxrY
         McUemIS8Q6dJG6Ty+1TJggRqMg9hNtS5MHAq8LsIR+lesVAXEwHE4HIe/Ur1WnfvMq/A
         5+YZ+v7NKMsF+NsRHqZz+jbEJ74kOZFdmtYJYqDHUj8zTK4WAC6lpv4v0HdGOyzYztlY
         hxSA==
X-Forwarded-Encrypted: i=1; AKwUvBylUtv2jGD+79x0ColgN3oo+coVOJSpIhUWij1FIXr+xxLzmXoWqOfYM5tW05XXjjcIdD7qrkxEREdc@vger.kernel.org
X-Gm-Message-State: AFuF++mG7W0+s8nQcgIykP7vjTYC91zzAIPjWxKSIEDmRKqqBRkKgK0p
	5MeaKDmSYoujYQrVaIT3JWkMAilQjF5MN5+5Ps5aVY4bw51/gM/eTCgJhEdptGvpJ6q40bv0lXN
	tGaQGNy4P+EH2dpXez9sj24hOsVZ/33E=
X-Gm-Gg: AYBFou2OLxOagp7P8NLjPmix7PkJEUbS/nQ49agRz+HX976KihHHj8RJTnAzg6Jk11K
	J+PKYlLGd0vHsBxjDOsgRcqDeExD0C8+1u4CUXtAIJnJwM9sWrTKr8aQnRRhgj/mM3zZQOIkl/5
	LeDZ2uVZHRgmPpqDS2yaLabptiSzkbMMPMXOIwhf1xquy/uuNA6HHUwXSLj1FXq7NDTIAag+xxB
	VAtPCSKDOsqtkEWLCOE7mlliJiW90JS10f4eyUglAki0rumE4w6kY5UVvKKIcj8YPwHwFEL1vJg
	ks0Z7sO3JISdcqJFmO6I4RpKHcr80vti2KtPDSDgDphvUDR4IjKbsDr95Lns62022MoP
X-Received: by 2002:a05:620a:2a04:b0:939:b94c:3e85 with SMTP id
 af79cd13be357-93c250f8407mr332746685a.24.1790163738125; Wed, 23 Sep 2026
 04:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
In-Reply-To: <20260923105920.CAC761F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:42:06 +0500
X-Gm-Features: AcwNN1WQplWtIF5el8zF5Tmhe4QX7yFqwnVJq9zazF13PvpPkafeV1wGHPP3_pA
Message-ID: <CANHPwAR6+f0dtOrBdwD8C4_cO5HvnpNKNnhxLZY+Bm6h-dicrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for the review - you are right.  The two buttons and the IR receiver
are on the optional 24-pin expansion board.  With the board detached the
LRADC input and the IR receiver pin are undriven and float, which can lead to
phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a devicetree
overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a Makefile entry,
following the existing sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.

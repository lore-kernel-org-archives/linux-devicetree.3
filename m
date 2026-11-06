Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985023;
	b=5AMcA21bA41MG2Scwxn7xFgO3/6okY5YCIMvyYuMDy2+HRVGobCcl+4ya6LqO5SMR9kI
	 0V4sycDee00MnlABXNTupJdd26dB/mKX5AuPQP2XKiNXAv+rO/h8TD45AyVb5oNp0j7Bs
	 IZ03fX8bCc1x99ci3wbjX89SNoQp8JFM1O1eoQT1FWg3aCq9mvzhD/LxRQ4KCGQ0rLsFg
	 JXVNkWcKhPnFJpEIFHWn0vds/oEb6f1FRBEb/Gz5cMchrpDJ5Q2fNjsl/5pkjCTsydDQP
	 DC5UCGju3+JjcA5H9skdKzQ1lgDfNwazg2HyC82ms+l+edX0V2/mFQXWfqeX1tCzG+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Mailer;
	bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
	b=2AHyw6eqkBzlgubBx4l66uhtp1IeOV4oO/bi06xX9E9McGhDx5JaMGwG/sY4TdGDAM8L
	 uTVNWt74lBqGnbQsGhbSUQVY0Y9F9d56BdOp2zik+8R62LJxQfQ1bWMHmaJjsJ1X2I3/L
	 6M3NmyMr6nSAEUdCs9C0mXkaAr8nRKHAl8VWa88AFfI/zh/YK2kf2jmHP7KMfvGqRSdIp
	 M5qQx+p1kL/D7kzSfKOVHRSfYds8mFtvOPE9+Ne+GwLdiRWBe+PvfwkZaUnBeamO3HQW0
	 0vqyFja6gCXJfMw6ByY6uBOGJ23ZD3AiP90u9idViURNBOLXo5p87sUOjttzPYLIrug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmCY9+dU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBF606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCBF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmCY9+dU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7788005e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985021; x=1794589821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=JmCY9+dUgxS5al2xR2i/XttbJnL8MfzEPMrncmnFAJnVL+gRl4itq+wpGv6Jzso3Yj
         lsk9opNlfH1q6cogTLxcMOr/jZwaFd4QymTJydkFSRwHxhBqO5bObfC5so48hHssFmrq
         sICMazWWuMHYi0vG8N6PXOEBpXAVQT9rLSS+ierixgnKOc2BfrhI3KS/yQhTLPPENp65
         t4QE/4ntdP5IOo0BlYwugM8vilNwIsuvetXiqAeqJsnjdvK1Nk6hiXO3yzYG3Iy/6PeL
         r1vVQNWfuH1vpSk1OE7ahsO4yut0wnGR1Np/teY+XPdds3Esv96rCGDLziZNRgq+sfZ3
         SXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985021; x=1794589821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=PJZ01QACfxxuhbmrjvYAAzDwDw9j51tVUjZeNM2hWzNlNGwOiR/0lsnub96kHZZKgT
         wHVkEn1w7rsl6DOCi7q+gSDS3EWP02egjUB4UAcrcf5zbBpKgHmrAJXOTn9ZVA7CMYRz
         PmYyW6UWakUPHZt0zbdmWWyaNQVSLyAhA+bCMQTBSX63ogi/DXpAPMPU2+7dmQlsH6Am
         BVjLbi/RzMczJ/AslGrOXTBUgFmKPAAcCrj8F2J1l8JpVQXfTt6G1lz9W8nKGWxID5De
         gnNAtt3e4WpUUAnojwUR746DJOiIJF2mntVGZVuPGUvePS93YqJ+prwOp49IKWvjfKun
         Kxaw==
X-Forwarded-Encrypted: i=1; AKwUvBynwyWQekN5EfvyKb90jHuwsoQPfHBLJlW7vFF3Pfg55idpnPNBMgbgN6Too2fvk2F3QBSW604wzvTM@vger.kernel.org
X-Gm-Message-State: APuU4Z9e7hNZWG3zoDcanbWZL+8d0lkleqwqWnbKGMUkS1nJ9AIeBnG0
	s4qGTSeh0c9juLLTwykJEhFgdvYvef0JKOtmsOKQWM0PqV9oPrJROEUk
X-Gm-Gg: AYBFou0WlMg7OYCai09EuFXsoZ54btYxK4B1eOa15XAj1gEneAywbXVPlBlJrIxxXPh
	whGIrZpNU5vYO/lhLvrB7N80hyMPIKxB7bNuIoHf/z6E5aZG7IYpKeplY5x4rm14u2S2dZRvT4E
	dL28VMGbsbwV3d0FBTwtUjCmKmBL5p+466MhjiI7gpjenNVnmjF33bE2PpbR804R6lJshpFzy3L
	K83aarr1qoJXiVCsR2/MaS7xcKcncgXFBBRANC+Oo4dz5x/CFZGUxoRPYMWY9TEd3wfHBUcIzSP
	cvTGLZYuAMTntCjJDwcfBHdRDVSXXiH6L/JH7YV2X7+Bg/g4jFVlRN6nOSN+N2Yk4Xmizy7J0vw
	7P9m3mqD0M/GFjKEBQlgb2dvgtG1IcD92VaBaRs78yEtEi3e+k4HaDCOdeYxiyZ8Bqs3zQLnNKI
	vKbLwJQ+UZDka7IrR+DbsSj0B45xw8E0MgiZd95dH+CGPu36hZ/5Bw9NkG7Xd7HdyFMObaD6NNE
	C38xDdDGSMnijCtMk6AUJfiayezxh72QOjOgi8phjHgWs+L4q3N+sPLxESgbEB82cpK+EmwwtMx
	7omEzMf5M/UqWH1AovbJU4/ttpPtpyE2
X-Received: by 2002:a05:600c:64c5:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b6df4f1dfdmr55413875e9.25.1793985021160;
        Fri, 06 Nov 2026 09:10:21 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm238886225e9.12.2026.11.06.09.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:10:20 -0800 (PST)
Date: Fri, 6 Nov 2026 19:10:19 +0200
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Message-ID: <au4J-0GOUuueHLZe@rabbit>
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874idv2bol.fsf@yellow.woof>
X-Mailer: mutt

On Thu, Nov 05, 2026 at 10:47:06PM +0100, Nam Cao wrote:
> Daniel Matyas <matyasdaniel006@gmail.com> writes:
> > Questions:
> >  a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
> >     modules to panel-mipi-dbi? The KD233 node would then have no driver.
> >  b) Or should KD233 panel support go into a DRM driver first? I don't have
> >     its init sequence or physical size, or the board...
> >  c) Is removal of all of fbtft already planned?
> >  d) Several other fbtft drivers have drm counterparts. Should I inspect those
> >  to see if removal is needed?
> 
> IIRC the main reason fbtft needs to stay is because it supports parallel
> interface which is missing in the DRM drivers.
> 
> Nam

Thank you for clarifying. However, the fb_ili9341 driver uses only the
SPI interface. Is it alright then to move (or remove) those drivers that only use
SPI interface and have DRM counterparts?

Furthermore, would there be a need to enable parallel interface support
in the DRM subsystem?

Daniel M

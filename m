Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808EB457E69
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141086; cv=none; b=hhsqOX1RqkLE4ddGAkciEYxnObrJZw1H3YqGGSASes9h9ZrSjEPLIuzdS881jO4y47+qsSZNJtwD8dh0J1tJ42h2tztJ9YTvpboL+NGq/9BhdXuNtCEgLx4rUSG4qral7iFbk7fg9SFvXi8l3PO1cUAz15Nhsft+vQZITkKwu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141086; c=relaxed/simple;
	bh=ddwXXS94V1hYrv1+iJwdR5Vr6S9+vc+haoqBYE6HjBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ES7fPOumjbVBo9JcyFA384J2f8dVkpV+x4E9hY0zUy1FERVw7jIFYmci2gNwSP7NU8QoijX7ckM/sptNEPenstHf+o5YVQNuaq22RyY7NpbPd3k134y0V0/jIuQIe70jHN8vYHP2it0CbuNZ8vWB2skeXL5krkrEM4PKtbcCIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZthUQMF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZthUQMF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso24008765e9.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141083; x=1792745883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iCpWI4gds7IUpWviVdywbLiMJoOXNKnvhlY7AZVvYE=;
        b=UZthUQMF46qAZPWGHp7giao7sC/7MuSNeLnEzUoLHZ37B6ZQ0IxB40H6NzlCZCuB5N
         17JzEYHq0h62IjnQXuYBux+GD54+fS0binMLRllGXnnURr7cV9X1Zb95xNAwYVOJnY6c
         mzq7PwVKgQsxCmE0/RQ/WLof4gqPU5gwJXo8/S49pPTO2zagSBOynnT2SL8ddi4QEXp8
         w34FdHrG6VYd4dLL4fJEWgQi/hocDgryR2pXWC9wBZLNYOERBvUlOfIz9xvHWGkn003i
         QV4sMRB7plxB0JYlKZ+q/6FmsZwVp8ZySMXxlaP/XmDhVrtD0DdVa/kitRLKe9QATf7k
         JMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141083; x=1792745883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1iCpWI4gds7IUpWviVdywbLiMJoOXNKnvhlY7AZVvYE=;
        b=CS4ZsrN/8hphyvj9iw12Es4TecYLuOq3F9yo8jX62ZwdSfQc6LPqv9DBaTuAlfSB1n
         iRNeiBYCxOEmnfYqAze1G9ETovL5TFNlI8L6B/oxszVjIAOsrnAkcBOXm6/dDbRUxATZ
         O93qaXWkc8ZFFvPC1jkjsmXUfoxBb4mMUwzboQOVdB3w5T/mQHrz+7lGOrb9LOZCxvR/
         aUHtY+7/SQBF0UxV7YfBob9CyHWNy5dUtAkJVV/boo7VQPq7yxykjPgp6IUOh+2naQrq
         zZhpcwe4PzI3A+UnlROCm5Nb6oV1HlsFpwFoG1AxBMOrdqmk7JPGBids36FU6Yy845wW
         fkdg==
X-Gm-Message-State: AFq9FYIm9PHpj2mJUZFjqHoPw3hZfEMxqL4W42aqWhCyEQGTcxBvKWSe
	DAV3z/cPo96lfP3QMmBzdHp8rZrHH+yeKdhnaaSj3l80tiwVEa03TLKY
X-Gm-Gg: AYBFou2S4Iz/2WnSiZgqAlt/THwMDBa7eHZ3P/imSXpa1biIAAoS1Sr5E+thIMtMDuN
	oP+CWDaH9NeVmXYLIefhaZBjeEb3rMwiGySfOUhO07iY2awx0PlXe5040B21zfb8/5VXSiVPnqo
	MpzOr0nHUMKeT95EnQ790sCYnkDVNKWWiDzUJEdyiOUbFKNoZDH6vZaV/surUP7415V5Q05vhQc
	AQt7undvAJYrqRDaVLgy/lFRFPK7S80gWBD919MRpv0Jyn1RgiMLzRPAGw7VXdsSGXBf8D2/4Gr
	d3lweNyP4WRtQ++/uAxd2r8wA8g7xL0fUtyngjINcMv6NF666ELjXO9FEGNyzjaLbLQS0yDeV0i
	llhRFms00CFEE6LIvgSCS1er6oLI1bNS9oqO54h9SHxbVwAXc+xlNglwhRMtEhwZ+hxzDP/Glgz
	b2tFcYeiHhxnGl8p4szoLp3PHVv0O1YM1PVXjA3tUk9cxplQtiGUw7cr2EhKfl9JwWf2euznA76
	RhJ4tTJGdBFdx+BdLj+zx/ki3d5vKpB0UMcyczxF7KpgvLIFQ5gi4SbX6V3593bhbOLBKcK+8SR
	yNMzltHpSdxLgmpNeqtm44rGl3E3
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr454263055e9.35.1792141082627;
        Fri, 16 Oct 2026 01:58:02 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm27971455e9.1.2026.10.16.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:57:58 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC
 input
Message-ID: <atHnFpMVpoumQ4UX@Lord-Beerus.station>
References: <cover.1792139809.git.stefano.r@variscite.com>
 <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
 <sashiko-outbox-174034@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-174034@kernel.org>

On Fri, Oct 16, 2026 at 08:49:52AM +0000, sashiko-bot@kernel.org wrote:
> 
> [Severity: Medium]
> Does this patch also need to update the simple-audio-card,routing array in
> the sound-wm8904 node?
> 
> Currently, the routing in arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> still maps IN1L to "Microphone Jack":
> 
> 	sound-wm8904 {
> 		...
> 		simple-audio-card,routing =
> 			...
> 			"IN1L", "Microphone Jack",
> 			"IN1R", "Microphone Jack";
> 		...
> 	}
> 
> Exposing an onboard digital microphone (DMIC) as a "Microphone Jack" causes
> semantic confusion in ALSA userspace. Audio routing daemons like PulseAudio
> and PipeWire use widget names to distinguish between built-in microphones and
> external pluggable headsets.
> 
> Leaving the newly configured digital IN1L input tied to an external analog
> jack breaks userspace jack detection logic and presents incorrect routing
> options.
> 

“Microphone Jack” is the existing DAPM widget name; it does not select
analog operation or enable jack detection.
This board does not configure microphone jack detection through
simple-audio-card, so I do not see how retaining this name would cause
the reported userspace jack detection failure.

This patch adds the missing IN1L DMIC configuration.
The same configuration, including the existing widget name and routing,
is also used on the Variscite DART-MX91, DART-MX93 and DART-MX95.

A more descriptive widget name could be considered separately.
I would prefer to keep this patch focused on the missing DMIC property.

Stefano

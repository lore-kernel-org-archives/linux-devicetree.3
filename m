Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453CC38757C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776705369; cv=none; b=dU2dfw6gubpK+dHsTYvVB0atk2VTTMwkiZBFc6FIfM1BB5i4z5RxncgT5fTMNf/vxnR74k6xdxnw3gSqzVZc+QQRdnwTJOBamyEghwZYzZaOS6DMKxv7acC0bHiSV/iolYlUfjsncIcPPqv7YNWEeuOccINElrFMmr9MLevUsAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776705369; c=relaxed/simple;
	bh=c6qb3j5YwLcUinHxPe9QmKobKWtaBwlQxCDbpueIc0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNhwj3NjtC11gckKzQ5SGCed3WRcepj+69WfHN1Ys13ouIQt6PIuEhmU2OzlBDAjVN3tJ/R1hgoTWxw3N7ZPFYDD3iE3HwYo80yfP1jU1hUn/RqGtPkMLpVbul+QXdC85QUatoOdfE1kAm//l7m0qNc2WiCipyP9hzHGzTWqLak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+qhPDYH; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+qhPDYH"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c565dd3a7so340426c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776705367; x=1777310167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=;
        b=e+qhPDYHW3wxgbM4f57nf8fhiIFW4l5Fd7yt3VzS7DeVci6xrjB8NhjXbMwpjTu/Tw
         8muF/oZLQBLqH098Wqg2ocTweWbMfLWpwqZ5TbBsKBWxtwvEN1HzBU10UNG+4Pm24PE/
         QoMsQ4iHqWsJYYnx75X0qRwbDkxBANqn+AyT29uws0cH1QU9AwlJLoKrRZSbZNMIRYih
         SL1DGv4FX0UuUslWfpqpDeSjvFTFLjiCoJiLpWIIFtb9JYxfynyqsBOjqK30LxnC27MB
         33DuF+QMjOicVYaWrr4IStw9NCUEcOuit2aYJf4hmRCSL50dXasLAhc85JvvfJjesgUG
         Zw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776705367; x=1777310167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=;
        b=hALB5JnsArIYrMPauEqb4ZnA65pjKTrcdiOKk8/O9rQ/c7Kn3D+pGpuEMSCJsFRuPc
         Kkjsq/Ny9Xq9dVZ0lOBQj11xz61EJRNboIWhwBkMBMiM9R/SaFopKvbp8t2PSpubh4Fb
         +sWGFrqcCT3b39bUreJgnUIq716K76RqaT/pcIanlmK7DnwPK9QUjygflPQ4iH4ZMQYg
         Mg4wo3JgGRACKhJGiGGDacDU+QC919Yfz+8lCyRWu8AoYHvao/lYCK96qvpTuwJFgEGN
         f+vL+xh0ugDsEKBLJmy4/2Ak+j/3Sa6JlnZUPMANw+f6DzYQ/Mc4vAGx4ckFhU4EwNIA
         eu8A==
X-Forwarded-Encrypted: i=1; AFNElJ9UabrAe/O97XYitu+/t7BpNIFpui9ZbmIeTFru4tJUlg9sk3USko/TJXzWlPFmKgI4ZXkODOprlZ8i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/BXYxrjdPx5LRH+wFztUCH1izTCAk/ggsdi3rLP5R2SGARbU
	pcL7UjevBd1/Ti9zz3fMB/JsG0FvaGN2+AXyRrVeIohXqitJ0L1XY5rQ
X-Gm-Gg: AeBDievkKYW+4I3/H9gxQ51l5y/eKOhpzTLgOGMKwvxxr/duOncbgwAq0dvj+brVNzG
	bqyIwHIrTRb3V/MvzBN0FYJEyTgpXaVrdBPIcJg/1cG8p6qNKA/MsIHDWHvaCqXp7AkTpDXM0DN
	EiFJ5qzO1jjP8AezV6tI0jqtb6wzhFCAqn08yEqi2PhoPFGfoTvCR4xRp/rse05S4e+ynM3so5P
	CrwVKaQ4de9WorxWytnbvAQ/zujsF/TIB+8A4qb7QDhWjADhgSHHAtH60HpUzx8opocftryXzbR
	4ZJ/2y88Mrxxv4sx7Z8kWNDVkSDhNJ6aF5m9XgPartlIL5gvm3iFU/8cxinwU9W7ceiqUS+nFJy
	7b6ydcuF07IiF60w9kWvj0mpTEecLyqctUV3xvj6YH15po2G6wZWNJam5ufXixZHJlwseJhYDDM
	FI+ZxiAXjdsSvHOlq6UghbeeZ/FmYB2hVZf3aSzR7LTHIrui8ABhYwlzsUuYTve7JVtcEkYBfTV
	5E=
X-Received: by 2002:a05:7022:6627:b0:128:d362:31e8 with SMTP id a92af1059eb24-12c73f95c9bmr7706236c88.20.1776705367122;
        Mon, 20 Apr 2026 10:16:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1a4e:4965:5dff:cdee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e7025cf413sm9717145eec.15.2026.04.20.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:16:06 -0700 (PDT)
Date: Mon, 20 Apr 2026 10:16:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, alexander.sverdlin@gmail.com, 
	marek.vasut@gmail.com, akurz@blala.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aeZe7XoDbOMqMG_c@google.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
 <20260312180304.3865850-5-hugo@hugovil.com>
 <aeWtDA7snjJmiF9K@google.com>
 <20260420110159.29ccb815eb584bca18a407ac@hugovil.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420110159.29ccb815eb584bca18a407ac@hugovil.com>

On Mon, Apr 20, 2026 at 11:01:59AM -0400, Hugo Villeneuve wrote:
> I tested it on the real hardware and all is good.

Thank you for testing the changes.

> 
> So I imagine that it can still go into 7.1 since it is a new driver
> and not a modification of an existing one?

Yes, since this is a new driver I will include it in 7.1 pull request.

Thanks.

-- 
Dmitry

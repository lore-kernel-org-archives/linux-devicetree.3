Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5760C4756C5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828600; cv=none; b=BIyD6ca6VlRZaOv660BjoVWxH4Qk+Eajzqxeo4N+EY4Vg18KXGFcnP+3zMckSxRe8S1vAN2Jr52x11g4jp/8lxfKCttGmbUF+GW3CAGiMwI0fa9tGt9aSChBn1Nrhza+YUe4oCZ0TME5k1q2VCiC6Txl6jg7pu1/gRaJgvnIQ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828600; c=relaxed/simple;
	bh=onOMg4dyuXVGKUdKg0x4ObMl25KYAxMmlgWzU6oAaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1zudwcD0FF1Vc0lNyUfLIH2I9NdN7+wE1YvLmrnODTRXeKdMszyW00H/d1Odju9FkfhGcUvWxkkwRTOPMt8qmgcgvovcdvwSbn4he9nvcYErht7xUt7WYdBNgASG79ikzZ2SNmpHIl8bc/NKWj/ArSt7V2Ru3d5O4DiTqCChKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFugTMNb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFugTMNb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so649901a91.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828595; x=1785433395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mxD/hD3bol4E3CIoQfiq0xA0eyEDzWsDzxIIks2DNV0=;
        b=EFugTMNbtN+x3snlXPmzv8wXnfpT7N/Ru+wqKWCwNJMbobUmPu6IaNasOU6db1gN98
         TXQJ5pve4gKmuKXbo3YisRiJTnN6kkwWSmyAgtg+lFufb10f6L/sVDF2QmEL+lcSzHdX
         ZAqRTm0WJJokYGpZ6aP5OvVX7n4Nk/LgGolmKv1K/njZYbd0/3sJPaTgoIM/GNo5sP3y
         ii7vi7fEfmSL6LNJqvK1W26el1IwzSSVGyCA07XihOKhdHc4K7mRFM6QkfqzfsSwfgH9
         z0NUVvNJZluhwcA5qPgRtjeqCdPA3Fplp4HIjFZhoaU0QbLCMe1McE7T577uN2uvu64s
         DDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828595; x=1785433395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mxD/hD3bol4E3CIoQfiq0xA0eyEDzWsDzxIIks2DNV0=;
        b=e48qYdyJa1tjs1MIwAPSuc4HgoUMlkfzBvQbLFPyoRO63inxy/EnYOM3q2vnBPWJro
         L0ujDuYH44Dq6fpKNpl4dB+l1BlTK4Nsduh9xy99kWGYVBBSGtqxIDkQKEQHp1kwjwcN
         K1aYQyppTon+IagAzfo5q1X6atf4M7uh88UcPpcrL9jei0oNDbqN85Ka+CypqtvtkgCH
         AcX8a4yPUILyTQvY8R+XG6Ovstu7MrsCSyeykk0Yx9iOZwix6nXf4g+JtVd5bZNnZsSJ
         ZB4+Swcorqu4V7lLGwyvhFvNRNA2Lc9hYBSw6R7S2JbXjD+UbjjmQ6zU/WvITioBJ3Ht
         Vngg==
X-Forwarded-Encrypted: i=1; AHgh+RqhHs2FYgbcuFaD1PJ3W09CvR/QXseK0fbWElVToryH4IFjQ1AkqIL3XAAcuk7AdzhS+Ywo+Rjwf1VY@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBVw6IXtPRwPaIoEQGlQkKuUct0fMAtflwz7mDra1iY4ICaDt
	1dElKpsJ13M8GKNffPyyU21P/qpaaLtTW6O0gxZ8zSLQdT81un8qKtBq
X-Gm-Gg: AR+sD123TwueMmajEKxV6I+r0ENQ8YyEWiTXZ8wG/im2tsfNVzACl3I8auIdSe12A6p
	5R9yr8xz6bYQemw9J9rw8L9Fm7X4q9n6jfQgoZqL1dvcMUK/K1fme0eIHMywG8jpRTXwfQ59ewf
	5lnr+gW6hBYLshQ854VljCS64hJCvZ5a3cubesFyOzjzd3Ld/9D3k6PnVxD2riPwgBQz4Pazq1W
	oOAyVG1UwtTPXCiGOni+7BARyZZmY4MzULLpYqwcOCLxzXru3As1ZuOqRiOQBUxNtPi5a9gfXc4
	/A8E9ZTbKC5ZGF6PEoOipse5Is4NrVME1AKLAG1ufbt7cRMWR077CrZ3h5bSqFlksTQo9W8akdP
	+2Gpvadz+bKRUYYwvscLBwP7RRwLzI1qIkrsjhTITXS2r69rNLXhfEQQFidfXter75waCn0Jt1N
	Gd/K6eTufgJ7B5cIbISP8wyDmQtCOVvG58cSi6AvLqxA==
X-Received: by 2002:a17:90b:1350:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38ec64c1ab0mr4192747a91.19.1784828595262;
        Thu, 23 Jul 2026 10:43:15 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f5d:dfe5:9bb9:71ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm29470021c88.2.2026.07.23.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:43:14 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:43:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: azkali.limited@gmail.com
Cc: Henrik Rydberg <rydberg@bitmath.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] Input: edt-ft5x06 - ignore contacts with an
 out-of-range slot id
Message-ID: <amJSpqqkqljPzHWt@google.com>
References: <20260723-b4-ft5426-v2-1-cd2bed168051@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-b4-ft5426-v2-1-cd2bed168051@gmail.com>

On Thu, Jul 23, 2026 at 08:24:09PM +0700, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> The per-contact slot id is taken from the top nibble of the third
> report byte, so it can be any value from 0 to 15. The driver only
> allocates max_support_points MT slots (2 to 10 depending on the
> variant), so a report that carries an id at or above that count - be it
> a genuinely higher-numbered contact or a corrupted byte - is outside the
> range the input core was told about.
> 
> input_mt_slot() silently ignores an ABS_MT_SLOT beyond num_slots and
> leaves the current slot unchanged, so the following
> input_mt_report_slot_state()/touchscreen_report_pos() pair is applied to
> whichever slot happened to be selected last, reporting the contact at the
> wrong position. Skip such entries instead.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>

Applied, thank you.

-- 
Dmitry

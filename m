Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42123090E2
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781547221; cv=none; b=YG+7+nnfyzDOgarsikaPW9yGimyvXRXtIwEbYMFvshaukYAaEutDC6oCkjLax8BHJ9WoymL91ym6tfBg/IwxbnikdEke0GlBFgqq+ev0Bc4nR7XmFo86DXpv0n3/lQxW2hxp3wYB1/8emkZC8Omy/2P8dF+w6YwzDijkJu32Jvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781547221; c=relaxed/simple;
	bh=NuelC9P0khES2L+1lmze8qFEYD46l4CI3QqaFaENFBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6+1H7mc/kGYfxwYG16diyu1W3TJw1B9kYXAnc4ChGmX8iETFfN1qhIZKzDHk3U7xghm29uILZvJ7cOpmpgByHs7uwiZQR5nLDbny822g4SK9oAHvNQOYqRMjnK6AF3T/oSjQ+uR8ZTPMX/uQ8/WjZp//Sss+En+DouQ0EX9vtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h93X0MJ+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h93X0MJ+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490afc47455so16381155e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781547218; x=1782152018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMIhznq4b/swPnkGP6rrvAKBGuzPasq5bzsDh1wVz04=;
        b=h93X0MJ+WVEnym26JOx5tp8X+RM+6tEr5MCUkPdDldj/U+Jcmmmrass2wFYtKyuF4j
         xeeo+yxiEPJCZQeBSi9j7kvyaZc4IdddmGeVSvzEfSSeRlkcqFT/MN4w13gJmBfsrzG1
         8axv3Ln61ng7DAr7endnrnw/CTs4a4TaFgjveD8xAbGsCq5+bFnr1oFG6/+JsX+K3h8B
         TT4Z/Y5fo7JOoLrgcX/RzIZjJQs+0gYv8dZFCIt1RIFaI0VEM7Dib4aJXZ31M1irKmsH
         me/BmCHlIfsAmxwweW53jP6PZbtb7WXau8FfR8bAd7nLR77x2KDJ29zx9kGDdkPMd7TD
         g7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781547218; x=1782152018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CMIhznq4b/swPnkGP6rrvAKBGuzPasq5bzsDh1wVz04=;
        b=G+IXs0MsmSxDfkX8kuv73hvBf6EP3y/IVOcMwovwntsghg7jjnPHWztnv1gR0XEYiN
         prXTDEcFp0t/drqcU5jQ3MD0ztumdeeD07EPdMJpd+QEPfbfqmAgFQG1ePZl/QRAnXPJ
         YtX1Ct0jYMet6huhIWd4bTdlgUoOuOeMWM97vQQeo05CGPDXG6H1whUsG9OoC3e1yrEw
         /npMjXr89ZD6gsujgXBCCdpjueuQ2ESqiETm6eOA++qmrUEu20BfFtnh225B3RYx5AST
         Vdq3BXmdGEjfIoxgTUkUoDoQtpAqJk1ArDsLKew+UfxVbo9ckg510LaWf+CNccavEvYu
         tOTA==
X-Forwarded-Encrypted: i=1; AFNElJ+qRRdKhviHZAP3mecWFtWGIlHlQ7h5CLTjjRbZ72AEgNLTEY08/YBOPZvP57vtrhVLHeQ++YU54V+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxZp+uoz0RDGbcn3FiC6+/dCHZOCbcvf2zUYkH5ipO1UH68TpWb
	enMjaj3E/+5bUNyBEQ/kguomj6ore5vxLFAXq4RBzAvC5KRk3sMwGyQq
X-Gm-Gg: Acq92OE2nrqz4e7SynHU3wWQdNsnGuwaTkNlm6QuwbBf6pYYmx/HAI02qlBSXHfCXrt
	9NB1k8SGSnWtQ40weYDGQp9LMpvWuJDwDsXZKErfxKHZMfN8KgIwL+k2ImfsHp8og9ECMKhJeQn
	gk/Aww/gcCcG4d0iWVSqUA1LHtKptpMF5yyzyNj4RDtueTNvZWjayrVdV++uEoLvjeeDS+uUFFI
	XvD8pFpjYuB2Y1deBZXk5X3axGlhkB5IE1o7BVVPx6wNOf7Pyz+G78uXesHN7w/IUphAHSgKHHH
	grX0q3MfSsC2wCBojIjzWk0NKsmws9+5UIQOEvPnIm70PzMjAsrQ8/OQlhLfDzkbQ8n8KLjNgIA
	YZ/WtBIYtGTqJEZkcspjhcVhYFWrLH/A5kmWf5XSgGuEPy7ELjxALRJ05pDCBf4TluTexE8X8Xl
	mcKLLCteW23KRMNllLbxwZDpzDkRfTlAhmJY+zUYGt
X-Received: by 2002:a05:600c:34c3:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-4922ffc0622mr4405035e9.34.1781547218243;
        Mon, 15 Jun 2026 11:13:38 -0700 (PDT)
Received: from anthony ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm8954343f8f.6.2026.06.15.11.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:13:37 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Amit Barzilai <amit.barzilai22@gmail.com>,
	airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 0/2] drm: Add driver for the Solomon SSD1351 OLED controller
Date: Mon, 15 Jun 2026 21:12:49 +0300
Message-ID: <20260615181253.97551-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <877bo576o1.fsf@ocarina.mail-host-address-is-not-set>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Javier,

Thanks you for the detailed review and for the Reviewed-by on the binding.

I agree with folding the SSD1351 into ssd130x rather than keeping it
standalone. My plan for the v2 driver series follows your two steps:

  1. Add RGB565 support to the existing SSD133X family (so the SSD1331 gains
     65k color), gating the format on a per-variant flag in device_info so the
     existing RGB332 path is untouched.
  2. Add a new SSD135X family for the SSD1351 on top of that, reusing the
     ssd133x data path (the update_rect window logic is already
     format-agnostic) and adding only the SSD1351-specific bits - the 0x5c
     write-RAM command and its init sequence.

I'm deferring step 3 (native 256k color) for now since, as you suspected, 
there's no matching DRM fourcc, and I'm dropping the 0/180 rotation support
to keep the series focused; it can come back later.

Two things I'd like to confirm before I send the series:

  - I have an SSD1331 panel, but it is currently unsoldered and I don't have
    the means to solder it myself. I'm trying to arrange testing through
    someone else - I can't promise it will work out. If it doesn't, the
    SSD1331 RGB565 change would be compile-tested only (I do have SSD1351
    hardware to test the new family). Is compile-tested-only acceptable for
    the SSD1331 part, or would you prefer I hold that piece until it can be
    verified on hardware?
  - Could you confirm the RGB565 byte order the SSD1331 expects? The
    standalone SSD1351 code used big-endian (drm_fb_xrgb8888_to_rgb565be);
    I want the shared conversion helper to match the SSD1331 datasheet.

Separately, I've sent the DT binding as a standalone v2. Since I dropped the
width/height and rotation properties per Krzysztof's review, I did not carry
your Reviewed-by forward - please re-review at your convenience.

Thanks,
Amit

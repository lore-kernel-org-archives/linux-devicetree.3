Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E6F1684B0
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339361; cv=none; b=eCQM+Xpc44vaIvSPlD8mYiu45N7/jEUKCH8TClKDAEIIsPmTbn1i60Hd3q5wwmAuTemgZ/EjM57IhdQcIWcEEf6P0ACzPKMp50dwIhdSm4nlGmr2llWxQr7oyMmjaNVunmY6KRBK5yKd6Yz3MzJyieDQylHzrVMJd/1Lge/91i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339361; c=relaxed/simple;
	bh=Pz21v89mgKvxDDXEm4UmGj7tuc5PFErBer+IwkrrpBU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=an/oHexd9kAuBQPuAwpTamE42fo1w860tzmWLjEC2tbaN0Llhn80SrQ/lVxMxEQRV8GB6dR8Ad6pcRHUxQm1f7pMIsmSRUvW4X7RH9m/gHoYfqavvk5J9Bl3XZhoQIcMepEOT8ULKW64V0Zb7xILw6cF5r4fCDwINdcZMRHe7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffRjdtZY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DYRA645w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffRjdtZY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DYRA645w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774339353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZkji+aeo/J3L7vBsxBs/MQaHOamVQrNiki5qdjf+wY=;
	b=ffRjdtZYaRYb+UOrT6usN5PccmXFvVFJCMfphjOjpjj6C5XU1Oy7bIxOi6UyULBBhNOKeT
	N+tBsmG6Uw65nbBbnhBWMRekrbiyd0HXjFq1CVWSeV7OVGWv6njcU81KVyNcyi1CbdV28U
	8IUfOQvmpC3SgFPQY8p9y6LSlMi7LjU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-Q31UYjaZPZWxx7OVFd-SlQ-1; Tue, 24 Mar 2026 04:02:32 -0400
X-MC-Unique: Q31UYjaZPZWxx7OVFd-SlQ-1
X-Mimecast-MFC-AGG-ID: Q31UYjaZPZWxx7OVFd-SlQ_1774339351
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48704f66776so11027615e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774339350; x=1774944150; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZkji+aeo/J3L7vBsxBs/MQaHOamVQrNiki5qdjf+wY=;
        b=DYRA645woD4AIamBSFhHd5oi4gXV5r0g/O/xQDoUFMeg57f6MDH6ID4LKmqbjngRCb
         exxioUUWHrf621vgV+xfjH/T4eMCAv2Y8rh+vyvRlWKQgw4KPGENzL7tzcPYd5BL1SHL
         tpN8a2iiZzxeMgj7O3GkjifOI9HxxjIqgpE6MXBVUrfhpQ+lbtgT7mdf9UEv3uuV9wPT
         UGw0qLH6dWbiy4gpWK96Q8MpK5+4jqUFBkz6BDasJZ8nk+rmOg2H+L1ylLOTs2jm2LbM
         oF5LaBnGOMSjkMJFv1/KvxyesDQIEPLjn4eYlbvueBnbNFnJ3fDelQ1C41rufb0fp8R1
         7u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339350; x=1774944150;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZkji+aeo/J3L7vBsxBs/MQaHOamVQrNiki5qdjf+wY=;
        b=tStaQfhF0vIWe43hkmbUSQYgHxcX1ulL28UyrU394mTK9DKyQuOoBlScoNetwQWtQY
         L8Ba6oQSb2qWdPM6EIS7LdO6pSz3dwAXqEALON6BIxRM3jHsTH5q8P859J0DQJNrbnZY
         IxYW1DEpSCdn0PcK2NkCxeVPyjOipnV+JsAsC42i2F18LAblFiu8mC2wa8p61L84NVQQ
         Xc1x0rKS4jsbNpZV/MMXuOFDy76ykgPntFnAbiuAo77LoFdm5cB3B6zJu+4YDqhen+2a
         92WKmeAAlJ2cLder1uakiRnAweqeS3Y8hpKvwg7gfziEePoNoV+MOuyFdQSlehnwiVTO
         F8uw==
X-Forwarded-Encrypted: i=1; AJvYcCW7YNqxCTO77KSyH4674DINSGoBv7RQ90CijD7CvJYGP5bTFNb9UpHVlzgY4Iubzs2QqndWxFaDgWUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKAdCHrVIGTKbzphFJ+7NrBkNyM70XXJtw7bSrA5wGcfYfSty
	i3tsY7QNodYaQKT1OF2LB1rXw/Fxjofo4M9cEHozBchYY/v+B5H5YDNobc5yk42m6mkhOARFMXg
	tB8o/Evt9Km++fvBDoq7m4Fc1PkUMhtYSDKyLgfugPac7WWkCuQHlBxii9Hk803cDB+oJ0zs=
X-Gm-Gg: ATEYQzzZH4Ps2mfDBu3O+Z4r47sAJBJSTo6Byx0g9h/ELbCIoQUnIYvvHmsN5ioDb3n
	SLkBycCy8JP52YRc1pqsvRd5VlCrv+ZlAlzz+1pL8/wJMeGD6GrBqTHt9w5rGAhnPP6Dr9A1nrT
	8bnrpI3s9vcMg2iiNwl9jZbipz/FTWHtMbWEGIOA2wJQvL2dAqRLcySUDYn3MliF6shsuoUvQS9
	VlRE2vVFYVOPbPoRZ8AjrKjt40Ml6+CQk2jVR239YVRjeWqTh5L1+3tjN1jO323MXG1ruNYuFJM
	RcemLkKSyCFkoPa04e7yRmKuu4x0vZC90ZWnag6fBAFdZOogsd2xsrBUjAx010F+f9Wt9JIFieH
	/1tUcWCCHwR6e+OKnkz4sJdSaIKXl41hEyXk4D4y0AM96+H1BJy9lk7x0+dOskRQ+nOjWuQn1oR
	bOB76i
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr202978805e9.12.1774339350323;
        Tue, 24 Mar 2026 01:02:30 -0700 (PDT)
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr202978115e9.12.1774339349760;
        Tue, 24 Mar 2026 01:02:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm36915974f8f.17.2026.03.24.01.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:02:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-7-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-7-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 09:02:28 +0100
Message-ID: <87341p8xkb.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> Enable the two PCIe controller along with and their associated PHY. They
> are routed to the M.2 M-key connector and to the the PCIe x8 slot.
>
> Add an always-on regulator sourcing 3.3V from the DC-IN input, to power
> the PCIe ports.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


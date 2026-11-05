Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850563;
	b=ghcBYE5mC7yuVKhTI7DEUvKrJh3T+TYP5vy/X0SwiXj/ZMYJ3AcNjNRKKeaTYHFdywJp
	 ULRniDkHU5AGo7sLyCqOyimnO1KHjmqG/87dcsxqcgswo1DYas6H5h/F+xfLIb8KyfeTY
	 GCvbgy3fc0Gb+IG58Dr6Rn5Q2xnPhIIzTwNkdqOREavjEXSU88nEN4ZtwGtVPpNwFEbeX
	 hwjRB9nJP8DOftBi2tnSFDCutaVjJeBpJ+PZ6C5Te1nAMOksvHMCebH8iGQdnN537JY1n
	 KbWXABwFaO+d2budOwRfojy+75Uj5cCRTdSe+KI2QQCc+ONRbxRaWlttrTeZvSGnywg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
	b=av21GkNV675qu/ZVjLpkYd32Kgyb9L8z3GPYloLNNXybKp1X05XX53fePwKy87H8kSjl
	 n5R6kOJK9mUlSXeyEL+7xYmHb+u6LzVzSs0LsecGJBR80SJ2P9VB8URqfdxlSEib9sS7F
	 Ob7QchLASVGqgTEQFPfFjdHbwr9xaO/87gEZ1MWLlaF8V3DqB9fa5/sdjEQUPOYQq8arO
	 HsdXso2wE+KvcVAWF6wR3VKsZ1T2GKFKMaCCiZqJPMLQaixx8Wyw7cW7wrHCoSf9wQY6V
	 OkZN0RwdS19Dl+Ni8rjc0QDj9H9rl0tPA5+H/kAfIut2RD+bVRZgartJB/JLiF41ewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=lih9eOOT;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99441606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 03:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99441606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=lih9eOOT
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso670173a12.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793850557; x=1794455357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=lih9eOOTmw1z0fUo7FCWm1oacDIHX4dduaVV5EV5pZmV11z7jsruGIlv+QsQ3Z1bSt
         W4fMqBpMHXM/J0ZmJ6Eoc+dU4en1t5mS+5XH85blXagVK5pjuaiooTlHkpUnqaSa3Xg5
         l3PA6O2P9O3uO+OWm33skUnh801r/qgWQb7Agoe3h6tnG8HDTYJyOkf3fcdMzQ/h+Qrz
         +NkHmyTrIsX7VhLKUX10FvErp+45ZsN08oI5zhpmzVeB5YiaVxoXzhtuCfxCsKT7zWsc
         2cmPGIt0mbUJC58koO3bPZ/5E7w8XtXfNX4R4o0IrulwVeFlxfjKBrNiU5tLCGiJe1Hn
         JVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850557; x=1794455357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=RUoAMD7IdmJWT1p2JhHUVWDhQaaquLRjHOTE1411ty3rOYoVqh0pQE9vkIcaXQHuU+
         wRj0w9mzeXKw9fm5Xw1OdkcMdDyYxTB/U3a1r9d4/c1DKtj7AMDJYb1C1GcagOMsQpbA
         +20w1b16wx2pIEqfFewH1fRVWmqunJAFttJHn4nO1cQGaTbX0YbUC1eQ3Sgv2kmsAaNC
         3uEg0yThDGFvyY7JIkkgmXB5wLkZrJtc/zAC9KKmZsTYkUS8rDHUh2FUhvM8lHLuMiRf
         Nrc3G2tlaXzwuknNW/k/xcyAnWPujpwNzKN/KoD6b6XTqjSQmXNLO2p4do6rCibkV41T
         7j1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcgkU9Y/mm9UVX2v/k1Bf/Oc042suQ9rJmTH3RblA5y/s9L0iBm5mWnjGvwuRMneRUjoBe/X54tpkx@vger.kernel.org
X-Gm-Message-State: APuU4Z88JadYwdoYVB3eD2PifGMHqLRHjs5/+weRRSMSyKDxIvUUsHYx
	J4Th3zsOIj4r8VWHLHcvusfg6MG0fyrKzMZTWOrZf0vw8MNPVAxS4ycqV+f98T1lgRk=
X-Gm-Gg: AYBFou24T9BjGBNHfrFazbd4q0F6YmfMpBnaV10psN0BoiMLFR/UdXN6+cBNDoElLxT
	bFrPmvPeG+fZ52g8/zD+Phn8xHKlWFQBt1owVaAqKVzx1LvGl7W3u7FwkaER//IteqD0dn25lq4
	vw4aStOB9BWkKvxar/iEuUaIC0mNWPJjfAGgaR+ETX3f9xBuPToLcHWthiujb7X1Rs/4yl1WT1N
	JLQ7VB/jfboihHVRB7V9VhRmW10BqY38EMwLVGohULnGVceRegVKPvIH1xVkE10XVP9ykYeY2kP
	wfmr0KiqC4dypEX1BUJ/UDJHNxNQiQX85gDfYYfKOW91lkzq/hkB9kkp3EwEC9Xxuh2w+EEHKlu
	EDQZjRCXCw6ddsxLgkyaYSgq0RMiBA4lbct+YcMX9tPDJFaHt86C+R+XN2Ti2PcBmfN7BizlaoO
	DNIvh/JQr3JDc4jo7iN0lb75mWEtQ0Tf+/QGlJ8a4wIhxrqb3SeP4I3+X20cIF35Hm/ZgeYz4br
	1OYpnN0MtKAxSdn5Baknhuxv+DtsvHDrI5UivH7gD3aCYVEQGGpxgPDMt/FmPBmHEoyHXEHZKMZ
	bTecroOfJVEHKUyqbMnwJkLgm7VADdk34qii6D4wpw==
X-Received: by 2002:a17:90b:540b:b0:3ad:eb15:aed9 with SMTP id 98e67ed59e1d1-3ae8957cffdmr14128129a91.9.1793850556806;
        Wed, 04 Nov 2026 19:49:16 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094ce9f65sm3564391a91.1.2026.11.04.19.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:49:16 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: romain.tisserand@gmail.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Wed,  4 Nov 2026 19:49:13 -0800
Message-ID: <20261105034913.25463-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-3-romain.tisserand@gmail.com>
References: <20261103110524.2812831-3-romain.tisserand@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>

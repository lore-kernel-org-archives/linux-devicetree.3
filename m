Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851530;
	b=lau0T57VMgRY8Ib/5Cl7kU2dN1EGEeg1uwui4LEGjbQMgTCpVGQTLFnRJSYQte5xi4ws
	 H/flRM7mQR3VAjnzG6A1AS/a/f58Ja5QBhuIrIo2tehZYlsDoGErqgFqxLdJcnTvhoion
	 /K/ObfepSCiiLS7uWYG5u8Hal0jZCZe+m9ixHSt9aDNl9iTLWJK0S3dW8dq8QPYxrDhHx
	 UGfNAcltWA8cMkympGt7MsdUX9oqGKlU8P3LnD72Lrdn0dpLK3/7nTGY7HE08oM3PxTau
	 ia+e3Kb0iKl3RaK8duHWeveE6GCJ8qsvGlodDDIfUISW651JjqLjEzYbUcJEIo5cBsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
	b=W7re0zekbK3BvaRYrNeDX1QugLqZjmk+jmBvoJVBItkc6yEellCyXfj6UX6J0ciM8/Vd
	 um7l2fHDmTpVoswnKkM6pdeBhkgjQMpLlC/OFrjtz66BgSkNAiBuEl9Mc+rftyiGIeDK3
	 wSJBBTHTAEiCvI/itoBIK5iwgKeIMEZvGT3Z5cca5JVaCCKZU9GYY6sMNSFc48osU0a+Q
	 JrJdATSs0aKPDwsOaYJolTFL1MNO+PV8Nkli3MGyFkN0m0QIUveSY91n5B9p6CMxyhtn9
	 q/sr3HOmN3Z08UPHowoTicLq0epQ7LYVtH34KfLUZJTIe02ZFj4/+lULf2OuELQFPWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=VepMpLxv;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A5606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 04:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4A5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=VepMpLxv
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso986818a12.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 20:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793851529; x=1794456329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
        b=VepMpLxvKUhAHEzmMxos/BPDl/sT7G+0yhx4Zk7yWSt5UDWMfcPoIqi9A8cLFBmmyf
         EgS8G51JP6+LZZESQUChnBfhaOE6Z9pmH+L+NiFBOJFr1HTAHg9aFWiAMP8KetLKV2SE
         DkCiMQAPKbqeGWSHRWdUGp6u7QcolbWnJBn6yDYNCIm2eOkZdz6QHjWTp58C+yDxMMPf
         bMSr3hoixMSO3XLVoTYFocBLYCPA2xLecXMbhgS1EOdK3RXptrl5qWat5U6SWswGx4k/
         vp0Q75iVBE/7NAr+PKAu4Q7sSULsB7PbXcsH2+5hxwnqF2z7u1czO82bOmT9YqXbvLDX
         N7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851529; x=1794456329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
        b=JmAVVLX5sv3oBgPbO86eJq3NSzzBHdyFfe8idookRUm2+KGHiysO8ecwR9FRRrX6t7
         8F8zZWWgRLjP1DD4leS3I+AD4oBL+V6P3/qcTqM1YJlSz5INbajsgjGNpP30SEy9HkHm
         IiJIwFqRWzT2tQDrgdENXKtC2qjATcRHKcPnX3sC54XiTfZOnPVwhX0YAwpULRdA7qb5
         ivawmpZLqTiZBRSgd6jtBoCMw6dyeNxcpaxvJ61W+d23WXTvSeSelYT1DNssBrZwZ12v
         vyZL/I8Zdb5QPhtub/IfrQDh5POI6UWUNrzBDq/3ODB/hSF8owsisxegiy21zHIidnm1
         I4qg==
X-Forwarded-Encrypted: i=1; AKwUvBwPv+gWU/hHHXnJp1vX73GvALbgDUtdlC0PPPSCKou4VLhqR3Uf7mawwA5Noj74yNasGdVLOuOSvTw+@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0F0hmvEkTtaSK7Jf0r22F3jDVs16FIUpz3uuN6kqDAQbEK74
	swWXq9xv46nccxGfh1h1I/DcwPNLczuPsYhQGa0PDEqs2ypO4ENXeSAG3+nboCYekWg=
X-Gm-Gg: AYBFou1XlImhVy5xRHS+NdKkT4teolAnD8o4uT2na9jtKnEvfUDTKeVHggEaC3WqO1L
	AQvyRlq1zQ7FXLpbyuRjFm3X2vpHmUENgwLoD8Ga1+9sFM1F3Ur9CHDb1YJpWlmId/L1w7agM0a
	aQk8RJ4EYWJu6D5kBkB7S+kfNBXZcQzPf9qxosBQ+AOl/LtWtFtL9Iox0HT3GnXzE1TYWN/2Bnf
	tchwtCFM5haJZAZ5TXAg1j0Ka5VQupseCBaG0kIEjqLxmS24qjY+spv/1BV/uPjw7y52jCZ4YE8
	2cNRPfYSk4S+1rIqt8+ljZDUdSXJrwlMl4aocfkqI5KjwnG+p/Wu0ofHNmhjT7KNsFdEsSzJfYv
	5F/UsiNkNM62yaq4A488/wBDakS4ubRQn9o8Ej5kANQCuBTr4FHR+RA4ue5BlSehuYv+wGUZZ81
	AULrELtclzO1FacHcBG/Us7Zza70EY9aDq1MCQ22Qqxxao7+kyBWQDAUW3w33k54uz4uSbpLXJT
	AZsuXUqgTQGuaBjuMTZnf5K4ZN0rxMu+AXbqAfKnh21qZzbp1tIK4j7ImusZu4ApN9lB4kHlCuL
	6YbZkxSul5a72j8zkRdx
X-Received: by 2002:a17:90b:3142:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ae897f3919mr15959327a91.28.1793851529190;
        Wed, 04 Nov 2026 20:05:29 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm952109a91.7.2026.11.04.20.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:05:28 -0800 (PST)
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
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Wed,  4 Nov 2026 20:05:26 -0800
Message-ID: <20261105040526.26323-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-5-romain.tisserand@gmail.com>
References: <20261103110524.2812831-5-romain.tisserand@gmail.com>
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

> As on stock,
> the panel is set to the 18 bpp interface pixel format while the DSI link
> carries RGB888, so the panel shows 6 bits per color.

Minor suggestion: please drop the implication that COLMOD 0x66 causes DSI to 
display at 6bpc; the datasheet doesn't establish that causality. 
I think COLMOD only applies to DPI and DBI, not DSI. The initialization 
sequence can remain unchanged. Non-blocking.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>

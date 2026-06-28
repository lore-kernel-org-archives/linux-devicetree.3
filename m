Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328F1632DD
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664231; cv=none; b=cYfbfjtkDqsmHYe5bJsOakPDcYsfmern+++WDknJCKoae1bhtrt77IDx28osDqW/8HgBNv1AQKx2wWEtPgez5mTKH22GsPDtJV6IRenKyGhAS3UGev7vtn4ExQqnSfhMdrwsD8kqcUyU9cS//B7EINIXaXYDsZjgwxH3M3i5/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664231; c=relaxed/simple;
	bh=AwLmTjHbrcU+SOVQa01R8c+bODe7xXJZIanI/IfDJtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzJN1/rryqOVgAuygEvUhEPjM9bpS3kAXcGVZ4biuZL5TMD/GIiAD9UgG2U95+tN1d69PWld7/OxTgOJaJcAmMKi5uT9nkjY10RW4JiJGJ2Nq/q74llrj5qEdfkTn+vVtr5cUK/dROPDm4Ws5hv2mkabOv/QibyTylhsMmpKoDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAslV0OY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAslV0OY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4926ee9e8d9so10156825e9.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782664229; x=1783269029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMnBtmnHmhK3jg0PxdbXqkHYJjM0gMd6xqD4YPFeDWU=;
        b=qAslV0OY1RR3QE+/3XPt75MHqz4pqPi8eBz4uS1tY1L/9Azg8W3mQpmKYOskpIYkgm
         2JYcfhArOkkD5+wB3fQ5wMGajEVb6lUjMkpD1UN1x4wh7dd88SCj0NkUB8e7Zf8AXp2M
         Jqv9gQtG9nDLNzKFOpTDS/BS1Y0THgyk45zNdkHWe75AVt3dlt43m1D7qjFfB3wpuji1
         YPXwuxeKHsEf5e3byYQiNS9psCJOwWLF7rrqVL+GGig1D0ElNSeA/yaDApTxCy222Zxg
         I+Ls3E/3QyFJsD8fIPAFBdiNgPqttJThO/Z/V9Lb4Rz63xDjR0qgZNQLeOKKKsVEG3/1
         +ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664229; x=1783269029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMnBtmnHmhK3jg0PxdbXqkHYJjM0gMd6xqD4YPFeDWU=;
        b=iDarGW7z66wqhBISePVWmY3BF+1EryHBsXzt/AGq916O1fjXnVIG3I27jRp2D2Y9vs
         XKPFPmcEBF2Va2Q1VAA+4xfPbuB4FdapQg7kn/IeHRrjjxRZE/sWRiLlxqbWfYemV1wo
         DJHYfDnzA6fJ1eGspm5lsjFLWM+yv0GUsh57AgwvRtxfQ0jwS33m7oQa5fyIluLhux3/
         HkQMkWjUNLmhoVdYTocYeiEFbQT3sUbJ0sqEfi9/aUGzcaN62h9sMqjsbXJH8n1phB/e
         dVgBw97i12bMadRlNHQ49IWU/W75lcoMaRAvhqmeCacrhogzYz9cCpMxdrEDjzyxYavS
         7Mmw==
X-Forwarded-Encrypted: i=1; AFNElJ9lGSh4IaZAADC4WDjeDVSum8KAobyu12QnEM0eGQHOsE6/uD8ZmelYPgAEoxvKuzKvlgOrb5LqVYoG@vger.kernel.org
X-Gm-Message-State: AOJu0YySBXxiGmR7xgpCHn69JYZOgSsmKqbsW4oOnFmwUSPbhACaO7/B
	hiEHgg3d7K9AXJDdaqOFU8nTOwVHYaNJeMZ1MgEV9CWYPBH9LYwXN3Hf
X-Gm-Gg: AfdE7cmrBrLdZi8OL1eLNApbMOW2Dpwd89pfR3BmzjEAx5Ru+NR6xI2FGVTQlKs/ms4
	Vv+UHdfiWH7pV5BxhV+8LmkPZmViEE1n4liBe7rbGiwjoZsxuerG+IAwWFD1q/64aLL5Pa1gzUL
	iITlKwQ2me4iUtzQ0YZDRPKa45lAYVbs1a2nHi4Od4uN/JprtNdHmwP4b25KpU15GpD7S74vVJj
	RFsOj2Y0TLz4ACqo120ulPaVcqquW2shd2zwTVSONwZmsqDwXK3V3DikVXTz/gCeUenEufFxbyS
	j/Co8OenHNVIzAxPpYCIJCdGz3WX/SI5tpc0u70G/bxTVkWD3NZ5SXVU6zZGYvsRsDt9I7g5/da
	qqzL+ziZVsHk7fEqEKpV+K+J/itQ/HHFl8BVahiWpjvszfjHGzHKYmB9mIJrAcoVTZFx6JEQixf
	0+xOsnMlyMkCsctcZeXs5FxIV3h5Y=
X-Received: by 2002:a05:600c:e54a:20b0:492:3fb5:3a17 with SMTP id 5b1f17b1804b1-492663f5bc7mr127559565e9.2.1782664228533;
        Sun, 28 Jun 2026 09:30:28 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fde98csm261474625e9.6.2026.06.28.09.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:30:26 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: andriy.shevchenko@intel.com
Cc: airlied@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
Date: Sun, 28 Jun 2026 19:30:02 +0300
Message-ID: <20260628163002.56829-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajpLyronl7a-yxh-@ashevche-desk.local>
References: <ajpLyronl7a-yxh-@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

On Tue, 23 Jun 2026 12:03:06 +0300, Andy Shevchenko wrote:
>> + * Each Segment holds one pixel and each Common output has a row
>> + * of pixels. A pixel is 8 bits (one byte) in the 256 color
>> + * (RGB332) format or 16 bits (two bytes) in the 65k color
>> + * (RGB565) format. When using the (default) horizontal address
>> + * increment mode, the pixel data is sent Segment by Segment
>> + * (e.g: SEG0 first).
>>   *
>>   * When using the 256 color depth format, each pixel contains 3
>>   * sub-pixels for color A, B and C. These have 3 bit, 3 bit and
>>   * 2 bits respectively.
>
> Something wrong with the plural. There is a difference between "3-bit" and
> "3 bits", but "3 bit" is odd.

You're right. This is pre-existing context, but since I'm reworking the block
I'll fix it. In v3 it will read:

	 * These have 3, 3 and 2 bits respectively.

>> + *
>> + * When using the 65k color depth format, each pixel contains 3
>> + * sub-pixels for color A, B and C. These have 5 bit, 6 bit and
>> + * 5 bits respectively.
>
> Same mistake is repeated here.

Fixing it the same way in v3:

	 * These have 5, 6 and 5 bits respectively.

>> +/*
>> + * Per-variant output format selector for the SSD133X data path. The
>> + * hardware can drive the panel in RGB332 (1 byte/pixel) or RGB565
>> + * (2 bytes/pixel); this is a policy choice per variant, not a
>
> In other comments it was spelled fully, be consistent "1 byte per pixel",
> "2 bytes per pixel".

Good catch. Rather than spell it out, I'll switch to "bpp" (bits per pixel),
which is more concise and matches the wording already used in the commit
message. For consistency I'll update both this comment and the
ssd133x_format_info() one in ssd130x.c. In v3:

	 * hardware can drive the panel in RGB332 (8bpp) or RGB565 (16bpp);
	 * this is a policy choice per variant, not a



--
Thanks,
Amit

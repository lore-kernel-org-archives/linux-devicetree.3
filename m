Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C2428464
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892526; cv=none; b=UmeFPTX9TqJAYgz7d+kKvkdbaMwWr9z/hOAmJ9sOl+kwFKk3KQAXOV5nFkvCF3GJvOEmKBfmln7sC3byp/y42em0ZGgMx9snJTK5uGfpfmaF3yaeMDC4V5pblUcHe0tR+XxZvdC6OhtbyZxaZHyYyzyksnN4IUrmZL/ECOliLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892526; c=relaxed/simple;
	bh=TWxFzk7O5xEuF0mHiNBBjmZM46S7a97bXD7ugdZfY7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFq7rqye92RNs0ROfp6A46H7Y8NFZZ/Vo8hetbSe3DtKzd4K8jNWCwyLk7jBQIqft18sqdeAXx/xMsSH5dzQ5pCeBnKRCnL0SossBv6P7MF3fQ/QQPl8Ig508RZ56Ss987mkJSw0Sth9s4emLob2jbrW78AOyf7Rz/kxgrkZKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHy5OeV6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHy5OeV6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4585a116a4aso9848494f8f.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892523; x=1780497323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQu7+1RAsuU643B6dzPPjhrjJvzUIEjr3KyG0F7v8EI=;
        b=bHy5OeV6MF4SOz2duHxQt99C7W4tfNhjzpooUYmz0Ha6c6VkTheki4JTZwN+49dtX+
         +OOZHOcOCr7SZ/4BYyX210+iWh4pArgFOySYVOqpGJ7SSxovpRZvXsZF7WcOUAjjPTkO
         CtCDJC4sHBVgUXuZkjVwXRV83HmTntvleFxhEoMydOWMUw5ykHK9g5vnciRQKjxiK/tS
         lj5JLfj9KVwPGc+0hPo/8UiG3B1dYGbmAIz5ePrXJ61if4wm1xVYROG6ClS3qaE14LJ8
         GD77rHn9XkkxjwCQsi4XnVLwzvd9i+AaL/xuy9ZnJTwsKfq6jDTJ8+MKo33rKjMhSRJG
         0IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892523; x=1780497323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQu7+1RAsuU643B6dzPPjhrjJvzUIEjr3KyG0F7v8EI=;
        b=kti/Vhjl3MVLwXKCG91AxN32u86b4hSaWPLQywjAqVR5WWQMHcVMvPo8X1XU/mVUnI
         WdXSoddjF+zuk7OXBBbmSTT39LdE8hTXMf499I+Mun+wZMXH/pjg/plSK+S15DvT9o71
         azcspNHqOYYylyv73NPG1ke87lBuLK/6c/iV95lUOcAt9ooMMh+tg2z8LHgo92vzrjYR
         5GZKLlaJ0fHc2fxOipSGaoVjiVFoBSSeuvODHJpZs92CY278pyiiZTNNUG9lfkMgqsAb
         E+Mtp0Rv/+dgnbdpsyRI6YGz8MuGgj2eL2r2EAb7qgRIwPZsbe0tpPe4NvZmxIR1hAsn
         B1wA==
X-Forwarded-Encrypted: i=1; AFNElJ8z3omTwsJjKyj+ceGxKXI8aZh4wVeQ0CCpKUNqDjK4RmQ75A6dQ80KyJXhA1LMBOOgE4lWlZOzqUhr@vger.kernel.org
X-Gm-Message-State: AOJu0YwD5vX55kVzAGydiJwEoUOVVlxe7JvDhYFcwssOfH6V2XLfEPMG
	GI6dRthrVhMbpkiH0Qeoc1FdEMG6FnZmRhOtee/mo0Az63xOEC+KI7Jr
X-Gm-Gg: Acq92OEM31DGQtF+S9mvV4vOVqihlM5OO2ZSuAVZsBP7OU7InmGP0mTc3ycY0Z11JfM
	dZnPIOO7j/ElCeKdR9BEXVZbMsacl65Cs2vdq/YQ/zXR+8I3xcmJTdFYRmwAO+TntPgjr85VsNv
	kPqwKE1vstpLoiMj/984pOnvpdSDMRGkArcDQbVt8D3FiHnF9+x3ASwHtmRbsN4cheYmYLGCZjg
	Hdqsy2SLPlV6e1Tp01huJWUE32QIk1W7SlwO7yS1Os38HCZlh33SWRxudvIYKbkZRWUszT8vZ3l
	x4ng7y8uZiE45rZWJjnn4N/CP8KVw9V4Oia9qb0EiWlN6++PLfto8cFeyu8032CfMIDnYHqdlen
	lK5YC5gmH2vgey++RSQ5pMGXrC7lK3Ggo3yns0Ngq+dUPjV1ouvcwurgnxuSWG7LYCQ75JtiGdu
	7YlA5N
X-Received: by 2002:a05:6000:2f81:b0:45a:e3dd:586b with SMTP id ffacd0b85a97d-45eb368847bmr39696399f8f.18.1779892522921;
        Wed, 27 May 2026 07:35:22 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:22 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Date: Wed, 27 May 2026 16:35:03 +0200
Message-ID: <20260527143515.102794-6-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526171350.6fadc595@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-2-wafgo01@gmail.com> <20260526171350.6fadc595@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 17:13:50 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflow_raw
> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_raw
> > +KernelVersion:6.19
> > +Contact:linux-iio@vger.kernel.org
> > +Description:
> > +Raw (unscaled) volumetric flow rate reading from the channel.
> > +To convert to standard units (litres / second) apply the
> > +channel's _scale (and _offset, when present).  
> 
> Formatting doesn't match rest of file at all.

Done in v2.  The whitespace got lost when pasting from a wrapped
editor - v2 uses tabs and the same indent as the surrounding
blocks.

> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflow_scale
> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_scale
> > +KernelVersion:6.19
> > +Contact:linux-iio@vger.kernel.org
> > +Description:
> > +Scale factor applied to raw volumetric flow readings to obtain
> > +the value in litres per second (l/s).  
> I'd just add this to the big block of existing _scale.
> The units etc are all covered in _raw so we don't need to really say more than
> this exists.

Done in v2.  The separate _scale stanza is gone; the shared
_scale block at the top of the file now has one extra line:

  IIO_VOLUMEFLOW    litres per second

The _raw block stays for the per-channel-type description and
points at the shared _scale section for the units.

Thanks,
Wadim

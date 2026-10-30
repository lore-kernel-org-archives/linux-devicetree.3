Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370491;
	b=GaSIwC04lc5zQRIgblrg3/SMcvM/DNW9rv+o6fVpfL5pMTMf4bV8DaHSqhUQrzmRX5y/
	 xOFBILaJ1FzDvjCGn2A+5csFimvzKPLvzxAfrgNMQi9Vl+us+tJu9YO8zVc7+yNG+Z4Y+
	 3eRFPveuG6JrV7/xgIlMRVrh65yVOe4XmZMa5Ozgx42dtkKoQQeSa+kGFh5PdHQC+XSi/
	 eVYpXpiRUrtGyddmEIgVxPhGafreM5jD/3AwyqZKkEsIutWEyGPMWt79mNoY0U299/9JK
	 i6nQpZdTeMbY9baOuyzNaJz/5sA0ljPV0zIkI3bCM0BpxvLuF+ugYl63aO49LaGP8sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
	b=cGSQI8qpNyYc6e3gznwFJ7UjlZmAuCpuB0ST0M5dWwMMucjdEyM0vMaJP2tUekXarEB/
	 DNdCJ5rPIM9rZ82cmsh0kxLS0K5c0lB38hyfv5mZXpL7I99sJMA1mCj/8YebtAv4xHGuP
	 +pDnfePJLy3w+EdAoEP2Lqepkny8CzGHZEi56yTi6V6DtFAXc4N9nKiANPN69eTmh+Abs
	 OgNQG1+nWEaH2p8lXjG96IogI72DqWbCHDG3xgUKqq2WqaYr8H4Y5P2b7o8RZ/40ypgHC
	 xOVU5X9+9SHOhFd/ToHQrJQOIrNp3PNT3nVrc4ExfusdqX4TxRjBtTBEOpDwh48MMGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jmCuwfAH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB29C606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB29C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jmCuwfAH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so4613045e9.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793370488; x=1793975288; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=jmCuwfAH1CPTN8+mXIj6qPJx442DYL1aTnIIIWOVWiZegQVRIFn3R9Rmlu+wVFk/Q1
         qjr0GyO6OYqSG+JpENqWyICsbWea0t4k+e8bfeh63CwkToIcFD9Lc+5Pl88NM4vjtkdA
         hOlaadfDH7CaA5sQzJj9gHFemWBXIocfM+pzIWAOWpTKjlrBaOaZuIVuJTZ7N5H5WHW+
         KLESNqOfJk4VztQGyiobnxzEORUCO9NINvql6Y0jjVEs/8OkRe6i2s22zRDkydoQtmSi
         WPlaTz+IjyJRCxWtLoBVqUUlEgynmw/XJ78hh/5U9KHq4zrG0HOJT8R06SP/mYZL8KGL
         YXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370488; x=1793975288;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=uv5FHpn9AjsvSKSuFdbz4cA/K8iTbZuuf/qrDnjACT72tf9nCKNbJrPYWby21rG3xF
         bPh/k0mNbj9iDx9KkKxYmJtD0lrVKRPWKnyRdsNmvCy2u6nDUl+1s6j2YvGyXlwBvAoK
         4qo4oWKG6LVFjRNsxiDTk5q3ZxD3yERuz1is4Xbx6t12AS26Vk/lANA9BZKFsBLX1FWZ
         3hDnBPMpCDM0v+JNZB3Xc7lQrY5WOnrhhTn+JCPcrNclwxXqfURTLiAxowmWCYZHmFwT
         zMWLjIkXh5xhoQTbXbNVNx0YamrUP3mRRv/jXRJlIuO93v7gvqrRiJdkedkscB1581jC
         zMOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0XgSE9+gntMbMm0Yyj1n2EeUWUc5eaIi0PE2/PCTLPAZl22l0dB973IkXdQPxH3zbLDpgiom9jQ9u@vger.kernel.org
X-Gm-Message-State: AFq9FYKvK1alrMkd8tjkulebBXxZ+N//W2Q67jTYLl6JEZmDBkJlPmjd
	gMZNe3ijx/jHKhCe7iYjxgILeNnY2BYNLWonDNSQ5qaXZwI+px9DfCUF30h84psHiy0=
X-Gm-Gg: AYBFou2V0ndprdLi2rKdcqF22+LkImif/D/LV73x90MtS2fF+2izWSiK/IvWlJ0xJKG
	rPynjQdcqzRjmLov9UX74JHLyLwVCzrWqH9rIdt3R5o5iID1h47FtuJrwrmIuULmvZgE1xrdQZF
	rqUmdEeTaVs5E6M4kLvJdsR6HzDG1bidXSu24mrALygLIBaXw1uamF+KNfwXEzfaappVEUpC/CT
	Xun100AAvvA0O3I8lR7xN8HT5V0LMCvouKFJwrBK/r/8teMcNA5yv6gPejLN3OyP6DKXt+HEErD
	Kn8Hef5t8BmcS4qaEbV2q+eKig26Ow21sU/I6WoVMPX1Ke9RbqgVTJvaOatz3KQgastOrYlYwFM
	440zRU3R5B7bMmVMgK8PPEwLUnJHspFV7YF2r5eERXgTVcQVOAErz431OxKv0ktFwaQng65OVLL
	pJoVHWrg9C6sq+y07whd4EqfQgj/PWoN6L123ZBKq1BBYybInRwOaULuvkoCB2X+QJRn6AwwRy0
	AAApRRfAL4uXBR9yjGj3L6fTvXYKOPdaJjOMBkdROoU6FLJ0kvAULpJvTGMOu7RS77PmxaElHMT
	umfhK6ABgsPJKl9N7Q0ZkrLua+oSIMzBUHi3eSSVOpmAOjzZq0cX9t+9kQFmTa8MuGVN5HoJHNq
	u8aTPJ3+tsAnka7sJx+GYTKUE/La/H2Xs0Y5tYaLeCtyyrJmusKl+lA3qCiv/aC4mPTwuW3g=
X-Received: by 2002:a05:600c:8b63:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4ac187a7655mr51642025e9.23.1793370488309;
        Fri, 30 Oct 2026 07:28:08 -0700 (PDT)
Received: from chomik.local (ory90.internetdsl.tpnet.pl. [46.170.50.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm53158235e9.4.2026.10.30.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:28:07 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
From: =?utf-8?q?Wojciech_Biega=C5=84ski?= <wbieganski@baylibre.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Date: Fri, 30 Oct 2026 15:24:06 +0100
Message-Id: <179337024629.131241.9227206619077693683.b4-reply@b4>
X-Mailer: b4 0.15.2

Hi,
I tested v12 series on AQ222 board with v7.2-rc1. Firmware version:
'v0.4.ff.I0c83495.75444b3' build 'Thu Apr 16 18:18:55 2026'.

RAW NV12 frames at the decoder output were visually OK across typical
resolutions and H.264 profiles (main, high, baseline) with and without
B-frames in the stream, also with I-frames only streams. I used Gstreamer's
(ver. 1.26) 'v4l2slh264dec' element on Trixie with both mmap and DMA-bufs
buffering (on the capture queue only). Input bitstreams where
FFmpeg-generated (testsrc2 + libx264) or publicly available test videos.

Decoder (and the output) remained stable with simulated (non key) frame
drop at max resolution (1920x1088, noise generated by FFmpeg's bitstream
filter).

The performance at max resolution, tested with 'filesrc ! parsebin !
v4l2slh264dec ! fakevideosink' pipeline was ~85 fps (fixed number of
outputted frames divided by the total execution time).

Tested-by: Wojciech Biegański <wbieganski@baylibre.com>


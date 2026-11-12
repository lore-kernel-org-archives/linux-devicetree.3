Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483661;
	b=EFaL9BU4JsemLpD8Mr1irhS2XF6lJaYSfeUa153XHnCAkTutD6ckwZMKlo+eltA4PUw3
	 HQ+fodDbfDGzHeaZD6fve2GcY4be+h32Z0tgA+ie1c0Vi7HvalAi/1QUPxGa+CMp3Y6TW
	 oRnREKtTEawXOpLVbb8I35MrFALfdch5mjhUREagO8DReXSQMJwTQI6LtvR8xOqicvT2R
	 fWFXDrvbvA1u0C0eA2bvJ0dNracQJHJBZT7AmXM9i4xT2/akR13sxjkkQ6yB/DFA2mTVP
	 hAFTTFtsdfBZ0Vo6tbW9jnFkc8tmfUt7AEN+9R/iqa8VPifWvSfzasFDvDAxcgzeOmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
	b=DkA5OU260rkgI+m2Mj5v+WSvxa8aHja73iM9C8SJuFkVvnsJ/CafqxVZAmPACM/bzhrz
	 QAXr0Kj4o28WhKXaglET8h6CVZ0bcFFV2zq34kkef4kw80VlmyfBtLqB4q0WQeGrstMW0
	 zUxQ/zISXcYqLCCT5BjABwKSN3dKLTTCQw50rEMlBltz3ZX/JKxUldKP8jzsexag8WFja
	 Ab7qJxiK3FlCs1LZTOzjIdmn8ta5I9+Fv8vLQmN2gqV82eCoWvLynKDMRR1nIMQ/KPS+9
	 IOkIrwl/5fRIDxd09UhXvqp8oyipfI8jyTpppjshKkFDTZsxCJD0cesJzBjV0HScHRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB7606A8B6
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABAB7606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8882514eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483660; x=1795088460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=KEmPplNnoiOlOa7kWqvKF07gxkGykUViIUtmPh+kP7nQPzhyUQI2a1DrOFo26kA+FN
         C9UmWiuEgkum7U3lnZF2VFTEPJX3p4Ml61IrlT+cGHzD8hsnZNObZ95CR63hz98/GdN6
         oVVLS/uTLJOs5GgM9aOpfrcCHJAATOXLlBLr16lks61jshecz3PHzThBl0mKt6RU4nux
         UWdgHb+cuuerQdqnC2PXOfrZbzzzfXprb4boxxMY5F9Wz3GGu8Xd/EcnThJ8SnNGD12u
         N18W9NAt3u7Q25ugmUdER6ODPxbAGOEuAUNq3WrXdURkhdVsz7uqGd27gWnkRxKiObNB
         +Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483660; x=1795088460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=ns4MvtrnKpKCVdwq+kiRzJGCXCn1RAOcWpxlLsuVOr7jl1jkhuT2v3d72Ogn3Z4cSC
         qIkpdsNDSpFT1Yas14ksG8fxAbm2CpPpJIXMhg8OzGwO4mSRCtv4fCiJhoQkoKZEcnBG
         j3h607hTs+h5B4pnn9aybXKRPz5qCm5Az7wN+KS5Zs4HJprfZPk3QBLi+BHwEF+nYPC0
         Be8diN7KVZczefsFHg05PXcvxtXG9d3N01sOC/tlYjqOddKN/n3RFdrSWZcc69OwhvVc
         qbhzck3gTGlaPjV0CXMOolhcI77mvZPsvVRbR4XouuqCPwVzDSGhRHAoCNzEg3cpHhZe
         XT+g==
X-Forwarded-Encrypted: i=1; AL+hErEt48RMI2FJi3C7mtFJ6kJVa0gqD4A5Br+pDLxYmj9GMMmysdKF8xD0VMyBMjxEiBkP4PC71Tx3pi5Z@vger.kernel.org
X-Gm-Message-State: APuU4Z/SwiQ7KhuUGUsnY6eS0NAiofdHgCSGimNvpWYACh/7RBd1JM0w
	GGgdTu8uPdGSaNE+gEDdcUbhocgGpNIBQs7hBn22iIojOYbZnm6kds55
X-Gm-Gg: AYBFou20a5D44P6iO5Qf5kM+1PCQH2Yuy/R/zxYUwycPFLHE2IwXnrXOS2grL6MdOTC
	xQvZ9tXoSN/0yLS8MhGNCENz8l79dRPIBheXXTBcetUzyI7HIlksTOjLBwBYotbZPHcu9bVf1xz
	3zlxOCxph7auW7EvT1oaWwbxS6g3j2j75LoYepr/DV6q0OA3doc6Bd9waEIdLDp4QADjNF9Itli
	Ru5tZtRCqXiSDRKybqSdU9AtxleFOHpKlZLTHRaBQoEhpkvOAifsFItfwC1B+KnotzjXgVsN+gs
	cxZugHa8WvZSPxg8va+GUikWbreswsXWxwWCr8d6UKsi9PKHncbhlRlVTzs78NwtvrJP89Dy01q
	2UfMTutt86qPIrwdEGKTq9fIF8nRIQM28Kb/vjd4+rS4xCKNsgR0GktLHTvxXzqhaCA8SEO2Bac
	1zKA+yTSfYjleP+rD914zH8pM3EqJtLLzEnqgB5D2hVAVjIzlRuvKhZDFXc3teayQgkupk+2LNI
	OteBOmmmqyzBecq7DBoRC8tHmLw0yMca/t04XC2lsnFrBDhIAzD0JoHTKx63QH/wrkRL9oq+hn5
	18o5fNmQuGbcNMwmB+9YpUndafgUlvTkIlEytuFq005rGDrH18VIACY9nlHZemU=
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr4336535c88.36.1794483659738;
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm29245380eec.26.2026.11.12.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: iris: add platform data for kaanapali
Date: Thu, 12 Nov 2026 20:40:58 +0900
Message-ID: <20261112114058.428-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 20:47:24 +0530, Vikash Garodia wrote:
> +	.inst_caps = &platform_inst_cap_sm8550,

I ran 8K streams on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali), on
v7.3 with an earlier version of this platform data that also uses
platform_inst_cap_sm8550, plus local line buffer fixes for 10-bit
output. Streams of 7680x4320, 30 frames, made with ffmpeg's testsrc2
and software encoders; decoded output compared against the software
decoders:

- HEVC 8-bit, VP9, AV1 8-bit and AV1 10-bit decode: bit-exact.
- H.264 decode: 2 of 30 frames output, nothing in the kernel log.
- H.264 encode: 3 of 30 frames decodable; HEVC encode: no output.
- HEVC Main10 decode: reset the board until I applied commit
  200473c198b2 ("media: iris: Fix iova allocation from restrict
  region", not in v7.3); with it, the session fails with -ENOMEM:
  the 222 MiB co-located MV buffer finds no contiguous IOVA range
  after the 11 capture buffers.

At 1080p and 4K, H.264 and HEVC decode and encode pass, and HEVC
Main10 decodes bit-exact.

With the SM8550 instance caps, VIDIOC_ENUM_FRAMESIZES reports 96x96 -
8192x8192 on the decoder and on the encoder. If H.264 decode and
H.264/HEVC encode are limited below 8K on this SoC, could the platform
data advertise the limit per codec, so that userspace gets an error at
S_FMT instead of a silent failure?

Thanks,
Joonhoe Kim

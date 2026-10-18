Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F8349CF3
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305363; cv=none; b=BahzdlajuxGJgEfsmfiW40k3oQLyYHBimMm+GoT7EfNGg8nSsh9TBC2IFmBISrDuYRVcNGv4AvZFHsaN03VGGROMi3IiQ/rP1Or3DrdbnjzAin8zkooPYzMlGGWnmmI3EhrgHbpAZXzxBI1ISFZns9yf3EOhnrTDRLo4nR+Snpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305363; c=relaxed/simple;
	bh=a90dXT5Jt0bnoeFCJtvdYh9CiTHScn0kGKjGZWKzsM4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VJGmRGinVaesMYLP6PLumjNGTnqgUKx+u70WUuJjnTap3/ere36KwqRTD7xx+hwN7GT7Q3HgqYDdDB4KCwk8wuI9ipBa6e/TatFLVTejYU1m4DcpPX+8wvRjmsDS57thOPrjhR+yxvwhgv/axyUIX8vxLhSrS2SCiIlD0VLLw3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM5gQZc8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM5gQZc8"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-85377c8bc96so396391b3a.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 23:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305361; x=1792910161; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YcA1zj2YISkB4BPgDux4SbMcUShtHivbuZEW/fx56lM=;
        b=QM5gQZc88VFq9JStHYMsBzRTZjS4yfdMTgXNTPrwaNiTJiMDwDwQlqgskr/5nT4r7T
         BNiIu0rMucFfdEjcTHrdlCal1+/H+BJ3aDbP1IXRKNSgNftHIRF4gjwcEACs3Z9QXBaV
         fo2e/W/f9xZhQSkvC1+vuvNyEdFR2po4eZdlwyLrzaGPI1rUz7Zrpug1GLPUPRDAMWew
         42Ig3mQog6WimrzgElwaxz1CYXlErpLvTMnTymrOCAa2vjLH7ymFTU+/+yJ4WQOuqC4e
         j6fNvVr87lotnKUzWop1fs0KbJbNGiOZus41nlUkvQbU/nkbHbv3qOY+jydWOlzXZGTG
         K4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305361; x=1792910161;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YcA1zj2YISkB4BPgDux4SbMcUShtHivbuZEW/fx56lM=;
        b=tKrTz1T3ZwEIcYA2/FWCmfL+tVI7+18n+GS+Fy2zzB9SV0tRS/0kaJETy4FYfwrTx3
         vpqLBIOdge8Fbohu6BaqYz/7pprwarJKRodCGSwIav/PVtIdAYelZllBgdE/MdFypwo1
         KJcY4hcp+RCmsba/RARFInnLjmebPreC+p3Qx7/aBE/HMuUnxfNdWs5T488ORvQ0E/4g
         NUJSu02YOSJGRJ9fqw4/Szebo0QdHK+Aa22KhqU1mRJEp5PB8fRtfKoMWC9/VNn6Vgrb
         EYLEoUtUr7mLMkKS3SO201dHGw82JdXbUgskNB4t3BMO1XDN5nwLoXvSAEC+nOJ0Z36H
         BYiA==
X-Gm-Message-State: AFq9FYLU+sNQ6xrHgL3itbZeSvWqrVZAYgJgJbIdum+yTO7v1hz5Pqbd
	ZFH3DY2XMjt1lD09nQV2SWbjn1NWs+ho7Gy8MQvgCMhGPgF8sZrwKInqH7L+MSxB
X-Gm-Gg: AYBFou0t/kGzfHzHMKL+Ki/p2yfmSYp3JiD5TRs9PgQLFfvtgZPGDmKWX36ehV9ijCD
	tkhR4U+np2WRmF7LA8E1b2s7Ci7nt8VwfGm2VyakUZ6QjkqkiPXf24fspFHz8K0/40kwFnUY0ZS
	CNwyocwMQEwhcpmVKWwUKW9kfCDdq5h2oOlHH1v8K5wGbT5YtE0PbXisdUGVunZShh3DZZLA1tC
	pGtrpvZp/ulR0f/aIT1EP03UsHmVBXH3yQTy+NwOfIdYLXUQFgEvn1WiIITaEAlvqY1dtZGqtws
	U1uLsIUnYQ/n2ralQjwJPCzNk+qvebDVzhfZhOa6VjyAZ+nY7w48Hc6Hxh1Xl8dvJfzRShQaFU8
	SvMsaUe8HB4a0CU6J0xyul6XHZtvFGsSzReZwHPN/4togndP8sd2dzb5hTtXxH8yPBOQcX/uCN7
	BE0OqMQPyg5JF7BNfiij/bwD/Ks6u10VZAEE7wMIpKDLLVlNlC23YmCV4Cx18PWcSSBIyKrrn4g
	cgLvT2eK+COjlsJfRM=
X-Received: by 2002:a05:6a00:4404:b0:8a0:3ed7:93a9 with SMTP id d2e1a72fcca58-8a04d145e4emr3527900b3a.46.1792305361213;
        Sat, 17 Oct 2026 23:36:01 -0700 (PDT)
Received: from [127.0.1.1] (2403-580b-35b2-8--43b.ip6.aussiebb.net. [2403:580b:35b2:8::43b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57653ea9sm2718874b3a.32.2026.10.17.23.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:36:00 -0700 (PDT)
From: Kel Modderman <kelvmod@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Fix Orange Pi 5 Pro headphone
 output
Date: Sun, 18 Oct 2026 16:35:29 +1000
Message-Id: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWZUj9xFbGgBiOhTYtIxN0Vy
 2/x3gWeHJOHKrrA0cGezRog4wj01K4jCe6DIcEklyhLYSxn1hnRLlZolaelKhBRSQiFdTTw+d3
 q5rffu5n09i7gvh+QkSvtbwAAAA==
X-Change-ID: 20261018-opi5pro-amp-c46384700041
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dennis Gilmore <dennis@ausil.us>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kel Modderman <kelvmod@gmail.com>
X-Mailer: b4 0.16.0

The Orange Pi 5 Pro inherits vcc_3v3_sd_s0 from the shared
rk3588s-orangepi-5.dtsi, but on the Pro GPIO4_B5 does not switch SD card
power: it enables the headphone amplifier. With the regulator claiming
the pin, the amplifier stays off and the headphone jack is silent.

Patch 1 moves the regulator and the sdmmc vmmc-supply into
rk3588s-orangepi-5-5b.dtsi, which only the 5 and 5B include. The
compiled 5 and 5B DTBs have the same nodes and properties as before.

Patch 2 describes the amplifier as a simple-audio-amplifier aux device
on the Pro and routes the headphone path through it.

Tested on an Orange Pi 5 Pro (Linux 7.3-rc7): SD card boot and analog
headphone output both work.

Signed-off-by: Kel Modderman <kelvmod@gmail.com>
---
Kel Modderman (2):
      arm64: dts: rockchip: Move SD card regulator to Orange Pi 5/5B
      arm64: dts: rockchip: Add headphone amplifier to Orange Pi 5 Pro

 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi    | 14 ++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts    | 21 +++++++++++++++++++--
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 11 -----------
 3 files changed, 33 insertions(+), 13 deletions(-)
---
base-commit: ae965b9856f033145e292b0c29082a26bcc45efd
change-id: 20261018-opi5pro-amp-c46384700041

Best regards,
--  
Kel Modderman <kelvmod@gmail.com>


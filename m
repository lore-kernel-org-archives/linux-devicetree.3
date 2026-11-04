Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818187;
	b=am+G7SXUm+wZ7gY42a7VQIj3U8mSqNyVrgIlX3JMSfKLXgP5kPO9DtDXLUfWJmzUoW91
	 RA284V/JiUM3reXpn2hxkzEjRIpIlXx9D0lVd5o07jlOFY4Gojqg4z3YbAjTDDexpxupu
	 HfPRvwkZo9eHqDX3LT/D5p81rUQDs1RnXhz3xAIyIPs8QpFD8uXb/LFv87iXhXd9NOBRJ
	 cjDtFpPolWdJHrGLn1M20C4J0BELqoB+pyat+t3uR158uR5ZjJrUJFbMYmsPluUvwSvSh
	 HCS6HxKl/TmGH5UOet8jo8I0/33gQKJOYt3fJzoKVwgZp5SCZQoDFGzzH3L6rQ2YC6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
	b=P7sGmKPLcsI2wVE3MR9GE7rhWiEvFm3WF3fuV67NvJyEvaRdUTi+6XkRlNTr9okvgPTE
	 GxvnMM6SLgEuYUZtRxVuF4yqNgyrWAYmzdgAKw35cnnT/vM4cnxwoZS/5XuFmav3ismuk
	 W5EDOhHSuNmOWN6bcblvvpxJXMo7/nJrFz88reL+k6fjF+gAN82E9DQplOHJCHNc4ncxK
	 Yj95fNdYl6DO48SzHfQMxlVLKU3zUaJptjG48jpUc5/dpkyhmhT0GUgYQNhucX1hyFwH2
	 wYFvLC+iu/TF0hra08NWl//ehvL9SHKFeMzuoUV9Lzw2bEYaddFw21GOjoVyAWXngCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Id0Bic5y;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E798606EE80
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E798606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Id0Bic5y
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so6582925e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818185; x=1794422985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=Id0Bic5yqAl+5SIXtBA4w+100yT429WrjN8ZtNubXEat1ekKfQqyGBMqlXrtrShG0Z
         SeR+npYeXjTMV0aIh+AoCpjlFU12JFLcrA3heZBgrLSzHFq4mZcYijyC3EfjlcVbt2pK
         sLbrs6lsflEnLvKicPLhODnKh5i5lmEqGsAws3wjs6wLTMXPzz7oft6AAhSRP0hqNWSh
         vKx0XCvCXh6CJKFnaaykYYmPcGWxORPquT+IO1Cx55KIpsW4bLFzWxl6FdlEFlOYuFBR
         NoCVUf5hrugZFD5C1EjPrpEwAqExiRNrBV+6gF4oUtH8pZdHZSCYZZs6tL/b8YHmVdbO
         ibOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818185; x=1794422985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=weqj5mFPMl0gV9LGOlwLdkVHPdqim4rX+k/3ZAe7E4FlolPf1Qcv5Ig0ksHrN1HrXs
         ErCRvIAx8iBq+WG9/IV+ngVzADMKm49FJDWqFzwZYyaojlFmzROxoKyabQGa6f5JoBF+
         OLJj8rxSG/vzrkcloZOMFI7G/b2ek7nPXTopwBN3HNyhmh4bz9iMV8NE+ZJxoHz9p+Gb
         9SwEGYoX0sgcjernsBhJNo4XGQD9whTeBgodJmhp+Glmt5wUM6zMVsME2oqNY+KnX14p
         e5FnUT4thWnLHYscCqWkADM3g9bAz8ehsJsG7ZCuj0VfiUZPDLbzKPXcg2+8V8xq4pTQ
         cz3A==
X-Gm-Message-State: APuU4Z/jTWd+Aa+OYIQd4sTwBEuqJQwhD75Ylf5gYch44Awe/75IHaD1
	80Z1DmIvpCZbIs8WLxcw7dc97QHQh70ahOS8QOqxWW4LB2dS7uhSsdo7cPck2Q==
X-Gm-Gg: AYBFou0z1C0Pyqii4wRY2cstfxjVSCIq1vh3gE0opvSaxzEvG5YB8CRlFT6L4AJxg3c
	IkLatvxX7j37BTV4lYCbNBX01j329AgwTkg8c/ReRp/Z+JrGLA2y3BiFD5o4gWhVhvjJsox9zg0
	XpC9PP75GEphzaB63pV7OscEIh2csMpWNk4xRrDZAp1WNj91bsGgBs02alKqchBHHQMi5IrSO+/
	n3uHL5nnzidYcYf01Y8BuUK6TARMRmL6Tq/3b5KbesSizHUixdyJVb4OuiXMSc+KHm9FDz0lU4t
	b4GfOO4pfKiGx+iLCqv9KxsM9Yt1cUHNkaJf2oeS+gkYM5OLJ5nhdlU36V2EmlWbbCIWRjlOQrC
	YqiXxvyBLPJ2Oiw3AWUVtysUUFL0R2CDTqFPr0sMcpzREFipdLi4k/XKEHbsZf6wa0Y/pIYlqv8
	nzL+qdEJ8U5PxYkjhynQp608QmTbVlWdA2sCPZ2d4V+mjns9mvd5xuxSoJyx5V+QrvBLCIJMUZv
	6k4nAK1J/BERvblX1Z0f8PV9Lk9FhSKrpYOGI0Z4u9VvlA81hJ1NrPB5E7RzO48/OGTg/H2KRD8
	kxOFtFUsm0b7RH2Ro57jz05mmdnGQ5+6j9EJfzKC8+0C7EVxHNTz/RL3AE2Mo35G0+NQQLVIDMz
	+KlmzAHbuCEeZNLo3UMy+P4iuyCO2kGY5BRZd3pXn2F5Zft2Bk8RBsaDyzvLIg3EjoItASEsq22
	4Du9glq5p3iNx4Nn8KSZg3U+a8Qug2lXi21j5VPalqWvaiBoUSGT26EKl7myJlOSkpOFKXfSmxv
	rcryjteIIgWphpvhuKcrbBZ63avSEmAPZ9OGTBp0uN4
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr403830775e9.2.1793818185436;
        Wed, 04 Nov 2026 10:49:45 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:44 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Wed,  4 Nov 2026 19:49:38 +0100
Message-ID: <20261104184940.882833-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Jernej Skrabec (2):
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 6 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 9 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


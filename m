Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C098D4BF943
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602291; cv=none; b=FooMMN/F2DDP9LWL0wCoqMaI9qY43TgPvq6bEQ1RPjWKsGQCgfdC9zBj2KIQxOWuuQ42souQJXbR2eHS9320E02Q27zmqxyUpSL+PbGlX1cqDH7DpJfSaAbBFByUJB07OUa3quZJW4Qm0+KTmgI+Dh7OapF9au595GKlAhuaiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602291; c=relaxed/simple;
	bh=omPaPP2rMeTxzLF6VkbMvPUpuzWEp9z2/ZZ+I7CxoUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7EPl1SefcJjHhyMhQPd3g3OZdi7Yd7ZDEoQuhOMiGc4wCJ9O756nXg/kfoad6/2UnAVbmNdFEfKBIH6g40ouzJIQT65Kf8kVv9vL1qoqmV0qRbEBMxLsAChktQNHuSWqwrnaRTAAe6waJQoOKBPPtRUnEZS3ePDUMBXhGmFFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9DbfZGv; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9DbfZGv"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so1854622f8f.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602288; x=1791207088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Hlk6LB+jMpn63Ohia0apz9+abNxcQqx8sIdV/gr2JI=;
        b=T9DbfZGv0z5Q9882MqxV0pGP29Bi87o0n8/uIR6L/DMAOF4iFrykmPi7IVpQx+wqe3
         3QMp4hhEowXPkLAh3LZEGQg4jXWzSS2CBYPZ1/ruxPxGzCX0XD2hiVmBisHKzUGDGkBw
         isHqx5bshhhTRr5R5IbdoXBSiJG4Cl2d6vOtxUG53AL/WeQvn2BrxYy+AoKh1wWJURek
         GqF/ztw4ZBlBetdv/p1P9g2cNtE9qqVZSGMTuJyrYzpxQDdMRqAl33D1aGGbfU6WgPWo
         qP7p0djCJMFAmEWYxLtTQxFN+qzv8rML54tT6nr4VbuS9EuXAJvIq7YS+h2kLXkOHnMX
         b+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602288; x=1791207088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Hlk6LB+jMpn63Ohia0apz9+abNxcQqx8sIdV/gr2JI=;
        b=rIuw+Oz+RA+ISYe2fPMPIhfhb/6CrloS20tN2vbc1WIdJWWVXMItAoZoIWMMR+KWD1
         rQX/cH0AK5QgasRQHbPLa4vDLngUG0Nkz7/GKvnXJ1WXI7FeWXi+BSgyrWx8tx0Us0xk
         Odggjnb1l4uSS2YBmQ2gVOXpZlKWnOuCsyFi0YM2iKC4ADDFY/fpKn5Tl75yY3/Qieih
         /lSqOsAJnHTbqXjZmi3/KwD4TKfadR8gYwYtZg4skxKR0ghm5thfy8U6hDYgMO8tNhNc
         dy7sRjlR3E7UKQiEhrvxmF+0tARhexG8qsDSa5QfcQJ8GPHVFSadohG1t5qZJFIvjkWP
         KREA==
X-Forwarded-Encrypted: i=1; AKwUvBxO6j5y1MoV55Oc1ZlcBRAao1XlYMQi059LhH1D0YORoCpAa92lXUXoMr1pmnFD2c35gKbKeiRKd9IQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIGrwe1S4w6kWQJWvrJhAnWAaMF7xFxDuIZ9VgXi84Tz0YwJ2Wp
	JKnQSpoz7nnyw3KOfB6JnxRY2qqv5V+o6f/HTYrfIQkgB2crGRLSqK1q
X-Gm-Gg: AYBFou3AHqHjI8+EHzMeiUfIWTElEc0YGxT7/r0psE+o2Bl1uH0YfHVpGZ8Juz213HY
	knJGXGvW6n2h3XUlpZlIc5ucmd2dcwGiJsEiYQNMGtJL9Ych9EU+5Ce+CPfTHzOMBBQwNYOdCiI
	FZTPqOxUFzAm1olx0qHENFt3WryJB+L80gqH8Rr0z/PfXQvOUK33KTg3uNijZQDv5mO366sAFMg
	bQtqVxbi8THYQzlz2bDmCjY/JPxZY6FVrgZI/s/lA2zjkaVvI8hqDsttCUdmlK2mxdNQ8t2BSDC
	jPmnfhirLxVh+4V09xzWzxh/l/XRrYSju1l5Z/C0pjlmQpS75JJHG4snrE1TGRUvWAbPXmz0pfm
	NhBv9Jckz+kG+HkjFqQPhK9wESDibteqnrDWOMXeUJJiP+D0IpkT9wsMVQZl9OT9wKRTa8Muwod
	Nc6pey1yxRsP9W8rx0OzPvk6UDvPE/VHhGJIQH12VCaflMfW8Pz8tYbn+7rLNlVnt1Pe5oTsdK3
	RlVIIXVK1KT1t5NJMjDWLuKLo8rSzB+OACxtnSKtuEewsZpF5En04dtPIC6mQz8VaAKBrr2tKQH
	hcAPCzgieRPZszi5oukgDQg7QdkwD/JaBEdQNgosB8A=
X-Received: by 2002:a05:6000:2510:b0:487:c99:9020 with SMTP id ffacd0b85a97d-48871714226mr24139494f8f.2.1790602287523;
        Mon, 28 Sep 2026 06:31:27 -0700 (PDT)
Received: from cypher.local ([212.187.182.165])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm27746276f8f.28.2026.09.28.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:31:25 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add missing audio codec supplies to Pinebook Pro
Date: Mon, 28 Sep 2026 14:31:15 +0100
Message-ID: <20260928133122.45765-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT binding for the es8316 got 4 power supplies added in commit
e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")

Page 16 of the schematic for the Pinebook Pro describes these
supplies so update the dts.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

I noticed this was missing when Diederik sent the equivilent patch
for the RockPro64 devices:
https://lore.kernel.org/linux-arm-kernel/20260922133643.2730265-1-diederik@cknow-tech.com/T/#u

 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index f21fcdc1b49a5..f728e6f64c2ea 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -656,6 +656,10 @@ es8316: audio-codec@11 {
 		reg = <0x11>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
+		avdd-supply = <&vcca3v0_codec>;
+		cpvdd-supply = <&vcca1v8_codec>;
+		dvdd-supply = <&vcca1v8_codec>;
+		pvdd-supply = <&vcc_3v0>;
 		#sound-dai-cells = <0>;
 	};
 };
-- 
2.55.0


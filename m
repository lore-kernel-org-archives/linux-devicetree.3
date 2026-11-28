Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875352;
	b=gnAf4sTLj5iIpvRaa/fyXxekl1p6g7A52tUnBn4Lf6WjekyDAB5wdRfAfxaT1ASbju8g
	 ZjwjYOsM9nNOEOo8AOgHKzYSsUaM1wN4M6g0njM9J/z/IM5A/+d1gbAL9u0fZTrPmbPec
	 xE/aSQCof4tYX2xW4Eod2dDVtwH7ty7WRGDBsTrG61eFHRZ7CkCTKup3wbF0DOi9c/xYb
	 0Eh/mESbrou5NS+LKWDFoEZsPx0xoCG9xY0a9k7BdD9EdTk8WH20VoqmB9+phbbUCZRPc
	 qq1HaKIojSt6w+ipwx9ZYizgXJr9TGTvrNUao34zntts/H12gUKg72WnDRQWi6Aml/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
	b=EkLL7fwFvSR0Q9EifXaka7clrdokzoRMFJj+65CtyQx+EJIk4ETIAwKQJ0bOw6SNMBxH
	 6brDLHWpxLQ7A6JgjbYe3w/N9ly2+cwS9uTOw4YBZ5zJTL9+ue2PRxVMlyCCQdMEH1yhN
	 EZuVE0eHow9GXr1XXoGNnlAFOA2bLnoKDmApONQq+O8/9n4YAA+K+6blMZzlswM6nej6C
	 koNRpyogNSM5IRcPcxhbYG1cYdWnPBqhfAOudNdQJxtO/SQITj1GJfwTontRGa7FTSuUM
	 iuqRVEfH9xLkQP3e1+RlMs9EPDK1fY0f9cSAh/dWYznpE2+9ck7onlk7WWqywJ57VTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0elJMzCE;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2189606A325
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2189606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0elJMzCE
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385c497bf94so10143308eec.1
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875351; x=1796480151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=0elJMzCE2RC6o9t4VBSoRh9LGquJ22F3QTJQ9xjVjm1b7xJb8qy3q9ltf8H2VMvGYk
         vr3Q/Q58cc0kowVw4x01eKDjL07G40Cdqsu2rWV1vvvdUNHPWslJR6Zz2dov7E2RsiKH
         LbKwpVJm2d6IVOsgjXI4Fc9Nx+C5NFVvPmeOTojUBAUqeHk164Z78JiNCpuRmWISvjO3
         o2TqFW0Fepj+uZjgEoBM0hGuYArIeSCWlu4K5eSAWQ2erR+0pv2Yxp6OvsIh0dF3YvM4
         fy+mL4ZYKUySs9RJSVrQm6wFXiHSjJ30EKBuijwlN6ZBy974pnp+mjHxO3ZiOHK8bV/y
         NFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875351; x=1796480151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=KCKR/Vgs+M1q248avL+7Ou/PFfsgnLOR+7SBnVpz/PX/VzIZh5HjRl6mxCv5DOnJKG
         bhSMXwEKc+dkOLeoTrDP5J+Tqi27J0sdUfDH3AXTpwM5ug3xNMTYI76JrkD+CsS8yaZ4
         9LRx397u2YV3nhGM4BdO6cXk72T0OkXFCjMq6KPJ72szGpnhGsxac7ggTwI8SrK38ppk
         7kF/PeyWx4hKQRpBWnpYeHEN79ATJqVYHRK4NwTWYIko8SqkqpdMB2kYNiJjUa6q+isc
         J9KqRQDUeRy750uvTcRO59l3dhJTW86yax8Ws6khxII/mxc8lp1JdkGnq6kjfOJAC1Fq
         HxLA==
X-Forwarded-Encrypted: i=1; AL+hErFSz8nP4S4fw6uff+hXgIWexdsPkZjQrmXYh8s1AXRTjLuLECEBZO/lDtSBo8IqL9hWadPP+8W2BWI8@vger.kernel.org
X-Gm-Message-State: APuU4Z/RN9U5zGBeC5lFE7P+ygEpveanyHfNGgiHTHQ568lueyfUYlqr
	FPvUgZ0ziP0xH0okcidMkWHr9b/oZGEXrIDl/85RKYZsfDVRyrYv3LCz
X-Gm-Gg: AZFdTZcW+EyjHuv4odemsmY4F17NJb1kmnnFjUNFOKxGUhPnZKmQxyT4dth6HqSPDfx
	PRVgsQdRScExAa7ZGIy5euVZJoIHKE+rfAUS5GIYHjJWnzBQmMC9sRBG/h68oLX1Mlhz3Zy7NEZ
	5922qSWgl2j2vLsVP19/i+0PsP9MiiTVmEQCzyjTI1XC5/+Abjk9sOatFWqa0MBMDD8RWYIhISX
	QrzBD5kuw54Zp4WvInQzy3MXL/e5Zck0uH3T3k0Pi9hNadKdqcQ58WoKiuYADhEQ8ZNA7Qt5Liq
	u31ttAb0znJNZuaCi5RZt5HMo0K7q1iy8X4D7wxokQvN/M/YPxmhsTGHANB9+m7c2xa/iKlrr5u
	KShizTHe2a5YzOVk+xbS9ND/Kh/NQy0iuZ1neSXzzQRysb898GVkUt9KqhDypV8imR07KHqPM6j
	VWuW2d6dsb8PHNc9vcWxdGBlYvYUrBquVgjptK9Dvgd5SN6weotNt1tEjxbpwhcmi+h7nlqXkTc
	KtGMD3INHmFL0Z5yV0iJRsKv/rvYMo+yAREzW2+RyIrCI2V7PS9zM2xF7AamR7xp4H/RnbBlf0v
	icdtLMtiNtggX0uUFp47UXieaxgkWTi/5t4jXzKMehukiiiL7PcMW0Hs9w2J7pKYNDWryEN8Yqo
	MwBDaKC8KrPQwsuV83mO8fgIPN4S7fv9JZ/CBHT9JAedXNU4VsA==
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr24839784eec.39.1795875350839;
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 6/6] platform/chrome: of_hw_prober: Support trackpad probing on Tarkin
Date: Sat, 28 Nov 2026 19:44:30 +0530
Message-ID: <20261128141443.13065-7-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
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

Tarkin ships with either a Pixart or an Elan trackpad on the same bus.
Both are always powered and expose no reset or enable line, so the dumb
prober can pick whichever one answers, as it does on the Corsola boards.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 54d894161..215fa9adc 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -111,6 +111,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,tarkin",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	}, {
 		.compatible = "google,voltorb",
 		.prober = chromeos_i2c_component_prober,
-- 
2.46.0


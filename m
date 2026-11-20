Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185738;
	b=MVew6kIpHbFPqSvZv1xK1Ath5dGF8iVwr1zBBqtvDRHHwlVsnczmIBME8LFsDjMSzcYO
	 zELOXEmfQMtea2cH3sbiHW3QpEScRnhjFXbdaUWisbYB33wP0f85m3VEoyJNpVt1HfO7A
	 2X8ccbLlRAHbICbV3KFiPQbcKICM2NuSn50vUZdpXCKszW3KHYMEdwhV/x9FTaoCmWebZ
	 xJNtM0V+REjWObIgsgqJ9nyNJLV8wgLZaNXzW+1K7pwlNL9DyIJDvIWdpfzQxR+AwrD+B
	 FM6boQ2M01gM1XtNGZyhi8k0Csl+LoJjuHgrfIXmgmNNyx+uqrgkyyUXqkD1E4jseNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
	b=2qb/zO10SAgk6m0A8edNjZw4z0cZh63cSAZTVxeFqjJaMwqqJRn12zO2TXw/VTNraHMo
	 /0UR1Mhu55ffBtNjSH2axpMwniEWHSZ4wPh2je1vY+RgC013FmYcrjocU1HQklcMHk1cs
	 ETYZcXNHHOVIxmJLUbP+SANEyWis1AnfwDE/SsKye5EcUsM/NeB55pDeRJs6+XooX4YVS
	 QfwhBO1bIki7iivcFvD2GU6II9XFtIG3miORVVl8bSWMTNFRZOEORfOpPDkwsAzBBbkQR
	 jzT67DxnUIMzitoOyDmOJGUyBWmmd0ReIdStzvbL0GNfyn8ebpi5p2y1930Ch4izxMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb33keXY;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7E606A336
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE7E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb33keXY
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04fab527eso3112775ad.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185736; x=1795790536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=Wb33keXYKx7jHvDMOVfzOa1MjjfK3te3Tm5oMERAvMHZsJLvB8e/WZWzSP3sOwARxD
         HD+M34bOlaEG4qHNcyDpGYeyq1U76fJt/+l3KUH+iSqJNmo3lylDvpiAxGJFgbHBUB3g
         ZPPO6tb02p9YHPkjAMUKmxWFFgCh6eW70enqqn+agvVnmvK029VjXnoOrb3NrXNEd+Fc
         z7FwLu0MWUFKm+yDidOqtfAY6mENmBl32KCyTVVI7ACSqD14QRNI5HfNvmhR0v5A4ctA
         Ysv7jUuv0uDS38bnwaAjL0VmqGVSLfAMgI1NHKGpiofwDiBxLo80MnUVzsfAKMevqiHT
         rnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185736; x=1795790536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=f09R30+dFIllmXj0kBL1X+DpZyjyRHfrY+XuKGV39AsdOgvbIpBKbkjW/fz4aJONpU
         CEgtVxpNlMhsxPJffNfCrUhUm/lIUTXIteagLm/Ijmq2A6mtdzZcv9kNGvRdnxt7RBlY
         WOBjdj6Mad0c+MIYgYMqFOFVf7Uvf7rHCXyWX4QrJGjAN7Guot9TMPWEV8vMcMKizlOY
         GbW0ISTTf/FnKSbt7Z4WWuqMFjO4Bux28xozWUI8AF8+CTkI7kn7U2IH2WwyviecCSyg
         kJobv52KPekfBd59xxL8YtDLt0iRJnO4rzikcLQNDAVvYEYd/tLhudCDzjhE8pIdqTEA
         LNsA==
X-Forwarded-Encrypted: i=1; AL+hErGQZcYJGxxR/lulROMqY1P+R1ieFsoEIGSmD8AdFOk15gnfX6xEWWYbAcBTWTCMkYsK5RTEu0GGBnbx@vger.kernel.org
X-Gm-Message-State: APuU4Z+4tnlhTXCyKO06iLLUXlFmnsm/pp+nQi1x1c4OgXTxeuMcFfqY
	EggSUfub4dzSip4ECm2Pd+yXU01gIBjpsqvS9pzHWGYH5Ia4+LemuO3g
X-Gm-Gg: AZFdTZdPk/xokCQx+RaQ4iiIYQyPoRj2rmXo7b/g+TDPoTwQxJ/OPXAzv9JT16zUQ6y
	8ewfWS+oEo927JUepC6RNATQ04NTOjnbZMwtTjWZv/oKyxGe0RCubTZzpINuBgmZ+ivXoBpa6FM
	K80BQBk/8NUvSi4As5fNPRfbNGzpai0+jw/cmjYtdpYW3cDT58sbMhHeCYCTCzFu3pb7sn7TBD7
	P1R349qTO5QspeNQSzeo+p7s8tGp/c2EfdnFsGVe7l+auPNFj3BokHoTIxGu0QYylN7uDM/NNwS
	EEx4zliOiPoasE47YeNoBgnMSbClYBi/ROnUNoBV6HcIQfs8Ng7erUImww0UEQYIp2+W09iwxZ7
	lcVOCZn4PKCc4F30Vy4HowdcXXEP5iIi6Fd4f8SK5PXxaKxM0hjyVmX0I2Nws2pWrwwAkkdoULq
	oagJFhKuOdCD6EQSDaFUZD57PjKXQ8s7//qT9CZDGJm0M7VwrF3nQCB5SIQeZ3cfN60LRAIeItK
	qvZgAhcXMkiXawaGVa4PAgY5ldVTWRZoUWvlmZHOmymevmfvok12D+CiTwXnsiX4fxDwh1qZHHP
	vahxOJaS3R9TvltOAaLzUNKKEB/odmij+QSpPqmjv7ff8Nw66aX8Zxbu4qA=
X-Received: by 2002:a17:90b:4ad2:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b41c99525fmr3214938a91.58.1795185736231;
        Fri, 20 Nov 2026 06:42:16 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:15 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:45 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-2-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index cff9a02e8302..ca325c21b9bb 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,6 +115,8 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.56.1


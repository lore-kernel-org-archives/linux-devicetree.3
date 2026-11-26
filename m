Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721620;
	b=NaQ5wBF6ztCNu10nNvQo41ogeWX12u0+0YdQbR1oR9jDcGL6z2RhvswtLVLP2s6fvtjz
	 MTkMl7BHTNWN3zIvB6wCdwjWyAWcfM9V+bR+NcM/w3wcS+8+zZRTHKLJlv7bumuR/dw4P
	 HXfqESY1riCrsp4Axd5MxpjyxEa2IGOSFMk9EY+kbQB4yvg2AyXoSRH5HreGA/ABN8mpR
	 KzQMUuVvzcFb+SzC64cq+vq59r+qTBOU+3Ykpwnj95venugYt0D0DeEetMj/WstJL2AAi
	 a4mO11RuR69B1L4V5cypuXSNhYyvYAwcvuj5PqzRMDvr8vUMSVmDzGhpc3YgbAcmlbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
	b=tli0g2S5xnPnw6OvS/bdwdNkDUyVpGjNug6MASfdM4pUwzUV8rf9nmek4NcmpJNPLXMF
	 l+lk+cXV3SKEAIfiRCdVUoaOi04QPrdDXpAhJgra/9S3ewZiSi6hqkOfFZaOVIyZILshC
	 Ae4mN8lc3ju44haUvIXbYJU+6yoSO8OECLkfbhQN/paoQWmuhAlGOTydUQpxQ7L2LFmyw
	 T7aShvNhJ9XfgZx1+wmXMcjOKF9gLYnnr1RioVxqGDCvEGoryVNzqloRNser0A7CbQBzX
	 bfpRp/sHhY7riRAHRt71k2gFRo7ItCDkSY2aYRIkBQIEXJNSP5lGtixDfLwbs8gOzdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWSn9Dkg;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED95A606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED95A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWSn9Dkg
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso20796185e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721618; x=1796326418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=uWSn9DkggmqiqlyDjXE2iIzsxYnRI70J4TLtr6CcxEUJ9/2F0ffcgbUKyNw53HMhyq
         p/ccO7dqJVDrtbUs72vxr3rhExDSrozs+zETKtcavvFQXHzLBfudH3xzOTV5ca3YvE0M
         wbU+dkWFE6ZKvs+/IiyRpExAIWCu7fqzWiR0WcjoLmbjhzEi9reZmLZKbbfgfnrKN1Tw
         FGnH2NR6Y6tCXJDQKpNdVO3lc47Mj4OiC1X3ZqWdDRCGAp7nNCT3GxPSm/9hO9PJBD4E
         CCfAlVRc5g8sDSr/L1r+C6JOJfmOsMUvN+VB+f720cbyXhpWCMoWjgRJQnplj+Z+HJ/W
         CBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721618; x=1796326418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=VHLJ5+pyPDkPIVvgm1AZbLX8C2aLDJW4oHa8ciLcIsSEC3iYaO8CRABbjIAti/SRhu
         8QqmD8UqZjlmuib90MQhP3EO9qqgyk3z4vsGKqeevwW5/B8VGvabd03YjDdS34YHn0i6
         YBlX+JQMXG/l4YqcQlzeQ2MzcpC4MQq7TOHNN2wT7a4XIFlNzRkeT93J1joECFh83e3w
         6MYIWiR6ogT0GO1OCow/nrVECAdMt51wLLjtiCEHwhe6uxD7XYGqidMYJVZKnNyKKiAL
         qqR/4fpMvre6H4DbSC0B9+spmDb6qK6hZzvH9JQJhmOAEjoKlMvuIoxuFLKlMlandCUT
         OlRA==
X-Forwarded-Encrypted: i=1; AL+hErEjl5g4aUyCxs+XswCDnzu4caYitrqf+V31djyQ/NWmsuz1YXteJMVd+wDVcigjENX0amngjZlC+hCw@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ukvl26fL+Bj7agIINZcO492v8jVfxQHizIY0jWBRZ5NowZj7p
	B/giBP9Dfg+Wa+5D/UT9XaQTp9VLbar3yx8gn0VCZLmxBHAb/LKXKVkv
X-Gm-Gg: AZFdTZeN4zuSIgANl5u064JrnnQeTT6rHGvjBIKDS1ZPhvQWEMR0GhWUP+oMe34I8QK
	21fyk/oZ6Z2S+uySxLNX8wwlnspH+3165DowKCJhXfmr1lAdTssZ613zV59t4Qb5iBpTBmvuA4Y
	Vdj+vldwZaA14vwofm+b+GvmmxOyfhklNcWqXuG0aIYOsGJtlPIMTSvwxCfxXwDFvo8vDKuJk2/
	nk8HgCVJGxEHtPIJ3OBeIhX04c/x88KyNLfRLwDlRRsL4h5LWBvxPYMZssvJZGNVepFhzQrX6E/
	LiKLDJ67uJnS0ihUtWBLZf0ByLM8gYTdk7gNd3z9q1t5ie2UhQMk9bVmu/9NUj+OUR/wscq+b7d
	2lwyiSGmrqxhaxqsMD0wp4w0cSM7gseVsmHi8h4JF4AEX5AtnQTfKmYlMbv4/EnjBl5sgH5QLN6
	4jbu7b9WsoEwOAhRSc1Sbjg4emLpWiVp733gSyURgjpsSb4h0lcby+gDFK+GyN164fnf5kETYYj
	4PHniuHQLauH7+o/R1i04C3i8yGlUvM5ALp/xOlcfRS0FwAvDO1qvl0a2Qx5sYt5tLy6DzRRW4U
	Y2GXN61qG1hAfAw9fG41WOxCWDVOSGReZ92+yil1f+gcDG5FFzmGAOd8DlgczrkufFQ=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr454205435e9.17.1795721618450;
        Thu, 26 Nov 2026 11:33:38 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:37 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 23/25] arm64: dts: amlogic: s4: add crypto node
Date: Thu, 26 Nov 2026 20:32:39 +0100
Message-ID: <20261126193241.1471372-24-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration for Amlogic S4-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..de173f40e15e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,6 +71,12 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <166000000>;
+	};
+
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -621,6 +627,13 @@ mux {
 
 			};
 
+			crypto: crypto@440400 {
+				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
+				reg = <0x0 0x440400 0x0 0x48>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+			};
+
 			gpio_intc: interrupt-controller@4080 {
 				compatible = "amlogic,meson-s4-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.47.3


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515082;
	b=1paFX1CS0vj4wqojiV7b9IMATtWe5bwKSQoFJpqq5HW2lacDr0tdfPQSANqjSA9kzkdy
	 kmrYSBWzAsabH6NLx9vJsHIB9mN/D9Z64i1NOVbSip/U+Vqnk9iDqBfMChFoJ+SkoHyv6
	 mt3dI5brAy1qeyjqeWj009FX+UHrkB+WcR2ZEpMsXAqyYIfj0peFq6eStfIbBWJIDdjmj
	 g9Ei+Gg8Vj9lPAnwUBG9X1+9kLzvHy7yHZmzZAUHi2XMoXuQz+pnsh0rJwON7GDCmAXc3
	 UqebG/bhJI0Oo7Br9P7Rzg9WUnHwOsTf1bNnO0gWOdXbBY5usXjekK2cVREavL2pt5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=;
	b=dlGW9t72jbHW0fWub/+IBYl3kpYpI06AleFNiFz6n8sjeCPYQ0BQHwO791M+xup2nFFd
	 U2G1DEI/Lfvf7/UxpCDnXkzqTwxCMr+bi+BqUgqZqonJcrO8yn0zZnBLx26hhPQcxk/au
	 RSIKjHH1wvSwxzP9EMsnXFPTCHLRUhiu8QMnIEju8dFYKGKtpcijF7VHzhnVqO9YOD2Uk
	 vNfjk3u11AEkZHsNrZVjvRFFqma048ViItgSIxUdvX6B8nji3k1HjknOfSA/c6DoqgQqa
	 K4SQkvcpaWmr5QxWrSJqywqHJSGnwKf+xZP6J9ySapGf5U+gqVTw3u1RwJUtuUPjefg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HlAKYFmf;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D68606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D68606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HlAKYFmf
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1645979a12.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795515081; x=1796119881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=;
        b=HlAKYFmfPCoYFTCLTHQDZ5gmfaO/86bVI9JR8zSi6iX5pEaHJ6KC85vWGnSoE6W+xZ
         SBsmUsMhSOiM5F/96TztP7GqUP7MBeZmi6u4trfRa9IhF2/V+iPNHLis/ydSVGEDAr3S
         R+nkYpQDXWfxho58J5CYyt8FbpQg98Ic6S7uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515081; x=1796119881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=;
        b=j51fUyzKz8yZjXicJPAXZ2sT5JuScPZkUzzyGmwNst6Xbpjvaj8vFfpVTpHh8DgogU
         PuLTSMGzTEgzbHf+dmPi80vqxvPwrEG8Qg0sNdBCLaHdDOmk25T4fO1pvsC6XnlYx+qv
         4Q8Tlfrq7hD4WAoK/yD9xutf7lauzacug+HDMztQ710KDfJkKDYG6bIZmCqG4R2AhCPK
         oczNgE4qCsdgaRWBd6AmJLhTAomT5qpoo9dFUwPt+UAz2EW6Qt18hNvTjrzCUlh6hrhW
         5aCongWHCzdPTrQDNqCKp+7RNr+FANwjyiEZ7k+cU4c8bHB9Mx4z0nZQYqw+4Bz/22uL
         n8zg==
X-Forwarded-Encrypted: i=1; AL+hErGwQbVrl1mZQCH3bGPHr57zdS+AZ18zeMWftWD45CqSzVy0Zb8KXVTO3ksSSaB/+msUJcdAy54cdIlo@vger.kernel.org
X-Gm-Message-State: APuU4Z/j1UcH/FWiLQcUSA/5oI4HSjW+NpiTWuBk+UTMLdxYKBBQzS7N
	LKM50SGdFY5nD+I87FNJeE9GKK/tCyB1RH3TTmcxMUw4MN71N67Pc9rjUThT7ABGcw==
X-Gm-Gg: AZFdTZcsv/WaWDbwN6P1+Rx257nUHygVkbzu8ZdU254rWhfsPls000lmnCeXsXkHtST
	SkDcb8n2r0Lytlbq8pb4bevBr+o96U3x6BQeYqBnDXXoFVK1gjESdpa8sK7IIc/abp0jcXXT2rg
	9K6Il9SNfEcy7GsCoPtm/ZhimT8mB5vt5uLUPkg0D99VRQvqZsL8b5RwKyPqVuyR0HNqx2p/zla
	va57Ax02J9W/EZ6vENVu/7UdH2fMAM80HcG4nBDs1I5FK+tcty7WF3ZbUAhryjVzz2Rh4j/4Trz
	7C/0lD/2WuYn94+X1GdnuX3W56CEH+Ujd6UyMulnVEgo5ux4DiRch9VXFln0GX7khnywhqkXz3j
	4yHOfmnywO+3IEYpj41pQSRcS7IzXxnrrDU6n5b0G2lgXM8JaCpzTNHd3NqvtSEVYs1bdyPSdAv
	v4grzYQg4iU+M+gC3BxALK2i5Iud47/RogIFWl1qlsEqLi1+rNChLdUDVxSuNQCQrw/yRbubJkG
	r8vGe0wX3184nds0TiJX2PIqIaoRu0zlNagR8biIcoi/Utjukeklr0ti89YuZeWvRXTiCbifpRt
	rghdMj6Iz2bC/9mde2cBablECTGBwE6hLzuvGbI3/pp+viW9e8QO2y0s1vxJ
X-Received: by 2002:a17:90b:3f0f:b0:3b4:1b37:ac89 with SMTP id 98e67ed59e1d1-3b41c8ff71dmr19777589a91.34.1795515081507;
        Tue, 24 Nov 2026 02:11:21 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41abb1b66sm23171867a91.1.2026.11.24.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:11:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Fix swapped regulator ramp delays
Date: Tue, 24 Nov 2026 18:04:19 +0800
Message-ID: <20261124100420.613422-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
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

When the ramp delays were added for the MT6315 regulators, the patch
had mismatching context (due to unmerged patches in between), and thus
was applied incorrectly. The result was that the ramp delays ended up
swapped between vbuck1 and vbuck3.

Fix them and swap them to the correct regulators.

Fixes: 9c9f83e3368d ("arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 91da89eda13a..6cd93d2d4da7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1505,7 +1505,7 @@ mt6315_6_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <4500>;
+				regulator-ramp-delay = <8000>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1515,7 +1515,7 @@ mt6315_6_vbuck3: vbuck3 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <8000>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
-- 
2.56.1.809.ga0b61035b5-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875337;
	b=Rg4negeF7T4XIhPc1WsFf/3zWRPqJS0P6iDkYSqYCuFeM4VgR1lx9kj3mZAokwgfFtFZ
	 kGJFpTMxI0BNqMICMgw3csgWwD1bNSKKBO7LVfK745YPXQG8EuemSKQeAH/c3/5aEiuze
	 SlU4x6J73C0M2X52uUAF4vYjsVBWLwjBKFev4POX7pc2rts6xt1JSch7t32w8qEa/9eMf
	 U42DL7Gg/IRUHjQsWij3OvuJmLt1Gjf+bFVGH3qbCNtRINmCmBoNlNbtRY7cKX5yGMP/4
	 WflYL1lD4+R8SBXpTop8G06uTyiAC++OeoAI6/FaYgLSY4KDea+Gv0lhc0lJVrtDcEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
	b=QamxzbEx8eeH2lGlcJNaa8Xw9gnSaBwK4q99wRUXFFDtUre6EaE7gebXeBfpgFGCv0n4
	 7FILMg6P3Xuu29HSU4jRm5o00RP7CUBqnmSJrUYC+Vp1hrsjx6sm87h1BdmwKOoS9wuzi
	 eUsGoGX5d2PnbdZhweTRsdA0X7s1haLOPbe1CUF2l7Lgsf3xerM2eh5gQQ/swQIrmQPNt
	 DBBV5CwfFa+hT+/O/ibaNGvNfx8U5DCCcr46T+BrjD1gPvY45oxHCKNk+VXN/1Y1uYyva
	 Xio5azBV/7+CpLofLapR0sbmGYKOCL5vOO73eM35rc/n4THUwISfvi0i2+Ahk0Qzbxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1DsrwTa;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEE6606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 14:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FEE6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1DsrwTa
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so7907447eec.0
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875336; x=1796480136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=u1DsrwTaOKllraREGZcoVWCCXfcM/os898fEU8LPndQQVDHGEzlD5p7N2UyXdVPgQH
         RXIpWB1t7EgffrIl5qn0bhq7WQeAIXSV9+NxKYZWo1PTt+sJPH/ZbElXh0NRvhU6ScM4
         yaVlvvZ9t9Qa38Q/DRNDzSvQdfae6KzjJToK1mqtwQOjWv50VNzw7EAI9ZNgrQgObF3A
         l8Gl7FXBg65zpyhRluX2Psw7sWRRTAvta1JotOnAMwa1oG6FbPV8QK3usjYQ5R1KcOIA
         cjyWjW2EaonbZrKaGugZW9MdqYWhX5NrE7ahE8QBFDTnP1+0vSTpnrRV02uZVt9uewc1
         mG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875336; x=1796480136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=1mRzlADkwrQgtJZcQULw0HzEAwKkwwyMPiUVjGG3HDNpVzVBnKph5lJ7n1ScS1yIg5
         mueOEUZKdswViy/OTTElVgwRUXWJRo7uHmciIeLEQFCE2+ZPgrguNu9scSJqLOeBVeQm
         yxJtJy2MzHqgm5VH5UP1+uk7htYqhgQbQ1XEQx/9rvboLUb8JEHpWcjZKkCRF8bsXyzA
         gJQflwflywKrJSgRtXe3jVT0wnHFte2WnX0ya4HLhtMUu3C1QS8lgLIUQGhFOiPmZSJI
         rMzcO3IgFGcTOWkM4Cadc12m2xhYOnn/pArEgow+9AQeaHYp4ygjKRryrPp7/HcXBx4S
         cxmQ==
X-Forwarded-Encrypted: i=1; AL+hErGItLgFKSnaR8wGtxWATtassxr5VW3o51avq8nzSNSbfbqo7IkZ8U6v7epGOZOnYk6foZxucebBlGtL@vger.kernel.org
X-Gm-Message-State: APuU4Z+P0pkx/Ts19rO5n605rpM6uXt76PrlGmLZmmYtnRC8BuyKquVV
	DeyT74MszUuNlV3viRuwu0JDy35OoaYhcFhNFPFBkDPmWR+FJm/nKlUf
X-Gm-Gg: AZFdTZeQy6XgwDU6cwUoZWddFJSEXLiwVzWTWwuUp3j0Y/R9ljHE7J07pyyObynfkfj
	eq5BauKNTGKYKsfUigo7yoSMyYT9VS29bpDGO17cLSOjmJlebi0X/iG71LznKJ1J5TmGvmUQmQf
	jFaW0SKqC0rnIHlgNnsm66baTl4xmraSIaa8bJsS3tPBmfLoEBnr9/5oZXA2HEW1oqg39oaPDDd
	6mKi5/++iqIYLFRiDBF7ElPzqaTfnbKWwv+1LeXY8iBP1xfe9N71kK4++E2AzEckkKJEUxfBK0P
	tGAaPNxKuYIsLDnRsdM9og0XJZB9/ykaVWz/AwzBcXyKEvbfNeAnkzWANrA6GNxYbwu0faS04jP
	V9HZtRTKe7acm9omgUwPZEqq8pfy4zi6UJnQuqkQ3gJe2HDIWbD8/TWgIaDpB+rX5KUZwUaXPYu
	suL61RH15ssg3YpQjKdkxqSBKBAdBE9AGvqjdyGOcvEQGJzluirLg/tOSwmFk44H/uxwqxnn0Kw
	KZ6J3nnbCk346QF3IgHHp8Mh+bKPYLDwImYIRNSKqff5jTFcW0H1Jc46S9sRIinohRe10X5h+W3
	uLBF3IY4nt7RTj/YqGUAhnzkMykNdjxMbG19bH0uNxJZ9M8NFK8KxINjNcGA6MQJfY/9DyH0Zxi
	4pM0wPCSflgW2sGoB7KJydGnJaHj3
X-Received: by 2002:a05:693c:41d2:20b0:386:ebc5:4747 with SMTP id 5a478bee46e88-386ebc547e4mr5532315eec.11.1795875335508;
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
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
Subject: [PATCH 4/6] dt-bindings: arm: mediatek: Add Google Tarkin
Date: Sat, 28 Nov 2026 19:44:28 +0530
Message-ID: <20261128141443.13065-5-sinha.aryan03@gmail.com>
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

Tarkin is a MT8189 based Chromebook from the Skywalker platform, sold by
ASUS as the CM1405 and CM1406.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 5a4779d9b..700dc4293 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -390,6 +390,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - description: Google Tarkin (ASUS Chromebook CM1405, CM1406)
+        items:
+          - const: google,tarkin
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.46.0


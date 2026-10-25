Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905497;
	b=ExPuXJokCQ3ucYbKnjzo9SFnf9T9jQ8IHWGWXOD62sS+/stSz3XPqNV9pDjsVwbu2vtz
	 5aXBxBstd/UcViEkkCSG9+074GR1Ko+3eRgVtVYHrBqG2sqVogmj/jVh1oa9H93O+Muw5
	 BLkoErxBosJ4ENIQbSvCeLLXdNDQi+M3x8e/lfEN4l8Fka7Tf2aHf5860UV+bXOs8+CVd
	 GSEVVFTepA2JkGRH2JcyuEdMjKSc93J6bumaMRmujOm/GhRpnspl5gSljJ3raLdL3Fqmg
	 E9liQpxYV9XollgPvSkoMmlBp9xq1ATYoqKhHsqW3lriJFn5hlUZtEP66ssPz5VWTvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
	b=Z59tA//zSdRPEllDqfXIDS1oPiP42f+Rdo7ilzAZAF3zQHN8tNy5cwJzWJBEuMdkcG8R
	 28HA3eiBzI56fxJoSc2xjh+ELhV83MNp4MMxd4Lzn9cL4E2VHGb4XX7O0z4M6Vo8j5eE3
	 v/o0gz1dIRTMmpb+5X8tS9efZciKyyIAuTFP6j7rmCFVFJ63CSLs/4LVfFFpTNhi8qdnI
	 hnT+lR98XEQEWvFJqIEv2Q4WzRlPXOO9DqDEHBY+d7UEHp41nrV6q/GQ6/GtsCx0Rh9cl
	 5DC2mJ4gjSrY2ijpR+3SvpZmEH20QZIMvIaMKXaxgNH8kU5pt2mABAQI0gSqx1BZNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2Y2mH3y;
	arc=none smtp.remote-ip=74.125.224.133
Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDAC606A32F
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 05:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDAC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2Y2mH3y
Received: by mail-yx2-f5.google.com with SMTP id 956f58d0204a3-679b4ca950fso1216120d50.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 22:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905495; x=1793510295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=E2Y2mH3y9BR6KBrsEgj7Sna2sKPp9+kmOOJJM4cqS0AN88itfHUyGGAIFtcLfpKd70
         0xfYWCBIxeB3ADWEVUvcXMz/u6JdJvcoYeZAWWrJUL7Qx/IMaTAINZn93dTnbpjszQUM
         /9IiEjGy3jHj+qDM1OrSblWbhfSdliqBbpaDaqjA7pSM8yBYGBmSJfPPko53WsXhVRvP
         Ohbj/7pm5tYKJE6OQslsfo5/82solLi/PhES9I4mniBLrWzN5/1fnvEoDHMBlnqVO8to
         ahufBHThVj58T43LabKebXpghhYtEzLMpcW3GJNX7iKAlkcRc1+dVtUz+jrpSRXl1tQL
         YXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905495; x=1793510295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=iHLy2KCw4YOtDhgrzbUzPvbDPLWoxqqf1yo/0+e0fCCITv7wTSsEhLkWsuWVtt9FAV
         I5h7h+RONNzVeyjrX+L5O9ALMSYgrLm2/Yr7qLjEFS3T76wUMz7Dh9MIk/aBUU+pUDai
         UtHBrzXYJslnlEQodfSnWdxnZTWKEQM+5/T6ZIrVH6L+xZxj15AS+IOuC0ZR4XRs5tGu
         5iDbucsBSniOdD8oROyLzpPzGq82UDcuRQsLfFGrgpgIv3ymoCE6WMs/+RhuMSk9LaBe
         qGDD6K6UG21senz++C8TBHAnNbdaJH+PL+aAtTgyh8vEs/AReC0T+r12CQKBIb7ZvSqO
         cHPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2iFlwEPmRLW25p65Jxkb9uM3e77ZvVgGVY9vYU9SXqPrxvWxDKVo3gIDlAO8U3pQD5+x0ZVh/uZ/c@vger.kernel.org
X-Gm-Message-State: AFq9FYJyKu2+y+b7GLyE/X2RHPT8n4VNNNx0EVFguefXyb0lIgotLRWq
	Ptx8JPqKEUATMupUC0+kI+r3fygB9TfKGcxVNIRpb5NwFjBBALwpy3ww
X-Gm-Gg: AYBFou2YBTjOWAdoGYyVufxuaGxnSauzNGtMUW390TB5tTT+1UHMwhVfN9uwna3QveM
	okIgM5FbrBjT9thfpZRIMj/aJuSXzP4dsJaBVssS06t/lWrfY+tZsfZ5ZEIWL1oI5B1zdozhFTM
	lSgaQMgKtRMfT7GQ5JzvIToajEV1IXNVk3rjDisM+5FbWRDTsQWZ8VDcCfCnInEwfhboAy4TRzt
	vf4bxyfq6P1nOtgpMfB3aFwNKJSE0JLLmVwCJHlAUrSFcLLX5qGCL7BtJmryUWhK8WTcKtg4e2+
	y1VZ3UuSFTCW2HxW5NfoXA1BLLvRpJi1qlyqRTAlWjOP8fI+dC8RCVb9vL4AlRbJBmdc2jostXg
	wZeUlhQAN+PcFkswj+EQTdJMkkLWfXGK7k2HcQEVQ7x3FMlEhX721Uqq7OdsM9Dt1ezv+voemuy
	rNywzX846erp6VLVuv33Qoi/2K7uYuaHIjEe3yMHMJMZ4EXLrbrJXSVrHMj9d9lZTZkIUFJ8z/Y
	y9evMTx/kBhVzADJLN1wAdn7hiFoP+RoEKJuDI+obOyqQ==
X-Received: by 2002:a05:690c:c4f9:b0:8a0:e27e:8e75 with SMTP id 00721157ae682-8b166c6f987mr22449797b3.82.1792905495289;
        Sat, 24 Oct 2026 22:18:15 -0700 (PDT)
Received: from [192.168.1.91] ([2600:1702:894b:4a00::12])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm16477797b3.5.2026.10.24.22.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:18:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 25 Oct 2026 00:18:08 -0500
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
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
Message-Id: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-1-5c3c7a5a1851@gmail.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
In-Reply-To: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792905489; l=2798;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JdiGQh0KVm70DbIkS0pQKFBLtV68drIsj5z75XBPwxA=;
 b=YQht8FlXebiSXOai3WM/zuvpDL9fEatxuBpgvv5MqOVMjp8xIC+PbWFLP4Kp0ZyoptsaARv3W
 OS3S7UU/Wv5DKYeQ8hVE8LNFldXHmNwewYh+zNK82rW2cP6MJ9/KpZd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index 02426f316faa..b5417c02eb01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16780,6 +16780,12 @@ M:	Roman Vivchar <rva333@protonmail.com>
 S:	Maintained
 F:	drivers/nvmem/mt6323-efuse.c
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0


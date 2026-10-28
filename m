Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203588;
	b=dRf+SZMpuXRUrK4j5J8wCkwbHn9ZLxTm6yw/hgykv19/Vem8XEwfp3+xhfO3uekfOu05
	 AVMCIH+LWKCXmhv6PrlYMBHaFxTaCBYY98c5qCj912DFea7DanTiLT9v425uBw+stUkil
	 gc7ZaRuIadSHs0jQi71qA6nmS7BRTs6nKlHotyY/E+SqjoJNhXEz2l6Z2k9xBuaVw+JuC
	 Ak6qhgytTrJWEOzlJ6Bh9qNkfIpWdQUnpx6YCq69/WjQ0TnVPi3uUiKUyv5MmKqMHNC3A
	 sDjaTOTK4g2bq1DMjfc3VLA4iOVfvg9c4qm/zxQ4SFRHWauaPfXQdd0+GKB/yaNhUGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
	b=RXGDL143lL9pJ7RPHAJdDY3+OfmpEE8ZY0PosDiseyr+puR5vhJfFOHz9hezFmH0rmGb
	 ru4S9H/y+3VlzR4gPjmIoZ3Zt6mOHs8z6PmqieoqimLBYivS5U+PO4bLa0yzo2+jrzD2F
	 gI2W35aEeB+BHRD5pqCicsgT9O0mU49zSJMi12/7Dr5GPRMOn8jr1TvPJvcH+84zLtOww
	 wR6C92P98ttKeZ7sdyaXDTtFataREtQVcUB/brEpN61aPpLx/qBFRPFWsdMbP8x3F/dxF
	 PsmqODBGt/K23yeYX1RGsEaYu4sSWG1uuR39NWxLiz+kIdxKvPsDqRykbKkUm1baCsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="f54qcOC/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E000606B24C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E000606B24C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f54qcOC/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso8021925e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203586; x=1793808386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
        b=f54qcOC/BNNPwNgviROshFOqzIxuWEsty56PgH1QsUy0urArJbS6m8tOujoIIck2uh
         HEKjYJgDS6gAZxhF3RcCvii0/r5qk6ySKJv1OO643paYjrBMTkgd8Iji+CLMgS+nayN+
         tbfotU49LGIWkEUPN8cqkpw0fz21tXTSfmBI2e22W2Vl8ew2kBxo68GuXPQ5SMAVQ2Mq
         Tg51IU7bIFnZdCOXB4UApuCX7LUY/KW3TIg9Yi0EQWnOozXKcih+sWbH1QMd2mXtx1xl
         Oc7Zqo3fDYQPPSMi74tFDN0QxoM3CuiwH3OCbijQB3qwSJoLhBi/R7VhhmkxB3yxvG9W
         xHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203586; x=1793808386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
        b=AXI/WBWkvKbAjknMJhT7KPMSvu1KSe5dV/aW8rJBw4AfuCt22FYK641gY81Yqk97YF
         v07xC227fIPB1ZaknPfECXiUmjh3Upnus/lh+9ee2VMeMqLUwKv/4+pLalpgahBZQkMu
         j7vRKFA/dgAO+5eJB0TcR65yej2xwwYrNg+fT3CoK2hSPoM2EXmjNeR3/OnCsiVW4+dr
         UcpgOlXbC+KmzJUmOCvuC6Ltmbr8enEJ6HVG32BzjWoUflD4BiCu2t45XCAohgKFrRgn
         QWPh1XrLUHUG04VgJrTV0jqH0BlPzjWxttEDootRENsu+3Vn0rOgjHfgzynqAJZBUeH+
         fkgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRhE/+XOum54wuig98m595+/6wyqeloS5bjk41nKphanwUKm9EbAHoW1niROi+1gcIx/va1rNLCZ5q@vger.kernel.org
X-Gm-Message-State: AFq9FYLtzjKwc8O5gMXf5JLiwWN14uG5MwFt6BCIHdTnkMsUuyOwRq2O
	4Z/tsgQ8J3Sz03/SXFhc6qJKFIMNFLBwX/1Uwua773kj7SeHJGn9s/IkkmmNESVZ37ypYDDy5fl
	bUMPwGaFUlg==
X-Gm-Gg: AYBFou2uwo3XNZqd8PvEN5tfpM7gpYVwkInqGU8p9lClYmZ5GVhJkfmxkHeW0tQActy
	zWofiLj7iwFWQnr5xNwVKqE4HddFGfENDMv0sso5hdUWBzm7WkGnqCpN7KLitsiHGRR83IRvQNJ
	bJwCSK8XeMnOgW9z9Ed9OMqPbA8oi439X2GZIvQ6nTobohe3jMM0ArXDEkCNkqVam2393p54fPS
	PJJ39ENiY3djiPTpyT0Fen+BMTYskd1ecD2FgZPOfatNbEFGkcB+WwHiqBSF2Yz5Je5AIhNtjMM
	cx2DXDPTnMMT7/rLJgxVQsmg/nJMy4beIKaYSdAr7Ly6vL/mDr+gIPU8GGugBwKFkJuP6hGuZSv
	rufjKeQIVohY2eBKGdInEoEYWMvNNme+FvjIf2NrrNpqBu+ZCNWsbzXbDp7bBySbZ7B4LqFlEjZ
	edtv7rikIewUrq94kOVzrpPJjZ0YFjYY+mHPG8oyRL1xNadsrsVB8cE6yIryJre7Zw0EUULCXdr
	aLz2zN8I+R8N8XL01MB1jYT9MTddGkA9xyzwG52ne0LJndgr1Wk0TpCEu6L27AbfMM1yiMBzBtL
	VBv4qvwnYepTFexPq4s6/t2IApgEY2RkFzYVm3VLyIPK1WfaZcMfvD2XpBa8qsOzqWDLOWF20qw
	aT5+4WeVeo2F7af+wf/A5gzYaOQ==
X-Received: by 2002:a05:600c:4f89:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a966c4110fmr63881135e9.16.1793203586322;
        Wed, 28 Oct 2026 09:06:26 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:03 +0100
Subject: [PATCH v2 2/9] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-2-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1104;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=h6W1WAoyAkjjjopOOo1a7vzZ6TBDQswOUA1Q/6FeKLI=;
 b=gvU6qdCGfmNuZ9+vLONQblCUNyQ/FTfMv29wXGHB3AHN77+6/hhoHgJy+LfWIKEOD86B1AR7Z
 Hk2Azj1uAdRCsEawkL0a93nWsHJgLJT0KXiPrySo2NVpfiA6SqFhUl5
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.
This changes the effective pull configuration of the dm8168-evm NAND
pins. Tested on DM8168-EVM with no functional impact.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index ee0090f7aa64..261ebca8863d 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -3,7 +3,7 @@
 #include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/omap.h>
+#include "dm816x-pinctrl.h"
 
 / {
 	compatible = "ti,dm816";

-- 
2.56.0


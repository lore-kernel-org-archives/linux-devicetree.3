Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907908;
	b=WiVTkSCeBaYT6aXvD561qBoxFSGKgg/P5zHhvAdQVWxNRitCxD+QmnQVs9rO73FTX6K3
	 LivQoOaGOh1Ocxcb4GEzNQfBcC2ZdANWnpUXVAFsex+HLShkexwmVvXbjVFXHOv1hXkkq
	 O5rl9gWgycp60UGn6nxox4+S4x39AMAsiQWZl5lsOGONqjwV6C9Tqfigr8q6ETPzHjHad
	 gYPBvrY/W7yUEA14AmA8Qeivq/iBLOY10hLqRwEIIxbdvfmf4pcaANUrYN/STyMoazUXn
	 OrW/tfKD1X26jKStbtAIgTlp3+qhLxNt8Z4tWUyXzRKw3oTnDkPuCWasuckiYns+RuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
	b=fZs6ltGqDaFxKfS8jVD1vjsAcYCK2K0Rm0lwd0pEYZl/WMQQ+E/HMaep3iyXlptG67uT
	 HaCX0QEg0AR7CdQ4FPp7VQoPqt0d8g1Ibu4+msuIbgPdE5Fq4p8P+S86Jl44COa6WeMEL
	 CTpJdpcJsrbJsGbmdzTfqKp1lmGY8o4skzg8xsRzLy2CdUbXG5uYqrUBcn4STQx3vxW8K
	 KCoJG+QodN/6zediFkdMKW/ohcohd9DEdPxcrXQtholdPl0egNKWEXBMJJ4hfRuL0DuQm
	 BNDCw7Ra4FeEV3jhWRl0ntVQVPWyy3KDhE1e9z4mXGwsBv6TNyeqpF77WQ/0vzeGJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXvGOO6H;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D5606EEA5
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 19:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004D5606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXvGOO6H
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14591335e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907906; x=1794512706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=fXvGOO6HFchZghMJ/v5+oavqAdwYE0FUczZPmVcjMiUsOmN8ET9E9lp0Bx2YdISBDs
         roUj3howt7B+J0uMVmcDh6WdKyZyp3SC7N31jGFtIHav/6hKW82Df2Kt02OjQ+slaZy2
         GsF6YUn4Nc+2weRAUGWJUtnPQRyrdkU9S7C2rLRJdWPNsTqni48qtxvlr7wYLCedQJk4
         F/MlCN9qRxnIQrLA3yXNoiZi1rzI8EdYyyZK1q5aoId91yTE6UJOx83RTNIJz04jkpuh
         6wq+U+O0kEL0B+qvjVs8yunDGqJ4RV+w38VGakbcBHiGjBXWu2u4+misUTWgqfRtJyn+
         8iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907906; x=1794512706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=k/h1oc1vMzJgBN962ZpTH2dRSb0BOHb+5G20eYYYR/nZHH3N8xM1LkKVkZghQMdT2X
         wdSn0lO8humguMtKUa7r4HIgEjoSDy6B3HS8vHYHUKRHmPvMXmwHquB22eszFn4sTH/1
         fCl1V130Auxv3c44R9aZ3hGX+t+3sYolfJ2hQ+5fKhzEFeePazNPS3Q/JcYgodapxdax
         c8ObHzZppPHcN/M0qrKgRmJhxC4QSQPNGXdm7ux55CXQYbTaz/qhxx6Uyuj9eZxLE5wZ
         2w90jN+nrTffyjrQz8Cd866JvUQ7Rn/s8ACXKW2urU6HlZLAKlAUyLsxKO4V6TJ3LMPt
         yzQg==
X-Forwarded-Encrypted: i=1; AKwUvBwcCCA1T8MI8zZCxDBQ0EqLMCFgPG/aTMIFWij5Cn/GUZ7UVTlWZpQNDIxmiScGJsckssiIlUWGw5wd@vger.kernel.org
X-Gm-Message-State: APuU4Z/OkmWUHnNj4V9z25qAm2OuQMnxUHzH1Y+H0dCD/HeHCFZ1ePf5
	Sdo8Ct5MaCbu9dc2B4LPIPDTlj5STp/tusZLfMQHHhRnkp1BwgjDE90D
X-Gm-Gg: AYBFou21fla7y+AL1WlVXwc8smijUWg0wSrsVB8htQ9XsOdd//Om2ZM2lmv5Gs6iTlw
	H1ZMXtfeFdH9Pz8CWNf1tpawFiUigp+fSvVWPFsMcoKpmdhEp4m0VtQIisfv21/sglQlHn3x+xb
	jUbXsDiICi+bI5rdxoFowO2bw0KNxCj/VtwU9GnuQNur2oJyiQocAd5Bhh0rsbHP/dfo/4khEhr
	+kP2dMZZdF7X6K2/MzcvbtXGgE+1TOnsPzCyGfNd8ewPrFjOfUMa2baOb+6Jj7y1pfxfS21DBNy
	tBUPg2iD1BAXOL2il40RU5OKPVpFI7RlrCsX5Pjh0WLltrHi/zE2IpM7roGlFrNLm93iXm4eTCQ
	7txjLN7nzUxyAVyl7GqCaNR2ameZUMM2o3hy0I39eNiMVLsyzAiJwGPcdyEyCp+GkeXlWhYNsvO
	3dYpEhkQisXO+2QQEKfCdLr5lI7ep+Atbmq+CNewGRC7psd90XeE6gRL6FHx5GUe5UdP/d0KOun
	Xk5FwujOchxCUuj+1W8d6ZGBjIku314IZXcN4nGJi1Sm9mH6Gwc64I+PLmcF8SL+6e7RP5zZHFi
	0rB/ofnJEzdzx93js5k7NJRD
X-Received: by 2002:a05:600c:34d5:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4b6db1c5e0emr3268735e9.2.1793907906381;
        Thu, 05 Nov 2026 11:45:06 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:05 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 1/8] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu,  5 Nov 2026 20:41:32 +0100
Message-ID: <20261105194426.1113050-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..8ecc44a88a14 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -75,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -111,6 +116,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


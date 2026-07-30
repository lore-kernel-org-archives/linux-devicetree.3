Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9741A3FA5D0
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404110; cv=none; b=pyDqXGQey1/3v6E+1Q7sSITZWJOn/T9tSsbByWCFOjJumYSMtnY6Ppfp+WOxeN1jTZPB3SyrLvBpAhDMIiyIQxg+GQVl7rigeWcbZ3yIKvaMVnMoYnNLZBk1/HeHmv5d1dbBYFmikheuJ/65LDijNN8NW29U0//qu4kf48NZJe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404110; c=relaxed/simple;
	bh=Tjd+qqKRlPATrV03pdQqCuwbNQZAlKYm8gvQMT9w2Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II8FyFgksWQrhNAt9jQD5u8rfy4tVrzf4SUTZYcVZPkBJJAgSm4ouiE5kTapa7oDVs3KERngavssEJo6AOZZ14S7z8XKifmjkO623IxFOvpWYjg0DDtYLuKoR6lDvEcvCcCPxzzEyLUunjvGFp5n6WO+Gq3xBEnOQd2CcWmvaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2Eawk14; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2Eawk14"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1f5208b38dso360977266b.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404107; x=1786008907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=G2Eawk14W2Wxzn+5rau8+r/S/V07rV+gwAUQEWin4ziHjuvGIk7PjDpbDc6cI/5Afi
         1c+Gfi/oowW0FVuUQLhtAx1mhjYrbLpVW2+EpWHfRnYyWPHfFr6beET/jNJfuUvIEbIS
         k7I7L0TPB1WVkpwZiPKhb9qIi1CGt0ILvp60OykAhCMzZ5xkHmOEmvSQkpBulpSzfJXn
         9ejkpK1H8xFp0FQW88ggsRzzgxkwYDEZMSH/2xvMqc4xOSg720SK4Fs1tILaEgkBWMt0
         45PktRKzvCvpjX9vzcu2hv9ZPVwQA24JxhqFfpQBZPHcT/MXEvQ95G8ebUWcwcr5jVSk
         2L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404107; x=1786008907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=jm9ely0aM6P0ofmm/ZnpI2Djy132DvOMCNYzqLMKnea2X/qHwwr3U78IvBggfLR9dq
         2IQ9HhRlwH+wLw02rDBGAj3xsgvNFnNi5eLcwZkW2eC1HJXjDRSnfmuBRrLTuGMM7tGX
         Seghb6YpN6eXRbyhHdRuMIeQ3GFCPWcs/JxGGfoDzhG7g8iOWrxlS7L+HQ0/U7DOAg24
         1ZyTybYmXwYl129co0jRkcowpdf3uzIJbvH49c0goG/Ab+xg3GwC3/9+7yo6V2YtDdSJ
         mcr6LzvIZZpw1/a1OfVyyQVz1p50EuI0ERtouHiu1JQeVz1Qbis4bf8xpanIIDR+GjOP
         tMag==
X-Forwarded-Encrypted: i=1; AHgh+Rot0gZ5L7IYTsh+cUBTd/19qtkREbJhzO56qMBuT2yHbGAXH66WtnDFTMQH2LpjQsoN8sb/LAkUGmZ2@vger.kernel.org
X-Gm-Message-State: AOJu0YwCc0UOWVn+QHUfI/vjUCuIQS//TsMT2dZJId8zDEeLWSIRxk5v
	Fzms0Eysz4oPgEqHKkqwbl809lW4sA9WftuAd5rXeLuWWrtiTiUDPpjf364rRHrB
X-Gm-Gg: AR+sD13uSAHrfImK7I6gNJjPhN0vQQSRUKeKnnhO6ncgTAaLrZ0ev2NFactZMbHqP25
	e/nJADA38ST+wcqZHoj27MtBYomwuyL1RLwIoj/CCXQEnR6CtkrFgUfjIzxwrRnBw+qS6guY+ZY
	G5uwojFGUr2AY5XTCeaSIHAS+SaamvLrdM8eiO0it8YnAinrZvdoOhQpZXma/HjRtt5hso/4nyQ
	xFhKV59lqQQ/q8myjD4YrnE/WT/qtdE7LwxfIPW5zmNvb/8S9B4OEvagEXaXIBiNBw68k8P9gS1
	xx1irhEnuXMEqws8OxR1j9HPP9sZlfrI69+ij0fiASjHuztw0IO+Zvi3kJ1TCr9DAfDeSL0uLmR
	Bg72lTArLaTkkyN/SPo+HbaxuvLw0zTd4KZxjgDTVSeHxNgHzv7QHC9sQx9WxrHsr8neJPdC4ky
	9hTYRpUutCzZVtu+L7vTw46KuZrJAmViz1BLWzqRakExXV0ITS5cmkf0ij8TryEYLhT4JqGybin
	OO5/1Pddn08q60eY7W7Xws=
X-Received: by 2002:a17:907:3e95:b0:c12:6d26:1ca with SMTP id a640c23a62f3a-c1fa5b8c45bmr96855566b.61.1785404106729;
        Thu, 30 Jul 2026 02:35:06 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e78sm46733066b.20.2026.07.30.02.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:35:06 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
Date: Thu, 30 Jul 2026 11:35:00 +0200
Message-ID: <20260730093502.689505-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730093502.689505-1-zstaseg@gmail.com>
References: <20260730093502.689505-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
battery manager can be matched to a device-specific variant in
qcom_battmgr.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..8ca057c4e3e6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - qcom,sm7325-pmic-glink
+              - xiaomi,taoyao-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
       - items:
-- 
2.53.0


Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977644A1E02
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050234; cv=none; b=qWaDqsXzBy5BNUJYHCcvk1FxZCv0KbCTVUBUwkT2+FdP1RE7SMQvnBeqZ9a1Hi7H+vXm8/o/dn3Rfy72klr8L8R/TWbYXo/0/35hv/9nLGI/VTAJgL74qEjQuQpfGvgKljpUylaJ1VlceWWDzo8WCXfenPLcOwFrSRuYCVNSuWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050234; c=relaxed/simple;
	bh=8yWgSoYjBSNdU6Nh98oDiJF/XZdbU2DxciSxWFyxDpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Df+Qb41B723f7YotNlW3435bId0UWLpxUk1SyPvx+UO7Tsn1fLVq1ozMuDb6t/7Gt/XadplVouMUL4ibilA39y4VidmpwIBlMkNjWTQmZrFpH8LdGcCFxVGQBRlZCqqFXFtlwhUHW60+akMo/kvjHhxhs38pTsQRn3uaau1/Z3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwBdYDLM; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwBdYDLM"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-918a81965d7so8119006d6.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050231; x=1791655031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Em/JfgIRn8QRBLzYv+qkJFEh3n3+7GlE5/RkiH73XY=;
        b=pwBdYDLMWebcK6aQIGu389+dCMLnRWx9Pofb1Iv4kYQKejHBzsG2bwHw523N8+4kSC
         GXaTUHoH8ZznN3alstOAi90QMJSXCXyeKApnUq/PtdTDHj1HeJXyTA/t9Uv/ZoQAb1QB
         3YLMIuPOS7l9KWeW9Muv7ZS6J8X2yNqJRFWeI4rHjfrY4EvXeVPhGwyok72jvC7zXEvk
         Go5VRKxei5RTUdcatBk7vldylc2od55pOb6zMbMMrdnrdgC3lLjFfyPWjN7rYyUxhMfv
         ljoJXmVfFif7dW5tVnB1E4zDKhdnHX6Yqwua2+U5zEZqmJDSayq3mXK7du3B3OnoMf1Z
         MbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050231; x=1791655031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Em/JfgIRn8QRBLzYv+qkJFEh3n3+7GlE5/RkiH73XY=;
        b=buUh+TDNoRgkvRrgRNPeuqwjZMf/iuasQutdDTivWjc4QFf/zOSed9g2HWjOGazkdu
         JJ2raQB5TzZN/vd0BiLKPepKhAqO5Y6Hg6yPJ1pw9zxAQjYgVlJtZFvJg8faYWnm6C5z
         dLyuC4azclkp6GhmilXaI593ByiCx1k0K7AuZJ09A/1t7AkGPWLGBmhm4qI8mPxeXOWv
         QS5ANw7D8pgqKxjoICITsp5nXUhyeHgZh9eIBegTg9/ETwjW+NPuqd7nLC5AiXLPmTDb
         gsV/ionp3j8Ch94clwku6tD1l438JI2efcTCjnuPgJTMYwNVG4lN1ajYvD74y111Ttrd
         rI5w==
X-Forwarded-Encrypted: i=1; AKwUvBxCwFQ0u9hvYr18VMNCXa0mHcwlxBub8pok48sHZHj6u8aOaQk3cpEUSBQ+mUxuyzYpIxUhbi0X0wVg@vger.kernel.org
X-Gm-Message-State: AFq9FYKhIsPjByx78P9y0mIrnWMismnlWNRfeKuUiWjWki5THgDim6f1
	6DnJ0GWS9J2tELoZZNJ4SOR8lhzPjgriMSgaqUbdrCLdMViDzjp9kYKX
X-Gm-Gg: AYBFou1HVC6MmnsmZZtF0VgY+RY7EYXD4fDYvbbSeDTPxIH8sg7NlUqFXXAO8XFjbEW
	lPhkOghE5A5v8hKDNXW9tgZJjf4g8jnw+4+nGo0arqeOMsUm3XJtuhezTI79mJCMXR3YWS9qZVo
	36LZ+D+SaR6q7/LZaWCk4NafjT6PznIa0MTdKCtRQGiNA062rJhhxOBALWCZMTwcpKU/uzvBcxV
	/wK4s1eze86MPm+fdRWGa90D4AI8XRBScCyXHh1sTw7SXDxYT41lCTYzkoG5bw+868Xal/itWu+
	P+3Zs/keY7U57mK/oGSK8y0+U5Fqmh55Oj+epjYERQX3m5oFkpYeKFYqRs4QR88D0v/xBf1r6Nm
	e+Fc6ZxOUKREY0sM+ll+jKvOn8iJW5JYaGhS3vs1k7zq37ydVt/iJ4qld+IKoW0vJbhTEDJD0q1
	Xibd8wy5zMz6cZGAdjknP2dC53q+oXhBw3SImqkXP+ebBfMHYFh6sBaUEsvOT9h8zmKDHSJqgiL
	w==
X-Received: by 2002:a05:6214:1c0b:b0:912:340a:1dea with SMTP id 6a1803df08f44-917bff2b122mr122876166d6.1.1791050231430;
        Sat, 03 Oct 2026 10:57:11 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b691dasm49017826d6.23.2026.10.03.10.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:10 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 05/11] ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible
Date: Sat,  3 Oct 2026 13:56:53 -0400
Message-ID: <20261003175659.23536-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM670, typically connected
to the sound card. Add the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index 33bc23b6176a..b603bb6eb9b7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,sdm660-wcd-digital-codec
+              - qcom,sdm670-wcd-digital-codec
           - const: qcom,msm8916-wcd-digital-codec
 
       - const: qcom,msm8916-wcd-digital-codec
-- 
2.56.0


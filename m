Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD573DA5B9
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985955; cv=none; b=S1skLdZTMP8NEDOrJwiuZrGPV1Vk8W4wXoVfw1Fg7rZF2qHOkQrPw3UK4QRW7dOCnj0hyWm8j9tpve/Byo4NgXECLeaimMoKcM3MTKa8L3EdC/cI5qDOGtrAMcnMHQMkYrzx8cTDVB4LR5BYnA+fUjCj/mDcRwb+CXedbbWVNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985955; c=relaxed/simple;
	bh=XoJcRcH1qRXDO2rt0HAsSwjISCQOqSy7joomJfQRkRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMXurR4S5ivz8chPLTeGqTXo66oR76IU0IQ8gLGXyzvSIGGCvdSin0HgJ6mHB0UwV0RPiJkhl/XHOrzNwkfnqNjGrXzeNPRKCysDAfqVMtd0HQx5LK/Fv+zB38tDTOPLAQD9n32Z8Uu5/nPz86AD/W0e9j30Emc/7R5sm/QdhcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzC/B5i7; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzC/B5i7"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd7c372929so654147685a.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985953; x=1775590753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGaSVusjTdCGe7VyTkv2c8UnvdKBcLIofqJcIfpcrTw=;
        b=kzC/B5i70YXKgBo+cXrpzeyCAJGiza5y/IWdjPrqeWBwLveatXeoRUylDgC0huPIFV
         ONr6vOiMj5AQAtM9NXhLh9S9kdwfB8fmtpC9ImoqgQy22bl7Gta468J/Ev4ASNdkuxdt
         9EkRumk+AHxHxU5joEO+SKUvWx5ROfxjgcFv+tfB6y5s71r8McrlSgbKsGXHM3h4o3qK
         bCo29PPunM57IHM6MSQYfTj6woWPxpbGtliFZmhBDSNiPziTzYHTrmYdhOCUGsAeyImO
         VIKc6o5UqPIboX3fyYMoJTUIt3ENqjGPtEnPsPtbk+9gbvfQJ6oRm8nvGMnXlrHi0WPs
         QNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985953; x=1775590753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGaSVusjTdCGe7VyTkv2c8UnvdKBcLIofqJcIfpcrTw=;
        b=STP3RgQSoerW0GJi36Wa998HG/yJtq2j+ADKVh7DcuFM8p7QBOM8KRnB9/8hAmCr9h
         Bx0KTVh575tyuZ6d9RlPxBojqcYROnrQW/eevJiI3eMTnIHLjtAqUUq3xCNUU1NGHsLb
         CHD/ZDgj+GrQxrqkTLFKKxBD56G0Pe1UYSlkG/06x8dn6Mfj0VwAaHTYuwuNbJWmh0nR
         yDf1g6gWD0WugHrAQcKz/eSMNUO6cYy6FHh5sbAYEWcV3icdD2F+MYgyRCO+wSSfo6pQ
         INpJZmdf9lkF+KogQay2fbuBy/kpNE4dvuIhfFvImb7zV3PoSgNR4z0/qY4kWpvsf0zo
         +bRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfaKkc/KmlL81R3qUN79p1ioXWq0b61SXEeVt6TTpgqdoeGKHlP8xXsnKWbj9nBvGX1o25qAisW+F0@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5lcuDv4MaPsOueeSrb7FJdla6pVP0ClP5UZvb2VRbh/yE7dA
	V9OBS/XFpgwPbZAOofidzlCuYS4ir5HCtKpuzew51PGGRpJ4EqW/FPHe
X-Gm-Gg: ATEYQzwRYAFkev5XiC1Of4EbPPPKTcazmk04dhhoaJBCgBoM/A5hwGN7pmagnE+5WeM
	nAM9vw46vLCy9DE1kIa97Wsbi/Bx5Tnuke9L2xMaFV8R69bYObKAHYt5dOYX9nZ7HcCOLzuhfTu
	rlvs8lNnqSHWDi2apB5r1PS9hNyAmH7HOPaX09gMfT1f+D/kvchBETVCXoxrxFnHWd32bemFbMb
	ihsGzXt+6QAT9tX6umSCSMrQhKRW8JW+4QQrh6IcKrx8puiD1hzXGDC6M4kHZmN35HE5nV1Nawj
	0UkuV+NLWqIpbsi8Y71CYaopM0gBJFf2vcMscfnNe0ceZuSA/LqjScOdidJErjg+OgYXz80s/1p
	TGw3jSvBEpOl0ulqfqaaODmDOH2n+pRKydVYPWEJ9dNGkFJikAefuxbiHnRrEqyxm5ULTJiR6lO
	n+qGSFNW5/yqBC3zhQWSHzwW2G
X-Received: by 2002:a05:620a:2a08:b0:8cd:93b7:ebbd with SMTP id af79cd13be357-8d1b5c40efemr153898185a.60.1774985953297;
        Tue, 31 Mar 2026 12:39:13 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb7ddsm918603185a.9.2026.03.31.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Tue, 31 Mar 2026 15:39:28 -0400
Message-ID: <20260331193939.40636-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..074a20cda89f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,10 +14,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-wcd-analog-codec
-      - qcom,pm8950-wcd-analog-codec
-      - qcom,pm8953-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0


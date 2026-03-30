Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9593DB62F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889191; cv=none; b=PWRHwJfskcY+zI1mUxAZZPvyfdmntaNfJoHOgPAVWkqorW81qV5SWn2ztFhqSlBqD8+s8MflimqO/5CT3wtnuj56RVMaaqJo67kjJItHKEpyGWXX8HMNBknfme7/twoUe2ORGpPwKgcAJ0KSMqT/U8l1jIK03/ihjZkMBJTAIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889191; c=relaxed/simple;
	bh=F2jd4YlfKNnvFt29JpBxPwcNHTeYzsN7X8O4lT8zPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJ1/UsRCti9mw4kdjsN/LoJy3N6RQElWb4dxHRT0/yqxMryRd2JmlrWNASKv4YB4xy5GwIHykLt7A/VBOc8YY7hXIVxgId4bKee1y5GRbjGlqnaylO+wisE50yh9hrxlYPJnY5pq4tVtArd8bPznJldPGUiGbskFpHdFP0I//1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kl3DTUSO; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kl3DTUSO"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89cc84c7768so58107756d6.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889189; x=1775493989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=Kl3DTUSO3NA80db7IqIuRaNjKikpPu505+SXwex8tv0D3uKUdgOBTWQyxiGHdfZvXY
         ip3Ua83vMetirgxF8moIsx0AtR48HqQ/t2gjmS8yhFGic6WmYq7eTX5h+F9pWCIYaFX7
         rR+EEM0vNfk+8k+GAJY3hGb9c8L/5G3/wTkOmTHbjv2Its6mehI34xuGZjwxX0U/9oAd
         klMvUF8/otYJ5VLogfLp2Zn1gFcr+E0Mk3ETj7orpHdLW5yFBf48+WsTGjy2InwLjTML
         5jxvzhbIwmVH3N7VCG8ZT5h7JzK5r+vMZfarLqOSB5RCkyq8V2tbGr/KkeIMPnKI6loi
         q4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889189; x=1775493989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=WbtChAInaiFGiC3knnF4wRDsgAvt7RQR4zqZpheK++UIAS+1eFReLOwDgjPM2gwj1M
         kmI7qjxZAt8EFEb2LLObHZpUu2QXSws1WSTifHNXR0nRigX/VjCgTMqJARWcJTaBrvQE
         rlsxTUaj2AaXmngrQDsPmDbE4vkkHnGRp9KB59P0d1yXbzc5MUCKeqSeMuxN49upIsUw
         R1fc6go5HDGAn4c1F55Muzx96ieV7gWrzM6N3y2fM6KHWNlSckmc2AvV/qQugi/9Jnzj
         K9gy5kEt+9Wy40OytoHx4ro3HrClVMyj1BzWEk4n2lo8QTdcfMnrEpqtDPN1PVAmLjZZ
         O5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUpFXi415czn+AR9MgGjC4Rf/IvCWQBX9s11ibUV3sB+gu1ONUr1bp5Z9G7DhFl9S1bgfn6dyGmtl9l@vger.kernel.org
X-Gm-Message-State: AOJu0YzhaEMT63nf/RC4Wws3LexEu/MgqOWUqU1LvnGheU4BEsaTxRLH
	06SWx8uJLkKtDOTUfu96pr2StG17DbQzHCiWESnXqPgWiHGRlmErkYyu
X-Gm-Gg: ATEYQzwDaaUjttElhwpnk6GrjkwMjBqSucCq0XBK+6j/MZI8QPyP5sTLHi8DvTJEL60
	6ejjBVdefukE07miMoiRyB6TaCDFCUB2SZT9MyCHsqWR2twLWSJZ0yWylpKL/VF7qR1xGfwWVSv
	OLmUomxlTMXQWCfBmzUX3zOSjMC4IMhqwLqn4IwNiyTWraQtM+KryPySgfIy+VSzdclmxeR/e7v
	wc3bmsFK+Q6/tqdNnGpMfbmYjKVedTCMgbsUgR3Rsy6EaF/jsJTStgDtO7KDLqlW1EensymDGk6
	uzTjBfGr2DOofrukxuunINNGtBtQmgxYOPEfpA+TFw3s0nVVkZCbVDCaeIymRvQTlApGkPQjd58
	/rS9eJGjk3JbPg24S9Whhd284ckUuPaOElXcO5NYqeHp5Rbdikh9MoAyFH/oISiSWnH63blKp+/
	mQDSOaO4V04IsKzXPH+zorAYE=
X-Received: by 2002:a05:6214:3f90:b0:89a:116b:e67c with SMTP id 6a1803df08f44-89ce8f05976mr186499446d6.45.1774889188937;
        Mon, 30 Mar 2026 09:46:28 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed051fdf6sm68357436d6.48.2026.03.30.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:28 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Mon, 30 Mar 2026 12:47:03 -0400
Message-ID: <20260330164707.87441-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..30f93b8159fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,14 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 30
+    description:
+      Pins can be reserved for trusted applications or for LPASS, thereby
+      inaccessible from the OS. This property can be used to mark the pins
+      which resources should not be accessed by the OS.
+
 required:
   - gpio-controller
   - "#gpio-cells"
-- 
2.53.0


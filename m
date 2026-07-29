Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C1C47ECDF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334361; cv=none; b=ekoXN4aYxRZmF3NkECjW7CisQawfmUY+VZ8f3uMHtJ36h4tC+1BQvKAP7HTz2H5pL05viLC5KCrEEP2lYagtE2w0g8/i+dPni9tPvpP6wEt7ylEX0jdhfmm/yJaYuocqCC9BKlOhavTbj3NB1BXgAaxwtmXO5h4CJviu7DJAr+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334361; c=relaxed/simple;
	bh=UCbnH+6/C3pJGeuYQOZxmXnB7Lh3f9PpRj6L8GUI86g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJ70dYO6sBk3yuzmMNpqrSnwdgtiMA8bJEswdsScEphWDE/yhG5g4DdKO4uqBLd/pyXSQ/Zk8BN7bmMGV1yZjXkd2U6lHXqo18ovj2KGHB8SzuB8+PD6u+mH3CI1aQC81tiVOBo4oetfYhlvBwEs+7fUC/OXQOu9h+yP/5nsRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW4ENEtg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW4ENEtg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49558ce01afso7029115e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334359; x=1785939159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/ABHH261kAcEZtti2TzXUxz3ZAT2vqzNe1BRxM87S8=;
        b=EW4ENEtguFWHxRxJDpVblFELSOp0PkmOosKBpERFqozZFSUJP5ypi5V3a4ptVPnZIP
         zLrTZ/pxlwxVuE0NLLrLv22/KaFcG8UT00BH5DvpQ//8IKNThnei907AyquHGySwL6zq
         Yf2vBQ3ct7/ipOPMqkyEnRw/SKbImQvqpBG6y2sWg06B+NMA2C/EEwUPRnUAd378Qpkd
         NXb5scxZ0wPQOw+T7U0g+W1iRDjKjdz1/Lrem8moEZ9AYjJOMejrAaFfBbJJKRpnx3uI
         LN4NxjgB/sGbdzkX6Cp9MEJ9O47NpfpPdKutJunvX2TmuCy5ltLhIYqwdx4FiULNdvZn
         iREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334359; x=1785939159;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ABHH261kAcEZtti2TzXUxz3ZAT2vqzNe1BRxM87S8=;
        b=Cbm3Dc2+lA74JvmkVHW+7v1/GMZTvgrDFalecTZYekVPpnrEwtX8SYvf6LhSyHyXg3
         FL8AHG9jAX19U1pM0lFd9BWHPVvVhP0Nc7PyeXAtEEvCGO5AAPQJfI28Zu7kRefx6dX8
         mKHj4V5Ef1ZBvJsiHsqtewGtT+3IWS5gAo30yaei7yiPyCOS79OvNuuKJrOFiNTE42BY
         b1yxi1ISXXI75ZCHrI/8hs2rsVkrQq1s+4FFeGCXLZ8brqbyKs1Trb/EaBwR7kn8wIX5
         0XU5tF+GYW+BCAnZjAnLW2RhdivADChiqoOO4HAO5irVQCqV72dz57nbtdS/z9UojVy8
         tezg==
X-Forwarded-Encrypted: i=1; AHgh+RoPl9biPtjoYZgdcivBJhPSdO0utpIhqyLKUZovOa3siAqkRYQQ09MZ8IauuKy0bvqrGFfWRlNCLoVj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcc0aZIOfafoMs39b35cpSUksoVLtOQzCJ6EzPdkaUrnCwy5wz
	GZTFSYRrqeh/MENqJaqCits3Ups+PxAVMj3p4lhDukQVRtalzh34VwhA
X-Gm-Gg: AR+sD1366lwaOvxe0JPOnJ4LpwGRBT3LyLbhhuio40o9bZvDHaA0PO5kg+SRsoH4eIN
	pN9kmeXBTXFXJtFs46ow+739Hb0snbXcimEbNqKdnIB/vEboc6cVL59ybU50n+wZmKONULVImb4
	ca66yN+eoD/oZDZObsk9yPocEFizyRv5mQIN8wpjFw91UcOOLoJ4QnV7B7V0QA1nwc7xs3ZXAFv
	wp0KRFM8fsLTOJiwuI+mE2ddYLlpxJT+VeLd38EyKKinRSuN3DuaW1ADVDZ8TG+EgOUwJRsTwIc
	cvXXrj3vXl4Noh38sOIDRK8tVZKtRc8jdK7IUXtZ0lpF0WqrwWfun93e8YShnAnvVBuQLn6PY94
	+AdacaLZ5KPPD3Ne/micU3PcmM3TE/kqZEwBtlTn6yhVzvCiIzCCTQB0QXe21U8Xxmm7hrhtgiO
	MHCwJt9tvmezt4qjcwmu7/FiRkoGyVIOrZ2qiruHf/M+3BTnlp9DXjcjquk9jXD1p02IvUXmXRF
	EXcXLMCsDXiQDSCkf4JnQ==
X-Received: by 2002:a05:600c:1912:b0:495:3b8a:bf11 with SMTP id 5b1f17b1804b1-496c6577941mr78545775e9.26.1785334358491;
        Wed, 29 Jul 2026 07:12:38 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:38 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Wed, 29 Jul 2026 16:12:32 +0200
Message-ID: <20260729141234.65037-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


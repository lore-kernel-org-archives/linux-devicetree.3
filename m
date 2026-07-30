Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB573AC0E6
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433462; cv=none; b=VVKIaILR36PAHzWzF6v4SZwP3Q8ucn6X9cJgj96kSPcjmXCSbtdHYQSnth1lwsnwdDfor2HFzLn/RS89sE4j4GQs8xBUjasIwCCZ/XQMP3Ty/wzEKAjthq0jQcQbcTGMUVHcfQ8Oxkiwht86W0eHIrem4RZ1lrdq77mE71LcyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433462; c=relaxed/simple;
	bh=7kIt3VDOmhqDwU+Vb6EyEntTuqJB8bsltDHuVoseCHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDQ3Q3cvES2+yLisRhAxrA76wTOCxBKXiBv6vGKAsoXmxa8rV1XDqaX6w7je1lhX74OL/Txc45/X14tOlWxhV+9kHAXgcDGeaqcUGI1Js7NVAz2n+OKDpNDjdqPtPZaEx3Wm6snLN94E0Wmu3klZSWbVxEv7qWjacT+z3fETR70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7lRthR3; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7lRthR3"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92edb12cdf2so8507985a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433457; x=1786038257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6pr9y+eV6Wrb9MmFfo+z0pmIGyd9l991e5f78BS73g=;
        b=b7lRthR3Fa8uiXh3uKwNdWGnR47yN8/K9YJyzM2IpSYIqHAHcchyERCWAmr0sC8Q2z
         qt6IsW6I48jVUCKIozmx4YXVUcncDPUpIMnv07kougsXYJZyXb5p316dlLHXhW2wDLgf
         TgWLZA2BIraw9EWeGOuWd8e2VWrvCVulkv5JNOlBc/UBkO+sDXHNPS2wK9U20Yj4SW9E
         vI0fmu8NRVXyoA8IkfJTrGAKW81GVGKp5Z8GQt/lbcFXzapS9WZtQXbjPb2Lvmhrr9Dq
         57Ss8u/DH6TL7ftpjV/9l3jlnWpLtgQVjx1LH5RIK2/s1MatiUITlN2XiBdPfW2yYZjC
         TUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433457; x=1786038257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6pr9y+eV6Wrb9MmFfo+z0pmIGyd9l991e5f78BS73g=;
        b=l5Mw46CLpvq8OwabugBriD6iiVwW95K8OnJ09eFezlpVE95G0ZBJNEtqyGg1BG1bt4
         fHAFzfJtvQkSm8lFzpj9YMADBSOL3jRtaQ1XCCJqGbGUWWhOLgk6wI042GFG7Kabzu1R
         iXTDOb/1dD3Da2ZKeZyaFq+t0XWg0RHN1SzN0lhbzvlNU551H9l89e5hhmdaQiwMt+7c
         dFZjIVDZ6qp93+9v33J/1FJOFbBgmyYCrtYVPhTl9HRPbku12k+q8d4QryhOyaOeeke/
         rA+l1BVG3q88LkrWj8AWEm+LTXEs1pa/NnjwWllaBU4njx/hAlKw46d1kjqIDiYRu5SL
         3b1A==
X-Forwarded-Encrypted: i=1; AHgh+Rrhf+LE3/89nzKUlUzlfiylJE71YJyq81ZFn2/n4fDFZrigF4H+uK0JGn9OzlaNT+DglYOi4Sn7rTE2@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzJ1TxjLJ4KQUMZzkwgPRryQdNz/ZrOpEQB6T59ynoh5Q0xzo
	ylRjutAOJwu7yiWG3gOtES8anXoSWSvOOlZRJUPc7OPSGtceVf/6f5hh
X-Gm-Gg: AR+sD12/gQwK9n2lC3ukegxiOp5up9Zy9CamOGlpUfece3T15yElwQrLD05TNgJuB1q
	1IU2OfPUcEUMJy9/IfWdsxOvdhHP6qwrArNPlDiR0OWgaDYLJRX+4UIUr7Q22tHJiI97r9Dg2KM
	O049iFc428SO8DoQcPIOx8cTEMUS+AdT43xuQPUfGhfZem3VZ+WoiSiHMQWosT8NPcUblq17n+0
	wXNUaPocoYrLdirOBQUuAjJtYIGL96iVcKLzsP8ZsVhRaSw0k6dpcPS1ZQFBkOJK+4A7DppmyeR
	H0j+GajH9/Q470k8VepOouju29ROs+CEzZ+redlaSgxJ8I+nVA33p8dE/oEzYXZH+xE3JVCXKJJ
	iQsclshz+ufy4ihuyzaVI+gB9z6VnG9Drp3e8mF3gWNVuPE0bylZQsmeCt4ZEu1c+fsHfS9aCPp
	zVU3ifJt0nNWZ2lA9QcH5hDkS0MY+enG1CoDNol/w92w3jBrEAelqiPiLCbVU=
X-Received: by 2002:a05:620a:a2d5:10b0:92f:bed:e252 with SMTP id af79cd13be357-93486af7b4bmr303925785a.48.1785433457373;
        Thu, 30 Jul 2026 10:44:17 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d325a17fsm460156685a.13.2026.07.30.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:16 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Thu, 30 Jul 2026 13:43:43 -0400
Message-ID: <20260730174353.108023-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.55.0


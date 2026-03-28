Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11171352C22
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663816; cv=none; b=JGwMwROzu1XD3y3mFNBj3jysbwwzBzIZEY8NiM0AInn++C0Sr0P6aD+JW7Epon7S+ccbkVyUXy6ddpxRTDU05USVjLrVKvQmFbr8vYLticzEQd6OUIZHmGZhtDisXmf/Kr0PKqumXjdgCWF/DAYTTIf4Ap3TjPAM2v2sAs4uK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663816; c=relaxed/simple;
	bh=zJPyjta3QLSXoZw42QVF4jNijJKutu70WwFNGkQPwFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFJUa5lv5ACZJEK+y66dx6AsGutGRhFoMRWNo8GFnRIU75i8Bq7Q0205R8X+4NfINHWxOdhfZK8PE6SwjCBrklQ/nR69okhgj7WKZqiwd8AqlAkKtZnUZVKSXsyRTCRvyojQiLq+CQjG2H9XzOoDcMpwtMS0aR06Wbl2zbmhQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZuGNvUx; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZuGNvUx"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfbfdabf3fso274574785a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663813; x=1775268613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y79BlWEWTg9b8lgzADfvCeuR3QiTHOYZHrj4HPIVc/8=;
        b=qZuGNvUxLe0dfIUkn8XveRLN2K669SijhplCkrADD8HezrkwnYlTcx26Viu6IMOoDC
         pDVaJTorK1u808kjLogXVTLIOAzlpvI5sxjPvXydPEMGjnCzLe2qOM5klziQO/1q37y5
         XuOfePRtCksUhrlI/0k45KU/xPzG4+nQ10HZsGnpgyP9mvcSfGVsPhgitin6w8TcNdx1
         Db0QZcSR33OEJl2cRzJHITYFIJRrtzoNOucHbrYmp7Y74+rFTlv4MDU80CNv8jM7vIfq
         TaidA90fj0Db675ZhpXarFQQEVX92KY1i1W4QNS28zVzyq66lEhhMxDhn9jd7kwGoXPE
         4Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663813; x=1775268613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y79BlWEWTg9b8lgzADfvCeuR3QiTHOYZHrj4HPIVc/8=;
        b=GJ6RXDiFyYjuLPYM1gCcK0rBzeM/DmspZTxShSgjOoMduM/27cSTZproPCQTjKAXNZ
         aqAuOSKcCKUECQ4ZFtkhKW6SwWDEOOyhNqcXqJXt8bqU69AsHf59yGPX3ofx16IoYqkm
         IP+LDAxEGP6BFzxkDlvuEkjvCqI+JROORf8W54s5iZwptyjVkYuGIyPKArpkSAhQ4NWP
         9yWc3saApw9VBnSL8jRrLPc/1zKAnV92ZtQhWWTwJHkWiZ93+tVQVKau7MWLzC5eNF4n
         /Vt6etTYBN8i7iVbJV2btjKX8oPyOdjDmnGDeVsJ14AvpODoWDxigV54HmEfEGhTr8qP
         jKIg==
X-Forwarded-Encrypted: i=1; AJvYcCU5OLJjbQXj2BWiODkDuwI5N9joVa6jQI3HVIqF/HxZlBpWp+H0VsurADU2OOrGDL2o7KlN3b0bvIsr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ip5KeMvUYIJv3wytRQ/sqUSZFniC4t+2r/FzG9cfocEhq3Cq
	CRfy8OGTzw/Omj8476Obl8EPaPeQfhIt2HgE1/zcDvZCVQvwkZ427TWrJwgDyw==
X-Gm-Gg: ATEYQzyrSXZNclG3m6Cl+RWMgsTWpD1HMUuswplAdSf6OVrh57aBA8BY74+7eRBoGne
	G2IKKD5BWbpMhMRs3ANl79jCpQpCBtsIdbgzGmqF/feXqTVXWC1U2f/QmvGyEusGwV2/olDYRxy
	daSdln9nu74ueBEx5xh3H/bdhJr99Wp0UM3fyngYaX6ZX96jyq4hBenMrqFLu4q669wB9Gyuhr2
	wZKU5YrHc/G2E0MZhcrl/S4LRj2UDcHLAeEHIMjtPknNLC9ESqmYsVINaJAzRQbrTU6KII2SvSQ
	MysmbxA3F/DHEhHw0CmfjvVbr7xc5eX6HmKE6eNh9eDj3UqZg+VY3b4qph/5tmOYGPgWY+ieHM+
	N4HTKRHLP3Oj7ZYRbFjMvtagjRdDCDNHQRID2t9drhf2Y20A7rqNAPljj9pKMKcZqRteMZfN70g
	SMGeJ9+9m61fndVxGdTFhip6zVAQ==
X-Received: by 2002:a05:620a:1a0b:b0:8cf:de1c:edeb with SMTP id af79cd13be357-8d01c58f42bmr597133385a.9.1774663813037;
        Fri, 27 Mar 2026 19:10:13 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027ed7ed0sm72120185a.2.2026.03.27.19.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:12 -0700 (PDT)
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
Subject: [PATCH v3 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Fri, 27 Mar 2026 22:10:32 -0400
Message-ID: <20260328021036.85945-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
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


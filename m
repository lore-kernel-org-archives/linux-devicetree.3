Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA413A9631
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462149; cv=none; b=okqWMNqn5vZq/pOy3fAtD7Qby2U1V6mj8313w0DRDLcbsAekVkeK2MIjGuItOhh6mHj1bcYVuCfIfBlH475GCRBKwYQ4xO3AqOPGZao/Z1wITHDO52WwPvI3Tl1n5I5JNS/G4P+gvL31qpr5GISi9bSLj6jUz5EgbiZPdxwPRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462149; c=relaxed/simple;
	bh=Tjd+qqKRlPATrV03pdQqCuwbNQZAlKYm8gvQMT9w2Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ku+ycwCMhqKSBo0D3qmUMC/zz/kfLpapjHlrzrk+heStF1PS1IeafncF8GkqEDTqLVGImQvzjFUdJeOvgLKwD+TeRcluFLH7TbC/2bANgOi5gz64AD718In1VurzepvXfSvxExKeQk4hgxW/NMi3f5dWV1FAlLuD9cPIV9J91fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpsIwwIR; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpsIwwIR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so396353866b.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462146; x=1790066946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=DpsIwwIR1aRjXWbrBHfODdRB6u9aUKN/BjDVq0Nm/KbMjM7ID8ZHrbToOWKGsGmt/Q
         TpG3+U4fFRmEKKMXHM3vjlmIehEW2eO4NRBxbjKwIP+Zh+wapKXDz0VG/hyOeyvlCqbc
         lBbE36PpF6Z+zLp/51s/Mvz90i+mjILvzwMJ01hDb7WCkx+LUo50ffLVY06ca/mMwtMm
         8lKSJEYDmI/ggbJdpmqwqn/EsSEMv2+74MdrLsEvo/ebYCR3Gdo1cl4SWHUl7q4ZLkz+
         uFJ9znWENOSPGyYwpko2vp9ghnypxR02h1dAzhB7iaX2jepUmIUulAfW5sx4zP7qis6I
         xN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462146; x=1790066946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=brTXjsZ7Jvm3qKkCvFIL8RYNNaMk6pC67M2QYMjVXEjIWYO24Tq7pEv5rzvrpERuF1
         J5xUNHtBKS4g3f4QF/YuoK+HwEUvLR4Ldt5+LnQKydyOYLGU8tBJIdDCj90HX+ooLK/D
         WaGpHJh/Dv4nht0HiocM2mkWoevBBhGrt1nvNvPKNY451RrHg2tL4DFcuc3jkXFczOfL
         q4No+DpLEH9Mv4HN8TYgq3d2flHBvbEbqbOSC5+WT6dScDcKC0qQ6VxH5asi3gMNQECs
         hJsDRby3YIzG/OAg6riJd+3Eh0j7DN7j5/qRqa1wde26nWfcdN6v6vH6R9nN0Kom2xBi
         WAXw==
X-Forwarded-Encrypted: i=1; AKwUvBx7L1WQHVTaiFtH7SBwNst3JG46QBRvCxycSV0ZnHuMtTVEoD60ircRM3TEtkmXD0NBsJAiQjIHBepo@vger.kernel.org
X-Gm-Message-State: AFuF++lJKug0CmIdEtyldXIN0RgSFfsN4fx66QLaXufz61iFE0JBF1V7
	Yafyzv9s0BR6RiyFvDIMhbXskftgetFnivSRWMNBWY5CgULER+xFVHpL
X-Gm-Gg: AYBFou2o+NqPN/XULYiJyBEQ9QpbTY5JQqHFuhuvH6S4lHvogFl8CCTddXRR5KBLOnw
	xWfeUGQq9KDTcEc+1Zo0hJjHegB+RpHoJyLY1yi4wOZQJv5H5SB4acf3QhXFAsXfMCwBHaxl61N
	av7Ne5yJR5MiuNQySN1nZ1ogdTMYxvu3DNWC4CGiKF24K85K0e9NDqcZKopZl2jbWqClRidXntO
	5ij3c9XVHYe+QGecxN/TyAiP1Qh/nzeE2M5eJnMXPKqSp0JD8d/AftJZpp7OPIFoQt4ce1vNaBI
	3qtIjxGpQswMeYwqrRNGfPGcPIPWP+efdMm8l6C/5BpEcu/15pLAdhd2xLEXaS8/dXGbPqv0ocF
	sMByJoaQA3qf95k9XS7Dq5ApCfLXkrzcncZG6BOpUa9MiS1ZWxyGGyUrc5XDBr9nWkubVzDljEH
	OJaR+L/p7visW0uaiqVbUAYUucIfMJdi/K55F1zG6LuzG0/Y6K5Hc0XwrrWvxdJ88WnZ1ybfDfh
	RvpmbiFMCQXbO96CI7u9O45GA9QyROCOg==
X-Received: by 2002:a17:906:4fcb:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c29b86b7565mr667871766b.15.1789462146179;
        Tue, 15 Sep 2026 01:49:06 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067101sm552702966b.35.2026.09.15.01.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:49:05 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
Date: Tue, 15 Sep 2026 10:48:59 +0200
Message-ID: <20260915084901.56622-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915084901.56622-1-zstaseg@gmail.com>
References: <20260915084901.56622-1-zstaseg@gmail.com>
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


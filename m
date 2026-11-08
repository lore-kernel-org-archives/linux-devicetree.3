Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117271;
	b=ZlO7/29ZyW4nHSxQGOzsRAnRenlAbcu54XSJrDqkeaSxx/rvfakVNBewFSBNY3Zxt7iR
	 UmrDEba4SwZk9Te3HqnHDfO/64g3dt0GHfUDdf2AEGRv9h2M05V2qTgwJFMVuXs49YHFG
	 FOBhjBHzVY7BwIyfh1KDl9Wka42hHcaLqECacJSVgieiGIY9Hva0VRlJwkZJ5MNH0Wp8O
	 1Z2/prB7dRT1ZGvPXVgfH+d4c7Z4E4+JOpmEEjGxyZvaHi9jeA6rHE4ICt1BCVl700Gdg
	 oc7ATW2jYnDeLC1Z0ZEqEPWOv+E9rgWrDBSUvmO4brE9ZhQHucGUcfJ47/EjCOZ1HBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
	b=b0mza1776QWUHh7EnWlYJGsrl0XPKrQcUd4t6srjrlJIbaLilOg0a2SaipFuyVIIhnGl
	 we1mjBmN02km6MzvrS7ixK6V1wGqS5ZuFXQG7R3GrnSTIiGBvU2tw+PjSbjk6CWyNmltw
	 OuMRYOklnNDYwGU/I1LewLeLCWlGD2tWXsNolT5A4H7S7aR+Wgr89hVW+fo17atV3/j24
	 NpD+FKAp6Q1CG8yC+OBL5po70f7GR5zHeZOcj0sPVQTuJY0eoO8eVM95Ny20NbU43AcnS
	 1UabEfnOBEjEEiCwaVgpTi0LlYHtUMBonhmowBmB0f/wVKBjr5n1oHZXIjRrli1Y67Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFHfTGb7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB0606D813
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 05:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AB0606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFHfTGb7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so2933815e9.3
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 21:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117269; x=1794722069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
        b=mFHfTGb7HXk/JHsOJQVhXi9ghEA/0p6EkUqyOE3cY6g9T7eEIKQCTY6J1daG7aFbyJ
         +HWDYm2EYJcJbLAawvVxpd6toIJom1Szstw6eHBDQiFftCxy2kBcgfDTtPp8qkL/E4rx
         FKuPHde8PxcSoQ4JTtL0dR7++LsDmyE2lh/hyBklmx801WcfDEIjGhx3DBQv7hED3nHN
         f9bly/rrNexbf+LLiq5nTSZlW7d8PFkwaGsGfYy9+9NP6buj5zaXaRpE+dblaW2nSwj/
         5yH/iHLcpdj21i1fO2q4pOrblSM/upxAeYofTQzPyRObPVOtsix35xdWVGLX4UR4snGB
         3hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117269; x=1794722069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
        b=nwaoo9epUZPFREfkDR76xg66Nx6aOYd0Wy3UmReboezxkd3qpJKFzCqvaUv6VyUZIp
         B+JMXHK+eJeHLA8yA8swJZZMSapzU5KWpknnN3vrRl0q9RKDpcpAKmBCf0Chlf4Gd8ne
         sb7voio7PwAEPWDp1jS8OrCJz8qJAF5XDGfX6Flw6tfWEmAVXp56aK3zs4ZOl4dasMlC
         J96ocY86A/DG/YYEjnJAjls3QyR3fSvJX4QNKWBn0vmBsnircqtkxCoVFI52trpcp8zC
         bqRSWkjQ+22+D8sMnuw2iG4/S5R0wKYeKqdzMIR6hBEvYIC4KUNMeKdDfYnQjkuGp8lv
         REjw==
X-Forwarded-Encrypted: i=1; AKwUvByhg2aobwrTYgvoxcczWwq5Z0S3J7EotIQ58p+TnwR/fCM2M7M3vIg4hQGfdowTguvEmS8Hj9ma73P/@vger.kernel.org
X-Gm-Message-State: APuU4Z9HrjkqHzgMstkxgRBeWS44NAEbNF5XYafvn5GHCtgHFPu2cXZj
	wy0PlZBLJbfdwEekdTSuwZWdh/l+ZiYHbby0TnvPGpLJt7v4zreUpr/G
X-Gm-Gg: AYBFou0q37+Nr+jQQ5JsAGeQS9At+FxexCHrgT+qkrXkhOw6WoU2WO97vcdq8gL9AQl
	ykb3rBhlfTC5xHPxCqoKoSrJk796lmZT/wXwpp9xTJd3aEk0iHNo+Lk2retyGWFwRxN91iXS5Wv
	wjOONcyCZm0cbiF4RGX8Z/pKjbCKHEy7ZQV34bA4tG/mBPnBP/Mqzoq/opaVZB0HHez5nFUmuvb
	f3nz2XRhOESVy964bNWZMADt0sLGbnIW8avhiWUFMSF4bpGMY5ii3qYbTFLhKbXQt84SoKQCaIY
	LNuRpcGHHKn+RVfxunHlANf+c44w1gBdm862cREMt7fQ14P5cKGAlyI9m0L1njanA69gv+zwzsy
	jYoey1IyBCqKO5MTEJGJiC1WVXflOKoftcMgNYudSVObF8wCl4NvkTS7trLmR2UIvKFiXJTOePw
	oaZSOI+PjZVyTt20nqBDR1StFcTuiv58B7L4bou5z1GZAeCKimxjdQjY4IZIuRM3bs8aK0IfSwV
	6fdeakgRcy8axNvfhr6XPAjdzSjZ413yRotbj/QdbIPhPVJjeYBRNZdoy8xJfyy5zcH5U69xLiP
	csBYHhShLYTiA0nXkeTYCGnHLeKu9gZAZ8HB/YBr
X-Received: by 2002:a05:600c:19cc:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4b962395b3dmr11692205e9.18.1794117269227;
        Sat, 07 Nov 2026 21:54:29 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:28 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 05:54:04 +0000
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
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
Message-Id: <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=685;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=XKUQeh5gIrN4psn3sFGa9/2nrQGmqfi6P81kjp5bAio=;
 b=sJFig5KQLc5oUud0DuW743w/MiO2pHlaJz6/e4NsWJ6WYGo2akIfCeWI9sEH9K8hhZW8NfFDF
 bhcK5nHedXtAVyt3BOHEToyq69vKWd6y8cysrdNLUxXcxQhNPFc9qSN
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0


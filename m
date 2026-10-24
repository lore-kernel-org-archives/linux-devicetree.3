Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817304;
	b=j19cbdyKVGjfV3DjjjtriUHxJjMNVwxgXEQ6YRFJlozaKC44QJVofVJlt1XddmHG+PYt
	 f+MnkL9wXh24uRIWi304lHbLmJZ2Gu7oYT2nufSU2iUVleiggCp3Brb0SDod9wBiEqElG
	 ZQ3gti6gT97wGudX5lwxHgpba2dKfl4IKfvVvO/dJsSGhaBDZl9LMkZv1zNXXJFLQndoN
	 yT/DZrrB80pMK3PeqTepEVL5YLAjJ9eteViRBRNeRiaQoW9gGEQUVEFw8msbNCVL2+lRd
	 M2+PjpFLjD4O3dy/GfcArb+lGAafPOylIJ9BGnpWCQMLTqpRJ4pulQmATwdDeLK04tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
	b=UA+mVPgH+6Lgw5xDSPMA09iZLLXdTtqzXXNIhj+w9RhIf1FoBzOnhr/VrictkySiofFT
	 FrgWsYrBYlXuwKgIs460Q3+xcApkxRZgb+TxXsAuSMlZEhodNOQHlEpc7zj7o7gUfZaf9
	 3f0jjsY9UzH96L2uo7oJwlBXS/eEGDFsr/l7C3RBZzr3QOeEwtRrw1oCVLE7mFow+qcLI
	 /rz2OGlmxhNNTVtiQKyiKiWSU+1RuUFFUqPPOXvu8FG3jy7w2cbAYfbLu3a4h3Wq8VP+9
	 w49CYoNa3V8r5wmM1dfLKpKU9un87K8rSHYNXIa4lvBuHCXmUSVPasU7yIL39+HyS7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="fazH6vL/";
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81EA606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 04:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fazH6vL/
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6faddda49e7so1299174eaf.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792817303; x=1793422103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
        b=fazH6vL/+ECq6VlN9mVl4gcyoOhvrjunanP0XqxebYzUtWEyMHM7cdG8Kvzwp/AzV/
         ZQxp6HqzfWkpwT5AjhLjRfbYXACK+2HsssnLWqSFhZ4EMKGt12Tpp9ePwdZT6fnlB8G6
         xleERqRgwKIVmQVPH41xf08ivhd7R0HGH5KGnV7kkpr2PAIL+XzflAPWlF/2GMWPt3lf
         BRMbcZ16slHFYOOHVIJnYeBwmGS2Q9jqeeNw5q+kANkAUZO3seTHKh0yir5GvQHnhnFq
         FZypiSonTMCqc3dcDPO3/WqnUfb/ElFbsXmltMUgF5ljZ21NTSUwnB6pWegswTUI+aU8
         Td8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817303; x=1793422103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
        b=pQ8qET3ZiXY8cYf+/C5rOhc5d5+crMBcV/hvrnUMU2dj75cw7MmPFfMt+d4FENVBE0
         7h0qtlzKwafgX6+H+DPWmSydQb00yUCYuxApbNmhuBEkSBtjHL0WmX4iyLKeyO2LLGwG
         U/tkQeNUWQncfmtDMEpjuRpEIZ9fHJZPd4ujGiHh6BGXVhLfq89wofRhOOtrT+ZTL3lp
         wzlVfihw4m+32GhFwtDHU0UYahlqlbk6a8hYtrrOXwsi5ULVShsvxS6zIqjCy/8/lh26
         eutnT4jb0nCQvEcQK5OtQzvWogqmqbmjp79YyU+uJ2gqCGpeENucztJNz7TRE1IeeSut
         P8Xw==
X-Forwarded-Encrypted: i=1; AKwUvByPhqjvQYlzqV8sHlPu+JTOAMMyFXGfFV+IeUB0drtE6tT7FykZtVIN+aZKM/VzaxU8P3y4sVLwO63b@vger.kernel.org
X-Gm-Message-State: AFq9FYJbGborGqJlXRWR6bxeCeW+j9BNMFoNZ7g3yoFc+42xi14iY8QS
	ji5HQcdqdxzlUaR4ynG75G9hrOdRGyRKKYtnzPO0RrJ3caApm+2KRJNDmO5+3XTMHAY=
X-Gm-Gg: AYBFou2bvmP0ynFGQz3dPkqLoMtgsul0SlTvPvxFa/ySH9Otd9+Fk7Z53zXwiH7dYEa
	+o6d+G4mfJJCJjfL3mJYXVG3CDfpmIYrbNglqd2M8inrKIqeoSosYRh/rBFGC8avO5UYdKnLIIi
	PVBMFZA9qQZWq4pfhnBbho81/C+nlCj0ZYdVmICgFGJGABZWsMc8NRyRiQycvxTLwTt8djMOsQ0
	BPcA2knhXxUB1MBLikjmyOcLklGRxP5tF9xHiDtXreJyKDdhqe2cEr5hPUuydD/ARnDIPJSU81W
	g+hD3KNr36lKgGizCCEmCY0KcBx0ulEKwLl1dkqj95CQunxtCTMpUt2UvYeP1ueVuNqvjlD+WW9
	BRXWIJE5wXBbiFkFq5PTrMrCyyT/ed3Rp8nYMYj06M9JMwTgyRBB2BGxKQeXPz8BNyPzpkWFfhU
	kp3sVBYMuy5PSGTfnw9TKeMyl4sH0QQmEMNxJw5QIdX8jXrwGry9U0OU4spMo4r4thewbIOqtjH
	+Go91hiWlZHhx3dLNTOc1JJVT65PyHCejqu8t29Hw0y51z2GuIGVj5FBdVq5PkiRtNjvMsVM6HF
	0Zkq
X-Received: by 2002:a05:6820:4a1a:b0:6cd:3ffc:ad01 with SMTP id 006d021491bc7-70ba0ff073bmr381935eaf.81.1792817302835;
        Fri, 23 Oct 2026 21:48:22 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749dcsm1331577a34.11.2026.10.23.21.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:48:22 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 23 Oct 2026 23:46:49 -0500
Message-ID: <20261024044650.9936-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024044650.9936-1-jeff.roach0@gmail.com>
References: <20261024044650.9936-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Assisted-by: Claude Opus 5.5
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0


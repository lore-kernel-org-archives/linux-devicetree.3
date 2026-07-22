Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE486440A1C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739644; cv=none; b=bCaJhgZVjsz14/ZUJLnVd2pYCja6q9iwwwQjHIZksqaQXf1X/BK0JJkYpB8YRRLX0vRl0EAOnWPPtwUei/m9+2+QBx/D+fP/qxthzIIsXIa0E3+mEglP/GU0ZYuqkmracHBZJfVO49qFzsju6dKL//s17fxmqdljKV2XSUCNBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739644; c=relaxed/simple;
	bh=dQnacLOtfh1x/EVTAVwP8evevCXXsKE9KJDE9DiR4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aj5cxnnvMP9lqdTfNJXWaZMCNDL9nO3Uf1kf4kx1kk/9tnFzeMRL5vMoUP7z1w3LNtquGmPKtXw4/6EoqUfre4P25o50VHYR5bl8+gI6UcsdSbHkowNk6ueaFKsIMhpTjEn55CpEgtExF7a03g7LSj0PAvPbM6IJtrGuvyhuMXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTmr69xC; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTmr69xC"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-497d6c2d000so7956850b6e.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784739640; x=1785344440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=sTmr69xCHLIlcpdiXoAteQnA91JvSR4jPglzyMSr0uHJ320t1n2BAMqeUTcJ0XBBXL
         3K21XVffelysx0HsQ3nj2r0pNadIJvB0Myvlb7ataXNciBjYmGkmSIUEGjP62IAD6/ic
         TshYJhGg5wxztH4OwfMNlk/oyVCpU/Rkyqs1sl3sf9CtGb1cgJbXuQvPn2CZ6wP8bq8o
         Co1P8Ham55kLz8daA/W/ofIZGOhthsZg19GKXc2pPq7eLmVkPjiGSJDoOsEgHVFjJGFt
         TrHPNuUjdNRYgzj5pLhxUAvF4e6nVdtfN8VaWkT9YQUQNohVuvTYjDeOuXOiyS/ltVCf
         abgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739640; x=1785344440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=PIEDEkIOVtWy6RZKYJcuU+HMT1qg3e3JS37/jp+SUM7MWTZUJpQjVA8Sx1g8EQX2Pj
         pXZnZNj8bG69nmJcJZJ+9fjFN8W2stP1teqBrnJiHcOTEw8Lwgit0bucYNZOxLtKm5+2
         zWJ3xBTrhKD+uHwNqHqwUDauhHNbwKbwxFYUHoH+j/sCfNDf7A6p07/d2nlMw4mlG2ub
         /u6+KSeXjNk/mql09UTQrjf4mMnoisi6jAUDgRS/zg7KseE8g5kMgL6uvAAOXIrxqcCL
         NdL6T5M/t3BsceM0s0F1fu9eLyniP1uVztxabEY11AKhv/+6Wvqgf0utZZo2nO7ojKh9
         Tsjw==
X-Gm-Message-State: AOJu0YwRlBCFW2Rn/YCYlUKJkpX165bnpYy24Cl4zVt3iSgwIvmlW4l1
	edCXhr9y5F3yAUzBky0KqmfyvOxTz+pwfPptApZjKUVROTQuBeMx52f9
X-Gm-Gg: AR+sD11K5dklr1sFr32kFCTFkPRJvQlEvH6ZE1RqdFGY/rw+2qjSyaVRIUdoS0iXxeX
	UVSRAg+LRP0GZ1ZXA0RnM8K6dyvkEco2Hzn0wHvRXVAQKGMJTreT0Pa+n9hpZrPC9t6988E+CV3
	Y7uxsWHPdMuCCxa3vHwVFBZ6Aca17idiH1TtuHyEtPFQ5dKHMnqbV5yLnudI3GesdkaY1Fu9MV4
	KllCumzGFRxTKaZqN4UuaZ7dqKVujuG8EoRIPxmov+cWPBRp9RrdF2EL2Kzxt/rw41Eq2F+txEG
	jutCvhItRYgem9UVbJZhyZL7FpbnpAow54DWpnlEhcvkXqbqa07CHCsfljnVNgPAVnDblZMijO8
	QjGAYKOIdRWZq35SzmU3HkafyzBVDBQ8Fhf0Jed7eczswfam95wG7mzPHRx81Ffhf5NaWbn3fKT
	3chYGtIk49McY=
X-Received: by 2002:a05:6808:3445:b0:48a:3f80:ee55 with SMTP id 5614622812f47-4a4d049f732mr13420078b6e.26.1784739639887;
        Wed, 22 Jul 2026 10:00:39 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0e9af0afsm1399619b6e.12.2026.07.22.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:00:38 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V9 3/4] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Wed, 22 Jul 2026 11:58:05 -0500
Message-ID: <20260722165806.161020-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722165806.161020-1-macroalpha82@gmail.com>
References: <20260722165806.161020-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Anbernic RG Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b8babe9d3a26 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -66,6 +66,12 @@ properties:
               - anbernic,rg-ds
           - const: rockchip,rk3568
 
+      - description: Anbernic RK3576 Handheld Gaming Console
+        items:
+          - enum:
+              - anbernic,rg-vita-pro
+          - const: rockchip,rk3576
+
       - description: Ariaboard Photonicat
         items:
           - const: ariaboard,photonicat
-- 
2.43.0


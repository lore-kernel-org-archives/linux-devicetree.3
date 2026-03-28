Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84EB33557D
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662020; cv=none; b=O5v9GuUOSa0AojFfnmKLo4hlup39I9OCAMbdeE8+/uSkCALjPex3RgibQQH81bNG65YNcIoaHFtm3Dkj0796Ke/yIjkj3k2rKiWv2vO8rzSMBf2Y4WfbDdN3Z3sLfOemAHtdDR883aHu9mHVYEg2L/yFMAsaJiLUMsNhrkLTh7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662020; c=relaxed/simple;
	bh=zT7VHqFCzDwH7dsnqHKBT6R20zasdavK49rOXk8BcyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDbvRjmnj2SsvNOj8ZuD/TmUxA/wFccaI5mwqxw1dxAdPBFMgdJSNQgIdkkRKp3945uC8CCvCWLBfrjkrObtoRO4bbdIBBg8i5hf9ngLrdEDo0xZ5iZYcEigwLbfnFWjkFoPDXRW8uQDwopM9zpUDc4rOU0qKlZUHSEbeP28fYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtPRrAJ+; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtPRrAJ+"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89c52db6231so29646636d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662019; x=1775266819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqMq09LrRUJ7Y1qu+vRwg7gsZM0+ELiCGik6jbn1EcI=;
        b=mtPRrAJ+pqsF5FnO70VI9mouu3eW5yop9f+1bevUFzIDsg+h51skGW+X8tPfo+jWaX
         ECUdPDFjOOMGQ2IBwojcr566WbTbMSG6+SCFiOv6yqklCZynCVgz4bDfOad22N7tm+ys
         rMBQ0byNcByd+PDouRg1HQICtxYkmQ8lAcWWlKMJ6LJt65VFCJE+tS5C3JRXZBJs9Ca8
         mg/B3kIx93gsqHctQP+d7yULNGYOCYdXDbm/BQu5NXF8IfEWiCrwoY7/xFlS6owELTlF
         C55Rs5uCgbGHwI6VCMaAeRJTBj0AtrNP2ObJnEefkr3mYc+8HD/pI+BIl+fBqtSFTQxe
         moEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662019; x=1775266819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqMq09LrRUJ7Y1qu+vRwg7gsZM0+ELiCGik6jbn1EcI=;
        b=m3DvDVqVtwOCu1oHqTqXu14JL7n8r0sbhkRqC4nA3C0sWYHcjJeStSTEuVn1HnIZ7y
         x1w12wUIOb7M08kpd3oScaj5xddk64iFFCne06g24qziLdoWmWTPmu1ZP5oiNq2izl9I
         7Lzca8F6NITS39qnnT3UgxxREDEMkygZMjecbP7shixgLrnXkKN720bcoWouxY+LjfLU
         YwL1tGSc4PYcGet+wIZ34gg7Snaf77ra9KqwlrItHTwVVAPbvz/6VTXZIUDYDbIXvh9R
         0jgfM74huTwmlC8NX6cojm2fVOEk1KCEFuE+o2wNa4BZzlRPJcy3X/XvH8Llh843CjXo
         dfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU41LRAnLzJWhJi22OISH/hau7Y1kohKYaxupiX9GqF+OhpfL7Ul+ynXjU/Yu8sIge9yHar6w9zrE0j@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqHQ+PMiq4FwJn52dVuRtYT+plTkEbJvx4uoE/A1WI47EA2Hy
	cDDDV9XWvm/lvgu3Pjdp3HkOQsVET4p38jw04dm25woEXUkzf7jpEebl
X-Gm-Gg: ATEYQzzlyi0go3Byk6z6UtggGaE6PiOa+Pxffz4H2E6alRXGhN97t/x0P9P4HTicn0V
	bJhi2AOC8ozUIN2apQzE2cz9nXt3N8H4dRNkpqS0yEk8QjuHF7ejl002UnoUeIwZBPR6yTyDfK0
	f3kJrs6xICV1m3bj4gmWIGwj3wZTu6/s33G+F5kGDTcqDO4WPkvinljzflHC6CO5mRgfiOZ2xgK
	re10Se22ilqABahIB0l7dk8AdN/e/Z2844muR0X9HHQm1eg0PK/Kyd/aKokbT+YxkuRgVaHa4I6
	DLu1aR+vmIpQQXe8HZdLaTazKGym8Rkeor0tURkZyVMh+UQbJWFjN82xWSkBDye8pYmYpBkMe4U
	to0lMEMV9IggO04TJFdx6R5kHwQ4TJHiyFv4j0YeAYW2n3UEfnZLR1loAMM2onoIIlgvlINg/Xu
	vmCCEGSzlF92Kl7DAtbbYWig6dkhfyoIWF0H7C
X-Received: by 2002:a05:6214:3485:b0:89a:7d9:34ae with SMTP id 6a1803df08f44-89ce8e4623fmr59571016d6.38.1774662018687;
        Fri, 27 Mar 2026 18:40:18 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf95f3c1sm6393206d6.40.2026.03.27.18.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:18 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: thermal: tsens: add SDM670 compatible
Date: Fri, 27 Mar 2026 21:40:38 -0400
Message-ID: <20260328014041.83777-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328014041.83777-1-mailingradian@gmail.com>
References: <20260328014041.83777-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the thermal sensors on the SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 3c5256b0cd9f..6c84f22ae322 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -71,6 +71,7 @@ properties:
               - qcom,sc8180x-tsens
               - qcom,sc8280xp-tsens
               - qcom,sdm630-tsens
+              - qcom,sdm670-tsens
               - qcom,sdm845-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
-- 
2.53.0


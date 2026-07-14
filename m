Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FAA3E0750
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010542; cv=none; b=R2vCt3qWG/DewvIqj/ZxCdP/KnE4b6bz6C/pD3LF08lSnlP+UyMqLGrzZVQTef8fj6XCJQTx8to3vQq0Mzgq7IZl9HFiWVkZ5AzMgMHe57rRsAYtPVCu13Z1mKmj1AnnHcajGeYFP3jAVVs+2ddi7tG9tPfvp49ao8CylqtYMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010542; c=relaxed/simple;
	bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddRAY660zaVoCpUIxpafVXY7rDuS/N2ybPfwNTxo+MZPt7JCLeRK0Lh9jV0k6KzzB/fGDQOCgoHcJN0pK0PMYOZZV3CcC/h7l5WYPTUvKnQSY16YoOWQGo6IbrToBRqS2+Z9fELxg9BR9GzlVK5UCey4p3j9TM2mXzQlSbTQU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Gb4Z8e; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Gb4Z8e"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacf197759so8955315ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010540; x=1784615340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=S5Gb4Z8eQiAVzcwIOZdb1tUmhWc/Yv2aqcU5tkLxjHUUdyvt5CKv9OAxsmttLKTWGh
         eWRhAJ6WsQ98e08MJg/NYxzkh4Whqszrzlyda10Bx90hhdRXZBanBZV1fDgBMQ2T3zKs
         Lf3JHRaLSsuKcCXrF1p1HXJjEqrFE59Vo2ZkU9Hn+/+kBlL1bNccG9/0Frb9OV3XUBEm
         Q528qcB6yc2//SPFFxGKDemJtT3tRiYhRDEuFhkJclIQPno5t17R8EIBKyMFCYvRsuqr
         SKmxPx/xQeNJ87G/U11+MGEqeEjBSXOU+HJswVRwEZ2gXx+qmcSEfPeXJKWsXPLDsmlg
         coJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010540; x=1784615340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=fqSxIA49oRLL9nrvhQbTiTJa7iI9N03s/Y59kiDWcFi1wAxoJEA96rlrt5TWCaGRHV
         +TLInziT8dpPoA+1T+jEeHX1335vkuT0U3fC8ne+VDzWnrTTsflfWOV1uqWy7/9HekHX
         rjzlKO/2hHydXwJeEBqIIhZIAeCa+M5k116WMQA+LvkDSDZJL8hUnZhIAeAjYKa2sCA6
         vxr+f1Rzia9lxrbEbuTHOZ/MFdhqCwI5zU2bO33KPU6bPSMuyyH5fLVim5ytNPQKpaad
         KK/3lYZCMTf7XPiZ8zGki71rEBvSSmYitJhTxFSdUOpLa47GC2uAzj27q+dEZ3RNvt+j
         QvQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+wbRx6db3g3bIGORRuWzUax8Akez9cCl8jhgkFk8mgtzFJOCp2AvddhCQnmbGzO/OOQUZ1gjZBTe4@vger.kernel.org
X-Gm-Message-State: AOJu0YyLIMuiXFaCshALjJ1lzVsF7/UJEoPSiFvEKctijsWv4THnV8FZ
	338E7G+NQc5gC+xHBw6F63l8Yn5pWKQzEsgGiZ8W0pAWk+AxRh6mz2/igiNYpg==
X-Gm-Gg: AfdE7cmdioBP4xbZjw6e4ns+di7SND6BomuvWRc8xkaQAuGXpeXgsWcC+/gem8W4G5e
	vRjBF1Bh+YYJoA4GxXGHZXJzTkS1F8R/2qwDwoKWkazcqTOTcRsl8llld7NH/iyE4EQ3ELA3ON1
	RmT6mTL2sGz4a1jNfwGkxdLqP5q8J+mpFgOMPN+oIf02YvdPyULfY7MGQK0Ck7nUiZztHuBZ22H
	SKsdVJJ8t4XOmiOvH1ycJccEsv9eE2ZGtLYUeCmAeNQzS//bsy6J8FbbuWU46EUO9lae2f53Hr4
	Cfa4uSWTbksO9GyUlEC6fnswQOVFZG+6Mt5+fqElp0TiFxUQFIHaTBiU1qaJYk4+UXUpVxcffbr
	1yDVIs6Z8fmM9WP3PiM8P/r4c9tPfAtX2kbKPn+opPDSI7kmsHLpigdjAGhvcP5AYSDR3Gve2Oa
	fK8loCShCVOjFLF9WMq8KTP4jmeYGkn8qJgJ8SySInCIvCgL+BM2/YSu/BRxKd0tpCwszmBKkBF
	KVF3ivCER/Ik7gD7lVKRIfXVLvOHaQejAdUip42/hZX1fFHGt/mTOwWbItTwco4
X-Received: by 2002:a17:903:4b2d:b0:2c9:ceb9:865b with SMTP id d9443c01a7336-2ce9eab3aeemr104195135ad.21.1784010540252;
        Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:16 +1000
Subject: [PATCH v2 09/12] arm64: dts: apple: t602x: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-9-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnvaiyaG9S2R1lJb4a1+uHH4be1GJ53PQ68NWXil
 /sZDFe6OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9zI+R4U2df62balzCnA0azfndWv4Tj9zITVqTUmwcKnM3SeTbE4b/ObItDyy
 Pb92Vn5ze9/74olf93pqh0o3ms7OOLdy5ov4IEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6021.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 62907ad6a546..5175797baf62 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g14c", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index e73bf2f7510a..7585fd609d34 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -347,3 +347,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g14d", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0


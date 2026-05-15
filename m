Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9A3644D4
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823790; cv=none; b=LfZ9CRav8koGtsCcqn/CHSj80d0p4G69S/jP08FGQn6EzE0JKCkMqeLHpfP9Vr2pYt/OWIdtzoxBupQQR6hoD9k4/mvTNe7vy+nbp5cqdsOVHQxCpgsESx2Iv1SuG6K8pY/EfxGcwcFh3yHU2bCAkUuWJ4a7dnn07IBwMoIPMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823790; c=relaxed/simple;
	bh=SiUP5HbQ3G7apTtOZhLEzXF9Q4mu0oKKv/Ar7YPzG9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+SYLJn0veJ7+wAe3q+IBJFNN1vImkmQ9NKoJnCwJVdtJYCJoa84FBdssdPMpX2yTdaF/qo55dRVfZ2nyF4CPbeo5/hv7pItdPcwptag0tm/gQgK/+xXS7iM4jRuiaWXpgJUypZSQzn3D166R5bWa9wiWqbDHejCUfUZFXALqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8czAkuL; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8czAkuL"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso3693506a12.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823788; x=1779428588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGxg0Mcj6I7tC+AGT1Hg22gidJPewv2bFQbIhOlsycI=;
        b=i8czAkuL1qW7uKzNR3k7OK4djrO5NzYP4Acolbdic9GR/FqgjvJcz1k8vkm0Ft3tAi
         BJfkl28OfMhjrkOLzhzYcCR2yWaP6o/I1MquqZxPaa4BCUM5KVXoTGj8vDHfURZa5Ikw
         ye7cov56zt8IijoCeD236toJq55mOhtNG+4B0P44fw8jrCXdBQlmJcbTfKFZT5mMqzrP
         /ZplfFKJ/shAl4ZHU9bBKAnfmx1nIhWNFxCg0/6WgRmVJShMggzza59UvsImGxBjPiGa
         RB2QtqbQRZ62bNtj0XSPY8NTXCz3R/SA0ydNmemq3RsqD+Vd0U8W16cXW4AiB2+M3ZZs
         iWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823788; x=1779428588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGxg0Mcj6I7tC+AGT1Hg22gidJPewv2bFQbIhOlsycI=;
        b=FPt999AuqZ9A8Fxco7emsgLWIKquseiKemrr54Zbe5eF0gq6xccN1In753J5myM5NG
         s2K2xQ7YGHU69wWq5jt9NgdhKog5v9ljr5Kgx50fjPSs6JU9oMoOyrTILirLizLbc6DK
         UHtX+rMPuYWFpAU1GCCLmnVHELCekvBrtFWy8Uhah+O2O5zwiK1e5hs0IyP3xV8wKanX
         eNWrHrJ1S9WkXZHJkJmTAYYMgCIfKThrOTam5tPh6wrgDqIPqz9XGtl1J11l5pFryqPC
         VB50KE0uiIA1HGODjGCaZfHIXEODDoQI4dkdOlRc1UTNVLsEWFh6f6nBMCDs+ENKFMJx
         0kmA==
X-Forwarded-Encrypted: i=1; AFNElJ8bi/TmYSgIv5YC1X9b9YNfHqPZVj8OjK3L0NOkcqX7X8MpFFBNOgsSxms4nP6mclMsZruD1V4CtiR9@vger.kernel.org
X-Gm-Message-State: AOJu0YxhZQfQQFNMpArlpGBh5JUW6BexYM1S48UQzLLHshwoGE/Z6qaI
	xwgnMkW4+WBwegrIUzIAAemB7/6gi4YV3BN4DuJCwfMw4kJdkFPKI3Ql
X-Gm-Gg: Acq92OHDWumI/W3UqLDEDDhQEnIu7t4MjQxeWN7cPudvKWRQPdP3QBpoanhFbygMQkI
	MCEOSUFzKAlcAoKp14DiHXiC5YoHJVxNyMGDOIJW/LR3+eonoL1/CLydy4Is6vJTtoWAa6ncWhy
	guXojD9RELcwimEZ81y2+Awi9T7HcXbP9WfFe9Xizf+mYRtZWaQO8u25Iksu9HxtGlWFcKUW3xd
	bvSGZ0Cv9Ee6n6aWFZyrZScumlk3debtssxO+bRgu1JdHrRgHlmyP3iDsqGVa5f2xVO8ZG+Tifd
	9gurVGHOg2lX0iaCtjDTm4M/gTvOk22KwlwIJ7r1gtIkBja4InRj28cpp/t7p7tFZKDSmMZLdce
	FcCiYzpxJa6yqbMTX5q5rcgpuMM8pVxDzEqdnTiIy0FD0JKlNoVHdNMzxeAvGxKWJnjmO/vJVwE
	dKIXYv4pFJci0Zqjl7cFJd66gZsjOzsu/80cXufRot6kKjAKoWGWKpO64QM3duycrQspUFcdwyt
	Pvv1HclpIRQWTlM2nheBDK35Rs=
X-Received: by 2002:a05:6a20:158b:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3b22ed00276mr2807800637.34.1778823788168;
        Thu, 14 May 2026 22:43:08 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:43:07 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: hamoa: Add inline crypto for UFS
Date: Fri, 15 May 2026 15:41:51 +1000
Message-ID: <30c12b79c6cc481afb13ac93630c5a16bc856ae4.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Inline Crypto node and wire it to ufs_mem,
enabling UFS storage encryption on x1e80100 and
derivative SOCs.

This is needed to support encrypted storage on
the Microsoft Surface Pro 12-inch.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..22420d0a323a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3952,6 +3952,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -3997,6 +3999,14 @@ opp-300000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.53.0


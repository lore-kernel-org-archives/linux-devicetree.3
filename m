Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B63C5DB8
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448700; cv=none; b=XVQO2mxN0SeZsCxN6HL5t9Hl+tS+i3v9nopdDOo4MGmIrtQ2md0j66rJvyNUYBhT3XUCr2xaDSajFQGqe5SqUCydRCdFoKGERQ5iqpYM6MMyk0ASnhAmF42dKgcEUGeGtcCA+CvFMcYH41ishbA/eCty+gwGIkiR2WSRyLQjJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448700; c=relaxed/simple;
	bh=Q0X/qpV6OiVig0rnFyHw8H0kYx8sjAI6G3zKCiw3d2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKkJM871iHPTmMobAjtxhewNvNj399hShmKESV7ydJCepmfP0Qft8zexhVNYw1GR5FG2QnOHRUxFtgpo5YYftzoL9mppmlUdvrbMLKqIb/ljiHLM9Vktq73B9rGtuCXFm8kMCtBZv5d/t0QYwvt6pJGLzkpdrCK8UZb0uuBHfm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=Lsam92mS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="Lsam92mS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf30d530bdso25527945ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781448696; x=1782053496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4soJXbEiJIWDYO1GkRrtkxYao7UqwnYefJpu0d9FEg=;
        b=Lsam92mSl0nTo27mMh8oeftkiUHTCHehN9A8aq09+rk5bHVEo15opw7svRzCmDkt24
         UjGovlhslnlsBpAdQ8iwWwCOPWZ4lyxcXIKsds+xqWe7jS4W4gpinyxc9lVbf2x2MF6W
         vly6y+DpFr2MoRn71Nse4kxd+RYGhgLIh/cAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448696; x=1782053496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4soJXbEiJIWDYO1GkRrtkxYao7UqwnYefJpu0d9FEg=;
        b=EpFuq38bhm3+5rSMiF4L8MVDnDDGEMrjYSrxDTzFpV/a1oZSJLCgJ8fTc0iVsm582u
         +fk1l2qE/8b3NjdFXB5flNKSA8YdA1iNuh80ZyQYUS5HLc7HOd3E7QDfZPbyVw/3CdsU
         wYvww0DzvonOAdkc1PT9S9VM7bDXQLNYb1D3gxz5BdRMeW3Zirh1Dkxvuarq0RYmkhCN
         /xURo+iqULDF1gP8fjh3UVjCnyJ4/hUdXqv/Aywn2NO/qd3OiBHNiyf5s5/bl2s94hZg
         /Gbj3Ei3vWFIc1PqUVwvdwC5ZfJJ80nvQBPT78p5QNSF7ItqH4uwXXfoQZj6S/BJORfg
         X6CQ==
X-Forwarded-Encrypted: i=1; AFNElJ9raKFMqbdmpnO12UU93Pe0g1U8FX3a6k1YV+nqtVPn+i5cD7K2oVLUYYdeHCxWYTesy7EcL84tApwu@vger.kernel.org
X-Gm-Message-State: AOJu0YxaL30J+X38Qm0YG6QjDaDhSIf3yfQ4Pm3Mi6mffIhV/ggUSxIV
	f3Ojbq0ZRkC3lyLlji1pHgyJicsikoGNp85oLFpJZy4KIkEEvSLPyepvKRLQsfA+rag=
X-Gm-Gg: Acq92OE9ZB308mB50A5zR0YHG5OawiPESZmCAQRzT8XlBOTIP9l020V0quN5LrFhMPY
	wVLElj3IGI7yKu4TfY736/7hqachK3bfrDhOIcmlN6kBtZlvx+ee7+ZfBp7otG5evVwfei7g8Rg
	O+4SkvAh6iEsGHtDJ0e6tZUPQLWGZ21hW0+7FFAdsxCU6b4FuE7B3Ori1o8NKxrC7h0PWp5Ex5e
	cHst0MWKbcKrXBs31+JLTwQB5SnvWxUXZEGjr7z1Oaeda5kWEUdJ/iQDysH45X1FV8mNMCmUK5X
	d0AbCW1C2KrLGg8hvUdKHkhiLr2zY+UwA3NXAmr7LdCUgafpWEK9nIUNrIye9gGAPmmdMzmHqn9
	Dh3wp139zgpwpt/PD0G3hnDRkT5qJXDwlyu8HVU5RlS9tp2XRKNKGwIrP4GDK/NUZR6J8Yy1zcC
	jSOLdcfmlSAKNX7tjpCOPT5aZqvz986O07AXzkadZrzGktvX7CKST2oEgm3TmyyTYwUvJ+WqMhm
	1D0qgMi68ghScxb88VyF1aU6SYLREl3ZC0pXPAGbWEyR8NTi+hP1CmFw0n/zjd4o0PN+4iv9cdC
	zDEBuefEI+HLsF4MOArkeGUKDcCuJ/A3GvPboTqngCX2tSnrD3z0o5ylQyibFw==
X-Received: by 2002:a17:902:ebc7:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c664082585mr87995225ad.0.1781448696479;
        Sun, 14 Jun 2026 07:51:36 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acca5sm66746385ad.51.2026.06.14.07.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:51:36 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Daniel J Blueman <daniel@quora.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
Date: Sun, 14 Jun 2026 22:51:11 +0800
Message-ID: <20260614145113.84243-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to the firmware-loaded codec carveout, some Iris platforms
need to declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from IOVA ranges that earlier
firmware stages have already mapped through the SMMU.

Permit a second memory-region phandle for this purpose, and describe
the meaning of each entry so the ordering is unambiguous.

Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v2:
- drop redundant maxItems, keeping the items descriptions (Rob)
- add Fixes tag and Cc stable for the backport dependency
v1: https://lore.kernel.org/lkml/20260601041336.9497-1-daniel@quora.org/

 .../devicetree/bindings/media/qcom,sm8550-iris.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b5..5abcaee4101c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -80,7 +80,10 @@ properties:
   dma-coherent: true
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   operating-points-v2: true
 
-- 
2.53.0


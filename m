Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2319314D1A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 04:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780287293; cv=none; b=MdV0pKm/+hBw2TS7q5Ve4BuSLD0Eu6vxSTdcHjoNDsKPXPZePUTfsg+yf4tPsiypkae7R2eQh8Z3J4kAjl4/stoHjk3W8J/zt7gyVR4rRZhB/di/EN7q+AFiGAVDau8DYwnDzIFN7n7+yAe7iVgL7iPnD7BuLXoWnAdDserDjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780287293; c=relaxed/simple;
	bh=T/BAgSheZ6++v61mRY8etZ4qi9u0C/vqxFaS8N3TgYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkzJ0ohmiDlihIzBSjp2K5fVXfDFLIOxAMIIUr1f1U8lJGujASbaE1+3s8YqMWTa9Aon+AagD3rTWKGHLMCtGG1qaUuW0bAbUD9BpkEUu9xQkcSaFswvsSF3N6wepwhrG2JqMQk8CpdHrifTgf7OEV99CV3TlvV+6GShG+33QIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=NZJJzOKE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="NZJJzOKE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so6653965ad.2
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 21:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780287291; x=1780892091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ixy0XYV4dscvWnpDYcR6EMlE3fKq9U56m7Y4N2kjc8=;
        b=NZJJzOKEk1vucrcGq+I3TiTLr4ddAPoZgLfXaI7ceYMZ9jzTXv3jYp2RdUFHWiuz5i
         dNiRHSkfDP6hSKiI2pP6gD+kiDq3dGxWbt8SkwsIt9DK4GRsgWtHw4GTLE0QNtKQZEHL
         gdetCfvhhTA52gnAnSEHkDektbUyOEho5Bviw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780287291; x=1780892091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ixy0XYV4dscvWnpDYcR6EMlE3fKq9U56m7Y4N2kjc8=;
        b=pgQGrZYmdiWZx0gYnhRIhQHKz2p4Den5H1A7fB6awn6x8D5h1FBEtsFk5Fq0tshjM3
         UbCjOA/m6oVFW+L/OegRCU5DueId9ze6WHcjzJvarywgyIxvK7LXNGWm8SU7dnmfIFNc
         9QoLV5FXr6jB0ROhG5mBtWTriLFyYCwe/l7ueojSQmc8dsiMIUDj1PAQlvXHY5zntXgs
         OTONZ+ZEvZtBpwuXpZEUXmEYzoIXxL3xmLh3brhhg60D413yxScEsbeJ/ocZ2yAP1IdG
         k5+io1emPQrVnoRbE/MQUawTu3c+0riArIwZVi4SPnIiz1pcMIk8yo2DVOHd32wOrGkI
         nJpg==
X-Forwarded-Encrypted: i=1; AFNElJ8MFiJ36RIAFDXjGlpySDGumg8Mbu0x87Xm79iEkAr6qOImgG7sdfPG1cICz2NET7L3mR8iT4SwuKwi@vger.kernel.org
X-Gm-Message-State: AOJu0YwAW6bB9TDYQ8gKsbMqbqsjfvLxkm7y/b0dATcR8SDFpJfu3UaI
	lwMB7YKiOkqW4nZkqRxECLID7ToJLI1jx0t2V41YUtX6KcfHEp3vW0o45zZdq9ZeVlk=
X-Gm-Gg: Acq92OHn5MjjcGjsdzhY9WHOEWgQjcZLPvQu9TPTgUfArUVJe8r7gOQ2s5M984/2Cf8
	AUGnxgQItkr9RWOsU0ztXxh4Z4J8Aaf6J/cOuRmqBJKfHbuKBWIplGbNSEPEfG+eNM3oJtNiI8Y
	+3Y2IUhdor+lerld/+hCi/NVceaEslLfi0PMGEO+0TLZ9GFZLCLRlYWPsPfP0rWmvkEjsVkkBoq
	YvW+WCksT6v4NlIar0ZCqNefVU8T1JPObKavmKEWJ1KOBdedNXH1jdihFcdoa/H0qLMgcSx7SCJ
	6Kwctn1Fufo/WQEF3Ne+SIvxRv4S5z5zuO1cD84xtqECL7CBCdptpfEt+kb1Q7rYvlI7+gB++7e
	yD3Duh+QClQehcA8t+gYW8ushivN4h/j3YJShEm33UVRFoDVkWdgsMHz8Er3uDgCuHZ/3OnQqva
	rMF+Ar/S5+qaf8EEAHZ//eMJildoK1MzcBCCeyawUlHA3s5LaizAucTR5qZxd99u7d0Zng/I2WJ
	qAneDaivVFJd74iSs3LtzmjpK6aB+kUoOnioGm9PXcjke720yQmC4EVpCeCeJA/HOIwryRMLf2j
	TperTyh6DzMgMcju/AlmyZpMxX0rzEvbOsClgSL+A6Q6BU32EI5btbFhpvqKB8wFvoiHwiOYR8M
	cdNs=
X-Received: by 2002:a17:903:289:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bf367c93admr101535725ad.15.1780287291239;
        Sun, 31 May 2026 21:14:51 -0700 (PDT)
Received: from aegis ([175.176.67.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm92980405ad.76.2026.05.31.21.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:14:50 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
Date: Mon,  1 Jun 2026 12:13:33 +0800
Message-ID: <20260601041336.9497-1-daniel@quora.org>
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

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b5..6359e4953d42 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -80,7 +80,11 @@ properties:
   dma-coherent: true

   memory-region:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region

   operating-points-v2: true

--
2.53.0


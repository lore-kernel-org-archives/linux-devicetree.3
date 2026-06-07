Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADF73264DA
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832246; cv=none; b=KaA3Z30iOHrR5jNlPQn3UgMvbREFTUNQ5JcSN62QoWTx+F3vtyQUewSJx7DpTaokfJ9XOyVGo6knxxMY8Ojd4nW1ci5CByOqxDsVMaUZqabJZrrRarfS86bqkJHWM+Ax0Gsvgy18oN1GHmc3K2aM4hTFDPu96+pGdZHsVvk5PZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832246; c=relaxed/simple;
	bh=mvbYsq6s7d7W1oouiNX7rgDJWbcpYrxcLw9VH/gGvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRRifAjHhsU5MpGjTAVT5GmtGpq7xgFTrVGK+BT6UwF9eI3h7IOp+BUaiNvOAhmlLTTAGe01DXf5prxYC46xaQPkPfvD9+dRSFcKQNm1DodEELparXisM5mQ0G9brTnUkgtxosAOkJFfNAgx5Sy0BeWr5L+UnfYwWw9Nbpq9HDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlyX1pft; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlyX1pft"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c858cc9870aso1922977a12.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780832244; x=1781437044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=QlyX1pft3k38892FqvdLHVROFQuS6Qc72A+e4aTLWwcLn6cp3iw+78AFO+00c1RBb0
         0guAcTf6F6D5tkxYg/wmtzdPcrn8t4EXb8SwOSKciotPB9WBW8rKCzfYpN3zpX7JhLgv
         Pz8lbhYmHkAUhwdEOeZvM9pE6qoG1SZx5dpD9U0E843FvZ8YK+4vh47p6vYFGTQ8GvJx
         NdO/8/4iBrhyJsiL4EazcUOfVawRrHVjNnE98JmOWFSqJP9yN1jN5dndsNgr68Nq8qv1
         kPYfqkjhC8ztGmhrVEJFfJoGINn4G+CrxySfAtVHVSsjesLtLfqnVkUzFcpiCwiSmPUl
         xhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780832244; x=1781437044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=rce4vww2Wy/kBoBgPm5laGCRpy+O9+qaB2Z8qlyKJVOq+vmW6W7SkPu0G6vo5uGZeO
         FR3gXLFFa7UX1ig++DeGaAEoj8jweLkM4kAqnqBmnHnoKCsC3F4FzzckhPq78nQNP28X
         fZiwVB50TcDDAFbjanvGpEs2yY4SCm1D8CPRhkppSXB+dLn4S6AHUF8i4vVJ0EGLf5Zi
         GQpF0i5qvJj1lSIWsMOCxpQFHZDwrZh4ttW496UVeBIzJoWGngEgCwHhjj83LuQKzYXf
         fQNLZLpaa9Eom9R1EQHsBE6CZAS+gAmCSztnnxKaFt614WO+bhenyDp8Ah9k/dLWzLAK
         v5oA==
X-Forwarded-Encrypted: i=1; AFNElJ98dMQNRVdSgdXaudI4pC9usgbO5h4W3Yp2LrcQIO8xbMKVQT6U3GswNLloAjhi7XYC+taeVG0F7TaN@vger.kernel.org
X-Gm-Message-State: AOJu0YxasS2XPYXLGSkmhF4FHRTfb2bkycw2R8XRUcpvT63YLA/giWbW
	rSDcsQOmcZainyJXPArNvRVpfTcg0IlLuVui06sIdueoLPqS8xDzuxXL
X-Gm-Gg: Acq92OFI6FE7DM8WGYkAqH/pr9DCyNNUlyGOh/EC8n88dsIoIT3BrI+z8GqEk89ewtq
	lg0njgx9ilzdGUMVd+v0MxL+CNwoGBOw5xxz8GjVTM2MkyoOCijUn3A09QG5X4uq+cV7B2Gpv8W
	EvTkZeFb5Rnf1MbFHyjjNbP3L3lMtvUJzBRsJaJ59eRPQvC1Oq1xMC0xc9gs8A5JJw2vFmqaWG6
	4uKlngCrEJGImLg66r2GM+jJIqszaUl+czN9gWbe9et66T6wkKOf6IBgYbIVQFVsvV5BritwUlk
	RYET8EenY4dzB25aATcK9k+SjPnGbTICaCZ+5NWAfBYK/ol51NAImqOFKmfwAaXqS0MqxM+ewC0
	ccqs1qevy9JoD4OGoXM/YxTNrCyBVIY+r8zlx6W2MrbbR6ezXCcKfILbsD5++nPS440nT1wE1Pu
	kCBYvLqrBg/O+02x0UuEH1LYPq9iSWU9AXeNfTPY7CH1YpC9/THqoTBz8IYTvnIKNJyd5RpYI=
X-Received: by 2002:a17:903:1b43:b0:2c1:88a1:9839 with SMTP id d9443c01a7336-2c1ec527f50mr94707405ad.11.1780832244342;
        Sun, 07 Jun 2026 04:37:24 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm144144165ad.73.2026.06.07.04.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 04:37:23 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Sun,  7 Jun 2026 17:06:57 +0530
Message-ID: <20260607113658.25117-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260607113658.25117-1-blfizzyy@gmail.com>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..6924bfe7b949 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -361,6 +361,7 @@ properties:
               - radxa,dragon-q6a
               - shift,otter
               - thundercomm,rubikpi3
+              - vicharak,axon-mini
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.50.1 (Apple Git-155)


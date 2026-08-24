Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125FF41E6D9
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576797; cv=none; b=UTHwMbekTfORQTB5uKAoRBBJcTI1zgYWPSe/XBNdYgN5up33UB+rE+usZqWSAc1qYIowLsBw5DhiSsMWCHMktvej6wJv4XZvh6NLuHXCxo3x6rb93tC8VPn6j9jhB3sQbSbYfI3VVs5WuhQouKJoXeYmUN4KMMAfHAhVpq/RzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576797; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLDzjFYR2RoXwxpK7cb0QaEJ0SvTe8scrkjqC7+JgALV8tbH/k363sm6aMsuJ5a5KtHB84clphsS6ayjeUqcqmd0Uny/4q3fKmD1c3zdTlA0BqEjsNw/dgCOviz/zXrwgigQ+XznRp1ocbB7Mag777ZuHIOasNL3N+B9DN9GuqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOn8zvgx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOn8zvgx"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-395cf2535acso2965297a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576795; x=1788181595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BOn8zvgx8OR00F/IRRPkOS6UfJx55Fwk5teZsIj/GZyVjxbqpjlwH9f1bUTGpVhTPM
         PistBs8F0beWFzNyfvjNIFCRbVuPBF2VL6FvCq+OkTatN/VW0j0g3TMzyjGGVPRMKDSi
         QBR9V910IwdUQxze+YHHzgvooFmNWU0IKMrl2DQBY//EGA9fr4KBpSER8C0krBkHKBbz
         5r853GF41gRmBQG6mzSkO8+I7NQerUYB3kqaIl7b94TrCP25hWt+H24jEuCMy5mDSFPP
         wjZYgSCnELUXOZTUKQ/jAV/PeWsBEdqC+IgofyVCDBI35ziTx93Xmg8La5FXrI+Omhhj
         uyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576795; x=1788181595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=hdLYrvcCKNUCwGrIWYmiTAwGlij4mAX8OcZmDgGgOrqDA2eZrdh/2c5WGsRgRP3kJ2
         lac5BZvCswHKFYrzIvB9iGGfFp17f2komDk8K4PtC8zhRDVkqqcQye2br1WIc+GaKJ4W
         Rq9EzYELvxKsvN3BgTuFEuW90Me1pr5hYWwkEu0Y+m9IENn31nuYDnddoILUQb29PRFw
         YrE08NjhllsE+cfS1pTigGBh+pI5RWq61EKlvTdRxsDoo0CtzMC7n6Jdr/D9F66cp1zq
         h4pbwf+uNi+ezb5I4ixLT+NbSReqZl3jaDkJGDsRktRfZb5DHh6BZ6ygWbw1rMpBljvd
         i05Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDiXXK3MleB2VaKqVhiFtTvVIFguqTKq51Kt5y2hS+7SkTcQ7iJrlKzQ61BZZcML98JW42lNjX3Uuv@vger.kernel.org
X-Gm-Message-State: AFuF++nDdcaJQ4WBk2kcPu0y6yd4V9RhGGiYcq2I2ebhimGl/YdZpYt6
	l7B5SaGNEXXsf1/ApOeB+fY/xV0gsBD8N5WbGog2CQTNFRTBrAk13S5G
X-Gm-Gg: AR+sD11ft5ClJzIXeMiBrkEDZawR0luJRv99/Wx/qKtPtYxNVejI6t0gdzJwc2Z/Vho
	MjoSg9Kdzxyev62SHueJcYrwMItFYzl89lyEAbb0JYW0stLH/3zWuqv6DUSn38UqariWzkKr0Yu
	IDlgTmqPaJgqlBskF/b13NGb33IVSzPciNZplItLi3Adp7uaH2FBbYbUcCs+/VVbTCvHXreYdtd
	gpDhq30sBjLEfhOx6CwC1xOBJTU5lgTXGu7s4VaKncXcjRH8f54qAiRQH/eYX9Z1eMuSul7BYdC
	vLOse26Jm1bJNm4VgHOmYvpMhuzTHFHk8SwWnf/x8E95FCVJKk9AeO9xTpjnjFpVqktWgexNl3F
	PKSI2zXPB0moTNyowTvM3eon+CuXHN8hKn2OMlkDiOsK5P2vHSzoWWz4gXMdjPNE3XKZO7vMkFp
	FAM2aoFXNn5UgQSJw9Y5ehtR47V1gAB+zv4gJIgyuPUnfy2IEnGTabP8zyOQH13UMB21wrHCXWV
	fWnuSHbm1Sr
X-Received: by 2002:a17:90b:3902:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-395a04ea8f7mr37077108a91.8.1787576795390;
        Mon, 24 Aug 2026 06:06:35 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:34 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v5 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Mon, 24 Aug 2026 13:04:33 +0000
Message-ID: <20260824130437.2771-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0


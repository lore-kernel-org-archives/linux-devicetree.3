Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13655FDA7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245075; cv=none; b=Ra8Ornzd3Yb0/KMxnrafuLAdTexy1rHU8nS84ZymnrU09bE0g+K8s82EB7M6KdXF3CKCj8VEeWAMRKo2iaZqqdwCYoDpKRekJAvzJ4Rr1epmE8Mht9SU7w1UB0Eal0QkpqRISuI1nFbWPA+huGhXvBXJQvXe/gaL8uObq4Jkz/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245075; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glNVlu6LjelWmSgBqne3OyTycLjtf4vGiLQPXDNEIYyxTOkc0RovW6ma6szRJo8/K7OCLmso8UvH777O5KaoUGMd5QTceEVz9XyOblIhToU19hFI6KptOR6RgQaLE7mvlm9jhAFieli3vuuz22NN7WfTk75JvcAEi9uWz1FZxhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuoLZkhX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuoLZkhX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-85377c8bc96so4108156b3a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245074; x=1788849874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=kuoLZkhX0FoMYc4suTNrfEeEZbvOSZehTD2Hk5H6lbITmNxG2Qg7Udeg7xHCVzDJ4F
         j+NXxhuW9NoAGYC7DwPJqTESYk2a2dUJ3VVoluJDIF+SPCx21zyL1Yln3pwo8+W7K5Vb
         9AYP0tT+2J4T3tNGIonZ1s1TSCbTpRF12LeAHEmqM4zBNOWDFxt51MdgaKxdQK3nv7Ez
         LExnTlHQoNm9uuVxpZ1GJXNIFF+pcbleJwW77QNY7jXkakx5kp0k5SGIR0FxoImTgifm
         eFdCfLla9FEejyiHwutSw+amQzHXOvhGbJJyBAec2jZNMdaDx0Odb+ypba0aXJpczh//
         1n1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245074; x=1788849874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=YASkZJnfWpwZyaUT5ciw5RLq5fMbFiEGbVh7di4iu+3ChUfPvqn/GdJQkNRRG0omZW
         P6ZS6m/FKAlMT32nbWzgthZvcRzZjerpS+8RiKDya4L44LzxehiYDpT3OUq48rnDt4UE
         6w37sspdNPamVE2hG/2Epu4OMAPaImnvNbIeZz+47DNriqikbRMgFrSWbyMaZC6cJ824
         dICuw0EoVFGlU1Q/G0JADL7fUsdjHF04jGArpnMb3UDhiuuFBpZAUeKpAp6Dpm3QEbAA
         9IeddOTYtfWDG+t4yjiLCPHmSaLKRm3We+dQYLd2hPSIl3Wz/zm8nY4TbTc44bXYJruT
         tv9w==
X-Forwarded-Encrypted: i=1; AHgh+Rolxl/iTyVotkDatXZrNm2o5YM8LYHJZrx+bAdKPygslTiF9nt0TkqJST1Q8u2XBhVcYS0Bhsw6etmB@vger.kernel.org
X-Gm-Message-State: AFuF++muqUzVCk9Y7asBPjAqtKoBFIB25cHUR/JWrhrrmJhDbMJB+Ex6
	qTTqz4sJHIJDeTXu60hwyFhjONUWnjGUm5deCHGXImKdC8DfA6CN3o+G
X-Gm-Gg: AR+sD105RmPhusMXpcKAaJVKZb7E6XqLV9LRpZdpyoTol58GNDH3MwMwijePjQi2kvF
	cQR61NjkLISeASjztP22UD6Wvw2XjW099Db/cqhtaNak8kENbPBy0G+4s9tZeq2RxthyKu+p33c
	3W5e1MZXEXAiwhpjV/QwDxTGwQ8buNCF+6qHXKtD+neHmgKS0YIhhAGF9iyZcy3iZpP8SHG+MHp
	CE3aVhahmKUNgQu29Ev3bHNC3nTSbsL5uvZE6o16VVMJKfWwYb02JOtscY/ql0/CEIo70r7pP8n
	kRMaULMJGRm8eeNjeBXzBWIaq1rURUXg6GpC6m6jpGOACWax1mz+ufvqBSvAgDnNH013jX0nwfX
	V+2Sf3Ex7DRLii8HN+MppVpuBI8d7jTYLKOnNTxfMO5RtxmWqkqXJPwZvPPe78II9XEJujvkpgc
	seOcbuOln8OQeqNrWeV7ceigoHDvOceVADxr91rQPoHKmhwFIkl9IQMv77QGyAYzPyutvwbYXfY
	RKv1xPd7q4WF4yzkKO6vKjn
X-Received: by 2002:a05:6a21:b8f:b0:3d1:54ef:e8e4 with SMTP id adf61e73a8af0-3d2688bd7cemr51274908637.17.1788245074075;
        Mon, 31 Aug 2026 23:44:34 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:44:33 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 06:43:46 +0000
Message-ID: <20260901064357.20055-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0


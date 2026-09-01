Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB847AF66
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254786; cv=none; b=Wjb59RlujrvSiS8wLP6l/z/ozlJsy49N5I/eON4s9c9FdRphDhWfEyIFDDPb5MpYHDCxiAvudlFO3BDBCb3QiTXRjv7aQ3TKpSbiPKEAb4DoH6Zyh1DggD0tMnQZrCBs/lNgAyYvu4RcddQAn7ahn44LW1NQBL0nsbhOPhyuQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254786; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxmFFFztdRVOwudFA8t9k9H7ZP1THeaSvoas7abt1kcsb94Pj+d54n1uJh0gKEDSvhQMqeIyksvivjqKw7kUPzaeE+/BKDHXW9rMiLnTsSMMDgdzR85sEUn/to4PEMF/1D/5siTajAhaeBbvkcktsdCTRE4xCpFfBnSZzKnSGhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wfjcv7CS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wfjcv7CS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e27035206so4416868b3a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254783; x=1788859583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=Wfjcv7CSNfV95EKHKsS0HtfoI+zeaZJr4NqeZhRIq8t5DodZDA34aWuKv1g/CvaqXA
         UTBkWeuke9tUs455N78MCxi644iUNsz0pmbXeikfRPqspJ7Niv3fY0BVy7fUHUl+gTMC
         1BWDK5/tcHUCh2GQN8VEpn5LxwFpMOOzMH0U03ussI2vdyQjQmcG/GaYjiHAhi6M8GlZ
         610bXsiBFRxIFPhmehCIr05ucpAmn6L7/6tikBIzG7kW6Cq3+StV57lu/lqxCgyz95qq
         oKEfuZEkwgaejnPvlbtr/prr1UyJTOn7A4y5oYMOwPiJFUonKG2h5MgYODQgJ6aXa7BQ
         SUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254783; x=1788859583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=f6g5XHRg5bVR59UEQfjiYcCKpyFWFkXdxNs+CrENtNgtWyXUDn5UXveGmQyGG3r6rB
         vQtV5qoWIprXXYQoAHrDZlFC9MQMEo9r8Y4AhWLfGUOXCvKC0WPb56DbATlOiiaWSj7R
         gE/5S365k8j7wNNFLbvDiuXXeWSqFJPvrt5zFKgH4kYtEFCtUFNLi3PrBJ1cObVpUHNj
         3Zn+w/S+TWFoIGE0Rq8NTz9cu/w/H29jzYNiW043thUiSFIvm68KFP86eEBaF6k8V3uh
         GjHhyHGi5Zp/ySTS6ffkUmo2RCX23Y0Y5DoblXvr2kYBXLL6yzUjXsIBfUCguc0nelKS
         xuNA==
X-Forwarded-Encrypted: i=1; AHgh+RqSxNSmzWr8LkcPTD5LGf+9xFVE+Xre24hdnUHlxYNaVJnW0WkRceL0Yh8eMkOTaRo0LmV8OfsccgY1@vger.kernel.org
X-Gm-Message-State: AFuF++nqx5tvo61HPJSs03RqKj2PcD5it5gWd6+pLqk1atbxyoh9OWI4
	IIZWIJvnjy8G/SYItpser712uQ6JQkdjxgjh2oeB5id3k/JYRzJ7wjA1
X-Gm-Gg: AR+sD10iAWy738pPCMy2QHahcXxkKgqLQRfB3Yx61YmHmn13nudajUqRh+PA6bM2kp9
	U+YRIBgEFeXi4BRyTL5cNFFxsagqSMJAxMYdqEQeHYRpAyC5tEVp57rBj8S75CYVMInzf+orK8W
	ukA5vrKuUjUbHugvb2+i5xwZ6vxO3yYzxL0yclyxd0dHAJbB2du/Boa0hmkFmrR4yslN9PNRjPs
	ai0XC+W7g6tsmi7MJizivw3TuLMWm/tdmIvD18DDkVw6TDcpnVV9IHIBSk7xCiphDK6Jshwrqla
	yaE796Q/8KemRGPnCFm5F1KfqU8ZV3jCk4X1n7/2JCJnGylYVnMSpoSlbyvLscDHV0iwrI3B7Hg
	H5lgnjh5oYS1FuStQRAzE0Bn0oMHdSJ4JHM64WL9+7IjvDOIc4h221cqzKPuFnZsIcXKZM2U6Sg
	yrdSeE+c1cJ2+VFW/QdspKFohFYVEAJV0lfNU4MOWV4JOz7pfPEhtN3/txyNiEgYFcRt3BA1OGO
	X0hyHewmcEX
X-Received: by 2002:a05:6a20:6a26:b0:3d3:aec2:4dce with SMTP id adf61e73a8af0-3d7b0a5c828mr8639402637.26.1788254782938;
        Tue, 01 Sep 2026 02:26:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:22 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 09:24:42 +0000
Message-ID: <20260901092447.3028-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0


Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ADE37EFE7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245137; cv=none; b=hjk5Zjb+FitlGhkIUr0tjFuDbR8j/Rh/ItR/eSDB42NeDnaL7y4fJltyrkBccA7VHOH3fl7zmDMHi7Nngewsr+3SZJFrCiou34arLPegOP21HjZ86wDg8YlxPqONfI8H6RPzYs7BDUtiVpVtaPX4HE/P6/O9aNzhkAO89FBNZk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245137; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaQIucyv5VJht5L3J6EvuJQJ+TIH6C+UUScpME6QNpyFoj2oviUThJbTD1AuqpUHhiVAi3ZBb0iFRCDUVNxLnpKzRou8TLdwqWWQ+QCK5LiNzZYhOF/Y8z5Ma+qFPb6mQi8NUT2mqvY7QvtXKDKkn1ege3ZShxxtRqxNrXUiPoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx9yH77e; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx9yH77e"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d7195706f1so43395525ad.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245136; x=1788849936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=cx9yH77e1Z8sZhfdSJZ5Cu2hZ0snWIRFiHpx9+SoiHEycLcu6kPbzAVJYVnshh4wgf
         YG+SciIbDSQqmQMwcRryoSiQozzM3NVhl233uTn7NzOQ3I7A/UsxDvA/FxW/9uSqWW34
         3OeWfltYupz3m5VCzrwGQ4QOxJ249C0UEDMBlJdy5iFN4YFl1selqoR+Js0vRRyYvcLm
         5fYO+JcS1LdMbFpKiddQbrmjXC2ApZMMr9H5M48TXcQPq4VknVKCypu2ytNcPljr0TKP
         jf9SmvH1MB4COX4uSRGA81HA3djyBwGSIZH7iEBp+RXrfeT7UaLw0S3kk5l3hRBR1U5C
         aqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245136; x=1788849936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=L9Ao5DRMVgzv3CTZ7rX4AntfLivNWvUK4xmlJ5wVURI7sIwO/c+bMP2rOU3tdcwOFe
         2qe1uVzP9B/VN83AcPxqrUuaVGGEigdlbgxQWSJ44fG5jdQ8gs+S22bF6Jdc3JTlNSLS
         hSu/zJIwjiR8ghuhK05NAw2wBUJneSdBsYuKg/zE09PbT8okZysDmRWn2K7bLLO/MCAA
         BVz8DLxutajfCYlRJlgAqVDiuD5T+MJ7TN1mI3chiM8kDl3fLNYKchn5tNRsnpQtPuWu
         GODLZ4ZSNiF+yQ4VUBkUcIHkBzAqLw4dEBwvsq0T201bz2rZ1CxTNfhzYvdSMys8a9NI
         IpRw==
X-Forwarded-Encrypted: i=1; AKwUvBwRpG7qKfM7MzYwJ+YoPEiWW+f4IMoVIBnaJr33U+sohP+ronZfvKo//32pEmePZ3Ojmwrf8dKhXDK5@vger.kernel.org
X-Gm-Message-State: AFuF++lg01t5FLNkkI+TY5H/0PXvbeSL2s5d39uNRgMAmDjqHxLZ7nTo
	bCpIB8194NVO/YtZJBZxAI3UC9cofp8+R2XV7g3XGwOGelHIp24YpZgW
X-Gm-Gg: AYBFou1BF20b2d877JE7YpK64vAKIKW/5TBfkMXfRiYDB7AE15zilDzscp1zBbqpzgL
	115Hf7+/6fFsY5Ry3vmTAx5JLmcQA+vNH2V2S6RYq7X49dFjZw2Kq1iRRRMLUVOWtvBsb2H2AQs
	h8XDPh/SL03e7ePSPm1bXmTHLCpJ39wANy35BaaNmHLsVGStohdTEbdm7xHGDP+fhrhbjGq5DgO
	4eWmLRqhUC+tAt9nzPumyJbsYhvxNx/4eELHnvbJyueJPZNoKnib5TbUCKhyHkvrsN3zuWgkB4t
	o/apz5T/H2qWGDBP28AoIOWgizIL+EqrID8+mCicPjiKf/g0O0kLGRUYu+woVi2di/P0sU8s0C3
	ZmVYxh8WOX0b36f67ZCzqjxJ/paaUxCp2TUB/RO0WvU8j++ovXJDqDnKNeiktwKR48gKP9Yg41E
	QjPbayWhycU/oyb/fdmI51wMkEBKZ7wbwqCUp2Zqv18ZBZuBbDjo+Ya07033mHFxYCy8lpzYFes
	XGXDUwXrcrq
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4cc:be65 with SMTP id d9443c01a7336-2d94a905007mr80536945ad.18.1788245135571;
        Mon, 31 Aug 2026 23:45:35 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:34 -0700 (PDT)
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
Subject: [PATCH v7 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 06:43:52 +0000
Message-ID: <20260901064357.20055-8-sreeshankar0910@gmail.com>
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


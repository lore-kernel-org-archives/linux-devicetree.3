Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299A38D6AD
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245086; cv=none; b=ljWkfLt+L6Tzhy3F4yYkmXK5P1Vjb1Awws5oBbT7H+PtVdoTCOPUGtg7f6hTEdXMo+MLcl9bYS8NEJBp0SjJjEBZBdv5ZnJnZKvf/dqe1f2CJzaJ4AiBVCuQaot/+7BviaBfd67zb2DduF0wDaCo4DmmVCx1CeMu8NCgi4icccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245086; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cn3t5U1qPpTYkvV9PMWO8KYF4mglscwCRgKRJWba51yYlDmuOyipoV+pHljStvgVj140muHFBJOoCM4FL14C9I4BlvJ8nFwfeRTalATfUuW1PQRQ3TdyvazbKl2dM5zQ15kMUqcjl/zqf/84qBX+CAMwR5HMPynjGOnhyaxOA5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQYbTE4Q; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQYbTE4Q"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca80d708489so551852a12.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245084; x=1788849884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=lQYbTE4QqGdE0wQwwuysJR1UqNoFXLSrRZ+BftyXSrgZAzPEI4/M2xAAxr/EgMzVrN
         GrgD0PpRQJkfl9wcpCLCbRNC9Cp4rfwTty4HQqLcdrVAlwr/Z6V2vhZioofHYsXauKFp
         TZXdlDgYSOywXqb+RfUx2kDECKp128UnKWTEiy5PlvCCChZYFli3i6Br3ucosVUyOUk2
         jm8AbEDcHN2BRE4GX+Kgk7+jluxRpZl0719cKD8RYJQuc4DYTjRbbSWJJoGpP/sLb3+u
         HPAYSCnh7NBwRS5vfrknYI6qSKILABg1k9cIvy2bLDHrR7vAuBz6vVsCd0iRH3gUKEz/
         +orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245084; x=1788849884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=Nq9b3zkb9N0ZKpHezCiDuRAD403slUVKPzxGenBPjQRhFtXOp7NvQ+eQC80rTkgEwE
         1LRdrELzhGiEuLBmJ0kRirew6cuc+zfU4519w+hrGP+07A0+wmx8OGrrOt2ezD2xYrNU
         ytRbcgSZgsIXA5ucEy9j1PGbflZ4vXeJstp9KVGGM3XlLFhterResy+uY3CLj1QhRhOY
         f7nE/AB2cL3UFQlPa4P6ffDiMlUqz9r2boEiUN1K+e/zSTZEIQbM1XV/cUoRY6rgvG7U
         dnoA5KXNONPI0OnbVy+8phGZ2jJ9mIMNdjMMHqd6AicZI8c/TU1vohPyhSMVHg/MVVmB
         PTCw==
X-Forwarded-Encrypted: i=1; AKwUvBx1orb/7+aU7Imm0+COBjlNb7y1S4VKIIlVuuGxwctEyuQHefIdnUzDxVcj5KBfwUYKeL9GAT7T4/M9@vger.kernel.org
X-Gm-Message-State: AFuF++m7rKKL78GDBhVOOSFSDxYZUB9rH0IIQkDSwKddhkZtQmb3fhqk
	qiqGqAOf73kNNAis7j0mHjAH96G63Uxy+CUso0tMaRSgIVqV4pQIg35v
X-Gm-Gg: AYBFou0465XUBcfGJASXqqECPLkuCzniz7N9e7rAff/0HWrXebT9l6Ya6nopXh7qVrE
	vaAHnV+PGfoNqf90etGklvgpR6eF2oCLxI3iKvWZsZbWovyQKXzv4zz2iiEt/ZK7hvu43dNBvMp
	PRFmNZ4RvjqaICF6/No+BZkIbsaocH4y+T3kLqGoAhvZNx9nHa7OT5/3kMBNn/WunQ7daqBwno+
	ajGHWQ8j/Nd/WNZqr/NMUkMRqrlB3GsRq/U3kEN38l5FG+BS2Y9sfQCUi1fDTF2KFUMmPx3duN5
	GpfLTibJzaPB849IqyifyB0gFAQPmSmHeUoCJbJWiKkm/JbKaX6P5YN+oeBbZbJ5yRauH3hbMy0
	fh5e9lMWnr56OESgzp2WXXIk/Q3CgLhwuk22WHYIh4VVtd2dp8g017myaMUCxkVgb3lZcEYjC0+
	axyjP44FDfF1lgt7bC+1sQ2dDoI8YdLCr41OdIOGqqfdDDm7PyEjlzXTiZ32p81wiIgil7ntJd1
	nkgul8arv2L
X-Received: by 2002:a17:90a:10d7:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-3990f1b223cmr1809753a91.0.1788245084147;
        Mon, 31 Aug 2026 23:44:44 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:44:43 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 06:43:47 +0000
Message-ID: <20260901064357.20055-3-sreeshankar0910@gmail.com>
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

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0


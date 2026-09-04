Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99645221C3
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547880; cv=none; b=berFe4IZfXl7/4FfmqtDHY5uBS0hWgNOsn4LyhtmCOXNTrVQlQyZUuWOgISrUXV41euQ6su2HvhGc4EeXht/X1IkVQL4iVDGoODd4WMc53JMIKm/eRsLXtFLESv64v0tU0uFhkw9IQK0Ihs671Cl60MUEkzhyb61Ssy8itenPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547880; c=relaxed/simple;
	bh=ANtqbgCd+Qn4OZkETZWDUVmcawqHc5YlKvgeXREa9l8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7qeA6ESHMCzBHrU7ql+VIta9XQImtxhYXSt0hcLteEcD/+yniXt+zkJlBCZZkVsvNTavYQxDlQb1F8kAEIU4/hyuLTS+6gMSHCvhepPyZGnDGXngy9Y3DKRPIKmFeusyNkxopj+MoTfoxAzwoijgug5ky58IcjBF3n+kwEpH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRL+Q45F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnnIm/gc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRL+Q45F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnnIm/gc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHnXP014291
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 18:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=; b=cRL+Q45FdSXEgPKc
	Wh1NUXiPTZI7Ik6+OR7rRy+MobUJYgM7+Q/GxuKN9QlclIC6pzph0vEyaJYd2yih
	oKtbxQ/tDh1moewieoHiBKksVXKF5vbw9b+snTgd9trPRuaBJxdz3RHrocqvejVH
	mEtKfJSkR1JAjIR/7MwXvnLLugU0o9YA5S/TLJGr260St3dpMlobBofWE8fRKWdI
	3/bwI0ywwp+2o9XWykssU6RYaheamwEZUfylpxMQR99KOgQ98am/ZJpvk/aPRFV4
	H6oEI1xgY6dY5Jk3ga/kBe6Y5FmATfg4RUb0uxsCNysoULqhqs5bQeKcExZQbZuA
	ckywHQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00yh6yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 18:51:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d292eac1so2864529a91.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547877; x=1789152677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=;
        b=PnnIm/gccZreBTFlO/b+HiW2jQ0RKxTJAjwMb5uQvzyEsrzLGHARgA7VlH01rAGmHM
         wEC60yGQT6qqUWiLl0UBzTsV/33N3DnhKN2VnOXrrxQ6GOibC2Z03Is2nhpcz3XfyY9K
         e6bufQnh7jw4tHWmh6Kjt68TPavMmQLjvHNRFiIBlnfxLSlt8bIEYTCV819KPpVbMr1B
         9/A2lFJs2TILjWgWomMZ4Rw5VFa7XUSbQH6/5+lpJIBgne2OqAQnTXiBGX1bgoN/FSdF
         ExZVBvk5UbJN0zq/+2i0ycYfSjYVoyI5xjNA0IMGZpcMNDfKYM1+/nFb5dZWrxGJOwmc
         qGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547877; x=1789152677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=;
        b=Dhks7fV3rbV1r9lzNomwib7P9Cc0sKQVv3itTzdqkRuLniTLRpYbhMyG4vyIoB6VUg
         zqJDG0/wjikvwR5S/vduBI9Xw/051wWQqSEmtasb2NkkrUUYNigYMS4V5MMgDg7ld3bR
         s2Zk5MAF2mlF9vurZZcooXsAByuV+DQy4bObSZA0Ocwvx9s0Bpg0zcHzJlHoGYGLEGo7
         /zdrg86ynIdbUjRQoZY6pmdnVS9p9PAoLvSSuMNY6BC3aXznIpoTsjePpE0pO3AbS3sN
         iFLc1M3LELcYSy9TuQw4Qv1rZ1bCYOFwqP1Wh5s+yvD3A+xBqkwIvGdzEjW66O62DZg9
         VYeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxywSsrF+NeOo0Qw+GQlaRlk1Vt7Q9j55ApehaXc46LMOgjLh2ufa3zqvCvzEeg8n/nI5edgcfMrx4@vger.kernel.org
X-Gm-Message-State: AFuF++k8Ri/naO7tSK8M4HyP+i6L2YVs6RT8AGniqaufhSdcsTraezm8
	XlW3ZGGZLz7qv6uBPjyvcc6NWncrbadj/5xz2yVb/OlU/VgIbr+hDY+UuYheuGt5L/I+Di9Xigc
	Pk5X8Yhk1YKLeFVR+1Z8Naw34AySAHeMBywc8Srx4k3/QpHwzq6cKpFLXV6PVx1fzvMq8qfup
X-Gm-Gg: AYBFou1AbQF7159JF7KZ3i5Bu4UIF3SWgfklUGUM4bGq4wJPgYrxe3rRd4LZ4BDD3+q
	N/ddjfsCb54sxpl+dSKChQbQJyJH0cENcq7hjYi23OmwOaOyu0mTB9UkbkfLUcWXxIYYpby+Odp
	gsw20BG38E+1QuHoqbWgnuXupetgucpUV9owLoJAgNii0aeBqdw7H4foJT0na7VbsFcj+EJlDqv
	zmxdNQfE/shMShm4Yhwhj9v2cw/hC8jRuGvsTY4ECMyabaIpHQ3Oe6n8x9gnXEoqcZyociBSDro
	5aj9W+mrlzlu3kbKyKeVE7vA/jiM06ngRaFd4aVJsiIoJbo88AnheKS+t3o51yOoLO9EgCCrmeG
	Ugd/W9hWFeuGOEQxtgZ/NXp/8YMi6Sfw=
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr13448768a91.1.1788547877003;
        Fri, 04 Sep 2026 11:51:17 -0700 (PDT)
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr13448702a91.1.1788547876563;
        Fri, 04 Sep 2026 11:51:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:45 +0530
Subject: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS RCGs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: l3B1WofYZL8lPZPpO0WwZr3lgVjl1s5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX4HD2Adn+C91p
 hX3Zo+S5/zFb2jgQa0KdQV/XZAfBSWxwpJNbbwuBq/YNR7powOweUCfsh/FjCnFLNdKsu2csFHA
 le3+d8n3dLy+Rd0FfvWhMzW7Mr42zfelQY43i6TI/4/7HDrLJ5IsfMwLqcVOdJ1aIRK4z53CCzc
 lAv+9xfc485ibGdbwbB7ANJdjEivbuF7CDsDibeo8DnHrqTgYXXqzWiZjMqvpeIfuBxdqrD9n1M
 8xcsgMnIy9vp61fAFLAodIYyMtmS/NFQsffah0wXPWqTAWmZvG1aMV9EKCvttzIAn7FwRbcWph2
 EtVMUPdmkJOPgcSoCWPiBxOgVvJUtb6WANQVXBidef+DchxMG0zu3YvhNxmc4/ZNuIIcVM8aV7Y
 9qZNw2b0JJmFLc94l93eCHsBZM/uVMC9bAY6Xpq/hallriM/sBPJd3Im3K6n8TJJbz37ONiqHXR
 yh5Krk2lm8+pyDV2GTQ==
X-Proofpoint-ORIG-GUID: l3B1WofYZL8lPZPpO0WwZr3lgVjl1s5A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX+pNY25ZwIfxt
 dGoI9WAEENf8JQltfR5t2GJmuiU7rigGusK9Zfk11i1YvS9obC/8pkht5UzLLJPaLcKnD++igwQ
 WF4+b7KBQpYHC1j/D8zJ/SpbiEMIe1o=
X-Authority-Analysis: v=2.4 cv=eZcNubEH c=1 sm=1 tr=0 ts=6a9b1325 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bkzknT1l8MNr9lhMUYwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
during clk registration.

This ensures the RCGs are connected to a valid running source clk before
the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
sequence.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index a47a2c6b961ba01edc69be91e299a190f4662c3e..1957c847568afe3769ebf00a8cfeecc8b0a88bac 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -2327,7 +2327,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2349,7 +2349,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2364,7 +2364,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 		.parent_data = gcc_parent_data_5,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2379,7 +2379,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


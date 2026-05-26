Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A30421A17
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821078; cv=none; b=LqF4SXEd2lDFFCbL7Vr7WYvWbAlexT+R27AUHFdxuhL4BvOW0cetfPZTun+JzVfPTuePFu8Y51ZhGhkLZQiJCjix0PSGuyK7qETDdl9sX13bQ6Mgs3Qo0WrEgSraaxftktxo+IoRExxqw29NkiOZpIvgFrb+XDnTxvqoFok7/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821078; c=relaxed/simple;
	bh=jeAKj0RWs2bn/MG2dIU3ko03hpgyCE248uGV4oULRcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cpYGw7Jm7NWta8ygiGuJ7EGlJaUWopgYEkFZueOqtL/DVnHuZakreJ8JwuthMT0FEPvloB9d7SDcvDdtDqD2fteIQsKd+LsIPmfaNeJHP2bvOasRmyEwAdascjnDAbg1zinXDvjn5ff9+jGOlFgvwWwLcHLx/KN8ZpjacJ6c+5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bsq1qyYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWEJNWf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bsq1qyYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWEJNWf0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1eEU069558
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OjYc9twIj7K
	xaKaSOCBEljXetjS6PpryUwHzkWxhVKo=; b=Bsq1qyYX+xFzR1iy3WfMF/sfaiz
	P+kn0W7vuOrvWy7U9r/C/IcUG9kE/wjaVXdxyt3zUC1vKDGk46Q053NXHPzdK5kd
	GZL1ms7zA+IO3CKu+vHvFxEDLl+3m2yKWalnOCkJ0ND5te0hXgI+KqwiKHFwpayx
	jfMwOUMA7Z/ujAcwgtTZA4ten9IgkVmucTetDpyeQ8JKDihxPeS8iQwRogJmeyTB
	YpjXM7DBbsWv1HtODGQdzQWC5xhaik7eULonOK02ahybIf0iXGGEbDuYymqFoA3T
	uyChMBlMcfATCpi75lU0+iI3j9K8oYVk4EX9LwQ71P/Lt2zQ8W1J37JYXvQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yhpae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365d8e0efaeso2430443a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821075; x=1780425875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjYc9twIj7KxaKaSOCBEljXetjS6PpryUwHzkWxhVKo=;
        b=NWEJNWf0pRHaphQWXQOVG1XtybZlNlHOycqBmJGDcDUFJjO5o/kLLF2kSOJbYZyVEo
         svY5eE1cxD0PfT5//riqh0PyC994VH7CNQLqLj8jS49RY4oO0FMIXCvFW2plPvBWru5E
         dkPZ4AJbqq3FcuNxi5YnbWEMNAUvYoNLw2ombgPklCoZKO/WDpgbDpPUvLX459i74jDZ
         iNqJtHFPzQXeuYQGp2Ng4/tlPtofdLwB2lrIPmPoEGne+Umj28HRnxtPazQLZt7B63tP
         /O0rLB5gSbVRb+Uq7yQKydoJMan5cmwuWcLzRTFy5php4KP4uvod0gaCmrH1gU5ZM6mb
         W7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821075; x=1780425875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjYc9twIj7KxaKaSOCBEljXetjS6PpryUwHzkWxhVKo=;
        b=bdTuByVW1Z8yBLTqytgHkIACq+PhzK13xdX8yOHGC8rqZMSkbdobkmTZzMRlIA+zPC
         uIN++rV9Nbz51PTifJhcirrB9swshVCnGU1Ra2SeZPrD38S10FOq8TaFa/Q/qsA1E024
         0cuXVAOoQTF5472mJf0uT6QX5axjgdHHHVvzjnd94mymdhA09VS/mPzXzudmBIpoEgv2
         RW3SGHdSJaQQLe5UT3CNAEMk5O/GTKsXjNqyx4K7CpYBzIPA8A0ZttnyVRjCKBvcHD0B
         SzbQIDzbyK/wrU1Km09/AXBJu/uz0+4P06PxZm8yyw5GNqk5/bfC3QFXc0Rdsao/8a0W
         FSWA==
X-Forwarded-Encrypted: i=1; AFNElJ9d7tFEMygWv4bW6dMaZwFaRT1ab/fPf3pcRtBceluyMCwAwWAu7J1E5V9nTc/TjEkTQJSS/LM1JjqA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99xEP1WNcd1HuLJJo+COnx1bTF8YUETZXb1HxXpMEfqEvylb5
	YnyS16kxTp25zykmQYvG5OU1in35gkShRNCOY1E20RtoH4v50E8+RlnxG0eszDTooAiRn9pL4pc
	OCqCnjTzFHDoef/Zi+c8BoEedgmiZD2hGvYilaHcMFFv17L4PcJ2hoiL1LRuOYeg=
X-Gm-Gg: Acq92OFwybJvnKy4Y7RqFYI68kRtn3m7Sd3rsa6sgl39wqEPtOHCGMvyk1nV4j4pPbO
	uUV31g0cJSQhf1/PrtgODhFhZ4DvUQV7aYb8lvULYw7IkqdwfIhb2BmZeZcn4tjdQi2usBkQwhj
	IZCRoPgsWNvynOr4mcVscqQblhqVBGg+y1MdhDRqAGAG2Rri6ZMPQtMrD1sp46NnDr4KQ/fEzmN
	Z7/ONaDecLkq9K9PZeTFPRvz5MEv/l9ZVDBpudFOLKvMieZ0ZVNG+trSKqH2zBfB1URUX1oTENh
	SZDxpmI57Q45Qmr1XjgwwEqXrXra74eL91UehziipGwSfHUA4JWAEPruAYVfWujp+4fgw/jEuV7
	NEuSjV9DSpkDK6QRL+MgHH4om2xBRbxMDayohWmw84F/f6I7Hm3JMGQ==
X-Received: by 2002:a17:90b:4b91:b0:36a:5b60:553b with SMTP id 98e67ed59e1d1-36a678c789amr10254033a91.7.1779821075256;
        Tue, 26 May 2026 11:44:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4b91:b0:36a:5b60:553b with SMTP id 98e67ed59e1d1-36a678c789amr10254018a91.7.1779821074763;
        Tue, 26 May 2026 11:44:34 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:34 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 3/4] phy: qcom-qusb2: Add support for Shikra
Date: Wed, 27 May 2026 00:14:00 +0530
Message-Id: <20260526184401.3959717-4-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wI-BBFUZpaUandHmkkFG8kOG9JgXuaXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX6XTbK8IVeRcN
 Q8Z7Aai0OK5U1gYQFau5mFZ0Vdzut+jQ+DlfZrOO5800BkjRZ6kHQqIWzJICKOsvuG2dXsiwsSN
 ObV4c/SYYsS+U30gsa579cV+njhb7vGI0LYAwIB/RnE3eC2zCZlElOhcFHEugXVLpdmFAIPp+xU
 eZcATW2Q0bJwAMQ+q+ZXptuUN29DsTiDJ098R8ftQZHu+sQrC/nFUmuELS5VzvajiELr9gWRVoI
 iwwp3xzQG2p19ZCF6YWdoDxVWXQZ1YF02cBwcPlU6fCH5FSPiAeTv0JlsjBnKZ8tPr3QuMpDOkU
 DzThjH6x+VY8OJBgpusUjqYo+jw3qN+cq2xeiGDpk6tpMCxxNapJLk59Ub4v64ZmtJKhoX8kMnU
 83d+VFjblxXMIDRJ98ee+Hh7gLz6fBJM9nvnYKbaCMrRKgJpQPHHX+S2guX36FFxiWa2/assK3Y
 8MjQiZIKGcn1JtB4gnA==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15ea14 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2jleMYo8EjVMK2M3yooA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wI-BBFUZpaUandHmkkFG8kOG9JgXuaXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260164

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..ab7437e7b751 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(3),
+	.update_tune1_with_efuse = false,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,
-- 
2.34.1


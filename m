Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE5237DE8C
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479660; cv=none; b=LBDe35H9XYJc02W1p2bLVXAL4te3nghPnXn4rtl35i8QcVsv9lBQIq/nqqv15nGKaEnqp3M9Yc+2x2aXtdkDKGXfZ1Yv8PyZALD6haQvjeq7cj1jFKVePnq+4NaklFhZrznX6fkTZrWYSE0QsE0DWA8qE3zWhfy3SbbP97aZEkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479660; c=relaxed/simple;
	bh=MCragVeqWGfwwLMtO1vbVTdRFf4q/FyUz9Na6DMFRdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXOjmQSiBcQ/UU9hFFK3oIHEnFc9k7qWKjf4RVIgIboYs1x8PHDQ0MFZ8BquaxraFTjpZC2n3ivxCkIXk35eRejn6n+XF4as3WWgQw/Y5cvSJ0b0uU176+P9a5a20cuhlAhY54t9DinM4C6SmrH95+1MU3g0oNzagfaJe/VQlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn6a3tCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItDcxg+e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn6a3tCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItDcxg+e"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFvIgI1816067
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+J0UtrHxFLw
	6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=; b=mn6a3tCzAP7WBViZYz0o/u8Fgue
	y5eFgb0EtTgVQ7y6mtl/2hypXTOO5MfyQGdnfEcbpofEQHpSJCDYnt20wmDm4hC/
	vmpQp/v93iy7WzUIqBKgQBv5cnSWbTMwRz7tvIa49UJ+vzDTPRV0murSmh+VW6Gg
	9RbMMiG9Sm24dyUvXqabYy1yufOZGGFnCtd+v4s4unEb4Pik8Spqg/trnfOSueNb
	hXdrKwCmnlyzSJyo8tlT4WYuQ0rpT2mCJU4Nidj3f3gD+dd6Wcxtoy7Hq+BOGS5/
	m2s0pEBvFdymiSgyyaJz+O2YAmhmIKu8+81kgghjpgf7hdccx2potdsi4xQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm3m8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so129253115ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479654; x=1780084454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=ItDcxg+eLhfXkX7Bzp1i6U9OreTAoYXS/jlWdBh5/eN53mvFmIQKXROoj5vOt9yPD3
         l3ZqnCp4S/7TU3jM4f54V6CWLfLjQXSCfkSMJE4Saey953vEOeiZQBe2Lzc8u8vfKndZ
         I8vf0cIE38sI+7oUxxlAKemH6FOWv3WSTZMz9QkbKIAbBC1hbQlzAXy21EP1vqDIdruR
         4aW48UlFm5OxE89hm9i0pvALwqb40JsYogLs4Kq9AWLmAqMw414F/zOY9XsMeu0M9YM+
         k3lmZL+F5M5hURa2Yzx7sAqBWapsW0qScwhYynUk60kiV9sE8GnoArX4Uj1itegU8itu
         nSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479654; x=1780084454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=n2T81L9uVNh+nart9hcjRGHljrp1OcEX2+N2SQHKZvsiEkq9Y4y5kM8f5rMy4ftWfJ
         sFFEhr51uJeTATFMjLiD3NbMv05PieLJbMaeLpuMPm044jizNR8VUuoDHEdU4R3BUSl2
         pSaHqlCfBL7PMgdI3BwH1UFuZGte5O3FUEGVledHJBNKmZEBMSxIpQaFLqKEi8hF+siu
         9Sk+T5dfpeiBscgxlge89TPY0DCAD+pIB8hAnDP/kdWVgK/TUgTZkLhWsTcfUWPlTXs0
         o+axiFcEprew4SHXpn60KvUxuGF1HqaWHfVc9yXssJY+evFzv3rbSyxjoorag9C5rMdE
         ODHg==
X-Forwarded-Encrypted: i=1; AFNElJ+lJsdMwjS0Jz6PcbDihOPSJz+cauiGu9e5aY5Cr4BBv5dYVH8zKUSL9EhCbivkdM+RwVoEPWwCi4R+@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsL1DSUMOYAxF+NiZkiXidjCfnDhd8ZJnXT/nBmq92gQJsH8r
	PXfKMEldEWSWFhKyP2pXoUj2nt3YPkYknhpXMs7FwCdmus35CjAf5Nzde/3ugw/2eCdeBQIiMyF
	ZuW+iR35OOOJB1D+RlvcB0yKdR9ARvUQ5L6iMuersYdMxbSGf0+ITM/J6KvnQSgQl
X-Gm-Gg: Acq92OFcuKpEWZXEpqvBDvO/l3L+mNshZQSlUg1wJ52zMyHpJIoqOMTtWvn+higcatg
	LtE+IDzn5oqR6wo3RLcyhTE+pqTp1AJtp2r124vnf+NQjw5936HzHHLbzSMrfRpKVuoyPUk+9eG
	eHWpkSo3VwCIuPnSsuOsQnTX9nM2t9sHBdg60C+jld8cEC3CGU+QSj5UDOiWeN0/AjJ3/9DTv8R
	XrbQU12mhXs+n+Nuxl6zS1v3F9QPH+V9katSOyigMZBXtTecWg23JXoW6NKStpevn4mfQbLTbWL
	BIUb3m2hXcnt+flJlAAg1k+y6qvA3iXW/EjNSFtKNh72uLhe7/l3EnMVEhjog0x+unvJ97pl1le
	j+KXpaqzJE8myvpoWwUp6AfGjNDncoEbSEFr3ZsVpeB8PyBGC
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr60344165ad.1.1779479654341;
        Fri, 22 May 2026 12:54:14 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr60343705ad.1.1779479653866;
        Fri, 22 May 2026 12:54:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 03/18] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Sat, 23 May 2026 01:19:54 +0530
Message-ID: <20260522195009.2961022-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WPWql2AFfABekE5jZPPdG9J_87ylMChM
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10b467 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GEQWD5Nhug1BhVu3dP8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX1wmKiAMUyqv/
 jrnycxHmbwwhrn/kx1AaLUCnnAUQwY2ldxpRaKmSf+LlPSzhOwjQPkDeXS5ovuBwWTCZqxOxQOi
 LzSJckmb0OMecMN2TgGWqH8fZ5P4+gAROZrmlx+yOZGmkHitA++lHGCmqZAixoUIlWa4mwxn10g
 SGMdtxtljS2hHc2HtsAx6MX2flbp8/CCTJaSAeUfleDjCtMJ1KIyOYClQsJNCLC6tCvsIorlY1F
 U/o0yvShBk2u+vtN3vdwd+xJ70j7bDxt9PZpMEfjpKiQiuvDRIN6S2cxXJoN0pWHEkMyA49Rmyk
 lk4zqMTXm3wT2ysSHw83sSFe1xQRQH5s1n+hQHD+dk1NhALnl19ebckBph8+maz4yGrFrPDN8my
 kBU6bnUlPLIauD8sV6UGkp00IGr5KZlUK8iltdYlxmK0c6jYCh39d7xinYpFRITS90eBVGEIcfM
 /ZCnp9LDEeFJ949BOyA==
X-Proofpoint-GUID: WPWql2AFfABekE5jZPPdG9J_87ylMChM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Replace the bare `return ret` after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..52432469badc 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2747,7 +2747,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0


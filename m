Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB0E47DF8C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844228; cv=none; b=p5awTNDEoyoRNeWNbJ1T0PCAVFnP55ninot6eHJHXHFi8eMnVw8DJ6fubcA6sayu5DISsLz7uQ9B7kUsaCyGZ3740TLlt12t1mf3VtXjBmqdyWd/hoMH7LDe3lB69Q8pr1zVnTmxwcA1Pzu9GtlWJUNY03fQPe4IS8+jOWYoVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844228; c=relaxed/simple;
	bh=I+FhCbobG6kZdRoyaisDIn3UKwT9sap0kLYTO9LJWVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADTDrGEe9EPz1M+Ke5g0QSvl4lrq5n6hMUe6HauAAXsWM1JXIT7JnNDFyEvgIG1KtykPMit22srpUOnuhdOl8x98PeEoXB8cs6qmNb1sJEeV9UKHBESqy5dljO2WtG3fsAlS5Ep875stHDtSSnVQCoa78pGtVnFJm2nxnM51ym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lmf/tbEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHuBQZIY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lmf/tbEz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHuBQZIY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAt0Ah1847947
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uSFq1izJ77a0VhXBlRZJfgQFGF3dtNG+x2g54MrIho4=; b=lmf/tbEzdF6ICGA0
	SPWcXYO8JX6BNlrJwrCrW2lc8dT89Qmygk2pTLtq+pnuITqDOLQ1BR1y9kCYCqgb
	Z1Z8s2JRCfGMw+8qVQxfexqCTiUNLDACJoAEzlrE2qpsmYQSOyv2ml495Bw8ZI1S
	onVTTym3WrjdoaHcHOE4x6P3YE3zgKv5TEu25WjmjIYtt9QtFfHZaPqljJ7DiLpU
	qoJJD3zw0HH+aCErebn8sEedhlHk4nEt/vwVW7JYlC7To/jWEnxTMJQhILmdsGhF
	vKLnZcpW06rWkqF0KbNsBtSXRCSBpzp2W6lmcJ8iSiQqCCFb8he8wOhumAb7Rb0Q
	hWAhhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2yw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366015bca9bso753478a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844225; x=1779449025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSFq1izJ77a0VhXBlRZJfgQFGF3dtNG+x2g54MrIho4=;
        b=hHuBQZIYMIdnbVAvEL7BLCTWV3Gak1S58z+VpdBO0duIGnUwn0ie7rwlinRedkHiwV
         8Il3W/fQj6m+KrQNxu5GQDvLB92VSP6hoxrARY5w3G7ahSyY/iAvH+yECy2jpah0m/y9
         hQbCVB0Y4RJzUS1LnS/KJXBca75Ufzo7cJ5XgSE+U/AqUIsML2Dw6o20rnIOb6yVYx5H
         GH8b6l0M2rygQ5NPVghOD35EtZCzhC6ueF79VwxXzgBgfuumaggbG7sHiT4jZLd13oF0
         NDslHwc2qLjWVbsyOZhI/BB4NpcVp20HRo1pov2DouwlNNHLG+cPlMZ8BEiEk6kikIOf
         zMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844225; x=1779449025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSFq1izJ77a0VhXBlRZJfgQFGF3dtNG+x2g54MrIho4=;
        b=e4A5602nJXJofx+nUXY4NBz1mCclYrVgx3tMicpjuQ6cmzaNQ0zL82ruHFkFzd2ShW
         lbW4ireztuImfY6jYQoNt03v3GafCur0P7yIShhD5J+x/ArbWgdjD9iv8QlaMFZUClto
         TAIapKbraL8X4VS0VR9bgg1iNhSD0XgkRA1OZ5fsHUo3mrpSRYyl6BWP67tmmf4l37/q
         HQ+ABmZeyKg5piIInuGiw/yTAJlZI3VHUNnH30GBauQTWTt5qEQtdCCsQLRCXfPqIrWZ
         r5fLN9CaxS5FP1bd/hHyu3+n7urco9l1VmjnwyPjnqI6xW5UAkSrLychSY3rkDPOqsCK
         t+rw==
X-Forwarded-Encrypted: i=1; AFNElJ/0sQFQGj1sBSuRxSAwZqvaQPQHkK4s6657VAKTriEyiTlmJeqg3f/7BOUpem+bn9Ak0fXUnuYO9+pY@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJh3V0Fkv2GCoQpXu4OeLEt5mciuMLzvlwtgLuqkXsy6WHLsK
	IbsVu90N52TQQ5AjVhcicpaz50QiZnnVL+Z4nsy6dkZPt5O8AzvwBgAc49oczAzQvTULgaqxC0y
	EKD7G/3tBV08bemcvSFrMSxmJ+o7aptdJksmo9dc9wlzgvug7NafDPomZ5ZcOS3lu
X-Gm-Gg: Acq92OGs5nPG5ypvTJcSzwigqU/zpYWInnJvHqIsKKiWEexSz0TYnGqEgnQex22SLm3
	RU6UI0tYST+y0kBhCV+HEq4IL8ULdmN6j0q9Sls9vY+j3qrkntdBYLoHUh7+6y3DJC7oZTnfa83
	SePPRXVlEzLVUpww6MnKn4K70u9fuenYKzFpKWb3wxSRieO1uxo2NKHpek0mkzne+xGRxa5Mdad
	fxkoSoKRxJnHmMWUtt9QJEDZUGESbHAlCicbizdabLAa7M9l8Nln7AKYikZ12RzVMM6z6/SxMnW
	9gKW1OF7LxG2Cb0L3YXeT/kEgMyQqHmVWF8e48ExFQ9ufZE+x2EftO7yVTjGIC11+0H+ddB+x8l
	6Qd1toRaQphkTxKXSyyzFUhdcQxCPsqOg8jIG/FvPcWG5splhiJ5M308KRMc2HKDCEQ==
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr2924749a91.10.1778844225025;
        Fri, 15 May 2026 04:23:45 -0700 (PDT)
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr2924726a91.10.1778844224541;
        Fri, 15 May 2026 04:23:44 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:44 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:18 +0530
Subject: [PATCH v6 03/14] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-3-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=1678;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=I+FhCbobG6kZdRoyaisDIn3UKwT9sap0kLYTO9LJWVA=;
 b=yJSdrJ9U327Cl28LdY+SOP62A7gkCxLZelqSbuJRMwwdlMsr9bwa/rishfpbzasDkgnPXhnQB
 xWl01CKrnjUCS5apq/6NmAuVWSZB2FxH8R6nmdrWj3Cj7pW7WHPh1Ly
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070242 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G9EXm27dpV9j85VmElcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX0gp4gvmpQ390
 FfdoemcZl4dH9pEHJENWtJqb+gTBUJTvTz1Q1zD1sNvPJ2gFOF/O3EgI6KJuNz5KJkPyqRHno4U
 yPmSzctA366X2e9yUcZRVzGMbANKTqa+bKN1Tdlt22ofsXQ2/vGcrAhN3t2YxnMEPAnFtxfYiab
 grf3Xo1XQdL/cJmkyduiGk4abMB9qhbxC1XC/OdGsPzY+qNTT1OVQLW61kniKc2kJSNIfkq3oYc
 09RtN8IXoOYozw2cwqHqrPRMrk4QTLKGYTdSQTE+hYh1Tje0gXmLCun3mQq3zue4sJZrz6Ri2dn
 0e+f5kXnH3owKuRVoskYnO6r0CYXT/ScGKvg53Z7IbEOHDueFPDAQ6HpnQ1SLkMPVyVSpUHgArG
 SAI1t1Z5QYKvsJoQjyOKZFVxcoXHM7r63lwmttA/uQ3VlDhGs/ey5xzxByP0ILxFBGt1F1jqqfw
 SOLW0upoW8wuUjawq5Q==
X-Proofpoint-ORIG-GUID: NJfRtggPtOqPvkotdNSRh1MurTxazJRl
X-Proofpoint-GUID: NJfRtggPtOqPvkotdNSRh1MurTxazJRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2..df76530be809 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -78,7 +77,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1


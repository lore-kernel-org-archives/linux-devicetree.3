Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35933C532
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767903; cv=none; b=cleA5hcXPNPmViqvJiVkWrnyGD3SxFrhjQJGM5lRpcz+gSNQwHLnbA5b0kajMtu9zqEhfpOiPBn1v+NbMspvHb5Bh5gataXnj91QppOp9m8yw+0DAhA5zJRvHx83bXIZXB7ats9xGxy7YjrVMONOgJMj4II8WHXSvJfvVAK2FmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767903; c=relaxed/simple;
	bh=tBPHTDIBlLW7JTM0R4qCnebwpFSDqhthFiS1dZu/Rf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6My8HdvR1ExRHDDcitfiJds1F8SkZgxvoE1apksuYaGf84IMNKNc+qhzTWlnhVA9OUa6Pc9eff7IDgO6VNWuflPSHs+/Z90w7CjuGsMMS2VZ5LbpxvmAtcM4clWPh1EYfxtKwxAEYGQCvkv4JDvjz7QCkcTmI3dRJ+v6YQidBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxfMGP1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGId8DTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxfMGP1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGId8DTQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HkUEm2698383
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 20:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=; b=HxfMGP1Cc61ZSdNj
	mWUNpK2WnzKM7VhpojosAi+i+gpyfS1JJqxjyuLNHl5hVEYeUoHR766IJHjeaZYp
	PlwG7oOouXwjAC9BGdtWt8O2BTlLXFuT4uuf/avHXU57BPZTZb1QPiE4LmspEPOH
	/zQ+fSPT287CQPB55gPOFvWg9V/rw9H/FeBjJ37fzV2PXHyWTrym7l06tKqQv1qg
	cnZy/OO5Pz0odxvwMNS4Pgc3EzTatWIAqL5DjZeOG00gzg8pNIRDM4N1KfI3rUkY
	lIxoJbDGl2zaxkao3BqhXMXer9f1OEJeEMIgm3yvLLwzVIalzZlszSdZdT5cHEIK
	C9SlAg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9rhwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:51:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d443c3b094so1822022eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767900; x=1776372700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=;
        b=MGId8DTQt9h7cFj8WJMf31qBOuWFZWq77JDqX0GpaPTCQixAkqFhDg+/LS4Uknq3KN
         8uLeRKEvHiqFUgyjNVJ6XnK6cphh6R3l5ulJnZ/nGAcrVEBwo2GjyVfCfQ6xkoPzYl6h
         QMrZSxgrbCVdaDzyUKKMaJHOSa4Zbk5YfKhqoN4caY4+j4YjPe7toIIb/DL0E9TrryAl
         xaGGThvUaGhd3fTnwFFyqg43fFEOOs7CWX+Nm82ZGpkAPh1UjSiO0a6K0Wvrqlw7et8W
         YhJ7cgUkfVpJ0ef+oUOvYv+KWEynuGTEgtSZreu5c57mb2DU76YjLIClGGuE0W4kS7aM
         o/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767900; x=1776372700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=;
        b=FKFPM9oAGz8z7DE3FWjySFmFUeeK+wVS9M7SQQikoN9Gty/rd5DADKbji+4pFSPs4T
         ElagODsV/kNksSyBXfNWXSuP12R/jPiCqFcttj9XPWzUzv63zZEm5YyRpNZhp9Dj5GQf
         WykSMi3X2Qy58RHc7xfSYdMEQSH6A/Pzl7p9I5qkehA809/602ueCiQBPTWneUUkx1/+
         iXSaQ3o+M0Pl8ldju5OORd2Jco1mQWLPAGer4EqMPkt3ZIx/5eBgmCl8mAqJlUpzfyYA
         JQNbXjcXay356e5JuPP5f9CsuUDBj6e3fkN6Mbnk3bQzgK3B/0uL/wEICi2maTJ5MQ8Q
         ltUw==
X-Forwarded-Encrypted: i=1; AJvYcCVm/Y4W4NJ6ax4j5PrWviPIKBIfiJXATuSs6uHdxWT2YrGoMgxnKTRW6YUUKI+wkwZODwFD3VHlpcCH@vger.kernel.org
X-Gm-Message-State: AOJu0YywoKip0kx1kC6A7AiY+kD3W6vjv8Dp+hyUFvp2M2rKNX0BJELC
	g1F3RCjePvmcMyI/vSGI0cmSfPALqepU+MKbHVm3cgTh4Xsi6/3Ex/pHmpTNEMQQFOW1zTPJS6A
	s4uLF3nm/l5y4RKtOIewy9/LJRp4RnIPTVEhxU9STEzAK339aar6kocjzbldyADUX87//FjzR
X-Gm-Gg: AeBDieuMFTt3Tp5QWzvPCSHswo91Z+JqdCnSOk/qPRoDcWn5u2Ng7ZctgKtpyWX6Exn
	jBGtCaEQJevJ3VpLxnWNv20rhfm+UgE1mpi8ZBSrfn77WWnlt0wLUR2850BzO/LwyX4tOsG7Nov
	YJPsGaDA4mGh9aBO8Rg/30qPb1hHLtAvhru0iJgci6W0sgX+TVvwDT37to957CXMuIXKB3FmadI
	ARH4CisSY3URZpLQKh+gkGLR4Hl2LTGkrCFuvST12Mjxoe33yeAnHJGtLWn3VucBoOB1wyOn1JU
	6NNQs9PRAxrnu4l4FhGaAdP0dmdaAU9gG1ArghZOPwBS8hwBxPIHBL0syjeyrNV2Mqk7Q8huF/1
	5q2hnfUOEGTQfOUK3287/NNVTh3tAoNKN6wy1DXZV/onxNG1dr0zprUDl0HJTwNuhCMUy/4rBbz
	O7
X-Received: by 2002:a05:7300:724f:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2d588d8a9a6mr348965eec.27.1775767899908;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
X-Received: by 2002:a05:7300:724f:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2d588d8a9a6mr348950eec.27.1775767899390;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:35 -0700
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-1-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=1320;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=tBPHTDIBlLW7JTM0R4qCnebwpFSDqhthFiS1dZu/Rf8=;
 b=53WL+vff5V5Rm9NZrMEylYs4zD+SDxWuePGI0P1VBzoLqMW4viwyM+VY55bXeFikKpsRTpyjX
 IIggrSTF5bWATgK3qc9Z3o3HewZsSW4nKOAGwHEiQc3qHV/3CSK5rMw
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX4W/EpDoTEBLw
 vpn+d4ARy5+9U7Buh51y2Z18RAtdn1pn7NAPFZbP8r/v4j9E7Af88fC+FsROaa3acqE0cypWP8a
 fPQP+yGZC6dh+6MeTmBTJMNq7cJY/V4wGoYETb5NkNW08eOchXppvY+jYRPE438CRcYXMujSD07
 5Beprg5tVoXZN9Hf2vbYxMKrS1a7qiGoUBjZ0zCR+iG+vgg54pymcgyWOjbzTjIBUF9pTe6HCkq
 ZVArhzrpBtFjhGvI4afkMurhH4wzlhfqc6c5S5pwLlJlX09+LmTBCKvMgt8lY/K0725VEKpWNcv
 /TdvnUte7tW6Vr3XB8LQCqPua+gWcEgyUJZG/tSnq2iRfLGgNIbdAQ7SjQQWkC5OpxzD401iwDR
 AgsiiWWBrRO6MyqlWwUIC3Ed3dYXkcrRQcyAH+xQrr5CRcNVAoBkkYoWcBjGQgAHFw/LpM6KMP9
 7aJQGBCmMLZrwryvCJg==
X-Proofpoint-ORIG-GUID: KYcOM1XRvlW31p4rXaz5YYkBsazMtBAO
X-Proofpoint-GUID: KYcOM1XRvlW31p4rXaz5YYkBsazMtBAO
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8115d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192

Update documentation for the RPMH clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9690169baa46..3d5a4d3cb00f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..2d62d5d0b08d 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_LN_BB_CLK4				27
+#define RPMH_LN_BB_CLK4_A			28
 
 #endif

-- 
2.34.1


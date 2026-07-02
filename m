Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870636B061
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017222; cv=none; b=r3OdePSFe5DHrT+LwFEN41IrC0x5x0WLgIffOx8ZVoej0v1YCtQIAE97v2i8s0fINha1BoxBtCCLImRotgyeRBAxkFeUJceFUT+6UXnEVKPo8V2p53ryeS9/Ds68gfaahJWFcecgDrq18eJ02WwOghAww6VghIu27h/S+zg9PSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017222; c=relaxed/simple;
	bh=ySRNjk3Foozy/aJPnV0U6MukIvIZ0rUzBopoQk4qeXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Da8qDOinneApvW3cSDatQUHFi9WyKsjc7Yw7GzPhwLHgpPZQQyP+i/NgHehj9tq+ZvnKudcXkTvMOD2k3O6uUEbCD8OMBuqcSZ9O4cW7Y7mG2ldChXc4CtEWX39oehf6A2vVy/kQhMlzQGKGem90yqiXKfvDy4kk6AjPt4JUdgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgwl1E4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2se9b7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgwl1E4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2se9b7q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3BmP680905
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=; b=dgwl1E4zFmxazu45
	vBFbdKDAr8XzsIEMgkTnuxS/woksgDm3h9hTQ+o86fDTaCrMUl2Ev68Tf241Ze0c
	Ll3s9Ugif/oRFSqnrl4IVurh9Xeh7N7SS9BezzSZsymuBslBF32Nt3LKqQJ5Kkt1
	yuU7u2UZSWnIW8VVgN0H/qjTfJ1Wr4GmDOA6urSzer+njm0BPXB1i1z9ye6lQ+Ka
	cSQfu8ELibDkFsVAKcFfABPm7qijt/sL3JbvPeTkULCRQs1VZi+VdgxbaQdVvz0P
	mfFfIf+papYyYdEvRJfCazgl/o1zS8vnHQV8YWZxD7GadiM5hzdwayWSaJNT7cLi
	Wd7pjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwtfh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so1334595ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017219; x=1783622019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=;
        b=e2se9b7qkAISe4u+VGlbhJetLbzgbc1cNsXWSJnO71FXNYiNhqQqvP4VAWbN+O5zzR
         9EtL7S+xYoN5iTvvqNNlnnNWcNdyMA2zkR6fB2/sBwTMj9XPeD8bsaLDdp0dNI6M+VRE
         cJtgIXVPqVWGBS5LAPVFqa0o61r/2JGu0NMWec0ghGe/bynExGz8DNe4VUFE1URxqJiQ
         f6ZsNjOzMziGsLqtAPiVl4ET9+3GcHze0R7KTLINEXMberl+Icb6IXE3Z4wJpNrv0a4U
         QfUC+S2SUF3MgumoSS16R50UTZV5Ix/o/DR/kMbI6YX2v9HD1koDs4xM96tBMgXkPt/Y
         /lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017219; x=1783622019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=;
        b=RbMd5bV/jg892g9yrlV2aLFzLMe+wmpSE+Cm9DC0w/FRWW47Yc/pkv2Quh6HSLT2Yk
         qVO8/FFWuYJd2ECMvS/fnt5RPsNBFGrUK5nR1CdTXDGb17N+O+ojUrS4AHMQv8Xic30+
         lO83B2tRB/65fOwcPyfBDRQmvoq7E4Ptrfu8s9Hyjktuay6iqhlkGDjdwMJ0AHuMrmu0
         qmTzr/Dl6fSF2MA/N+FGUSuP9yQJFNCZgw9q5eOHxrgilQ6SnzTlV9CZl2JbFpFTXEmP
         wN3x715xoU4FU/wdW54w1hiV4O1j+Pr6YJxo6s2zmUO9nVk4xcECAB/UltWNzLxWcM49
         k18Q==
X-Forwarded-Encrypted: i=1; AHgh+RqPh3YZTMN25okuoHYmd3nJVW1cPdfBUe1i00RGSL6JuFjr7VLLUA8sNFkxrZYalzUBTR1X5xm5duw0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6rKtRmnPnKhFrqIdzBt5HBCKlfCe35TDHaNFsp7DXHGrkhIf
	M67of+EZX/Z31fyGLF+pY8oq0jFcXZaN36XR6/zWYUjFyM3PC8BjFtQ0G1COvlUZb/Zb2FOStY7
	4MZIMBj8JwtN7AtHKBlxFXoi1Q7/Lu/e2Zbfpt8M33T5H5C36hK3k5lG2TtEsj8Kd
X-Gm-Gg: AfdE7clrmTSr7gaqaZ6iQiUE96uAVrOiwHrh+cKVD56t5tiaC9NL/kV6laHGaibHHpL
	oKObL1oOfpcRNDZ8dKharFnyXMwIsCRXhsR5p/+V31jD+GFFrwRfCrZag9czMt2+vS7fSWmTVEg
	PV5RjJWDLPp8AKSOJOMtn72s0ttLGl1b+XpLUPNjMgMFCGJSSagENRCjgTBPvxY1hCyvbVqDAKf
	hxQxPzqXS4EsqU5Fsw+VVh6JrqHkujdh1E63Iecl2r+FxJ4aQ5WI/86NNo9jn79jX1vxgf078bC
	8KTDa4UAQvAU3dX0Xqi9R+RUQ9DherNl1eccp9GoNXotEdFD0Kq6OC3DSkFo3A9+N9JulHp4xix
	vvMRBfnW7dn0wnzP7KxizxAtBC62OqGehGVPpcMqcGA==
X-Received: by 2002:a17:902:cccc:b0:2ca:c861:4757 with SMTP id d9443c01a7336-2cac8614a02mr12939425ad.21.1783017219453;
        Thu, 02 Jul 2026 11:33:39 -0700 (PDT)
X-Received: by 2002:a17:902:cccc:b0:2ca:c861:4757 with SMTP id d9443c01a7336-2cac8614a02mr12939045ad.21.1783017218966;
        Thu, 02 Jul 2026 11:33:38 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:30 +0530
Subject: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: FgG6gXxOdb440RqOfXsRaipmC1uYzvVj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8R4EMU1t/ype
 c0vtFIViXHYsJDBOCztaVJ37RLAz/ponUA5zyI7KyZwEh6zBilv4d2dVLa227bWxsP7pYHhwVX0
 pBaebeFSWwe2BW/YFQIx4HNGA9VflVNZvRz1lq8o+lETEQnDGLro2iq6Giv20CBFJVgvU3ScOqp
 TuON+FLQSshA5CqY0Hy8e8Vk+cYLVHG1+Dv9o0E21h9YO7U9tLZQwndIpX3He4JaDninru3wOZl
 lXoVwhBx37km4CTSREtdupl8sL99Hy+GJYEYfq56ZTm6aVTWHrG1elx5rrYyOqRICxncoBJZFTs
 0ORzg0Cka6IPw9LPfyiPLzOfzi9v/2cmCn71Og3EzuvpclY+8tw7IxwTo39GEqrJMPoSz5thalX
 VXztL1j+KnXEPogQ+jzBLvuWKCo9fmBnfEroowRZfkDv2IsUGCJGz3tN0Z+QSd8DXCjsl16hXuq
 0LP3p/FZC9c12/enTUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8HuZPxtaknjJ
 8Lm4A2q50XAknvTyjyERo/7FZ9oQ0GMnkdHTT4tK1hLaHNNGA6bY+e4/5j8+J/+6d3Y+HDsg11R
 BmY1Kg/jzLnNLcx2xnNdu13fRPQSF3w=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46af04 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RcQCSl0kXxLcSeZUyo0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FgG6gXxOdb440RqOfXsRaipmC1uYzvVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
switch the GDSC HW and SW modes at runtime.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1


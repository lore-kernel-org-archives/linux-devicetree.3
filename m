Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E893363094
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283089; cv=none; b=QisDcznMuva8YvRCl5L3nOTt2vVrmMU/3XPGGZQJzDpoZjhN6whs0PK5FeiAt7OS4ALL6nCw5bZHvEKSz8rvd8Mxj1hhTbl51VRaeaYe+sejJTf+8u/iXQKqw1XkX6ZfgBP9TwzWQY/b5yc1p6tGjTtMDTfz7GcKEX5Xi1GLMK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283089; c=relaxed/simple;
	bh=no90MUHQf0OU+v05z3Y3AE5EXvbZVkBlvgnlrpROr2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQM4pZfxdfAsEGkwqKWJ7MPYKMtu8ZuB90eHmqQyktlObSiVnjVf8lmLPoxEqI00ey6LwURuxx8hTksiOLT16rBSu7VlwcQBQfPodWltyqmIo63dqNa5nsG06mfqP14EnW4loAMEBIyJLuY1tffC11R0A+eDYqVo4nYSRj8d3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/oAhwzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aqh73mjV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/oAhwzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aqh73mjV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648MbEpu257933
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwbXEeAHC8SP0aDjVXo+FanDybsG+kiz/tQjL0K3yW8=; b=o/oAhwzSJz8mtM2H
	S7G/xvMLv0JmW2No6S38mS/MPv+da5MONsh8OGxDswcODGCQTmCZ+MPHIORyd7t9
	/3/hs97kxdtcdAtrY15u6D51pwTemoVFSJkyfqYk2hUns69WsVN89BuxmyA79RJN
	iRS5zEEvf4RwkOQxzXM7zGzO0d26BUi1NHZIjg4/FAEaSvodO/I2rMyJlxhdP0og
	21HjUPcTsD1i6mMepzOapoE3BY7oPKSBqH5GuVJ26Kx6lABFHAShWdWLkE6vY/Qq
	tODv2/XUSJ0JyHrGl/T2xr9f0YeB2aXinRCMPeEbZZINqVZtYkvITTPsYDiS+c9y
	ODFWsQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auekewc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2eebb099efbso185147eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283085; x=1778887885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwbXEeAHC8SP0aDjVXo+FanDybsG+kiz/tQjL0K3yW8=;
        b=Aqh73mjVOswZVPDVK55q3iZYcroNRDMy2zUh/qv6c/atVJkfNfvmJH+lKWqXlgwH7u
         Fp0VfECT6lazB+PhxFNOOXRLBdlS95ckp3qb6tzBgTavP8FNBuY6N6kithnxNWmQMB83
         ukcUCgj9fdGuuXrdjJw78DDCY9kbqO2ZadChqNKI+2A39j4Q4DGstZPtImgcu3dG6hmd
         wzeNxoAoal/J00Uiy4EZrFrIxWsqJbMVNmq0FIYR2pEorDyLRkq3md27YnmEQSzOc587
         j/AO2tSXnK/meBxVieKLP+fGtiaqWFozavTHedYGZnGfOrkxZQelcwdgeHP1vUFOW4hm
         1FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283085; x=1778887885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwbXEeAHC8SP0aDjVXo+FanDybsG+kiz/tQjL0K3yW8=;
        b=MA02pXCZLfv9gm0eZxUYfrxhzUagAJ0erC5xyAQ0iY4VfiFCifBnot6zQZa+2hpV6t
         41JCrn2MBGz6/fm6zV1axTfBxsQr5mv5Uv7m986K+JlJI7Rtj1WftthySErDHcG+NfqC
         Yph4TLn5PStq9ZEli+x9ri6Nw9wUPHSFJFxd6v5BsOmQBDESTbSpp5yvDgt/z/7MFyjw
         NNF0vRZ4tF6F4tm2j1ZkoV++q8XtuW/hbpBUikUQj0ZhUKt9E8MR76DIC4ZmxWSLacyc
         BW68JQYIfFWeCTiVIhUr0ipGq2XUOo7etUHZBO6ihk8LbIdAGRvQVK6QdNffenBxxedj
         +XHg==
X-Forwarded-Encrypted: i=1; AFNElJ/rojwa5wioBhsW4CTJmnPvQY85qEn4ANGCgkRm/sfSJPrFf/RLOHrBXXhwbvLQVK0yhiCr+OkwI24y@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtSe69Az65nsvcWMv5MPmG85rfUiWNO4rnriXrtYXyYEDR58t
	oxIgMtbFF8Qq3Coz3qVYy1b+wmKyfUoIKnyrPD3EJ5iCfE+7EjaIPWpsoLenNSkQA9BQPf+R6x4
	QY/49EN+4LzAu3zxarqKlKhhSfxXfPo7BaVm8FNI8wZb6Y9G87/TsqxiNN18qgO5E
X-Gm-Gg: Acq92OHnaGZmIWjLEStHmZSIxRc3/S9mv6IYQr68xRScVGQsdXZin+HjWmru7BsytDb
	y1yAUXu/sX8JxVWeS94PvadCmztOXxjUn8it7j74pP2fr/sS8Ms5yQEZtvXfa7G5ZGunovKL6wG
	M/hrRKd5ZqgR4jQlHZRoX3Kgu8QApKrtqOLEScNqMQuPoVI1j4qyUgGZ6hKxP8ihKo1oMDhxYud
	e2BhaXN6IfHHld1eyvhI+V2Wq/BSBGQy6WQKao558AYGQkGDd7R46BUGdBKaOu/Y7uFL9RoPh5b
	03s5NXr1W+QFVLfSBLHFR0D94XXiZK30e/cSgCdIu7DM6FioPY19xuJBypSIiXo/8FO+qAXFX5w
	RrkBaYiw0vOKSbPFadVtxja4QlcTM6hzX/WN/uCc1BKAidcoJk6b7CdLFzus=
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr7510185eec.29.1778283084554;
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr7510160eec.29.1778283084052;
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:23 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:16 +0000
Subject: [PATCH 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-1-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=1781;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=no90MUHQf0OU+v05z3Y3AE5EXvbZVkBlvgnlrpROr2E=;
 b=tO6uWy+X+tZzhjn+/j0qZ/Y/Ny+1CtFS2gjhlSZhTzgMcZg31tcl3JpFsasFR81cTL5VCrKVp
 mXJy+hZ1voEC6eqhAPaohuGByvlM9hLylmm+H323MnAGZ8R/7v1tbhs
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX/Xf5RrHKhuXf
 xb/89mP2XJHN/sD88CNIulcua9gVh9nVc+BgQ4ZejMBSQq9MCQ+iLPbOsKwI7itX103DiF7qEL5
 utFhrK0EWc6iyXqMCooreeNZOn06GyKhTNMIPbVpojcXkU0iHYeypgWnx9f96LDB7u0TIH1WCE0
 zBgrtQljR5N2aQGlf8VKa+QEjh6YP33kilmbbKBmYpMHGz386K4EX3K/FQ2gIn5PyNOLKUGJDGo
 XKZC4cv1Mhj59YaHOd4uJ3ZLrTDNR1jgtKDbMQC/2ITSv415EEFZLa6DjRWRhMxVaw+YzpHtCs2
 o3Wmp83kAsTZlaASkd64o+o8CQWv0xNa5iUmKJb7W7kx+rJktx1gdD5NljRGe0nxzWJSR9sCKgC
 AnJq5pl5Mbee8qTqByrCx0u774HYUkA2BdRSNa0yPXdEAJYNh9XmbyY9gAExuNK8TNeTpsSwOG7
 OV2NtKhhH5NHZmtq3DA==
X-Proofpoint-GUID: FoKbdfzXGbtdCOBFf5lp-iCDqvGoid3q
X-Proofpoint-ORIG-GUID: FoKbdfzXGbtdCOBFf5lp-iCDqvGoid3q
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fe724e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZPVUbJor9CvCRQEu2k8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..9e9e34a63bef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,8 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -183,6 +185,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -208,6 +212,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1


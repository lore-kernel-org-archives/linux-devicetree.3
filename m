Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C82F6596
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372347; cv=none; b=roa4TELqqKT+xXNjwwF7/ZZOCNZlnCbqMw3LAk8v+2bBNSJWnfSb2Rp2BFcbTxVwniGt12WLEDe2FUQxXPKDXUtStCnu/YEHtaGuSi5Wyi/rVB2bOhQMgWesAq9a5CZhn6T1UjaTv4ClddCLynnkupY1J7SRfJzvFUfMBX/Mcns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372347; c=relaxed/simple;
	bh=T1cHgOb4bgW2eV3uJml/ti2NY20U+dRj49Yj4ei61XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELMsg25O3xNFZMjsUvNZOpMVO5Gh/lpaqeqz2JyH3K28ygaPI6IrB+WFK/ZLt8X0AhCHr/7LZTkpx7sDrTX6FCNHLZ3OL/efWj//MIJ6F0GK6a3YE1KXR8u7Sd6HyLyEwy5QM0T6pwK3M0NBzBhwBFi+1pjOO3ayZby3BicdqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDCUR1S2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4bx2/NC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDCUR1S2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4bx2/NC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99ngl3118529
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBXAWZECTs9zCB3OOnIv5aEKvZbVHrbIaT3BzM/Uzmg=; b=dDCUR1S2whpce1WZ
	cNEYn5+Vs+kK+HSixnqYMFsCMZjdXwOLG7Ja/yAJPVQ7gUTcX3IPCiVyGQ1dAE1x
	TtCWF9uGbIgVlLpHbgGV8QtwbVH7waZj84myb2l1/MfD3efon2vDKZ8o3QA5KwHS
	mC5rRtCxdC77VQljiZvu2EBJDJM/5IozRvAj/cvUmefKy3IHmLXlhuwGuq/uEymI
	iIgn+PHaXwyiGFiRUkYZMJAeokqHZzXZrQmuUoLFzJbNwHJq9qGBTq1T3YUhJE5s
	6Iccc5Mi7Rq15lli0zgt4FpRWFvFR6lYhZr/nSr15cMe3rJ8qabpKnWM0u/ZD9a+
	3JVYyA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962t2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so101419945ad.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372343; x=1779977143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBXAWZECTs9zCB3OOnIv5aEKvZbVHrbIaT3BzM/Uzmg=;
        b=E4bx2/NCi77f5bEbsSdk5ULZnOsZnaI3fiLxv7lbLPaPjb7nkJOYvlo/69GReamArW
         V7XbWw2/FVNEKcOexP89GW6r65h35RxSXwSVg+l9wzixrWMwhMs748BgDoYsLxeJMGmE
         BOg+5NK3pK4+yVXWfttjibDDW7zxGkWRL7K4MSwG175Tp8E0mVi6duEhFwTOqgcm/teo
         pX6cMS5g25G/etirS49T7TQez+NOu2kTqkUEHViX63Pen6Tfgp4fZJkmvLHkcsq+05AH
         HuQ4QeBMowqIB4WhNpHNtXx/vD9jGW1mL9F2OroUd34QsfAZCuzPtrjnp5KbEfId2wEW
         aerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372343; x=1779977143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBXAWZECTs9zCB3OOnIv5aEKvZbVHrbIaT3BzM/Uzmg=;
        b=UUPARtDWYbNgrnRgd8ImV5ls8f2T4BUM3E8N0U5Sfkm1WNPZP8JHnP3rKrgCn4qfg+
         dT/IAiq6/83CjRVcmTVA0UrFU/RKFl63OQxYMDLkj544FmcMUJEK8WMXnZ5avsHcVwwy
         gkqm1Wyf9NEwoN+YsNeaotxBEdvukdRcSjkr0Kds9ym76quoQrHuUjg/WB8Gp+nAuNQO
         0a3LGarl37vXsW5aPhkzbWCZkcFtOXWELbu1Xz8GvAeyz0QVO3WOmRVSp4FAEuamkSSF
         Hphnj6zF9z/Z76kODbERGM2Eq77OiRWgam8VSYgadumk31eSLzC/zaghT7AOplfAaRJO
         ArYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xvW5RLJJOtq0TGI1iR/o+IemOkgICVC9/fgR5KXM4puQMVtViKUkw874Cw6KKcE5qF5RTAuXHBQzd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwup1EeW7ED/NauD0jbqga2xAvMNANYmmYMOHklu0AiLTh4EWQ
	kRUGQq7Nb8/78L7kooLqJy7kjbAwsFrZ6JN5jRTCXVe6stcjIgXugmuKMjHzlZiuPNy5aV6VEz9
	cKE7Ssddk1i6jn5HM3Cnol4KQ6gAD96va/eVYIU5HAuOP0rc4C4N9zdevCsmxXjlF
X-Gm-Gg: Acq92OFIyPYIy/ae6A3jLwcXC/qkEt0nwi9+7xqTSjH99ygBWLcubFshpWy01gz6jFr
	SF9jxJB0YLlyeK0r5duy3pTfIRvXCKzy194hDs1UduX5nSW5bcfO5C7/NPEqZMBmyM1BXCOYUQw
	/Ozc2chyK98cNSk2yjixYDNa4kUZD7N8m/6pE2OuembLyVhQUwORDj/yMkLrbr4grueCXzz+oAp
	yqs3sytzMNSOn0smMUML+a0qcUS5C3G06t94GcwFmIH99d6rtzEleSbWVpFvD3HutkFGxv9aHu2
	wDz7qngC259DWcRSXbswWjtTjL6/gtXKd9A66Lp63BqR1uJHxFAsX15RgE00o2j/AHYbgJPwXHX
	KEyXeT5pslqlaiGpQu1pN3DKclFmuOS2A9WSinVM4TQidjzYYEX8GK5jl
X-Received: by 2002:a17:903:22cf:b0:2ba:67f7:9326 with SMTP id d9443c01a7336-2bea32d6533mr38072435ad.9.1779372343074;
        Thu, 21 May 2026 07:05:43 -0700 (PDT)
X-Received: by 2002:a17:903:22cf:b0:2ba:67f7:9326 with SMTP id d9443c01a7336-2bea32d6533mr38071745ad.9.1779372342594;
        Thu, 21 May 2026 07:05:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9287997sm13189765ad.24.2026.05.21.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:05:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:35:29 +0530
Subject: [PATCH 1/4] dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza
 PCIe phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-eliza-v1-1-97cdbe88389d@oss.qualcomm.com>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
In-Reply-To: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779372332; l=1633;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=T1cHgOb4bgW2eV3uJml/ti2NY20U+dRj49Yj4ei61XE=;
 b=Gkf0gTysOQtdevEdDsBCBsoJ+0wBR7RkP+jTDA8q8iw5Xl0H2tvsBGXp7H0FL9HxJF+R6sc0I
 q/SUL2SvQSkBeTvy17Fm2+aVoG+skNSEp18vLdAAt/E1e9sNT4YT+yl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: q-KMwJzwd7obsQK77LddRJPc5lexxtfW
X-Proofpoint-GUID: q-KMwJzwd7obsQK77LddRJPc5lexxtfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MCBTYWx0ZWRfXyVZvEBgAgMD0
 H4bLOzLMW5Chqy6jXWcbeAR+QiI3wUDYXhBBz4SFketlLyaLNusGkvPsrTc/vV/dtgV7Ux9J/HA
 S7ZJD/J6XdgtTlH+c0nixapgoYvh+h//zqIcHByW0n4Fl6/9GBpB0WatjTD7N1kKNlhlj84UGmP
 T8MbGuTFi5OSi+b0crhV12pZ2yFVMnphcxTuYAP47jNRQcaYppz49x8BeW7cqcnXO6q9nuUVz/x
 FiTF2wIpbMjDMddhRnh6tsGXDdSfi0DCws6Yqu2cXtQbiYaBPed9PuhXkUpGC1HcOIGBAiJEYeT
 WJt0I27gi04FbyIlhJ8QL49EUWejhjVU3qLdyS190Bz6UkfDBxP1NpDHBdJNGMr+INAK/sCZrdz
 PuIrKUAGQxgnjUAyFfXg183cwhQPFkadb4/j82NtwrroDEnXY9Q2VsB0RlzkjyONS/7yMWphqHj
 ZowpJjEWtTNrfzwI+Vw==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0f1138 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=d5_U1CTwwdyySJRbjq4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210140

Add compatibles for the Eliza PCIe QMP PHY's, which supports Gen3x1 and
Gen3x2 configurations.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..be4bbc327982 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,8 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,eliza-qmp-gen3x1-pcie-phy
+      - qcom,eliza-qmp-gen3x2-pcie-phy
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
@@ -181,6 +183,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -206,6 +210,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy

-- 
2.34.1


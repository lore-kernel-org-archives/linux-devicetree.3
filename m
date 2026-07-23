Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B2353A9B
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773841; cv=none; b=PH/WUOs2Y9siqog4N+YbWMYN6PcqpiLG8H+R0VIWF5ihu8/rvAyi5EyJyKYHINOTYct/5N1QpYKIDS7J67reNicTE4tA0Hoa9A3VxjP91KITTsEJczYTA3udz5hghyXBlfJBZShHA91zsySj5H08Asf3oNCnJE6CCyTov28UcW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773841; c=relaxed/simple;
	bh=KWNs/xCEnPlXMN2fZRU/bfpMbHhsvVdPwo2ZWlrIGks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMhyaLdq+1n4GRid35/EHgAkTJP6KwONxDeafawJAVT+TleW56Sq6QgMDtoNLLVpkSlOg/FI0IHTTO1Qb7oheQadKsgpUDyQPhqhvCMt3+g+knKavigqLcDbAXQd1piyoODgxlPn3PMmi4EUbxHkX2DL8prdNN7301qFRPWdH9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXDhHiXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+GfNDg8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXDhHiXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+GfNDg8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wre22537735
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=; b=hXDhHiXIypTL2I4Q
	Nm0xckCyLs0Y/M1peMRut9fEBa9Yn311o9sHlSc4WW+VXni04g9zgJIEcVfEbWjC
	L3hv2z0mr88xgEz7a5jyiCmeOcVwdEnZWivb8ot9P1AOCdDDqSGjUTnsrxWyBp4/
	3D6b9Q8RkA5y7Dn1JdPzHSfyYvPj/kOQLBVchOY9t94tgaFfVI0N8CL66rQ7FDTe
	S5ilX2XdR8RZV/SM9P1teb3tOcUHdO9XOD7yFm0HwiX7A0sL71qCpfEGp5FX+Byf
	4i1z3m15MWfhQw6pGtt+0nWpuv1VC/CmKSzQBxOHcEbANDrTT1GVHptrJeE7bR9D
	IuAccQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc0x36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so4092275ad.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773834; x=1785378634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=;
        b=I+GfNDg8hWei5vy6SFOGkxpUGLxwmsNXJTfePWu+q2/MYwNRs2m0CvnYw8n3QtHr/f
         Xvjpb4A3EIYlioXOOo0edqR1ERmN0+D3GnmK0mDzcAbMHK8b6U6jl5VNY7sz9QqofXW8
         yFVc0GTRAciMGoO6Gwxcr+veNHr4XWcPTgGs6kJ+XMcyfcl104xyzjYP3lob48KL5aXM
         GtxLZjwHZtEbjEKvgEpeebE/2RFdg7Hb5A73ftcMhcViV2OAHwDg63OlhWK5+5NYYGlp
         uC9rdTn17ssI82ngQPe8to7p/tkHe0Zo5MYhTvJ7cXzgClz+2DdBEOO1Ecd+AMzlpR0r
         wHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773834; x=1785378634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=;
        b=elyLgzRpA/7ddrniuts5+VCzJ80yX9ZHIFt8VmXjQowvuUpAp1+DpsEXbHWbSIVe6c
         JQvgoEMJwWLpcFlfMGzAEniH3lK1QvEtypTCDXF9pJCou5I8QWZhsMrjo9S6+1Lx4J0E
         rFWiXkku9xcUKa3nWztrclTQx8vAwOdFOVFdUOhdKKuBOKCPwC7pWGGv+dL4UhF/K6At
         3WnOBfSvM/9eZYcVppqSSTrDVC1bafQFWaBZcM9jP17/37nzTlB9PaNuQCbozH+McUfm
         5V/HtZv6rsPpNnBpLxphzolTE3A8ubeZ9/9rEt1fI/DriAhFeYVPwmZ4uG+pkOuUQa1Z
         BiGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDS9nMbUMvi2L/Zk7HwbQg0lajfymAZ+F9Bj5z6yYW3A/+eZ/fDS2iNqLlrLBFV6USb7Gz2Nmn8EEj@vger.kernel.org
X-Gm-Message-State: AOJu0Yylkch6H696T1SKMY03EbRh6R/s9NL2YmenHMy8R/7bUG0ikj+o
	lIyN7PksiEskPeK1sm94+kQu84aTsLvDBo7y44rLPCsFyS6lY4I7TUEwGtdLd8Fr9C1RLHM+sKj
	787ZU7sg1b3Lyj/A8XdVLzOv6shxe++68W81IXK59R9KBmLujRDvMOyEtk2E4y5IA
X-Gm-Gg: AR+sD11unFKojp0kcwW5gIum3Q4tEoyRjIOyB2jG2bD1abo930x/1cuTf3POzWHaEJn
	Sz2xNEdvjiG3FnHJt2dp6R+UiSn+uZIRnd+1HBJftP5OOPNX0wTWZbL9wrRke9wSpQHAZeq8v7V
	e7saRY/jyyq8taSbcv6d9pY+9/7sxxBjAMe9nmip6oNGSEG3oWzi7mwjcK8Ui1EVb/VQxt8WWW3
	+sqRhViJslffTtSkWyH8S2QU9NOgA/vakNiQ6uRf0xrZYHAzfQZr/p+hjpdQOryqAxHt1Jt7k4U
	XzXSIUSqU4zmzx4kkfHG43Q9+Z8aIT2m6qZSByzx28sZY5VIWD4RKygt1zSMULwHBEsStCXY7V5
	/hcXtzwTaAw4f2wnTxDuKqAIyD5pV3t3ePsBNKb7oxX8GI1Q=
X-Received: by 2002:a17:903:1aeb:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cfa6a43e63mr15762805ad.1.1784773834188;
        Wed, 22 Jul 2026 19:30:34 -0700 (PDT)
X-Received: by 2002:a17:903:1aeb:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cfa6a43e63mr15762425ad.1.1784773833688;
        Wed, 22 Jul 2026 19:30:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm13463980eec.0.2026.07.22.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:30:32 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:30:23 -0700
Subject: [PATCH v6 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-glymur_linkmode_0722-v6-6-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
In-Reply-To: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784773825; l=781;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=KWNs/xCEnPlXMN2fZRU/bfpMbHhsvVdPwo2ZWlrIGks=;
 b=GgeI+2mlBp4bTa+H4va0AjEB1ZBhMjPdS2WjMBoprLL8UozW9j9WgkZI9WpFy/gdzAXVr+vvH
 sxRWa4f9U+/Dow9A7HnykLTLHwB/mWLeFBqqKA22kJeqIJamoV2Wu24
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: CpoDi4Gx1cx10mt4arwjwxCoqKcZAxB7
X-Proofpoint-GUID: CpoDi4Gx1cx10mt4arwjwxCoqKcZAxB7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX69MEGXn/Tjiz
 hTFi9hUQEcWXbzn5DV1iIlH8FMzDTa8kTS0IAjuWZFJrGbZzsQ6fFlTBau/XsSKoolGSPV93gZY
 zzRb5ywGKg9crXUJ7W3jYMQ9TKlLSWA=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a617ccb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FJ594BFJAeq65zshAlMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfXw8nE8vE/miLi
 EQCQw2qEky6KiHzSt6ne4LeNZp2NXmxgqIwoNbTYWHixQBSyiOD10CDDBesJxvn5g4EaKUvVgCI
 ExXcvsLmrHdaHWveHkff2LLGaEnNkDKzGQQHdHDzi7/SrCFi9eYJL3ZjHQCxyIwVcx8ev4kmxd5
 KXaelJ1ilJJa/suCphxhVVT4K9GHV9WqChNAMzXwPmRFPbUHbo6h3zkNHT5dSw5QhSMO+VzAnoZ
 yogUW4gvFnbzVEgimB6r2gvE6sAhX8UIiLhxMwX5lpxOam7yJLm7W4oXcEndnUrby6SwEsfjoFm
 KjzWLhzZ1/75ooN5XeztGD08TVQCAOwJcNRvaJXl7GuANSVIZxPoxwCN9VvVqzDlCt+dlXn2pfI
 3MnWTrd+E4pSJEg42bFSKEMJB2tBJJaFJGWoADQ4QH09lUhT8XWWLREcHzjdyUjaMcOgz0XTf1S
 cEDnlCuf7HJzhohPv/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230022

Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
&pcie3b_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..c56f0ab71f4f 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,8 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&pcie3b_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+};

-- 
2.34.1


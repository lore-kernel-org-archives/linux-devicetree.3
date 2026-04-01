Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44851A6828
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047815; cv=none; b=B8RS1uS69DhiZt5s9UxY8QmAkrJPPOfe+5PdyxMZmTvhg6IGu0QSpr7itUKirehGd1oyxNSF0fxnLebAamXO/XtRvb08wzwuPPAC1+xPDnJ2ImVb9e6UbWDv5DUb2ps0hnnpXAaRyjF13vf3i89cQfzkUJC65PBcpGkexUKlJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047815; c=relaxed/simple;
	bh=Dm4tQY6Z0Kn1vGyhIzkAoLmbQIvLxquHKqRAAYXD1y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+dKuj5uWEb4l+CQerf8b53PCotCN/j1Abc0f/fqnLklWhWHx+I061uiJ9DNh5asWT4QQd4/0JsqRqfeWfVCiRtCBqw2uBdxiCFuOewbSJnA20z2/X4qTopV6iDNwqy7nAtlcsh1bSiqWuPMfvPVQotDiL/7gq3YtV4HgVVPWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo334Ikx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBuM+gZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo334Ikx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBuM+gZ3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631A9bc41579382
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kRyDyIzvKSryR6EnIDh5pb5/7230ykBouUn
	k1TabXhQ=; b=Qo334IkxsTi/bc0vzd1R9zv1s9uu4G1Hca7jlLinBus1wVc2Fvu
	SnZ9X2tgDnA4cWg1wkTip3tL3/Pp8DUU+1naD3R1kEpVWABa49VlLG+e19ODbza8
	HKd2Xu9Q48qhkWlTVvwhMH071QYOODzR12gBiDtEMScUeDgl4c9U+TL14GahwhOv
	r3X34qbgoUl7ig7Ow0JWKkBjyqRJKtdLRnS5yGsL2pdS5OUcHuzgqbQ08XheXxrm
	JDi2kh1gUE5QghiPKWTBCWMfEVO7So5pdXWV7Sm78wDbWrprmMHGSRomS665pwWq
	6sPH+P6bDOOMoNT1Y2ryVp7hfs/NCtcOE5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2umv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:50:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d96923dd2so4605703a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047812; x=1775652612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRyDyIzvKSryR6EnIDh5pb5/7230ykBouUnk1TabXhQ=;
        b=FBuM+gZ3fQC3eoyELR7W+rqHL8qJRFaBimxGFh23scgmHZDaRW2NOFM+nMEZjozJnS
         OucX0bmFlRFRAy+sdJKKGpLVAUCYMB4WwBYj1cVcLN/lEfUSZkMlLMBXKSqgI4Ib8caw
         NzR9nwDqsqSQFymbNgY6Ar3gvOfShPKsXcW/1+49ETWqtH04c21lSpfW+xdX0ru10CTO
         s6xwBAS5hPIlJvP3dXvMT4SlT+09RfSRggraKjQt2tywFH1oR7fADZmHRcLDY1rQSYex
         +Qp6hj5CcRhxGiFJQ/qEaE/gzLihxiJBa6q+dbQp0QjM2aUKHC9c8lIQAEPOWrldQ42z
         ED4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047812; x=1775652612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRyDyIzvKSryR6EnIDh5pb5/7230ykBouUnk1TabXhQ=;
        b=mtpc6MW+y1XdZf/P6kp035oK5unDL1yN6om8cgtVEehMoFjm5Tbc+XZtyryy1r6B0b
         FJywCDT0jIq/vhhMhhgDCdqv0dKAlpmaeJJvmKx4XOn7t9DqqGr5JkUvDZ1O0x9b0UYa
         K4YQbv0gJMvjrT+3IZtsvCpb0KGcTIbfRv6HGc+MUuGIcq7Sq9C+OiYG8vtF+Jry8qRH
         JUSRzlm4nqnB96VcO3GyI+25o4CEJoRN4omxEPBzqVMnJ6p4CvaWPhsslY068pL8qXuL
         YiKdsqzPaIpl5xtbZ80uVI/d8zwEMC7b4TXMTfs82JqI9IId71jxOwFLIk6xTjodYq9n
         3YjA==
X-Forwarded-Encrypted: i=1; AJvYcCUkPz6uyU0Ukd1Q/HzjJxRCgEqo9bQDQoHof7Fb+vsi+BRLOAOAbFtBMg7L4dCwKLLEpQJWPCvqEZmX@vger.kernel.org
X-Gm-Message-State: AOJu0YwV1eQiMQYJMBgZQuNNsCQpEI4i84PtT1jXsIvFQQAdw6dAmetn
	fJ6qn3krwwTOh8Za54cctC4KV3/HrRXmP4tOlCZBgbJHikgwN6nOhMrwqtVrDCxELJ/HNnocru+
	OJuYg5QAycKnqFpnsSDBpBcnToG+NKKypUJsd9491PO4/4oY1R5/033QZptst7KaC
X-Gm-Gg: ATEYQzx+YizmtxU5aPgOPEmKqhTWwuCoi7d+biWFLVk3lmMTUSl9Mf4qhGvSFynKb3I
	sq8QHQ2nc+Ap+WOCoapyqfOlet5kgzGeWqvJ/vYOXK1K47idAecZWtqcGfQOxZC0idZUIzW0wBX
	WYTOX2rTzqYlShrdBFPeD6NPKObynockwqbfdqjY/oWEZcCkGuSlc6mOtzYY0YIceoexksaFoBS
	Jwx5XFDjzZD3a4xawECm6U/4Rm2IBEu4reu+qUdC9U+cPaRdIIWJ96AQYjewpDyyltLG5K2mUlP
	TTb9VbZ/oYqxGQMkoo6ptmM4xj6PIQNpeZX+pgb4X9VlPJFgxqrKCfKT5b09T2vl23XjBAgJ+hd
	vuuZYJmNbd1f03g8Y6ARtHm1KEUi+GQARsxI/HkF5IhgzfXuR
X-Received: by 2002:a17:90b:3d4d:b0:35d:9f7c:1424 with SMTP id 98e67ed59e1d1-35dc70a7c6dmr3118089a91.31.1775047811685;
        Wed, 01 Apr 2026 05:50:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4d:b0:35d:9f7c:1424 with SMTP id 98e67ed59e1d1-35dc70a7c6dmr3118048a91.31.1775047811095;
        Wed, 01 Apr 2026 05:50:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe637250sm4940467a91.6.2026.04.01.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:50:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: qcom,pdc: document the Hawi Power Domain Controller
Date: Wed,  1 Apr 2026 18:20:04 +0530
Message-ID: <20260401125004.592925-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cd1484 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ptbc9qrUvVr0bb-3Ek4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: duieEVAP8KBIr8zIfSBtspHDfMKZsWgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExOCBTYWx0ZWRfX3quX35ogMF1B
 asMdbkCCYMO+wLeMFepMWcinTDrDng0Wps2PVcle0jc21SRdPpGrSYoQKP/BpsVNFLtibwCX1ce
 ayBOHLS7F8ylqiXPibhdVncK3j3ieqCHsMURKpzfBOkpfelkr7+jGHucEBIbed6OR5XYm/uX8Jr
 G17tiYavLmXdRFGNovOgD9DdiMJWNEV//UujVxrErwsCFVxEgkX5Q0icSIxgMtjVU1l7OHEwEGb
 IP2VcsPiUghs8qqOKvfs/lRNr4k5IUTx2Bowi45yhTJoPJ0LZci5RADbDhYFn5kX6brK01pGpK1
 Ocl+qmiq7HmgLWQjcqoCKtCu+O8DSH0NRgXGXg5pQ0i05y3mZPFU5WvBoajAC+I4YzpIzEsjhcM
 2WccBFXYZYQSV1In/ZQOWctyyVfxSmB2JjUIindAnry17rReWI14bvtHHvgO25ToJmSR59ysllc
 kqIX3wwILKI4Zg6VZdw==
X-Proofpoint-GUID: duieEVAP8KBIr8zIfSBtspHDfMKZsWgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010118

Document the Power Domain Controller on the Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 5ad68b2c6fc6..b4942881b9c9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc
           - qcom,qcs615-pdc
-- 
2.53.0


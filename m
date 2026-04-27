Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C6B75809
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252660; cv=none; b=LC+aylh9t2iaZu4GMtvXAjyZ8l4QnpfoZENsVnADtDhtZecio4gyIkx3+4ABLxe6jqBGS4gGw2FkyBIszZCECv+hUaS5tIGIlzpYZo53lPUlIlHCkeTYJ+j7zTTySIPrrH4VmqO0O/e01aa1hQ9p4KgKAlyd0IdWWGVZJXD7/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252660; c=relaxed/simple;
	bh=zJdUasQw5n6MSUZveDYI4QDlwGVoR/JI7lWHSlofxIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgTyTZ6fopZW9xA2RGU/gljdhdsOfztWukJUfr+XJMcGZQBVEtX3ZJrUUTAeSBDnxDT23i/zeBJMRmQ8pS7qk5jYohvVNZCjePGCOD+q6Oyf7BaxCVCdHj7IqcM/dDpqIvWKrByTnWhQoHoHDia3csm1N/wIEP7ZSZVnj4DEsm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3giS1M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hab5wiLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3giS1M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hab5wiLp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QIURtW3318623
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ElxAM/fPS/X7Sb5MFzLSQ7x2z75vRG6KYCL
	kBKyeC7o=; b=n3giS1M67ekglqMHaOfYmzXvfeBY+xmxeKVrpB1SGGq0M1s+XJw
	wHhohA1tp1gxEupyY/2FRSv0kpcv9PCxLjfol1dWpxXgH5vTPrckMD2enTLtQS4i
	yaayGE/R5Sp5s7ZP+VT/C8iPOkWK5z5jyIZVT4ICiyYoERRmBLRa2I2B4Hhgp3k6
	TuVuhi14x2FLRnKoX4lzoHU2Dl3akUnmg8b052aCc3NDewLyjRE7Ai+hP8nO9QP4
	Rt4DmzJxvl8rq1Tsx/NDiANTucd4VHKZKdl0J1wlHsR+fL1h8n/bMwiE5vkC/PvT
	c4r+F6JHMGzY2rMNQsMcKPzgc/y/Dn3wTTA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxbwsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:17:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1270dcd11c1so6428104c88.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252657; x=1777857457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElxAM/fPS/X7Sb5MFzLSQ7x2z75vRG6KYCLkBKyeC7o=;
        b=Hab5wiLpHD8R2QkR5XeY0eXhIeQKpdJnKj52xgw9KW811u3wVdspP6qZEeBxhAIF6J
         Jro1fLXWcAZxQH2si9zis4ZFz7Y0pPFY2pYajbHnv0M+O9W3PD5x2277Lr19GzrY5jqU
         HqA6L8eTPc21CvhBw0fXz5Fw0O8iocPBD/UXMnoFhRzATg2QGbvnam5m/TiWFGGw+ZZP
         VZ75URZFpk4laRuNq2pwD+SEh7Wr4+ZMvCVYjyy2Zc2sp5c6vkgkaMifvw06BwIQ0pnq
         cZ+Z/gc99/rx/Yb+QA31K/FdJkbiAzr0x9at9qam0mK0paIJugIteP2+AXLFzpFTLmxQ
         k72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252657; x=1777857457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElxAM/fPS/X7Sb5MFzLSQ7x2z75vRG6KYCLkBKyeC7o=;
        b=QReZn3iSbucZmKHLiHb00v3jurME46vrFeNZE2W60Z2mlDihxI1CHmtFBynmbPkuyR
         KHYemdAh9Ra0uJR04dyI3ZZs5s9wxlqO5PLAXynG86FMH2DjITH+XTHR3M2GybesyGYP
         YYehSoCYsxS/QzWRQwpzt25oxfpbtUGv2SZAY0fYKKpEAz4dBNCOMvZIzCd0hMwFg0dB
         2e1hp0aGme80vRMgmeHSqwUtY8dMm9XJm9R4pKBrloFt/K1N9cttdCuYKjaILgZdUXF3
         OXm04kT58WHYjdcbKM/wZxtgvy/8fgEEvyD7lE7JAx43NrHvPsiP3ibBfo7ihTRb0NsD
         Jjjg==
X-Forwarded-Encrypted: i=1; AFNElJ//tHwNgFtpIp585bbOfArSGjk5ymyluY72gK3zdXDzG8yEH+Hf7upDM/1BwubsB/z6Wb2ZfAvYvg4e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YdMgcp63orT2sfMJF++BByY+CqXqAnQgIi5tVuMBLY83krpi
	RO06BWCfm1rbAmGoGpqkKn7yswgBNk+pXwXOq0/Ql+aYe5U8SMT5d0/YOJNi8aD8ZhGFwrJregB
	kG5PECNNTVNSqdRC2wyTlHGL+DsPouS/CKCXXgPfdjVCIekpygrlrRy49gbRz4n5G
X-Gm-Gg: AeBDiev+3CUG2vNQc1djFeMz5dAz2sMQ/456EaWZicXoajbRg0b62wXcJm9Dd8RLBJi
	9irZ+7nfkidiNGzW1+ZvRcfZKgT96zn5B+Qv8RmaJ+6aMyB2o+D/GprF80pByBz1mpgt8BSnvSG
	5n38lxOmWDQq+t6kf61YOJ18uxKob6qsV8wPavE3vhabnj4BVrI376i+mL+WZxPDWdyddzhVIo9
	dRkRB6JjKJWj6sS0xR14dSTeRcc3OzV9G2SHkRFnhD+y46tj2cVc9yiNWZtSKejmzlmU3V8eRrz
	EoklpKIc2Q7x8bBr6MuDprf7/UCHnh4W1GuzZ/pyRVImhsmsqgiUnqVaivdZdRT0v6VrYIRoZkK
	3vPGcIH7JhB80ETj8Lbs9uXVF06RyKGXY7u33lrXMqsJboeQBqAGxeZl2/tofXy6CZluQ7FFRHu
	R75gP/VTE8r1TH9NW7
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3465930c88.31.1777252657141;
        Sun, 26 Apr 2026 18:17:37 -0700 (PDT)
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3465917c88.31.1777252656606;
        Sun, 26 Apr 2026 18:17:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc6f08eaesm17182104c88.12.2026.04.26.18.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:17:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Mon, 27 Apr 2026 09:17:28 +0800
Message-ID: <20260427011728.231026-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U9ofcPSiXvcEEQ1qbQ6kZLVZaJ7yedo0
X-Proofpoint-ORIG-GUID: U9ofcPSiXvcEEQ1qbQ6kZLVZaJ7yedo0
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eeb932 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c0LU5v8-wekVdGmAq6UA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMSBTYWx0ZWRfXyU45HgEkJGbc
 QiVsaWDt4Nyj3GZQGnvqrlqHJqNNpuHz1i4mTX5cs68LkbdsPbXywAGoHCwD5higG1txIXnk48z
 X6CJpQel1e837IQJUbyoq0D3d2Y6cLbXCcCq1I0GbqZsIKjCSadNF2WWiySzt7S03qbOMidjoYg
 rGmhIW7v3USn2RfbUoTeTevmCs04zEqEMJRsdX1s3WMma80bl3l5pIAa9/dDyhKq0tvDlhQsj2X
 5SOaz3TDyHAKX8IXomjNJ85NfgWzsP8CXaCi8YkOZ2ARoLEyEeuaPcIEJ7uZV0s4iHKhZgGaVx/
 7lhrLe1Yuugaxg5qLD87x7vUjZtxIqqOylJl/EVddf2Wg40q/OduC7DfvrrScz3qOJYWgfaRt/y
 uuZrkfDjGp+UP3GQbVx+FV2NkT78Bf1zwZxBcC1Cune8HhtkKP8llGzcSHpFyFMXGeClixB83if
 ZK5hTFstnYWhBtjHGMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270011

Document APPS SMMU on Qualcomm Nord SoC which is compatible with
'qcom,smmu-500'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..bf29e453058f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C23546EA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 01:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313157; cv=none; b=tCBjnupt1tADE7BMw7cfaxUR6v151/QZ5MyO9ILHv+QO1vgv9H4E/xs+TK9oUbqrB8MWiafYvdknVKYrbpSBb8+WFUVIg6G2FDvXa3//xRoXBXTXv2p6e/SnQTJy0qmgZs25QAgxbmISgFwHXbue+CXaSocQG+MKaw0nqk95V8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313157; c=relaxed/simple;
	bh=srdvK2Pwqt7zMSazM4WQ5PLFrgZu5u3U9HplZRiS3wA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kg4f8lTkKiUrHy6yQiAqZye8UUlJtlWo3RGAx1RuT/v7UcPE+fjpK21yMnC4lnzTcPJJODJpps6McVIvZHN10QUv37zQiWTn2zUVSHiXrnBZzfy7jLwq6zkpsymGYZTCD+PXsDOpyhePsI3OegaqA/Q+aYR+Ar32h1YVCkFTSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgdSUzTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmsPQs+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgdSUzTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmsPQs+8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTHBi3750861
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 01:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33
	yjHOgIFA=; b=hgdSUzTVcHhP4DlNZmc7x23iUVor0r8ac9MbSBElB9ce0iZrqEL
	NHtZE6l4w/FiRcUCzkSl5CyC02k1v4K0xCBDg0HirNay7EwBdyv5IrX4nuzs3GJ/
	fRtIBBrdqYBPBVK16IGf5Bf1i8PVSw/gu9AP7a241AJHOHnSgQ5fuSOuDBJRIBRQ
	BrxQemgYCJMW7XBkWoOBQktuDrkLu5Y+t0G3ubEtDzwSE1ldl6jMpHfDOMhwK8w0
	kmoCoiuDRz/Sx/UJtTf2vnXz69wVZMNFyLiyb2Kx31LzSa+CSWn2yk2lhBsSoLJj
	AxOA1MLrAe17HHm3RkkOKn7OM/Pw4g2TwLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w1jaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:39:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so601929a91.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 18:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788313150; x=1788917950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=dmsPQs+8tvSYr0kT3C0EIPjGgjew9U0HCTGLDQFk89uNJ9yJYETBWteNmPtJZ6qkVv
         P5Mg9JgTnmo+0RsrGNlhxHkr2OB4SZ8HosmfVNhNM5mI0ZvAHH9JnqcQ/QnubHnRMl0M
         Oywl7JdjzWRWRQXEhOxTPPqVAD9KiKPjM5P+/D2OY8rrs8tl76MPST2NTY1+FUIrL8Sz
         DYpaXU+aEyp/RzB+4AL/zw1o4/dC+Vak+QyCavhl3bY85da6HiG/fzhtfZ7Zx4KoLr2i
         1epMNRr9ajs2Wn7S58RR3iPimKAihIRU9v9i9+EfSsHNgwsiQzBu9SS8RbzCfLMyrpM2
         /Jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313150; x=1788917950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=g4EfcPGz3P9GyazsZeSQdlvB5QwbahSTsl25k/beqOHVCZkAn1IpiwNDPrVxEB+fQl
         7vymfNmCKwioACvig9+6I/885+5CRPaJAbG3GLdYhDbobkB6czA2NNT+0dsn54EpgukN
         8SmPUUPFUefCAowWhNe8gDrKbE84DjlJLs9PCIHbgCzWsvkeCMwM7qX4fP/QefkQvpk8
         BWLA9jMgbnFiTpot98/Q0bf/Yx0VimOAsMU8IB55NhJIjgWgUA9zfCrQ9F2GD6zB/pyt
         9Zwi7pdDR/bzRrDGA3nM+OBrfccwXnRmayzwLGuOSvbOoD7SljCJuEcaeoMrcEA0qAK/
         Ic9w==
X-Forwarded-Encrypted: i=1; AKwUvBwYqscGrAk+mcy7ouEN48x1dzv+hU6TdGxWB6wUhILJXEnTmbk4XrsMuDmVxppt82LopB5/gMxZxQz2@vger.kernel.org
X-Gm-Message-State: AFuF++l70KNMzpWYELYEvMLesWSGJPg+L5OJikodPJ951jAU4ZRzggBU
	367n+3pdnKSPelqTi++3k6OMkRZnLh/OkhEX293NdZ1Ute2u9G01QxisKr27RRIe0+hGLcFD/uU
	WGeXDMSm0qO1PJjXbC2XqU1qhTf9xxbwVOuN1KMAJp/ZrrPyZw+JlUscxRoY5SrRs
X-Gm-Gg: AYBFou3hqZl3D/axa/jZFjLYLm842MOYkBq/TeLlADpM4yrSugHjmGOEI1K/vc+EOQc
	JfuX6XDYW1iIS4xu+KRzDHamMj+tP0rGRwQ9CUI2FbkZgicqzMJeGJp51tmMITByi4dzRp0banb
	dS8ebuHh0/PZSlg0jzWczmGdptrueTVaNivpk3XDxj+gz0ccBmmDPf8+73UT4sd5VZjMyiWZ1i4
	+x7vTmgq7Sk/SdmCzF1BAltY+u24feYJAXsREIHRiqlCxYgeigEYcNPTyfnGO/l9EnCIA/p6iLj
	ldbEb+KPYs91pHqwtZq4frOinJe1SkEm2umHHZoQgKxAHKSee9ApWwbhnRTTNM0LFRsY8AlJNij
	+VQgTSLt9f4wteilq6G8O/Za7/SRbIEv783NsY/uiI9iE+Or+wt124rdb3FaG
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958093a91.13.1788313149606;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958006a91.13.1788313149121;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm3140404c88.0.2026.09.01.18.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:39:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Wed,  2 Sep 2026 09:38:58 +0800
Message-ID: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ROsEZGu9YK-NXzKFqQYGP6DoHWoKpIsj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfX7oOE2Vgwuh/E
 qIHRd05lDIT7mmXkX6aFBFVlYkwPJ1u00aqWOfHm5q9jWS2uEYy6ilMC9IcLW15W53AJEYbKwoX
 To3NKezcV8IT24jHYb6/bSnhki49WUI=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a977e3e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ROsEZGu9YK-NXzKFqQYGP6DoHWoKpIsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfXxZaT/NwkWbE/
 BT3OmYwIl6Aa2910kHon8lnGZhMJQz/avy3KthrxE+dSuyluHEVbtUq3mJTJLwfppeWq3aMAnXZ
 CpQcRmAMP2kPmPYOxfx9A6aJ/qmk0s4SKLBB9ofv9pltVQl41FlejRjHL3Lq7yR4cJkcaQgsXA2
 34HXRBYKO6HOXNoaqmflgpG9kWzCrIr2SY8Lfaq9OCpTPZpJ2yWRHLBCB+1wKzFAvHz0vgjuWIz
 6DsUxsxpFR2RYkYMgB5UeArk1GAX6XQF0+Ghsz8C7HhRlGnQR65Xc4iO7GGmonMgwDq1gs1/kut
 ZR5hiNCc9NHjNglp3e5jsi2niV4Qt43BAreVTl7IMX5Kl8+S0Brj2hViCSjFsotAnMNfQc9fSUB
 kNA5ZPEk3DjCIoY0CXwbLXsPLtYdWifyXU+GhAKW0Wr1rwqQLniuue76YgyHouGOJzmURuvRQxB
 YgpZmDVfiF+WSAQOcng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020011

Add specific compatible string to document the GPU SMMU present on
Nord SoC, and constrain it to the single HLOS vote clock.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Add the missing HLOS vote clock constraint
- Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..214a9c051588 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -102,6 +102,7 @@ properties:
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -579,6 +580,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,nord-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
-- 
2.43.0


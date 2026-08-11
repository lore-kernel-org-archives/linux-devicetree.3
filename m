Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030F44C645
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464529; cv=none; b=SlNO5AnFKhCczjLOSQXRIqBBoQpvduPbTBEUvL06L+JlzkT1Fq6SkYxasLvdoN7Hukg2Cc95iQBpn9QKgrhjtcsBgZiCpu5luHxbH3FXpV1zNoQSXHzb7O4ISv3vPrvrc1IIhod9Ht3LjGgKgp5teayBrzgvv6qgE7OBp+i3BIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464529; c=relaxed/simple;
	bh=RnlKHC3Y12tzhxhZpFIexPbn3jm+YoZHMtfUArPpH+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUDnIvqZTG12lK4PTTFor5dZxNyaTz/HaMug0sHsJI0vNnUanWy48j6lqS4n/cc8dpOFbMoyKVebV8OBu1JYBKo91VpkQ2bPP71QymGhufwHlex9hPUcbTkopGqAThL8EucXqf7heVhszjXjntZ1r+iq4truqZDFOYkhTKMOGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jizpBCyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0SoJ0Am; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jizpBCyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0SoJ0Am"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWthN1090819
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U8ZF8ImGy/s6CyUpwt3lFd9rgtxlS3WjAEM
	fiSiyhXQ=; b=jizpBCyzjJgvuHAsUTFmbyqDclRL1vKuO6fTlVCrEFwYD4VmVjT
	Enf43LiFaBEGMV/3kz5B6ZQ6xzISaXrd6NCosW6j6s9XjqxT1/ihOsbERZ32EM8d
	etT5hVamqCmqzPZyTNVHv/uQBVWEnEL4jzvsZGvRqIKseNuzFOji6BtPmB40O5vv
	ek5yujTxGHSJHgTygQE3r3pHbH8QI23r8P+X+in4M1cGNRIF5HBZ0GM2ts4yqgmM
	Yt52HQ0VoTe+aRBkzfzPFF/lLDKf4mh4URYw0cb9A+3YdMJF8Bl2uPMzUbKfD9YB
	C2Jnj317o6QQxhG/8Y8xr2dYsXOzJPFzplA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049erv5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:08:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848662cd2a1so22730b3a.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786464526; x=1787069326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8ZF8ImGy/s6CyUpwt3lFd9rgtxlS3WjAEMfiSiyhXQ=;
        b=I0SoJ0Am6LYTEGCn4pOwHx+j5xu75yLlPrljFueS0E9AOFUcaCfldsSrZOMzCloE4K
         Qs3C9YBA7pWxKybGIwfHcjvnoDHs9iZxzuVuyynV9rBOC6tqIzsiWHLx8hdhckdNfzjV
         DFitSbMR9dGRHBKAJrKOF27y1je0lWAg4XbSV76x8JAZ161x7wc35D6oaI6D2Kaqz2YT
         eF32bSBzHAHK9ChGQq1aiSV5dpMjLFh4UAfQaVvzSdo+b2ZOhJDv0IWkG/A3YBRprMOz
         huX6pmMVW/vG8+nll9mvEEq1CzTjKaJ7aKAT1inSvhKEZM59alCVtKOzQHm6X4I4UjrQ
         g8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464526; x=1787069326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8ZF8ImGy/s6CyUpwt3lFd9rgtxlS3WjAEMfiSiyhXQ=;
        b=mAHvwgYtUrkHn9EsvLbzSI4/FFw4kWQSNrm23PT8TUZtHGZ7BFqwf+I9xwoTWF35E3
         dQ8f7nNQRnAwiq6jVIuMnM+MpIZCPzzuLH+lQSnIOxtURYKGGcrOe15i+dpZ/SrFOjwd
         fGt/73i1T/9X5YQq9j3WbAllaViSVpvUDPXBKr9sk4WEYIb2dc66U8CPZXE/K3O9RZWr
         IBt28C7MG51Mil3/ZpCFC/gNiFwqj6snpDTMitNfhPTizwK1g+RsR+dYg7/Jo2fYb15q
         PFYKTwEPJEM0j7jQaGbIzl/3KDO59COWexabj1SJjNnt8sTLq0JGgUXkzE8COsicUwSC
         RaSA==
X-Forwarded-Encrypted: i=1; AHgh+Robw17/BCfUtVAQW2tcdXP8miw0+WnPC26rFGUP86kKhHMT++4BrjflHvChqLXt9kR82M3DY9NNQalU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6n726XZkEEoT6IUJW4gZ6rZ0QZUrtuprVy5L2sUYR1u+0mGJx
	nuBnizlP+tgdThG0OEFuRv+gkaNqsrXEMCU0LUZw5a5bjaKnPihtDt4Y6QL6GUbiia+rc9x3W8X
	F8vzVVnivuwZYZepGm3UQtFPAO5MjRF5YxpUEHZMrQPxlPZTc47C89Qjre/fExYfj
X-Gm-Gg: AR+sD122suZy4r86DxAUS6ee8j1cHGNqO3yX/R3Gj13yEMqF8wAfEgLSOpd9yvCw7Iy
	gI1qAE+13vXmcVCG0WpUI4psy/f7uwWff6tv3RQZpibtEmziDg7Iihg1us1HUl3UcDsy+du5erY
	m1q0c0VMWOmbIzQHM5mt4qSOExofpvdda2+zUUn/iUhxNy/EpXfVLeW2Tpy8qy3/raRUu9RFtlu
	SVD61rgFszalKp/vhYzH3cx3Vc/i1jUSIri5ZikQjas2ALGP0CKNAInaul8QH5UPcWTi3ddGMaV
	iLj5QMk6YRdiMDnybOjumNGG4s9NdSxL8gjwrSK23HavOgxELpPPe11IdAHp37JPV3uxr1msaW/
	JXgXBY4R6czVc0WNE5rU=
X-Received: by 2002:a05:6a00:4488:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84fa8840968mr4600668b3a.24.1786464525765;
        Tue, 11 Aug 2026 09:08:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4488:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84fa8840968mr4600568b3a.24.1786464525095;
        Tue, 11 Aug 2026 09:08:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1cf65acsm29513b3a.6.2026.08.11.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:08:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Google-Original-From: Mukesh Ojha <mojha@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Tue, 11 Aug 2026 21:38:35 +0530
Message-ID: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfX4DvHePol8JIS
 eQDYhKpvPPpmti2Hx2tS5eTQQyez4zOVrQN70ecHbtnK3dqA3K6/8QeQm+qqaO2E2vNMHFovQ1D
 PTTY+UuZQuEaparZZemuGEALqhb08R8=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b490e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZlQQ9P4YZZ_H6Q_6FEoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: bkrAxIcjy4Jebk7t6ZjnC3jdYKlctYML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfX/9PlU3VQ+6dc
 HgISH+YX2AweQeVetI9DZmoaHULLPtqqLMRe6XEyY3m3vHJT7OGRNC1gBZDzUr4vXz9Gmg49+tt
 4nvG+bSSnkb0rvGjYC/1h1ywQ5VwMDLoLED3KjSkUy9bKBidQssSnYxIM1Iqife+E/o9P3TzMMV
 Exa60fIx8iMO1I80+bppneIs6MQtEBx8rslgQ221xDySS9cgCtcNzo8qBaClQcVXtUJXffI03Y1
 DgdPAd1ZdXGmI/rPkpFW/AyU75FeOsigTK+o+N931i0XBz6Ec5SyRmVeVEN/JSnJiljT1+N+pcb
 9Kom4QVl6J6zno8zX6yhTklU6HHk7K2a852qSVCyG/C3BV9DKElODSMpME762eulWjcq3d4pWgY
 rcN+A++WhYvjb5v4g2mvrTEnKetoFwO3Y+7kQOEk7L9+NLxG8Yyl1c8FuU89QROrhpxUKAlD3QP
 0hutI6DwUqZxBLqOCoA==
X-Proofpoint-GUID: bkrAxIcjy4Jebk7t6ZjnC3jdYKlctYML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110135

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v5:
- Rebased it on linux-next.
- It was mistakenly sent with Hawi Phy series.
- Other patches in the series got merged.

Changes in v4: https://lore.kernel.org/lkml/20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com/
 - Rebased on top of next-20260731
 - Resolved conflict related to recent merged common phy headers
    from pcie.
 - Link to v3: https://lore.kernel.org/lkml/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/

Changes in v3:
- Fix missing version tag in individual patch subjects
- Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com

Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..de50d7a3c999 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5210-dwc3
@@ -206,6 +207,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
@@ -547,6 +549,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.53.0


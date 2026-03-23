Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58523BD06
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256069; cv=none; b=E80BvULF3YncuuIydQOpjLfEAsbhI6XQxrBHvFGxh7OPaGxuYPGMl1xXNmwyTsyOQGiWejDtZ7sDxhinKeH3eH5DCnm+N4RVQ4WwJYPaDsm0DWWQVsHM9pttDV+eeLDy2kTQevGcA19nMDdF1LnpKyZqIDOc1av+mUMCyX1QfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256069; c=relaxed/simple;
	bh=IWg7Fq4uiHk+iIE/mg58Tl+eNsaNW7if6QcneB+1peA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gihOX0OfFTHEuOVQtenvlP3MrcMCbClxHg1ZGs5WN0N8RdUuAbqpadCY4Xh9LCgIdbIt6g0cmD/L12UuDFVYvxlE6SYKso+Kxm0g1FC//G++Wa1iQf24KzLSmLVAK69CcGP8q1lgpva2lynmCxHHFzOawJ11anXPvAc2ZPjOFzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKcAuvrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFQ60tOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKcAuvrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFQ60tOO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tk651627278
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sEcniXN4CmVf2S5jjfl6bW
	59q+mApatBSj6Rx2JSu44=; b=cKcAuvrYgpSZ7Hb1rFspuUKBKDQQKKydTFSVsH
	3K4JQJNUIv+zJzhyclz7HbRCzoMWoa9Zdj7Iavp7yhnxv/P+OoPKskzaDjy4Nfbr
	6Zd+GIXxuFMRe0OJE+jbganVuxh2nC0tHyJXQ9ueYUTb+C9qFuz7ljZzaK4FswAv
	Y/2BaImMUb4EQHEgQW26ST2SkK/MT4f16VreBhmPj29t8FgXRV/VYhWk1RveG7IX
	O3aYImO2MijmWzcz4dP0HtX2l0pF7sGufdAF/fJtYjb+nQXCEcWPdPuMgBNLl76B
	0PBUIrf/f8CNJI1qCCo+0GoAmtSz4huveHeIUpRRNOoNzzFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc066q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso26944671cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256067; x=1774860867; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEcniXN4CmVf2S5jjfl6bW59q+mApatBSj6Rx2JSu44=;
        b=jFQ60tOOz+M0yajazoO9gn6LY5Mmoa/G5yLuI0l0ra5a+EZwBfrkXw/qJUCczvo5Zb
         phrii6myzigSy3cEPg5Emnbz57yTPpsABru88mFWrY8yltBMkEb9DZ/BKEi9IlLEUXLY
         sfF2S2CGDt6Qb7ofWYtoakN4VSrGYxRLLKEBkvN7q8KtAA3aDSCvwgdE30aTJIoR3zqA
         +c9Z7UBZKAf0FS2y8jT7LtS6vvjEqw0dZ8KFkfxp2CDALHIhn9mWZ459+BwLwv2CSfbp
         qyyhG/cU7Y5AQBWPazAMVukmV3GSjDdxilOJLge8C8XB7GEa/R+Jz2n3AQZTvbf2HITW
         7uTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256067; x=1774860867;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEcniXN4CmVf2S5jjfl6bW59q+mApatBSj6Rx2JSu44=;
        b=APo4rBwnVu1G63S2TWla+4xk6LV692kmtWlWpziqd3shdT5DuSf02qUWE3kE7F5Bwz
         4AsQJgLMU1NQXe2bU6vMoZwsPaVeeLS6U5wCOPrb/VFWi3wOfXHo2uaEd+XSUB/t6gcU
         cGwoVVl7Dqmve5Vn1f+xB3P2shTds8sozEl1+XRr940jtzfQqfuwdNk9EwTpMCevm40H
         8Dm7MLpqzhh2cGgJB8NKCaP1krAYPtUjYRM3Acky/rA1nJM8cjVeKHIeRmDuZfMuj5+4
         LxzM9hMk71ccDD56mnAgxUlEIxaL5uiDSzTykKOAw8GnuGCVz2wUrXIhlo1N3HdaxrL/
         vAog==
X-Forwarded-Encrypted: i=1; AJvYcCX5b25sbnO0nJSHnCneG1VQ+PK8Mq6d/eWdrmLcyPWTKKFpOokdNz/AmcuIBsMrpGQiewtSGMibuQPo@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZE53V5IvbZrUa468/ZGqY/rZ+R51XO5hSivN5TNPO6/SutE8
	ZNUDawdCc1h4K/8Bgd/FZSfnCrn3oX2mrObStKklW4z2sKGVJ97BgnVA45NPFjs1km6XA8TCJcs
	9N0KDMKF+HcDBQ/9X98/tQC5JFhQ8BJrapQY++omX1KqEK3MKfpmGYOicooZdrH2G
X-Gm-Gg: ATEYQzyVFik7Le5HTS3u6r/7MtMNcSBMEQQACaL8WBw9zKBxPMc+3CnFbSJnFMcfvuB
	t4DHLKgPBhuSOu4WitOpWy1jz0ddi/H+kMZavwaBtBd52B5RMva2zQU0y7NRE3/ZAZ1GI6kDgP1
	LrmY+qObWtXJE4k2EOa593tR9/9ArTfvtIu7MLSMEqWoYuhWExr3V+sq07kJGjS3pO0zUvCAAf5
	oxRJltP3Xua8hnJB498laaGCK5oFE6AxehMZ2QNqtNHUrMETLJuKAHqSAfi2MFDqC7S823jkl93
	6+jDWn5k3POoYq9o9k5WBHSt/PR+VTIEZb6PYrISx3ziyroybbRFCu4yjq87rVViLT+G1xEnheh
	DNEjotazvF5ei88mpTnZYBRn/vn9qWgP1YwE9cpiMTNC+
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr1491361cf.40.1774256066679;
        Mon, 23 Mar 2026 01:54:26 -0700 (PDT)
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr1491231cf.40.1774256066252;
        Mon, 23 Mar 2026 01:54:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dt-bindings: USB: qcom,snps-dwc3: cleanup of
 existing bindings
Date: Mon, 23 Mar 2026 09:54:11 +0100
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALP/wGkC/yXNwQrCMAyA4VcZORuoLQz0VcTD2mRbRLPabCqMv
 budHr/L/69gXIQNzs0KhV9iMmmFPzSQxk4HRqFq8M63LviANGMUJdHB0DQbPtP0QHqngOnOnS4
 Zw8lRe+wjsQ9QQ7lwL5/f5HL925Z44zTvZdi2LzC03RWGAAAA
X-Change-ID: 20260323-dt-bindings-snps-qcom-dwc3-cleanup-390d61fbde23
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWg7Fq4uiHk+iIE/mg58Tl+eNsaNW7if6QcneB+1peA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+4OC4cTz7PsEXOkFfZ01wSxGTI/CQNraAA9
 rO2mF8emAaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/uAAKCRDBN2bmhouD
 19eFEACbMsXVDHKisEvwV5kaxElgVAPuJpxX/j2+HBcdCXi3HnO6SCluHFrCLS8JhSejqE24lSz
 b6PVRsQrxFEmJI0XstCivFUcaSQOHoOfpvwWYAl8I3sGscxqPRgOZMHOTjFWJKV217PiFxfI8ud
 gq6IiFqV1Gi0XfH3kopTdS4ebRAHf50irahpBVYAAhrduP2ztTowVeg0VMzHBB4EOnwotADdOYl
 AiozwI0Ng6X4v+vgCjQAmpRXtasJnHYaA0vXixpeikBAebvdViprmF3eC9UAss32C/FkdCcgasm
 781TjXL9B8yBJxRjvIDA22Mty2ky7/EQlt8eCLgEdPLNZl0Pkn6LgkyJKC4PMjQjWlW0Id8mWtn
 ARnP+5Cf0yvAcg/b+K0uZvE5Ecnavodv0jhwQJGBDohxdQ4TcmpWVeGbQNyb9Wk+E6vZ7AjSeMI
 NdA0x2VTqe6wrsZf9DM1k4Yp+zfPFP2JKIYewbiXMBSzkssltKwJpx68fjVsl4b5lu1/bhQqbB8
 ppniGuS49WgFAFaUatS/fI6Zs8y2gnHqu1DYMSC6mhcZlqJ2GGQ+giFwOCDnPgSDsKTWLeLhTBf
 qgZXpNoNJ+RG324DG4tjZ9H8tWxUDvpbYMZlGUPFw+gQb1Y1VCrxZKkzUtVbJWSCZBljLJGaGFR
 YB4B4umwszJWXDA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c0ffc3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D-rwtq3xYFyqOEHTDRwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: X49QzNfTBNy0HHo0O-ubdVSu8xadOF1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX48lo9vtl2k3y
 QYT84NRFC4N9ULEmwGh5w9HKdZh1h61joUIDIhLAu27TbRFj77M9ALm1yMECFQA1yXrQXO5usJ/
 R1LN9zkYRNSVzGQHkHJ/W6wWk32iPH/OUOkSBKcBpoG38Lw0aaxN47j8d49Thxq5wrUDBj4/gL8
 yoD8z5CQhARDu7o+2HsTZWM96f+RbSLB9PGzkOAwhhy/vqpJsotb/Oyn3mcF2e2h5OqzScqhujz
 PKc/faGr1zJb+/h6gvQa+tOLOJibeHaYLHrHy5TxGq27Y2+Qgin1Iq2QibRufcmPksgQKdtJfGT
 pyyzcUntx8jaQP2CEgWgeAjKymXF9F7+vdEyRY040x1aTXoUNUR8b/dUYPIkeGBUs5lBMXOUzYX
 Td+zgtZJTThrRYf5b5z8lrQuxVR3pA94tCOLviii3yUhmixosxy8VuLd6or4MPfeMo909DtmU8N
 ETyYv2CRuuzPwvmmkjQ==
X-Proofpoint-ORIG-GUID: X49QzNfTBNy0HHo0O-ubdVSu8xadOF1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230068

Changes in v2:
1. Three new patches, combine previous two into one patchset.

Previous postings:
https://lore.kernel.org/r/20260319091709.20981-2-krzysztof.kozlowski@oss.qualcomm.com/
https://lore.kernel.org/r/20260319092348.35237-2-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: usb: qcom,snps-dwc3: Drop stale child node comment
      dt-bindings: usb: qcom,snps-dwc3: Add missing clocks and interrupts constraints
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for SM6375
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for SM4250
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for IPQ5424 and IPQ9574

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260323-dt-bindings-snps-qcom-dwc3-cleanup-390d61fbde23

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


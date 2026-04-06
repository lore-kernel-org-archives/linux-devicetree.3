Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB535A385
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 17:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497585; cv=none; b=jqSnaALtT3uNbOIwZhQTA+Kqx5LjV5X+fn1HQ6CcrpKguxQVNyKL4SvQiXt/klgLvHJ+MvGq3rFl+40XVl9m2HUlpx1fryC3NdE74TlyczUsH3qvyCqkvHGwMjzvUk8eGSw5BGfCZqdePlFiob6Mj8GbK7ilbAGgnwucGgXAR0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497585; c=relaxed/simple;
	bh=PynLxP5rCPT1Ir/gqujTBnjrcsbrRcKsNcfGkWgDpB0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qcyG1gZn9hfc9WxmNhzmPB3Od1+jU/PVAANqcvkNmY9Gm984gzNLDxyo3ZUd/SKlAqqWPOwTZ5zNckamF662R+50nCuSrAkatoGOUgMC2V2ZQq2/y8G35Ah85hzA0BLKk4O6UuvWRCMt7iLDDD1YTcCANchOl0WCybMzbGh7omM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9EfWLpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4CwLXv6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9EfWLpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4CwLXv6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636ENIX32897250
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 17:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fob01FL2VysW7c0z3j9b1qZPozqNeuhvhc8
	RWjOUpm8=; b=b9EfWLpQfZeW8THyIK8LD6oiSnWX5koqYNKa/FiMtZ9eXkzt8YN
	PxNtkIdPd3sDNjMAsWILT3FW1mmOwOkjfBg0X9cz3l6kQlMZQ7RfR2Wbj301Gl3w
	gQZGfns5jSDBsmuh1XPqJro/7s1p2KxlGw78+xOTTJ/aG+cbX6Tkofflo7c62yRp
	4wjb6k8RuIyRpFfriD3Fq8SniZ9SzZ/K+ibjVy0AAO5q2rhEgW4I4NNz+urbSBT3
	1ar79gYHHdIhaFZy5VORXWGDo9FQMHiWC6t9hhk0T2kQgXzfJ6WRJ85gC4QRCBCF
	ZgJJb3YFMBtXg+whunrDRSp1dCOeaGpX3wA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcehwgqc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 17:46:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so2380703a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 10:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497582; x=1776102382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fob01FL2VysW7c0z3j9b1qZPozqNeuhvhc8RWjOUpm8=;
        b=F4CwLXv69avrAXFnzyi3VNA32jXQ//LYsR28301KGyrPMEFCw7Hhs5ghzHHu7W1jZu
         UBnY5yqC/9Bg+f+N3/JZmUUBDt0vCf3G+hufmvpPLqHgL1rUYGH93HWTE9R59hWZDCJH
         X7Af8Dq/OVKInI4WTbQt/aTrmBELWPODni5R1vLOom3u8i+J417TqfjDfCdBy8/CI3YT
         md6lPRbhEYaX6kqGLxSr25ImiGP7+Isli7IL/Iew38WIjfj3Ymm4KZU4bgZQb5YLT8oC
         RVAOgjN/WsPe5QnqyFdGS6T7i+klvZoL9ZoGrkYRdEbFmPvceG8mBUmUbz5Z88zvkzlg
         OZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497582; x=1776102382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fob01FL2VysW7c0z3j9b1qZPozqNeuhvhc8RWjOUpm8=;
        b=YeWdKGFdm2eN1YH/jrr3thV03uuEnrnhlSb9u0pRMDsOJZWTjXpTp4HNN66xLqILv3
         b0iExkBT4y0pNAO9vqu3w5RduuxQ3u6+14zoPYsqeRRVTMpw4xCO3NXQRa8duRIXGai6
         N7CYy0LA/UZpaoMFKJ+UjyapVzCvFPso5bH5aKmOf+FNZukkxb/Qsk3PR1VdPOH0fPmw
         TIYBNENfNwJJS1q/zqFwUhkgUp7mkeIYBVUdYZBGDyux1hgOzCrdEN1YPB4UE12Sukyr
         3zf0QUEtik64YVj/9F7/G51RThCNZEEwPGVX+5BdNZ6e+WkT87uyx8WUhwuQ7v2KuWIv
         qihQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoRLsLhJs/A3FAKe82OHZlTOkOzoLXz6CKjD/gCyYjDTNa9PX5vRokN8pNq/+gLqNXAjBIT1APQ+QM@vger.kernel.org
X-Gm-Message-State: AOJu0YyHGak5+nj4MJpHi0dcHhehhoBl1/wMDSLLvq5yktK4GFC6IJgW
	1DlnPqIUmvJu/J5RB4TcWx0tK1j2NbwsZarYCnDkNlqsd5BjIqgc3o8Zs5M92bM/aQJrXadgR/E
	iKbYARA95dBQY+gbFQHeq2XJO3dy73Awhau3hSWYvVFKU2hxuWAUZxVBwHY46QiGH
X-Gm-Gg: AeBDievNlvGphDjVN8H5Gl3egiOabSIgsZtDnPKRSmWvWI1VqoSiMP5c1PcKZCVPaHq
	nLZ/cCsIqO4u69XwcfvR4oLYBRRLBdrZFv4n+Sn1NZxCZjNO1m86r8Vsz5/5nLewzNS/3Ijo1qa
	/blus2l0iYbcxAs+BtaW61jjcK3NyNb0rvVsdft3jo5Dy0bwXAZB10Joke8PbQWIz5yUWVHRui6
	Vrkj6aMRMtPswZw1oslIwjQMJomPKf1CI55SFOjNwRJW0vNyAmBWK9J85QwsAVp8AUPr9xwsY2G
	kRt4BaYCnbTJ4vyiziHESBG7SV+dSbfpx7So0MJ5xbHRMv1yLfp4hsiWmMmIUYqTFvf7jizqgBp
	TeHpmlljF/2oQDc8y//gazNZJc++uXn3wip7rlTFFLg8mdxulVF5gvhrWJgQ=
X-Received: by 2002:a05:6a00:4c16:b0:82a:78c0:6b75 with SMTP id d2e1a72fcca58-82d0dbabb59mr13611627b3a.44.1775497581598;
        Mon, 06 Apr 2026 10:46:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c16:b0:82a:78c0:6b75 with SMTP id d2e1a72fcca58-82d0dbabb59mr13611566b3a.44.1775497581013;
        Mon, 06 Apr 2026 10:46:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5f1dbsm15227400b3a.27.2026.04.06.10.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add USB support for Kaanapali
Date: Mon,  6 Apr 2026 23:16:10 +0530
Message-Id: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FXBB-s2wBG9yA88pzr2FTTdFczTFlH5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfXzChDjqFyX8Vc
 FhlfCcd6RsG8IKaeI5u63BQE0Rl7Vp76OSVn3p5h9PLVSYz69qMgJx/JYklAqjvTcWE07fZ9j61
 vUZIjyWRjcKZMxEivzX8Oc7JTnKg4FvDCAr+9Z4/0B2dFc+6/eaBatIf72/4CFuDvPgc65efPL7
 2CnmxXbD8nQGTyHd/j8wnQ86o2V05rR4u3ifu2guQHhJ8ZqRqqzSO2FecEUAcchiTP8GkyeQphw
 w8mWLR03LzKHNlcrWTLZ/N0RElMR5HYxW/v4k8nhdX1zDwA9B0Z0pHTHFxfDTOVC1Kcg8fhi/4Q
 oTZKvrNx8fadoPgk8TTVcpOlcClpYAFfUXNM/psrhLP5wrVvMWeZJPlA6Conhg4i6JaPM5GYI9F
 EKVQF/SjBN4qGKwm1Rw0bIO+i9WyrxMRKO679acwcNVaGZ/XJ8QMjAJnIyJ1DEsQemS1ENKEywO
 OciB6P9GexZEbC+NcHA==
X-Proofpoint-ORIG-GUID: FXBB-s2wBG9yA88pzr2FTTdFczTFlH5l
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69d3f16e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=e2oerLy2phWMOAZZ7F4A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060174

Add support for the PHYs and controllers used for USB on Kaanapali SoCs.

V1 of this was a consolidated series of many functionlities on Kaanapali.
The first patch is patch-6 from v1 unchanges. The second and third patches
are parts of MTP and QRD specific changes (patches 14 and 16) and commit
text modified to indicate mtp and qrd specific changes are being made.

Ronak is the original author of the patches. Kept Jingyi's and mine SoB
(with no CDB) since we just rebased and send the patches in v1 and v2.

SoCCP changes [1]/[2] are needed to get ChargerFW running and receive role
notificaitons and enable vbus to test host mode. Since the SoCCP changes
are not yet acked, I enabled only device mode for now.

Changes in v3:
- Fixed repeater label in platform files
- Fixed commit text in cover letter

Link to v2:
https://lore.kernel.org/all/20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Sent USB specific changes instead of all MTP and QRD specific changes

Link to v1:
https://lore.kernel.org/all/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com/

Ronak Raheja (3):
  arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
  arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
  arm64: dts: qcom: kaanpaali: Add USB support for QRD platform

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 154 +++++++++++++++++++++
 3 files changed, 208 insertions(+)

-- 
2.34.1


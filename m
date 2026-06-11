Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402983CA4B9
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172629; cv=none; b=FB7ry7I93/bZ21YMCyq3KB0oSPplnhpKbPYJ6jKVzMla7kF9QAEG9Qu/bY3KddET1eeMfz2AaEKMgnnUG6CBt5xw61KdhX4b7bvPP68XBw0UX2LBPoGvAnRMKNf84cp83j4/uM8wY4b5tvi3hVX7dVY8pMJ7Aon06KoJy2HhFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172629; c=relaxed/simple;
	bh=O4cVCaQ46n8Ms5D3Bco+aQwbzl8/UIR3ClZEnBlY0Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXWkg6ECq1W03JOF+4NHEZ/IUUUihfdGeKYX/cZMYe5PB3xvMkS6DV/n+tW9Ztgf4DZUR9EfDZ9NjHnHvzAjPfbdBrCzOKboWCbpZeH0qLhmybn11UuUyU5O3IbF1zoHE/wbgh1cxL3i1T/F+Kq1REJn3T9ZBR6H6VcMQtR0dFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNnGPWqS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRg5RxPy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNnGPWqS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRg5RxPy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xqoa214491
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=; b=VNnGPWqSy2JqD61F
	nL9FmVZiSw8cnXvlt5+f/tGowXcrNXRrXzS8QrqV+kxFvcoWwhZDq2Dy0OREh5Th
	6MasMh3ZE5vU7yunP91NhVwMKfwbDxRYDDlv/KwF93OeUHSLfrJ+VwOco8vEd7DD
	ASeg1yWhEkWv2re48LbtJpd2R5qA9dJBcWioD1fIr41aPx6wnI/+UuBHOErAGCYm
	DE6KwoMv1E5KRfObXatGvrLDkDaXjSau8jhSfIAtQl5JQJ90d7tAlzHirSq8qIFv
	5MKEJO8AOE/1M9v+D4PGP5KXF2g/fOnx7w4FtWaxrG51J2FnvdMaRUnNMfcOen4v
	K4rYrw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjxjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:10:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so3970669a12.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781172626; x=1781777426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=;
        b=JRg5RxPylTJFkbPCkxWgzobhfo9Da9H5YvGG8yLlcEJfH+otXzL9EPLAYVSvNZYVJ7
         65hog6Ggatb34G/RTZzLTNsVxOMQeF6Kkm50LVGZbM4S0xoU7OT2igp7U4gX6CXM4Sb1
         kcflSie7Nc+MFYu10hLZM3lYHDXVgarahfLxgp/JOaVDgwtaX5v8Y7Hcp+fy96Xu8nry
         s5EFJ7kiZ8WSEvDZbkrWyx/EJl7PYFpKz4GA04eV7jJJXnDgZnkRbogE/tFA6H3tKQel
         R47150qhsTX24s2zP3pGwhvV+qUftNq/W48XYKNS4mqcGNh4AwpLq/MC3mP6xw3NHQZI
         asZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172626; x=1781777426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=;
        b=KVlQGBpWZ6CNQjPIIi8pfYJ46j6QNuS2s6JluaVPv12TvE5We0Amp7NDez/Yc7ABcP
         Sz+gC0y9RS63XSU6Et0JfVixd0EGQIiehiDfvfWgTNneWmZF+LJlN29mXTpZwcPWlxKO
         jyAI3KPr5BLGHO8rOdmh7barZo1c6I47+0XXRICrdwKe+mEIF8vZ50s5GQjeKivNZKTX
         6iv9z9I5G6QGmyNgwzCWz0tloJocHZ8MXA5YjdVJN+sAtO2yghgwBfOhT/AzpdWCz+G4
         Juhqvel7spZcVILnIQEuLf0CPM6+zTB2epsZOPxsyD8qmcRDlXhiYYjrxNlVh3qrwqkv
         AcZw==
X-Forwarded-Encrypted: i=1; AFNElJ97jM2PXNvAc1v7mMOgzNaKnGTvSu/3VJ6JQgPeBJk4C6Vj43NEcexaSwq6KwVtou5L8oR3TuY/sq7D@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RMvAgf+Cygzd8sTucZWzKaBcLamfv1cY4BEJ4XHsONz0eoKB
	YYedKfKR32vASh2qslCvmz5+ywY046LnLLBdHPJ8Bfd7fl+a6EtQlUJCrFKU9fzaqtR1xTh6N1k
	mxXoP2jGR+TA0q/DVnU24sALtPA27cCtZs5D02jmH6P7XKNHYtheRLIMKLBF32gEnhWfvOMAc
X-Gm-Gg: Acq92OGm3mZaRwPxk4CAhF4s7IgjWtb83zE2gkPOwVEi829+mkhUrMV1bj3tpqi42yQ
	pSNg12KopA+dztgQylKTBuKOOG8j9ILIgaVX2hUBQYIMKVXXSxKGYBmkX/8v1wagzaaegYhn8YK
	PfGbvbmXs1AuY8HU/OIhNCqoCKdjd6uZgLcHfRfpMsqPFDxB1JPHpJWRRaBoQzOvoVY2SXQrDbX
	/qZL2RkhufbHZ/PZkxQ9gNvDzCRgPtmsu0541tmVGfA4kjXukDt4pF7JBk6SWdtXlWRiVwb65e/
	H370fcHZYUBNEd0dP8gPHB3N1mb5E3E49b3BRiGmdFND8mmrPyWhZelvn9C+xZ6ksiPRehFQZdX
	MjEVUcTDGEqyyexPJxDnVtwnjFzn2FMAhzg46q7wXhcK1NyY=
X-Received: by 2002:a05:6a20:7488:b0:3b4:85db:1bd0 with SMTP id adf61e73a8af0-3b5e31ec58fmr2473841637.12.1781172626237;
        Thu, 11 Jun 2026 03:10:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3b4:85db:1bd0 with SMTP id adf61e73a8af0-3b5e31ec58fmr2473810637.12.1781172625795;
        Thu, 11 Jun 2026 03:10:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865860f3d4sm1279646a12.19.2026.06.11.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:25 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:40:08 +0530
Subject: [PATCH v5 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-shikra-dt-v5-1-103ed26a8529@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
In-Reply-To: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172612; l=1745;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=O4cVCaQ46n8Ms5D3Bco+aQwbzl8/UIR3ClZEnBlY0Qg=;
 b=wMdHmwjR+KCtwb/q9yjz1Y+EYFPfFw5vp82h6JtumrrfVeOIJGfb/Ulu9woGwL7HiLYyLVMjR
 7WnMQ1xz5mnAXq7G4Y9gpRi2oJa9p4rPEMrfIw4IWuzabkk7ublBhUc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a8993 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 1EWva_Pt4glRSuB50Q3Pu3NPL8ZfY0uc
X-Proofpoint-GUID: 1EWva_Pt4glRSuB50Q3Pu3NPL8ZfY0uc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfXxejdVT/O9/jb
 J8tM3UdPY2eHh5U8JuCKbmeM7nb2e31sJ84STa/Na4gVmMXVLjrDPQ+E81iJuMQhjYCi+HmnI4n
 NO42zIFa/wAmtiZRCsKcOPPZMEPp2Y05NosOGZFvlkOodVYgYF9dhAUMh6sHYzvgRy0iqQjPfDX
 4TE2qiue6q2N9hWHUYHTzYe/1Nx1i9YxY/4F48pl92AaSa8OqLFut14AQuK2+NuBWlL25yyhcq2
 DqKxzTFGCNz4ko4WRkebuuwEzCIPHI+/oMrjy/ATqDMfmnLtqz0tVuxpmwaZRDhV5NvlSX91Y2A
 /vW9KNiWXCXmYcwFOiw5mkEGtk86TInKmEo9xdtYLqwrGOjcPBXU1ZzeW1Q2R3+0lEfvkKtxWMY
 NI5v/4MMngygT2ZfjhTTgoQIQADUjFfhMpUMHTi86olvUzkf6Y1QFif44gAhN95agtueFcXl3CZ
 MK8JUaYKyv2sSLewTKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfXyFIuwgZuz2Ol
 NQAENudRvGD3IzoiRckVJlLQm28vIx8FiFboGwW9bz5u0oSgc+21fEqmH/t9psGPRBo5YVOdJzd
 dgTZm3vK6xt/kBVgEYorIvpPuBQ6epY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110101

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
  - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
  - IQS: industrial-grade variant without modem (PM8150 PMIC)

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
its corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..cf7d241f8107 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -989,6 +989,24 @@ properties:
               - xiaomi,polaris
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1


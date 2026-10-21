Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590694;
	b=s1UBDVLJ2SelIpY3aZusSByANLPKP7rAfUNXMXh/pQp0wdgoj6vY9wjedMGWJpM/ntn/
	 OlfR5oYtvb7WTU+ZK85MDoqCR+KT8LXiaF4SsMgSDtAMAJmWTUqiOX47+G4FCopGhmrJl
	 9E45YZb19W8pFpvo/Y9diL5oyXGSBQwPcWeGfLhhhNH7SsLhDg2DwMh143Ih6RJghYEOI
	 oZ2qZlJbjpdIL4yQjAZ1Ze9ROuwwd4qw2MrRwvstmKJRREIWzipV9qP7AF+m/TXEH/QRF
	 oYoRZGTWlsMNGPUvqxOIMZj2glu/WuBIFivrWNJs07U/JxtMplM8rlYdHdasX4gerMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
	b=JOWUZJnpGzYkP+Wi84Q0soW7w/DJd4NempFObc/Y0PekNEiCPYyQhrCMmVGvu7k0yZGO
	 RwzBRq+vWvRC2xVuv02N5mLQbuF1jqhHGT0XF6Z10KyEU+PflgiZgY9VzwTQLBbF7SaDK
	 Pjwd5wGjmgpFf+C9KrLduXMdcgdZc2KyqHsFdSth5k/2Z8X1dcEMFlznITblWhwQ+QOaw
	 DLfF1pqKgD6CEDogODiU5k72NdSA4Z8HwIQtxuWj/JOghzttUwcW76e2RZ5KA9YhuOOnL
	 Pm0pHZK3NVSWC8CW/zaj9tUxObeVzcaQegpbT9E9MQEmIVBzKCStqQcpNTfoVT0WqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xkws2U00;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNEfIIJs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA509606A32A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA509606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xkws2U00;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNEfIIJs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDHYqJ4038299
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ic9YLfgNTNC8LbkgAOfvr
	1E7rxhwKyo7fVG4O6cpK8=; b=Xkws2U00vMsA1S3OJf+Kw6noOrg8AI/CvYPANc
	Sg666KXvUcVP+7qkx5tMz1s7O5nH052OysjUeUuAZJaa2bC+aSOEnTEvn12XVcXB
	HBw3mrJQLkStrg9YO4fjzdphRMJ+ZmJ7+XzOTeU4sb1I/yHZ1Oj76rE6gnXj5D5u
	P5FsgZTvzzDXBHu3mmah2LBznuvNXLGPGiWfA64eY9NiP+LzBpLEj2R2v4qErKgm
	R18rFPtJLX95IPycmcNBo5UFDutfxwBTn8GnLNlwH6elY5Ys9HExEpl3m9Dk6Z9P
	t4FRo/q3uzReAdm85y9F5MqH+MPdosxVOkbCvelxBDoNxmgw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5884qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36696c9f55bso819914eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590692; x=1793195492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
        b=UNEfIIJs4Ycd3woFQgfVGa04dQ1czRhid+p7gU531tuGOXSSe9JJ+72UaqU1ncr1YS
         J/CN3CCTvRHsN6VFhFrNDzM74VXnTjNyTiKYekuD06TKqMSfEzlec7kXwEFofpp80FCW
         rPK5ybdPVIaR9xJEwTFCFc1YdyBbDnm4YBRmBCDzagT6+vYGHcCGwpHMTefaHAmf0R7p
         8JYYfmEHkNAwD2OZChpoWylEQlnN4EHPqsp5zeP3mnkxvPnciR/r1jRkXDP3GGp5ljao
         1oxyO3r/a4R9nyZ6TanC7BzTvxfhG1DmTX8HjXKudDv6/YA/c6QjNpyjNO6dRF1N2r3J
         HWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590692; x=1793195492;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
        b=tufQzB5kNZkomFoZSFPAzU9letViqp16A2FL5p2grCcUHgLBdXsFrySCLZF2hRc5vG
         bT10VXwmc1E/VyqXzWT1MTQHkcv510I9LAq5LGBH7m3DLl9npltkZxAV+mxX9Ity+QQW
         +u7x0lT3kFsF8NolkoHruceSOR85YJDq/uaFtG5Y8j0zJdd7WS6imsc6BZGuCH5Khzks
         ixWMHO0X/dOUWCsQauB5maKVPIDqdZVkkUghxEPzRe1vDe3knXEt/omm9Hzvi/MxA3PH
         gs0DcuomU2BOj+AaleoNRZUPUyPJE4TadkpN8gmgygz6wJQKuwYTXuQ7hgHitlZL9I3O
         mmrA==
X-Forwarded-Encrypted: i=1; AKwUvByHq1Is85rmjuwLwOF99ke3JFtVYCCjIkomgvy6to/gRMwavGH8UDaJn2/+ZTEqfG21IZFn1noA54ov@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8eu+gG/AFaaC6yfszKJb33ruKwmExxOwQY6yU20/vwZFTcp2H
	x2DH7PuYy03nmeUteDClarEvAvIVra93ALOxl35MyV5xUx78P7VRIfGwI/Ms9wLvTCEBceDwY6A
	oS2uRJnXsYv/9wgYEzwhw8hf3hhjojr9ZA4eYq5eEZ0wfTzLDsioNnCapEUuTH8+g
X-Gm-Gg: AYBFou25mUp/FaovUF9qaFxVTynVtRYlgx0LgIMjfkxPz6rVOGvHkhuG8U6ycSX4v7/
	n5o1iVv8WklIwqdlQR/KKrmFUv2R+Tmi4nwbeBMekD9oNmSBKR8Oentiy/My9WnWM0e/M1RC1ii
	ddxBKwWIUDQLxCddqjXoqSLe4gRcZzTteKiWpVljnisfKM1MYJUsgWjpxX2XjB/a9JxDHpxQ/rc
	7327poVY9cy35usM64mNRWpRe69G0P+CSw2SRgt6qxfPaU4zAchC/HL4rlnnd5wgJvLKqbuRLSd
	Ch9fHSoLb3IzL5+Z3t0/jV4rTz6IRJWpL5e+eFv1cybyMNQlxx1cfBrOGdQOm1YPQCkOpOEoQSy
	2C2wgHKfLWkg+HLlrjkuEnIUynwZR5CW9lQ==
X-Received: by 2002:a05:693c:864e:10b0:361:8d0:6c7a with SMTP id 5a478bee46e88-365fbf86502mr7227545eec.26.1792590692149;
        Wed, 21 Oct 2026 06:51:32 -0700 (PDT)
X-Received: by 2002:a05:693c:864e:10b0:361:8d0:6c7a with SMTP id 5a478bee46e88-365fbf86502mr7227503eec.26.1792590691495;
        Wed, 21 Oct 2026 06:51:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm7534332eec.13.2026.10.21.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:51:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/3] power: sequencing: pcie-m2: Add PCIe M.2 Key B
 connector support
Date: Wed, 21 Oct 2026 19:21:21 +0530
Message-Id: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnD2GoC/yXMQQqAIBCF4avErBPSwqSrRETaWNPCQisC6e5ZL
 b/H448Q0BMGaLIIHk8KtLoEnmdg5sFNyGhMBlEIyQvB2WYIZW/pYsZKaSutdKlqSP/NY5q/Vtv
 9Dode0OxvAO77Aa7YGxJtAAAA
X-Change-ID: 20261021-pcie6_fix-cf66f4b8b387
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792590686; l=1492;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=D/UvRdvBDBS/Rq/ST/CUi0Wd5LwynsMiqdDmEgI5bRI=;
 b=GA0GHTLmE/SalAfNw5rnP12qL+JshQsAM+buh9CGhLL9xvLCTlyCtqkJr/0RW7F1Si1RVcTQ0
 hf/aDeNqM2qA4j+XzATTEYLZePe/7mYoVq2kN6qI9GE4Y3mgCNdcKLS
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX+xO7zm06RVJ/
 xqmYxq4/A2U6r4loCA3MLaHDUeVILz6BHDXLGflgSzaLVud7ZoOMNl42zuEdUjOuB1Cj8hvhxsI
 8n74R2Z0A+ljVacAAxNFUPVWraonUGM=
X-Proofpoint-GUID: wcPOTaJhHKuiX-jHTlHkc_Ji6AI3i5Oy
X-Proofpoint-ORIG-GUID: wcPOTaJhHKuiX-jHTlHkc_Ji6AI3i5Oy
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8c364 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KRKipztoQesxEaMeAmMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX+YTu8NMYEmOc
 KzTh/Co1m/+pZ5v4al/kO04AJQswn0Xhzyl6sSSKkOaX/7RHrTEFPvV+EJdx4+p3OcLHV882Baf
 9CjSF1EMG+eT6qnS8aKKMmWcfGy7kIeFYi3+48jIDiayABldzK84r/b/QCa91U6U9lepIbtzI/5
 RqE194x2dJJu4KKenlF4QVri312O5KkttIXDTpobXtR8gg1x8/1+ILUeT/potKlkSZyf+5x5kia
 JkoHKW06Bks4X6fjNzQUWxsrCalm2v+zxOGhsnLJqmWGPCQb1Lb8JiP7EeLmo/zYcfmKsWDaVhz
 TBEYcnJEexlSfiwtvIqQCWaNvmzwzJ0j9/mHh1zxFU3U8FQ7PPebqY5qusazl9cyB6FdhHRHPlq
 UKRPvMgKV6sWgvqoErjzflvQBTqRFF71S/TNcqhiaPishG1z2L8KN5fCsd6OcgX+1szPTncw187
 07HOevn1Z3cgUKT/qMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

Add support for PCIe M.2 Mechanical Key B connectors, commonly used for
WWAN adapters.

The series introduces a DT binding for the M.2 Key B connector and
extends the PCIe M.2 power sequencing driver to handle the 3.3V/VBAT
supply and the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1#/2# signals.

Finally, describe the WWAN M.2 Key B connector on the Glymur CRD and
move the WWAN supply from the PCIe6 controller to the connector. This
allows the PCI pwrctrl framework to manage the slot supply according to
PCI device power-management requirements instead of having the supply
follow the PCIe controller power state.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (3):
      dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
      power: sequencing: pcie-m2: Add support for PCIe M.2 Key B connectors
      arm64: dts: qcom: glymur-crd: Describe the PCIe M.2 Key B connector

 .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  29 +++-
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  82 ++++++++++++
 4 files changed, 256 insertions(+), 2 deletions(-)
---
base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
change-id: 20261021-pcie6_fix-cf66f4b8b387

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


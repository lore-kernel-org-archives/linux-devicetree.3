Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1B4A482B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145248; cv=none; b=GCGRVRcIij1aoBkG0zMipPYdsq+hXAwgHsmERIr3voQcVrkFEjEGUV0QgJt3zqdKjhvSSnJZYCMy7REWsn4yTZjLjtLFeXEPq5j26Pmw5xj55rkTpVDBcUkoOSuFAKtNU8gfCOOjY3s3uudyBQmXCEcHeKJn/4v7U8tglCDXkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145248; c=relaxed/simple;
	bh=bJGsImACvT9xM12juJhgFEgiAuk2ivW2Mi7AoKZyfZg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXCD2xBbHvXP/xylNRxIRI78qn93rAzb4CNPC6XF9/Kna9wc0LSa+xndVloyoIOCrHuKtOlfOLttfphCsmN9HK+iPQSVHSu+zohZoY1X3iugE7F4gB6cyUhpxGTLoVGh+A8jQzk0zlKnfbFmOBPw+t7ifmhKTq2fHEdwe8BF/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2Pyuk39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1TwiMSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2Pyuk39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1TwiMSb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmEgg3780626
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zFWiaD82+LLEv+4Y9AJ0DX
	fzOC3GSd+sVzZ7Y6z32BM=; b=M2Pyuk39KtAEXKzA2rad6d8Rh5FP1aKqeYiCnH
	71rBlUozstcPj8RV63jHyw4M823w8F2u4yASW+T9hgOpmkiXmkfee1HvDxH8Lytg
	Inm9cUQE98qNLpNcEJ5pTnW0ntgYRpkidUO6QROj9RuzepB+9/HtePcyGg5Ln4pw
	xFF0vxfideoLigoWAhwCZdGb+SA6KLgoSOThjMuIvq4nN+HV0Lu5j+xpRzr4U4qv
	R018axdb6fJ8kCTLbXODMRE5+LApKAT0fB0wV+v5mMVUyLSoeIrcUby4Wzr7skb3
	Ly5XWWUl6zAfPuxJM2Ufq2AX+Tt7c3D3ss20hWhx1SmM8aKg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfjh1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1619482a12.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145244; x=1789750044; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFWiaD82+LLEv+4Y9AJ0DXfzOC3GSd+sVzZ7Y6z32BM=;
        b=G1TwiMSbf4+cynYxM5cMF0R4zuaCOjFCVsB6JqUtNSCryXFCaGkgd24vpEfCV2VBpE
         lLyt7W9zRM5a8bzv6G+GjoWNhFADn461shhGTTu0FCN1oAlNoG7T2MvvJAMFq5NzZJ+X
         zBnStbItHRP7wdMBSsUsVC0wPAJ1Wy4WyC2QYNjvCFjOGHUoIAmHdy7h9BTE80VyoG+p
         GVwMwBcsJObedjZLCAZQSgik63aaF3q0WispHihq0hOJP9kHUi7Rcb6dDyKO6QnXnrJJ
         h9cMAUpZsgGXUIg9PgPQl8DzjNGM+b9HwRBvLUaVKH6eG5wdaYVrXnh26tgbXkUcXFN6
         QC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145244; x=1789750044;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zFWiaD82+LLEv+4Y9AJ0DXfzOC3GSd+sVzZ7Y6z32BM=;
        b=AowQEEZ0TFGI178UdBtism5sapChhOiknMZL/KlwzBHmSjDdwU6rK4KBMdZEq7CIAM
         KXv1yip/k9feR/UFBdGiO7ERCagYAh6PZLrbnRHOfnxaGl3RovOc8TlMNwuR37dB+1aY
         gZ6qlo/ZI5gUWumkeEIOYN8f/ISYbPVYSX2zUDM/KkKnobLXZyTpy+fZvA7IFA425Rsj
         LZp7tEKSAn64Z9nIEdl7+D/Ph6+u42MX9pd/rHFWnj+l8Q5BQPM/TeUufDTuBcGqa2/L
         C+KS6gNm5dzjdKTate2vtFDJcOQR10UrC56O4Y/rXd0HHseARYYxs9tYNEmBwA/h8eJ+
         KEwA==
X-Forwarded-Encrypted: i=1; AKwUvBzWH7/kcHsS5+lyUw9BSr0CqQepQ8K+ZB41/Ypmxxx+2ObtsBswbLEJFsc5Kl5T06LRi4sByn025wVX@vger.kernel.org
X-Gm-Message-State: AFuF++kvtt4fm+q5nCbzjAcLSRfSYYBjEBkmWtCKbrbO5KqI2jyShpmm
	EG6U2yN5YERoJV44vwiPoFFtb7qo+W6HGJSh5gRl2u+ddqWajQtWDCngP8ufFu4g9Yq6tfY9UaF
	z4j8Onxem+unwrth73l4qBnWTBf5om1LlZLXxjEmz25N4zvOpbLf1ODwq4X2Nu73p
X-Gm-Gg: AYBFou2tpSCA70k8N6G+j+NuDqG8UMxF3VsIJ8WzilR94zVRw1W+rpZwwJreTKenYQN
	MSsPHcwhKI/WtMvyGKK971S6ZuS7yGpuBX1btDYhoFRsXzn/UdLO30MRPEVlHZpF5OWiY3ybVE8
	ebQE9QPaZg8SzpVYlC0Upj4aTIcXR62Ol0DhOI9d3elOcNnnAzTArZ3jz8wGUwYojKX7CETxZPz
	5u0vemwDB2W3KjmGacfqO1qe4iDcw6+fajViM6JYGIprSudeHJsqF6pORv4lXUjBON0defjFx3I
	ku0ZgqhqpeiiwuyY/noDqxLAPsGDM7i1VzH4aAcl5fEzIKCuyUGlFdK2ndZbowffJjF8NmqVVsi
	5N23FVe9Ai4wXgGRzXDrfWp3Wtg==
X-Received: by 2002:a17:90b:1f8e:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39d9bd987a6mr8508361a91.6.1789145243621;
        Fri, 11 Sep 2026 09:47:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8e:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39d9bd987a6mr8508313a91.6.1789145243180;
        Fri, 11 Sep 2026 09:47:23 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:22 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH 0/5] Add UFS support for Glymur Qualcomm SoC
Date: Fri, 11 Sep 2026 22:17:04 +0530
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgwpGoC/02OXW7DIBCEr2LxXCRYL7j4KlVk8bOkqLaTgG01i
 nL3kDpq+7azmvlmbqxQTlRY39xYpi2VdJqrkG8N8592PhJPoWoGArQwUvLjeJ3WPKyxDBfvBpq
 tG2mieeFSAVo0nQLhWM2fM8X0/cP+OOw602WtFcv+/Gvom50v8MXnlc/9+MV3S+FKgUZSRpO2/
 SbZ/32vdPe7jtdlXBIEcN7INoZ+a58JZwtxf5qmtPRNBBedb5VCb7WRBt9RtKIDg4DOBKLnFQD
 Z4X5/AHsXhpAnAQAA
X-Change-ID: 20260911-glymur_ufs_qcb_enablement-1524a497520b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=2110;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=bJGsImACvT9xM12juJhgFEgiAuk2ivW2Mi7AoKZyfZg=;
 b=9lAVJWvM3G+ZFTJ4H36ve2HVhPJYTkVEvGF/7ChP/40cX7VIcizqD1Mv0hcnhj3AZgC02UQUU
 rIIGBkxBShdDcRoPiq97ZoDIZv2Hjq3C1K5sezm29WdGXtxOmEYLq0c
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX0J2aACgEUoYK
 3QlLnzer3y6Lmq/zR91U/hYIFxBAWPWVCwZndPN1lqJXI8H2qAQ4CmfgmqUjQJSk4zN/FGV92ID
 FeMXX6wVTJ0NOhP8qiSrG5AhfYZhkT8u8pfsC6OwE3FepJkDSq+z4XQrC5pCRBHRbycL5s46khW
 f7DIqit18SyQA/eA6EidglhYUOcaw26DxYvSzU+GGCwFUAyFuM/IttB29gOHMLjywPL+kuq0c/k
 SRxPZ1iVup6Ymi6vZ3t5q1NmrL8h6K5feo7RYTpy/6B3zQx2THKPyHwtkUyQ3Mkvry/EHhasFa3
 D82C/vM+dze8DvD9MGF0l7OY9dgXNzkOoCgeADJ31IboDEee4C35i91kyOMJ62/aySzRftk1t72
 F/f+r7DIxPZ+k58ubmAI7avll3tQWQzUDDSGD7ZikNc8Ipmjsyt4Kbn+8K5iW/2HU5DoS0SFwPn
 RX/tICHf7kZYPEKRCgQ==
X-Proofpoint-GUID: UnylVGp2sIXLk_UDIfk6K1aHn0KCcbZH
X-Proofpoint-ORIG-GUID: UnylVGp2sIXLk_UDIfk6K1aHn0KCcbZH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX8ljRaQiU6JH0
 Et9gMIbFiKpV4KG8/3JQ85ZsaYbLWebOF1HJgDenqCInq9mq9hkO+CLXVBkjyMuGzrL5q8isIzQ
 gU8KXA01a72A/xSMcqurJU2dg3bmvQ4=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa4309c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cnq2yzGENyK2wpwfoncA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234

This series adds the DT bindings, device tree support for the UFS PHY
and UFS Host Controller, along with the required PHY driver updates to
enable UFS support on the Glymur Qualcomm platform.

This series depends on Glymur LNBB clocks[1] and Glymur QCB platform[2]
series.

[1]: https://lore.kernel.org/all/20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com/

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Pradeep P V K (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Glymur QMP UFS PHY
      scsi: ufs: qcom: dt-bindings: Document Glymur UFS controller
      arm64: dts: qcom: glymur: Add UFS nodes
      arm64: dts: qcom: glymur-qcb: Enable UFS
      phy: qcom-qmp-ufs: Add Glymur support

 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |   2 +
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml |   3 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  18 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 114 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  99 ++++++++++++++++++
 5 files changed, 233 insertions(+), 3 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-glymur_ufs_qcb_enablement-1524a497520b
prerequisite-change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a:v1
prerequisite-patch-id: 934a81749f6e977edb9214104fe2bbf4c7758663
prerequisite-patch-id: d4215d48878aac66f72ef5b6c74d81d1163a596e
prerequisite-patch-id: 28be2089f7836210401b8a68c7cc0ca90d63c375
prerequisite-patch-id: cdf227f5515ad8faec49bde5e0475755a961100f
prerequisite-change-id: 20260711-glymur-qcb-1e2d2bc913fd:v3
prerequisite-patch-id: 53dfb255c51efb63dd26fae3cb30307f0d175ac2
prerequisite-patch-id: 7fa1b965056eaf3b90ce81a537d28c5a2adc73fa
prerequisite-patch-id: 96b042ef08bba0e028c86ea2a473d996880ab38e
prerequisite-patch-id: d2f390b67a2ec320db1e725f4b84b500f1f0400c

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>


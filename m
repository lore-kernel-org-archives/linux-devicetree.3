Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7C43AA4E4
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270713; cv=none; b=sfPSOS/POr3/7VVclTJMex+e6CXiBloZziwJbu3uJOV4uVIkuC/0tdV4J3VxN+Avxp0t9z3npgr1NAlx8WPTSmsR8TQkEx+QC4C/HTGezmm47uGxX/hOWjFX6LYrlhkfvNc2pxX+EvHee+0pVXUZTywr5SA/Mdqlw/p06TnmxVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270713; c=relaxed/simple;
	bh=KQty+qIegyI7QufJCyR7H0o8gE6RrZyNKWlDUtYTku0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HY/uARLejB1VIcEcHuSEsXIyQACDcvYlJbfOIaiANXUx4NO8Rk1pAn1FAzNVS4fpY0WfTOYnPhXvFnXy9Sk+UuEK4mSXlMbL5KPYI998OSb5byKasbTWUBBDIDriCm8R6b5dRFJ862ZKHjhoLNpwZCsh8udjGLA9t+PiCHzP+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4bOTYQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgPPo+Z2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4bOTYQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgPPo+Z2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7eMWG3503696
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FbLe/4W/tcC
	wJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=; b=h4bOTYQuq6bUumUdz1goKoJmtmP
	61wPfGPcWf0P7W3vwebwPwsBmXTf2aEbZRDWhXO1SzZil63qzTx4ZL+iJV7xgrzx
	Ruih3rYl1qjfMxOk5pEhBwrKc8QajTqXUZLDuatpy3j/8t/+KFhFLa1Ht+CpqRRl
	SnuauOEQd6dKmxb1ZvHpN8WvZN1d5W3p3uTRDNaxhqxSRW5XsXYkEmcuruAxajX3
	D1CHsXy4A/b/jH9C+pGlnLNMEm6drfBIzUUxLq3bLInenKy5FlGvkb/Dl430vXDG
	eV+Sf/ORoBT7eCKwRvU7n4ybmip8PFKiowXuYs9neVuT0DwilT+xsswtL8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng5e8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b5f675be9so95494671cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270711; x=1774875511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbLe/4W/tcCwJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=;
        b=fgPPo+Z2UGz7nJREYLFJdmZvTabFKwxnTPpmSGe1IEN3CVK6spK1ENjLEbTHwmD/sH
         5uyBwR8bAYCjIV6PvUkJK9lpi9nLMTq7LlmCR6mSHMK4/t74XbPTyAqzFTPmb5An1otI
         Xga1BIdQFA/gq9gQ+Qr9jh2e9HoFrChNOmIGHQQcQ4abwFMhkJFN28VE8BR097YXTCLh
         C+4khq6xwA39r7ox92Bscs+NB7g/LSqFjJ1b+91ZW/a1RVAAAzTNYdsMvQTvq1xfdmEY
         8/xgbd1j27ngKE8tCabbGFvMFe2YKQLRjvBMk50+AW1hKJ5omcG8KfYYEft3cF66hRV3
         nDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270711; x=1774875511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FbLe/4W/tcCwJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=;
        b=S+q0W5j0DMe0tMezCEGGY+K6ehxdTX3DDmVQks3g3IUl5aYWs79UV8bmORFIeOk1Wn
         Io9X6nYxYHdysK810hHI2cqlt/okbO++AU1ZY0vUbeFy/71CE3uMdWsAoAZbX2mzcpt4
         srgXR1O4Qs1sXmCGg8AejXEDQNd89UBt4I6mGnsboz23ZwHkCk6Q+hGDJq4tm0PvRgJI
         pnnnZ1qs8mOL6szoqkkpWNYoUD6+du9tRLu3T2/4iyaSTfhy4gx/smfVUqmCsg4aQMrT
         vDkwN2uU1OgtxtQ6j3bcpEa6mmDqQiHnRy1DHkRc/rnrTfEMLTBQrRUmCBO83KJqhnlB
         wyvw==
X-Forwarded-Encrypted: i=1; AJvYcCUKHXVpBzdDxGcTjMEuKDeJ9FxexFGHh9W/MgQ0GDju+3xsAzJVIO1yYWXlIUq3aQaeIhrRubX8Bi+p@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu44vBBh+KMhQpEvKpvPHCXAXiek9u8f/IbPBH0X/uM23fRI48
	owNESEFZA2uXwd8truBpP1NJJCwOC5bFQklpapvdkMGkAhsv01n1fA7xTvg8HDOTlYv1KGDLs8k
	xPgvpOfivkBSc//9KgjBk1774jBHkCo5DeVHV/1DiK4hAuCoNcubFKIbfs363er4X
X-Gm-Gg: ATEYQzwQPdcGMv+Bw61+2EMeYGG0+5/PDnyKXM8s0EIZ4diBPXwRf1UmFLaRMVyA+kI
	GXLLZnSTnn1pL4qlniqawNwQ0alhIc1DtgqElUvG4pxcXDtUTe7S9vJpbwB/FFU/VZiRkEFTR4j
	MU87b6hUXHko8+WUxSlEMe4PBXKvWSUcuH4mVoJY1Mj78oOzh9T8M6gUP9jMNWxTuLYBxzjHUqv
	SvOEG5Ux5MWwHLsfLCvd7eLTarb6ffQioEi66ahXJhJ1NymM6AZruSzQAwlRobVGRgRHzu/zgWL
	fLgGV9OkUYNa1/4HtRw5uFYLjiVOvuK2A0NJy0lMPzm5QHjK2xnyWvQCB6YuB305pk40gHAP4Ha
	cBswA+fjTAVoaVadmuluYQYXFBOvpumgu0TM7ekqOZacvLDbomDkSizFhAA+BILOTnTHsdhXjxX
	/pYNKyD7etTpMQ
X-Received: by 2002:ac8:57c7:0:b0:50b:567a:e941 with SMTP id d75a77b69052e-50b567aef11mr67494521cf.36.1774270710949;
        Mon, 23 Mar 2026 05:58:30 -0700 (PDT)
X-Received: by 2002:ac8:57c7:0:b0:50b:567a:e941 with SMTP id d75a77b69052e-50b567aef11mr67493751cf.36.1774270709953;
        Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
Date: Mon, 23 Mar 2026 13:58:22 +0100
Message-Id: <20260323125824.211615-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e6UpbM6asgXMDPk_a5Bzu-7T_AaxeOLO
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c138f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=SSwZ1itlJRgpVSTRIaIA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: e6UpbM6asgXMDPk_a5Bzu-7T_AaxeOLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX6FopmC/La/e/
 kt1mP3gdLLnEieLDqFxrEdJfjeHU5KcRTxf3P8J5Rrg6BECPizLOJ2FPvWe+F48AZxB0qoB2FB+
 lNAzP5dkQB0vx9R0MyqQywsu3Rszvs5uKjssnwSKwjgxMBtjfx08sBtJjPlwSJev8ncPPz1H4bR
 VHMIpVoavpeTqqkbRdL3OcFNXdU3q1P0MnaLWmtDsvySiE4+ivArFmBFi/Jpa0I2fdBrgRtdeii
 8TR5EILpb8Gf8+VWn4s0dswno1p4wGV7EV2j9Vz3rJj42jmIN84ZHm+6ITcdMjBeOs0qxYgVY2s
 ZjVsLtsiW/2bOQ3tXSvPitUZrKiqTu1KbZeTTjpW8bBTvpCIsqSnVnwnPiMCXJqAbyrx3HhiQJx
 OlDM+GYYeHqyQN6VCBEqGKu+UXPstMuiRmSG3vjxwapipmMTAVfnFYcQuWycHDeOW3opV7QW74+
 /YBkOaCGF1VIbE22xRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
new file mode 100644
index 000000000000..509b4e89a88a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block used. It supports a
+  range of pixel-processing operations such as scaling, cropping, gain
+  adjustments, white-balancing, and various format conversions. The OPE
+  does not interface directly with image sensors, instead, it processes
+  frames sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: top
+      - const: bus_read
+      - const: bus_write
+      - const: pipeline
+      - const: qos
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: true
-- 
2.34.1


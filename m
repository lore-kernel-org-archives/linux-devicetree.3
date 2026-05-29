Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD13D392C3A
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077241; cv=none; b=bl2/eUDXywgLwW1P3QadRRfxCVedIEd+hvx4J9EGzuigPA4sOcCx8OV21UPIOwJzS2BMS0LisMVx0QqfIbb/0IkwUeAi3ZwsdOBAXrBfVnAI2w0GUYgWnGX/mryewrF+bjOmQ/zIxwZMf+rRKtc8UKA22AfF5o7iysM5VBCBowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077241; c=relaxed/simple;
	bh=yeQt+q6KDTBpZuq2sDms1w9xxk11F+iLVNhI5edtw9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IUI08b6Gn2HhOq+n307di18SdnaPeqCImtljWx4xRiASrbbUIMnrOISsfdCpox7v5IkOuLu9kU+mw4UvZDQul+06uimbMAN/PwJjmS/HSJwWRVY1S7/V7p70S4xnnHW/J3ft7nC0c2c5CkVFnNQlKCIzQOsCHNMjTBtVOQeFsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0FsDIEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRkZhhT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0FsDIEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRkZhhT3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8dDA2857319
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dkfRisFqrgZyzc/mO2h/zVdDCwLfUT8/SkR
	65NdWqWo=; b=T0FsDIEPykGq15GjT5Ytk+/6ymlRVeQgxB2YzQjWZkSFnrGPK9G
	wN3iY/CHDzoptlNzY3aA7V5NK0cOr8MqcZ4KM8/vbRaSsPRSciBIvTsDqpfKl7ZC
	LHM6eZ33SvSwc7m4w9jlYsVY4TG2tocWPS2v57Ba7xtJKxur4q9MWXFySjVrM5Re
	yd5lHLl1NnLFsSbHQq8ozODDWUlYyBREVX4wRqQVyAfqowOzIZeAaZJS1N+iJAM0
	rZpvh0BPOc9wBYKHbWeX9t67M2LMR1rQ/OdwhHA7Jub3SmB6P19EsxrHShCAFRDC
	+RFn50YUlFq5jP8Jae/k9wKmZYgAzOzW5Rw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj3ck3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:53:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so13601083a91.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780077238; x=1780682038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkfRisFqrgZyzc/mO2h/zVdDCwLfUT8/SkR65NdWqWo=;
        b=FRkZhhT3LomUPSuXG4Co2+DUxSzxx7AAhokGoiJ/VlqWnTO7Z8NF9mY+OYq8QZchBQ
         fkMbTv1J6lLgYwOaziFkoCgCiaBcI/wE7AGylkehjSvW2NTCVrUxXsP6duewAzLScpAb
         aA2540CVz6OiLNDxQ+jgGQKXVAzp71Rb97AVqWVrdlQ67DHWrfx6gOuEde14mT7R+WDe
         MKPE4Qi1Xeaui4z71wfZJSloekYl0EofEseu94PEFB+xM6i2dcKHk23EDQ6XiipTyI+O
         zDO59QKjtX6qKeujDiJKrktI+LUE0n9yx6+ZN3gyXFNVy0m4kTPiyC1IlhPCFAfI2pN9
         g9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077238; x=1780682038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkfRisFqrgZyzc/mO2h/zVdDCwLfUT8/SkR65NdWqWo=;
        b=o5R2sTlMTtbqU2x2zN3cIhE4rjoEpf4fXX7jpHlnGdwEY+UuL0d66C1lHDbPHzqDLA
         ilNe6bPZoFhlILp2W1/6J6Akm3q1DFg1abkzrwSNa3eQgiuExmqzbJ0GOo3p6M1LjkoC
         +0ZXV4FlsvLqkPFEyqqLhgwFCjWg/JpX17G3xFGNyq7pQGmC5meoqhOMRBtw2Ee1ORdC
         r19qGScTVTBJSAm/iAg0tdWh1bX+qsuYwkG6EVEGX5+SStYwtG31wKP4uF5IIiWsCEjw
         TZfXh8D4JOBddPBVwZ2HL8bHK7DLzmnCaHmlcTGGM5jsqsg6W5kcJUM9J6BlG0+LdxWP
         pHLg==
X-Forwarded-Encrypted: i=1; AFNElJ/I03hBsjpzzdY40SDy0Vav81FTCoX595w20Ggf1CY6YThG5EiZB0BeIlVPqgByleBwM1+WlXD6Iu+v@vger.kernel.org
X-Gm-Message-State: AOJu0YyoFHVajAA+sYXFDk7DXC/gxJGFos3xOfgq5Ob8Mq+vrmmmJPj6
	BFU9PPUu9BojUq2XFyl1OfK0YWhtqhZv50tJ2dxGpMYFOtqlPk/PI2y+V6CHGfjsfK9ZPKCFIdG
	jHNRIC6ihQaRP5HFNXzoLEppb5FzgUxq2htxrqjaclNBjY/soDMM8DVSQE7a1MbVH
X-Gm-Gg: Acq92OHWoMh0MfsFUYh/Y6UtbXhXCF1X0XJmiU9IxPhn2RA6+7OfGIZDRIEXH6bVDyp
	5VpxIRItQjU4XVmxyec0rQ5tmT2ty+VTQxgUwkvlSiITYQsVF88fEHpAXpQB1FoEXWGUwmjgYxY
	tk9y+fNC7almw5tm4sT/coX5A89znKdaEyk5HR5FFDTaNWs2wdfuE2rY4MHnVtZLNrIpexhwVka
	kveqlbkmg3GNgAThwETHv/OxplMHqLydyBHaP4pGEsVfeFSx96jerBy/qaDD6WUFuKmGgjz5qrT
	BP594ODOfU8Xj1+RfUPNrLdtTVeczkDpyCP1RvuDWfRaQVcp0nLp/3E6YRWU+VvcAOgK13d728j
	MfBYQFNC/0tpNRDyG+yBJYli5jEH9iFKxZyKH3JM/MFOXL/61BMAW3xenL79iyQ==
X-Received: by 2002:a17:90b:1c04:b0:369:e1fa:962b with SMTP id 98e67ed59e1d1-36c684995a8mr167700a91.26.1780077237699;
        Fri, 29 May 2026 10:53:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1c04:b0:369:e1fa:962b with SMTP id 98e67ed59e1d1-36c684995a8mr167668a91.26.1780077237192;
        Fri, 29 May 2026 10:53:57 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbd667fa4sm2088196a91.0.2026.05.29.10.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:53:56 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings for QCC2072
Date: Fri, 29 May 2026 23:23:42 +0530
Message-Id: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3OCBTYWx0ZWRfX/733oAbCRCBc
 Jo4qDx6GcbvokEl4XJY/A9RqSJtfGG9tCczfedajRqdWpnjaFNDUS84T6YwzuIdOiWWyxT0zdLD
 akhxM10q1LZpBNLYEFOnypuEp4ZnMPyAOXO6TEPkL50cNn6MyaUL9oXEy9DkZ+zY7SAcSGZw234
 6LeVIQEKbVARO4GjKb6iZegzxAUQDjtKHUlphj6QkzNglv86+q5bw6F9jfrZS4yTJzZCvUcJN2S
 Cc6nvnegZOvtbBbSw/2Gl/28ozrlpAVZqYInqPxkjqXAG4+E/QkOEptSGySc/BUD2+NjGDmr7FS
 o60tgV4Q/7VlCqyl+ZxNJhqtFF/6kL4BbQxTm1Sx/B2co34od1ee0t66QdtFbSgBqTA+IfKP/us
 6B/GgGenRmWA6XylO8y/SW3PcjQRiZ8SVa6zkMrzOjoRgmuVJlxwdif51Rep6TI/1j7FgWblTcL
 ct0AP6UYS4apWFuPlew==
X-Proofpoint-ORIG-GUID: pRIINOPkHlwcQDQz6kbMpwQwuHDLwL1P
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19d2b6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RzHWNqaCwg9CAr5QTIoA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pRIINOPkHlwcQDQz6kbMpwQwuHDLwL1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290178

Document the YAML binding schema for the Qualcomm QCC2072 UART-based
Bluetooth controller.

Unlike other Qualcomm Bluetooth chips, QCC2072 requires no external
voltage regulators. The schema inherits common Qualcomm Bluetooth
properties via qcom,bluetooth-common.yaml and serial peripheral
interface properties for the UART link.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 .../net/bluetooth/qcom,qcc2072-bt.yaml        | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
new file mode 100644
index 000000000000..8e2f15a75d62
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCC2072 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+description:
+  Qualcomm QCC2072 is a UART-based Bluetooth controller.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcc2072-bt
+
+required:
+  - compatible
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        bluetooth {
+            compatible = "qcom,qcc2072-bt";
+            max-speed = <3200000>;
+        };
+    };
-- 
2.34.1


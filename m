Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0C6381EA5
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013004; cv=none; b=iIR4//Hn9v7bLWkmEke0HEty+MpY04ffvc/7lc/vzdbUIA8/V5WCzxVUVf/RByJ98i8fJfyUNu+rvV0qE8uCseXUTYgEtPE/mIjmS/E1sPu/e/Xsi7B9ukHgbBJ1gJHfF/7KxcV30ljdA4P79lKtHEkb2H4U/Rcps/9SqoQPmTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013004; c=relaxed/simple;
	bh=SkClX+BRSZeyx/tE3dfrFyvjxOsfCTkuTsmKG3JwtRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvG/+OifHEf6K+sZ7jDoiZ6Zxu+KuZ9g5A9ugUx1ASwITGr1SZWZWrnU4yNOC4vnktY2Xu4ohJZcuVEE7IQ5I+OboAuyJp7hKTw/GR7b0/ZtdKC7/kQNEWqg7g4ijX6nw9NBCxND/JwLjXqWiYF/xXrNmPfmLwcg+s0/JpVao/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKJVY+5J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McelZnUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKJVY+5J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McelZnUi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3G2i622694
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 17:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVIXvfF08Zv8MetAzCraK24oPCTEkf7t2xGg8nxuk1k=; b=iKJVY+5JGWYbinO7
	vCVteIYV2dbJKlLgwzBEy8CLoOTHlwwsJZVdpWaj9cbAyiSQiCX4FvtmIQ9/noAF
	vnDRv/uivl9ro4aFDR1bdSr8iCln7iBLcgEAM2J8LwqJWYgkiH+SJyWP6/gQrIFX
	Z4uLNF6+/XujjfpRk5vi8MGqDdoHwCe5JfQ3KrQfD+C81t1wgLMuaiFk3Cph32uU
	TSoPqAOyVSomrGzctC4j3uNs2ZvsZq00BKM/wjGqyxt+kTdxIETeeE/lmrdjjK2U
	N0mBud3dJIozy3JyVRxKW3NmpJjJEMDEX55J5AqkQ0FNsbQH3yaW+/XU+kdgfbtj
	EjisPA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2511h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:23:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso2494216a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012999; x=1783617799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVIXvfF08Zv8MetAzCraK24oPCTEkf7t2xGg8nxuk1k=;
        b=McelZnUiGs4clG+lKu0NBALE1X+krXZQqNaKYQyFBAud1FOS0K633vCnON9UWDJlRi
         87CKFAv8XAczwhs/dMb5ucjGnUncr/TvBjlUvmKItJct5KvHu+8joSWRILMBtsirXkUw
         MKvH6VI8UFaJ0kUt/JyHC2pCSIf761WD00Ri/Q1spOrjdcO7Tsn9zZJizDimUbr0zpEC
         BONkb2DTSICLXu+radnqfa/msnyXp39QcwFZBF+EBjWu65xQoSv2SXlGKA5UhzE60sYt
         29ByPsDpPqezHFP9oIc94ue3Qs05RMQ7t41HcObAoUgw38GcQFsKKaF9PffAo+S+j6Af
         DTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012999; x=1783617799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVIXvfF08Zv8MetAzCraK24oPCTEkf7t2xGg8nxuk1k=;
        b=tRlNNUdKy4iD0Q0/kbWpDdzV2h0LUW/9xEFxrobj1GcxyiD3q/PLSyaBgEjW7PlQQ9
         kjkYDk2guYTYiF92CdHcOfytE16zTltXNCWrTr9jh/doDXrfH5k5Sq4WDLJ43r5nYwF3
         IjOVi5r2hdMHwZs4/CDXifmVDK7ukT4uHHRvaEQJ/Jt4jBBZyi4IZaYMEFfzy1Bq41ZI
         pUeKPISpyQFA9O4kHPwJh6pzxJbWB6VF1yqsq6v177FpgPYfyOT/ETH/OZ1VFaPn8t/Z
         XWxMzHVjN70Apmh+inmulFgWGET9rrpiKTcGUS18iDedEyjUVYnwnC1xXXwnoPEsdb51
         STQg==
X-Forwarded-Encrypted: i=1; AFNElJ8RWyPFzAOacMezH3EILvTIauGHmYUzxBzsDQj0NGien3ZUkb9n3VTK6mkacLp7KuQuB/zc0Bn7zc7B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6j0HKgeJP7CHZVQBYg5lbIpxruy2ueMmU5ZBEPGrufg2tg0Vl
	596t0gy3czJAw0nHUU31DiESO3x0W8n4qqv2+AmWUE+dxn2qQJPi1UHUhnSh5j2R35ElTmZwEW9
	jwf5uSmOFrYq37Q+WCE3Ih0N20UTb+gd/RZn7snIsYazDTZ1eJ9kEAOub6sbHk6Tn
X-Gm-Gg: AfdE7cmEeJyrYplJwenkbTDURO1xJiZXt3BWOz5/s6jF2C9aBuVj+FFemS7IhL0D1gP
	BXO23LtIUAMNm1dwHksJkcqBAZVzzQnaMXkUAbfeQMNYbAMx12z2oTP7+SCrDNvfGCRAIVGOQ3t
	ycgr8BD29A6j9WuH/JPGj3gWUEf4TQUe8l8X+3YitJqw+qXeH1KYq+Iaavak8cdoSpe+v6YHplu
	odih4Llq2uTYaNY5yIHqR68kLnBCUbwgaQaUwwOA3kwMOawMP+iRlfrt0boH5BJilr8jSWg1N0S
	jSOW+OQ+V5rnfr+ylRD/ALOSkI96/y8wvJx1PCNJA8ZebVTQdpugSWPVkuSzZhIATgefFUP3Nxe
	TL5bc0BpDwzEjJGjPYuCDWFt92ZL+xfbwPvfDzq4UZwxPgg==
X-Received: by 2002:a05:6a21:400d:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3bfed0f659bmr7633113637.8.1783012998548;
        Thu, 02 Jul 2026 10:23:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:400d:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3bfed0f659bmr7633060637.8.1783012997955;
        Thu, 02 Jul 2026 10:23:17 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:17 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 22:52:55 +0530
Subject: [PATCH v3 2/4] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-qcom_spel_driver_upstream-v3-2-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=3981;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=SkClX+BRSZeyx/tE3dfrFyvjxOsfCTkuTsmKG3JwtRI=;
 b=yClmCf9za530h3JJpKiRDGS2JiTZ2o7Vib+IN6Cvc+NhSYxbjEUsbUEJGgvNtymDJpCXeF48A
 wqoVqi+0pdrCyJryFPTEUM/291Ql+8RkOHGrUnU2SA3eQ4aszmawO3H
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a469e87 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=3TBu0n0mUwvVB62lRZQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: oK0nMVjjVoE07Qu1WucOWas9qMTYsIVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX8m96UweqWnuz
 aGdliOxgQoERDR3CbP8UH239gxp3D1hl5OmtuO+vUs0tSjr0gQYPWcnzwPuvIa+RJlt/vZN20Pw
 Wu5EnfZeNu8PeyJrdjw6ovXwO2OwTX9WzUBdFfPETsxi7aC7BVoaVQGeoO39+3HKoGIAsqejoC0
 KLPpigeT2Pfg3xDjp5H8V8eJY4GeDXk+iUnMASTrwWaAp81dJmcdeTUYlVIowF9QWn7bUuuDDQ8
 cCTXQSadqjtcqHlIZdLTdEhLVRHNF8djrpFwbl4uG7LWp22JZeI5yqeaA0pDKElzAa5d1crhfdS
 ngKuv0DDPcf6U39RtDgdXR/+eXlBcwFokQhurkNbCV73+kgiy3PY/IPHz4koksT0pRMdOdv1CzR
 93LHlSj6Zu80UjpJgYQTN8rHO0LbuLLwSpKLI+81LcrlKvytpJvZFqIL/UuQrK46HyreuXgQGEr
 yF2xQEGG4LPmfMm1HXA==
X-Proofpoint-GUID: oK0nMVjjVoE07Qu1WucOWas9qMTYsIVd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX3x94t0cTKr18
 nyGurtE/I1CqenJV9YO7fuOOdVtt5EU7BCZUMAtpxYS9UDEUFV4czSajvBYZllfHDGkho/qzI/E
 2Rmr91Um0zWE4W1dkOTinTyTTtwT70U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020183

The Qualcomm SPEL (SoC Power and Electrical Limits) is a hardware block
that provides power monitoring and limiting capabilities for various
power domains in Qualcomm SoCs.

SPEL enforces power consumption limits to prevent thermal overload,
maintain system stability, and comply with platform power budgets.
It provides:
- Hardware-enforced power capping with configurable power limits
- Time window controls for power averaging
- Energy counter monitoring for each power domain
- Automatic throttling when power limits are exceeded

The hardware supports multiple power domains including system (SYS), SoC,
CPU clusters, GPU, memory, and peripheral subsystems. Each domain can have
independent power limits and monitoring.

Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/power/limits/qcom,glymur-spel.yaml    | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml
new file mode 100644
index 000000000000..e8d974cbdc64
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/qcom,glymur-spel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Power and Electrical Limits (SPEL)
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  The Qualcomm SPEL (SoC Power and Electrical Limits) is a hardware block that
+  provides power monitoring and limiting capabilities for various power domains
+  in Qualcomm SoCs.
+
+  SPEL enforces power consumption limits to prevent thermal overload, maintain
+  system stability, and comply with platform power budgets. It provides
+    - Hardware-enforced power capping with configurable power limits
+    - Time window controls for power averaging
+    - Energy counter monitoring for each power domain
+    - Automatic throttling when power limits are exceeded
+
+  The hardware supports multiple power domains including system (SYS), SoC,
+  CPU clusters, GPU, memory, and peripheral subsystems. Each domain can have
+  independent power limits and monitoring.
+
+allOf:
+  - $ref: power-limit-controller.yaml#
+
+properties:
+  compatible:
+    const: qcom,glymur-spel
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: config
+      - const: constraints
+      - const: nodes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    power-limits@ef3b000 {
+        compatible = "qcom,glymur-spel";
+        reg = <0x0ef3b000 0x1000>,
+              <0x0ef3d000 0x1000>,
+              <0x0ef3e000 0x1000>;
+        reg-names = "config",
+                    "constraints",
+                    "nodes";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index db3d8c441e4c..44e90b2d5e85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22368,6 +22368,13 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
 F:	drivers/net/ethernet/qualcomm/rmnet/
 F:	include/linux/if_rmnet.h
 
+QUALCOMM SPEL POWERCAP DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
+F:	Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml
+
 QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0


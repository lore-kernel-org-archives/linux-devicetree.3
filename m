Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3C4052A3
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970292; cv=none; b=WOLDV/9Kk/C1EAALPbR1V1M0VNU8meLNAcpyLXWFLDgUA1nl/GdWep8Iad25B5JcZGGnJOg1A6nYChxqgCWun8q5edUXSoFWkhf5kkh/VfeWoEi1e39XkO7FcXdoMDuyJqVWcqg21svLHiJ9wza4apXTyyZfWlHEgRh6L10TVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970292; c=relaxed/simple;
	bh=m8Wj8IlJfxl/EXgWl7NbfBEc9ZIDALWBiNEWVbi1Ge4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaQwXtNG6co+YdqUjuNHL3oTX2trAcAPJ6h69Ch7fdzb0Xs9SSOqU2XSx4guIpuXqj5nrWyhjSUNlm2eNNgJYCDXXwKdepn6OrQa2LkqeKIkpSohvhftKX0/syVrANd0g6mur+spM/WFX0dO9BQq4OmjVL/rjQRa1GSTkoo5UiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlZZkxyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqjhWoon; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlZZkxyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqjhWoon"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H69dM671109
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 19:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQ52WWB9Hex
	EMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=; b=QlZZkxyduIXjC4S3dqAhHARPYcR
	4CcwwhNxQzyw5ngwky/h0j9BSy5uEjlYb1n0VoPAixqk+OEcEWLRcujtUJVIctYo
	TL6h0WgFsUo8Rh4gxwQFldhqis6xTIUMXuIPr/aQQYlcPrPKTdSMni7B9W//8LK6
	Vphwo5OmeAUFq4Zuw/LwUJINhZVsdP89Zc8LycWrssICC6sP+jFDMOUj5FZTcIPn
	Yo43s6MOOK32s9iwfqMXEWTUnuapL+OMpJPbguTT5euoPcPz2ObX/qg3Oq7cwqPn
	Jdcu/Eje/W4YBZIoPC5lMaEAmOnPVWBUAncEaolTc8+eyf05jBRa/hsc78Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxectsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 19:44:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a438816dso4152736d6.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970289; x=1791575089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ52WWB9HexEMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=;
        b=AqjhWoonBcm6kCvDYYj+urtbuBEH3U67MaxO1dajWSPian+LzF6pzMBpnbGfbRLy17
         tNQSON6x9WKq7oDw1CgmNvSjL1NKFFAQMfYjl3ZWKOy5a16x+gnRHgX7peJXflh3BwmU
         +AGaO8nTjaxUR6l3gmfBoq68tc5Tw1T+6tzcxaN8s6x/hDMctzkn/gJq7sBOBMyuuufn
         Q6J/pgNLlTTfYDNbKh76r/2CY9P1X7AGIjve2VHs8jlhDyJF4neWKlR8/jWwdtCJKt1w
         L2iJytttcbhEACgbEYE6qNcskVumTwwX56IqnXxqLD1IkGIktJDuwaZOVnHAMnupMPuj
         qttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970289; x=1791575089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ52WWB9HexEMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=;
        b=iKQ+tF8UPTNTWDx8L2EqsQ/oA6ErmU7W5y6kZqDt1pnAttm9x2pBRTVRpkGwIEWwlk
         N77MNBCzsMZF9r3CVLQMSqiMo7v1p+ufvAulUhYWYCTsWpcRYP/tC7SUwv2pRTbZjH48
         c2GztS9/Xt+YJZJB6ctagvTl5dcuexpNY5PJI6Q39tl4DpzWuJK9haWpHkPKM9sYL7+1
         6C60SQ6oBjhNTip44k3Aw1qjajZNUU0Yt+cT0XdPehdlCaYXSJXps3LG2pTQwHQB+9gq
         oUJq/zNgO6QR/JXjoIUHnJUrocryHXWyYViAEC0y7vFtL8TLJmi3JMAtBZAuLcGi/6ku
         C3+w==
X-Forwarded-Encrypted: i=1; AKwUvBywdwi/wNNkf4wJ9dDAoyh4GlgzEAiA/xksEIraSjlUmFU7Rostg2LHQX2oLC3OO2u69QBvdfRX/vbE@vger.kernel.org
X-Gm-Message-State: AFuF++kv3ZjvQLO8w7ywh/Ssz0FS7PviIty2N8vQUkKLdjIGM+BevP32
	lkQaQ5kN8aOjvUAGsNdvtePEyzHiPv41TA12KCnHySoRiyL7JgXarDntWqficEV0L/7a3JgW9r5
	P8ts0lC6709pcC2Wi8+QCBdyMkOCdXpB4ZNVXdlbE2llYwIsyx2VfeCwbN+6DDJSu
X-Gm-Gg: AYBFou1oUWUY5h5mZlQHSVGIcny90yhlXMuHewMa8WmYiPupHn1tVOqRoGCLzghT/u7
	O9KBkUpDEOPObDaVLMQBALAl5MdKew9hZGsfvMTaabTO1+Ihb34RlJ45jEf10HHBd2OQH9xZ6C9
	QmOtNzPs/0M9pbzI9YSA/CfGj50686S/ZOlkQ0iMB6K4RQQYw26K0Vm26srY7IQ5ZlgGPRglC3D
	9ejfI9E5w89iydbok1VEZAIGBafFBMte1kEXVb4Fa1ELCQdUPwP4H5FjlVW0AhWI+f9KEln0oH3
	s3bJf+pIy4VCD4BPoNwsyDDhQ9NUydJSd8u6uSVtVM18W1Dd+k/UiSaXyTf1RBzarvaZYPlnuLl
	ZlJA7mjnaKRCj
X-Received: by 2002:a05:620a:4006:b0:93c:7948:6e84 with SMTP id af79cd13be357-93e5109951emr82359685a.52.1790970289299;
        Fri, 02 Oct 2026 12:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:93c:7948:6e84 with SMTP id af79cd13be357-93e5109951emr82354385a.52.1790970288805;
        Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: Add LPASS AUDIOCC reset controller for Glymur
Date: Fri,  2 Oct 2026 20:44:32 +0100
Message-ID: <20261002194436.1275056-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6ac009b2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=peyyOT9P35Ab0jvJzsIA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ODmezYZTwS07epue6tOx2xdBBsQG3njX
X-Proofpoint-ORIG-GUID: ODmezYZTwS07epue6tOx2xdBBsQG3njX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX4Uo6WsiYgw59
 1VM1t1QRPiZLLKa0X9ySANoLf8Qa72r5yKKXBYaUzSYFqOihJ3+XkurupVT8k8YPyuNJb/4fFdM
 7MLOHoxXDHorIU7xLXyCyqiiI4STPbqzNbdz2FuD0tmCdqFkqf5nwDmcSMao0KhYggJMlG4MLN0
 +vtYJtaaR31KSM/Pd4TwA8N9VZ8N7vbVwWJD9lXSQOMLAjWbNduECCFwnJLTBmYIvhaZi3hPSe8
 xMlAFoupa0vP1mlDwqQymRSczCR8DWEYzOBBlvneoB9eNSjvi3pWfbBAXy+Pk+Snhx1bNipy2WX
 iRDOtKGLp/8MCNOvmh/A5VrYT6blE0/0ehcXnFP/u/AjlovAWycEwKt8shqR5PmEMHxJ8r3vio+
 l90aojrHnc0dWK7FCKpZy6oBqW38Qv1uRLyQwVDSVv7m3TpNK/UDAPXYoBTAMTroRvjZIauZhaz
 9SKCwgoNp5OrxcjxPzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX5FH2xA5HC8ng
 niGqh0tgSyTXYtal2vzxOL8NMDWgt1VmxYMQNgUVSquDJI5HCIAbHgneRzhH5vU746C+4K7nTmX
 aL6jkQWUOeMKzIf0p74woXcBpDZ3Mtg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
provides reset support for the SoundWire RX and WSA1..4 masters when
LPASS is under the control of Q6DSP.

The programming model is a near-exact match for the existing SC8280XP
LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
and add a Glymur reset-ID header for the clients.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
 include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24cc7..a25e043ab894 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -4,22 +4,24 @@
 $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP and Glymur
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
-  and reset on SC8280XP.
+  and reset on SC8280XP and Glymur.
 
   See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-lpassaudiocc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0


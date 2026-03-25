Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA8347BAF
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410852; cv=none; b=soyATZOQoAy/stmXS+g6LBzk39VT1mndzt+2TAVmmzcL4XMzo3E4YMMaR/feQK1O+5ogcSKWXBVnxBy0LYVb7nf0TGJ7AfFYof15pY/lSfnuehQYob72TcVz7b8U1ng8ehj2sHu5RWZOC2VKmlL+W7Av/NiU5cem83SALP9kk4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410852; c=relaxed/simple;
	bh=zFJvnpRDVhbyGcN7LPIm3OIDdTOiVF/KIAJsNVimOyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZmT2RjIe3lYvCcxobAO8h3DLRGuF7yhyPawC+4fPTdAzbFnzR7TTfPVnjqwrJAY4TJR+LfSHmJKdnI2GQJPv1EDWVzEpygubbGoXlc1Spd0mWawYV985BRbWUvXqseA/nJjTuS7xhLDnyyqNHxqXM1RUrR/wchBaP4cnQKtvAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL0tcpGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz9LkRRu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL0tcpGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vz9LkRRu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtHF2807987
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3jX9p4BzaIk
	/AfeUgZMW3cRP71s253t4VR5GCrYeVfo=; b=HL0tcpGKSAuPtC8UEojQ3iClfKY
	uwKZ7mLIW0uxm7G/fGxe5zumBG1UAA8gd2dmULCGcan/7KyyrIUVMazucLDfeTkK
	Voo8QtY0daUamJ2VPr+ZmTpBdFyZ8HtpzPLuARcDwDwogg0/0g8t6ZPfd63Aq/Tt
	csbVmM6dD/z6tmXiyME7aK6NhcImC0Eb5RaxU79w5YV+kZBQFShTKH5AobSCBlRD
	zeZO6/9iF0v2G/zJN6uIMU+K9YurbSBjFkRreRlPyDg9Pak6I0eU8AjeDfwTHgw0
	pN9NU8dIhBmsqPB3MG1jj3rjU9askLOzlZ1dJxpcPkLyw3dE9+sUP8KXXyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ek6pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c38b85ca2so2691242b3a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410849; x=1775015649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jX9p4BzaIk/AfeUgZMW3cRP71s253t4VR5GCrYeVfo=;
        b=Vz9LkRRudQtPZVDLS1SEVF3ILnIh/t9K0oCpV8ft2xnNZJ8wisNeyhf+OX8UDfqo+X
         wek4A8+Z7mciTG8U+QgoUef8vd31LPwaYJAs0vZn6m+CMAr+FBfQ97b/REcBcgibVTeY
         P5vrkA8dbe3XerC+1873+Wz90x7wE7rkwxB/TkzCwWDsSR8xudnRSfxKoNPo/5BK63Bc
         px4tWs39MAQ1ZCVaY1EbGvE/CixCMHCdS7aooEmnbcqmtcQqv8UfXMurxvPDu0QOHuuC
         13ItD+mjXXy4XrU4B180Dt4yiF1zEIafjfKb4UQM+IyS+IrsEpIF6QqyAFBcRFDgY2PS
         +nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410849; x=1775015649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3jX9p4BzaIk/AfeUgZMW3cRP71s253t4VR5GCrYeVfo=;
        b=jk1+P3du5MtLe7pngFpG65N/ACaewsjdAE/GVKK3S+Ed7Np/6LEz0wQP540HuqzXrL
         nLwL/8kmA1ppgC+uaCIoZX9JDLwdvvavR/OvbJLPCz0bGXcgq4ms6tdXczjN+ububBnv
         gjUidn3EfoIscGICfSTaAXzNz0nBH0qdjPpG8484RF0bB+uY77N6Uovb8FyAsJXHd5XN
         oqNt7vglaUIUaHfv/alC/HEsefBhZiUh0nnqo/051m24hRfNSQt204egFyT5nWwijV1r
         6pk61PAOZegE37HEplQyTOXkbquXdwYOvXqLM7vXKIeMuJn5fFLzQnmgYclOqsSDqtWg
         Ys2A==
X-Forwarded-Encrypted: i=1; AJvYcCULco3vHIeyhg1gt5FL1TMfbhakNRyzolRlypKRccsquWPQ7MggH+ZXouhkvUdtxeCec9O70Qs/IDRd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8KLLqaDtWLyu86noPh2X0qrL3aLaULXAVdMT2D69u70V+3RD
	LCuEFzA5/XlB+7j5/4I7k8jCVtI91CJX7GnBefmso770wFn4oEa2z0K+Vs2AMohKiamK/eukP2A
	T4dho6YqEaMkF/YOpV04tDCMZ9lijON+gnVeo1Xg7tx3IfJjsmJZ7FbUCDPATsd1Y
X-Gm-Gg: ATEYQzxjF0r+0pW0t6bBaSfu7lloEmO9vUrjQ+qzO6MrCWH56LiH+VhP3ozBSxdgg8K
	Fknbx5+U1RaCyyCN60oUcyFlaVMo/fcSgnSMaGNbATagPRnLvWWHK75UW5BjrmHpoy+0qsI6nio
	BhziCjHwaRAN0u1DsAjQ/ocY5Qa5L/P/iAiWVabQRhHkASIBKDPZSEm4tdJrboERtC/6qEP+pj1
	UJHs+tbcaEk4q4du0A3lRWtbDpZAP4C8fKf45x3jSg4Q6JY+hs8BruAV95WSxrua/65FgSlLS6D
	q21HH4S6ir8kxwgNSC3u0n9ZRSwnZNIEZ+noGGxpa2hy3Vo+KfG0WBeJvCjwuGwBp91TZkoAeXo
	5waeOYLgUc0ZtZE25UKXMQ6cCvug0f2IfQ41kihyAbHQuAwdkxr4fuoq17ENsTd6RNh+Iq2iTOe
	hfUaxdN2jugZ+bjv+GlYbThEar+NqG1cCSm/QW
X-Received: by 2002:a05:6a00:430c:b0:82a:6d7b:cd3e with SMTP id d2e1a72fcca58-82c6decfa72mr1882704b3a.19.1774410849428;
        Tue, 24 Mar 2026 20:54:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:430c:b0:82a:6d7b:cd3e with SMTP id d2e1a72fcca58-82c6decfa72mr1882677b3a.19.1774410848868;
        Tue, 24 Mar 2026 20:54:08 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:54:08 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH V6 4/5] arm64: dts: glymur: Add LPASS macro codecs and pinctrl
Date: Wed, 25 Mar 2026 09:23:37 +0530
Message-Id: <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hUlalZ9EkLYv7sTEbsQTjSROHY9I_lDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX7Z0bpQdb6gc+
 6W0f1aoEhuSwSs2++hUTKcXX2asPajGPY5o5OPq0xcSYCPbHrUlNahKMNJ0KGfqdSFO2Z73MKoS
 pwlFzOweiw3Ogl06inS7vcMbfuN3ARdvy4FYp2fnJkjOLCGpLT02lfd8eFBo/WHg2F3s/U7I8a2
 X0AuytVzWdSHLk6si+K7f6Gia9fqj8MD+umYiZ+VaE/EeB/4EJPydugN6VZcEAI60d87D1HcgD9
 hhGCS91lWxFO9SLqJNKMwm2M74p4bs5SCxJdn2I2FL4lyBGudLMSUjhwL1YdNqkRf2Qbj8Hwhgc
 bCTDZD2f8ONeB95rFhszU9yr/VTpVFD7r/w9Ci1JARUBlXs4Kjx5c6nkUrNQ9JoIN1N9eqVIvYp
 ZSGeg3fviS/xQSJ7Bef3JVZh5odhdD1ToxKtuTWNxSFB/Gd47kdDCf/RevKv9ci7csvsf8/bwhm
 bhv7lTNtCHOdKF4AWDw==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c35c62 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mx1dUFmayEYO8tNA33gA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: hUlalZ9EkLYv7sTEbsQTjSROHY9I_lDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
for proper sound support.

Also add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 263 +++++++++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e571710de40e..61a5f263f5ad 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -17,7 +17,9 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/spmi/spmi.h>
 
 #include "glymur-ipcc.h"
@@ -3818,9 +3820,138 @@ compute-cb@8 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1004 0x80>,
+								 <&apps_smmu 0x1061 0x20>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
+		swr0: soundwire@6c80000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x06c80000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00  0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff  0xff 0xff 0xff 0x06 0x0d 0x0  0x19 0x06 0x06>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff  0xf 0xf 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_wsamacro: codec@6c90000 {
+			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06c90000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA";
+		};
+
+		swr3: soundwire@6ca0000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x06ca0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00  0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff  0xff 0xff 0xff 0x06 0x0d 0x0  0x19 0x06 0x06>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff  0xf 0xf 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_wsa2macro: codec@6cb0000 {
+			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06cb0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "wsa2-mclk";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA2";
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,glymur-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -3835,6 +3966,138 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x2000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			wsa2_swr_active: wsa2-swr-active-state {
+				clk-pins {
+					pins = "gpio15";
+					function = "wsa2_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio16";
+					function = "wsa2_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,glymur-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
-- 
2.34.1


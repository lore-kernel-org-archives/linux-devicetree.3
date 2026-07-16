Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9254D2EC54C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191899; cv=none; b=RcmapW0jfZstcnZTr1bVEQ9gyMIaf7KEl0l61AeJ+QIsLu9i5KEpoFZBmWiMd2rjvSDhYelMfb+f4va+ZV4dQzCsdHFu+ibF5g0PE4ZBSmvrROlhTSfVS9Nbb5nBM9V94ZsNvmV8+rSXY8/sLdp5ydxOAaSAiWIrnn0YeXhAcbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191899; c=relaxed/simple;
	bh=CKL7bop5MplYntpIlnBdWPEndjaKm1NNl8MiHAUr8BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qLVn4HO25FbG9KD5hOJuHvhj3OLBen75ZzOlx9tC78U6MF1p9mheC4bcWm+AMAFy8wfQsXPkjRNMc3qbZbtI2KIEszaJjxd0jOIdTeYsq1xYc8VITQqFfrCekPNw/f+8BOCVYwROy1cL/5J85lxgi39grLrR9A5t2wl0NdFAfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6cYfYHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vinydxtq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6cYfYHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vinydxtq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DxsY2115330
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/U0jnkrgqCg3qrLMjPGRj5
	2qmyks8bXXJa5C85L6omU=; b=J6cYfYHx1AjuHsu2jDNKf7FKaiqdNGkEXPaMdK
	/pRmZEeTlMssmgdekvrGLAbcogRr2i2oazL3HwDy8BgAXfe7B5dOWZUBFCQB8xfa
	8bq8rlRrsd9rtYEbPG/KW8RGZgOoflt1BKtImqE6Fdk1Y6MqC7bYgOnLmzJq9q6T
	ZptMiMrAV2UXPJaU61/Z9TDb/aWcqgodOw/4EGjpKuaaKcsmfQcAqJnJmOSWXhgI
	Docn958CEsEwzD+jPYkfwZ3++Dssl/2lsr7040LNXx3T/Yp4d7LM3TwsVW0n9KVE
	gua1haWWZQz2WeTJDIVCKwkbK7FrUa2ZFc+5Eb0bDSas2teQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1jww0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:51:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso107100801cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784191890; x=1784796690; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/U0jnkrgqCg3qrLMjPGRj52qmyks8bXXJa5C85L6omU=;
        b=VinydxtqHRJfPdw2cRzjx5JdpLiYmV64xFqmbtGb1oQz4KaZAiWgiJnHNC5Oflalt6
         JXCiHlBfk7OqFVp490GvOnj8eKFHh9gvY95bjttLnHrKbfM1LUiWZXo03aIE9ubcy8yV
         NEWXygOCOY7xsBhwy2auOxxt5OLXzUj0MOzpKe5AuR4ZNob98fUjK/9U723Gif5IGHBh
         khTjW1xDrOaa2BDBPcY/e4R8L7jJ14iLp0gly1VG6huPwdqVZ73kG/8f0Cx4ppo6uVoz
         YpbZsCSjWi4AZm4eSXOtE7QPQp/VXqZO+ehf0imVlokFBjMIsEHVjbg8uVzdgyh6N0bO
         KNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191890; x=1784796690;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/U0jnkrgqCg3qrLMjPGRj52qmyks8bXXJa5C85L6omU=;
        b=oMw1sp87fu0DIb0eZRugO63rPSvcqVgMSYlAEK+C6ct9X4zsdFq1AUDQ4yY1OPo88/
         TrZ9IVNVC9s1Mal6qylWoQdOAdvfZ6G7waExlSZd0zSQosoyncnLYxOTlnS/g7oYtYSf
         iMiVAFKWXRmTBOSk5nRZe6hsMOsL5FMKshaWFBqZnABAd8/j7PNND2aFVB4TvKOBZ2SD
         95fUp5rlFXMKmzeyP0EuM1LZMq57dP6DR338IAqG6gLTl4It9ohRRGkOED6sSGPpL+Vd
         tbtpQMMDPGiLkLeHLxyTXMQ0KSuFpAv5GVCPgEC8biworVSMa4Q/OxBrfmGr412QyUFm
         FY3Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro6DssgpLFCzKy8fCQ+m6xnuYSNdW2HPAJ/TXfXXhe2OMF9avT1mOogHy4+l60d9vyv3/99Ib4701ug@vger.kernel.org
X-Gm-Message-State: AOJu0YyVX3z9Lubl+lTu5z74/pLDXCxftY53tGgGBLVV06CkjXjJA4xB
	v76teJFR7KbyKle2vycEhNOou1ASECfcuqawae6wW8doa5Al2TmDSonKRcJu1rjGc2jz7G5PICe
	5drgGf5O4letTIIfo+qRgTFgTxsaTNgeIfDvb5I/VGgyOHlB3ruSCrWmR4PHEs/V5
X-Gm-Gg: AfdE7clYpHeGF2Xm8ZZ0/E+RluUlUmvMq1uK4iBrA0JwjL5+rzh9FTncYDOwbxwQUUK
	lBv11+lBYZZVr4Nn+e0li4Ct1RFONQtbfwOy3gmxzHz+EPWPulhbombJSun2bvLLDyA+3LilyRX
	/FAwNUEmnqftXhLC7aul4W7qxn4VD11jTtk7bUoL+yC7J7Bw4/RGpjCW1twVt4uy/sTwUnmvnZu
	auwxX42yUGQskldhNqTSrvXhGwgLpALLZG4W+kTf2dMFxKGOPJEJ6/pqhA6wvbGqtNJormxghcZ
	zfGaJOnz37NFaMVoVss8a0t5PvsRK3AR6X3+H/B6cZveVCJbbDMGgy44wbLPpjbssy6Ye0AVb7f
	V4kOU
X-Received: by 2002:a05:622a:306:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-51e424de113mr99656861cf.70.1784191889926;
        Thu, 16 Jul 2026 01:51:29 -0700 (PDT)
X-Received: by 2002:a05:622a:306:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-51e424de113mr99656651cf.70.1784191889412;
        Thu, 16 Jul 2026 01:51:29 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c59c9a2sm87179285e9.0.2026.07.16.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:51:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:51:23 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza: Describe the ADSP GPR node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-dts-qcom-eliza-add-gpr-v2-1-9646c57fa513@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIqbWGoC/4WNQQqDMBREryJZ94uJoqSr3qO4SJOvpqjRfA1tx
 bs32gN0M/DgzczGCL1FYtdkYx6DJevGCOKSMN2psUWwJjITmSizKuNgFoJZuwGwtx8FyhhoJw9
 NVfHC5FJinrNYnjw29nUO3+sf0/p4ol6OtcPoLC3Ov8/nwA/v70ngwEFqjbwUXBpd3BxROq+qj
 +6QxmD1vu9fXQzlgNUAAAA=
X-Change-ID: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CKL7bop5MplYntpIlnBdWPEndjaKm1NNl8MiHAUr8BU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqWJuOJ30Qf9GLE69p7zSwB04BTm+/bGh2Vheet
 ZY3GgfeS0KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalibjgAKCRAbX0TJAJUV
 VrIqEACNuseMnLeo5HWaYH29rV3m3OQl4aqE66z6Mz0HCxzlwcMnO3fFQb0MO5dNLRWD9cW11+o
 7H14OMsXrJ+w5JiDeQ0vq9i5Wz0E/0FB7vhEzC271Mc+zVayos41k2Y2vA3VJ354DbuTFuY2gBT
 q+G110pym6sMDTVvMHRWJR/hsUdjfvC5IEJKhKmVjQtJqzHMbIoENZzmXfB5f2xtmY8BJrDC5T1
 nWyhZn3mKdsrTY2SDFjemD2/vlzWbE41ESs+4c7+KNk4vMxTsRVAjQq4joaaTJR1Pwb/nmlASJu
 pYtGCTKJnALsEeC/jeZq//Eo/hirRSwuLztvNLIAy4okS0fxo3sZrAT1RidWqIBfMLSXlpmCJuL
 xZk4b+mZaMIG1VsroiDn0iEciM0JA9o7HKjkNQj0eL2I5OJC3Bgvpmna1EbSGPPS3mTMzEetxai
 ycjxaA5UST/sI0KU9NXf9W6WwLS+lnOr9Vwo8imqWwOZyQaStzOvN/i0SYERUFYdAcq3VLtlCXg
 vLyluQdhzdTd/bcCV5OvpPTBqf3MDBeaRaP8kah5FElOJLqISHrNnq9hQm1RQY5bx0Bb+flwNhP
 NUSC0BIoDRerQ8vqfgB25nkOhFbCE4INuAJZ/jNKgQcYktCST49yLdV6kN8Zi20//9UsSDMCDWI
 vlgG28hRDxxHH2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfXxfg7/VRRVPnj
 Zk46mV/QUUa+e7NxXM5ArkXCsO5SDDHqgzvMQhhCvVHcOka2h/ZvIV26/D1avp3Qs6wnqIDn0Fo
 gUyj6oSTrW8fy8Bath3OXifZVyCHEJjJtO5FKp1Wd9xNR73i3uJ6HSt8582+CHm8xAnEatL4WMB
 xZ7BZbVKHUXP9USm0AgFE1vrYo/unMwR1rHCcTFWXgQyASB5/qBrVpjF8b+Bzxr9UNkDPS2xJLB
 t8CEDZu4ilQNHiMmblrNn49vGiZAWhvzCPd1IG1PzmZWNAoVVOMRd4gmg/7jukZzYPKTvQFX0jR
 BUTeX9L0bIjPDDeDprLNI87og67sKDt0L+U9FxiUoszL3GSPBloSvCJB1KgklytkJ/Ef+0WvWwL
 iLPQJjsspJfgLnfxfERvhXy61teQx7GsuQ844OJ4+EsBacCJA4JaV/lRw5sBcqidzgPlvMJ8zVt
 PnSdMv4vskvqoSaHPIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX1p/Le4iBPKvb
 Kb0Qo6h7s5hiE8h89zheKKjNBbLw+UiHI3PH3H+GzhhLHrA7ET3+y738Ktpm0YuLUmQyK2kWz2p
 NNRGPJpryNpUi++fQypTvJkalCVmpQ0=
X-Proofpoint-GUID: Y3boqwQfeawHlL8udOLAfsKznzhkhqAQ
X-Proofpoint-ORIG-GUID: Y3boqwQfeawHlL8udOLAfsKznzhkhqAQ
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a589b92 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_mnWyosmxP3KJ6nlELcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160090

Describe the ADSP Generic Packet Router (GPR) devicetree node as
part of audio subsystem on Qualcomm Eliza SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260715.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..fa6a22f2da6a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -2012,6 +2013,46 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
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
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
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
 

---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


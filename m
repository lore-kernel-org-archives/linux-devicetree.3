Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C48642DFEC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907561; cv=none; b=MdXrJiczq9UnWAkVMHWc7u7JymNo4xth1YzujjpRkEOi1sJTnkIXMwH43i/fusiFQ2ezcSY8sLoylUAZhuJ3YnCicP930zTwihQM1HyRWGEcZe61jJwRAjfbgCatNg6vJLa0alqBvI3c8EJOu2j0zhRmC+mz8pd+u5G9KMpRigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907561; c=relaxed/simple;
	bh=5Fpg+lE2dS1+9fTLofM32JUk5LZPQhgZ9xjeo1iWWzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EKIlId7jBcTvJNFy8jIj3TWm7NYtNAAjeOWzZ6+IpVp66LVUENzLO8FBfJqxMJvdr9GXBDmo2uRG1rOY6BD182yjGsgtofXSqpGDDDr4DzmsLcsix/uFu0pgB6YHeMpIiEoOitm8VKNS2b81X8EeoktJKoG0w5MZ+IRUi4ST86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOpA4QjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ0V9bkE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOpA4QjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQ0V9bkE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8VUY673093
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 12:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9oPQJDeRVnr9zhIkIVazOc
	q2QmQHV7BINRDOq1LqIgI=; b=mOpA4QjWdsSSTXcmQ36N6wWsLrnt8THvKtffpo
	ooR2s32ztaYROtbotisB/mO4ztisFmMVPhovZ2nrhCacvBWzuiP1K5LlUd5j2NOj
	Pynkck18yhY3LywJVRVdkoVlFtFR4ZqWWFvZt71Woh2LGRaHl5VMudi4fHuzMzAY
	+D0P4V9iVB+FuI8DUXwqAbXf46w3FLzv6x4U/4jKfZ9PIUpF3w0IGrFkZ4AJcE1C
	ue5tIbbtUKvfumODSAFjNhRzslhhUMs6+Cla4zph4E5G2H4+rr/G305BxJA1GlI+
	k7ndcKOD5Ht+NS09G5ZtPdTYlXAHvQoZUeVslE/XsxqBTTKQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502urpxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 12:05:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so508550e0c.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782907558; x=1783512358; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9oPQJDeRVnr9zhIkIVazOcq2QmQHV7BINRDOq1LqIgI=;
        b=hQ0V9bkEmePvwmutKRpo5uaQalpA3g+pMBDDQLOf/RNqD8aEO51F/0ScAMGeZQOL/5
         Hfp1RBdc1SDIYtdh+9FrsX4WkWe459Wnx70+vnhkAVMsqTcPOY4a9F27KIRciLbnxTPs
         IylCKK3Cb6p6a2O6spSrKnBC96CjFOx9liy9AjQOWqUbFdm4ISed5ERnBsmrobC5dDNZ
         GHJy2J6/aenNKfY4fv2m4+la6xKdVIZxY6TnzQcGnmAMKN9rFtHCfDVLA15VkxloCK1i
         A6nEQnAoegng5XJTBdsKrdWA4FSceRMA09T/m80gUb2REpN3lvMG2evxNrCCTfz3XRhG
         wB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907558; x=1783512358;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9oPQJDeRVnr9zhIkIVazOcq2QmQHV7BINRDOq1LqIgI=;
        b=WfqZCvLZYctKy5l0SiHEwR3MBXM5N+w3VnTo4rPG4RUnmb5juLyumAMcbxV8vpKC/D
         6/nzjh0sPVjQH3liamsdfqktOvt0tLxIjP1vFGbpJJ5x5TnWq3jTNSM4qPH59hCkI6vs
         V1V+4Gkm/S6GB0mIzWeiOeBy2SE9g5G2h7AnQ7U9ElQe6OGT1OjtOeVro5CcPmH6XFZl
         GM+SJvk38gtlVkgTg6wX6mT34VW8PBYmVe3HrPgmisACvkAawu51UAiZuXqLzATNtn0h
         YnCgRGFr5/mzOY7MtViu1XsbNeCUu963buRHCoevmNMmFGTjWp4ozVHIR/hikRhDMJEM
         D74g==
X-Forwarded-Encrypted: i=1; AHgh+RozbbaafunJ8BTzGP7DWrxtYyW6JAApcrJaIPU5HBeHnYMcDHPvS4BnvgUHAAbdMlyXFQK9bEDPM36L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4t2gNRt5Ohx/DmMMeDZNSpgAp6SSEajUCfe3zq4Zg3zRMbe+w
	NZUeGQr/GazJ5Wf1zQuFPhZa+e5U6IqL+Ay80e9WVJpEcpf1prArHljxDo1j7sYAeNm3ZVclqKh
	G1W0tW9uUJd7qUVJJw91Bmdq/VwusDv6Jv8WLYPHyD1PqBfLadb2buWGTXdOxRNrnRTYAU3io
X-Gm-Gg: AfdE7cnRGMZY4aH5gZ3sw1I0FbqmRzCydauKsvXeci4chL5F2YURdU6aSG5QXTyvyEy
	d/TppZRfv+Vz3Q7eFQvMqiw0TTcbAXu6JaJ9IppkdSb14RDpTa7dl0zfpbkGaAE5DH97/dMAvgv
	tBrXoV41638IqnjSNZvommtCqyHXpzNSBNpQV+bzqH0a6VYzXRCk8ZSFTrv0gQQ3Spunv1mzOsE
	MejCU6ouxV5lMH2v9vReYb4fXbbliZRkmE9oELg56UFJYmxyEQdeCiiqLinGcE0vxynmbqbq1EQ
	oLz9STVXE+ImQm034ob/9e8CyfK9Xi/PgTqlWygm0fEf3Zh95++5O94GORp2nTmSQQCc6P9EZp5
	h+ZH/Aq2h28lMVOE=
X-Received: by 2002:a05:6122:16a2:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5bde3a39034mr169131e0c.2.1782907558223;
        Wed, 01 Jul 2026 05:05:58 -0700 (PDT)
X-Received: by 2002:a05:6122:16a2:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5bde3a39034mr169098e0c.2.1782907557598;
        Wed, 01 Jul 2026 05:05:57 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475643ce016sm16768744f8f.16.2026.07.01.05.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:05:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:05:49 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Describe the ADSP GPR node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJwCRWoC/yXMQQ6CMBBA0auQWTtJS4kNXsW4qJ0BhiBgB42Bc
 HerLN/i/w2Uk7DCpdgg8VtUpjHDngqIXRhbRqFsKE15Nt5YpEXxGacH8iBrwECE7Zyw8d5W5Oq
 anYMcz4kb+fzH19thfd17jsvvBvv+Bal6dCh6AAAA
X-Change-ID: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Fpg+lE2dS1+9fTLofM32JUk5LZPQhgZ9xjeo1iWWzY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqRQKeJtJq6yMQF7kJgQl6iEJ2xvj0T25sV0Tr1
 8TiQjQogHyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakUCngAKCRAbX0TJAJUV
 Vn+lD/4n4l9MVZR2FuK/LRwk4bj/zRkKwui0lELH4f7+STZkbLMTXsGnVJn7yl+QgJysWJ7THoH
 dQqYpscxTUaS8q3ZnF+LUs80pcRxM3gZ8yMD3rRQufu/gWbQoPCklGjoTBnzJF4JQ0dempQIRil
 xRmtlkI7HLRbXB0NjedGaaJcsLgIrQHEjH0RCyUGqbQ00nX8ScmAZc+QO00Gsbei3wceHlYRtsA
 wEQDaTD1BVTvT0tmUENovOdJ8L3DDKEdhcnOMMAzrnK+/3VTSNnfQCHrKPI60Uc5GO7lb/PP2IN
 CdeZxdlDOyJV6gZKexni/88HyDEZBkTJ21pvqJpTAbAe31hz3pTD6ajl9ELWkBrKpLAJLcdZTfZ
 cz/DvbMJUh5kc5Gk1vGnl4U6I/GvuicvkY/XDXnxIHRP1BhN5l8D1aqPxePKUo0PDLLD7u70NoH
 8AZraCOtheEOk0u9+eFOTlclk9XC2D9ouqCC4JX9+5pGih0fNZ9jYjiNlLPUO4Xnl5sfAdDPXKS
 BioFwybeQHW8IVpubEW+7Otk51ytOlYJ/agtuXfSN+8nbFcnOplCQMNmGSQAlYCDU/F1N81d3Pm
 DDorzob8vZEMVR8iZZCVFOieOO8ULWttlLEOZWJO0aXRXd3qUexuqihnqIH6+rp2YayQq22bi2F
 Y6NXoVrR7c5fjLg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyNyBTYWx0ZWRfX59cQd+pUZ5KJ
 /DZIP7sN8HniotNlznf/lQWGGmgTAatNYyJ7fNpMx1hLtjd1cuZlpZhEbJS7ETOM8gJ6f0YQ+R5
 oV/evJ5DzvQXx6Xqs7eomQdWmpK/QmM=
X-Proofpoint-GUID: n5im3UFvYM0A4U99T25wlnYCGpijsuze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyNyBTYWx0ZWRfX4OWWkcRIhMoP
 fSayO97gGJb3Ct8WpiTD0V7JjubpyLe18PB7C0XQrwYEhyrnSCFYOxUQSq3CYSoRba94bTLhxRf
 aQjXIFBoFwBSCiI3WwT7e0cZs8B7Tbhy/U3fAUhomSlbQhxwOoxBfbsloDHNZD/gHoQdketwg0W
 HUvUG8YtCLtFzxPUVbU/kE/8rOJkxT5LKTkqv/4oLEhkKK0ThHS5Mx02dou4fFf3WC8LaCXUMwK
 W8va4t3ycUDAIAr+9dod6uuf2Z52QEdze18aiwUCQj4PVt2xcQiQcw87i4wAPCwj9ieIIO9QE6Y
 TzbVCF99z+L/ln400nNfFJtjPmHTn4LAg16NLZ58pG4zydtKCkZn076bGA2WBARahZUNRwcREKb
 0/RrLBfUcJyDip+pOBSyTBG+fSBnWMLLs5uvIIkY2vuzllkNc/HtUfIe0LNThYLsbgfmeGQFlSW
 H4rMrA0T3V1+L4n/2QQ==
X-Proofpoint-ORIG-GUID: n5im3UFvYM0A4U99T25wlnYCGpijsuze
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a4502a6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qrSFy22aXZ2qLtEdJKwA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010127

Describe the ADSP Generic Packet Router (GPR) devicetree node as
part of audio subsystem on Qualcomm Eliza SoC.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e..8dbfd0504598 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -2014,6 +2015,46 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
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
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


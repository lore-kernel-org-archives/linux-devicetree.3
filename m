Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A73BED23
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619886; cv=none; b=X7amcgFc9qlpb2Pz0DKGnFLR1Uok2edy9J53AvFKGCJExo4X8lhst3zy7nQKdSozocHJMI5CRKIGnusnJK60xTarvNR92BzoTdlUzsUdvGJcbYBTjG86Ucu56lk60FAOYWfx16ojqGzIEc1d53Jd1Fjhe4/bCollXysHzIv8xZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619886; c=relaxed/simple;
	bh=fKWRyNcdRFNITSa44qZYedxjTCIbwxk6y6dHw5NYARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3pque7DRbqtTGVbhPSbwDVqkgnZOVaFuApi8k9UCahhpjEroeqmyVWceG0PgBwbzYqA/TkumEdtoYQc1+OTH2dQNpNVJScgCUgI7bjsnUUIfEBD3WM94x+KyT3p/oJCCYAgiF7ySBYuy1s7mAdnqmnai8yNOOxHEVDBmvBFAOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmH0TeKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxyBoZvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmH0TeKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxyBoZvL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1qu583897301
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=; b=RmH0TeKJEF0iQoRt
	1U8U3cEeO4DHOMR21ql5ckL+zMGciUkrgjhnChpsTj4MF+TynmXTlaFu4G1DjFMD
	/Ww/WEWFURw+x0wzmPvHz3fis3f397RTXh21KwVtHJg/IObXL2omy/PmKgmer4Gl
	/aLzaFtZZfQ91XqtPrt+NlL6pkiZ/GUDcEYymVPPbuQkDiJglzP6CjqnV6QJb7Bm
	A+LH6fDSAUWzoJxq8G7ktgB0d095T9hkuNsmI9zy8BZt1J6WPuhhM54sotOV1v8A
	Apd/MptyeCVGEDCSA7PVMwFUI1YNScNrUKjR1pbCGP2akRblk+HKnrtgUFxloPQW
	HSAxQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6atbnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso828273a91.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619883; x=1790224683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=;
        b=AxyBoZvLpBXZmxvkhsz6vKkqaQ6iLDNtJZbusAYYi/5dAqmi2/YOLnHpAROPijpgIh
         iHVkEkWcdvIyV4/mgIP0liusoOEG3BzxCipwtne0SxmiSgcQ/HQWKQKcVb6VSpSElgbo
         vFMAmRUHtZzc89fZzOXXSCA44gAfpwOcaNWcwTwPFY9VfAQd/8CV/md0eXC54/JSyipa
         5bF2jlxqrvHP/lTbxD49IJLHE/m2tiGkfNWG0ozybknCh8VlQPVcEYDf2jLFS1yseI2E
         zOhxyR9+l8MZGGmovvQ2AneUa1aCm/6G/n9Q+VZOjdw0IFviOIYOPolSavTZwFHmu/GC
         p7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619883; x=1790224683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=;
        b=bupyZZySLjDJe+f+Vf1E3/ibpYGiWUd8TNooAAk4fdLeOpCvtrbDKKgeH2IrYw1Exo
         L+G/9aicq1FDlskZZ5S2jt1tJbYlgTKkA9aVEJ1SU+0R5MjWPvdtwNUx1SQ/1WmatmA5
         EChXQbdDm8sNMbE5ccZFjmuzVN4zSATNRqEt9/OWv922Kg/xBqsJL7kAshk0QwNd95iJ
         JoAPRcvzGm5qZAvny8pbuKkDGM80qsO0pA12tHg3idTFab/vnsdZYD2A9DWBLt+nV64n
         L5ovwnfVPMtdP8MkaXZh7lZPAJNwcYFghIq6kaxjZHxP6uv/zjzgW9vSa4tykqfkbb4G
         zhkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjai6sDUVjvOQE3IknJ93PfW5u5jYqxhHvdxOHBsKLHc3/Yg66TcsrZMEkNjg9WdpxMkwnM1z4tnIm@vger.kernel.org
X-Gm-Message-State: AFuF++k4L8y19vNJpbPt8IkBH4LL9rI8dDpHgxgHUgwlvI8ykzcMV+jT
	1p74S1ll2F5QkER3yoxmokWVDjndWmK8vWQBiyDld1slb87vy2eoe031O85HVP7NsSYfQWansfa
	idOYVkjBldXUGo+1DN00mGNy0ZBqSEaRzPVNfjxHY/nfjXP9aPX4GfQYIB5Bo+Oqo
X-Gm-Gg: AYBFou0hBsn2Iwj3hBdhnsO6CoTEpwy6Un33HIgkIX6pw9oCDisxfN3m0ulVzX6NGkr
	jULBSlU1SJ23OXVY8tknBqNbKxrPO7Upraj438dY9WtWEFT9nN4dj5aFzDspqgZomeTVNrwSvn4
	JJiJNA+tNWKjUDB2mk9S7WOh7Dmp+km3xSt9FXaVEnYvCNHgOskSLK64bcrHeWrsVWjp2s+rH6u
	1prbHy+kcD5hhpn7ZdzaAd7MlH9t3UBuSb5/FJNwoGvb9OzUjNOWTm40x0cYXO0O5XHZKr/pOiV
	suKaTfXTI86PzB/6Gl5lN9elAuO9ejioydwpelfKuncedZLT5aEdOhuB2GczHYehGWRrU0au3UX
	fVB7lY6/+yXnBhI7mgKJZFvRlxojFKGuOC+kU
X-Received: by 2002:a17:90a:c105:b0:39e:27e:2f09 with SMTP id 98e67ed59e1d1-39e1e284ff2mr12769803a91.8.1789619883132;
        Wed, 16 Sep 2026 21:38:03 -0700 (PDT)
X-Received: by 2002:a17:90a:c105:b0:39e:27e:2f09 with SMTP id 98e67ed59e1d1-39e1e284ff2mr12769751a91.8.1789619882684;
        Wed, 16 Sep 2026 21:38:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:31 +0530
Subject: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=2379;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=fKWRyNcdRFNITSa44qZYedxjTCIbwxk6y6dHw5NYARA=;
 b=YxQWUHIo4h1Ru4RQSNZvHCSd0YTFU+F1PsqGLRnLkyNkdS3RzVJ8wh4/+Gw3XTPlbD3MfO4zB
 iNxleRF8mRFCZ9OeguyT3qUaDVI1xM2HBw8hnFQbhi7DJu/m0Y+GJls
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: GZvOZrxxQExksOwuFWldYalpI6BZ_SLa
X-Proofpoint-ORIG-GUID: GZvOZrxxQExksOwuFWldYalpI6BZ_SLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXxFqEihiYI1Z7
 Wo8Y+gGMTM9QUii2p4rIepuzRFPlft1cTEk1cvI8eSG25NtWRk6DHvc6sGxw76JmpwKGcp3vKCK
 jV2zZOWIEsb8I0SMCIS8oIhRPIZ4JHFVUW5zH/I3P3uHTyYzofnV2pwEGp+eHnAmE6txIpQ+e+k
 40oZkpxSxOyZ8Y0G+IMJL7Tnm8WIEGDbANlEvOG+1Fy0SJybEycanfCTjHlW/uC6UTyQlnKK8M3
 ghFCGYygUhGPp/JZpNJbzlDGn+ikQw2g8QEBYOp8EfqBa4IBOxYL9GLSDfgl9yQR7tvK3Z9YP0s
 KDh8si31gEku+emTOqhvKMEhE/2j4aspz1pHK6aX6CbOWWDv5lAROjTTJ+99QCYK6cGDACCNUOY
 2O12zuCLS0X1qy//Wmd/PlWMJPOFV+i9CCugjKRwVHTSxsal/1YtfsvzysT8qtI5UKgY05jlaLN
 pHW74SAToy61H1shwKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXzJlIiBVVAy9w
 Msh5vR+PBK6JvAWtNER5AMv8OuyEQ+dYboDMBeIKMJvQ53SUfFlUQF2kfVVTFXB1GZhVmQ9i43t
 Z/jDvlabBY49K1Nk6i5NvW7csAKCG00=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab6eac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SNQ4sQprfOKLKwPE6BEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 999b478e1640..7633d274e090 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3595,6 +3596,40 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>;
+			clock-names = "lpass_config",
+				      "lpass_core_axim",
+				      "aud_dma",
+				      "aud_dma_mem",
+				      "bus",
+				      "aif_if0_ibit",
+				      "aif_if1_ibit",
+				      "aif_if2_ibit",
+				      "aif_if3_ibit";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;

-- 
2.34.1


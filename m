Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA3834752B
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396399; cv=none; b=F5U2+bZgo2HLsshHKlY0Kf5Iw6iUFQCGMbA1IZ00C5V/8X9YrjLVAY3lNw3Q1KnKcdWI7Vx1AHycSpHcA0Fmxz5loavSdLnh+ls3qy0t7FmJ0lNaDMCoqG4wArNln7d2cCoCngDjmD1HPaGDd3O3DVcJFOvpiqJLohRmz5sQMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396399; c=relaxed/simple;
	bh=w0w65oHRmYdyIowUrjyBwLBpwY/P7+ACD/L5gk12A44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2JMQHguEuya8eH1q02AWE6lGAcJ65VyHI4T3jKQXOdbcbksOYAgtPA3ICbXSppCnwepyPloPKyKCPud0mYPfhnxOYkEYGzIHU9v92wpMtoDG2rhpbWK4F/tnDRBZNWjdQUMR9/pDkd92SURkPxW5os6T/3r1bYn3vHzh+zqcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahwaaht/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjZsvnp6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahwaaht/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjZsvnp6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6359DB7N2206937
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 13:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adjkt5c8UdlOtfXptpxeUtjlXcYJQ0my0zFaNI8b+Iw=; b=ahwaaht/dJDFXpUN
	fUTEy/W7Stof7idzW/YNpV3V1XbzDIA1XnbacF/rN6ltIjueUuMha+3oTm9lhhY5
	gsEYHWRGUpW+LhE38lmxdqwpsKrm4e/ExUCnQn1GnWV8qb/+vJBW75m3Jctu/7c9
	GY3dFj3dzKhV+m8+PlKJKNIsENZGL831rvWHZy2FRjGubVQHrSNvBNI3FAQ7nQ6g
	OwCYCzQbzka0twK5Xyl8YVfkcIUbPgW2rlXDnL1CSiIERa25PaCQeDRFoC6LsP8E
	8ERUN90LeEnZv/igWsfuVhLne4ZOH5v0kJJIvuJ/6P7uYCbtRx76hLDrwlBKqy1C
	5c0BEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauthaf2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 13:39:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b44f7b7bbso101678171cf.3
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396396; x=1776001196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adjkt5c8UdlOtfXptpxeUtjlXcYJQ0my0zFaNI8b+Iw=;
        b=TjZsvnp6uIF8chGiKO7LuwqG47QjJYmUkCEvqZDDM90U0ppJWfXj2zSK1bhFYvX6G9
         qx0R2ZWxm1G9Pxfeaw8zVnir+A+ruNEVoF5STHD7kH5ZF8llCobIL9fkvgoaGyuxaxOi
         S4UHPoq5ElGlyWLaqNIKgQjeUO9rZ7nhcBM/ii9PUMt0m7oQBQGYArnngVVFbvOitvgp
         8uO9XuO5RMTWf5amefAKFjuC06ogAaKBK0CU6rRzdgf4Gp1/oI+4CQjHifogXJneZGJz
         9VxdBN9MkBPfF9FlDM/BNdxBDcLO7XUy4ycYvCQGMc1Htz90Ahc8OxLLFSPrw9s/ze0v
         HxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396396; x=1776001196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adjkt5c8UdlOtfXptpxeUtjlXcYJQ0my0zFaNI8b+Iw=;
        b=Od+O2lbvAJvDvyz7Awo3nIrdiQiaohSBhOGmBQIeFqt60D0Q54HAV/H0Qp0/rBBt47
         UUtJhFvbc7vJq0sumN3ucqpGNcQzqiort8CDR6N9+b2S/PIDVoGtGe6s5+1JX8qELfR4
         oxyzliXO6D5hFz3IiR6FHtA6SBr3iEv0Y/gAEc3U58Fh7xqPPGgUbjTFIP82b5VAdJ7M
         uaQAZ3gIrBZsL0T2D627CJjppoHUJEkeBAHZem+UgStpfZhQlINEIU0lzNNAm2+TEsjm
         eAGxBcAddWFgRyAtg/2N6iuF//LkUtNOsLISyVpRZ4GreOkS2wz9HPBj2WcmeaB3ZImc
         qjmA==
X-Forwarded-Encrypted: i=1; AJvYcCVbzW2sVe5sjTg0fWTURU+Csi4zrL3auBFL+BGtA1gLsYGqblWH9BI8W3U/qmCQH5DtlWI2NFXPT1Y0@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkohThmSGqCjjQb5YCsAjibX3YU5cICvNYm4ok4WsBh1ovyPw
	6s8oOQXDECVgBeSbAfixg2xAxV8WWyqbrHjrIkDw+WiBhElrzxVy5WOXL348dRsT8iu6F6hlPqN
	kKZounQWGUo9PFZ97v3uWo3ult93gXDtpuVaXAEkxxELM0Ek81uz/qcS9BYBX0TTY
X-Gm-Gg: AeBDietsQqh4lZsB/ClioNpNOcDHPgJoS3SZPeDLc5uVVfyKjlC6bJvYF7wMOHtwRy6
	HhzKkRRVvIbYuGa+TUvDwMcjSHYHHJm971N+o2x4g4xVyM7qYvAyf0EoubthcRygdbRog00dOuh
	EApxaXzm1ZbhHE8p53ishME4V2MJ26d2AEWxjNoivzCqUjbQUI6G2mOaFqo3S9tO0Qmn3w4s0W7
	hUI8xjWBhzM4MJQ3CUX05u1ERCartISdqh+FGtjWiA/kSPgwpbjuODpnxWjwzBEqwzRNwQL1VdD
	Gscq/HtDuqAmz1FcfwyAo7mp6+px9+gtbJXMyXHA7LH01ZCF+zoI9qE1X8NB9hQRVOvgZA0wBKt
	UUP1T+2zUzGyW7HaRjza5mI1c6P1DlbXFk7jGxWdpXCyo
X-Received: by 2002:a05:622a:aa42:20b0:50b:2900:6644 with SMTP id d75a77b69052e-50d62adcb5fmr111075901cf.51.1775396396585;
        Sun, 05 Apr 2026 06:39:56 -0700 (PDT)
X-Received: by 2002:a05:622a:aa42:20b0:50b:2900:6644 with SMTP id d75a77b69052e-50d62adcb5fmr111075541cf.51.1775396396114;
        Sun, 05 Apr 2026 06:39:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:29 +0200
Subject: [PATCH v2 2/5] arm64: dts: qcom: glymur: Fix cache and SRAM
 simple_bus_reg warnings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-2-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w0w65oHRmYdyIowUrjyBwLBpwY/P7+ACD/L5gk12A44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYfvtjtbnUZ35lcckwJq3Rid/bqCX4/R65IA
 5078xAaYYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmHwAKCRDBN2bmhouD
 1w8YD/4/UDc8WlLMAZ0OxRjAYxzkl9l1Y128P52ma+y9ftwFHzSpwxsdtu0gFA6HpC6R2hM/QMp
 6NB0OoZd6PM/AZFMh1vGMkfj8YSq7qxC6EQbdJjLIbJWV+xeRblLb3pfelPysjFKpyWa287KdaO
 KwZUH8fYa3IuD1ePEZ71INz5cZWfTQfbYYaFJZzqn1boPgi7U4kurcnr/voS4XdgaRPcUW1UDjT
 4f8YW6pjcu2VGqPhGOLnEUB8TJDE9HH67i6Jvp7fSlkm00m7wuzAzzTg0/EOG8dKQxP9pnzscmC
 5FNWFH7FrUt4KMT9FxoepAWj5L5sfYgUy5QZDpcKyGYPzLbzSqQpvyLElBq+2cQ/+oJ3l9xS/uw
 h1A8fdiuGq2QTFC/Eztwyw/Zg8W5mk7G74QD+KDexLZKfPXjF5BPnjE2nSiHTuw+PKBqwdn1pTr
 X8dkmAaBl8PoOZC7DRYeQM9+PIvFHe2I8mj8DgIEsjP2xWzJqq3T7vumobkUZR4x6vPtelf5ztU
 vY8XK6/7Y/B6oD1RktJKZgvJ1flgsD5TEyv25jdUcIyZx4KPye04AsyxynvhVf9u5JXpTdqYlQI
 WCyScvm3tdzUrDenSe43v6nG+4eaDRVy58MTkPUXJYl/i68CgzP9KNgRGNG/Cm5ZNQNUR+jx2tR
 6PzW1mJzQwbRgFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX4Yy/QfKFOEIV
 jyiblVCbbzMK3LxIvKYhdoJJjl9p5w/Tq32JB8Fttf99paEdP8Jw0NlTQZUAOO0dqs8xo3131tX
 M7MqhtED6dwlOKbC5+E5Ut6fIq00M1PjkcEGqBf8JaGVPtwL+bfssL6nyJetwRqXrU7MIM/nOUf
 gsbYPmd9sUbGAHeuVaeJkK8JivPszUPZVfEPLESj9FURWd5pBtIRtsHz1Yo+e+cN6AjuEuHXSIn
 c+evUStrETT/20q/fN1iJkDZqh2DPmxz9l9u3Kymh0yrb2JfzocRsiZyedx3UoM3ynpFLSatRYz
 iWdEOlKs3Hh5FV7eaI7/0ZU2P64MsABA1bfzoJpGX8PUwHqpW6OLWeBO1iDINKQJ/eJ+wHALab0
 Evn+AfMLVKnzuq4klpgu3pSn25LrEDK2t8Lu34qteRcHBso/+KyvwqMm3l2AOTz9Z34dl5lk6jZ
 OEnbdJ4Xhu1w7T9V6Lw==
X-Proofpoint-GUID: 1oBFiufZbS4CUWPoJYZCbdEGcZ3kFAIf
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d2662d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=whlQpUbcimcIkjChax8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1oBFiufZbS4CUWPoJYZCbdEGcZ3kFAIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050140

Correct the unit address of cache controller and SRAM nodes in Qualcomm
Glymur SoC DTSI to fix W=1 DTC warnings:

  glymur.dtsi:5876.36-5908.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
  glymur.dtsi:5917.23-5934.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 3389103408b6..0c5cb8532b20 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5873,7 +5873,7 @@ oobm_ss_noc: interconnect@1f300000 {
 			#interconnect-cells = <2>;
 		};
 
-		system-cache-controller@20400000 {
+		system-cache-controller@21800000 {
 			compatible = "qcom,glymur-llcc";
 			reg = <0x0 0x21800000 0x0 0x100000>,
 			      <0x0 0x21a00000 0x0 0x100000>,
@@ -5914,7 +5914,7 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
-		imem: sram@81e08000 {
+		imem: sram@81e08600 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;
 

-- 
2.51.0


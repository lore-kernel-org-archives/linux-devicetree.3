Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876539150E
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827960; cv=none; b=OdT/5vpIonI0SZOY66lzYmIzjBXaCDBAzz6abRrJWKOQTOP8FfHCvUJVGIW4mFwMjSou5tTjle0JUov+7Vq19oQwVImm4rJL8mOSyA1SfpXtMBj1uLq8QYjQ8/WAWNtwX9TpHcfImtai2AxyG/239SV3tY7pBmk8nmW2ng+LKj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827960; c=relaxed/simple;
	bh=F1SX8R+lhqOi4ano2ky1Vc5NEivSYmzF+8Wowzs3a10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lyJYl6NA/wBumsWVlCMicyrm2c6sTsrX5clXoBsW2S/cE9WPn59nYj0eedY6npCmJiBzGeQvC8DsYX6/mT4aToEtajdM5686rdIhkGrZX8hYd2Vl8VQ3bj662FchWmDoR9fEhBwv9s5oHWnbzcg5VMe+CUBj84ubBt/RjEqZ9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjREpiKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qxz96L4v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjREpiKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qxz96L4v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NG5BSw482906
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRzaEhhzfTHRPy/h0ZMbtNc+EC6pBkLN2AOePT3qqlg=; b=QjREpiKPTEkM9Mwa
	M7Ll6TzW3TzrN80TQ18y4sokuPHjL+PAJCRGlk1Xn27cckyasSLmP1PCkpAB+m0S
	tuHq61CdUKpNPl8FpF13l6QtHIDfO6xOvTjHYMVB/VqlIbmDQcZr0r/toBKeccIy
	8XthwMb6aFRg6DnzYwouY8mnJf30HhlpzSQWii1kOoIDZ8p5HISbTg5p61k5oWqz
	eZJiwXomqh5Q9wTZe+rzwa8rd+GgEQ8lygiOx0aXBgUO6cICp611hdRq52Xvsc/+
	7MI7WRSjSbpZqj0tVzijoiQlH72jNNwW9gqKTBFnnKkcAbL9OYEW7mXhYQzStEYV
	gAp2Yg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vgdgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:32:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so1237105a12.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784827957; x=1785432757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRzaEhhzfTHRPy/h0ZMbtNc+EC6pBkLN2AOePT3qqlg=;
        b=Qxz96L4v820fIV5LZG+fWACn/sfms1JDJYDQxIkYPvf1gB6TIZYJV3WCzaMeCm/j/E
         na/Q8OJT0hCXM1CUZJZ3AxUI0doGGmhGM5DHlX4rAlhyKpWoBiLjwhQzSoDnrBGODx3x
         H33iJ9T57X90X/nFuWBSq73M2sw/Wb/41Rf8fI3/zJzRf7uw6pLE6fWn8SYu9fg8o+Ay
         iViLYf/09hPJp8vIhbbfuT7nwC4Y2nBDvl64cqNGi0COgnXTFhnMXxaTz1VF0GcVv9OO
         E3uKUD8PmXvlQmaq/DGM5Zf+gE9ip7856+NVKqu6rz4IOgKQxNTmJLCcRs+aCtpoUI7F
         vKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827957; x=1785432757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRzaEhhzfTHRPy/h0ZMbtNc+EC6pBkLN2AOePT3qqlg=;
        b=BN3eQGrSO5qDRw+/YirXoUmNntykArUWS6FJdro+gFVjl9fRW9uK14WMBTbxsSxc1l
         Mt2pniXwXuPrxXD5KGQm07/pSbPTi3JTQwBnL1wCcQj2/i/EJQJsLJHcPxLDr+Tbk2eF
         t31aZR2h36Zfuzkdx3M/OJCJftkFrHxbU7k8fVzT+l5MU8pWMfkzxdNWNT0I1gyAaWcD
         p/o8oDQCVtnBiWXLr4aZ3nR1w0BrsnHE+eNO3pPJKeiDITIOvM/kubQH5lPpa8irANJu
         vF3mE/cpsWINGmhP9r0S/rwMk13CZlPeNWtJ6E2eIWwlkSQedlAZn1gTwEAo8c3/ZK5P
         fBzw==
X-Forwarded-Encrypted: i=1; AHgh+RqS9q4jV+Foo/J8P8xAtGmukQ1zgazmijFqVAncmIzv4bR5ptIZa8Y5pzaQEjZm2YfaH60aNEt5LJKf@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLUe1AP2ir5fZw3amIQMzF2jiPwsPpBsfepid6/Vh6B11Pilj
	3N0RV90WUu1WKKr0wtBGtE613guvMmXWL+/Gey+RTgVbpULlqIsquKUKEc5oBpCIr0QDAV5WxJL
	ubClcjr2ltlfFcbvasG/eE08iwCK1n2k9KUbxBY7ZnrKhFsj06PXXsYTBaWup7xzYHXPRJsLv
X-Gm-Gg: AR+sD13faNSIPnsg6MkF2/fNZFhZndAhVclR/cFjvGOtnp/5vqBL54/u0vV0P58OWAc
	CoPlrCVU1l5wCfFMScl8nBGRoekFIsQIVhSMyXMKjFCmb/eGG3lVeIJkbe/A1ZewiFQiY/uCY40
	LQg+Xpe1WN84kV4UkvdeIot8FR5x5cn7RwbZW50WGlXEGJuZn2mtRG8ExYBKiJ05e6Dt2q4aDKE
	ACkHcIHFb0qZPBfVYMRE39bnbKrlx5Eu93ZEWtm76A4Lf1GxMQ5q9LROshwJjFySlPalqLj93Xx
	ZjTgK/ZROaFqDxthm0l6kh8VgTtCfiR74LGTABiqoE5NhNzERBBFml1iAFt2SFnrGSMV4Qg+A7L
	gNNPOrPrL5W2bocLpJKiGST0cTlOSej45GpCFTVAnwllMTWxmK8HANIK5MQ4wr7J26CNwUA==
X-Received: by 2002:a05:6a21:6e84:b0:3bf:b60b:da95 with SMTP id adf61e73a8af0-3c44b21176cmr4500024637.60.1784827956792;
        Thu, 23 Jul 2026 10:32:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e84:b0:3bf:b60b:da95 with SMTP id adf61e73a8af0-3c44b21176cmr4499993637.60.1784827956356;
        Thu, 23 Jul 2026 10:32:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm26466497eec.30.2026.07.23.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:32:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 23:02:25 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Fix properties of usb_hs
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
In-Reply-To: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784827948; l=1339;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=F1SX8R+lhqOi4ano2ky1Vc5NEivSYmzF+8Wowzs3a10=;
 b=taUTuvkAHPdWWsNganRk6mmxkpDoT49O6jaSJFmG9bLzG/LeKJDlHqAtlGvBy7WWUeCQ2YM/b
 flDEC+Q7b9yDPCznrgjvUuZMVjXyxiWzDY3mKkEUawt6v4zz9nPn3tz
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX6tLl+ySayjZw
 rsNORg8UOHKH1eUPxtuEUp2vegFCJdmXiyOGz9QhfTXMlUIuhcO2SnkgRL7GLhUBw9hjuNioF6W
 jac5rXzVchsidX3hsNndw2OABgnwsuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfXyjwp1pWhWegZ
 +xDXg0aYkh5turugRaVxDmxJ3xnJV8x6WJIrVIKv1dSwcaQNTcJmoVxIvQES1sck9IILqPMiekT
 jJgTjuQLTN9hrfK4UqunOy+Fuj0bL6sb2Ymq3+2l1Xfg/b8tva4Ln0WlF2hz3x6g5FjsGMs6fSS
 zp6HeDve069j82EEua85Od7S+9bl+z103HpyMXI7nOrBtG0B2Wvr93IbWHB3qNxXYFGPsoWoJbt
 RcDDwKydb9vHn0r7OmNnissELxeTGiL1Z8fNcfV/9jxFe0g8tiJG1OCndBfc1pS2sS6MRXfxSDw
 iiX+u57qXHKcsNGZzszHYZPIrkRcBuWiDmh/H9050IkhRDSxq/NfmzsD5UVPqGvkL0Ti9nuJvle
 AYGLSSb1jbyVZ2zwisUJCFok/NKZTZQf3IloBKvDAc7U+LiRnGdL0Jc3i81UJ6BSLaUIPZVLZAS
 WmUMcVcSQXq2vWUEKmg==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a625036 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pM9bnS0DWLlDKGFgAYsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 6c7gYZV4JfJYdfPOcmpp3bOnkXshYRNb
X-Proofpoint-ORIG-GUID: 6c7gYZV4JfJYdfPOcmpp3bOnkXshYRNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230170

The High-speed only controller is DRD capable. Hence move the dr_mode
property to platform DTS and mark the controller as role switch capable.

While at it, since its high-speed only controller, disable pipe clock
requirement.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index c12808abbfe1..7731b29857bb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -1204,6 +1204,8 @@ &usb_1_qmpphy_out {
 };
 
 &usb_hs {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..b9eb0fe8e413 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4794,10 +4794,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
-			dr_mode = "host";
-
 			maximum-speed = "high-speed";
 
+			qcom,select-utmi-as-pipe-clk;
+			usb-role-switch;
+
 			status = "disabled";
 		};
 

-- 
2.34.1


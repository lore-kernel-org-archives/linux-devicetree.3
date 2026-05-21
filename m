Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FE23DD854
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368851; cv=none; b=P3VwQeJkPc+/JdW/ekAIeVLFed/fS+YSSbX5B7kcDqaHs46xDXHOABW+o3ziEpT7e8Oorm76QUQcX6X0A/KqNb2CT/F0POto+7vIRV5/cexWf5aG/QIq+8Vj1pR10iufg3wT5i8XkROX/6AswlWZpb1IfLeMNyBvMiy2dhcEN8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368851; c=relaxed/simple;
	bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RX8Sh4WMC6aQLmRlyvb3PA8uGSowdEU6/pTHEHGGAZLFbACZN9H1BCPxTeJlzB/zccxmUKH78/1/nthcqhNW5nWqBGiwqNIICeVvbXOvpq++H+Nrp27iQYYK8XNqgq00eIqzi1sfhNcIBYQ8KITMkxqDV2jlPnMOP2/1Rl1fZWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmZNOY5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP46BMX7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmZNOY5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP46BMX7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99u8E3772801
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=; b=kmZNOY5GrQ9sE2fo
	mrCCREz/lkZX+YSiZpC+MiCb4Pk4fWmVLkgfB2E2tVxyg8EbP73gVnUhN668h/O3
	trkOaMfxmS67BASvSjiNuWzb942FjahO99hlXDAm1fmbu1zypocJjBxC8NAZLKXE
	gGvINTNU/3hPDofynlg8X7W9wUeFAkxQcFM5fpj7xjCdmlm7uyfkH0FdCqtwdXeM
	LEIuZYSTSjdc4vNRt6bojh4DevixWnO2DS116ppd2Okfy3TC9Uv5TdVAL13JgeQs
	gL6deMC2sIaOxzBcygWHLejBdPqZgaF0sztoSuicvZlIlECtII/BKs4pxrW6xVeb
	1BhpIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43ah2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so4777959a91.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368849; x=1779973649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=QP46BMX7jkbrfps/ga+7qz6Cxab3J6r+lHhTAKX6HLOJpW0XDw+xKRAauot54D5AWx
         W0OIEVnMyVKeHh22VJLrhDyRbSvqFtWT8fl0SGVY+2VASjOKZDTUOvWM7jHDhsRJPATB
         4ae+1aXB7jsjUQQZ3wxMYRY/TQSaYXpy4PR73M8Hh/LHZHLkGt16KntrzLV0jHsFYnvj
         WdV2yryqkLb88ZV+Uax2eVF0dE+Y1z1v5Y18VtbYyIWiqk2lQFPeskATnPMmJhDyGhWL
         7PRUKtxkIrKP58meGT/S0BPWxnMOwaSsjWzje9GUonWKOBWYR0lJ0Tf5k8aoDL2NjMZ3
         6aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368849; x=1779973649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=CyUI8kIX/SdI1gpQSZvBjRTqM9pU5Q7ACdNBra6iW9xO98xKESaWKKi8j1cm+gBdgi
         /iIwD+mPEf1sTrapRrvauBA8cCGvJ+iu9igoVWpMME0YkO2oRxGq92AjduY8tc/XPlS8
         P+UYaNTr+BFDhE8zVQI5SRiXGSeePX3QkgAS6Z7VNZYuIEXZa+S1x/GZUQd5MxJ4HTHs
         w4LJxZhPHFNavAxCPH6Ty3/aACwu6KqftnsJ9QrbCjoRLUcQgBnKlN8UUpcSp2pFqlCx
         HWNnM6QOzpV8FMS7+Rw8J5CS2Zz/d4j+r2qH2T4/E1LVyK/cMZLZ7xhFxcATiNvFOkCY
         9P1A==
X-Forwarded-Encrypted: i=1; AFNElJ8Z9kSMsPnFGLUGv0gG7ih+Jj/wrAIBI+7EFKMH63LY5DhwqE8HfUJ1XXxynbXouK+rRH+9+10o0/qL@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQlj8meTUkcHz+NG+EKcmO7mRBXTSqXfrs5s4cygL1KRER1r1
	9PI78aU1fZQUfqCEVBmfZmh+ywANF+rTqSpTV/6jCqOCSabr9Xvb7ce4P+ix2C8sh2k1gdd6CnC
	Qh6lDs6FFd4p0n/o9qcSKumLeoR7aESUKEpUoCfq7KB0xMV6aejXBowdN4hIQzN1+h/HqqRZz
X-Gm-Gg: Acq92OGj/2mOQMWsWfThODjcMI7+Tw4SFX/t3Y/LmjdIFs2pjTkk7kRUNsG2ARdLjif
	ZyLVXptpslU9HEhTEoJTX6NoIkDGKoh6O6De83qHmoTe7aOcJAd1qVa/t8RvUpYZT/5Af77B+IP
	erE/bqh/jtXhSy+RYTpAs7scncL7Q5KJkRwB4LOlAUW58xDoT2GA1Dss8xSuATfBZa9f6T2b/Ru
	nnOEoNTL3VbDizRyl+qgLQ7At8fvza3utaM2PelBZyqkb1Jo4q25bSBG2KIblydME3Ayr/CBYV0
	choXxbADopdiQ3LMEYsXRRP0WrqGM3o0k2TJ6P/tbYXkf133s/luJGeUCa25tlrRqh/qbo9bE0b
	RjRZG/52cQqr0R1BSO4e60XeI4zmRPbeTwubv7rES8G1C8R8UFj4GLo+7
X-Received: by 2002:a05:6a21:ec07:10b0:3b2:86e8:a817 with SMTP id adf61e73a8af0-3b30878faa7mr2425201637.31.1779368849364;
        Thu, 21 May 2026 06:07:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:ec07:10b0:3b2:86e8:a817 with SMTP id adf61e73a8af0-3b30878faa7mr2425166637.31.1779368848889;
        Thu, 21 May 2026 06:07:28 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:41 +0530
Subject: [PATCH 08/18] arm64: dts: qcom: sm8450: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-8-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
 b=cZyX19qierI9e10Tx/4oErjC+UlxF2/8cf0vyC+QWA8KyJKI8xSKVVKUGtz/L1Lh1dUy5VpS0
 yS0AT2OV/N4AdLtZSNPvaIuGFwXYESw+73065DHsi5NSIqGYosOY74k
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0f0392 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ieIP9DbouVsFW0wwxpypNjUjqXEC31QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX5bVKa0Qk3QBb
 wNaLW0JgXuDj2Qun3PChRFqjjn5+/RSkHaBEEityFWWJbyODUhhewIyOrNMpV1YWB4nuh2vPfx9
 dmepYbUjok+HFsvIWhsHC/NRuJeWoI4jw5QsJO15buim6M7PWhjeDAVt/JFcjceAmtlRD5J7sa/
 uwGxhqzfezJqPuCN/YnQfugv3f8f5GT7memQorPaYSO8GfBCkLJ7+SDFt50URWnzEjpDrb5gnWp
 E+6UOddlle05PvJCIWRnuOjoXZvG/LxQQvGt7L6dB4y1pvT9Uhf8BFVhdlCXDVVwmJ6avo60TcB
 ggmVj0NAyJAJ7EmX8xpqvSK5kROi6K8UcmiNUZYjUDMWBU7HaIF5sEJw4wgtZqYrjRpgoSfG4uv
 6GUIh5a1Rja75ZJkJj/+ewHGxn6g7iiDnsEFPwAqzfMv7b+NVWZuowpM+LffQNT99mwuHALFQcj
 8QRJUhPql+RTCOGeaNA==
X-Proofpoint-ORIG-GUID: ieIP9DbouVsFW0wwxpypNjUjqXEC31QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..acb36aaaf20b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2035,7 +2035,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2200,7 +2200,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


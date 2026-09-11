Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F1363C46
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109451; cv=none; b=Mlic8qW0GA4tXeJA/W2vw2NSCNH2vYkzXaTbGdKfyQZO6qzT4kin89Zj8pW8jRRjHoOh9HDWhEJG7RH99Ify338hazaVj9tRz9lHsgTsFY8ilnsMnj8JMt3HglZLnvDspSaZ4n8EHd46BUKajfuLoM1ZfdIDdJHEqI4BTIF1K08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109451; c=relaxed/simple;
	bh=9H5g3Swcwg3dlkgYOPFBquTx6iyt1DX+wBg5cLvnukQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ia/9A2O1duAtjCDe0kHDu8wih4G9c5ZOPnOVqzrw5pwB4VJ5W6t6g6kpE6DDk8LNKyCSwyxsADs7Kh1nvV1z60ZWTun2EH7SRljtWIbpHAxfBI8Gr6o16RmVp7tmyL6udIZ6X+wIbEPL/caMBsXPDpDrEozzzGQzgJMZ/z4extE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2UwpS9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISm8f/5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2UwpS9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISm8f/5O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kYnd3551623
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=; b=V2UwpS9DhJLx/3WR
	W/Sb5SWrQGA3SM3CutT2TqE8zisz9lUxhp2jlOaVmnuGy0rGuNEBvIB9ZpLkcWKO
	ch22tc2EJEcd1AbDDta8efr1iXw9RXncVhp7CXI9WQo3CvXyBAeJ9T5GAdX+IZis
	GwEnVjzK4qgdyw6AWxflcefM6yHS1Zo6GoaW91Xxs8ilyPnkGZefRnIUbsiAlkh/
	m5jLODXwC2VOF/tsY+hkbC6MnbOcRxKEebIIvFbbmltw/oY7CyjwHkaWiNb5mRmx
	zD1QTuKEtQsQ6mrHhQbmK7QydoWiSo81nMUtjwrMDxC0Cv3ux9J+dz7ltXbKpym8
	jie/bw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0gb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso1130959a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109430; x=1789714230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=;
        b=ISm8f/5Oiop7yBr9JwZHkac8jOREXW+SPGoafBrdcaqrcONq3jSsDVjncSMd+euMEO
         QZFqpcyudragQIpVA/XtPthRexEtedVJMrDnzCZSHsuoVWAjd4aHJ0fKCjvJof2iF1nF
         Xr0ftYVemvQHvw04Oa7a847ks7lTGS+wW+jXztvt8W2vsdIdYVAuhhNCzoXINCKLVyNH
         q7V1s58kQL2qQMFe5RefWeaqDLwIPikhSaNnuFM3QotoRv/xoyYHcaWKI/MRfZAGaD48
         Is/tFT94AaG9VR0Uxu04+rhqeSa1yUts4pW/A7ZsqqMsp6yPJ5rTDexUTtV7c6LjaTL3
         W9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109430; x=1789714230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=;
        b=MXoDLaMiNWviFhunReCPqSRxv0/gH4pfeeIJyXfLPSlDKjARtZYuPYhBzQNXxnI2eY
         S9nZvn6+RZ5hrBnGg4tMIjgttXJlAitXqC9pNAX51eOmileiGyxuCqPShZV7libGItDo
         0Q6Gfy7b5A3g8YCWmr2N+aH+2c16H3AT2l+G2UK15dY5rSn2T+lfmUknJNFRW+x2eUB/
         gSCOZzDA/ucaaCCKGDFCg8hPPJ18B1xyIycqdez+51/AkMBPFLtPwy/XBNL8nxw36NnY
         B8WVdowsD8MnmGfw9hgTzYMz//nCiuL1IGYV/3T2cRxlA5wtSw+w2VSkwatbeAeL3Mt+
         J0+w==
X-Forwarded-Encrypted: i=1; AKwUvBymH9xNjMQcnPPgX4n+UxOI/4GxWrWJ8Tj2MuBothbph8Y0XpFKascv1/FVwBEU7KN3A1a+fijXw/XY@vger.kernel.org
X-Gm-Message-State: AFuF++lIcvj+oed0KRJu6fKkSuTvA0jYnJt3JGe5xjjcXAg7ZEFzWt2a
	t1DTFF8lBdDEVNkUo/XR55XGRR+DUZNXCgAQIox7gJcHdcOoU9O2TCl5XwL7zrst3do5T5HHRzt
	IQt75asBv5uWAF+hfpe2HRfEM1YP9eHaZ3hqoedCJbLkdMmYXZaW2IG7q7KJXRGW3
X-Gm-Gg: AYBFou1YS4C2Sh1BvrfFrDx9PndMoTy2WX91S6O5qcxKx/f1YLYeM2vQa+lC/CGoe7B
	oehUduEOfLm9SlmCAz34ACo2MaB6w07lksZUNbjqIn+D9RzWz7d+ycKAOqcLQ//DXHU1cjEfhgQ
	9MTierH61XgGCgLO0JUv1PlKfiAqVaHQcNr4Jeea+MCN9pfdfLxRjs/ZvibJxG+QyWQZAj9cHZh
	2RipiIwf0gpW6AXDqTScBWg1OhILv4VM9uVs97cTeV8Q4iKRlB32vWe+Vk8vGKnmaf2tTpSPLER
	CJIBfa17E/bqgwZDTCX9268MyjfXE1H2XTwnvD7g4Enmsy8r/8DEJeWbu8XGRlgNaN+nLHk8ih8
	luAfgAP07d8NSr/GTHMGssvR5cRBR81iNlr0=
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr4406692a91.17.1789109429585;
        Thu, 10 Sep 2026 23:50:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr4406651a91.17.1789109429116;
        Thu, 10 Sep 2026 23:50:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:06 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: glymur: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-5-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=1357;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9H5g3Swcwg3dlkgYOPFBquTx6iyt1DX+wBg5cLvnukQ=;
 b=mSB9uw/D0MgRIWHxm/4QFHI1sl2GWegxaL2m6H125jfyr1DttoYv7dTiOPsUg0nNgWDoRoOJe
 Nnh7lVDbkxQDSOBHyAFLkQkn3pBPankTCA+3FMwII8vAJzNOp6O6gGR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 4FM-QEOusOvhAKYO0gi6LmCpKGZn95B4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXxXClSRjvDwF0
 UNSS2U6HhisYP8rIG/Nk/iBg0YD5M/yFTRM6xjX1ucilsTb4pbAw88K/+BIWMiwdiWTbbHzAe5p
 F5wJDOpc6k2hdTHw5V4dINPSW9w44bg=
X-Proofpoint-GUID: 4FM-QEOusOvhAKYO0gi6LmCpKGZn95B4
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a4b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX27ulujWhWIno
 8gTcfOwHbEQkyChFnKWhoVkp41PiSs8W6ITF/XFEWRBise9jadue7RzYj+R92kuVZSnJ7Hl9gxT
 ASCdgWxDYnQesFpo5u+BOPCuzMZA9ahmgt3tiyIkW5yTOxy+urB0jnKPeO/pTQRKe+bArS0iYKH
 U/eOSB7qXosY++SLrf6b/J8FEBs8irwmKV+wopBzqq3DL0U1FA7xqyK1bNjD9Ay9be/JZ7Tz3JN
 FPEn6sf8kWNDT/JQP5WWuBMD7Hrr9/kLJ/EATP7kzVCamBKE6FQo8s2FcXkBRjTFD+NFpjJk48k
 9GM1WIUYmZyrRfqJD3IruWilHOZe7nohYfGBm51WMEidFJqhqxTccuCfmqvA/iPRff1+b9L2/e0
 qLrZJB/k0GNgG2jMMtyTeNTtmFFXAGSr10GHSMbBhygM3axpy3wML697DWfn1xPuPx0g/4k2zD8
 M2kjRPq5jsOnWVv0/7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..f7d7d76830b3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3001,6 +3001,8 @@ pcie4_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie4_port0_ep: endpoint {
 					};
@@ -3273,6 +3275,8 @@ pcie5_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie5_port0_ep: endpoint {
 					};
@@ -3489,6 +3493,8 @@ pcie6_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie6_port0_ep: endpoint {
 					};
@@ -3759,6 +3765,8 @@ pcie3b_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie3b_port0_ep: endpoint {
 					};

-- 
2.34.1


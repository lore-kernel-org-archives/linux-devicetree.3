Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986652;
	b=ohKOnn6H8lodZXzevKHivn9OM+hCzymexlEggrrWQ6CTgM19XbA2y6iKIKZ8H3nNw6V0
	 gNtj7bwB7lG4INOPCrZqIi09yKOQl50OhyLkm18mUdRyh34Q+VhTZryVxOXL7YerDUNEY
	 KsvOjsvLkYo7ugu8aOVhDEB/npuQmCIc3lMrUeENtIMFBF0rPpT5UubmFqkyKgWkOg1Kz
	 HwLr1txZeOtftfE0fLlgjYR6WisYp/thvh71MwdjWpuMevamfIFz6d9PVjermsi2mHioe
	 TPmM3TDbg0Frd1zZYg+TKVIlRD1sYnmUvhz6FCqA7zP79CXckBgodIF93IvfbTKq3iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
	b=Ya4wl5NkIWtW4NLkdr+LTOWx5bPvc3OUfsIGrx9/wzme3j74/zltpta87b93fN4mvCz3
	 1OChprVMNeyTx5ZlsPnUgPkcwCtz1eqtttVv4gp7Z9bQCwuLPEmcF3QrTpxEXENHvoYSL
	 ijCjkS5HZe67X1IzTKwrsjmV/1nLdd2TwagD2vClU7o4YcUtegK1h4qq6Izbxm7C3jI0L
	 SSXz3+c9tqVLbhUXszsK96ZiEKviz/+Gg9b/d2DLpFiqDHdx6dndGYSQAGpitBrxypWhn
	 a+nsyZugQ4USXpVbXwvgrTwNNDbFVCTHNoXF659zyybUvB4q0lTTpalgx/yodSL6tsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQ7V2gyM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYxGzbqS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB4606A33C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AB4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQ7V2gyM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYxGzbqS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exu1L2670532
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSWoH1B3xqS
	+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=; b=TQ7V2gyM6iMPqHgI+DTRf65TdRR
	tfCdKTJHDhdmWI7Ckk923laIqq1zSVIVhBT1NbKMKuBUxLhgdb0b0/QmCdqckJIE
	msXYnA446NPHdGKU96zbcUbEHHVTTELZQZ/TUCOjB2qjdkJRJq1TEglD55eiJrUg
	/owUE0Z3LLsYFo+1Jbwd/Z/20G3yZRxG8+EXfDqGOFeipp+e5Ik+zQtBUfu1s7bL
	heEC9cQZKHPlPkp1rlSTyfGoGE9rnk+NPJULpaw6UTrrJfyp2MC1rGTpiM/5BmNt
	PJtTyqy0qPNzqxMg86DUtPMujgqoKDmdg8T2BsJnzQNuOe90vHI6pijABpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcbxj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 17:37:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so183830185a.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793986650; x=1794591450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
        b=eYxGzbqS3qCQalCYnDYdr+KbJuy2DbzSnQVqqG1Aaz7k7rHGtB+9OTJkrUu8a+ZclA
         acyFdljDZvtlerK1T1JL/Gr7XSQt9kVAGlLVApwnVDSNeP5IZeKxgDAYQvvla8WgFdMZ
         VOfuYKqefkk4PEY6MXKjlGn5HR4+VUck6EUn/sn2fc+ONqyC7U/86YrO2ftCgFrlSVqt
         WgwByGCCDo0/daKEKmZIVKzAJyr6NevkwaAgWYAdcJBv9cchIoMdP2DFhO7+La4IxMMY
         9Vk6DhZkGWuHv8pUwlybm6wonx6Yu+ulsitON3yI52UlosNCe1n6mI5Ug9841YhpDlO7
         R+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986650; x=1794591450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
        b=eDF7t1g9T0Q8ZS3DWdLHnbtcKPmQWiSBXVRhQQ+DIFpHPKLowm2pJPRByDwiB5SOKL
         jwSJLMhIyP7bV7D0g29zkO6hGJsAeBZhXpWnDNltLIQpygVbA7g1EAfHn2V0VmHEet88
         4vx+xH/lt4iRxTxQ74LEQHYrS9Gkl08GNdme/LsYQ4ZEwiBbfsgmRwb0MPTaxB4kx/BS
         D0TaSG+AtRaUtYzqdUYkiOIN4mR7T4OzQwbYM5+ZtsFGhaESDu2U1R1Ml0IVOCkeayl1
         T0/xiMcydL0NGbDIRwgb+fEDNQS9Q/4IjlzVH3BM3GRGyu7WGnN9HdltCuMFcN5MulQ1
         8Ngg==
X-Forwarded-Encrypted: i=1; AKwUvBz1RxFyh9yBcIMLoaxNy3czC9AQn6A32+RgeX3U37ciVdL7NDXnF8Nd8esbiL90i7D+hBiiSiJkCyCr@vger.kernel.org
X-Gm-Message-State: APuU4Z8JOsjjJRDvUl/huaICeSQIpqmL17aU+F0n2Hq6xh1UwHWiN8kq
	PLud3VSIuUfZrMquR9IlOPkGY1ssM36iQWr4++TDH9hjRaP6rQmKvPM6W5zbEjNPhhfeY/C+qwA
	Q2ueHgMb9w7MIIrZXPJk7unwymN+G7AYVImw0FCSJxQdgLGZbe5ETG3C+ub1Cuydo
X-Gm-Gg: AYBFou28CguDxNV1KC/KTw8S66QpA/0RWScD3ALHCuBilU7M3UBHTX5iQkn5GstFd8Q
	7py7Im4Fq53DlHKWDYy1mmVq75Nwb4G4U7iiNDQ3hzjSBWt/S4lPs/7DfUWZIgID9p8Tz4rdf9k
	DzcQSB4/3B1eoI3fP97f5QMRmKW8YghZraxyYI6cl/4n1L0R7hksQ8Gzw8ccINyF/qTauM3+q14
	ZrkP6N6aSM478xgYHnLjLGg14FJIQ9q1DWl1T14OK7tmsUOl3C/YTKgpQ8HRqgNrR9idZTvHH8V
	M/P4JSfuwP+pyAg6DBT2Co15SM+cgBanDVZAulJjMaEpsM1gJRVm3EN4xGadcGQNOCytQ4XiQTr
	lpL8ZNq+E0oKDStRwEZb3b3ito+rCSfgfiD8qI7Xwi28Sn8y4xvmzgYEZjvg1/w==
X-Received: by 2002:a05:620a:414c:b0:93a:1196:ce5 with SMTP id af79cd13be357-945e17a4111mr990646585a.33.1793986650368;
        Fri, 06 Nov 2026 09:37:30 -0800 (PST)
X-Received: by 2002:a05:620a:414c:b0:93a:1196:ce5 with SMTP id af79cd13be357-945e17a4111mr990642485a.33.1793986649931;
        Fri, 06 Nov 2026 09:37:29 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm84256135e9.6.2026.11.06.09.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150: Drop non-existing enable-gpio in PCI
Date: Fri,  6 Nov 2026 18:37:21 +0100
Message-ID: <20261106173719.276668-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zu0EGxqMzGFfmSiOqNguX77I5A+Rd5yuUAj5togeDfQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7hBTLvRS9GqylAYZy1MZs4vw5sOSDN77Iqwep
 HNfxJCyqV6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau4QUwAKCRDBN2bmhouD
 189VEACUl1zynl1sPCOeD8PtdyJm8Pb38cw6x2OCQvaXXxo5Jh6VwK7LA1erYWMOk//WzV02Wra
 fWf0CJviB+BWIY7ZrYnjFSQf38ouCGGiyfHp11luWpdsyz3FrNHsUG4UQbnDWFRxXAIYV4kP7M8
 cMm/U9LkhtGIFSyNleiaUZqjrX19aNPdPo5GXw0x88aqXVfenmorlBMqolvqd8A0CI5PxfrOFKY
 J8qEQylNZ8GN0GLXZpqwnH6JS6h7+ET4/3K+ZCznt6kN0R7WYpHJiDI+RkPwyBfsVPPTN3JG6X/
 muMtRzHs8yxio6eE4DJpCdoHkzWhYB3DL7r3zcCR6RUhUYhh9KKNJdOdeVf5DBPCqCCI6wvSdC7
 tutovzFBI/IU+L7UKKh0pmqTadkpfZvoCl4ZsnAlrPGjKCswJqVkz25Y+SBslm8v7Rpu4wGBzZL
 /9LXBp++/Ahz6j1KaAdcx9TN1ER5BuCPhdFttBOL+lyOEm3wTBGxe4V+2VjjTyt39wd+dlEHVEf
 5jiuXKCtjEWnQ1zdIVIVXMCtRg1L0L7NdUczSrfYI5vF90TZ/rZyHlhdnXrFsY25/ljjW+5HyKO
 3zAWYYLzDc11qoLtx+LgefUbwv22bXL25lpAMPsKGCIhhEDScXbrQdQUQlo6Lcn2EB/Go4s6RhC 5BOZVRFZG/NrLCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qRvQ6ks5AEa-nqHNEUgTkBjC1SBR7rzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX6pLDYQ7dMWzd
 a7ITNhwLLMnAAhgReq34h2W9FitgnTGosCoud+b8E3RoitzWYS5cxX98GP1+GuUjNV8A/VT6vKR
 qb7fSAW9kDCahxsYYpV3dMpbUpVq1+TCypdNw9qkWOUFUp1k4vHykIaUUbmhnyuDsIRWfV+CJdF
 /AjnO111sngikSIoNjaGy4BNkmjrWv6TeIfWNtW1xG0iNKfGMS3QhqO5h2kI6LXWxsUTSIC6oLz
 tneIInvPRQkaTHD5+uArg4OA4Y35IN0MjxmXRbC1I8/F0Czrf/Z48wr/c4Mp1QjPBoXWSmtj+dr
 /vCbvSrcxttIydo9+kBbcjQazljl8WdydfjlgckAwW00onlzmt26dVSAUCaIB7y085OmxGZprd7
 GpNX5DCm1m1a8VWVCDBVDEzK6Wor6bZFoJfy0W8l2cWJ9NsLEzK6dAmoxtYFQ6gd7ulzTjxMbPi
 e6Nt0wRJj3SWVOiBgFw==
X-Proofpoint-GUID: qRvQ6ks5AEa-nqHNEUgTkBjC1SBR7rzH
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aee105b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Yf3vPEn-BI-scYSMMdYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXzAVhaqqItxq8
 CaAlaK5VaPJzA/jrQKlKuGPN3D/78BLQHs6B+8H9W/HqzPiMMJU3QLiVf7WyJhoVDRdiVOjjQux
 EIxHgWc9ur6Msw6jCE7Kv85AfPq/orU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

Qualcomm PCI bindings do not allow enable-gpio.  Linux drivers do not
use it, either.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..e62a3005134f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2019,8 +2019,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
-- 
2.53.0


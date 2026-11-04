Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819828;
	b=eZfYh6SlKkwMRioDaICKhID5/GqQqqc0i4A723KJwuKKHl0tXvipZDRUFTjgsS+ax0Jg
	 WqN0NyQ5OM0H+mEvD4ftoaugBIEVPWh6hn25OgvQdiS0l2RWHCQRW1bNzPj8ovQzp0/zV
	 eSM7gymiKEsxn6ResTX534zDvf/lXjwcr3YRtAc9P+3tRYz/w02GnNhamb4M3Zf+Mknmw
	 dBY9E+V8jo2O2CvaxufyHDD1GGagsO1vfV1z/5iFk76F7sraO5pc9gKLFusKLCbhwZH7S
	 5UvgDulv7HkFXxOqhE/Jl1x9Jp34VlcjYDATmQ3IIx/iZ4WVGKsWRui9S37JUHtKV5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+PzcJPwbQKU=;
	b=4E6ZsJvBUTPMG8TifgBrsD0rV3UMY6IRkP/2wR4vv4PkW8D8ufnmqKQ64cKrvq8s50n2
	 haSjL5uQe8BZFX1kwumMhv2RzZ3MGhl6PeQlkXLt8nOtELA2s1dyZmpof/3TfguCvdYGj
	 uCbWomeuARXWEsay4SoPLKXkqyZQd9/CvbrQ6mBMc4LzHl5od2yjjlK9MijIvr6YOOvlD
	 Vzi+NVFzHyzdux7fghgO7Ncsw3roSPtDIncu/EViSkZKKVZldtgL4bu/A7lckJiA3KsWY
	 HfqKkYcVKmrGMePLxIAJsNblNVD17FNzOoS5Qx1N1xOul7X/Jefibg4p5qTpRUzi8nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j2H2B3Vd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqKBOa1I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679B606D83F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2679B606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j2H2B3Vd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqKBOa1I
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjDut2244242
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 19:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+Pz
	cJPwbQKU=; b=j2H2B3VdIVShuUdohZdNELCHvIJZD2w6HtvgwswRkyUJvZlaGaq
	KBWEBFJaFtsGqoKTR2Kziz3AzWJ2XXCNbHh5Q4+D90i3P69vi3O8gs0CPTU7gj2k
	DQwtEPyyWAwb/05xhAHk6dK84V5NLvqxK+J4Nb58gde4qZdjQkC8OXRfDMGaenZc
	g6PMnJ4cUVmsNSLMeidVl5OTUoI6I76QniK1Z1yxcpca0BmClW/2nRYvN8b+hm+k
	zMmzyzsQ329Jm6Ukom0PsuCNnnSArvf3j8O6jLwOYcrUH4kQnsdlSFyd+DMnr4jj
	RPxUFGfSPTvfoNLtdw69ngSjWtjjWVpY2GQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyj0qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:17:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99870ee564fso740943241.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793819826; x=1794424626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+PzcJPwbQKU=;
        b=hqKBOa1IsRTRWzGsScTHCuHfXsOqaJ2bCp5JVLK64tf8NrM4+dVDrSkY9tbhip0Bj9
         yywFhfojiPwdw1aWImMgd3/65CXIy8L1pfHtGv/s80eU+AL+5Mi1FKBjOdN4Gzv7O/zp
         AfNry3kYn2e5czkyDyGa2TcBztelQx2Np/mgAK9QMjMQZTsMkyuDP95It5UTDmNXsRlH
         0PmIRBCZpSe1QnKI81rhzgVSsbSKZQO7JKMTYe0w2Z4idKUEzbMcYwECrJJfnPfzO1Zc
         XSQ+DF528gqtc6v1aj36VKct+3qvvTU3dAX9eq1aYIpiYRcLjXTRZ7IqmjFMR/v/vnub
         8gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819826; x=1794424626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+PzcJPwbQKU=;
        b=MkkfoUKqe6SNlPYmF0+nvs+8CIYsJPLqCFoqh5jXOCsTi8FXM0IoyUafTiaVNxnTH2
         xZehjT4zERI/ln922v9TQfIniyDF41hGME//pkQjHKsoIaPHhOS5NwY3+S6gMTywW2HX
         OhVcz6ycIOxjTZd8Fp4dJ37FS/5KVUrmYHkXXgi8YqF9x9Qg6ctWeq4OBGJMSKa3bO9A
         PI0XwF2wRH8yXBBq0agZkYnDT6ipbEBVLA/UOt9vnOLAMPWk+hrOTiVBCqauBbEeHWou
         ADjjOSxODeOufN1CVkUS1zRUDZm/kkLdzg/rX07i7UIBPwrJk90z9fpgwdsjvoUFXNuV
         Js8A==
X-Forwarded-Encrypted: i=1; AKwUvBwrauRRkSrqnqJCbXo2WlGR1VOtWSdQVw3dmL3Q3ovosAAuFOxZLU0kpUSfo/AzXze7wZSc6AQcZV7M@vger.kernel.org
X-Gm-Message-State: APuU4Z+z57y5ApsWlej0eaV3D6HSI177kHM79KfdOOdzE1AfS+1aJF63
	PT3krqS5pUaA0EF36vgnbFvUQdxBfhFQ4cxXGOAQW9gnksbHvMDdzPuDH/bz9osL1qGQHY5JM1M
	o23m2MXh9leZXuk2FEx1JvPC7IAMVQZrJwGUqTQeM+f6wvHttn5Mp5rXeeXjOgsWN
X-Gm-Gg: AYBFou3Skpz7ZT0H6CBulfQiGc6N0TjJeov6ZZcnVpx0ADnNHYJERIrmqau7XJ/QrlH
	SLylqYV8whO1EWp/WXd1gVC1BckO1TEI7Pam8rLCQ+i5CplXomIFAZsMyLEZtqUc8A2R9vXRUFw
	kwFnY5QS1bhoHdFA50kQHn3Vf2/Y7Ou/XxPZq14ik3jqz9t6smj/8tsLKnS0e3C+P6pRva4aK1J
	sNCcWasAuBJllyeOduiL9rCCZqtdS7tTsiGhCrdF7cz+pBpdvwVLTY0tBQcVTiV+WRh/EKqrhKq
	/QefNkMO4wEJ7MyRvCIkanDgEAe+2UIqnlu/OKa9uDg4PIEuOvh9+nU2Dx6hulYYhjQDemq0be+
	ycnxBj5Tx5RRpKj274D7MJqwHhZLr1RtikkRsNCbbTXqIuMpEjClcxhu4FgGL8g==
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr7579650137.27.1793819826281;
        Wed, 04 Nov 2026 11:17:06 -0800 (PST)
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr7579640137.27.1793819825861;
        Wed, 04 Nov 2026 11:17:05 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm51276405e9.1.2026.11.04.11.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:17:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch interrupts
Date: Wed,  4 Nov 2026 20:17:01 +0100
Message-ID: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=A85EQK2rUPMA7hLoO5/FtN3bhTj/OFDlNXE8+ADzmpc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq64Ss+hPorLiFM+X6gXqF2aw7di7XVGZPHtluZ
 HH30LaSx1SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauuErAAKCRDBN2bmhouD
 19lIEACOFKHpb4d4Gd6DXD/mhgWdzmrfCFyU0rjL02uSn4Ym1UTtgoji4iqiD+388NCWCh+M+Hc
 Zt6mrEEbXOIqGmmRfyZkUs8ho42itrJkx5AMroy10LIGJrg2hclfcQ9s78l9ETMI66DmAsZmSVc
 2UgaqZFYM9r4jK/yMyGaZXASipbZmLcMrkqZmZIShaY95u2jHBPdnqghFlSPm4R+snpvC+z4eUk
 KOeQ1bY5wiAZ3SklfY/1xG4mC9adTqc1j716rCIor5oEetb3PtqGhEHG+RvU5zvyai8aP/XfTbw
 mfX6AZ1TRGiHZRNYqm0QI6mSsm9HOOfddg9euE/EttcJyuQknwBRMZYyYLLTbr94K2WL/mE5r5X
 kf/17MsxO6FuOEF/QprmVuN4+/haEsUt7MOVrx9afUzJb0xFKQHLgCgte0UQYg2d7RHJ6K8QMX+
 ArfAQinXMdJ2ARatJ5yps1NC9C/VStggBSJpZSEP8gXSwocRyXqjxs0TtmbnRLTS5lKk29CeHpD
 XHs2Pib9JqFeaTZpjulwHMAfzKvCMd/5XrLO2H9XIArA/IqrBuraTJcUbYd/MWLWsgiyOOUDXKi
 J7Sg/TXxMuabqiAOSZQ0Y3VanoGLqOsPP+tWoZaTplCr/eGEGrq+ZmKmFuvO9IuZEAkWrBPJpj0 HK1ancsV1sbM3iw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb84b3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KvnITNCCr6MzWQ2eYPcA:9
 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfXxIdAQ4Rnu+BR
 mmlW0DKg+ELrF2rX6C1j5kpujwqA4oJRN95cHlttlp6Ti1kfFd6iF0Dypa03LBKA9mq5Fn7eLCq
 /ds8/JfG9XS+JEs4+UZ6eWit6YZP+VyOsdnbFay/9qgkbC1Hp3QNqnDSeoj7NKzi+T+e+i2011k
 YT34nQhgfy5yLSS6iNuJ3MOyNi46EOLdPMRhqPkjydwK03BeWi3YjUp0wYIxoIzV8ePK3lEB+ID
 P8cxiiR3C/4NkGCeU0IpLjmRXdtqHeppSDizSbYKsZKzG8j2ylPoGnjUjS3E0PgNqtR2Mt3NhGs
 GbGrQzVr1+9RNAby84itdMjPt25rjvZg/rOJcrcHB2XvWdHTaSX605nNgND2Xkvd5dWvqUXoSMH
 t69YHjiwblr61bbbkQF4h1bZ+yeR1DzAeVd2tZtkVBNB+2Y/aNF/oxw/uOoPh7cw5eU0f5MgMcm
 j4JKcQC9WuQzBkLjzoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfX1kh2zDmgTOrU
 YQLnunx+Kry9ApYrphZv7jRAn+UUhWplCmVUPjPRdHYY5nbWwP0gwjpqA4WbS2q3ZWsgXCunXvt
 Fak5qAbRxJqkLpXm62qow/9awp68HQk=
X-Proofpoint-ORIG-GUID: -qHncvkgFlyF-_vOQK1SSoIKThpFQxW7
X-Proofpoint-GUID: -qHncvkgFlyF-_vOQK1SSoIKThpFQxW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040076

Interrupts property takes a number, not a phandle.  Passing the TLMM
phandle made most likely the interrupt as broken, which could affect
touch operation.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 7ace3540ef0a..63dd5a1a1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -385,7 +385,8 @@ sideinteraction: touch@2c {
 		pinctrl-0 = <&grip_default>;
 		pinctrl-1 = <&grip_sleep>;
 
-		interrupts = <&tlmm 96 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <96 IRQ_TYPE_EDGE_FALLING>;
 
 		vcc-supply = <&vreg_l18a_2p85>;
 	};
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549888;
	b=tzDhbhPzjaQuwmkfFsghByTRtoCRlJSewiDJ7nm+3/N47NLaPBH0CDmbRNaNvB9gOb8X
	 9lhIpZU6AQa5hREngQ+sfM0eE39s9nIXIagg92m3QvjQMgT+6Jtd94bDczb38Z9995GTM
	 fLzyOfS94bJeiRKKP0ASNa3YaawBhQ4o/1n13TtrvFUeNyzkZABPTd4evDY2Tt3NPja0S
	 anDGfOp2XvmQSvL6rWiBfx3DeYDeIDo5ubdLj/CvHLByMd5jeqGBnbVoAILapNp/+WQR6
	 bWv4Oxj8EX23tqnqsn6XfN7dPiWjzhVJlo21YjNmN2rAE2Z6JI6RYKjq2GInd9uQ7Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
	b=Vy5ZshFgGMuWgXtJW9jLzBTaP44249wGshZ99wchGGn1x+lHPlJ/6bP8faXfIedMYQEs
	 nN1MOZFMpSad8cAP8vz32iR7Smf9edER+5wmcr9ZQDAAa9y0+6kRngz/iDl7ypkKa39sj
	 llb2WRLRZgsXq637amupbP/XUqKiQ/ysEA7yOHObSNNRRMwyzPnCEjcj5u2DJcgBiATAI
	 F33UNnJQhIfXcHA2zUoYJ51RaRJv+AiWHsY/PmQkPtggPpUbqcf1EngVorLvoqMYQzMxP
	 h4y3FJz1wd+gq/YDqQ5phg+xykX/PF5qXGHsxaTlf3cwlUQrap9VHS3AAf/23Ab50+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMt1JD5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jA5fBx/9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50BA606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50BA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMt1JD5J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jA5fBx/9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2Etxu299877
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lj0kmomju7m
	5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=; b=FMt1JD5JCDGlx4wCpYWoAnHdRHf
	YVxX6KBCwsnZcZaaBrgok/Cgb2z/OgZl9JJbfYSvMcN1o0qDiR748fLX+neH4WST
	oScfI6DyiPUZjv0e125VN4MEM+ozQn4vSdqsIL6mMpEfv94ybwj1T2lf6p1T8iUB
	JCy0rJuDoTvlVSCaBSGM0EJt8mOpzwLmHBdTk7EkxfkfS5NZiVG9kGm4ZcnsC5NX
	1cuANzOjT1iK1gT5s2SIjXBbh+QpNUPoeq3vJPsHMdkjuJq5YidYxqJXBiWvloHs
	ZsbbisDFp4RIvz+DOfp5H5MtTTTkd7zVEtNW9QYSN06e10cKpokwfpYgBsA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4sjmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:26 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so266285c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 19:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549886; x=1793154686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
        b=jA5fBx/9SodvW5dYbJ1b6xj9nOIepLWRfEJEXFnoXGhSjF3z1LUsjzkkihdjCgdjqb
         JoKqRp1PYCxfRz/RQEs1buK5tA0E99l/lpi1uEZ/iM9K6Qbi2ICtwUG7ki0H9fSARV8y
         1Q8EgDuaMJClDF+YLMIWdKjwnOBGAxJElwXNVrJzLTjadOIwgIKaBFetJ3ZDDHlbHL7W
         WaG3oE9CO3lxyEDF+fOPJaCnFbb0+9/5LhYdWQKFyyV0qlf5MMWI8onKO3kIXrCAZh0S
         HDDnbkGWcZk0gEl4IAvRaxvEkyPMbLaRO0UbS2WxW+ivF0nd2SCTkysYm5CqfoaMz0oH
         JgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549886; x=1793154686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
        b=ejAkZugcqpCN8O/+bSvVm5P97ALpq+t5xVaQl3K3m1S5/319owJmKASn8mDpmXn9uN
         eN5uw1kwwsuuv2zJPPRuzJ6bqm7UR+3kOTnpFQTyciHkpUn/LGmJiS+tAYuuXxbjdEQ+
         Lyi34lQEsanRabWsW3/nZTBwQfkxHIFY2hNWVA0666Jsb2SGQrmj6gPX1TQ9hJAn0IjO
         gX8+vp/ajXpqs1t2MQfVvMBAxmeIGstjzVjHmjRB2cjPb2seWiBSS5NA9pPQT4iAhCHU
         lnkJgtOGWRdNjNe1sY+b2Pv/H07ZwJN/w1uxFg6pfad5Ro2sStXXGawx8AuRbkXzfmZm
         1THw==
X-Forwarded-Encrypted: i=1; AKwUvBxiSCmlx+MSQ5LHJ6CbPGthINvrYgTZrokxKCoE1RTJqDyJ1a+jz6QzG2i18t5BdzqvCUTGrr/Bnvr0@vger.kernel.org
X-Gm-Message-State: AFq9FYK/UsQbxnoomdIWQpVMJh1oE/uqbEYshNlxcnO5vsW3S6AhtmlT
	H16TKHYjE5h2h+3+K9HPRr8j7+OFKEeSaTyxwwyeSmtr9+sqoemgbOvSA+XTPsIqSieB3nVz65B
	+Afkjivm26En7bNLE/54n+kXdFNMbSlRr8pFFLVosm7s8iIhAWMUtfoqg40JcP3dH
X-Gm-Gg: AYBFou2vw9c4eovwrUlVvTkzrJ5Hu/jHKFveRv35zEUtZHlzj0ylM+cLgpi5AscuHvS
	DavibyiBInOxA4xGOD/KtjmiBfRfICzEX4WlwcCiIVgm0h+dNjGrygY1s1SlzoozZNdaIge+Dc7
	o6pswv0Wut2HCSAGBgam+73HvK6JCQ7Ew05DzjhTs8/c4bSp1A/Qw1BBHp0l0N9QdA6ivX/JcSP
	t+NL4jFH7ifcbl6ugmqgRpXtQF+MuGhtj5AWNKSHucd/CZODQQPtsEkFBAUe6kj0kkklCMKBqzX
	uBmdQu24M/RPIfA4KbWPBJZEuZL6RupVFTV51caFs3pK9uB4/RSxHXqN8aVwT265cqppmgL3a4C
	Y/8+ZTPUn5xf9iGBf3o2PFB8lqfVECfRnqMsidqa1IZD+KqcyspX1ty/xrEY=
X-Received: by 2002:a05:7022:7e86:b0:144:e38d:8e52 with SMTP id a92af1059eb24-190a784c70emr996402c88.37.1792549886096;
        Tue, 20 Oct 2026 19:31:26 -0700 (PDT)
X-Received: by 2002:a05:7022:7e86:b0:144:e38d:8e52 with SMTP id a92af1059eb24-190a784c70emr996377c88.37.1792549885477;
        Tue, 20 Oct 2026 19:31:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Wed, 21 Oct 2026 10:29:18 +0800
Message-ID: <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4jmqk-nOSyC8_L1YO2mFhmWrxwSnZVsa
X-Proofpoint-GUID: 4jmqk-nOSyC8_L1YO2mFhmWrxwSnZVsa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX1TgctogWUk3X
 mTnQc72ddhYgPA1pWhXEhImGnDo1XQAmNLoVnnZTvZpR3W0ygOBUxoGWKbgfuEhoosMM4AzwTRv
 kZauP4VfEKlUC/YjdeMGGKqGLJi6mAs=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad823fe cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX8koCYQz9+c/A
 +CgQfYpC19xTTSQIx5JF9BO8khrgHXUhI7HldPVC4eVKUegihJBxHcmEwGFvoG1GeC9IdeOWiUe
 ube4caF3VYl0dpXDM/rxiWxgaQKgGEz3wTEqnCPKgsGL+3gHaONv/5u6CIkKQuRjwEMVGuWLzhI
 gCgy61qTPMjPG8J7bmIX5W6YtKrPSnMMQVyTtQ+UtFhQj+racHDqnI+Qu4er5W7ZehIBseLz8Dx
 rJFuQKIiJ9YYtusmu18rDdPPZ5Go3FT4DOpiB6kv9V7mi/4wPlA+vLyEXGXhbAEGwkioo9pQyHG
 VhDEjFxhKww8g5zKYjGMDU4lGObJvfmk38EbmZpCOVmj1pwlvtqrVl0IE5/sdHjLZAKz/Z2o0Si
 GAoKyr4waBHemzkAE3o4xIG3GiE3SstszRa1jcgHA8ndLF6TEZelkgKyuAnXnkOSsDN2BMjPIa+
 /B9eUtkX3NKXIKG1KIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210009

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..fcc07226db8b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0


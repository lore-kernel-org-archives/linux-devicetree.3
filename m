Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80883C342A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550853; cv=none; b=mlPNQ9vb5UCnSu2siZXLmRsajKbapB6l7YhA/Bd3LpbKhUuuhQeo1jhle1EOgOfe+kHIBK1RviD3j8Bf2OBib0k9AJZLA1IKyvmK8UL8ErjWDTsJaInxWtWB/NB3ht+raPaac53ThgZPqJAX6SHu7fj72f+bunItM1prP2UTJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550853; c=relaxed/simple;
	bh=pXAawpVYsMfvV2O3InerqWXimxMOKRET1MkhuMfO/uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDWPafpreeqVlLbVSVloTGWPL5kD1tViXTBYqoT/HPpq077+sFajVQTYbBHy2Uq6BFa3QeP84ycFZoqYdOjTJKyStpHjJv+pJ9Nlg046/rY7/kk8F749gXmzGEsWCqgY66orLwgNGT3Pc8Ot3nD34bPsyv11aMTVtBflkJ9vqlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYd4OCEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeX8F6PN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYd4OCEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeX8F6PN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65455V2X1039270
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfY+l5ENa+nZkYY0yw7MYu7dswdpetfEmFu3VTlOPEg=; b=DYd4OCEF49gHOjc0
	AcnmcFzA2grMFqsKhfC1db9MP3fWXTTXs9rdGSIyakuXI862UFjl9SGXF145Un2z
	EsGxXn848GEBBodc+FyZsYbtq+KI10kHmooqGtqGqmvJUV1Znnilv6UIlxXL/lp0
	JfHE5YuBnkvplr+p8Qb9sNOUmGLMIc+kQEKJmK5x8bHy56IJZVnjgTnkTweaMmYR
	Y2BYwtpU95iMqf50akWLGvAe56x26jIBXiMbaRjSpmgqgrKrRBq+Tfw2P5B5QseG
	Z/ISfP4ibsleNU7uaK9k0paLgWNF6shpkp6Dt1S4FGAb2YmzkgiOV5wW/7749A2E
	jQB54Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8hs9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:27:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f424d5bso256094b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550851; x=1781155651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfY+l5ENa+nZkYY0yw7MYu7dswdpetfEmFu3VTlOPEg=;
        b=TeX8F6PNWZ7AOMq8aqDHztHiusiQ+R1dxTLoCzX0oMN76IerItgnhFQgIUifj5KgHV
         6GhXbcKRwEdz2+rscbD6U/oE9GrBlsF0APIrv1UYt39w/tP4h5P8uGxJs3aEDiXM9/Id
         Z5w12i4LSnN5zWl8O+9EnI0amdl0E8gM1epitOju4YIR8/0geF8ebx8Ikk1MWTLOvNhB
         qvNPZHdv9dNixNinautlwbv2WWaFkIcvgbpzqTRSHsug1VglMzUgTfSHAsE4mb9JPd0T
         cDUXGsP1GWN3G4rwz04u5OFE6oMCUetiL5XEreHIA5FlLiBPXOHnCZTTm3WWAElYQzOn
         6kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550851; x=1781155651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GfY+l5ENa+nZkYY0yw7MYu7dswdpetfEmFu3VTlOPEg=;
        b=dhSrbp0a67ixsHF2/8j9m/L2FjRWvOTOuWFS49BhbE8nopnKXHdI7FHcv/ILFUNoZ3
         BDzWjrq6OCy5wVW8z8w8YAOJ8b5Q1fp6iGzliwS43EgqYDCgziTVRxOh5bfU+1m7WcS7
         YqCOfMuAsaZhLuzKYbvT2AoTBzueoNGxwronS1joeAlpDEVi78yYQpUW7MffVb66olwO
         /WOM0FR2GOkdo9oBiScYc6a8+wZZCfUqicK+crOsSehjde2i8DRTJ7YBdKMll396mxKE
         zLi43HUD6Mkka3VOhbmj3c0z3nnyv77uLwbzZSHW/uUsVaf25Y2yqcH3qYz1H2n8QaaK
         bVhw==
X-Forwarded-Encrypted: i=1; AFNElJ/98RzQZ8F7TwHN2+sMC2bzNEVoLDe0u9IfPAEYQIs6l/6DJOTQzsPObBARShXuSzelCR0zicTTlZ6s@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfngrKu49FFbXGm/uB2aM9E8p+E9MwUSPCelY8YCALA9AiIg8
	TymYwZIOht1R9Y/HVvK4VaKcQSZpE1jDxkth2t/GA5OWRj/wPFaBp6bpwHgfx7XUlaVtqOsH/Sf
	0xTDAvfEiwON9P6xeqIc3GpkOCpHjpWNCQpMQR0ebJb4fbKfTfaiSmSoSZKCRrn+A
X-Gm-Gg: Acq92OF9KxoydeRLTd25RhqUmiYgi0nNqgvgGP6ZmYrgLYuVddPIR94qSbvOtfKk0s8
	MJk1JX5pKngfL1/8PgrfZvTX67muTd0REf3hOz0p54OoBgsrF5roa4JbsyOb6RaR9qBpQWEBlMz
	wbDgEe66nOtvcLX/rICUW7Ayd+6VF5P7EdxZpi9eDgUHLFFgukBRpTQCLMyKIE7Rj7ZPlfzUCR2
	NcN1QFLtURrePnl4BMudjouFRZZuQF6cyYFf/ZHS1zCHodLLZVjwRhpVHpqMnF7g6UAtx/CELmH
	SYCYKcErG0bLB59hlN3YaJpvO5Uc2pgK3vGpp0hI9jAlGsLc+fsSb/CTWnod8E6dFqVV2qq/FF9
	oqBAwVyYWdDJ5y7XWi1h/QqWjnxwjtu1F8e0pJ/dD6XLzhICGhgmAbNP8khJDSVE=
X-Received: by 2002:a05:6a00:951b:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84284e36473mr6827000b3a.7.1780550850634;
        Wed, 03 Jun 2026 22:27:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:951b:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84284e36473mr6826962b3a.7.1780550850189;
        Wed, 03 Jun 2026 22:27:30 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:29 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:18 +0530
Subject: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 60MHucwE2ucwU8tr2G2LLQTErYEr5EVN
X-Proofpoint-GUID: 60MHucwE2ucwU8tr2G2LLQTErYEr5EVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXxwUG92afQy8M
 0/0tTvJermlpLuuzc9Oj5HmEdDRzCJ8sFw/vD0Hg6vTGoEEZ5Xl4yZ6365fvQ8LGKLpeVMxSJGH
 nnsUlX6Q0HrF4p5KBrzwzwJOU7IPjNbpe0Ig84/Vk6sRGtFD4xQwrG/Xk8WBjQ/h4epIh0YNTlv
 0BGar2/Zk3afkkcqiNCpQD98HSeqz4YO/ZHxiQtVkwuhLd/FLzjAzpJGjlZccWysdoGYHShnhh1
 /T1BWEOJSre+puJ3z4xS1+UlDQ1BNAsO5qu3GLByqe80Tn4w3KRFa9Qf7LAnJYsMGrIDAMmLuBh
 1e0VoSFF8/ISg3ydnk1OIShTMN1dTm9m3S8gsqiUg2tOsCHs2Q2gsuMMrZWcBuaqKsVdqiic4qk
 Ye3aa1H0ARmWmMaKj6rWT+0pAvfzY9Wh4dNbKxTjnYMril+eRhUIG3b7/4YCR8JySZwwUGvPyPU
 R1Z4vSWUbo3JJfWSYvA==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a210cc3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Gd0QNvzNEKi-DX6Kg7cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040050

Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
bindings changes, which adds support for the DSI1 PHY and sleep clocks.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f0b6ae9b81528a848a75f6884f1b27137d780f07..f1d93f86d0a62a813f76580362e850ab847e51eb 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2190,13 +2190,19 @@ dispcc: clock-controller@5f00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk";
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


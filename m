Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D18D36894D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971652; cv=none; b=SRhQ0mF+h6B6zRxeKHxzfon8uqVvEro4jIoPNVRjubazgGRzBdFdrbzZjVNhz86SKkdwnqIWIx6hzttYAh8iBNb136KV8tWTxXfxmrbVR7DlWRIFMTlpgTvbyqaq/+E/huBhi7wbYXiX1bJKHO4nsqJerv15S4FEzocvSRVgaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971652; c=relaxed/simple;
	bh=wLv1YZiGVAIfGkU8hNTnZBE7kQceQYpHHT9BZGMZsIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5WXfYRFySyIbLO2OGcx1wYG5K7ANIOcJoo6/HmC0UJWTxk0POhenru00r7w9d7VcTTpkDoQLGSDPLkACvCmuws2hJNkcXyewH16wHW8nHkF7gj1eB8l+GjSVRuGhvL9cJoK/ZgvM8jYFpWdF46xp8KMazEF4D/U7JrrdUP6EtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0TsWHir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OklFSOD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0TsWHir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OklFSOD4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z3pe1162212
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDfCMBzk5C/jCeqMsCboIT1j7/GdYpI29hLh3WDtNcE=; b=a0TsWHirCjDXGyef
	V3GM9vQm1eIzE4MGCzz1A9VLNAq7STEJcVHMmJlEs8lqdXwtBZWJtDAgbH+9w+7d
	6RGLFIqGRvtvqBLu4ZQLMT3eI9mtbHZurGW6X2E58y1ryqgqTEdE/TTyxwZrg45K
	rDrBN6NSa7cK0E8MYc4sUX2+QSPDrVphg877wc9sAlyx+PGENncNvvPKZcPvob+o
	fwXMVoZ5iNa9FW3VJvjKmkl2jfubvyNLI6587SpD0pEN7SX6zgz2AEXmL/apwMyB
	ox3ZXQHLirppJqECttDlEg8GYxa0Defhlmk7jp/806cdit29eCK09aZgqcbIB7lU
	Gnfi5g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wrw8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3639082a12.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971650; x=1790576450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDfCMBzk5C/jCeqMsCboIT1j7/GdYpI29hLh3WDtNcE=;
        b=OklFSOD4szqiEnUtqy5tww4dgrUUvRy2C5rZ2lNFdYG6WWsEVeOhho4xYE4Owuqjvj
         h1BZ4CvpSTs+S3KC4sj7x2gmlWo0CQzkonRSsRPCg9BmX8vZWMH/qRY3uc2wZCsIfHhl
         qO8v63lvrxBTRxtqrNPFL5LGzBYWNQTNg2W+RB+sV0bUBGpUjexQVlDyH9Ul6zFJS/vl
         uhCGduVXgLfnfnAS6kWI56wMmXNB42S1H3igLFBBZSz9c22CSoEKbkP4PiAWXuCpuJ2s
         Z92GpXpzx11ki9PFNYT/GzZz+3TO+OeoEhRsoDt/Uk2Od+HXdFo12SW3kgoMPqMVvQT6
         qouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971650; x=1790576450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDfCMBzk5C/jCeqMsCboIT1j7/GdYpI29hLh3WDtNcE=;
        b=hFWqVZZLKIW/prt2WNNBiVP03yEb43UsJdkaSJRK5kvDQxxO3GOOSooj30/FF6mkLa
         C8NYj8MuH9P8giYDlGVjNa0WEvftRZvW4A0GNncWzRet2ICnD2O2YyvyBd/2AB5ivwu2
         vZ8gvNTvRgzTotfEtsxDqj13UmylxbOJgDUilTAnieEy67BcOh5uu81g9R69palXT8OP
         5Tr5ivjSG/7pmMsloirenPO3wo6oxfz8LwoGiA2b5/5lUHCyzvRMHbQIEmk8BNySvWkw
         Nh9yZftmr4qyrri24LqboR9Pfnu3gJ9O2IJIapU+x9P34QCmYJcPAdCLEEJEZA+/UZ3C
         hEDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0N0yB44bv0HGYRBuY8APJ011oYlsL3pNUxro3+p2W4kMHFdpfcmYCvlRzafkIi6V1OxoQJ96LPga2@vger.kernel.org
X-Gm-Message-State: AFuF++k00smJtsaFv+kn4+e1zj7S9QYDn5BMybOzIak80Sw+/ghjZ75i
	zX1lpT4ua/LcCORGg4XKHCZvqjQMNK0fChYOYvkgoZBWj1e4UcduRxeTiJnlVIs9Bu+jTxQg/nK
	U23LFrD1aP3H5DQa5ygfyMCcyhr5zihwyJdfJ30hKyts2014Q78ZB8s/8PtRHnQLW
X-Gm-Gg: AYBFou2u87gSRDtvEdWdnb1Z1GxmnpBFT1WLTpKWEqEZ/JAho2KlPuE30zBqPUTdKLc
	2Q7Bi8JYjcK2RPXALC/Cr+kv9EjfPUcNZS3ltQq7BRz8fRAAUSrsUC448Ih4gWaVrryA8JcrhID
	NGFZq/2ZNAaeGjtOHuOh5a+2B0Hv/hyip49x4femsolO1xV9srR6BIXr+aAdncaCkylrhw8pBiV
	fEGTxNgkrdXI8tPD1s1cCN2f5MrDswqJvAyYK0G4p9NEuSoABGAF6BjQbdwoJgJkCei4H1TkRhy
	5njRGR63ZMCMaUHW2t12OmeV01xytFm6Q3CzangASRIhcWkFZ1x94YoAjxQzb72i0bZK/e+8dlt
	eFkUFgq4wm7+9gcHP2uXSOPOWoU/yNO2znSpbqsohrPulr3ZRXkdbfA+U5/Gv7pKNrO+dOxGnHp
	hPJp3F1vZ+eBnLuaRNGDmqhe9B8CxeEor0GA==
X-Received: by 2002:a05:6a21:918c:b0:3dd:85a8:cb7e with SMTP id adf61e73a8af0-3dd8c4c8cdemr16602882637.33.1789971650130;
        Sun, 20 Sep 2026 23:20:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3dd:85a8:cb7e with SMTP id adf61e73a8af0-3dd8c4c8cdemr16602851637.33.1789971649712;
        Sun, 20 Sep 2026 23:20:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:49 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:42 +0530
Subject: [PATCH 09/11] arm64: dts: qcom: ipq5424: Wire up PPE clock to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-9-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX4QPUzoZA2g0U
 MCp6gWxqUnRNDtS/jhd+H2CmlD2TftiZH/fdO/wtPL1205990QI1o+YFLDv8zR8Bbg2H3qJ4e+s
 6Y8z4OOGxkLD75lqP1FUYgOGkEOk+mi27iE2UQ2IbgFRjoFmitAiGbOXqVLKFfVM/HHKWpRMa6a
 8QN0uVETK1x2mXSeV5a+CILSLsEWOHr/VeHWhKfUJf50n794mtzWLMWZoTdlFisXlwNtH2O3aW7
 wEDvDGqwZIJKKJ+EJgCclLeHsDaHVRZQZmTg737/9Q0Esa16iMf8e1y/ilCTPN/j3YaeYk7gbwc
 aSWDr6oHEG2hzaVnDZKnzOClZd4hulrNOxg9E1E631EfLcCNYXNrYK9pKve38wMe9X3YP+nydvp
 4iRKWNw8F6sV8cOeaUfJ8W8friJlBCh4DEdIVcvnqSsnsbmcmJ34cK6z+sJwPwFazxCoxMJlGnN
 Hs4TKAjegD3UgkveBeg==
X-Proofpoint-ORIG-GUID: UX_cFsHaT6l6xgrjsXU2bwDUNH2BorRO
X-Proofpoint-GUID: UX_cFsHaT6l6xgrjsXU2bwDUNH2BorRO
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0ccc2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=W7I2jtZzSWFJvz47EOMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX1ife33iDShvd
 Kh3AnIJfggaNCI5bx9eY5WnrQmvNKEUGw0Jbx7/0PTtdlyG/7lwzrjCFVDVJmjfYu7NUnm3bCVy
 gxWvuiKOiqOK62vk0o2Y+SfEZISHcwU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Add the PPE 375 MHz clock generated by the CMN PLL to the GCC clock
controller inputs. GCC uses this clock as the source for the NSS
MEMNOC clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 95e2508ac145..64a06d615d61 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,7 +486,8 @@ gcc: clock-controller@1800000 {
 				 <&pcie1_phy>,
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
-				 <&ssphy_0>;
+				 <&ssphy_0>,
+				 <&cmn_pll IPQ5424_PPE_375MHZ_CLK>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;

-- 
2.34.1


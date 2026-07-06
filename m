Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82142CAFF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330805; cv=none; b=ClqU4u/bw9r8uJk3cGvatg2+Yxwv5UyCEKEYHD8mS8pJcEqUhQSY4lBS/fSgunwYXYGJ6u1yEqHmVEidaZEgC5wnJAIXQnGhonRu9vjrYvPLVHIGSeRj8KNkENfT+xSq8fmlXuahqPfyGqOmS9IL9kwZ5A24dEdzyMc07/A+itg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330805; c=relaxed/simple;
	bh=3rNwBRoulhXxOAock65faJUYqxy2hdNW/9W0jOD+wgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBmmB76qtbd7OjrGwKdTNyo08fZ2DjFaFEDOvA4tidm5GKl1Svs1ZG3aPujQoHYmqUGW7TpIKDnPU/xPIEqLL9ejrWq86uR7aw1eTfc8/ga+ybB1O0OngOPhZ8OBKolCjCsHX4/5ZthJYuNY0BDaALOPj4YxdKv2laPyc83VYwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYKSATzg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjB2pIy9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYKSATzg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjB2pIy9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694Ja24180069
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqzO794fhsM4zGloJggiPWJBXXiAi6DVnIxpaUFj9cI=; b=VYKSATzgPyetdPUP
	2AWvZXTFPN9lxxD7a+QDbXPygZIfHXChYCR2jU6UkqHgWk0XsSrtbU5827ksCj4K
	jfIXhbNQl2OYGZ6wDGXCGUWKEFqikUOUdf1ovtmrxmDUc+x/6WNoyUmCBLJfx6gN
	v/kU4CEATe56o5sJu1h93knfl/V/9h5qlMfL/4vYM4ZdcY2FS2Zcr1V0/84bbt0J
	CPg943wGTMSWS0ASxp5XaVT7xRHFUt+565rUwFh+EfoylB+5zFKenex1Km9PaPOo
	pWyRVdn6yTsa4rfjuvdsglRVDlI8jRtYwLR6afG7zzN+q8nOK65ewWlLwLMIrka9
	ROhuyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txenegy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:39:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so291923885a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330798; x=1783935598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqzO794fhsM4zGloJggiPWJBXXiAi6DVnIxpaUFj9cI=;
        b=FjB2pIy9HrrJarf6QmHCQV8G/zO3xwznXk7Qt+jfwwytz+JClTn9G5WlFZ5aIVJHYH
         Cve6L2RleLoYV/3HkdZ0fXUjriA4t1OJ7anmL7YIEl12Qm8Uv/fuF66Ml6y6atb8Soiv
         5iRnK3TgTOCXvWgcFGsnraP1L2LIgGOwaaKCSjz7ibKN9d8YBeihPUygummD2rashLNK
         Y4xV+jQwUZmn/BqqhwwpfLaeustkBd4P0pmmVivFJo7PBqvcNB1zx4aOE+joIAENdqvB
         FkUTr76QdqJyxTPRLHrVpb7hdvo7Yd0CLovC03fCkifpCIBM0dYkNgvHyiQ9+tMI3XBJ
         Y3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330798; x=1783935598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JqzO794fhsM4zGloJggiPWJBXXiAi6DVnIxpaUFj9cI=;
        b=sRVqkyh/UbGwRntyqXE9ajdHl/NRz66e6RR/NTl6Yrid/Fxiy9Gw+nHMP8miUnAyQT
         NuM8/btsF767SEZWr2iVN3iX8f3/wJtNMp0iV0aXCBBPK8RAtb6U3dFS4dtRw+wVAquU
         AeRVIuggADCUi48QaeiGNlDrd9PHQi+X1Z5o90DuOYkl6nmraBG5khothIaG0cupfN/7
         mN9HPrXVbkBTJ1WF/N8k9ZyRGAi1BLilC0wFnUHieiK1nf9jSgN0lyZEOYdDRHVDAmrr
         QlSHlO5+bTTq4M8r8fImvvqF7nhFCyFrScjBWCxCfIYqFEw8I0ER2bMpw+icxC85HYzY
         KOdg==
X-Forwarded-Encrypted: i=1; AHgh+RqjwmaoebPghpZ62EavyNwZ2fiN7j/XjEEejZZ9ze4Y+1HkJcKlNyKbgd3b6z5FEeL6yfMqEjNX+gR8@vger.kernel.org
X-Gm-Message-State: AOJu0YzTEkZqSqpsFmWBMmLV4iiiQPtffdRENPaY98O4H7AIp6HPdh57
	l8NmBAo4vs/3x9qOqFc2dXCLkmJ99j13lO2flhZWiTi9o1TRR8pU8jxYW5/cld2cl69OK7tdbQ0
	43COloG14asaa5fhbi0pC94ooNgnz3i7E5wDzHnCTtlfDW+nggPCR3a9arqeSMOph
X-Gm-Gg: AfdE7cldjRo6rvwBLIEh+Qm9U8O8T0tHVomQJ5Ec6ZTI2M9Dnq8IEfx+1mUo9ZM07y9
	iMcca38P6hDtMkq4xBlwzAB1II5hsDgWqOqJVlFkU3mkVaQyeMIk+8Sd5cXOScWDKVSm5yu3y8e
	mJzmBZxHLva3CLCulZf7KhYgUhh0gfOBuQHdDKGKTonpq2BsnTAzjOVTNTOBlV8GtbBzosn3cFE
	hNKnf2Cn1QZnSRbdZlX5F0R2oN3BUJ3NdMw/Ic3eRP887dDEfYajFA/J24aRP6uUqehJB8BPHK9
	H7g3AQKtZXHyMoo038sT/nb3SErmaM6mHIpdzUNGgt9RrJP8O4QTgoDfZ8iDPKfKWT8NhTiY0CR
	2HYg1atpt+xnyPi74apJXJnjt1SRG/k0V8Kk=
X-Received: by 2002:a05:620a:1729:b0:914:d65e:4660 with SMTP id af79cd13be357-92e8b5c9534mr1710268985a.42.1783330798015;
        Mon, 06 Jul 2026 02:39:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:914:d65e:4660 with SMTP id af79cd13be357-92e8b5c9534mr1710266385a.42.1783330797449;
        Mon, 06 Jul 2026 02:39:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:45 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: Use tab for indentation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-2-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5745;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3rNwBRoulhXxOAock65faJUYqxy2hdNW/9W0jOD+wgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3flFH2mC2EzvJihJUIFT3MtQw4pWau/Tjl+M
 WFi4k+6XcWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35QAKCRDBN2bmhouD
 18xbD/sHOhziLKI1fGZvFLqZwY01cmxb3a4VDeYX4FGONMk8X0tbjQO//K5Qv9vQDhUfhp8Nu1m
 HLzzPWy74SGt8zR85Xp5qvI8f6ziovIuBEdSDxB+QSGeqT0HmPB3mbN3YftdIXJh6WGGFJOcvb/
 yAfW9JxBBosSmstLupgKwK0lwcltaalv5kfUPB091n5Qw11epKjix+lmb0b2O4cM1FogtyXJfnC
 1OZjZ5M8Og6bJig7w+6fMoQcyRsZr4bo8fyi/FKfO6NqJc6mswqbDuemjl3FY/vFLALfNmWs7V+
 wgtfQtQqPNn7ILa2p+yhMu9QauG1N6nmkKpv4u6VguSK2DnLXMUfDxZRegagTo46xprNjXYodFx
 rLmv6s5Pt+5NWE9PEJA7EHvU3qpDbfTt31pQBHaLvNQBLEzpok17CDNScjrrCR5Sjl+OzQ+ayUB
 wtxEJ0XRL/7heSvQRZl/59iHE/Um3x9Uvg2Pz6cjJrpHSAGRAfikR9xsghKSNVqDz6/vS8Ezihu
 KK/xClVhzcTVy8g9+zHSR5T6VUR9IRXOzMi6xngUbpLjvpMSDLJzqB8zlGlhtFxA7zcXOxXOYUF
 YbX+zaBLN+uHKlh6eCEdjBRFIrI0dkmay+NojLMHqkkel5bU48hzxVSx68DChHUgIB867p2drtj
 pHMlBrYVKHUf4eQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXyhmTAD6Zb9JW
 UFEhwGVeZdj/iiJprpGszUcstEJRPZ62oGzZqr6uXbjy0rNfgBzWm4csKmHDqoGDIUXgw2yEKdO
 wa2oO6KBrN1U5id4ehoTdkT31as05DI=
X-Proofpoint-GUID: W5IbfGGtMIKoRu9oxTnqPjg9n2xRQSjM
X-Proofpoint-ORIG-GUID: W5IbfGGtMIKoRu9oxTnqPjg9n2xRQSjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXwSTrbbE56o8k
 PLr7tuBvPgmq3/VHFnRvGtogSGVMGpio6s7CVAxNK3XwDg4fB14T+to8SxiFjGw0GWljiQm04wX
 Qe0TqFW0u20nOtMk6FIquCWf1RRM5T5DgQCCZXvSmLl5MEqjf3/fmz3qjcEFIOB0qWITAHu2dlv
 vCDvCxc5T9/uNmFlp63hWro2z02B23mD7dX/phw6lohKzv/E3C3Geq2dfWjX89+oeKIYkXi5Udn
 aur82PL3kea33QVvvIWIoTMeIfmYeOwtEGq8WGu8BB53Fg8HsUb+vXMKzpqsKoV15hpp7tje0dk
 PoQsdf6SxzhiMd2T9r+gW/O1sCg+FNuxLI1+y3j0cmt/lXE5m1l4kianikinjkAoxceac1AeqGq
 JdHQEPfTdu/eHstp7swj/AjlM1IxFmYQ/v1H+mHDQV21pMr00JWpdZVGdAbNG9CuA05+w4SUMBc
 qavwODuKfKdy2WsMDuA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b77ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rVvbQ8FmIT8hJgtOq_8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097

Correct mix of tabs+spaces into proper tab indented lines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |  4 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 12 ++--
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 4 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
index a82c26b7eae8..9872d5cb83bd 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
@@ -4,5 +4,5 @@
 /plugin/;
 
 &usb {
-         dr_mode = "host";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
index c314cd6dd484..f5e6021a3354 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -60,7 +60,7 @@ ov9282_ep: endpoint {
 				link-frequencies = /bits/ 64 <400000000>;
 				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
-                        };
-                };
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..71a70d051283 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2085,12 +2085,12 @@ aggre2_noc: interconnect@1700000 {
 		};
 
 		cambistmclkcc: clock-controller@1760000 {
-		       compatible = "qcom,sm8750-cambistmclkcc";
-		       reg = <0x0 0x1760000 0x0 0x6000>;
-		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
-				<&bi_tcxo_div2>,
-				<&bi_tcxo_ao_div2>,
-				<&sleep_clk>;
+			compatible = "qcom,sm8750-cambistmclkcc";
+			reg = <0x0 0x1760000 0x0 0x6000>;
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MX>;
 			required-opps = <&rpmhpd_opp_low_svs>,
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..b2f9e50ea5a0 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -50,10 +50,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_0: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -75,10 +75,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_100: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -100,10 +100,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_200: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -125,10 +125,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_300: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -150,10 +150,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_400: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -175,10 +175,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_500: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -201,10 +201,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_600: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -226,10 +226,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_700: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 

-- 
2.53.0


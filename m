Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707292C027C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321431; cv=none; b=lZNGahYPxsKHla7/nQzAEoZsnSxbRoP390XFcX8C09OTTvfPX3R5drNOqQ2uLfIa54+Go9/Z2oD7vTi3OpLa3Ec0gPf07XeuExOEN/mnytMA/441pCwiC6Iu/bomXS5L/0uWphpG7L5l8Ggb/OKVNKT94/AIKMjr/iECv9ZcULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321431; c=relaxed/simple;
	bh=90fy9d5GmTVZz/v6mrbM1M6AFz/uQWJQD+G7gHwuUVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEZ9KCSCtcUqbkpClQYYbaMLuyHbTe1+cEIP4vhAeNfVslbS1RoP+nWr576E7oPjqhkY5mGHZFvI8gHPmoEbQ7ZeM+tjb6PQyNVT+Y99AW8DkJntCTVItpDh8oJR1X7W2ixnu8ihe+BqseX38+sn5cKD3xWpRWdtbv+RIbq5doY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFECnX15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FbbWsSPn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFECnX15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FbbWsSPn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Tk93615451
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0gTvHMfY+WcSALPHH8RP6TsH7RZoKoZ3rhMDNn8rAI=; b=mFECnX15C7sNULUx
	+s0LbOTgTPYT3AyAmBd2BeedsVuAbvzRKm9wGYCTNgZTrwd5i+TjAsCZy3aJMmbc
	FGnZo+Ty5boCaI85NmffaktdMucPZJh3TMp6SFZS/IbX7c1aI5o8RkgoJ1XXj8/J
	97e2hDY5tbldiGt5mxbrtHQKLkaZfeuX6ZT08fXMHsjAO7iCC6J3/NaJAHdUFuRr
	7iNPoPIPo7lwixsjC37BXv062A4Lx5dfEbhwyEiiyZOPG5/P82SzgrnJNRthLf+H
	nlIY4HMZkozEKcPdkxBt+REDkW0Bd14liLaRA+hj5D8pc4pq3rTOZMk61eBXwOp3
	Q1Vi+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cx59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:03:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so273012585a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321423; x=1783926223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0gTvHMfY+WcSALPHH8RP6TsH7RZoKoZ3rhMDNn8rAI=;
        b=FbbWsSPnksPlkrAsL69rf8rClwQ9OW9sDNcPQaX1wHXRRH6KK5q9CPY6bwpmtaU8fr
         2eyLaPDBuBBHk7Z3gGrsSmUF4Z7OgMyEsXhRy2NmPJ7gBoak+VysAJypfchozCjdyQJi
         vluavoN2/dVYfYnODKD8QSV0llo8zh2tlSTrey5gQko34uaTF4N/mDR7IsF0/+pMRJ96
         /RuMOWUbcOScnHk+dFyW8xzLXpgWcSL8gfNGdmqpwhQfuI41esiL9zgocRzhhlsOYWM8
         8nGbILG41nHKolDhjFLQOzuvYJmBs8RcAHhmKNSkbFeuJP/SW625CHWyxFaNQmUlnxHq
         QiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321423; x=1783926223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0gTvHMfY+WcSALPHH8RP6TsH7RZoKoZ3rhMDNn8rAI=;
        b=hqSraDAOoB8Wy9z9pAeCX00EJKP8cJzJ13wAt69HPhvThwnGRdVF8AgqlwjAN+hJTV
         UBqWPOedB2EAt/zw8/azoPmJrDYMGROD9iKk3216Xv2qEGCbOrC/U/LefD/htgXDE8XW
         o2lo3PxXCHVjLWW97p1NGsrkXy/5PN6vDvL2Pay8wIHK8IY2wzWOK1fo9o26Ni3rJIZp
         z25mSIKY1F4lXvh2kTOkaBDzKlAerFPnGhYgdvde0P4uPa97g7ZNlo3zyKf3pP92JnSX
         SLS0dl+hkdvaBjCdt/xJMcEeUimtO/0X8JTtcX3LOuP2kb2OrDRC8jSesqAayfvcy1El
         XdXw==
X-Forwarded-Encrypted: i=1; AHgh+RpYxf425Ph1F0ZZBN2bdq4G923XH2xJGHY6gBTabPbXKa/2yNr5PqnHa730+QTFhs+cBPxefVpAot0M@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDbY4s2xJjKxebvEtZfXwkR2i8YVHQOYGtdqpUUaasMoiHG+b
	PBYIne47cUYhPCmViBibVqsVzsFieJZCXeK6OE73bkTQx0ZZU3F+709P/Iadpb02foZJ0YGsZzZ
	zXRyBu+ZU8L+sjE97UJa1j4COrUjGb7o0uV0ls+mvuT6Qd27RQOMiMrQDltyDYMTO
X-Gm-Gg: AfdE7cktu7UfnzsHaKOkLp+QpNb8aBnb0Q1PXWGUrJRv7I9rw/yCoInLErtozeaMZ+C
	aumv7qgO2NEUmtkCbjaSrBJEtr+XIOLMj8mdN6jaMpmxC7aqQ2k+t/aC7JNXU6oj8Fb4lq+TOE+
	jny4WyqopRGOs80OXCzDRfEFGvEn8qTgirVWi77oioDcfWnkSLvVd0nV/Gu5uoTpZpxWUflaPBy
	MQk3cpy42L41S9S07BAQkEDJFTZvI0g4KpxejlB5yOe+sgBfec+uFgN4asHyjwEzyjwCsdRRDqu
	NuKb9Q4hTzZnnoSMRKTDLriP85j1F7VTyl+T6AwPm2DzPTndV+7JJpb3eUGLNXZKc+fXnQv9p2m
	QLuwkh3rrT0ITVVOd0UQuzsR2R4r+6rHVLSU=
X-Received: by 2002:a05:620a:470b:b0:92a:1b20:fe0c with SMTP id af79cd13be357-92e9a37aa92mr1206541385a.17.1783321423364;
        Mon, 06 Jul 2026 00:03:43 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:92a:1b20:fe0c with SMTP id af79cd13be357-92e9a37aa92mr1206537885a.17.1783321422875;
        Mon, 06 Jul 2026 00:03:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:27 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: Use tab for indentation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-2-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5147;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=90fy9d5GmTVZz/v6mrbM1M6AFz/uQWJQD+G7gHwuUVw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NFDl+jVTDM50cAxTn2byPGBYDTVs/ukrkES
 oBrvo0xXuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRQAKCRDBN2bmhouD
 1zTvD/9C2xqlWIl0sypFT9GbyAa0oHEAL4nCl+FOb72z634bzTB+Wkg9PDL2P3k8Fk02s2/8asL
 v2exJk6oA7H/PI0tDD3raGPvP8mfUjt0Ib1fIfGOrAM4pCC9gEkx1E+91GgERgi5mvf+vbXsc+/
 YY1DcLx74GbqJP3aKZC48dbSgFtGq6bDmbHM8Gcb0fFDuGWV0qpuq7jFTvGeF/ZHjIRk7fE/rgT
 GDHKl7fsZtaRmxkdhUKgkjb64Nne/rZcoywE9Vk8GwE7EFbmdy9fnvg+zp85UibiLPULpv9eAmg
 KEX0QQQ8ndK8IQ2JFVpwDMYZvFWxQXAgb3eEI7UhhNThFjDFZPpBhHz2ZbV8zGEr3J2FLKFiqQB
 C7W8g6MtM2H7W6/dZPn197RQesepgo1NFQKI12/8Aj71ycpls71l1xdum25bTrGyk6y61k5j8Gm
 E7zNPyY1paWQ5nkrEe81UFD0uH+QXk92LzL0DsRwgyA9okz6nLi5ATe22NIJvyU1M5Bd/6wHSUE
 n6fqascvd/K/wq0VTql9w8qs4htq/sksLOq6x987sjmFhZ7/RuLL0I8d63wuGhihruaDgCegqsz
 JPe/CwVntpk0gTRGrBbvyrrEUOR7SKwP4S7CHlOxOrQxPVo9z+CFH4xXknyrWWmrHUfgOmrP5rL
 r0JFtMKiyha2Y1A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX+pKOYfVRvrSE
 RQrUtqhiQYSf7zVgXaAuI9J6Mq+wSjDQdoKLEkYox/rZUaq/S8am/o7tt4jjIxrkJBfTjyRWHsi
 FwAdECq32qlxg2QZIGwjAVqB70Msl4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXyk9Y+IpZKd8k
 9mAwx1UWgePgfAWkiKbk7TRhwAWIKdD3GvuP3wVQJ1T/VwH+5ownvOw8Cu/BI1plmpKbA6dBcE5
 c+7bpjC66RwBIE0LYeXDr+fwYD3bG+ZUmMyaQAo7Ndb2MjZrXApsUd5Gv/wrG4Axd1gMsHi3ove
 oKJIL2fi+tKeAT93GJmGMW3E7lXhgwR12DDTreH4ZcizyfUnYWFI+pGNwUkJjVKFfse12UGf6YF
 ZS7kDCsmr01CjVJNic6/cKGuYL3mp0cKJ+FMuJ3HwPj9wqoc4Z3W7jiekboppp73fbOFL5NY+pB
 anQk1cTZCtNVeNsBc+YU9YquGpKnzUS0lZ46t38uk19ZFeHBA1Gs2CuM6DNX9Q643FyK3x4/lpp
 R995N+AZF8gAT0v/IXMKjapzKfPgO38TbGQeSVbQadMsI5eKMDBNWK+zpmLKDIjfatfvoewYAfV
 eTCZQkgSkE3qPfDvSGQ==
X-Proofpoint-GUID: lrSC2LrFF-JP0diTzdNGls9QAbgADFa8
X-Proofpoint-ORIG-GUID: lrSC2LrFF-JP0diTzdNGls9QAbgADFa8
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b5350 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GYmwv7oU9F7CniB60dAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069

Correct mix of tabs+spaces into proper tab indented lines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 12 ++--
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 3 files changed, 39 insertions(+), 39 deletions(-)

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


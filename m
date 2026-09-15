Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9423876A4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459884; cv=none; b=JbXeX0v0Zoei3Y77hnjtRRYkesebLrEEzioMf1klGcEudIwTmlUIDcTR119mFoisPGq8Mi6y78/5Mrwv/rLAgu3b90Zvzci1usowznhD5hCWwsDqwPX3tnOGQjDFnSmoIi3fG5ucLQ9T6sB65ILE098aYbbkyRt5Xbps3riF6wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459884; c=relaxed/simple;
	bh=7pNTV9aax7vqzihimp3MiGg3DmEEDdR6tA0nGA/y/KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXNMrdxSn7Xw2nzIPGV9v9GdHu0jkecbQmThploYoYoaoUTipp+hD2m/2hCze56wYRLUb8cqUV4Nu8Gq6avvHT9+XQ1t8vR5M4LgjBJ8asrgFaug8aMcijI93w0mJw1iHDFVPLi+jJ0a9N8rIKipbAWFPhnW6UzVQ/fdB5oXGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNZuoGfA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdF1kwXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNZuoGfA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdF1kwXt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F7WiwZ1790767
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=; b=gNZuoGfAwGyb5+nt
	MavO8VnWD1eQKafNVraT9Sy61YsAUM0tqNITdYZbFpBw5H7+x+fTMrkZeetVFJSB
	YGwSZEweMMVZY+L7zYd4RJeWAd6JBItzbwc9nnpK5+lnQzYa2HJN18hjOElXbnIy
	hqx1VPev6r4WPzNOHmXD9GDECkuVNzR7SamgYXkZHrI4mM1iXjSJH9UkqcIQyCsm
	loD6mWIhFgcU7S/mPWDFmPd3zW+BPuKb4zXrJk7/hAp6fkzc672VesNSG6EIqODE
	dsLNWcJaJky/xfvpgCZDZROUo5N5mdaj26jqw6TpOkeiG8kju6tpkweQy8TrC0ra
	ZqS5zg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp85h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso481362885a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459879; x=1790064679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=;
        b=JdF1kwXtCZGAlnthNbLAsenwpeER5PoZtxqnZ3kQUF65h1+OqCq63/4F1MuCBFJTh3
         VxC3byWHpLhT0MDDit/B0z8p8SDwxywQb9sBnzdm6TojKOlp27BGcx1zhTYnoSUYYQVr
         /Y24t9IrmOK5ME5znDwRhxrR6SXv1jyfRa2NnvzBZIutZEkldtcUdQj7NgBjR2TeHxWy
         wFTm826mqJWtPC13W0Ud+KMsQdo1N4XFBDfR1q7o9m0yS6oTf53/ESm7EiZCU1iafPaj
         sxTkwXd/8I7Ky58RF+IkYPO1cJoQfsSQarYeI1TuTiOKo/5kA25nUjqqGnJxMIq4QyeT
         qTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459879; x=1790064679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=;
        b=XTN7MKdwae8a/TWzcFOXCMBwsX3TLyPvnqeIp4cEmcn6/WJjyGNFEzmdOuaEOPaALG
         x1HKfb5zy5QTFXUNO1RWK5Gi+F/zG4G2CzD0sU1oWaGruooXO4+nGEDFry4zkWXlD01z
         /ELa8RGbRK+C11eI+36HM3W0OIxCn9/EHbqWrbAAv2iPISb8GPz59sOnU1RqRsszX5C5
         qK18QRNAR0OOMSagVWQ3NLrc7ju8PCLhPda3y63D2OM8yDiFyRLWQfJmS7Pluq6SByQc
         TK58tIkvxd3fjkuxgwD/1Ce3oY2cGOy4wlXVxdueYgzvn024/I4k+rs/NsL54//hLqxZ
         GoUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEPjUvH1vqUSWnCXvpQTwGT24zQPQkw5xEicq7lwlp5tauXZ4AlFboeuHti/aqMy+cCHSOWd+X6gK+@vger.kernel.org
X-Gm-Message-State: AFuF++ns6sn1LUfr3Qd8uQJ8Uj32X+6f5Oogxn/NoLpDcw5w4FiFmVkM
	YzvQQ80JTSOI9g+ApKvUlhbGrwsbcSYniVW7sNZqOQdXPJML3rhGteln2+vwIrHsu0XRN71ru29
	vpspAnWoy1P0WoKbJ983hKtUW75r/fZNiQsrcdroCZx+o4uNRgg58EGJ3gWmoWBDG
X-Gm-Gg: AYBFou2CNjBjGPsJ2w7Ks2oFMYAFmGUek9gic6clBDCTnhqqf7SQ2/ZLssqskF5s+Bg
	876qhqxaEv57ipJJxtJa8q8Iie220vOuaEQLESnG/7RBLPSdhyH6GryBYfcekwPczG3BzCWD7KK
	XIqOSR5xl28j/CwqlbxD/B+JPbVM8hTyMln6Z+h4W4zp97GzpafkLgnorJEM+pq25rS39GyOXxi
	3l0zH9V7XaNeRLZMO99fWqIW2xKZcY1+EsiB64JE9DA77GdQb7gSLiRFPjtQv5Bqg0utuTllAIj
	MESl85dJLMIk3oWM1rcIni81OjXNeolelE3u3Ih2YXGkUQ8QMRv1K7gB95t3rKZLPh6lgriAcR1
	G0aCS69QM6J8mHDxDEzDkzWeSEwweAWAMm7J/Xcz/VI+5aEe72YrpChd7jcg/yy6KSJA3gewy8H
	IbX9YDED9MSx9/446rTSTYibiD2PAjIg4gUZ2p4nOIhArMrg7pQMA=
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr917635585a.0.1789459879319;
        Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr917629785a.0.1789459878622;
        Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:11 +0200
Subject: [PATCH v7 8/9] arm64: dts: qcom: shikra: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX71u2/ZZDhWZQ
 javYZEAIYubzxm88UJVB90NkOBsfbelKm6J0UIFRT1nd9/uDrMGdnjkfyV549MwjejJEC1yjyda
 77dBcs4a4lrrK9kF/P/8RB2lF09EGFM=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa8fda8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: d14Z1XEKJcZpth3gp84vyAAZZIYRqr0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX72lYmsZ7tbY6
 qBGT/1FTvQ0W3pSWtG77Oma5390ZOW42XB9Xi5GnpVGlg43WQ8vCSQ2sQ7t3Ynd8CHLL/eYpfnA
 nCwrY+9A4gYwRX+NrVwFbr5gaxr3aj2pM5nH7lzwtfQemRLiLTM3LnSMywte6KKy4pR18+4+Gvh
 Sp31a1uv7daJ1tN9BJC7nXyFzV1zrLsnDeIrITjaqZTVK/dxaVqoxHmksQ8TrKk79eY8WbZ63/j
 lEZU49fFdW+L0q7GojEChaK9Xk0XWYSCFnKzDclw7WBSWM4gYD0zo2aw/W2KMItrjmQxkiXr3Qt
 OKy7rsS8L77011k0vEf/NBMJwJ+uCbbVSHtX04+07Sgsf/t6c3Br4RkY/7mzaBkr9hHoBs3MQkF
 rFoSw6WBt0ZHHw+DS8G7cN3aF9G2E0D/HpC0lRkrIAdExsX7gO5AOWwLMGNvpvgDR3Ukk1OsnnF
 bKCg6Qte1CQh7K94FRg==
X-Proofpoint-GUID: d14Z1XEKJcZpth3gp84vyAAZZIYRqr0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..5adc28e9aa64508366e6c7fdad191a152b8cb6dc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,83 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1


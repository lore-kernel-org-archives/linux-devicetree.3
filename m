Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994939;
	b=XaC4GwMbBLwBlQxEttumQBS90SmNnX6TsM6WTSB9vGqp/YPyznlAnpQXcFZFv9NvR7y9
	 fvwQeHOEnTpGjmEC5oErFr7r1KeJA554yWPfNCqM2DctAexNxl+sB2v9z8MJijuRPo5XY
	 3AlvX7vJFu8HBMFv+9ay8CItBeyZhKYpgL2/uGFDqdZQGBnPF4QUmSHUtCjFlJxC6mutf
	 z7J7xtSJuZr7HOtoxLp+DPgliMayKivz51lnF4iHPFH8Nrbg46+QeNPzZemV18WPFZK9i
	 CABY5scxkyqmDY/9/x56X7vxGzbcEeesiq10C2a06p/HnoDum6InXP88lXsVXfdjHjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
	b=dTBNWIlWMMHcPOS9vjqt39tpRavd3qb7BbFoB4A5AFa3f/eYDaG7909drybW29S4v4zp
	 SB2QoBZkHEpO1BarJC7gO4pMpZIy4g3Dj1omcwZabNtNbSZrg+YIPDOKLk3rjWsQlqUb3
	 KrLjzdTkwL/7mm0Dq8cdH2OVEJCt0eVx66GVnzJWuNFuY5ka21Uxn2YnOAA4tIAqSNfb8
	 WImNN05UGrLN7oqZurmK+4E+4Z9tt0cy8MafBBxq4RtnkD5rVGpQfHQwjssHBsd3I5Tn1
	 YoAp06smISMoHHHVyoPtMPU5tDm/5xBEk6qFbDCob/WPQn7svqMU5tM5LDgt8Ufnj9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHhu8p53;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBpu1MoA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D53606A337
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D53606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHhu8p53;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBpu1MoA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8J2pD2383039
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=; b=HHhu8p53OpsU45Ze
	WDb1GBUYM+QMjc27xIUrYs3uvY4b3syQCfU1Hez9vaxuyRahxXh2HBRGwbTUlaNp
	kxByh5ITk+qYIYeN0/jhCPw5rRWvVVXplq06S5XaxsfD/L3c7OgqW36nNRH6c4E0
	S054e59CDizCbWVpn0evsYq2uOvaXIPop9QTRMmj7dzqlTKgWvmZaJLeryDkf/4h
	209tPqnrDB+PRwHyvKdnYdih3d5UqL871NVjdlxaa/Jv9XKeGt0I0lLQybBsFfx+
	VLRWHoYPAQWR7eflx6lBnmMbVhCMAaceUpiy5xAgIQsNrHtatnZ2kqH3TO9SHZqA
	kDj6+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatd1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:42:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efa9aea3c0so10267845ad.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994937; x=1795599737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
        b=HBpu1MoA7ywDYLlI78PzR/jxD4DABYzR/HI3jF4k1brN6j+I/d+fDs/TkFk6mIg/P/
         Xlgaqg6QS5kPrPMVd9yFRUmK5pUPeS07fGKwQOjG6ofkkXtiytSAoZiJBN2O+DmpDcv0
         qrVsOzuld7r4FfEvrUi0cEE9dnDQoa55oVGTsJlThr6WJUOzcXrtiHv6fAkPFUAOy79j
         uAtnrZQGu8gwq4ElqfXUUwwNUvv8PTy0oB7yBT8oOV2pzi/XC0jEaIEw74oDSFQd/x0w
         7ThyjK2749nFbZFptNrVjYpMuclXYuvdzABzAf2u8Oxe4auGj6EKcrGlA3ortt102xVw
         c6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994937; x=1795599737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
        b=tfU+KU/ra35DSb4y/v9n4mJPL2VOpNb90RbhPAKrzjkF6VxSK55NxulJdTQ1pzJPuQ
         qkJe8TSu42Wn4wrCmSfs43+SpsaDcwh+/RogINhS1RaV08kSeRFTiKeFANrINChYkjSo
         9mlww8R7bQPQddriVOgzvDBB/TYm2MCD2HSlll6qutcfV8icHeqs5i4jrtIEa4oNmOmn
         tB15f7eh7rmqv7boMImdlANpBBghWxs5VzZ5xyMgdsQpwUgMbLjhVpjG+gB9hcmQGyuw
         ElPamkjfBQoMZLlZjcFK5yRp0G/NTThGT9kOK1gytOtUWEhln8719Cyd7hy5+QR4ZihU
         cZCA==
X-Forwarded-Encrypted: i=1; AL+hErFCjwA5IEEZPYJqGbf9mM6CjA6ddtyT15JHbhAMAOyPZxTF7r1Nudwyv2bquShX8HSvKX6GJ+2GlXLZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8+bIqx+/Nk3iV9slgd8IBPZok16PZ9IfeXNoVlIS8vxBO/HIkE
	kiZdQsnkQWOcWiSUJYpIZSvQMJi6DBtHddIQ44AmOz1T/mNx7mVF7xiJCdFVH9400CKl7ac0Djd
	KlgWNxvvlUt7icBktq9sIp5PSBvh2urjKmofusbKXr8Db+jmHAjaFN6W1wiPG6CfI
X-Gm-Gg: AZFdTZf4BUau1t9FxbUzkSe65r2i4ypWTk69+5R8rOEbieXwBr61FDTdBRzfs5sBmnW
	SdTJq449s/wsJDN8XcqZkxg8ZiOtePKkyOwUUX6kT4gzNtk6Vre2fIcxvrAwwBApJU/eeK1EoQq
	yKVwYrCZ4A20umavNfo2l0c7L9RB9gqJCmam0EpeG+a72jA2DZhHzPcoCBldkmvoVGBpOeoNjAz
	ClDJyawYKEcRYAysfUe8mhYiA/AlXNk6ZbQiJmoClmMYfz6TgQO7BctFw2cFZHkfyfF5/96PAeU
	cYVpR/CiuVuG2M/WYY8u45MDLTgDP+E1RqwUuhtwA8K58r0fNs1zmucPb065EwOy6yuW3VSOZ4+
	E1g7QwcHCdvBVa4TfrvZISmSHVhKoDp7PthtmrJ8vjOkTH7hkqA0o4V9KORqupQtlFoTuJoUeRN
	08nQrQx9yG9KwnZeiZTZj86NtjjuaG0t9OnXj7I1VenGikDnmu
X-Received: by 2002:a17:903:1103:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2eff75237cdmr22721335ad.29.1794994937199;
        Wed, 18 Nov 2026 01:42:17 -0800 (PST)
X-Received: by 2002:a17:903:1103:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2eff75237cdmr22721065ad.29.1794994936701;
        Wed, 18 Nov 2026 01:42:16 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:16 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:46 +0800
Subject: [PATCH v3 7/8] arm64: dts: qcom: hawi: add iris video codec node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-add_iris_for_hawi-v3-7-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=5591;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=/5TBRph59pKfD2h5WA8MEaXGCzAw8RfNm6eiz9WCDqs=;
 b=5Q6Csze5qHNPJCLZINFtw3XjUN5Q9Rvvgz2IuWkxC0KU9OOy8LaWTPuRIwZ7tJjYJhF/K6nNS
 CUowujj1AmAB6bg7gSRE+15l2SHNKXzPxVP+3frwmTEnAwGnmbhVKxJ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd72f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qJL271BKxqclmSQN1U8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: FcbWVz2JRf1Wufugouz26gtSOrgO2FAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX0yrqstRKNVeu
 aMmWdLahjQKfgaCaWp3pm5xs1RJ8HnEcj6dZE7qBW4rnLZfkO/5mxE1+P1o/k1SeDTXllCkDdg6
 USJrVnuf4WaNSrtgaTy47vQknPLOfO5B4cd5szPnHs700AuqJdZ4L7lOl1ZKtlyb23Wn6VZGoPm
 0TenYdkXa82A297305rYH1l4miph29PuE/FHlHuzVIjNYtMPt2yiHXr98lCSK3OSgoU2rJ2ei2F
 aLiw12IFMt4KSlfy1AkEtGZTSSNMmRGOo0boOYDZoRA9Ckw9SKm5HD9imRrzftt/u/V/qb7NuUH
 //eCVOw3XzQdPvG9pidEFuZfGlzW3CBqGznIi8QTfoCuMAVyJ0girLZrj+iSJboRsHIH38F+Prg
 E7+2y7Ujr/Qd1bhVgaL94WJLMkFsA431yOuAQHewAVU2yVSXSAV3Lf+QzDZx3Lx/788wL81BpoA
 QT7WdOqNzGpcDXpUSMQ==
X-Proofpoint-ORIG-GUID: FcbWVz2JRf1Wufugouz26gtSOrgO2FAo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX/mmVCdFhvO5r
 URe3lmwMftkIetTVDrAFVATMPONndYIqcYJ+zyidaYfQtWYZ0yXUjIuYQiEYuyyqR7CLuEjGGq7
 5CVSX15y3XOE530ptVIf6hP78LtjZfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Add the iris video codec device node for the hawi SoC, describing the
register space, interrupt, nine power domains (including the
VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
interconnect paths for CPU config and video memory bandwidth, IOMMU
mappings, and the operating point table covering 150 MHz through 1000 MHz.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 155 +++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf74a1471a8cd25102f777aeae32000..eb64d60b6fdd88381758ad5ff5b97fb5ab5d9dde 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3427,6 +3427,161 @@ ice: crypto@1d88000 {
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,hawi-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+					<&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+					<&videocc VIDEO_CC_MVS0A_GDSC>,
+					<&videocc VIDEO_CC_MM_INT_GDSC>,
+					<&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0",
+					     "vpp1",
+					     "apv",
+					     "mm-int",
+					     "cx-int";
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
+				 <&videocc VIDEO_CC_CX_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
+				 <&videocc VIDEO_CC_MVS0A_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>;
+			clock-names = "iface",
+				      "ifacec",
+				      "core",
+				      "core_freerun",
+				      "core_ctl_freerun",
+				      "core_debug",
+				      "cx_iface",
+				      "vcodec0_core",
+				      "vcodec_vpp0",
+				      "vcodec_vpp1",
+				      "vcodec_vpp0_vpp1_gating",
+				      "vcodec_apv",
+				      "vcodec_bse";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffc00000>;
+
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1540 0x0000>,
+					 <&apps_smmu 0x1620 0x0000>,
+					 <&apps_smmu 0x1544 0x0000>;
+				iommu-ranges = <0x32000000 0xcdc00000>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1543 0x0000>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000 150000000
+							    150000000 225000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d2>,
+							<&rpmhpd_opp_low_svs_d2>;
+				};
+
+				opp-285000000 {
+					opp-hz = /bits/ 64 <285000000 240000000
+							    240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs_d0>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000
+							    338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000
+							    420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000
+							    444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000 533000000
+							    533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000
+							    630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 710000000
+							    710000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 710000000
+							    850000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l3>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,hawi-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189933;
	b=PkTRkBeEPNR09grKNySfy5d6vJteP9v7jO4WOil2HVMy8eSml293jlHcgNZeD3pZiigT
	 m4rMtA/r4lFX5l4ZzFn8FGjkF4/4az0QkhBbhLejVN9z5v12G7WVvN8eLHQs4VVi5on61
	 lPsilceFMjxYVbWwVb+qkNf9c3acKj+8Q+6mI26lOFDPVabcljVHNOGs0b57hWzEMANpD
	 K7tl3L9VgSrr0Jb1hFC0+LDCp/9AoxfEy3k2V4RYn+fAoc+alKN7T6WEaCZ6aibhiaV3w
	 n9XJkrPJ8iOiCPx+6zUXN+3600uKdhPBxXnLkPZDedWwyUXpi6JeXkH6ppxvtUzaK1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
	b=Z9coU5GsLfbudTMpYTo95tMvuNj/P8aGE4AwJpMcPKHcDvzsM4Bb+mNpKqnwt8irrSUn
	 F4gVfQqlKaW619y+pvnEH0bwCk9l41JWxjxYLuU8LM3VwRv/p7ZMaaCyddiuQjgl6hEHo
	 yIknE6aJCa7NKZsuG3OamAIoqz9oapGLsvv+kgG7tl6Bugb8I0IhxFhkBIL5n9TDB2zy5
	 DFtnapo2Gff6rHFAf1g8gag7dosHugcN0itTxZ2fhhKcnjvPZnU8SN7Tp5Oznfkt2CviZ
	 GQ0xCXrCGc2Z7usJex1y/PR53Qmb9Oet2btWSRGuAfwwtERnOp1QaqCff8Wz2JUm0pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCtHKZ4y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SypPVcm3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF9606A325
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FF9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCtHKZ4y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SypPVcm3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxkH2082404
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67P
	nRsw31kY=; b=fCtHKZ4yGP77HrI1JydrJ30UEdt2FHwHOSUoAO7WCKAce6jnEeD
	T6EW1tD64Aa/Vg8abM1N3W3IfcVia79nr7R1k0Qmtsu3FIwRK8FTlgvy3xtgeBUZ
	Vxs6ROlBWJ2ePn9x/DAsZW20ifFWtcBMHMu/KsYHSV+J99J4AhJIvTnAOpe4n3ye
	a7sZtyKkNibMoJF1dsyB/1YF9q86dCjfXGbHPohEZveFlO2IqmushpCrrguxdkER
	nm9F38BoCsLU8kLRoL8zR6fwxxVueqUi8cF0Tz3YYYAt5Wox9UL4HZKcC6zlpSRm
	EH/q4t9niLeKFh1/Ty3WQsYUMqkEC4cKqQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpux4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:18:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so1408161eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793189929; x=1793794729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
        b=SypPVcm36JsNJNqEv+rxhxGd0bz9NGX96Jejuz+qBDx3KUDwcObyJ4H8W6uqUaIN+i
         mysfu9zxocVL9NvEV+fBCGX1VNN9eBqjA3YUzJkWWYp3PXfRASPhMZEPEyMGBeKKenAJ
         Wu8sekMnWW9GusYm1mgfK4rEi51VrfaV37EzjwwMvpM3jDmHiMONu/MAFfta+77oQXzu
         sISXZ8vlJeGBvaplhCZY2R34aQ11pyq+OYm+XYxXye5jcG23CkEjEgaqQJUVhW4mDQDp
         EfTmyUneyl63Ksh8Z5N9HuZnB6s+SNGl9TghwsaVdMnEkbYXWQBRS/PqfPDPpOXSXu4p
         LgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189929; x=1793794729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
        b=egphFbb9I5NnHB+drW6BzVtf03jGivpsAkWDOm9yI0u6gPjE+oj0SkXCZvxDwTRiLf
         6qWfHnV0TStcL25GxAhkGpbE9CX7NzG8r9FyKYH4uVqZu/MIkzr81X7Wg+Ppu6TktikK
         LxakwAJEf2oap57gEDmu7HP5u8AwuhQsZH9lb32phpqa0FLVYZ57tEwzuvoGeV/FYY9f
         RtrN/2WX3MSfzeF39DbHZlH/NgukLO92z471EU9E+LSTt9jo6oDDgs9mPBRLBYkifmJj
         PpcR+pAbiqq6aStxYtVL7djis4jR5N77el32H+d3z+Z9NK8wU10gV66RfbpXCp4FEypg
         VoQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxA0XyOnul0Kx/wrCCVN+buUhR1u1WyZEZUMdEclTImITOEar/lp7o7E9ci7GeHr+JncRlQOC/YUye@vger.kernel.org
X-Gm-Message-State: AFq9FYI0Gz09+K3ZRk/+/Rn1M4fgxQsmSfaqxfGVNFnpsr4QPktYql3F
	nl88IO2xJVdlEOeACSVmQTUW973iw/cM4xvV4am8MgvxYV497H3LVTRraZPawSPr3lRBaRBFpkK
	7c7hXM3JngjwhEDnuEvrg40PzM3jNX8PMoIACScZzz4+VAVgFFdnwSjv+nwUY0RQf
X-Gm-Gg: AYBFou0gyROSbEPhMthMKCY9EigJzTsgVxrfs6aCi1Vz6nzoymchmT8i9o1RZPlelJs
	qW1YSf4REevD2Zuy5YFYnmBr7fGMtZQ6rtw7KpdWgofJtGAjB4uICW/3J8DmUS/De6PeFLqF4jl
	CXKu+2/iYlK6UjaI7XFAciEBp8KHjXGd9/FfinGFJXPytEsqVCIu7HbEdFoBCHD85OJOS9PebaT
	8M2Z5aWzWP1sOF2OQnKiizjyvs5WVM7qXBTiyaQUTQ85Nozad6GnGT4u7vJ7zn95AstLkNRxGkm
	jZuKzLN9OqaCk0V87X7cCZmVc0TyFCNYBYMgEDBmvXi3pAu+U0qF6MG+HeMMJRQFOzeq0f+u+hS
	jrrjrj3P2GcPUO/DP2ZRVPrGkf13mkU5wzwOS6D82z2+Kqwno/LjemlK0ueNTV4HQK293UclO/U
	0RFEoMYocE
X-Received: by 2002:a05:7022:f50f:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1a6c9cda82bmr3203064c88.2.1793189928622;
        Wed, 28 Oct 2026 05:18:48 -0700 (PDT)
X-Received: by 2002:a05:7022:f50f:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1a6c9cda82bmr3203036c88.2.1793189928006;
        Wed, 28 Oct 2026 05:18:48 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm5056143c88.0.2026.10.28.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:18:47 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: talos-lyra-evk: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Wed, 28 Oct 2026 17:48:40 +0530
Message-Id: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OCBTYWx0ZWRfX6CJIV+00mfPb
 lPlMrQ4/TOLEIkBrQOWrhkShlGSE/W9o0rLlzzf88QWKzMaDPuTXCDuKsbp4YwU6FCVpHh4+tBF
 CWkLCb9r4XrWFqAxi8O8JqFid2V5fEQ2Bf4qy7akp54mrnqc3kj3b2SKZcIHCDWjaU+fNKp11gL
 pH2Em0cJGB0PhBZLMkqQ01mDdBDRQ54Jdl9vDBec1TPLiisean43d0OviUdoNzpeJaM1vVwYXzP
 PnJ8izJu88VtumirgcEeGOpnDEGY0Oasr3IFTwFR3x83wl5bLBoQVFK7zvfluM7MDUKhpu60fWP
 91t6X7GEi+fStoyrFqzgm+PTrGDoZCoz2bidGettOIDi4GGusL07gNdzR0kiKqxY0y/JsZjEu/y
 sOoC98Zz+qijRI68+khBOvcMkgAgEKeKqd2S4R1MvRN684StWH5aKTflXbnIRvN+EPHepuUci8p
 nnXH/yKY2IDTbc8hBmw==
X-Proofpoint-ORIG-GUID: 2gok-Xskmu2OVQdgPrgD3I0iMecd5XVm
X-Proofpoint-GUID: 2gok-Xskmu2OVQdgPrgD3I0iMecd5XVm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OCBTYWx0ZWRfX7kw1b9oHJsN0
 Y6UQ58AFZrjco+Qng21Xge0WM5nMwvJnsoBlJ6DGtEBFa2CKz3QfAtF4IPxMTh3GwsrQqcoSWgC
 REHnMTSUV2NL7TVHuomkMnTrsQ41xB0=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1e82b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GflR9JRM7eMrpslxb7IA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280048

SD card is detected as SDHS instead of UHS-I because sdhc_2 was
configured with vreg_s4a as vqmmc-supply, which cannot switch between
1.8V and 3.3V.

Switch vqmmc-supply to vreg_l2a and update its voltage range to
1800000-2960000 uV to enable proper UHS-I signaling.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

This patch depends on base series -
https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..65a2ca78106d 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -57,8 +57,8 @@ vreg_l1a: ldo1 {
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
@@ -224,7 +224,7 @@ &sdhc_2 {
 	bus-width = <4>;
 	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l10a>;
-	vqmmc-supply = <&vreg_s4a>;
+	vqmmc-supply = <&vreg_l2a>;
 
 	status = "okay";
 };
-- 
2.34.1


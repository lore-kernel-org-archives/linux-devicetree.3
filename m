Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91C343E4B0
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513775; cv=none; b=Wu1FTGgu5fC6joGppunc4HINnuALd/inKhdSkBYfRbE+O0hEelnSnRsQ+8oM1WYyhDg68I5I8sZDz1TEHIBIrRo0DUqCdVGC+0ey94jiH+1mu9bYaTPqsRuoLdXh00gNKdS1Xxrq/8HDuXdm7FXZlxhPytl2Zvaq43rCTUhoQPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513775; c=relaxed/simple;
	bh=pp/L8Sf3IhLbqrj0rhfeWuCiCjveSBpiepJjuAghGjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DYirBdBZUJSMfUO8FCWTd7vT1/ntv+LZCUTrYG5bdsIqZVICthaBXcqrDdn0k26OX1MUUe1JLPo6cp0GAehfDeiODBGq3xCgkq/v/JmPALIjBXGMlxPX/LmwHPWKsSzGGmpYm9zKFEp3bzGUjNpSuC+iHt/Kuku7DJIUNuS56Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqN+C/W8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsSWXz3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqN+C/W8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsSWXz3j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C47h52760271
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GJAkBWE5eBPw3nBfgXDI9r
	LQQiuebE+pFX7Y+sTNVkw=; b=CqN+C/W8DFUBnn3ceA+FxOQmJnFwfq4Z9RK9vE
	xrg7cbKnAB4wTyPUlzb0WHre1K2/eQmpz8yoPOKrRI4Rh/IqEWmsrcHzEHmZRNb8
	1Bq39mFfqHxYq415B/vasDgmrenKl1c2C9LpdPK0GRyYCTvReQNqNXhJvB/jYuMz
	C4im/l+jvhAh5UVvny6q7LeSA/UvyOFUEyg7qx6aC7ggYoOwhD8+2KYPB0znAeYi
	55P44BmP94KRFw/oOKG08/SFAQTPqp2nQ0bKLG6t1jaKlapG3tzlrCfULD/9jeto
	2mveuK4IPE6cRmY8Ba06kyyAuQH4WtIGxl0HuGfbAOaakyDw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5vcv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:29:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so8498496d6.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513772; x=1784118572; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJAkBWE5eBPw3nBfgXDI9rLQQiuebE+pFX7Y+sTNVkw=;
        b=fsSWXz3jIyfhqDcH4f6Del9Ab41/ROQBxzFePvmmv+8ZLwZ1yMpWKm2DmeTX+91reY
         I1jDnU5M3e3CFAOp/fy8LMMx/tj435bi2irKlxMJ13egKkf5CXp6V9pBm+QcRXjd4W9K
         Y8XcP6enC6k9Nplxmb2Uz94u990NDGbPSjZ/z6BBsgiRX4caO7P2uMbUpj4zWFZqUmd3
         36JuT7bFZVzMJJni1KVS0QCBB1vH/rMBu07dVMWf/0JK0Tguw6RG7p2SxEccfd8n/Rvt
         SGEohLDkoVs5zfh9cpKXpW/CdBJKkyzddQa4RM1QH1xOxm1xswEsjUDwJQ9J8dcLXOmh
         +PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513772; x=1784118572;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJAkBWE5eBPw3nBfgXDI9rLQQiuebE+pFX7Y+sTNVkw=;
        b=bckpdY3LMnjt5T/RVtGjwaEukue0hRe+3U6x88KimtHwl0rRlF92S0OlF18OQIjaMr
         Qlr0jN7T6BBDsRi1Yl71Xrmv7KprzmsoXeHG+Yts0UfdgrMkH2M+k8aSQ3EpdKgUfb8Z
         lukwWDC+whlhsR70qcptoFv3mHrFTYFLgGvNOmT1eE7ZBYRMKSY0Yur1IH1v4ckNgj/m
         nz2oHzX/SV2DYPigNpIaLg2ldAYSX9gc1cXqzMniUmSoEZU7+mV8DLlNPfjS0a1G4Z9K
         R/JvFEMeW1kYPJ9oEWfvHlIsMSNoYRcHiiCPacE9jhVL3dT+AzEergj1yFxVSJDdlSKW
         JY6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpEnHTYc2YEmhG/Do85zqd3QnRD/iOKAAby9155bmCFDGhvnPEAE73QG2JjY7fAm8GawHmFaxe4HYBD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpuf13cvTpCbgfUGRMEGDhDuxmzjYT1oOzi0s+ujjBGw2FLpw3
	UFgsQ88S8qP59dprbEhVy4LB2N4ag3c/LQ7Xr+CRG6Kf8d5Fs+EVTXnUT4qPXdoIkhM1rryXIBv
	3ZWcv2ANfcmVxjTL9KBeGRZfiO3dyimG5wPVCFg8O69K+5ZCA2lx24jIph8ig9/wr
X-Gm-Gg: AfdE7cnw3D5lX24hzCP6FoxwabrW+C5nnSF9iXvKdz9w8dHIxzpxwUqRQEC+1oldqan
	nA+5S2aPg7h98ys5bhigT80PHHRDAZR9unCslsSPhGip8Ehy+3NTtAWjnJ607ghXgnfmMaaWXHr
	aZkp7I1AnWgvYhz4sc9vRDGx3GxCy5I/+aEj/fqcayS32epFakgEFnz+/RzdOnyA2iNS/kWdeZC
	mLoRcpId7XykvIs6nIr5isRiQA48Ncb873ATJc09STTigCnpohtMe3s2EfGHN9WiLltNuGso8C2
	f65Dss8JCwNsGkJvPXBXsuZLyRgBhN+/iVYgrffKO9R2dqiX0zXwwnueSamLMohyruuYnKvfj/P
	qzpyRizzamKvFAZs=
X-Received: by 2002:ac8:7d09:0:b0:51c:167d:b346 with SMTP id d75a77b69052e-51c8b2db810mr22276041cf.23.1783513771780;
        Wed, 08 Jul 2026 05:29:31 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:51c:167d:b346 with SMTP id d75a77b69052e-51c8b2db810mr22275551cf.23.1783513770919;
        Wed, 08 Jul 2026 05:29:30 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm45795677f8f.7.2026.07.08.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:29:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 15:29:23 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKJCTmoC/yXMSw7CMAwA0atUXmMptfgUroJYuIkLRjSBuLSIq
 ncnwPItZmYwySoGh2qGLKOaplhQryrwF45nQQ3FQI62bucaDIPhw6ce5aZvRg4B26lPEbuaqNn
 TxjOvoeT3LJ2+fuvj6W97tlfxw/cHy/IBN0ms73wAAAA=
X-Change-ID: 20260708-dts-qcom-eliza-add-bwmon-f1228925caa4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2930;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pp/L8Sf3IhLbqrj0rhfeWuCiCjveSBpiepJjuAghGjs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqTkKosYjlS5aFzQ4vqj78tgMo4FcLC83S076O2
 sBo7SQB2PuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak5CqAAKCRAbX0TJAJUV
 VvpIEACEcMctMgFiUzt/PlEwww1Hn68R4f+YPyYAMYvbx0sDs/dweAM6vS49uFpYmNfR7gF4eSQ
 nNFCDZsT+V/KaIrfzdmFaZB57IA6Xp9QLot6l0ovu/4V73L6hXICLD+MsuRmXSh07dN7TxOWFC5
 LQ7UIEnzo8h/mLSUm7yuhJXXwKgoFpW5cEA5UWzYhLwdghvjEWvJvwjSk8hUFGjbrUM22sGLWb8
 8sQQ9+NrOJVskr2qLz/qfHjj2CtN/HeZaOye5FRm9/9Ucsm/wD5QuDZkaeGycx9qHfY98Xw8usA
 Rc83uZ/MRVfiI3mBW2BwGaNe03on7GGzXxso3IUMYnxW4d8AGGCEwaA9xm82BIZZaS/8P0sTfqi
 WyjmpMwR+bbtcK+U6G+S5lSWB77ZKLbNcH/EioPc3E7ffCMV++zoWr+HD0j9MV7HMZD6Tj90jci
 Fzep7HjkZuqhclSBt8MLjsgR//aTuhxjWGTSXDwGmREzKIaVeVF+tCdueGUYd49t+TZnYyqHpi9
 uVd7+3lNG+raVc1oR0OpZLsOjYKedrwWQfXiAx9/H38wWIU4v3NjNH+7ch9evaNR6W4U9FFgset
 kpK7CafFLFA4qMPu1D3VMLYsxHoJjQf5Z1CMoi5DnyJNZKae/tWN/230UalqycUSwQNiLiYMF2i
 oEnQ2so2TwnwNlA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: sXohDnPOgJy_G8oczxPL3oD_iUUHsLaI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMSBTYWx0ZWRfX8Hy6Tk/X2OZD
 Q9gl+R1AUMzulqtlWbki9uxB5/CcC5qu3lNIU9U6FOtGLL+5ueNAGLNZANxDLqRAjbDXb0TU2DO
 3QmF1kaZ6y3okh9qX5oykW1sPSfjfnw=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e42ac cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tDgQRB5FKVZLctfv5EA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: sXohDnPOgJy_G8oczxPL3oD_iUUHsLaI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMSBTYWx0ZWRfX+2EkOzUiQTyf
 WZgDUSAk0rdXve2W6Wh9ANjutBN6TP+tpsz34jZwGvJ1oysFkm7yxO44K7TyWYA3/W9VRrsgb2X
 eSwRG+VryXq2vswzfOIECbe/yShqhdeEl/Y5GZqNaKSj+KiASIPUC7HfnKqV7kAjDMUK6zsMG1s
 cr1F8gMRG1QCIeNsuJGKTcYV9dB4SdIqjXVbmYR2WPkzqyc13s5sjPPo0ETPJULqeho5j7ZFmX8
 iJ6FLylYsxB4wxkbprDWpvD8BpDOkLBjvVr9ViSbnrgC+b3SV/mqNAqn4AmlHa+iLZfKTbcKGdD
 rV6VUF1J9D/IYGZtsPJw2OITuDs45hwG9R0F8qN7dOmhF58XSAE5LXjuogMW1TeZyomApwy3zfD
 IUM2DginMuZT6ojtkSSWsxXXK70/1+k19gXvOoVw7y873MyqTZycLnTp7jIekAZnzw5YoPtzEFJ
 2qrrdnQWYgiczx6bLzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080121

Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
with the corresponding OPP tables.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
The bindings are updated here:
https://lore.kernel.org/all/20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 96 +++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e..ff9f2973a5ea 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3616,6 +3616,102 @@ cpufreq_hw: cpufreq@17d91000 {
 			#clock-cells = <1>;
 		};
 
+		pmu@24091000 {
+			compatible = "qcom,eliza-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x24091000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&llcc_bwmon_opp_table>;
+
+			llcc_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <2188800>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <5414400>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <6220800>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <6835200>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <8371200>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <10944000>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <12748800>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <14745600>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <16896000>;
+				};
+			};
+		};
+
+		pmu@240b7400 {
+			compatible = "qcom,eliza-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x240b7400 0x0 0x600>;
+
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <307200>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <5600000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <8528000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <11120000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <14000000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <14928000>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <17056000>;
+				};
+			};
+		};
+
 		gem_noc: interconnect@24100000 {
 			compatible = "qcom,eliza-gem-noc";
 			reg = <0x0 0x24100000 0x0 0x163080>;

---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260708-dts-qcom-eliza-add-bwmon-f1228925caa4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


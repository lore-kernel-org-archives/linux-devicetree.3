Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEDC2E3AF1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990522; cv=none; b=WxU6ywBlkGMd4wqn8moqzLGDHq4e4IwxZ3Ma4fWcAYzYcQdHVcUpYS9oQFGD5ABSkT1QyVrLp27cH954bZTYgcvF82koAV6QRWSRDw2MJU6L5fQDV29WZRian3Up3ZVbSgmAs4OCO9J6k1UIHEudyZYJvI9Gu+p5JNH9rQrudSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990522; c=relaxed/simple;
	bh=3yDThcOnbF2KCDvNFLK8o0ylkBvCKCemb57a0haJedI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OtGWLvg5sIfUik1RDPy8vQLWxqzPX9c4i5pEdnloz7OUCNSP/+IzCb9Yunb0sR5TMjpazHDUBMtk7wMV5GPeXcPKYJ+T7pmSTv0tOykvznTC7wGuArlhPe4O3GBJbn9ds9h41dIk90CVKiwyHxUMA9W6N5QdBDzQXADSiVJH8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcEIewhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adObyBkA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcEIewhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adObyBkA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wdYB1515143
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WLiPN4GyiZlceYQ34rrw22J23P5MVS/Mlwv
	ELKMSq8k=; b=LcEIewhbNiT2QQNjFWsDvZbkGkp5Q/pVbpZyBIjiRJOt2KuqfSN
	p0h2lkg4M0MsTd/AOy3MC0tGxUSsZ0P0nFTEB2eGeU8Ki+MxJoaZQKz8BPyvuc7Q
	XjEzmBTElNgY2iUlYJUpt2CiJ54c6e8Nvous/R7terrIP/ldsSBNk/jrKfQ9S7nB
	Rq+IvfGrmYE/WN79sSRk3PlhOaMoLQ3eZZNOixVVeAJTC2JKdMsrkRALoiv6E4Ub
	fi/L1xtrqvX7SJPnhRRwRg5BB2ZQgX4CZWCTpv6s6X6WdGhgMAjjIYVlqBY5mwDh
	viwPvx+cyMen6dnqpjFr92NJLaLmU7h83tA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvck6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:35:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b35fa876so64718045ad.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780990519; x=1781595319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLiPN4GyiZlceYQ34rrw22J23P5MVS/MlwvELKMSq8k=;
        b=adObyBkAxjG54fVB1xpxpJ9/B2LuSzJQKD/1LWyrRQvP+VRqQN1Im/yItZ7Q1j5oQF
         EHseJQJxP9IVw+t+a+zYPB0VYGrzdMAtfCVKUgWcAJZpMLgEcl5JB+1nv9bCdEHWz1pR
         6SCMFjKv2x8SvG66oM+HIVTmgv74Nq6SfKSUCAvU1zaK8cujcZAHILQQePbExTIJv53m
         Y+VoFyS3MPCgjn13KHE/anVlE53rI17fe0suDtd3fhWh2uoP/i/4c0AX/qKfUEMae5O+
         pO2L1xkG9I1L90AolDDH8L/2lUfhEdqT2Y6NMDff7aimz2J+91ADljwHE7s/nU9/tRbw
         Paaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990519; x=1781595319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLiPN4GyiZlceYQ34rrw22J23P5MVS/MlwvELKMSq8k=;
        b=NLpZ5FBgMoxgoMkMZL7Diw68xtTGGYOdAp2/5qbRkNLVz+aShCtFmuWrtr/zFMVkPp
         q7sFnJGjHn/CPSI2XEk8ixYlSpCKDhHOsKLrEJTlFvDSjI8hQcy8Zsg3+l2Du1GRk1IV
         7JrOk+gy0ZUO/8V+vFtThyt+K0k3XHDVRar2oo7oWb7dv4O0chNpHUjlZOuev9KqFIHH
         yt8l+6tv8uVg8SgjlxV7Za7f7+Q9Okyl45s2Pc+ImBB9KrCRDGe6OzfpTUD73hqqqAwz
         DnLljv7gvua/5OVV8C7/1UhVjEBXM8QEcGj/xqDDPZY8wPG/IXeBUx+t0W5wfk7GRYIu
         2jOw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ri06yvKimvSX+nkOWjx81MDrDulH/l/ZNYMYXJSAg9plCghxJBPprhtVs0c6pGZ8aIRsI0SEBdZlH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg89M59ZXBfjosu6VmiekFU2MBJv4D16z/wik6GiBU1nUcrpV/
	fHuQrwworDAYCDj4wJMec+4fYZ0mCiDLWjRqwiadEGOx7nDdjVeTFoaklGqxUk0Z2/f7t9NeEQG
	yuNoMpfOWeNxfl4Nh/uixCOHy7GtEwfIqjtzZxtmLKu7JAdSlF0/D3sKHGV7cdru+
X-Gm-Gg: Acq92OESbnfxCFudAqN07+FSGmDKrc02mueI3ZODOz6mZezdyf8OHN1uTsCM+cIAscL
	hxV6IZyn+jBI86LtDhzurEKBrzKM+akdGbMo70fhsFxgrkCIl9s1dO1jGyKCU9pHcQbHvrdF8iV
	AmiothkqZwaHJjOzISl+1uJi+8SouGZ9IVyGZLyD7k/myyAYz6+VWbkKC1XFGFl41GmFFcfPeqs
	tnjByTJfmb4expxSDJ4B7URyXlvPP/5UBxOXuua/RBCdDi9jCqNbg7ZMby9asXlyCliMq5FE65c
	5fzo+9tdE2Xz9wLMUXUdB6Lzj7hh3oDrcCTl5nGkd5ZHrT3e+OVBp9+pFbKbfpjU+xDKGv0PzgC
	ISwVlQ1xQtVyp/ot1WH7u5LijkvQSK/uIEgqxx99VmlG5iqFVRXQd9qYMq3I=
X-Received: by 2002:a17:902:ecca:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2c1e7e61c68mr242236095ad.18.1780990519031;
        Tue, 09 Jun 2026 00:35:19 -0700 (PDT)
X-Received: by 2002:a17:902:ecca:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2c1e7e61c68mr242235535ad.18.1780990518553;
        Tue, 09 Jun 2026 00:35:18 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm205521505ad.22.2026.06.09.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:35:18 -0700 (PDT)
From: monish.chunara@oss.qualcomm.com
X-Google-Original-From: mchunara@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com, jsodhapa@qti.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: talos-evk: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Tue,  9 Jun 2026 13:05:09 +0530
Message-Id: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iyU4bA-anERib6uVikMggXyI6Gxb2IJc
X-Proofpoint-ORIG-GUID: iyU4bA-anERib6uVikMggXyI6Gxb2IJc
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27c238 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5JD22pyS9HkwBMopzcwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MCBTYWx0ZWRfXyj11McraFMAm
 KLZdHKDHoR61iS9tmAnbutN7ro63VZPpkWUHX/c4p3rmkKv6QX+hUDoE+NMJJYeUWD6j6jA4hrh
 TdELnepYb3o/uJcnorkHHuY/cxOWbFjMSX/tv3+lVqhm9oxGZsZXvLQuyBV8CjxA8vRXafwGj5j
 B+9rNj/9nkNlRfsZ2KnHuYy9kltMqHpKs776YUn2dcyBPNCa+zGhWIqSaDK6eGzpSQdFG80I9g9
 zkX7ei6az2XTuAXgLM6tdg2HfnilXKNtvVltvjC/hRZ+qRO8ZxQuDGaV1DUs6pWIY+w+oZFcRtz
 hVZmNCx2V8dJewgihCLY7pcOqsRtNFq4+2hfFFZ1zkpaoPCQEoQBRjXBxUNDUsCNqLZ9HoUwA5c
 4FRAa+XrSDBwLcUQi149wO2rN6K6kH483AZur6ogvBb4DXgyKTWTEXqcQc8ENas6dKcZDaVjJev
 8dpKalji8FdxutaFcFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090070

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

SD card is detected as SDHS instead of UHS-I because sdhc_2 was
configured with vreg_s4a as vqmmc-supply, which cannot switch
between 1.8V and 3.3V.

Switch vqmmc-supply to vreg_l2a and update its voltage range to
1800000-2960000 uV to enable proper UHS-I signaling.

Signed-off-by: Jaypal Sodhaparmar <jsodhapa@qti.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/talos-evk.dts      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..f70823b31391 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -195,8 +195,8 @@ vreg_l1a: ldo1 {
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index b7f514fbc7b2..9ed48765ae6e 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -189,7 +189,7 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vreg_l10a>;
-	vqmmc-supply = <&vreg_s4a>;
+	vqmmc-supply = <&vreg_l2a>;
 
 	status = "okay";
 };
-- 
2.34.1


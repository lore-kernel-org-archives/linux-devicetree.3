Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6A839EF12
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173410; cv=none; b=SvvRyHpNESdJlRSYAZTeHhkuczNyxilmwK2wWjBsCFbroUFyzWx8+V7QbTWkPFNyH57Rt8zNZmUS+raPs3Ws2nXauLe17MFW1OemzrwIBLWrPqcl1Prz6n5vYt1IcymnCeZdMA9gi03qG13MFkp+qrs+aNwbF2jTQgqGWMd4Nu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173410; c=relaxed/simple;
	bh=daycsdQGYWas2V0105xKqPSpRZFZv7GF7t+kJvOHzxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HSz17zKLVxb4VESPtXZ73v1NQMBdxCj+IinnyNsliULrpQMgKgRL/hQV/JxUDN3f4lKbOmBPziMXmRGl/7YWtyS649xxQg+xL08jJMv+jtY+H9Gq2iw6Mtw1PsAEjusy/e29PevSLp7zoMvAUTXr9I2ztcVnfP28uBOfSCEnZDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd6Tt4q4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSoGB9mN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd6Tt4q4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSoGB9mN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4sYOn254349
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BfYN5kZBLgfGldHL3vQmFkXHIXyQ19R4u+D
	xq/y5Qbs=; b=Nd6Tt4q4xMhjluSIunUsKVArjtb7yF48KYJKGu93Kn0wgaJ0p+8
	mBYBD/3yXUusVlhNtgGD3t4Bi63xesETbM5cfnil44laAqIWInCH3spMfb4Re2I9
	7FQjfUw4ut2p/M6+QOmOeNsx6C5STPZ64J90R8+R2bsTEr4Jlm+W8GaMu6K6BqYf
	ZdF3iz2eqQjWtteeoGzB1PnTgGSrGNGK80sGAZjX2830k7n1zhlnvrdU7qjCjrx3
	Ufxb0lk717KUGNFxgC4Y34oTD2PkkdZIaW884yWCcfUeNUB7dG0LuNNpkhsxjuKf
	C/aggpq/puHIRUl36ukdYWjA2JpEz/xNhTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87red9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:50:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd6aeb3637so83517815ad.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779173407; x=1779778207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYN5kZBLgfGldHL3vQmFkXHIXyQ19R4u+Dxq/y5Qbs=;
        b=VSoGB9mNB8rZY967BLUvmqaMR8pdlIex58UaLqNEOKLs77H2Y9rf3g3U5EO2iybhvT
         WGZsl6lek1f6DD/tlHSnOQYcjj5V01EWY0povGnnQiUXo0AxqoZZZsdTtSGhhvx4GTFN
         +w7Xn+/sCLpu71JmIX5TdmaqK5od8iJBc29+1J22CFE+e3gig3XNAWbw20fnVQQaOt1v
         zOBiUPoYFfiegNGWK9toQK489UNqUbvtdEsK8VndzBdHuNHhg3HLgbs+GjwdRphKkgzr
         NLIvHooIGYpNLeQQZNRBkFoeKYQ1rmU3b/+DutzUgUfXOGcWzgU732G1ZeOe4iqcEyOd
         sGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173407; x=1779778207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfYN5kZBLgfGldHL3vQmFkXHIXyQ19R4u+Dxq/y5Qbs=;
        b=M+prOrfDQZO8Gg9w5jCGkSLvda0FIwEP4JQbHHnXt3niOdlfjPswrgm7tSwdWo1+X7
         dq91Zkt2VfP/j2hruqhTJy2bwHMHQogEkIVeyBixdXWaUKZigvMzHe9LQm+3kNJPTMRx
         8atZc/Lfj82TbiHQ9bL016Ml2rBe0ki5nUuHCSgQY+7z36WoT8akq3zsEt8V8kqRUdP6
         RmeFz+7NQnVOEjUaIs3S01wa+kEIY1n4oRPK1yB76+8BoEA8UbWnBMjtviFiJlWCy4cW
         2oXbtZWamip47q07zLo5X/xKO0SMGeQSqrGfYgTQRxziNxzQgwgPO4M840JAlEwYYdDw
         lq0g==
X-Forwarded-Encrypted: i=1; AFNElJ99rfl7mJeqA+irb5XuFck7h/YtYj60ZHXID4KdPfk0ekauiE+1P/QIVjjqWwHMUNiCNNWFFH7fiVFI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20ka4ccDAqYOuRuh47I5wkcsMzYzhWt8vWcWZ6TwNAMyTVu6G
	KJGALG5Lt653AnxBnduV67Z0UBJ+36dgsVslWJR6OkpNFf44AVUv0MoXTyjNsFsLA8mG+q+fk7K
	beef/szvKtce3QfQjyvNhEH4mWUGEEhcTC/Lz+V3BZ5Q+8mCFDJxDNIsWHKXjuHx2
X-Gm-Gg: Acq92OEUJ6J1md8ClLSY7dCT/KAhpyjng0+caoi38uRf2BwzczO0kAOVQDE2dcKnLKy
	OyLf1BVc5atuq0gTcRGw42Csatuhjyx7mrIvWjxkSzESDrzneV8VRcVEDQH7lB0NjuJTEUjftYq
	8bsLWaksHSJA5YMGjX4SXaQ1x2m9GdtV/0DFHMDVKby/GvPMuv6/lSMyR6oJysKkj7f7K95GTuH
	sxPJ2rrdkr9y9AQMVGHGobFIdthHHEr6jepQYlWft5kRidtZE2xlVHua0jhhrbQ8WaAyt5ETFh1
	8i0OFeeI/5s+/NwwJ14guTy3Ld7rBnR/yI3Ks9wplC3hyWNxpbfo+x8p0h/f2s6pbv5NaM8SZPW
	UL1icMtxIoqbx75KH5UgogU0Z+U1gbzjAEN92aL7MEeYRcM7onGaOlKE=
X-Received: by 2002:a17:903:40c5:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd7e92825dmr181228725ad.41.1779173407053;
        Mon, 18 May 2026 23:50:07 -0700 (PDT)
X-Received: by 2002:a17:903:40c5:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd7e92825dmr181228435ad.41.1779173406609;
        Mon, 18 May 2026 23:50:06 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d6easm188306675ad.72.2026.05.18.23.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:50:06 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C GPIO expander
Date: Tue, 19 May 2026 12:19:54 +0530
Message-Id: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H_sFc7GPTgNWnbuD1FqeA19_N2Op0W2J
X-Proofpoint-ORIG-GUID: H_sFc7GPTgNWnbuD1FqeA19_N2Op0W2J
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c0820 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=l0BCks6i3eRASjQ-E0wA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2NSBTYWx0ZWRfXzDavN75cmF//
 5CuFGwTrB0gZopCrbLVzXbNhz0QXsvYJhmXI7xi7/dupDl1OWi1mbmO0cd64Iy7PPysLVrRRgD7
 xQXbusXemNMB6rV1VkALo0CF2ga76grxnhiP33DiaBhz5FA74WJ47wSgGeRd2ow3jWaKuyV3ufX
 X4p007Xg/7COn1h+IDXfHrOp0GlASSFPWqOnSXyQNKvfctVXKLUEKosefAI+svGx+2QAdC6+elf
 v9JwekGl7tSsUA37iM0XUk84nxqOG3/RYO4px9CWwYOExPGw/9vhFfuVLMDGyniVpIRyK5HlktZ
 8gvBMgEv41y8oD/xs0VW/xOdJTBDYfbBW2WbHSZTc0eQXg3J5lO7Xqk7J8wHvWPCSEKKIBI3PAR
 JvtnyBE91hKJIFlXHdvl5RlmbHtmixCtqUwynFaVUfyIYk1Wi8EWAPI3o2pAUoc4No9Op1gdgQr
 OFsKyhYZWm0EqJAUiiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190065

The LeMans EVK board routes the RX lines of CAN controllers 2, 4, and 6
(part of the RTSS subsystem) through a signal multiplexer controlled by
GPIO 4 of the I2C GPIO expander at address 0x3b. The remaining CAN
controllers, out of 8 total on RTSS, are wired directly to their
transceivers.

The multiplexer select pin defaults low on reset, disconnecting CAN 2,
4, and 6 RX lines from their respective transceivers, which results in
no data being received on these interfaces.

Configure GPIO 4 as output-high to assert the mux select line at boot,
connecting the RX signals of CAN 2, 4, and 6 to their transceivers as
required by the EVK board wiring.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
v1->v2
- Fixed commit text to include platform name.

v2->v3
- Updated commit text.
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..34dfc8d22b6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -616,6 +616,13 @@ expander3: gpio@3b {
 		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander3_int>;
 		pinctrl-names = "default";
+
+		rtss-can-sel-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "rtss-can-sel";
+		};
 	};
 
 	eeprom@50 {
-- 
2.34.1


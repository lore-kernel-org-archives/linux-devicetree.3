Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A134E36DA
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054747; cv=none; b=SxNZ29XYusYn/56TtQPMV7xQDz2NEC0MVfGiYukZclGipFFcbeFtW8uy+yOSZMSE/evB2gkawymGTi58paMmWg9CuLdlMAeJz3dzV9EF01a+yVi89lC1xGETHo0k7XrzyICKNQM/ud2pls79GFDSyx+OuoEwr4+rfylDwS7GAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054747; c=relaxed/simple;
	bh=orEEB4Di9IciHmU5vNoXEI2s2xHdwt+cDps+MGXhqNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qu5xftZSZQB0Wct0zlm04v7Qzr/qFcRiUusmEaG64XCYpGCUCFhiRgFzb4chmybR9ALw4kCP2axvMA9L4HV0yUTMgveeJI7X+JKPuZQ4tnxuHhh3p/nEfFg/lCl3bYKTMS4fNz+FTrBjIVMtsTuPC7VQwmNme8u/fLE+73y/lTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtWaKqVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jY7xiHeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtWaKqVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jY7xiHeo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xa0q2738648
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xu2033LaBmqkzJxlbTL1PZOWfNlBEA8awrj2KAxUyVQ=; b=RtWaKqVIjcDIizuw
	TX1vXJvc5rRosGwFQ92VouUUmdyixXJQw0Ga7e5Apn5K02TIwwAwl+SBg5O2LTXa
	G9CYty/nlw8Itaho49agNiT24IatQZnPzPAu3kxWgrqnlQ0I2ExWobrBDxtMikbK
	Lb4h7ido9NJthtwZqnFvKDgorUbXlExAld6kqliIPQ7aoS9eIjvF1yYXpVsct+Ap
	jW6voNqnWgxJXfz6BpCER+Qhlnn9nzuUkDVSy1SaKC0J7wUBMm/JQzywqwwEb3QZ
	XW0eRQy+fV6Gg2RRE5pAIRAGWz+7JDmAjqMRm2aiBONYlIY+iVGhr+OlgkqTZDdM
	GNUxdA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds94h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91961d4b31bso106049316d6.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054743; x=1792659543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xu2033LaBmqkzJxlbTL1PZOWfNlBEA8awrj2KAxUyVQ=;
        b=jY7xiHeokbmiG/Uq7GgRHnXmLq++uodoU7sgtBSItS0klkMjyvus4AvkIqhUkLfjUH
         2h3SfLKkRrDVa408gUghwkYzsMgk/Z1F/+92rRdQkrhI2eOVO5Qg9ij3YDc/RsuEuGhF
         f5NbXtJsq8HRAt0y6Gb8SOCMThXrDkHTKIiYJh9m5lrbSkRkwiLJHBw9uoozbGsQGBpX
         IdOEU1urdjk+IELbKr17vU8vy7aAdH+fsKhCOgSFadNdYkgjecJbFe4P8I8jmQ8zwjMs
         TfeXMOm3CjSPktT2CV+06GRPcQuPiVgfA1zdiDoZl5WK2TPr3keC38hm2OZjIMaS87rL
         eJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054743; x=1792659543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xu2033LaBmqkzJxlbTL1PZOWfNlBEA8awrj2KAxUyVQ=;
        b=YfcZWhcBkUtxue7uNLVNhiZITT2WvpV35LDP9ehjCih77AvtyGEug9iCdgz4jtjpxq
         DMn5w1oWZIhVFkteeyDHkXuSOmohZam0Gn1OktFctOHkL44qJYPSIHWB5U/R7Yjwe15+
         B1HZX/fdrUcxuwM/lhY+6RqUlz8JJ0u1QDPLfB+yov9GJfIbSGLEGrD1zAT6+8BYMiMB
         BLN2JINoWaSkLkMj4wme1+nVo57kvgVW1OOP5Wz4xcUvmX/yh/m75CYySPmGhU4OMvQ9
         Q7E2okoL0LjYU4MvhmN4HGxmHoQzJ6Al/Wswq3jHXcQLM8lDvDA+Qr0hyzlL770PgIH7
         N04Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpNVTb6XMxPadmh51dPuVcxKtTbgONstOPDTRencU6lc6k3V8kyVeQ89sEbFmEzuuG36p8DGULo26R@vger.kernel.org
X-Gm-Message-State: AFq9FYI/jwIAbec0GnpbHJzg/e+RK5+KYe/Z65UgyZjnqhIQGJeyJ2tp
	x+fcnIiMJHgVZTquwKVUZ5cG0GsSP38+4r8FtTA6G68RWplKq9AuewkKlJuwmywXzfwCg6AtpHR
	ZcjfJz3BDI9fMrvTw6LREmoloZpgEWawKut7AjlbIOlnY34uOY82Frd9s40YQRyjG
X-Gm-Gg: AYBFou1kCy+KT/PCrzHVGCeYXU8fr8Fku+5ZEg2woLisxH+zJceDNOS9/edCDRQEwud
	uogbZ2Gv0fryTehkGVy1U2SNLzky1WC81M+w4brDZpWa9OKvo5fLqdg2BxwfQkT/UFOFXLQWFdE
	QtBCaps2nPZs/yz8b1hqqHxENft8sfO2x1iaA2FQs+Riuq3BGoyRvJ9K/hVc5Wsh2mnOvVKXehu
	q2RYoUXWH5062xCBS94NTqiyI+vGTz6DWRPZtkJpGBqIemYsjgO5VsgJY+xuHVn95pw3wuh8qfv
	lGSJexdwO8aIiC2oUm9hNAT4SGBwCNbXm3SzlmvoEBqXR8lzPg4PV8LTt+9HtXHHMvipHGh5Qxc
	qBsTxEKgDyHK8HLbQK2cDr13OjUQxdrGN0mSxo25/0l/Ta5JiqoqJM7oU93UY+5ZI6bHdNOu7zT
	LI/ulXa36lkxEs
X-Received: by 2002:a05:620a:2694:b0:93b:d8bc:a864 with SMTP id af79cd13be357-93ebd4ae9b2mr2761951885a.65.1792054742683;
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2694:b0:93b:d8bc:a864 with SMTP id af79cd13be357-93ebd4ae9b2mr2761949085a.65.1792054742207;
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:43 +0300
Subject: [PATCH 6/9] arm64: dts: qcom: pm8150l: add LCDB regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-6-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=orEEB4Di9IciHmU5vNoXEI2s2xHdwt+cDps+MGXhqNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXG675dHOR6qOefRBRinkgWZvvzBOrjTwkER
 Gq/zlW3+1WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxgAKCRCLPIo+Aiko
 1VPQB/4haNfclZ26D1btqgVLcMyS+X0wynAuPTZZKRJ3MDQwxT9M8opJMeRxGfwqfL+pIi6VZKK
 TSx9SNLEuCxeEN4t1Vc3J4dL37ax6LfCBeWV8wId7riR/JOidcpe7PMaiAcMrxF2NCjOUi++pk8
 Fap6rxAo6Z/YViVlrM1MVLuFCOv0KRa3Ky8EPALffvPF/l5a3gCLlZ/+D8ek2JJPmLPW79vWNbK
 pXjSnFFUDXJ8yCOMFvyjnYtM2QVMhcgnzoOsPWjpLi1pGi4DJf99DzdZ9kZzHONBWGO+/fTx1S/
 dr7/AGG7nRthWyNGQ+pLZ/w26Vdshyd+aNbk8bzPTWTpK8Yc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cQruf4QfTUjSlolms3iXKG77WhocmXxC
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad095d7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7QMEsOvxxwx5wcZNC-0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX2uoURJoOmgMM
 UjtJWkivBUna/ZpP5Ngf99GOz9iW9JYZ0Dt0T0hsxlu0ltSsBXxbZe5UDNbq4ozf+1qfWWrDcxf
 G62daMTvi/yrYGFctcjwFgLYEs8G4Q4Cf/WxlYuDIwe5e8W/YXpeQMuPv1EtvDMM4Wjt25DGCUH
 /+3pB4RoELsJDVAknI90YAkNH5FSaCf5fCq5YVUsmmRHoJgf/jJNY1Ft+8CCJaUyg6GxToiB8l/
 Bb3hvs/5pdNijt5ScFjtvrXC7/MQx8AZz3MgzkbkgK5kmdnYrh72occofpXL6OlGCCpBZHlcRWp
 yz7Xen4umGr59AEEo2Uqdey1Npf/Q1D44KFt41al6/yP1ZN5VqIWkjpT0NyRXBNjuU9CTZZfpZv
 SdR/jHVBhopx82LSlxtgitGQfDQJquEumKvADo64tPHGyQZhWrBPSUfoJLdgzfXQLJQqDr7B2LX
 f2VJPsdZKwHolue+ibw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX1Qhh2OwtcJxi
 TYwg3NUinYR6jdDozYmUm6PmBIFA0edTWkaG+mtT/UdgatbASzm7wmszO/1GBN90xNAlA4BRvQC
 ac0/T4ylEzY/yWo5SY15dHaKZ5s+JRw=
X-Proofpoint-GUID: cQruf4QfTUjSlolms3iXKG77WhocmXxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

Describe the LCDB block providing the LCD bias rails.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 3911d6d0d2e2..f54ddb6f7946 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -141,5 +141,23 @@ pm8150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm8150l_lcdb: lcdb@ec00 {
+			compatible = "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm8150l_lcdb_ldo: ldo {
+				regulator-min-microvolt = <4000000>;
+				regulator-max-microvolt = <6000000>;
+			};
+
+			pm8150l_lcdb_ncp: ncp {
+				regulator-min-microvolt = <4000000>;
+				regulator-max-microvolt = <6000000>;
+			};
+		};
 	};
 };

-- 
2.47.3


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADAE26A1C4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323852; cv=none; b=Ad3pM4IEullcMlf52YyN7LOgeE9j9PtmxTpPeVWxhamQo/vDDh/8yiwbNb5f+OPSZ2IsUd5YRkVrVE31fc2Hw3yPyyQ74SCc2D55i0ItbrkMbupPPwNyB2OmvNEM3+QSZ/INgLEgF7Z/n+PJRa4FmAF7Wro2tS87FofMJ+qEYDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323852; c=relaxed/simple;
	bh=uslzc7nmyiyHk64GKvcYr12UhsrifhwRpc28XFd675k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFVO52J2jOkkWG9z6BS68n8HT68keHMdHRhOSYtSXYoNTL9AjWihiMH9ThP3sIBafXPCqVAenGoKO9N/wkE6OO8O7XOhCr3CqyMgn+Sr+IbycH98oxDikxW0Kt8FGeD5ekja6laD4k68DHTWEXH9/pzbsV3yENdrDHhSRQ1MPks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJQzCC9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ka7xWfv0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJQzCC9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ka7xWfv0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGU2u5447958
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZitX75AVxgG
	uWGiVafC3GvCVVrQgyZQFWsUqIo6AsA4=; b=MJQzCC9uiqc8UeqSu6hBkDkzW8z
	vMpfXecaBT8O+Z2unJsqYd53WFdDNjf0yvPvSt2lc5Jc0cA7HS39EpnvHAYei+Vv
	ToRM8y06afkNoW9RQV+ckYvOPVOEaAVa/yK7BIDAhif6SREQyJqkCVfyBR0kPME2
	UQX/it1lwZyEfXPRw86AGhmmiFs3wmR2inHWoNLhANr7UvNcFxUKYp2Hq+TEqUV6
	h6XG63mCc4PlYqU6K6Z8X4EFR9VwgqJBShzFKgjOZ14r/dyrTZLuNUxzl/0wOXZA
	9egAiuDYoWQYDFAJuSXuHaQR2C9opgL5+xjxO2Cxck62mRWK+YlZGTkUjIA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrk8eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:20 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7cfea0b5b7cso42642177b3.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323840; x=1779928640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZitX75AVxgGuWGiVafC3GvCVVrQgyZQFWsUqIo6AsA4=;
        b=ka7xWfv0FAfyrpNAaqdCSRcMklpSnGvwAe6535N2U7TdcVAbqkUQNpb8g1S/ueu9WL
         VreJvfT4Kzcvvl6shiOf+4+9e5amTScKJIzYs7BHKTCdJMjd1xATfELperA6m04i+O+6
         al1F3HY4W9ZDQCyi3IlEyEg5OeMggKg5ilo/plibXA+Jol3KdCksBBtw9Btj5mPSf0JG
         B7rnWunfW1cDBKZaBgAKxLMc5h+eFdH5EPM57N83zI3c63t/greSIM7Oq5T3WphAJvDt
         4qIbJPQpOpK+zaUgr9L1jbUY6FN+dJLWcUqjCGvqqOjlDnXfHS77hIT/ECn0z2I1aKpN
         PcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323840; x=1779928640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZitX75AVxgGuWGiVafC3GvCVVrQgyZQFWsUqIo6AsA4=;
        b=Nj0IgcqJlagKB5VnP5SHZyJwgrt5vGmsFi8O/pRKV6JCS0cJPreHF+rTj71R0dt0Vd
         OZVg9L8mgU3b6kOWhOeygfT5xjXaptSP6wJi8LpPwfDMp1lmOv7ETNiLGKJQnXbCp4oE
         1CJi/X55xkJDmvuv0GkOsFAIi+TkvJk8cSotjF8wz6SM4QprqWTbIF12cAmZM4hJR8bm
         pGl4bAFNIWTqiFyJZnGXa0J2DguAN5/2lx5YmQcWQyc4AbE+0eMTyb61/hKpGq1ZtDpr
         WJQv480iV6A6ISV2NWFFMf7iZ8gHk7EuRozDCsBMZZrF8tQUrY2HHtcwXWATM6Eexm7T
         /lfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JWe/uwrpzANS90MRCfIsfTJBU7pO6cYdYToBW84kzzdZ4PgnPuYZe1cyorue+4BOw6sMoj+j7bylR@vger.kernel.org
X-Gm-Message-State: AOJu0YxwPY2dUPxLqTWb5wP7DPsp4vb68osYCthUx/Y7La5AP4FqEpPk
	i2tAPXMcgdGbl9zWfZe+pFXLDFTium7DWnUC3U7fQfWg6YXHIVKtuLAChtFSXm/PyblwsbiSKEf
	n9xOCCWkYpTdCG+l+6x3g/cep3+4bVdbkpX75WgyFhyIseFcAsKMvGstj2MNT5YR0
X-Gm-Gg: Acq92OHbDN0BoR2q13H8Nmu0SQiVdX0a8IQcAgJOtSMWf0DV1VMkcmAGY9YHM/ImefK
	Fvi8RyJIhV050hEnskmeh9LqwreKgLNzwoN3gh09J2vAz3tkXord3K/2zeXK55h3nPdV13ewWJS
	A0hjyrLPom5Dn0XpAd1KLNqUPIIroh9ojQsS7IO7EyYJ2pCl1NFA5NCcCYQF6iovMS7kv3KBRuC
	+oQoi3My+mK4nV0gT54UnUA7n1Nbyv1fhLGjcsZR4nB3eHAU/LnwMVLILFKxiXUcXghDzxOtZjJ
	veg9NaEPhNyHfkwGtGs6ih0t/ZZ8ouV3HUaFQUVqIqUiBUbJ0H97W5pmuZ4aXk9bIZGD1pIE2xw
	PulFGmVBJY7W0R2xbMX44Z9EMa2ct0ej68W4n3Mxee8qu8BLQKhe34EOBqcZCDUOix6pkZBxbPK
	jhV3nTnSVQEZjftgc=
X-Received: by 2002:a05:690c:e07:b0:7bd:98cc:a675 with SMTP id 00721157ae682-7d20dcf95efmr7291877b3.47.1779323840339;
        Wed, 20 May 2026 17:37:20 -0700 (PDT)
X-Received: by 2002:a05:690c:e07:b0:7bd:98cc:a675 with SMTP id 00721157ae682-7d20dcf95efmr7291487b3.47.1779323839867;
        Wed, 20 May 2026 17:37:19 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:19 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
Date: Wed, 20 May 2026 17:36:14 -0700
Message-ID: <20260521003615.1260844-4-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1ncbl9wUFAKj2WFE52GaGBADBViwrXgA
X-Proofpoint-ORIG-GUID: 1ncbl9wUFAKj2WFE52GaGBADBViwrXgA
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0e53c0 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CbK1FIr4-MOfYfEwsVEA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfX/iIHbNJAV90X
 56BMO6IHo2cu+sOLsJB8PVSocg5ShnSrlj1/APrS8mBhhSm2EL0LCEEoGwmmvWuvMqzaCpDEHF3
 GOPYw8vC9708IBEptIDTf5urSTgnMjoFzvyw0jmPAyGOoL3CpRkl5HOUGeio/h4HfYJYgMGyFRc
 TDz/3sT++dTOgRarkoTtT/cXUYpL06scxVY1r1s/pWfvGxTF38GYzsVdi23EHge4Oz+bb3/gDmE
 mAcETAuv4ffFArgWRmhVXhL4z6HlJrSszFbnl9IDjE9PRL48yewC7Ml+a2D/QY17wJcLn0Y75tN
 ObMNph0oNRRlvEEVWZkQRnE3yAsht8ifM3ZB6c9b3J0bTABCgVfwn5zXPPK6Vm009JihGUmtdxC
 SRUMLtEbQgVH5te3K6ugsNYp2wRi3TFXcJqH9pJosYaYwkmsMREBz7WGfr8sIJ2W74WGa8pVJyg
 yfr6jDln8ZQGEUiOoEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210003

The l12b and l15b supplies are used by components that are not (fully)
described (and some never will be) and must never be disabled.

Mark the regulators as always-on to prevent them from being disabled,
for example, when consumers probe defer or suspend.

Note that these supplies currently have no consumers described in
mainline for dell-thena beyond the audio codec (vdd-buck/vdd-rxtx/
vdd-io on wcd938x), which can release them when the codec goes idle.
The board-level gpio-fixed regulators that feed the Type-C retimer's
VDDIO and other rails are not described with a vin-supply link, so
the kernel cannot keep their parent LDOs alive on its own.

This mirrors the same change Johan Hovold applied to every other
X1E80100 board in a March 2025 series; commit 63169c07d740
("arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on")
is representative. The dell-thena board file was introduced four months
later and did not inherit that change; this patch closes the gap.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 96e7a18366dc..d93b704872b5 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -589,6 +589,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -610,6 +611,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 	};
 
-- 
2.53.0


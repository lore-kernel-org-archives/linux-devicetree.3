Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2986E3B8111
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734440; cv=none; b=GPO5udl0ESYFHyP9tFhJMw5GfKqe7IbUqfNV+t+aTlN76qSJetBSC0zXkAImtNVzwp/OB6H9FtCi+hOoYpRCobCQbM3TPqSufN5o0prvRhTsw+AFE4WSTmbkBPs3AWbfKm8XTFitm4QPI8tdHa1KRvekxVDhZHp5K+xS0vUfrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734440; c=relaxed/simple;
	bh=Cjo3b1ABP7zrifgwNg/VCukO2mM4fCZjoET0N4dKyB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrD/F7IEKIFF1Z3DWB+C5t5tNo5t/6PFJJ5epbboRg6LsQValRNb5wTRdIvCaCYA5WeUJ2Npt1gqjxXp6WO3IPzbLlBjgW9WlpHGwDzjWt3St/Ru0CZ2GgO9ZIXVcCFVMbNeU8MhAR9Ky2enSV3tPmTz0kRHdftUTOzN0+Dj1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDODQNNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcsbcpQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDODQNNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcsbcpQm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RuSS451442
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5uS0/faMQ3MvU0X+b4yCA4xc8M+/0GLQE7v
	v+ceiR8g=; b=JDODQNNXPuPenA9iZ6BCf6eKeCJvV2AuK9TRAKANxfPH/5dGH3J
	VmrP7ixmWnjz2WaSyHiK0qoXqn+/3eN6QGD7VpQI3wDZziDmFC23UtZZA1IeY4/9
	L50TE9mLK6NIFs614eZDYApic0cNxpn9pu3z1Bv0vXUbfKcO9f4T47K54N90iJn7
	869ZqkAt1f/0LAYYpZWnmMzTBN4bNrqPbdbkk/5sCjJQPhk8NdBLFhr11TNRQCve
	VHKcrkCq6dt0lABZKDRkt6Ct2UD67IH2lpPqoauWlGJ3up5qQZxf+n12cO8Nikv7
	8owHcR9ig+bmI0eu/Yu5BHh/GfcRGMNEgoQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gh8px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:53:56 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so1471232b6e.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734436; x=1788339236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uS0/faMQ3MvU0X+b4yCA4xc8M+/0GLQE7vv+ceiR8g=;
        b=EcsbcpQm/UwLES6IJQA/oKyxSKAuF/Io948vJzmHSLF57DJyHd/JiQhkhUfBKquXMm
         ZUki2a1/bpDCJCf5B7e7ShNL/JeRSfLZWC4gIZ1juwtBvyI5SxZRzcYLF8xify5Cq9tl
         gF0k/qo8VUmmc1gltR9d2dsIMY6mMXMQZgyRQFrFbFnYvwN9Lu2pEif3KUQI6sXzOQOv
         tQ0Dj2GYTf6scAqZ1o792l1lkWRuAmVdy7Yajp1OuKjNFtcyxwvBohW7XiWQawCIjDMr
         Y3TyWwyxnjogOCwsqcobUTkOz/Ckt7Ff3294Bu0LvC6ba7av0AlETpDG/8riGf1qDqyo
         N5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734436; x=1788339236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uS0/faMQ3MvU0X+b4yCA4xc8M+/0GLQE7vv+ceiR8g=;
        b=CVG963a31ylWeK2M6d+kKI4B7JROdw+8ca+wcCeQcgltVLjW+6C/WqIN+gfeLUVALb
         0ZMmo6Z/t/L83gSKMj6nMMvWQ/E66Xn40PUt/2CSLZ8RAwdawQ0XEimFgdK0UEKqPBAJ
         wfsANNSZUstBVP0nJYNDWjJZ0gR6Fm2CKQLi62icAAMM1mH6saMbMouhO2IYwmZyCReQ
         SpA2cm+rXfJVtU4F25aWRpTcB2O87N0aZvX55ai6m2jGGb6Jdm55s817a+hMO+Qn27D8
         VFk+8tSzY3begf6oPzQff0WdqCn+MKq4LLcewnC1DpvBkFMPTpC3II97wP/jol4pjaoQ
         nucw==
X-Forwarded-Encrypted: i=1; AHgh+RrfYrML5gotwyxn4ActQA6SeVD7QXwyUial8vDJOHcLnSZNsOuSQwiEGIFuX2zyNfliGCSK6WnaLJp9@vger.kernel.org
X-Gm-Message-State: AFuF++m59/JsovYoJSnE/faitifNZXOuPvtwRn0IX+9VyPkQ7wObdryh
	WS9bAS3AeTX5r+K2F/PrrerHiASVspa2BmvUJNYhn8Qn21ELxLjIKsE5TvE78yp/THKTy08E8Zb
	clHf9KTX33ZUBFNrJGY5TAJMRH18Y++pwUMLi7CbdroFzykQBOsq1XTE6GhbWtsjD
X-Gm-Gg: AR+sD11qZ/Ic1Yd2i6s+QEpvEx1wvvkSbo00AjOoCyg/iRX6SyTE2LQTmYo8gXj2ado
	C/ANav37p94vkb+XFfpRc3qXtuo/1dnl8m3N5uMu3XpnOh7sY+8oQaUJ9FTYebNXLvcAE7OT5Y/
	/D2rxeFSEGdvWl2OvLtw5Sai5rDBHzmZL3UkA3nbxLLxR2YAxNyRb1JC55E9YCQkl8fNLrq3is8
	LS6mj6xWJV6oW+3vuyyxbBK9pQZWQPnnvIb3SARFIgcVRUJNtSYbET6UAAxMHVKNp1TNWul1O7L
	R/mPVATaxQfK8QPllfjhKukgLtvAX5lx3BY0suMhrqrzHJQwz1i52+TViCHjBDpC5jimHfpWOKN
	4Gfs8wCnWY+WES4mTAof+sj0klIApvbwmvH05z3xkfADvGJ9t3fVMyJDkcyX5
X-Received: by 2002:a05:6820:82b:b0:6ac:a45e:ff84 with SMTP id 006d021491bc7-6b1a03fbc5fmr4569161eaf.13.1787734435818;
        Wed, 26 Aug 2026 01:53:55 -0700 (PDT)
X-Received: by 2002:a05:6820:82b:b0:6ac:a45e:ff84 with SMTP id 006d021491bc7-6b1a03fbc5fmr4569140eaf.13.1787734435403;
        Wed, 26 Aug 2026 01:53:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a250f5b0sm1223020eaf.6.2026.08.26.01.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:53:55 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
Date: Wed, 26 Aug 2026 16:53:23 +0800
Message-ID: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nedTRwqKgRXbWlO_Gx6pvhe1yOmd5zfi
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ea9a4 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=maVgyc_Z7UK29R2IGXMA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX7jEq51Y7AUW3
 n+nE7t0133YOjEAczDal4BLyI4TSBG2OCV39U5NaAUE2w4tqD7sQlX1UbkRILwtCKtQiv16VB/b
 LJOjCYKm/xjDDaGD4KV3hvRF0+QNcWc=
X-Proofpoint-ORIG-GUID: nedTRwqKgRXbWlO_Gx6pvhe1yOmd5zfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfXzqfpCi2JDOqG
 42ZLt7i8D1p+6yCE5LlQxMjg9ps9N3MV7XmjHl+VlmcMF3BUwcdNxvtuomisoC1ZCcncvhvsY0W
 Dg9B2pK19OsIH5zPn+FqWg7zl0XqcGyiA17wUJBBm6qB+KQ5mfjMh4e1/BV+3lu5ViRWXrpkSyL
 O/kOIkqM0HZE1A9DR3pYErapsjOZrtJNhHB7WmrmmJl155z7qm84UKZRLbnJiBZj2lwKI8Tlqk8
 HsSNJXPQ+pJGyGKKHYapl7Kr0JWXdV4sbGSHcylCAV7GaFugPDncMLuNtpFGJZyBdGcAGOTRNt9
 wb3eOSQJHydRUUwwNiplehh224YwSl3DS61+VboigccJaoJQuBigWmhrFsUA57g8WlE2TCU7tX6
 ABYYlC7++7uIRSakG4lRw1lrv9A8SxlMatOre982F1wX6bPcyVdLeas1CjTsx69xgFP4aVjWlWH
 w8BAEDgKxxtrCgnye9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260073

qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
directive, so any DTS file including both headers carries a redundant
include.  All affected files only reference RPMH_* constants (defined
in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
superfluous qcom-rpmpd.h includes.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/hamoa.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/milos.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/monaco.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sdx75.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/sm4450.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8750.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/talos.dtsi    | 1 -
 14 files changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..d24a538651ab 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -21,7 +21,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..0a95a91d426b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -19,7 +19,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf678916..99af314d7de4 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -18,7 +18,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..395d32d36844 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -18,7 +18,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index a2d93fd68299..2ecead79806c 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -15,7 +15,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..0fa4cd81bb86 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -15,7 +15,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index b7dc40f3778c..bc9c788b92b1 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -11,7 +11,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..8483a1bc56f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -16,7 +16,6 @@
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..100faea925a3 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -18,7 +18,6 @@
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,apr.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..484ec8ec8c10 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
 #include <dt-bindings/reset/qcom,sm8450-gpucc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..57d36e1086dd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -19,7 +19,6 @@
 #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..7e397a09b6ff 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -21,7 +21,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sm8650-gpucc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..c5240a08c04e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -20,7 +20,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..531cf41b94dc 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
-- 
2.43.0


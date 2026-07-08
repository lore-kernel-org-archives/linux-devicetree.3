Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F721372B32
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524624; cv=none; b=Ip6t43KfPrt+N0SCe+zv0Jyjsfw0KkSamKUZWrTl6Olo2TOEL79+RTnN3K5U1pMuGl4SQJWUdSpujzzx+NzuOGqGw+4vHbJNDlvKXcRIaFuSbZmdIT4bSBffw2iKo/2Z1S9swmqKJagLUH0KrqSn/u+NVOjEsqeh8kLFAS/sBZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524624; c=relaxed/simple;
	bh=kExEI0u2FCHOGCzrs6gLrUUDf9Bz6z61FyEuo8oNCBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TlyUUUgsaA6UZOsLWg0G8glO6w3qpsy3rdiL+0lG/vhzTcpTimLCJkcNE667TaQ39DZNdlk2NvPh40dOYzgu2hVNcMNdsRoSf26Ckyun0ZiNQ3uDbH6gfQS9+K6bgPk0dQwG8tXOX9A/jzhfx97leSKLyPl7D2/NybQWAJqJrEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOxnlwK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaBcyWV2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOxnlwK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaBcyWV2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3VJR2738647
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WBZ5IOMfH4WhWXCherx//t
	8qk071J0231mN+6mZzkiI=; b=YOxnlwK9DfGuTaY4OT760BBWgI77cQclffgRkr
	GjBfBCXxnoqIAin4q7QAorNpeG897/ZoQoKQS7JHG2NHyPlC8KJykrnjHdmpqvI/
	08OrCy+IAwu3wuB3/5Yt8tAdUGvOtkuvepR6JkpYE0MqBy5028x9IUWoFJFEaZB1
	cP82EAbo0NjwkwQmF1XQgdsEyMAg4CEbzg4pAra+hiqK8WixvxZe13bp5FkXZYay
	lf7BEJ7wEESse8jCpi49y5nshhxAwJ1t+960Wv5gRdmQ7GwyeHoeRaJzluT7JYZ9
	ThA4KwlOrzSLeot7bWksM5G9SU3Q/5T1KLvsT97UE7p0QYKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv23hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:30:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e6f602cso16003561cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524622; x=1784129422; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WBZ5IOMfH4WhWXCherx//t8qk071J0231mN+6mZzkiI=;
        b=FaBcyWV23pF3cxzNVDbdBU0Hxqsog9TOYKBDx90YAs6LQHwbLRRLdan8wbls2o2abG
         x9iz69dgc5rOkl+6Z+Y3cbCVHLvhq3r+khAWbaHrK/qJh2LOiIZZx7WJF0pLW9U0Lqx/
         7C7sIYpvNoPGnweb3b0g/+oQJNkPoMWtuubmTJkxncmmp2TkGUU6Xd1PZay/0I6j/Vsm
         0M1xtChEZg+7MTHX2/7fGfxQedS4/Y3WETaKasn1FXleVSbllrPGdD7R0C58rY4dLeTx
         BEevcRK+tsIBriHsXb6dT0ihddmwQVHpMLJ2pL7VhVn+pAWT7tti9M2UyrHjr6uc678t
         bIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524622; x=1784129422;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WBZ5IOMfH4WhWXCherx//t8qk071J0231mN+6mZzkiI=;
        b=fEQp5lOXI/5z1NBoUciAKhThCasB+gCbjIMcxbomiFiUqi5go1kYES47D8+IZR1b15
         Lt5mP+rPTmI/0VEK2za2PN5JKS+MSd3Pl/klzvFGpeAFEytqE1gwEoivr+qE9cQO464R
         RHpRIQczOM6iXYCQ2LblBXT9qAKxFsr7e4qLDz1omngs1HAgM/xZ1FyahYYGKoLIJjlW
         M5iM06+QX6mKqE5J+tx8L9SnFsGOQA8YiD2iYz5gbWHPbVsdS5XF/EOb1m1yUJHFtV9u
         GM/dy/uMg9rLBVqMN45LL+9TRXdQ0HjAF/pLZlnlaoVpIAL44np1gf/7R4Xt+NSvMSn1
         6bzA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3UqVYW24R6GF8g9bGIrDew7kMufzf7pBqRoRwDd/MSR5m+a+GIAOUGeOSaqd0TMvH+HrWEnFbM4PF@vger.kernel.org
X-Gm-Message-State: AOJu0YzbAQi9GyusZuxKMv2JVJnoZbcIMwDvcYRylPdKTQTZiv+QTl57
	R3sLpdkBcsbzietxd79vwK1iKDoFBifgxtnTBcaFa5QEtwlsLQ3N3NJQm2XkAh0ksrNdzW18pzb
	lJFS3T+b496uSqeErrQw9p7ks/TE+Xz7sYXIyupjrmT2kDApysSzpw+WlVN390llT
X-Gm-Gg: AfdE7cm79+lrazH2WR159DFhqtR6gsLYAsEACYbfdxxcaDcjaUsRXpnBKIDEdHQvKQq
	Nd5gLVPPx8VrvSYLQuLSqfPSHEUs6dnGSFIgtMjfTl9A/D+wuJmyPPjJz9Lh5gMy5FH6lonITDr
	wOlZI+zG22dpwo/zIwcUoY+GLQvICHaZ62bmreQZeW2J0jByT085Q71OmMGUyrGSbgyW1ffQfZR
	FGpiINPj5pqXw2Z5zoo2yDb7Cki7/dLNVvbyEBIo4iDSolbKf4fkSYhAGx1bvyUng2wksQxu4bo
	rv1IMvsqftj8NDH+7RGd2EVDpIWKRPUT0l52bvn27fGz7EsieHu6otArU8UaLlx58zmpcBCzaAH
	EOzTWciRw9zDFmRAKtnZ8opfes+ENtLf0PYpLF5l1Tv9Fs3I68epdpRyoJw16gODT4gY3JIbwqu
	pGnzj29k9QtU2s4USd163Ffp5YmNKRqxmA1ifpTnAA449KZGidx5YpHRU3IUr4cPs7EMolmQBBo
	fmHU6BStQUg9gFH+PoI
X-Received: by 2002:ac8:5fcd:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-51c8b39902fmr31424151cf.16.1783524621943;
        Wed, 08 Jul 2026 08:30:21 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-51c8b39902fmr31418391cf.16.1783524617372;
        Wed, 08 Jul 2026 08:30:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm348665666b.59.2026.07.08.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:30:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:30:13 +0200
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAARtTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3aTSkpL8vGLdzPxi3TTDNLPEREuLJLPURCWgjoKi1LTMCrBp0bG
 1tQA0yNmbXQAAAA==
X-Change-ID: 20260708-buttons-ios-f1f6aa98b6ea
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e6d0e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfXz3e6q3pE/Vww
 fs0f74bpnlAsTAiyq3ZMBswvL5Fj65vhWYCbhVHkM5b3Azo8GLE1UJR6Gxoqj0fc/tX4o0++/OW
 AFw9PlKSodS9fXPYvnEaOcwXkpxYvJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX7CfTkH+ch5i4
 eXE3AccwhKIDEAS5SzndsmdzaisSbRUK3/7hyjbstBlyY0laDnj4uXV29+D6WoKDGpfTUUMg2+G
 odQ1SrYvQC+p1uM6Vlw9/itJLebmY4xNGgOXh3CtQFWpS02k46sXubRqm47CwM69ALGoaaQeG5Z
 Q+7A9undOh/ebcAxCMlMIHYO+pujYZLuY8KW4DUmQW2a+Z77Ia+cOW/P3cNzhAnzrGjfDm3x7ar
 aNiXaC9yCsElf2lYZ3zQL00ADy90nRuLRNm4MvbG/0O/RSF6oC234f+iPGKXnk6NbwHcFtAAXVx
 gRyKLSlgG30PhSHMVfHHjwW5uK6zD+FhICzVUPAbCT+JpjFID2DjF+2r5mVlRgJ5UTO2pcQEVew
 4u2XniFfmh2EIbNKPqxpLUCw3SBAfjBlzQC8CEDO8cpGF6E42qJ1P25ZA6h7oTfIH+mm0A9zl5h
 7KVPmbNQHkVcAj4ym3g==
X-Proofpoint-ORIG-GUID: p0WHSedVvy-6KXnZNz4gwKqflB8O36rY
X-Proofpoint-GUID: p0WHSedVvy-6KXnZNz4gwKqflB8O36rY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080152

Add the board's horizontal button connected to GPIO69 as a gpio-keys input.
The button generates KEY_SLEEP events and is configured as a wakeup source.

Note: The button is actually connected to the onboard MCU, and forwarded
to the SoC via an active-high GPIO.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 8b3ed73feb6eca6578382beca588baf42b8c9bb6..0407b700f6087c9350e9142027e085ebb87f0406 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -33,6 +33,14 @@ gpio-keys {
 		pinctrl-0 = <&gpio_keys_default>;
 		pinctrl-names = "default";
 
+		button-sleep {
+			label = "Sleep Key";
+			linux,code = <KEY_SLEEP>;
+			gpios = <&tlmm 69 GPIO_ACTIVE_HIGH>;
+			debounce-interval = <60>;
+			wakeup-source;
+		};
+
 		button-home {
 			label = "Home Key";
 			linux,code = <KEY_HOMEPAGE>;
@@ -501,9 +509,17 @@ perst-pins {
 	};
 
 	gpio_keys_default: gpio-keys-default-state {
-		pins = "gpio79";
-		function = "gpio";
-		bias-disable;
+		horizontal-button-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		vertical-button-pins {
+			pins = "gpio79";
+			function = "gpio";
+			bias-disable;
+		};
 	};
 
 	adv7535_default: adv7535-default-state {

---
base-commit: f86573e68e56a7df7d54eb58101ac413ba731996
change-id: 20260708-buttons-ios-f1f6aa98b6ea

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


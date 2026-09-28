Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9C43BD643
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575850; cv=none; b=ciy5OQIIxjkzs0jBdvKhg58h7xQO/U2gppJ5GjjBvx0MBvAC+u+4tnwVZdr2ieLI9psN8QO4kJDi6va99504ZO94DfO329J7njsHZP0YkV54N00ECTDJdobWMcf2IbjauQ8sxCC4Uj9Gh4p7tHC30V5IM8sN5cM5hPYoQ35XH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575850; c=relaxed/simple;
	bh=Pc+ikFCDBvxBSt1eTUgtUUWzverxRmRTMcb4LNEPMcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GY//BY1CaonXrlfI58c9o/4WgXxWpaXmW4G4IsFBhY+iYGFL8XwSLYoRM4CaUyqkNce8ea+IGfxlTG4ijiOJkyqWIH1Oh6GFttlrnxQvLYxy57AHWeyI8mXkU0GMd3JDrS9uE6IRtjiMbol94mB9NeEWudsaGCaU9XEhRSOj49w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFLmhLoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gy5dVbMe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFLmhLoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gy5dVbMe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RMKq7W2482757
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=; b=MFLmhLoqKeJw0Beb
	PMvzA51gfP43f8C1p9ecE+2l0+8xhIJ/26n913sU6Kbag/i5pwcexcfdXJ+2wEbJ
	JG0DW6LTHCq4rZ1h79IeeUPUi72tmb4YVe9qHlz4M45/LeBti6gLxxapUejtg84t
	3aBSlEPcLZexrvoVdWLogqIaaqnVtk5+D/krEtcbWezZard5DJi0QZl07aU379dF
	gQKfZKIgLt8cjGQM5YLSY1M7seuBXvCtBsjw24pwumGu07uQ3GxYaCBFxgLZjzag
	G548Iy6wXeeCjK4yCkXoB4zuzqdUmeRH7fPx+thFzPkokRilAWWcMQSTdbDcSMrm
	w7EP0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jvmh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:10:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so3236009a91.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575847; x=1791180647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=;
        b=Gy5dVbMeNip/WfNmekp3RT2JYOKJMTQiRR9btWNMlxW+WIfXAs9nh4FL+GvuzwPmWp
         uE/SrLFRz1z+0bHHG/319EQScHPZedsO0QrckFlBJwwCK7GrGrHyUpdf6g7uCIjbAzum
         Wy36Pef/dC9jvtjPxQLSmM3b+Tvdhdyyse5jps8dSuiJv2pW/ijISlhCva2ACKOG+TRj
         vLPXtHweRKnOpYiFAqYz6SYGoA4/ASZ2pIjDRzUpjzdQJchU1DSqdDcXC6eC/gWIqqQa
         HvqsVNiDdA2EnBwvGAKZx2HBHt150uBO+yjVBeonG+T3W6uz1uZ5xdk9wtf7AcJyVOlc
         oa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575847; x=1791180647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=;
        b=qcCzKCB+8sV7OnC5DS6q6pBs32A/HFgEBvKfLfC31CVOIVKgU60uuI4sOL7TX1Je5v
         KgKZLtXDX8+kJmDyhMvU+8OYcyfwgkFJXIq2eOd1qkp3cE6FmNt/TVpiWKtTjc2HQ/pm
         tK8B28mUxJm0LB25doGW8za8Cqq8gpX8ck3hS3RHIj5Ouo3HB7DB+7KJO8ILDWTSrxa/
         NzSJbD5cLHr3IEDWlncSWw1wTn/ENDoFVV4yCdUenEI8ngiC9XgjGxwjOOFvoe10uqNI
         lGSCf1xdBQRWOe+OCAvrsim/xEOn8Vq0bB8UodWs+hbLB8uHp2IEWuLWYwhUQYCA1vtw
         W/sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVzwxoLhEqxQ5svUts0VIKyiAArFSy1xLy1sO0tLel7eJ/pS7W/0OLeoq1gpF+8riqItnByr2kDcE1@vger.kernel.org
X-Gm-Message-State: AFq9FYIYqX+a30mW9u44mLotVMAKPOp9qmcDuccm4YbBKVebpe4PsQMJ
	ximeHbDMGjXAHHdjdkPeK6tQb9qp5Qxw68+vRALuM01/Nakk35u+355YjiK2qzB79I81nHz+bU0
	QknMfv0Xji1n5VCe227LN8Bx/rED7j941dT/X3JbE372Wns8OtagCWYiOmJRocVmT
X-Gm-Gg: AYBFou06iT3NdjJjza9RjxZkZaqeSR/4jQsxB/v7/U+AKqF3qYv23J149T+/3DohCu5
	AQL3GOp+zpGe2h6QQE0ocd66EqAZOfttj6eg83TrT3mhkj7SgfexFCsdJs/WiOjGM34cqx2gi0i
	OjEp9U7ZDAvfXw9L1Oc6wG+P9wXC1fvwQWmVYKm0cAEnZSjOAzBAKbd18kyBIezlgWdUa8KlwrP
	xjkS4nTymWUx247bttz99fUPwb3bx0O1/pCGplolOhg280epH3pSbEZ9g8ouXAqZriqEi3LVVcJ
	ixWYIx89u6UfDaUGo7/pCsqlH27YQuLJGXKBx/Lnm8cb9A3FFGYLxfTccuvLhH+Le7AfyOX9lu9
	lCsP9VWMGoekBSSstn4J+JqZ1vurlfVbCnimm
X-Received: by 2002:a17:90b:2790:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3a0d265389fmr4181642a91.8.1790575846655;
        Sun, 27 Sep 2026 23:10:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2790:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3a0d265389fmr4181598a91.8.1790575846112;
        Sun, 27 Sep 2026 23:10:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:19 +0530
Subject: [PATCH v26 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-7-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Pc+ikFCDBvxBSt1eTUgtUUWzverxRmRTMcb4LNEPMcg=;
 b=0pnzFtnpSSGd6K/ogS70pPcICal9QhK0HOM606A0GQXA2GVuZ73fXvD4bQl3mspOIjHAaNbO2
 T+hmTqYkGURA0r246+yqn1A8hmx6589xHrz8CqG0yxko+qSqJ5eRXgn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX3iqJyxqactFA
 4Owl/RV8Tr2d7UtnaKbzpMSKhkO8U6Uz9NhB80oe9zPYhcAUpCm1rG1UHOszOSOCo2O0UqLwNUc
 l76XQG6Vo40gtSoFbiyLmWrPizwTN10=
X-Proofpoint-GUID: 5tBjkxTZVnq0lzTzGKoZHgTVFvpnHp8m
X-Proofpoint-ORIG-GUID: 5tBjkxTZVnq0lzTzGKoZHgTVFvpnHp8m
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba04e7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX3po4b7ziGiCq
 ljwj0MLctiDyDaQ1CnMMenx9KUm8W4PBe6jyQLizeO+1nrsIUHcaKoHYh8TPrJTA3gzDAX+/z9M
 erIUxKeysB/eoi6mBJ4lbg753QK27bSWXo3/cs/I7hT0BTXD+SqnAjUrejx6MeWOW7bGlbH2eT+
 kyRowyhMKkoUKdTJ+hQix7YICJquCEbnfIwIAXD/uBM4XO72UFTWOUr1H5FuPdM3qrxcEPbS8+D
 3bUM/ghBzJwK2jDI9QVCbvNCdb3t6bYqr+du6ogEM6gEw23hRbBFKUOHDqeom0afT6kmwyiLl1E
 rXlg6BrPBSn7GovKQhrmd5Sin5H8rAGdhRrs4YlXkT2//htj5boQ8PPqTfxQ8i/cPyho0rCgJVT
 aMQlAYy1uWQd4ltCddyy6D2AhKzXmb3hMDdIgy+K+dISzUytM3wG/nHtrGo0VXLuY8lSkmKrvZh
 uHxbzOD9Vfj/uRsypLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..307fc45af37a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..c9c1b0c48550 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 477d671bcce4..a2ccacdc9ca1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1102,6 +1102,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


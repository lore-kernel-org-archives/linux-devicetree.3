Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0759395AFA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333191; cv=none; b=Bm+cl8e8f7tLE2g6Npx39UGyDxTwYtl4TZCPkBGtI3k28O9rAC/ydhrQ+/HE3WXqnjWELFBzAnNExiCLVOF5t3rbqZGkuu184IlgW8KoyYoWhDKvUQKJcrtiUm8+3JX8cfp4HufHZNVESKDLDhqy7HloZtpcZHBBEKavgIX2TUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333191; c=relaxed/simple;
	bh=VDmibN1fWdrfR9pAZ88lBdyDaXap/xrx0iLyGpN/UMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXnEwwTgVPOZgV5M3uXHnj53BToQpuBH6/hWQX6TKDvNsQVrl6TNVzxeNGdyh9ivZwfQA2uoNeG6bpymbCMG88LWsOK9QBZ6akBXh3udKwjlSigWOsfVf8OnE5qYVvAMxpHjauuN36SKxSj61LBR7Cl/B4Tb0K+0Bm7UNhA/DZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWNPjtJP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSvImkRB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWNPjtJP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSvImkRB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693wEF4108105
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YibEw3sJAcSolHqapmUCOXlWymZOe8hxYzM
	F8ebBqhY=; b=bWNPjtJPsOwdMdmDkytasz0x8uk0xSuG4uNUSVFSyWWXvXgkimM
	0mQ4t4uSlDT2/QNYgHpD/CWIK5yPyfHA1AVcQWHT8yPkinEpQVZrHOrvg8E819bT
	K6OLaSwEz7dRM5RsqsA4QalJJcytD3MgsWMlSUq841sbulBluV2boWmcSnXPEkzT
	TOlU4qBz9DOTteV7EssKNyqXAHfyo8RXMQpMwWVQ7LPRI4Y6Olwf6CdszwOhY5oj
	3PESfGu7PhE1oQBGAHjCwPqa2SWhQKH24weaMBMLsK+9uwGg06g+3LbPBJL7XgC0
	qHpQfszSz0z3U1PRBW5gpH9UxE+ke+f9QwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrrh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e59b0e0f4so199763885a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333188; x=1783937988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YibEw3sJAcSolHqapmUCOXlWymZOe8hxYzMF8ebBqhY=;
        b=QSvImkRB5JM0EQrJjnYIxgHvnPwflm84/DdF367BYYb/4OYwrbOIM3pCHowgo6Ub3v
         ckw7YoHsXleBSNYulaFb1pobWPIPjzbbZDR4ya3U+zSnlxCGwvxtkXj5M+RCKFyjL8yr
         J95AjIxa82P7J7grIivynBumNr2efqZnU8WNIGs2vdIjWU0SH6zLNy1g/6OUWjHOt+sG
         8zOk4xVUKSaddFEhzbR6nBj9jWE6KMJmmXBEVraCGWztEFb7HiOOlXzr+P6gVEGsjB3e
         v2UtsPoLptqcI7MHgtLrdhtSoQE41YUUT1gDDWkwDUd+6AbuMg/VjLgdizETEfqrj1Zd
         Qwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333188; x=1783937988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YibEw3sJAcSolHqapmUCOXlWymZOe8hxYzMF8ebBqhY=;
        b=NwOH1vSrSYpyG2WogIUGFCwHEZ+Tp7u4txiewc4lsYvFlQT63At9hsMsmXgftyIZmX
         6vLFdI6rX4sENl7YTc4VjIGUjtMhB7VsDHvBIN5bIOYdELJotMbKy65IyFMvyo7GEVgi
         2X3gKDXP53wWLjwZk0L1akLe+0x2ivBkqrIjtCwXpnzEGCdr050fPYdpeUCwNZm1t3DZ
         KZ6FtiSWV8SmQCz8EUgTHJkpFzs4HdwUMVCVkxNm0RwKt81gzxG7yABa8HlE5MF7rgp5
         FlrCmm2EafFiHgYVBUh1VSQbBJ4nrmC2UssjmTT3y81ynwb7ZsX4Hta+/wLLtaYjQdDU
         ec2w==
X-Forwarded-Encrypted: i=1; AHgh+RqIX5PW+FufibX+QAKY5oIBgsV1KJjzTSCOZYZ4HzCM1vy3z9os6cfDwt/wrxkrrL1FsUMqySCm35my@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa2KrD9OtZl8Jrl8OdxFIUcXZVyrmnmPDuKxtW2Mg/CeQOJIMl
	d53m89KlQk+5Gz4t7ZGFVLauCUENwTujZqNHLDsuU6L2trkynwD9hGVd4THlvs25+57Jr3uo4zz
	yUVyq5tFvznknKnwssRfvR1zc0732ZIolXKL7wHK7MpWCpIEowavdAEcaidUiM2j8
X-Gm-Gg: AfdE7ckxTvBPI8cF0037CUrlHep9HGEprNIctVY5zgPtOe9ApkQtSnEf+6I9n0IFzX2
	wRVCMpoQ8lUv+dtEF0b8X18BukHOzq+7WkOShbhBqW49tMV03fKcb0UpX9epq2G9TjAjGq1cqyN
	26rlwG8uJsZRXKpkxizOiD6biH6hgGEXrxP/5MSZZu8ZIdNs1qgZ36vRo+EXD3xCGKOksh+DVyq
	f3iQcCPFk1RuU0q6xnQ5ZuTJ9ea0C0/mgaC+7VJPDjfxHxSxUfDaBmW6mrzPqElP2nGXZ7/CELd
	5AvS8nwQoIb4V3yqxMqjcGFMWXKekhKtxBm5ictCf0+mSq/xE51Erpwx+kZpMN8ZC2g0RgghNG9
	/lkLlmfIJw0gXZJhda+OOZMXF0Tk=
X-Received: by 2002:a05:620a:4010:b0:92b:774:da66 with SMTP id af79cd13be357-92e9a4e2ac2mr1284755485a.56.1783333188210;
        Mon, 06 Jul 2026 03:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:92b:774:da66 with SMTP id af79cd13be357-92e9a4e2ac2mr1284752685a.56.1783333187744;
        Mon, 06 Jul 2026 03:19:47 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm23476020f8f.3.2026.07.06.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: arm: Correct indentation
Date: Mon,  6 Jul 2026 12:19:43 +0200
Message-ID: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VDmibN1fWdrfR9pAZ88lBdyDaXap/xrx0iLyGpN/UMg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4E+/PLFebUfxxG3EhT+cKJzU1imqeU5JyKiF
 O6NaJZnmVWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBPgAKCRDBN2bmhouD
 1zCAD/9WYw11atzwt7os0PeoE41INjD3LkexrCCcqdrxUHKNOZwPLIz1FcS+OUZ0HtHuPh/ua51
 /sqtLD+PxCBd8jH8+yAyg/wkZSWRQpmQxqWtaiZ+7WxFOiNSV52ddVD3qi9NbSQZZDYZy9T2S8Z
 rEnrJeeSb/BCHLIv6uVG4jQpkIzDpCOoCyp+2EwJ0sDiJ5uRom0BIoYihH1RSm2ODCCi5vptWU7
 kNuGjdkqvIuW7fNVOL3YLwifEyGOSpoQRRTDCl0Lqk39EKUDykNYIalrOquy6MS7211m1dsqRqd
 DrZ0Z/tYLIb0nMwsEXyGH5/XsrBa/EFlxoToiUNi3C1PlXuzFQ/jn0IZkw4SeA58CxVlxkD8O0T
 ywJBDhuxo9tJZuiiuX4nc648gPv6bKzHBQJRKUTU2tD3gyEvk2cvlxCD/159IdARA2n3SfGjIvJ
 v5+YYGfyxfRgzw1EYmFflZPlETQcgnH7iUvsd86QmB+H2RLhvfAjUUA0ZW2B7NUf438FM8V0q+9
 SybexaDn0SiYHdrvLEitXOrz4qP+n3vSOTwTSQQRdeeGFb4ahz+338HUhoscTHO7VJgQm9b2goE
 MJ7NUp3KuyfMcts8NF7hy4kuOtvKKr0hhsHZqxLr/CtW504KRlEUW0lR41T5KS4YP3g894buhJh RguOaqfOnCAsOsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8AmDumCnGOrZH588vHnsisTVTDDIanYt
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b8145 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=X-djH8jZVkJicJ5Eiu0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX1fe1O4aEGmhC
 RUnL0Hi28N3OTC0nyh+Geh2NXEUv6TsOuZDl5sB1jyWgyqrArR6XFnTcS6fL4cYozEEP9RzAtU9
 Q+0ArSuzVfpaZ0zLRKWn9NEkL3a93bk=
X-Proofpoint-GUID: 8AmDumCnGOrZH588vHnsisTVTDDIanYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX38No6HJxT0aZ
 bkTAtD9TTHMytazo/KDTTuuNP4nlWlRKEuvhtipji84oK8OopvqAsU14tjNgyHY1w+MW0kDxZ4f
 goDi7rx04FUiBwWpEPZuYhI0/IC0bJ5lZUdNRG2WIpCDLsjitf+78PYPGfDZdIAGvSNJZ9JlGKT
 nkboNacn/2A4gDBTFCVlexDoAkjeSBIGAoII61MhDNYBUzPrD4SH+C2s0ubIjr9MeiHhJnHl6le
 81Iuk5yaSdEvVg6p4vXZIvt6NLouUzjIBjhG9xM9e4p/D6KIlT8o3zpmi8BYvp6GEcgkNVlbu2S
 6vsiOxycuy5gbuRM/YVsSTLWgjPe+hh2jzNEAsH4eZvpIY32ApNng4ylUPCAfVikGq/pxwEuzkB
 BgtuWcEtqfaAlvo4+vviaNYByKIxKe9BC1tJu1zz6kdff7Q3iKxd49P7Xnz7k/y+IJI4bFKMK52
 aGdIy5G1stpoCc4dqgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi     | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts  | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts  | 6 +++---
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi    | 6 +++---
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
index ae370d4eb9d8..f90e28ee4cb9 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
@@ -51,7 +51,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	xtal24mhz: mclk: kmiclk: sspclk: uartclk: wdogclk: clock-24000000 {
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
index a75d8b107fe1..1cd095496832 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
@@ -53,7 +53,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	veth: regulator-veth {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
index 59c78def83f2..635b09030f60 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
@@ -153,7 +153,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	veth: regulator-veth {
 		compatible = "regulator-fixed";
@@ -544,7 +544,7 @@ timer01: timer@10011000 {
 			interrupts = <0 1 IRQ_TYPE_LEVEL_HIGH>;
 			arm,sp804-has-irq = <1>;
 			clocks = <&sp810_syscon 0>,
-			         <&sp810_syscon 1>,
+				 <&sp810_syscon 1>,
 				 <&pclk>;
 			clock-names = "timer0clk",
 				    "timer1clk",
@@ -558,7 +558,7 @@ timer23: timer@10012000 {
 			interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>;
 			arm,sp804-has-irq = <1>;
 			clocks = <&sp810_syscon 2>,
-			         <&sp810_syscon 3>,
+				 <&sp810_syscon 3>,
 				 <&pclk>;
 			clock-names = "timer0clk",
 				    "timer1clk",
diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
index 0d3d96ffa6e6..366c8baefe8c 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
@@ -52,7 +52,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	veth: regulator-veth {
 		compatible = "regulator-fixed";
@@ -373,7 +373,7 @@ timer01: timer@10011000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x10011000 0x1000>;
 			clocks = <&sp810_syscon0 0>,
-			         <&sp810_syscon0 1>,
+				 <&sp810_syscon0 1>,
 				 <&pclk>;
 			clock-names = "timerclk0",
 				    "timerclk1",
@@ -384,7 +384,7 @@ timer23: timer@10012000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x10012000 0x1000>;
 			clocks = <&sp810_syscon0 2>,
-			         <&sp810_syscon0 3>,
+				 <&sp810_syscon0 3>,
 				 <&pclk>;
 			clock-names = "timerclk2",
 				    "timerclk3",
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
index 6ef23c53d2d8..64f87e6c12bf 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
@@ -209,11 +209,11 @@ dma@7ff00000 {
 		clock-names = "apb_pclk";
 	};
 
-        scc@7fff0000 {
+	scc@7fff0000 {
 		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
 		reg = <0 0x7fff0000 0 0x1000>;
 		interrupts = <0 95 4>;
-        };
+	};
 
 	timer {
 		compatible = "arm,armv7-timer";
-- 
2.53.0


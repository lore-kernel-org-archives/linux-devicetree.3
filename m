Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D73AFD09
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333114; cv=none; b=BxoOsXkrwTLJWhqHueu+E3llhcyDB91Pa20XsRsP7dfEye3HBqjLf8InwtZFMSxiSWtGIdrgGPZOLarqmNz1EoSZP/y0X7oNgYeOtOF0YX/HNGheoN9wsOmFxJ2cBpFWKlTIcHpa4lNfp0u2JLL+AylchH3cpJwYRSq1NL+lee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333114; c=relaxed/simple;
	bh=J8fceL42EKDgvezoHCZX2Tw8NeF3KSJd25+8oOQeLGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKv3z5jIV8t0ZJeLI5d/rz/p0HdA4gMtyYdYXpd2GKNAjkGk/SveGkcW5+XCCBv4FcSSJDGNlSEs5VrDdktr4VE+FiQplo3R5J22cZ6UXCGk/AnMMeLTuilLz9CjGuIk7zxbzRbgRnpA95jtnZKpGRm9LxxTaXt5U0p3Nop2kjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGMI8M3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vebi5L3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGMI8M3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vebi5L3h"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669Gxtt160086
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aDo8MoMAOCa
	iYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=; b=XGMI8M3e4LdeqaHl9ceYdOhSket
	+h0mjNB3HwKueGnasSlh3QfXzk9ZYYKlH4x2V2VsMlxMImqCSvbBmHF3FCDoFdWM
	RItxRkWbERwmCVd+IYoGbWssvARDPpG6gKwFRhUNPfMFGDtIHG+jCVvGJbkhrS/G
	N6oJekey7owg15tHsGqB3VNx0+1kv/JhbqdJ/FZKLepFbOmi8Ur4d5eFBZpPdjh2
	xYwxwiPYeIdjJQBavV0LQRfHpeZFqzNOMfcAithZ2jzfKgEkJwqnn9qXh6lgNVLD
	w7a4jJ2sYRA5pm8QyJrRjplZKMI6OYGIVBPYMghw8eKb/6UCRJVFRKAAiYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr81f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so296176385a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333111; x=1783937911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDo8MoMAOCaiYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=;
        b=Vebi5L3hfygeWORbDARyuWg5qMvqC02A3xwUrUnrlklb8pT7+FSQnCRxLN5x02MI4Y
         fyRk+vzBudw0o3cC2Z0Vrq3iTriVAaVBOtZENbghctWFQxpivEWCQQmyPR6dfF3u7ccr
         B2fpNMTBinJ46b92z7xbubxGz/MpHRTbAYYxmOtB93Ay++DbjbINol4g8HliRr+x8xtx
         rdeVAAYJZkEHzcAnXVIoHwuAxvD3DJV3ie9RDa2C3zDOTsQ4kuaKlAngx0BBDdFRmu3M
         yBpNJGTERsbPEo81kUCXl6FnPd6y2NA3H1EeEJTcHMH4VOUJUH6UUxa5WzrET+B5FSyy
         DObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333111; x=1783937911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDo8MoMAOCaiYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=;
        b=pxuz2XqeaqJXxfoI3zf3fZzoBF67wekkRL7CBr7MZkszvTS8tASRsUCmssbGMFWjDa
         +j9Cdy+JuU8ED4gkkiqercK9/lFoW7sHvOFlKiW1DvFUIxklhO3aQZDide8UFkl0tYVf
         b2u8wkfFPK7yZSKkWM7EAfWHz1zu0aaL02z9EradujUoeR0mfN6Ltg7z77kQyuuSR5Za
         GFRfsmc9woArrJdNn/BD2SSfcZjqJgw9y3cTo5u4/Yp+VyRfXaijHnq6abCiwfhg0o3m
         3SZE644VQojAYj5t5nLNjBsQjCYtpQu+32UeHkqxOUAT2ttIk0Vo6YsqZ56T7WLjHcRS
         ocLA==
X-Forwarded-Encrypted: i=1; AHgh+RqNaDiX/Cml0Dz5NCVnzSzfNB/gJBAEGBXEtlwYz+AdSGf5a0NOy+lkv59lIqjOTZxkdvSpFls2N14E@vger.kernel.org
X-Gm-Message-State: AOJu0YxGeDBmafqgJ6CUmsDx5hmxb8Ka4E8AMYAdwBEGeuB4MFIuUH8o
	v7HE9lGCZ+Px4jIueWdR1N8GFE5kjbj40yzDIZLtHhw0T9nim3XybJwuunrfa0oyj0vt0Kxa3J3
	7khTsEplMnFo3UkUHzY2zXehwcLsy8HlVrV5tBLGC6GL6Rayb4UxyKSYtmZE+EVg8
X-Gm-Gg: AfdE7ck5h7du9zsiKJ3llVmyKbwFfoY9/Rk8+VkUtEnrWJxoGEKhS8m1fzz7058T8hK
	3svkLUSUBgLxYnbGLJIA3+6VRihEfdZAlwC3beKvpUzdCUvBt9j3Zg6UNYlGYJtiO9n20MFLo33
	mvOI/SEsm2KiuatFXcJMAvBdUMI6mktQneyZhnySsMp1eoEqi6gdL6cbkFXNoMSwZR0TQMTcunw
	ZU6lnj4Lz1Ef9o9hFArL83Kfx0MdUUuoqYtPlAVwrk5eNFxjI6YWiEnwiCbR5Cb8JqVkfBH3Jxe
	IPyA3DhyHIELuhHnbshPS8YscHod7wTjfHHd5Ge17vXl6Dn0qeF/vx4uQvQZY9l0aeg+BCWWsA2
	RTTtf0YDMQja5xgQt8R4jklsOkFE=
X-Received: by 2002:a05:620a:4515:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e8b25e823mr1742914385a.5.1783333111399;
        Mon, 06 Jul 2026 03:18:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e8b25e823mr1742910985a.5.1783333110963;
        Mon, 06 Jul 2026 03:18:30 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm24350402f8f.21.2026.07.06.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
Date: Mon,  6 Jul 2026 12:18:25 +0200
Message-ID: <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4345; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=J8fceL42EKDgvezoHCZX2Tw8NeF3KSJd25+8oOQeLGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4Dw2EQXufGRpxmk5Rid8ltVbS+lkrBjNViET
 5KJPgUjwJ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA8AAKCRDBN2bmhouD
 12yzD/9SExFX4onHKFPfLA2LoB8/Wmf/a4TbrVGowWDUpYIEAW7kjaLY5UE5bwnLJ10Ts71c8Xt
 NhoixDDypxaKj9292THd1+wjz+ObgyF+v4sispqlf09zNod65LSjwtmyqeUHOQiqaEagEVcdKdq
 RFmbshpoNYzXAdykDP1ic999xNf4FSsBjhhftj43fIvcXOJpsJjXV02Zcrh3vMKOYbsicQqtPfm
 zV2wlQBoSQeOSyCEGYyrSi3ajC5k4OrSLm1MwCt9G0RdSf4jV43fEQFXCpjCx/leZlYbEjmXIq3
 rFDsxk87DZHu06J1KokFnhfE608C0/dYhtVU+4y8N4bD2B3diusPwoZlTP+GdWKuxs4jH05iI3V
 Jw+bQQT7DoWRaTqsGhqhCyyO8Mmq72iyIwXXr/PdSy47b8WxgemCN8N8lq6e0Dv/Ttecuq5Kl4+
 zS2XVQOt/i7K9nA7kbt4cSY5XSCoaIxwHlZziByCygpunhWczLXROG45OglIlu3ihl4Q6/hj6+y
 5ZeGCTXJbGa+ydGZ/j6wLhErFaXKQ87Z1uISvqqxZPiPmt4MphL67A++UQDODn/ce2voCtSGJP2
 NqvtDdpXNKInXwlJ4DFd6Zzqci9Tfs/OC36P1C3rFzoculNd1+TeB9wLCgEvW5VhjOxCAf58vqi IHiBC3T5YlH31kA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S04XfxYPDseqf2_KMurjoyRIkSr2KB0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX30Mt37BZ4s73
 BA5zfjyj6RJh243UJkKmxfH3drNHOsw022TM3fw0+Wk8h8PMSKA/14QbkJDYrU0Or4/T4do7XQF
 bJYc9BWyogDOK3BjgNWAZlmFe6WO8B7mUDmgHc+qGoCvJEYRRdqb/rivwb5xDpkkqlc9BLby4zV
 TAlwKoOCQIwEzL+M7o1rDHRevcUxOSs7Nz6G5rYRLaSM9bTC4N8OEbemticNhsg4nqX4ycEf5YM
 1xX+LPPPNr2KzEdaijs+ggbsY0AwcXMf6wg0BZk44ZkleCQD0Lt5ia0Ity1zHr2qdStpJXosDnT
 0kTNFiuDerAezkEMF1DNkFUYP/mEuHESoNxBoAyUi+Osv/ohg/q4rwBZDX2iRaQdUhQjjDSfR47
 5vIiE5PlHp0vtGrmRynX/R/Zw04rn6H7G79sfTEN8Eswd43X/+Jni5RFo3sQsCOsym2gaGKRLFD
 dDTNO5hN7jn5xN71pbw==
X-Proofpoint-ORIG-GUID: S04XfxYPDseqf2_KMurjoyRIkSr2KB0R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX3AFGfdfRP9FQ
 mJ7JDQly1GkR7wdFoQkSccaV47/Kf5ZSvRqzunQzZmOapFiRC0VzCKB9xAZ2HXELATmyS66KXHV
 tTr7Q8VV1Lt42pxfOoqqVtFixnGJBzw=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b80f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=muePWa0SRqB7cAwnof0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi              | 2 +-
 arch/arm/boot/dts/st/ste-href.dtsi                | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts             | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts   | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 0f87abeddc33..25a20fafc6b9 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -1119,7 +1119,7 @@ msp2: msp@80117000 {
 
 			dmas = <&dma 14 0 0x12>, /* Logical  - DevToMem - HighPrio */
 			       <&dma 14 1 0x19>; /* Physical Chan 1 - MemToDev
-                                                    HighPrio - Fixed */
+						    HighPrio - Fixed */
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 2 3>, <&prcc_pclk 2 5>;
diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index fbf0309e108f..a85d87665610 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -207,7 +207,7 @@ mmc@80005000 {
 		// On-board eMMC
 		mmc@80114000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			non-removable;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 1322abfc7acf..14ed1079ff6c 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -295,7 +295,7 @@ mmc@80005000 {
 		// On-board eMMC
 		mmc@80114000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			no-sdio;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index ad9a20ccaaeb..0c3eef7a294a 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -402,7 +402,7 @@ wifi@1 {
 		/* eMMC */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <50000000>;
+			max-frequency = <50000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 64562a3a262c..18fb7263058e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -452,7 +452,7 @@ wifi@1 {
 		/* eMMC */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <50000000>;
+			max-frequency = <50000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index cdb147dcc1db..c34d43a2b750 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -274,7 +274,7 @@ wifi@1 {
 		 */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 064d6fee8821..7bf4287f6e13 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -253,7 +253,7 @@ wifi@1 {
 		 */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
-- 
2.53.0


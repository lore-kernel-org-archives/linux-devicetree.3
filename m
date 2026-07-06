Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DB39B4A1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333151; cv=none; b=fSm+f8+iK+N5XvMsOpYYleHtz6fifTbqmxxK8WsWicVPnhTyseEAi018u3pQ/45kKapHPT0do0aRL1fYwqjI08+XjxNu7aK+ifVCzA5UxdPX0Xanh/ZG5NbHO9OMu9J2SmhLbgvZ33MoLhwhP4wSwIeLpygNIGEWoRhIfLRa64g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333151; c=relaxed/simple;
	bh=bYoP10yD5TtlArmXIdJE3yshVzCGxEq/GLpJ2Rh3E7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VH2WK3VeUQSWlt1j/3w2F8Ct4NJhWHYZJqixg6cjYVET58hIvUA67BuyUvzsM9yKVDRAtCJXXkYXsKUhvLOU0RlExQm2crTH+CQrAY4QT6KQO0bDXioey8saItkDMPr2RH97AeGfhIB/x8TJ0TsibYzkBmfShRQtSZPB3ue/mTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFJH5U3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4xXN1y2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFJH5U3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4xXN1y2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666943EL4108150
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fgXStR+vrHg
	H+n0Bt1NFXqO8qrllnjEuPJHIAOPIUpw=; b=OFJH5U3vvFjWF6hZRx2e97djNWN
	Rn/l1VIlrW/cARn69daqiSxg0BiFIj3VC8pdb18FGZ/3W1jRg+S4C8SDt7i94E6X
	AxCoivChfvFGk58qIrX/rP7WkUL2PGJ0ivyAug+o0gskZzyPuPe8UKkDZhPkb7sV
	/gt1M8BmtYTi58oKxXqEiG47Oa2PPbKtWObDpPuceQgXchlx9db90ikEBP41FUFd
	eb4lFu7w3uKSLaL/165Vivvw9ETLD3QU8+Ff+zzLQ+LJMuYbNqpPh4Y/mLGGaUpA
	Q+eWy5kBhZMrMiaWLl2Yp/di3NuevSCVsjhb+8AR3aoRFrnueiIcQFbf+fA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrrcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so271006185a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333148; x=1783937948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgXStR+vrHgH+n0Bt1NFXqO8qrllnjEuPJHIAOPIUpw=;
        b=c4xXN1y2AN38FK/p4XQdcfAr1GYDx72pBFMvWrkZceqHgSoSOG1FpKZaQBS9D60uoL
         7HA77rFYA9px8CerY50nqdggEmMmxmlFbpXynVoQ5XoedLdCQxvl6dXe0qqd+/pbgYad
         m87HbEYwNrTnmGY7wtuIVMut6EuSz9jJfl5xc8qAZaHMypn2hGn/9Th3GEGwE5Ps/Y/5
         t3NOlg+/uo9v+k1NPTDbnsu5a96TRO4UMw1GkG1ByDIUkpFhkzZ/452Lk0uhD2O0zgnz
         qcGPuo1rw/DsnonCUywO/oapiViiAXYJMx52eQq1H3YUN3YdGgaZxeqAWWiXNV1g79rd
         V5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333148; x=1783937948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgXStR+vrHgH+n0Bt1NFXqO8qrllnjEuPJHIAOPIUpw=;
        b=b7BEK/kwuW3yUlFyI/laeLj/kzy9DP5VwYMz3HJ+zSGjpyqQpyWj1RknX1Cn7cxaF9
         FqEsuK3KOHVlBm9o9NYSfu+8Y2+U1il5yfjnTo4KExXbwXAfxjnUyusAGC/Fm/OMQu8l
         wSpvUVuKSUbOImUPGRnJ9YBKrwwh18dAErsy+cBaJeb/VakLKM+1FzXl1Pwhv30aTHcw
         F3MqunsHAv93f2LuqnW+neMFtnpUH4VFu3MW/j1TGNiD8nocCtTCt/e+zLe29PZOa7px
         7YoVfROpBfWy2BkAk1kQTuBnh6mFIDUn1YlspcOTkNvQuq/JkFGrR2xVdWK9Zljal+/G
         LSbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb7KqvD2hHzN+mea9QICLpWEpHOs4qsVU0CqbKoTx2HH0MIj8yJ85XzcLsv1qRaHKxy+PoHCgwpb+l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gRi0SKtnMCDJji8mWNZXdKk6Li2fl4sCeN+WkMWdCWSgwE+N
	NRgbsENHpaeyFTp06xb35p8UcQlrU23kKqnYcugZdJfU11lGc5uUD3GPKE7ZN1vB3OnM+FV552E
	EwUrHoC7/G/w2Tw1O0XhJETQu85UHHGGuQwirltBJC45x8vZO8yqP6bRFUyVtH0Of
X-Gm-Gg: AfdE7cntyh1IUA585z53KU31SPICVXDninNp9A+iRDDP3vuWGiBMwnS9cnvgnVOh49V
	hPF8CdKbb/vuWJzWfLqZb0e9TA8NmQWZM0jmoYe/Bnef+zcYdpjFjl3NBS8jv8uAfz+HH1eo0Ue
	z4DOSwecUNHKGSrEUPtTLvK37R4Z2msBvX6hWzWs5WukYyRfZ3aFmIOCwbY47ZGKvr9vgFL8p5w
	X2gdrHInzLuDQoPzap0s8qdMdz8RG+SSxFtHUceo76rbHn4PsTsNClkBLUtS/GWvGEY65+tZS+9
	41ofIievanQG7vXe4aQRR3me0LMPbGORA9FWQCUOt0wFEpEayeSplfjPq0x1pl5/pcBa3xrrsLc
	eWrPNZmtL1YifIUzFCgw66dCrwqk=
X-Received: by 2002:a05:620a:2688:b0:92a:f65e:1e9c with SMTP id af79cd13be357-92e9a3a3b75mr1272221285a.19.1783333148073;
        Mon, 06 Jul 2026 03:19:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92a:f65e:1e9c with SMTP id af79cd13be357-92e9a3a3b75mr1272218485a.19.1783333147587;
        Mon, 06 Jul 2026 03:19:07 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24506340f8f.37.2026.07.06.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] ARM: dts: marvell: kirkwood: Correct indentation
Date: Mon,  6 Jul 2026 12:19:01 +0200
Message-ID: <20260706101859.341467-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bYoP10yD5TtlArmXIdJE3yshVzCGxEq/GLpJ2Rh3E7c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EUN//Zb8I5JBUxojN/tnkKR4SWdHURL+dU9
 +WXkrSGYcCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBFAAKCRDBN2bmhouD
 18E/D/0SafbQ1hWPoh8kl9eJF3apmFTOgtNaIStYFKiirpN368l9jvbAYgWQq+juiuxy2EDw5dc
 FLiLktlb1S3eF1aI+jMdop2F6wFk1qhu3dZZbTgYdGQ2WioG+GVI48H1LUUM+VVsyAuj+8/sDk/
 gT6E3H+V9evgSX/mCAcijoVw04/HCVvolbwwJenAPVd48no8pN85d0iq0jzY+LW/O5D/U+i/aaq
 0UKPik0XGMW5mBecoMAF25o9mxkxIndokc3xLvPZyza0+aJRrwcH00JTjoIwJ3BUcbNnICM7ZfW
 5yx4QaMeW2cHhc/G+lDysZk5aBrn4naNDbPeDcZodmZzCuS9GDwcL+2zjCUQYcjK3F4zPpWXZvu
 no2YhYAqy6xHlkxUcvg8OuXtoOYKIFimHc4iK1MELci4DnA2mIb7ze0i2t0EGt9DZXhGdLuDkeN
 YrAAN4D1ROcHgpR/rzabkMyStZgVC7O4Tk5rEg4YAj/s27IdK+R1IzKiGLjsnaH18HhVRmB+Vsm
 J2nNe9HoXtkDF+3FkC4YRkFYGyeaFRJMRFUhaTiMMmmvsENIh6l3nAfEhsW7WwzkqE+ryIAxuQj
 vBtx3DV9v2TWsj/Ry7M4REjXvtTWukn0q3+nEuM9LPbopAmc4jPibugA6yFI5dbpA/vF5MHgHp7 7MVmtqB1os3q8hg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5YX7Rd6sTIXFwHqo8zRdGWA3LADoGDy8
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b811d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yCPzjt8dSLUH7PgGldcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX2R1VO8dGzjJ6
 YVxzOUVYrKWpyQ3J0C1k7fAnRw+TLV7gJ1/CMSIRQMsmPzXMe/O7bMsoczUSYHEDFQ4DW6zKW7/
 cFdrFip7JRish6rJEY90hoS3D/dA0Gg=
X-Proofpoint-GUID: 5YX7Rd6sTIXFwHqo8zRdGWA3LADoGDy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX1O25Et0a+pA1
 1Mh1sbqsLWKN0h/Nk5a0GR8fk9p7vnh9w0jsmTJanZ3B5b6IocxDDDXxrgXKzgE8q1jIkn8tPz+
 EYhrXGSzvuuTvZGJ54GHHQya8XLDENTQQ6EuTCL7sA7bjBbrYJ+0JZZe0q5yVNeXruEuA+nODIo
 f27ySKGzigjifoo7KDC/I1nmLRA7Bu6SRvJk6PSy8eGQntI9Rg+qgsxMnnEbCIKFWvKYDUl7axR
 frLVpNQxWBMich6MUx7xKKZt0JMtdpKEttzPcDXO0Nmlb++JzB1Zpqy4Y2uQHfFf9FdtSsAd0Ue
 Np1COLJHh4Lgr9E8jrZJKo8Oaa1ceEzfzl0oJE3wsE0o8k5jMOblRi5+VL7Ig7JBdqBiP+SS1yN
 ivXIVV65cuMCv0oOl81w/JO2lnkyJPIt/znC3sOa2r8fbBJcfI1OvQxDlE9tDFxpOMStq5pFLJm
 l/Z1xHc4kgCefxRaPqw==
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
 arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi             | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts           | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts           | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi                  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
index cb564c3bcdc4..a9adb777c7a0 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
@@ -239,7 +239,7 @@ ethernet0-port@0 {
 };
 
 &pciec {
-        status = "okay";
+	status = "okay";
 };
 
 &pcie0 {
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi b/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
index d6b615cf6390..121d84609f20 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
@@ -83,7 +83,7 @@ &mdio {
 	status = "okay";
 
 	ethphy0: ethernet-phy@X {
-                /* overwrite reg property in board file */
+		/* overwrite reg property in board file */
 	};
 };
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
index 20c6290d2037..82ccc6feaf3c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
@@ -109,7 +109,7 @@ led-yellow {
 			label = "obsa6:yellow:stat";
 			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
 		};
-        };
+	};
 
 	gpio_keys {
 		compatible = "gpio-keys";
diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
index 2bc4b68bd723..ff08b01434bf 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
@@ -130,7 +130,7 @@ led-yellow {
 			label = "obsa7:yellow:stat";
 			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
 		};
-        };
+	};
 
 	gpio_keys {
 		compatible = "gpio-keys";
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi b/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
index f136059607b7..6c15e9257de3 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
@@ -57,7 +57,7 @@ &mdio {
 
 	ethphy1: ethernet-phy@1 {
 		device_type = "ethernet-phy";
-                /* overwrite reg property in board file */
+		/* overwrite reg property in board file */
 	};
 };
 
-- 
2.53.0


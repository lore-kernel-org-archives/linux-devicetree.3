Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DCF434E42
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361054; cv=none; b=esNuOSyG0S6RWKvNhIRSPD621SySEr1sKprX47ZqxnhC93azK61jB6zQaxBp+ijxRbF33wtlN99Sm+rbfWY426CrYajqR3WqejWBviN5CcPkNxn2NxGVZMuRHFAy30UrEb7u96/U5wjXX7LAdUUyyz2FqQUE11faNYrf2dDOojQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361054; c=relaxed/simple;
	bh=Ve6EeY8KkAjL95WGV4thfC8RN67B8RKvW4TyZWmJEls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a+CSFTVJQFbr42ho6+hmeFfHxGPI4FG4fqvduQp5mTil9U8ilPM52Sq0W972z6ZCeImNH/rN1aZv+WqFglYmwFE/nIdNh9cCuP+A2NcSm/E3Qgv33ZgFYU4fluwV6iUBWvgKrDE82ddYr/dC9RdSZoiycovg6ntD7RMX2IVX0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncdzL1eX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Os+WGnSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncdzL1eX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Os+WGnSP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6Xp982426
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TFCpJc0hDy7ktIER8DCjfk9vRFJ4luyNuix
	u1IkNlJw=; b=ncdzL1eXr++yCPZ8FVwVzOTqE/VB8PRl6Wt/keE9tVmVdWQdxPe
	c9YG8OAEDxLxOVbl1lIw/3oVKTeLf1TQyGiwsSFzytf1V1czJ4bgSbdA6NfYcTD6
	a+jEKsyRgevKaXInelMxWX4mMW6t7WMGr3si0Xp29YXHsE/PhJr5IBd5viw/RfKp
	no5E+7Rewt4WRx0RuQVov41qwFcgL/hduXvFBzQzP846QV8WCeuDWVlxvWuX8goS
	LwFFZS5lzRRIT/NXANWCKCv+Lsfs74TtAeATxCe4NK0e0xMHUlIjP6c73g0CC+7S
	tjzT51BmLyvWtxsw7v7pXwUzzifDLos7m0w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjatn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:04:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbecd25037so471885e0c.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361051; x=1783965851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFCpJc0hDy7ktIER8DCjfk9vRFJ4luyNuixu1IkNlJw=;
        b=Os+WGnSPuIUloB/Ugik1PPlqMhaP9Q3xXNCOpXRjl2vPL+rmYiuAP/r87QzTxoMgTh
         TQBrEf3P0jYNvwhmzKVrZrBHwgFdlzwvb4z22Jq/v3RTt1GJMyiTJPqmksJbWF2eWrQy
         xxJ9kdAVx/UUy8RKuf47GpW+2JI65MMBxH6Ae+8yFreHTBdu9Zhn7lXMpsqBx4x1P9IK
         i1TTZ6JYrVi7PdNN4YRRUZqlsr+/IuWTVkiX5XjEYXeYgkzjYVT7vdRbQlJlCr2iDv8f
         IY0s9QxnETrg+SDYfPnYIYPKhh03+Qz6LNliF93wR/5aby9zfRNThCVgXiO6Tnt66oLi
         DAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361051; x=1783965851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFCpJc0hDy7ktIER8DCjfk9vRFJ4luyNuixu1IkNlJw=;
        b=bYTNSDHi6Xk/JwgzXiPUTy0eFDegNu/ik30j35sd9yakzbmLPnF3cDoe250l2ZSwiK
         Wb1t3JWCnMO1rXNeTgw2Wbhp6XunxKnWFEOGxnqUK+ur3y9DZys633VvqW3r2fKmRUIK
         nGF0x61hXwV5tBdLihXFQR1qzLragP83OhwvQ/0FSPWbi9iC/bCvC8jlyNRRqZmeqKWz
         ct6NI5nu/l82Xdy8q1wCJEh24E/vY1wcauB67loKvoID5BBuc7MB/ahzYQ36HClF0FXk
         nFGPSPBL/fN9YkzELd88i79WXS/7sxAMdoss9UOOMiVFtQjK9Z51SPlnMgXuS+zwTBjM
         YC6w==
X-Forwarded-Encrypted: i=1; AHgh+RoY604rsGYMNkRwwaCwWEHrZ+p+qEzLAD6JSZuXNfjLfXJ5JXtnUONJtpvOfHK8KCLcRriWjgm14/WH@vger.kernel.org
X-Gm-Message-State: AOJu0YzmfQtTzpq5KEP8qWPA2VCbbAkUzT2Bkqk7WxeKqze5nUJSnRdo
	65UeY3YYyUe4ANRybuJ93jqoInoha6kmVnTDHMuZ7HGhPSSmfNAIbph16DoNVLkSE1E9cVz+Upw
	6HMTd0tgv/nqC5A1lVH2gVEylONs4Dn8COe98d52PpJUY+g+VAFv0mp5TiyZPUMkO
X-Gm-Gg: AfdE7clfKpF+3Eq1s2TVhzpVeJstXVUH1d3tssNZfNf6sOey70qmqYh9K6KAC2VMP20
	u9LC38Gf1G1hudShiDk9BvfHoQhHyM7Drriwn7XcYBNwD18/44Mb/OJUsXpN2hfiicY05XzMblD
	eBRa30uSH0fifR7xEpiDH51eIIPKtChz5AP0wY/jDDHkNJJuBsiQpiT/hXL/RpqVy+4AHiIYC5J
	wUIu/EpN+pfGq6p2P5wDKq7gjD6xDSfziLqnWdDiHjdMxl9ginXB6Z4AKSKRlNDpxqw7debVCPY
	gCfj0YT+iwMhJCByMBhkFfKIdOJcY4XccWN2YfSRD++LugKp6oFh8yuYs51vY4gS7IiJWzT48vS
	a+Gm6uFT2hJYK6OwchZV3iLSnNIc=
X-Received: by 2002:a05:6122:3d4b:b0:5bd:cb34:1b65 with SMTP id 71dfb90a1353d-5be8f01ab9cmr821131e0c.2.1783361051022;
        Mon, 06 Jul 2026 11:04:11 -0700 (PDT)
X-Received: by 2002:a05:6122:3d4b:b0:5bd:cb34:1b65 with SMTP id 71dfb90a1353d-5be8f01ab9cmr821108e0c.2.1783361050560;
        Mon, 06 Jul 2026 11:04:10 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm27092115f8f.5.2026.07.06.11.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:04:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: sigmastar: Correct indentation
Date: Mon,  6 Jul 2026 20:04:05 +0200
Message-ID: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Ve6EeY8KkAjL95WGV4thfC8RN67B8RKvW4TyZWmJEls=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+4UT4hjqHmzvdRxYx3bcga+pRwmgY/5JUURV
 P+IzAy7deWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvuFAAKCRDBN2bmhouD
 12huD/0VrM4UOmMT0JyL4dhqyPGUPEkna/I07XrmkKhDStZkHi37hxJLBxX0HlNws3THxKNIWsu
 n3R0CNzgXPGBTA+B99FeF+C9mK80gl0B47IN9AC/D1uFth9LHrRwxfTyY1uH7IsWhfixEoUl3Gy
 pFzdYM/HVWpMYKO/Yg9BygydKSUGhhNGtuFS/+fz+EpOHplxjgv33vgziEBWrEwiXgYwnZ3Th6U
 gBU9rIUmLA8EnlrooJvK/WHhh4HeO/2jsMyP/sUWfiEp9wHO1iRvc67ux4SJO5fF4DhTbSWeF3e
 xcI4rjm3JmoKP1jZACjwx6W8gCHJSSAQ65YhAAULlYdVjLlpoCNi6TXvmgDswtPhJOMKbuTagow
 VFaDARbuI5UQ5DJy3vE6ixCdBR3YiqRuKAQ/ggx8IcIjGI7qRw4mv8J75UpVW9/8KgQ+tO5hL2c
 iBsqmRcwepT5SQz9t4vqpzMheqyixQ4m9SMloLRmyTg4u3qEga1xnpChR5tEFMwwuCXklMmse4z
 Q5CxmibGPjedmJA1c3XXPl3jr7R0GL5W3YDPIs7X/Tc5fZ+wsstHOa2788U4IfDuyPVFwIUewmp
 IZiDfALEOvbtff+GFB0seQ9VGFZM4JSwxsnngFr1ouLGiwF4t1nsAsDLfsKepIQz1jQE/vUYGL8 q2wM8WTExu1E+Vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bee1b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BJV7ttL8GAApAH6KOnwA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: gK9lExXzcXIr5-FFKGkdWKI-Bv3x60bG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX4mEYq1xgQm+H
 q6O9amMmnf/hEecwV4IEDOPGR2bW7GDkMZaW/HkYe0GrzUrNsEoBzhnbr2w9mTc6aOF0rOSnRF9
 faj7CXagBJFyYvZuh/8HUAWaOJDnw7IRRg982Gm9Nhig5C68f/u2aHHIYBsbTv/NflwykuAPOPY
 nI6i14CnX2avg8j8JuE9L/2wNpn27T6w2QVXx5djwoJDzevoED10Evs52KhEM5CsilORucRSyXl
 2cAWQF7IFwufjWMpqYbsVPFPZhcmOMrPzGJ/tAFzumnxDdyLVeQjJvEEyFb0qg4H3ebwLy3+t0z
 PKixqVAzC4E2CIaDLio7zVI7DbG57+RyFLnkbD1opz3lI5BY92umWgtlqFT8m+T+g9WtDSjNQxa
 MceAQSbIhZchNLzBtNA5BLHPsM4BhQz27wC0Y/uDm36NsMeHhSRYNBUWAmcg9iI/xDqkLzV2g4B
 rMkpmBruQFemELxRfXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX9SOERdMDbF0T
 kpharmGDw86uA7RloOtuJDk7iCLMaciI3uR2CwQ2frGUrhjM3sTZRbUeUA9wdfMPGyUmIOTOVve
 iilohxU3CYfgA6kn6QnYd3dFNtxl+R8=
X-Proofpoint-GUID: gK9lExXzcXIr5-FFKGkdWKI-Bv3x60bG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060182

Correct indentation to one tab.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/sigmastar/mstar-infinity2m.dtsi  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
index 1b485efd7156..437329fb912a 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
@@ -7,17 +7,17 @@
 #include "mstar-infinity.dtsi"
 
 &cpu0_opp_table {
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <300000>;
-		};
+	opp-1000000000 {
+		opp-hz = /bits/ 64 <1000000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+	};
 
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <300000>;
-		};
+	opp-1200000000 {
+		opp-hz = /bits/ 64 <1200000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+	};
 };
 
 &cpus {
-- 
2.53.0


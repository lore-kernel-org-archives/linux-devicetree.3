Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950350;
	b=zQ2R/c/TZbReZQHEOwdjN6uTkgO/xbZgLA1Kx/Yh2kSMviK4Xu+D915arKmvPRDJ5No2
	 K7v+7a5i7JiabB/HBH/HhyCF0ZmUc6YM666gccoKHvXRI6dBMAM3GLm1P0wQWmg+zQ2bA
	 bR2UfU301PorrMig89DV6Vam1BC4mEcWndWaMfU8VCVj5ZS0hWRZpdVKX9/g5B+N3LTIR
	 THi5+bneEVAkN96jFwELy3kUHZGAY3zDsEeIRL5gq75L7FZK6uCpmrORxY+6caj2NMfqZ
	 MuwtJtiARgxEFTIT5U2Xa0CDH+C0nTAx+1Sqf4usQCh1vSkW+IIWLx7rAx+kc3XM8kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsWQSLax044=;
	b=I+G/TpD6AmAmH+pugtlBe6xpYtxQSrGbCsefPLqbNvIWgSGDfDLMO/BXrOS3jKWLlEcd
	 tAMg+gqY7nwu8FRbi0Hrjep3gfdyYve8JCLM+4hDf9jwV0+TYu5jZby0xKtZSExXm2+DO
	 wZmIPvNpiNnJBLvAqAMXLZrYlXBH+I3lZihQLUW3xaCE7rP+64xFtPHgU9dwQUgR7ffGS
	 X3Ke52jhaRNufWmIuzWczXpcMDYZ+tDIuKXMXw1BsG1+PuuEzA6TGaU4/PfFV4NV2Np2K
	 8Ip1igYtkHrZUOMKRtIeqBE+0u6l2jK9zhl9f1FYGs/UXEOmQU3JOGdtWkFDJXUBNdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7rgPCqY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ih9++FCZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF6606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 07:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EF6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7rgPCqY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ih9++FCZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7g33243892
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 07:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsW
	QSLax044=; b=p7rgPCqYB+odh+avUO4albsGPZy6z/7BfbD6Kteey/ab9VcrANm
	5+CRN75zF5/ejoRfGvjAjmXTieKue1+9B6y55QJmgFOMnUzEQ8pyEU6Qv1auAjCJ
	KiZxI0/gwrHEMwyuOj9vtpXXxdqKeB65C6ApdtFssJbEPvw0bnVnQ4uxScj7/zVh
	r4fVa2M2uplH5IPaTeUz9MB/wtPmPiH8dwNdx+w7DTRVknfy6cUwFOpmD8fJg4DM
	h8It700mwRdQVB8Pnym8XjfDleYNsYQcJsUjh3jBawqDbNq0PI/Qp2gMjqwBDsGP
	QQMpgXk7RtRnBFLO7WqyMD9w29HHBf3ZjGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1kh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:32:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so127072385a.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 23:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793950349; x=1794555149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsWQSLax044=;
        b=ih9++FCZxaFaxuxWsDX7zmGOzP0FZl5enoQiiSjgpXI8Z2JaET8rc1Dalx0Qf627m2
         GNJl2kOJBz60lrKhzOxpEA1Z5kRvxPWOe1ozWE2EbB8rUq9gGasDEDa1Yva/VAPlQk8c
         5Btl320Oh4sMTInOqQuD950ciit9Ikd1G2q3XOpWC5M+tpFl+JGLzKTh19/ZVwfK+l2k
         ZAuXVSRm/dKO4IkdzWWrpnuBSOn/FJtOQn7AEJ+eST56S5MKkCxO3uTJelagJ4Vp3ZgJ
         y/SyGHbwHj1kV0YBSZb53VhUDqrGoyXwu6KHLUB3YLhx+oAk2/6TYdgOEY4imsjFxcC5
         EPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950349; x=1794555149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsWQSLax044=;
        b=I3M/mzJudaggzQN/vNLUEv8WrHChO6XGAb/NkMkuSLsXqwApJTsCYi9C4pFRAHE4dm
         j3kQN5aXNTA1LkglRqKH4VlK5RdSffrA6NR+7HfD5C7ILhsFxioSuz9wFA/Hs84btkgb
         Y0s8wYbRv70urKMALbNzHytW4WOMx36Z7M9o6iBbAwghom2ozDnvVM6iHoXthgGcUXU9
         jKwbneuzLBLBEIVnI57ifc48pZmYT7Cb3L9Do92coIPmou6wOJTquNOuODAmWgp5adoN
         Osem9l7IW1SkloNMC8JlE7gFJHwYNXmzR/lKAU+QLELTO35vrzTyW8SS6umPCADMZeKu
         P8Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxBWzKHfTja/9bQC8LmFYyRHPxuE0vO+K7r7DJW10oZnfKaYuS573idD/AdltvQgnvKj7JPohKZsBdV@vger.kernel.org
X-Gm-Message-State: APuU4Z+FBhuw68jR16YTUjJaQ+cC9PD/ungzQ+LUzfRzM35zco51R+Do
	M+GxCAD0TFXhrKIiyoaXcP8rZ6rK3KV72tf6IIYS0EKIZmY2nrHCVQ5Sd6OkfFA9q2gJ7kiONIz
	oBv+1MjjZtQVOTyBGmF3jI81Y+LtibXsHrGrTVv9XFPKXVbR7jZZQb5AoHuzLIySH
X-Gm-Gg: AYBFou2k4WgvakFwjOwusLCnymQreNq2FYKv/t/pl+4xzc3EDY6XexdcO7gSq5O8MCI
	AZZvsSIGxKOytY58+zeMcdN6DKEXlPZnnNKQuvIiYW2PpWhuJlS6ZckgW7uBx8eJUPM8QPts0wT
	GPppkwWrX8VJCDlUSdXkljT7jVyXISRb6RwhQzoatimlYLhzBuaEecsA93Wbu+RDgnO/MhPEL9q
	N8ZDY8qFSJEkOrsjocIKZKdTGPv3uz9Nrq76KwH9ilWQQ+T6TYO3MQ2uIJMLPzhkUd6SgAlrOUH
	1umEeMgaxF/iYoqGx/M8KCGeofREmWL7DlUn2eQY+l0pYBTFpVJW4VWzfskkaH+75oRnOXgwoq8
	HaMoq+MtTrQOm3Foic1WjKb9+WxuoFIxOywu0Vo/WH+QO49FKSi9rl89pmsaVnw==
X-Received: by 2002:a05:620a:63c7:b0:93b:ef24:bc8c with SMTP id af79cd13be357-945f3556183mr233349785a.47.1793950348460;
        Thu, 05 Nov 2026 23:32:28 -0800 (PST)
X-Received: by 2002:a05:620a:63c7:b0:93b:ef24:bc8c with SMTP id af79cd13be357-945f3556183mr233347985a.47.1793950347960;
        Thu, 05 Nov 2026 23:32:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b73b97d62bsm17070775e9.0.2026.11.05.23.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:32:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mithil Bavishi <bavishimithil@gmail.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] ARM: dts: ti: omap: espresso-common: Fix magnetometer interrupts
Date: Fri,  6 Nov 2026 08:32:20 +0100
Message-ID: <20261106073219.59785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8RJTDipAJ01nFwlCTlBHgfjxxf2dxBYM6NOhCug9thE=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7YKEd7E3fFMNJDfyGX/aXcMtTxYLfHhdXD1Y0
 y1/6eXdqt+JAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau2ChAAKCRDBN2bmhouD
 18EOD/iu3p6fbMbT7YESIgQYYP3hQKINbqqvypfRaCCJqgJnC3WVinnFkZhCyks950A/hL/Yl4v
 tKNRfOBpKstUXzbhditzVtRNh6pdVtJCwqIpDgUly8DT5rnO5NkadxA412P/bf7E1USIHZddBHQ
 cUXeyFy8Mf+aucVD0h0p6kuENk1lq84r7MbcFHUDsXgTDiYYRuYpTruO8yjhp14KrRs3dhuzwiV
 EWBslFSG5quj8dF9fFmHF4PlcPe6llcW3Q8/IasqbV+8Dy6BNFO3gh+f+ReFPfKaMnRHXWtSRH5
 6ffD/WtTuwJ7ifXP2NEMeJotyZ7mrL9Da6PEssKENC6AP7PXqKUbU+ySnvEVVikNrAKGhaQKm+J
 1eH8ifvsTqtKaUNK9+kHd2PzDBnOSg/0lEv0gwrbhq8L7xfy8kdDuAh3MhTcVQZeJucbTfFLsvI
 1NyA4zq9FrbO+/Rx8ibjpm9jG5IL0Qj04Eah8VOsTfBaxNqL9N4PKs3/BiHeotJy7n+DkT/EpGp
 U558FKOL+nKyL7osnzMcgdqrqRKCtY5K8d6LHkjCB0T+1cQoX6FeSsxflAN3r1arHhuf9cMVN1v
 +8jD8EPIMP6sXordQOhN1zNiIgoGnJOe5eF/m75qidqN2PfnUdJ6SgHckC2KtGW8+0USYujIukO bwIzSNGNhnZ5y
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed828d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lsuncF9k1chNw8iTKPUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyOSBTYWx0ZWRfX4tjHJDo53c3d
 TcikWvkfCCq+855VfmipaxfOvOdQpEcN+ic2ez8daze2/+3cDRKEbwb/w8xcJ6Lt3mVXRlaEH+6
 v7oNftREpInxqdfHHKYljspYrw8BN2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyOSBTYWx0ZWRfX7DQUuyOY/szQ
 nvGGpTKk7LXsHSVo7rBsIjKxbsztDiKYhum8lN/X0xIxEqgVy8Ekb2AKYGTCWf5bqNLPhQGD3uh
 nnoQYIMkCOOkcvoLmgXnHVrQl9sXKcYnvZmagwYjO6lAPahCJJ/0NS0NId1Dr2GGplg76tk42R1
 N1ipgxYhlMnXvmXv5PxbzxFohCOqtRqsAyUDUZXSwjAKldD4zyKiIy0msaDZJZB1DYuStg4e9zi
 mnmCGAHxK/c5/VlPAVgyOb8G9tVxxgjoRY8WBT+Td/W14vq3V428gzqvHqHHjlxkruAf//rxUjD
 2/OYS66mJJkagzmb7Kan4q5y8z/y5gkCRqbuUI0uHdY/CHlVHfYPadNpbt9jxUKIOvTmEax3r0G
 VMVJYiSaTkX6KqrH2QAsR/bjei533+o6e80HispPuGNPlgTYQ9b1Hk1ntafqy6M5i+oWqMdme5m
 BhVdrfAh748IP7wNfew==
X-Proofpoint-GUID: Wvh-aAZztO7rsk57aP0nJXemL_xUOrS_
X-Proofpoint-ORIG-GUID: Wvh-aAZztO7rsk57aP0nJXemL_xUOrS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060029

Interrupts property takes a number, not a phandle.  Passing the gpio
controller phandle made most likely the interrupt as broken, which could
affect magnetometer driver operation.

Cc: <stable@vger.kernel.org>
Fixes: f768d54723d1 ("ARM: dts: ti: omap: espresso-common: Add common device tree for Samsung Galaxy Tab 2 series")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
index 07c76a80cfff..881580eebf4b 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
@@ -632,7 +632,8 @@ magnetometer@2e {
 		vdd-supply = <&ldo4>;
 		iovdd-supply = <&ldo5>;
 		reset-gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
-		interrupts = <&gpio6 10 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <10 IRQ_TYPE_EDGE_RISING>;
 	};
 
 	light-sensor@44 {
-- 
2.53.0


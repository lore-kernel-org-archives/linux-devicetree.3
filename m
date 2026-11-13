Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595947;
	b=VctUZR6LNfDGPAR5/B6nomiDEZPL5zIM8QxVEkrvmEyUOoYZ7pw8+0mzrM2iNHa5Rt45
	 vkYfyzWELAEkLPJT+jCe2TFpf3lZ14NUZwegJ+I7ocDeRD19nrvpwUl48VWPGpKXGY4Mq
	 J7+VPISY0rnQ8AEpKkn/WaDWjkrB0aIyqY2Dg+zHlm7txgaW3Srz7gHGerDR2wocwsRAu
	 y/0TcsqLgFyi7gGdHpOIr0HqM3JVwy1U5QbqrN0aXy8SJZ9HDbNjPJXRvYlNJ0Ea0KCje
	 KaBziCXiLQwJBWmxzW5/z9spgA5kjl55eav/BuD80lckCsoWagGwPMLLSByY4KpTUQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
	b=txjQd0BfBbvaoVJ9jtWFD31EZoq/n+egGgQ/+1Q6k/1RAvSnZM7GEm6N6iNF9JPIPJsf
	 DiLfOJ/U5xaPy12QMEwWm8kFF1DZ5uJLcJUiDRTU8QGp10oSXt0Zr0dreTXKdhrEYeGwe
	 k5ghfFVPQrPitJE6+SA/An8REtXtya2KwdA2SAXzz1zd62xh/EMesp8xqcfMv45TjQI0b
	 +uNwvl8kTeJ3YuSvH1/r1cnpfotsZFIgnkApsryxnwyFyed2CSziaCUIzY7HKKni16L4X
	 1hcQeptIgQNhUW2h+7Yp4WjPH2dywusTBIA7C2F/qjGJ2HRoysLMh3XMCXwh7rSG77w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nNi9CPyh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QLFgUixD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E84606A330
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E84606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nNi9CPyh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QLFgUixD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXJLo2808715
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z
	5RXqz2B8=; b=nNi9CPyhsHyyazKxfw6F45z9vlk6Y4jA7tuFgEKyxQyxsMVXfzo
	fp7+wMC8OSZFsT7SEkPpDFD9r+Fj1VXMsBM2zxeXOv2VepfzMAjL1f273Vj5Ns5w
	L2VTAmYvroUdfE50aqs80CWgW1oAnWjQuTOapeUDW42jO8+FS5pUOgMLgdJObRnu
	Ydr/nI/7boqTAYHJmCLHek53WNUNNuusvUPmsY50FJdY2CwWwZKOx3K6mjkSctOd
	dpYYRxqWcaT+XNISqD6AcWdknfc5h5YLq6LeC/AKM+VrYrDBHps2AsZ8jnH2UqOM
	pfgUgBGa1jcYlVNIsf2D3GjiEgyjLsY41pQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662rg9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:52:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so244202585a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595945; x=1795200745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=QLFgUixDa0Bl6KBx2+o5Con3km7XCuCWdTCBbjspmEkR2LGltW6aJAQFh8vSOHJGVO
         Tcj23dATu/YwPNtAnO/MFHa74uJdANleTWTSH/PCfzZLAx5Ku+Z4e+8S9ucWHY20LEM/
         9PYo6JgN5in258JKVRqVR3fan2zGmzSIIkGN1rxQdvt3YX0XvyBdeTGJSAnR7ZiOfwoC
         2LB9nBF6lX5Vy7EtWRaKTvWpgszrlWQKOPQ+NVbfYb2Wxd+NbxCxcbQ2K8nuJM1uMSgK
         4u69IhqRd8CZ2VYDP2VfqJaC+PAzrkDGovS35gzh2ZHHm8IBZg8jx8Zq1H/4M3nh7dGe
         qcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595945; x=1795200745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=2uJmDHFHhqBUzPP9s+plmwKc5FsbvS3Sk2PkxmxX2eNs0PVBvAlDmMwV1loi6iteG4
         7LkKfHolBtRb1gAS3NaY10Eq4JgB8kVDeewTPCvpbZcW83KNSY2Q1N7Pc3XcoSIlnbhg
         /zl8uAgen+P9RPpzUrqn6mHsVS150fB7FkkFuM4hhrn2ZXgF4yMUNyeYpGGI6aGXrLvm
         drJxy+6+qQAIdfkOeK5nm8fOdNsqtJModiDwd0qwuKQwcY4r3Icvwmw2Ph15JDyiOOtE
         OTBrSlAbhpExlPJixkQlNfbv3NJLDldNfgcH0UHCeFEF4LTPMBx1ShEY+NfINIpoh4mL
         9I1w==
X-Forwarded-Encrypted: i=1; AL+hErEh2xdrx2odMp1+ass1ZQ4lVHh/0kbd9VZBjTbLnH8PmJdEFoeQ6Gsstk7RG3GFFLdRIjRkftqbS9X3@vger.kernel.org
X-Gm-Message-State: APuU4Z8LEfZMmuqcw97W8CiwZshBOLhFD90DXfOXjBT4mwLpi8jBosPr
	j6EO6zJSeisjjbE25+uWmUREmGSeOkP7fvpuGHRnP3qyOLeJWq6ItpkHw3kBfHSs63dN9YUG17Z
	AvFh/R6gLZ76E18Esdd+87dfZOtGqNFwnGNT+ASHCd6NH4+gD0XWFsylJaW63mYVr
X-Gm-Gg: AYBFou0Chj9NWfYLfKvhd0afGZhK8+2agf1DjD9T0Wi49kD+ncGtVshz7BeWfQdXtEU
	JWXlb9iui2zyOC+/b7+Mebjka/GaI9aTolcDJ9V+mQfRkr4hQIToDL7+0mj7hY5yr/Jr54xkR25
	eO9UigeJcsjMSuQrKB2X3WCLbYYQArpC8GHWZz0V6dREhg/rUTdvuz/787HIIHxRYAAUt59zSmw
	/qSGb2djq02KjQkPjxpbz2komRhUA2mSEDQ7sld4Xuqa1BYuoQyx08beFADZBR+pJPl6nQ2SKen
	CVbnBJQsDyDzmdWzwWnSa1xrE+K3XUsdtm4h5Pf9XmCoQ2sdPe5N8E02dfeCW1whN+b870McaU6
	qyABeWDnDfCgVHfGjzOaxUhobk5QaInG1/VRNl55pZM2bMQjBntGy/5hpRtlI5g==
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568070885a.9.1794595945428;
        Fri, 13 Nov 2026 10:52:25 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568065585a.9.1794595944804;
        Fri, 13 Nov 2026 10:52:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] riscv: dts: microchip: Correct missing space
Date: Fri, 13 Nov 2026 19:52:15 +0100
Message-ID: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JnAoEWfmUCHyEt5xBJBkALlBOEpkhVPyvMi6si/XwBc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xedNFYif3mvamZgoOwZEhiwp70kx3USlRYe
 epfxvKUHIaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXgAKCRDBN2bmhouD
 16XaD/4iNP91Vbd1U/v0zXTsKKKPppFD4Yojr2ttV/+VCgvjy56F7/doRdhxru6CqGUnox/adzc
 l4zf1GOa5rMH+SkUe6+KQOwOhgLEASSlWI5biKzt3pc/VSuxEL/RRCirBjASFiPJc8aSIYf1zb5
 CNzvhfzG7q+B578o57SkzG3UomSp1JHNA2Ndf2br9XzPYvu/raH0QWHIVNirgekaIGV2BkE+DGB
 UQd87Kxgk8ix4Ub0FZYQ655dgh09Y+IV7lwIyTc/UFW4YpdXlHAdNFL7dLJsO/UDmA/peYmEK/y
 7DN5YCfylN+xC++Vdh8HCYEAtnQvKqzLDItVg/uf8DTOQZr9NP5ZAWdI6HN/x6S6yatZNvOw+TN
 ad7+yrq5HilDyAzuOQQJVDMXKn6Lh21djfFh+kxlkTMuCm9kF+3f/EF/aAtRGeOsM2CVJx8tgQE
 gxqd5ksxYe8j2qlJKTJjqN6EaYanTXdIbSdm1C6GLuihQ19hOtSs6gfzTYRKJkFLuEtC0A1Gtim
 OTAX1iYhDhaFbZAnkRRnt3Tye8olTdmIavvHVcLcVIZoe7nqzQh21DYVQJybCWVG5obnAzJGeuS
 zlKW6nkI6QulWBfDik34wXQCV9sI7AwYPS8jKEANul/sUqykne9VXHRqTiE/lpWjxwJE39+i5fr hjD/NmwhyeXmi9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ItLkNw7EYLLJnEfjpRaZXJtq-2T3O6RG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX9xVlQ8dm0G+Q
 qdpXmXHLhWXPP/0rkNHk9PStEZKlh3/1g7GKh546Z601pXRi4S7gE+gD9dU1yOcpFPbnz6Fbjbi
 FBnGUq0GcQp8TCSZLOtYGp1MLcJmysb7kdVNDkx4u3PQQCh9uptNzWOI0Ghx4eSW9s9P3OWUDBL
 GoMWssP5xj1GXIgQTTpBNKvaDc6VRZ+o37cQcdp2L0orj/WTUkRU026KPf4loY1ewfherCsoDjp
 Z+njrInVqM8HK5A236euy8A6h0/cIhUDXAhyBUfqIEqRty83WZ5mtJ9rgnsG9kiYcoOe6pJkB8s
 wGhutttRbOJD2IhmWt0VqRKjfm6tKXJMrHcNRCa5nyN9UTpgzdooxLv9iFxVggjHKx7/9M5TqIq
 qi4eOL4suUoViKdlv7yfHGfwRHgufAXUzHLtItBGRVdXfDFwM487UXiugLw6QqI+8ICphv/3DDS
 L+et0TBdL3thBArFBbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0BAIpRtUolfC
 8RXV515O07I4OjOL+sOtz75uxdMRJotXHvPPz8gKnyQdeeDPiuWOq8zgz2Vl1jJR5mRZpC2fT6i
 l6g9Q1vyrUu4PMcz/SBy7BAFmOiz1P0=
X-Proofpoint-GUID: ItLkNw7EYLLJnEfjpRaZXJtq-2T3O6RG
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af75c6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=d8qWwIobHd16qk65SKQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index 180fd8891903..2324d567de45 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -63,14 +63,14 @@ hss: hss-buffer@bfc00000 {
 };
 
 &gpio0 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "", "",
 		"", "", "", "", "MIPI_CAM_RESET", "MIPI_CAM_STANDBY";
 };
 
 &gpio1 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "LED1", "LED2", "LED3", "LED4", "LED5", "LED6",
 		"LED7", "LED8", "", "", "", "", "", "",
@@ -81,7 +81,7 @@ &gpio2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mdio1_gpio>, <&spi0_gpio>, <&can0_gpio>, <&pcie_gpio>,
 		    <&qspi_gpio>, <&uart3_gpio>, <&uart4_gpio>, <&can1_gpio>;
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "SWITCH2", "USR_IO12",
 		"DIP1", "DIP2", "", "DIP3", "USR_IO1", "USR_IO2", "USR_IO7", "USR_IO8",
-- 
2.53.0


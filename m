Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB853AA507
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333112; cv=none; b=T+k5/CwWgMTft6u60zLcHeA5MQuOQY0u+pdTIlwno3NNJ2n1z7Lre24ikrpgm6HoW3OCA32O6sCM4f7gmU5RiwGYMv5lJSrmPsU/iAwerkG6xsCfDWJpwhEeo4We1qYVjoJH+54WBlH0ah29VhVcwNKjXQZJDa2G32A/wojuLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333112; c=relaxed/simple;
	bh=nff7ht1yXQQDMNVSlXjX5TIDnXVQzTUA7YgPGwIziis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcibP/xjsZqZSp/0d6pthffXbgkr0uQTTFHTxKCQ2ClGjZyBdS5xmZltLCHBoGLakytDQgN3U0LY8onvMvCGbhQP1mEGfa8t1n5U8I2Eb8rhjsJf7r1wBdiE+O8xy6GZdXPT4NSqRxHLV1uGfSMw/uJsMHZinVYNnVM9I9qyP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVAipDdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJGMV2zm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVAipDdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJGMV2zm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666947bt109381
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqd
	DN1FmStg=; b=QVAipDdgnOnegBEWVFPNGDU6Q7ta3zSKVdl6+vvkIxW9v7ejUjw
	4vGz17FdRz7e8MpY19IaqMwtod9frSMn7IVhc/IsBBzrYFE/qAZO2ZilFcVEQ/Og
	ARelPn+jVXykqf1f1yCRt+81jL2mH+EiLLRyHIR30bmTBsLX5yzBtlDmG5sAcBdP
	r3g47USO1fNR5Gni708g19yOQ6UARkggFDfTmPGeLXNmZ6D/fVTId4qZvrzeAhOZ
	yiGJhGB2jGSz8jaC5lzuEHN0XBko47rnZasEgCKh+ZFSOHnOZC+LWnO2AR6i4+Zz
	LJ6QJIFOta4N/kWScA1p/7pDjM5ZoIxn0Ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98htk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso219515685a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333109; x=1783937909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqdDN1FmStg=;
        b=iJGMV2zmB6Fg+O0LEH0hx+6BgeReFSu+LkRgXjZLtW3r7rqjlkha8/fM5ZCaI2fPAU
         AvsgYj8AzPkkT7iw4HvJW9QiRPK87+5NEXbF1+2OhCS8/PejR6vq8o8SxmZiipAmhORK
         S9orOX3N2097UAP2DGyPFTw+I0WJuQSbOtW0BmTsn8k0r8WtEAgW7I2MckxaizJQv9Ru
         e3RJ2sjI4plhdqT3gd9tEMuLgvGuiQ9MeV6RVVMDoHztHRLI2qeeEAZojwcvUj64V5yX
         uAf2sZpxS87Rjia9HA3KK22XlgbueF9h/HAGv5n2GO6FUXv7/RQOt4wjryt+OEz2VyYn
         dVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333109; x=1783937909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqdDN1FmStg=;
        b=etKzFi50p/io+kEMB0eoECcHoD3X0VpMaufSxKvUb8pbBIsXi5ImEJW8xFFIJI/huK
         ch+wpzja+1W1xSkVhqbqGHcZghbUEyVQ5pZL22pks98Okb4NfCTMBiPr+1dZ2vCobbdw
         LK1vSe+BlCA66nwg4tg7WmC5NJywDpZsnz6eaGymaxkUOF40zivrxrDuCHmDCDLPnPsg
         td2w5OwnBo27cjOSscHUI7Uu9NY3PC6tAji1MiKQWGaAloNLwS9S9p7Y3BI8yWXf5bo8
         uF1dAJng7FYBNgsQfOye1CY6Yt7ng6JE4NnTJH4NLWgMS9HNNpYUrJl4jdzU5JCePmY+
         r8ng==
X-Forwarded-Encrypted: i=1; AHgh+Rpu66gqynozvSrDX+4Wvt8eKmHShH/K8R2SUnHNarJmw0IF8Psp3WFt0N1Ux3dc6HXWIOOuRlhIKkku@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfI43bWfMX+L0z+u+RWJM5n8MJQomPK2QD8T47iPO7Sl49/Da
	xd6bDCYVffnhe4H/dG0BPIDAIzDkU9fReGD80tnP673hY6zidBOVPoyYu0llu792RIbbIy1VOlT
	Iz0dOKNiV74l0fgCy6FEUXx44IG4qwhIX1ZOoiPmlS5Yk2EnTaoZkUj2Z6nx9I9pL
X-Gm-Gg: AfdE7ck8HUOgQ86Q+JtVqxc0dm3DlEi3PYfDE1uy0Xzl8DjSSW32CvXoUjUxXF1mItL
	1cYEV8WGCE66nVnjgW/RdUwazcOG7PTJlc3QKVcz2IdKm3/U12ZdSqzDC0dN58Rmg/WFFblZoNT
	2QXOM/MQgQMQgUxhWooQzGq6mFe1MsClCijNkLgKmS8KOvpSesw+KGLr3lK3HESreJyWZWYtTqG
	AT/XflWhodq4vhLm/rnqKqEt+kHYbn01uBIcCipk6GWTw3KNKew3X7dpdIgL/Ih0SGXEGYVJFgH
	kn1aJgZct2cyTt9OV8URjKh65ILu7znz74++ZJa9WcGhFNgErhCJQ00N3GA4orSlcWsX40I0/7W
	kR+33pUYCCb9mzeCa0UBqopeyZPU=
X-Received: by 2002:a05:620a:17a0:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e9a34978amr1349008485a.5.1783333109250;
        Mon, 06 Jul 2026 03:18:29 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e9a34978amr1349007085a.5.1783333108852;
        Mon, 06 Jul 2026 03:18:28 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm24350402f8f.21.2026.07.06.03.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: st: spear: Correct indentation
Date: Mon,  6 Jul 2026 12:18:24 +0200
Message-ID: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nff7ht1yXQQDMNVSlXjX5TIDnXVQzTUA7YgPGwIziis=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4DvDRsgTbbK816wZrc6DJ9az0YAYQwCYh5MQ
 K8yDMBfIsaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA7wAKCRDBN2bmhouD
 16wxD/wNLAnDh7ULEKoI6+hQ3BIQw34nWRVPCv/Uh3YRBQM7E9DAeheYRgAW6UfHMvhggU289H/
 4OyfK4/9ZteddRjb1KS9hGH1d5y3yPnd5H5yGz+OzxnMeW2m3LTBvfk4YeKzO0fY1R1krRx5lN+
 gY1omWSpohSrIwRNvtxrnujAXgGENqPpXQ3sxqF+y0Lc+8wGVBpFtDsFxVcBd8nE9vf0yvm3DBn
 iFqgxTQkPWObGZelOTCkqAUn/14d3Dn/F22SkONfnwQk+Uc5mNxfJokrIZKT/P3tTyu9Ef13orr
 G4+k2vv8SyDUnoZRStdOyCSGHAvNxpKM7PUn1OupYPzVFecjm4YBk4gisqnjzpfharWQT8H+I2L
 Sk+cJGVrDYf/8OVHYqfgSrNHcJpQPrPpRUalqN+AOaGEoUJLKHlGWe4YimYT4q+oYonaJqYN6iK
 SnK/uWIPWbeE9hqrMGDG1mHJD8C2gYHvJAdGwNMusEh4rRAfXET08Axjo9LOKwuR939xFukA2NV
 Uy+wLKmJ6SS3nkriHxkVHP8pIvrw8ybCW8Eg6O6MVCprQdkdZVBdw1WmY59UlTcWK9iwoZ9ZyaM
 ZcE9/Eb3X086yMd6ByGJAavOqSn00qwoc3gMId/9xBO8DP4TGU9d1WYgv+G7RVe41MRlqbRayzK EOZtdWWNVELW9ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W22i1jwk20mnzp0Pgps2VE_OV7Bqkagu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX6ymANk799hAL
 wfZT1YiCJUb/ZMTrrsdU08zUPPk83a0WuU8nceyol2cRjaRdE6VGitRw4w+080auXeuLvhMUzYp
 8+lJGLpW0jt8hFSEEXqV3tYXyElctBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX1AV46vvdfzed
 Dmb1YyiOAPKYliqkG6UHspDHDLs0msSYhu/QRieY7Miw0EOrjKUwCVhCWy07RFZ/fKX6R78b3b6
 iPdExMmcxYCCTmiVv3jIAG94Cs9eSe8xmCSeo8uoM9JzHU0O3Dt6NAetT8y2lISEmai9UgPlkVV
 uzX/G4cmoJOsMBj51ItfudbzK3JsnRcFBM5usF60wPmHQLWx6ZWY0f17HU8+Q9EN93xwd8wS5zO
 3CZxuts0Fx9Cj4RjPaqbIhJH8vIoyG2hkuBOyHDI5r73Ojc9r6KPnKEtWVnjIcgZcpKa3cVZv61
 AEwVyd0x3zBIVpJWLgf1qxwDm5nFi5xv94hBIi9ehx+1qOKZsXlJ6VDeVTsYBXsBs+zx2xRMrjx
 b2a0mO+TdVX1oYKZTJ3MN42qgZeVtNmvxBB6jtQiGK1fnXWJoHt4/uP2bOusUQnGBNcE8/WKDCf
 aTWcXJbWiReX+owTroQ==
X-Proofpoint-GUID: W22i1jwk20mnzp0Pgps2VE_OV7Bqkagu
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b80f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
 arch/arm/boot/dts/st/spear320.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index 9e7c356b1d9e..133015a5dd46 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -259,7 +259,7 @@ sound {
 			stream_name = "spdif-cap", "spdif-play", "i2s-play", "i2s-cap";
 			dai_name = "spdifin-pcm", "spdifout-pcm", "i2s0-pcm", "i2s1-pcm";
 			nr_controllers = <4>;
-		        status = "okay";
+			status = "okay";
 		};
 
 		spdif0: spdif-in@d0100000 {
diff --git a/arch/arm/boot/dts/st/spear320.dtsi b/arch/arm/boot/dts/st/spear320.dtsi
index 56f141297ea3..cbf494419f43 100644
--- a/arch/arm/boot/dts/st/spear320.dtsi
+++ b/arch/arm/boot/dts/st/spear320.dtsi
@@ -82,7 +82,7 @@ pwm: pwm@a8000000 {
 			reg = <0xa8000000 0x1000>;
 			#pwm-cells = <2>;
 			status = "disabled";
-                };
+		};
 
 		apb {
 			#address-cells = <1>;
-- 
2.53.0


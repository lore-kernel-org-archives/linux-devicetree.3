Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801737F010
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330471; cv=none; b=RQsg9GlSAieMqAo49pR+EJE60sp77QE0j/UuE29gVaYL4SIoOCnfhMqILVkwcX2J+QiL9C1NTGqqyRM7Oh1p0W7XwcQZqknxCjjalBYCGGpBI02tww0dYL1Ko4XaxA1GG/TCveJqc922AlYyZpBicXR8toXraK4nkqZqoJoJRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330471; c=relaxed/simple;
	bh=L7FpJNgmmdFvafbWuh2M8eJdyOikGO0LNl+eQQNyUTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BghgIYmZnwxJN6FgV4tl9VE5N6ikxIbaOXU6hGK2nElXDOmAEk2ApMZXBZOS/jhA0M/lqOzS9a7s7M+VE7Qp8/6YsHs+z9WeNo+M2Ozim7jFEMXmFyA8k1leTs4bDlTSKDMl1uEjYUUVgEBGICRXv4Cm8uHa4FRnURUV8lZ+IFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPyn6K98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRld+C20; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPyn6K98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRld+C20"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694KRs142839
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0UQSMtZb2dkaGCmhPnl+4tNtTS3hjmr7Jep
	Ip4F7f+8=; b=KPyn6K98VP+mkssB6+0f8pRk8ckzkuygXCealfEm5Ot03UAeeco
	zhguKZPAr/R9jS0yYEFK2MGUltC5kkJQ7v+CxEY2nCaZG8SynKpYUgmlKuT1aNCT
	8+XSn3zpDRLseiyXvmrhoukcFtVR1CUZ5FJkVuft0SkQX4jWexeWgTX3ogBF83iQ
	R97HmPvZa3f8Yk6VNi6KTaeO1sXL9JJHlpn6iZcs2hzzrg6WcYBBSJKWccVdET40
	DHVKRqxrCBvpfG20paBUBHi8sb4aXOKcHktDIuQQ93Z7LJ1HWrqed0dUlPKjkM1c
	jTyGrPG13A+G/kf/Q0rcn43v6aM6pc5sNNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swp70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:34:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so285502885a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330464; x=1783935264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UQSMtZb2dkaGCmhPnl+4tNtTS3hjmr7JepIp4F7f+8=;
        b=IRld+C20Rek9J94CNdXP5D8ITl5ya2zkPWrApqL/JLYWYFgTl9+P8ZEdg2oL2C6h5J
         JdAfkNFcyl7w5eLfsU6nuJOM5LxFzoMvckuUDfHXRnif7/fN5eOTFeXsLePAb88F6KWm
         xFBGJtOuqbtrtCOief3HUI1JAtS7CWtMKL+WUflLmDZl39iSzwfWrLHX0qqmzWCakJc+
         0CtkbZC7WLnZoC8/sIpLE2yPlAtFTraFSvX8Di+6JCk9XRMvpDf4+N0o5AO+lS7ldDWK
         chpZuixq/IH5q7AJY2IEVpxu0FEx+07GJx0MJCY8AMd6pFjUIvzOTeDiLY+XOIlx/fO3
         rO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330464; x=1783935264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UQSMtZb2dkaGCmhPnl+4tNtTS3hjmr7JepIp4F7f+8=;
        b=ffCF0JuGLm9cq43zl0YP2QACUSOvgTT27MjZmQEkdKhtQtBEBVplpJFY4NKxXK4EVM
         zttAtvKU93KLC98QZVZoSJgBhdsVhWBhkmORXEsg3pzyTiOV101ie/xh7oUMHPRRFgew
         UaWioD6BpvnYnFBD5qtL2/ecb3aOfPJLanXRw4XvRd34T8BMYdh+SkxIumZ39fQ3drx/
         V33jbKWQHanbQTU1U4+zYPYMXkgfvO3EiHptzLFrOW2rUzfLGQpmEKoUr7fcmf537JGz
         p95BPU0JqbUuDyaHEQILiZmPEamflcSF2jJSQ2eySPBVINfgOzxuEifXOEKw1CQP1JWi
         BFxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLLcIUt+zAgvPIgMJZaioFeYbu2fAz4wvVxNc1MNeMBByZN/bkjLL7hn23umuLLxA06qL/13lNux3z@vger.kernel.org
X-Gm-Message-State: AOJu0YyBdSplUIHWYR4ECOW/NRz+s0kRdPG7h6np+e/AzId0RBvpaFf2
	nzVLDXX2Qr9d7VyemTTmQUH6SJ23Bcb2gHMP97+WUPB7eTI4KGDVxLQhm3yGjd8SCn34zDGykTe
	aNVEEzdhKAW2uSpmL+AG23egA/CZHgEbnCSgB8PPATqlIEhnmxK21lKPF/EsiDXJi
X-Gm-Gg: AfdE7clg/jyKR636mIHNW6MEeUJDq+Gg2XE1QvYyIL5gdIc8hU7f46BwbJqG2LLdtxs
	F6pzxq49cDL8RkdaQNmLfmLAN2riO5VJVj5IsxT6q5KcNm/bOFZhfF6bRGm9YtEnc1pCEyHeci/
	KKitprdTdK1+KB9cSq7U71fWnxUhYdl3KMrwB78DfWi7jjn6kin2dGTQe81PV5R1k6g8STsL6JD
	fDpCW4Gp16qByvgnRvVX1DdlPA1rju21lSq0n2cL4yJnnNjGjAQrsPHh3T9B+AIK8k6eWQOMrQR
	14uGyL6xziDjXYXCaQigb4xuNnE1EPwAK6ZZdFmeVg3kxBSR8P1mhPxX+35x/xZrUjj5eLyw5UY
	zJe2DaBiWkag3Ayc9gK0FiK3X66E=
X-Received: by 2002:a05:620a:4486:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e9a48f671mr1300828485a.35.1783330464490;
        Mon, 06 Jul 2026 02:34:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e9a48f671mr1300826185a.35.1783330463974;
        Mon, 06 Jul 2026 02:34:23 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm22610871f8f.6.2026.07.06.02.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: rockchip: Correct indentation
Date: Mon,  6 Jul 2026 11:34:20 +0200
Message-ID: <20260706093419.273625-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=L7FpJNgmmdFvafbWuh2M8eJdyOikGO0LNl+eQQNyUTo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3abFxhXoFWPo9u+R/DFwgtbt8gzn29qroFS5
 g3aXI7FUnqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2mwAKCRDBN2bmhouD
 1xbbD/4ruIoImEerlkWKIhHVfjMOELsSaJEHfnm36aStXPBUhDxfQL8mCJu3e+r6qOIjb7Kfd2h
 rvLPWOnk4J9KTk87a+M55w9zFf7B0LNBAp6V2lkybe8QoWSVCvpHncG1Z2TTbr+secv5C7sPSSF
 rSwAw2Z3jy0JCrfq6z3KCiLi1XZOC+Xdxph/q/HcD2YQG6sleZbaSbn+job7IcPRsp6metGvBg2
 2AzTmcBYiNYBZtvzdvHbPZsHGgKWcVoqrJr/gth5A2NytofWCeG9bEcYoj5M7CKAh50M4dergGL
 JJksrlEtqZZISzfOv/vbNJy4uzGaXf9JXd13Ul/AwI7DUQX99ekv5CZSIFrRcAjf173/gQ1URqI
 14RsuTlqD0WB0Dm7I3ECv4fyA/Z7wzGrTx87qpfFZpkUydyN9dKwwywJVG/zcj1ZdDqLjaFYDO1
 /U2OXzAhH/yxIXpQNwV/oAq0DxPJ3BkRk1ZcdXpd2VOvO4uA92WxFIh9UlrQkt1LQt0sLzEgnvm
 1/7Pwi3sav1AE6DGXK0pz1gJQNrDCpQfoxilTvkeLTuN5pvhbSqOT9cXl2NkiPXimNyeC/uT2u0
 GO9eunj1E/5gBc26eb7AhBwizjtqaXUS4rvZRHrXdbxMMXEQVyNpBMvGgmaYq3dTZopvMI9oVv9 AU6dSVW39of+BOw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX4+cagiDLot8J
 RxyssNTk9JblKgw/HQyYyUVzgrmhheoWL1Jh1w5sJBl6hUwQUGtC5ZIOVNYq1s9s5ITvhOMBvea
 EYpXNFbgbVEZ+xH3/W0EazLtOZ03KP4=
X-Proofpoint-ORIG-GUID: 46hUmctYTDafjD1ENnHBZcR6-7UtlUqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX5cTLR8vNIEHV
 up8+QS0Cgw8kCSR+hjmu2pf3a7Rwh/PuZ6r1ggcrhho7FnMg3/IsUhODPAq3RG63SIVUkp/23wy
 SYEfhF4nC0yQY/DGx6uijBcydpKLp3bvJTknyxtB+pzsyBwz9hN6gXZGlKrMA7MAKjVaL2CYMDr
 JcY7k4/GYPT+93bAgH7Y9SaErVMOreumS4SALWcxPkfkJQOO67CW+QyP1VLR4whDZNwfXCoq3t8
 /fKR3URtI7osL2DuIa8SaIAx51ZG1mLixGJOyaJOc3MOX6NsnKGo+Dcbj6uW1fJfKo77ihM+wPo
 H6VJR3phf7E085O6YpOUksfRf9u/rJ+awj9upSzNknCAnpQQryHkRRexhuiufdG10PkyRTmvglb
 xv3aoryz2zeG34FZVByxyu7EkXuZwqaW09wAGpr96JJDDTtFxSOQR92iS/ha0tGR1aQBB/r5OYW
 FgJfDiShrFQrNVlpGug==
X-Proofpoint-GUID: 46hUmctYTDafjD1ENnHBZcR6-7UtlUqP
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b76a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LhIDl_lpc6LIOOucnsUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../dts/rockchip/px30-ringneck-haikou-video-demo.dtso  | 10 +++++-----
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
index 760d5139f95d..d0725595ade0 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
@@ -45,11 +45,11 @@ cam_avdd_2v8: regulator-cam-avdd-2v8 {
 
 	cam_dovdd_1v8: regulator-cam-dovdd-1v8 {
 		compatible = "regulator-fixed";
-	        gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
-	        regulator-max-microvolt = <1800000>;
-	        regulator-min-microvolt = <1800000>;
-	        regulator-name = "cam-dovdd-1v8";
-	        vin-supply = <&vcc1v8_video>;
+		gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "cam-dovdd-1v8";
+		vin-supply = <&vcc1v8_video>;
 	};
 
 	cam_dvdd_1v2: regulator-cam-dvdd-1v2 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index 7b1086682d11..acf44f8b47ed 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -382,7 +382,7 @@ &i2c4 {
 };
 
 &i2s2 {
-        status = "okay";
+	status = "okay";
 };
 
 &io_domains {
-- 
2.53.0


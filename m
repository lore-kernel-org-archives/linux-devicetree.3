Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C682F3644A3
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 06:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457505; cv=none; b=IvCfShq/FuWLeY9npiMoTS+NDhTnsWB5okf4wxPqKn9yZ8ZaxmnxrD1jFRxIJpnJi9lFimz0La1xhGhoWe6Q/ht/8AFSjBAA1olUoPPfiL76ytv7A4x0eqlYWUdQnBe4iVEhqAG8bC+SckOJNGXDfErTM2SWEAaGA5UMU+e3D5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457505; c=relaxed/simple;
	bh=cnSToU0JVi8FNh9yA4D0xjNAQN16uyi+Yv/aqF60iAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZifap1VrgIKXEGmBAskfqi0HhydliBaZ7MWAIGK/nVq+uK7bAC4RUn0rM9yXJHJ8jbCT2OO7SCPeTCdUJCRJMzauT8+zBoYrePjABVTrnw+UUK5up9MZqQGT2BQJuejEnSUPUs8YvSz7P245ukJXeVfgaiGKHScSzJBeftwVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtK6v6Rn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOXzt7AI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtK6v6Rn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOXzt7AI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Kq28M3594801
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 06:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sCXejvIvXzR
	onAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=; b=gtK6v6RnQVpWL0kdgpJjnjka7mt
	dGy7exiRN/TQ3vq4ereBnye38P519mZi3ZW3ZYIu/HeyaLMFjjJnjRBPkvaEdN5C
	cOdWU7JFEtpQaMtCb96BZIwJ5Q+5ISvL20KDs2rarJv8q/wRQ3v1zit0CM6VeyIp
	LncZ6jVu3lD5dU4mpXAbp3d3io4Vo//HPGetMAwlOeCbwMXlNSYw901PdAMsdvoz
	xgbs7gkLS93WsZ53+gz2NWZyRZcwCoCSbifa/8kfHBjZ0T2f07Ybwo8LEf5zKKta
	YLCzI/XpqR9v5sKBhgrQrAn2sHABQ2+lJCeLNL3deT8TNzkY6Z7pV7Jq76Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1c59w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:38:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d76f460b2so59143681cf.2
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457503; x=1776062303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCXejvIvXzRonAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=;
        b=VOXzt7AIrpduq18bpZxl1W7fb26e8VS0+x/xIfq8AKTtxbDPBt7afr/60auRKOG/Vi
         I1CI57vNqY65EBWY/HIM6QH8CNNzD7fBv18NqdeC3S7HJ1W12AmIdPxJxNxuXCbtej9K
         h2fcXDQ7ukF3l9KIAL0AcmYOgflzI40trT2zjMr4aZ97usjzYtiki3h4eD1EgEBtSZXd
         FanGoTEp+XGZf879TsngUmkCAwUAP3ZnI2VdEcWYfH7qWOzWHkUU8q8nI2lg8Vt1OEb/
         m4+SsH9Nj6hQjhKr9MExujTH0qFKmVrd+r0habNofk4gviLWHqiklpsQGbRKmFCymYRx
         TsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457503; x=1776062303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCXejvIvXzRonAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=;
        b=KtqcGHn1eacIKsWyzS13AWxG0HpkODrWjSExiyQndcs6DaDfRIFbsIkyj8oK/8nLOD
         /aKSe1n+VVMPYeGOPXqgF4ew+y2W0nr+EJrM6bIhWAdA+QwEafEKm3lYggfekwXWHxU+
         J6eKF26fZ7eps2IixRXLn2rr6+6LB9X3K1QVfqEHVEMFEi8QK2/IbatOdi0c3mbL9OQG
         CeJe9RuxJt02NmTWAQeCpp/Pyd5BzAtG4AsTH7mnl8NJw4jR8+Nz3GDPbOstIZEl3Jrp
         Ugnvmg7jl4Htsg1xyJcCWZ8klTEfdVJPWj7JAAbwTQnZvRrCG2PhpxP7kDxlG8L0g7Ni
         ddkg==
X-Forwarded-Encrypted: i=1; AJvYcCWj3uYyQOL9fhhkK+IYkFNhhYHPdT/5AtBTpFajo93OSMEMNdb8ZE2INbWuh8MMnNn2kHfR3MlXg1or@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy2X08s5PcpGYIscMCXOJY3uagRly1f00RJ4R4W2CY6MEfq4tj
	Zh68m/OLe9dcudwAB0m4vruaRlyY7I+7xEbSXzWRwHl+Mv+y3GJis8S7nWbtjbmikRthbiCRf7r
	rspCTBl39Rrv625O+AFVneibTir6rEZZVdiEAx7KTcSABNzKroEyLPsMX+T1hJKOh
X-Gm-Gg: AeBDieuIf9KonEhP7fo93jA/5WgdOuBjTx5B3G+fEaw20e49sQ9mwHgB0nKmMXCQ1CF
	oww/l2NoIy060XTuwuY3MP5nAtLowBPYsrKEqEUAOJj8J3tk++gxKxEAq/WmqMhsCttg2F/ovUC
	LpHWHrK25iiMDf5wtwyyitHeoOevukKOYJ10YJ2qVPTPocqRasEXj3b7G6agp9MA7N/0y5hSi+x
	HmnPW0S1wnUYU/Lg8+yR1maFHfZgiAMxoJHbH7y0on7gTBIhZ2CMHivCrkIgryemgfnUQ4AJ2a7
	A0zbbYj7ltbF7pbbnj+OF8SMowrz6wC8wpp0vTUmdD14/cmd1CyZHe9FuZRTqGNWhegIge5pyJa
	waXWxVX7Wx/hqzCBieRAqJf8I+guz5mNMJbwt
X-Received: by 2002:a05:622a:18a3:b0:509:2618:cef1 with SMTP id d75a77b69052e-50d62a80efamr193960911cf.47.1775457503155;
        Sun, 05 Apr 2026 23:38:23 -0700 (PDT)
X-Received: by 2002:a05:622a:18a3:b0:509:2618:cef1 with SMTP id d75a77b69052e-50d62a80efamr193960661cf.47.1775457502818;
        Sun, 05 Apr 2026 23:38:22 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
        Peng Fan <peng.fan@nxp.com>, Fedor Ross <fedor.ross@ifm.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:13 +0200
Message-ID: <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=cnSToU0JVi8FNh9yA4D0xjNAQN16uyi+Yv/aqF60iAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01TWXJeeow51hO6xuzeuJNKOn8auMRg1PTfGN
 q5wYAjvx26JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNU1gAKCRDBN2bmhouD
 13WSD/wLwS38Q3CdR0ASwRG7YTDJkR1cjbPPWx4JIdVIn+BN5p2xe6dhzSBEeaWGHmBOufqCYzC
 NJOfa8vYbP00IBTtZX1xUjKOL06nwmW8nIGDHqOLBMxxhMaFFYOKdP3qQefszeFGBlH768yqsHW
 L0knMV2ksg7T+EMm2zQq0GPX43+mmrF8vlHrp9ZKZ/7mvcU+T7PQHaF93bfUJZReVa9WPJ+IGa2
 h6OanYKu+rXBvaxmyyRKxEZcHKiOzenPaudB1Zq9d5aAHeaayK6qZMmi1R/7GFYC39EzYLCm5lf
 /If92JAnEB2fPgeJpCrki8aD4++YO6rFoHENoOdBBoyMY+Qe6NH/kLAyIUOpAh/fnD7XIXc02s1
 Adm5XLAgy+9JiN0JUHUZJRepeMJr/4hVy/e57kcxFijBn1b4FURiS/DYpqkYEjvP3jhDnB1POoF
 6JkB3NffyCXhrRatEPFW5y26EueAeuQID/VubmmVwVZ1NKbcsRbO+vG//INPsL6Uh+4FurzVA0l
 dSJSLgGzG9BpV18FKkXHDicKvgaBdWN3pyr5//bd8pmZkdBFANtM8I8H3pKeGw0uRP+PtRlCmFU
 20VUFZW0yduQeYdCeGQQhpe+tc19MWW1NAt4t6NXd2InRYcgPSUjky+Dym+Es6WMEEee/5siIV5 0xQ7CQSP0flDPWA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FJOpeyuQSc8nOgGLrzelW0qwAi2MnzCE
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d354e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FJOpeyuQSc8nOgGLrzelW0qwAi2MnzCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfXziJJLTBBs+A1
 egNo4XdbaV7eakixkwHH15zCBkJjMlVooIzLBTtAOXe4Yeo9GFWFrUGzAdjKJ9G/p5fSmRvCKVs
 J1g8GbF78VPgP2YAuPSXO+2eCt1yOi1Mr6spC02xNC23kwqxES8s0hMzW1yK/HVu/ig7G+3Mnf/
 pxfwGh+YQcpqEnfmxU69+htvUvAOqS+9lAkWnP3xTwLOO4N4Rywa4qKC5fUnRrtVljx/OPuR0m7
 cqfvyXf0bymrR3EZS7QRiyv2vUzAHQmtupJdkBwnDhPZEoNVHRZsG+fLGJv3MfE9/wAHFSUunCB
 X+DgsSe/kjUHLw4cxL2gx1Nn3zis9btOSQ4H+EArwszxbIB9/dE+hRfE143pahiHv6g4HfW4rzf
 hieovtJlGLNdHY3Lh/19JZjb/3ddCOomC60Pax9AjQL3tA9cmzi7naSrw9SOi8FZ6HBPNBxwpek
 IwDvZL57ZUbSqEGU4mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060060

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Correct the interrupt flags, assuming the author of the code wanted the
same logical behavior behind the name "ACTIVE_xxx", this is:
ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW

Fixes: bf68c18150ef ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
index dbbc0df0e3d1..443e4fd5b9bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
@@ -281,7 +281,7 @@ pca9450: pmic@25 {
 		compatible = "nxp,pca9450c";
 		reg = <0x25>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pinctrl_pmic>;
 
 		regulators {
-- 
2.51.0


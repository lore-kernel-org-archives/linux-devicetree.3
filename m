Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE03CE0BB
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032532; cv=none; b=oC0HheAD1/ATTrQUDf2zYGeak7/XoSmylR+3BGEJwQGB2Gnzc0hYDU3bZxNG4OQMuMYUdVokR1vkDO4jftUwpmdsuDN+3R0/vlpYc/shbJ7b4ESalTh0Gj8PxgNhDGQJ71aR0sNowPr9EpAnrlKRnj8AFXckP6Fqje4/NkGauHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032532; c=relaxed/simple;
	bh=BbCuz6cFPXT9NGbskaMTv8v+sD3jV6Mr18Elc9/RIhM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NI+4E95/jO22F86yYdIy4l0vcTLzsZQEe8rxN5qJl+MhP9vYCVAwySbd8aVnEJerDuQQe9GaY4IgEm/mMSA+vOM2mUH4xMQTzqRDAxxlJU261NkLGNQG2Y3hbxzKfweDXXur0KI2PlxxCE4qOQrJXKLQkgych2xKo8FOQ3f1p6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuHa/bhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPY1bEHn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuHa/bhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPY1bEHn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx3RV2197235
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qoO8N/t+dbhkTmzXPT0NEb1XZflknAdTKZX
	b5wgS1ks=; b=AuHa/bhQlze39BVcvDwSIBIpCiPFSjZ+OVX/eTm9QBU08whQN/e
	AWhpUd+Z4MpBIWbiRCewfLR1FuagvceoB40v3Cek4KPWvQDoPLXMK0kSt/OmzbOP
	jZim8VCEMMYldTKjoBQbFDz/9MkuG5YbD+o2huEt+TIbq0y7irH3NNSuDaJwg1xl
	TjqSNEiOVvaPaSU+5yANxmC7F6yNkmmMpj57OiOGU+kX0nLJ6VaQmbjBYo7sAHPS
	X7wh61kJjh7fOm1/49ecSw9eFSTZ/YLMdgY3ZRUxMdAIzmulCXU9tC7204xdwVYn
	9IyQbwdXrkW7/8dJDFbmmo+1gyNM1EQ/Few==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe29ppc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:42:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so454766885a.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032529; x=1788637329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoO8N/t+dbhkTmzXPT0NEb1XZflknAdTKZXb5wgS1ks=;
        b=FPY1bEHnhN7xZRHLIVckCjYnJ/BTe6MIWD6R17K0zy7zRdFyM/66X27sctIux1SOk9
         3u4k56kLXH1IKTr1MNrAdDmvY9Pn6eSO3l6C/qm1NqKK5GZDxFp4skOWFUO5tAfJBbQm
         iWcY+tpUvOgiyJBo/SoKxMWUqy6JwIyf+vOi33f8cdk/aaR9PkqoxreyXdfVyFnYAtB6
         W269RjLFnUZdvOqUjFeQDyV8kTvPv93ir+CGjUT71Isuv7UXOmO0COT4p3kfB5R2znj8
         nfeMRBdk8r/j48TyKegZ8b5c7ABsGo7M4dB39vP14v+5egRh/jiPcnJEXSmFyfAnAsL9
         XRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032529; x=1788637329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoO8N/t+dbhkTmzXPT0NEb1XZflknAdTKZXb5wgS1ks=;
        b=OdlFsQ8KJ4xqw2uslAnw8DhClhQetTjji17mOfA59Spw+fVPXDJFBPsOWbntzFvOg2
         LzhdMpxZwCsH/JoIgxhLPXy1upA6r1J53+1qFSIKNLcwIRobcc3+UB3RXlgXjfoO+5mh
         3i2PzcyUqAVhBrdm8IiSBTH+KmOxuC8qJ1Bozct4i0SYxpA1MHX6m5+5GY+zQNCEnXQ0
         EUTS9LH+qxvpVJtiMBIrIMTnjSEJhT0TlCAr2yDsN3f7/Q+g6G7zEEDEAanBawTk33Gq
         OriGlR2+4b6DNJurXikHOJOjQrOWQHA3hc3SR36XV3w3TDxQUGuIGLsXlyvg4pjshGKt
         gl+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq3KqThiMayuV/xFyTG9ObM6IDKtFEDg0r41iQx0EArPfb8PqG0eeU/JFjm/i3m3xNV2eoyqDIpw0m1@vger.kernel.org
X-Gm-Message-State: AFuF++nQdcsTf6Tw9Fy+GIRR8Tde7KpFqkZj6YsGJFzaliYcG/6rbxdw
	I6NgVU5WSOcen4ZCcDyuETvnc4vuhPZbSeBkiMWGyWRal8XSKoFRlz5eAMhWGuNHO9WPm3uSe7c
	SDAlVHA+vxnTPQxfKTaoRI+lqA8Pm0gj60hehkljO7z7i0mDYJ5tA5+jddWxg71fC
X-Gm-Gg: AR+sD13qfv0oWc2RCMmNRVAOt6B9Au57wWHKjCz6FuPQ6PbhalNOJsNGXos7OtOgwv+
	/O+qQRimnEZlthLdpxo0zW+BKXeWORX4Txkf3FJVO+SUc5dBerexPPw5kmLj42Ziig92LA6SD8l
	OjLD91dyYm6PF6VW4RMI/bQTYSPThEZxpHtnz1VlHBVIiKp5WLbTZmjvWJH77gBG0/zKa2ll7D+
	eBLKNYnCL9SZIBMSFiwcSd+qbvtMe8FEN9JFiDfGV6IEvj7pqGNHAdgMRbi/QULoJesStM1HFYQ
	UTGQo1zmpKXsQvjweOnqtpfa+Zez85ONwkY3sRyVvyG7Z5QzCxjOkcNer1MT574SwSSL143P0yN
	QuODYGX6y9RmNtaQ=
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr222014711cf.9.1788032528631;
        Sat, 29 Aug 2026 12:42:08 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr222014391cf.9.1788032528192;
        Sat, 29 Aug 2026 12:42:08 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab730fsm12565406f8f.8.2026.08.29.12.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:42:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Jesse Taube <Mr.Bossman075@gmail.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: fsl: Replace tabs with spaces
Date: Sat, 29 Aug 2026 21:42:04 +0200
Message-ID: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5713; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BbCuz6cFPXT9NGbskaMTv8v+sD3jV6Mr18Elc9/RIhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzYLmZBZmlopcykPk8eVfdVP9/2i7IHlLyPM+
 ZT+T5E593OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM2CwAKCRDBN2bmhouD
 1/+tD/9s18VfyOGpsT+XoJaxwp3s0w7usBuNWv1fkwBgjf2lYeI/cQJUCiMjpXYGx0xksnc2Io+
 jD5FJieHhT3zJh/pWPreX2I3Oy4faVIj9ZsoRxqjJCJz76bZ3GxwVjowcqhL2/z7HnmWJ60oirr
 WnilmFowVLaxmWoGaHzfR5/oGNtU7hpkJqgwr24n5PKGLiqYzx6DJoBanCEIEdoAJHbZCGU1aCu
 IsMDG5kWTrY1CektmR3Cg48F25YEZ9MNziz//eklc5xRUU73GecmBCvX32fOAxY78xpctFZ/WaR
 8MCRn/khXZjQMsY7DLMg5KIeCvLCP7845BH7AkjVR2ng3QWM171Y4q+reGUZSJxm78CzuIASrbM
 /J+vA0/mlA7O176NMvuykp0Dk1+e8nR3ODutk/rpL6Hk/VhqsR/5j4bo1xtIAR45shdNF8oIQDK
 uMesdqh+q2uM06SPMsA6tz2ySFYUpkhnSzpMeCeXNJkCvqWxK/TTQxCd2hok3hnyp1EIOiPzgRp
 Hj2sgm0t1AX0uayw5B9rscv/zucJ+hhMVXPWwr+0QLIji3sIs8M2a67d1Q/N1sa+whOuMU+9Nm2
 b9zHI09cPHDtSBHDORyRp3QOKOBAZuSC/DYwveLiBotd2wy3LOdQlioljN4HPSdl6jPSkmN0lm+ yVweh0mpsrFq3WQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a933611 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4PiMN3fzvG74CLbEUuQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KCsO1lukhjtPKQyfAB5bQXEZ5yi2AXkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXy06XkHaqw1VM
 w+wThd7g0ecDYO84spegjfCK30zt7TcNkF3GB3f43CanyRs0HjnWAgDxR0x17+z1d7OjnxthSVg
 4EP0tCKUeTb3QFLRLe9LPqBAgGq0Z+BNKbZDMhpBGcZ83f+lIePOppWVEwrM1kLVxj3AgKwva87
 q9b7itVOuFnBy+y76PgX7+fER9wpdCsdE3tfppBvl5ee6CmRvh8P+GcUQ65MWM0YtzwwnmdThXx
 7QBSPGtYla2Fqe5eFB9RvJ+lLve+x6/JUsuY6NlI5JORG/WxE+1B8zZY1e+ko93NmWyxhzEwPX6
 T4SpIr1idAv9Q+oilGkRcoqAWQ0aO2bFws0XwEaEaKZDIIxuBF5Rk191P27pmHuCfiR05gG78aL
 ScCINiZixTO5mxpZPfBQBizjrEK4GpiKN0zNl4duQmIps+jh2mU6ILXfzKstR/if2zIvCTIcPaZ
 bkZYuPeW2a2JGVwKe3A==
X-Proofpoint-ORIG-GUID: KCsO1lukhjtPKQyfAB5bQXEZ5yi2AXkS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX2QjxZMI39gCI
 lnCnbBNWTZeshdbQFnzQzKlZqAMdA2rIuHW4UnxlDfxcjNrxRy7gbHYs6QPJNJ3K4pAtaKYRJxl
 Vzow7Z8mLOds1edS8PhZlIchQ4cnQns=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

YAML files do not use spaces, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml    | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml    | 8 ++++----
 .../devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml    | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml     | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml        | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml        | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
index 846e110062b2..0a69ed9880e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
@@ -179,7 +179,7 @@ examples:
 
         pinctrl_uart4: uart4grp {
             fsl,pins =
-                <0x288 0x658 0x000 0x3 0x0	0x140>,
-                <0x28c 0x65c 0x938 0x3 0x3	0x140>;
+                <0x288 0x658 0x000 0x3 0x0 0x140>,
+                <0x28c 0x65c 0x938 0x3 0x3 0x140>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
index 7bd723ab1281..948160cfbc5f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -95,8 +95,8 @@ examples:
 
       pinctrl_uart5: uart5grp {
         fsl,pins =
-          <0x0160 0x03D0 0x0714 0x1 0x0	0x7e>,
-          <0x0164 0x03D4 0x0000 0x1 0x0	0x76>;
+          <0x0160 0x03D0 0x0714 0x1 0x0 0x7e>,
+          <0x0164 0x03D4 0x0000 0x1 0x0 0x76>;
       };
     };
   - |
@@ -107,7 +107,7 @@ examples:
 
       pinctrl_gpio_lpsr: gpio1-grp {
           fsl,pins =
-            <0x0008 0x0038 0x0000 0x0 0x0	0x59>,
-            <0x000C 0x003C 0x0000 0x0 0x0	0x59>;
+            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
+            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
index 6068be11dfe2..2341633943c7 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
@@ -82,8 +82,8 @@ examples:
 
         pinctrl_uart2: uart2grp {
             fsl,pins =
-                <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
-                <0x240 0x4A8 0x000 0x0 0x0	0x140>;
+                <0x23C 0x4A4 0x4FC 0x0 0x0 0x140>,
+                <0x240 0x4A8 0x000 0x0 0x0 0x140>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
index 7dcf681271d3..dc86bf6e580f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
@@ -74,8 +74,8 @@ examples:
 
         pinctrl_lpuart5: lpuart5grp {
             fsl,pins =
-                <0x0138 0x08F0 0x4 0x3	0x3>,
-                <0x013C 0x08EC 0x4 0x3	0x3>;
+                <0x0138 0x08F0 0x4 0x3 0x3>,
+                <0x013C 0x08EC 0x4 0x3 0x3>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
index 96e7b6995273..333b2e7fdaac 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
@@ -78,8 +78,8 @@ examples:
 
         pinctrl_uart3: uart3grp {
             fsl,pins =
-                <0x48 0x1f8 0x41c 0x1 0x0	0x49>,
-                <0x4c 0x1fc 0x418 0x1 0x0	0x49>;
+                <0x48 0x1f8 0x41c 0x1 0x0 0x49>,
+                <0x4c 0x1fc 0x418 0x1 0x0 0x49>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
index db5fe66ad873..854fbcd8e78a 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -73,7 +73,7 @@ examples:
 
         pinctrl_lpuart1: lpuart1grp {
             fsl,pins =
-              <0x0EC 0x2DC 0x000 0x2 0x0	0xf1>,
-              <0x0F0 0x2E0 0x000 0x2 0x0	0xf1>;
+              <0x0EC 0x2DC 0x000 0x2 0x0 0xf1>,
+              <0x0F0 0x2E0 0x000 0x2 0x0 0xf1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
index 2e880b3e537c..988db9507543 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
@@ -71,7 +71,7 @@ examples:
         reg = <0x400e8000 0x4000>;
         pinctrl_lpuart1: lpuart1grp {
             fsl,pins =
-              <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
-              <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
+              <0x16C 0x3B0 0x620 0x0 0x0 0xf1>,
+              <0x170 0x3B4 0x61C 0x0 0x0 0xf1>;
         };
     };
-- 
2.53.0


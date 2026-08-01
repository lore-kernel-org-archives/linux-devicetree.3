Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06FA1DED4C
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 19:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614116; cv=none; b=AH8XJPoakWQzyUaleFMhpLC4MvPNFZc4rFAnrB6dMqRdFViU52PsG6hpa1KGvk8ebozjuILXSeAZO+WYE0pctxzzFJxeocJVs3OUPufrsH5IBuNJ8pC3XPG68PHFOf7rvNTrRWOTw1CWKqwSzI89IjqNw9lqsUd9Wz1JjHMAGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614116; c=relaxed/simple;
	bh=6Rnuy0ZI9LSwFMu2N/BxYj84Vjuk07JT+SeI1Do0w+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=trXw3ORTtSL629bQFZwKkkGpP8pk+3DKS4RGgjxQK09LP5DntFNALDe/rWaJJ4kxmoGSyYQXN3m2k7sD4FNHJFXuXhrNfSGTFn6XRpQwq50SA3D8DyGgWxHGIx2FVIk54P5FXmsMd/CRvEDiODLj7PTUjJapX1IO6glWLx/iHWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxk1d3HS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asi6xf5U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxk1d3HS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asi6xf5U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J02km3738991
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 19:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/rSauAHR+KQh253IKg19esceySLhpM+RP7e
	7oNr6Drc=; b=bxk1d3HSzXw4PYZJ+uKaYZNyejgZKcZhLt7NP5ImKWAUnYl858y
	cVs794u2NL0KdOrPDkR6KmOMn6WTFTi4gy6nktmtWFN6GeUe+zeF5RbcZpNbl7HW
	je0KNkXaLf/Jol2sitnBsuJk7lRyyY4WlT5mBHPb92NSuFJy2qNT5xC0u+Gd2m3j
	StltJThwmL1K7eJu0I3Goz2ceWjhtJeRunV3d0E5YqDf2a5SHkJyBVO34sqfiKho
	Pc5L6+N/kqVe8NX6W1yZ8mMyK+wLdmv0b9QQb+gzI98AJYvPZ2kVhRAunjNKUd2h
	aYRLgQMg88WOgbVVdEqGmQ4UUZPWjWrflNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u99kjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 19:55:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso20167861cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614113; x=1786218913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rSauAHR+KQh253IKg19esceySLhpM+RP7e7oNr6Drc=;
        b=asi6xf5UA6pKNRPL3CJCyQpbYws5oZ6E2SR0UZMBDHcRBr/FYW/72AUB9jazNNXRlL
         mD6b+L6/F0Yj8nwTlMyqGy2KdLSJY3LOX5BDeG9e8tlm3uJB3JLQMFmTIaY9geza1tCO
         KcENjdapuSE99C4HjWsUhqiFzrY/IbnKxX87ec/3b4lWXj/jsD6VxYuGvF83bXcgHg/k
         FwXSrBPXQiXqCzP+Hl1jdYFjtkTtCX8KlSY/mE16rYiSuLiHsUAk+U8EPiAG+bLIqKIn
         d8UoGVR1A3ujWU+TRoky8WWyqu6QrdZa8RGqj7poOnLSNQruGRDi9biKYLVtCPTsyTfI
         nu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614113; x=1786218913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rSauAHR+KQh253IKg19esceySLhpM+RP7e7oNr6Drc=;
        b=DTHu6hbo6x2l7xcUmvh5Pyb+QkaB4vi5d9tPM2vHGpszT8Z4Jan6G+G/V70xIuEnXf
         kvVH0hwfkYNLDWPFiWD1JAqKbuvnXf/VXcpWLouFxRzp4Mst8GU9mQKYv/KMe5VdJaG8
         YY0FPgTg8CfJAol1pSmzJY6SmFOC5pCtDVkam1Ix9dPf7pHpS4KEdBfMn3LCg1e1Yo3U
         n692ofyEpPHyu0IMn1vlLxY+jq8zvrNUf6aClkPzBP5FE0QJL192nCHD1oRnEXD7XePw
         IyBzfwXKlPMkIYJQxCbjtVhUZg+vzkhG0Xy+/6ehy2MvGJFql84f7Z3PMg4gInXaEVGR
         GkzA==
X-Forwarded-Encrypted: i=1; AHgh+RotJbYD+hEy770nQuYFml+Zo+/jUuQWoEaEi+rCOGiSxuVzSjVUKfzmNKlTOVUgYeAvnj1zIW+UKnP9@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyozQFBnwOgAKeKOd9cfTlcjCi/4MqdRvhNbkBNoahn/N6tPq
	PgXA3LcWzzY/sCGfb39mBMkU3uT9PSYL2blK3/I6tgN+BwwO5yIGCy/ecW+GG97X8A3RRhzDxXA
	i3JIFj/t3XnN40AmH/iFhnqHQXh/1xPLkjTs3Yu+/aqRVpUv1DvdN6/Xs335UZeeA
X-Gm-Gg: AR+sD10DQDAGR/R4/DEo1wjQnzNZHZ/Am6a+TX8zuuCGlKfob9WPEBxTHzcnbSdHCR7
	syiGswhDME7VHNyuwq3NogGE8WaNJLZk5XLTdWX+1z4MgA27lOv8oddTzp6mLt55lOrXQ8s77di
	eOLWOx3jPojLyaLrKot7H83BCyAfK5sZ0NZuyfVf2Vr+6CsdT5Zr9RYMc5YUKgAASWcg+Cq4F0U
	VTkXo8wmjGj44JwHMnFhIPox9IQsJu5j1vQDB70Mw612NVbtv0ro7ZwVg0yFIvarRmxJfJpXFte
	35gcRSbgrwSloyqmvAf/rCFJskLDIo+wWM2CZdZRyMNuXIxaaQ1e07R+uOX7wgoo4uD8XniCE6k
	JkYqvCMZ3K2O7HiCe
X-Received: by 2002:a05:622a:4110:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-52b567d8136mr105346051cf.40.1785614113076;
        Sat, 01 Aug 2026 12:55:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4110:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-52b567d8136mr105345741cf.40.1785614112553;
        Sat, 01 Aug 2026 12:55:12 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b917efsm128193295e9.11.2026.08.01.12.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] dt-bindings: net: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:06 +0200
Message-ID: <20260801195505.235099-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4002; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6Rnuy0ZI9LSwFMu2N/BxYj84Vjuk07JT+SeI1Do0w+I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk8ZKVWCf9nvvQMsjQrgQMoA4KcejpZi78q/j
 VOwWhJcUBWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PGQAKCRDBN2bmhouD
 146aD/9Hde+I7H0ivjXHPZ5b9k6hkmSCAV4vjAAtOWDjp7HgakkRrMonmUpVDzANgYlpxs2AgQM
 +oKERpdW0VPFD5v1bTz/R1/1/tmqxyQQEl6QV7LSxg+pbKhNQyaPMIbM/DSFGmvjC8q9SCDdeYF
 VIMKQ589KOQVG4wy3D2H1zuhWMzNu+f9Ad7mNqnncm2yMQ4VG0hWq9FpzWlR/QY/N/+4BFez726
 3RMx93kUZRkk2m+qQ0l8G3igPPCX8HsUyXLDyWxcwB3IeIVU62/ZXSjQy6NepU5xXUVzCk7F/1Q
 1MVPOrKjiROqlY51Bvvh0K9qIFAE/9OTRU0tH6g1JXHzaGYOXL0/z7xcclf6phUBLm3PdSX/sgA
 IyzM6uelvgjqGomscWHze58dHLWsr7YwJScTwgQwAK+7tf1mHCxz1awaOZ7GbfcsNDfb4KKEurw
 JFjcm9MGCowsPHDqJKJyw8pqUbi6yzCkO4MHObDCYOFQf9WbR+QlqvvQoTERxBn2z2R8F2DVHmP
 Vs8nx/tjluWA35KSDYnho3uiLIjTWccW4KhAkxcql206yCVBcDohEWkh1el7aqBokjO3g12ICYe
 p3g3IzrJWTH80gCaMA3uEpVMvpdFD0X4xP5b5h9LDWWcAjwYa9wC+wkgMEsoH9DgUg/1uLbbXGW jBDXJrsZQyjzfQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X-6qE54rLTU0kqzMyc-SF0LQ82ZXxTQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX+gBhV7jOr5v1
 9syvzvWtTvYYLsQBCGDohT5Sn57ScbFsvM15KzEND0jnR0NU/i2tO6+coJyF7LGyELJxepL2sG8
 DuW4A7qjh/DJ32eEz4WoVe9i8X3CDhKNCWZ5/+41VKFVqR2e9dM/iZP24fpHaElD7gUW4Ce1X7S
 jYFzJE7VONOyy82WG2fGwfj9YH07LbecOCArEo0jqlVm16IR1OA+3HkjM+G1szcQqeqvptt7EYR
 L4kZI97dN6GP+j8puTt2gCb1ja4Gd7T5Lz5SfFESyIiqiH+e09AZsFQk/tnZm1ZuGm40XuebR2N
 5esJlzf7TfeDi1oa8Nyss4wuWDWZdbHqcFHk5nmex5seRn8w0rUx3qsB1ZUdr9/NjaraWIFZaM/
 rweVox9u5JDUSWx2/TcFLLeFDrpj6rT5ho5PnqIsacCn3ojP9mNoD+R9pd1KV3QRarDdrqk2nvR
 GA+KtY/jVsHv8nLhI8Q==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e4f21 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mxJljgaHxS3Sv8GYpwQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX+qHSTNBlkEDm
 pA8bqaDkxhFtfLFeq3VNSx7nPwaU/6zzhMLBX+8ewJ6tbqGelOGF7oQhJrfKO41qxOE2/ZfiwWX
 GaAIntUOogUeK3AiS8trM4Ln8Oc0XSo=
X-Proofpoint-ORIG-GUID: X-6qE54rLTU0kqzMyc-SF0LQ82ZXxTQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/fsl,gianfar.yaml    | 2 +-
 .../devicetree/bindings/net/microchip,lan966x-switch.yaml | 4 ++--
 .../devicetree/bindings/net/microchip,sparx5-switch.yaml  | 6 +++---
 .../devicetree/bindings/net/renesas,rzv2h-gbeth.yaml      | 8 ++++----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl,gianfar.yaml b/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
index 0d8909770ccb..e2543b683bd4 100644
--- a/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
@@ -234,7 +234,7 @@ examples:
                              <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
             };
 
-            queue-group@2d14000  {
+            queue-group@2d14000 {
                 reg = <0x0 0x2d14000 0x0 0x1000>;
                 interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
                              <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml b/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml
index 0f0f35865ef4..b4efa2f6036a 100644
--- a/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml
@@ -140,8 +140,8 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     switch: ethernet-switch@e0000000 {
       compatible = "microchip,lan966x-switch";
-      reg =  <0xe0000000 0x0100000>,
-             <0xe2000000 0x0800000>;
+      reg = <0xe0000000 0x0100000>,
+            <0xe2000000 0x0800000>;
       reg-names = "cpu", "gcb";
       interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
       interrupt-names = "xtr";
diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index 75c7c8d1f411..9de8eeb8c6a4 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -210,9 +210,9 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     switch: switch@600000000 {
       compatible = "microchip,sparx5-switch";
-      reg =  <0 0x401000>,
-             <0x10004000 0x7fc000>,
-             <0x11010000 0xaf0000>;
+      reg = <0 0x401000>,
+            <0x10004000 0x7fc000>,
+            <0x11010000 0xaf0000>;
       reg-names = "cpu", "devices", "gcb";
       interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
       interrupt-names = "xtr";
diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 2125b5ddf73d..c8f76c8e7584 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -254,10 +254,10 @@ examples:
     ethernet@15c30000 {
         compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth", "snps,dwmac-5.20";
         reg = <0x15c30000 0x10000>;
-        clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
-                  <&ptp_clock>, <&cpg CPG_MOD 0xb8>,
-                  <&cpg CPG_MOD 0xb9>, <&cpg CPG_MOD 0xba>,
-                  <&cpg CPG_MOD 0xbb>;
+        clocks = <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+                 <&ptp_clock>, <&cpg CPG_MOD 0xb8>,
+                 <&cpg CPG_MOD 0xb9>, <&cpg CPG_MOD 0xba>,
+                 <&cpg CPG_MOD 0xbb>;
         clock-names = "stmmaceth", "pclk", "ptp_ref",
                       "tx", "rx", "tx-180", "rx-180";
         resets = <&cpg 0xb0>;
-- 
2.53.0


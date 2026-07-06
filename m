Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415F414A0D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361032; cv=none; b=VqMgyneT4ONGHsnqUFXHXLQKw0rO9KDHpIkHrAYT+KIe1ibbsF6Nt3+U5hjjF08qKmZnvJgAXwoD4IaRB1Lm35Ido2C0SUccoC2XmTUvtqqm14RXVT/VtzVBxgbmoq63+a10ZvWY6y5/Du1CwOCYZV5E4QnQawRyZzV2l4VPgPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361032; c=relaxed/simple;
	bh=ZKpgfZBQLfz9wvo5mMdQIlagv8p64x3j95+GYzrm8Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqSh/Vg6Kwnfad8z14p+5RmK8KBRml6mr9/tFuFdJ6zb8/LFZhfjY5G0sbjpxVPEa0GfHpWaB0Uk3pM2Iw+3kMSA2TBYlmuMUMYWvvPtmGX/kfFTHTd5exOXjmpIlW6N+/dFtsmlOLgQUeEvI9KsyJKEqFpJv9tpLjdjV4bAXXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKYMCFWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGOlokgT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKYMCFWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGOlokgT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBfq982547
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2sllh4lJbE
	P3/nEKCxSWbGIu2PpVIeF6y7kzzDO0J4=; b=VKYMCFWeEgCeNmxSB33MvYU6UXv
	St1vQcpCUmOH/CZqTGRdU+F/+XX5si2c4aJa9TxYIMlld1bZR3KSK56ZHF+SJXoD
	kKZAgJCV8G2MxFYtgy6XxYhrmqmsoUuLbL4cMs4HigUOtpV+/OreafKwO5Ih92wf
	46NlYHYLFwppFBLI4+vvqWPFn4hYpCiB2vfeSeyqqklbEy6kom2LPg+X1FCv9CKK
	aHrnXz5ZVMwxzQNP9yZ0uzF0kBpkGib0zY8WqidtLVwJSJXI6f4zPnMz5t2Nwwjw
	0yZ6rZd/PB555UpiBXd7dxmHepHaPDcHrOL+Opf6AVejDqU1kSUOtiJR/BQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjas3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:03:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5be1c53e800so2902608e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361029; x=1783965829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2sllh4lJbEP3/nEKCxSWbGIu2PpVIeF6y7kzzDO0J4=;
        b=cGOlokgTt69mlvMo9PG1e4Ivty3hB7ISw1zO/F282k7MLLbn+P5/eUwtyjwYH2JqWa
         010yNDHB4vcCPQaXKzHfV3gnKeBaN9+xjZUA4YixEre04hv6cOHY5/T70HqCYO4JckaO
         /+TXhWIgUs04RggZl44BewXVnDoP186kmrmgxpJdTx5ePAyQ3QGEE2NGx+pxY5sVMnkq
         w0+jDdOI8c9TyvUsGpv4GleFB8YU/SRmPJyzbqxiLpD3AsLmdK3Kdh76z4nPzf8wXS9w
         oz8wj5B9CspvxfWCf8TnlAv9C3c3myvZyZl2ds16iNJ40Ytow6IBQ6pupyQO0TXtywDA
         n1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361029; x=1783965829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2sllh4lJbEP3/nEKCxSWbGIu2PpVIeF6y7kzzDO0J4=;
        b=I3zWLmTUspltjh9i95LLapTuQban3810wNijo9ddYfi66ptKmix4VYkVA9aDSSPVEW
         2hnj3wTjj5+F38KcK6YBsfgoZ+7Nc3zm54ldm1uyD1JwcfPPWl5gLTol54RydefB5Rgt
         Yv3I+KJEzvOJnca7UsSQL/HZi5/cDLXrgMvCGxE+Ir7SUuq6JKd3aU+vLW1xRn47GQfJ
         9lafopPTvIjgIIqzGIqhqiJXq3XNO2X7sDfswZxS4NlFxkw/OgPulRJK4QD6zn4FbB1h
         7duJnu5GVyzErY41wIv3eayurrLlooj8fTkDT/uleauU+CC0lD1IRErogiUste2ihopB
         WvAg==
X-Forwarded-Encrypted: i=1; AHgh+RqwCxDCTwuWOUc7JSiwTaZPxNxmhx929kntzFyR5ogRH0nMMu4q/siRj/vh7SEYH0MB0WipB+jSYAvI@vger.kernel.org
X-Gm-Message-State: AOJu0YxXm5kye2k4U/W48Pw0MqCEpVnk8S6aO27KVlhzqceMBRBDpG4n
	PRFiOoK+W7Cg4lwz7SXgNjeR3pMwuzwj5WCCdFoU+f3b9VeQ2chHs2Fgpn99lDv7L/RW7pZr2gV
	mYTH/thyShXBZ50hLgJ07YOK7u08RnxUtq1TSJ774erBOlM8qfNb0rbgImFIAiYv2
X-Gm-Gg: AfdE7ckQo4Ymm3a9OhqDfUozPEnKrkSHse3xbxgYKxAnaQfSBcOJkE7c6Ks0yFNz+vw
	LH8HOtcHNb5tkpD2gLIPIejL+waW6VkrTaOr0HyOyBTEOEWD1y+Bh4G2RMrnbBCdZ3XgNn8dscD
	fDoJleB4rXmzHSH4TafywMzR6bULqftz65tqTWOaTL2++m+bXtsT5sVUtW9cuhhzZwVQUd3GHaX
	9pl5UFEhyg76I2XaHDYqfixpwZzw9Nr+jIApFIf1OO27E+/kSn6R4oYmjXEGEUQqXH2cfVf5yTd
	XtFpqVYi08LGmQ+H8+L/Gi2vL60WE/WsDhhC76ABU96Er9ut6MYEKrtcdbS2YWAma1R276Bj8hR
	7OiF4orVDm29LdF0Vxojl0BLk9TE=
X-Received: by 2002:a05:6122:c81:b0:5bd:881c:f68e with SMTP id 71dfb90a1353d-5be9085dd0cmr978758e0c.9.1783361029430;
        Mon, 06 Jul 2026 11:03:49 -0700 (PDT)
X-Received: by 2002:a05:6122:c81:b0:5bd:881c:f68e with SMTP id 71dfb90a1353d-5be9085dd0cmr978737e0c.9.1783361028866;
        Mon, 06 Jul 2026 11:03:48 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e00b769asm1108555e9.14.2026.07.06.11.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:48 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ARM: dts: marvell: kirkwood: Correct indentation
Date: Mon,  6 Jul 2026 20:03:35 +0200
Message-ID: <20260706180333.648401-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3711; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ZKpgfZBQLfz9wvo5mMdQIlagv8p64x3j95+GYzrm8Dw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+32VdOiKKUjdq7GpUdx7unld1+YxOx7cHIuh
 CB+2OFKC4WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvt9gAKCRDBN2bmhouD
 16tID/wND8S7RCU/r7YQ/z5fBLm9rk1UF0bDk/pV9C9wsHN+R6pXKvWBip1y/02bPDN1MfA05uu
 kRGSnkQuraivWeuA+wuEVp5J8b7nlyg+NVNpg8l6aSWch+VA0jUKmOooIcllt+sIDoM3E6OmCze
 efppVTFjCt+4OIyqC/ePeDYlwU8Zba+YPOB3eUJGPz841Ie8DSg7tNNY//AQ1P6sks617Q7GHuf
 KW+q3VvuN/SGUjeHGe33wiC3efu7Uv4lCrYl21PCPfIL4vb0RokSSKJhB9lkAH1teL9iNp+mskh
 yOo+iVBtzvpxb/WrHXMeuvBrmvJ9IDtUfPr/nnGfvGg586RWP+3/Gp9+TfH1N0PbdX8NZomz4IG
 vXU6Uhif9qWwlQbpyxKrDwCOQOJvusyFVkCxka/nuEf3Gz62np0hYpSmRfGsMZwHIJOk9G+XHQs
 RzHb8DViz5AMF06qpTaiF4bYpBISBx9iDIrqZZi6jlO+FrpuanmNEBq+dBnY3mD9G/h3GzLbKqf
 T5QvzI1ImDXmi4chdLEdD2dLxWmpOrOvXWb93jmYjKxrn4bGlWGXLVzgBp4obUkb+P9GcEhOy0S
 tLyx3q+fvJIM8OzfA3yYJ2uWhhAlRnFs/FsJydha6cxKH/rDuGYZX2NP2rDcLHEroK0syJcocCD 3iRxRsofaYHTGiQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bee06 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=HDDCt-YyP8Bx8sG_SwoA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: mRp6TVxmnDacf5vp0K2vSw8BinOHCcg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX7LONg94VcmYW
 k/uXkdxE22tnfrHt9WQ9Ag4XSDbVlPjXsEjgoM2va/Q0CBClyTI5LAUWPWOrkayffSxOBWM+BZA
 NeV+XJAqoSEZ16bE05ZMxJranI+k7WYBtEUmfSSeWYfH0lHgVtVbYYvyJD2Ot23BDt2pTHpu29H
 iPcDUavdflVl+PnxTW/BYyPeYbpr0LT7szOuLSj7vTvSmCOiRtoHAm94+QHxEw5mcas4cfm4dQ5
 +ak4zXpbepcj5j0ooNFw/upQWo0t0bYOxwt+7+6FrObXqkShrzvzjwLADUWEJ6HAyr/ZCef2J/Z
 OKOPmkeM+OK/ydyg4TjZlMvZjy6eI9jD8yT8TVvelbWeXZGKy/IX+4OVa4xAjRWVImgj1ZjU5wG
 PFFPBu4/Uy8q7JV90mXWjkAMQfKS4kpS9HE6Zk4oAgq/4namx2Rsig8e5fkCAIJVMj9JfYoqdwP
 3fRjJ7swZkByQYg96TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX0dyxWrB+EJoP
 nVsaee5Owa1Im3alwrjYEMMTsEbJuwNtuG5EKUyge4P97Hhq2DYUb/vYrXCk4/9PoQV2lC0W7zt
 FNb3f9GG6Dy9zLxNuaCzlEW0LR4KwSk=
X-Proofpoint-GUID: mRp6TVxmnDacf5vp0K2vSw8BinOHCcg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060182

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).

Changes in v2:
1. One more fix in arch/arm/boot/dts/marvell/kirkwood-b3.dts
---
 arch/arm/boot/dts/marvell/kirkwood-b3.dts                     | 4 ++--
 .../arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi            | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi                 | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-b3.dts b/arch/arm/boot/dts/marvell/kirkwood-b3.dts
index 681343c1357a..9d5cc1689864 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-b3.dts
@@ -94,10 +94,10 @@ i2c@11000 {
 
 		serial@12000 {
 			/* Internal on test pins, 3.3v TTL
-		 	 * UART0_RX = Testpoint 65
+			 * UART0_RX = Testpoint 65
 			 * UART0_TX = Testpoint 66
 			 * See the Excito Wiki for more details.
-		 	 */
+			 */
 			status = "okay";
 		};
 
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


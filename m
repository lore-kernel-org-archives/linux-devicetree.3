Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BD414A0F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330459; cv=none; b=UKW54Wq/HxzHS0pZyFZgDQedXSzZtuzlGYjJWzIN4J2MRINh8aYk+ZkSchH+IinUmd3Uu2idVPX0Izeba7XuiYe28NYBuIqo1O6tNCUREbE4KvHhWIp1V649JTI07R0wRkc+h0LeQ8fMjZuProNUi6DP7F6mMMzS6yNGqTHSj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330459; c=relaxed/simple;
	bh=VGrNW9Fw2ML/soYGG9SAl1ppUBPsUqheNZ+RTBwlNBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNdJ0CrUNOaJF6PN8SCpsPb2FCywAMCbAT8N/ud/xpP6sLbeC/PTkmW41JBNTUjzVP4gLgfFeuv0uC4L11ZCyuNF4hj21zPgkXb++69J4XA2bIvky0eoblDsiG120iTXM6RSV+VjXkr5vCf4uI0qowlKag2URNkGROjaWziRE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9+uL1mu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdnC2X6J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9+uL1mu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdnC2X6J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694CUG057021
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=p3tzC48OMJanQKDzI5y1cUzDIjAiJqSFlg1
	9IB9p4DI=; b=N9+uL1mutwvIVj/uDGOUcNLgEVfbhjvJKNFpHFfRTZvw0X9P8Pq
	NqhVIgJqP7a8FHj2ksmAhUP5m/H4P0fSKhHV8hTLo/tFiE6zQqezIU8Ln6m9iotH
	9Mv1n3SJ6X2/Iz1rBvnbYgPe61tEiM4+74tcBDbH/e3Utxzspr9lzZopDuJ2HxC8
	DJk4dw4ih4gQqvNVw00oknqglqxJETIhf4/100xKiJ5bpRWfW72+L92RIOsmF9S6
	6oe26JdDDBixIaZqEb89fwX81N7znuQQ4G3Z1ZyuzspOUDCBTe69d5rzMyWB+yGY
	kQO2CDNgBtp8XwO20HdONjvlBZrYoi48ksg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gjwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:34:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso215582485a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330454; x=1783935254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3tzC48OMJanQKDzI5y1cUzDIjAiJqSFlg19IB9p4DI=;
        b=UdnC2X6JSwyLEKor9UF2FDdnj0s8CFSUU46JBoXRKGvLLkKCJyQjSajXax+W8DQ/hG
         KGdjbHMrg7xObR8B3XeucuHSJM85y2jWr/pLAqGPvqTgEhqSajlM8IjjU1MRhDn7Z9o2
         TSwQ5K9OIbc0P5EIs/4Z4jnog8mCFwpZJ0wljnra4GN3WGNHQqsEpu+XHpeXEjqn0PEQ
         C0QWV7dQoAW2KR+y1R/EYPEkgnKuomm7UhU38gurcIjpF9ElIulg9h6i0xtkb0YizgW5
         lcB96/iJvFLS32XES/l/OP8RVdREYNoYKL/bXbOf+N1t1hr58OueTY/GgYGYuOoG3J2r
         YGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330454; x=1783935254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3tzC48OMJanQKDzI5y1cUzDIjAiJqSFlg19IB9p4DI=;
        b=NfaBd+/UB912P17T7vbAP+Kzj40EmGfGCOgq3gQ4CckuZT1dqcXsc5vDjgynonQnuJ
         tsVjk3TTOf1J931xaWqwaeayRPX73TFBYX4Uk1ULGjD/DphdrQ2CefZFFWMOPjYq/nv4
         0cwBsXzp1EYxrHcCMjaH3EFxTAWyZLNsLe8R8Rl+J027vyKTbtE2aWmx80R17vf5RRlm
         bvH6rd+KcaZijTdPiEstP0XW0QFJ+rQFvQB232ZIz9n11Edzwy9PVMlbcek5Xo8itaXL
         IVStA+D8zQOre8j1EI39C57S5MDz5JwUcMhubvfQySG7iT1z54PHC7rZpDeQvp1rmkUu
         ILGg==
X-Forwarded-Encrypted: i=1; AHgh+RqoztW269mnHjs1E7/KbeTSIG05NLc2YePLrR2T8MA7OrdQAhlo5rRVKlIMJpR+/POavyIzLujcwC3t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt2x7zn61VKL06pYKPnsCv0ogCMyEyaEXmswqvOt2t6s5JsdbJ
	ZHQM0PLBYz7kTnMz8dbDvL0okDvuz6Lb5zgL9+g7jmnqxES3bHT+y3oEAo6oeHPeXe3hXjSCb56
	IalhNZWGvv3yV/m6UjmSAJdX+weffdG/bIB6XpwK1ioBaAY4cVRqBGXRRTU91GP5s
X-Gm-Gg: AfdE7cnY3qGQGMo9VYN36gjiHo0/y1uSY7LsXUYV8JdbRztsoBQD18vd6HlmCdeMGz9
	W+VcIOr8P05gUd09qboTJbQnFyR5lH1+TZE/ribGUvp3BzVIR32rWOj8rlDTpVlPDxh065Qr4n1
	gkFCtsQyTfvGufSFF87rnaE6Z5TsoF/Yj9tVLuBUNvya2ZnSu9rChFr6a3ArvSvlGKgIXBTIIeS
	SvOaiXJqYnUmvqYIWehAVDX4NHPCqCcSlKhmcNhVW5nwkgU2AjFVmeGLhiEpzpbPovw8azbfIOP
	+3V+x5YeJ0b54EiiXQvBbstfARhlSLXi8KPQLJbadDVcJ0vNqIRhhTxBJUivXyHrfm2dn0rgz6Q
	hn0tNRkVelN0PzOElOTlEzi5HAYA=
X-Received: by 2002:a05:620a:31a7:b0:920:6061:816d with SMTP id af79cd13be357-92e9a1914c1mr1202625185a.0.1783330452411;
        Mon, 06 Jul 2026 02:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:920:6061:816d with SMTP id af79cd13be357-92e9a1914c1mr1202622485a.0.1783330451992;
        Mon, 06 Jul 2026 02:34:11 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm413613285e9.8.2026.07.06.02.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: xilinx: zynqmp-sck: Correct indentation
Date: Mon,  6 Jul 2026 11:34:05 +0200
Message-ID: <20260706093404.273569-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VGrNW9Fw2ML/soYGG9SAl1ppUBPsUqheNZ+RTBwlNBA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3aMyvfbpfbhSBooS9iIlaWXWgQ9yyRJb66Ib
 qaC8ltlPbCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2jAAKCRDBN2bmhouD
 14jZEACADxyCw6t+grIXqe8pa1sFGzNqiF/3yncjGj0yd8XD1vqF8lD+zFM8DfyBpI+IUYcKSwc
 JL5Pi58xEzxoPnfqSki7C/rkCBocGa4IWMxxniBn9wPoSH90pCSybi0KK0ZPYtX9gJVFvmg2c8q
 CTuG+DGnCNRL6zm+JWNIFtSvLgtYCErQfEtqHQnMJKu5BQWeCx3C7Yp84B65GYuUe7RzWnsldUu
 XjKzK7euLYySUybw3EMlPh+m+ONArVx6SZW8JFd0X/m2lc1L2Qi9twJgPAc1zizLCzidp0YVlNf
 lj8Jex41WxDf3Tvc3UB4T4y+0KzYT9Z516LCpk6FCNoV3fSYAJb7xrPG/ezZuUhNZGBIrFEZaRO
 LeP2I+kjqb3/6axhFhoNwSMe+WBt+eE2hoMxMy5RbRt5S9fSN8O2ykuT4KwWJdPXIjQie3Ih0qC
 6pU312tPiMM9kYpyoIXm5s869OY5tla7nsJzo5lK+6L53tpRwaJ6pYtjpD4We6uT8KpuvXSjnML
 5XQjIYTxiqhKt35C0AVlz32GMgq+YK9DiROGlu4S4hh9r/MQ5JxIEMqeck+kxVJEFU2kUTJUOVA
 9fsvI85w3MbCdbt6YRQjsYhqJ0bP+0j9sFdPOd8b7lujjUH7ICAK8bX3bNzRiueg7Ko33viOfsv lvZdmFnnfzsLPLg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX0A0KEUWrFJii
 /SY9kAKhy5U3Vt9ubcrImNyQx7PaeWOLWE7egRqRkAptCmU4FOQxtGgEbO5y6g2FbHrenUa7ZE8
 aO2lvPBALReqIxR4SoATnLkGbR5VurbiV1zuJhXueiLYaABWHQaaa+TUPikDGv0DhZPn/gjORLo
 FySaWIZh2z8ck5bHHbbYr4diuEAQE9/c+4mWGQ28us9h50ASQq+QAUn0cVnzTfTukrA5pXHPkj/
 FvOqJ1pkYMeWz/wFTuCeeQns/zAPc+ws8SD/34Q4zcpn5SmqSgDogruKaDszQO72zwoKKEPam5V
 Ho/nf9erOrc15fo+dhQH9+Eq8gOpnWjzsosqCHFBm8/vP4GwlI88eLe4df/pUErEwv2JZMJktEk
 LNp7+kJI2WwCypB2WBmgkMPFzVR2VUJTxczciQwlA1fEWKODMy2WrYff2H7cwTzUufkZ2V3WUSQ
 yT68STQCtGm7GIm9q5g==
X-Proofpoint-ORIG-GUID: 0evJcF_uVo37H1TNP71K8-X6_YADQg-0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX9nNvJv82T9Tw
 b4HFaB/UGI52RUsaolLlvUHcQk4L/h4R0WzOuJ8roJoi174cG49Wh3C0V8EWutAvm55a2sdVIJm
 +hR6n5bj5aHaLuceK9UhQ7msako7aXA=
X-Proofpoint-GUID: 0evJcF_uVo37H1TNP71K8-X6_YADQg-0
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b7696 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 44834bf1c19c..52954761c9f3 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -218,23 +218,23 @@ &pinctrl0 {
 	status = "okay";
 
 	pinctrl_gpio0_default: gpio0-default {
-                conf {
-                        groups = "gpio0_38_grp";
-                        bias-pull-up;
-                        power-source = <IO_STANDARD_LVCMOS18>;
-                };
+		conf {
+			groups = "gpio0_38_grp";
+			bias-pull-up;
+			power-source = <IO_STANDARD_LVCMOS18>;
+		};
 
-                mux {
-                        groups = "gpio0_38_grp";
-                        function = "gpio0";
-                };
+		mux {
+			groups = "gpio0_38_grp";
+			function = "gpio0";
+		};
 
-                conf-tx {
-                        pins = "MIO38";
-                        bias-disable;
-                        output-enable;
-                };
-        };
+		conf-tx {
+			pins = "MIO38";
+			bias-disable;
+			output-enable;
+		};
+	};
 
 	pinctrl_uart1_default: uart1-default {
 		conf {
@@ -392,9 +392,9 @@ mux {
 };
 
 &gpio {
-        status = "okay";
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_gpio0_default>;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio0_default>;
 };
 
 &uart1 {
-- 
2.53.0


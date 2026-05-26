Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E60D3DF010
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792937; cv=none; b=DoQmizefxiMXs8/87j3Q2G2y+La1iNgpU3QQN7MMfRoPVydrxh1ehKlehjmDa06gL9bXWPCKI5c3nZapbUfy/55fsmXAvuWsQWRFiqD4x3Mv143adiKOknhsHgJ6c/7qnfCsIgS+mubPxahlevgdSgb914FnJQdUC+2yqx3zTEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792937; c=relaxed/simple;
	bh=ncSgpINQfSR2H8FOkzLU5xcKeqgvoMaxPZDS0ayLT68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MniAkh0jPUTWlfZYKwESUO6QIrx0OZrzXPbhGSlqyeRwY/I8xNIjMHGCLeOot7q+z7HtGZ51F4U5C2FFELv2Fvs0QJU9FtYQZF7UR/3Lqg2pxXnTmUUiUfnYZE3eotK066R3ttVxNg9DiAC3o1lIXIo+BJUwwudd3BOQChGYIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL8oMREo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbTT8Aq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL8oMREo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbTT8Aq7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8VQTc3603922
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4+c6C0We7WiClnVljsopbVmn8vy7siK39IMH7Gy/MA=; b=mL8oMREoyvmmZW1Y
	YihlzssSVoCLJoF566z94HdRVPH9a14hgG2vjwhrBi3c+WQltzOV6tvaiy2CEO0X
	j5b2u2i/gavoNLmE8i28ooBtO+DaeJ0fuTe+pxh6s+w1tsbx5izgbTv+vK6sl0qy
	LRqg8WrX3CsYM5xcrEpXWtAgbcXePAxo4nG6mFSx4nH7OqZf2IJhTF7tqNdeMJpM
	NHUjMTSnyqnNq6mFHtXjexaqP+j8w3yGaKD3SVd4jBwML98DzmKYafyOLUH+j7Tn
	jgdtmmMPP8M2KtyZGmmxPBQC8IkS2aRdAzL08xHaXgkiZClcgs/9P3sP2QwXaSL+
	KxRAYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqknky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc6899bfb1so109570515ad.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792935; x=1780397735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4+c6C0We7WiClnVljsopbVmn8vy7siK39IMH7Gy/MA=;
        b=ZbTT8Aq7mpZySPzVTqmrJISDRH1Bkafkm3qVrjLRnXDj8T6pkdyphL8PB60YfrEBpu
         uPCqp0lZwgJl0Klnco1MVyGr/jGNFFm5I76Aw1n0VwgGUKGQHHk19OzcVEROVLs5Vfbl
         YJztbXOaBSQKAhgm+HX3JAXJ8qAQ+4yyK41JGjgVMz+JlF7zy8Uuk/68CRmNpx+i5TN/
         R6QbcltnBMU4NnHCfEHrsc7uvgoBYu8GoEgpRFn2N4cPjSyoc5jbxZqSXYR/hq8Vc3BA
         z7pH1rhO8AnFf649Ps64gXBZg9/gk9LKtZAmggnObIYiztOF2BHprkT6sjrKUE0Z1fYZ
         gjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792935; x=1780397735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W4+c6C0We7WiClnVljsopbVmn8vy7siK39IMH7Gy/MA=;
        b=rUrSnkS4VUD28ViVJm7n6OcN2Ao0pASmrKd/lTfagoXy8EhrMMRCL2Y+0DkNtmzO9O
         FX2DVXF067DaNp5qgIDp/xe7NMiClaS2jGcjcWxho+S2wZp3LCCbVIIJyiVnFr/QI0ps
         sRCFdvj7WkvbWdXY6uZ/U4oBIbZY6hlmggTyL/5PtwS19QfeoIC/cFfjjlMkduSyPW4Q
         HqTC3gEkj+7RDtADCgXCxL8xQyREqlWEhlwN9aDojajBZPJNQMnB2gtagQAlu2xrBDGz
         wDmAppWdujy4Oxgwljm3VoEN3Jzrn2oNdsdB7PNwDaKIqa6L0/oC8un+yGQKeX+VIZd4
         GbnQ==
X-Forwarded-Encrypted: i=1; AFNElJ84KvXmWYyQa8X5ZDz8rl85uPFq6gf6HNWTqPbtUazrJmvG570p/MQ7X5i4zFe3tATfYvzto7FETwTy@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7PgQ3Z5vxl/PDI/TTYygFF4kY4XDoNstSGjX4bECCgdLmQQR
	FAgJCEBQ6WQrcMQV62AUsTQ9AxIdmDH/nW3PqZ6Ojykcput+1CCk3HZj8nelaCDWuwObLcGRDrw
	UnYHRL72ZHyA0hCFg4i+uHzk6+ksnV8R5m0L7FKfUM8VH3FqNCMIFd9lVrcHCYle31Mnpu8uM
X-Gm-Gg: Acq92OE7KmCZC6UTq8PRz5/qEv6tjsD7ekulH9/3/d9F62IC49vbvqTBlpQfyqjBYRE
	o/A/37GFNMnf8fP+OSEFvZ33ocGnXB8oBGFcwMZttN4tJqjkvNBHoFqy7L9reU73UBTsteZen2w
	4o/HYjv6pJKfDK26e4XD4CCIhawRRkXICHQmkyhKvlzRNL2XfhvsJPFuOeAkYpUcwwllF8mxPPe
	8Dpatm8veCodnxtd9TzJoq/CcGsMQeXx83PDWB2cUXFZwZmYQ1qrAZlgb5RHrBoblTKgcUpv9tk
	jEHEUdAFeAlf1l36mB6eIP/6gzAoX+eC6BRN8eSoqbOcR3h2Ixju2VXu1mH2XiPg3eQXEw+yr8k
	0jMHgZY6wgBSGmoYn2iXvNwHOYrC/suJkfoq+a/RCc/fCDnXP7w==
X-Received: by 2002:a17:903:15c3:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2beb035757amr226478845ad.13.1779792935247;
        Tue, 26 May 2026 03:55:35 -0700 (PDT)
X-Received: by 2002:a17:903:15c3:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2beb035757amr226478455ad.13.1779792934761;
        Tue, 26 May 2026 03:55:34 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:34 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:44 +0530
Subject: [PATCH v2 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-8-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=1102;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ncSgpINQfSR2H8FOkzLU5xcKeqgvoMaxPZDS0ayLT68=;
 b=qvVuCgKBGg7BU+5jSWLORcD0ZIAWBsGoQwTu9pb9si1pvIXRCq5xViTBulIfWelod82FCOxHU
 z+JVxC13lkfCcfcCf+dNFS0UnyjCH17beal+ucoCuwarto3J3iGBfFS
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a157c27 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=x31kQvTfQKClviX5dXsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XCBRn526lvZEH9fVgUg_7xkIlMPI1dJ9
X-Proofpoint-ORIG-GUID: XCBRn526lvZEH9fVgUg_7xkIlMPI1dJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX7g7UKqQY8sDE
 CLKY9MdG5eVLPQ4etXAisPY3qbl8OSKChFMfxuQWX+LRreNFo3M2ssn6g8oA71cmAR6deJC/wb4
 SdFZm03BJ/je8Y4Pvdacv4PcjnsM6eBZ0+bg1MnbaLNIfMNBDlosJkJgg2gC/7GHlyAMMvbNohO
 RCIj2N6sHMUn4oFTjyzZgSDbdos4jNIfmmO0WTq/q8kcRw9zrPwLiqs4CrABAPDhGQUrGY8SDPr
 p8KCwSsTpBM6oLUaZNU8wX5w7+GS2cUcQqJktiGzHAjlh+KUm+4fP4kwI9UR6DdcqiB3NXQW5dl
 8wJVTgJKZ0zxqyN7mtyF6duxRolosiIsa8UfNY7Bfz7DkZxekcVAa6z1vFPm0N8Ss2NQjkaVD01
 hje7jWOsQe1R9JMeqmFbM5CvKxyJt6aeDv2MEX1aBDwRMqnTtR9csHO5zOyOhP9shRmi0vZ69+h
 nuR6loNfBDPWEtGMbcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095

Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
in deepest idle state.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index b5516655db8c..5a1b041ea768 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
 				exit-latency-us = <4000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -460,7 +468,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

-- 
2.43.0


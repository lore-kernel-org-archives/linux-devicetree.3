Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595949;
	b=fZX6yYVRxEAgM4o8LImRbmeSNYnnuI6cp1aQmG7F49YVisH2jMzIsH9ezubwCoDudWhL
	 ROfBAOoaZmVt0Ez4eTEh+TwzeRYclKHLMGVXAglz+WvkqFQawK5yOsBO4/dHE+oDDpAg0
	 B7lHeSmwi/ajEuLzcMg3ENA24jt4PkMi8YDjyToIq1YrW5iVOOUwSKEJrkau46vtupxy8
	 rGvi4FW8Fjuujf4VP8Ugf/ceFhblwQSjBoUgcyhx76ycMzy3Xv13ZFKwO9wE+lmdUi1yc
	 99ZCfC21jDePKIUclRgdniWn7HE1jGjWmLToe+9VmcW/sPUsnKlDfPZHvUP18dWn00Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
	b=iVDyg8TrQdp2wgPERfgPfc11Dwfn6o9alW1sUhKNc+657wRoiwB6ju3YmmPHo5acMoXH
	 SdX1wpTu4++QFcbyO1XZcVURZZJLA2c2cdXwf2r13FiLv33hUbFrnRTmZQU4LjYJBxdFh
	 TNkxKrxLncd05t0Tuh2recD2DCQWPmqVwnEe8QcjBxiqk9qI26rYdnR0z302Je7G/D1gr
	 g06i+bHSKQK7JDCUlVWnFjeYbvfQHGNwjQxb/+rcWunVMaiAkPQpOdDYb4WWv1Y5GlGRX
	 wIJyUTWwP9n5LKWF4LW6nLfw3nWfoyKwE1hINdrqVQhj3bJADwnPFN1yl2hEyczbnHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kH3lOc2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=coDdIAgL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD50606A33D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD50606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH3lOc2/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=coDdIAgL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFjMRp782250
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkPg5/GgZz/
	9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=; b=kH3lOc2/yjDZLOgjOBq1LJrx/uc
	BfQYSDeU2aQnW4rMH1CNs0uAvLb2uAHJxTgwHFXviP3xSLTuHedKmRex5+sJEUwk
	KWWRbBnsPOD8lHRrty8uXSYX4ByM8ho6zL4byOafDMPqAm4hzToTVFRFTdb30By9
	8ovLMRlCqkoFWMhFTOAG7zx6RmIUa2I5sSIcWEyZ62F3Exa13GrqLYp0WQXdI7sg
	BYRr0+ofVPhKE1vK+gzFVKO9bQFWloVxuqtNjRBaziwcatt5AcVkdPuBBuTO4Wpg
	hNWwHZuJ4fxTXZmVgZcZkKXiZBDZgkk7IUVRsBfrNkomupeQnU4bcVjvrbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jv7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:52:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495876f8beso109085985a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595948; x=1795200748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=coDdIAgLC8NY2dQv0O0DJDHEF9WJQc9eJSVaDcSkQv0RkSE1elve0uMumnajoE4QKY
         sWUVRGpNJCharE5ExNKc0i9LoHpeTvOTAqJ8ZKOEg3RfxDPr22BFv2dOZff2Es/t5Flx
         qmp8kBEqrrXY5n7n8/UfWMVa+c8clI37HPM9apeyYrQdttUhnUTL0l1YAc5z23VuGFna
         NTfGGgYOZLD0jQXupm3amT5XgMCjKoDo2zOCAK2ua/BiBkYUZeRGq6O+svFtyAdq7cO1
         nOdOeySbmmZ+w1uOHrhcysIw7A7EFp4kvliWtRN6NygQRd0n18zvfDPQgsU0yoKucSze
         9bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595948; x=1795200748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=sZ2Zq1Dmww+J/kkrnopmJQ5MN+e0wes2POs+qR/6RtTMF5LQxAyxlqk0ntFxuhLkyP
         kSVFPi6uEru//hCvD9E9e3Q9Vwv8kdDBvU6ziOK7N8ycrYIGUQmnvI7G49Gkpw188Yhx
         jYLHFlh+rmG4P4RTIyJ9dn30Ckusg4DblPcd6Lt61lRKwuDOIKj0Z9NBoTYmIGTWTa/W
         kgDj7yxTeyAuxJsEXZEdbSQZF+aqQ3kdMY4ED1DjKSyQiQpmUw5b1FLcGIN9bQChVbmj
         eAfXNXRj7OEXOR+GakzQlOw9LugyQxgRMWEGXDkc1pE4o+l9/i92IPmZlpdYCil6WPSa
         iDVA==
X-Forwarded-Encrypted: i=1; AL+hErEahXbe12LafEWnKkfGCFV3KISkOvoG3i+TN0bvYUFuVHwhdMxCyVBhUqeLl5tjTr/T1pC/SI4ilgaV@vger.kernel.org
X-Gm-Message-State: APuU4Z+L7lv2UfWWq0AJK0HrZKVnu4GCanMU4qd2dXJxrXYacBkLnS9B
	/KIHapEDkdeCNFGQTiV38GknKZsYRtGwwFIDcCEjvvHITu6nIw5OL9CNQue6KFt9orVv+RZnrFa
	P5S7hQsHZbsCiImuAIR/ZBw7TZtuaXexzXLXfY5sagUUlh608D3Obcr55OQjXgquO
X-Gm-Gg: AYBFou0tvQl5eRWGBb8zw/TDJirPhrFKjw/pByr2KANI7khPh80JJufu8hN4mctLV7d
	SxbzBZMZG4Fg6g3RCxrIa93V9EYE1QrT2hj6t5cBh2DS8jppzpRX93XdY3Juxb6PQhnwSGOlfyg
	du7mE1l7P3Eg7TSMfpdq49sefNLK/5U/NfORQO/82Oi4gVxfGzlzL9U9SszTykOyCY5ZuAm5D04
	vDYtEvc9RIBAC2c8Yzteb68a87nI1DTj8KZQkU4w9nzVLloobyujWw/8nBvHTU8s8iynvCRzOwu
	ZRS+ebFXwLR2OwX/GeTh1yqspfokjmy5R1K8U3+9ZO0YfgUMVM5oXh4laPOlOD0Gite10p0zmHL
	yhakZIBCxW18f2ea2pRsyM34qfOx7WUdFPVSR0ILVCr9MKEoPidFi2cmp+12Tbg==
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549346585a.17.1794595947694;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549343185a.17.1794595947195;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:26 -0800 (PST)
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
Subject: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Date: Fri, 13 Nov 2026 19:52:16 +0100
Message-ID: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=704; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ydlWfHv8KMdXhcil2lvko+LTGW6saAZRv+JES4jy7+c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xf5vzRttUphxuP6s8niqvoRGePP05uJmg+y
 NWC57ZpAcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXwAKCRDBN2bmhouD
 1wFuD/9Xs/3OZFXRUKqYiOXZBAwBmVbvbBExEfwlLHe6jS6qAFeHhQhGL93Ylpvv0Td7tCZDuUX
 WDn78xTjPkwg9CrrdNAjva2vQbdhcof5jz/fKvdgVSfBVsTHp10jzmaM6LdWVJJIOOliC/Z+PYN
 YGxIYLaDhMTfHVGqnrFFeCcexaPbUdcgyc9Mkwwpg2aCzzZQmXnyD2S3dLS7tuzcg3XzzQB7HFP
 RSDduEsrSiEydijcnyi4DYc6bM2e1wnkHgATFGNu5bdwsbiceQifIa+3I9Ouoy7V1tNL4/zd3s3
 DM+H5aTQlvR2Ak68bKMHkGIStfFwm6EHTvMvUzHkP3+x/V/SYlptDg11lii/WF+D8Kji7Svt0B+
 JZEB2ki616RlV0IsXSM+Ot3bDpXr1tWObZC6RVSn+YmUx+VYAkzI+p2NhDr/JtwhUq3gWfJlmHz
 273J6ggcHKGw1epcLbx/agjKjxjb6DWAnNqxkps4A4r91f8nd3y8KKKbUNrN0/nB/gOUj3OvNS6
 94r7g0EOWYWYE39vbF8mMkRkzKYFAnLhz1/wDT2ja7rilDldE8bzRt14CcWBjwXSFBf+2JtdnS6
 iJmiRJOrRF27jLm2zwfqc5pCnLb6Ss9KTp9ncmYQrbEEVn87GS/1mUuHUqHPQYFb2YeOiGoSWlF riL0FHR4e2KJsQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+42o2ri4PPcO
 t2fBLGTyHKK28R6Hem62J5+k+dUTlFNSz6oDXFHKmI0xELXOK+01JbxphQgmqMxS7R3+xu7c5Ge
 c+kIwsOh5hWK6KfEWhWe1B4cWqjhNqU=
X-Proofpoint-ORIG-GUID: e96oXxE35bQpJT-wQMNbox0dET44CY4F
X-Proofpoint-GUID: e96oXxE35bQpJT-wQMNbox0dET44CY4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX3fB6GjdZjUYQ
 T6v2Qw+MmrmI6VAwPpgGGOin7bExIPwpq7d3pw9rETE2iFQaBRk/LhKWguNgAQgQmd50d9s1EmQ
 Cqirz26T4ptFBs5B4LpQVolP3CndMygGuBGTTY5hRcpQ94b5jNJAeTBrnQ3mm77xq+AETQUcvX2
 jo8T7XyiT1t6BZyYxTqSDM/h9xCXvtbVu+YNYBghQEe9CSm+G4X5niiyTtpAb7vgezq1yp672FU
 M5Oabt7ad3YMCf5AiZC9V3OSXlNI9YHunlpKIpfIpXxxfJmwKs554LLGWOfW+KCYjHWwm13XRVt
 1wEtTe4ViikkX+U4PJsht5W9+Ygt/ofMoeJvupHif9fKRtuKZbGolLchwRE3ypdqtsBKO/eOY9S
 7S265+HXCXWIJIlzLKzBXRJQVSDffMLWsLr4hNqG6iTGRG1efe8huy2qvhaAh/WhkFH14vUv6m+
 rnqow7kKcV+NoNdSyLA==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75c6c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=85fTqwSHmoAmm6HRS_YA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..5d5f7f8a393d 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
 				resets = <&syscon_apmu RESET_DMA>;
 				interrupts = <72>;
 				dma-channels = <16>;
-				#dma-cells= <1>;
+				#dma-cells = <1>;
 				status = "disabled";
 			};
 
-- 
2.53.0


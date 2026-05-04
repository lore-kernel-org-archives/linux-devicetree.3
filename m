Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520C83E3D9A
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912285; cv=none; b=tB5Wdat2rKftqBrhq31FGDwe4wujnqyJAFUA13+CMwfG17A+ojMyyueVvxPislbAI7LzGix8sYDlZUOMpCDwg4MfLcETgLBQU5rcuH3n5ujYpLoe7cVLEdis1j9TCP4Fah+cyY6swYWiQRgjOD11o6Hs+vl8UHyUIDezJlxWuvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912285; c=relaxed/simple;
	bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpSiTt4WINUPRWA6luNuAchmjzgxMUcRY5B1k/hvc50LnwpgZYOPj8ObuCooHJpCKx2AXciE4iR66IB0NMogdI2Ikj+9cpnz6AYPC47FGHuSqbILaEcxKDyhP5zE4U938bxwSo67n9D1y7ibMrvp6qRgdhn4xw0g3XITUouMJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVupDfyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS9wALHA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVupDfyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS9wALHA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B48Pt1151496
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 16:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=; b=PVupDfyrylZTr5qE
	RrrPZX+R0I544HHNpiqWvsdItdXW+ziG50pfqQE71NLhI+34uEeMgDvU3wkhjm5Z
	3dxnUPen+VZpRu7G7IcDiWREevScITD3VkhCqXnjBaxpACwJUG0yBmN1ACEkhaKq
	BJju97trksGQEP2ZMR4U1vmUTy9qUm50KRbNKIKe1/gcpWV4JcUxEwNsD+uhhnsg
	eyK4dyQ+nDfrqXyUQQqoL20uslMfru6Ol2soS0EYA/6yOoQ6AhoAWji+gPZEAozR
	gj6AA0Bs8FighAz2R/RDFMkrzKuaN2Xun7CZDTWHHwtWi0mysPCDnHeQo/DAdB1/
	Cq1QZg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy98v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 16:31:23 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-467e00b684eso5592530b6e.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777912283; x=1778517083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=LS9wALHALrjYRyTY7xGtwDcNkkralRdvGyTvE9BD6mJ1UyK9mYdRn3VviRmcn+V3bL
         jbRqiGQ6Syawt+mIklk4j7ZW6j57s8YpBlCchuO2gC1JeEh90YeB4rcA6+9xeMsGZVVj
         2PQ/i0oXZGfkV5WoND9DhM0ODHJWHwXWe7ciNjDQIr7mqDuqluO62l9k/aBc6QFAvev3
         aY9BT99fmi87DSOWqhmPAREYWeKy8aSZzkBhXg38tCb5hDkBJ76Uu6SvifhIUxEga+cq
         MV8/Ogri+nfHh6z46iqgLqLebXijE/fxj2euSVXWfzz9ELy7R7aY9Y7v7O/Dptp9OFUV
         ewIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912283; x=1778517083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=itJANzLmdDzMJgW006JqrQKd0u4OkmNtKRpgCs39gRd6E0QkDE4uBq8WuAtWFfmw//
         RrLOvnfy08lGIG+m2czkH3yaTiHN/Ec9IExyhjD8pXlAiQvXBQGvBv0xTe/BfB40fM6j
         e3Z1dbeUmWWajlP9naHpVFjwTE39AEK0ktoqQEJlBboIsP7rIfKJm2bDr7ItktV6RI5F
         92Vj1+u8/eN4ll/e65Cy1oMvoGOl4Hmyu+hzAbyDaq+8RYoPntbsFW8L58xImgrHvmmI
         SGGhH3e+sI8PKhQC/K7hk/pWIG7hSbjbajskkqipgy//SgU9hjA5/fWqGtWREp7TFS7R
         SeQw==
X-Forwarded-Encrypted: i=1; AFNElJ/hmr+5GamWRLqHD96ykSvt8iJYxe+MXG8+GNrRQDa3HJiKU40l2RhrDC07r25L6Z5WMgvQqJQLRzyH@vger.kernel.org
X-Gm-Message-State: AOJu0YwTzXt4HD09BQYgngz9fRLJ1I87P/QqPF+JXDHveb80+c9UPIHS
	e94vO1dbRUWr/XBZSkWwKoFJNT2bGvQktL7imDrSjsG/ktqdxG4C7xti4DMZzV7TRN2wfbBILHp
	OJ8HKySbw/9pIy2o6eLb+hCjvTAe/VnACb6tjwgt312O5DbAamIrNArnu+5yeFlfy
X-Gm-Gg: AeBDievUBNn2BCJKjMYMPeY3uWG7XzjiG4FdaOtsa9JKplF7w+52PCmTZUNnjo549g/
	v2y5kANob8O8qAVaJ62HFPfUFkxgg2aZdgzq592Jb8wkosBKJYIsebS/EqAuSv0E2R2rKM8POz8
	2NxsahXDKEBuyf/DpINh/utSbilrJbgfKb8o1OGYghztYGD0Jy0xkPLIZLLPYqgBkHBf8DRbfkd
	GMewqKgz8NRS/lcMxyj9bXB8/xC7Ndllbp4pPxpy7giPSP/x+1x7ZYu5OTLDWhCgTeGucDOtqhy
	VGbQD3A+BgwHJEaMjcw8YsjUbvxEB1ZlKV9C3UBQ3sOpT+U0VJqbzNWRk5MHLlgW7gbPkMDUTI3
	/fyEgaKwzcmSNhsfh0Ag8oECJusVyv2o6kcK7q70o
X-Received: by 2002:a05:6808:80a7:b0:47b:ccf2:91f1 with SMTP id 5614622812f47-47c88e80d3emr5374476b6e.8.1777912282601;
        Mon, 04 May 2026 09:31:22 -0700 (PDT)
X-Received: by 2002:a05:6808:80a7:b0:47b:ccf2:91f1 with SMTP id 5614622812f47-47c88e80d3emr5374422b6e.8.1777912281771;
        Mon, 04 May 2026 09:31:21 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm294986075e9.7.2026.05.04.09.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:31:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 19:31:06 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-adsp-usb-v2-2-18e0b0b0407f@oss.qualcomm.com>
References: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGn4ydGiKEFTDw1x+kKynHZMnZhJ1FVOteuJQgouvYNwFwJ9/
 okCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJp+MnRAAoJEBtfRMkAlRVWX14QAJ8G
 +bX0Onm6fCm9m9l6jNE+TYa4Fh58NkfJC3AYSyiFMFh7bHn7H1y6wiFPtwk2auzKldEGDXVuaP3
 jaz/QNG1yptjMD3It89eAc2zzDNZcY6ymzNrbrGyBIh/rfnDPxm8sq2JvU9WTuw8Tvo64+lVP58
 Mb0OsuUK6SnVtFI82bVDKTbRJyRZ8X6AkZ1RTfpb18K69/EDZvkfEM05rXQwWsvnaJQDeYOZFPu
 TfkFrks8kMgnCCc1vfFEeo2HJiBzuP4FD9M9WbDw4secHc74JsNHYbEOBnOc0jMV0/NvzD+a670
 yIaLm3WB0h3GxyzDLQCt0b2+eE/Df0TSZv+EbdqXTtcJ5o9v8yJWat+eHVJ4o2UZvDj+X7u/fg5
 DJQ4akughDF73BCYdtPCaBVO5xne5nGtqzDyfF8/TUieumMGaGbBA0f42W97bP4UmcypLm3CF3X
 7JIDqmL2QqZbXeBFv1NjzSi54Vfy4oXiLRqTaeC/jUK63o75L6i9nv395qmQtgXoFZv0LhcDefY
 UxhwIf43F+qanhKI9CXS0y7Ppl7Yk5vvDxWL9L0EpQZL12BTorIXVwRKHinh+2qrNAqIgeij6Wr
 hxKi37x5i8QFUh1zu8uylpHcDDZzQXit6rRCC1BwlrXPcdg8pYZEt1PnvBeYW5+X9tP2g/QQUjb
 O0G7r
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX+Wssbamc33/4
 PKh9XyOhMa0G52uqyRsr95K4JAso48Dr5k2QLe3caMWuaMjQQGFPxBqb7riqlXSvS3D3iXWPh3x
 kqJHc2omywvl6AnU4FJVwtdbbhUIEZIN0D8rlNs/lb7Zt02IzZRq6vwA9MzOvqLg/kMtHU3iXqW
 vStXMYDc8O0bgF1bi1ftl/0ItE7ByIrfjYcpicnZ7j8SzSYmJhZzvsTTeUhRhgmEooZax9VcxjE
 k/4osYtPwaepOEgGA8lfdB5N/xSPC2f9wsQ4djo3/4MDRE7iVVyvppBz00Zw5m6vpv4AlHwcKh+
 0LKtxF5yUl1BY9YqxCUs6EUH8g42xShUUZy4ksv6pneQ7STYDjm19wZB5SFIChtwHGjeoSX14EJ
 08o668exUzOHl9JAe9HIZcQ9J7asSuk6HAetuXIdlLdmLveIouZAqBcAc5BFO+mVoJwBk/UNwwT
 RnqYGjrsQ4v6MCfQxTg==
X-Proofpoint-ORIG-GUID: Os0Fl-K-TrMahZxhEqIy-hghzgsgQJhw
X-Proofpoint-GUID: Os0Fl-K-TrMahZxhEqIy-hghzgsgQJhw
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8c9db cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4U6AihNozsKCruDMU2kA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151

On Eliza, the SPMI arbiter supports multiple bus masters, requiring
explicit selection of the master for each PMIC.

The existing PM7750BA dtsi does not provide a way to describe this,
so introduce an Eliza-specific variant with the appropriate bus
configuration.

This duplication is required due to hardware differences in how the
SPMI bus is exposed on this platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
new file mode 100644
index 000000000000..2c386f16eca4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550ba-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550ba_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm7550ba: pmic@7 {
+		compatible = "qcom,pm7550ba", "qcom,spmi-pmic";
+		reg = <7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550ba_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550ba_gpios: gpio@8800 {
+			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550ba_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550ba_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm7550ba-eusb2-repeater", "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.54.0


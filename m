Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06F3E5A26
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663917; cv=none; b=saqrSCElWtE4ab7pq4ag4oxtZDVK3vkmlg+JgWisjQjGRXZ6s9UXHczCOC0qX3rSMcDGk51oc8j7IFExqF7INCEqclSEwuoCKX8ug0HzwpA+uMiLK6qNBY6WR2oQYO53n28xjFah4C9T8U6iYzASRfeUK5HdKCWMM+jg7xGfCBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663917; c=relaxed/simple;
	bh=/Cbd6i4gasN+N/5gnUli1oHBdHG5gwmEwE/0Faw7QbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rijn+0l5IiE1PqmY3JZd42gkqAZo4zEmdPzg/WiXBqrevDnN8IeJrn5Zt1OJJnn8zWxVrC+cQC6+ZSef6hCoNaTdVX6X2KXoE4s5fbHKNZXCgXCg6SZo3oFU/RyPiejt3H/HhqolITWc6Zpw+Fwfhtaky+uMjdciY8ocRoXHfQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWnHIyJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VitzFsta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWnHIyJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VitzFsta"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9k52331405
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=; b=FWnHIyJ0n0q6EkdI
	aIZio5Z3fDn2dQAHYqhUdmpr0O+LI2JzbWpUA403eL7Tb3bArnsoOwWIndn1NTLA
	rh2LSNCX+fVcqtMvw3jGWg2v4YUx6lMlbpsYXlqmVgAQ4LG/HpD6/YuBEwJQWVgY
	tgZyJQes87OeZHjdeysMUfzinot52jnKG1SC7enElahoHG3RuTBFwsjCPFACZce+
	kcLWexAaIS7Jrv0qwM9VNtlXKDKAx2tK78yPJvEG6m9vq3hdbrgKlXWLj76PiDik
	IWtPmtxz3I51vF3GDIe+VhdmGrn30GOydWRNQVjNBrfqtu5muIXFRyAYj7KuEP6R
	xCCAXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypcd8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so156814651cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778663914; x=1779268714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=;
        b=VitzFstattdaXaOIsttcgbYlxDouy2hZ7+tk15KY8caqluI3RR19f1bcUPAIvkEMaD
         i0e6KpfF9nDxhDOnMb/ZM4OkH2DWTukM6WOgjGidJ+4j9VeOtDnXDGRy3MoLwUjqG36X
         J23Aiss6kUUEitqaGTlCrlv9xkN1BMQAt5vQz7Rgg7klmwOy1OgGDRlGpqe9gL7/E20q
         Btk6pzTTAxfmTZ19cVfoayZG8aghUysXDxp6QAVUkXg4ezAN0JGhEbEYvotPpVikd5fK
         0b6m1xwrLPu9T+0Xr4zNYE7pdV+YMhVYfacH+bwP+tpxdUF+0SoSk5GB+cg/EdxEhtYN
         JgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663914; x=1779268714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=;
        b=rZTj7ULstx1VJrNRN3hm4u7UcqoMJuezXcYTaokq55ePSmhIXxI1tkTq6AecuhssSK
         Jm4L+sCZTlpAOyYb7VeATeZsBNx4xAtSvooBbEIO0rqlwlNpfVaetr9fQCrbmYiH+iBM
         BkUAmlPVgsq1SUAXB5jy2Iz3zLLCBFCWUZiln1idjxH4+KzwY9oAMDInJqiG4WRuDjxd
         3qXzWS7oJXOniivyKOXASx2tZ7mCFR2fLEGta6bOlveAv3Aze/avXC1THEDtmwA5gzcT
         ixnP7qaVxWwbd6n9oB+e6y4h8/BYC+jEd8QlWR5EacvHQaEaTnmutCJ39IBrg7PA5UZ0
         +0vw==
X-Forwarded-Encrypted: i=1; AFNElJ+y6aqVLf8IvEXVxazmftXZpwoTxbrIC+s4JBQRFp1pA6/QiSDPsPRdTakz5xhDASfHthkAnYss/dyU@vger.kernel.org
X-Gm-Message-State: AOJu0YyX01I6Lg4yBJ2rzzCrwMV+x9a/plrkJdc9RuHfuM2J3eK7NCL/
	ZQfH/29iMMqgkd8NJTSDD8qyFKRtFasP0jj+apS/CdWAybw8JEInHoD+vYpRg+n0+d+DheFBlxX
	gzn77hswD3g/PIv+n6hArrK216qjUAUj8Em63GsM5kqvMz5a3rgTlQWDxFmhQdTcR
X-Gm-Gg: Acq92OGb3Jqzx+mbkdCb1qb/5V8K6MKLCs6i0gDFxjrWaVuVzHl4Zi72KFP4e4IArXv
	2rdCAjVyDdmfJ6sPWlOJlE5SZa+37TjotbchwDsnObLxdgTVF8iaVg3944OjPpBJhYMKRZHw3pq
	onCVzkSbrLj1dBqZcbxYpSSTJeHcIRfJfunkAhThuAD0IPx2QS6qLF8mWyXm+a1rjIm2BG1bLbS
	vb/EoDOq0JkzjLgsxFyDcbR8LJsxqNZdqETFYNLFulqeASt4tJJp7iKRqWvI8/O1RyCr23jas/3
	/4rHElMvPDoGstMGCFaE30AjjHcCjw9gIVL55s7EBjCyU7RPFEDZoIrfq4GCwH2qxZP1AeyArzJ
	mpmjW6YT+CCYmEWukVq/gO+cXc7DPNQ==
X-Received: by 2002:a05:622a:4d96:b0:50e:614e:4433 with SMTP id d75a77b69052e-5162f5a0f70mr29644031cf.30.1778663913605;
        Wed, 13 May 2026 02:18:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4d96:b0:50e:614e:4433 with SMTP id d75a77b69052e-5162f5a0f70mr29643861cf.30.1778663913045;
        Wed, 13 May 2026 02:18:33 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm37827620f8f.16.2026.05.13.02.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:18:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 12:18:20 +0300
Subject: [PATCH v4 2/3] arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-adsp-usb-v4-2-839936e89aca@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/Cbd6i4gasN+N/5gnUli1oHBdHG5gwmEwE/0Faw7QbE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBEHhgab+GDynZ5KLtrTFv5eQ9yeQm2gzJ0zgE
 q7NNyD7J9eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRB4QAKCRAbX0TJAJUV
 VhP7EACJJ5RfkeJdFJglgC1m+Cg1d16nJW+oduT+u78i071pCOxXWXtlPDaA9I1uzFOxr/zNdZ3
 tv9L5tNnaKe8RrJMYMU+QdbhwVYS2slnVXaQssUnWXbrnVU87Lubx7K3cY4rrXJjF66l311WJ7I
 YK8YGS+7bONob1bBTsDv7BI658vJA0V5a+cIfqWfEuh6umWq9439cOXyjcyhaaAkRg0Fg7WH3bs
 GvWGcd/rnA264+LRI20uHGHY3GUBFZk1Hdzzb5Yqd8xlo7ViKw1nAwNL2OjEUWaQh8VL97duQJe
 79vNr4EsJ0MqOqqedzwJvLf/dEE+0ZuqDA+Ip9qltssWr0MTNnGFoHbBAmRc0wRk12BEGfEzddw
 DNP2dQtgzvKWuCBZ+dPCXCN0H6MntwqkoWO2bmAturnN75o+/ilfW7O3dbV7Cp288lSFnJ4941s
 e19ZbuFPPkf4IFLNOuOF4UzdGeoDaxkOekmiNBBxIsQrWC8XXb371+MRiVKegwkPgZJko2VAHqJ
 mefdpok/pmc5PWJq0FCBrKH1YkyfiUdJiUhngQIfruxFrtMjdJSEPujTYoHP10POPWh+kQPu4XK
 rdLxmJlrB7MHIPGCXV8wwpf1QEXpFCkjPrZYLYWGLdeihCiX1UZ6RcheWA235YnwIUX+JFX/Sdt
 o2tzi4F1NDYu6vw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 8UKL2pRUZwFcEXgC1q5WKks4wulym41Y
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a0441ea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TDnBEMNS309wUocYtfoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NiBTYWx0ZWRfX6K2+I5R4Tius
 QVra7tfdFZ6C9oqjyi8ZPV6nkjp9Yz9E50Ddh6gHHqizFpCwKErvip0QI4wbPkYma2tBvIKD61m
 v2bMR7lo/y/h5ltJrYDABokZb1KynT0QCzBIP8CXg5UWqkHNZ46O45du7FX3wEYivLIF6MSZdtM
 ypJX3bWAz4vYZY6lFuQ1B8aU6FjNQQr6+1k2GXKQYWMDorR57t3rkOvGPfQueWwfiF8V3ZYj+tx
 2RnVmToYem1ZmXPCAIoCOQak/bzMH90/c1ECXdP9wKUSKTxQUstlwrsh9NknD41IHBxAkc/Kztm
 6+eOsLV6WkSXlK56HKok/JHa0yWteok5cK0xG57BEOKgxj7bgrWlNGKv7ZPvukvLqpHpL9hJDG+
 84Nsi6E3R8HthP8hLA9BLop8f8yF74wcwpwZCm1ALxh7VVJ7IIB832FnI6vHrfUtdcM+SuOWEXi
 /nIV/imUyFZRAGOAvRA==
X-Proofpoint-GUID: 8UKL2pRUZwFcEXgC1q5WKks4wulym41Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130096

On Eliza, the SPMI arbiter supports multiple bus masters, requiring
explicit selection of the master for each PMIC.

The existing PM7550BA dtsi does not provide a way to describe this,
so introduce an Eliza-specific variant with the appropriate bus
configuration.

This duplication is required due to hardware differences in how the
SPMI bus is exposed on this platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 70 ++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
new file mode 100644
index 000000000000..18692893ca41
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -0,0 +1,70 @@
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
+			compatible = "qcom,pm7550ba-eusb2-repeater",
+				     "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.54.0


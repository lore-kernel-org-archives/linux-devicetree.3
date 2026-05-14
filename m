Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2E3FFAAE
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766875; cv=none; b=UIRP8AgxSgWNv+WamNRcNZmpr6KMlwMj4+qRdxgv888bZRpMsquPmEPSlNIsWsDc5n/H5sg6bnJRZVVnEKapWSBS6qYS/RLq7CAtT8i0m8LZ42ZMKO0PI8Ydp/yU2byJdiCyl8anfeYjV95qaF5Tma/dxWnv6ckzd8lv2uaQ8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766875; c=relaxed/simple;
	bh=/Cbd6i4gasN+N/5gnUli1oHBdHG5gwmEwE/0Faw7QbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbQjqhPrZUGzt8TWr27lGn52AsYFOaiqUSB3dL71pjZfuhvsw1rlJRZ0I8llh1wRjnGUA/6ntS+v3QV88tlxwHbt18Og8CNNqUj90Nr57EEc4CJNxjLQlZAWEzFV+HS9MrM8wsPdGafYesg4b7sHf64ruaLGD1AQd4F4KBtvIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqYMVTRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoNafo12; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqYMVTRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoNafo12"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeS2q3951677
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=; b=eqYMVTRcZKatjpMg
	0aZp5LxnPuuQ9jRMtdMhDlKN1YtBu9mMpyXFXJYImTQ61pijwRcaOzemtjWEv1y8
	T+JDC7RKQLPlVR+pcOU0Qqg7qNGARpmw5QrTrBjEEwgu7FUmQJKPbi6NVkyjB0xy
	nGZ/ewe+kuRjdfav6eOiRMxdD4+62mUWDQwTAZsxDrxfWKmo6oL6CtHqI4Mw4Ac8
	yX5cgEHZRjt1d8ehT2IQ8K+XCAMj3pyyaHRqp6MRrKyt130abkBrGmYBgUBs54xS
	GbvMd3+UlGUlVKzXtN3/5Vlcn4DcKOhvBfeoLjJlX8OL+r8CJPlehIKuTas5RhyJ
	4QKWZg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57ksssep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:54:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95f7fcf4f37so4063716241.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766872; x=1779371672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=;
        b=hoNafo12i8OvsOYcaOasJFHJZw/vDoJ59eP3ZlFF/YTzi9OsiDh3JPfffVCzH3vN0K
         U/AVNHFOXLJs4yCHv1n07zrRygEMGfsE1JU4vU3/3fSGu+5+6vDGDAHCxNWC3Qlctlvb
         sTeNk85UA/RDUaJfnqnFLZiRDobc8klSuk5cYI6/9vGYfVg3Tyyl8YtuqufEeLZYbBq6
         kQYEg6kbwuxjL6t0lBBED8Sw2PhYGtJFe7SicawsrQIiVcYL+MCF3GIT7OyzC2cRdH0t
         Lvta4wRvmqo2mnMPCvyuF0+rmTEwTiMKqIhytqwfAOXVaBLsEKU2Acf+G248TTw7ahlm
         i6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766872; x=1779371672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=;
        b=WDOtYYgSPQ9nniXDfH3Zy99GeEULZIi/XKauW1PhoG9nB/s5MsNxqSMUjlUix1LHE9
         jwjD3NQ6tA7enBtEsYrq4D00vjxICHpfXuCiTfuSZh9yhxSNNESOF3aDVWeYx5nITDRq
         jNN5/H4cSLqxZYgHSJNIyaYGSaHc/wqbHNVdXVLuB08UQ9hhqER/wCw5yCZtG5I+2NXl
         Uo7xMfm5X2skC11ooQYVXr/aeLavM0XQZ+dmof4gVTgA9ebmNUAZWAgXf70W/1YT1uPB
         HxaRLHC8KTwUN6tv/6g9YPa4CITXdaLWk8QY62S91vzHl9XmaeLcRS4zCylvS8TD2hR+
         8bAA==
X-Forwarded-Encrypted: i=1; AFNElJ80e10/lb15ziRH1HVoZZ0Q4wLFpwYCtWjqdnlhkHXRizAvArs/f4X99oCVxYqkSLBMzaAyYsULfo4o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv0IJCrCK24gQ5tGGuyI7lynMx9/dLpumm93ml2pzgKea+jI0s
	B6Fd3mBB/G6kLIXfGjsP2qYqeOrSxi2OQliwmy7nhprq0ihQcMJAAz0tO02wgSzVZLhKDu1Th4q
	4JwIeQJEfNj9jn081cCYrsTVIGbcILKOSDXGeLXc/x8qGyF66xxyniYcui39QxOSaKaxek5eN
X-Gm-Gg: Acq92OFffNQC+QheoT8n7beDX0LmM/Q3K0gXyTgQ0JoIAgwr+FkXwAeNvaIYtujbdZO
	S0wBUQXBfflAkA0lLQRHE2iaAFeM7sVJUK/IR8VE1qYgXDz95JzuAB7pz1GGfjKpwZyFu5jYk1U
	1kmur9bW4U/AB//GQF80iXCd+74wWMR8zj6YgqJcrAABXREQySojjFLx+KB5FJJPN1arhhxSCTp
	k1S0ZGhpj/CryKTduhNtFMx/1HBDva4/5cFoucbAn8P73pAnz76mo3IhQ5Rm1fl2+JvQRC4l+yy
	Gwv54qsFlnl0tRn7UGSgkOTz2WSZ8kzsAvR5fr/uaQzPdDQUX3LQIaJWj9vcp4D9KwTCzL3i/DP
	O0mbuUaqwXgE8qN/HCndLhFujblb3W6AFHwCoKDd4
X-Received: by 2002:a05:6102:b10:b0:631:d586:893e with SMTP id ada2fe7eead31-637a7fb398bmr3915862137.5.1778766871738;
        Thu, 14 May 2026 06:54:31 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:631:d586:893e with SMTP id ada2fe7eead31-637a7fb398bmr3915526137.5.1778766867248;
        Thu, 14 May 2026 06:54:27 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62dde04sm27798165e9.2.2026.05.14.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:54:14 +0300
Subject: [PATCH v5 2/3] arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-eliza-adsp-usb-v5-2-a21056ffd892@oss.qualcomm.com>
References: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBdQLQPbr8G2YF1DgjvIAkO8aWJgU2stB00Un+
 rs3HKwIgcmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXUCwAKCRAbX0TJAJUV
 Vq8+D/4maRIUGv9u3HkNCbE+u2yE700pYsk6gZMyh9dFp3ehWYKAAj1uMuAFYV4UNUknF3Pwi6g
 aTfvNQk2lFdUdh/Wslbt7a0FzWioDZiCHdl7i0S4N6tgM9T7ASqkFwQOydv5sK/DBAfuTuUwgxb
 9i/8BTRjwyW+i1JurtgVJlyloJe0qvznbFWT2urcHmEP4ZAHdQ+6dJjTb2A7bJzwkR4n8NeDklR
 Wu28bWQFa+e4JQnt+fw5BJ7ZpRh9au3iynhbxpLJ01SaA73zBTPyd8fhIbLeQNWT8EpBbtGS+JO
 k99qZexsFQFjp8WWDn+XqpO1E/U5eV5rheZFexcbakD8YdDeYmALwKQ0MXc5uCcQTkzOIq7a8Ab
 X198ZNWkKbXXYuyxoMTTywU0ts+/R+lOT+k9KOCaYun7bnM3CRPehJkM/B19ICaaQ5P6kO0LV6v
 FtlD7B3PIVDIrga5rJ/T/SFD5PykOh2C71II8P3Pmg3gH80Bh9jVCQAsqrQ5lyh+2e2nBqasuKm
 KDKx0zxmCcYpPrAUjtspkLz7NMcTAKyAh1uKr0qI/HJcHU+DBtKga0uIxW1LPqn8AuFl1z3d1CX
 LYF7GmwQbwJ5PO+KUJWifr5if8Qjk0xKOQzyI5XFxW0RL6O1dy3tjTcdPtsDqCahXAVibMtI4m1
 Dgqk7PJG6N7+LIQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: -wKtSqqDR51yfUrZntCvhAI1-5OIb0Tm
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05d418 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TDnBEMNS309wUocYtfoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX/GCaMU8YB5Zw
 t7qYG2xb2v8ndN3IEX8fSmuqiN9+r5MS3Nqb696SGZy+/n+oI1XH3bO6qTFGONhoN98jBrzmQiJ
 B0sDarJ1XtpXQ4pvVTNqIVZNm7Lg+1FyLXdsv7LbUdpzU0VqgxUuEx2yHCWg6eGRif/cy9eJMg2
 UuAHSZA93y1pGZfRqkkaycPXC5FfAZpBPM3+VpC7pQjNWUJh3i0a4CqQF8RbmEmBeKfeWlV4hkn
 JJWvkHX+R3tS/QkNC7tqi3LSr0uIyYgrw/RJZmEqhVWoboE8IBddlRO5hULjXA41VEOg4zgsx4R
 u29tSt1obWcDXQ2NFmsoH+lX4pvif0gtVAoVqktMkspOkma4Qe6HxA0iu62HCUgZyCTYaIUdAI1
 ihx0FZ7xx5vRcRZNTotr+Wc63lAYz6GowG3BWdesH3UyfXERaWmwTjl8VyxDVLuzwgzi/zV0k6T
 pa8BeosTaMvuokq4MlQ==
X-Proofpoint-ORIG-GUID: -wKtSqqDR51yfUrZntCvhAI1-5OIb0Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140

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


Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011028.outbound.protection.outlook.com [52.103.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1532F290B;
	Wed,  5 Aug 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934215; cv=fail; b=CAmVV4lzvp+CUVHugMZEiwca+xUaIXF9MZntkUQrpoJVlXikdvitMUWnZIFm6dQgX9KyjsfjwhjFjOKWt7kuL4PvkWN6i1OnjU/mhEmgOSUuLOfmx14qgknKbdWw1Hk0i1OX5c1tj4+IJX0yHMVH8kD0CUF4tRVuHMkdft1DsaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934215; c=relaxed/simple;
	bh=/DhYr41/GytMJRmOhHBoaGfwQa5recVC8PWnAYYc97E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=T6w8SE3Ik6lwiy87XxfsRuVvTJzZ56z2QmpbmcLXdePTM3+0teE4ccldsDb2HlNpQZEv6Wd1vtpCIZwHMXv8cGyeF8uCUqXTewoZzu6gxiWvTRwpDMNTNPqWF0CWRkfaoNyf0c1Cfd1WgaiN+r3XTgjoUS73vi941d4EE2+kN8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=hhzwj+WA; arc=fail smtp.client-ip=52.103.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="hhzwj+WA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O89pWEBMRCUxI09ixXESnY2icp5+PPEeF/0TjPtLVV5s85a4kpYuof1j28JEHIxUzXt4Khxjau4a3n+arY0ABCTshNWwGQvR4OHmiXO6035Yd9PjpUG9RbqgnPKlER/wvWfMzzAvYz8h3iLbCtl/T+VQ0N5/Hg9JCcNERAAGAhbYMGCpIdRx1r7o1cNVDXeQjY1ZGeOyfZ/dcIwc6ZrVtK+XaT8agyOSAsLVW2BhG69DSzC/lu9mCO+C6DkmJOVry+pLBbLaowbEs1+xwOlsTnGRj8Iq2BTJXx5rff7KnpgUZpF7x6YJPAMSl2E/oVLNXlICLBAwLLogaRpDLhzr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd18Wed1tFUe6dEkUvBlkkurRvlh62pEnMpmkz1atbs=;
 b=ZXjBi2/gD5i14qa2wViGKko0zTwgVebMRGpDelbFA60bH8+IVuggTJKGzJt4wVFBK99fCuhOvNR5f/BfKKU9/UnwfSOAFv5XCU734ZF/3VZqLC56uPEMchsA9UbYKVS90jyRSIArzaqGwfPFufE6aOIxmbtF5NPvB+Rck+NLzkuqPah+kM4SLtKxeicTuEq5QsKlTFw4MaAXty7baDV717EiMZJnAoqNyZIjpr2UVOeR7T/7cD5/tLxMRcZXlGl//cgVRQJ0Rg9KDhVzETlwII9XCgwPu4zj+kZXKY7eKAogSTengwlPIvNQCj0qZhaMywPH85hdS6RXwP19D7Crig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd18Wed1tFUe6dEkUvBlkkurRvlh62pEnMpmkz1atbs=;
 b=hhzwj+WAseZmNAVNCJ1vufKhiv5SpD8ni9CoWde7FzhdO/bPbGo5NmWkOpxgRiJ3MtgPqKU8hrpsSpqOk86+HrmCSLyVSO2hTUlmUAe3ngjglfb/2ZX2wLKfuBwpdUTjuLjw+e7d/+B2M7xi3U/oerlqOd7lSjuKJWKqeXKQUN8ihQFbFyYpRSf4gF84Wz6AmA75NfjKh48eXe8PPemj7HOSw7I2idXgsAuT1g5Zi8OYWDNeyrpATSaZ99Ob66oCuhFZ8jllsq0IIeq7uAs6MV3aCTrdAM84rdDkMCiRfhYY9p5d0p4/fqBFgAPbvnUYyJMGCRvV7OH0V2Q3Q5JuJA==
Received: from OS7P301MB1784.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:43d::17)
 by TYYP301MB1479.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:50:10 +0000
Received: from OS7P301MB1784.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c8af:2734:e148:3288]) by OS7P301MB1784.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c8af:2734:e148:3288%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 12:50:09 +0000
From: SuperHacker UEFI <zhuoshizhang@hotmail.com>
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "andersson@kernel.org" <andersson@kernel.org>, "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: [PATCH] ARM: dts: qcom: add Nokia Lumia 920
Thread-Topic: [PATCH] ARM: dts: qcom: add Nokia Lumia 920
Thread-Index: AQHdJNcZORP2LF2230ezhlj8tOBSgw==
Date: Wed, 5 Aug 2026 12:50:09 +0000
Message-ID:
 <OS7P301MB178480466383761525E3887CCFD32@OS7P301MB1784.JPNP301.PROD.OUTLOOK.COM>
Accept-Language: en-US, ja-JP, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7P301MB1784:EE_|TYYP301MB1479:EE_
x-ms-office365-filtering-correlation-id: 325dc3d2-6f32-45b8-8c5a-08def2f01564
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|15080799012|15030799006|39105399006|4140399003|25010399006|41001999006|25031999004|24071999003|20031999006|19110799012|8062599012|8060799015|31061999003|440099028|3412199025|102099032|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PulMyleWG8freoxx6H0btFLdT5LtjsVS/oRkm/GllquaYyd2w2yUmWjgAD?=
 =?iso-8859-1?Q?e/LloSOwm4gzOFTNAYI8baFrznb6gsj36pdo66DSlLk3udu00B3zokdrjr?=
 =?iso-8859-1?Q?xzXphieP5dcKAJEGEv9A0pCIi1q9cf7JnjW+QaF0Hr7Wyayi3rDSBptD0h?=
 =?iso-8859-1?Q?regrlU78vQTQEdtODb3HTHiKtMCxplxVo/hBn1tHcqJwB1STiE/l76AYNv?=
 =?iso-8859-1?Q?ISuISXJwM1DauKG0TL/vr/WfG3K3t439j/xYjTq2uamDKUO+H6fWv6JrNn?=
 =?iso-8859-1?Q?dbszdhIc1wqkReuoZBvLMDsMYKSjwalymys1j+OXuVMvB+T9nK5CtboPfM?=
 =?iso-8859-1?Q?dohuUEZs58Do09+kwnVguwZYccuVkqEJUdFOB55EqFMLYd3OC7rJdm6SOO?=
 =?iso-8859-1?Q?yC5q5Vaef8q+BOH2ioKxX30sRha0Zf0BIAART/5p5nuJFYpilF61jSiCpw?=
 =?iso-8859-1?Q?adCQw8I45kT+PswSra8+W+Sdtb1bULNLu6t392qoeIakNejS1uoN6RuWfZ?=
 =?iso-8859-1?Q?hwOLmiVpBjrystZ1kkEeM4x+R/WwyL5440XZyhQdKLyvHLB5y4SuLz7Qwn?=
 =?iso-8859-1?Q?ESBKCqCy/tk54G0ORtpwWbWnWi9lzWSOF5wl9YyrUvOMPpiWR72AxkqCqw?=
 =?iso-8859-1?Q?eDEjzzMk5iGXNLAXDG8Hwu+pBxmuemburOcsIzIX6kNgVdRr0f1a5RZM83?=
 =?iso-8859-1?Q?kpO+MPtTv9AIqD2B6zeaZJ0SA44+TJyeii3ESn4NrKAuqyOi1T9F+2HMew?=
 =?iso-8859-1?Q?FSj96mnoxtqV1SUlguikqiA/ni3eg+HboEn5tipe4EBivq0doZBin0RTR3?=
 =?iso-8859-1?Q?DEpTfp0h2JCpvt8z9DmfXeaNWZPzB1KoWBWl+vS8s8DCoKzULdJT2V91Qn?=
 =?iso-8859-1?Q?hcNDvJgqDKIcP4OkSEaKItCsUvyc/jVdJcgh7CzOfVY79eFYF+ktFxlmBm?=
 =?iso-8859-1?Q?83Y3LVCXN2vBlEP2pw3BQhuTqQd0pNXPjTMv90W1N39IahAwx9CKjosLpS?=
 =?iso-8859-1?Q?ABH9L8P9R0q2cJQz/suXEi83aaU4noNEeW7aXKiQWDh54SnnkcS8V0h07V?=
 =?iso-8859-1?Q?qHEJROuQip0k+7yuFG5ifIPQ3fv3Q33o6tz70UsDIa25+1IrnBNeq8Kvrd?=
 =?iso-8859-1?Q?FNreujIw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LBCy1ajYMhFpOltnaKh8Z+qcX4a1Bj/eKpls+8Facm4CT8HSoLV9xTp3er?=
 =?iso-8859-1?Q?Xq/o8Bm25DbXTK4O1rSqnS+fsNzgCWxYaVo+9Zf9S4DOmTQVX59VY/xnlh?=
 =?iso-8859-1?Q?lPhViPiH2ogy2Cg5jIkwjsr2lQqjjinop3Ty3yVKKMTuRgJYT7nWIHbeiP?=
 =?iso-8859-1?Q?cwzBzHmgcOHDNxmyUF8dx8xLm/Zo5tLBUytsEPrka7JB2A178XIPe/99bE?=
 =?iso-8859-1?Q?gYrGp4T5mk0FpcipE+FIYa5jdFmmF0QRhmqeecojuxQA/sU9wdEWFZiyjK?=
 =?iso-8859-1?Q?keM9/vRp7hwpcWlzJ2ZXKkmzHSmaatd4+LTtanpDJts/VpW3rA0elWPieJ?=
 =?iso-8859-1?Q?1MA9xpYVwGBs9mdtxlaEg2ttzQoKvqvwojrYHrB+jJtxq2HRzsfTPmjqI4?=
 =?iso-8859-1?Q?C/je5KaVVUnMYySgge4JpmDOIMzYGtY5x4h9gm+6Go61joeoD52woSF3qC?=
 =?iso-8859-1?Q?qV2ws2Op+3SiOLxOxOscSUe99BXWNIpzYrtLnVf0IbyHWfdGHS5ejjsURq?=
 =?iso-8859-1?Q?NXaorN2guX5L8ZtvQTQSmiLRb/u2xKHh2pmMzbLSIXiw3fiEdIoV4lda8p?=
 =?iso-8859-1?Q?zaj6DMoADIgEaH1hIdSPlvn8ywquwamIBoVnpPGXAJb7qnam+97E321sTQ?=
 =?iso-8859-1?Q?EfNgxeXc3cUaYQsg06VXOyQRqR9QNhgvQN4BGuPlCRMQ8GWKSWuQrO6K17?=
 =?iso-8859-1?Q?+6unxiemJuYZA4xuI6AYLCyriLbKCLcEaLhX+EX/pGCmVpC0jUoZJY7iST?=
 =?iso-8859-1?Q?QgYi+jXeufWDTZjqwVkc1k0rxRfrUGJNtvp+YaWqyxTYvgFzji+AxCdCvT?=
 =?iso-8859-1?Q?OifBQsSb0Fn4I7VPRRAYqTWf/YsvHrmg/0GsiS50uMmb0jXQ+a7osaeggF?=
 =?iso-8859-1?Q?mUF3EWR1YYwkzQm5XF6uU+7IzEZC4A2Vw1AX5QEOpkr5DPiBO2C4wnUHC+?=
 =?iso-8859-1?Q?H+D0u43mqR6f9rUVo3Odwm00ng44kXreStS2oGyYTKDnKhFZF+y30My55e?=
 =?iso-8859-1?Q?/qcYsQuyuHATbOpOHvwpWxPPDApWih0F2OGEyDJM5iogV/1PudNGPu+j3V?=
 =?iso-8859-1?Q?DN3DgnrcJ+cLmDz/kBkMPInxGcWsp0F9/TEmrCSTGKedGbCoKh1hJdJrG/?=
 =?iso-8859-1?Q?SNuCEQR+jaSeqCni2b5C12cex0/NX+BzgQfj8HOliY9w8tROPfuq86/OFD?=
 =?iso-8859-1?Q?xMmx4gpW+ONZ9ThCXmCzAKisj69Wu60TNGoYJsQtvtm54owj+1uuJIvL2g?=
 =?iso-8859-1?Q?FHWe7J+CeN/jD1qLfegxh//xcvh7G+MaQ/u7d+u739fHAj6ASbfS920DWF?=
 =?iso-8859-1?Q?hfCaA4bJxEE4upJvuBfG5dcfBfewg6n3RV5L3mx3CGZgRn78ztWx6qSSd9?=
 =?iso-8859-1?Q?boq3EktOPPpCrVqnnJmAs8lpBbMrtT4tlliklClffC0xqqjcKQ80DiYcqC?=
 =?iso-8859-1?Q?KT6nBtZevCjATnkY?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a91ca.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7P301MB1784.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 325dc3d2-6f32-45b8-8c5a-08def2f01564
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 12:50:09.7635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP301MB1479

From 7580a1d391863c24750dab4900249dcfb9fc1626 Mon Sep 17 00:00:00 2001=0A=
From: UEFI-code <zhuoshizhang@hotmail.com>=0A=
Date: Wed, 5 Aug 2026 20:32:40 +0900=0A=
Subject: [PATCH] ARM: dts: qcom: add Nokia Lumia 920=0A=
=0A=
Add basic Device Tree support for the Nokia Lumia 920.=0A=
=0A=
Currently tested:=0A=
- eMMC=0A=
- EFI GOP framebuffer=0A=
- initramfs boot=0A=
=0A=
USB has partial functionality and other peripherals=0A=
remain untested.=0A=
=0A=
Signed-off-by: UEFI-code <zhuoshizhang@hotmail.com>=0A=
---=0A=
 .../devicetree/bindings/arm/qcom.yaml         |   1 +=0A=
 arch/arm/boot/dts/qcom/Makefile               |   1 +=0A=
 .../boot/dts/qcom/qcom-msm8960-lumia-920.dts  | 361 ++++++++++++++++++=0A=
 3 files changed, 363 insertions(+)=0A=
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-lumia-920.dts=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml=0A=
index adbfaea32..31532fbbe 100644=0A=
--- a/Documentation/devicetree/bindings/arm/qcom.yaml=0A=
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml=0A=
@@ -204,6 +204,7 @@ properties:=0A=
           - enum:=0A=
               - qcom,msm8960-cdp=0A=
               - samsung,expressatt=0A=
+              - lumia,920=0A=
           - const: qcom,msm8960=0A=
 =0A=
       - items:=0A=
diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makef=
ile=0A=
index 3dfb1c8ce..9a7fa44a8 100644=0A=
--- a/arch/arm/boot/dts/qcom/Makefile=0A=
+++ b/arch/arm/boot/dts/qcom/Makefile=0A=
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_QCOM) +=3D \=0A=
 	qcom-msm8916-samsung-serranove.dtb \=0A=
 	qcom-msm8960-cdp.dtb \=0A=
 	qcom-msm8960-samsung-expressatt.dtb \=0A=
+	qcom-msm8960-lumia-920.dtb \=0A=
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \=0A=
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \=0A=
 	qcom-msm8974-sony-xperia-rhine-honami.dtb \=0A=
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-lumia-920.dts b/arch/arm/b=
oot/dts/qcom/qcom-msm8960-lumia-920.dts=0A=
new file mode 100644=0A=
index 000000000..a5c8d1a5f=0A=
--- /dev/null=0A=
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-lumia-920.dts=0A=
@@ -0,0 +1,361 @@=0A=
+// SPDX-License-Identifier: GPL-2.0=0A=
+#include <dt-bindings/input/input.h>=0A=
+=0A=
+#include "qcom-msm8960.dtsi"=0A=
+=0A=
+/ {=0A=
+	model =3D "Nokia Lumia 920";=0A=
+	compatible =3D "nokia,lumia920", "qcom,msm8960";=0A=
+};=0A=
+=0A=
+&soc {=0A=
+    qfprom: qfprom@700000 {=0A=
+        compatible =3D "qcom,msm8960-qfprom", "qcom,qfprom";=0A=
+        reg =3D <0x00700000 0x1000>;=0A=
+=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <1>;=0A=
+        ranges;=0A=
+=0A=
+        tsens_calib: calib@404 {=0A=
+            reg =3D <0x404 0x10>;=0A=
+        };=0A=
+=0A=
+        tsens_backup: backup_calib@414 {=0A=
+            reg =3D <0x414 0x10>;=0A=
+        };=0A=
+    };=0A=
+};=0A=
+=0A=
+&gcc {=0A=
+    compatible =3D "qcom,gcc-msm8960", "syscon";=0A=
+    tsens: thermal-sensor {=0A=
+        compatible =3D "qcom,msm8960-tsens";=0A=
+=0A=
+        nvmem-cells =3D <&tsens_calib>, <&tsens_backup>;=0A=
+        nvmem-cell-names =3D "calib", "calib_backup";=0A=
+=0A=
+        interrupts =3D <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;=0A=
+        interrupt-names =3D "uplow";=0A=
+=0A=
+        #qcom,sensors =3D <11>;=0A=
+        #thermal-sensor-cells =3D <1>;=0A=
+    };=0A=
+};=0A=
+=0A=
+&gsbi1 {=0A=
+	qcom,mode =3D <GSBI_PROT_SPI>;=0A=
+	pinctrl-names =3D "default";=0A=
+	pinctrl-0 =3D <&spi1_default>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&gsbi1_spi {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&gsbi5 {=0A=
+	qcom,mode =3D <GSBI_PROT_I2C_UART>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&gsbi5_serial {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&msmgpio {=0A=
+	spi1_default: spi1-default-state {=0A=
+		 mosi-pins {=0A=
+			pins =3D "gpio6";=0A=
+			function =3D "gsbi1";=0A=
+			drive-strength =3D <12>;=0A=
+			bias-disable;=0A=
+		 };=0A=
+=0A=
+		 miso-pins {=0A=
+			pins =3D "gpio7";=0A=
+			function =3D "gsbi1";=0A=
+			drive-strength =3D <12>;=0A=
+			bias-disable;=0A=
+		 };=0A=
+=0A=
+		 cs-pins {=0A=
+			pins =3D "gpio8";=0A=
+			function =3D "gsbi1";=0A=
+			drive-strength =3D <12>;=0A=
+			bias-disable;=0A=
+			output-low;=0A=
+		 };=0A=
+=0A=
+		 clk-pins {=0A=
+			pins =3D "gpio9";=0A=
+			function =3D "gsbi1";=0A=
+			drive-strength =3D <12>;=0A=
+			bias-disable;=0A=
+		 };=0A=
+	};=0A=
+};=0A=
+=0A=
+&pmicintc {=0A=
+	keypad@148 {=0A=
+		linux,keymap =3D <=0A=
+			MATRIX_KEY(0, 0, KEY_VOLUMEUP)=0A=
+			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)=0A=
+			MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)=0A=
+			MATRIX_KEY(0, 3, KEY_CAMERA)=0A=
+			>;=0A=
+		keypad,num-rows =3D <1>;=0A=
+		keypad,num-columns =3D <5>;=0A=
+	};=0A=
+};=0A=
+=0A=
+&rpm {=0A=
+	regulators {=0A=
+		compatible =3D "qcom,rpm-pm8921-regulators";=0A=
+		vin_lvs1_3_6-supply =3D <&pm8921_s4>;=0A=
+		vin_lvs2-supply =3D <&pm8921_s4>;=0A=
+		vin_lvs4_5_7-supply =3D <&pm8921_s4>;=0A=
+		vdd_ncp-supply =3D <&pm8921_l6>;=0A=
+		vdd_l1_l2_l12_l18-supply =3D <&pm8921_s4>;=0A=
+		vdd_l21_l23_l29-supply =3D <&pm8921_s8>;=0A=
+		vdd_l24-supply =3D <&pm8921_s1>;=0A=
+		vdd_l25-supply =3D <&pm8921_s1>;=0A=
+		vdd_l27-supply =3D <&pm8921_s7>;=0A=
+		vdd_l28-supply =3D <&pm8921_s7>;=0A=
+=0A=
+		/* Buck SMPS */=0A=
+		pm8921_s1: s1 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <1225000>;=0A=
+			regulator-max-microvolt =3D <1225000>;=0A=
+			qcom,switch-mode-frequency =3D <3200000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_s2: s2 {=0A=
+			regulator-min-microvolt =3D <1300000>;=0A=
+			regulator-max-microvolt =3D <1300000>;=0A=
+			qcom,switch-mode-frequency =3D <1600000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_s3: s3 {=0A=
+			regulator-min-microvolt =3D <500000>;=0A=
+			regulator-max-microvolt =3D <1150000>;=0A=
+			qcom,switch-mode-frequency =3D <4800000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_s4: s4 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <1800000>;=0A=
+			regulator-max-microvolt =3D <1800000>;=0A=
+			qcom,switch-mode-frequency =3D <1600000>;=0A=
+			bias-pull-down;=0A=
+			qcom,force-mode =3D <QCOM_RPM_FORCE_MODE_AUTO>;=0A=
+		};=0A=
+=0A=
+		pm8921_s7: s7 {=0A=
+			regulator-min-microvolt =3D <1150000>;=0A=
+			regulator-max-microvolt =3D <1150000>;=0A=
+			qcom,switch-mode-frequency =3D <3200000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_s8: s8 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <2050000>;=0A=
+			regulator-max-microvolt =3D <2050000>;=0A=
+			qcom,switch-mode-frequency =3D <1600000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		/* PMOS LDO */=0A=
+		pm8921_l1: l1 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <1050000>;=0A=
+			regulator-max-microvolt =3D <1050000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l2: l2 {=0A=
+			regulator-min-microvolt =3D <1200000>;=0A=
+			regulator-max-microvolt =3D <1200000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l3: l3 {=0A=
+			regulator-min-microvolt =3D <3075000>;=0A=
+			regulator-max-microvolt =3D <3075000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l4: l4 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <1800000>;=0A=
+			regulator-max-microvolt =3D <1800000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l5: l5 {=0A=
+			regulator-min-microvolt =3D <2950000>;=0A=
+			regulator-max-microvolt =3D <2950000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l6: l6 {=0A=
+			regulator-min-microvolt =3D <2950000>;=0A=
+			regulator-max-microvolt =3D <2950000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l7: l7 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <1850000>;=0A=
+			regulator-max-microvolt =3D <2950000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l8: l8 {=0A=
+			regulator-min-microvolt =3D <2800000>;=0A=
+			regulator-max-microvolt =3D <3000000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l9: l9 {=0A=
+			regulator-min-microvolt =3D <3000000>;=0A=
+			regulator-max-microvolt =3D <3000000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l10: l10 {=0A=
+			regulator-min-microvolt =3D <3000000>;=0A=
+			regulator-max-microvolt =3D <3000000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l11: l11 {=0A=
+			regulator-min-microvolt =3D <2850000>;=0A=
+			regulator-max-microvolt =3D <2850000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l12: l12 {=0A=
+			regulator-min-microvolt =3D <1200000>;=0A=
+			regulator-max-microvolt =3D <1200000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l14: l14 {=0A=
+			regulator-min-microvolt =3D <1800000>;=0A=
+			regulator-max-microvolt =3D <1800000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l15: l15 {=0A=
+			regulator-min-microvolt =3D <1800000>;=0A=
+			regulator-max-microvolt =3D <2950000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l16: l16 {=0A=
+			regulator-min-microvolt =3D <2800000>;=0A=
+			regulator-max-microvolt =3D <2800000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l17: l17 {=0A=
+			regulator-min-microvolt =3D <1800000>;=0A=
+			regulator-max-microvolt =3D <2950000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l18: l18 {=0A=
+			regulator-min-microvolt =3D <1300000>;=0A=
+			regulator-max-microvolt =3D <1300000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l21: l21 {=0A=
+			regulator-min-microvolt =3D <1900000>;=0A=
+			regulator-max-microvolt =3D <1900000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l22: l22 {=0A=
+			regulator-min-microvolt =3D <2750000>;=0A=
+			regulator-max-microvolt =3D <2750000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l23: l23 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <1800000>;=0A=
+			regulator-max-microvolt =3D <1800000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l24: l24 {=0A=
+			regulator-min-microvolt =3D <750000>;=0A=
+			regulator-max-microvolt =3D <1150000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_l25: l25 {=0A=
+			regulator-always-on;=0A=
+			regulator-min-microvolt =3D <1250000>;=0A=
+			regulator-max-microvolt =3D <1250000>;=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		/* Low Voltage Switch */=0A=
+		pm8921_lvs1: lvs1 {=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_lvs2: lvs2 {=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_lvs3: lvs3 {=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_lvs4: lvs4 {=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_lvs5: lvs5 {=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_lvs6: lvs6 {=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_lvs7: lvs7 {=0A=
+			bias-pull-down;=0A=
+		};=0A=
+=0A=
+		pm8921_ncp: ncp {=0A=
+			regulator-min-microvolt =3D <1800000>;=0A=
+			regulator-max-microvolt =3D <1800000>;=0A=
+			qcom,switch-mode-frequency =3D <1600000>;=0A=
+		};=0A=
+	};=0A=
+};=0A=
+=0A=
+/* eMMC */=0A=
+&sdcc1 {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+// usb1=0A=
+&usb1 {=0A=
+    status =3D "okay";=0A=
+};=0A=
+=0A=
+&usb_hs1_phy {=0A=
+	v3p3-supply =3D <&pm8921_l3>;=0A=
+	v1p8-supply =3D <&pm8921_l4>;=0A=
+};=0A=
\ No newline at end of file=0A=
-- =0A=
2.43.7=0A=
=0A=

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F50F511225
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542176; cv=none; b=IWUz04iWqiEBKy3OFIQ2dbUujPZn27BD3DnZuN9aMwQSGJhQ0y7bCur5gFHvq8VDuIXfU1ilp0DDrgxZiWoPqUY5apKMoHSy2gCljwv0VYUQIwvTeZ6UfNEwPndBpWrNNybucDhMfNIRBMpdsf1qv8SYRILalOEL7A4pKx5t1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542176; c=relaxed/simple;
	bh=Dn5L+oJ6dVDXOOdql61ip8Mlt2Vh3aDOeZ/dNzv5dGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXajX+f/Wgdt2IOMDa8b50Tvc2C1t9DpwWtBPlyhYhtW39Jj8YAe0GWHQopNxyHEbCq5rez8QLJHI2lfZQQhutETn3+tD/G4KRX7GsUTfL9v4vdySMvaJHwALB5DM+nZP/+u9+58uyMCAoSrhldf/CBiFEvlPINpnYEuEIYo6sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISENmjfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNtr7WlZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISENmjfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNtr7WlZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiSZX195837
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 17:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URKn1z33NimNKVaAS9LcdjQ97PJvFHzvWWnAyp7TRyY=; b=ISENmjfSM+GizaL+
	FiFiw7TtD0v4In9U5YqPGG/J6zEw3qlRATCOHHbD8kf1YsIYuTe1zUew0Ej5FeKX
	ZQBbNOLPedPei/N1okKgXvgZHAjLac07Q4MZQLC2yB5D+h1kZkMXsqRFkoi2U2kc
	cmA7wAzf0hqTDgalTBS8WESJotJeZHUvOzsMG5r10ONVM7nrr5QTTDHQJ1aTwucH
	fXi4xlLeNgRpL2KWP79JKmgKbYJoLt/zI//Po9RxM8zAEGkkehdm0/gC32RIRajI
	XcBhE6WZm2Xe7dk1aqU0ZJzr18X+AxTpCaordv9q5NbkM/1U1hUHMmY1zgYq2VJN
	N7lcxA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg01214ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:16:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so259546137.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542173; x=1789146973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URKn1z33NimNKVaAS9LcdjQ97PJvFHzvWWnAyp7TRyY=;
        b=fNtr7WlZCwB6pFCVZ1Eoh61HBMPevIH+0OUGlRc1zy69CWfJjHCS5T/s5JTjdgqDxO
         OFlV7bEB2I3zSzrysW0RYpNKBBCLjuPFpKc+A9KfSJUROmOdq2cijZKjSRrFOpkTy8zD
         ncNaPXkMgjn4KWkrh/t+L7vprj6hhFduC1iYzFN0gat54muP3LM5aU+nTDX4BZWs8HAL
         4pHq4UQmSP7llxSuKHCzya2T5p8RX/dfenF/3T6WBab9n9eMArenSG8fbFUu1C0sqFr+
         vETN24hwaSnRZj5QAIzLFHopHPJOV823/nRtkmJDN74S0JNsIEGgPHytXgrOPStZv0hV
         YJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542173; x=1789146973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URKn1z33NimNKVaAS9LcdjQ97PJvFHzvWWnAyp7TRyY=;
        b=tINsLMirS2jjLnvJVJWibWRMYhc9wvW+C9TwM9tV8OugyumGA2fY9Yu1iU296PjGJo
         uD8iwMKkChc06tHSEtEtuo49lylgE8JYxyajM3U1d+/yagp80lOJz9bQ/+DZuMsVIU9A
         /e9C06fqJUzu5/WYNjFi1jeIjBmlCoNzx9hL5a8RptDkbxvBORRtlnWaktR3PghF68pa
         e0YNAak3rL/OU3arigvLnf1qweAC0UkN7DKBM2Ua4rWBxJclEGSTm8XCaFxRk6Y/TjHS
         535pKH7UGof8+97J21EyHVlCiss48At3XHs8ninLM0Wjyelweh+Eorl0bm3D6L1k4/os
         tFBw==
X-Forwarded-Encrypted: i=1; AKwUvBzaBV97BHXkxSJL7NNkQTFgyeSIbgF8cLUlGqkfQsLop+0DfWnGZURMy5E34HWyctnmF5bv+J1pGE7r@vger.kernel.org
X-Gm-Message-State: AFuF++nOjMIPmlmFEe/n5NOQrrr3LeYSvxJLObzMrdI8o0I7J4GWW7/i
	lACC3VoEw0HvB++Ktca4/pyMptdK5pqvu1pRbROnDzr5MiWb1m1tzLY64JoB1JatBP9s9rIDcKg
	iwps9pHGhjbbYH2njxWlrlWARmAvqxL+zmIywAGMTg8V3Ly20yDtpZKlQHgQGBCce
X-Gm-Gg: AYBFou36EWGMvw42kDCO51LiSdpYw5ImiI91gNLLEUI9a6HKxSvQbnRe2B7+9rNh5v8
	xfuUXr/chuHEYmFYR4ELDyr5OFu8MzewhJA3KlMuut69oGvfTIQh2B+Un+NSx7AeHOXHeSU3XPA
	tcdGj2e3Kei1JxrAQRMCLos81d6tLBB694ju+qDV163r48H/p/dGz9QxQG9vk7gPxQ+PJNcCcGO
	wGTVy2TpQwTtHf/o0dkYebqBgMfyMl4n8y/DkepljhPDM7Mm+XAUcACdjp/bbWOGXZe5FlN5s7g
	n1EfnA01Hr62XAx4tiePj347RunU8cV7GbtDiInkmBdi170uNLKqIXQtOwfGNeC4O9LG+X7cVIV
	rXNoVcHVhvmj64w==
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr2277296137.0.1788542173066;
        Fri, 04 Sep 2026 10:16:13 -0700 (PDT)
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr2277271137.0.1788542172627;
        Fri, 04 Sep 2026 10:16:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm8474411f8f.25.2026.09.04.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:11 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:15:18 +0200
Subject: [PATCH v3 1/5] dt-bindings: PCI: toshiba,tc9563: Document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-pci-tc9563-aux-v3-1-5b1449d62ba2@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXxcj+//8nHFJ5
 NFWXjtBzf+/r4ugZg8TgzondjeGpyjnf1UQMhQFSJsAbRQnpKs+87bKIBxIzKSob/KpWHk6HK9r
 Kjb5kllByi9XXcUoCmnh1KOQR3M8n7s=
X-Proofpoint-GUID: b7lTuP_v3BjX8bsQK1feEW5-jY8SqiNn
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9afcdd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lJbHue_d3WQnVI_sE6kA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: b7lTuP_v3BjX8bsQK1feEW5-jY8SqiNn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX8K4+sf7grFpp
 V0OO7gtQ0YM7qxNG02DGxe77+kt/NX+a6FWW8B6Y69M8VENPDOy/SYXclNP2u/mATFShUnoGmAW
 1jSsn2l3DxMn3CLsHJqXd4QXk3ki+QCRk04RjlaseygDsZPurQQZr1m4gl8CJ5BcrgExEZW9t4U
 bm98KI8HGGghStObuwOKYElS4L2Oo/As0KLdcU1XIJU2ICA7rEXTWybgErOA+7lmiidzY/RYUg1
 BHNB9MEyPsYlqOhuPma1uDPKGdxBmpqwyMaTd7CyEetmI/chxdMGcfE/LQz+AJEh823NO4NbMPM
 l1w/v935s5F96ExpTJ1IZ+WK4WEJP6wWSOq5BqNNWZRX4hi60URBB6SW9z3futBwzYvniKAQsh2
 K5oznkd0O9xMIFlrN0XMcJbEe0G0Ts6jxdi9uHpqKYhEvlqUJ1z78bXHGhVHgfbeBfZBgh5dsVw
 uKmtAENGpOmkmu9nTIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040156

The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines. The controller is registered as an auxiliary device by the TC9563
power controller and accessed through the same register map.

Describe the switch node itself as the embedded GPIO controller and
document the per-port reset-gpios property.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml       | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index f084830c6d0c..c4cd162cb084 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -31,6 +31,11 @@ properties:
     description:
       GPIO controlling the RESX# pin.
 
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
   vdd18-supply: true
 
   vdd09-supply: true
@@ -84,6 +89,11 @@ $defs:
     type: object
 
     properties:
+      reset-gpios:
+        maxItems: 1
+        description:
+          GPIO controlling the reset line connected to the downstream port.
+
       toshiba,tx-amplitude-microvolt:
         description:
           Change Tx Margin setting for low power consumption.
@@ -128,7 +138,7 @@ examples:
             ranges;
             bus-range = <0x01 0xff>;
 
-            pcie@0,0 {
+            tc9563: pcie@0,0 {
                 compatible = "pci1179,0623";
 
                 reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -149,6 +159,9 @@ examples:
 
                 resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 
+                gpio-controller;
+                #gpio-cells = <2>;
+
                 pcie@1,0 {
                     compatible = "pciclass,0604";
                     reg = <0x20800 0x0 0x0 0x0 0x0>;
@@ -158,6 +171,8 @@ examples:
                     ranges;
                     bus-range = <0x03 0xff>;
 
+                    reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
+
                     toshiba,no-dfe-support;
                 };
 
@@ -170,6 +185,8 @@ examples:
                     ranges;
                     bus-range = <0x04 0xff>;
 
+                    reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
+
                     toshiba,tx-amplitude-microvolt = <10>;
                 };
 

-- 
2.55.0


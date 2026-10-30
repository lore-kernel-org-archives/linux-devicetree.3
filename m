Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340116;
	b=Ppc9OgXzTOZhWgdLVK4H7d2yW5xOnyEOfCLulo5z+YR5imfRTem+O/H8/sIc0dFYa98F
	 51tFNND7txKg4iTidpl5qXF34jbv6zqF1qNiGMvPxdbTDUBNZdH8TNd/1bYuXBLGpwt2z
	 55bKuoClolVDqrySpWgIUv6bI69ao2QHzF+u6if9gV40z2hPlOUlrFTSYxsJv6fOKoDtW
	 GFRCn+UXgFvitcNFboVq3neP/+nlUkUelttqAQwDMkM8YNJZhA3TihTeBlOhRa1jo3e8o
	 xxVytcGEdo70tsecn+NjC/LQokKgNB8WhPtOa0TrSAGPcG8U0WZ132bzO5b8ZMWQh0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
	b=wO0uvabQOrE3/nedWJI+Ae1QKtC/nguDaT7DVIBlvxThTunbWVzFq5OKeUZEHL+T6RgD
	 M9wZl4b/YknCmEjr58hIOU3jJQLwW/wWhzUU0pEIQ96NWSWQyXZd85a4LrYjw8T6tiISs
	 w2OrMexaJr18T/kggwXISK/vWslKb54JZj+08G84qEZGVtHg9nRefA1seXRns88HCDcBB
	 cM4/DauMOZKfLOw/yWh8POVabpCWXtSUNWKlgaLt2zwxZVxpkzzKpX9pf7HN1g2sw49JQ
	 LHtYnYn3d1nGnkBkUnDtwsw1miVBXFeTUnkuCGGkpEHve/QazQ/JyjFOq7ULl3trUVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N61c8DdX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eg+9PD/u";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE9606A321
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6DE9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N61c8DdX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eg+9PD/u
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F1RD1979851
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=; b=N61c8DdXQWkt3ddf
	K7S+aCwGr7sMjMhFo3BRucsbhHwMRtHxx6r3YWa/PcUz860PivJt3066PqsqxjEt
	33B+BkvalMjKcH4QaR+Ov3XXPXV9zLrDWzrNqI6vE7Uk5JOb+GCMyHfpnpz6xdnc
	fUEOjxQtue81uZFHjxq4TdGDQkPpUlxIoaRnELZfK2qkc35eETusJ3HPInuQ6SEc
	AmLB3XhLA0cuLis25+6Q6Y4dVGtYiN6LvdSKO/CZFCxUXNynL3jn78CV01et/Utk
	YyK9XU9T6qbNaEMxrMEwTamDrF107If26e0TTD6bHNvlx5i/GStoqhHxpp5Zq4td
	X9+8qg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhf7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so397374b3a.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340113; x=1793944913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=eg+9PD/u7V493umLcoddVBKNZKKxSgjti9/Dt/utqEM9q4XhG62o1R2WCcI2F9houl
         zATzy9FNFSgDBP3AmEaz8buaALvX2LaFPTfiTTspI/D3mbxoNBbmgjK19HY7/WYnO1AE
         YgamKtlZQ4ra5ctYNSXgTt/r5TA9ULM4i+sBILPpxPQg1NdiyS5icYaVul85XMz1AgSb
         tqGqkfta/NRtMazHyIY9WEd44fuo2LDQ1lRdUutNAv4cQPyQebZGfRZoS9/CMTcADGGl
         LOo9SJQgZc40vFl0S9u+8RSaeS5Hg+omioiUGG7me6HHD7Riv3B9eDsbsEdDq44UA5Yz
         Cwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340113; x=1793944913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=MRj7smgJxx+1iNz8ZtFFBob/qjhEI2slvrqmQJVvhy5lv/ypnUNA/TpiL99AJp58rW
         QzS8abZjwmnLXmPprbxtzTiLhvED7GSwhGX8lwqpoHKbKvTX4QIY3ybTA2+/Osns+8j9
         EfPiNrCooQyD24ykjBCWKYsV1aXyNszZrdBKYwXUYsDrVm+0nacocWGQJDvxmxzwH5ek
         g/5MI2VK07NWznegyl6QszwATu4yXZmudQ4u9byYZnJ+cNsGjvZrthN+x9YzP1yesEcx
         2TAemDgHCZHWGWqqJLBCc83DOnELNHhi73eHuhI5mErzuUAApP6uR68uLb6g48kHExxX
         heng==
X-Forwarded-Encrypted: i=1; AKwUvBy9qYoTRDsqOsO3EWjE8qbYsnqV63s3+v+ElOMvCgRPEZ1o3Otf/XMqhBrGeN9AFGwTxf2cvahCQ9Ej@vger.kernel.org
X-Gm-Message-State: AFq9FYLTusPsHDKbUnCYJpqCArvS8NdSCvB0mtE0RUrrg5E/jpne96Hj
	cY4q/VncqOTwDNL4RBcX4LTCL1rT6Qj0lRZMNDwIecGJ9CjpH5O6YtR9390/BeZl6Gk3BNR7UwF
	72tE0Q9sxkLxZuHXbcIm+3BJofiHRw3htKpyufokbFKSdLPhmxvXRQ5ZeeVqX+sUN
X-Gm-Gg: AYBFou0nGPVM88w9zsp8fWcyTvG+v0VwwrSIU4oHMRq7f/zN6rJMHGgGYXAwT0Dmi/p
	YwqAakZtsTc4xLKyFq3skvz+lW8N99byTF+u7MVcGHK/cKJ4B2d4494TRDfBL54utWs2SUJOsr7
	S5lZnfByhYy0peRUMu5eeHHNLyfnSA8pSL7FsFrmPjnkgjmfIV4czRKkB9i7iLqrjZZa9leuVrm
	NzDxo5Mzk0doUjrEfZifcQ2SXyC0EIhkWkeoHIg6MZnO8rdz+A+HDKZK9QdfxM4X93/E71/omQK
	BZot18BFETpQrruhy/mjfWgOoj6ppgWs9+eX3RXah9Bzyhflj/GTLdNVZbdhhYyJRyfAn9HYHKM
	BWh9bAXDYrp1T75l7ASCcSyCiMkd1UxWFpzgoymXz/s4EiYqyrczGsYZqFMrlS0LOiLnoxC4htK
	Bz5GzapHpz4c/hiDsFrNBM2me7bAgHtMSKYpZ5
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1101030637.14.1793340113179;
        Thu, 29 Oct 2026 23:01:53 -0700 (PDT)
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1100988637.14.1793340112695;
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:29 +0800
Subject: [PATCH v20 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-5-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340077; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VZwTP8q3VzOtW+jql1QO52SoMySYQJECUrbQXJatheo=;
 b=EEud5RknIhi9nBBQ9Ap+ON8z3v4WfMbmbWr2mlSA1hC2GfyWzIXCRFPxIGb24or5dmZbA2wdI
 LYWNA/Ywb2oAd6HA4/BPuj+3dioxkUBoi5/fux4bsfxpjTmDA2n+a9O
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae432d2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vICBwkzrAJ7j4Fab_4VqvHGGnqi5Hx6M
X-Proofpoint-GUID: vICBwkzrAJ7j4Fab_4VqvHGGnqi5Hx6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX5SH7B3qiy50S
 a6iFTOAgd9k19mALYMotC38IGNdtoGGgRqcow79ZZXHZ9pxchG4fx0kc27ygJBj6aVpsgAE0nt6
 /o946qrBy7iGT2X7FOybX+DlvOokwmTSETOnh8nmw5dx6Ry66Njw1jr4aD5nUPUb9GrYvgyHHBa
 /N32TtYrPsQ1A0exCu0D/w5BPaQxJiq9HJqELUEMNgZIqRg3coYH5O41KxnmhuiSh3ArYBOzbml
 y/sB8yg8Pn1nmcSVlB6Uj8x8gWvqmSP5hsa8xy2F+EXWF4eNPHM+TX2Pw+b5ATv+fwosGa1SlV3
 SFmF7Wk2fZ4jBooylydePvuocW4BGHaQ4xANHy4qFArWmgovShsPS0FU+67S2JPkceYkBs65nlU
 5eyQytEVVXL7S387hAzLQShMBMxphhtsEj98ijajNtHZWREH1EcPAncoekUD29sGt5ZB4HPamso
 vAC5hIdvrJe62IofpRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0W/s8g3SEzZw
 ZqDWKSln4IS3UQ5jRkBeHCLxEFJxs947h1dEqUHSb7T676Iyvo/Q7wLfQo9e7zjbbvuuEUw9KXX
 2/omLmAWcEYOiux0EPKjElKNk2Gp90c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


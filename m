Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F469212548
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030504; cv=none; b=gwEqII6w6jEYRdmA/ybVGJIbkJzS2KcA96PEMwjV3pC6ijLzivC7AJo33ZjK3HsCHfKsW63mmPg31LjHanbiAlgRO7Pbfaopc+YSdpSImPv5VtKlCOAz04w7kTDjXu9jzN5OzItEtW7034pi5zObTnQy/2gUHLICQrq7gHBgqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030504; c=relaxed/simple;
	bh=uRqx9+tFa9YY1/KJ/Gku08nL4dvx/MN+1g5RGjJmq4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POszsX4AdQstTUHJCU1kEerlcRs8NSH6SOYUriy2nHp/7B5pqGJqorHFy5ahnMQnxFEgOgaqU+wE3CqKEi+Vx2S6svlx95vWB4A+ax8o6LSBIjkyLIgxQKH3TIJcq/yE7qtI1PzRoObdQvVhzVPO41SQcHAK1UsVBkd5zNJD80I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLf7kq0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLFh/UDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLf7kq0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLFh/UDY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9888s756616
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oSHDQ58vYI36DndD9bBqdtSMKh7IjUIJiykP/8kfoE=; b=FLf7kq0Pes0slB9b
	D9FZCYpkHYLKTiS6JNH1htgwRHkOxhvAPW5eHflvzW5akQoz8Ji+UdXraFIGrIGa
	MnbXw1UpVjXNspp3CPl5Oo5iTvFOZc+lTL+hT/rkz0bHeJ6PbnC7UznWtUj/Uewr
	QfIzGX8/9fGhlpuY8knd8MB0kK9/dPvPOkDO0XrUyos7T17b0/mc/thUL+DjsiZl
	Gio785bjeH77hyZ2A4RLGEzRXU4eObjMSXvv8as7W3f9nE3v9e+G22wvnIUibCNW
	zgltcH5+SPRGhHSZuEhRJQpbI7gUFzte7JiXlaeNS8VIvELBI+vxKDuMc6/7urhm
	QT9T/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bktbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so2019701a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030496; x=1777635296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oSHDQ58vYI36DndD9bBqdtSMKh7IjUIJiykP/8kfoE=;
        b=VLFh/UDY367xT+7XGXiMzQedhq/7i778TyigeNX+kfpupBMCqUgoIoH74bigXbQvCe
         EyZjmw/pCe1JI+LFQsPMapcZpun0P971i0cRgMXg7hzRKjP459ShRwu1+2lNp4uhbYp2
         5ijG/T9tlkR/RjrGGibbDSehXi8l82GY03WV+TImirAE3u6i4MMsPzGyPGTJO+e51BWw
         a0wy860QEKEhMcusu/kekc8AOyGxvo6MkZ7hBxa4cbxYumSwxczi5jMzqxZFusdGrx7q
         Hz12JGhjwn/bXxELLgbgq9snfkhdw/yQIuUZX9rASDMM2yUuXvp6ib6zfXGEfCmA9unD
         VSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030496; x=1777635296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9oSHDQ58vYI36DndD9bBqdtSMKh7IjUIJiykP/8kfoE=;
        b=GoLeV5XPrAc30LvRukqK+B7FaOPdKah1NTRkv64mhVMu8IDfIUkBvG8RuRJddRojow
         9KZ2QYxg8LD10HusrZ+X6nUAoplSX0TkyJVpTeRASPPaJ05l/njzdnxrqj0gOti7Fnz/
         bIN/ulwNKuPSEkxMpRTiOqUPMgd39WiVHRomxnPxBbOaX7J4CYr+/8GEjj4b2Jh+Kfjy
         alHlS5K/PC6iUiBiHZ/XucaZqRxz/DMSg0388UZAxVsmkcxGocPPqsRqazY1KCqsxzZV
         +3IzmrOowBSnrP3F2RWiUzXqkdrGUE97fqblEr1sSwkhLF17KPno+m0fdthk+UrEk9bc
         ZhBA==
X-Forwarded-Encrypted: i=1; AFNElJ+NhdIbhSmdyl82Bpf3+6xGcrhHeaDZ/YXBmLNTMtSIo3S4shRRdke+eVPDqHgPnTBdOR3XmYX6cy21@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7AzG5mXn8UCdlcIieee4EqgeUzmPK21bt72ToCGekQqfuJJj
	cHJPZ6EWcJF1cU285iFMRoTLnT0CYdu2hKU5j2WBBU6x3Lo2vfmTlS8dVNKiHj9p1Cbe/enl1sB
	r+G0CwW/lsEAaxsJDQEoefI3wcB41ukn5xBYpA3vs9+FNRhxB/cM1UAt1UyVFAE4YMbDmlcuT
X-Gm-Gg: AeBDietYbkFFnop+feMs/WGNpNhQ7F6MtMiDLRr/US8qhOvonjKM4aMQ6yqN+VVPnz7
	4AUS0ZN9AOqZJZ4MT1dqkKM1YBAmhiw7xQzhEV5r+h0bVeqB3+vyZV68Clfc3KmgmKm/u06gxLt
	518+0IoT8T+gpr6OlcX1lGJGIzT9qsT0G1rjhs7NKSHE67DExIPDNju7h1WCFAroJZfm0CnisFz
	m3iSsU2sDOQF8aJWf9BJk5ymqEo2UnyFhfuJpq8RM4OfFHrSVZpONkZQP6sI9KypnRRSvQ4eSN9
	v1g7k3ZOMSgoF0vXZVKL6+W2VewRVgFgFwAGUZtU6Zd2L591Nytr+BDyYb4sKCta5OxXogSAVdB
	iCKGyOVyR6XKcRW4gWSJXHNlVESEAomNl5ednySOznRGtBbGLd31+IAfdvbyJSc3Ohw==
X-Received: by 2002:a17:90b:5865:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-3614046f978mr34671506a91.14.1777030496001;
        Fri, 24 Apr 2026 04:34:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-3614046f978mr34671476a91.14.1777030495353;
        Fri, 24 Apr 2026 04:34:55 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614186adddsm24204734a91.2.2026.04.24.04.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:34:54 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:04:15 +0530
Subject: [PATCH 1/3] dt-bindings: dma: qcom: bam-dma: Add support for
 kaanapali BAM v2.0.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-knp_qce-v1-1-813e18f8f355@oss.qualcomm.com>
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
In-Reply-To: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX2gCbFkQc1eQF
 +PIeZyXWQYktvqBRt7bLpxBvUgjy3wdPeVwdIHUUr/GywQYWFRRYPe7lROYyA0P/w+K5ncJd+Ye
 c9dKiWZGPkLlDiYYeCQZM6PnKZxAJwLco3uKB3mOGtGWmz/cL/Z1F20UOWwuJga0QyHgxPPID44
 p413qYcfmHDnsUAgRug4RbvjcBCQ40wFFfW2tuypx6ZtKNuMZfxkCYJGVxYosDbNi19DldT9t4O
 /lEektmsgv9weumiRZyz7qSdzMbcFChwjYCO2rp4f7FB9OiPxEP/aPntrpIm2wsVtVgGBkSXEDX
 wmsXvvIKVODlcxIyYI80J0AARtWNtiYIWRFJjuP/YojmgkYPUjY2NVxnieAr/aMW6kKgRZ9lY3S
 nmMqu8k3DC5fyY5amuFqS6YkiP3tB7pfVR1NMiphPCQVCQpgwGFFrjl3J8u9YkfjFRc4Co/8Pj2
 nATb+gMFvjoD6ED/pnw==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb5561 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6hn-QP140KOHNlEGON0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -w-7efCpCXwndO6Gl7M0fFEgETKb5m5U
X-Proofpoint-GUID: -w-7efCpCXwndO6Gl7M0fFEgETKb5m5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240110

Kaanapali support newer BAM v2.0.0 version.
Document the compatible string and update example along with it.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 6493a6968bb4..0923fb189ada 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -23,6 +23,8 @@ properties:
           - qcom,bam-v1.4.0
           # MSM8916, SDM630
           - qcom,bam-v1.7.0
+          # Kaanapali
+          - qcom,bam-v2.0.0
       - items:
           - enum:
               # SDM845, SM6115, SM8150, SM8250 and QCM2290
@@ -118,4 +120,23 @@ examples:
         #dma-cells = <1>;
         qcom,ee = <0>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@1dc4000 {
+            compatible = "qcom,bam-v2.0.0";
+            reg = <0x0 0x01dc4000 0x0 0x22000>;
+            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+            #dma-cells = <1>;
+            iommus = <&apps_smmu 0xc0 0>, <&apps_smmu 0xc1 0>;
+            qcom,ee = <0>;
+            qcom,num-ees = <4>;
+            num-channels = <20>;
+            qcom,controlled-remotely;
+        };
+    };
 ...

-- 
2.34.1


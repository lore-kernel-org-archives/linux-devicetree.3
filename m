Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDF4921A9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921643; cv=none; b=gaGw06ca4u90B++jNU1qVwIJwX5FtdpLihLZK+rbfGxlv85OZw8mqCJ8qOn038reGqmxaoYhQ2joEz4hhuLaSOxyuN5TDnxSk4gRRYpZ1QPtKCdUekL9wFZ1pK8qyBMjfyOde5b3fIVXolbbUl9ipcZSTqM0mvqfu/GlH+deCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921643; c=relaxed/simple;
	bh=GWTkfYePYPEGTpO3+RiqLPCaGCSmezUWdnppwKHAMqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xbh7if0BUf3elp8E4bDFWiqtQWp+ad0KDedXYag17nRGE0pHCv77wiy87UXk+yVn27pd6y38Qe50/+AbOzlbMCm7cMBa8Tl/RqBVx4P1wjlFomYBlcd/cz6ynap1VSsNTyWal+rcMeQi/tcMjk1x+XJFNJsRTH2A7qiWRyr8Nes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRY1uaTe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alhe9P4Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRY1uaTe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alhe9P4Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoIk41550179
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=HRY1uaTeGIIRXKEL
	6wsaDKZf2cVplnvu8A7vouedWY/oJZ9OBdObNQEd5NXv59+E12gXEZG2Pue3jodZ
	Bf9nuB74OOOyxq3OY8Jnt8//r1cOb5bzbB87nvHHzfO+zPeP+gIGxBWsXvnSGkOB
	2sC5Leun+VnKFM05qXn0uwb/uc/49eaUxgwfH6B6lFtaXTBwCCWPZQsULNVLy1It
	7+iLF/bWx4bxIcjYIzCL94f3uW4Vsgk9mMqVs2JtjJHf9HuhdLux2WDTPsfCyZ6u
	1cNFycmRWxPCwad87+4Sxcdt48EMG54PciKP0BCWCVCgOYX4Zt3uVLYeRRwTEMPg
	qjISzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541r9u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:00:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so251558385a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921638; x=1783526438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=alhe9P4Q4tCe33hu4R2/Ad33TZpZRpsVNsQGI2bv1xnNdGeXADKd3cJ/KvgldAUm4l
         oJMZXqWy62vYZVdGBLe0MZaQ2lqWclVX1EVZl8v41Fs9EugRJ8MGWFc8XYDiLkAAuxZR
         2VMPPfxA3uNYl59ghAnvfa2Cc3Cd9aoBvLWEpc9aEus2IL0upwJqKmVxlp++1xJ2hSlN
         urSvESYa4sCsHkokJDzsY2JM37UV3EPwhP3hHbC7keWibOlcXFpLfGWjMbKp+ddCUB7e
         mlkN7LvzPCmlGWHqCCfAyoxCE5IPUlzw8sU2DwOcihGwbAMPaNX3xBPx+r09CvrLV7R0
         Eqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921638; x=1783526438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=JY2KVfJ1qr0mNvXYhTV8sKbDhYPfPEtE1aEm7FEzhyDQZOJiER7yvrOl9yQtzNsNkb
         UlLTethtPVnVkvZQBE9YYmYkaHEcyZ97ui94S7Q9FSWqPidmSUz4jpbYT9Neb5gq9Dp4
         mfz/JrEK0TfLbN9NmP6wTdYshy89Am36m4wCcipJysjJAsb8BQk3Te6JrSKL3Rd3ExkJ
         Jl3FHUWN5H2T15tCUn9Rj9lUHycZvOEcCwXAxUTgjyA/+NHR77Wb11+FrRNNGvWOLFU7
         iSmY0vtQ1IR3gGRwyjp5aFuj61J0K9FgFc+SWrQ0ojIAnCsYU7FunMqmDgL7jPULPqyH
         l97Q==
X-Forwarded-Encrypted: i=1; AFNElJ8WEB0ugeiPvuq31sOZ/yXBHp/kr4OS4Oz9Hfytre6gGmmax7XglzAWOVxvbKtrmXHuX8XLNI5SDOh9@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvIJjR9HRpTwfXscmFbh2cffh2gh3WSOJCuimB92zUdRr+iXi
	td0v/XFflw9ABOtG5LOOOgYiYhAhnyYWsFa4KQNHGkzIidMD0C1fATS1U5nPkJQHxks7QRi/Udi
	pcX+3AEFOnJ9DgbwGsR4jAC9nDpILgZIJMrIl6xr9z+J07y5LXOG9Neulw8bKEBL5
X-Gm-Gg: AfdE7cnkHQCdcFCp/i7WliHTymRbXtz39gJKTlrQ9lxhWDr3ZZAe3kWw6DaVNLIwVua
	FQKkXOoEII8POpI9mfQBRiww/x/0r8th4fXGfr1mhOQojEZT5dwQ8RPeKWaGxWEmLdPypb2TRrK
	qJTjqc7LWmXFU9Wuvo8UeA15JR9ZaisaqqvlgEZ88VKHDjAQx+P97tpyeLcXgSw8Jd4cXMmbf8m
	0fazC35y6jQ1Meg2uverOrHwmbYf25vuptJV50cO6GKcIMlZwTdSaIGstzgg59EuGNEsjZD2F5e
	AejhQYnXiLXbwoWun0duJCIu+b3x1gXzY/W1kRyw+LFqvT8MoZcB4/tFlmNZNnE3h/cHx3nJqxl
	gys1o/PdbwwHpRIqy+yVH/DgU3Mbu7Kr6LpjVcxrg8q3eb6c01GqRibkwmLEfHPLMKXx0KNAv9g
	WOY79UfIqkT4MnBpX+dqSspBVsm5G+okH65yJh7v14atspBjm/eWgwk1sX2wqe5Ek=
X-Received: by 2002:a05:620a:4096:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e697c6671mr914774085a.20.1782921638198;
        Wed, 01 Jul 2026 09:00:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e697c6671mr914758385a.20.1782921637397;
        Wed, 01 Jul 2026 09:00:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:26 +0200
Subject: [PATCH v7 2/9] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-2-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 0RGCmw-hQY9wtefJs_MONXvYjyldmTJd
X-Proofpoint-ORIG-GUID: 0RGCmw-hQY9wtefJs_MONXvYjyldmTJd
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a4539a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfXydiVNnr37Ri6
 qvxUFe4gaWkNhrtZDKSXHZaZoyaU02dDPNmBpMXa0xiIzlBXTJg//lRp+S5BRQDGZ89SGUGeEoF
 uBv0cmoEGS8xd29TX6Yhx9NnOpwqIP1Z/Cv75NpPTH6F/htdK6/A5SUhtphxBl+LZunyA69OsN9
 OykEifjhIYr20PFIftqs10QevDEeEz6A8KE2UOFGzrhcYWC+VSClGpPXREK+Y8E0L3AZ3rWdIrG
 TtCT2vMcL2rMT9rNWaPmsge2UkwjZUIjo6LX8dAePgSg8K3E1o8DQs1ZiYY4uFIYM39iPib9v0G
 MkxJ7GOHCthBTM3EbabPPCiqxREubL6aZ2axR5KY24NnWZUYIJPyDPoCg58s0BJwcGMU+3SEOQS
 A9DBi2JE5G/57h6Or4H41idiJEpoX6Wq9eUQaZV4NhyJJVhLPQ//gJkmdS/Q7BXTgvVJE8tRe6u
 vcsdRPCR/ALGLsCJi3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX7Z264WkXmZC2
 oxtErBrF/avtRThn0TVKzwEB1/tgG5YYWmPGHFfGTbFM5wYdl2Bio4EqM8n5iFe0DrCPtjEKZ83
 w4umHUgSGMenHxW0IASAnhZK24/w+Aw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..878c5d833a9cb073520c256c1b72d0f1489e7f4a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


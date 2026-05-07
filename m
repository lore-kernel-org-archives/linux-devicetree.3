Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4BD44A713
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167492; cv=none; b=lWIlSSflvJcJtK1sD8Mc90GQ0p/MoA+KMzkEkojc1/h33fEK/hnCJ+I/epfQtaJyxbkiUo3b27kcQYP85LQ65ZzXDu1xmJ0GMp6d9PqvO/nK5H2XuN765hh7+IsaydzwsOANAWk8OqvbX5vBjk8Lb0RIGaxxIrU12OQqqKUm98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167492; c=relaxed/simple;
	bh=Yq9eZWlTIDpBT1jqRXA1YcQ7jewB4Li4nESrsfqdqxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/XPoXLIU5/cydnKPdZ6elH9+jcvzS5qhI4klSx33hBb0W6w3GntqWE4kBEcZrmMyOZZf98vP6vcr1eeMOHejcDRI420/V2m1tQn2NFkMgCDPKW0y9uMFpBg1cL7G4edpSVjcKbZNjMIWJKcOGw43QgxodBteP0ljpSU28Zpn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHIaw8lj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqyYzGxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHIaw8lj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqyYzGxt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479CoHY3464724
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 15:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8YhFkwRRG7HQCuWlp0zuKi3fIa5ZkmTd/FI4268HU0=; b=PHIaw8ljGKMKOyXW
	JOMO0FrKk7092/z3zBfZ51Z0eshaRXz/CQjQi3MqCNsDNbb1qyI6e1z8L6NOHnkr
	a1T9wEdg+HlOXoTK3j8BvpPkfYpIYnQpUUdIHv3nEYEtQ6QuuHUsOFBNOYnw/w5k
	G2dlYAXt7ffweosKr94E6p9uMOyUBDLi6BeLLgIrCIfN6eB3m4+vWiIyvLUwJqUL
	IeNMZtKS/iDJbuF36Egxpn6xYoL4qBCCYwivxpddkuSgwv+10CSYj8MbKhHJIe0U
	Vg0yh/yatuoRZzZWNG2qQ3C7Gm1F+6hc4NFRkzcjcFx6rUa0Rh0SVRfIm84CrLFu
	IbJ5LA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2s8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:24:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-62f2f65217aso602816137.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167488; x=1778772288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8YhFkwRRG7HQCuWlp0zuKi3fIa5ZkmTd/FI4268HU0=;
        b=UqyYzGxtw4RaQzs+Lh7p3NAX+TfIazBHUHl3Tt9PoIe22UEUWSag0zGZPWXj6nFdoa
         US9Pn74G3mNcsuuFo+X/XgxXikIOYw7eFIBrj8S9FZfN+nS2vLJ6YvI4fHxY5uJlQVUp
         crYdIPHBbNbwuzxZ1im8QrBxY/KxQg0B/eULb9Wh+WUNMUboYLovphyOOjUL9Zw3fI9r
         vcvXH6fmR6WE094U3VU8efcdFEL3jwtRYslld5EKDupMG10t5Xvd7TP3Fyb4+9XJ8Fd2
         GIdUdFy1918mpYnHZwwBLB/0/YJNh/IJD552BSffi8RHc4Swpis0f4CYLisf+w/SU+S8
         SFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167488; x=1778772288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8YhFkwRRG7HQCuWlp0zuKi3fIa5ZkmTd/FI4268HU0=;
        b=BPz6Hu/+xsJx85T9ArHL45ut4ULUAXmcGu9dInGPzMkQSVkIZyuiDU2q8Krdt+nPEq
         7T698cSzPRj9RQTXWxqHaCCbSLLnxV29FgikAvhTopfrbn62W8soQ9UwjEaToQl3WF2w
         Ys+iuz6dRX7vJpDVta5GVaU/SVut3AY+NbmPZz0HwTViZ9J97pRqJRs4uN24K5fO75Ax
         osiT8sa0R2kIWBJdnqpkxuENIgnW4zkFx6upUOALNq0sEdf+l87KB4Os0t8qK874rz45
         2dRTmXw0otcevzA5+er8kUDim8k/1d5U7FYSQYhiuOgf9dpulZdtUkP2m2JNXx2aJ5Wq
         LUwA==
X-Forwarded-Encrypted: i=1; AFNElJ+CPe/N2bHy4cel60nzlAr9//BtBo81M55uDXerwxTjldseCOgUipTzSLuNZEMRRVk+FFWknKs5Fhhe@vger.kernel.org
X-Gm-Message-State: AOJu0Yybtd4vOaoODIhWa7MUP3lPSOGZYJQCXeKCW6UasUTfEpW/ermA
	Pe9fedPSwGRANfLXtmFxRz4G6ON6B5uduUeaTxdjLo40azRYm+mz1B7gukLpKAw1N5acvQ5soTm
	JphM5SdtQKlEfxpncpcx1vgyxPAMfZcB5lCQGEVHyrr3amYyRv6Uog/8Ox/fuI4Qj
X-Gm-Gg: AeBDieuWmVNC58GQ+JQOeknIHFTpZu9eFjgswimmVFGwNTIK0qXDf/58f7cPoOQqMDd
	LRr4NEsfOS1ydLSUaooqZmLvK1tinwRccbjNtUuL2302sineOgZ3jdAlwTy4WoLePQIEYD228v8
	4PWkkSVzAg1OID71Xl+j1xGKnLu3ZgAqNeWQS77C7d07rfHoAHIaDOclL9s+s/wUtwgLvnMzwe1
	VQas2qH5+F3W7gsovUPx2Q90mcbvh6Ltu1iza5FAtl7NrQ6VSMK50yL6Ck2ld/anFCcd/HmGGdK
	3+kBjnTZA35k2p3DXCrpbqot77FGsWMboPztD3MKcTao9xuRkeYpFC0jn0ub0WZR97rd8FnLFY3
	MwzEnujbpHKHoaNE9Z4MsaQDl42ZSCuey/hM7H7357RtyjSZcsHT4b4EiWo8P1YNopKdSouQVok
	0PkmTXAANlzYh+wTysj3/btUga7Qk=
X-Received: by 2002:a05:6102:1614:b0:62f:c97f:aec4 with SMTP id ada2fe7eead31-630f927f4fbmr3735561137.27.1778167487874;
        Thu, 07 May 2026 08:24:47 -0700 (PDT)
X-Received: by 2002:a05:6102:1614:b0:62f:c97f:aec4 with SMTP id ada2fe7eead31-630f927f4fbmr3735537137.27.1778167487442;
        Thu, 07 May 2026 08:24:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:36 +0200
Subject: [PATCH v2 1/8] dt-bindings: mmc: Document support for nvmem-layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-1-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX9S3zK+FbKdDD
 19kmwCuNfZ2vkyqtGruT/dgz0PHUO+XJGQByfVP905lpk3L0QpF8MDjXj4GjEcFgw4NBXigfp/F
 ETm2V1X52xtsvY8AepzHZnJoC2gbHnTXJ0AzBqNTWoAoEeofu7CauqCBHNmsBnH3gYeekMkrZPs
 4PwBKSUexy3861PldXq/uTJ+mYP90uW6ySroNjvpiqQlSvcGxWijUtI+Q/cIPVajRA+tJl43oGK
 81Ey+CRT9Ze0FKulExus9/DP3DXyex4Ku2Tjq5sE7KVkR5Q942yb5qXF7frR1omP3bSkFvY+J/6
 f5d17lEYzqi1FQGKznbfiVUx5JKCi2q7VQwIH4rJLVhuHz96HmlAc1WZjjd2A2Yqd9htvx6Ja4k
 mDp9xJ+yoynBDZT/rH1yEkPtsW7YsfTjzIYs/DCFMvEGcNgLLOpWW/IOD8QV3WCUiluac1fAQkh
 oeE2nigno/N8kB/x4gA==
X-Proofpoint-ORIG-GUID: cPwBB6SnMJQPbwd5HAq9fmxIYC2DQ6WO
X-Proofpoint-GUID: cPwBB6SnMJQPbwd5HAq9fmxIYC2DQ6WO
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcaec0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hFPe-bIbDLvfECHHD4sA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154

Add support for an nvmem-layout subnode under an eMMC hardware
partition. This allows the partition to be exposed as an NVMEM
provider and its internal layout to be described. For example,
an eMMC boot partition can be used to store device-specific
information such as a WiFi MAC address.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..b21426a49cf1d9aae5b4e8e447b5be11b08c96bf 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -40,6 +40,9 @@ patternProperties:
         contains:
           const: fixed-partitions
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+
 required:
   - compatible
   - reg
@@ -86,6 +89,27 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                nvmem-layout {
+                    compatible = "fixed-layout";
+
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    mac-addr@4400 {
+                        compatible = "mac-base";
+                        reg = <0x4400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+
+                    bd-addr@5400 {
+                        compatible = "mac-base";
+                        reg = <0x5400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.34.1


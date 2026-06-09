Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5C3E9C21
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991599; cv=none; b=K/25xCaTC7QfaAU2qTYQWHTqw296XhfBo7z1/klC88LDB48NxFCrPmeRYz07NEKdg4lhk9kuiuS/iEyPivW9CO17UW+PYISwJJ1RmD5l5sFLo0nCFRNWlP11BJYCwPteW+sCiP9VPb5s4TkgKR44OPAtSamYOydL1hNKj/Xmzdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991599; c=relaxed/simple;
	bh=X0Ai0achBf+ZwxyXQCLBkT4mksbIzc1fznSydl00GqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAK2VCECVAy+QRyHqYgESSZUmKW2zs/sAw7/zzIpwWTFja6nVDG7lnUmT8J5s5U18GrFeKhe+/oEcMkrehJbIw0VdpMpDuqEdOWT782piSXCXR6ZJ0gsE39rY8J2cMOyZmHxSgy/l+wvTNWWWtgtVPiAwRe9P2pk3fV0hAtIGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqtE24s7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ty8fvoxX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqtE24s7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ty8fvoxX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65940JO31520164
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=SqtE24s7100dyZVA
	kTClwnOzW+aY/y+IrQvA5ZuVMmk1ZOt1sngQs7WnSevZ3aqCRg5Cihoa/loxIg+u
	t3Ru/iPPVx61+14JjwffwlWZ+cKt5bOzhddi9aByGOfrSA0sc0Ie9aB3VDpvhKaF
	AiDEm4eplPJ+c0qRUnpRGz7DnmIl7lhYgv1Z7+QcMGgR0aJIlUINw7yrp+76RSlN
	4zeRYaz0U+6sWsAMDijaGiT5YVm8P30VNOGvyfJN6I+uHpugUFRyJSsROI6vKP6h
	qWd4kKHfEXmpsaq18yY1I0kyTytX5hjNTIlTvzqqQhk/0DASXo4/pgwokj0YDOKn
	7WZBDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvcnca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:53:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175a1e32e3so147106751cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991596; x=1781596396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=Ty8fvoxX3z9+aGVH7nrS5wdzT/sN4UXtzTsyATMGtOik0OSqGOAJibNhzJwWtdqUWK
         HL1FHKzInEaiIJzbjLJICVCb2x9BiPUmINBFHma/p+XfbLH54XUbC5sJP7K3FJxafVNq
         VNA7jU7jsxRcyiKAeuSVCwuBWcU5ONC+fuGN62nf67r4XHhjkXQ4Ty64K97X0Tjraic9
         NGTNjfnaAhTwAw2bbbD5Ph0e7H1VvEHkDKiTen6IXXP8GHekK3XbVX7m3qK1VMfLBPXq
         YKuvIsBq96gHmC2hqDxym83+E8A1qJ3MvyYE0w5kOVj0BleecEszd5XsN624lmJTbSQ+
         YZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991596; x=1781596396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=duXM56E5iIAksv+CX/tTLetArEeyu+xeT+MjtGjCTvm1n+6pD8RtXGxDtWEN7JlV4b
         5tm6QrxSoPPRukJ7/eBNLsoAGDGBGDd1l1rpFHY1m3sP05EDMxxLGzkiAvdgveEGD7mG
         MkcVVchvDgLnAADdTKHshJtjUxKlQUuA9TafPDvu9BZUvFeQ64x5wUfRcV44jol2B+BQ
         rzunO6c5QVGQiWE5p/FU9FKSNZba6TGZTw1bNu2s93QkfdCSZ7k7vIq/qsvGYEEB0zxh
         grc3dxn6oG738iy6z5JMtZSu/Gq/rDCecHZLPxwd/DY/g4S1DafuNfnTNLFF1gJ2YhAp
         posw==
X-Forwarded-Encrypted: i=1; AFNElJ8j/J5jEdw2afyqBQKLtOjssXmD3QzOPUCZG57fCQD+XyamQ2u7B+n7eojNM+3ucH5hgRz1M53l7uTE@vger.kernel.org
X-Gm-Message-State: AOJu0YworurGpsN/rLmRYDwXMgpqHsZwz/Q25PWg90Hdb1ZjvZgKXkf6
	0xa170DkUIj8J5ImNUg11DdD1h0oKHV89bHQvmc8v8RrSHwq42//dBgAn5GwN33yvecEm5ytMEy
	BkZlSyWQCuRBQXsTUwvVrBaHQGg1thLDHqLz2On+UyW/PFkJajHzElw4qD8uDyezR
X-Gm-Gg: Acq92OF5TGcLGa8nEshlefkrN14nAQh44//ku89pLzAiLqzgq8+h8fDf5DTVsA9Xna0
	0YD9lHekPIbk22Exrgdplm8EMZYLtWdiBDRLSUYhVHzgVmmhuYjWcT5uw8mpUdWV852vSomEfjc
	JjT3kZHplR1fHhkp6AFf+CgfV9tTmWwo3bKQepG49+hboNWqd69oTpID95aqtw0xwMjVWsy9eO8
	6nv2IfWDNTCYcTpI4+gFK6wSE2BxHfRuxe3Dr/GTQ6Xjef/OFACN1PJAadKcNNA5XHrXN5JM0Bp
	zDxK+6VSx5KeH/W1tj3roD3eJg31cRykE5jz9lM6GMho5HlX/u0D0t0IusjxDHKNw14B/orpCRb
	ej4458LT/h5mTLJnKmsu+YpqaIvgQkxathl9XBhb0YIK74dudHDhGVnQrFne5jnjk2LeXIRk1q9
	lhEc7mpFwHJFy7h7DaYaOIOedVa0hs8mYsgUT60HpQKg2ys9JUj7DrCjt/8YQT3+7UlPlIyNKfs
	f1Ai/il7pNI
X-Received: by 2002:ac8:5852:0:b0:517:599d:ce19 with SMTP id d75a77b69052e-51795cb7901mr276093731cf.48.1780991596109;
        Tue, 09 Jun 2026 00:53:16 -0700 (PDT)
X-Received: by 2002:ac8:5852:0:b0:517:599d:ce19 with SMTP id d75a77b69052e-51795cb7901mr276093471cf.48.1780991595695;
        Tue, 09 Jun 2026 00:53:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:26 +0200
Subject: [PATCH v4 1/8] dt-bindings: mmc: Document support for nvmem-layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-1-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: pjwbibk-iEr_1s2hqe3p2HuAtbrPS4hR
X-Proofpoint-ORIG-GUID: pjwbibk-iEr_1s2hqe3p2HuAtbrPS4hR
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27c66c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9i5gzfhGLSn5NVSMExYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfXxtNVZu9F/jjZ
 G9tdu8rzPduqlsbUXe66CDnURwr5UKNieHjvB6e+E16wwmzwbkA99j1xKqOJ2y5Ur6ENTSqnKS4
 Jp7+1R0PgJz+ooZ1mP9lpdAxRUTvyzum6ntcZ0L6hgYrUxR2Q7r0Ynu24ZdUHw6509Kpw+YiSDg
 FLFGLG0AxcKaR27lKyVKmlEKECoWk1rpxewUTZFofRvC2IN5mpT+wR8uAbBU6mOHM7Aoj9TTngF
 qtJkmL9LSlFZQRZbHohOrdaHVRu7mg5DAEm0AZ9pqPt0FaJ+hia31ZVLZ5qa35mGIMBRCIooyX5
 G41NAkX8rQAPsIaIW/Fz4D1kp/yt7/6YFp9kq1RhRTtJ8tqJyX2lvugrw2eidHihlgFKNbXLZoc
 YxKa6tSyD2HKLDgNF5RmfFB7AEj9mhO1udf+rrEhcdFW97aMbQE9jrN0K+jRreSwSPSffVgBWx1
 F/3nlAMEYgeumIb0YXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090073

Add support for an nvmem-layout subnode under an eMMC hardware
partition. This allows the partition to be exposed as an NVMEM
provider and its internal layout to be described. For example,
an eMMC boot partition can be used to store device-specific
information such as a WiFi MAC address.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..ca907ad73095925b234b119948f94ae81e698c86 100644
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
@@ -86,6 +89,32 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-partitions";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
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


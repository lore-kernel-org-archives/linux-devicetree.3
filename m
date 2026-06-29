Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFB23F8EDB
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723333; cv=none; b=NK32+MddctRv0jJbwm/Y0YCivk0ebrScRBUTTFre75EQOWzWWHdPjxpGgTPfELYMOFYpJ/AyYC6YS6mk2sA4z2O6jWJiagIEIeJWg9cST/ijkzDWqYkHD0Owh9bXI8FwtVjfeXFtH0x64jGt8NwG6qkN5CuGavWTsEOi8HA7VTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723333; c=relaxed/simple;
	bh=X0Ai0achBf+ZwxyXQCLBkT4mksbIzc1fznSydl00GqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wb3044WzkEXml30NL/4MqeyyfLoG6CUrW9ETPpa6tHCQ2NuMqCsLsMxyHxhXGKZNOyHmlSAEhrReAb5N2z3B/2G6Kfj/2Y53HPotjYbJ8EprMaHQRtvEoby+UvNQ/si1j4IrNmy0lGbc/T6nc7Mn+jv9MuYmzBcFIKhIY3ByS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrG4Ljmj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpNdqjNL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrG4Ljmj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpNdqjNL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rAMl2134416
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=BrG4LjmjGlraKZJg
	7YKOa0KPU+pIo/CUftVNyjvA96wuJtSToedDs5k0ML4/LgiRf5bzfPoIbWoG+ttL
	tKPkDMJxtZkpphNjlpCtYZ+aBtw0f0cbysEv5RTaOAEnmEd8USGoF+cwHwuu7yT1
	W4cCy0PIl6XRB+8XT7U7HMV8HAq4A8DoQb1G1msThkkDHOuLY32DGXbhX+w4o80w
	KTOGCZCHr6KcbK3i2NdQDSpcdblbUaAgu7g1DImozCazwvJ7LXeKhLi8vWpMyMHq
	S6f0XFSK9TdHYUCEH2K3h6SSwE3fvyyCcfz533343tjR052P1NxwkiGXASXSWpjv
	HGpZGg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a5mn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:55:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966a617821aso1484823241.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723330; x=1783328130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=HpNdqjNLTTSixap7i45I7gMoPy1jFNr74jBZp/Q88EMcbR18fqrselDfHoX7UMkAM4
         1yhTZHqOa1y7mY4mD7PlSxgAKcy2KOaUGp7132GIz3dAbHQgGmwXmyEC26vHOS4B64ce
         K8MIOScj6gHZuAkuudivEapkJvLONgaUi9VJDBZXvJDt0fcH5iXeADn1A0DkPWjSQWSw
         r0QCAJylTbxKQokQ3leVFC8gVCWNx//jFTBN335+c8nbsPLRXcV9ilgp66un4i2fFPe6
         eXUTwdy90yZxoddlKT2x8cG4xTPhP1aCNFT8OQ4a66/TcrYBdNWyHrLF7gziKA4ZX6Zd
         XESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723330; x=1783328130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=Bf2S7Ypql5BORen+PqsIIHjZVxq7bmOh435UKi/fVoawQbz8fD1JzpmFfFDI5eqKwO
         fZkvlHuzNjd/1Igp9E7Oq9Z1Fok56D+mbv4JhoKxZBDxkEP/OZGEnBb1Yo/QX1iwIz90
         L8Un8VwRsOumVQfYeVNGjJZdwHDOxFJatFV+ozbgshCfjyVT3UQPwG5LYzoGuDHV3JeT
         IDtofiBEjbcZq5HVJD9LDZIzzVNXpM/7SnA7SZoBM1zkQr53IaQCAvgufa+2dl/3u+zm
         rnZWV1T3NUqGws3gn6khZ1F+wHSgSI7+RMZ0ekMTSQb1+DqVUIcmiZDLMkcYqnaN1dDr
         Z8yg==
X-Forwarded-Encrypted: i=1; AHgh+RoacN0kQcxAHm8/ikRfQx9dmU9j8LSSFKPE7T3O+i+47M21gbfe2WMN6lumcQ5E4fCwtLI5qQQ1PBSz@vger.kernel.org
X-Gm-Message-State: AOJu0YzxxZNpu1OhqQgu0fy3pdMRDr4b6gelTRlWcLEqHYL1Anpu/qsA
	GFSBBSgfaSiNWiCPWpzVLaJPr5tGVi/NWM/HhZXTElIlwAIRYjPtA38RCwZSH3n6AIF0zHaJ7Eb
	4IhJlAhhLlUfvKvFqNIOuCVptnE1qktHsooibFnjdMs4hMhCo3L7e1hfW+zWMgC8S
X-Gm-Gg: AfdE7clpI1nFh+H4/Gxo8PN/S4c7/F7dtknrZorZEp36nq4yrxFgQWmtIEIflV8BSFE
	8oIi8iRXpjzQFhIvDQfYWS8C/3R16J5oqFWw9etVzycNezcq5D4+rLGlVgioiY+GlzqaRx4WnfQ
	jlMhPN/3hwIF8u07sQS3/sNu4b6ptZ50XblITfxJuFml3XEZYtxehJPJYvqaSi+fX17I+HY/LEX
	Zn004owg7tzKq6niFDbMEiLO+PdGqqrQu3uBp/QYl1tDv6BEVDdO56vCGFAgdPlvDkBeOvKz98n
	J1zZVKi1On4F/3CtFbX5CVf1+HiwO5NjHBGkDQaCnL8/jCe9RvcBuX2kbwGOw6eg+UE2VjYUoUh
	2lUIZ4EiYbl16aX8NitTiWTGr1Q5kVeLUT3Yg3cLYwuub/hLwwQV5Pv6hs7Jht6CmXKWQCS2+Lk
	JNDq9fvnSI52yXH2Ogcw8LyWOiFadElPTb0ybjOlo9SDfexxrEbFsOLC7y1mnMbrDILDuttwr8d
	zkgbOIDC81TIA4qIMdz
X-Received: by 2002:a05:6122:d09:b0:5bd:a7e6:10d0 with SMTP id 71dfb90a1353d-5bda7e616b7mr934607e0c.2.1782723330378;
        Mon, 29 Jun 2026 01:55:30 -0700 (PDT)
X-Received: by 2002:a05:6122:d09:b0:5bd:a7e6:10d0 with SMTP id 71dfb90a1353d-5bda7e616b7mr934595e0c.2.1782723329904;
        Mon, 29 Jun 2026 01:55:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:21 +0200
Subject: [PATCH v6 2/9] dt-bindings: mmc: Document support for nvmem-layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-2-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXyp0OjJO42F6o
 TjbnYVUK5CrRkEhP5Hsds9Ay6JQG91bFSGygIHn+iWSWis7sGMmBhQ53vgJugsAc/xlfjFRqeyf
 qzfOcQlEptjjhg7Ka1zex02eJmhr8LwoXDDWAhX3+/ZpkeBqZEJEk7T3c1k3mWMwDW18v9K2iJr
 fOAM8YFUI5SuIXDZ4krx4ixS3c3AHC9wbQurlP25iFn5NCmuJk/tc70VGFOEz21ZSYN4scQAjHz
 pMZoBjqipMm1R01nHvZc7Wja7FycgOveo8CcKEhx6Qep2Cmv0lXuhAf+qCZap17+CAOvmryey7l
 uUk/1x9w4pd5mVfmu0c+NFvu0IqsrPmbVsb+U56waLzOWavhw3ttkOjiYyCEzXMSFnrf2AzULEj
 cIOwfJuJg6I1JokukHnvrYONRfuI/MUhlQNmqdKm/C4JxMoj0lqWBpohUY7e3LLTbd81/NyTKC0
 ZS2QQRs6HTvF+64iNRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX/TqNcsqb3wKe
 rGMWavvBdmL0qM5jutmmyNNjmh84LG8+0oXOuPEPWcrKy6Uk8BKaAc/vEmvn0hG/Tmgx0jStmma
 7RsBbkKt+q+qTROXJKSwjqS5+PW+n9Q=
X-Proofpoint-GUID: -ZPjv6E6JdkIMxLZswmQqD2Ggp5OKQg-
X-Proofpoint-ORIG-GUID: -ZPjv6E6JdkIMxLZswmQqD2Ggp5OKQg-
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a423303 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9i5gzfhGLSn5NVSMExYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071

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


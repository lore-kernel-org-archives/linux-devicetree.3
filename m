Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFF7443AAB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427248; cv=none; b=fWHFPTaXle7l2bSAZMoCgi8B5+YxWDY8E3uagfNQutjPRdaM8rdSAmSWLqPXo8oMUb+E19JsIjnVF6Xktb0wWb/lgSAWb12hCvEz093bbgvsuZ8sP3iU++Z3Epng7m0dQw0BD8cErrMF50O50+CRoyXWw7bFveE1UdYqST/fDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427248; c=relaxed/simple;
	bh=k3X2tgRd1gwg/uwGuGSAVWLEEcjC1WSvGA4Lio2zQzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOoDTciGHNUky9Vk3tFE4eljCFnlDAHaJQ+qqUEIPBMUgWhwss9EBPY6waJposy87UE89BFcLAGWRUmIDIIQ8hQ41c54S8PtRqna7Xr89uahmfv03WvD+sEG0PSa33ZYNKMrdUO7HgCxsml9LIhXgACR5VgG/ePu7TLKVqmq75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ/naMfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ducUFlLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ/naMfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ducUFlLE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQkbD1680383
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=; b=aQ/naMfJL/eXOSkY
	sW4u1BsAtcWL4xBVIXWzOT4Y5OjCS+pcvEQoAayCe4obG9b+yJDKdV8HcIuPeyL8
	g0moUS6y0529FrLk4p2d7OYpHyAT6CZiRoNJHQL/odMCeNjb8kZu1MEXEANETa3W
	QXJc98GHfx6AL/F/8cOsjtJQUD32au1niPzUo2HT3GUsr8EOYJS9dlEgIm4MRfwb
	e8O33IUym52qZ48RHx4dBRj4mlVCQz/LzhYUTN1LD4+4B+ryFTwzPZF6wRHv4HVW
	qhcHL7Sh7mlakv7rTdEbKii9Es5IPyOvUTZLgYG0rWm08ZPiMUJv6hk+AbWNOH9q
	OQkJKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8gy0fnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:00:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso23271091cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427245; x=1786032045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=;
        b=ducUFlLEQdSx2BQ6bpCNlv2UVFWWhwp90zT/1uCpksUWlxEU8JUCJ73jPjwsePmM1t
         o4TjX7jnGKiVBJv+09ln4rUGzUHgorW5J4IgX5pI3h+4UdROK8cN8BrAH+CA9c50xWjk
         0WFiz1iXl8341sf5vZHR6pvTeGhBOZllAzpngHvoIi5PM8qY8sdl5crYXkcUDawBPHXA
         3VxbegOYWgw+hTYo6/wZPRpIx49nqMPsXMT7TwijnQ8T2uRcTSKGZPbTPYBuilt1f9IM
         qK4l2qUNMStq7TJyAm1PidJrJeQDD2dostBGdnb4ZPPlTKlY46TBJVO1pxQRY4jZMfXY
         IPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427245; x=1786032045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=;
        b=jwfTrdc/SlgRBM2qgA9g93Ruxh07V/88k97YBYq0iNuXeu1NxBzkA8yfncKfk8EEyg
         3UWDLhKVkl/VaIs2VILObld9waI9Qh2VEKwiQzkwWIvSA+S08Owu5YIRB+HLj00d2SvW
         TS5Sg7s2WBvvyRoBMoxFjvfqTAZEJkvY8j8z6s+W+aklJOuPCFl1gb/XfPe30D+WlYMm
         Z9TKUW3dMj9wQ4mwDkFP7Dmpw679JmOvrQdM1ao5n91e4y6lWNwJIDBZ0QRMyBQ/xGTj
         RTMLOj4yK/7fl1RamVsd7VL0eS3Gp+rcqkQNm7V5ZCKDRxHIdDPQklBVMqKUSCnTAtVd
         nZew==
X-Forwarded-Encrypted: i=1; AHgh+RrFHuHRSTBb4Dhnw6AcdwSK46OyVxayUkJvTxenAOkbdgH1wzyv+PU5Kh1/P2Lts3DaX9lhFviFNHWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMKXnY7j7Ewf/XBrWErbzSGw85b2xOqugZ+xZqhXi6QS4RtgM9
	OurUsGn9pCnQnq1Vq+KtHAF/rJHKWAjhoewyva66cZj0ni3vgufTbmSKj84dvzMVq2hvbvC7Q7M
	X43XdF0D2d5MIqghHob+tuAqgtBrqpCoi6ODqCJvXG5NfVVEMvhX6ugmaey6PioWs
X-Gm-Gg: AR+sD11U79V+K/Ru0Kd3MhIGx17tL0KPMogYpuNzeAfAO8bXdoSlnfq5SvGE934BfrO
	XgSI6y7nPxf2bnRpu+QC+tQF9oQgWMdCdtkFr/T+mAOKT62l1TLZ0fQOQlEok7WDDQDVNIeNQW9
	5bWMxyBtPMa9RtiEx/m+vwAXdsvVQag875ryVWjZ+yOuDrxEBh16Y+JajlM0bLpO/Z4zHEWx5nK
	3WonpXQFAHUAL4fsjrqdhBV9s+VuIs4X0QbNE5M32gGrREbbEQlAHvw3fu+PN5X9B3lWJMqqf0X
	OgsNostJaSVnYMFuMWifdfKegOEfZpd0CyIcJJrd2TS0sEHCGSjBdWSishK2Xz/I1UN4GZAOi4v
	x8KGNlk2JxDr9qTpD1G1uUME54kvgkWCPwJnsNRb7NUChnsvaZ8DzYuubmnDsbGsf8Tpl8t8w+l
	r1kG/2XWQ3OBG4mbud3kHtRb1dlOMuNX7sP86Sl6Fgye9CHBKfE7WB
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id d75a77b69052e-52b384abc72mr32752111cf.28.1785427244814;
        Thu, 30 Jul 2026 09:00:44 -0700 (PDT)
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id d75a77b69052e-52b384abc72mr32741231cf.28.1785427237652;
        Thu, 30 Jul 2026 09:00:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:31 +0200
Subject: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: FggyaVef_Xo_0MD7KrRxCG4KxMTLPaKY
X-Proofpoint-ORIG-GUID: FggyaVef_Xo_0MD7KrRxCG4KxMTLPaKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX0QxXI0Z1qmgS
 rU/NkL7ZveZkMqJ4vSMyimBB1x5hUwdlqB/XY1lNVLlS7wfQ/ujUmKr0pE3MYcetb/SM+NWgnUc
 z+h2817rM3NcAyY6R9fZOVaOfnDm+/04yt6bMJ7Pu34FJOuwk9OBPRA0a0lFz2QzWh92nkYnBiq
 XgljfuIdN46qm/2AZRzViKHatsXee7sTkekMu/0X/ITsxa+qWANrvfNEB3USq7nOB5d6phkidSh
 9DXw9w6m6UYLUpfZeOfJRoioVdopNALlPy4+1jtEI5t4uyEl5QDxQCfEgA+kw/Yx6tq5Qy3fZB5
 WE9OlLj7IXihN0MGk6OwKw0C2/UOK3Ic3JFZVLzWkiklPoAT+F9CzRTua4clEELrM6Rhk68jGJ9
 kv6xx0EkROIMKTxARSvWksR+IJ0eVeIi5wmkmuanYXSfCWezPDJnkh6ye6ab95agGM4iI48D9m+
 cxjfg7sZhSr0TeoVqdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX9Men0xHC+5C4
 NKllfpYs3UJ4rpV8A/d2dyULBswcLuxTgWmNPEdiwod+k70hXi3/Pbo/u8XcCyCS9nJPkvQ3GMc
 puJr0kMO1qPhyIx8PBlRYe8geiME+qI=
X-Authority-Analysis: v=2.4 cv=MuliLWae c=1 sm=1 tr=0 ts=6a6b752e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

Allow an eMMC hardware partition node to describe an NVMEM layout so the
partition can be exposed as an NVMEM provider. This lets a partition
(e.g. an eMMC boot partition) store device-specific information such as a
WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
cells.

Accept "fixed-layout" as the partition node compatible, in addition to
"fixed-partitions", so the layout can be described directly on the
partition node.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b58a5fdbee218358 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -38,7 +38,9 @@ patternProperties:
     properties:
       compatible:
         contains:
-          const: fixed-partitions
+          enum:
+            - fixed-partitions
+            - fixed-layout
 
 required:
   - compatible
@@ -86,6 +88,25 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-layout";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                mac-addr@4400 {
+                    compatible = "mac-base";
+                    reg = <0x4400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+
+                bd-addr@5400 {
+                    compatible = "mac-base";
+                    reg = <0x5400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+            };
         };
     };
 

-- 
2.34.1


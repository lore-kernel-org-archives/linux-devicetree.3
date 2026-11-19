Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065219;
	b=xzXLWxcQYG3RpAYXQsJpGT8THKK2cQ/hqoR4UPpKS5z/NeNmxKOGhSoc3EvDb9BxgNf3
	 wdMxFcML6g5IdA0pnWDqNrKsyN5tuBC8UtqjJc6y5P6s3tl/qtXQrh5d+EG6JytO527Mo
	 ok93es71YXFxYapoVgS6xiReN7m2mgQcacV2vMkVWTkN6IhenXLBTLUuCOXWqca33Ya2P
	 yinbJ73UHSrTuvFEBhZOixABgTaG05VDMEM83AxwJFADz7Z4nqCuUTM6ttLyrv4/09tjU
	 GlZaCPArqaAAsGLeDZ+Fw/5ThTxXiae9ysHEZugMOIpnooLnmc18YGGfcsv+Pg8G8gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
	b=In2W8hHgFbfdWyeLzjpOgOuorLA160VH4NMcbas9qZPbwxp5IFKNQPBok71UhkkXooGt
	 0u+0WgX1L2s/+i/FvjMO0GeqEfqV7neLA3O3XevpAUqW/1I+CpprZZDrZIx5q22dgy5SV
	 wYqmhTI5ChuQKu96dyNsbNEhdoar0EnqsVvmk4I/mzepZh38ree8P+YxBMcjdKeYECdWm
	 6nrN4rVIW0Az4tCkkEQtH9EbJApu5T+55D6iO8ykqzphv98PqPnA2aWPGFewIUiwox/fX
	 oNrxmUKf9CcoM7B+5rojGd03S6Bb2W6iZ7qvTuEhCu6IdbQ2Bt0mDh3nseO2PfYEbdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gPG2qj/e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK9eUgVV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F978606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F978606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gPG2qj/e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK9eUgVV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AqbI2188507
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=; b=gPG2qj/e+y1JI1Y3
	aVYT7ZDagZLbG+jsOohIBnb/6uFw9XSmF7zUet8qAZu3uM276S50aGW6p4GPidoE
	IVdaG32wZ8LOQyiTbBqpDLNZj/PDcbXS8ireBt9li/ChNMquIC/9CC+8XR8m8TBk
	PLUtZeb6vMEMHXCF2063wOYPP/kCPvTNgufLC36I7efbhho+JS3huFVrqXrhDLG9
	E+vMiVtzi5xEqxQhqEHb28MiMJ//nU1k3cOFs6jPPtrSzKZ3xjHiMMUh/QsdAary
	ake8Wbtgy7H9cr7jvsxwOO4QmE61kRXIkHAAf28B8SU15qVsx6ph4orckXklS2ND
	Hfzpyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ejjdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:13:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed05900df7so16322305ad.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065218; x=1795670018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
        b=PK9eUgVVWbsfCTaGzOgFqXcCUx0G63I4+a8P3opRW0MHlApndDWcKbAwyzaMyvSc1X
         R88oeMt6tlKGkE04bQQt9BesG7ePeRUD+QDYMUc5iStew4B4IYvnqxAhCbMZoQzwn40z
         QLo5xThfjFQ6SbMkkep1XRlb7kdSJrrZp/vkfc+h5LTHlUpx6Mm+erlXyLqiCFr+qu/y
         nSH0sRDkGU1tXPJsZ8YCp16/jZzD5VTVhnxPZk8pLUmPdoSZhZ4X7rKbU6Z3wrPdfkOZ
         RI5fQ6wC6Tx0mnVQ4s2bQ2f/eihLIB1c7jz+E2jWBUFYSVbfXKnEae0o6EMX7ZIHVw+A
         +vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065218; x=1795670018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
        b=CBKInvy78oERzFu3WlaNDebS7DJOzL2rH1HcbFsGghK/n39FFZNKbs6bqiGvchZ7AW
         FTt7hpgWMIORLNBhCFlngP8zVvmMSCLvqgulWxkZuqiwtCp9na3hJpTrPUq3kcg0UCGs
         emDi6Fku88iBqda4zNTSV2VElQEw8xeUATBC7xRwTG7mDJ1lBR2I7Erh+Zpi2+9KXdiZ
         w0+NMh01FRcT66qlDzEojvu+Cf4n06EgZSWeEoh9ySC6cbwNeSFZl4YwP75BCwSneOyQ
         XS1cbCDQDpUrXaZqQ6lqWPXrB4z3vWj2BngWozo5dyK1wblBhOF3xQPKDHHZUApVBuot
         bxSg==
X-Forwarded-Encrypted: i=1; AL+hErEbbNPyQLqZ2X7Kq+HSH+EMN7Brl+7ddbCWlvFPncWmZRH4lf4IBJ+vN5D5n0VYNHp0RP9vuJxktK9B@vger.kernel.org
X-Gm-Message-State: APuU4Z9g3ySB56HRR742wtWkIckpyoyFaWWe1CMULb7qj9xTlZXsV0qI
	cDN4kuefaZbUNteQIYE6Yi+lffWX+bGVpZiG0KHfQAMWfO3cr9wZKAaAx5FIMD7ZUpkJ8fUSAFC
	Awh7M83H4uaPFcULtlKZ1ZxDJzmTGr7hWsg3yDk55Ydnb6UouCHOCTL52Po49JXxE
X-Gm-Gg: AZFdTZcf5KSmz1PqAPrzO9BfBZtkq3MpCHeLPvGzpPn3ci47hkTrEXfV9pX7CsnK2iq
	7Bgc2488R2Kgq+/u1XRKlTunqQw1jweToaqf2ya3Nrs5tXbxWWx8CCVWyCtAs9ew38TACTy41T0
	wU06TKnmKm/D5EkAYwLFDMMyp0m42yNNmW/YRSsf+5kQjazCtD0zVD4SJRxwsGJsgHbMae2ifsL
	TYSrVcLdR1VPOdQNtHhkmbgdOEvmltCiN4l1XS4AByjP03MaILY4G5Lg8+tYm5ZVLohwPyyQLxi
	77/tWkHZ+7oIxC/0+lOH7C5H28Xj0MNDG4YrUJtDx7JWtgkOEsQX7ISZv8Z1PkhGyViAagvqJ8x
	tRrsvs504x97OCjaTHKVen/+Br+K6FTpfZ3XsZB+Vyv0gjjR/AzkGUug2xaF9MfvwcjSK0Wo6OK
	vu4qXOC3Lsyw/LcpAqV4dkm5nN3YEPZq2C4lg6g0AzETkxkTY=
X-Received: by 2002:a17:902:d2c7:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2eff752ec1dmr51306655ad.46.1795065217782;
        Wed, 18 Nov 2026 21:13:37 -0800 (PST)
X-Received: by 2002:a17:902:d2c7:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2eff752ec1dmr51306435ad.46.1795065217360;
        Wed, 18 Nov 2026 21:13:37 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:36 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:24 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits
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
Message-Id: <20261119-add_iris_for_maili-v3-1-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=1484;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Z4w/efAzsLElawBC0itHg6/jRqhONxnL9NTi97sv2Sw=;
 b=hk9Y00LCsEcX8bq6mIJrgePHBCHPIEcDLByixiBwPAQidz2O7Px0J65BDw67MCnbQMmulFC+Z
 asdb6XZuSTbAk6/cY8s/1X+VsBZZUoFPe1Evwl8IturuKM/ixThtEXh
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX1rD5oD4jz57+
 vuOboa4VDe2bN93xtR9C6wuK3+oUNsevaVZUvjHMf6j77XR2mU4A17JBtwI4e1edub0VKyN+ZrS
 cKGpNk08TJAFjNLB+NCdPeg6sJ7JxDIdw2TstBc1iEAYEraQe/2AqPjUjeTPdvOASEqRPcghZ5N
 GWY07T8ijDs2VyKdyufEzQmXlSsXhLypOjuNxWAoJleei1QENNGJam11a4YBWC33+DjI4+z4xa3
 CRqpbUTUXqhy/vI5bTphgLmQx1YQdsR4E/527GkZKuKQwWR6YiyGj+y7XNb5XiHM3U7mfP8v/wH
 5jszUrkWeiGRVKzooczV+2q2mhQCiT1mIlr8yJdhXD1LXdly235SlKgZVZOO9G2SDv6NOqYcgBj
 kdW6g4WMW3IgY4i+dPWWcR7MCJY9NigH7VqMic/qq/jJLD7Jcpk4buufAg9akqqLDsUj4FZCVIT
 RbR96p9+tMvv0fXDb9w==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afe8582 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bU70FM4okQI4sDxEiZQyQDzp1FibP-ZD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX+WYBtHRnUCV9
 6oenKE4UG3ZntmCz1Y0x+MgjM16q2khKzBBq97cqPTq2ihZM20sEOWfZiJOHcwrjf0dVop2dlGJ
 Y5fy92rNO5makd3KoFB6G5scZWpiMu0=
X-Proofpoint-GUID: bU70FM4okQI4sDxEiZQyQDzp1FibP-ZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Upcoming Soc's Iris4/5 video codec requires more clocks, power domain
entries and IOMMU mappings than the current limits allow. Relax the
common schema constraints to accommodate it.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 6c205077bea4d729335d7a5690a57bc1bb43ed9f..48f2bb5eafe3c2818a7d361b9e0459ce656459a4 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   firmware-name:
     maxItems: 1
@@ -44,11 +44,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   '#address-cells':
     const: 1
@@ -67,9 +67,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0


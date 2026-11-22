Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363767;
	b=jWI/Of5Xb08xnO4tvzFpbN1PP/dA+H+WWNxzo/rUT5QiAOjIZpfA9D8F3+mGKFb9fqH1
	 8naiGrKI7SSrPF2InYP/nuSMM8L3TGski4GlnyAULfg7+sTKV+eNt4MM1zGJ68xNGH4pH
	 eW1/Ovu+LUVlArmId9pkZbLyNSuDXJBKdTJ1oc8Q2vqLdAhoic4cXU+ihxs4199pp+qEr
	 hsMMXiW+/G2h5YbNOCB1MlWUW/4PGzYUswcATysLi6NJ+ID+AJnCHixp/d5FOXl0X6TNe
	 +lGCoYGRbNslKM+wiXpZBIchIGjF3hCmq16rcY7GpVzB2yua4Lg0XBGHXxnRtU3BiMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
	b=CVs76SV5AMXy7u4OI732rRKBxkGx/66YGppPgxKcfbsttGcPUFLklZmJnevt/wuG7N3W
	 EImKA8VZgAIlLdoStqz5KKjieYhU6doMCX/pasztMIEudG2UCGQJzSYEVzj6PAbDQS6eG
	 lpGprRo9L2qi2Yrqg+AqAoelbMDbrF1Y5M/FH+Q9YexHGMu3O2kDldRTmS2mzrjSC4+ZV
	 u6uZXiBt8aOYI4S8kR0fPhzyynwH4bNduPsxvVdQkUI2pb3Rbv50Y5NuTRZZPvVwkcymz
	 Wdom+cu21coJvBmw8S+zbbHBanibsMAGAvIxixHw4WPDIl+Ja75jWqwWqj1i3yA/ebA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo11p71u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ohn6LKTA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08006606A33B
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08006606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo11p71u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ohn6LKTA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ8XR1854206
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dyOk/+hQC3d
	S2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=; b=fo11p71ugXj+px95KD0I3tYDbTh
	yS9cS8ycCi2GiMgJ1j8GedN7CBzMcbpWS4qXCxe2NuSKyGHBARcGIzocsdXToWVK
	y1bcpA4Oc+uIVfCp5gmY4cRwXXK5FO1izXGR5WE+KUAnxFEdgYpa4D2VzoemGPUx
	9QP3WefnhdCgec0yiiuJ82z0On3b11VWyTGY2JB89i0LnBcr1Wc/IjF+CXBN3Pq1
	jlNK9H+2KMoKbuQVcYjXnaIFiIDh21fggm42Y5o87jwDTYfvqiSgdNMMEwexXVwM
	htEp6POXtjAeln8wZE5NSqMceJ+3UgJjSlAUFW1XroSL2K/pTQ4etxW7wqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:09:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so467668685a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363765; x=1795968565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=Ohn6LKTA6BqWlHHewDtQ7Op8x6hmRoFhaIJODQDqQFArqnHYvGawbPNDi1hz6uIWEp
         Z8V3Khewvqt5f1RJH4x83wTe97tjMNhutdFvXV/l/oVh+AM16Nx0lSk35BOVGhBZ9c0/
         OwOYYxy+HHy7EB8utYXheQBKuNb0FfBTNbHKSs9jLHXux4+F5GIrHP+vW0IBr79wjvSe
         wWJi2JsVkchgRhRpj5SfgiJ+raLyrgIubu+aDtbmgRx1iG8q0rnFPCv90Tcghy/pC9jk
         EoBdxMqx0Gd5evRWmtwTF+DKMcxge5cqkMn/TSzCcFc81/D5nLJIKUsbbq8b5Zc4pSq8
         QYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363765; x=1795968565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=P9Rh6GsyqpVXU7UL6jZVwsWxjKXeN0lN/+QfSI4DAO2/0Cj5EKkg839mXcTvGQBvuP
         TqvoYrncna8bUKN0pkWRC2MG+pUKLzTqqnTQUjrqw3c6kCa426/7aoyuTSRzRue2l7mf
         ViTrKLrt89LoOzazYFtIbqu4C3mVNFsy4Bt4oGyKtQG7NbF+rgvAH2Rs2pc/TpImuG2f
         Tjhia6gIQ+G79p/gEyKMQky/8KzJ0PyK/CtrqcvzltVum4YQTD7VIpJ32mA6QhGtmV8r
         9oCqYK3PBEYGSu/yC4SmYnKI4RvQCqtj/kV/zXCSKRivGnWI9cUiho1BrOBSthIT7cWf
         rirw==
X-Forwarded-Encrypted: i=1; AL+hErHeUlo/D2eneRNcvwZVKwihlNq3Odp/qaKoFuQ4WSn9vhW8qE5DsjP5GCztvUat461DWFRTwZKLifUd@vger.kernel.org
X-Gm-Message-State: APuU4Z9tWOrFBDjHvaz2nmYWm16vFi3HTWu6bnhdkCcc+UgxZw3/Qrdx
	pQiFRgNGPHA9RiTfa1xvWPqoqmdCNcKZExMZWgWS/qvDhhrBtSMDMr1EC7rRukQadQEpJ0e8Zl8
	FU6Q9MLJppR7xGnC8EPbmKIXPGpqjt/5T0AKMArnf48+U68659PBNDhRCDjSBAZ8r
X-Gm-Gg: AZFdTZfesmc4A5hRXKwcAzP+HUQItSfQqNig0LGwBLQBsZR6Hd3qesqvfpsEQK/3eps
	iMBRYFpFlLWljLV9V7HCe7nenxPZQKj3AEPYQ1bmQO2oPZ+jlG29PfP+vwh6lxlkh5AXcyoyGcV
	eotaCvzmIzcN0jcmoVsYnTgUZjDXQPJuTKAEbEhZn1Giy8GslkWKvcMlxIsJNsoHzy/mzyOhX+7
	XLGW1Q7Ncpf01Gqo3+qSi1bwS2EkICOk/ybqn4lrHEiSxpaGxWsLDH+/oRU+EB/y+Tz9kUW/mWf
	u96XxuSd2P0Ij4IRz6bd6pDBY55CfJEf6ajmcHLjJ9cAJaacvyxIeNFhHlL5fUwMSJmHCowqDHq
	x04FlnX1GBeuzp6iaz2NFvxllO/Lvx00754e8sHUqYfR0g/lY5EikxMw7lng0sQ==
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661820085a.1.1795363765090;
        Sun, 22 Nov 2026 08:09:25 -0800 (PST)
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661816685a.1.1795363764668;
        Sun, 22 Nov 2026 08:09:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
        =?UTF-8?q?Jens=20Emil=20Schulz=20=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>, Marek Vasut <marex@denx.de>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next 2/2] dt-bindings: net: dsa: Flag unexpected ethernet ports
Date: Sun, 22 Nov 2026 17:09:09 +0100
Message-ID: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6422; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=reMATxFxVxRB+raQ83jYfeaAK2V6mtUNc6Wp2ta7pEM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOkOJWDsz07omJXLZhaMWPp6woHPL8+pCClu
 +kZC4bdMluJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTpAAKCRDBN2bmhouD
 1xQIEACaFedbtKzfFmbnBJcFU8CEz4FyuAcxxPgxdFqxRqpIg1xHeRGybC4E37WJVdFmDXL+IiM
 FZdr8VzQM8M2DA6tywEWp/eKIa0cZKVKpdARltyyNDRG/YtWqJgjc5BMnYxsVAqb7Vo6kjQr5Vm
 9nVSouM8M+29Ue122ZMOG4/rUOQog384qunka/dtrk8IysLT+e6UvBvHLsiPuA95hYzqS9KOVzL
 3VHZybyVb6e2m2Y/r7XzFzlhR5H0EDq7gJ5NJy8MOG15tAcJ+TU3plPFRbtBjkSOB7i8Ubysvhr
 xUQCrae3P5pSL4fWowBqQNdGvP3fPkhgA+w5tyOvHSAdCed5brmxQdvHogqCW4+KCWT+PWfpMQH
 R7E1iMnrzjWZp2X9SbexuwXUPfw2orGQ5jZJslTL6ODd8dCeVJ/YuYRvCAVsGKviS5w5MsmZY3z
 r5KeZ3KftGG2iI7ViBELF45gUtCNed55Qf+zyf4tmwZzBmPz7BisgagXHW2QHhCdw/R6L3sid4m
 HnJPr8+IH6gyV7s8rtUJVLJImgJ495iS9vziAi328myZSRS3NjFllSR3IYkdwjgnXOHgWtYTbau
 4GUlpviCm+QmtNUAHyKzm7LGUNZsQzrtIigRBlx2oqktTVRCSLB7mGcLj6/GlI8SrWpa+q7CJCW LmkHerMGT7PwnEg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX39sIxoH4GXci
 KmrTj2z+WcQMe5nTDgUN9eU/emN3+cvB9pM+tzGz63sD0GZdFJH/QPtah0eoeaI0eELZJEKXibr
 eZbXGB7m9smJgpHz3nTvCc5FWgWWOazkEiLC7uYIYvCS27lpoeeY8KmsHZwpc9V1wuqVOnzpH3C
 bzXKzZUPnkEG090y7ZvXBTlyX14mGNRE6rF1n74K1h3kH+n5tqGIEkMJBRg8FSN+E02LL/ovJKL
 I1EGwSpe0fzbJQ7C+yd977tACAUNPgJiRB6JUAVcDpM+Hyx7bwKmgeUwI9OYg7xQ3M0bcAY3mhB
 z8lFFkURfkW5PHrs+YhiiJSf05EyKv3INKDx2DBCdW7OKzt3Wn1ITJngCR6QkvK2rFkcHXJ5ds3
 UoFKvPN17a9FrSfJLKKTXNjOjDIpU3PVoRJB2x9O2y0cTWoYWU7X0UHuvCBvkMbsvnb/8zyk/t3
 L3yizXa8oN0arC/aJtg==
X-Proofpoint-ORIG-GUID: yAYUYhkLYLeD2sM-waaoDGTjJDWzsP3S
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b0313b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=DPh3dRPQxyF78rqZMbEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX3V4tYUYrE9qM
 l7vJ301hLuOOChsD+cingcHLol1ltI0puaioP0gt2UGjIligU1mQdvk15p4HKaWLjVpye+FXDb1
 JAIdMtmek2GWk8VAg4sJlmNn7m5Db60=
X-Proofpoint-GUID: yAYUYhkLYLeD2sM-waaoDGTjJDWzsP3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Bindings which reference dsa.yaml ports and restrict their own
ports to specific subset (e.g. with pattern "^(ethernet-)?port@[0-6]$")
actually silently allow ports with any unit address, because they use
"additionalProperties: true".  These additional ports are incorrect and
should be flagged by the schema.  Solve this by dropping the unit
address from the pattern completely and adding proper constrain on the
'reg' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/dsa/lantiq,gswip.yaml        | 4 +++-
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 +++++----
 .../devicetree/bindings/net/dsa/microchip,ksz.yaml       | 4 +++-
 .../devicetree/bindings/net/dsa/microchip,lan937x.yaml   | 7 ++++++-
 .../bindings/net/dsa/microchip,lan96455s-switch.yaml     | 6 +++++-
 Documentation/devicetree/bindings/net/dsa/qca8k.yaml     | 4 +++-
 6 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
index 89f78a1bc113..83cdd6c80d09 100644
--- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
@@ -108,13 +108,15 @@ patternProperties:
   "^(ethernet-)?ports$":
     type: object
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         $ref: dsa-port.yaml#
         allOf:
           - $ref: /schemas/phy/phy-common-props.yaml#
         unevaluatedProperties: false
 
         properties:
+          reg:
+            maximum: 6
           maxlinear,slew-rate-txc:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1]
diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 90b3582b7619..80cda7ec5cb6 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -179,12 +179,13 @@ patternProperties:
     additionalProperties: true
 
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         additionalProperties: true
 
         properties:
           reg:
+            maximum: 6
             description:
               Port address described must be 5 or 6 for CPU port and from 0 to 5
               for user ports.
@@ -208,7 +209,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -220,7 +221,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -246,7 +247,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
index 4ed13870ed3a..9cc14aa7b4b1 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
@@ -129,10 +129,12 @@ allOf:
       patternProperties:
         "^(ethernet-)?ports$":
           patternProperties:
-            "^(ethernet-)?port@[0-2]$":
+            "^(ethernet-)?port@":
               $ref: dsa-port.yaml#
               unevaluatedProperties: false
               properties:
+                reg:
+                  maximum: 2
                 microchip,rmii-clk-internal:
                   $ref: /schemas/types.yaml#/definitions/flag
                   description:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
index 9973d64f15a7..36a7c81df747 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
@@ -39,7 +39,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-7]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 7
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
index 517bc4c00de3..17e3c00f5a32 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
@@ -105,11 +105,15 @@ properties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-8]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
         additionalProperties: true
 
+        properties:
+          reg:
+            maximum: 8
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
index 167398ab253a..3840b336bdb9 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
@@ -75,13 +75,15 @@ patternProperties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
 
         $ref: dsa-port.yaml#
 
         properties:
+          reg:
+            maximum: 6
           qca,sgmii-rxclk-falling-edge:
             $ref: /schemas/types.yaml#/definitions/flag
             description:
-- 
2.53.0


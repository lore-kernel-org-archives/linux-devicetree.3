Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC7F438038
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827839; cv=none; b=YwY23pVWKW8QLu+Rsj/2lI5pQXNsunaDHaLLOnQ2YmhnC2Ba93ZcMWFtqwDzyfCrtWKQFhmREd4nVvotwC/vtNV6RU5UMrKo2LfqcOVa+P+l9UORcbL5MRNFs0PXuW2GMuPpjxe936MxtKQxUAhaqHPgRIyhBcv5UDxCKQzQP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827839; c=relaxed/simple;
	bh=QvBv95KSm8SL2goH2K3maE3l+qVg2d99K5h/49887Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfKOeWntACkbiWRM9PWbxbLvX+5tzhfLdLSEOd0cPVKtfgCpiSZO8rVYZwmBHy2KjLXjq22ozd+8qy1Rc7mqHm5b4VAH8Ea0dkAL6ScSTzzmDZsw9lpL4gZfvcTemYs9/oRPv0RsaCaBAzzUk02oiRKPLfihiNkxy0jwFjkFAeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/qkmK9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgzTvmfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/qkmK9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgzTvmfu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67429afO2203606
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 07:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZgjGdPbFOrBvAZPDF5UtbgM8THHmRWT3MTZdAtuILgM=; b=B/qkmK9YpbI9Be+Q
	02N1LubvoXLC2uEtUkGyCiG+yCpRwKjhtJNMz3gyk4SRfdE9Pgl30plIQcTvaCeH
	WgcLCHFvtq3TWA04EzutdM9v/k6BrkpEdWvpHxdyMkqOdbp2zpYnb5jNheC2wulR
	2cxw/mDbI6kPLXFO+P98Ys/eQiGEXMPCE8fL+Fg66p9cvIIOQ1CT1h3cgC8s5dSv
	E4uCR2Jn++QaKJO5OfGklGmtoMYNNIuCl/ZtncOGgvXLG8sejVnO6PvNi87AT9QS
	jz02JgV/3chXPHjQZhrwyjg1aQy7v0YeZgrUN+G/QT9yXVMsm0nFAnGbe2PVZFWd
	p6oEOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu72713fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:17:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283fa0656dso9384921cf.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827836; x=1786432636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgjGdPbFOrBvAZPDF5UtbgM8THHmRWT3MTZdAtuILgM=;
        b=JgzTvmfumbS0n34AnBxy6LOttUBm88kn8n2y96TGxIsxgFZAzYIuLV3X1W53wkbCZ1
         BVEW1hvJxZ9oWbMDp7RqIJKu1BScSdt8sa13cB5QXfTbyp9AOfuXxKOL+E5zvi8Zb5HB
         i7pIZ2mYdZetD3KBcWvi8XxT5uIAPIH5Muw30aZwYWZBBJZwXWeleRtqkW3LBtpx9veU
         3qoQQ8NWayLjq/scg8LKAzzU1DxjpupVbeygbVPbS2Q0L92S+rquekB1Ip3eQ/fLe3ZZ
         sRt6dxvnAOO4Tg8bzupgEWGZXIa/bEZbVS0ZTrMWp63WJ8OPQlvK+Zs7vjicHgDDBjp+
         s4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827836; x=1786432636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgjGdPbFOrBvAZPDF5UtbgM8THHmRWT3MTZdAtuILgM=;
        b=VlBIlZDD1l4RToPbpL4OdwvLN+5mL9NQUqt8DuBJ3txRdMhT76DCOSHomAT6f+osZx
         Cvb3Gkhz34eQKz1dpr9/z6M/IeLpn+/44MuvlqpgWGnhN/XksYgu11ecS8/nwli441c4
         KL6XhpG52QNWh6CLpVo4OYzbI22LB4JEDODbahnV2lN0mgDHoy/1FecHhHTLd9BbsHZD
         kxefOaLsWZWjC9jsxfTV+hyLmetj5ZDHYrTNZp5zK6t1fwb1PR0nJaa5lPKNs6BcGP3K
         cjQWRDqWq2UmL6Qa9WynCw9YmgfKBdHuwotGDdCN9NrdriM/rGrVoxSpeYr20a3PAGJx
         nn8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro1U2nRbWe508DKS1ZZFYHi8K3ACjAqghfMDm17BU2ddgTPjT4P1dVOI0XcJPlrtHHxwdB+9JPggJHe@vger.kernel.org
X-Gm-Message-State: AOJu0YyqvFC+WBcIrTc/YxcVu1Ww8OTpPuMVUhGs1GJDWFluAP9u9kvZ
	wdGSLELqrbxroeAzjvqSypvgATnCiYxDBLnYCS2j74O9TnaFc4QPpZmAhefV/0yN2VMVB+UlRK9
	Qi3iVUror4h4cCX9+oscSOsF3yRf40MYrq+C4nKevb652ZIY4vpfrnlLmtN5SkO1c
X-Gm-Gg: AR+sD11/EX19jafax/YH+xKprILFQmr0DiYjMWxbhVhqO4381BUmDwlqXKSO54Hqye3
	pjWGYKuSFVyRxMAAUPLV3+7fJT/xUbZA4Q9yjamjM/XtKBCJH7vR/UfmYC+iEaKA/APhfkXP0nQ
	m0euwD+2E5teQjdDf4fFfc9jxoFIwp5Zy7X0Pz5DFKwEaarOblbG5AsOlXpw7AMfN/EdDH3KRmT
	csLJ4zKDjKddzR3pA6ohbqoLgpUiYl0mfR7yHJPN7vMjqgSV3R+F7bYnOPzb42AjBTM+XDC79U/
	TNRM6uYDwweAWlm98oR8ofeF7BByW5LyALD/ZGTPaXEpVKLEO1qKRlLgSo/wPTFSGUpm3/uo2gA
	/efB5BVTgKSyY2zHWLi1fHQhF
X-Received: by 2002:ac8:5802:0:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-52cd353fcbamr43688761cf.12.1785827836500;
        Tue, 04 Aug 2026 00:17:16 -0700 (PDT)
X-Received: by 2002:ac8:5802:0:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-52cd353fcbamr43688401cf.12.1785827836136;
        Tue, 04 Aug 2026 00:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:17:00 +0200
Subject: [PATCH 4/5] spi: dt-bindings: spi-cadence: Drop duplicated
 type/ref
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-4-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
In-Reply-To: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
To: CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        Vladimir Moravcevic <vmoravcevic@axiado.com>,
        Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QvBv95KSm8SL2goH2K3maE3l+qVg2d99K5h/49887Yc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHuZRAX5vP43ZFkZZlLQewkCV42WR6ypgeVN
 GNZxrY2XoiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR7gAKCRDBN2bmhouD
 178iD/9bjlLQN7VCREG9hHKpqvo7x0FpdQs/jSs5UwEx86EVo85cZ3LN4KF1IhphaMVqqB9BrUG
 rx+yz8Fjvy8HFIRc5SlRwaqojtiPkH6/HsLiKu1jDMDWZQvSnWG1+KCTbfPef9yPYkjQ9BLkW5s
 76VfxpaM10lL8JqXplJu+iqGcLGwJ/tkNXixYW9awi16t6AARc4ONZDUTy/FXC6+/itUEqNH9aq
 22XbFTNflcyhQi+NeSFJYGMmzVnrrp1JOgwZtjlkagUVHkDLdq5YI36JkkDVWQqb+f60qel3ts2
 98uaMfZfsQnVi1ujKZidhdiWQaidB+zbMsAuiRmxZZ7YAcrwbLh0dYRmQ8HTMwDDMp1r8+yWp5h
 D7u31IEPja3WLrKjfaqnJmOqLMcokK3O8gevh8KxgJQARzoPlFeNTMxg8Wu3b7arl/gFu2p7hwP
 mAAkGbO2lC9AO7A1wqGGPYIORqeawEESTMw/9QTy9w9wujjiGl3zIyS5wUfkWxsKK+dYqwjfj97
 FCxKc/pKlPn2NTUGsE9SZXxtYBqqUsFP1acOCVDSgRHKhCD+HLuMJ34mmyrh3FNZJqjT3jT+STu
 5H7G18cmshN2t6eL5YicM8oReh9zYzsnpSSHGlOrHkfCWcPjzirRt8CxUybg6qmx+i8J16x7RBr
 v4f67HAw2yTC8hQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX0ZKNWV1aqTlC
 N4QAIbvVtiSTpVnJBc54G9si538Z9g9lCaJG8fE28r5PIZwcI9mWLfyKJXf7EyHN2pe0hswLXOD
 j/8kCgFM088hH6PUctLq7GfhqxZZMGQ=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a7191fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tRHPAiqlqGnVGwjNgokA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WmiSQoQ3d4XITDUm2c9Uu2Gj0WxULmGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX0C5oDyjnpjBy
 aEOuRXNJXO0Y+6gCb641geG86Q9LYwIm54RsTNuaLud4L4u4uBrZ0TsRiXTCTQolKWjqh4/Anzt
 OHlmUIiM8xGlCHiYsyZKcC52E9zOeyAJ8a41BvOU/h1iO5N3oV0H2f/OU0iSYE5oFL/TzgPO30b
 Yv0C9V1lB67RI2pBepRXRDpWglXPoZDp/XNvmmJSCSD2QQhPMq6P86xkimhj/5jKTtgxwWUjISa
 mchhE7ZEIBaJeTU2jwPfOGkq9ySgBCZN63ldEdBtUaVezr1k4zRPblrc6Vkgp0lcc6/liKtv43Z
 HRbYv/Qjs+RpBraXyu/5lenjAGRq7VOs8Xw/OdLxRCaEquRPZ/nwFYwA2ZmqDFOxXFycd27UzPW
 /1m7UNM8swrkGQCeIlqHouYad/ahBfB7yZZJ+JEVslp28QvntuXebL3Kf+jn1ILhhwKjLnSCIdp
 iK9O54MUhezKiKw+NHA==
X-Proofpoint-ORIG-GUID: WmiSQoQ3d4XITDUm2c9Uu2Gj0WxULmGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056

spi-controller.yaml schema already defines this $ref for this property,
so binding does not have to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/spi-cadence.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
index 347bed0c4956..429cd824156c 100644
--- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
@@ -43,7 +43,6 @@ properties:
       Number of chip selects used. If a decoder is used,
       this will be the number of chip selects after the
       decoder.
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 4
     default: 4

-- 
2.53.0


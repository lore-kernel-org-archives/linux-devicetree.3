Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120603F410E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352859; cv=pass; b=XCMkreAtdg5hyuX+oY0zNDSdyFavAFPv24qLTFNfec0+eIE7fUFDaoHpfu5f/9U45pCnHXgX1RDckCMJ1kWpq8OQprzJz/qATo0wj8kyE7pn43gvBg6fEwE7K9HS8uDIrKVslneHOQnXm6E22upp+GvmEFTheEU5VRjhve64/pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352859; c=relaxed/simple;
	bh=Gzhhv72ikGLNo6QhiVs+ZTxao79VR7jdErrXLz0bqPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2nZsH2oCRyhNhI+JWJaIs+Cxl54OWPFEoIyh6kTstVYyl7UHbM6tomom4bOYvQdxFms3yT6Or5U0uSIEhe+qAlD4hwMMXtntKrClBWdyd4V2YbHdeItmS/p/hE7vtPkijA830YVl7LH4bmrHiS7akHgB6KwP9TT5BhB7caEI0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fb7UTHsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4CYUXfP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb7UTHsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4CYUXfP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF21d956766
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=; b=fb7UTHsy2qV3f//A
	xMmgKNW5GqGvhgOJ1plc98d4btdiVlUep3RLCEgrqpyl8HDfraQ7zeQEvQFQCZwd
	3iGaAqVGF5tlBr2MDqJtoXi0YpHS6wZQ0IRnJUspHODAIOQVAhhluSK9OKCgVt+l
	qhNc1+6x/qjiH6O999ghpvRwUAzqHoXEj3LTZI/sTwa9flZNqalMGpywJIZ6JbnY
	wo/ee2r0fbuEtPXzn7QdwgXRffN1SWuhwC9wDLlUUrNu7YmGfikWUL7ruFGV4gn4
	2vysvBx/px7SlWDIHDSjUSpbJq6QCgUjXm1iMMxdChlWYu+jAUelbO5raXUkRkca
	7n4+Mg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usvup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:47:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f45dde7595so36650986d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352856; cv=none;
        d=google.com; s=arc-20260327;
        b=nJ+wVNwa8glL0WCli/LndRSCBANZtp6JxtI/4KNVBcNOcequLy2yTRNE4NjqDsiSC3
         VLH6FkpN06C2SujNjdkVDh2CtsxlqTGUE5ztIHMNarAQnk4QP0UNPW+BrDNB8W2tBy4Q
         maE8Lz5zhy31Y50i4gV9YaAV664mg7eyJ7DvlvVBUnCGn20iW/ik+xo/5yZPBXnhb8NR
         LBcbh6kaTU+uBNR32goIBPx2vn87n/+FXkqNsUiwfdwMKkvHlnzO5ycrbIuwkhdXVPDZ
         svtZBtfikh3lVU26+hQ/8lq/Efe4EAv84yco4HBc6FbVgI60ZZ+aRV0kZFSUrhmIPDBJ
         zNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        fh=PGE4WQbE6EY0rZj9qlxzZPovn2YLdThZzMMvxt/JL0k=;
        b=knxiyfrtE8b8kSPDb6fqQ/YBqp3scTMJUlylT3AaCNeMIiceFaTamGrWp7kHgxub3m
         dRqOcplivp5SXkSGtj5BXQd7+HwqiKydW329ruSLUIpelfCdF5qkycZM4K15LjJ5/NZJ
         pJrMDmeCjBfwfgP3Zv1aK69tq97lvsax2IxW+2EpovuCWJfnQB36qJWtUwEa3/Gg9U5E
         UHRGlfpoo/WtVs1dSS/k5h5lSzI7FoBuySEoBHsx3He2gFnRucj8CgMw6DXUdf0PvAc+
         DY/ObUGZYaJbBqbuuzm1jOULkn3ekZX7gzePH1ZksDNKX/J6U+FJMtvr5xzEXBE4wXYE
         EseQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352856; x=1783957656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        b=b4CYUXfPpTV5Fq+DJm0uFoosOnUhpSvDqkL0NSsx6rr5/8ymjMY6JHArW9zMDjnn58
         FkjxMJGxHzCTTNFNn4x8R2QpVLigrUSDR7BDaEnVL5Jm47Xkxn7CmbLNBN/ZaMR8IgMQ
         U0ZqsnkqcLdEEszp5UAH1adHk74BuMIiuXM+WiRmebwaRA0EsS7OZIeMTsfqOrufqROA
         o0cZUkY7Bm0D4xPl2U5O8PDb+PbB0b+uDki2JyS8l0J7dM748d77uudDrRUmc3gyVG9E
         4Kn74bDtGbYFeZuSDmkqSt/izGKkLNCu15FbCzv7J7OlxLIcsIRKJ51FPggVRPzuxGC8
         KGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352856; x=1783957656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        b=jA86RFSYU+2KmXdHfsl7d/eMpghChzMvfbwqNf+fkQyBj305CcCIutOKkhZWiUSQq8
         3bZyL0Mk5AvWnFcc4IlxGOA7BO6vdq7NVztq/zTz9QNdCpBoBcp2cMFPxDvMXtJfkib/
         xe971awuk5w1WUcFVui5sxsM5VBDK2GkF4mSEBj7XnLC3sfwurbpj56h/y00RXh9/Wdh
         86JHKLeXnfi+1Y5S13sVE/54zJoB5tBJ5MGeoBa+z+c+2Yhv7IzuyjD0WDSreEs2ledj
         TUrCxQi96uPAGCPLe4X+OZFyHIlnaID1dPo8B9FwLnPmsiUolyzGVX1PVqGXGkzyfHHG
         Mytw==
X-Forwarded-Encrypted: i=1; AHgh+RqmqxIgXNGUSDNT1jzmMssZ+28qQ9tZ1sYYSSaG6VO42D38wCH10D5WZlNdPbrEoqY8DGzMMSZlS9k3@vger.kernel.org
X-Gm-Message-State: AOJu0YymXiHKA1oPTnYpCUfe843oud/D/LJOP0yqpO54qkSDdvnH0RL6
	tUmsF6k4HxNCACJ+4O/05NbJLDS/uuC8MFUDEJTsZKSPy1oMLxZ6RcM3VuxM9cWNlMTwKhRR1re
	yq6y98YUjzYfa3rIelxRhKyvwVZqkGZ6QjUfnyRkU4BEV9ySqbrV8puApbnXhYYL3rUegd0QCc3
	TcuuoGZBC5/69i2WbjROempGnuBfR3Ooc+cTbTjvg=
X-Gm-Gg: AfdE7clSz22BYCP8BAIOkS78K/jToBZwBccyMUyg6GJoUZ+8SmzFeYKRAQDwrRvlk8N
	FS9wqj83Bl6EBgyCqPxzNWvUv/4b2093AbQz4whvVXWYzx04Wq47mbKTxZYf/eDJF2t094ryNzC
	ySddWdiU2OJi/tsI0uhHcrdcg6FbcJX2yg07Tfu4GYw5v/UQmxSzp11Ekibmo7gz21oINr
X-Received: by 2002:a05:6214:3bc7:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-8fcb59c6085mr13169556d6.49.1783352856106;
        Mon, 06 Jul 2026 08:47:36 -0700 (PDT)
X-Received: by 2002:a05:6214:3bc7:b0:8e9:f62b:8f9c with SMTP id
 6a1803df08f44-8fcb59c6085mr13168716d6.49.1783352855484; Mon, 06 Jul 2026
 08:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
In-Reply-To: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:47:24 +0200
X-Gm-Features: AVVi8CfPNJrEYS0E8R69POW_oPeNyXt4oUaNnxJ3KUF6es4aIXlmymOTBoUEd9A
Message-ID: <CAPx+jO-vFS+p7K9unKDtPGHMNNdS0Z6YwsgtE1cv01TxFmpNmg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Document extra clocks for MT8189
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: TOsdL4NEKuEkBggBKkk5bF5fnMJjXPXH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX5yeInzrcmrwr
 IlMKR0IgfpEA8qi219XjW/0TwHbZJNBc2JsqQek9vKWN/zwQJCRPKiuSXRpO+S2e6kFPmJp6leE
 licOp6+y1jA+/6ZBBJrrQp1UATCjU2g=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bce19 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8 a=6cAowrh06DlNpcgoBcwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX7RUarqJ7L3J9
 ChThwUZ6UbojZn2SrLwS88lDB7j0xs/gXaJQWBbMwYBP/toYiQwHstOb4Qynw1Wc92CHhEh+kNx
 vk1YSpFCDnUZXOb+7JZ4uUk7DVtSnVFQ0y2op/tEZLnTxz4iybKZAkVpf3N+RUx5HBrzTZNV4EJ
 HllkBfIHaXLLn7X7JWdk+h6velj3/d8ihr5N4CPzoVSMd0SIzWMtndNGxKujkNwfw9SRdByO+Ua
 4cvs37qeHdcQr4RRsI382ZPt9bECrQkPFCzLv3bFC10ybIY5Rvfuw3e3+/0kyrV4qaVmXI/N0/I
 iV6ExB4ajfokCtxJ1sE3TvrRj6ESoXcTmypewFJn6VZf7lR6skXF0oOoXc0g7Rk87HqFCJRw8am
 0XT+GSgyDMJJdpEhtgl6eeefmVkpJ//ftZ0M9SgKO0nFBOH4IStgI978rhzqyUOfxi+Qsx08g3N
 aYJsXfQPG13ZfAB4TbQ==
X-Proofpoint-ORIG-GUID: TOsdL4NEKuEkBggBKkk5bF5fnMJjXPXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160

On Wed, Jul 1, 2026 at 4:44=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> MT8189 SoC MMC Controller IP has 4 additional clocks.
> Describe them in the dt-bindings for this SoC.
>
> Fixes: 7514f64780a4 ("dt-bindings: mmc: mtk-sd: Add support for MT8189 So=
C")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> The patch is based on linux-next tree (tag: next-20260630) and has
> been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
> boards with board hardware enablement patch series.
>
> Additional note:
> There is currently no use of "mediatek,mt8189-mmc" compatible in
> Mediatek board devicetrees.
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 29 +++++++++++++++++=
+++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index eb3755bdfdf7..a4d032224dce 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -193,7 +193,6 @@ allOf:
>              - mediatek,mt8183-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
> -            - mediatek,mt8189-mmc
>              - mediatek,mt8195-mmc
>              - mediatek,mt8196-mmc
>              - mediatek,mt8516-mmc
> @@ -348,6 +347,34 @@ allOf:
>              - const: axi_cg
>              - const: ahb_cg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8189-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: independent source clock gate
> +            - description: bus clock used for internal register access
> +            - description: peripheral bus clock gate
> +            - description: AXI bus clock gate
> +            - description: crypto clock used for data encrypt/decrypt (o=
ptional)
> +        clock-names:
> +          minItems: 6
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: source_cg
> +            - const: bus_clk
> +            - const: pclk_cg
> +            - const: axi_cg
> +            - const: crypto
> +
>  unevaluatedProperties: false
>
>  examples:
>
> ---
> base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
> change-id: 20260701-mt8189-mmc-dt-bindings-fix-18959c85d5b6
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

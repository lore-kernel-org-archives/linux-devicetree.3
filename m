Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E293F4825
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595629; cv=none; b=Vq038qy3OCVEztal8ogiDWFFsJxy1YDqbGqQbdJ62rx/6yPrYo0wRoP5Oi5BgqR77Mo4TO9dF91WTFxvQyhxaHtezfdIzCXbZpAkEQXLHDujrkAX3G0Xk1cw1nhHRLyau3KXEb3mpbX3VLQMMoFqBbrAMCDjYjfMLtsZaRj58DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595629; c=relaxed/simple;
	bh=9KoC10LJtSeDEGSTTKojoNONjqdolpEmv27FZiRX0K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLn24VMN1fzUoU2+eWqtV1KU2fSes1/MJKOPfeZkDnAjUWK6EKKLgtQhzOKcwE6o2r49dL9jYseqVW5gPEDdfbnoYNPPntLX9xNDI/7BoWohesHRlt9kpF6/mMFI7Bg2lOMLWbpGjxYceq+gWrPvuHr9/MCE6OD3267nASh4K18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyrhOJxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMukXrP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyrhOJxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMukXrP1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCaSs3769155
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vIFQW66lWasQ4teYy7kGfOEnxcGwdViOIr1+IS87Wp8=; b=XyrhOJxz/4gBeB2Z
	SNOTGyX3iAQtgBoGbG6pW2Xm1FVMiLTJ5LFZb0Zl8pO8WYIsQ9CRnmVWZhKL91rx
	hxFsDl14Qz9jfX7MJVsLRt6ofah+2Vzg+fv4KoqTkATfXCwskKDCnz9E+RsYhMFj
	jTjsLyl9g9dI+CzdE4pTF3t6gy4FWuRHYvfnXj6VcfmXePKfnnT7KNYPQ05PYEzy
	zUbbxBVXNdae5BMEhWg8Y9vqWOGI3TvJzru/JdUEmKYQXGcZMhbSGH0Rz6F7ONPe
	NY6AGv2fYBE/tti6f+ohFcA+s06UrH1XvROKleCm/TOjWE+i0X9dbHeipqro1kPz
	GJP/sQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y3mb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:00:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1967481a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784595624; x=1785200424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIFQW66lWasQ4teYy7kGfOEnxcGwdViOIr1+IS87Wp8=;
        b=eMukXrP1EAGupiBmuTmlYYEGRiTJKjqZSO+OGS55ws3M7QC5R/ngEchr2OGLUDWBHo
         mbAb0fX1+kLiE020E6+88OANom3TXQcewtJbq0AALyK2BhCJx3xrYHEpQnN7TAwsxthl
         FufV5IBLsl6C6lhNH5u1zi057iCycipuBlpZ2jMNzc8GE9MasJLQ1AOBCyd9WWsgjGFw
         e6xnxj9gim0ZyosLJwTSalt/Qn2KlihSA6cL3YprF/hsP9FhcNSq0JIUwvSy75/FN4s4
         vuvOz2OczdaJ2NKZcsXkpFeWwHmYry9RNDT/KnBrC+uXHp7W1CaMAEEwmtmGismOgieS
         qAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784595624; x=1785200424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIFQW66lWasQ4teYy7kGfOEnxcGwdViOIr1+IS87Wp8=;
        b=dRTQPZfbbA18eJyOjl37ZgiTTVFycmcK0V2DfN96HHEW4Y1b/qDojta15zaIj+12AG
         0+Ioyamts4AdLA8+QRvpDetSeKxdecRsK9/VWpBsV6E3ky9CUV7cxAFizKQK0ctpBEoh
         a9uglNWD5FmujShFV078DgnsDXHd4meNREgjgiPVw42N53T4XJnNRX4SMVsiz0fDleTn
         GbTaqYY0RczaO5BBA8DhipJF9qQaWkuyF1eVxn5//SnYI/nBeBPtxKbjo7b6l2yB1HFo
         IcIZtwvkMhZZ8NwQOZgdKWMEKqNDD9XpGBgFfLbvap528s8mleF/thbk50IRQUeLn4YE
         fSfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqCmsTSsOasGDy3vJK95O1n+IS+Q8y7ysxkPYziTM/BHQQoaJh0gj26y6YqLfN6Zj86W+s5zHU5rQw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8bLojNcY4DZjtME3/DaUDoRk5re8RJCjm91g8wzzb0rSFWP50
	7Czhr6x0GaPr7dJri4KqBZykiKpp1Zjy+9cX9qRBDomz9Rvn6/kIPTKJq3gyCb8dpPmJ8RJAmaH
	Mdl/pW0NZ/pf5f5NOhzgy6+eQeqVtKpDsDuUd5VSuKFXSHJpxzo2iKAbDmOZ3TpNu
X-Gm-Gg: AfdE7cnqdfiK82SwxlwRDMIOcFXv6Cg7UCYpkfc5ey4TDnl/ZhY6CdZk8tquXPYJL09
	ElId1Shcc9/QZ56A5XBqK2N6c1lWSZW5UbMsgtLHT+VdjikfDtF9/l9mCIb7FmjqTafIZVe2ak5
	cOlky+iQJrFZUJ8hHvfGyPMhvV4fgjlGdfMe1P6SZu+HREZfdLYShGbWGPTKba8lM0BDmpZZIOa
	bn1LdLi6g2GV0t8kiKeXMKKmWuSLJcvqw5P4v2GbXojSb2D+iIPvaGyDSWM2RfJf4jtIv4zfjaB
	qR/oCSNhY0++ycBMPLFnhM15bOMCCECnkMwdzO+fkHFk29Z9ufQNzX3SClp3VicCXap9LBM9Ibp
	KQQaSy0zCmwuxkmiLxxeWUYCCnE3lzS0=
X-Received: by 2002:a05:6a20:cc0b:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3c3ad66a4ccmr17599898637.11.1784595624118;
        Mon, 20 Jul 2026 18:00:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0b:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3c3ad66a4ccmr17599830637.11.1784595623410;
        Mon, 20 Jul 2026 18:00:23 -0700 (PDT)
Received: from [192.168.0.5] ([49.205.251.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2c93sm37644053c88.3.2026.07.20.18.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 18:00:22 -0700 (PDT)
Message-ID: <7bec94ea-a5b9-be03-0e40-5de8262d2197@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 06:30:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
 <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>
 <20260716165434.GA290489-robh@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260716165434.GA290489-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAwNyBTYWx0ZWRfX19nORlB+O9Er
 vO8nQImxCHf3KB7XW5D9K46frYjC8XeKOHp+7PFXDuLvjEuVNWOYBq3+C6W6qtgIfsdIZY6gy1p
 ujIMk8n2FdzNtv0g8yBV6r6rgYNRZPw=
X-Proofpoint-GUID: 7gQT-JFlnvSmGK2dHAMUbxpAQpRbjAKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAwNyBTYWx0ZWRfX/TYvrfRZpvP4
 z1WAFkedtZ1ppkQOYHIQu+6QiF0DX5MVSvKe60UROfDcpColjYfvB9+uipGg32w7mCxsoF/IH9v
 74yqPmZf2+Of3QOAaJ1xAs/ek+p8z2Tjn4Kc3EbPV5kg59FB+jIpIwtHVKbwQefjppD+fLswj4r
 n7/ZrLd/RnJiYpCzSj5SCuJu7kVDhe7CS1NOgn2HA8BTtJx0xtlfPO0TkCQkiOS6vVtatjxo8gY
 ekYxJBE/kQI4b4B6OjG9F9/e8xue1NmH3LDuXJ5BfzQkATda/HbDLNFuaCwyA5V4ZANaPeHoIsd
 odQsRgOjkZMweL1+F4ua4VcR4JmLoptR13quCgZaWukaEt3dAyCpe45sBjuL23Ym6Q+b+g1QUtW
 YPTr0aC5WpNTZbKKN8FKQRpSybSJYxAlSqQsJk0KYK9gDTP/0OqcVCAzY0l4YCtGl0SR78rJK/s
 ie4Spd9ooEOX69ZSgcg==
X-Proofpoint-ORIG-GUID: 7gQT-JFlnvSmGK2dHAMUbxpAQpRbjAKg
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5ec4a8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=oHgmLS9T6KHqMfKxrEeemw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UXIAUNObAAAA:8 a=waDrRbdePDZ9fwWd1tsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210007


On 7/16/2026 10:24 PM, Rob Herring wrote:
> On Thu, Jul 16, 2026 at 08:37:17AM +0530, Vishnu Reddy wrote:
>> On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
>>> --
>>>
>>> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
>>> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
>>> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>
>>> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>>>
>>> This commit adds the device tree binding for the Qualcomm Glymur Iris video
>>> codec. It introduces a new dual-core architecture requiring additional
>>> power domains and clocks, and updates the maxItems limits in the common
>>> venus schema to accommodate these changes.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>> new file mode 100644
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>> @@ -0,0 +1,255 @@
>>> [ ... ]
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: cpu-cfg
>>>> +      - const: video-mem
>>>> +
>>>> +  '#address-cells':
>>>> +    const: 2
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 2
>>> [Severity: Low]
>>> Are these properties necessary here? The schema strictly enforces const: 2
>>> for #address-cells and #size-cells at the root node, but none of the child
>>> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
>>> does not define a ranges property. 
>>>
>>> Will this cause the DeviceTree compiler (dtc) to emit an 
>>> avoid_unnecessary_addr_size warning when compiling device trees using this
>>> node?
>>>
>>>> +
>>>> +  non-pixel:
>>>> +    type: object
>>> [ ... ]
>>>> +        resets = <&gcc_video_axi0c_clk_ares>,
>>>> +                 <&gcc_video_axi0_clk_ares>,
>>>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>>>> +                 <&videocc_mvs0_freerun_clk_ares>,
>>>> +                 <&gcc_video_axi1_clk_ares>,
>>>> +                 <&videocc_mvs1_freerun_clk_ares>;
>>>> +        reset-names = "core_bus",
>>>> +                      "vcodec0_bus",
>>>> +                      "core",
>>>> +                      "vcodec0_core",
>>>> +                      "vcodec1_bus",
>>>> +                      "vcodec1_core";
>>>> +
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>> [Severity: Low]
>>> Does the example need #address-cells and #size-cells? It demonstrates their
>>> use without any child nodes containing reg properties, which directly causes a
>>> dtc warning during dt_binding_check validation.
>> Without #address-cells and #size-cells, getting the below kernel warning prints.
>> [    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
>> [    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4
>>
>> [    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
>> [    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8
> Then the kernel is wrong.

Hi Rob,

Looking at the iris DT node from the link below:
https://lore.kernel.org/all/20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com/

The iris is the parent node and non_pixel is the child node, which does not
have a reg property, but does have a memory-region reference containing
iommu-addresses. During of_translate_dma_region, #address-cells and
#size-cells are required from the parent node for address translation.

As per the Device Tree Specification:
https://devicetree-specification.readthedocs.io/en/stable/devicetree-basics.html#address-cells-and-size-cells

#address-cells and #size-cells cannot be inherited from ancestors and shall
be explicitly defined at the parent level. Therefore, adding them to the iris
DT parent node seems appropriate in this case.
Please let me know if I am misunderstanding something.

Regards,
Vishnu Reddy.

> Rob

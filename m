Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9780546AF2F
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934346; cv=none; b=b1m5Ur5b3hmxONaEoFVUiJDWCNGH1reaQFyZnB8axEH12yZ9t8JCMayRl8TCbAcn+3t30d5LVPCqWM6pTzfsGZjOa0PzrISMvSwI5rHqr4cboWke7NQhUnTROJ1JKORZqKasGEuSvkuyvIS9P/C0GxsTY6mF/FCEz/q6oubB8Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934346; c=relaxed/simple;
	bh=QpjLaDrYfGFlcPyvm8jXKSSdarzey2MvdB1CxpSvDEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy1bxVdScbIRXkHma6wSmw+6qlUSduXxdJ/pX8tiaowoE2kYiEd4mT3bmS3r3xW44h1hDNS54Xy2m9G134nhkxuyF04s+8TOPtyo/tWVkwd8nba8FQFwNnsYr38UZfxscHcQ3snb53D14USlJfEluyIN+Wxfxc0jXR33FBBhsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpJN3/xS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeUcwZ7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpJN3/xS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeUcwZ7y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvF582591558
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 12:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dB9BhREImKmlZOMRrd0Ba2Ei4QlE1yy9ECgYR6p7koQ=; b=CpJN3/xSm9/rhRDD
	3N09SOsXDrGtoEOdHDHpyzjNoStZ97enhEczS/iVqKH0BsEyVT++seD4REBBwXvd
	LUc4nFlKH3brlBB4GUMHE4gj1CSMltD9vBz8MKV9bkOO4j7PI40JLxD1RrGRuTJl
	UeaP+TejBkK6HjYpTCHG1qUCEMz7Qd+bPsqmQrqy+bfdh6c0IcazrrYMamx/AcdN
	BOFC6SHMz9nKkIdTv6o7U1zQJuuWGLRysSWChbaolziF8vPnGPOtsKQilRUt/Rzn
	ZMhwwXJacFpw4ceJy/L+LHCm3gkOFKOyRtrcuLbwQORl+gdPd5gOFKUGxv+azB+n
	fE9Rng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56cmsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:52:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1065622a91.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785934341; x=1786539141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dB9BhREImKmlZOMRrd0Ba2Ei4QlE1yy9ECgYR6p7koQ=;
        b=QeUcwZ7yCuQpRVwB33nmsURKado4UNnJ9QANU0tAHH9Pl9rVQm/VE2M6zGX3uKe41q
         1IjklBn3F6ZzABS/JvsmWqABOvNS5TpUFQSEzf2s2sbQDH7XB3hk9I5+ojTnIaH2qQ1r
         k4y4T8o6r4E5vwS6ARSnZk9WWhWAFpUuifo0T4mk/T+smXxgzn5lngKgZETeJ54kk2Tk
         7sF0IIidq2RX9hecI9j7ft0SciBpbu6dDsuK1yg8DODUwgPaXYCDRnp57C8O6un38d3i
         aC7ogQQyjXIfQ1IvwX+nIvS7a55/8utKB74nLj3o2scHJazZHXv7vQCwaJxzacVFLCxX
         YepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785934341; x=1786539141;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dB9BhREImKmlZOMRrd0Ba2Ei4QlE1yy9ECgYR6p7koQ=;
        b=kg7vmI/8ThXsrr5HIOGeoNWZWWBKcyygRn4H6kwYLhETSt93NndlRXLT7IHM5qwkXs
         aA2WTZbohXvolL9UdkP9G3agyPr8edGor3rRElSCN8h39g4gmVWJ0dHEjir5wz5Ou7J5
         iARMU31zqV6gPmgL1+uefbJXjyUrzCwEtwtPNrl90bs1PfywbKodMp3mK2rrgR1tvE92
         yRW0xR1DajTXIevib5x5GIkU8lr8294BtClJBguiBW88wPXenG/oWFcVI2wPXYVEc6Gx
         yJ7UJSC7UtvqTB7lJbYhwSrY6oA74L+nX5AIBdFveI2oWOnzDypjFFT/3pWtyD301ZOU
         fmxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8DZMAPuAQtb1fbQ9VZznf2Z651HhcagcwbhRzrt9Zv1hhEgPRGRQqPwoMY4BjjRYSD6uzOzQ30y5l@vger.kernel.org
X-Gm-Message-State: AOJu0YwkKQi6UMEJq64jNpRrp2TxF48g+6XWyYpgf3YWMuJIwBmM+thj
	0PZZ21cf6xrGqez2y43UF9scivHJCqX4xMjJo2VO4F04ihV5jR81rlTrj3yxktvLrN0FbQ11/oL
	/zUEwukFZ+vTOpvROtbmmfP5D1G4tm6dUeRKDsRZR0GRLS7N+4jHCJ5dG80hBqKLYGfGkc38I
X-Gm-Gg: AR+sD13TBN1lQKSgjpvhUGs0No27Ol8IEmkhkUMbfMctdlqkQAfXLv38sZNE2Ntov8c
	WDYiScd2ALgu/2D//RNJaDLv+Pr36kzUgNWszxVXxaWMrYCxVwZbDvDszqWJwGfGJO1+61cGFpA
	SlXE1AZrByjx9S5iXCT29V10q0cxZsEcD8gx2jSGQ8eI2sKx2rfXL7JhzyGnQEEhIQKY2sUh8qQ
	y0itx7IdK7BSuPQlhBR6d7b6HlYAgCNdv8DQKYp6T139pkz4gQRu3r5FxANqeXQpwYT+TnkdBwA
	3pOwTyoIzmb2MyL9q3+1xzfK/2pPJANl1IsuCZvH+Xj3MhmT/5LfoJWtxopYo1F7R7m2grsJwd0
	fd6gKTvvffkr7L2BpPW4XFPi83TJcm+mX
X-Received: by 2002:a17:90b:3812:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3903c592834mr5868893a91.11.1785934341013;
        Wed, 05 Aug 2026 05:52:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3812:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3903c592834mr5868839a91.11.1785934340453;
        Wed, 05 Aug 2026 05:52:20 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fee06b438sm4749418a91.16.2026.08.05.05.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 05:52:19 -0700 (PDT)
Message-ID: <d231d4bc-f0a0-b0da-21d6-cc3da3cb97a8@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 18:22:15 +0530
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
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
 <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>
 <20260716165434.GA290489-robh@kernel.org>
 <7bec94ea-a5b9-be03-0e40-5de8262d2197@oss.qualcomm.com>
 <CAL_JsqJGc1hJtrxWA5OJh9=R-S5mgDsAZfS9vze4-REwANpikw@mail.gmail.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <CAL_JsqJGc1hJtrxWA5OJh9=R-S5mgDsAZfS9vze4-REwANpikw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMyBTYWx0ZWRfX395UB1xMpPq0
 Bn2RF+geHQam1VI+Bk3tmOGjb6Hddw83GamU/PSri6q18Ox7XGSY8A0s/rEa6q+dvrT9KtQL2ku
 xmzPN8PW0XXyJEJqXu0pkfy0BCc0S1TEBjQUO8MD24ERoLT2sywKuoUVv/9p8oGOIxwAPa8UW33
 gZCSDrYMVnlK01TDo1ZStsH7bfWW4coOEYV47X3zOOQbNxHlEc+OzUkkZ+IGw/XBv4l9JQ8VtBU
 616eOej17Otfn0Pair43nuh+rmeYKjuJ2pSxEl4plzRlkgqjRfMIWzcOCrUspTkKtYwO6s59VjJ
 LqqelBX/UyU58cTvfVFWzU8MOdDTu97LLYkTWhVhUu5X3HojFBr9lJzCN7npo2uUnsmGx+nX5/q
 UhdzfUbqXAuRZ7r2hiIFD/mcXkxyX0AQSX8FzX/N1YK6XLIleshOJpmDooG3olTscEyVug9nYdb
 9feCrVzffDiIyo6LmpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMyBTYWx0ZWRfXzg1p8IPVS/iI
 IuIdwri9Yu8L/89+LoPpLxw6W3VqbvlxtDmHsRi7QKlb+JdBaGBqvWWu9rwpAfvGf/5uOhbjYM4
 43F6Dm8elSmMRdfyx3tqcQ05nDDOt3c=
X-Proofpoint-GUID: hOvgi_nE9NB2XNy-au9otL4bMaFLLbgJ
X-Proofpoint-ORIG-GUID: hOvgi_nE9NB2XNy-au9otL4bMaFLLbgJ
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a733206 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yb9WwcpXJQ139jM9Wo8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050103

Hi Rob,

On 7/21/2026 7:50 PM, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 8:00 PM Vishnu Reddy
> <busanna.reddy@oss.qualcomm.com> wrote:
>>
>> On 7/16/2026 10:24 PM, Rob Herring wrote:
>>> On Thu, Jul 16, 2026 at 08:37:17AM +0530, Vishnu Reddy wrote:
>>>> On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
>>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>>> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
>>>>> --
>>>>>
>>>>> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
>>>>> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
>>>>> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>
>>>>> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>>>>>
>>>>> This commit adds the device tree binding for the Qualcomm Glymur Iris video
>>>>> codec. It introduces a new dual-core architecture requiring additional
>>>>> power domains and clocks, and updates the maxItems limits in the common
>>>>> venus schema to accommodate these changes.
>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>>>> new file mode 100644
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>>>> @@ -0,0 +1,255 @@
>>>>> [ ... ]
>>>>>> +  interconnect-names:
>>>>>> +    items:
>>>>>> +      - const: cpu-cfg
>>>>>> +      - const: video-mem
>>>>>> +
>>>>>> +  '#address-cells':
>>>>>> +    const: 2
>>>>>> +
>>>>>> +  '#size-cells':
>>>>>> +    const: 2
>>>>> [Severity: Low]
>>>>> Are these properties necessary here? The schema strictly enforces const: 2
>>>>> for #address-cells and #size-cells at the root node, but none of the child
>>>>> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
>>>>> does not define a ranges property.
>>>>>
>>>>> Will this cause the DeviceTree compiler (dtc) to emit an
>>>>> avoid_unnecessary_addr_size warning when compiling device trees using this
>>>>> node?
>>>>>
>>>>>> +
>>>>>> +  non-pixel:
>>>>>> +    type: object
>>>>> [ ... ]
>>>>>> +        resets = <&gcc_video_axi0c_clk_ares>,
>>>>>> +                 <&gcc_video_axi0_clk_ares>,
>>>>>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>>>>>> +                 <&videocc_mvs0_freerun_clk_ares>,
>>>>>> +                 <&gcc_video_axi1_clk_ares>,
>>>>>> +                 <&videocc_mvs1_freerun_clk_ares>;
>>>>>> +        reset-names = "core_bus",
>>>>>> +                      "vcodec0_bus",
>>>>>> +                      "core",
>>>>>> +                      "vcodec0_core",
>>>>>> +                      "vcodec1_bus",
>>>>>> +                      "vcodec1_core";
>>>>>> +
>>>>>> +        #address-cells = <2>;
>>>>>> +        #size-cells = <2>;
>>>>> [Severity: Low]
>>>>> Does the example need #address-cells and #size-cells? It demonstrates their
>>>>> use without any child nodes containing reg properties, which directly causes a
>>>>> dtc warning during dt_binding_check validation.
>>>> Without #address-cells and #size-cells, getting the below kernel warning prints.
>>>> [    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
>>>> [    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4
>>>>
>>>> [    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
>>>> [    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8
>>> Then the kernel is wrong.
>> Hi Rob,
>>
>> Looking at the iris DT node from the link below:
>> https://lore.kernel.org/all/20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com/
>>
>> The iris is the parent node and non_pixel is the child node, which does not
>> have a reg property, but does have a memory-region reference containing
>> iommu-addresses. During of_translate_dma_region, #address-cells and
>> #size-cells are required from the parent node for address translation.
> iommu-addresses in the reserved memory node would use
> #address-cells/#size-cells from that node.

Currently, linux kernel does not use #address-cells/#size-cells from the
reserved memory node. Changing it something like below can make it to use
from that node as you suggested.

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3d..e0d3f3728afd 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -251,7 +251,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct
list_head *list)
    if (of_dma_is_coherent(dev->of_node))
        prot |= IOMMU_CACHE;

-    maps = of_translate_dma_region(np, maps, &iova, &length);
+    maps = of_translate_dma_region(it.node, maps, &iova, &length);
    if (length == 0) {
       
Kindly let me know your comment on this.

> IMO, you shouldn't even have 'pixel' and 'non-pixel' nodes. Their
> contents belong in the parent.
>
> Rob

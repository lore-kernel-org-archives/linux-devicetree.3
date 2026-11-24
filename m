Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502719;
	b=V5OnttIujjadnPZThHEFd5KVqw8I0hQZoL7+z2oCcoTvFUWbfyNRDkJrmqhh/xElkU1O
	 0Hfyw/US4IJIUD3zXb5uq25vk+RyrdvfzxngoQTHoGa4It2KG0BE1CnNs71F3PQcFz6hc
	 huE7wW2ncubK1tuV/HeuWr/XTcfBR8c6mq3J8QSWcLGQCHXKlzgFkkcssdiruEU8+H2Qb
	 z4V8KNpJWeLrgZ7sStgCuq7FJaaqJjOboBtJ7ChBu8+r0YiVF2WasV//gBtlaDTMQ3WEC
	 sNmfNosSXrnR7uCGP4oL3XQCyp+3yFWrGuYxWS7U98VBu7gszNkOSlR0KM7RzrtbnTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=;
	b=KN0fh1P30U5RGgCZYN503hoDvh4NiusKtGvWED078gUY0M8cncMDz5t16j3nPaPJKygR
	 o/Egv6bCRgQfg9N5MxA/Y07YUHNZSP+LTDSMQMeGO3hv2kdz4BSGS3zKuotLgpD0oxVc6
	 q7rfrvrIR15V8iDiiaP59aGBZz/H/nzzK4P0YvDCH8Ym1dwNsVdHTH6mgpfzBpk+4ivUa
	 /0KylI981e1WecZzD2GIMiFdpp0C68L/dkDF095EVXYhl511e6kVP//qv9M/XqSrTgMpR
	 hmmVXWr5AxvZDRVm4l9RmjuhTpDxuPU27r+f/8p/IMWmwlMKc8/8km/WIXclpiD3rsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glC+5utF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BCTzCaFj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13524606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13524606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glC+5utF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BCTzCaFj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5ls4r2848176
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=; b=glC+5utFAAfP+RiH
	DqtqWwtiNMh0XxyGNuGdb9poiIxWUwQTH+mMkphnJKng9J3veaMo8Bi0zizzIxZG
	HhL1mG4O/82k0g9KYmyq/Ra29pgDpQwHMQQzD0Z3pP2+OCdgHgqfsD+0QfXZuUEh
	SMUwK/QyOTeCQLE94KPParUWrG395cbGMYAt0Abbz17350nXyOTW94m+iUKLJ9Ma
	YWyN7nabhVBcmb60aBlfyOUVYVhDRRz+m3Bz8PEPdZowGfmVa/qUhVZnifLum5F8
	scTNtBCrKPMIVtdjcFoND/Mz6rTlcdmp4bhTYoBXtgp56grDjZ/vf74a26vQmktT
	KBucQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8693-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:45:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c1cdccaaso297298eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502717; x=1796107517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=;
        b=BCTzCaFj5UNGajx/5U+udtOm9K7Ike7uiGG8lu2cQL2cREHh3vHxsPIl9Ul+1Md385
         aL9yLyj6IHpfua6KWkfGej9GDjos2gklh+evwQAuWxrFk+yVima4F/OAGimL3lowQI93
         yghIZEdALT1ms8N5jOiAfVIu3y2Y4I1q3c1SPiZ9Ya3dxcgaU5pNIUfuBL/lQ0A97Eab
         /3iP0RwFm9rgMKUb37Rx1vDmSS+iWNn8gDWBIfU2DhtZaOdyWJOA6VTG9Pxf02SC3ida
         Y5cXl79tTd8MFkXMl2TFdx/roU1Rfcw0WkYLRsqDheZ1Eex9eQBqfhsA6wKJgqCQTPkJ
         PI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502717; x=1796107517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=;
        b=1onaXl+cqF57dC74SaYW1/eIFSTjfn1iLgI9Y7m0EqcgTJVS08Cb0Uz4v4OhxQLlUz
         CeUr1fGjLqba5FUQM12dpcRgqzowQRdqd0P5BdtT0nnZE6JFt+7xhZ3MNI15MoT/UTeH
         MEdPkJCsec2iG0hkW5Ti0l8v0kMfHBNf2GylocpnbOh1Cwao/lf+KC8GwvlR0MxDYsDT
         OexPpcDY8Z4mz5nkjk2L8BX7ZfGocnjpUI2tE26pJQ2aLqfsUPYeY+/mwZQMqxKeSOr9
         L9eC8fBwHFPFtaoR12btBk5c+JhYzKTrMyW/iCWAkcw1Yr/rGvzoccLSzd/M4sn+wc0Q
         Imrg==
X-Forwarded-Encrypted: i=1; AL+hErHecuL6tsZa548v9osvb3Ok92AntTsdcb+jLUbLq1bo8x5ZWpbu+ksavOFrkJj1AQ890/eKEM5z8Q+g@vger.kernel.org
X-Gm-Message-State: APuU4Z+cGQ0pfyhXJbI8NIShE2PKvhgCKAzlHLUrcpX+imiw85UAAr+O
	V8Kibs5LnsehpHLxoMLB3B6VnHLOQhq/xkGI/k/rKhwDp+EFfO/jdO37W2N2zL3ctfKWs7BGCtp
	QZwHha5zBnWaea9JTOSdAMeEXrs9fn50U1ewL9DH0R7y315rJ/k1gEQ2lDTNnf+kS
X-Gm-Gg: AZFdTZdVap4GI4nJ7VmqnkTyEV3qz36ucq+rjpgfhqyGvGvygY+UQAqopIybhprnfkb
	GMzkjm3lfJWBD6oY7CWneguRmc9p7G7dbs21J17W1XmG5UrkgzA9Uullbi9BZcSvyLkUX0Or/r4
	UT7d9TeGaLraVLJ38y6c9R2xYhzrrTwANoT7uH2RyQxzdIT3LrDSYWjAKjeRM52hB8xNavESRKX
	SBDMFHd+qTzznvhJGNhPCcNcQokTEinimuM8bvPH2xchUYREaGE4Am2PBDQ2ER8tGOxxwFJtRop
	NLa0QQ+HyLTNQeULfk+H/+5EeV2BkeaEwbyS+vrOvkUPXl0ihBHDaaK7NjvcroSdRDog59iRnj/
	UHvq0u92nXf/4Hr4R6zAEojT2sdAckErVBM9VMNhpbD2C7ed1XSSEfDDsk/Zg13J6gCNHxbH7tr
	ePQCnr5GEVWQ==
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21864237eec.2.1795502717258;
        Mon, 23 Nov 2026 22:45:17 -0800 (PST)
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21864189eec.2.1795502716612;
        Mon, 23 Nov 2026 22:45:16 -0800 (PST)
Received: from [192.168.1.210] ([76.33.11.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm43667754eec.28.2026.11.23.22.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:45:16 -0800 (PST)
Message-ID: <da2003ac-c6da-46e0-ad1c-fba61cd42bb0@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:45:13 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua video
 codec
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
 <e693b076-39b9-46d5-468b-800159a47f76@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <e693b076-39b9-46d5-468b-800159a47f76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05327e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=yYUYPLL3N79xqptAUcuwSw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QW4WLnT8hVGh5wgcaSQA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX8wpY7K8IMYGC
 fvhm/Z27OWw3uB9XEzdAVhv53zzv9WxOER3I+dAU9A2hR9A+wLsZ7U8FbuwU8WkNs1SmhtJIXY5
 U0CUV40WVsx3R/oqThqWF+tUyjfBm6M=
X-Proofpoint-GUID: WtgCfZOSg3ctw2Ni38GTTP1SNRU7nt8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfXxN2rUK0v4m4A
 bdZsH8r1dkvFmEWtjAXG21e9MnLtNP2qVzHH7qC4/IncGKXZb7T10u6HP3za5QyjR7UXfbsGpSW
 fXrUKtDaqPYd2k/dKZBYKSjhztBAV5/GVTmZ3QHMBpLwzyy5/D/gOJfatsgJaxUdqMPBKiBt9fP
 UJnmY/KcnJGYuLyqkCM6t3jXqzWD7ho6MBlikAXPSp6IOhVfmBWjatmyPL4acrPW8oB/7OwMgRG
 iN+KfJH4ygOTEkOTLfPGplZC4lktnPHpcy0hvQyAgo+zrbRIjPG8DU0IjXUoJv8b1l3Oh8J5Fuz
 rcRWpOzieCbIE/064dEJ1wJg7nLt7M6Dzb8sRwobXReK2r0FUFMo+Ur+Bn99oGDKi2QK+Ct2rxK
 LpACVhgfKGIRYp/9dZop+2TirZdkucF+ZpV4y32HtOWUY+bdT0d72fYEYdT79dFYu2U8N0+T+Df
 IzR9Ug/fqYZ6Hr92Eeg==
X-Proofpoint-ORIG-GUID: WtgCfZOSg3ctw2Ni38GTTP1SNRU7nt8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026


On 11/17/2026 2:42 AM, Vishnu Reddy wrote:
> On 11/14/2026 8:39 AM, Deepa Guthyappa Madivalara wrote:
>> Add a devicetree binding for the Iris3.9 video encoder and decoder block
>> found on the Qualcomm Mahua SoC. This is a single core derivative,
>> leveraging most of Glymur data with the clks, resets present only
>> for vcodec0 core.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
>>   1 file changed, 243 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..cbae6bddf7fd4b67330ce47033874f3d349e5a3d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
>> @@ -0,0 +1,243 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Mahua SoC Iris video encoder and decoder
>> +
>> +maintainers:
>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> +
>> +description:
>> +  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
>> +  decode accelerator.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,mahua-iris
>> +          - const: qcom,glymur-iris
>> +      - const: qcom,mahua-iris
>> +
>> +  clocks:
>> +    maxItems: 6
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core_iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: vcodec0_iface
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +
>> +  dma-coherent: true
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
>> +  non-pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
>> +    properties:
>> +      iommus:
>> +        maxItems: 3
>> +      memory-region:
>> +        maxItems: 1
> The use of memory-region for specifying carveout regions was discussed
> previously and was not considered the preferred approach [1].
>
> There is also an active series introducing iommu-ranges support for this use
> case [2]. Please consider using iommu-ranges instead of relying on memory-region
> here.
>
> [1] https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>
> [2]
> https://lore.kernel.org/all/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com
Updated in v2.
>> +    required:
>> +      - iommus
>> +      - memory-region
>> +    additionalProperties: false
>> +
>> +  pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU pixel buffers containing uncompressed video data.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>> +  video-firmware:
>> +    type: object
>> +    description:
>> +      Context bank for the VPU firmware processing domain.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>> +  operating-points-v2: true
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    maxItems: 5
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +      - const: mxc
>> +      - const: mmcx
>> +
>> +  resets:
>> +    maxItems: 4
>> +
>> +  reset-names:
>> +    items:
>> +      - const: core_bus
>> +      - const: vcodec0_bus
>> +      - const: core
>> +      - const: vcodec0_core
>> +
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - compatible
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - non-pixel
>> +  - pixel
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - reset-names
>> +
>> +allOf:
>> +  - $ref: qcom,venus-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    video-codec@aa00000 {
>> +        compatible = "qcom,mahua-iris";
>> +        reg = <0x0aa00000 0xf0000>;
>> +
>> +        clocks = <&gcc_video_axi0c_clk>,
>> +                 <&videocc_mvs0c_clk>,
>> +                 <&videocc_mvs0_clk>,
>> +                 <&gcc_video_axi0_clk>,
>> +                 <&videocc_mvs0c_freerun_clk>,
>> +                 <&videocc_mvs0_freerun_clk>,
>> +
>> +        clock-names = "core_iface",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "vcodec0_iface",
>> +                      "core_freerun",
>> +                      "vcodec0_core_freerun",
>> +
>> +        dma-coherent;
>> +
>> +        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
>> +                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "video-mem";
>> +
>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        memory-region = <&video_mem>;
>> +
>> +        operating-points-v2 = <&iris_opp_table>;
>> +
>> +        power-domains = <&videocc_mvs0c_gdsc>,
>> +                        <&videocc_mvs0_gdsc>,
>> +                        <&rpmhpd RPMHPD_MXC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +
>> +        power-domain-names = "venus",
>> +                             "vcodec0",
>> +                             "mxc",
>> +                             "mmcx";
>> +
>> +        resets = <&gcc_video_axi0c_clk_ares>,
>> +                 <&gcc_video_axi0_clk_ares>,
>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>> +                 <&videocc_mvs0_freerun_clk_ares>;
>> +        reset-names = "core_bus",
>> +                      "vcodec0_bus",
>> +                      "core",
>> +                      "vcodec0_core";
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>,
>> +                     <&apps_smmu 0x1944 0x0000>,
>> +                     <&apps_smmu 0x19e0 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
>> +
>> +        pixel {
>> +            iommus = <&apps_smmu 0x1943 0x0000>;
>> +        };
>> +
>> +        firmware {
>> +            iommus = <&apps_smmu 0x19e2 0x0000>;
>> +        };
>> +
>> +        iris_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-240000000 {
>> +                opp-hz = /bits/ 64 <240000000 360000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-338000000 {
>> +                opp-hz = /bits/ 64 <338000000 507000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-366000000 {
>> +                opp-hz = /bits/ 64 <366000000 549000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-444000000 {
>> +                opp-hz = /bits/ 64 <444000000 666000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_nom>;
>> +            };
>> +
>> +            opp-533333334 {
>> +                opp-hz = /bits/ 64 <533333334 800000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_turbo>;
>> +            };
>> +
>> +            opp-655000000 {
>> +                opp-hz = /bits/ 64 <655000000 982000000>;
>> +                required-opps = <&rpmhpd_opp_nom>,
>> +                                <&rpmhpd_opp_turbo_l1>;
>> +            };
>> +        };
>> +    };
>>

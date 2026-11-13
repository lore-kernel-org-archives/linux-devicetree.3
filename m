Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562600;
	b=3u5XRMbQ44w9kiiOAk7f/i08B2wTse5PQi2sYGXqyyD5EOWWozLQPaPlMUIShUfuK4c+
	 smkBL+baHN1Z+isjyEu/NAPoT/eQaVPJ8s41jWYWmogseaKiZqn26I+NRrrq2wDuJRgfH
	 Vk8sGOmSjWqjM9ZmlzLvYzQNwtuNAlxM5vYSkLCTUGgeG8nv9n0ZkKm3//hijMGVhFyT4
	 lBlyZf1FJN8Dj2F+Q60I5EGM2XQdxPhoD3mLGi9aPsWMssjzrC3Lez619s6JLA3ihtRvs
	 gy1TuB3Bvn//FUPCeV3R/TdiGM0nSFm7lDuLpwTl4MHodsTu/+vXcppbrsQbj+TzjQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=;
	b=UwAwaHRAEuwY+ietSMj+SP9S/Lr4fDV03/Eoe+4cinYDOjRQBKBUPo2QYva3kysdODhI
	 /6qHPwPqBCowhKh26whDDotVOT+fINMmM+LgR+4l9kLGHiCfh6kPH/lJQyomwZ7DBkV3z
	 3x7Kq0QrMz8bM/Vqds6pOApEJQZ6BPuhYmPn2qawgXe4tBuvUjKsGPWo8PoI17Fh2EClX
	 XgC/nbWsm/MK0YARKMBkATWLhpKpXA+KHnGau+ZbmSszltgPKUVgpNkdU/o6P9s4l8eS7
	 NnpILQpn+8U+yIvFxHb7DP9axy0IN5mLgqSc3NXkAIKWp6yU25S/GOtkFrNUE533oPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GVKFGMs1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7ZBaiAS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5F6606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5F6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GVKFGMs1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7ZBaiAS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VSZt1527740
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=; b=GVKFGMs1XMs9bbXp
	Zhg5r5J6RwMc42vPpYNxUdrGnsI4Fhw2BdDU0rdu3o0sFmMKaQu1NrcR2rTbbR8R
	GvHPsp+4adGh3QtD7FPMoBIFtRHYLVkbyZChjnR/NLvCdmjR/OrbJPj7fl4qeV8W
	a1ieVPsDJG+7JDIGNw/V8eBuedTZbN9Wy0yyelW2uvkedT6T910Pio8zORxPVIZq
	cgFh3n80GjMVVrvJDu3INzRywdH0D4acbetf4CAQIkFyDea6uPH4cEbOmx5UmaHp
	nwj/BjflK9AxQPPF1ZvcJ3MYKU+dUoOYlXPQrcNKRYBmmtJfK/Ul3Q6ffcQMlx45
	ZG45lA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8nvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:36:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd66551e02cso1012129a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562598; x=1795167398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=;
        b=X7ZBaiAS8K2KXZeuQLkmbkTRe3zNfdIiMuGxv7jvMCDQD2+x8bpKi9JzV8lE/GYyRK
         ddtiIzUQ5gaeoAVSsoiGas1KbmJh4hjRESbPD8F2lu5hWZvGJeXH9I92RxUfl6zmL00r
         xfFKr/NZ+dce3umVRV3NGSZ3OkCqmM83ARyCJkKPN7smCww7rPjn8A+hq85ku60bRkk8
         w9Q/2dUBWmhhYe/6G0enYKLeHHFwEygaQbp2vua+6T6MWCj2ZQr04K6HTMVd+CZL4BYU
         /zEohRRzQFTMu2KZSVemz1huzurcujJXrfgK1h9wXZdMe7xOhmZ+5rQwVDu+3gZ1793D
         zkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562598; x=1795167398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=;
        b=BZK9b9eHeYirASFXshapXrxfVi3wNa/vReweUzc3k1KvyP8gtm/JdnjtE0jXtSLypQ
         xqAXJtoL+R9fUXeHBSDgZxdiO2Kx2THptvfSpChUjb2s9dhE7mNi6jPh7y9YUHexZW6I
         CarK89omGaSZ42MdBGt4H1GSWF5+5urxjBjn6gp3diIoigk9uYjBV4pv9L/IgbWcc+tN
         V3bJ1l6C4MQQTo2iM3p1KdrLAwI1kwvzqotZO6/XLAt/jX8W8R930VhF7fydosbChCUp
         RJ8MVFOuOnvcblRuz4T67d4TyJV2AkmYf/BDa8a7LFQ1eHhDOpmkeuC7qyc+qwlj+ZSV
         HEXg==
X-Forwarded-Encrypted: i=1; AL+hErHipbVOnv5ufFrsimaLVtx39p1lJqNAu14v11jlXlM7xEeIodt468N787X3q4m1as40fyErM/bVvFmh@vger.kernel.org
X-Gm-Message-State: APuU4Z/1YdHQoR2HV45QiqJrlBO7PZuFUJkkbZPA1MsKWj3p9/wbXG7f
	FFhWUnJSiJA6nzbLFezAmTcb4qrvXGf0aYsmWoHPElbLH8ZH0whLUHK3ehkk0IVp08kN23A0wiM
	4wAvK6r+yxr5va0u9xMuexwXY/FgPZRFUyOx03oowrTu+xgvtJqnrGE2lqWztTbPp
X-Gm-Gg: AYBFou0Oy0OA5oLqwe24gOXgf3ezFbMtUCBZ089oyp0NWVfnszW62zB0xkewOehVLMB
	QkSzhlfRlpviQA6ZVOcXWAtW88QWFKB75BThuDTC5omBv+R9uePFywiQRn2YQOjZA2M+DuC7pE/
	+jxHFhYZEw8faiyg5zyOTIpkLxEl2hzMvDo2TtNPYstIKa6qomasQR8OIkDCL5N+Dj/cjSZ6LfK
	S7EmqQdjb5QR7MIMwLdV05e0nYqEZzOTkaPcsIRDUxelMvi4ptG0KfLS+Vp+Z98P+52weLv30BQ
	NS41IFzE4hTO/A702/jqS14mY1/GWbuLsfKfODFNo1H2Xn2I6+QJgsLq4Wtl3RLHPpLVoCF/q2V
	SXutfqzTNI7dQ05+qRvsPUvM08MF9lya/1yMW2if1wUfDBNLxY2egpHjq4M0mi/cWE2z78IZUIS
	vyLvtTcTY8jCHM0pdGODnnW/Z5LVNftsVOGUBMYaw=
X-Received: by 2002:a17:90b:1652:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b1b0a42b8cmr1747879a91.48.1794562597495;
        Fri, 13 Nov 2026 01:36:37 -0800 (PST)
X-Received: by 2002:a17:90b:1652:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b1b0a42b8cmr1747854a91.48.1794562596993;
        Fri, 13 Nov 2026 01:36:36 -0800 (PST)
Received: from [10.133.33.5] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm3828201a91.1.2026.11.13.01.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:36:36 -0800 (PST)
Message-ID: <68bb5fe0-9005-4517-aec0-c39021a5b24f@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:36:28 +0800
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
Subject: Re: [PATCH v7 5/5] iommu/of: Add support for "iommu-ranges" on a
 device node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-5-5c0f72083e52@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-5-5c0f72083e52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX9hAvzp+DAhYy
 5NQNLtjunBLl+e+4Jy9AY26hcp/cX/U0AJdD6lMjwyRA53fz2MlYX9FmrpQX5ox1XGfi1EqE3o8
 EFem4w1fs9rznkoEGH94PaZuHzsxmjvHuChI4h7P3+t0pJv/ey+84O3lbuf6a0mBGU6tJtsxeIX
 P4SndKB0VxDSYS8HmXyG0S31OKV71E1pAN+W+0OdIe6hpkyj7a7TuYxcNjRTQtJHYyq0SqctzzQ
 Pof3LDn9EdL9tX0d2RrXdHNXepxxHPwQe21qNIxqjKjSjr2Ne/77YtG0IwmvtYYG0X9jz2wypmG
 7JfEvsiqxRtgNLZzAvqKkmWh6jhlVJdJ7WysRfx0xbEH5vU5I5DZfn7E6Vp6ISf3OkPUwXrVBXS
 rEBujLCg83KZFhFe6mJ5tOldj1ZmQFKs2B02jDzAocSFGCB+ZyagTGs60hHvKXtGRU0kvhcHaHW
 +VG8OE3IiSmPNR+CyjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX4HJKgANY3pZX
 8O3HUcD8lGMv5KMLKOCsSkOOnZuWX0cvqd4y7SJc9f4JRccqbKJAxTu5ew5TWowS/TqHHe9e4Mm
 ynBpTFvtKSCs8QrxX0siXAP1RrsTU8s=
X-Proofpoint-ORIG-GUID: mX8KczkjZz2fGH8eo6sKZAL967qaRsRF
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6da26 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BUd8g3l6cCjgLUHkIXsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: mX8KczkjZz2fGH8eo6sKZAL967qaRsRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038



On 11/7/2026 1:14 AM, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> "iommu-ranges" was introduced to specify the device specific IOVA ranges
> when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 00b02c19f27e195fc36c4bc1d91253255147c9ab..e133d3b346feecac7e2bfaec44e4882060ee89ec 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -183,6 +183,111 @@ iommu_resv_region_get_type(struct device *dev,
>   	return IOMMU_RESV_RESERVED;
>   }
>   
> +/**
> + * of_iommu_derive_resv_regions - derive reserved regions which
> + *                                are outside of iommu-ranges
> + * @dev: device for which to get reserved regions
> + * @list: reserved region list
> + *
> + * A device can describe its own usable IOVA ranges directly on its node
> + * via "iommu-ranges". Everything not under those ranges is derived
> + * as a reserved region so the IOMMU allocator won't use it. Entries may
> + * appear in any order in the property.
> + */
> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> +{
> +	struct of_iommu_range {
> +		struct list_head node;
> +		phys_addr_t start;
> +		phys_addr_t end;
> +	} *pos, *new, *next_range;
> +	int size, prot = IOMMU_READ | IOMMU_WRITE;
> +	struct iommu_resv_region *region;
> +	const __be32 *maps, *end;
> +	struct list_head *prev;
> +	phys_addr_t next = 0;
> +	LIST_HEAD(ranges);
> +
> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> +	if (!maps)
> +		return;
> +
> +	end = maps + size / sizeof(__be32);
> +
> +	while (maps < end) {
> +		phys_addr_t iova, iova_end;
> +		resource_size_t length;
> +
> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> +		if (!maps) {
> +			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
> +				dev->of_node);
> +			goto exit;
> +		}
> +
> +		if (!length)
> +			continue;
> +
> +		iova_end = iova + length - 1;
> +
> +		if (iova_end < iova) {
> +			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
> +				dev->of_node);
> +			goto exit;
> +		}
> +
> +		prev = &ranges;
> +		list_for_each_entry(pos, &ranges, node) {
> +			if (pos->start > iova)
> +				break;
> +			prev = &pos->node;
> +		}
> +
> +		new = kmalloc_obj(*new);
> +		if (!new)
> +			goto exit;
> +
> +		new->start = iova;
> +		new->end = iova_end;
> +		list_add(&new->node, prev);
> +	}
> +
> +	if (list_empty(&ranges))
> +		return;
> +
> +	if (of_dma_is_coherent(dev->of_node))
> +		prot |= IOMMU_CACHE;
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> +			if (region)
> +				list_add_tail(&region->list, list);

Why keep looping here after allocation failure?

> +		}
> +
> +		if (pos->end >= PHYS_ADDR_MAX - 1)
> +			goto exit;
> +
> +		if (pos->end >= next)
> +			next = pos->end + 1;
> +
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +
> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next,
> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> +	if (region)
> +		list_add_tail(&region->list, list);
> +
> +exit:
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +}
> +
>   /**
>    * of_iommu_get_resv_regions - reserved region driver helper for device tree
>    * @dev: device for which to get reserved regions
> @@ -262,5 +367,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   			}
>   		}
>   	}
> +
> +	of_iommu_derive_resv_regions(dev, list);
>   }
>   EXPORT_SYMBOL(of_iommu_get_resv_regions);
> 

-- 
Best Regards,
Yijie


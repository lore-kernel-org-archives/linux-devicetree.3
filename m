Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082139;
	b=MpgP0BhBsfetD6eNipXskHoqrnX3yhraPB8ouNcxM2pDeBFLkvkkndF1XAKVRq6SSZCM
	 niPJzeaYGVYcJ5YgsXbtApbHTQ2OCv11YgzDy4DfDK0y0JVSKDBjp7JcfWRxbtVTnPtYL
	 wA9wPPDaE54MI2xELPI3ElgXViJ15upPpczj4QbxrHp5qpJ+29CnDAzPd7V/pV9Gi5+GA
	 udNxsvYZ85WPJsd21S22hLe8r5wfgT28DVGns9juiDJcrTlE8xlVEJ4lO6bDgxAHxKodG
	 cfTzf8rgO+BkJc3n8pME0n3H/mIHl97tHIKXMyLo4Y+6xC8iDe2yN3gZOWufNtR9Lug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
	b=G8NbVeiRd8p5hJYj2/eHuq28gq7lY3L3HpRyhHocOPY3xcpEJ8j+AekWwzcWHqwO9/NA
	 H3Czvk+UaTomHjhre121pf3r5dkszVfmD1nX5q2ELWvqE6mcr2tshqUxpk1AiRFFxeRgb
	 v92anDlgOSnN3jjw7uEZJLV4p8iPHQxpn/HsycaEVZxmOP1FEYhRjA0XfZIZXd53/CV37
	 m89574XP4Rr9ow/j/KgX3AWujqIGBvOuUFoxaqxj9jQYTZDQI0c9vOndGRJLvj13pWIpM
	 GgxYXKJFI0Q053XGxMzijDwRAbqG9MmAms3iJkg2R4yCUiVLW05xsc+fK3/cN2HMTBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034B606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7034B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z12p2349933
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=; b=fo7AZp6f3MxcfLqm
	cmr8GEfUPncYo4l+FTY1si0CTrFwIxCyAIujaHf5lhwiBJvJ81GX5rKkSLxVliOb
	c9DREBO2BLC7X15GM8aXZ0iGQ/m9VqEC+Tg7AxNdJXmewMFmvzKj0b9w66KI8Elp
	ou86K86hBNNMTnrVDd/NoMbAUrn6Rwi0h/A5+ez7xAi8IcqldGnQ/WeF5RzPXTyr
	uZTS0het8nc6cOgIonhhEJ4QxMx7U1Gx7KHb43mWKPqYGSizskB3b0qUVH0fwAW6
	u9VAFchs28V6oHADq9cdZZjq0Pp49xohXNa58S1AZXGJBvvQ6LUDRfDuZRviF2L9
	4C0ozg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91926e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:22:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e869e00005so61798445ad.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082138; x=1793686938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=OIG68irWumdoQjVhk0a2wDNij88TpZiTY4EI/MU9tLqDvuS0I6/q43D7OXY4aUXCth
         GdZhwoWyARcBXIEodIdcEXuxbxgDTAjLYGBsGjp7BlfbjSYG6Au9PHa/blZXvz6MIhsH
         ViOOMJvQw5cM9CbPFyAtzSYOOw5bfBjDUiMvczu+WFguRIlkLdr7xAj1cxCCCv1Hq8WQ
         MrjlbKwi8ZUHo8anZqd7LuUSdr8YNALXZ2R2Ajn5vFlOx4iQ4jTqlTaYy8EnWYHivTd0
         jpjkrOOivGNyx3W2qDBTVUPieIpR0NChp/ZihVpC2MGAwHzvRaQQ8X59mpxRAUmyB7ug
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082138; x=1793686938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=rO8Ys7lvAoloiPYWumA52f8G4B0QogKJa0NeqBRPqDhrMManjgJcyLvh+K5JuQMSo7
         NqK4Ecvlp22fGwogZlu6/EB8lsSP95oWzQbYCoh3gPEtBDIMbu4VUIg/Obpg7qwIoK5M
         H5+DUU5CpmGO58xHbNnAxgpDV78c5r3RCAOB+Pg8tzr5ChmrlK0J7auebDyhyONzBwmW
         WCWgqtIx3eP+iTce49Pj4xYzquUd67yEQ6WgjigHI9jDledvIJdMx5d+UVuIUsDLPpGF
         anipRMEYEFxobEoPKuv+LUEgrG69arNDMPbV5uVpnqreSywHEMwneauuXUId/BwNvIOW
         tdGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4ybkAPdiY4u2xtfc+X7jH66H+PwUV950rV2RteQf8fg2LwLuwsj/GSpfOhzxDNbP7MHouJHEFByIA@vger.kernel.org
X-Gm-Message-State: AFq9FYIYFZRQv0IXhF3kOUf9lb/9rvgqAhbIk/3JEyrYpORu5vF9jxyj
	yUtqXV/aVlMBXRQVa65Qm2HGUsEeshCWWMcQGlftxZoRr8UgsNKNNazIsKn1Jxl4kJEXefoM8Aw
	V45s67m29cS9D612beEr1N9NkPUB10/U/WJhuIZXY3rE6V5XDCMVtNi9Gx4z9Axsj
X-Gm-Gg: AYBFou1RTgQ+b1EKva4Eb+udhtJxR1+3Miz/pNQ7vHzHmpkI6FRIgQFyGtxOvBPAzMM
	TeuH797D2CK1BbGpD4xbUmz+GOKT6axMKAJnBZ3V1ziUawDCNSKfJeHgiMBf//BajodxEX4bYy8
	2CqGAQLBuf2j3fpDHnqPt1g+QE9u6zWzt+siSqt2b4UpVJwCDh/9pE/NSt7YcwMvCV4R14/Ci43
	qV0vdejCv9kDQMHrOh9lHXNlTVH9QC2xjg4HoATp3xmE/4XXeOoZtz21aQjFIY23h4wqTn1sRcA
	pZYGRVWPrfadQGmBMDmb4iQ2UqPGXKXgpJqu93yqPUL0xtejp/y2co+YpIHy+uFNNhOQHwOcTGM
	JXDPCyxzv//2nZVxoiwDs9Hj1jIj1xsfs
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075655ad.22.1793082137699;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075355ad.22.1793082137217;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4003565ad.24.2026.10.26.23.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:22:16 -0700 (PDT)
Message-ID: <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:52:11 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
 <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
 <20261026130559.GB3598537-robh@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261026130559.GB3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A1vFrxhIue2bENC-bY35eK8Cglt8HBdH
X-Proofpoint-GUID: A1vFrxhIue2bENC-bY35eK8Cglt8HBdH
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0431a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=zuAiZn09hdMMTQJ27doA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfXz09VJk/u30J8
 2fH2ArVi7y3BRbuTfJVM6P9CLi/7lHjyDs6wRJQUtJEqgWAo1doT711HWYM+cAdBfccQDKl4rqb
 fzNaBnKUmNxpBHAjE7eQeOXVF5PIT9ZRr10lO6ir1VH9T7K99objNVRPCNp1jw9gmCCNXgFYHSU
 kZx7INX7BLJwVtiZGkYKcTCH5LdSxv6pNrL4lzRvGVUkklLMCvyAYLfaOuZ1b/XIG9sZpN3HQY2
 rK7vL/m/97dgYNsQzOW2Zc5U0rPOGBJzPBBWgYxcZVM161quJM0fasgfp0nfQAxhhLEFFP/s0pe
 a7BQlBSc9/ipLiN547AsmasMpINUpECwJssBc/EPcQNgzNHHToA/wQ3K7NjwZ9150Ajk3LXUJSf
 Md8JVuzpzQn7o+0FnIJsMQ5rpC2S/UonCtR68UPQ0kXxUr0bVpwTZJ33VvXb7KtAeN8W8ZAfRK/
 Zje4QfIUDvfZJvRwLrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX9moTtgl5Scnj
 6jx5c/TobXaTn4EPbB/QMHjCWrc7JfMt/fb76PfHzQ3gJxdK7xcyrKznX87YntmcUKJy2tITero
 NZ/bD81UhsVlwfO+R4lMKcYCEnDf8is=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270025


On 26-10-2026 06:35 pm, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 12:05:50PM +0530, Vishnu Santhosh wrote:
>> On 22-10-2026 07:31 pm, Rob Herring wrote:
>>> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>>>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>>>> arbitrary host memory.
>>>>
>>>> Add an optional memory-region property to constrain DMA allocations made
>>>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>>>> for the remote execution environment are managed separately.
>>> dma-ranges is normally how address restrictions for a device are
>>> defined. Why can't that be used here?
>>>
>>> Rob
>> The constraint here is access permission, not addressing. The modem can
>> only access a carve-out that is assigned to it through SCM.
> The reason for the constraint doesn't really matter.

Ok, understood.

>
>> The soc bus on Shikra already has an identity dma-ranges covering
>> 64GB [1], so there is no addressing limitation to describe. dma-ranges
>> does not reserve memory, so allocations would still come from the
>> general page allocator, outside the assigned carve-out, and modem
>> accesses to them trigger an XPU violation. It also applies to every
>> device on the bus.
> It's a bit awkward that dma-ranges needs to be in a parent node. So you
> would need to put the device in its own bus node. But if dma-ranges is
> in place, DMA allocations will only come from within that range.

Thanks for the correction.

>
>
>> The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
>> provides a dedicated, per-device region, which is the setup it was
>> introduced for no IOMMU, with firmware restricting device accesses to
>> specific regions [2]. Stephan suggested this approach on v1 of the
>> BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
>> same pool, so a single assignment covers both the descriptor FIFOs and
>> the data buffers.
> I suppose that since the memory region is dynamic, 'memory-region' makes
> sense here. If firmware determined the address of the region, I'd
> probably feel differently.

Yes, the region is dynamic. Thanks for the review.

Vishnu


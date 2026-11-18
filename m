Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001327;
	b=yn+BQLUbUj4SJU7YgEUFnUz+9GRpuPJIIB64WHqgzJKz9ydPs7gq3ZWhtb1QglDMJP/n
	 YqWCBh6oA8ZZUaDy2vtqiImK9NvAxJ7J6d7iqllLoYJT5kwpF+fxHhrcOvU2Nk9rv6FoE
	 0qpdpQAFLV6aTQdxPmvDyaFJCKS32c3K86rvO2FN9nxD+uUHaRJN9t8o7NMdCiibpBTOD
	 HBLJ5jnUrI//HuQIVPrOQbTam0tzxqxfCIoRPxyEbps/ZzV+oAgj6KJ5SHxmmqfk2bOzK
	 qRjmxjQln0kvWhz3155oUOKs214jQRV0DynpXsZKus9uWqxQfHhc5mZA3Z6O3CgyOTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=;
	b=GkaNaZfnLLDOAYhCWh6NkQ+6ZL/5baTMjwL6YJ6R3qIauuqGnZWJWI2hDyTmZQRskhBc
	 38O23evQPd2G7QHVg2K6cxDTAf/+mG4P1mDG/2hMgv4Y6iShesTcjteXNScqJuBZpSU1T
	 qYIvr6ID+SCkSz3ZW5x0EGaZ+TrydaShcPC9cdPkXBu5eoDT47h6jFAzLf76xSZHAxL/w
	 zqKnrtZ1qHj8jOvQFsiqLkeLJkkb3PSbvNd5A/B66nPYh739ONQPikcMZZpFwfuX0++ic
	 k0ycBvoiAf8gyeI5DElW8bWBFftowjGAG8J4fZBi1OEjKC2gM0hFuFgEAWtUaJlApBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ntylGciU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoTaO4RE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE7606A338
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AAE7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ntylGciU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoTaO4RE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBL1IT2610395
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=; b=ntylGciUuJZfpWf0
	c9UM6MyqepvVZTCUP0ikndK0p570RLatJXjQ8tNCA42mvik8m09Q7kgxjCpYLS5w
	3be24pUUqP+OfFXhNIl/dv7A8fLLeH6RfrBGHOO/30xV0aBqh2ZfzKxI677TTEDd
	KcbZ5VbENV+w640ft3HbjuEvm/246WpbBNMsmpm1min/ZK1eV/GhMmmg5YZH3KU0
	zAgVZSwH03j1TilDVNNqaeyEAJ8AqtYa9gTsWf9+netIh/R8bQgtN/NKSM5Ri6RX
	MunrHSIsDg22tgIDcwR6X4XJZb2Z0OVbk665hfMAIpeETNnFmWOLuL8vK6pqqlau
	GQpvbQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92t51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:28:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1256478eec.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795001325; x=1795606125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=;
        b=NoTaO4REEb9T1/yy2aYwwQCVR409nQ7wTShxB4gtJ8U/OW5PfgaUONKvVLtTb2CVr1
         50RcLXlF9+Z4pz9bDGYoRvXFLT9/Y8aj2FBnBKaMtkXH0qsCjRnPXqezeEvlBJwb0IcT
         Yt82bwHCyTUFZmqrvjOc6iyS8ZyWip5ebCafzkfi+uzk8HYYl2U4gDjhEVnoz4einNBo
         QyoNokoRzRhxBRxU6L/w4hFCpMDKANZrvcN2XQV5GsCejOLwMCYtADaE2w2p0EGhurHq
         4MUcjK1AaEPZiYe2vQEm6S98XFI40IdBDf9a/UfWVDzjx+ltweHFBzx2XFz2FvjxyXct
         VVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001325; x=1795606125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=;
        b=2yI4M26AnoYo3jffyojh2c36qzHSrJLAPkAxu8KGpP5tthRLQ2j9rnfAX8Hsz+irXq
         Ejfpw1bgni4WaaBGabJn3LgkMM5EZN9a9I5LSiiUTESBql25XRKsT9Z6XGkXgGnt9+6N
         2xcpRbKWC3dfkE0/xf4kOk+6zfLsiklVQroQ5U4INFf254k6KHkOYHEgqiBdSH+2eEEs
         6RCSGAeifc7Bbuu4mPbHJVGkRKq/fR+i3Zu8qWRIvRgaVA1X65JTTGiHeZVD5tc0AY7q
         OiapWCyJnd7GejBRkzVueAv0VDLFJrEyrkp0z7EcstzUKZ1+p+USdDB6h7B9Nl1uYhq8
         W2Ww==
X-Forwarded-Encrypted: i=1; AL+hErFMstlOxFJn2jItOjo78TzUybTP5lqDiqJiuVLCJSk4JnQ7EuaOXqdxWE+GjUY0zFDKziUua/cbP0O2@vger.kernel.org
X-Gm-Message-State: APuU4Z+423Y4zKa9jbsTx8cnHiNX6+LU5tUfDUMQhgX9uBbUJJ/k9gLm
	UhA88g9Jne8YM/bKmQboymhPvGNq/E3jgZkKCiJQKIJLHMUKp4vz7q4WytyML3ne1x0Ghd5OFQ2
	0eIG597l8Wm4xA9OTooqGQEg+fAdNdZGInAShRH2n9ZQ9EM1JTZFLfDUxN7oPmkob
X-Gm-Gg: AZFdTZeyUEMwy2g9FE4L03kDjhoiQLLrFxWhYMueihoqG+Z4cQp91M1u2meRgXyUIrQ
	YLz1UD9YRIUKbHZujGfUfgVXRLETjf2xkVQbjr9KXS4+wfUnl/qBFlmUs0ydSK/RQUeafVQeErw
	kMO56s1BQ1psSIXykGfgW3biXLRF90RRse8HMaAmq2lqMztVsw9BbDnvkTldSDc4JO/XIiC/3rQ
	Uh05kQfiDkw37iD/S87BUZX12og+gV1OnhA2hpRiPeUOuAW007CkREN0R2/dOa0F6171TennegQ
	8ZI3bj/5xfDFdJT1J/MRsIkQNul5B8Fy347HihD2j/DXF1FgyK8h98lR0viK/ympcTVq7zEwMN4
	AzdeOVUoFIdHfvTrf3+A15WnXLEr64nZWhkE11ESM+IZgkkPhYFfRrlKygwLlTDCxbFylUbS/B9
	F3IKBGug==
X-Received: by 2002:a05:7301:18aa:b0:381:e45d:be08 with SMTP id 5a478bee46e88-38280a3c1e2mr2400853eec.21.1795001323964;
        Wed, 18 Nov 2026 03:28:43 -0800 (PST)
X-Received: by 2002:a05:7301:18aa:b0:381:e45d:be08 with SMTP id 5a478bee46e88-38280a3c1e2mr2400813eec.21.1795001323169;
        Wed, 18 Nov 2026 03:28:43 -0800 (PST)
Received: from [10.204.100.88] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm8539071eec.18.2026.11.18.03.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:28:42 -0800 (PST)
Message-ID: <1fcd89e4-feaa-4072-a5c4-56318b1d8475@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:58:32 +0530
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
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
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
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
 <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
 <vwg74npvbwdhepp4uownnzlj2ybpiknfktfvrpy6462rdw7snd@tj4vgnn3dtml>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <vwg74npvbwdhepp4uownnzlj2ybpiknfktfvrpy6462rdw7snd@tj4vgnn3dtml>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX7CRmzii74fS0
 liBkB6ZMVpW0JSksNiqWo9nzOHT9DZlG+6Y9bczKyYYHA+4W9Lvmw4JrkLkK6ulHk/qnC6MWgi2
 76vsm0jZCKd0+VIJl2/XlBEU+LNj2BRH238CjoxK5JQUIfx77mGzDPao8SUWq4PRf9PtVo2XI7N
 yfGhKqKR1HoaK+jedxvavm5COXZII2ahJKrHf1sP/Ej/a5gKksGjCj0F4dMh9EXOeEV3W42WmfI
 auhXWJCDHK0uP+AdsoKHbON3B5iND5ME1oIwxwQ5eksQ3F00ZU4oRbbnGstERXc4lcPopox2bmd
 dTIpq1le5uSiYXj+t7KA5V6Yiif2G2VQP4FWuXL66+EdMyzjxxUJTjiie2yJcX9rc/Td8adYWb0
 uJOx79AIbDkyTyCh9GZcCOxyu2vpYIfVHJFT+XexN9Vb6jgRCG8eO2dzusPmFSD4WBv5UtoP4pS
 x/xpqk5XtrOWpWwzClQ==
X-Proofpoint-GUID: oxbgoBhJnoLQJBvd6U5epXk4nU56gr04
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX8MKhjlfy+k45
 mM9T58EFbckJxAPsRunbavlecSxAZbj/G2KEbhSBJeU2DTOo09KaWlhUwVjWJFdf/iADz3c9TpH
 EO3Jv2POJmuvn2cashdjo3zdBDUjkGA=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd8bed cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HfRq2NBFtK1Lh0_1ebIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: oxbgoBhJnoLQJBvd6U5epXk4nU56gr04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180045



On 11/18/2026 2:32 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 12, 2026 at 07:10:38PM +0530, Vikash Garodia wrote:
>>
>> On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
>>> On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
>>>> The OF_IOMMU code relies on OF address parsing helpers, but the
>>>> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
>>>> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
>>>> annotation to handle configurations where OF_ADDRESS is disabled.
>>>>
>>>> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
>>>> preprocessor guards and __maybe_unused annotation.
>>>
>>> Why? What's the problem that you are solving? Why is the current code
>>> bad?
>>>
>>
>> The commit describes the problem as "The OF_IOMMU code relies on OF address
>> parsing helpers, but the dependency on OF_ADDRESS is not expressed in
>> Kconfig"...and instead the code had checks for config or __maybe_unused for
>> cases like sparc.
> 
> What is wrong with this approach? What is the problem? There is one, but
> please state it in the commit message. Something is wrong, otherwise you
> wouldn't be fixing it.
> 
>>
>> It was discussed in prior rev
>> https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/
> 
> That's fine, but the reason must be capturedd
> 

Ack.

>>
>> Regards,
>> Vikash
>>>>
>>>> The only architecture supporting OF without OF_ADDRESS is SPARC, which
>>>> does not use OF_IOMMU, so no functional change is intended.
>>>>
>>>> Suggested-by: Rob Herring <robh@kernel.org>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/Kconfig    | 2 +-
>>>>    drivers/iommu/of_iommu.c | 4 +---
>>>>    2 files changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>
>>
> 


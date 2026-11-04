Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773342;
	b=g36RijzFWrfy9+dJu9ge3lwWta9mhV3SkYevvY8YBzNs2fzejrgp/qmr3NVBmqL2Cq2d
	 WAygkzsAfmPx6N688nLAM13NJVLFiiDeP153oB1TbiywC8Z94znDg17MWxr46MTOPVG5l
	 milqRtvDn1fbKItDlw4aRwFwJ+n3+v9gglP9KcPLrDoHUj+P7Jt/fg/Vrr6kyzr4DOM7T
	 nVVNYB/BzdCQTvU+eKbtl5BoqrKfNSh1aHYCWLHzS6af4MBye8rb/PaiIozlRl6ygfHFi
	 xMfwIPUnVChQ9vWbU8Doz3gdaQ71ZXE3Q4enrgfOXBS/G8lUwsJ7CSfZ8e9cviMqL3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9tuwVOXQBEaXsKIi8tl2Z1wOT2yemgt0+YJoz/5KaXY=;
	b=E6tAT3nl7nl2CMqYH+RMdsEkpVa52meU+1KmzwIrHzL5/5gvc38/bXcTO6pKy3fKZ3mK
	 RgagXaZQw0bUy9rVPlTFFrWEC5eIIHJ6XNSuQuciMkNgIMeXtHgwQLGnEltLgb9Pzjf6C
	 Xvad3NM9B5Ik+YbZZdS9xnIdi3zcU37P+CtndJCQp81VMDVtB57rYERWgej/yuQG8I+it
	 xwJnRJ0uBgpYN+3OnqrPG3CTa6sQS/wCOadxaW8yap2TBj/w57FdCOiNiSG6Wn6osFnxC
	 gyKyWwgXvsfah7LmrckLjwvfIjqq8qDANVzhzrmRbJrIn418sK5E6+nS+M2QpZhHr1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQVvdwkf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1VNdBK7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041C606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 06:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3041C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQVvdwkf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1VNdBK7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R7xE193439
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 06:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tuwVOXQBEaXsKIi8tl2Z1wOT2yemgt0+YJoz/5KaXY=; b=VQVvdwkfxDSzkpO/
	4ETpxhNJp+TZTXs3EzISPCHbIKimQsJ3iEuzZ73JH/aA8GlEnLaN/JWY1srGwqTy
	ExQwk4/Jm77GD6X7oObQKoKQUvUjGAiZl5fXP98XnkUT23/N1TLpX0LaPHAFBRmt
	XQmQQnLKLNwPPsBvJBnySGSL7UKeaKPqQJmzVDy8JTylw2PnIoXN1jIQynqbSpEN
	a+ogRPrhmILtrn1HzG4K3cgcNNF7uN9MEwr3qgqD9MRTOpo43bV6Tpb+rjSgCIhQ
	GGS0yV49eo3gfo003nTGn1uq0Rk0k7W+WLGSDRw34yu425ngaDbCP0CVlF+VxBPo
	Fzc7pg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njard-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:22:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso484277a91.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 22:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793773340; x=1794378140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tuwVOXQBEaXsKIi8tl2Z1wOT2yemgt0+YJoz/5KaXY=;
        b=C1VNdBK7N6zqLSSHXKTaGHcCXKHv7R0Ijb2pwGAp7yS0G+2D+b5As8aPO7mkEWwNAJ
         6HQj8DURRjw7Pjyl56k+TpGYb0naiFewciADm2fRWNgp16LkKIH8BLjc7ceoLE4tudee
         nssjEriQuRVbjBMuAkZnGswn2CH+yndCw1C7wss3nIwSIS1CGBmqUizd31eo9YfSVqjX
         3hN5J/SvFDGRw9VvkJSm/S7U5n0X1a0aGHmdhcChsmwfK9RTPOMLLzROE0lW36grLxIr
         EYR277ioNlm7bKsawsyRJfMQPoh6cUxGO70019onBQ2JbGhei90554eZGn6QKI6zoeDl
         qyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773340; x=1794378140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tuwVOXQBEaXsKIi8tl2Z1wOT2yemgt0+YJoz/5KaXY=;
        b=cOWf3Mc3RNZGdOvSf19bd1ymjLbCJK4+Uye9jEQ22sMDj5hLa4Mu8cGYD+wGQxPPNL
         6i9sYG/bK0boYlNTsPyywQztYF6xo+7yyEA6Ovdh2tqT3Ra6EQlPZY2fewUelPPjmp6I
         /mRXqNe91WKDT8qshrFEGVKhMgGOq0jPFQTo1kLs3U1gUvogtDSCjGfnwSv+aot3Jv6L
         nZrUSHZBmjlMhUKCyQMBVJj5Yhl8z0478QhKKtMUPs55FBOLtAFfS2bbZc5z7fJIQrTi
         4mysRskrklj5GiXDjwV+m7gdnDayqsNrrF83PQcBjXq57MUOvznvt//s4jYd1NcK5vw4
         cwag==
X-Forwarded-Encrypted: i=1; AKwUvBxBez/MYRQeXc4aOTZ3l6Vfmh1DbKNc7yohPjeAipwcDAY526Kls9X/tyK0HQpCWYhZeeIl576idxiG@vger.kernel.org
X-Gm-Message-State: APuU4Z82zXI3eMU4CJomTdGwt9wrmkmYwSfBF1C4julFZXmYX8L76jtl
	MMxwCpRwBaSj6xVg5scSXM2XErbu6z6gKcbl5Nogvd381R99N5j/wZlNY6HsmIJpxQWmLWgQmSx
	XYbtPexzlIANh2M233FQoCtp/iXS4fiTI8wxAjOrSWUzrESqe2fp62GZRK0yE+vlM
X-Gm-Gg: AYBFou3WpEj3mOHUfbAG8OYjVPpUKg5SBad9kgTguf63N6jX4an519NDGFXUWxvlZ/S
	liGKquPaQx2Ktg17GhSvooBR8QekW9K8PtWdkyt30ziGOql5O8ozuWPQkZ327rkGskGHjiHLsWS
	wYQ/e1K+onWa7nsoKCMFEVoF6nzih+a/+Oqc4GIuZ8RPS7hT6ouWK1qGEmSJUuBEZnvfJYG82fW
	Fgt5nm7+hlMCTIPTiZpAXzMi+ygtBFCaHhMxCiragGpEnSJSw8jCXg01+9mDAVau7/7KhOTKSxw
	0dfCE3pLtH9X8MciV/Cr+8j+j5WUbUDIKlrwUOBMhK3PLLAYll4/JwrnKHn70QxkJvQUnNkkjsm
	F+/RnRkw4Yv6WXKjXQMscU4KYkBvBo41qO32neucjleHt6fFPstV5bBCFQgVkcq/Y+TrnepDmBv
	kdZCEO
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr12176652a91.29.1793773340071;
        Tue, 03 Nov 2026 22:22:20 -0800 (PST)
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr12176619a91.29.1793773339417;
        Tue, 03 Nov 2026 22:22:19 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944bb7d0sm2303388a91.11.2026.11.03.22.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 22:22:18 -0800 (PST)
Message-ID: <ca063b2c-a218-450d-b28e-7bb1c775e7f1@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:52:12 +0530
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
Subject: Re: [PATCH net-next v4 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov
 <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
 <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
 <CAFEp6-3iRLDJUHAEa4qGGcqJYUSB733wKBFDw_k5NF7LQF+jQg@mail.gmail.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3iRLDJUHAEa4qGGcqJYUSB733wKBFDw_k5NF7LQF+jQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX4ME5SlIhR2Ci
 +LDwKVMr0hkcqv9MCBvQYnGuJVaJ91NB0jiINxZImVuzgeE7OiNe6cDlUNw7Uf55ay7ebqKMiou
 MO7iYcyfiJz7yql+Z8XI98VqeWz+slyT03T5Slt50cWR5WqafznFLGCtFdCyYfZfWspNxHTKppK
 5eCHB08ke/DSJhoFoOUuy/HONnwtsluhdWHCZQjdGdhP0kG833cQ/L8OUlof9zGrU7r57rXZE9c
 4b4DZPYW7SQmVxwVASbSbs0xwXEWML9A8EqiQIaxXVDahXmXe9MppZsvD5hCD/RT2hlg3owdJLe
 a36Jnxt25lKgBtYb30c3BkNDeX2Sgz/aYMajZAtcC301+Kh1Y/qmxCXDUQpZIks9jJmkFc9v6D0
 115iUIWdA3mSv/FvvJeKo+ErrOiWnamAGTGw1/lJyRtOdlSlfwzmSSAze2z/s1frCEQtXoVDh6H
 bcmfSO6X59/McznRQBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX2OZO4GLoY1df
 pG0XT5L2sBMmAjBsWD3q8+8BkzcFB45W+IismQEIpZ08WaVQrjT6ccMOQd6oCRAiMP+4RA34UjO
 p6H8kjrlVTduJrhB6Ui3iFl4LoXu9Vw=
X-Proofpoint-GUID: eqfesI5i8RoCBFxYc34RluYvRpiPxFW0
X-Proofpoint-ORIG-GUID: eqfesI5i8RoCBFxYc34RluYvRpiPxFW0
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeacf1d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HNnKpJZYh0h9KZw2ozsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040025

Hi Loic,

On 03-11-2026 09:34 pm, Loic Poulain wrote:
> Hi Vishnu,
>
> On Tue, Nov 3, 2026 at 3:19 PM Vishnu Santhosh
> <vishnu.santhosh@oss.qualcomm.com> wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain with restricted access to system memory. BAM-DMUX DMA mappings
>> and BAM descriptor FIFOs must therefore be constrained to a designated
>> memory region that can be shared with the modem. Accesses outside that
>> region can trigger an XPU violation.
>>
>> When qcom,vmid is present, require a restricted DMA pool and assign the
>> entire pool to both the local and remote execution environments before
>> requesting the DMA channels.
>>
>> This ensures that BAM-DMUX mappings are within the assigned region. When
>> the BAM DMA controller references the same pool, its descriptor FIFOs
>> are covered by the assignment as well.
>>
>> Track the assigned execution environments explicitly and reclaim the
>> pool for the local environment after DMA channels and mappings are
>> released during remove or probe error cleanup. Skip the reclaim and
>> leave the pool assigned if the remote side still holds its power vote,
>> since it may still access the pool.
>>
>> Fail probing when restricted DMA pool support is unavailable, when the
>> VMID property is malformed, when memory-region does not reference a
>> restricted DMA pool, or when the pool is not attached to the device.
>>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>>   drivers/net/wwan/Kconfig         |   1 +
>>   drivers/net/wwan/qcom_bam_dmux.c | 114 ++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 113 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
>> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698140187ca3141dfe48dbf 100644
>> --- a/drivers/net/wwan/Kconfig
>> +++ b/drivers/net/wwan/Kconfig
>> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>>   config QCOM_BAM_DMUX
>>          tristate "Qualcomm BAM-DMUX WWAN network driver"
>>          depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
>> +       select QCOM_SCM
>>          help
>>            The BAM Data Multiplexer provides access to the network data channels
>>            of modems integrated into many older Qualcomm SoCs, e.g. Qualcomm
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..c9639474e58acc16ce0d04f181b2e999cff42bd1 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
>> @@ -9,14 +9,17 @@
>>   #include <linux/completion.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/dmaengine.h>
>> +#include <linux/firmware/qcom/qcom_scm.h>
>>   #include <linux/if_arp.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>>   #include <linux/netdevice.h>
>> +#include <linux/of_reserved_mem.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/soc/qcom/smem_state.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/swiotlb.h>
>>   #include <linux/wait.h>
>>   #include <linux/workqueue.h>
>>   #include <net/pkt_sched.h>
>> @@ -75,6 +78,9 @@ struct bam_dmux {
>>          struct completion pc_ack_completion;
>>
>>          struct dma_chan *rx, *tx;
>> +       phys_addr_t dma_pool_base;
>> +       size_t dma_pool_size;
>> +       u64 dma_pool_perms;
>>          struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>>          struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>>          spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
>> @@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>>          return 0;
>>   }
>>
>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
>> +{
>> +       struct device *dev = dmux->dev;
>> +       struct device_node *rmem_np;
>> +       struct reserved_mem *rmem;
>> +       struct qcom_scm_vmperm dst[2];
>> +       u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
>> +       u32 vmid;
>> +       int ret;
>> +
>> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
>> +               return 0;
>> +
>> +       ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
>> +       if (ret)
>> +               return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
>> +       if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
>> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
>> +
>> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
>> +               return dev_err_probe(dev, -EOPNOTSUPP,
>> +                                    "qcom,vmid requires DMA_RESTRICTED_POOL\n");
>> +
>> +       rmem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
>> +       if (!rmem_np)
>> +               return dev_err_probe(dev, -EINVAL,
>> +                                            "qcom,vmid requires memory-region\n");
>> +
>> +       if (!of_device_is_compatible(rmem_np, "restricted-dma-pool")) {
>> +               of_node_put(rmem_np);
>> +               return dev_err_probe(dev, -EINVAL,
>> +                                    "memory-region must reference a restricted DMA pool\n");
>> +       }
> You later test with is_swiotlb_for_alloc(), so isn't the above test redundant?

Right. is_swiotlb_for_alloc() is only true when the DMA core attached a
restricted-dma-pool from memory-region, so this check is redundant. I will drop it.

>
>
>> +
>> +       rmem = of_reserved_mem_lookup(rmem_np);
>> +       of_node_put(rmem_np);
>> +       if (!rmem)
>> +               return dev_err_probe(dev, -EINVAL,
>> +                                            "Failed to look up restricted DMA pool\n");
>> +
>> +       if (!is_swiotlb_for_alloc(dev))
>> +               return dev_err_probe(dev, -EINVAL,
>> +                                    "Restricted DMA pool not attached\n");
>> +
>> +       if (!qcom_scm_is_available())
>> +               return -EPROBE_DEFER;
>> +
>> +       dst[0].vmid = QCOM_SCM_VMID_HLOS;
>> +       dst[0].perm = QCOM_SCM_PERM_RW;
>> +       dst[1].vmid = vmid;
>> +       dst[1].perm = QCOM_SCM_PERM_RW;
>> +
>> +       ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
>> +                                 ARRAY_SIZE(dst));
>> +       if (ret)
>> +               return dev_err_probe(dev, ret,
>> +                                    "SCM assign restricted DMA pool failed\n");
>> +
>> +       dmux->dma_pool_base = rmem->base;
>> +       dmux->dma_pool_size = rmem->size;
>> +       /* Track the destination VMIDs explicitly for the reclaim operation. */
>> +       dmux->dma_pool_perms = BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vmid);
>> +
>> +       return 0;
>> +}
>> +
>> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
>> +{
>> +       struct qcom_scm_vmperm hlos = {
>> +               .vmid = QCOM_SCM_VMID_HLOS,
>> +               .perm = QCOM_SCM_PERM_RW,
>> +       };
>> +       u64 src = dmux->dma_pool_perms;
>> +       int ret;
>> +
>> +       if (!dmux->dma_pool_perms)
>> +               return;
>> +
>> +       ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
>> +                                 &hlos, 1);
>> +       if (ret) {
>> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
>> +               return;
>> +       }
>> +
>> +       dmux->dma_pool_perms = 0;
>> +}
>> +
>> +static void bam_dmux_remove(struct platform_device *pdev);
>> +
>>   static int bam_dmux_probe(struct platform_device *pdev)
>>   {
>>          struct device *dev = &pdev->dev;
>> @@ -796,6 +892,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>                                       "Failed to get pc-ack state\n");
>>          dmux->pc_ack_mask = BIT(bit);
>>
>> +       ret = bam_dmux_assign_dma_pool(dmux);
>> +       if (ret)
>> +               return ret;
>> +
>>          init_waitqueue_head(&dmux->pc_wait);
>>          init_completion(&dmux->pc_ack_completion);
>>          complete_all(&dmux->pc_ack_completion);
>> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>
>>          ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>>                                      &dmux->pc_state);
>> -       if (ret)
>> -               goto err_disable_pm;
>> +       if (ret) {
>> +               /* The PC IRQ may already have powered up the RX path */
>> +               bam_dmux_remove(pdev);
> Calling remove from probe is a bit unusual, have you checked that
> everything is correctly balanced?

This was changed in v3 following the Sashiko review of v2 [1]. The PC
IRQ is already requested at this point and may have powered up the RX
path, so in v2 the error path reclaimed the pool while the DMA channels
and RX buffers could still be active.

Yes, it is balanced. At this point probe has assigned the pool (if,
qcom,vmid is set), initialized the works, wait queue and runtime PM, and
requested both IRQs, which is everything remove() undoes. The steps that
may not have happened yet (netdev registration, RX power-up, the PC vote)
are handled the same way as in a regular remove: unregistering an empty
netdev list, power_off() and free_skbs() are no-ops, dropping the vote
only clears the SMSM bit, and the wait returns immediately if RX was never
powered up. The PC IRQ is disabled before power_off(), and the IRQs themselves
are released by devm afterwards.

Do you see any specific concerns here?

[1] https://lore.kernel.org/all/178996250389.2160803.17277339384338088713@kernel.org/

Vishnu

>
>> +               return ret;
>> +       }
>>
>>          /* Check if remote finished initialization before us */
>>          if (dmux->pc_state) {
>> @@ -845,6 +948,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   err_disable_pm:
>>          pm_runtime_disable(dev);
>>          pm_runtime_dont_use_autosuspend(dev);
>> +       bam_dmux_reclaim_dma_pool(dmux);
>>          return ret;
>>   }
>>
>> @@ -879,6 +983,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>          disable_irq(dmux->pc_irq);
>>          bam_dmux_power_off(dmux);
>>          bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>> +
>> +       /* The remote side may still access the pool if it holds its power vote */
>> +       if (!dmux->pc_state)
>> +               bam_dmux_reclaim_dma_pool(dmux);
>> +       else if (dmux->dma_pool_perms)
>> +               dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>>   }
>>
>>   static const struct dev_pm_ops bam_dmux_pm_ops = {
>>
>> --
>> 2.34.1
>>

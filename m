Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD5565103
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003399; cv=none; b=WD+P6dIZQP4dt8fNSK0LyBazE3olYW37n0Ef14JuQs7sQCYL2EAdFNLvrn2ZwwyGvIFDfISUSrfIimDSuhjisQmNvezxKGExQK2mbSZ+bbQbgeNqVJ0hdlxrVrWjBwD5yD3WIHzaQKba/rQGZ8xkHuqRRZam47rrEwf3tKvZtXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003399; c=relaxed/simple;
	bh=w12UJCXmoPgOejvC7+pwZJ5tYzsSXZ0zhjRwU9QoS48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ke57vJJchPzx0fZlXye2UMuc3wKTcY1SnxdXY+vkFj1pIPgKBS6LpIc9V6+jQsdxPSMZyZBauUTipN/7nb/2jS+bbXhFpAuVtaGlAcsCFvZHAKUamZCElhG7LOzBtCXMLuSevwCvJCStjSmwbWEihOxgbzd22du/t7uvdpV9p1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrvI99d/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQgaaGtr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrvI99d/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQgaaGtr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpaFv1672232
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0B3rQH0JRJrNGJlm78wyMsk4h4oAZUsILKGncMUfG0=; b=BrvI99d/BJFRtfGD
	c1QyR5/4QEJFXnDqRPXcOC7jZq+ocFtb3+eGk078xSQz9QRw13GrAqxI2XXcwSZ8
	SQdR7JdXJn/KcFZaJ699XFGGQpU4GeX6MKNLk2ujMURbp3KZpWxbeDTdM6qZlYuB
	rPqN3zBUEQBK/h7QmXMGYuwXpo2Lr3nQLAxk20zM3XfupN+VWM9blPVUMpu2lr8U
	goBpxoIOidFPNo2PSnmOYZupNrTy+N+xKMYIMwQURhdSWfSVPqJtxjKTuhtImUIQ
	NA+OrINS/+bhBemyfZQ9PxRfRWIYYbfMGArKAyfzcqdn/2PGpowBPv+aPc3SoLrg
	MQgwBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh8p7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:43:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso310026185a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792003395; x=1792608195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0B3rQH0JRJrNGJlm78wyMsk4h4oAZUsILKGncMUfG0=;
        b=DQgaaGtrhprq29zxbrADbg2yLUXfQh+cND0rRQ57EPbjjlBwvjz7GjWyAjbUCm6jRU
         bz86uoBYKCPWyoKlorRKWxUv5jqBTxCSwH880XYtUztXUyP8tEtnv7mNlQjFVW9iWdTk
         aIoNtr6Fj/mrwTve8sOIDIKLzfs3lSScErrWqb46h/v3XBBa7Bqg34Mu7kJjstSgIFby
         LLRkEUkRHT3FkCLztYaQuj87i4dLGLGnyoArNfUaCIfO95xkwDqM8J23P/DsWkR2MUJw
         KJalXE5ngudSdtB8+k7vSvPbltJZa5wrhE2dr640pIz8t+l7jdmWrETJ93uBFRAx8Hon
         Z8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003395; x=1792608195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0B3rQH0JRJrNGJlm78wyMsk4h4oAZUsILKGncMUfG0=;
        b=2lR/U7WuPYh9LfhtdBX5NMtHwXLFm41a4Grea/ecLjSUV7owdO4fy532DfUciLZoBO
         s2GgpQ69P2uWdr/kMvTl8kFahcAIbjRLHuGBt9h9xHjVb2YbKIBbUpbdxBuPHQQ9A2EH
         18z1h6bLY50aitJ24pHR2xFoCeji1O6iVVesfSchMtfM5ggyzp6ZGa/dPhZSqzef9HDq
         evYzZyawUtCkHputi+K1shiZPNEig3f4Ah8ff478lHI+c9rfI14UavkBPJBfEVCOlniF
         TUu+2cuqi0+SazyO0UTlJVNmq0r/2BORmGIoUxpWGEDa9Q2OIZFrjfa8VQDsiRaE4C/U
         0vHA==
X-Forwarded-Encrypted: i=1; AKwUvByR6EfrM2XGmAXHZCK2M4i243Peulzxc8dh4GWEDx0aZ/CQurJW7BVnSnQzQLZ25gKHpX9uKByiHIsj@vger.kernel.org
X-Gm-Message-State: AFq9FYIlw0dZLbeK/vHKFVbpi0l3mnnW/z7YX3C+mTpRq1ws1LR6CNI6
	Ydk3JbDK4n5Ekc9hLKGB9n33M455DJWzWev+hbSdhS5t2Ga1Ctl1Ff+J/q9L1tmNu0j72oLSxt+
	Hp/ePyGCC0yLaXSS+385L8hqR2/Xj5+JN7ws8LAPDxeSP+4e68R6nYLX4PxXW07xi
X-Gm-Gg: AYBFou1p7h0b1Tbg5EiUx66eu3ECCC+JTFrvz1xDPVw5KQ5zLlpLg/GFXeA9i7XQuv1
	ZA4RSnHy5A/IQ6gt9b21do13d1PmlUqcVVSdbkCjeLjih2ex0tfT3kpG7pqzu1IaprJfFVTz/Yr
	7RBJEiPHVxokgawpu/KuRgY7+NrOTwvxCivj9uw2pb/AdVz6NInH18loGy+IsXkVTuH0SrWNEQK
	8FOB9PumC8NhNT3Sa/AVVwUVGOvoCgi1bFag93iH02ZtFOtwsCC35ufPR/+1Mwbdz/+4INhKktA
	L0/q2jvIZmizMLoMrMVXG+tkjoXKYUB/5VLDKod/6d4zEWHOZL/GTGuMT+Un3pciwH1i9+BgTYB
	HYt8BmJNVA6jjzglbt+/nukSEgkZrxVMzTZNT6PcXNqnwc0eEVCYsgOjvuM+O9Q==
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2765570385a.13.1792003395180;
        Wed, 14 Oct 2026 11:43:15 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2765566685a.13.1792003394607;
        Wed, 14 Oct 2026 11:43:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993caesm19308895e9.12.2026.10.14.11.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:43:13 -0700 (PDT)
Message-ID: <5874ea6e-4e2f-416e-bcc1-851461c7308b@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 20:43:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, linux-kernel@vger.kernel.org, naseefkm@gmail.com,
        robh@kernel.org, tglx@kernel.org, grandmaster@al2klimov.de
References: <20260918153606.344143-1-cjd@cjdns.fr>
 <20260918153606.344143-6-cjd@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918153606.344143-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aS_I-28hblG-oex7qrcTvMYLmnDZ56n8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NCBTYWx0ZWRfX5mvcJOWuSREW
 X8hdVQbF2fzDLSvz3UKUVcLtVtAc3j/h0c7EetlLxagN6kvL6ffvrIdU0yxO0R9/EQ06sQrtmTw
 Vk8ZloH0fHTRS1nGDa+BCQvZeQJwUKo=
X-Proofpoint-GUID: aS_I-28hblG-oex7qrcTvMYLmnDZ56n8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NCBTYWx0ZWRfXzxHPa8piaS3K
 7GCS/QVPtkQVB2P1/yhiL9jOXuqHxnWHg0dDv4ALYbDtA19PinHpQL6Nrn1N+nSdb8H5658ZT/o
 1xTMbPNfnyj+2q2YfiGiKG8O1xn6vzNKy4Czvi7cKytVSJDsanJ5QXHoeE4FtU83C4Ijb4l46Gw
 uScR4iAiQmTFk+CJeNSRZug3J7VXEdVN9N8dtKeluxSA4bkxZtV8YeW0xuq14qCSFNqFYCAd7E8
 NE1TEf0SfXkkCQxLPxWN/H+eNV5ctYNCN+9z95lbod5EFZQVEN9aHb9zikWBu9cONLDaFU2UNzu
 EFR/Wj9FochIgaLlV//KtwbfCTFvjQrxHXlTutKh/+f2Vikf43qlzDUqptduCsR8yh5Ie5BdztE
 y+fKpwBGbf5dS8CqXpzQwfe+KhLIfWIVrzQluQ5cITIj2Z6qRcJc0JRAb4KlvH8WdOBpwvcUxaS
 /gtne68/WFMKEeaFSMw==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfcd44 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qzuFoDSjp3ydXB7kr3YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140074


Hi Caleb,

with the help of a LLM, I got the following two issues with the changes

On 9/18/26 17:36, Caleb James DeLisle wrote:
> EN751627 is based on the 1004Kc which uses a different interrupt number
> for each CPU timer. Support both this and the EN751221 which uses a
> single percpu interrupt.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>   drivers/clocksource/timer-econet-en751221.c | 122 ++++++++++++++++----
>   1 file changed, 99 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> index f2c4c1ee0a56..ff86a7edd31d 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -21,10 +21,12 @@
>   #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
>   /* 34Kc hardware has 1 block and 1004Kc has 2. */
>   #define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
> +#define ECONET_NUM_IRQS			NR_CPUS
>   
>   static struct {
>   	void __iomem	*membase[ECONET_NUM_BLOCKS];
> -	int		irq;
> +	int		irqs[ECONET_NUM_IRQS];
> +	bool		is_percpu;
>   	u32		freq_hz;
>   } econet_timer __ro_after_init;
>   
> @@ -102,6 +104,25 @@ static int cevt_init_cpu(uint cpu)
>   	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
>   	u32 reg;
>   
> +	if (!reg_ctl(cpu)) {
> +		pr_err("%s: missing address resource for CPU %d\n", cd->name,
> +		       cpu);
> +		return -EINVAL;
> +	}
> +	if (cd->irq <= 0) {
> +		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
> +		return -EINVAL;
> +	}
> +	if (!econet_timer.is_percpu) {
> +		int ret = irq_force_affinity(cd->irq, cpumask_of(cpu));
> +
> +		if (ret) {
> +			pr_err("%s: failed to set IRQ affinity to CPU %d: %pe\n",
> +			       cd->name, cpu, ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
>   	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
>   
>   	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
> @@ -110,7 +131,10 @@ static int cevt_init_cpu(uint cpu)
>   	clockevents_config_and_register(cd, econet_timer.freq_hz,
>   					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
>   
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	if (econet_timer.is_percpu)
> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	else
> +		enable_irq(cd->irq);

The new path calls enable_irq() each time a CPU starts, but the hotplug 
state has no teardown callback to disable it. After an offline/online 
cycle, the next enable_irq() encounters depth zero and warns about an 
unbalanced enable.
The IRQ also remains eligible for migration when its CPU goes offline. 
Since cevt_interrupt() selects the timer using this_cpu_ptr(), an 
interrupt migrated to another CPU checks and acknowledges that CPU’s 
timer rather than the source timer, potentially leaving the source 
interrupt asserted.
Add a CPU-offline callback that masks the CPU’s timer interrupt and 
balances enable_irq() with disable_irq_nosync() before migration.

>   	return 0;
>   }
> @@ -141,19 +165,52 @@ static void __init cevt_init(struct device_node *np)
>   					  CLOCK_EVT_FEAT_C3STOP |
>   					  CLOCK_EVT_FEAT_PERCPU;
>   		cd->set_next_event	= cevt_set_next_event;
> -		cd->irq			= econet_timer.irq;
> +
> +		if (econet_timer.is_percpu)
> +			cd->irq = econet_timer.irqs[0];
> +		else
> +			cd->irq = econet_timer.irqs[i];
> +
>   		cd->cpumask		= cpumask_of(i);
>   		cd->name		= np->name;
>   
> -		cevt_dev_init(i);
> +		/*
> +		 * Tolerate CPUs that could exist but don't.
> +		 * Fail in cevt_init_cpu when they try to start.
> +		 */
> +		if (reg_ctl(i))
> +			cevt_dev_init(i);
>   	}
>   }
>   
>   static int __init timer_init(struct device_node *np)
>   {
> -	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
> +	int num_blocks = of_address_count(np);
> +	int num_irqs = of_irq_count(np);
>   	struct clk *clk;
> -	int ret;
> +	int ret, i;
> +
> +	econet_timer.is_percpu = of_device_is_compatible(np, "econet,en751221-timer");
> +
> +	if (econet_timer.is_percpu && num_irqs != 1) {
> +		pr_err("%pOFn: EN751221 clock must have 1 IRQ not %d\n", np,
> +		       num_irqs);
> +		return -EINVAL;
> +	}
> +	if (num_irqs > ARRAY_SIZE(econet_timer.irqs)) {
> +		pr_err("%pOFn: Too many IRQs max %zd got %d\n", np,
> +		       ARRAY_SIZE(econet_timer.irqs), num_irqs);
> +		return -EINVAL;
> +	}
> +	if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
> +		pr_err("%pOFn: Too many regs: max %zd got %d\n", np,
> +		       ARRAY_SIZE(econet_timer.membase), num_blocks);
> +		return -EINVAL;
> +	}
> +	if (num_blocks == 0) {
> +		pr_err("%pOFn: At least one reg block must be provided\n", np);
> +		return -EINVAL;
> +	}

The binding requires four interrupts and two register blocks for 
EN751627, but the driver sizes its resource arrays from NR_CPUS and 
rejects DTs exceeding those sizes. Consequently, a UP kernel (NR_CPUS=1) 
or an SMP kernel configured for two CPUs rejects a valid EN751627 DT 
before registering any timer.


>   	clk = of_clk_get(np, 0);
>   	if (IS_ERR(clk)) {
> @@ -164,7 +221,7 @@ static int __init timer_init(struct device_node *np)
>   	econet_timer.freq_hz = clk_get_rate(clk);
>   	clk_put(clk);
>   
> -	for (int i = 0; i < num_blocks; i++) {
> +	for (i = 0; i < num_blocks; i++) {
>   		econet_timer.membase[i] = of_iomap(np, i);
>   		if (!econet_timer.membase[i]) {
>   			pr_err("%pOFn: failed to map register [%d]\n", np, i);
> @@ -173,22 +230,32 @@ static int __init timer_init(struct device_node *np)
>   		}
>   	}
>   
> -	econet_timer.irq = irq_of_parse_and_map(np, 0);
> -	if (econet_timer.irq <= 0) {
> -		pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
> -		ret = -EINVAL;
> -		goto out_membase;
> +	for (i = 0; i < num_irqs; i++) {
> +		econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
> +		if (econet_timer.irqs[i] <= 0) {
> +			pr_err("%pOFn: failed mapping irq %d\n", np, i);
> +			ret = -EINVAL;
> +			goto out_irq_mapping;
> +		}
>   	}
>   
> -	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
> -
> -	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
> -				 &econet_timer_pcpu);
> -
> -	if (ret < 0) {
> -		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
> -		       econet_timer.irq, ret);
> -		goto out_irq_mapping;
> +	for (i = 0; i < num_irqs; i++) {
> +		irq_set_status_flags(econet_timer.irqs[i], IRQ_NOAUTOEN);
> +
> +		if (econet_timer.is_percpu)
> +			ret = request_percpu_irq(econet_timer.irqs[i],
> +						 cevt_interrupt, np->name,
> +						 &econet_timer_pcpu);
> +		else
> +			ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
> +					  IRQF_TIMER | IRQF_NOBALANCING,
> +					  np->name, NULL);
> +
> +		if (ret < 0) {
> +			pr_err("%pOFn: IRQ %d setup failed: %pe\n", np,
> +			       i, ERR_PTR(ret));
> +			goto out_irq_free;
> +		}
>   	}
>   
>   	cevt_init(np);
> @@ -220,9 +287,17 @@ static int __init timer_init(struct device_node *np)
>   	return 0;
>   
>   out_irq_free:
> -	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
> +	while (--i >= 0) {
> +		if (econet_timer.is_percpu)
> +			free_percpu_irq(econet_timer.irqs[i], &econet_timer_pcpu);
> +		else
> +			free_irq(econet_timer.irqs[i], NULL);
> +	}
>   out_irq_mapping:
> -	irq_dispose_mapping(econet_timer.irq);
> +	for (i = 0; i < num_irqs; i++) {
> +		if (econet_timer.irqs[i] > 0)
> +			irq_dispose_mapping(econet_timer.irqs[i]);
> +	}
>   out_membase:
>   	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>   		if (econet_timer.membase[i]) {
> @@ -235,3 +310,4 @@ static int __init timer_init(struct device_node *np)
>   }
>   
>   TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
> +TIMER_OF_DECLARE(econet_timer_en751627, "econet,en751627-timer", timer_init);


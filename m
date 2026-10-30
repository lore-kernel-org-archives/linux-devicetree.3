Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380546;
	b=wKLf9tkJjHstM1rVL+q1IlpKejMEnU0hzpWXAld/mjSUJGHXSOkL5FNa+n39jDt4CmEs
	 19xRNX/PrDbQeMlNT4VvIKVOEsXmdvgt5eBxL+PplUPxipMSK7sH41j+NNxaxeAK4hY0B
	 +Sc000XWDuldYJhyPQbBSH6sF44QHVqPIo9+RPoN7UiUBR3KKaBd1+K+gAjKjCn68dXf2
	 YFR8W2nX5JO9DEEs8xOd+6lR2Q/fKI1chLzyNUNcjs0zSkPDxpKVovnN/Vh7QP8lh4XZE
	 oXSL1dkygRz0wd73y6P7kMvDuWoekTMkZ9MklpZ/bhntm2AACx5xv6wXdWIc/kRh0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
	b=3bCSVHh1wFvlX/hiaDNtOH7bKnBnPk+/OIHr1igCMmD7IYsn7bKoojhvIbfx3oiZYa0c
	 13ui4ZOT2pEwOtgxhIf3xg7/8tv9zaWcEhfrj8EnesyZPstqZG6O2QAwm+ICVKgJBCHYc
	 TqFiy9PiiOWuyd5yDs/98xaiY2sPNPWu7e0vhWnJEHIF++1tinQCp5T9lpgOxQGjfacgC
	 NH2YKKxC1/n6iGFzUu7AwnntQoRVbN/iG9E+W45rblp5MP+mbLTgQWBRy5IKLElEKYpHL
	 tkl2alByRdRD4uCitWGnYnJandsCd45U9FSke3LIyZghhQoG2KRs0kC8AIsSflipW/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok7kjFAE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE24606A322
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE24606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok7kjFAE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERit23207534
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=; b=gOg5RBwV3PekfPEO
	+oPNR0MVxk61KNp0EZqXCjntTL7j4cVnSVzh7z3b9qxaJWwQ/YhTjpy4PWVFXxsk
	8ofXm9Ev2QDaCKCRJ25ySsUt6Ld7Y0MZnUaM/dpFcTXfVq/ktbtB2SNXbFtEgZVL
	G0phIgX+21A2uq2glFvBM/JAXw6P7FZLJtzmdHRCtGVpORuCcknmE4OgOw5JtLcr
	FHYGSxMHu2ENa9koFK3nCZACjRCEwathVg+HlRelK3XOjRG5GqEGdT3+dya6XfnS
	hWRi+3hpz9x/oRkNoA2lis9X0ApSlHymkCPdxOPcquezvNHjijLBzKBg/lRtPUGM
	fygoGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm5r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:15:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1780292eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380543; x=1793985343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=Ok7kjFAE/wMO26XgBDa8NLGudqIFB0d9pWAV3FNdTnipgS6t4j8XPRPPtwhrX+eao7
         yyneli2iiFW8FSBteIJLYXVkC4r8S05aaRuQGMsWb/y9HiMC1SXoJUW2cqQDQgGiyNg7
         fOtvGbAtRZFRkckMZUv54GhG/DbnjmM6QLYDnwlzKTQQ4hWwzOgGH0k8/hYLts7RHmrV
         b32d34GyTX6+psIY/+zvSEIZbw5s9gFUP/GiehpmhNj70EMTOnbcfQtSieMS/oUhgH+3
         oWtEB7dqIEn5wX4J9y/EgmCmNlWgwcNS0/x/mxgJJf9EDdn238m/ep77upDv2W8eUmsh
         ppaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380543; x=1793985343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=Czpbp5yvrnvFfJWEhhQZ/d/VB+XmkVXZb0CdZtXjDuep9Iuc0j4g5O7QnPR67BNsxD
         YLLkhFaUikqXTZDOANZbX5GoKtEPnMKC61wA08UobXM92MBf/p35pGx6z6w5Sa4jtUrS
         S14KNDGmVtsWWo4TggEkXHciZJlQHRieknOWSpN8lIyIcIeNJJn+zga7iUzdrtIf4xEK
         RPTKIiSL0rezE0CaN/fKsD/FHtp330aynaISNrbDFoFvZSV8BcXVhAbBZIni49b+TJOJ
         +cKLWH3X+fqKmhKk8tyj5WPITUhxuqaK7yQT7n53ylNYSiAPVx7R1fpIfpLFTiIkvGmd
         R17Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdlNzNe4sgL41kde+hOQmSD2z1oFkRGx5LXjyASK8iPygGDVVtOY77iS7/8K++4ikP4atYCIMPkE7z@vger.kernel.org
X-Gm-Message-State: AFq9FYK++Bxx1que6BTJ/KMobh9ZE1bZwaD7KhO1hu4uNefsENtzDgDz
	+v6szsXK+1pEDHlBt0wSe4UDG0YJS8MVzKQwsH9Qc9sYTqfqWOYjeFHi79QvBf8pPtHyXOWgJK4
	GMiEVLyW0mbzgWBOB1WcUUdidP/GSMU1Stm1bmImQcT5HWXjIwxjLMOvV5d/u7RXt
X-Gm-Gg: AYBFou2XijNlFCY4fWdsbvaS7QyA3MuVA+PJsoHviiBBBMYudtTgtMOryK9BlgtIqIH
	pXSbl4qwdgWNHPOpcP71N9FUSXjiA6Q4ASsWOyEa8Bnl8flqMgcTPkue+3UGx4kfDMgbG9RGb4v
	IGq5hk7MRFLK0JThvoWcrJf7kl1q3InLIKoYB+NWeNNxmi5g0n5DKG9lBiLz+SwfiDHGe9Jbzra
	A0U9wT0WdjQcFOHunbKeab+z7M2H6a0q2YgDYOqQqGv2thtxsww5V1270YS91knK9V0cZJ2Ja+p
	syeYLM4Fx3ieVC44NnqhMihwszTe5qTr4QLQWeclGA6pKey4zX3AZf5jt+EXUDy7V150JfpzOT7
	CteT/bGMECY7YtMlBZTFfc169pL/WCyDPHHX/AjH3SwiCXL1HHMKEpkHwvbnGbgOjQ4SVJMULTh
	9bKeHaeOIO+EE23Y/Lsf5codOM8nJ6GQMYTEePQpie7Qh0zJfWoPMWfsh8P9JvgzK0
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833677eec.16.1793380543162;
        Fri, 30 Oct 2026 10:15:43 -0700 (PDT)
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833632eec.16.1793380542666;
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8607711eec.18.2026.10.30.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Message-ID: <ba4afee7-5c3b-43fe-9703-9cd42e0fadca@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:45:31 +0530
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
Subject: Re: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4d0c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=-Elna7LzL5zmvItKdG0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YMuTPHbDmhvErr7OnJHZnXLlRFf-jnmq
X-Proofpoint-GUID: YMuTPHbDmhvErr7OnJHZnXLlRFf-jnmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX6eHEJ8j8jJWs
 sC2B4zKwbzkbEBeWp/hBugJDFFBldAJDhRhe6+xte/Cc3ohVu8bBGHuyHfGvtEY+Eo9xUSjY1Qn
 yzFxpIL6tYyFJ/QYjDTD50lqaaaWzOsLIqwW/CB1BiKjpbakrxNNo51+fSSH69ofEO+sEnBn7cu
 d6iAMBqQGXrim094Iw2nI6cI6NqVYXbGgp5OZMtUxExUHTHuzFTgcNAw9SYqoVwtmVeImYlzNkY
 E/raBnRPXzksPbidZW7PxFqZF1bNp2wyhQj3v+/GY2Z3LLFBRm5nPctnCLoro7DC5yRvretLiDM
 aftibhfuRcgNFSy+7BX6LHIJZHi+HLO69ZQXuwdk94m5KpQX3fknjEsDfnpH4tOO/xvtH324Jnv
 eygoXKWE67aWb01gd74RhRlJEPSy2G6saQ8Nj+6l1Ib+lC4EmbYxIBeJecvIoFC9EhXUERs1C7z
 HzYP9jKDWc74qvm3ayw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX8XI52wpTq3hY
 2oCAsw4vF20yLcLyJZmYozTIJeQWAonXt9K18X7JnnTBK9BvdLok3We7ZQPqoHNB5xhJ2E2zEsz
 OWRhfFUefSCh9bhMsF+fmzLiBonfjUg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

Hi Yin,


Reviewed by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


On 10/28/2026 5:15 PM, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..347a5a6d6a1d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>   
>   	lockdep_assert_held(&mpam_list_lock);
>   
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>   		return -EINVAL;
>   
>   	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 
Best Regards,
Srivathsa


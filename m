Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C24E36F3
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776476; cv=none; b=FrPtYxZnTKAiR6Uze9KNKtoRaDiMAZk9wWQcfdIoG0fW2E3G15b+ShNTlx40Xe+0fklDicTqiicPo0j84XNs5nMX84McSU4XUrIxUpfzHNkr59Xp2gSv2CKAEVCJw9XcGol3xrXhKzxiTkSx72+4EXln2E0JpLHZf/ARVnaVwPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776476; c=relaxed/simple;
	bh=p1dEZHWOCqIZMCAeAr+JzcO6l6qzrMOZX05XuccTfpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgwuBNCk/WDCOqIzU/h3UyWcfYRumyhpfKcHxxzv9xhpvLj5jHLcmMQSqEobVZFHfUIzL2/Bob9HfEsADlQSiyA2pSKHvREODqjU0+8syBXUxRhR++DPeotIdhXWWHJWjRMHmz7o5id5bJH9x8mWaKzq7xMvn0O6tpgfD8blXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCMLeh7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpthFHLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCMLeh7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpthFHLp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDrbEg3655544
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ilMQ1MePaJJxNUKIWbLqWASxBz/Hn4eNufkx/CW0Bc=; b=PCMLeh7yiWmm+35G
	zdZGlJW9aILRtFQYJdRMNoVpq1QSUhrim8lmHIpKSqUm+h5SgN9ly4c3RBaQn4Ls
	CiNvFbTbPyR8DJuQFDUcJh8OTKg9pqzby/Ot34U+tFtSDLWfrSc5lKjj1VhATrzJ
	YWl+/gIPsp79JY41V31mjcZoi5kBSu/h/ZVAxvvMLxxp+J+2FkTexgqs6xJGhVnN
	UGrufjfVFNk8LrLWWWhU61uUm9P8Xnl5txXKeaORAvqFRbafSuhyLyTqV9YrziJy
	CI2fBIjLJlN3nS9NzFagoF+8iNjUyhrGVpPwHI7AnmNREJfcXiNG4ITV0w4K+G4o
	buZWxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2u4xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:54:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86917d18880so4147950b3a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790776463; x=1791381263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ilMQ1MePaJJxNUKIWbLqWASxBz/Hn4eNufkx/CW0Bc=;
        b=RpthFHLpqHg4pBnTCJD3pi1bwHUU/Tae7RhXbhq1N16KS2wqyyTlVRLzmaIzjkpMcy
         BSyMiiicRmabZ2xQ9Woco4fxxZ/koPVIAB1L5UbEOj5tsBx/zwwDELqXTAkMo2pztP17
         tjLYKpqva04LOv0Zqx5j2ApDzJFGLu/vpsP2hOdUZMWQc4RN6x8VFrd6lGTso4b0E+An
         iZDT3apKueFMeFaYz5CKynYL5ytg79YB6PIwuqLyy5XCAH3ZHGT5/u386WGb2zPMWu7r
         Ug/1J5iHKwvXDQ2/PsPw6BLArMo0axeg6Z3zn8fnYiSkFDtmXsvuhHyhzHDCyY+zFOym
         jOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776463; x=1791381263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ilMQ1MePaJJxNUKIWbLqWASxBz/Hn4eNufkx/CW0Bc=;
        b=D2p1Fa7wqyZxbCYZ7P4yjneyo5SWJZ+AMtYpHiv6uaecNJfSbSud/UAF//LiiTtvik
         vDQwb0OTvv6OJhw9PxRg5shrzW6gqErH153ETuIXCNze9kSJ1/eKTtUQL5gIMak67U4v
         E0yMoH16GZ25S38Jxv/vJ0ZwPE1/KS2iiSo7/8BVEFHd2DrzAWBl3AASDIF62cKQzYlf
         /onW/S6IdCR/5bA9Ro6rxl91PgVvLTa0ulyZ4WdqGFyb25oUFYujSk5lw3Wr+QrkSNQ4
         GbHPaLppqtKg5cwJoIfZnQkReSN0wsw+0EFiQ1cN0Y6GbW1c9L+OMQpRQjNQFKExZS9u
         aNwA==
X-Forwarded-Encrypted: i=1; AKwUvBxwdQDJU3rpzQBrhujNarcnrjyR/qG6PZteAl6WKCPMlXZjnp3N5CcHEkgrch2b1YI0RyaIcW191Cd6@vger.kernel.org
X-Gm-Message-State: AFuF++k4kNndBHJt6PGONEXkHZJl4BtEijT/BOOkKgqLMCv9fHiE3Fpw
	FlxpVIrxinbUHPUIgrroaO7j42G3zIkRNz7ONarYS0mQICTWcVkaCHhRFLkZs9yZaTqTRSEtjgH
	zKfYRM/ack+VsmxgBvTPxuj6iThi5ywM4lSf+g2kKV8Mr5W1qgSkLy5mDwVGBxOYm
X-Gm-Gg: AYBFou1OvLrdF2DXx40UY+/2Je0l35v39NLPv6/mIzH2g/6Qfucc38Zi3kFYJ3CDReX
	6haHtNYWuZOFcGfRq2Qr/dldqeumN8ggWCVtG99h6MMXhzebDVfZQuczusD6NnF1LTdu9gpA2hF
	1BXzI+Bkqirri7NPff4Ygti8KuSASAGWNk6QJty50dGdcsjHiyrIDp2AOmIRKx/kBVlKQXsKLTv
	CxNSPND2wePtLXEdItHTKIAf+2rXHeVH1dWOCerhMWnc5xIJ13XU6pKiKnJvfDyjvg+Sr8vsEXD
	5gWxxVrbZ3EsBXR2/D5i60SxKhYytKnUkdPkePrMRt5gsyuQ6jKJMhC7QhUzE6HLT/YLITK1X1w
	hc6mfIXtC6UVwAx8e26F5XRJrMCAB1A2j/BlOKndWtM43hz+Jk1Fp5ADlaDRYoTY=
X-Received: by 2002:a05:6a00:4c14:b0:882:6836:25f0 with SMTP id d2e1a72fcca58-8874ba1e7e9mr1074374b3a.52.1790776462540;
        Wed, 30 Sep 2026 06:54:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c14:b0:882:6836:25f0 with SMTP id d2e1a72fcca58-8874ba1e7e9mr1074344b3a.52.1790776461977;
        Wed, 30 Sep 2026 06:54:21 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8872587f784sm871316b3a.23.2026.09.30.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:54:21 -0700 (PDT)
Message-ID: <66b8dd1f-7aca-467d-9929-8598bea9fb04@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:54:15 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/11] media: qcom: camss: csid: Add support for CSID
 Gen4
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, media-ci@linuxtv.org, robh@kernel.org,
        olteanv@gmail.com, conor+dt@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-6-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061724.7E52C1F00893@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061724.7E52C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tGN-WflIDTwrHAZsyCzNkpN_OX2KMRV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NSBTYWx0ZWRfX02soanpBpyDh
 DDOXC0pE7sjSTBAfU5bsN5urBMpe8KkjanbtIrK0vGH9K/e1LG9cKE9uUHJ/g97Xeu9wsn6/00S
 zDPsZkKUB9TuSCJmaYTRwYkiyEI72S07IsRdz0PBOFoHfsQzClEUdq5dqiIYQue9Yr4o+sC9DC7
 x8PVDjGZ6A41W+VF953hwin8/4gWD9APAGhT2J3EmV08B45ccJCeyq2OhTL9a3rjoh0cyVIFCeY
 NXPZR4D6YbD0F6CuUC5x4PQiHQ4fwBu9nU6hXB+YmmZBcb1WbXZTssVTIEbloluZvYg6J23CIfd
 nqn+wzGiCn4hv1Hf9YzCFFZyzbkz+wtUuhWYtyFhF5zED9F2QgOyx2sjoPmWy6K/vrDjbrS15QB
 GLgBZ3HGAOGZOKig8Q/3liKIPVdfEQ/bwcBv6pe4oK3BXPJS4uFIXJhElJ82GW/PIc0VfrD6L73
 GCnTZ7QyLo70JkNlaMQ==
X-Proofpoint-GUID: tGN-WflIDTwrHAZsyCzNkpN_OX2KMRV9
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abd148f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QeBPY30dwJJEyPjSs70A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NSBTYWx0ZWRfX2BP4acCyh2W6
 sh9nNg1RThCeOBnwpZdESauxu8+6PZVmv7S5TWl5jVOvA8dTe0ENbedh4ai+ngX0El7hTfxgm0M
 YLcc9KaMeqmO43LGEFFdwI4Ei3b8qzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300055

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] media: qcom/camss: data race on csid->aup_update and rup_update
> - [Medium] media: qcom/camss: integer underflow in __csid_configure_rx
> --
> 
> commit 611abdeb4b5da574ae292d1ff736d0d71f2f4ed2
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: csid: Add support for CSID Gen4
>      
> Add support for the CSID Gen4 hardware found on Kaanapali SoC.
>      
> Introduce Gen4 resource descriptions and implement the hardware-specific
> register programming, reset sequence, and BUF_DONE interrupt handling.
>      
> Gen4 splits RUP and AUP updates into separate registers and uses a SET
> register to commit the updates. Update the CSID interface to support
> both this scheme and the legacy combined reg_update mechanism.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
>> new file mode 100644
>> index 0000000000000..4ff2f41f70f7e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> [ ... ]
>> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
>> +{
>> +	/* Hardware clears the registers upon consuming the settings */
>> +	csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +	csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> +	csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
>> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> +	__csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_reg_update(struct csid_device *csid, int port_id)
>> +{
>> +	csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
>> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> +	__csid_aup_rup_trigger(csid);
>> +}
> 
> [Severity: High]
> Does this introduce a data race on csid->aup_update and csid->rup_update?
> 
> If a stream is configured in process context via csid_set_stream(),
> __csid_aup_update() and __csid_reg_update() modify the shared state with
> non-atomic bitwise operations (|=).
> 
> If an interrupt (such as RUP_DONE) fires concurrently for an already running
> stream, csid_isr() will execute and call __csid_aup_rup_clear(), which modifies
> the same variables using non-atomic bitwise clear operations (&= ~).
> 
> Because these bitwise operations lack locking, could the interrupt's
> modifications be lost, causing the hardware to receive an invalid AUP/RUP
> command mask? This might lead to broken streaming when dynamically configuring
> multiple virtual channels.
> 
Ack

>> +
>> +static void __csid_configure_rx(struct csid_device *csid,
>> +				struct csid_phy_config *phy)
>> +{
>> +	int val;
>> +
>> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> +	       << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> 
> [Severity: Medium]
> Can this code underflow if phy->lane_cnt is 0?
> 
> If the device tree incorrectly omits the data-lanes property, phy->lane_cnt can
> evaluate to 0.
> 
> While __csid_configure_rdi_stream() provides a fallback for this scenario:
> 
>      if (!lane_cnt)
>          lane_cnt = 4;
> 
> __csid_configure_rx() omits this check. If phy->lane_cnt is 0,
> (phy->lane_cnt - 1) underflows to -1. This would result in writing 0xFFFFFFFF
> to CSID_CSI2_RX_CFG0, clobbering all its fields.
> 
> Should there be a similar fallback or validation check here to prevent
> hardware misconfiguration?
> 

Ack

Best Regards,
Hangxiang

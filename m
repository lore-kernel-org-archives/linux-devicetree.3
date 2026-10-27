Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102716;
	b=msJm/kSm2J3kheJrP/RMwET++H5UynzW6oODfYGjl1UYoq/59/Z6cF7Vyaj1n/eiGec9
	 7q/Ve/bqkEkPCQ3l8GHtwaafdWrBAn4uO2hwkEc7CbFyM/RELMgK/mPS+UZ6CoqKMgOM0
	 yF5w0SmGZRI+SvYwIGJPWebX2Ina8jnkpOJ3TAWyJudQFyJdn7ISpAxyei5QXxG8VemRy
	 pSJsXVmmArTpZdCsUI+iHhFHmffb9KjAg5rmgu0s+oRmjyXpDaC0A13k1dqnVaXB+ufb8
	 VEsbUypfuiLv4pOMPKbN4iqnQfXFD0n4F1QLZIlLNmTkCfQU3kX51TxHQ9zqy2F99iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
	b=WCi+5bLN3EQYjViIpOLLRvbAftpvFOOAWZhrj0gFuERdLqbsvYvIeBk8bW1SwsBqjUxv
	 Zp3FWrkBDrQeIrwfXP202KPVUR0rb28d9u8E2jYe6oe2yGK+hJqUbN1k2ZMapiwMsh3hx
	 mzY48SKCTyTIOOCqAgbQ6beAq7yFBG+YD1jQIDTIj3wGlmHb5dOe9J3RSCIvjGyvgdsNo
	 g5aaq4alcxNKkGz9N4tP1d6mMfNnKSv0AOuI878k+cH84H2PkJJjFrvlH46mlR7/GUxE2
	 UF8rdoFaRwjBMNvQuAOaU8RFZzK+IlMDzlvji9m0IinPdRJvAVUnueoshT7bVtrfHSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNk+1EAY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISzfUwdn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B063606A327
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B063606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNk+1EAY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISzfUwdn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDeW433009
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=; b=dNk+1EAYHKu1SkT5
	NZaJqZrSsebaw/pG8/B8UGFtpN04c7sFTDsnVYp8VJeNtOAFONCavKky3Jw49gyZ
	HgiALa8r0pqhmWwL45lfha85g7MsIGCUCbSFjxZeCp+Bf/N+nnBY8TAy7eKl60om
	TA7lSbQt5wScaYf01w6pRO4jth1T1b+/rBPyGUwBzErUIhoFQVzjHViiLdJ6hNLN
	xE9B83B8TojrqLhC50iJvii9sJ3v3bd9NnasTdvctEL3eR+GyIlEi6rtyex92rs5
	fmjhwM082dn9r20UfvaQEvC4yKiaGn4M2aF8JO4Pl7UOhLMkw/6q+JtnLxw5zI5I
	YCr/GQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kp2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:05:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso2239423a91.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102715; x=1793707515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
        b=ISzfUwdniHXo22vGXYz2Qu+ItSDxGTHnKxPUmJlORFI82kHcgadQM3PZT1euYdBEIH
         YeVxH/ehtdCWM8xQbi0qoEltQuyNzqkw8FLq2esDtlFGGZU9GCPJ9F+yjDITgjjaw+kP
         wFUt8jrJzmR+2Ife5sOrgwzJAv35z4IbtV9XwVMC/4ZGVZf6PjCuuvwhNWiEj24qfdAl
         FtR0N+Drqf8PWVHQsGEY0can1dfsZLyTbzd+rb1XxLjAowyjNYRkQQHoUN/cP1M7wUnt
         d1FadP9vCAOIIybjW7uRO/rJAVKurHsSjSU20G4dCEqaGNRXy8rK4e3PwusseEpOGe0H
         gHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102715; x=1793707515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
        b=1RdHvRmPI7+CJ0HaucTGxgN543VSis1RdLQRMN6NCR4brCsStHMlj58jcDMeUkyX4U
         RzJSvJdbOhOuN2Wy1sNX5VwUYjZC6Zn1sTXIJdauIfejngtOL5cLg1kV++InaeuvmuUf
         nqpAbm/v2mp1yUIrHHWzFzkn7OqkwekXEsln3NwWjYkRl923gPurXYTEBrovMg4fTRac
         62Y4WWzuogZ6HaXia+L7QIzoa+DZjebKZ6veSa+ER5z+YumZ4eK9bkhIbVfgR7Wcy6kM
         AH+6I2mBMhQ+x35v0WBFORBn5vu1TYYhEf6pcQ/NEOpocg6k5X5bM+qQi/PyxrKdABA0
         SOOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd4PK3ArGn3oC/8KbTebOqTxEkWwl+80muBUeUxA1y4ukwwn5HAjetSFR3F2Kg9COl461w88+ELzM5@vger.kernel.org
X-Gm-Message-State: AFq9FYLar+jMD+FDyaGr9pChA+uqaQqSOZ3wE6clGNt3xPqPoN95eckU
	XfmLJ8J2R31k2CiOy9pxd4dm57ouWIi/pKecIrjT9uNUA5KusEzbSAZW8KB9rdnlSoBItiBSCUK
	4pPHKKPfK5WEi2NfTubPbNRjfaEbI0AwNDS2hNZU/6R4al1G1fdYdrnYz0QxmyH93
X-Gm-Gg: AYBFou0o9vz8oJ9dfTISzfLs1E0TDeYYLDzBoXXTqzB6fdSf4b2RpwA6UDBmjjdSztc
	dhf3EtQ1rIVJItDbDgB7oaeM8HA1IoHGWLkZo5ie2b7NtSTqurPJmVv5LU+POuHoOlbnniVlzxz
	3GK30e6vxGQ0R9H8iQL0I9EpLIrX1/lxTu99xwVs1PVsw/hyGEWpNYn+O8HykUHQNTJ33Z3bjtA
	bSdYJHZQmDxDlLqPMEcjxsKXDuMdpFq98iw+ruWXC/UuUpgt6ESwNbs8JV3074P6B2X0XJd+YqU
	rQMO65AcE7wNWBqPKf6dq+cBeybr/CDHUq5In4jLGGhsWmBfdjZD4ZtXrPfdg5fSD0vGmomLShT
	n+qb25Jp4Z2+IHDQsT4rJIC1tZb88oJM=
X-Received: by 2002:a17:90b:57e3:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3adeb0fc65emr8055405a91.52.1793102714696;
        Tue, 27 Oct 2026 05:05:14 -0700 (PDT)
X-Received: by 2002:a17:90b:57e3:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3adeb0fc65emr8055353a91.52.1793102714216;
        Tue, 27 Oct 2026 05:05:14 -0700 (PDT)
Received: from [10.204.101.238] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404746b3sm3697041a91.17.2026.10.27.05.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:05:13 -0700 (PDT)
Message-ID: <1c24fbfd-bc88-41d9-8632-76c5dad9f2c8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:34:57 +0530
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
Subject: Re: [PATCH v10] media: qcom: Pass proper PAS ID to set_remote_state
 API
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bod@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Eric Dumazet <edumazet@kernel.org>,
        Sumit Garg
 <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261027-pas-id-media-v10-1-8a5312d3050e@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261027-pas-id-media-v10-1-8a5312d3050e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX6ISODzhJvfq4
 rMH+jmggbx4hf4hsMS/9+xNb7+42NRptpRT6uKoe0b9mO5+NbIfhJUycjdgvh2VQdv3KkdEF8yM
 JQPACmiPBC5rmZHdkKzi1zW7UGxBsP0=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0937b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rTiepDLV5_WpOwre6ukA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ekS_VNxJY6OHgUV0J3SWEHy7hwLvGOQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX9TL1imxnJPAR
 wekl59Imrj6nUKQQu3uIqmobLDgSomMCboV7JXJndfpdj3dRiUZUw5o6FUs5PSaa9j/tcsbN/15
 eSbfl2Hqs4pmhJLgyYdGjoV9rjvssTgUL1h/LP7+cy2pNsMvXyOfEcOpulsx0iXFiGg1BcMJ8QQ
 yuuA1yrcJMU5BUIsE8sANd+vSR6qXgBV1ROG+N2depVtXwKLsrUKjlWM5tWJ31LOWzBC7mlH1Q1
 RM7FRsjCiKpGD9qUJHrcPYniIyUXeojoXzeFqHFh6PU0PHRRSY3zEj1ZulrlKoHGSH+AnFiNRRX
 8Ez/9UYS+pLYVxHpFu+CDyxXDatW/pLWCvkrzgm8mSuvA2o00Ou6koTdzB2MsZYGqdfQixZNy2e
 x4CjfhnYbGgf/wPE7vArb1HqlnmRRDK4Uj/15paz93c6MZKcKq+qUTB5WQjSnxKWzQtsHZxgUDp
 EGQQ23xVOfzMbfhmYSg==
X-Proofpoint-GUID: ekS_VNxJY6OHgUV0J3SWEHy7hwLvGOQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270048



On 10/27/2026 5:32 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
> Changes in v10:
> - Resent standalone, as all the earlier patches of the series are merged.
> - Link to v9: https://lore.kernel.org/all/20260702115835.167602-11-sumit.garg@kernel.org/
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..ed2bd0e83797 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -262,5 +262,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..3c0727ea137d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_pas_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;
> 
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261027-pas-id-media-7cc70fc5716f
> 
> Best regards,

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

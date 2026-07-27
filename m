Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C18371D1F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185474; cv=none; b=QxNQsytDOLvKbIoE30hz5rTqm7Niu36CKlm8PZrzgmpn9otfBOB9CkECAvu1W+uUt6XgFa3XDJ6ZdOFKGUlSCkSurF0eE65oPeBsbqDqvGzy/jghilx6oLIjUhxvrnpzfUy6aGbHJkhKeM4GcDEKhKGdMlL5Tei2PO4C1uSGE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185474; c=relaxed/simple;
	bh=5T40wmWDtqiWw9nchZXY9adF6khd5Rjbq9/1nH+g5s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUKF7AJT/3+fZMGKDwde7Giiy/BWHA1+O8Ncfy2kfZNG5LgBQ710TxJUwXuNsHwjZ+NcsK8b9hRIVCDvYoOzHjjsfAbO1F4PYmcDcEkS3BaKdKt61RZC+dhMhi9xWUm+LZeqbl8dfan0cxO9u4W4x39JeA7b2iews+PL4k9w0bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfcEVxYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fE38TUMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfcEVxYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fE38TUMW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICAxm200943
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=; b=TfcEVxYHH7awtRre
	u3qOjQ/eJ6aHTo+6+m7rfqbloAlVE8jjyrLS0594MLb0Rc6vhfr41+bnY/NgcvZs
	N9SOJB6QO6ENi3avgPBGoJ1uHk15Wz8PRzLaEo4gefSMOm2mKKhBdKOdEg6BkPdb
	nTN+10Jkt8f5wVUMC4n9rD1p/uC4cRSx601en/2yIA9HR4m9EZkH1qfgVAN0o/cA
	6fbcaj8zBSCcCRkGT1tqYGGs0Idoj7KAvl6AI1LtERHcA8umtcRpgGOWQ98znmJM
	UcY5SIdgc561hG0WMEzgK4g+5DOH+cDFjD2zT2zotSVSZ1NQOQaYieacapuF1uLJ
	uXIhow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2k5gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:51:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so53633385ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785185471; x=1785790271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=;
        b=fE38TUMW8FT85/jBngucxH6zypRf7FVYwmRsdlK/9evbpCWAwPv2rXtwda7Wk6p0x6
         adFZ9gFxLXFT6pvIhoglig0aRqJqw2BUt1SOU5g/P9SCNWT2clPav8s5jZJBcOW9QBXW
         h4SqMj2fOW/235HmQwyderD2VoHLk9gd/5pU4bIAoOhXMXD59sMt+SkK1IIOy16zWGrb
         JaTN04+/gkyzBkddCzZUsBaCfB/GNEd8SfquufiVVCB/TBxPfJWcVfA3n1OgcK0+KUUM
         NBU4jCdTi3ugwBymdCOwSnoLlhtNUZEmUYOsVE9OrFwBRgNL1Yk+OZHht0qCH/IHEBKm
         wqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785185471; x=1785790271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=;
        b=oEHIcYNHcV9zAJ6VUdp69A53/54PufutJ0bk2wLjXAt/nFcadP270bm4bvdJ9fBez7
         dOxZjzbzPYn0pPX1A6iML6jMHwX+wyeHOQuLUFavtzClMrl2J28eo5XMINu41NYSSf3W
         D+p+m48Cqxm+vNXV2tIAAxVpTq5MoRnVoqZqhLfZXbb946bjINpsIBgqfUluYpnnHfC/
         S9BF6wmICDhKBx0WdbENhnNBFKoKvxyS4Of78bCz+nFbLCiHPd2nbkNbGgpEIw7i+AqO
         dKCAVyCiQ221So5OCSBJ6vSEgnTnu2mEwK9pD7OMSaYrvc9crNrfFd097u2HSQ0VPEjo
         1uLw==
X-Gm-Message-State: AOJu0YzUuJjmH/2+DgtwuL1em+HZ6Rvtrnte+kPMZEWfR8LLnLt3IdHW
	LooPCWj3oYft+IIejCOmK7+eHLMBAvG8RASYo1K+YzxL5ws28C09CbPxyS8lw7CxjPE6rSgytlB
	+lUM4ufel4J/0YKx5Ski9WnLuhkQpa/rn2H/8N38SeyS6FANH6uE8UN2xtwLy12tG
X-Gm-Gg: AR+sD12uz/rHSRWm6IRLcijq/1gbcuTFsUjC8BM/bcggDl88itYLT8hjMuV3asDNRbr
	h4dfunxsq8VyEjqRBt0qqY8rRADat+5UocCe+aYqDTD773Od4Aie8u6isyg81kny56Cs+jSqIX6
	5l9IBI+DYms14PIww+uqJGM9qtrGmV+6WMNykSqM05UzywLGEpjFlUz/onJdFtb9zwu2nAkhvkN
	0tDJM6Y2STNxCxhBy7BOh2QsJ2itKO+cJqSRgUsoTKF8G56vK1ik4W/KPveZIFPVHa96IrKqHGu
	tuy+ksp058KZkzMlw0e/AvgRN5a50dvkq7c3oz9gQ6ko8GkyEMMaMS2DpGhTwgP8T723Wgtzzxa
	ssfIdvi9Scn9dB4F51JH9vIi2WHlG9MyuaiWEyuj7Zz7+P1L79hsQPA==
X-Received: by 2002:a05:6a20:4305:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3c6c7d90345mr1054508637.37.1785185471207;
        Mon, 27 Jul 2026 13:51:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3c6c7d90345mr1054480637.37.1785185470747;
        Mon, 27 Jul 2026 13:51:10 -0700 (PDT)
Received: from [10.73.232.208] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm35047910eec.10.2026.07.27.13.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:51:10 -0700 (PDT)
Message-ID: <f6443353-b3c5-4922-a98a-1292db381ca7@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:51:08 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4NiBTYWx0ZWRfX7J8kT8GbHdnM
 09PanN055tAD18Jzb3YAEp3Ynjkhgl2m1bK/Mj9vsr/xs/ps5Bs6DS34mwcGIecp+3fYW1SZIAj
 BBnANbNwHsH0+4mSslJubN8mB/+F/Iw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4NiBTYWx0ZWRfX6r30iFZXep7X
 umVgLfaTx9CX3ehaVIhkYGcYgB+yKvwvCfz/NSxdZRccOhYTpKmxER+StQmF9m6S8fq37y23H6B
 jsKo8jJ8QTrWo7o6AOMrguZNWfWg2TFSEhHWUahGX4peuIOjcNNOmfgVAmoCrjrlDDhmzvdvWPL
 qE9hY9TmXgi0rS+THTbgrFr2qPjopOlVS7Td90tOHucWt6CkG6vbzwwv6q06FZqZ02W3NdUVwdd
 hIf57ivt9aH89AZcpToAI7rqLJDUe6ITvkNthmE/IJt/4yPmRHHiS6PKuy3G+VyZj4WI5JR3gUn
 t03DHX9tDt552pddU5LXqIsVsoLHSkHX/Uz7SOgVS8n2fWsk8YQg9IdL6g/v3CYzEmTxYJfyeDE
 04yS6FHckLCnWSAeWwokQ9K39cLMU3Kjg9Fqvq4PfOeyN0JzXjXXfngaoNr/p9jLMPwuFnVN+AN
 fGhXHne1v4B+en23nWw==
X-Proofpoint-GUID: 1MZKQH86L2WltPI1MYt30-enScVUuAJr
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a67c4c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZKp2R2PTrS9d3pXqUQEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1MZKQH86L2WltPI1MYt30-enScVUuAJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270186

On 7/20/2026 1:19 AM, Umang Chheda wrote:
> ARMv8 and later processors implement the RAS (Reliability,
> Availability and Serviceability) extensions, exposing hardware
> error records through a standardised register interface.
> 
> Add Device Tree bindings to describe RAS error sources.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

...

\> diff --git a/include/dt-bindings/arm/arm-ras.h b/include/dt-bindings/arm/arm-ras.h
> new file mode 100644
> index 000000000000..c2f4e1f8243e
> --- /dev/null
> +++ b/include/dt-bindings/arm/arm-ras.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_ARM_RAS_H
> +#define _DT_BINDINGS_ARM_RAS_H
> +
> +/* arm,group-format - error record group register window page size */
> +#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
> +#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
> +#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */

Do you want me to have different DT for 4k and 16k and 64k? This is not a right approach. 


> +
> +#endif /* _DT_BINDINGS_ARM_RAS_H */
> --
> 2.34.1
> 
> 


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400A46EF8D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158672; cv=none; b=c+kjDV8UWFZ7HQ5Q1S0+29nJIDrbXNOJvR3enq294lygM1yucOhL+12uwSG5+hhCeGVlqFKP+/ltkruuOevZ8/wn65XOmYxti9InDlqoAGGsj6wOvhgR9lx9UltfI1M86CoA++o89E3Ayh48R/dOqNGND+W46p3OyLOQ+sHLsIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158672; c=relaxed/simple;
	bh=i2uXn1FZn3BvlVrPjw6xo0wOO98Iz1Tsnj2g5Q160sQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2Dwod2L6eVNHXLZAe1K5QUtlK1EvSp82YBD6VwWEzMijXu1D4okrDnmmMT0qg3qle0fcxLQ2TNcCN5JHP1WO/GoFOewRQbszVa001zVc+jewngsPujO1zkHskXb/6hFMVSEFjWGBH9GiMtUW8K+BkMHdcsqoLAn+RuVcbirJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfvR76lN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjGL3032; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfvR76lN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjGL3032"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2wxS3409878
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=; b=VfvR76lNEn5TIM2/
	rf/KJaE1U27yn8qa6ciwpJ3RG30BybSEv0nlH/R8XTh94FWRMsq57QM9o1FK0xl3
	v4yBb5yM4a/9kE8Y2g7S5Bhr7FLDYPkJr2XtX8EOF0y0p1j67+MMXYyxpAl8ERH6
	XV8ezETpocxLF0mlxFRZSDhjscnGpgD3J3x5lqCP8hqY++7NOeP+yRM2fgg7pHdL
	OTj3ohzxRH+4qh037rN8RCccRfyz7G4ksOVvNMMrJWFxggZ3ahIH8SEo2qur/6Xe
	pQ9D3QDH8yx/K45spa3Sv3mOjHTratO7bnhdHlznOMML+bwYsHPHkaO1QiaeVgf7
	eExUtw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux863umf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-333543ac378so861655eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158657; x=1790763457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=;
        b=KjGL30329YWPwl2StwSJRRA1vWFavcbJumrBSpAPV4XHqHblfs+E+qW+GfX5JlYVMY
         gqTrKVQAAnF02goVfDN6U59RYTCw4XF03dFCgfilbfW/m2e1r/p83naSb/jtMsiLbo1a
         ye5zJ/S8/rwz/ufnqCg/DF7IpxxkaA50uBZMEwuuj9RVpLkY2fFvG0q9QBzmWGe6ck8J
         0X28y+zKiKq8ec3eO4VtYHrwknihdGmLuPI/dpECjmw0fcMIqQSeWaSECRo+yp/OdYVd
         J89bQdkvV0k/5UbgIDOTEIeyqpoMDBnhl+YiP5QlPE4lJj9pvvfVgbmMUBq/ewups+2R
         5XAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158657; x=1790763457;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=;
        b=ONVb7scWM2MbgoDA5rtkNbzQcv2oRH7h2/bBToZcf3ZC2Pr0ae9bp/D0XvRxaHVG5I
         nBM64jFeb9rgmiMJnLwCpc1cFw+dh8Q8ogD5LqNg0ldng/Mt4qfpHU0EcvOT2y3l+9Zx
         uLnkmGT4PxkEGGiAdXVSmo+ab919OI12ax7NRpPEWbfXkQCa4R2xfAsvIysxbreWicfP
         J1j2qLVjyZINloa4fzDQSNC4CnJoCWJ+oh0wYwand6PrPj/3gyTNuiK9KETEiufsHF18
         Mi90o/MU3T9c430ereDe6Whd+Q+mEMldAPim8LGRcj8v7ATw0c5IYZK5bn18/uUOGIDG
         5D3w==
X-Forwarded-Encrypted: i=1; AKwUvBwRK3PhFd3V8m3aSMRcDBzoSNi0+ARLoYhnd0QNklT2SoLU57IJskWPxoe6XJadB/oSWn4GWRgdR2gX@vger.kernel.org
X-Gm-Message-State: AFuF++m0FZocnUGEu6aPq6gDDvSMmcD7ZcMeHDZsFu/+eqJ7X7Op9WC4
	0hbR5tytUnJWsIo0ifMDlRVEr11nuWUscVU3lM+KkG1ifZG4QJ97h59fyOJkc9s0VF4zzH/0d1I
	6ViT9yommBlPQdW/lwx3fdDXXdb+gYgknSUz2ccHRomDaDF/ArX+rk+PsgN90SDLq
X-Gm-Gg: AYBFou0K13ZBq+0s42PE+dviYVOGL8nq/QL2OguQiAV3ms0u4Y2WOQUEtsYJxtz1/jG
	1IXvYkbV4t7LB65N6JNAYmfHvWfqKjij9Lw/5d9iFIlh+tF57K5xLNBNxcDoLygr5RUriKxVpC3
	io9hRj7JxKHKQQZatklO0C9iTruzWSIrZibYMvmo4rxeOHUHS8YC2OUa/ep17BmhQG/UbU++MXu
	lV224B598iJMPFC4gNAyVj1/V6as86ibR0ORwOsap3qYMHe61eX/rqftrwKBkevwE72agYKKfxz
	bALj68SFwf/1SF2nHS90kid65nzqICilCk23cQuMnDYQ18+A39Xqa5wi1xF79y6nwcwjEjHrxb3
	uY5rP6sCyHY66omfHduEJEi7+I6R1
X-Received: by 2002:a05:693c:83ce:10b0:33b:7fff:dfea with SMTP id 5a478bee46e88-33e8c05848cmr2471925eec.2.1790158657016;
        Wed, 23 Sep 2026 03:17:37 -0700 (PDT)
X-Received: by 2002:a05:693c:83ce:10b0:33b:7fff:dfea with SMTP id 5a478bee46e88-33e8c05848cmr2471901eec.2.1790158656501;
        Wed, 23 Sep 2026 03:17:36 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:35 -0700 (PDT)
Message-ID: <3a25c942-eac3-4079-8ede-a41f45962499@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: qcom-pm8008: Add PM8010 mode support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-3-de33d78fad9d@oss.qualcomm.com>
 <20260918165258.9FC791F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165258.9FC791F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1_bFSTpSfN5hBPknZ6HuiPVw3ZGUy7V2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXw5huXd3sJzzc
 /1T7n3hv5tdjCCCQgJBVEplE2K3tHV7SKdYU17XiMRxRZz5OaEY/I2Jd0Uvwvj5+wHgbht+/2G6
 dqKVlat9TgyK05xjbiCf/5KzT8psYCQ=
X-Proofpoint-ORIG-GUID: 1_bFSTpSfN5hBPknZ6HuiPVw3ZGUy7V2
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3a742 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h15mIm_vO2ZwhMLoIH0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX2gTf+QRz5cpB
 I0rZlNoQ9pCiFIxVrqcAlsblMKr7NMLAeG83W7Pqis6z72AYUHDid546FFJaCI0bAP0BVyVZCom
 neBDZVd+WsQ/e59gw/Gr+d5NXW0M2MXYGf+p/Guf/IHJtvDJ0kXY8/6Si7/2v5yQy7qlpsVZxcS
 Rex68b0D/aXyT7owSTyzklbkDKU3ng+2+yJwJsbHazBZej0InXNUftvbb9mDpNB5KGuSu47PVqm
 B8XmLXphxPdIChFFW/Rf9E3dlsqUfLcKvg1TIjJnqK5Oe/18EPICzCuOqPe3XZ8kC8EjhlSAzpU
 9yRK5+PrSGM5vpVNjNU+C5K+R03lr1wMj2HAixBDjL8iIfgW/8RhYubP1F8a5Dr5BjuSLchgdBV
 f0qk2pI0q8qTHzE7795j62ZpzB2TYOnZzAHYtmj2kG5zUGwyt06nCOALteAW6fLjIr47B8IEooT
 DqHGECJvxZLPSOwRRiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/18/2026 10:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] redundant use of to_i2c_client() when accessing of_node
> --
> 
> commit f34c6623337a92a1f38e24ae60d1ae6ced8eed2d
> Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 

...

>>  
>> +	is_pm8010 = of_device_is_compatible(to_i2c_client(dev->parent)->dev.of_node,
>> +					    "qcom,pm8010-i2c");
>> +
> 
> [Severity: Low]
> Is there a reason to use to_i2c_client() when accessing of_node in
> pm8008_regulator_probe()?
> 
> Since to_i2c_client() is defined as container_of(d, struct i2c_client, dev),
> accessing the dev member of the resulting structure evaluates back to the
> exact original pointer (dev->parent).
> 
> The expression to_i2c_client(dev->parent)->dev.of_node is functionally
> identical to simply using dev->parent->of_node, making the macro usage
> entirely redundant.

I'll make this fix in the next version of this series.

Thanks,
Jishnu


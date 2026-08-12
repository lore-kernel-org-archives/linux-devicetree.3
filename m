Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2B3372691
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518247; cv=none; b=HAIXP9D6NsV/N/1/tXkfgwqwkq7znhMZZwC037+QMRVA3fl5LNvycwKCEKwTW1lNleLByUMot5fT2aAN2IRBmYlMDnP3CkXQn5NhyKaYhZHg1Z/DwDHTEWlFl2e/6rhahjRDiRgrF2BntkXdd0eBuNGBVdwnLhMetdCrLOpsAXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518247; c=relaxed/simple;
	bh=FfN0nJx8Dul8XdEWQBMUqwCzVU0xcVSQ8v0QjHtVDjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqZYlLvMHcExYVywjdXejAV0P4p0xJ/Uf3+yxXChOt+kfx5Dc9YiNz2O/5AxkHpyItwXgn3l3NpkxpkHMq9ybxdA97Tpu/VVPEBRjgRhsDPKX0izg0r3IUT+ZPG7HKrMB++/oxvahMrWodmQbK6HHie5Z0u8ngg6eDQUNiy39q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/kc4tNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWx1flTc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/kc4tNR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWx1flTc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62Ght2992811
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DhVelqeFqlM7W2oGUB/BgJ5iSIedICiAX5U83IyemI=; b=o/kc4tNROW/9CdNY
	7BTb9fhVuvMo7QjsPpuGrgdnUMRCWI/O3iJNSgiK3UANjvGrSWsZ3XZqE2k3hPI2
	UoYifF1igAnveyO9K/DYYCsRLrjR+u+exBTh7LF+jOwW7kKgu59mQLH7rKj1IHAH
	QfsK5vXXQ73AmtU0LE6PfG/NABrN2bReMk3yLpkQOOvMItneZ39xill8EVWWnDlM
	L3Qw5oaiIAj+0golvv0lvXh1PN3X5rCX2a/kwOSnbCJM1zEouEPEFryHmEdhl2v0
	DVWczGw5tmtd2URtFHepCp/55JFO6s/uSrSI/VvBvD2OTkMFuHj1lnaWaS4memM4
	iL7zMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049dkxut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:04:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so6115635ad.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 00:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786518244; x=1787123044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2DhVelqeFqlM7W2oGUB/BgJ5iSIedICiAX5U83IyemI=;
        b=UWx1flTcH83n67mpVcpzSBh6OpQ2Eclnxa418mF9rAi9o/OSJ9KXwrjsSzNWB5fMqf
         VXNRoDxoI7TxV48MO1/7IfyW5ZEU/OH4p1anCyzcWc9oKHpQaQu4T3mOmlIXZzqu4O4n
         Q0c40NNJOU4bKu29iODvGruQMP74xCJTiHyQPsBbgDNDLmiO7C7gGgbbwnJTUwFXrDDs
         0Sgmhviv4Di/ptik5w7ckyINUJQ/1vJZNDd2Qk2ffDKgdvr38KNP8ECVel5F8CwET0de
         pywqG0Hm3AQVWRewuovcU1aJbXcSZBvRZa2je11UpHy6btBJ00u742xbjTOy3ZAjj24v
         pnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786518244; x=1787123044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DhVelqeFqlM7W2oGUB/BgJ5iSIedICiAX5U83IyemI=;
        b=bsI34RFJEF9m+oT3S/WQDg4qVHyZ9R5g/vM/GhqKgpgxIxI0dhTI8yCTYqh5A0a1yy
         t7MB5BjKs6Z3MH/QA0a5m1zceg9GYYxCl5HmkIoC7/JYP2el/9KgidXAyXoBf+Y5F48m
         QTtOWFe3il1MCKQsmDzaYOkjtpg4dU+WL7FtLzNRgQab0pm9PC6emHWJzT9kHzal+R8P
         Wc/RSSt7TVmRCJ1prssvCjb2EqrwArImBT8g1c+6maBXorV3bzNnsul2osoEYeT4Gfae
         MYgYjCoTNHGKMI5zgStSkABSiWs0QJDqmV0Xin/z2c2tcS5PYvpPL4TbALqPdkG+/IUB
         tkgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0kRbvH3DVJ/3mmPbntdjKhNJGYqmIXtvEWxLHBaamK6JhWgYIC3m8faxaYqVfIdNQJkRbXkJWFM+g@vger.kernel.org
X-Gm-Message-State: AOJu0YxM5YK+/rX40i+gIbJWvLx3yVOhhZuPWnKKxgKyeQU2XIoyE0P/
	4esbqgh9Axa3RE1s1ly0fINrxS0vWyWgEoh9ujNVkhG1x8HG5z+BmYMzaCnoNYh72YQUmOV8t+U
	U+KSJTfh9PxTE+o2ES+XL1yT9f40RJnV+3c+wujTOJv7NoiKxC9yNSIOxRnOICYS+
X-Gm-Gg: AR+sD13sL1+lwoeEqJ5swGB0XWZP+2OgOJWddroBRwtAwCt7PjUn87A5lQGXbFxvUKU
	8l/N566im3kZx3ge1iNa7+RtjlNbITPqnc6pdShaiIO7aDbpD4eivhV5vCP6sv8KIU45vZx/Xeg
	8SmoG5e9afR0Xgk7/uIB+/Qdh149GDbyRoYj7142Ynomj9aYhd3Wt0Qocju+K/k42SoakfpdzN9
	BBFxmUTnLOu92ItV3PIwLYzq5dJuEx5WE1fSrzziiNFMCiSBBLA6o0TRyKHliwXxJR4jEhWewNc
	7LdJmC59zVYivxCxzdBE7j3W/SKdyisAfGnBe8mYFyQtrsz8xAtCxTHKxh++JgeegqHilMx6RYM
	Np1xKiluDCx3aB89v6okb7VswAWWmFt+jQBF6Xmk1aV5mqMW7VJbGxdCEHnnQh0abEqDMDRE=
X-Received: by 2002:a17:90b:2b45:b0:380:873:49cb with SMTP id 98e67ed59e1d1-39301834f69mr3314495a91.21.1786518244199;
        Wed, 12 Aug 2026 00:04:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2b45:b0:380:873:49cb with SMTP id 98e67ed59e1d1-39301834f69mr3314420a91.21.1786518243681;
        Wed, 12 Aug 2026 00:04:03 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35222e1cbsm2309975ad.72.2026.08.12.00.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:04:01 -0700 (PDT)
Message-ID: <87c2e82d-1615-410c-b188-aeccef66baca@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:03:56 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] dt-bindings: mmc: sdhci-msm: Document the Maili
 compatible
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, krzk+dt@kernel.org,
        robh@kernel.org, ulfh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260720215645.1464901-1-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260720215645.1464901-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfX0hu6F0Md40XK
 BGU1RWVed+JPm+7fvtQFEEhf7AC4w65bxIt/QArPehlR31U/V5xeBRVTCpdoONr4zLX+CvNcrHs
 Ze8NKrJF739BH/XFp0PD4F6d82Np1l0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfX1D87Y3hieDC/
 05SOzINO6uw5/tbEcW7xikmdubJZwejLo81qxBrIAHTwxGjA+OH45XOrep6j4LgPqLPpEkBgVPM
 UlVooiqfKtK8lijnfxPkBDz7AKhl7EgCVSnUQ7lvwdcGgqXHkU2z8YQP+Td3mgrQzMZOF6o2tXT
 vK4UeXWyCV7ZCwoJ0nwufivErHoBSRO0HcdFxugNCw3AYOdOanJVkbVmPbRgKfU/AsE9+ErlLWh
 st8hgOE5psaCsZKCq9gYkuUPaHQNrhR+qR3YS/VtJ0zTNZRkrgw4pgkpoUKb649KsBsA6Qv7i7H
 VpnL87/kWsmzj7b+uG84UpCRq0zrP0nV514ND1WLJMd2FiKTbb5LV8ugNpoHLseWtg1009RsYa3
 zw3QqyC64jr/NzUBiZoE/zNVLxJwMesReTnwR1aSbVqQlH7lgJuDRoIl86PbKmto/0p/fFxnP8n
 sHehQV7Ws9xBWn5chJA==
X-Proofpoint-GUID: hnZBRTO65DWuFDqhbVKu1jmGvRIwVmUh
X-Authority-Analysis: v=2.4 cv=CbA4Irrl c=1 sm=1 tr=0 ts=6a7c1ae4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P79rZLnGM28BRmGcN3QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hnZBRTO65DWuFDqhbVKu1jmGvRIwVmUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120054



On 7/21/2026 5:56 AM, Nitin Rawat wrote:
> Document the compatible for SDHCI on Qualcomm Maili SoC.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index bd558a11b792..8dfcd1351551 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -47,6 +47,7 @@ properties:
>                 - qcom,ipq9574-sdhci
>                 - qcom,ipq9650-sdhci
>                 - qcom,kaanapali-sdhci
> +              - qcom,maili-sdhci
>                 - qcom,milos-sdhci
>                 - qcom,qcm2290-sdhci
>                 - qcom,qcs404-sdhci
> --
> 2.34.1
> 
> 

Reviewed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Thanks,
Jingyi





Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82537F337
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879119; cv=none; b=D5p1LqBS1RtsRuJg+Tai/ZRND2OiecBnLgbyrWQRvOe8mIfFdf7MJJJE1ulIQqHQXKqBQ4xneHX7YL8iSuClzpMH++arxlQiFWTJM7cWHAx1vCGYsgeDBUZ2RVm+OFLomHoGBIIBJlpNODDG/Cl7T2slkQYzapPbBxRcYs18ZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879119; c=relaxed/simple;
	bh=ANJtyJ6P389yvOKckJ7iYgYvw5On+QBy6J9HkDUwMwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XT6LwcXbuhmmeYJfXzH8Uj7r3ToO4qnI14/eaCmZb8BcNVNTtS9D9BUFjSwb36D01+El8o4tQD6TXqS3y21rCixB2P1crUZcbnA91Y7QmHfP8UmtclGuTsXfUH7HZk0gISlurzEBNiefNDzeCbl3lVBoSUIhtlyXYKaQ+mhw6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqd7H5+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6DsNT3S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bqd7H5+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6DsNT3S"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lFAi2137580
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/Ic+pdSq/qAyvDsmYaWaFDv8wMS/iilvzlwA+yIGdg=; b=Bqd7H5+wpb86jWit
	nz2VkXT1LmgWhv3AVVdCQq5YhOTLv6vzmzuxq1AceUPr5ob4x/47iVctxURYYiiS
	l4EE0igY7dArg/GW2I8uvumBi4anySVO9YkeglxFC+xr7mEGt9hWPWKZrsUFMf+D
	nK8WUReWdtPcWnPdBFTLGY4DdujVlUWJ4Eobrv5AP0juBAWKN55yEKkYn2tfCky1
	1Y8UGeyOfm0Zyar3QJbpzUdpIJYiRgLHM7QO/6nVKZzVEY6ZoPUIRvGEKaSJfC9B
	AOU7m5Ak2wmiMTJHYeboJjk48dTPT//aiE20Jn7aXSJjOrsNYprT4FU/zbH6wRE8
	WnoRlg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1ar3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:45:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e375d9736so168441b3a.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879116; x=1785483916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/Ic+pdSq/qAyvDsmYaWaFDv8wMS/iilvzlwA+yIGdg=;
        b=H6DsNT3SsHrizODwV/23TXumQKX5fCot9vhtLpCyTzAckFtuVL3mdnPbTbXh5zozcH
         o3S62500tQhbnXKtl/dI59flEtNke6DGwAxCaZ0ng/C4R/mdfQbkp9w2gdDl192gaIG2
         Z30Ziii80m0LXPl8HGANHp/nYA4R5AwFaXNP/Ha9YT08o6Txx71xMeNgky70lmNMxvpb
         XgDClAcqTWO4V/9NZanqhyfUEURNDNW2SVaEu5c2Nxf7XRpWQ6q1aA4hKRtng6Aya6oV
         z+g8xVOiYHsCTvN01tIEbU/9gJ3W3qEczjLKbPTJFSH2xCrR6pYj3qULjPKfAu3ugZI2
         Qpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879116; x=1785483916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/Ic+pdSq/qAyvDsmYaWaFDv8wMS/iilvzlwA+yIGdg=;
        b=EyBVGjqahUIMgswP9+iLoi60zAUgQd2q4rpRjkCpPyaLTm1IGonj56fjWgFAJVKGvi
         sizrN5uoLh8LQ9WMqYOgk/33VqdpQWyEhyjd2ib/UbYcVxeuS6/HPEv7wcykOcKajj9e
         pTJaNz7lQjGVJBWB3hK2imvsWLEazPeBzk2poQDDBTY0SHKmSEKL9VAL9Lsl0B3IBPYn
         p5bGmnjbQdAAX1hHdLrnoYIxZra/DhPnsMygtxA1wNV05zPd6tgMqNqMcWpcOc+Da9NN
         pNgmntIa0sTjJMepwvVEKlQLhgrPrDgY0qYQ4PbBIR0BYWSt++Mnr+DiQFkkWSnoMh+y
         RRDg==
X-Forwarded-Encrypted: i=1; AHgh+RpWnFL287I/liWxsnUVpu/q21Ek8wl1DXWkbZA+BpjVdiWqNKSYGE2lrQbUAXIHER8loIbC0ifB1kmR@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+866J1zX7VhcPQ1X135k8Ye2K1Ic1jSX94TvJG6VB3rW2wEu
	WSF7nzLfT7AJ85BXfviStDDQ6ldn6r6uqgnHemEOdEvXojiOYkV1Ji7BtDeZnICzaVRSBUjQIEp
	md82d7AEsJj145anDVHilh8x69UvZe+OZ7HW1/RxyB9z5NMghFtCDq6TU2s1giVgTWTygstBL
X-Gm-Gg: AR+sD12ZGpbsuQoeMAVJq/PFOzyJv1pC36EjbllFudbM9EQnq//8ybFRfJvMdU5DpbY
	LRYnW/eA8gcBEyR/sjrsPnLWwAYq11tAJ9PMywgh4qbeEodHeKIHVlALTwCr2k+frZN0S9WHuNw
	jARWzkmT+R7lVujyi/6KNaz17jB6fbESyHmZi8wMyGA7Rbv7zGph0ju4HPcsMNqbyeX4kb6oO5S
	I5zzsuHMqTQcMoEHBBv9AAX4yrz3ivlaLLwCnhzsFyxQ7cUVQcpCXxxRX/caWLc5EV73KnWv9Kx
	SenP5m1KQ4RbFWUXBj0ZYLLVUNJU6uB5jmtqDDX5ptst62Rm4A3DkxgtJh/UAyh++mq3ZyoBH+R
	GsG56CjEm/rpii0l0xVf3BzwWhgc=
X-Received: by 2002:a05:6a00:1f1a:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84e2b8688b1mr7264415b3a.21.1784879116406;
        Fri, 24 Jul 2026 00:45:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f1a:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84e2b8688b1mr7264390b3a.21.1784879116032;
        Fri, 24 Jul 2026 00:45:16 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17285662sm4224262b3a.20.2026.07.24.00.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:45:15 -0700 (PDT)
Message-ID: <cfa3e3a1-38d8-4a6b-a641-4c51a1de89e3@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:15:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
 <20260723161435.C5C891F000E9@smtp.kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260723161435.C5C891F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9T3Xc77rxqSbQr1sk4GBEouj3n6uZcyI
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a63180d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j0hzxEU4WLZdmYHecckA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX6PGUdhLRlvEf
 7TW/aSLULMzWlkzyMBTGgesUNBwT39o9vG/1MzPOkvBFmNdQVgnV154QMdmRqYNxuzUAPx5RTSM
 El1Y+Jnz76HTaJ2Tumc2IFYaodIFAS+zv/xKqjaVJUWZqrctbvHQjSD0Blzy1bvlWKpmwY/6hZD
 b8p9KSEmLrIM4ciX3V51FniXWzxF/zc8V9vDnHAiu4Zw6exfT+Yk4HtO5jEVw1ESsvFnMMY49f6
 ikCWx2FglCLybCnPfx3KVxMV/Nn1PYPmJxgZR/o6AOZHE1EG45oQx4Gr93rClHqyGdA77cyJCNZ
 KttZWTqniiB10FvXSvet808G3slknsb5D+ZCX9P02ytjtY1Igo7pd/jTKxTHM5ct4vR2BheuS+Y
 m6m5Sc+Az23uQ5ZfXgPqQ0FW2mLMqaT8GVSfrWSlYZm7+jmgsGXhI2peFcSBUSzPJ4WCDO0yece
 m72FPT2oBpcnVbNnL2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX5/Q3tfbvPxYb
 PjU4ZM1oAFe07sstGVIECrRR+nQ2PIfKFQ1TMA+HkIHoscXiGhQcELJ/ukmnQCAIkp2ObboM//L
 e9oymC4wI8Fp9qgIjMmcTI7ASk7nUXs=
X-Proofpoint-GUID: 9T3Xc77rxqSbQr1sk4GBEouj3n6uZcyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240069



On 23-07-2026 09:44 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `audio_core_cc_shikra_probe` function does not validate the return value of `device_get_match_data()`, leading to a NULL pointer dereference.
> --
> 
> --- Patch [3]: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC ---
> commit de62912fa52410c163e6ab3071a5cbf9cc2887aa
> Author: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
> 
> This commit adds support for the Audio Core Clock Controller (AUDIOCORECC)
> and Audio Core CSR resets on the Qualcomm Shikra SoC.
> 
>> diff --git a/drivers/clk/qcom/audiocorecc-shikra.c b/drivers/clk/qcom/audiocorecc-shikra.c
>> new file mode 100644
>> index 0000000000000..76017240f7684
>> --- /dev/null
>> +++ b/drivers/clk/qcom/audiocorecc-shikra.c
> [ ... ]
>> +static int audio_core_cc_shikra_probe(struct platform_device *pdev)
>> +{
>> +	const struct qcom_cc_desc *desc;
>> +
>> +	desc = device_get_match_data(&pdev->dev);
>> +
>> +	return qcom_cc_probe(pdev, desc);
> 
> [Severity: High]
> Can this result in a NULL pointer dereference? If the driver is bound to a
> device via the driver_override sysfs attribute, device_get_match_data()
> will return NULL because the OF match fails.
> 
> The NULL desc pointer is then passed unchecked to qcom_cc_probe(), which
> calls qcom_cc_map(pdev, desc), leading to a dereference of desc->config.
> 
> Should there be a NULL check for desc before passing it to qcom_cc_probe()?
> 

Yes, will add NULL check to handle this.

Thanks,
Imran

>> +}
>> +
>> +static struct platform_driver audio_core_cc_shikra_driver = {
> [ ... ]
> 


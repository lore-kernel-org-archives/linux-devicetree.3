Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9860B2E229F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158688; cv=none; b=CLTF7hOqqZz2OP/GlmCkOUFOJJDcI4dGN+QykNFqt8LoTyIYxHyipqMMG1rUw4WSqOlgpMmFLwbebLyB6CvJpqaHCyzuaeHaJ4mQOK9OZvQ4U67W1+HucQ+eCVZV7J/iaefsrHDmaxt0b/z8QICtrhpWgV1/Iy80rpJrlI85HgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158688; c=relaxed/simple;
	bh=ZHN4Tker2MNfZG9wdoWMQcO3v8MZgFM+Tpk8wzrX5D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByXue3l3cSjU6zUG4p2r5TE933cE0L4Ivl4UgW0SXuu88owwmf25IoUc524V4g2fb8PHD3eEjAU2XJrvHzFj2Z+03Che0xqTjagUyFZhzmsKPocro67+9qbQTi+ZiYAHJLqmEL0H1grXjET4fzG90X7/KEGgKlzeDOX3JrsJZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6CKv2L/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8CmDXdI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6CKv2L/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8CmDXdI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Lcu3566346
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=; b=R6CKv2L/vSZ23Y2S
	y8QgrZsB8TjZu4aYpdzGVCKF8HKl7lehL7ukn06mgQUVEGRbzC+WLyYExsjhSO7j
	qv3N5TDs2WDt9EYfh5M13VubtATAUzHlyFMuHtLoown2f76ZP1bQEslvu2bDeYRF
	fvOItzmqY8faf7vJOjEpbSp3Tdy+ZvacXFQjDjq741IU71wPPMbGPuZ6YkXTyE8K
	9Nzdo507FlIXN4EJ6r4E+IWEA2TDV+PC0mZPOk8sE7v9mvVl5HTzKOAchjKnOw9f
	UdU12hQB4pltp9DYeF0TtopD0oi5A/AVNvTFBYvKytZtPShWZkPYIpPcb+hvEy9l
	LqIcSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuug3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33310847fcaso1294927eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158674; x=1790763474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=;
        b=K8CmDXdIIca9g1M1PqqPyZPhWK4j2QDXCOEKXku5Hj9x8ehlMwKOXDazGCcXOeiNKK
         QIIRkcDXcoChm5tW/6NsbmRDcAUQyoo2DZuU7N70lbqcNx/7VO9iYwqi3e8B4YaaiK/B
         JnayXoKWoeiEWfPRWBjlU5I+oFpfO0XJQl87OxzSszj2dB/gDy76l9rABJ/wsp7yf2MD
         xY2UCdOmhoS8bW5wznD0Z86iyDRI1Nf2nXhqdsEDFjYbYMitDqDIvKXmYBLKZ4U9ddau
         uqTBwpMFy19z4jc1WG8J130AUmQetaBx4zTQc2fni9Xzn9GsaebjvHwK0WdPT7MeKXnK
         Jt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158674; x=1790763474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=;
        b=wxI33I9XtW5ryWOqpmd9v4G+MjL0lM9fPkTqdJEuATMt/Br9ZT1YMwIVdW28djJOkC
         WZ2ZPp+af3u5foq8gt2d2i4J7D3g4KyzhL68eso6crxuvKk/6DMAuaopkMmf9Yz1HtJY
         FbttkBgJxvIhgSn5m2DcLnODrn0yK8ZKvaL3ZOiRbP3n7jn+aNXWH4BOHqqpKpPsf53S
         C0voWCUO24W5PYNzIvdFoNbNh75rumLSif8YbyeyBq8rCkdS8c3oMrFPAxAvfTXC1ACK
         kf4kk88WwZ/obwJo68cAPdDHfKe003+nnhl6QjHzm+jNYaqvx1vIcs8jTsKU3CJVs26w
         vHBw==
X-Gm-Message-State: AFuF++kpOTSIjUsXFKB+OzsVa/7nMXgdK6wEa6/EO+v6kSWcRwF0LkC3
	AGwEyun9zvMCdS6VPlwguXzMm2ZUrNebhVik9dnkJGqzHWhaGwb0OdykekLIwU7lR2FSeYA3iAJ
	ahRsIcAsXkvchdY79CsvCNgw5QFfuNOBh9k18u1CfXCSoYxiJPODltMg1TLag3jLF
X-Gm-Gg: AYBFou127vQawgvU9cQolEX0LbvDnp66sP8mOzyBMqGMR3bwyPVvBnOys4BOfhwuTgX
	E3AcrHIfbdrCoNQwcWNIqcSKfbELlvMIXz+j9GRm6bbJ07NnP22IAtZV5dHU374Mzb4+qoLd22k
	KS2zP95ddMST/dsiaOiA8de76TbOTTit7ef2xXwQJFG9xFej25hSgk9sWoDZnflS9jOt04sJUVo
	xQORL1eo1IvAtmwChWwuce33OR7KDTIeMPJ0kHx9jjKb6asw/08t38IzeyLhIfA/vyx1ik8wrIy
	zusSEtrKFJw/9ukSu4Pg3kDZ9T1Tr7zjo7l3mK2vHcwbinskvapZMpsYZHtqr+/pCaJyFultVWw
	Lt/G/I+bdg2oAU2VCIo5+6w8dW3mU
X-Received: by 2002:a05:7301:3a9a:b0:33b:b3f0:fdef with SMTP id 5a478bee46e88-33e8c05ffe5mr2124577eec.13.1790158673743;
        Wed, 23 Sep 2026 03:17:53 -0700 (PDT)
X-Received: by 2002:a05:7301:3a9a:b0:33b:b3f0:fdef with SMTP id 5a478bee46e88-33e8c05ffe5mr2124552eec.13.1790158673077;
        Wed, 23 Sep 2026 03:17:53 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:51 -0700 (PDT)
Message-ID: <41063e57-d8d9-43d1-bba6-f17f667be867@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org,
        robh@kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
 <20260918165721.CA17C1F000FF@smtp.kernel.org>
 <20260921104237.GB2348773@google.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260921104237.GB2348773@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nRl2qIoyBz3g-AGNccAn0kxb7Wirqn8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX0N1WA5Q6rp0F
 xlhPrvzOyY6PZVDHBmkRZsPZBFuv9JaQhKO63BXgCB3tT/v3rO8WugCkCgTszw6YuGo2VeFB56Z
 2dIvcYTvwVeBbYTdiH8gha9HQL5Woq+xv2sWTRfdQ8zBeb87YwC05PriNdsKCT9FMMCA6pgd83e
 0L9TUDA8pSnVlPU3QTcNBT3i33/xm8k+gHysZ2nJo1jbjXNSY2M0hw8crNq1uyeCZ2CFRNFvLqp
 ZmXVdZawaXC4JK8e+MLbGItxKWBHU0QZobm+uPfuBRrXjMmeTOLvXR+AFByTESHXIlvLDSNSjHV
 VoxvKLtIYYyjRTnxou9gbWMHjAx1F307WjcMk9f560zLSd3vnKe0ekiJA9HCy7jdEkg4EbJNM/C
 /mUGBrI1eNWOtkN8RA0FimaMEsVQoXeq+hjdkClW5ftRd0F4GzdUPqogaJOldKZNMxfD7ZmZ3x7
 JuwOYSCS8bwQiMHHCoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX8cvOTuTnsGtS
 hIeZvnJpItJKEYbwQ/RsELAaSCq/HhnJkUqSDGFyPQhR1iD94Cv0POxCTMi2/QWw+r1vBSCfobm
 pTl2dGTlXLXWaBocfms9AjKQ70QdYHo=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a752 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8XOFi-LDWgCnIeRtGYwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: nRl2qIoyBz3g-AGNccAn0kxb7Wirqn8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

Hi Lee,

On 9/21/2026 4:12 PM, Lee Jones wrote:
> On Fri, 18 Sep 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client->irq is 0
> 
> Please review, explain or fix the Sashiko review(s).
> 
> If this is a set, this request includes the other patches too.
> 

It looks like the Sashiko review comments are all genuine, I'll
fix them in the next version of this series.

Thanks,
Jishnu

>> --
>>
>> commit 2c273914596163e5696becde808ceb33d98f0fe8
>> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> mfd: qcom-pm8008: Tolerate missing interrupt
>>
>> This commit modifies pm8008_probe() to only register the IRQ infrastructure
>> if the parent IRQ is present. This is intended to support devices like PM8010
>> where the interrupt pin is tied to ground.
>>

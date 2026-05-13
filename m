Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA93B3C06
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698512; cv=none; b=owIwrEvSiLAQ56dd+j4Ug8Lm9clO7wjQ2B2i1cPkxNkVtfU8sSQfaBSmS/M7FXHWsE62n0K7ARXDN4WAzspUJSsYRIUGglSKRj/oHPc4xFZyYLkyyr/MlD0Tv5vsNdZ2kNid/uUpJ0Af3xz5I9on/0IoZSUg928gZq8d+47yFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698512; c=relaxed/simple;
	bh=f90icsStwuTiYS+TRLmFbYa1N1i/jNkMOXo1pnh14Tc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HhQjZkit1ZKmB+uDN2y4EUxnbsYb453khmcnw+vpxVutlSiCr8w35zfLBxrGBZDumaihq/FnL3uD46Jdmzk+O+VI6iX1nVrCktMnwm48/ELvaWcW1Fn6Ensih736VY2fLDBtzA42LC450HD55m0Oq3D1luMCEBA5Ser6WtGKsck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2qNgidR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A35ToDrH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2qNgidR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A35ToDrH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG1iOk3008285
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdDYhB3ETGgG2OyYi3uG6KABgHH6zfI8kJ8591RPyfI=; b=m2qNgidRHRM0A8j/
	+n/C0hJC9eU7xSpqpD95nrTfbpCyv7rz+zRZyMcqR3/tQXm9UgAFXKVv5juLUuzp
	w7NtVF0mdyHgbx+5GJf4LgnhpW39Bv29OXGoC+42DEN+GKQQRaEQ4eMb/n/t5MVN
	5SDHKv4ooYkTwJsOCB9Sune4jtfZ0KxbxTlftorB4AjCNfbMTztOaSOxIb+P6rHw
	XRouq2vpIVRa6TjSAYjd3Qwcwblpw9SCmUp69Nxz9e2tohvHCAhSkWhr4X7KL7Eg
	UYwJLJ7LjKmtqPrSatwcwYAIp5eRdV/7pDqtPrh9ebba7/P+bWJ72eRfy4H9rJfe
	gbJkcw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0j624-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:55:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83836443305so4097972b3a.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698508; x=1779303308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PdDYhB3ETGgG2OyYi3uG6KABgHH6zfI8kJ8591RPyfI=;
        b=A35ToDrHOZH5nkkoRds73wXDwT+3hLbAhnhEimfx7RTlbJWanckcAz0m5kpclzHxoj
         naiJnEqISn2exwKod0MY5MyUbSQgYYW8oKSWhIgUa6Z6cEN2YRHtkuX5T1Nj5Fu4ZdEo
         swYxnqdRFmGHjBs884azkD0x6KhqEWWPzBAP+1ehQm5ipzyu2UbshGIOOmihYSoOAxI6
         zJHAuDGP7AsUyBTZOQEa+b1ehra6UJmXKeyH0Ez0SsEkmyy4cVSdmmj63Khw/90VSkoo
         s2uNM0rxsVkBgJMIdSrPrtjBg8W1FBj6gk/Qnnz6BH9wOPF8+ay099MMLRLUV34vRDwR
         mrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698508; x=1779303308;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdDYhB3ETGgG2OyYi3uG6KABgHH6zfI8kJ8591RPyfI=;
        b=NKSkBNAAV3v6K5zXzC5kExyjhrRLRvsnIC76WpAgHpeO8H1yV+nF2ZUzb4+Zv1E4Ao
         SoaVlDp7vFINTlWe/jhI51K6lD9GLQEZU3o6iavKtAQfqEOaHIQ0M1UaIPfZoL6Pzagi
         TffnU3FZUiGE/bHE/iXp5TYVBlm69owKWtgIH+9EdaTwGVgQiOHOF2VOjbLQEzTyhRhH
         elMP6LgXbG7WDmgz2wjgIFjW3u+Hz/1OJnbdcSn2zg+wKKwn9/Bo0f1nvjPKf5AC9LsW
         BKxTfvRTXwA8npp0/o3149iMy47xFbldqcbYrNsNGyoQPmIIk4OqDRhil6e9v88RKCJy
         3tfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+mfW/+r72068ElnGvLwsvJ508BI2rE+JfW+QGSITM3DW3DDtYUV05PNN031jnWme9M8Kh3cykDxwq@vger.kernel.org
X-Gm-Message-State: AOJu0YxAg4qtVczyRnJFoNMvJi8h+gg3hPWQV2X76q74RZilkS/LNaup
	Re4F46owhZfnZrbxR3lZsvud6IEbkxqW6McqsmKNUIC7duRs1S18nktrk3bjE3E48/6H0f5Pkim
	yNJMn8cj7pb3AlkA0s0PmCbZocBnVDb72yvDg1RDEUdYvXvDyMnq+Gnh3KFTrtvsS
X-Gm-Gg: Acq92OGoqxyzbyp0rbvrdO92J0vgBubbJFq/cQ9WbYei6k+dsOCnoJ8LVKaE48ha/we
	xg1EIKAE4ElJ6SZvPZBU3pnYCs2E+z/VccSpb5d389pcHMBegl1rAWJPq7mIjNWItAoE9JMGh+c
	g8OZ5rV8/4B8GF3InOdHOEFVNR9xHU4zxGY9bxOfacNzZLoPi7TwimFRlmLemah+S4MLDUBXJwU
	Y4p/XjhztP4GWIVwpBu/5r2+fg/gEbVb22FBezVFoTacC8b+cjd8+lk1zB2MaknoptnAeGVxsko
	uRVt5QU/KWu00rA0ycswzohooy58x8FA0+VwY67TTs3/bckf1fMX+SXqvbv35b7mIhvSZFrBHk6
	Jzr3Ft/AwqUgDNmqjZJAciFI7KwA9nVM525lPc17V48GKJdzt0LpUts5Jgn+eN6I=
X-Received: by 2002:a05:6a00:810:b0:837:42a6:589d with SMTP id d2e1a72fcca58-83f0568612amr4387526b3a.11.1778698507470;
        Wed, 13 May 2026 11:55:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:810:b0:837:42a6:589d with SMTP id d2e1a72fcca58-83f0568612amr4387489b3a.11.1778698506919;
        Wed, 13 May 2026 11:55:06 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197781c7sm240554b3a.18.2026.05.13.11.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:55:06 -0700 (PDT)
Message-ID: <905f5677-5daf-d6e9-437f-7b928036ea95@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:24:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
 <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
 <zaq7evuw6la6p6zcv5zgv2nuehc6yxt6xxojjdd2rdflxtk73e@wr2w2kbxamv7>
Content-Language: en-US
In-Reply-To: <zaq7evuw6la6p6zcv5zgv2nuehc6yxt6xxojjdd2rdflxtk73e@wr2w2kbxamv7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX0rVFAM2Cfmua
 GzJyz4iEODZKJ1yGysQck4CMTyd4oNhdKovF6dxIcfCE0rx3N94nyImmuJu9wc0GsIxGAn9c/A3
 BSccvEBexuPyYtJ38+Qw0/1OtshMDX5Y9LCr8OytNlhkyFd9E0fJcPpAEwQiW1bzt0y6PDY6KWi
 oOcohN8ytrAZVzjszCy3PlLtNBQXtNvOQiucePQFFB7EDSM4qela0+QKKwbQMsmfBUz2wMxX500
 VmzkGd82fR+RZmmovmFVKcOccv9BfbEL/ovDUD3O/uvKIADrNkBXOdnNJ0p6B0DlfvHfaEDkRpp
 r/SsiNdZ2NifGI/692WBizGPtyI5fxm+L96zf+FldBc2gzgAnP5R3c7AaecidpwxHfzqGti5FyP
 hoPdf2pFx13jKKBd1Js3cjdviPjxNfcqyvmDu8q7XtJ0sOu6hfTL8EaL/T76EdGZ7GePy2A4qqT
 HaescX2dkbk8pWFvwmA==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04c90c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B9MledX_AzLNtmQI4O4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: kUj-_62UyPqTuzZJDvzMDEA8UGdia9mv
X-Proofpoint-GUID: kUj-_62UyPqTuzZJDvzMDEA8UGdia9mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186


On 5/13/2026 7:12 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 01:31:04PM +0530, Mukesh Ojha wrote:
>> On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
>>>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>>
>>>> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
>>>> or QHEE), which typically handles IOMMU configuration. This includes
>>>> mapping memory regions and device memory resources for remote processors
>>>> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
>>> No the calls to those functions are not intercepted. Doesn't hypervisor
>>> simply implement the SCM calls?
>> All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
>> and in most of the case the preparational work for the TZ like in case of
>> qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
>> so that the TZ can access the memory and then calls same SMC call to TZ for
>> authentication and once done it comes back does mapping the PIL region
>> and call bring up sequence of the co-processor.
> I see, thanks for the explanation.
>
>>     SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
>> HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 
>>
>>
>>>> later removed during teardown. Additionally, SHM bridge setup is required
>>>> to enable memory protection for both remoteproc metadata and its memory
>>>> regions.
>>>>
>>>> When the hypervisor is absent, the operating system must perform these
>>>> configurations instead.
>>>>
>>>> Support for handling IOMMU and SHM setup in the absence of a hypervisor
>>>> is now in place. Extend the Iris driver to enable this functionality on
>>>> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
>>> I fail to identify, which changes correspond to this description. If
>>> it's about the PAS context creation, could you please be more specific?
>> I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
>> managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
>> part of [1] are in upstream.
> Ok... I'd say, this part of the commit message might need some
> polishing, but I can't give an exact advice here.
>
>> [1]
>> https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>>
>>>> Additionally, the Iris driver must map the firmware and its required
>>>> resources to the firmware SID, which is now specified via iommu-map in
>>>> the device tree.
>>> Why? You miss the most important part here.
>> Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
>> commit text ?
> Yes. Why are you using iommu-map instead of listing it in the main
> iommus entry?

Without hypervisor: iommu-map is populated, so the driver creates a firmware
device and handles the IOMMU mapping.

With Gunyah/QHEE: iommu-map is omitted, firmware device is NULL, and the driver
skips mapping since the hypervisor takes care of it.

The main iommus entry already holds other stream IDs (pixel, non-pixel, etc.)
and cannot be used to distinguish the firmware SID or infer hypervisor presence,
hence the use of a separate iommu-map property.

>>>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>>>>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
>>>>  2 files changed, 66 insertions(+), 10 deletions(-)
>>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>> -- 
>> -Mukesh Ojha

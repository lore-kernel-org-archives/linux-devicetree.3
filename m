Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097751FC7C5
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774400361; cv=none; b=iWh8nW3aOBPHJbgn9uangqAE+vJ0nR+BV94r8ag395M3NS7fOVi6y9WMqvoeaJxwS1AoOy/sYHHH2Q4J65QgIUs08/BLp2fLvTp7p00Jj0v6CyHwhLqH3tnrO8f15ZLu1GCsrHpVdw56jxWgccZk23cg00o+eGjDyUQqNPTYpMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774400361; c=relaxed/simple;
	bh=4Q8HG3qt4gK3KnNvRaO69nxtaOU4iVVt3U/qYfJV6ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OitzgNrhPmcrQz82MzwIZmSYHisspBLeiUgSHIffm1Tpy5YUvRxtZoey1wCd8utKjClf1eyGAU+9N4Z2NOQzZHyc/lHIkkIv1Mm1NNbwbbouNtcL6GvDKE4kOBAm4mqeNz2eh5PWfBfOAOOuIOvUjUDS9Det7bY7pX6prsrojQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YK6oVp5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VppED3HP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YK6oVp5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VppED3HP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD7eX3731497
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFXdL+w2VkJq6sfprGktd6Pg68wI7bXyhxNzZd5HSwM=; b=YK6oVp5uUaM18v7b
	UeDkMwprPMRqz4vrdPqgOJnl7Lt+BpPYp6Jzl/Wk6Unuh22IL03YybXqbh0w+hPJ
	bcpQOsHtzTTSEZOYJQMDXoU9PEmJmRBf6xP7xazA3Jw7CdpHxO4TwM2vvoLXvmIx
	lrwW5hfQ1V2dU52NEYD2xyYB16f6A6aeXq+oq/xq7BeNKGf4t4h3nVc6564pl2Wk
	F6QhCFh5IZErqswoRd5v6X1JnqK0AjPlnwHQKQD8JANB3ghYh6NygdrAnpYCy7IV
	RiIIFXLC5KtQTb/Ltf9jiZZJGVIks2QgX2bBbz39MakuHKsv1ovI0ozk58wNIE+U
	RIs65A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkeubnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:59:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so5124277b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774400357; x=1775005157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFXdL+w2VkJq6sfprGktd6Pg68wI7bXyhxNzZd5HSwM=;
        b=VppED3HP6Vsqgh2Y7yqfyaIocrAC9riZKXWaPKcV35lzTeGQi/c0nniPkbMKdYT7mc
         ZFo6kaAvO9ldxpINRgn+PQTY/bs9ggeSczA1nKxYtj/7eOFjxcucmmmfHA4uJnEVr0Jt
         6Ln2qlKRsHHLYmVLXhAd/NQ9XaemxSfWXO2lzNHOkWM0qCR+GDvmmmVK1hCEXghc2NWs
         tjCsBh3RTuhuvHQglNe3F/Z7Iv3UFQskpA4VIIj78EYBH2FE9A3tgp6QbcfZYxONvmnR
         zPWh211zhU3ewy0tIPUGcBKQGifbOvq+cCc7ldKDE4PAIahtX8ffSRPfwhdKJtY4UBZA
         nQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774400357; x=1775005157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFXdL+w2VkJq6sfprGktd6Pg68wI7bXyhxNzZd5HSwM=;
        b=fJ7J6ZElBM6nuJVu2UNYFxvbqXwirGQY6/b0PccGL1KjONVGNq5LUbzjm3HxgPtzVq
         O84dL79iO/3Zx3ms6L21WP/oRcXz3EJBEJ3xNHU4Rbc9JGcPNsVdolIDLUHwweAd1gI7
         YNuvbajooU0eZoHEUNqZ+U/ofPuOrZ0diFFstu3sK4mkizMW7PhneLrFYtStPIfRMOTU
         79MrVsDZt1OBCYQ/xrhlosybf1l3A8UpUbrhxQvGsiZ3GjQymyFh5Uj8lWp/MqfCmE7b
         YZ2qxtwVrTSlqoyk9ij2Y/Bjb5or0vCo2LfKh6FUCSF0I6OrDAOsiiEQUwgrc2ZRgug+
         1zMg==
X-Forwarded-Encrypted: i=1; AJvYcCUYl+KgOLn0jJE0TSmbxw+pt2qOTCrzFfJ24WyzYPOhUNfnLaa4DfJLg/FxwFd/RlYph+t1bY/IgF7U@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKDtn27bN3L4jXR5+upd3dbvkIF+pH0XV7H5BL73jDWdyS5xu
	iKttDuwP790QtO8pOe5C66Q5wSm1p1PyJPa0uxWm9bVMuiSKElghQxap1jbgdL1bII/yEc65qSW
	MXXqmDFpFXwlPYEVTFeQuOdqQuSMwqLAzg4YGdEzV1v8TYgMQPjSd9Rhr85WGlMDB
X-Gm-Gg: ATEYQzxonTa7t/jHAgfhLzXzONLkG1HH7M3d8EQyJVHD+2yYg+LFYKtdQIzKEoN4+xl
	SK4cpuDkwVSnSj5DpxSvqF9jJSLfEMO3XlDCvIsy9o6geqYKoJzcJWJbzo0mphvh3yTDmKCizk8
	a/TZdDGCF4FkTscPE2nBp+Mo24ydBLh3nN8YUNB52KGAX+ZpiutIR8EwN/nw4o60BO9aD2B31Jx
	ao27E4w59gPXYMm3iZ9boMGw9riobZVUzFwQ64/o5KjFclZZmTr/vkExtZH1xX8tQ5wCGXdT+Lz
	xdAVqRVtW/6qg1GxHgrh3aZnY7jr2G9G1RmFH9N6LxxW8j6PGcGkNRY9kgM7jx0yM8vgaYYnjzF
	xbWJlaAFz2SW7M2OwdZDjEFF6HDLjdq105HqDN3vftmV1Qi6nSip+0MuYsIUYJTmG/g/r3f1Lnm
	d27F5D64YYrts=
X-Received: by 2002:a05:6a00:2997:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-82c6dfa5a58mr1381191b3a.35.1774400356901;
        Tue, 24 Mar 2026 17:59:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2997:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-82c6dfa5a58mr1381161b3a.35.1774400356378;
        Tue, 24 Mar 2026 17:59:16 -0700 (PDT)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc66b3sm14625504b3a.21.2026.03.24.17.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 17:59:15 -0700 (PDT)
Message-ID: <f5959454-340d-459c-8162-fb1243ebfe1b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 08:59:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
 <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
 <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o5RulvIugUcQ96ir_seEagedVj4Y57pS
X-Proofpoint-ORIG-GUID: o5RulvIugUcQ96ir_seEagedVj4Y57pS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAwNSBTYWx0ZWRfX/SEDTNC4Dwn1
 48Z1D3uT6M7HH1K06aD1SDCQOMK1/9W26IYW/0xIwe3MJRpretCqMqipKCW0kTu3Ml3we5N2jMi
 /dpT4zw2nTF7asyVr+hdDVp89OsUBGEGQ5Ut6P0twmUsmSF5zoaOb5TD74DjuxuXvQlKu/9CTQi
 4XCSLnqUz44K2NOF8l87GgumTL30V+KgXYR/TID/7/J3hQx52inbsj3NHSZjuiO5iq5xlgvYYjJ
 nop84C1LNjBfFeYbD7RNUGyevj9Ux0NJUpF3hphStiAIoww8tG/1wKMg0rfI/MnMvhTUr61ZeAb
 28vavpPAh/mEf1MGqS/F96rJD42TzFSdZW1zVBOoz5RtRPvV398xJ9efFkPZdt9W2Oscx2lKwpP
 13EaF8XfNPRr56Vr8hucovGg3DC+mKXb8AH/e2Qxs0lBigwocqrwkc545SC3M53Z/Cxc4tbwhBR
 1C3aufqw5tf3UTd/tsg==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c33365 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=25pNCHLBOcfxwS3ibeIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250005



On 3/23/2026 10:12 PM, Konrad Dybcio wrote:
> On 3/23/26 3:09 PM, Jie Gan wrote:
>>
>>
>> On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
>>> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>>>
>>>>
>>>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>> Changes in V2:
>>>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>>>
>>>>>>> i.e. "because GPU is not yet enabled"?
>>>>>>
>>>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>>>
>>>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>>>> maybe something else?
>>>>
>>>> We need a specific debug clock inside the GPU block. The debug clock only
>>>> can be enabled while GPU is online.
>>>
>>> What happens once GPU has been delivered, but for some reason is
>>> inactive and we try to use this CTI device?
>>
>> We will check these devices again once GPU is available. We also will cross check with AOP team if there is a clock enable/disable requirement with the specific debug clock.
> 
> +Akhil for awareness, this is probably a solved problem downstream, but
> I suppose this may be non-trivial with IFPC at play

Regarding to the previous experience, these two CTI devices are 
irrelevant for debugging GPU issues and GPU team has no requirement on 
these devices on previous projects.

We will add these devices once ready.

Hi Akhil,

Hope we can get the confirmation from GPU team.

Thanks,
Jie

> 
> Konrad


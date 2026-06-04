Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208413CF962
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555943; cv=none; b=OwhiLT/IwXcwAY1ui4ZQdtj4Fa+Bd9Trek2wmfLeR9x4xV96MONwCDmib9QuL+F8kWSLKiQbBFtIRNyV50pZ4z2QlKyVN4sO/b24J4+4FU3GC6uAtIGoXiOMQsl0dJ52ylkMPyeE2TQPpBvfmjY3yG1RAvWgfeKvC6fwX1Qr7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555943; c=relaxed/simple;
	bh=GY9HWYcYN2vZxgT/IMPbqLYpuIufDKnKhahxeGgORFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9QTFuXxAvtFXWRNxJVYj85PDyIQBAWWJLGawHvgwk9KuspU8m5oMROROcUADbjPiL2wsUiYbQo5hPI5Oy1417+6EQWa3Yl7T7yI6BTqqK4/+FmdA/APzdkKrVu6CWcbRxVh6FpU6GRrhlYEmlioykCwaL+CxFI0Qb0YktuG62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsvTztIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrJ+I78t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsvTztIu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrJ+I78t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6544Ziv41039436
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=; b=UsvTztIukAjLYmBe
	JIt0gPAqHJgHNuaWhw07hXE6Yj0D0umA+iNeSyjT8pdpP99BdENsPRlLPNm9fjBM
	CCz8+7MuuUsT9z4V1D0wyXO00okNExyq1lJn3s7p7AoegTBharldE8s8kvu3dH1Z
	YreOzaJ3q4BPRyjwfjKdiPnRxxx5zbuuZ/kdey0z9vbJ5hrwLrSzFl3lGPCxfz2O
	CJ2+iw8jW4iaHMFMTGHMncjzecjEjTnY4de5A7EwFXn9qSsIHeuoO1/2e0XeTp16
	J3ilqimm6Tce1w0yMDxOVlWZtajLxhKAvZdc1SHWrLfk3jqt+7jJ7ipxAMtwDVob
	MlNeTw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8j1rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:52:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51768072950so4851211cf.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555940; x=1781160740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=;
        b=NrJ+I78tXCpJGH2tMKNgZ2cFm/JSTI8dliXPJTX+hhbMS6MOCyrRD9AHqLhL3n+MAh
         0E0VcRIGzlI9zxhn5m5VOww+Eu3R5sQuN70R3uQJoJ+04aiN4DGMfGnHhKAx2FGNfkyb
         Fl5H0Mf9W+DCF57phVPheMjN5NkAdQTnCnRL4tHv2uIyzb/XPOKUvwUR3cc1wKImw3A9
         GBRV931s5wwAdOHlDNmR7dxlax5LuegmZnKRQ1fTB/l8cyXL2zNGvjAZnZj6fIvpj1hU
         kcdWOCq5yFQtnFE6fapsJYcR2jxychFxWMD8s0PkSqnJ6EsQ9phiMUta5UcIaSKECYe/
         2bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555940; x=1781160740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=;
        b=RLsuP2aEZN6HJul/goCaS03osAQHhZQFs9YeWSdnuJTW8CX+NCM5+lX9xFzblKAHC6
         eiKFpopOY2WtCwTANJVy80Ym/5OV6fYrAXdKwSqd9EiQeUvjOM7UeaO6FNcE9c9Urubb
         XkKLPQdWVNoUJvRn0sfjkCz1YCZss4gbk4DJBR2oiIlfGBj9BIVru2xTaTqDW3YpfopA
         IgFDvusKaNyegtmsqr8+szlRfrb6Tyg9OMcM6gsJO/b95FTOxv5Pt5AJgvSjjZjI4lI4
         ecTyrdW9a0T1pQIz7SBSS3jbDgaAmwp4xJDSpU5V03Z7Ox9J1JI7vg/MQmjPFnMhe34Z
         KMGA==
X-Forwarded-Encrypted: i=1; AFNElJ9wJi7U8aQGzT+jLTIquAOVtrePBJr7U3nwfsRearbNiNnpzGBGnX7jurTWhJfroLRPHgLG2D85SBNH@vger.kernel.org
X-Gm-Message-State: AOJu0YwnhdTcwjppbpgEiy3FjYWeDsqDJfjpo/JY+VkCseA83KLMZsBg
	EDwwjmNOMrfPsMkMY23mBaOYNnX/nDrTkz5iQxcHQRv7MTo2uVfLZJJDWQBGDjZk4QSZX0z1JQ+
	tW3VIibiPXRnKgBqZg4tcMkCywtSZnzNUc0VlEDlx3ELw6jIrve5whjaPtUg6JojA
X-Gm-Gg: Acq92OFGANLJZTMspuq+4THtyRfqWpkt89b7TAKyTertJdF4V4ihgMlZPYrm+/Xa0H0
	uD4xuNhQUI+s7IW3GJTw54hHtH2KiqrW8jCI565uxsslefD4YapmflT7yQgrQhzfxlzBwr8j+7a
	LdAaYV/FKM5KVv9dlXDjulro0BFH0jYOEL2jjklrncQwfkLMayCq4ijaRXLnQg1ZTS0hJGT27aX
	zrwB+7orTSE9xjnOfl5xx0QaxCrd5dUjgi4/Zj1zrTNBrgIzOV8T1WsORLv8BF10I99DrcIcOPT
	5dY05XvRRco5sxIe3Kovk7UZcyrN9i8TUm/k7L8yyhd3dKmi0kc+sVH2QFfGUkG1UewtKtLsyPL
	/tRXH02aJ6RCyqbCjRbYIdYcDrN7OdLmXJa1gZCppDxOfM1rCt8dLLvD2pqjHTqrcjII=
X-Received: by 2002:a05:622a:d0a:b0:517:85d7:f5cc with SMTP id d75a77b69052e-51785d7f8acmr41866691cf.16.1780555940355;
        Wed, 03 Jun 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a05:622a:d0a:b0:517:85d7:f5cc with SMTP id d75a77b69052e-51785d7f8acmr41866271cf.16.1780555939874;
        Wed, 03 Jun 2026 23:52:19 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e06dddsm262483066b.36.2026.06.03.23.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:52:18 -0700 (PDT)
Message-ID: <9d0224f0-efb7-4bc2-8f09-70a9b4d62810@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:22:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] media: iris: Add support for glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: swtEL17eBSjxXrX6_PWdUwHGgVkDxOKi
X-Proofpoint-GUID: swtEL17eBSjxXrX6_PWdUwHGgVkDxOKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NSBTYWx0ZWRfX0Uz27QP7lsPS
 z7XecK/OG6KZ7UBgluYB7mAC//aeH1RhsO0O2WDi85IxVXP7HPE9btPFnb0kyZHOUyTIkczvv4L
 iW13GJM3ycv4WSOgsSC9cBMfnz6XUfQx6tftjUqmEA1/D8nBlSTetm0JGITaG8c8LkZZiL/knk4
 6tL/OwmnIRThiMiqhNi2NEsvTcR1sWrUOIUV+oWZhHHxBZnrGpWdZvW9XA1ujhbWNoJZCRE4vTt
 cUft62k3YZTRxb4bromCDn/wIX43VxiVYbdieeuSA2lSufa/US4BdWxwqgvJJUPA0rHiT4MzaSB
 hDT4zkvlm6kdysRChPgLZT8pPx+U8vSpYtdfCO3CbHHFvIJAfZsngrdKu+TaP06//fyqSNYGGYL
 6ve8GycQbAK141nzB3VmX2+Y4pk9GYxG87W89QByeSlPNMY+RYWGkeU5dKBNEep4dpJaA0mdfgT
 GDAjJ0mwSkyUG/xbv7w==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a2120a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=MmbEFYbivRMSk88UmGwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040065

Hi Robin, Will,

On 5/28/2026 4:24 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:15PM +0530, Vishnu Reddy wrote:
>> Glymur is a new generation video codec that supports dual hardware cores
>> along with additional power domains and clocks.
>>
>> This series adds platform specific support in the iris driver to handle
>> the extra cores, power domains, and clock requirements introduced by
>> glymur. Add support for firmware loading through context bank firmware
>> device.
>>
>> Dependencies and merge strategy:
>>
>> Patch[1-2]: IOMMU maintainer need to apply and provide an immutable tag
>> which can merged into media tree.
> 
> [...]
> 
>> Vikash Garodia (2):
>>        media: iris: Add iris vpu bus support
>>        iommu: Add iris-vpu-bus to iommu_buses
>>
> 
> Robin, Will, do we stand a chance of getting these two patches in 7.2?
> Or should we use some other approach?
> 

Could you please comment if the patches are good to go or any 
suggestions you have ?

Regards,
Vikash


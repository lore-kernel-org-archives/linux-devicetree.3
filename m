Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EBB481672
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078578; cv=none; b=IOKZeL/DdFcevZ7Tu1ZkPVow07UEetiGnktGRQbEPfqXmaHOKuRafaRc06xhlTXiViv526xQyMN6eJDjssiicxommxKORIQ2Tik9FBOIhxY1/rtwiMLenQyerwJaTrJlKt+y2MRfZMnhs/bgiA03s9YOTJirhxKP/7RqxdN/mKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078578; c=relaxed/simple;
	bh=7xdBxUBZ3lcN5J3YExFEy/pYiR+GDtAc2KfJFebVAlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEHmtdPaDlE2i9FqgyttdStWls7HIGNUa77OwkTl1VXjwhOIBNI3JBS4g+TrGlrbZMHxvHe6lFoi9etFHOpC8cjtbseJgjZPXdWk6/RfXFRJMl68br+YA+Vp2evrJnSEmBVXorURvBZ6DEgnQbh8WXMWjQW5Q/I6Fk5x3pgLgrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfTmOtAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2rSghIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfTmOtAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2rSghIt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646CtXkL529347
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 14:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=; b=MfTmOtAXC8Ic6Ykf
	j/xClSdgcYtwkN36SXrm2olPyJXKIZLSnsmA9P5iWHLYpe8gkgC13UvDJIuxJFbp
	kgXjegjKGXC5kvB140BaMj60aJJKMFuh78B13koLPviQVa2vt7mry3XXR758Mdvp
	Fj9lE2HNta44qz/tmYA8q2wSEiAFzpanxa5NMGaHKTxPAp0FLh9BwORGhPnqFK1C
	1wLtNXzlHfGchTvr/0ybbO203pV5FFvTIBG7zB5qSLAekfsIBDVosacQnvWYNu/w
	RQnHmW5O8V3dR4zsVXwuRun0J9ILKY/VIxDrkEOI4docvkI7h4+YEja2C+BuHxYa
	7hVw8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015x9r4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 14:42:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba5f794825so11998305ad.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778078573; x=1778683373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=;
        b=K2rSghItutNm6GufN7Of5HLOnYdiXzY0WBwAHPhX9MpUFrx65MKSX0E0cpCRvjKKPn
         aQXjDVRqpcyoj1JvH88P7OwuztAuUfhAyShWOFfRJgJCuItuu8WrF3+zdnT2klQfwZtV
         5wnFAXbPVDaRqd9DGaUVM5AjXdAP48+/KFLHvdPjGZFcOl/Up/e6U/yi/t29FeCKzMyo
         hu38Bdx49Y+GcSNUW2t9m/KW69H2kTZ8bllmcCD2fOiYZMKVNNdpuudVCwdFon7yTrUZ
         GKzIXL9BntddYySXg+84yZk6Bz+BToVSC8WdprmYsVBEltXp9dbHzoHO2+GsOJEfYuN/
         1BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078573; x=1778683373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=;
        b=HyTBTJx/7gN7f9mkaM64l2ZzVprvWao6XOKZ7OxPW/UADP3v2xiDenCKVx/jZMlIzT
         7T+N9NIXtHOdo8J3idWZvXr5jl8UIiP1d1cGWwPG25FBn6ca8W/+/DWrmUrzQbCiTDR1
         bRYpUujXkJV4AQASOC5FhmXaQnNN1VYlDoYZCYxAsX9tU+R5ICYOdxcGFv0WPTdas8ec
         UjfMTDWEaDSl005l4DItTNP8IU3H2pLiD959s3CGXIvSMFO9WttC15WSybmzCvSAr4g5
         DEkq+0B0y1qfPiqyPaGDBXIMqZA1GODSX+lB9gmCz9k5+0EP1NW9tdrD+mm/CLWrn7lu
         sgYg==
X-Forwarded-Encrypted: i=1; AFNElJ84IqAVw/yR/Xv9Iv7gvFfyVMAXMWFhwgjBnq9UGOw7m+A832Q/I1qMiRpeJxG6w8YsfKkdf+s8AfzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAcI2CH9doIHL8vDK6WmDBtjA5dldkzIAsqjwK/OG3i2wU9miN
	QzF9SN/c/WFmrL2urshBZSluN0Sq5r65VdLOONFb1wcJxj21zC7g0XLD3rLaRSWBq39MLHHvCBg
	kFejebaNdiCNQa1UEbN3n3RTdt8xodpt16rd9+BDMFH/fEkb22SN5jRyTW3MQn9Fc
X-Gm-Gg: AeBDievxuKy4E01Cfjae3ULa4n7lGNMCIslu7S+1oaNQ3tShzS5EABH395cgs1Jtxci
	8W6E5UPZhxs0Dd2haOukt98TqFWahLgtBjI8CvaLoAIXSzqTabmJRL0I2NphnXxw3zmiXzVzwNR
	zPJk/QKfWanvXvUod103sfSIKIkQfKnSc8jhZYMG25E4P5FAG3FzdPZoXkk4JD1bogKX04dWqQw
	UbilDogRcO+vhA1ing5dQmqF5MyGyDYuuIUVMyceRFy6aJ6WMQlm0nzQXEJ1avPwKOUHhVlEC/g
	hfKk5bCseVMB0X+dXK7JuwuRd+UV5ovMG07/VXI/n3Vs5ubwXlmUqLDCg63KqBvcXRUkqPaLNms
	mzwbRQNsIPIHaTbl64QXHze4wze/I98xpbxX0E1qU5HPJYs/xql8HjxSFRwjjisOk
X-Received: by 2002:a17:903:187:b0:2b9:fb9a:1103 with SMTP id d9443c01a7336-2ba79ad08e6mr40451965ad.38.1778078573439;
        Wed, 06 May 2026 07:42:53 -0700 (PDT)
X-Received: by 2002:a17:903:187:b0:2b9:fb9a:1103 with SMTP id d9443c01a7336-2ba79ad08e6mr40451375ad.38.1778078572916;
        Wed, 06 May 2026 07:42:52 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bf2c6c1sm27899755ad.21.2026.05.06.07.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:42:52 -0700 (PDT)
Message-ID: <b24018b8-8c28-42fc-82da-7b26d3175ed6@oss.qualcomm.com>
Date: Wed, 6 May 2026 20:12:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] media: iris: Rename clock and power domain
 macros to use vcodec prefix
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-8-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-8-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69fb536e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XbLICjIVyITgExBpphIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: W6VReCw9TL5PGKaQ39_dG4jQuNFq04Fe
X-Proofpoint-ORIG-GUID: W6VReCw9TL5PGKaQ39_dG4jQuNFq04Fe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0NSBTYWx0ZWRfX5p4igue/4LCZ
 Zc0dlJaE3iV/A6hzH6DyxkpPJ1rx74Rvc+zTaTwlGeiRC9/NzH1pmurap14OqOjjkln4iwRsUIo
 9xuhTcaASrgGkM4O2NmL7ee1MSYuDXFmmpw97OMyuvu5CsglX8HC1CFGdrx1oqhE0jp8N+MgAod
 LpRSrMihnI7JzD2u0EX4tAB3CcAVnC8P/dsWyTW8qF4T7X3kjfNM2TMSX9/V77nyc31lSjJHbI6
 7IjVZQpb7tKUYmX+wF8cWYQZ3IyK7saXmJQt0hA8NSkJo4khzUXeCJ/tWFUbrRJLnhCYwFmBIhs
 mT35HDtPvFjGkOy3XE10zHwLe0e1fsniktur6kscDLtpMLnPm4DZhjEuXTnFgsG/IsUBYJptxoU
 +y5L3o3JaE+DGQ7Ey6EKN29tDMueBR9NibkNTz4terE5VOEQ1/nNptWBxXTgVdm1YxnSNfYXe9w
 cGhkpNXHGXLAqGo2BwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060145



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> The current clock and power domain enum names are too generic. Rename
> them with a vcodec prefix to make the names more meaningful and to easily
> accommodate vcodec1 enums for the secondary core for glymur platform.
> 
> No functional changes intended.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

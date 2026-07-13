Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A239021F
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928603; cv=none; b=QGILDqwjULX00CDRKoaHtSe/C9F4iKq7B+3w1tSE3F85BJlxa6F7L+gNxVSvNY/XnT5z1vW11w9arVVz4wKUofjwe4r5wnXSHZnS/+6GyQEgftwVKsdV/7hCCzJmwp5EpZySDiwoFnD4hNJRZejYcmMC/+KODuk0eAkdRejN2OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928603; c=relaxed/simple;
	bh=FYd/97fPU/oF6qcbCDo8Ty9ic+TufdwScxpCHOV2wVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AacHFWDE3PRGm4kx39YxHy2A6vf5y0oRlwLaaueRsKkgDcAMKZqzYhLFmD9sPojqKKJ2WiGZOM2X6MqoKYWviRitkGItHiHuVdYLTa+gjpOp2/mzUZBk1SW9wSVStlek6RZEwMqLbwjhRJXFKoDHPhde7A3M4GcgIMav/wtd/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ip+vZ/my; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrlJFv1w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ip+vZ/my";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrlJFv1w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nxqm390906
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=; b=ip+vZ/myfGU5dDrM
	rvTPdqcnjndtmqhNEi5MFsQbW93OwcMQUwM6g4CIPpKcPJdt+ZIkjoEFPYmIma4G
	7bHgYLwih97a5mMz7iO2Ez3lG4FKSec+VGWBZ08MdoMOw7SyNsYd9IeWF4p8zAbK
	pZKj748Hpyun7KPB4QLy6YMIX/Hzy4pUpjUSoiU3JrEdpxKbR33wsDKdC+4JUeOn
	pib3Sk1ygg1B9Z4c+S0Wt/Puvt2sJr1VdOpR49tJkbfLqknBnmOwT28xZXN3lzpH
	GLvfq00GE9xKVOU9H9IFRnxqyCYj3g5ym1xzkJC8FDzWdTeSzZsUK2X1KtbWEWNX
	2HDWEQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmwas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:43:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f113592bf3so57426526d6.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928600; x=1784533400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=;
        b=NrlJFv1wA/HLWfKdBFYaqRLNR+zsVhmjulAN8EntBxVmx0G6QQadxOCf5qFXomfZTq
         bd0Hrz/20mbj6nXsZz9J8YBjNoj+RSkI7S9rm6FrTEhvqs2C08gJMNdNJOGqaX0k/ed5
         inyHVQXGzaTE6PgiuX5NzB6/Bpl3/J9gEnrqU+v+ux0FoKy4lvSPIloPN94ENbb+Yc6T
         y7eLAxg7J6TeTMxagHuTTwL/NU7hNM/cnxzHs5vPquKMc0p1CSLTVYakUvqkKgmlGksE
         sFX63/XtsSYp5zQg/rFHQJp/gXvuAnvlGgneoNrOxW8CD9Lgf6spaLGV7DD/7CBoitAL
         Ls1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928600; x=1784533400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=;
        b=sp5P9i23WeoD50bsEiYkK3h+Mqv85dyqbegrRgFRDHTQqf2jhl7ibMRZtdjmBLHNOT
         JgKVtBv6kI3MAgkgA2bpXNTABBMYnIvvcrEzlH/c3/fwHmKDiJ4rZRMO8SrLunWGwJwG
         u9PLyTVCUCfjY74NBtggVTt2hpFJQmOaIJ569VN24jvBIIdtgdHnnJ76Tox5To7fnEU1
         gnmANtPlc2PNjV6eJoZum8KrcOT53tQ7/6Y4QcOanqo3bXgBVWwdLdEhz09k5c39ckfr
         pjbm6Ah3nyz2bnGuf+OWqBw0aUlL78akEyzvexNoRbMkGP+LaTsSCNK/y3QQH+rsYa21
         Am2g==
X-Forwarded-Encrypted: i=1; AHgh+RobvVlZPQ0uQ3+ddGy1b0kZkete8Tl8tiX+/0Ww98qLuq8lniUxVeldW0+CJU5IOWqE82LpnaIY8NYc@vger.kernel.org
X-Gm-Message-State: AOJu0YySO7YcHh1iil/LMB0L3Js43AUvZx69+GOUnM/vM20LDOP9N9yU
	hUw8czaTR57AXen0/nylROtn0cwvOr5jXzb/pz6SJCTK1PA2BkEGPQECQoeBhh2L+x7iITsSGC4
	4UKtg41/1ZMgYuBGI90GqZB8NvKwNP0l6DAVi+uGxmmKDthlnX7kdO6mQnh9avlG4
X-Gm-Gg: AfdE7cl/unR+bGMREX5uFXE7akOHGo3uV/g5dz6Le0nQdpgO2l0PBPxup8ozRYcsx9t
	1awaMcR7jjxYp5pa2hG5+3cxL5yOeNo2KRRSK1GOXMjlfl4GAZXgdBt+9Xiauz1KfN249P95UVo
	Ys2TAXMoNHVL/j0LYHqJvUVom5AEBL+tHW4kBcnOQ7NVq/c08qBwyKV3zbENRhDMuPO9ZsAMctR
	QbIG2iJEnrvSDT7Fy8GzR79/lpMddRuCSHiTb6SupEefvCMVp9/VMWWENnB0GGM6FvgOYNfjwMc
	/acTzipghYIcxeUkxO89rJELNTu6jusnI01IZcPVwVSaXFsAE7f6voPKk2bpPRr2vzX1VGYUMY1
	MbQWom30kV/cn9t0MmHHZEs3v4nWkETMR0q14mY2ASWI=
X-Received: by 2002:ac8:7f83:0:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-51cbf2ff090mr78433791cf.72.1783928600119;
        Mon, 13 Jul 2026 00:43:20 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-51cbf2ff090mr78433721cf.72.1783928599745;
        Mon, 13 Jul 2026 00:43:19 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821666sm940679366b.4.2026.07.13.00.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:43:18 -0700 (PDT)
Message-ID: <891bfdcf-f7f2-4f7b-bbb1-25c641926f9a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:43:17 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
 <20260613-fair-ultraviolet-dog-fece5e@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260613-fair-ultraviolet-dog-fece5e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a549719 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jQIKpJ-_qqBQciHbE5oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: oDcZYexGKlp9A3_19Pn7RpG2NWzuxmzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX+ysTho1N4VxL
 59GFx3gK3U8X/ACLk3KN8yqX84p9itYOl543oRimwaoYmNBVTZ1VKOSKLl5CQYwWOemgofp5rZv
 eE5qlVQoclV8MTQx7eX6/4V3mNxeNzrYSm6vZRAkndYcXELPjtu7S7T5lZbjfh41uvsadfNYAuS
 OSDYFfgsOnalug6QieHzjgHpx0Y70S/mmYz/4ZJgaGYbUaHsgYS+rFvvuQiXTwo5jTsD9uLzYN7
 hTZe2/uFdPKn+1d2q37pumgh2w0h+LMnEaiEk+tq00db/u/GWqN31SAo9HusGWy4XKHx1Zr6Vir
 b+nmHayrWgZnLD6Gis8OL2HoG20CIw23o0meWtGaUgWZZi1QGjRKInrZGUGhU0FkX+pJaTF9NfU
 DgXiVkPnbatQ6Po6dCYfT0oR3RVClegyWpJKKLuQgaQbUmcY/vRBszIS5mAekayU8QafMPHZYqj
 fQZR1D8lLgxRXyWvlsQ==
X-Proofpoint-GUID: oDcZYexGKlp9A3_19Pn7RpG2NWzuxmzA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX2GsCUddPW87i
 1YzFSqE1znju9sQqJxlYXJIieg+gMfdZ82Lhp0IIphM032+HvbRn/v55eH9oLQKeFDbW5E9/tGK
 s49HiHnw2xFKHXxaAWjkRCFd/xFN3FU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130079

On 6/13/2026 9:42 PM, Krzysztof Kozlowski wrote:
> On Fri, Jun 12, 2026 at 10:44:14PM +0300, Atanas Filipov wrote:
>> Add device-tree binding for the standalone Qualcomm JPEG encoder
>> hardware block (separate from CAMSS media pipelines).
>>
>> Document required resources briefly and scope initial support to
>> currently used compatibles in this series, including SM8250,
>> QCM6490, and SM8550 class platforms.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
> 
> You already sent v1 and you received review. Quite a lot of comments.
> 
> Please do not send duplicated work, but address the feedback.
> 
> Then version your patches correctly, so the toolset will work. Sending
> duplicated work is not making the review easy.  I am dropping this from
> DT patchwork.
> 
> Best regards,
> Krzysztof
> 
Acknowledged. That submission was a mistake — it should not have been
sent. v5 addresses all outstanding comments. Apologies for the noise.
Atanas

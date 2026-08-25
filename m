Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E93F413F
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652729; cv=none; b=G//dxtzB+QorgVbb4TJZEwSA+1Y9fovmqVtX6oM7qDAn08Zyw9Z2OFxPHAleC9qsjbLT4OEThFgrh7NRAxMHKRhxepy35Mcb0RBPzFE5wq9nHhGvDJnkwWvMEwQtGNeQhwYn2X3A9ceNuJZqE43yttk8kBptTE1WHc3jZSeBdYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652729; c=relaxed/simple;
	bh=EQSGiojsYALTSGZ5Y4YskmupYqjLh+q7MfWEhQtMbEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GnsDXfRkQm1qtUNtkm/NL8mkN7nVvmAFU8zCF5Lbvca9oBxPxmXtfzLAq1mob1iqZHu4iETEWT82JirWmEQx1GoCakhHb+LD4Ombx/mJ+7dOkYyglMmlGI4k2/bCy2B7TmNuuWkdLfbpSzDdkvhyyAukcCXqLMFxXtF3YHUyzjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvmQlg1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0nXYuev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvmQlg1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0nXYuev"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88RX01163451
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJEm0YAVf8sVvEnytUvJioE0+EoqWLxL+9jnYrfDyFg=; b=dvmQlg1W6qBdV8t5
	7FwJqiHhyXr4gIu/49lbl63+mHf7l45oVoapZrq5gPw+a4vrnAACOMHOuNkkGym4
	SB6NqfY1HhpSw7/0V+/H75a/xQIXjSJNTlkagZxuiK9K9vXEDxSYu6CVJHxa/88C
	60hZxJ8qkA0Vu18yrL148a0y3iHVyHvxVKjciYrtTDKTBdz6TADlc3tB+Xkcupgc
	kyY1+QKKAy6WB7DXCb3kLY1SDJniDJqs57e3ynY00/sIpMLcvYFCqUFOzr8dNizU
	7/K2+B53g/sPIstZy+67+nrZ4zUg58McZIxr7NYkkvXMLjhbw5UOYjr1PwfVvOHP
	6Qm3vA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jj6qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:12:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfe48ca1efso64749765ad.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787652726; x=1788257526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJEm0YAVf8sVvEnytUvJioE0+EoqWLxL+9jnYrfDyFg=;
        b=i0nXYuev8HRneTJzUe3MHSnlOyNVlfoWiflTbONXItcBWAYlh+fWwmQ03YQRnnmMK2
         gF8qGstANUNkIfOgnZg99AbdgDwZB8kq8epkrsTxg13WDPtAXlj1zN7tsewsYgwvCMWV
         IOkOuk5p1b8Aym8WfCrdkaGuJRu60n+3urRABDvfHcA5mEtTLQdNDCvFTKRgtOkQrolZ
         6xMbDlQV+QMiCk0QHVJHtwlQZuplUIqkrLX9LmRZtXxfqUveQ+cO0Tzfo/+I+EGRD+bq
         Wm/RjOyUwNcJBXmXM4AxXAattUELQppsUSAHy/wBEjvhUdE7CeuTjKMqOBZAZUF+ON/f
         /CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652726; x=1788257526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJEm0YAVf8sVvEnytUvJioE0+EoqWLxL+9jnYrfDyFg=;
        b=ZXe5HIsXAmX/P3Lts2onFcvLsVAwdsk8kBdfYTbXPCGf1bX/SO8/3uDl7wiMwmEXI/
         FonljNqJp01zfc9r0tePvFcAiKVej620RI0njCMi8370j3l+m8ZCsns1pZKFTxmCthyj
         WQQJhAweeNojqKsjMxcfZUvIn7oWSK0/s8rwLBZeAUt6aeDNZslZHUlkgCySeaetyp3b
         fbI4Wx3SaEF5EcLG7pVen2LWjHckaHKETB3w5K7qfrW5CvtpYHXFkYkTb7WSt8ZyHegD
         Z6XFOvIoYIMHfuzxuDnGowN+VWnjKpYPjzfuYya5v5OIBHwBonV1xKyYMXq670s/sYou
         6kqg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc7+RliwhaRKgxkdsk0f9SVo9onywe5qKIpKO8EQc3ANdBT97Ji8sCD2Lq6KE/pb8jyo+YCQIzbYPR@vger.kernel.org
X-Gm-Message-State: AFuF++lEHvybAiCn3tjYC7Lziojt1w07Xr0J88hCcu2jdrXZLLuiL8E9
	Ey/RWlIuLCkrYuqdIOgif/FAul+AxBDOMCViilbDvWxPRVLygj639JD3BOhH7/YmGAtvhSbwaCv
	JDa9z30MYwVqrmIM9dyaFiErb5z1b2nwhwcUg2O+gofUUSQzUN0n7YJR7iZ7dQnMu
X-Gm-Gg: AR+sD12TanMGvQXcbAR0Jlsg0EIMwZmmVcLgx5Y8vufu+ycQWLk/CW+/9xPIxBqEwx3
	u9AG13WZ9uJ1EQvVh5XCzuuLsNGa73iVTnV8Bwyd4bXFK6FycOQQsB+20jX4wXvil3vfEuZdBAb
	D4F3/7CXHANGMr5K1hxzWnt/T0sCXTqDZKc2+6JXmaIpeWTb0QRBxJlzlyDG9fpeLM7eI+cnrvM
	j8YMyanxO5WdZMsQxDNW4mwpt5u5AAK5OMw+9JNjaSicwtMhb7tzTtsYvyykksEaD61x74gQrSU
	wLN3Vurh3pn8oaMdHhEGSpZcnFjCBFMm3tGLT0HsM41mowjZSKHhyW4YKeXO6IZh0T9e76GgRIl
	jf84OL5v4cZFi/CYiYod0vcqGVFzulDU=
X-Received: by 2002:a17:902:e541:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d670cbd08cmr430892575ad.13.1787652725998;
        Tue, 25 Aug 2026 03:12:05 -0700 (PDT)
X-Received: by 2002:a17:902:e541:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d670cbd08cmr430891585ad.13.1787652725581;
        Tue, 25 Aug 2026 03:12:05 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761cf9sm26410825ad.7.2026.08.25.03.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:12:05 -0700 (PDT)
Message-ID: <f30d7e3d-6f48-4c3b-acc3-36f1eac1c5be@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 15:42:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
 <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d6a76 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zVusS4tTP7DiVzkMLGIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NiBTYWx0ZWRfXwOKZWakxxgSO
 L+/6si1Pzo8ibDk44xAtN9L53a0PAWnzdWDtMno+cHSNzWYO/YStg5TFfvDRHwHUNiAUm68JhCG
 K63xz+5bvir1nG5fJDA/igFFcJ7vSBDz6NePylk/h3roOIxy46V7sgzR7CuGm6hHpalWa9TMjbS
 d60BOdDCSJyB+CIh/ovT4MJTItrkQUz9oJHZrOGIAlLtoo6IeocHgSTaequnVGwC05uBr/EIaUJ
 9YqF1T7dOihYI7L0l2Mgnq+oHJvs2iJIwpgOHPVVWLloUgpzjXpGxUDxvEmwZ+YrVJQ/09LQodx
 uvhlyBnio8L5gUHgc5ADzB8sXG92d1PD4yU/Sas3UVZRRwiK3IhAci8yuTVMIptXHEVK284RC1C
 D3VbRw9owleShnE+t+6thRRKGP7AWeC2UANZiBA4EvQqQ7HnpT7TUnz3IEsT4LvbKvz9Gr78g0h
 4SW/vPK9QxFWTf1ac/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NiBTYWx0ZWRfX3N1eC5N6QJrj
 VqJKbeqyoYj+B5ka4CGbRdhJVvRAQceAIavJsMrO1WEuKMcKhbwZGXsfozAJY+apzlg49qIz2i+
 fXJooPpKQmwCzhvOPYv+gYhkO9BibOQ=
X-Proofpoint-GUID: ylmi4ci252abXhyQ-mL1IvWIGGC_Iyi7
X-Proofpoint-ORIG-GUID: ylmi4ci252abXhyQ-mL1IvWIGGC_Iyi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250086


On 8/20/2026 2:52 PM, Konrad Dybcio wrote:
> On 8/20/26 11:16 AM, Khalid Faisal Ansari wrote:
>> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
>> connected via SPI5. Enable the SPI controller and add the TPM node
>> with the ST33HTPM compatible and a 20 MHz max clock.
>>
>> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> This is not a valid tag to put in the commit message
>
> Why haven't you sent the two clearly interdependent patches together?

I referenced the SPI5 enabling patch because the TPM node addition depends on that change being present. I had followed a similar approach used in an earlier submission (https://lore.kernel.org/all/0afa55d5-20bf-487b-abe0-4e2126ccf453@oss.qualcomm.com/), where the dependency was mentioned in the commit message.
Since the two changes originate from different internal ownership areas but are functionally interdependent, we have been handling them as separate submissions while documenting the dependency between them.

>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>> The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
>> connected over SPI5. Enable the SPI controller and add the TPM node for
>> all three board variants.
>>
>> This series depends on the SPI5 node addition in shikra-evk.dtsi:
>>    https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
> Turn this into a single addition to shikra-evk.dtsi

I intentionally kept the changes in the individual board DTS files rather than placing them in shikra-evk.dtsi.
While the current EVK variants (CQM, CQS, and IQS) all carry the ST33 dTPM, a future board could potentially reuse shikra-evk.dtsi without supporting the TPM hardware. Keeping the node in the board-specific DTS files makes the hardware dependency explicit and avoids enabling TPM on boards where it may not be present.

>
> Konrad

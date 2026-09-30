Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFA93D3D1B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764446; cv=none; b=A374dwG3+UItcIwgFYpFHNiVZNFUdJnLvj9gslf7W6ZIry/e5Q4D2A6jWjN0sHgXWt7ebPQHji49yMdGpCus+aL20xHeb8CbEbHhuBt7UQL2qRpxSwdGyIW4EFJyZkqTd5RYHelC0p42Tgcnj2tbvY8HJZ3Zz93dthAb9K/p288=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764446; c=relaxed/simple;
	bh=B5M7ExAdSYXfY9Ds6hbircikXslMTP7HxDS17duaV3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nue3bwt+W/JjhECni+jRLSVxWmLwLViLRof62fZsQxjkF/q07XClmgW/9cQk2xBeZRVTU7s9Gl6/VzKfKU4XwBZNz/b5nb45yXZUxkczZ6lQcsy5/uqInFAVPwdepv5ekgHDbkNIiBOn0a5JQY5qr7ZlvHuKGDIrbR/RaA7FkYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcuLfzas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDJvBFU7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcuLfzas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDJvBFU7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dS652666965
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=; b=mcuLfzasxShQJgwb
	mMbKqSxFaxJ79aQakGIq9OtLRDQi6rPc6aLJ2alM2KjKJayGEjR3hcE7TadMmAUp
	ZBsE7OQ13BrqwC7nCT4cN7SaPS1szAs/jTaq99+p8EKaM8Dv/O+7uAa/CKJl8SuR
	D7bVPAp+cD/oUvG+e1/hDfOB2oBCJuJeB6UuhPZHdcq/vS7qK8kPTOOtnKn9+yA/
	y0sTaugqJX2ccet6gdX4OhEGQUKzCtYmDA2Ul75joLl10Y3zBoa15Q2yxLVLwOAm
	qqqePi2Edm1AyDfvrsBpDWsoX8HNbTzO8fVQXLxc7Y1vh+0e4AIyJ07YNzUWBxiO
	n3sSVg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27gu24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:34:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a54501a8so167226d6.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764442; x=1791369242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=DDJvBFU7IX9+poGrYkO3rPzkXlhgqdtTjVsRyLpoUMDqGSSfK0uhQ9IWCE+5NLyRK6
         QysDosrttDZxi7+X+kILwc7BHnJKpjRiA67S8F710Zwv76KrYORUNL1mPbZqzuGeBl2J
         I4cPHH6MqrW7nw04lCP8bL3d+VffhPx/envs7GajmWbD/ru1bSRBBKrjmL/+MHlI9bJX
         xoMVpcemXrRfoLdl5kdaCQWVB/NqaEQY0e8QZN/S9lryK99ZuzaiFmS6r82yj5M3fzpo
         Uh5Klwt0URkp4ueiOkp64E8/k3DGZglWHddydd76nBFYT94NThfszADCxjvDqFN5qi+b
         W4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764442; x=1791369242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=1Ycx+xdCqbIhufVeV733UBiIVw+iPVSDjhnrWJ2g8PRE9wErK94VPdJ2RL1FbPRaSb
         wJXb9JopNO9EqruNZl+NC73cCvcG0vOTIFV8L+mMYm0NTuYd4a9ps0L7ExFuz/XVUkix
         xMtDrNCnrQXSpNKMfwkQuqUKCZlePHOHM4vu+cjEedA5acVmueIOQLkBrLQFc1kpgi3n
         gZmVYA3zQXJ4A8gGxlwGMhVoPs1yuyxj9deGXmwHNUe2w7VQBgBOpQ3J06d4JlJHSSi/
         zmEbU7EwPv9a8yYHgBC56NKhdBbw5IX7O4GUijaa7mKY16ZsMI4KnwUhUvl8NSGEaXDK
         cy7A==
X-Forwarded-Encrypted: i=1; AKwUvBwxtddueLHO+TzonOXHCJbpke+Lgc8pnCLPh6kJ0BpLZuhH6eO9AsJ3b9C8uSH24ESx5Bb5ZZWcABWb@vger.kernel.org
X-Gm-Message-State: AFuF++nG7mPpBeV0JEh/DuEtSmKLZ93Zr4lNPtcGe4YJLFDQgxmFApE9
	SDiOkZgGPdp9zB6CRn6KZ4NtM0qq0bz+8GaokfSEoaPaXqKE/t7UwY4SD8MC27DPY5HrygQIl6Y
	8a/cjolbciEeWAJOAdAMsUmZUaSc3mgLoy01OpU8ubblL4kS5EukN6tTedacd+1PB
X-Gm-Gg: AYBFou1Av+ihfks9iwMoo6xXHhh90u4KFNmDyksIlFqgQ/JoIimsHDl+97DvWjv3/G7
	/zTIi6zrgnZ6MfCT8lR3HxOrM4sOZxxkOh7ITiPtETzL/5RoeMJ37KQoqIr+uS78rAQ6N5y4ddl
	K2lDeo0SrHuUH083mwLDAJ34Q5v0CSlDssWdQ/xAowtT7/JKkCXLS67JLpNfHlR6qjSeRICcaQt
	M6nreUkshvFpPvgjXF/ysd7O+M+qo/Se8zWmN94HBdzMKhjyDyiaKwzKrIRn6/AMG3M4FUyinp0
	GfugIr9ku12HPHeQ7tfkBPok3XmCPy0issj1jTmr9/OjoVFY8kFtqZCjshuMtLUdA/Rd0b9hWj2
	N08x8wjigq8O5XOd0BiNMUw==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132549885a.0.1790764441821;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132543985a.0.1790764441219;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f42da8sm44604666b.19.2026.09.30.03.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:34:00 -0700 (PDT)
Message-ID: <4f56045a-a2d0-4c3f-8e69-9ef8d933be8c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] media: iris: Migrate iommus to iris sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfXwNKdOkvpf0Cy
 OtjDUtNbWjfpI6ow7ZB2dXglYfpJuu7GKsp25pLHVRjthuF0LVxBewa0+bLBWXtPHZk6vYXbYI8
 Yex8Aewn9la/SH+frYoIPucQNwPZyRM=
X-Proofpoint-GUID: YTs-QYBOT-r8dEJvTSwyKbJT5CvoR17S
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abce59a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ekhMd59VzrWsTOqxRA4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX4dsC+QlHaSsI
 gD9VcUmLUmXTtbkf47FyDI8RJyIO4xfX+3Vy2h1L3tosAxXiSv5jrDnjtJRjdv7Eif+s2183CQj
 edRIXcOLncbdKHCCHsg8bWGr9x7mrnJDkXYxQs4PUxXCpiKwMGhGysGWFsicqGYRsqo7gkjQ7LK
 79OIfgsEJQIst8+Jbi8ZlO73Z1L4LrTbFwZ0stmb7YHagrEsZh0bD2TU6jVBvcSWEZ7DNPnLZHu
 WrXIVT7lUJIyY4nIQWZzXARtM8pbN/yDndlJ3vK7G06dsyUXcIbsNHcKB7dg8sL5xOyqbI1Zmte
 aAGdpjdnMfwij+UpaHiS+E8UJFVpEREnho0IHFlP6gwpRLKpHg71n+agtF20W4H76kU08nXJ+SM
 Ze1mDRtH8lEU/Gw4n44/A3lHIHu8MW/6MB9i80enafsqgPoQl0j+satcqkmeNI/RHMEptXA1nRO
 zqfLIrl25AKBvj3chig==
X-Proofpoint-ORIG-GUID: YTs-QYBOT-r8dEJvTSwyKbJT5CvoR17S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300042

On 9/26/26 8:33 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does 
> not restricts specific streams with specific addressable range. The 
> non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
> pixel stream can address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Please address all venus/iris-enabled platforms once this lands

Konrad

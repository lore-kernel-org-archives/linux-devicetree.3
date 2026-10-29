Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264059;
	b=ApyKdn3gNZWkyeG+uE0fcvCby6FRFrnqacqNFyS4fC6ExRNELsg77eRSR+nHCskWvkTf
	 6OahJ5HMhDYOrzoUWOc0C/LO9wKqq3YNjoJZkz4g/x44OI3EhPwfpPduSB4hMqKDbkKzv
	 UEhRuIgNsaV+YAwXf+VxqnsHEkldeTN0ASB0/PVi1XNK75yhTr4VXLaOuQgcyKHAo3XIF
	 UCnLRPcj09jD0by6OXMGvZ+50p8lqCi6Wg/Kn9XXKNIHarvp8FCJkR8vieoCr1UX7/2eL
	 IR39fD1UarPdA1iHdS5BkpGzLozqKAvyUVKs9xo9MMgJrENWtGQC5dOYGYJfB3zw2DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
	b=zGRE6p8U5oeoJHquwLaqmhXBjqFlEKNYS5OGjyDznj1FGeOGXy95htc/9n9yeTm2hr33
	 4k4cBfgfwKku7gysFBjJxbRmTPCmHXr5wT4aOn32rdtxmQhAgSLA0ZeA07g/cY2RQfzAH
	 tVNty8FAiVn1VYXOs5bb0vj9CjKwJ0TU5ejo7ZCaH8dnKGuqMDJdfyG59+k6UW7CakLyL
	 gUvQzBIit6Rz6GBAhhkSFG+407ro3u/JXskI0jY0ayqlOk+okYD4oFayI3qv/wJn0ZZQ0
	 w8OFgM2EbikOIWtrh3kC5pKl/1a2p8XLY80ab2YyZFqvFlvwKv+AV41Qei1OBl52b9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b038sWn7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYRhpLGV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0E606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E0E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b038sWn7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYRhpLGV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GmUA176698
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dwweBRTS+7n3OyBIU4sWtsH/
	4bvxJRwE5yb773mGS0s=; b=b038sWn7NaK4r2tjnxS/2y8coqng+3waNaWPSOrD
	03euLFwcwxU+s4Kf/nNa7CbAWbOUzZyyfdfoIoxl56BXuoQzx/vyAwCUkx+KDxrP
	+3JESV7nkJ8ls58Q7f+/P+ZPT7bk4EL7bheUlbb8iV6GfYEpOHFJbvMwzbFvqwev
	MelzTBnGsOOZl9LVD78AK7LlvK2QT9n6SwJRQHkBZl8gqjap6ZWWEDJSDJeX43uC
	T1LWOztfd/QX8S3X3uMtZVl8DD9tFnT7OGD4pGiOb1N0mw9H0HuZjGvORkq/Kjd0
	4JUfzC2D5m/Nf4THf0EIvrIm3Rr+BLPw2wYu/jH398hYcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehus2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:54:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5352436cd78so20504511cf.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264057; x=1793868857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
        b=jYRhpLGV5TGm4babvH/oUfoLowBkifKBKpndMoHhg5Ax0vs+yAC0fcPaefFLbJZTxj
         W+Xl/k6z881LMuuW+TAzqy9UkISIziHwUsY2mH6KdaEcCQ8UVV9HDVlZNHQqJmLi8kPL
         A7NaRh09JpPVvdudYmCeqdlb+9dGMACfpHJdtrMCtjSw9/qO3mt7YNg3XgA4ZGFUY3GT
         FIwv13iXdZ2qNH3rOVWWjzlQ/yyuONYM3kRXc7EuIKqyNnLy6+kGz/1n7fC4oa3Uwv05
         M26xRaMwMbjmfouJ2Q8pmco0AuPh98AkkHqCfra6rU/ddKdFzHdj+FWWfBu2PFTwqLIE
         zjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264057; x=1793868857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
        b=vJndfOeB6n/fB7Z8uboJM0f41KXT/l3lJCysp3na4j/jdCpt51sHNXMjuAaLBlxK5l
         yFDM1MV+auz3O9Xv5Emz1DVs0dCXbmA30nkRti/nZRcwIzu6oYOMTfbtYgzRvyUNq/Lb
         iyOCt4Xa30CM2cv+CK9GRtkXqbkN/B/3i+Xv5TB28HQYNK1Bl5FWgiTPsDt1825afeJE
         P6Meik5L/dL/0k/H/K3QYR8Cd0gXnTUM+ek0syQFYNTqmG1Z5jEPW+ZhtfkK5CvuM3KZ
         o0PBIuWY8qpapLCLKnOqc2iXnz8YNR9wfdVhuD6y26bR3jeaantL15WnFeVD8OuTzUfC
         y7Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzMxD9PM3mAEmUTKVKwLov9CU1l+urfexXf5PI7H5bSKs4RIy4rMmQtuP/lnJjqLcasEwzqRIg4uVv1@vger.kernel.org
X-Gm-Message-State: AFq9FYJebl0LSTJvSXVTqXKmi0s1bFhUk7VN5ZfO7KxwnHEyUN9bbp7r
	X3hGaiIx1jo+/WnHvv4qS6QGQSRvG9GkUg1440/SuZhRnEifu8w8tSmpSRhx95h5kUAWAX74L46
	0O8KrLLIXu+kh6mP3EfOgdXPXzr3FnW6pohMxGB/0iCJbtjl3aWwH6pLwmmohebWx
X-Gm-Gg: AYBFou1qUm7P5AluSIIQ893CKLGcDoOJTegC8RJM5+oZAZPaYmVQY0pKapoDOn74342
	HnY4fJGdVGNBT4GAz+OrZR8zfyj8SjP2TIgJ+OA9Wln7m+7Ey5Xwvo+XxgDSMSKb4n7xeA23Jgl
	zg9FXEcoG5FrS87W0ocMdO3ITPuOwKUwq+T2ucLMWUbUtyVXRkcl2RMN+iCYiJpICaJWamxNhIP
	DB6m8H+rpKAIe8+ufMjrT+2cyzFir5Byd5qoOwteKN9aNZLwB0Lln/vAU6jrOatOyVIbmoywipq
	bAm3mn42sIzQV2Kj5CvNoZwWaGp57vFBWLt7Mssejf88DLEdsdmlh8gra67U5xme3uGSdrjtuyQ
	pYIVTTC2e6Zjq5mdB95+OpuxfqbFEnEfyZ/Ev0K5CBIKUTTbWmME3m3aLPlLRTK9t
X-Received: by 2002:ac8:5cc1:0:b0:536:91b8:ab42 with SMTP id d75a77b69052e-53fccab8cd1mr79481721cf.70.1793264056777;
        Thu, 29 Oct 2026 01:54:16 -0700 (PDT)
X-Received: by 2002:ac8:5cc1:0:b0:536:91b8:ab42 with SMTP id d75a77b69052e-53fccab8cd1mr79481381cf.70.1793264056176;
        Thu, 29 Oct 2026 01:54:16 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm59555365e9.9.2026.10.29.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:54:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:54:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
Message-ID: <dnw3tdpyfi2phqm5xjswygte35rabraz2jgprapcjlgjrwgf3p@fhfaw6pvpzc2>
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3FS9aVQDcPc3JrLkTlEu_tjExTIMVkG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX8jwNBlMTlxFd
 UknqsSk1WWP1fImaDltSjCZ5TU1rroKoqGYxhIBZbTXUtdVmKuMiO+zo5T8QHF+H86+SZC9fD2S
 SBAytnyswWEdY5oC/YJ1mn91m0lUgOPPi82VSVDa5YWUWpRknRvqSHqj3LzA1Vk2FhE4MQFP01O
 J2elE/4j6BSEYLn5Ts/Gweu5+MXyx7uwSuUDgdjSuZE45/1Ez/qPysa9JehqW9zoqATEtVXr9yy
 gB/r4ZcDMRfbRu8wX8pz/nUNs5r1JhhQGbKwiglTIz9LvmcICUEsW1JbN6cxQKNasFfTbszN0Wj
 rat08tLb8CFaImBSfz7/u0jNFmjFp93PNcf4HlO+EXNYcpDk1iVn2SzdKIztvsvfjoElNE48n+T
 98cAVz/bgKJK+vfUFNmFGanhot5DuuWJhHJqklyiOPchEo8L/8p0x2iQh9dD+dlep2s5yO9tzEo
 WJM+xZXoWFxIr4qnQTg==
X-Proofpoint-GUID: 3FS9aVQDcPc3JrLkTlEu_tjExTIMVkG1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX92zo7uKthCHL
 rdr+VAyf+ajfX943AWQR7wZw04KJdjU6vy3Alt4sL55NvBckNtw9GGHHmT2vLhp+e3NYWXjDmES
 We7dvABQgeXHFfk0cjQIfjw06ZJy+7Y=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae309b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TbxCw6FMqn7yvM8lpfEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 16:42:03, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>

With fixes tag, this looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

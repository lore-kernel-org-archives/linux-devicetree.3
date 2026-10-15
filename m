Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A336B923
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055819; cv=none; b=TKINOuaEMY2xRye8BYYX0DZFNE2CfrpW9jTS+dhs9CNw0CaXhSs8FDW8wFCpdoGX57OTv3g6OvelHl82kxkWEVgwJj8gowMwZ1zWTZg+trn4o6+YriEXHwuYVJnJ2lWguSHbSSGtfJLYznizaBEY2Z8zqnT0pzzPAb2JFB0atLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055819; c=relaxed/simple;
	bh=0HBBKb/hxr/TOT1J49xGL57UFD3h22NiK3c+pzHK1CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ug6H2S83Mw3iGehBvPHi38wncBRQ9tHbLAvheYBcc+uS4EtxgY0oT5Q29PWUKiHsyq4Q4ikzCYiSVCWgNWanTCiRAXAeG5g97FMKppIxUZXp/E22tKhgFYaMOlZqf3P2yQbvmrbIMW/8QeTsSG80JYdL1snvGKjjdPo+uJah7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFD9JYoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoXYm4hU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFD9JYoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoXYm4hU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xK8f1640679
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rEV28MGRovYUyrZpyFq8tlPu9s3MeeDYME+udyPeLs=; b=hFD9JYoGNjy400aW
	2inXc+iqUbgUn4F1Kda1xJUGQfK5pBGxxrlUU7+GttiZU6aNunm6++qYVI4zaVeO
	JY8qqSEgtbes21n5oWqmMkZg+uTuGR1lHygIoqTqgdNPTNpmsaiAq4IQXbM7qis+
	VyrpREt8hsA4+R0DPO/u+JYKaz0onPvM3susmUSPQd/ij9ARmJl8HjcMlQ/vL9Dm
	Dcu0qK5Fo2FjH4b8U8S46y+XOGv5lxY372OlDDE8a4D1kh88AZ0ABhg4bvpEAaOJ
	gpiPzTegYbrBAuqBYx1l1ZOhXNMiusd7eORhLKJihr3MUfAJoZg39deQhjNw1Jkg
	2L6gNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhh92d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:16:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso91684685a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055812; x=1792660612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rEV28MGRovYUyrZpyFq8tlPu9s3MeeDYME+udyPeLs=;
        b=RoXYm4hUSBW8mHyomjYR5yh6s3wk+PeEGAglnRoUswltup0WaSg3KwmvN7US6hFf+X
         KYbAaWpxqqsxQ8UoQLPOqxWZyZSiuaAmSuje6dnfwjpdGfGfCWh/I87aUegqcTOveKwL
         zNBG4K/Vq4od0DMYNVGBXsWhhCKp6GcFbpYCPhhWRHxr2UW7Q8O4bcUFUEuLxEtdeaPU
         gdXEodkaXvsbUCSVzmggANdDUsOpDY4a3dhCFiGgZ7EM0ysjmc/8UJusfK4Flihj39Bm
         fNZ83vBSumQeldpT/WtgDfSJ5cc9TtXuKZ8yRqLMmRsPzNNiKAsfGilkTGTxO+t4qViu
         Z26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055812; x=1792660612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rEV28MGRovYUyrZpyFq8tlPu9s3MeeDYME+udyPeLs=;
        b=2lkwOBCu4ERyUjPPY0Fd9ecgEphqYFX4lGPG7gSk1BLNp4z/QuwICOiyFMdZXznUG5
         w/TQI4NI1l+3RFRzAS6WqTGKL62Hie1c1QWtPdRbnUyBl7JMJXY+uu0CTonpheL2QPVp
         h/+AALJkq3okTNVcRWrdwvIYTpCmIyy6+OHv82WAg4XHie11/tbHKRTD4hSivyn8kbTV
         Ur/j9pMYzRw32hxhwWbgPLU2sQ8PUiskcFqM3oDaaQWgRW7uSerqkQm6F5ZwdVUE1g6M
         EP19d9G3fkQZOBzmJ9psT9F4rOapVEF7I8FIPVtr4uD8qmrFZkH+B/dPDkLlbilea1Yv
         Ku+g==
X-Forwarded-Encrypted: i=1; AKwUvByLj1+Q3EqsyQa5SkKMI2hpGxRyqK4yeKfVMQtLlzOJw6VZiicoDooCENA39Nn0SPukbCNkl4Zo1r09@vger.kernel.org
X-Gm-Message-State: AFq9FYJhLLLHN5KXDc5H4RULNmq03wvt2HZIituDVpokI4WngHT9BmSd
	90tZHJq8tuNeESqlgFqSZa+w592bxUWPOOpUfQqSHVu2ozBisNEg3/52GM0v7sIxRn3qPVUmVR7
	o5I8IC79qfNkvRUep2y6H8nAFOd+dyvcFcvNK3V5dYuo433Fpt4CRR3XWr/g4rrkZ
X-Gm-Gg: AYBFou2bPRhocOorxSMND34ZiR3vGoeBwsQZ/tLYpJpX4iY8yCRXc3GhyvVGGNPbDGv
	rjuYhbArB6SGUtbX2o6GZKSNhG8IJn7MCYzJlv2VJlSh6UWeCW/1U+TaZtTR5Gfo9nu7YexCpLD
	sn1JJXnA5ciSag+BROa3IiTNQNIsPDMaChGUc1n1SaHXmZOYBWaIRwl+lOLtJ0VUFWHDbrtk2ZZ
	9PRlZXNtjotBIggpSE7uxzODaBWEcVzs3cx8a6RG2I8yPhMgCKaOFAI/VXfSwcs8pv4gofIPHtE
	VotXe8vZJNXqJqahHeq9BRVFGs4CufE/9W5hEuz5VWDPTH+mJ/ABodLeBwbf2P7lIcSPd8WJgea
	bNod/s7lVvqS81CPC/Cf1Cg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3495769385a.2.1792055811994;
        Thu, 15 Oct 2026 02:16:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3495765885a.2.1792055811430;
        Thu, 15 Oct 2026 02:16:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda13e80csm102304666b.58.2026.10.15.02.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:16:50 -0700 (PDT)
Message-ID: <1daa1740-2c91-4ea3-84a5-7f256ac0f07e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:16:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add OnePlus 8T
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX79llKG+dDAW4
 CAoASfTa9dcPxlTAGKytoG4LFqGx9E78me/xXlPyG950DnmkB7rSF4PtbQXAuzFPD8D8hKS+sra
 R8Rbq1u8qkCqejx+fzHDT3kZE9TWKXbfNuqEa6VTjAN/6dZIMHwh5Ov/RgLhHFpEOejK+WesMRS
 oTIEEKPLQf4MUbN+HoYnXJ2fb0P3Pruvao/R0Asud4c+D8fLXibUvhMbqc+iH7Zc2mMrA62fzzn
 8jPt9jiL/71AJzmvQfuWmDa9qVoUW2R3LwRRUAEQRByyq7zreBvFdiu638nfFd819BtPDmb33SP
 XhFcRZ+mqgQFS1GzWXD8HvtoWseV/QG5G1f0g1xUEm5OSlbbmdbHZVF6hmz+/h333jFm5yKYdcX
 SIGuD+9fNnpY2QPyKcMKc3lVhvy4gpR8ovfyUfUPyupZ4Fvjn9I6lSoE8b1fCVrqonYcYYtKh7h
 RrsrCno9d5SU5LuXnrg==
X-Proofpoint-GUID: v-sGqgUC6V92dEt6liEU7BgmCj3aTtZc
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad09a0a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WE8o4AYwAAAA:8 a=ckyZQS8oqhpWkIopcVwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX8reqhOVZFipV
 1pP5YSsXxz7FqdBF5BBLwmjeUS9qDEFfMmgbJ1Iwz1mOdVKYzlwGSr6Z/Hdjtp7tWY8UQh9m0xD
 qedn7zMRE3XMNuNAJYXMnLYuEftMIxE=
X-Proofpoint-ORIG-GUID: v-sGqgUC6V92dEt6liEU7BgmCj3aTtZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:57 AM, Frieder Hannenheim wrote:
> Adds a basic device tree for the OnePlus 8T (kebab). Common
> values for OnePlus devices using the sm8250 SOC are defined in
> sm8250-oneplus-common.
> 
> This basic device tree brings up a framebuffer, UFS, battery monitoring,
> volume keys and UART. Further functionality will be brought up in
> subsequent patch sets.
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---
> Frieder Hannenheim (2):
>       arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
>       arm64: dts: qcom: oneplus-kebab: new device
> 
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 618 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 124 +++++

Hello, thanks for your patches. For DT additions, you also need to
add dt-bindings for your board and validate the resulting DTBs,
e.g. via:

make [...] CHECK_DTBS=1 qcom/sm8250-foo-bar.dtb

Konrad

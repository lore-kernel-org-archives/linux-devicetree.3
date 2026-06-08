Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218832D0D4
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907034; cv=none; b=SSPbZBFpcoHaWPR+YWVIEMQmRAfQN+F4XXQyMyLRY3dL6VUYoShhcnooEQx9CsWjlzK2FWpjymOZM4AcA2fcYvsIKdrvgblnJvToy5pt4mLphx//ur8XbHfct66cgutwWWXpr7kGCyX92eqY9siIzpT6p1RiKAMEMj6/Ow9VWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907034; c=relaxed/simple;
	bh=xCS/sMMivgXC5mwRXTDN44lODP1gadE8iSt7cUsbOyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQI5U7rUxUCnSH4bEJd9DqCn2fS0gIfrlnWJcX6dpUqzMdoxHc5c2aNbyD6BvXBNQ8d4U80RVmYbYi9KUKOGTDMthK+FEEdQDbFm52/+n0UE6Ck+J1ZI3TpUVitXgelca65Zqn6TkHSApgTAGaHTtN8RuzJsmAUGDWS589c3dyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuBA0Zxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtDF2tQX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuBA0Zxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtDF2tQX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OlIX2801762
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 08:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lQ4E93ZSohECX6PMGG4MtXMe2iUMpkyysStQXJYr8Q=; b=fuBA0ZxyKmUs1VX4
	6OaL1b2K447HWqeTnA2PNuSe8YgTD9vlw/3OojWh+njfaWz9rMuNCImtuvmv87JS
	VyZI48xDGpFgpy15HF7vVOhJeA+BpH3UtZDRMqh8gekl5qgTvavz/o5/8TuW6xjR
	CSP0X6tuuWQh57+aQblZhlr9pDzcePn4utWPZb0PznIi4UsVkvlbTGjdFNmY8bAX
	ToyTapW5aBzXj1uEeH6DP2rUe+eLS8q4btjpCjGZuvdV3jPhJEbGvW9ek/wx9Q+u
	gpU1R2ucZeJ818dy1D9D9MyKGZl8cFIkEyxhTDrgOIArJy8xT8Wf1Y51uBnXk6fC
	Hqvbqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3q60k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 08:23:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso5080093a91.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907032; x=1781511832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lQ4E93ZSohECX6PMGG4MtXMe2iUMpkyysStQXJYr8Q=;
        b=UtDF2tQXPTX9JTM2a8WVx+QFM9FRSy+wnF2TnCqCefd+vjXpx5AhRk61NR+vcvyOr0
         EI6VnwfyFSYoRDcvbeS9w4Ukr6vX5vo/mGrXb3e5j1WXrPnLSl1t+zdTxVEYZV/ghQbb
         hy3vjagAvM/fAwv6iWR690OTj1cfU0Yj2ozrgPldx9CHzP5j88wjveQ5Acefe6pXfC8d
         76EmEMmk8qnGLtSL6+V3SWjUBcIudo8LKjVPAl8+3D08S1GVReub/t8TBsRZ8PsB7n/s
         kRMtxe5kG5jWdySGP3vB6DSmVATzYL6/tXlWVxVvsrX1kZLb/XFzIkqCxzDZ1j+Vu4Pu
         O6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907032; x=1781511832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lQ4E93ZSohECX6PMGG4MtXMe2iUMpkyysStQXJYr8Q=;
        b=ojSqWetd0XOkVT6k/Pe8uki93vmXOifTQZ0f1aDNRBlHv6td9k6v+j6nQSOtooavdE
         odUGq+4EvD1da7MtKzoft7Bj/DxKSm3jWvI2seFSeQymBFLNQSt1aEpktyx9JIxhgF+S
         N0WH0UYLUhDK2eCsxkB2CRL8+lfLAfjuq6Y5TdELFjQAQawlxRakamHzLzBzm/28iHCM
         Ez4mKaod670NtDFykpqm+alPTIpEa1wZd+oem/uZoZs9kUWlGckWCVFO4shpNKPX2hnf
         VNsbbK8Y9Fswthx6Ji+1762k44zZSoDATwNi3ddfoTXnmqMjUJr+jzHWv+RFyMiJ42Bn
         zLfw==
X-Forwarded-Encrypted: i=1; AFNElJ+nj2dERGaYCXt3x+rQnVFZ3vsiCk27/Ov+G6pROSyxFHvpTaQkB6VqdJkZ6nHdfF+OUt4FGOIcVYOH@vger.kernel.org
X-Gm-Message-State: AOJu0YzhdHQPaLo1RhLXMEbpsWbShuPFrE7LPozw5hIDM9ghEqH3fglv
	azytJhae3Kbst44v9ZKvafKKG3RjSBUT1TOg3gO1IWULM79mkfcH8wj3NhFE/aB2gdytalGC3M3
	zh2XEmYi/TNS8x6t30lJW9UDRdUp7U0IKzJbrQ0R46horeEC20B1O2JB3rmeSF54NxHBxNptk
X-Gm-Gg: Acq92OHDaZ9Opc5RSJgflXlIoOL9SQ2dRYzTagGhrxb71dAef0ri+0dtAl5FZiej1y6
	cDA8B4rRX0bNiaNoLI4+PqUOFgHOsDBrOfKU89TdWOPQ8fX/ti+bA3X6zFyPBCNfrxR0VpsIG5F
	WB758h8RQY4QEbiK5ShizKd/jbrhk4OH+RUlF9FqfRWMAzed2kMBXltf1aNTW4U2quz9PvMcBsz
	ZRhsyAnjPY/ZAjo8QpiJNyXZnMMHwOc8V1ziWF0xgc5DOPBAnz8mFVumuTBsYLhodytlEjS4omF
	HO0+cQoBpIlxLbWbAvge6ZI6lD3LMnovfzOe9mQTuwxNvhM6BbYdUShBe1kSFrTd5sgSMDgQUIq
	wg0B6Aj1hXl3N/dmsnV1Lg8acW0z6/xSNf9hFoSu7sI8kX8wWoOFMfXdXm1SaVOhZ+Q==
X-Received: by 2002:a17:90b:2742:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-370eeb1bec5mr15699156a91.1.1780907031818;
        Mon, 08 Jun 2026 01:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2742:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-370eeb1bec5mr15699133a91.1.1780907031357;
        Mon, 08 Jun 2026 01:23:51 -0700 (PDT)
Received: from [10.217.198.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm15849306a91.13.2026.06.08.01.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:23:50 -0700 (PDT)
Message-ID: <41cd662a-31ff-470b-9e77-af5655f210c4@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:53:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Remove the
 little/big_cpu_sleep_0 idle states
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
 <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
 <qlraiygk7tcq5xvdxwp5ijfffhmn4akza237lij4xf65fmc3dj@33yozanoe4rk>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <qlraiygk7tcq5xvdxwp5ijfffhmn4akza237lij4xf65fmc3dj@33yozanoe4rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NyBTYWx0ZWRfX7tbD5w6yESsz
 IqXHh7d/YricCxFIK0oIgwN6mzxYzZZeWJ6wC/Rybmf5G8QFzOBhSj5PkYl1WqH24R2DOyh7wm7
 MIiIape/mKDpwzESzLBOK6dbp1JiKyPVPNcodb8YPJT6yxUhUt/q9eSq+M6aO9KWvv7Zx/cMXMg
 xNAnPIhRxmKwYVv3CzDoQ8+whcDLcT3tiC5whk7fjLOT1jGEY93O7lGKhGqM1/MFwsFEn78PLqH
 6LwDsQFt47flk0bZWjqj3cVYLPq2uxkBzWWEt83kTgeclDeurTfyg5eSq36wB6jeyAsjIPwJcVi
 uQeggO5ljjV2fkuZDUVPjBP2P69GfbOqmhjNTGL8rfsZA5WYyFkZ3yBC4gI1D1rWEZtG6KPaFCi
 3LpS3If0A/N25/rrRUREpZoTHUs4u7ig+KJ6HcdbZfEA8DrVyrdD96CrPsLWGN7dOaPjTdQahga
 ehjuhCVw183dwlk6tgw==
X-Proofpoint-ORIG-GUID: AMIS7p9r7wW1Z03svWTMvPOOBTfCJqNe
X-Proofpoint-GUID: AMIS7p9r7wW1Z03svWTMvPOOBTfCJqNe
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a267c18 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=A8xlVPZPMDKzmvWz11YA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080077



On 6/8/2026 12:54 AM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 04:40:13PM +0530, Navya Malempati wrote:
>> Firmware supports both CPU power collapse (little/big_cpu_sleep_0) and
>> CPU PLL/rail power collapse (little/big_cpu_sleep_1) idle states.
>> However, CPU power collapse modes are often not utilized in favor of
>> performance, so remove the CPU power collapse modes for monaco,
> 
> They are not used now. Will they be used if the cpuidle governor is
> changed? If they are valid from the hardware point of view, why do you
> want to remove them?
> 

Even though they are valid from hardware and can be used, they do not 
seem to be benefiting power/performance, hence removing them. This is 
irrespective of cpuidle governor menu/teo making use of them.

Thanks,
Navya

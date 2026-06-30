Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D09410D26
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824246; cv=none; b=byBk1WuLwkIcsVAe7MG7s4Cpibesa8kds0/vsk2IsHgdI+vSIhhwzdgw67HMWnsvkhVzdWM4sCdwVJEv9QeqOV/tca7W0FnSCFhIIONQZpGK2YSJ7vrkxBrEcH5i6wVyqpyDCVRTcsgPCCBqmWQPW33pHlkOdceE0N1MosuJUWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824246; c=relaxed/simple;
	bh=pnI7R/xMMC8JZIFxsJK7PSD3LbRqlyz8dhLEqn7HV3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpLeo5aNhjpW+2rwYikffYmjdKEBloMheroBThOZNZiSdZR13p3Ne2YRcn75J1HHB/gWwwNO9TxOz1S3UzSXDCxg4AjaKx+L3rA4zlumcMtBAZjtqpxs720V6BmuxowAJjHSU9Gap1Cw8z6z7XdGM266kcVidTqHQe9XxCYM2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSUaqot4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4lyBcqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSUaqot4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4lyBcqP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mup51604818
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=; b=CSUaqot4rG1+Qoag
	7JeUKJQkjG7CPWAKZWG1C9Z94uUK7BnJspSqdX86AAseWfYyfguPZmTeDzRPDf/f
	QiqjtkGUp/SegO06vuybmvUgLLOcQ5Bhb7xo7Ztx6Yt9FsN05nXMqCzoK9KRH7qa
	W2z4m+LNWg95lLzHlnKvPQSzF/FU2EpJUOGGpH0OlUYA7UP/y0R3TrUxSTCXFMjc
	N8reu2WPv9hd9QIms9NUcQJg4+A2/XGyYAKR+2xlR/MOMCeI3yUU38kuAiAVcF7C
	LZ/R9t+LP25C9VrCsRfiVG4a6jwTfzgpsMpoC71HNNnJYRaVexHGYnhHbiw9pOQ3
	+uQprg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjrbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:57:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd94ea83c6so105747e0c.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824244; x=1783429044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=;
        b=g4lyBcqPXkHuLVrkMUrh3X1wytvjtp4mloUk/kJ8Ni2J7bLk+J48e6ywuDyE0dsb6b
         woj7tvc1xLUb6g+YEtHbT3vRfbAyGlIFTyXPsi1ZpSUmWZQDtUb5MsbzzMJ1E4BSURlh
         mBMh7q4Wj0QlBG7R9j+YrngEva6DWXCbstx35LeVgPbt4ZItS/IjklynsjykgyGHqbJO
         Pil0RWLXO248JQy7/5qzqOs5eBqcgPooYH/0qJag1UNU8fuOP/TMN3Mrq5d/OIQ0THKZ
         rmCVNNZB7dm5yrIAQ71RXbjRDXEcyhpQsDI20Q/5LLQA/T06NcJP7+khF6VXVFczoEXs
         vYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824244; x=1783429044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=;
        b=KNNgZWhwWZ4UivQ65VPAcMeDycWPSoXPkHzyn/MCZGLvX0p/1OXUzFYZVssHyAC58Y
         BQXBxc7Pxi/nA+bwLI+3hg4sepzXiY41QodB+TE4zTkbsl2sALYa0781TmrjxOGCx2Ir
         kwQrFyDQ6XuF23yUBpYi7U/OkWJIJqgexkjMCVv8sj6EVmIJOAZ1UV8NpGKHf8yiHVtx
         hCJP17FoDpGSmlYR/W90KUmZCYuduWD7zSoSd+vf+g2+5mg9z331ksfPKXroMezeUIHT
         9lGjo42CzkYxpdGyAj4FSEqBZBG/tj0lSL845YUgdzogBw4QJdTZOmZU1ux5+OluyYdS
         wYfA==
X-Forwarded-Encrypted: i=1; AHgh+RqawM+5tVk3l0i1aGhH+89wtgk9CWWzmsZWxZuPTo0ZJrOh3He5ODihUrqXlsn1r9uOFVONqlqBILvu@vger.kernel.org
X-Gm-Message-State: AOJu0YzlxFhj1w3DvOu/qZCF77+V9W97wq0Fm7Avi8GX1sIWNK0Sj4aa
	7uCaWKLkZAoseOQdjCAZSrkbWnwbxWt7SVGSV86Pfz4gSJPr2nb3f2asA9r4Il9u4HGNbCKC+1W
	GjB0BR1axBaSz5+Zp3WxRk1UD3M9rpi0yrFpoxZgyQHtClq8K/Tb9UoZBNuoYAaVx
X-Gm-Gg: AfdE7clb8E9XVzKhsfmMmkprBSgc9D27X3hMilkxzTXKSCn5SvITrOJrkPiNjF/VR/F
	m8dVwEuThj4L4k93Rs+jaWBVbAu28XgSMS+5d33G2Op9sMIgAJ7W1KjOC0tAwEiuQUfw6imgUxo
	mYU/mvjgDfvE3LyRw3uLyAEY6O5n1VpkIFQUZ3OI45IJIEKS6uocqmMGVpcU8ZPKGipspA3f2HJ
	7B0UYjwewWKiDrCIonsR3abpPkyJ9vvicCmM78KIJAuyj7l4roFmNVsrVnP3F/aBZ/00WgA/2f5
	0GJDZYx9ph+PXncOrmi70GfXIbU3oD7fE+DLySPqJETRMLlDWTkAwOQo6ZfJHiepKjX1A4OaYEr
	55//4iB3p3DywmIAg4Gzo9HvFr/RtIymb43Y=
X-Received: by 2002:ac5:c814:0:b0:5bd:9b95:d637 with SMTP id 71dfb90a1353d-5bdbedcf783mr411341e0c.3.1782824243748;
        Tue, 30 Jun 2026 05:57:23 -0700 (PDT)
X-Received: by 2002:ac5:c814:0:b0:5bd:9b95:d637 with SMTP id 71dfb90a1353d-5bdbedcf783mr411329e0c.3.1782824243293;
        Tue, 30 Jun 2026 05:57:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3ec9sm1170596a12.1.2026.06.30.05.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:57:22 -0700 (PDT)
Message-ID: <bb33d83a-58d2-4156-a7f2-96ab1a7ccd55@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:57:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] arm64: dts: qcom: agatti: Assigned clock rate
 for CAMSS AXI
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
 <ae5d0817-5187-41df-89c5-0acded391fb4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ae5d0817-5187-41df-89c5-0acded391fb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0kpmw8A69CkFBq0lUJhJfZTzCibiBK6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX6cy2mONC5z4L
 AOrlGYrkc4CvWazCGCW63YVXTZ0l5lx0AdpSA2oFU2lReg4t12L9HRVMLsIPhdji+a2vma21fPQ
 tZOfW+jLGwAJWyJhWHY/FfxN8gyogzGYFESDb0+GbjzmrW1IyfrmQi7CyLkcSxWMu9PIcYAzFXl
 anMuX9WIfQ3ioidFX8+2omeWjaxgHbVjLnYj/WxS7fGZJHNT7Tp+YC6rpOvl1TT+6JYConBWQTq
 7acU3vgI8MbPw5xFHHr1iulPN+x2P3yg9BnmESofUD5+7I7MKdz1fuh0tGycIp/qFFnoSzFolRw
 tKZDB3whglKI661ssm01GqDzkE6MlcowrulKiuRqEk+WI6rG1EaRLVQ2h7kVTAcJCDVQgS9lc8z
 mzQnSYduv5/uD4PK43NbR2ZgJpwmP4gti/yJaZWcBf/xm8nN1OdQ+Tx3eggNPZ6nIfyBawqGOEq
 5Sq2qSUJsrEm/yN5vIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXxFeh+wI9QOqs
 /kW3mWfz4gnOoQsuqDcfu09YVItBv3k6k/9Bww7Yk1U/rjPIDtqf6FXxyg8KTvD99zQdmf++Kp5
 n0e5gHPsWEqQ2hrNiwelgYH3ceLxX3Y=
X-Proofpoint-GUID: 0kpmw8A69CkFBq0lUJhJfZTzCibiBK6u
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43bd34 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=jiSQzDTAzoC-fvH6LVUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300120

On 6/30/26 2:56 PM, Konrad Dybcio wrote:
> On 5/8/26 12:49 AM, Loic Poulain wrote:
>> On Agatti, the CAMSS AXI clock is not managed by the interconnect
>> and defaults to its lowest rate (19.2 MHz), which is insufficient
>> and leads to throttling of CAMSS-related traffic.
>>
>> Set the CAMSS AXI clock to a suitable operating point by assigning
>> it to its nominal frequency (300 MHz) as defined by the specification.
>> This ensures correct and stable operation while leaving room for
>> future dynamic scaling support in the driver.
> 
> Now that I think about it, since the clock is already consumed by
> the driver, can we just put a set_rate in there?
> 
> This will avoid introducing a point in time where the DT has a
> suboptimal (power-wise) floor mandated regardless of what the driver
> does

What I just said does not quite match reality

The ultimate solution is going to involve some aggregation and then
a set_rate. We can just hardcode the set_rate today instead, I think

Konrad

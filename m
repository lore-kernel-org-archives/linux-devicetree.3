Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED928407583
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611116; cv=none; b=lNwwT1GPzpSgOleziH8E8UqMH6Y+DaX1eLSKH375J4bT9zLhARkPRxfcc61X3WQs75lW+ENouk10z5uwdCI/prc6pM0p/tdGrEVEWiO1ZpA+wo25TV2FF6oUBid20a2F6IF6sphgaAUkH0xuFDj2DkiUJgtgB41QR4isEeRDWzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611116; c=relaxed/simple;
	bh=1ehDfQJBh0FS9IAclGtzErnOur6nf/KYHvnI6lTssXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6/9wC1GSqKBdi3ZRUWo7gkQ1Sp838HU7ZSfWsXmOiWya2Rt+6MASqwbOFw7S7ybTkAUcDOwFPPxxxuKKV4iM4oI1LJCH1rNmuqFBISLiFmFPjE363eeWpb/50RakIasY8BEoQ7uyU6PhH++n3hUMSFo9SqjnLZAZjvSPeEbiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SehCyFsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYPDPAFf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SehCyFsV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYPDPAFf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw4NT1970740
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 15:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVI01ZrLuwrtc4F+2tgqOhoc+wCEuLJiM7EUlhKpy5E=; b=SehCyFsVIdLx3JSV
	nkvpnEud9xfKUQ1o4juo5u3APxObdxSXOBevSWq0cq9mYKfk6o3jecUULm9z28hW
	MIFQVuzsn4w2zXCjb9RQefcW1mtKpO03EjQVRyYQA1mAPGQudraShZgpuR6GJJ6v
	47OnmqsVKHd90S6axqKxAjVA7mNrdwtmN1XZ3zzNbnj9dj2hllTp/BAuIMhlCTy3
	kT4TmIe/+bzbjgDdAt3hsjWqSixYHTf0sj6S0s6nFD7ZHvZ0LHr6cerq8cJUS+y7
	ife9DcvDiNiXpZcL/r/uljhqa6nWl8dOmEH59t3fC5URrtty1S9t7OjRLG/hmwNC
	Zcsb/A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpghkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 15:31:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737ddaf8c57so36683137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783611112; x=1784215912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVI01ZrLuwrtc4F+2tgqOhoc+wCEuLJiM7EUlhKpy5E=;
        b=TYPDPAFfLMsb3UDi8s2BnZ0ZZtr/QOtVGlI0tk90cUvbkJkO6ZI1lvjZv8rmEVtKyJ
         1B+iHkKo9J9Oc2VW9M9l0RHrmCJePdn6ge0seZg9ln9XiA38OTy1wFFcfrn83PF5vzw5
         gSnMv4Higd/Pc8/u5Jp/dNZq8T3nBp5yKrts3ZL7KyV4Y1DgAxDLKa9jXpQk6RL7D00M
         fS2vKFgnr4OEOF6Act8i2NZ0X8oMWk3K3Ix6fqpDbWNanVHtDohfqctHDY3jIoDW90Ki
         v3haUXVp6eRxdJGMgvSkoTRvtJuysmZzpF6+7yEzAP4OaAas38hHNySlT/7fqDWjuPl+
         A3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611112; x=1784215912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVI01ZrLuwrtc4F+2tgqOhoc+wCEuLJiM7EUlhKpy5E=;
        b=pN9Wc9csEQnnwr5iRtakiESsj0wVmvmb4oZUbMX1mKhTThkiYt1IMPZxGYY0Vsfri3
         OdriM5n9Yaeau8lBEhbSWwPSeKaohZwDriKpffoICgkE7JKnQT1iWLPUrSZTk4wOdge8
         RxluIeFYE0jA7hwN7+QrNFRqpeyCTrb0UPdzBxHsIMOL8Qk4dUE1psYj2FyWIXhlra1j
         YD9MMY5ohb6d9Fa0t3yqphDv/tHMbfJi3L7iy4ap2ZzJNCCY6RlyBGJnb+PJXMKEa4GW
         wGwoqdxjgYow6QXGVlAnJg4hprQ1zXZW9iUewV/OK2BLRHnp+gegJb0A32/MyCa+3cZP
         LFAg==
X-Forwarded-Encrypted: i=1; AHgh+RoBxACKekc4MfgZ+FYDoSb/oZR9oJjht0f0kGRATCPWh6bwCGUCiFdThH7nlDoVMtMlPvXPvVtKywYT@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQ7Ao+RH59l0+7BUP4/ZxsBjfGvWdXhUzBgogjYvBB7we2If2
	RlTq8teKUyHMHFAhCIw/RMLyhIR+XAuyojD+9OxfYQbjNAP3kwIPxrzCzyh/LiGpb5TpX0iVrri
	2I3ueWhbgW2Dklncr1SoqvZxH0AZcAnns1e3FP74vBZtQzJq66lJ1guRt8SHmR6zp
X-Gm-Gg: AfdE7ckhVooLa1EgXtZRjLsxZhs4TwXhCBkQQ6YC1eH6VcGhdEZ+NEBhlouDPG6licI
	y8N5XGsGu0+3yv/ZCZDjNgwetyLXleJ3BYVXh2FwN2L+03Uiwr9qR0wWZ8r0TMNPWgV7h6vYzhH
	pS/u69l/3aHnurNq16G9AnuizRas8MwYn++IPE5A+Lfn8rUpy3VA4eDLr0Dkp8s2d37LYco0CVv
	o5E2kJuUQGS9BxB0COMlSfKqHYOoTlztXM/Ut/RquzzPrBfahAbxvZmWOeuHxZGy9B/IAO0Ti/H
	Kx9F1dWD53peBnE3R8LWIvCpmg2Nm6N1IXtsX30LnpV4lWucIqfNcvA+edP5wQkHggnIfk+t/eb
	TJpsWT3ybTDcyHuPMu0Hq0WqxQGrBrZqWYnM=
X-Received: by 2002:a05:6102:8017:b0:631:267d:157b with SMTP id ada2fe7eead31-744f0b10493mr1234362137.5.1783611111522;
        Thu, 09 Jul 2026 08:31:51 -0700 (PDT)
X-Received: by 2002:a05:6102:8017:b0:631:267d:157b with SMTP id ada2fe7eead31-744f0b10493mr1234326137.5.1783611111076;
        Thu, 09 Jul 2026 08:31:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa805105bsm3783376a12.21.2026.07.09.08.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:31:49 -0700 (PDT)
Message-ID: <5bb37e44-060e-4b49-8bf8-1d5393f86a39@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 17:31:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
 <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
 <tm4tyrsmzhbirfgywc5dpqzea5t5emnmyamp6l626mfaxtejsp@slgppnnsj464>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tm4tyrsmzhbirfgywc5dpqzea5t5emnmyamp6l626mfaxtejsp@slgppnnsj464>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfXw+BCmzUZX4ui
 0kL5X3Sat0Qay17GIWVzQeFxMLuFolF/PMrtAlj7vXfSBZLnk/p97qZvTj2YHVPwMBZsaelMcpE
 dSGqbbl/KdK9B5PDjQP782Ns0ll/H9BOedBknuiY12la1H8uY2BKNOs0o7GrBWFFDEkbpinYXqY
 xhKtDsAbB4MPGadxvBAVK//3Ly+NV+47erJMJij7OEayawpLOnxxr5DxEhuk8Km9yQhi7OgVbZe
 ltxHAhYpNHEc2RRy9BYjXWmv+sGXD6t41gVB4B4A1oSomaBvjmdvYSDVqEZYmdyCDqeuVXG3VDZ
 r/XDTvpifDEvHTZ4Mi0paI+nBSTfO0KMlwTShCi1BW7I83Her3+yLODilv4v3HqsS5edi8e+cgA
 kEaMs64KEe5Ki8+a1gl3pAh4srgCw4GVC9fjeEvk4qLuyam1N8kAC8p1cCaq5Or+3tCS6XTGAoi
 QQihV6a2uPg0nmef8XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX3GrcTNP+j1bt
 t2Dcakjdv5MTezkFTQ8ifKEC3w9DydCx4nGSPnEKhoTdSeA55oLFQ+v38Pl8mcANVDgGoA7gTt4
 vmQxEBkIX18KEfbr4Er8DI8UPrrCXNA=
X-Proofpoint-GUID: BRiMZkjPzlSpOonBymNOB-Vl7mTnHXKI
X-Proofpoint-ORIG-GUID: BRiMZkjPzlSpOonBymNOB-Vl7mTnHXKI
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fbee8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-LomneP8efBk18w0HY8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090152

On 7/9/26 4:07 PM, Abel Vesa wrote:
> On 26-07-09 15:08:09, Konrad Dybcio wrote:
>> On 7/9/26 11:12 AM, Abel Vesa wrote:
>>> Since each serial engine will be enabled as needed in each board dts,
>>> there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
>>>
>>> So enable it by default. This is also now in line with the other SoCs, and
>>> also with the second QUPv3 wrapper.
>>>
>>> Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> Go ahead and enable both QUP wrappers and both DMA controllers,
>> a subset of both is assigned to HLOS by default by the tz config
> 
> But the other QUP and both DMA controllers are already enabled by
> default.

OK good, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


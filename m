Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F91CBA45
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711328; cv=none; b=fhFKZanTOTTh43ponazZVRKSoGiXexX5kN3/FHylF57u8xzeqKTEcXM9KyxmsLQCdRUhoB9pkzfB/JY9jO7fTMBfCTuF0j4B657R1M/BKXeIERrB0Uow0EPjknt664S4vcwcXGtj1lE9rtYHSwRry443ucq/9P3m9MltYUD0e+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711328; c=relaxed/simple;
	bh=PxaZIWbiRfKq/pjVX+fFLjPVwm6NqZ+lpXwCPgCITwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGeXTCh/SnusccOS9vsXD6MaQIz8QOs2pCIh4T69r8QVecYk0de9sWXw3LEdJ7avE7FKh7KH3FJcUJVnkmIlfrWEJJX3yM48NXuZdBJt4NCnGf6+S5OrjKJifOnZlwLTpjr3Imv0MYBRBMvYaR0jnv2Vkc6dRHdSwIIxk1BsoNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNmSRr8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXRDL7VU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNmSRr8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXRDL7VU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NUOw1738486
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=; b=KNmSRr8jY3dvNKh3
	QchGfbWF8eYecE1ett6kxRFC87AZgyrSSM7IKlUNLDzVGdIAkeqhHwl6zq4V6qEb
	X/EdM1i0wfE1vLdNlBfnYS8RcRUMradtuhGiFZjhOvCwsa+gMQHuXqMfBmMaC0w+
	aBhbq2m1OpWhe4Gu0X6iLRNMgZpAqrUMDYllsDm8zsO61QCUlnZ4R/ly+iBO+lmG
	DFZJlbExf0Yd0fd69hT1syZEd/pA6Oxl3Nc4isJXKQx7FVcY7dloHvhMAIN4ji4b
	EAJH0rJonnIuuSHUrpwZ1b7L9Xr6pwZdLl/DkCtAliDYfvOhGrJdPj4yUdh17gC1
	Ig51aw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmjjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:35:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2117330a91.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711323; x=1783316123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=;
        b=MXRDL7VUn0zW2sXv/IWJCmmDIhhwZcHReVoJVm5bALWcvv3JvS3gK9BtPg0BsVq/9G
         CGwEV8QFuXfKL/EKglTR5wo5JJdgFh/CX9aK6CqawHYrZ8QYOEIKoKJ5GnSqGMa/v+mh
         0PPQnUeuRPGsagLhfYu8iUh3xd3HPrleSjkj0zjCnu99x4bSQOVw85vcMiwu5er/sMGl
         cbYnFDuDQM+uFSbKfMjzKQ067TPrnKFxwwussjy3e9uMglLcrCDt41LQZV9kLHESWxwd
         i486rWgdBoqiBUBX59uzOoRk60s5z7gAs67ngNh1tMR8v8lCTB+QroClJtEB+ESKSc/V
         gGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711323; x=1783316123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=;
        b=VgQGcD1FXbzbeuZHrgPy26aYO/0pcslpyV97dd7INQdgsuc9/7bgg6Lu8QH63N6BXZ
         IZS51oTBDyIWq6KnQ08HTCm27wkxohLYxwZhIr80SktjR09GZchSAVKc671G4VDEj3dZ
         s8P1WBndlzooX8OhhHs0QNGovstl4lkZec+wpH0NRgW1lSBK57HdkL5Y0YVA0a2KfbI9
         F6G3wm9T+bfhRZWimH78mYE0/DDT9nco8MZ18Dljo6r3yrgDZHLsH1skXoLlB4M+sqj+
         2uK5CMExl+OO2tLi4heF4A+U6x12YiLPnYtVHnakIw6hlaRQNCkzKnU9P9RMls8HKMUD
         oWKA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr8xKMC2Ns76DmgRUnDizpWXQEdNrc66zuvIEzcmTIx1Rk7K02W/C0muZIfG/EUPXmkzBda96iHNeV@vger.kernel.org
X-Gm-Message-State: AOJu0YzIuyFUkSdyTA7k7VBB+iCbvwMEJJYuH0MGMd/6+0vZ4NyN7g5e
	9rzgVC9Lo7jG/VLLnw6SOzDG9B2AE9ot6atVn92PNe2P/XfLjIpXjzFHAoKDQ//Fuwu8CRx2+8q
	XgJfUnXN/nwoq8C4fhUYAo8mFSAswvllQdtXtEgdkEePtIiZsUM8q9adeOJLHTybE
X-Gm-Gg: AfdE7cnI6sjzFsC80E05AfWQ1KvauZkC6trlVxCM8AR1yV/jNzGd4El1Vp0Aqfitx+3
	inZn2rwrmlx5IbFDmY2eVDT+Q8zGbdPvFzDhpcDc47vBdXbIMJAaHIF5yH7uahBq4Bhx6P2vKjU
	Cg+MpwpeYBYc9jt9C2NyqU9OGQAiMBft2w6WXltvxttcypR+2z8bE5P0v0cNVzABdIieqq3MvvT
	fWuqJNyaXyhLeeK8tp+8KB8J1SdR1xzWEmdDPkwjlcsX3Bw9lklkdDNJCCfaLLP6wdQ3Jd+LSAY
	OjZBRm68XiV0CKElWvbYJ8TqlOmojAMCciVhC/nFa7UNRlOHP8BCd3GTpEt9zyxqsIqyvuIjeJc
	TwIJuYiZ9CJJrSlfs7E5/zpLLEe0nEBiH7ZYW873I6EH5UJtlnA==
X-Received: by 2002:a17:90b:514f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-37fbfa21cfemr5617336a91.8.1782711322913;
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
X-Received: by 2002:a17:90b:514f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-37fbfa21cfemr5617321a91.8.1782711322477;
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9d8bf1f07sm25282945ad.69.2026.06.28.22.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
Message-ID: <159fe00a-f259-400c-b1e9-7963330bf9f3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:05:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: defconfig: Enable Qualcomm QAIF and
 WSA885X-I2C drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260622-analytic-pigeon-of-force-bd53c6@quoll>
 <ebb1c3c7-87ff-4683-bcbd-c088226fc74b@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ebb1c3c7-87ff-4683-bcbd-c088226fc74b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a42041b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1-yt-TcySLUHAD0pDGUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX8cOTaHlHt3lT
 qTaU26Dv+CwJLZR/JuIF22niUHhHobIZqv7fLTAQDCPAIutQtBZ1LuAJf+xobOq7fMuwY8TK/+N
 x12cdipl07cJLhiRpYoeStISPhg7O4c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX6vle9NsDcpiW
 5V5lLPBOm97o5JU7+9IOL8UMipZSuueXNcbyqLomAt/ZT9+aOMnXUbjSz0zuitOt4D9ZGZcStWS
 w1gaZEaL5ITgchoZ0y6sL/jfkRn/LTSaS1/J7+yD4IRnG4oM7c44mxyia/vTRf9xZajvTQ8a/kn
 ZS752hqkJZZxUmd4FxCj0yGkWwyY+3mjCvQAUaQgmm5XNi+FG+vZLlk10XSnss/rN51k35kA+vN
 VhYWSl3BMnOdRZoY9VuTUdhF0dKzBRN3E/Faqh0VIlZfYo4fFROTTQOiX7IVOp3QWh4oa7sKY0E
 DPBe8de3b5a85oNQzgmidyOQpulip70Ntf1djcTX7TxvCHl02YcL1i5AojUKv9qS5MnRcUh70xM
 exAlEmr/LuDoNwactcraqn4aimgNwi/7xgCUqPFD6RVtClKSsMTtVWaYdg7m2HTBCEC7b+GIEV2
 LbeRyRtQfQtSpB7kkqg==
X-Proofpoint-GUID: Dz6nw0-PR29McO0ETenZOSsBYrUme8FZ
X-Proofpoint-ORIG-GUID: Dz6nw0-PR29McO0ETenZOSsBYrUme8FZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045



On 6/22/2026 6:49 PM, Krzysztof Kozlowski wrote:
> On 22/06/2026 15:18, Krzysztof Kozlowski wrote:
>> On Wed, Jun 17, 2026 at 01:43:15AM +0530, Mohammad Rafi Shaik wrote:
>>> Enable the QAIF CPU DAI and WSA885X I2C codec as modules in
>>> arm64 defconfig.
>>>
>>> These options are required to exercise the Shikra EVK
>>
>> Qualcomm Shikra EVK, but anyway the problem is that:
>> 	git grep -i "Shikra EVK"
>> gives me zero results.
>>
>> I already commented about this for some other patches.
>>
> 
> And SND_SOC_WSA885X_I2C also does not exist in next-20260619.
> 

ACK,

Thanks for the feedback,

will wait till WSA885X driver got Approved.

Best Regards,
Rafi.

> Best regards,
> Krzysztof


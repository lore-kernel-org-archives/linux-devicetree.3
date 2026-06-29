Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29163B7765
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727083; cv=none; b=Cucn3DfSSI7Yrbn/uXFDNMr8N8WMnGHS4GI8OWWkbhww1aga5GiJBZUkT+iwzFeEbBMd3doExZCFu3aSqy5V5UtZKZjPEmBteWHwvagTptSgpcfToYoY2iARbkZ5thhlVcVc75SSKX2HAlodpAZjADrFS8i0+s300+fVN3XUEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727083; c=relaxed/simple;
	bh=UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5Sdnv20kt8+/9hmcPwOD6lznBMz/IJ8xxYXYYTshlTVg1d8G1kQRaMk2Hzk1byQgoURbJttSlCrMgzTdjOJOqEvobtHvJKoZqNG2IqUHOeB5l8QldiA6cmYx6SZG6y9jyNrIfxVxrSOU17VnBqTf2yFQljFC/lvluJtcd2Mn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZczeFDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hse4wlWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZczeFDu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hse4wlWy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sNlh2143179
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=; b=YZczeFDujSyatHif
	aKFVFLIpBfJwBk1uFUSgRgos0dushc5scUvc211du1/azEl4jT9VuikBTzYgmhb7
	IBJIwWIFXXtkBVYjq0F8GBXJ63KXLm66KaycEIbdRq2QCnCqjYnsDLlGebNQgzHr
	lvrZLWHe9B+wk+q5PcYrQJ2QXyefYO4C2koLqakORE1Jt3A8InX2n/BKFnRXE1A3
	upGhCkdp1SeCkyEwhF0L3JaJ3V1Zsp63vZRX7gw5wcUFB61yfLUiXm8+5lczO5ZX
	i7PZTviEcoHJ+GHiAdh37ytIcmJQ1flW+JkT3vsJv2dfBhCwsOg2eJ5/QDZFHShN
	TPj91Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nww2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:58:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3657651eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727080; x=1783331880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=;
        b=hse4wlWyLFJRjRMG4NtrtWfVg3Viy6VouG3/n558c3L7WAauBYlk+NEbTzVPMpUnLy
         X15/jkUtjc/xnMf0iYIpMsjoQ2OIbUIFntyfncUQMDNTZIohBrLm6J98syiZLmASIwDT
         NsbRFUHryrA89uF6nnnT1xzeL0O/WvybO2tc//GcD5u4N5b7QoS33D0TRWsHin9aCsz1
         +GdLzbzDb88ou+q334NLQHpRb6QgT3nYJd/Wf8/DPrLEe3H0XyPte/nVFV52eCaSLWuO
         9LPvD/9R3fPO/DmS2OYYEpdk2xjPxjhsSAQBOKZODtGDPL9O45O8aUm+KCnMLrIshMM1
         IBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727080; x=1783331880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=;
        b=qkgwa7SbLj1gs/UIODnQs4pXHJTAvvdO79OU1SghAViQ9NH5gk4iPNapDv+QJwMpke
         5FGo+id+MQV6Kev0BACU93l1bVSSQgIsZA4zW1W+vhnqZcjH8XxIIq+mrl8nF0C0p7vO
         EVa4xBuY5gcPJitADvLfPthTTgwksAeiMBvWwXKZgAc+EFi7CvyhOVkP96ly8a//+La0
         0v/+uSrxqRBhOY5KD1mZydE5y+ldQOoPIcWiEein7RdnBwmC52hKSCaKshc+8iwrzXET
         Bl8zPiIEaBnBEUykmlkf3NdjbL/eOJEyt87hmdMxj9rkMkZZfYUOyymk1kpzsLV3d3iH
         QLLg==
X-Forwarded-Encrypted: i=1; AHgh+RoTcnyZbLRISSyDEKglUpjvlLRLbo6055y8svnpF4XW+tLAHLDSH/wWs5hU4hMU7XExlVMQ/Jy/8I6l@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+lFkgjv2xYD8QNIMRmwSle9/eLRRPudHpRJbcQwFq5BqBABn
	CYJn2rogx2g2gkjJ14Ybpi3jpknb3DtU8c+SGPT2lt/qfkX41QU0GQleUVLunCYETPM/25IKKny
	yY8HB+c+LB1b3usWTPOqDD6phaZ+vh4StSZ951B1JrPOJdpqcCan6RvXh1fVTP7vS
X-Gm-Gg: AfdE7ckst6P7DJdaER+m7kkWrkKFTf+Ga/yN60xUz738VYUiNJHx55I07JFf9Exf90I
	aT6FqTzkEL2ddjjDzfz4l7dKpBS+PddcQwcjSWQf2ActyoU1kuedmFJbSdjFTuzu9BTEtVSBgEc
	xdlYt5Gjipi+Cl4jYechVTIrYEgwjB2BFg6JKsL1PceQ15LQuce2NylHMn93V6/7YKnSx5ir0UW
	PnYKRr95EKYs9PLcguaRTW8iROXVSTFHABmWP5Rp3dCO1QKrl9n74SzOGQSWlBDEul4whr6G9oo
	TxEXAtpJJueelJSWZbxc5q20dSxSUWrpArJuRwXXkreujx3dvQJS+dqUmDGX7dEESbKF5WAewNm
	SFOgNgVsST/6d7OwU7rKmkQgdDS4TehYjy4nsNSg=
X-Received: by 2002:a05:7300:e6c6:b0:2be:833c:149d with SMTP id 5a478bee46e88-30c84d46fcfmr15329699eec.28.1782727079712;
        Mon, 29 Jun 2026 02:57:59 -0700 (PDT)
X-Received: by 2002:a05:7300:e6c6:b0:2be:833c:149d with SMTP id 5a478bee46e88-30c84d46fcfmr15329679eec.28.1782727079117;
        Mon, 29 Jun 2026 02:57:59 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm51878668eec.16.2026.06.29.02.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:57:58 -0700 (PDT)
Message-ID: <239c93dc-99e7-4b63-a3ae-77770bf9df38@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:27:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
 <pqhrgjj56nbfsfkzqttlivbxpdsfzn3ifmh5s6fczeiudlr36t@ts26c3u27k6n>
 <e8563334-e53e-4010-b7f5-9d61ef55bea3@oss.qualcomm.com>
 <CAO9ioeXUJhTgYWvqz4xAf_yV3n0uOvcLT8ZMYPG7wo7tq4HabQ@mail.gmail.com>
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXUJhTgYWvqz4xAf_yV3n0uOvcLT8ZMYPG7wo7tq4HabQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX9zYVL7cp41Mp
 RrwTRvz8Zfzjqyp8suWIioJI4jlPYr6Jfbw54LGWbVTrUn21ISSQhcBzPxcT86i6XHsvpkcGyRs
 /F1F18HZ3kof/Ywk1+V+6v/tcJS9vPQ=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a4241a8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hj43y7qRzeoofFXst5QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: lPTfHpHdMpBcaq2gEgqgrLFt_pcA2CnI
X-Proofpoint-ORIG-GUID: lPTfHpHdMpBcaq2gEgqgrLFt_pcA2CnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX85/cVKkJH5hL
 +VH5Kn4NjSrsDVCo0YQYBOjR9opTlo9SmFNWtZJY+zRbVV56DxWShHVzN4rpeMKAFoH2wDKhshr
 QfjzP4pl13ZEFp6MU5QHoHDuY2BWuVVeMhes4yTbBLiD8LMQtEdYrRjDB8lKGTKXrTnrcZ4v0Pv
 K1Rdzx8umtoJc8xr3jDTCsTPiAYuj7rOL3FT5dJf6p+UQGJ0kNgZiP/lb5Jf6AIWya+maQNEHqM
 k8Dx7gew79xpmLa1wipv9vSMW6KZbaQavqVEVnH9V7T6o7y49sbjLUQC6o0/OzF+PHneA8AoK3c
 abKYTcndCfdJ4P+j1/qUYDJ+DKUuIDZEfj5/aKWJgXqe95ondOK90bM47NLFfp4+BVvJm4M5vh9
 lFHt9daco1kwYbamvduLc/6iN56Fn1kmlZiMgzMZFTIr8e3mlT9rUyzILybcMUgJanjM6vFMch7
 0ZxUazb0d3pysKDdxYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080


On 6/29/2026 1:45 PM, Dmitry Baryshkov wrote:
> On Mon, 29 Jun 2026 at 10:22, Nabige Aala <nabige.aala@oss.qualcomm.com> wrote:
>> Hi Dmitry,
>>
>> The patches were developed by different team members based on their respective platforms. I have consolidated the patches across all platforms (CQM, CQS, and IQS) and shared them as a single bundle to facilitate easier review for the maintainers.
> You didn't answer the question though. 'What is missing?'. You didn't
> add the Signed-off-by. Does it state that you don't know if you can
> distribute the patch?

I can distribute the patch and I will add my Signed-off-by in next revision.

Thanks,

> See https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
>
>> On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
>>
>> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>>
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>> for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Oh, and I nearly forgot. You are resending a patch written by somebody
>> else. What is missing here and why?
>>
>

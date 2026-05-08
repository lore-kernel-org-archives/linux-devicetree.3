Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91739390212
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233230; cv=none; b=orsnOCh3PgIyvySCBHFLka7HJ+RWj2c+oFwn4sbVuzYj+OkYuKyhXBzxadja6WeyB3BBS4HNPzlxH6weHTif9EqrXueAHSK1wlswS98v0LDuo/XqZq3qUUgSKbbiWtAEFJcZpvsw82SguwltMS7SlSWpoVEFJW3+ZHVd8aQ8804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233230; c=relaxed/simple;
	bh=6wxh8fSQFI80rLYFwJh6ZDJSp19qUtscbdqGmjLg5Vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKbCGL/XbAzfsMGYaFkQITGsVrAtbf/h3e/zKbsD3SlIHhXNUKF9HxVvDKGTQk4/jcswfumPwyx2L8c+sl3lyaKypMYIZspomCiuONZe2uLqg+u9lLzGk/sH/u11ZYZyPBdHT24+JJSXXDN6qScg69YLC2ah4Wi5Cq+75Q7erMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKk+A1v1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcl7TWoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKk+A1v1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcl7TWoa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64859Hq02531395
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Haa+x7aBWIAWljkEX5SY4LOW2I/ywkYuwwubKZcWFAE=; b=GKk+A1v1hKZvNfDE
	deP/20D7/n7F8U+0wfpkbaK1qP4wXFcEYwQUZy7LwaaYjoGyvrsS6Zfcp7+8xfV9
	XUajEXeGRuFQmI9qHaBavdZduichZDv8KLgQBezgmDwMrwMIPMASqpei6DlBaX/a
	xUaK73HSJN0fa2o/fFSFv+vi3JvdohLvE2aHVhmdpibUR5oVWDCPKNGMvN2CizRN
	hWkWIYr+AdG7w1HsHRMIJjmpkisTGZ0iuJA2tlbhb8PctuiKjcujKS0x4XMWEqnu
	1if1a66JB1IS14jZnbBrdwm9yVn3H0k69GhpmVeEXTsY4Z4Cba/L0M0fJ9/SW4tR
	mNWwyA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9trkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:40:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5752affb36bso273323e0c.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233228; x=1778838028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Haa+x7aBWIAWljkEX5SY4LOW2I/ywkYuwwubKZcWFAE=;
        b=fcl7TWoa8W8q13j7HJkQJvIDft0A6nAaED1bIz7lwPfGioPUk/gLOckYyJCaHUlj5I
         b4MgOvMhOjc8XKD0nlslkGUydeyrHB8v5PUZb2CWoM+tSSh56KTAKFbrkVrSpapkqmP4
         mkpfFX0XnQmbXcQXv4oi9XLG/6pz+jX/HLQB5aiplTcgtC2V3GBZilObMXik+q/DCMYS
         zNUMDsSrKslaJq19DPnFKt9XmYl6LnzHo7ZzFf++zB0iS/G0X+DsXIO/kXwVRyuHuYvc
         JSltOKwy3QhTkxKwgVTiY5uc5mQ0olIFwjb5LurbHPTlY52geMPxbBbLnzUuWHKO+RYH
         B8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233228; x=1778838028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Haa+x7aBWIAWljkEX5SY4LOW2I/ywkYuwwubKZcWFAE=;
        b=YNjfZTh8rZOylyJgnCxmQ6bLHowytFu3FSz2FBttU+tN0RiUCpOAnz7ZxH/tl81BKG
         ocApK0wV8JW3OdC3x7Ezdq1PgrruXzlHGnxbeeBUZS2sR27PL5Om+dnm3iZFbzRXbrtC
         ovNzpPk7yKLp9oxI+U1JxcTL35baanFcuGssUeRrGRh8kVP8Vq82lWanGL90KvHMTewH
         W5wTL0MpHDHApTdm9kD+baKhGJns8R6tQqThMPKeBAh8uJ5i9NXLWtJCImtcklfEwTUP
         hXD4sWXhWzjs40pxfHj+iTDt5Yx/HhN4jYS9Mf/siAk9/YlL3vXQRuEM8t23V2c+j5Or
         zvbw==
X-Forwarded-Encrypted: i=1; AFNElJ+9s/a7GLyPCdM9tWUKViFHL5Jo9whaCD4MGB5QQ5glBwJaTMuqKKAd4g9ddw3WuVziVIef91LT2MQc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53SwtwsfsahcyPuL6MO4SnLI+Xd4nT2aBtvLa+yO+3SxqWhch
	Rq58CIbtYsnew2i3qNVa2U9dmTg7AShhThuNL8v3y/cY6wqVvFfluCtHL7pU4FCDu0DVZs0Yj25
	D6tTSuddCURGwNE1j/qrM53QjjhIufw1kNP/E4Po0KuLp52gAfP/BT657qxoDIeAW
X-Gm-Gg: Acq92OFpGL3iKiL7viKfzUgbOfAnl0rY0JzCN/jCLB6UUCVmgWbYTPbykd/yk++9gGy
	inYhlLMTRpmfCvVelbWgtgXtiQyhtPt8Bl21GOyX8Y6GVE50IMCopBU8j5bEDQ429pZOnTv4qHv
	XGEeI0SyZjAFNNegVH6n5nMHSyI1d2codMC2S/Cz/XPlwqQo8ewG4r8ePzy6Qi9j+QXElI+5LQS
	p1Y1Ugwk7E2jfiIQU+PgHzMIrR3dtTVPh7Kk+xYyTvyM1Iw8bUieepRlOCPrUpwGRG8fUM1VXzX
	Wuuxwpl8CUFG8HE7dSPHdbNS4SzNyaEO8UJm701NQlgg5ZV+8cvUrLkvZ9eOgW8Nw2P7tUwDCpj
	TPZR+3Ut9+RtSHBWR6t7qbj9L1nCMtElU8NIyH/EUGnDt9oKDxJ2oAVswmvVC409ZlZq2TM6xPV
	Ghj9o=
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr2010416e0c.1.1778233227912;
        Fri, 08 May 2026 02:40:27 -0700 (PDT)
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr2010405e0c.1.1778233227483;
        Fri, 08 May 2026 02:40:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcaec604eeasm46209166b.19.2026.05.08.02.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:40:26 -0700 (PDT)
Message-ID: <37b80f4b-4824-4e03-b129-b0687a6b9023@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:40:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add missing
 qcom,non-secure-domain property
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-non-secure-domain-v1-1-b6f75783c831@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-non-secure-domain-v1-1-b6f75783c831@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7XnpiMKuOH17l3JCwUXflEFFNqpTSZ3I
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fdaf8c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=wEf6Jh-Ad-LoDXXZAvkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5OSBTYWx0ZWRfXzUigbyarqszV
 o3Y6yWg/Uhtj87nuKxXMU0USQgdA0CIcrhvUKPnsh+3v4Cuccnl4qEIvlBHmEmnmjwmf+1JgziG
 4I22QtB40+eWTHk5tB3kbZj7hftQRidTOz86SPlt2hzVYhgXimnP0ZN5Vd6x2HvRQOeBqPBsuUV
 +zG4WQDIkmcEOysxXNlzA2umG9V4Mbg5SX2Gi6xOZ9j35dAkK1V4WELHzcoWhFGf7Otlm3T5WR+
 8XJZfmeIK1qdxIC63Kl18kswJJPK7HEgfRFwWRcmH3qUdWeBGeqO6daV74NHlX/JrfnM9O3KqKC
 zlDFriMsKBOwlQUGFEt1IxBZ8NhWXEnOkU3uNKipNmxl4bBbA233aZmkaisK5FnKSWabzZUtztY
 CUOiW2BW5PIi4GQQKfP285i7dHr1ap6s9KFfUl5coEHQTxgr8CNutkJO1kGZlKLDKg98NfiVnnC
 nb9Skk8lo4B+GvzYi3w==
X-Proofpoint-ORIG-GUID: 7XnpiMKuOH17l3JCwUXflEFFNqpTSZ3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080099

On 5/7/26 4:54 PM, Xilin Wu wrote:
> By default the DSP domains are secure, add the missing
> qcom,non-secure-domain property to mark them as non-secure.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

The CDSP accepts both secure and non-secure code and the driver creates
both "endpoints" regardless of this property

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EDA3783D0
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110544; cv=none; b=T9Aq4tmQi9djOwVhXXlPMBm50AgacdjteNcvXViwubnV52SnMIRUs97uZze7zrjgKiftbFG9RcRtfdbJ3I+6Bj1Y2uP/hoWW/3nPCTzf+Xc83UfyTYurhv6f7jgf8IZo54tIFgyE9KlHug7Uz5XDXdjasFXhsCLTeFZqC9j4weM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110544; c=relaxed/simple;
	bh=l1loiawBIn+Nx/k/dA29xAyzkExLzj0o5+J/2k7RVgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZWrvtvDgwPs+5esNGgVPFMInsTJZLLwS4YCDtlV4TjX3Pb1af0pK4QidOvvW6f+8HtPKI4PSeCgfHRKjgS2WSpJxqXZmWJQLTZgVFBn80jl9IJ8/l/48lSRNwjLCvQYEgbIZCjN5Smxo4ng3m5vCpM4F+4lJe7AExasE80btBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8bHzOo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZXiD0dj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8bHzOo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZXiD0dj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4LZ04009752
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 06:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=; b=c8bHzOo2Owcne8i4
	ePx8ePExa+MRg9dXSvXV9+XMQ+EJyz3WNvSshCsttH74t56HFmLBZvE9txWeth1s
	QIXKRwa1R+laOy2am9B1eWOPsotau2zBgKPN8KeDR8L4oDofkeNLtsmQtSNCGPnM
	0S7YCtaB1qW3a8Kq/Wg/Ut3cSzNws1FrHiIG8GRQ9XcA7xeCEJyGTAkm4R351QdH
	ogqyKu8RlS0MyYpvEhUHYNht+FGGVta8hX9LkGEvInydyGKiaovL3eN6H7zEA2jZ
	BYHuNeZHTWgRTWEEmHy06deecWJxrvg3MNZcHbHZRPwuQOAY4eG44FoaQfUA21Y7
	Ii3v8g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e02ctq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:15:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so359045b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 23:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110542; x=1775715342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=;
        b=hZXiD0djI2ie92tB/TOFgMOK1/ZtzPW3Gf4e2839fsG10IK1NjDF2LzIDdOun4a+Kw
         qLeVjx+gndrz4ZJxqEVmCzzsBj1T3c0mNbBleo7Ul6DcARgjxwT7B/EsbMwXQ3NJ9YGc
         6TPeTWpsdskY5WYKyAzer3NXOMVCrQa4l6AKxZFTYUK1jxb5F1ovVHnE1XSlyEJjsWd1
         T25v0R0yEn+zgKz0G5MqtZzO0Bo+vzBVlnikOaz93mTsKBn+PewwdV4oUNkUqngLRxK1
         l8Rqzw7FHEljpxZ2QBCQewmPTp04hl96Ek2VjOJpyJNU8BSIIrQ3cej4+IEZqcncOzAh
         +JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110542; x=1775715342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=;
        b=NhoqjU1kUNcwJosv602lVK8SSYtt3FoTeLa7RMMjTwp6TT1k3F/UwiNsC4sygWsvUU
         Jkcq7FJsUnkCFK4bDmNXrMSetzjxrtsPwPTFqfO15PFU/cYkv6W1GfZlRdbaOrUW/5LN
         4gOq+kGKjkn0pIDr1eRJiinBKsTRhECyr3lNxh6trq/xMOwzM0vWedGnzvCEtycs78Au
         kLw+SmIvsgQGXcU2Ajk6f/yN5qYq3ctZGM93Grf35If0+1pKRmYwObnny8jz7ExIy0sj
         0kp2cNiklg902Fsb8x9YOkGS/ouo6OY0O7D7IqxLBFp354EJC0DlaBTCUdlCQ2z1Gzd4
         ayFw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Fivm7klunNxpHX5rvnhoHzbBvIBE09s6hWcvQHqQPAFbggCAr6ex1YVAkOUEI1kBLRGr+wWhvktq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Khea+XK4MVPei/NajyTWiEaR0kHbGFqxHViVK9UabGMwG1zt
	zgAENGL4d7lXdueKjNQ409q+bTsvFCx0R6hrNpe2KMeHkKrch3kpqgzEUWR8KHtLj5Cmc4eqc9f
	9qd+OuZdZl+BNmcUjFxTKWs4MENtRMvtrqhCMOzLEYL13E6y5D2RMpPX4lSPLK0e/
X-Gm-Gg: ATEYQzwrUOtoaMQWbu8vf5SUXpEMUSivCOFKg6ujgmK2YI1E7S8K5HPbWz8SkfUUmwK
	SOlAWPwc5sCiNev/mnaT8oporJoz1TNI2huFiVlfmh8EDBh56ChXMlV5ZY97FrXBnzBkaDG2wQd
	muQpV/wiQr1fv+bUe2mySQoHa3/1unV71Ccqf2rdUD+whSV/548IMuSLKh56DGruTUOiygNHP8R
	D/5yqJiPX71WUMm42CjXeMQ/iq6anPJg6n15YnqrqBibGsfSbXCVNfWM+hOwzIpbreJjsAkW38V
	mG61b07Z44JzpwaCrHdZiTKzv1Ss5MoQOK2kG2Sf6j0lZ6FawHzYGg3D+qu9zeuST93I8+hznla
	eMBH8LE6cT2bKK8ux7tu22zHzyYgYHFocR5kD9DY4Z1yEXkpJmQUHfMYj
X-Received: by 2002:a05:6a00:ccf:b0:81f:3c34:fa83 with SMTP id d2e1a72fcca58-82ce8b39b7emr6362555b3a.57.1775110541661;
        Wed, 01 Apr 2026 23:15:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:ccf:b0:81f:3c34:fa83 with SMTP id d2e1a72fcca58-82ce8b39b7emr6362522b3a.57.1775110541169;
        Wed, 01 Apr 2026 23:15:41 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3ce13sm1854075b3a.38.2026.04.01.23.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:15:40 -0700 (PDT)
Message-ID: <043066aa-64ad-4b7c-8592-ca3074beb7fb@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:45:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
 <be9db30a-ee64-4457-8722-b9f456911ad3@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <be9db30a-ee64-4457-8722-b9f456911ad3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce098e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8-yduQQsOBGYcPy-76YA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: xSWAG3thz-JYp4MlJcFAMbwr-2UMzsUT
X-Proofpoint-GUID: xSWAG3thz-JYp4MlJcFAMbwr-2UMzsUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX9bz/GtLw7a/A
 AT4ZO/wnswAONiIbA+N+e731pM5Nhe29Z4BFQMIYtqHehe7/rvkIqRNlqL0Anflof2MDUno3sd4
 vAA0x0WuzB0swCDFEmEWFaAoXAvmvkXMTRdxz8I2q/rTejiAAmKSkjO0FLnssEQBGY1BcGdP+X8
 yK0bUPB8oPnzp+XGGK0+5QThpS/7CCdMlEiIY//238hebLmqIX1klo/Ca803mIUqFa+knnm7rKe
 YAByv5FHd51LOvxq/YJ/hFPhtXpMMas2gpPIwZ/vBvaMFVRrsFxoscU+dK4oHO/CjU+PnSufHxn
 EgDRASv7aCRH6EdTx4bMnsqJ3AmMQ6cPk19H9GVoY0z9iBB/jttsdaNDxWpwwhAUm5OSrCOQxPE
 Ys60riS1sVvIIjAG5qw9osk1RLb59zp1zF1Ju09hxMUYmZX2YZBZhD2DqVSFHRWUFpfnKHC9aR8
 8qpxUlT7zggFrwrshTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020053



On 01-04-2026 20:49, Krzysztof Kozlowski wrote:
> On 04/03/2026 19:03, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
>> they will not be referenced after the managed resources have been
>> released during driver detach.
>>
>> To ensure correct lifetime handling, avoid using devres-based
>> allocations in the reboot-mode and explicitly handle allocation and
>> cleanup of resources.
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> 
> I don't think this is correct tag.
> 
> That commit added code which was a driver, not subsystem level things.
> Using devres, as you pointed out, in platform_driver is correct.

sure. thanks. will remove the Fixes tag.

thanks,
Shivendra

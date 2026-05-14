Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC63E51F7
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766331; cv=none; b=eBoPZHBSkuIxIegIG2Gi++1bduw5SWtpAC7lKqPvs6fzzFvNMNaR29rv67YUL1XsQqMr2rNL/AZUfeWDnqssV4RO0BVcAi/pgDkgji8y3/ADuXnCec+7q0EJC4IFXt8yA+EWki69/us5fldnzfXa99bPlZo8K88uEDZvR+ZRjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766331; c=relaxed/simple;
	bh=UX/0/oNsXO3jFP/m3F5/1BBiL5qPA350g3fa87BSP9M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eyAiy8Tdb5gWRUjx6VGOylXRmm+vwNyQX+9CjaEFmdDFTH2qM7nbD/K4k15uCBcq+jjjMjbJu01oDz2B07ysr6u5oAgQXqjhlpOWTEQ/ER3M7cShPpF5MiotF80h8n+e4faPfR8Tm7Sr3Ftu4jkoYIkQnuEs786FeuNlp8LpEOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJNhajcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQUtuVza; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJNhajcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQUtuVza"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRXt3891053
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bccz44mXt5IlcgrwM6BT+Jf6mOZHElzKxevYD9CBbWM=; b=jJNhajcScwOXhHxL
	AJ6OEVXxDKfx/i1FBLfkDUXff9kTHcIOM0bdHNcENTxTrLpmzVrj6WUPFzyDCiHO
	KxFpLr6td0K9W3KrGDGuDp7bRXpnjiYo2UvMnkXhJCMNOLukvI4KZ8QJVNlsh1Jg
	Hw0Er5GvRtDs1/f94PQJ8KdRSIslVFej1EwPzCMEsJb//q3fjhJrxiYwfmIHeJ6Z
	4kewvn+lKKox2FD8vqKTHl+AoxgYVL2tk3ImNK2ac4vJh3Nx794UZHMPgV753eYo
	KDU9OCn/Hqj2AIaxuoUlf77Rm9AMQ3Cqj5cgzxARZw2fdhm3Qfk5TT+i8Mnn0a8V
	S9KZMg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tv78v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:45:26 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-65c694b54d7so18769734d50.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766325; x=1779371125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bccz44mXt5IlcgrwM6BT+Jf6mOZHElzKxevYD9CBbWM=;
        b=gQUtuVzaWfPc3XSpyVXHAfaj2gWEndRJMhTGVquqDlCt9TmHFhtyR7i6mCkqkgXJs9
         HYMtm4A4hSSoGRlKqdhsm1itZwPaKabSd9TAGEfxtydVxHxrapOxHLHjnWednur5rBJE
         KDPc/EIyLfV/F9czrLpd/thKDAtTx7RbBVP8K0vQgfd6h5GrNMGxKZSj0/tFd7xB+npI
         TkoNWA6qKYUS599PNkoKpI27B2kykTolB1vI59QH3qmznVhc2ogDnaZfaXSAT/fMgFI1
         a3Ai+gArB5wWf2vF9NBAwbZhXU2iWtRS3DcxGXnc83RE5HqTDvCeQz5bP3piOMZjTHHw
         FllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766325; x=1779371125;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bccz44mXt5IlcgrwM6BT+Jf6mOZHElzKxevYD9CBbWM=;
        b=ilhdkoOBcnKj7835tnDEfJWfp3ZHV5dzkUW1JHKpd9fHDhOZj9yntymRkDRiFbpbGM
         Cvv62kokFVTlUxTdInVBQB1Sli8IB1hKSKI1Oop67LyqQyEb7vnP5KOoVUed6TJgDJKJ
         sI0637Fy8cm1dDpYof0h97bQDP83EcSiqmWMxaKqrBfr/xTXXBNj7YEhx8Tfc1YRnglv
         n6tCWov+opZcXQPvc3mDhji58EdwwjVr/31agT2HfwhQMDENYtbe6zmBXhNX7YNgHSVj
         lbDcs4/qLgL/ZzYVYXTGGdcuoTKCT3PjsZ6hEaxc5f5KX63SDkgTDRpA4L/gnE/Vmp++
         jcwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YYFn9mn+TwWKY5UqC5xWEN4wgqfalAOoBroUvEu1ZyAoJulkGgvKB8XDrn3rB5g2eQMB7mGOBhPPc@vger.kernel.org
X-Gm-Message-State: AOJu0YxrRFCzwlUKCOYbR0cW+4xn2RZNAApL59Rk/FYrfM3F/wgSnNeu
	/tEUdPRd/3p6uc9DG83cSG3s8Bo5/doTSKUXizZn7Em4JmcHnIeaL5aPv5DrJ+rSH5Z0Ojeg1yS
	rT8neqrULHma06+NimO6f07LcdmXa9CUGouvTHPiz3YNOrC3k2tzqMYU+hrWzhN+D
X-Gm-Gg: Acq92OEQwAmkDxiG6gGOizaZobhi1YtuzRJhT+x7XXWi3yCi2RUB+LNau1jpqorcWd2
	ER8Nn6INLO/QcaD1t05cjEZJ62u4klwAP456QM5MPqIJfTSD2t3LVEZEZzUs2ncaa2dh97L2NGz
	VHgF8DJ8A29TAKFF3Ca0xfDyk3tWmXnW3TyTtrB34+uMb9OGnZQktKjLAk50XTkYu+KJzHf9TBH
	ktcurD3nbQkOC3xQej+sqaVAjClA5jZ4daxdic34CJy1Uc5T8miLnLoqQhGT5Bq4/DhvhFwc8UF
	ZORNS0rGQ1yp1ySAYJfxZkDDWsoALkPzx0gi1tHuY98WPAtuZTp0JJA2epwKx7iyCnipAP0V8VS
	8p3aYgs81vvF1MSq6zOLfh2HK5HAylmzwu12yW+1P/iYbSTbZyCvL
X-Received: by 2002:a05:690c:6603:b0:7bd:a4dc:c23b with SMTP id 00721157ae682-7c6ad473846mr84571307b3.49.1778766325256;
        Thu, 14 May 2026 06:45:25 -0700 (PDT)
X-Received: by 2002:a05:690c:6603:b0:7bd:a4dc:c23b with SMTP id 00721157ae682-7c6ad473846mr84570937b3.49.1778766324839;
        Thu, 14 May 2026 06:45:24 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.69])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f55bca95sm12983157b3.39.2026.05.14.06.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:45:24 -0700 (PDT)
Message-ID: <ec78d81e-5b0f-4d79-9bf3-02d5985356f9@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:15:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
 <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
 <bee49f32-cf46-4cb5-9d84-0a813b64bd6f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bee49f32-cf46-4cb5-9d84-0a813b64bd6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05d1f6 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=UH61rShEP5ZXOK8RUAspcw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bZB2p13Iy_By7FS0diAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzOCBTYWx0ZWRfXxs17mSckTs4/
 gI4oRJQpmovQPrDcRqe8ejAbJ10DRqgEPnTwqsA+JbH6FnOhCZ6516igNBL7gGNBmmuhQsHYxMC
 SZ3WEvRpfOzGGKyiMx/WllJUr5ihUR7P7AeTCCI3+3Qo+rrpAGpXV/RTPJNRnocICYnTaX8rzAt
 o9TUvWatj3o6tUi59N0qzpwtzFWo9pPYRmq7Quin4F8hJDoM70JUToESqevPZ7r2z4lHSpRuPHC
 WV3ZrM9cTtNwBLNg8BE1L2upw9ztCtQVnzAnzq+RimQl5DR+sWFTrxDHOGqjxjeiEGKalRr/rar
 ob70a169I2DMNFASKe6DYGQZDk7FW7Iad0xZ0A1FcsbZcr/QyZO9+eQVN3wuaKd3kWo5HFzVsMM
 Rl91Wwtd3pUXEvMBSiGep0k8vjfguCe0nbcA5QsH+peO/5SHmWxXg0j/IAoXk84MUaoEXGgEmkd
 YacMKjacy0PcE9gQJhw==
X-Proofpoint-ORIG-GUID: o2JU9i5ZqnkUwp4Srz5iHCV7y36qBDQW
X-Proofpoint-GUID: o2JU9i5ZqnkUwp4Srz5iHCV7y36qBDQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140138



On 4/19/2026 12:16 PM, Gaurav Kohli wrote:
> 
> 
> On 4/18/2026 11:26 PM, Dmitry Baryshkov wrote:
>> On Thu, Apr 16, 2026 at 05:04:48PM +0530, Gaurav Kohli wrote:
>>> Purwa IOT boards support a different thermal junction temperature
>>> specification compared to the base Purwa platform due to package
>>> level differences.
>>>
>>> Update the passive trip thresholds to 105°C to align with the higher
>>> temperature specification.
>>>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 +++++++++++++++++++ 
>>> +++++++++++
>>>   1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/ 
>>> boot/dts/qcom/purwa-iot-evk.dts
>>> index ad503beec1d3..261d1e85651d 100644
>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>
>> Is it a property of the SKU used in the EVK or a property of the overall
>> form factor, cooling, etc.? In the former case it should go to
>> purwa-iot-som.dtsi.
>>
> 
> thanks Dmitry for review.
> it is applicable for overall form factor, 2nd one is applicable here.
> 
> thanks
> Gaurav
> 

Gentle reminder for this change.

> 
> 


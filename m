Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C03DD872
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794507; cv=none; b=kMQhTOulPtNhWojLvWqGHkbAzeiwOtoSAXH0wETGctME9ZSYF6VTFkq2DeSDmcC98uNNHRQIf/zde2Frgu232RQ4CFHFrfOQZfG2kxW4WuH0gue7nO+jil/r66TRHchI8NBX0vMrSFQXDJzSGBsM8k1WgS42tylu/nwEpgx8pq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794507; c=relaxed/simple;
	bh=i/pTzMVi9XbOmZoluvn42b58PFWtzW94v/MUSd3ggjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lE2vCEdVazcZ7KUS7o7TIEW6ua0Walf17sAO/ygbEjnSpZL8ZIbn/69q5xurSlpiRAry1EB/+97oPdsTgJ1svN1ze8hrR9AL0z2Nh10WS8++7vhyX8NrgQZZf99W0CWnx//LQw5Cr8/pfBQ3fJodXZxmvPkfvxTR11+IOSMbSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McMcpSj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Shh9r3tp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McMcpSj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Shh9r3tp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q601Xx1605273
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	657l6qX2PWzLBimaQHEMg2HJ1WHmLAQaXwJId8moVA8=; b=McMcpSj354sThUE1
	mYD59EORxNrXnhcSVzzJVxU/mtgBOTkATHS3zgzpFAJgFzOCrZ6Tko9QcRFX4fdG
	pjO/cSrfmFsIXqG1Fw7Ao+Ras3SPAAQV63vtpdpB+azxJWxOrGkxzP+cwyxpmql1
	mRRhTVOo6NwaBvRWNf0+jzf3jb3IsstT0cj7NGw+SyGajOJL2J5Fd/8gFPX2OMiO
	+gtHnIgX1IVHJnvyEIDB0PSekbn3xyg1BAdfZoOFcdvA4Z5K/j+K1CcxJtgrUD2/
	z3z4W3alIsFRXRbx2o8KKfCwZu8NS6qvdcKgUni8T3BjfMJcYOw3WsWE1Vy2pWuw
	H6qBFQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3s8e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:21:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so5098367b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794503; x=1780399303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=657l6qX2PWzLBimaQHEMg2HJ1WHmLAQaXwJId8moVA8=;
        b=Shh9r3tpPtbl2WDGhZhQrhFYS/4uUtYjEoZdpKg9BWu3oGjphyP+Xft/9Y339MMGjG
         XsDnu5X9yghE5ZB3v4qTUp/hX/smR6iG5PEJVE8XsdBXvYGfdlat/JnoxFnzKIWOWByp
         WAGwxAwonBDkiSj3PTwohPaA+uu4HqADBlM3D4Wd0gKCmCFR8CaRpXtzYpsMCSsFCa44
         dvTDlwrDd81oURTjnmQNy6GjeXVh9yUGyPkb0Ohr3g4E5yrMmLfmZ5GJkl22p5uq6xNe
         yY7enGpejh0hb7dcMfQ0vzMSKhBYXsL3Nvxt0pEpT19qkABNGFAZ9BT+61/kFg8gbsHS
         c3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794503; x=1780399303;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=657l6qX2PWzLBimaQHEMg2HJ1WHmLAQaXwJId8moVA8=;
        b=sc1dWgHhjw7ineaalY5VQ/zgccvVuWqqgjP9awbHBOihPW7XWijiKqdZnLZ3scYKw0
         7C1b005e/TOuKUAIr8Cq6kEQK/n/XkOZd3hBLSTWudka2wMJIXuP/iLMABORZRX0rbO4
         +DR4TvqPxReumnluvL+qmuBPg9xWjCFS/nmZ0af7kOeS2Rfbn1Vuz+W2X7NhvoCk5LD2
         0YBVDFMrBovQQ/x773ODMZ2qR9Pcpv93FH5fOmhhxazbzHa5g+1hpBOYrZwMfweP6cx+
         NqOHnABXVWmgTywFMmumijx730OkWZ9DVwIcglJscMrUoCfOMbRORCemrG5L6HCMj913
         ix0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9+atnsImlf5bKTkIcrac9P4XsnRY1gd1FYwmh4nW0yDjsN85+vDEMvBLzXtN1aZOTQOLP42uUK7L96@vger.kernel.org
X-Gm-Message-State: AOJu0Yy11+5DYkZFa7r5+b4DXt5HHTlyDtVKykq2EBZNywYUyZO+qLi2
	f+qMNDhKwJTrWHUJC/uP1rcOUeWtEm8C9t2t1p31djz+BdZRQHOmTKHG7hc5Z0PtIGqW9Dvdhl1
	GL3XdzViY/QfWsRF+SX54hYHLjAuK8e2BI1F5hfuCbntH7DVtGFTqEJptdHHg26Gk
X-Gm-Gg: Acq92OFa+/QoWGpL4NQb7MMYTeEpew3yCvtpL+taFvrla24YCU7YbbwZhrvHYVVjOo9
	CSxVHSZvbm9whLZA01kfCOYhEPkmibsarX/Yf52Og/xDjmBVbb0Y2k9A95mVKfKFa3wGIxheYAD
	DrFNH+K2ki1yAa7bec6/thHXyLrjJLIg4z9TkOXQ/0ecb5nr8CwFTtOs/KneNrQKBz/9MvmV5lz
	Y2svLbR6ioUoKW40O8Zz6xw/yd3fUr7ceE9oI+DfiClCExiHezZl8WBGSZ3LQBdnDxIhabPiEgY
	nYzoaLg6aYOjI16R52nqPT0YH50Bx+0js18CVQ5z2UrJZ4vZQrty/1i+nFBDlWjtS7ougdrvtKL
	Qbkh5RgtT3inUOzWphQqLX0KUnewJf+zGIjVc056AwZP/v79PaP15mA==
X-Received: by 2002:a05:6a00:1988:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8415f33166bmr15334895b3a.17.1779794502945;
        Tue, 26 May 2026 04:21:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1988:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8415f33166bmr15334846b3a.17.1779794502360;
        Tue, 26 May 2026 04:21:42 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm11949564b3a.3.2026.05.26.04.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:21:41 -0700 (PDT)
Message-ID: <2757cc51-f755-905e-3dae-4f4cf12db15b@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:51:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
 <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
 <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
 <izj6zy7c4ec2cjbsznkaxa4q3hupwteqprjzpajjquwchwa227@mplk7d7uccz7>
Content-Language: en-US
In-Reply-To: <izj6zy7c4ec2cjbsznkaxa4q3hupwteqprjzpajjquwchwa227@mplk7d7uccz7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OCBTYWx0ZWRfX5E2hgc7Mgrni
 SX0M1BFd9nStnK0GC5B64xRVioQauJ2+HpHvBoxbXew0ZoKooW/QBxrS56eEB7LuQdTQ+I2fw93
 GG+Su7evKffQELodxbaYiJy7GSvj/H8L2xb59s1DbJB4JnO9SmOfhqeJx3sykTa4LxqQ4H8RnaB
 evKkhqrNNYIo2b4I2C3/13ew3qhtxDdG3zkJsdnyjMu/i71Lur9qyJ8oaIxNUynwmOdLTbHSQzX
 1+8tPrLHq/mjPpq1EG9O1jf1Ss6R/2KEcfvZnWHxObXpyFjj6MTnPqvHKePm8eQ5Sk0afi+1KEr
 tr6gWXzcYbTszobfHAmG0EihurTh9RwJnbejKejnKxXyT7sm9QfFxafLMsqQUsI23SyOP7g+j0m
 EmCTHvqkhhGLObi/t6go2H5MG7Mj4G7Ex4ov90encgjXIBeaYiJ+rbEOnpDSWDgmYAIP/L1L6J5
 BL1QjgqfxMi6oHtmSKA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a158248 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FhdRzFEOr7cjOW0uG60A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: fS_JL8FBLrRXTlT8p6tRXpNjlvozzGQq
X-Proofpoint-GUID: fS_JL8FBLrRXTlT8p6tRXpNjlvozzGQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260098


On 5/17/2026 10:59 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:48:44PM +0530, Vishnu Reddy wrote:
>> On 5/9/2026 12:50 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
>>>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>>>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>>>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>>>> remove this write to leave the register at its reset value of 0. This does
>>>> not affect other platforms as only Glymur firmware uses this register,
>>>> earlier platform firmwares ignore it.
>>> The explanation is pretty suspicious. I can see this write in venus
>>> sources too and it was added in the initial submission, dating 2017. The
>>> driver targeted two platforms, MSM8916 and MSM8996, so this write
>>> predates Glymur pretty much.
>> Thank you for the historical context! I checked with the firmware team and
>> confirmed that this register is not read by any of the platform firmwares
>> currently supported in the Iris driver. Regarding MSM8916 and MSM8996, those
>> are not supported in the Iris driver.
> So, which platforms actually needed that register? The "currently
> supported" is not strong enough. We are bringing in Agatti support and
> support for SM8150 and SDM845 is in discussion. I would not be surprised
> if we end up porting other older platforms too. So, you are changing the
> historical behaviour. You need to document the applicability of the
> change.

Apologies for the late reply, I was on vacation last week.

I'll move this to a glymur-specific vpu_ops hook and keep the existing behavior
for the remaining platforms.

>>>> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
>>>> Cc: stable@vger.kernel.org
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755AF1E1E12
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 03:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783742163; cv=none; b=q4Cb04YRu9GwSFSLBLFT3PQ03jLKNDUENvGfef4mb1jMO1MXsd9r74GZkxlt+cL1kJ5NatLa1W1wi+4RIoL6LQF63AZf/rUvwLVGwqh8qoXHwuI2iDsOVzW9vIM2o378lU18/2zYLDP9pY5mYLwS4PSQ/6+LdBadhxCiiJuqJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783742163; c=relaxed/simple;
	bh=x9Pa4CWmIaRLB3MyBULfiCaneJwv7lLfh8snhiBC/Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/zSyXFJEqG8tHD44yiPGYBkemoYM6t9s0gwpqgy8zNQMB2N4brQ+yLKsjBrCRS36jD7uKiwYT2OHg5Gi9kBRAK0znJKwiqhoHphgZ5RgTNvnMSkRvmM/DQcJI9RHGzyNBxRXmBxH4I7ehgR7Pz5d2MXnvM0L9i9i9HHTirBYzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeFZfVra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FijEtiKd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeFZfVra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FijEtiKd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B3o24Q2687175
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 03:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJBGuOWmLf6hP0jureBA7oAb8Q7pc962h6NOyjWbd6Q=; b=MeFZfVraUDHGstkM
	CuFXGdbiYvfqSJssyG5L/0FOToDtzJfODvzVn4PbjCY9NoKSARTP0RsVwal7oxLI
	W3IeByHz+iBxkt/hMCQ2Bwf023Ic121gHjr7d7Dz5CJvYlUtzbEbz6Ucj7J7+9Hv
	NNqPP6cPfR8W53D4WLwnnqhWYpRz3jfRl1q7ssn7GJpnajDz/JK+OYA4JcdmUg10
	mOdfJYt/gSDNKCHp5vIPOanU0+JuCfVhol8agTF6hJ5mK4ByNdAWBZTUTxqJ1qPe
	I868Zpa1EyftndfHnlpY8LP8oAkUljasFxz4iY1C0OLuCLRr2+T5SW4oTAdU+ibv
	rfpn9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe94g08s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 03:56:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1785947a12.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 20:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783742161; x=1784346961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJBGuOWmLf6hP0jureBA7oAb8Q7pc962h6NOyjWbd6Q=;
        b=FijEtiKdUse/UBxRNkRAFVVSW/9IpdKMTRqrn5s2Blf0iWg9ftEB8BxmEgJHFwJF7X
         LmeSMzASAY3ghvCay8zZQPTsjFc2BZ2civBVt5wQKpg7nIGD6y4jqP4WIlApGfv6y4Iw
         SubIESgPNpDlYO2qbN4lOfRQfwvuc3oAAjjzoX9vfmT3oo5l9MQpG7osAHrGsSGw7hq9
         MM9QOCndc4+9sdVWsVTmETBsLEozM4cPcN0nPxVQKyod71ZBDbL9oLODwm7dymgTDovc
         GISW9xBXWG9j9Q5pYIT+bxe2zwHlCsj3bepZzZIB9FgdkeWFnsQg/O70mVci+W1USHJp
         DxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783742161; x=1784346961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJBGuOWmLf6hP0jureBA7oAb8Q7pc962h6NOyjWbd6Q=;
        b=V233DYpm/P/YcnPxuf6eDFIqfTl4YgAvy2HkChOGh17Mn3itobd3xDyDf0LZ2ZuuYN
         lIT0jwPCGccOp541BIL23wkL8zCHUjPPgGU1hsO2XJT67sCItsxIDSKuXiQhk+vOiyCQ
         ulaPzqMXABQs9s3aBF2eA4FnL7dThmAVjkkFbb0HB89nTNCgYHUj+7kI9YjziN7t4KXD
         Q1onjd4Rcohj86+6e4PCNLwfg878rhCBYl6jaT4I1/SASFer4WjQYvkvFUR70MA87AEP
         dQCNZ+U6IhXwLiwaoqmFcs7tq2GA3y7tZ+FHizJ7qMAHcAjIa2Cy1tak/F23xIXwhtuE
         2yrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXCDmKvdgup4PUePwZSyCUkZJweD4ReXt782Uvq+8aAiMAsgDmZ68P/MJOvnf/NOc2iA5ZXQIkAVDA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4TZCUaaZ0PU3FzKzGrZYpVpA1moVrpM0p5RPusmNy7GnXxxM/
	889H2aws00Oe8ROPpXD9zw2L1gMJnE3g0aKIegun1831Hu+vHqDu/QgacUM0Pv13prKeYWTZgd0
	PYdiiXEz+SKthGh44tVaTXfC5f0chMCHhnlDLmYMM85TAUO+TcHj2TvZYwZ/BNQ78
X-Gm-Gg: AfdE7ck3L2ZAh1Zyp80foLofWpqcOXKeHEcV1WAL49Svws2kNWsm2Yt+6sZaNbn85aK
	bWCwHlvOm7i3xjtjv0/KXJpfziVOMs1Zop1fqF8nhc/il9EtRZqpi6/n72tEEiEmjaGIhNIHhml
	YluDYe+ffza5TRCli2CPRPIGxmHDv+Y/eW226kS2pgzcogl144FnrCdqvf/8uycf/ohammH+DqV
	QTWnDQZz7uBXXNor3VZyZWj6AdCwcZLSCfFm/FK7JmFK1wUV32IcYCr15WPY3k91F/kDENqty+i
	neBa9/MTlJbFN0aoeIWgMDUb/a+rV39W7+B5MHA4MoZU9f53YGMaD8kIBgACOjZc/G0lxbLZ8yF
	Hv38KX2uIihjEZtlmRdlk30uu6x3NwgBpR+5eQQr9xCOwT64=
X-Received: by 2002:a05:6a21:d88:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3c0f0ae84bbmr7014172637.19.1783742160695;
        Fri, 10 Jul 2026 20:56:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:d88:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3c0f0ae84bbmr7014136637.19.1783742160202;
        Fri, 10 Jul 2026 20:56:00 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm43281978c88.0.2026.07.10.20.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 20:55:59 -0700 (PDT)
Message-ID: <a0ab70ff-ef62-42a0-b83d-be41ce8f64f2@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:25:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
 <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>
 <airpBYZ2pRdNaE1v@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <airpBYZ2pRdNaE1v@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gIuhFVvZXYp_psX4xSHqQBRFej-7bYpv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzNCBTYWx0ZWRfX1unCtI4CCxvE
 5Q2aSDp9dXaaDSHg/N7v46VV8COI/YARr321zqUcGll9Lm99owWP7hRTmIsbwEZ07j7GigfcxJU
 iJmSIZb5AmMc/Zxeb3Pv/Co5sZkVYAXGW0QZ0EjJSq6MKVvSnrcYbMBmWfeQq+SxVKu12hohw3S
 Ma+E016aNbWeszUm4ARSnl5ROMr7wuTh11gHPCkywYPL+SeEZTH6yIidruIIvKAzT3xNkyi+2Km
 Av+o0BM5X15ybqsDxrYBc2NCV/S3jTiwYsvAc+r6w1oKrsL2MLyx7aR7UtFBoLFNp2k4064qkph
 CXjVwTSSeEwOtScFSJ+/6cXaCi3Q1sUovSjY97iIO+2Ydc6RFIBO/PHu9hSoOPmCQoAXi8U8bux
 LbOj5E/2n4xp3BXmR9rnJf7hnCdz+H2CcXSjg51kv7U/x1vdY59Y3Wa25Bj+vqqy9gouZvjlf4x
 gOC4a5n99OoMRbsE1qw==
X-Authority-Analysis: v=2.4 cv=TNV1jVla c=1 sm=1 tr=0 ts=6a51bed1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KhpSxh-dhdghoZIDTE8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzNCBTYWx0ZWRfX5oGhC8WWQ5BZ
 7fp+5vHB83z9iFq7kEyUtuvks4/ZQLV8rKdYTb718JcW9PxJX5w1ecQKBMp9dEVmrPaoag+u1Fr
 pLfDQ0HPB45okbDBmxI+vXt+TycJB30=
X-Proofpoint-GUID: gIuhFVvZXYp_psX4xSHqQBRFej-7bYpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110034


On 11-06-2026 10:27 pm, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 09:31:06PM +0530, Vishnu Santhosh wrote:
>> On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
>>> On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
>>>> +	bam_dmux: bam-dmux {
>>>> +		compatible = "qcom,bam-dmux";
>>>> +
>>>> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>>>> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
>>>> +		interrupt-names = "pc",
>>>> +				  "pc-ack";
>>>> +
>>>> +		qcom,smem-states = <&apps_smsm 1>,
>>>> +				   <&apps_smsm 11>;
>>>> +		qcom,smem-state-names = "pc",
>>>> +					"pc-ack";
>>>> +
>>>> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>>>> +		dma-names = "tx", "rx";
>>>> +	};
>>> This should be a child node of the modem remoteproc. See msm8916.dtsi
>>> for example.
>> Thanks for the context! We actually referenced msm8916.dtsi during bring-up
>> and initially placed bam-dmux as a
>> remoteproc child. We then hit the issue that the driver was not probing at
>> all. After some digging, we realized
>> that qcom_q6v5_mss.c (used by msm8916) explicitly calls
>> of_platform_device_create() for its qcom,bam-dmux child,
>> but qcom_q6v5_pas.c which Shikra uses has no such logic, so the platform
>> device was never created.
>>
>> There was a prior attempt to fix this generically by adding
>> of_platform_populate() to qcom_q6v5.c
>> (https://lore.kernel.org/all/20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com/),
>> but it was blocked
>> because GLINK/SMD edge child nodes would also get spurious platform devices
>> registered for them.
>> That series remains unresolved at v1.
>>
>> Since your driver already manages modem lifecycle independently via SMSM
>> state bits without remoteproc dependency,
>> we moved it to the root level where of_platform_populate() picks it up at
>> boot, and everything worked.
>>
>> Would love to get your suggestion on whether this approach is welcomed,
>> since it needs zero driver changes.
>>
> Adding the bam-dmux node top-level makes it impossible for userspace to
> associate it with a remoteproc (for this purpose: the "modem"). If you
> add it below the remoteproc the udev/sysfs path will include the
> remoteproc and you can tell that the network interfaces exposed by
> bam_dmux belong to that remoteproc.
>
> As you noticed, having a generic of_platform_populate() for remoteproc
> nodes is problematic, because usually subnodes are remoteproc subdevs.
> Also, the cooling device use case in the thread you linked doesn't have
> any resources attached, so the root complaint there was that you don't
> need a separate subnode at all.
>
> I would just replicate the special qcom,bam-dmux logic inside
> qcom_q6v5_pas.c. I think the motivation for BAM-DMUX explained in commit
> 59983c74fc42 ("remoteproc: qcom_q6v5_mss: Create platform device for
> BAM-DMUX") is still valid. Conceptually, BAM-DMUX is a subdevice of the
> modem remoteproc, since the remoteproc is responsible for powering the
> BAM-DMUX hardware on and off. The fact that BAM-DMUX is not a remoteproc
> subdev in Linux is more an implementation detail of the current Linux
> driver. This is independent from the model in the device tree.
>
> Thanks,
> Stephan

Thanks for the guidance. This makes sense. I'm preparing an update to
incorporate the DT changes and replicate the BAM-DMUX platform device
creation logic in qcom_q6v5_pas.c as suggested.

Thanks,
Vishnu


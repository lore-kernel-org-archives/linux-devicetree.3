Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0841E6D9
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205389; cv=none; b=StAK73MS3E+T1Yk15iHRh1/YxYaCbs8M0gVHMqk0cyYhnACSZVVV4zXnVEkzrTDohjBkqFH7dbeYatog+Xtf9BiCqfdv7evkMZqL9LlvoVGKpdoFCg5lmKMJtpUx6ri8nCJYt0dnVMhUhbyYnllEzqAxhdl+aKUiHCFK9pYu+Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205389; c=relaxed/simple;
	bh=hxWWKhI0tQTive2CFXJWMVvPXF4+6eRYQnDoaeGQjBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLb5Dblkrg5na/Bpn67jYJLJl7DttmXOEf1iKAKyEgRruKSoO2WnvANxyGeUQBH/ACmPIQjoPsJ3nCE9Y+V4dDBPKRQXPPoZEMiaLzFRNNeUNEB7uEYHNYHurqgrIXzeW1qiOdUDcyS2IqTCE9E2Gl3uE+ValwIVKRUGvM1urgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaGspmQt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=claUjCIB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaGspmQt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="claUjCIB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiKfk2678169
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqnCjoNOPvKjqbzSrJmJZF6GvgPuzdQC5JrhOmYheMM=; b=BaGspmQtjl4kSv6I
	q8bSLcrNH3Wnci4mYrNw/UXswFYnXxLRLUrqTCIZ9Euifri1kT8TVIiSqRXlgPAv
	Egkx8Zdf2h9hD4K5dZCpJlFM1DBeEDfvGcPSEfzdR8i74bO3+JnI4alN1OV01U5o
	KqASZZbbEWuJtjZL7DaM3UOEGnVEdMn4t6Icuiy6hD4rwoPllwGPvbMnOY8QjUOA
	GAtQyVT6aCsJmSFUvsdE+WxL0gq6Mg3aZIBxAIPcGtZy4M0OUuqMYbTdxZrs2N4o
	hmKPsu3ygyz1wUg13h4GaE83+kig5bv1QgBL7IbLwjpfYL/z78zaXC0cklK/zlPP
	NCiz0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1rvgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:36:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so5130090a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205385; x=1784810185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqnCjoNOPvKjqbzSrJmJZF6GvgPuzdQC5JrhOmYheMM=;
        b=claUjCIBH+DusXUNZx/2rm0mZZrYcG74l4Aig3nNYz/GIM6ZI3MNZuqWBsgJ4HXzNn
         EVZ4EM9+ilUIYC8NeYo6pALGr7Z0AmMmbFKNU/gQv6LuwAFzquQo4rwa8gwcKz5+XePd
         s/GcGbcE3KsKS84Vw/uvlNd6Ow1O5CnSx04VZC/7hIIOaQ9VXsu6SgSGHMOxuxZH+0hT
         qqSof1NQX5RYJFUJ9+IlLetAW8DniD76wVFxplV+Ux9CFvZKESouIAHDSbBffeyQnsqc
         sur6YXUavhC5iUJOBLPavqTv8p7tW316D5oMC2k0dpHjKiB2kozEcw9woCmeAN3MXi3G
         cZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205385; x=1784810185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqnCjoNOPvKjqbzSrJmJZF6GvgPuzdQC5JrhOmYheMM=;
        b=SBv1rmd6TT40N7Kt81WtwjUMd3J9oc+IXUBLxOFHxJwv49AqAQVVOJjji+yt5aX7AS
         lPDJ/UoRfdM7FTxxXezBEn7JAwCRykszsTlgws7MI3ErDPWS1tLSZQ8zk4CSxDO++yGV
         O4KEqa9IHB4C+ifz33mRkBSd4rvbAMJJf79EyszBaWcHih84tjtD31XcetA94Glxo083
         yidRp/2UW8ko+fG4zN6jyHqKvvRBOmoFq2NS4WC71lr0bEs/HkD5/UPwoZF7lQlJdCop
         3lGeImfqauYk8Wg/FeawXnEdbB7I4BiW6ZIRUHm7UA2zW+9CxlYfKnP6rKzWkAtVbJTB
         +AHw==
X-Forwarded-Encrypted: i=1; AHgh+RrfnPRdLCisJW5bQNt+pf0Z0h2d60fjrPnIqo6Dm/9xrRULoA1is4qZQ7Q+SweT7fJwLAwATXDsBw/K@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+/DpxBU2ZbX5RadpjWsNEaRrYeeYCtau6eWkflqA1RaFcsj+
	yDn8pWqiMlrIVuYBOT7XZxRcPBx72HaHxMfaPPYQNoXDiRKKseqy3dU8WfwsHbc2n+9w2wTeedH
	CWCXWHIwd2K8Oq66QIPHWWgxDQokG6x3fWqceyaiSo1SxYxHFAzDaMp0DCpzqGOkA
X-Gm-Gg: AfdE7cnp/INgsQW1yfdJLRNCyLAZzXQqr51CwSTyP2UA3waKg1cUXlSA7x1RddMGjc1
	47e6TUlyu8KSI1AOc8GtgPQeDIJe2ch9THcXcqlrA8igyaUkI1pO8//c4oSt5hbCBxGUVmxp+j8
	nSMpubAGFSFdelvJx47u2nB7aleyXiLj5lUTQheFTX2+HzoQQgzRAQRp1CBOcX5JDuvt6eDERGW
	Ui0mVrflfC9ZrwLh+PjpucibyWlBF9o2UPHh5K7D+TUjGKtVaeu2/KQd1D12aGv0M/nnRG3Hu/3
	uJ3Tf+Hve8R4+b0cftRAsl733s+q2/ItZo1HKpXIYej6at1l74vRTox+bN3LAyGAlqAaknKR/U/
	eScDKYd7Xz+lnyJgYt1T2ilwv9X55AjWm4w==
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr22835900637.20.1784205385608;
        Thu, 16 Jul 2026 05:36:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr22835849637.20.1784205385064;
        Thu, 16 Jul 2026 05:36:25 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4359166sm10674250c88.14.2026.07.16.05.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 05:36:22 -0700 (PDT)
Message-ID: <2ac2cdcb-f671-4f7a-83c3-bb05fcf4259f@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:05:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs for
 multi-owner I2C transfers
To: Bartosz Golaszewski <brgl@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linmq006@gmail.com,
        quic_jseerapu@quicinc.com, zhengxingda@iscas.ac.cn, kees@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
References: <20260708051023.2872304-1-mukesh.savaliya@oss.qualcomm.com>
 <20260708051023.2872304-3-mukesh.savaliya@oss.qualcomm.com>
 <aleoVNavBOrF9r7O@vaman>
 <CAMRc=Mc_4TZ6QjUgQmLehBb_6f90bamYFhE5S_6m-Poem0-u1Q@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc_4TZ6QjUgQmLehBb_6f90bamYFhE5S_6m-Poem0-u1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX++/ouhfr7jS2
 KHZ0CVqU5GX8RXEvonpcdDA19JXgb+NBlF8+PEQTdTCofsWmoAUi8XmUhKtbf1MQ4jk1s8dGtrS
 DVi8PBV43mXHEO2o7V6ZSIowBZeGtbHJGuhSBCscINQadCxZJ7NDm5B7DbX/EnT/UI8MDAoRyYg
 XGwOGU6mnXGAFw0FhnfFVNC17f/dMEUoR0K7F1/wkJHeQMfio34UJTTaWNzr6BL5FBM5LGAKcVN
 WjRiOrS1D1Phj9VKxju67ty6yyu8lWk80gYHh6KJnTOXj8n/kDx95Qcdp7Ii6GKo0gOdsaQBV2g
 DMYRRaUCdgjWDrAHRr2FbCbEQiL7fsU1UmyTany1oAdNGS9TpFvytA3NTGrRS9u+S2SwpzP9O/P
 lnSMSA8vtjb24H9vLj/fnRY77gImkvmnYNn9+963dpI5SLUV6LGiGg0ZCb+3/+XGAys3rGgIs4W
 SQfTtzgbzUGaVN/gFLw==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58d04a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=OlrBKP18NtReKxGUJ9moaA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=FuXMeDijB7eqQmb0U5IA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: l71hwx6dOXguo7NPy6xrHWT_Qi7LQ94s
X-Proofpoint-ORIG-GUID: l71hwx6dOXguo7NPy6xrHWT_Qi7LQ94s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX87Qd3eoZTNVc
 N0+JmxOAY3YppSgS+e5Nj0g4348IvwSYH9HT9enENJwaBdpVsoshSIxD4YQtZzTiDpj8K2TwkrM
 Xb2QoIJMdb7K1Pu37qqQ3jbs8nwxo30=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160129



On 7/16/2026 5:39 PM, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 17:33:40 +0200, Vinod Koul <vkoul@kernel.org> said:
>> On 08-07-26, 10:40, Mukesh Kumar Savaliya wrote:
>>
>>> +/**
>>> + * enum gpi_lock_action - request lock/unlock TRE sequencing
>>> + * @GPI_LOCK_NONE: No lock/unlock TRE requested for this transfer
>>> + * @GPI_LOCK_ACQUIRE: Emit a lock TRE before the transfer
>>> + * @GPI_LOCK_RELEASE: Emit an unlock TRE after the transfer
>>> + *
>>> + * Used by protocol drivers for multi-owner controller setups (e.g. when
>>> + * DeviceTree indicates the controller is shared via qcom,qup-multi-owner).
>>> + */
>>> +enum gpi_lock_action {
>>> +	GPI_LOCK_NONE = 0,
>>> +	GPI_LOCK_ACQUIRE,
>>> +	GPI_LOCK_RELEASE,
>>
>> Can qualcomm people please align on LOCK/UNLOCK interface? This is
>> second interface I am seeing now. Can you folks align internally on how
>> clients should communicating lock/unlock across different qualcomm
>> dmaengine drivers
>>
> 

Sure Vinod,Thanks for your review and updating on direction.
I thought reverse to not pass transfer index to GSI driver.


> As discussed internally - this driver should follow the pattern we established
> for BAM DMA where we don't require consumers to be aware of the locking
> happening to any larger degree than is absolutely required (for instance:
> passing the address of the appropriate scratchpad register as is the case for
> BAM DMA).
> 
Yes, Bartosz, i understand. let me align on this and follow BAM DMA 
design, will review with you OR get BAM DMA changes.

If Consumers do not posses knowledge of locking/unlocking, DMA engine 
(here GSI) need to have some decision making knowledge. e.g. First 
transfer and last transfer.

let me share with you and then will upload.


> Bart


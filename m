Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ADB3DC4AB
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814621; cv=none; b=MfBWn73afU5AFp1430j5HaNhqbfwFVgCbGGLilh4J7/sTEfw/WoAqRFIn/zYOS11rVgNf8tZwRXfle4DsGSs7IIbWqsytZ2gP920LlNvY3jlHX39t1NDTY7PJ88PDpLRrnXvKxYj2gyv51Pq3ZCwlaLNXOoT4g6Uzrxd2mDstf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814621; c=relaxed/simple;
	bh=YRaBNeIx1S/4sMMF51JnkA2gzTr0OUpXrPHghea7WKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8vayHjHxT+KpogZTlv22WMlcVSqRUzOXoeV/SfuEuepL+AWsXc8r87YkuF9ixDhqoSpfzsV4tLl7c3uJ4xnqDLY8iB3vU72Xmk9JNKMgsuuBhFJgQ7zpz9AuOjuz4F5cyErQ+SL5To4vqubhXoMqry3FDKFB3d6uxEosWEZi20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcRxipyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4QrWJcF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcRxipyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4QrWJcF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvhQe020986
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ECqDrk9Ki/l5BO5SGlWB2epP7rUNWX9qLljGoW4b7Sg=; b=kcRxipydZ41l/UXk
	iKDx/YswFM3h7HLExJuob0Enct7QQetHCjDw3RKwRJiwM9dAtgNlkpNMa12GBwQs
	xc4bgWziyxnL6fYQpvqpGjkhsxoFbLsXHSXQ0pLqVvkg/TwQDT8rufo/ZuH96S5I
	9V78TIxyPTv3PGt7ntTSTaPfPp6sKofmlEWMSWzRB0JAtZ24SY2uatYvdhw2nhR2
	61s2cczU6oltKxJ5nMoGNXtWXeUfnW8JBFSdCeQrRhYO0FAMBn3DBueNca6Keyjj
	d/l99PqK0jpP9YwjjcYgU6StBNi2EoLUi62bvwLvAiy2a5dpD6q9zdR0shQ7paqL
	gjL8tA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7kbau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:50:19 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9f565a6e7so924470a34.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784814619; x=1785419419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECqDrk9Ki/l5BO5SGlWB2epP7rUNWX9qLljGoW4b7Sg=;
        b=i4QrWJcFHY3Gx7THvUx0njz4s+JZe23pI64+7SmbtzfEw7jrTPBjXAnZUiUwnJMZHi
         U2E6d6Zc8mrLdbGtcLsIKNMqefUAKnvcMXKznX2p75DrV/QgOsft9mdkB2l/iNZ39zqb
         yxdtv1WPVN3zLRgU3W/BemQXiZeL67eds7m1PvCiPdaqctjnYkw3QlKJdix/TtYH+kFY
         n3kAdoc44zK3edvHUHu4T9XUltGW3q+lGnNMOZBDLCOCGNMy1uRFcE7zrQG3k25vNaM2
         cLQnwi0MZ7ZCkgPlRQR1ySCzSUYtKU8kMgei0443lKP2kQv1F3kMMZgYLzkxNEt+mddg
         4oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814619; x=1785419419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECqDrk9Ki/l5BO5SGlWB2epP7rUNWX9qLljGoW4b7Sg=;
        b=VeLuR7LJITeyU8KDjfEekqZ4fYNvsGC03HggCerU3va0BNCjTpUI36/9EhfmbGIAfN
         mBviF8F8fdRrkQocxdUhpyig27he1MFo60c9MsAHJoHAIjSHcOfN25SW2XmIZH6ENwRs
         j7ZNgXohBgUpgJ/gUB9NUYlmqajy+pHFRVIJuMQa8hmS1nfC8KXbqlUIV8IWNzqPTni/
         MoDQDMme9MOFkMpl7hpO7FMvvmfSokk4dfmLY0mRLdbMd841rk8hc9Ku5iJgURPiK8I6
         5e3JKzfjvgSo9NR0dDVtQitagnIRFBZFnC8yF9iRZD4tZGWJsP+4OQMmHKXqBKd1dgld
         GLLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ+1GHsU1U2uC8rL5xqtH5GDNpsxBL61OefeKC66fmNqGzzWKxm/FcZZPqb5xt3NtlaeLK3B9IHy3d@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWXdSzYHlRDtT6iNAkzjkfbL005lpWdJmFQ8ad9LC7fBw6mHI
	6RWX19Yan8ns+uhKOpqrU2+E9ND9SgQibpguayDQUi1QiY7FWEyN3gCd/InOwn/SachKMMGQHtQ
	Myx2eZOpEKbB6Yamc+iXFh518BOFsCT874bnTn9ikpB0GTrLKBkbTooXtEcWB0rS1
X-Gm-Gg: AR+sD10SAlWdS3BSm8AGJojNjSfjUiDzh5Br4l8cl0rF9qF2OCP4rZTJ8gBIbe3aj/8
	p0hGroprDvAjX/yrYZKXflzjxq3NH9nwVNaPuw8G4kNEdlIO+/M3FeCd10KXDt30AQI3HMknUZ5
	AGe3G74otOXXP5JJHe2eeBB3BQIz5ienTKL5QfV+OlxomqzppzS6dCIDnqUMW9TeQE80aOiFahs
	tp3CSnSRfhicSFFJUR6iAcU/7Dt1SWkAxWcoaQIpqqTTIuHgFsn+10Vl79wC4jP47zy23yyyMie
	6ZwWyIw1MVOtYETqWiPkpEI1lIbWAV+xbez53LOXq0zmAGGBjD3fa2uOQoYreimvB+A+02Ns0bz
	b6+NxeM46N/MhAFTRBcAIcizpeT9pOtcL
X-Received: by 2002:a05:6830:440e:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7ee43a44c0fmr2086608a34.3.1784814619074;
        Thu, 23 Jul 2026 06:50:19 -0700 (PDT)
X-Received: by 2002:a05:6830:440e:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7ee43a44c0fmr2086590a34.3.1784814618677;
        Thu, 23 Jul 2026 06:50:18 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.235.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29db0d23sm3427753a34.1.2026.07.23.06.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:50:18 -0700 (PDT)
Message-ID: <5fa8ca93-e0b2-458c-8bb0-fb34450d2487@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:20:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
 <20260721064826.903A91F000E9@smtp.kernel.org>
 <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
 <6xxh5ttpbkfeuqh2uahxtdls6mj2b5pxosfzcmm4grbrujzfms@prxjeh2l2tqv>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <6xxh5ttpbkfeuqh2uahxtdls6mj2b5pxosfzcmm4grbrujzfms@prxjeh2l2tqv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y73J1shLSBqFz1f8l60Yds3twsW4ByrY
X-Proofpoint-ORIG-GUID: Y73J1shLSBqFz1f8l60Yds3twsW4ByrY
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a621c1c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=/HV6WY1oXUpe+KOgORLkYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=793AhHw_EzWDBmsHl04A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzNiBTYWx0ZWRfXzaD8Wa6ejhmq
 zHTwD2tIBvHz/MX/UI8QE6ZzAwfX8IBuKFdcDIWn1mECSlOQnTE0EP6DRG2v5Iv+HOzls8KYvKj
 JF9H5UB9nQB28ZwmqX4xoIIKr9NzEoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzNiBTYWx0ZWRfX7McxIfxocEIs
 oacSOZQvr5EvUXBwfsAl9IEfk0NkeZ70RXmLH6RQimH8DCuejk+BpA4Cbl6WGihnID8ieUR9V3l
 v/1clBWcCWNNrSihSjrxiTxyGBiO0czb8xyNo7CSh4uw7RALBpHTuaLGxpn4fthOVRPklNNPCcR
 mA7av9hETr63NnGCA5F7WvcXA01wG6UoRVRDkrHSdDZg70fmjPm7luETaS60QBaBVuOyEr887BF
 ef1gySeCdG0KhZ1TRsq0a7d/Ioxt5FjskC2C4q5QxM0DMh5KLFwb6enIto6CbLnq3g3IFQWiFMA
 XbzpjGY/1UupC3zoDnuaxhd/ORhC+9R8i8Qsv7o5U1z4ZsFkBpBDKmhkKh9FlNBq9eG2/ee3PmZ
 xBrkP1pqNJGmq7UT+1LFN1Bjqw/y+UuSiHr8hLl8sLYzxzwmkK1+uDUVE9+LoGU3AXwo8RcMxW0
 vnaPHYx+f0mXW041pog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230136



On 7/22/2026 7:03 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 06:55:23PM +0530, Gaurav Kohli wrote:
>>
>>
>> On 7/21/2026 12:18 PM, sashiko-bot@kernel.org wrote:
>>
>>> - [Medium] Improper dependencies prevent COMPILE_TEST coverage and force dependencies to become built-in.
>>
>> The COMPILE_TEST concern is not relevant here. This driver is
>> Qualcomm-specific and depends on ARCH_QCOM.
> 
> A general recommendation is to make drivers available for COMPILE_TEST.

thanks for the suggestion, let me check and update code part to fix this.

> 


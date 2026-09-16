Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F754F30FA
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565356; cv=none; b=oa348xzEFzlsS7v+6XX7cOrgP76kQALWoQ+HsVt2JvMflNG/3hBuLDScR6aUu+WqOk0b2ls0olqr7I9LtARnVOxucYD3nC9vinQ3xSAoVPHYzXQtrWbZo7VTNv6yxQaH4WtB5kCai7Dc3Q3oNArc8wfnm8V/yyz+d/QiHyM7wkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565356; c=relaxed/simple;
	bh=lZMhv/1UMsSAEOlknm0eGKyrChUwpn1CjmZ1uAtEfOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDQ8be4X9cZfYz6dSm6d616f9NzZwpQG3E31WXn9+3O4WR60Uu7tPTYQAWYbuesSTslKRnMirbY8TpyuNtmU/t4asUfn0+yvw8P2qC5pftQAQi0l2x+ZBwpNeEX4kwWd4z+631yLxqJ6348ENV2eYJJir0KBfvtHAQwdH3Ac3+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUc5q1YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9Lf8mKr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUc5q1YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9Lf8mKr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCZ59v2947438
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYhc4bt6SQUeiQ5/rh+oZK5hm9N3r5tHBdn4FT0eJhQ=; b=eUc5q1YK4NU0vGU1
	ZeJwCXIXjrmPPyuON3aXW7INlUBQuZjq2I3umJRW0AjOsEzn4IS4ZkYq9rTEMWCO
	hzT/DvEEv7jxnFEjzXyJYug8x8JdV6iYe+mGETb046jx5fFDQZnSyNZspAvVOR6C
	mM7nhtNrb3ohXQnDU0jjs159a1bOP9IhCr0gC+IBFRNbjWaS3xsc+V2hR0HlkwVu
	mQliJieog3v1WJzLyIzId03mIjxYqP9mszVJH5e7IIBcE5pzMTZGpQamc91o9TLC
	DhS6drv7xlvuFbbZkZ6ICZzN/5GZr90oKAuVjLR5QTnrCXkGtqVL+dZwDLWoJQwD
	/C+JCw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcktk08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:29:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8633c0d7353so7363025b3a.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565352; x=1790170152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYhc4bt6SQUeiQ5/rh+oZK5hm9N3r5tHBdn4FT0eJhQ=;
        b=B9Lf8mKr8FdYq7Pl9Y1wH1ieF5UildDKD6OXpWWcxQxJG6sQ3vXtSkr5BM8krcmWsw
         Y1WBUwOk91yqWvv4Jqh9ATJIoB1dGAeJdzQMGCpxGVMC9TWv416e/F181Wad4Qya2NtV
         yR/vcYi0yn3lSLwYcSMjB4zubnqzD9gDMAMgFLuJRACNUopwD+GK85/llrdo/p71xXfo
         1Vti+UFxwE9itm5tj7c8jhfNFPgT5wxqCXlQ2KphYm/sZGZS7V5qaeqBi03jFyHkL2Ou
         MCT5BZWoKdVYxSGCTHEl0IzJRS1Psqif7k8JUrvLQQ2ZcSWhHJ+30Tx98tHxcOdFoOIG
         qU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565352; x=1790170152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYhc4bt6SQUeiQ5/rh+oZK5hm9N3r5tHBdn4FT0eJhQ=;
        b=OfqMQMDirjADiftsM4VI24ouhCyhfEUoGvGkt6SvAVN5P235twBcAgYKNncmJeDYPg
         el0caWkYVPvk9ng+evdI2VeEEc7RwyA1HAyfZMJKq+ZaTXjXZrOcwGRCYbWhYWu7eoMR
         AtJxZ8YMYcYeHGTSu6+k4w4od8XDvUGPy6FRxAJW7sApAMO5RMS3R7HBU8eWP6dK/L8W
         z4zPi4YqQJig+z7jFJ0nCfla5uiBSrPuCk28+oBgPv0EOtIlsRYeIeWcDmNAuX4FfsT0
         A9lX9TlOPDCh1r5ul1W2InbpW1sJDXXZN+Ggg7nUNOp4AK5jaIGm0KrTSUo6Z667q9fQ
         4OtA==
X-Forwarded-Encrypted: i=1; AKwUvBxVJAAi1yvuF5MrUkM7cznzevyWFdBkXlrhkvGtM8431+5tB+IUAVD+mJLaSRHI6LvepzfFm8Z2ylud@vger.kernel.org
X-Gm-Message-State: AFuF++n4XeDZAdLev01UCTTK4AKAl/Yf7YS4X3AQQaVlSU6Ocmqli1qn
	1pZhvWUwhkyJ30iskTWWUy5Ou1qrIpBXHHHFQbQSgIebW0iGJDbTCvWLbDna0WjM+lBFj3C2/df
	nrgaXXinipVY+uVaoAMEOXn9fBiIRN+BaASq7XklM9DCZCvjK2mo5Y15H6ojbE38V
X-Gm-Gg: AYBFou2OazJyymzI4t4yzIAv3lRTnQ8k9cC16apF/foH39O+qyE+UPO4VZ/JUJjLt7J
	Pkd86YI4/59KfhFlyrWbrPXlgU6iXxS1uZzhthwBQKNdRlvFDDhye/WlSzUKqw1jZyT2mMfN4DY
	XYOR1wYDx7yrIBhwvlHUX399EVy0VzUArPIvXNr8kkLhevlJ20R64lhJ1VazdJdxCq0npxb9tNi
	DG7vloqj2nfe9AGAxvL2EunyDyYsbsjnTsLUVJ5GQSx/vlS49+TUiT080PYCpK4YEk0aAeSD8OJ
	4JIsn+3XHBEZwVgxYFz9ry0eqTKmRSCjgIAwD3BXkt60qosd/CNj1v4RJfMlBACQHpW9tSvWLeI
	foYenNTsgIq+//owTpSBsTBnibD9LcQ==
X-Received: by 2002:a05:6a00:300c:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-872372c3f18mr5682844b3a.4.1789565352213;
        Wed, 16 Sep 2026 06:29:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:300c:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-872372c3f18mr5682762b3a.4.1789565351660;
        Wed, 16 Sep 2026 06:29:11 -0700 (PDT)
Received: from [10.218.42.71] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720172f6ebsm1257665b3a.34.2026.09.16.06.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:29:11 -0700 (PDT)
Message-ID: <f6ce9952-7adb-4b35-b38c-57bc0a1e86a2@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 18:59:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for
 power-loss resume
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
 <fd9f1fac-e4e7-453e-a830-a32e8be2f965@oss.qualcomm.com>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <fd9f1fac-e4e7-453e-a830-a32e8be2f965@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX7YRtq/4Q3jva
 N1DuDsBWqean1LrT38wBPqedLHQOkcdIppiGUQg4czjYJDW/GY29r+xTrhM4ymX23edBxG5kcf4
 v6jU/Se3tUqWWaEqDU1Px0QPD8MrGYc=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa99a9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LCT2LdTvhbkjfN9emvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: fsE3gkT4-tbyYcKbDkc9hKHJP8_4_eII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX1I+U0UTIWqoc
 p75sxzcy9KEjG3klGAxXQzkrc9VwyKdYWBEJEYnDYCaeTVObLgAk+rDUgRtdFxgReOdis9dXk19
 JyFdGFbLttLqHq6jkFZYuSwjnUHRPIZ+I855BBoSCrU84FGXj0rQUCHKUsNHfoKGU9paJ0wPsNK
 InhlMmZz9xjHQGJNpdDEj2Vq9p7MsepHieKzaeAq2C3L4ydSPgYkhQwXAehtfpOUHVfOrC5qzuw
 MiiAgqanIrBQy2fe/f1x5EzKxiS85EFiD4OxlMiFymM0NIPqnYc0zr5cwQASb/7Uu54jKxQgqpB
 Sx9PKxgID0+1VZfaeyEndmNo0pO/0qcyDfvp3ETw593iMhyG6zE5k9b5X8/SfGOcDN5dRML1hEM
 Tnq6xZkbsExE5uI8lvKjiqZSpk839X68BOCe1L+WaYI6eSXYLs4cgWiZs4QAbOYe8/uTqi76+t4
 JbCk9mCYMBuHm/uAL+w==
X-Proofpoint-GUID: fsE3gkT4-tbyYcKbDkc9hKHJP8_4_eII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160181


On 04-09-2026 11:39 am, Krishna Kurapati wrote:
>
>
> On 9/3/2026 9:08 PM, Faisal Hassan wrote:
>> On platforms where the USB controller loses power during system
>> suspend, like SA8255P, resume triggers a Host Controller Error
>> requiring full reinitialization.
>>
>> The xhci driver supports XHCI_RESET_ON_RESUME to handle this,
>> but dwc3 previously lacked platform-specific quirk configuration.
>> Add a device property "xhci-reset-on-resume" that enables this
>> quirk for controllers needing complete reinitialization after
>> power loss during suspend.
>>
>> Let dwc3 manage the quirk for the usb controller using
>> software properties.
>>
>> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/core.c | 4 ++++
>>   drivers/usb/dwc3/core.h | 5 +++++
>>   drivers/usb/dwc3/host.c | 5 ++++-
>>   3 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..eb6ffd5148a7 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1712,6 +1712,10 @@ static void 
>> dwc3_get_software_properties(struct dwc3 *dwc,
>>                              &gsbuscfg0_reqinfo);
>>           if (!ret)
>>               dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
>> +
>> +        if (!dwc->xhci_reset_on_resume &&
>> +            device_property_read_bool(tmpdev, "xhci-reset-on-resume"))
>> +            dwc->xhci_reset_on_resume = true;
>>       }
>
> xHCI plat does look for properties in xhci device node as well as the 
> ones above it in the parent chain:
>
> "
>     /* Iterate over all parent nodes for finding quirks */
>     for (tmpdev = &pdev->dev; tmpdev; tmpdev = tmpdev->parent) {
> "
>
> So adding device_add_software_node in dwc3_qcom must be sufficient.
>
> Regards,
> Krishna,


Good catch, you're right. Since xhci-plat already walks the parent
chain, there's no need to round-trip this through dwc3 core. I'm
dropping this patch and attaching the software node on dwc3-qcom's own
device instead, in the "Support broken suspend for SA8255P" patch later
in the series.

Thanks,
Faisal


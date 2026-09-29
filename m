Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745F2765E2
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722097; cv=none; b=NTIq62iqQFEoejHE4yrAIk5s/EvOvuz+gFGntN8BiUEdbH9RwUWCyrECKWaHckHv8ojJLz9W3zUe2jo19GyLHxn7PoWyhVAsLSxwpOHUrKZ+3IPr5FNBS11ri5fJLHzuxs2mxNQwh5BJm62qcGCuq+3rRQcbeMRlewhCMya7yLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722097; c=relaxed/simple;
	bh=2nsM+8CzPjQSlHsMUzl7bJcOPI4Cya9YI3+lC6qwK5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRYtfJIQlrYE1bHoq315z9u5xZLHYdxjMJfqXC0gH0kHVcymEgcxu5k/CiPAN+0YwBqSzSYDaURbIR8eSHwdDcamjRIqJ6R2LTX7oq/Mg0UGCqHW+rAu/3bV536Zbl7pV17wGfAuTvXlZYoAe6/VsZrNuz2jGqfSVm7xuMpvRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSQKWN6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijeYyS9J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSQKWN6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijeYyS9J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TKZuYI708269
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UR1zL2vU8Q3sKeWdjvv6ON/jEipqUzCujxlK2hNPlQ=; b=bSQKWN6nD/c7k1x9
	Y0Cicwh8WoY8IGSQ3hLIQW/pLlbNJrUuamCC1yNbOkA60ht7pgONnaoaNEm9pEwG
	88COjMIvqx4hVfey5U+vTd8Lm29MkXMfvfXPmgb99dGyO5Dg22jDm0Tp2FWdES7v
	ZLwX/XnoFotTeJIupR/yvGJyd4YrAEYug2DXZFRr3HIuHrGBMc0UCx8BsGXxMbmG
	LIGZSYCl9WxdpwgDr7bH3De64d84YXgFbmQmtDspowM5ZwzM+HQVYB1E2vgRJszH
	srXnPY3bgYKmTGPSIk7RyDXSsohX5Zn6YfVu1ASOKa7QLvo6sg2xtrQUk9F99YdQ
	82Lqqg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0g1kst4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:48:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso1642317eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790722093; x=1791326893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UR1zL2vU8Q3sKeWdjvv6ON/jEipqUzCujxlK2hNPlQ=;
        b=ijeYyS9Jpc3TFx5ihmaBrLHyayX5O9MqU4c9rDJ12y1Yy8Oig65VUE39A5EFTlXQ0L
         TRinZ3cBQC8XOvHO9dvt+s+iW8p+rr3XTwATmL4DILzHH7/h0jz6+GAYXtKqQ4rQj1ST
         RCFSL34vjwmTPjsiUUXWMMV2MU0B46jQ5Jdf2zCARTlGwciMWpMJRH5OK+cSfe5RHhd2
         kzF27A9H6D5B7Ha0Idw+hjWoYvd/8sy0Eslg9pATuX9HYJetnv/2Bxurlu/P8fw6S8Ol
         ecSUwY0YZgHai5dKpSiGrQFGJ0Y19SyCw7D5+RZikmkkThBtueD2LhEHqVtCkjzj/cJL
         rp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722093; x=1791326893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UR1zL2vU8Q3sKeWdjvv6ON/jEipqUzCujxlK2hNPlQ=;
        b=eVGzaSl6JgmPV/HsFvvO90QlGDK43ckdikluVzLmjt/Lc3ama+LVrf5ef8a9rqaQpb
         7qzNUM8LR+ctDUsKa+FT3dkHa/bC+32Fzx3p+hazooP6nov0lnTDE7muoqV+nCmosITk
         czXy9CfYr8+K7+plXU+782XKmC+Gx0XWdMPc0qC1xAnpDO09xN047K+Ssz0ERUsc2wfO
         1GCnpzOSg27un1K736hd2tJ8vEJCS2jb47SQES2A946AR2SWWKo2e7PB1t7GPaU5s+iy
         C9WtX7paWDIjUgcLGqfCXthQXdVNoaiSA7W1ToAq3qdpajBZ2MI5kFyx3Ltp4eIIIy1q
         o5yA==
X-Forwarded-Encrypted: i=1; AKwUvBz8rh2om0eKcKaee2DWdAkr9wM7Qq8GkRUSRFBdtF9UXDRDOMFTz7lNJs++PYoYQnP24nu6xGhlXLh1@vger.kernel.org
X-Gm-Message-State: AFuF++no0PR8A3BmrUTZj23nstCBWNNRDzJ/rQRch393UINJjUcf46yZ
	nz0LYaxmERrnzyxT+JImwdzNto/htrUvfPdBZjb13lTUwL3VK9cGxNi7zyFDgQKQPKQbp9qwBA/
	J6ZPZCYx9skNFvE9g6eyEcNm7tdZPmY4TwNgdCLNwjLUtY6XhYnxCdJBOH0X/jEnGN0TWS4+5
X-Gm-Gg: AYBFou2lQz4zasMXOcEPTBqtjC0ALe0nEOUjQ8WvZOtVl7SdyMIYddT20Xpe4HNzQbZ
	vWDyi9pH5VrDJz4r8Fu42Zr4nqrY4BHwYtSfOn9gC4PrDzzWksAy9eOpiWpE4nw8QcbcyaLPman
	ucXmreIqk4u2c4iBIyfTkiQ58Mrd8ymlqWhVayR8BY7bF103IPsz0l7m/Lp+GH/oWQa4uEbLf3j
	tbcunyqqZHeT12/ncVIQkvQ1M8G/ORNoc+HhCVOlYU7xIvFcCq7W0aYYeJeXjTM8NvJrd0S56Su
	VOPNNu01/yggorBKnpfAE8YgQO+DJoL7O2k9q2Rn6+a+BCEexfk8em2ti6Cpva9MKwr7XM6m4pC
	9HB/6dTKtWcvS6QUmveTJlNf/QwMQ3qlr0d/Dsrd0SrrIIhDZ8gJQD55p7A==
X-Received: by 2002:a05:7022:e26:b0:147:5261:ee2e with SMTP id a92af1059eb24-14c9e676ffemr1113876c88.21.1790722093318;
        Tue, 29 Sep 2026 15:48:13 -0700 (PDT)
X-Received: by 2002:a05:7022:e26:b0:147:5261:ee2e with SMTP id a92af1059eb24-14c9e676ffemr1113824c88.21.1790722092660;
        Tue, 29 Sep 2026 15:48:12 -0700 (PDT)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c634f07f5sm1941625c88.5.2026.09.29.15.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 15:48:12 -0700 (PDT)
Message-ID: <b450250d-43fe-41d2-8d7c-a13b48dd4104@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:48:11 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] usb: misc: qcom_eud: add role-based EUD control
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-7-elson.serrao@oss.qualcomm.com>
 <20260929214703.AC9BA1F00898@smtp.kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260929214703.AC9BA1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kRuTN7UEoSQsjy13bmPgFyskbLwb0QRr
X-Proofpoint-ORIG-GUID: kRuTN7UEoSQsjy13bmPgFyskbLwb0QRr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfX/ebR+SUv9PL8
 CxGLJArquWHJcuETd/uvRoO2cgCAC6VS3LU73X/yHljxylgHYUPtM13mOibNpF01QUkR7MhlWkP
 XDDjXbgIcmiflb/Y5baWncYLBJ0xIww=
X-Authority-Analysis: v=2.4 cv=Ysia1IYX c=1 sm=1 tr=0 ts=6abc402e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q0PxVykpitmLHNM3NV4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfX1/mgqQG6Eqh3
 fEDSNi2kD/356yrXM/XCdhRy97kYLKn9XyEVgowKFGwkbCG0AKVeKZJiAtzQ7iG7FcUj5f9vrAx
 zk9wpFm0JpHkGvZHAcRngZKy2VWyTSXaD+EnrT7uOTLjLb+gD/J59xl4XaB2ymH7bW4FZcxJpGM
 VMJ1d5U7sTITw9Ozc7x50mkWAGUVYQ3SNxs3Sx4ZxIWoNCYYsgnNcfiDFJWK7Fjy/o2FtAKBG5m
 FM/Tt3UpgwxTySXsFxxAUxgqLUoEUM06svgu8ZedZOurxmYVcXC4dmf28UJfGHtj2e4MwLBdDJq
 QLsO8E2XJGJ4bsc939BQhc9P22C160A3iwbmf5qTCoXRqQdEOI231moB+H0PzND20wp6/hbcT2r
 3YAw7l2MOJBMssPDkWKWyBBL/EurwxMgPjM3CWGMOVonse9u+BdczSQPgQM+4gGkwQdmAFeIvad
 8HCJJkmZKxH8EvQjsGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290090



On 9/29/2026 2:47 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] usb: qcom_eud: missing hardware and state rollback on role switch failure
> --
> 
> commit ac5ffb8b40f5366751bb4683118798fac6f6bb75
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add role-based EUD control
> 
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. This patch
> addresses this by treating EUD as usable only in device role, enabling or
> disabling it as the port enters or leaves device role.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index e227d05cfecd4..5a21a2dd0b0cd 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
> 
> [ ... ]
> 
>> @@ -306,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>>  static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)

[...]

>>  	/* curr_role tracks the role from EUD's point of view */
>>  	path->curr_role = role;
>>
>>  	/* Forward the role request to the USB controller */
>>  	ret = usb_role_switch_set_role(path->controller_sw, role);
>>  	if (ret) {
>>  		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
>>  			usb_role_string(role), path->num, ret);
>>  		return ret;
>>  	}
> 
> [Severity: High]
> Does this error path leave the hardware and state permanently desynchronized
> if the downstream controller switch fails?
> 
> If a role switch to USB_ROLE_DEVICE is requested, enable_eud() succeeds and
> path->curr_role is updated.  Then usb_role_switch_set_role() is called to
> forward the switch to the controller.
> 
> If this downstream switch fails and returns an error, the function returns
> early without reverting path->curr_role or powering down the EUD via
> disable_eud().
> 
> As noted in the commit message, enabling EUD in host role can cause the USB
> controller to misbehave. Could this sequence leave the EUD hardware enabled
> while the underlying USB controller remains in its previous role?
> 
This is intentional. As documented path->curr_role tracks the role requested
for the path, so EUD follows that request rather than the controller's
outcome. The host-role concern applies when the port is in host role.
Here device role was requested, so the link partner is a host, which is
exactly the setup EUD is meant for. Rolling back would not fix the controller,
which is already in an error state, and the failure is logged and returned.
Since EUD operates independently of the controller, keeping it enabled
also preserves debug access for investigating such a failure.

Thanks
Elson

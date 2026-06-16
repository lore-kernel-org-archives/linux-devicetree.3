Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2F837756E
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610537; cv=none; b=kxBFv+fK3bca5GRh0qcTS2D1fbtGRZtFUrvyFeduWDDt94vFkQd1zGKcylUz51pDrfsgROVOLO+6hfUzQyZlEpYhCSO/+R7xUtFZlW9KrsQt6z0TrnK2YUyq+eEpgcCPcnkT0v4wqzvPFwThMzWg63EyC8wZnhSwgRMmE68mzAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610537; c=relaxed/simple;
	bh=15xU58OlGIe6NZ7kZabf59KZZFo2tPxWCldlwPceBHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=md048C6ua7eHdW8IQTS1UnaYGXa7DWii0+BpTkA9f0/danb3UL+SGVkkdPtFXjTIZsYF2Grk1CVFYf9YoNVZDBUac1+yxZ5eZQ9wf6b5FqJ2Y0yEYevZiz9+k+0yYcaSl8HkzCMZT6BHUWr4MzaUWebXqzH9FNwGgEF8pZGYVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8eKmwdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfbQefSB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8eKmwdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfbQefSB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GBAFst3385788
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DT5yAnIAh8c6v+Wm2Kd7qlE74pTk+JCxmf+VxGo5m1U=; b=p8eKmwdGkgEl/7tx
	CfDzlfo+BytghnKd1Cuc5kjfqBWGdD5SMCPwz3J85v67L90fOXAqy9OKPoHAuFdI
	tKqg224Js2YhSaFxhQ5n+lyzlCe2jWYd7IdU85tigvY8xvmfO+/lEH9t0LvQlxis
	apisIuqsjOB82rixad2PAO9MKe2Z67nKhEvnMphw6Fb4sifojUmac/Yzr3T1a03G
	rjouMtaKb5/aNsTQH6vXD+FQ1MA8N0flD5rSaS4EttDxATxC4mXwlI82m57Fccvy
	Q9Y2YYuMVHAyyO21N7fSwmuEbE812FqgBFf1O4C0vy33q+NxOiv/C9iSKo7YoZxH
	G00R2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9jp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:48:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso24837085a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610534; x=1782215334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DT5yAnIAh8c6v+Wm2Kd7qlE74pTk+JCxmf+VxGo5m1U=;
        b=KfbQefSBRj9nDchFuL5y5Qf1wzTg6JG6eqOmZ+cybX7ancOhh/MsYlPBdezlvZUOjU
         gyqEckS8y91IuMPQClvfOTBBiw+Z03ndXfHwb20YQ5/wDIdspGHrXj6s+0y/0aob7mXs
         6MzeRSvHZI9UYdG9MO1IP4aIMn9OjivAyfJuwrYBKL2sW5YY5OtQZjgfoo64qRoA8BCK
         bEZOEiJqOjnWPBPJ1vwq5CIUWRPO6nzh3gin6R0KxPApbmL7MKeVJ/TFLSt8+MwTcKFc
         TKKIxpE1cwFccCIO7T66GF1pz03KJEU1HRs58yB6/neCzhRMJeGGWJN5SFdySxCsksPl
         nopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610534; x=1782215334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DT5yAnIAh8c6v+Wm2Kd7qlE74pTk+JCxmf+VxGo5m1U=;
        b=IcU92fkCkzSYDPiIeeystB4W0jM1M17CYWUNnk2VppksCyjTteizV3dDQedBRckvm2
         wRymnI4o/EiP55gJnArTVXBVbDcAcApWlPvQBj9OOQdWUndIDkZKVVUOGFWuWawXF3du
         r1H+GuEJDGdNMSg+K99kzoKULVJQjol5Gl73LPY8jrDy56N6/6fc7v2xT/Idjrjg+SOF
         PKJXOooiUCXeJzYyxjn8clsUYc9fV75PZLCIGtzi32mOyvavnl2Z6nx2DnjIv9xz40vb
         bvAzkTP9r3N9hnfN8HdU2BZKffnYB8n++m5E13HC9bYBpIoSAufsgTNnUANTnv/lXqJU
         DlaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uOZ3km6WDjUpVeptuxrM381WaQxkCZoT+eVbDfbG7PZnl6tumoxADU+xjI+t9bLLIZN+M9AmRhIig@vger.kernel.org
X-Gm-Message-State: AOJu0YyhHuyht+mFsHGYdkDaeoC1svcPsONWnTncROtUiRG2bPHub+QM
	zjP2gnK3SNl7GgZcniOxLFy2/5DIPEve1yutOfp10gCuB3UUaihawqBcxOm2zl4mQgIcb4Ppz70
	TZDrjRSZJNHs7A9PeHknRUHqIjQmcmXll2dTjtlXH64D8NmudZHsMk8RpLpDrGbj6
X-Gm-Gg: Acq92OGu+arsxmncjabZpt59nL1YaHfo/N+kJNwx8KH4aAIjB/B7JEVQdWalV5uNmNw
	dP2svfmUis689CYktSjqELi8Y/0XhkBghAUHHbo50utKyRGmI+ptNPOwFEk07k0xio/8uJKSOdj
	uG1/aqINCujBe7jo9PtLTKPBdcLSS+gQyQdAMeOKfsf7QpO5CkOR9OyzjAgMTXvhvIX2VJXgL6q
	3ffN8tDIQWEFZG4zLiYhoN7RVLp2RZkIaEH+1360PdtFMVbVBRFBanZog375RGCYWIabUByu2sd
	zWjX21GGGL/XhZWXXNtN5qGUIwkI1xHznhTF4IIQOQfNRrGQBN945FSK2Fu93x5oHTfD6vo3LkG
	gKrRl4vyJ44P2Ve3S7/OIYGx9REKVvBUZIwMJ3UmyBrVQCQ==
X-Received: by 2002:a05:620a:171f:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9161bace098mr1809785585a.2.1781610533807;
        Tue, 16 Jun 2026 04:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9161bace098mr1809782085a.2.1781610533341;
        Tue, 16 Jun 2026 04:48:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb442083esm637095066b.3.2026.06.16.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:48:52 -0700 (PDT)
Message-ID: <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:48:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX+9iauOCoMR37
 3f4Mn3enP/+V6ysvkCdV4mmCDPwiPUYkZUUoAYVve7cWZko2BPv6cjqvGzXa/5vn0vizpKGUNEY
 znyel6nqtmmr4/2mP3LbWw2xAb6Ku7I=
X-Proofpoint-GUID: sMp50Oz696zdl5mmxFdR7PrbCQf7dMXX
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a313826 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=tAkNNTVKMvv2VOvRsoYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sMp50Oz696zdl5mmxFdR7PrbCQf7dMXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX38uWWVnRiksC
 lxdChauIDNbnWFwW5lzDTfGMmepZNOSapEXtU9gVzN9TkXceKvBw1pu718yfebzSGVLKzy6RTMV
 w78irfTCl2WtWaAYLTxwB4HOxOzFZZ6XgHM7Z0TkzYJOw9ZUUGWM2z/M1Ijta8qR3kWD9EjNjJ7
 KxBDEHFBoqc8Pmc4mU3Il7PTd3FGxeOXGKuX8vKQRf6a3PDvwmcv+0v3kfhi5rqqACSp5Xtpyo2
 tio06valpV3qE+OD+dH0O568IlLkcVhT2ogFCcD87uqRGHFbyDTMbyHArsV2cUqgK8/dgrCxLUM
 IcDLwHMBB3y+Wh9ca40pY79jbOo5eAB9J65YTHkBfbOKacq84hTk1i0ngev1zrGu/wP6672OVCX
 HKbiaSJINvlUNp3ECTBNBjRoOJwPMKNZvn3CW5gDgUqQUabOsamUKr5VP546/hyuYiRzcTdhYnT
 51OQanlqpWOkWY4qaEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160120

On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
> On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
>> This series adds support for the standard `regulator-off-on-delay-us`
>> property to the Qualcomm RPMh regulator driver and updates the
>> corresponding Device Tree bindings.
>>
>> Motivation:
>> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
>> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
>> When these regulators are disabled, the voltage decays very slowly. If
>> re-enabled too quickly, the sensor experiences a brownout and fails to
>> initialize.
>>
>> Verification:
>> I verified that the core `drivers/regulator/of_regulator.c` does not
>> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
>> Therefore, the driver must parse this property explicitly and populate
>> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
>>
>> Changes in v3:
>> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
>>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
>> - Updated Patch 2/2: Refined commit message to explicitly mention the
>>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
>>   (Requested by Mark Brown).
>>
>> Changes in v2:
>> - Moved the motivation/context from the cover letter into the commit
>>   message of the driver patch.
>>
>> Saikiran (2):
>>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
>>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
> 
> Hi Mark, Bjorn, Konrad and all,
> 
> We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
> helping.
> 
> Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
> 
> 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
> 2. UFS probe enables the regulator
> 3. UFS probe defers (due to some other dependency un-related to regulator)
> 4. UFS regulator disabled on probe exit
> 5. UFS re-attempts probe and re-enables the regulator
> 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
> 
> Issue Log:
> 
> [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
> [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
> 
> NOTE
> - Issue is not seen in first probe attempt, because UFS regulators are left ON
>   from bootloader, which gives enough time between rail turn ON and UFS init
>   sequence start.  However in issue case, it seems re-probe is happening too
>   fast, which causes init sequence to fail and UFS brownouts (similar to camera
>   sensor case)
> 
> - Also, we compared this board with other RBxx EVK boards for UFS rail, it
>   seems that this board has more caps on the VCC regulator, as the board is
>   designed to have both EMMC and UFS, and we have DT option to pick one of them.
> 
>   So for EMMC those extra caps were added and they are impacting rampup on VCC.
> 
> Since this is not entirely a UFS part issue, but a board design constraint, it
> seems better if we handle this in the regulator side itself, as adding it in the
> UFS driver may not be acceptable from UFS reviewers.
> 
> Please share your opinion, if this seems to be good reason to accept this patch?

Is that board in production already, or is that something that can be fixed?

Konrad

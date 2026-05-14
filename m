Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62D8392C5B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764923; cv=none; b=HyFY/fR+GOYYiI9HQ1rAjoD3IXUIVOHARVVR54fETo5q0UmjGJcc3VcNISDIBVnjZiUe0CQ19WfHi3bmDvkFtlz1uL5d44ewK1VZkSRWcM46Z/0rsI53BL0ME7je6Jpp0I9wHo/stS0mmq4fU40zGdKaFMIMVdE3qs3p9kIrDR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764923; c=relaxed/simple;
	bh=bNRPHmgQjciXF+FTQCi2BqEOotAq9dF0V3DH2FPFDDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtAUCRg3j/yz9tx7QMXY9LhC4/cwNUfT1OyLuigQGLSpKZnQhf7mfL/OgiuW9xyd1+VEIlralnxDnGZZ9vye7HAvM73hOONAraqDrvkRpcYgKvbdB1/vZxaj1bLd29l4yis/xe9DJdiqhF5a2GzTVyv4kP+2bFm/n403fgTlyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPqA/9tZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBkK3FB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPqA/9tZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBkK3FB3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeVHY3891405
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7pvMXUwz6BD2dXWrjN9UdcJP372MyTgcXC7YJhQfJjU=; b=PPqA/9tZwW27lyDS
	V8zuUK628KB70pjrJoX43JD5788mlrTobvNMj/HoWU21eAMEKIngfg7MPzoSLVoZ
	I4q0KZq8T3bU3iErWhWIEYwvcF3TKiqSksdFZwoXn2CRtF7xCUx8sYjiiyEZRqcn
	ZTRHTwwtCJLRrUZ3W9Ioc8iWSeDTz8jwmugtFhSVIckuoizYWg6/zWwSYYCNTE9j
	onOrWxNdmdz0ZbqiwtAFZSYnsWiBgyZb10JbaOaee2gzKtvaNjqGYPPfy6h2Vxzt
	1AmCVH8CE6bZUxxg5XwfpGYPXgSlVMyTUA6TIpqi7i8x57Il8nexgidCaXfKE8Sv
	mqw1YQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tv4b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:21:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662990c03fso5609970a91.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764918; x=1779369718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pvMXUwz6BD2dXWrjN9UdcJP372MyTgcXC7YJhQfJjU=;
        b=iBkK3FB3f9hota23aJqddXGr3QoncDhm4oqRgBsMRqoSve8YXqPU+Xkw9l9TxCxaUA
         T4BFG3djs/Mx4esO0fwcC81D8aO1sYVl0u6Pfx7ROltiQ2uQ7IdlUstW0h8v86DbW4Ex
         SPKqW311ODRVwj876wG54MsFFvHEItU320DjhK2HRS/tl7DcMeevKtTWlEtuwDuuR9RP
         x1CUFet01XY1gsBxLQ2Q1ajt0eYcpaCyS343OTPr8Y893GORD/WXk36p6SKQAefsq2pL
         gNyKUHH21rpq2GGfdKC8w+xPsxyjtWW7bhw3ZI9mfhdRX7t5QHOh5qs70hQIpHxrxuvN
         ocDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764918; x=1779369718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pvMXUwz6BD2dXWrjN9UdcJP372MyTgcXC7YJhQfJjU=;
        b=RhZ4DUOcwR7HCmd7Yv4CleQ/Qv1NWGXYK7nokOP9sOoc3vF/UY/1fYTvA+0Ny/JJvG
         wip8BMGtHB/XhPYq3gLWK8CmogJ+myRm/pWyE6c3lV2BzsOGmEK6I4H1WugGdRunS0wD
         L6umaRNXAZ6OFEPKd71bT/Eze2v0Tdn7TXPjn43dAZV7LdQaIOuepafIgq69ZEqQV+SK
         E/vNOAMRYufGlTiaxf55NTBNZND1uJ6xSFY67aYsDUQh4PIt19AEFTxRTUBbEZyRPAJ7
         E1313T3da0lV1sGe/f25CehroqBGN4XH5YOGxzYjyQ7paLU0LdUuEcnSaLWL4RXoyRWi
         F5rA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ig33SXoJamo6Ycv9tRxf+eb7vzqvtJqEt+YPPmQowp6uaccV1ioBLt3WBMhRcmAJ8o5REbkBg/6UN@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQJrnsVDYmVkv3VmKSNfRHOBJx0AcwXGVQfvPmlYK1dIOi8Fi
	TIPSyNIvxMXgNSRkn0zMatK0P+wgh8JWphbrL96lSiTtoeHQTf2IxlJnbPaFbat8gOhLJe7QWGi
	R+mwjGKRObKUhnzNPU/mTNhDmFpkbVVYBDJbwBkexOWY1IW0Lv9ERtJR64+V/rUQ1gYcoiF2r
X-Gm-Gg: Acq92OHh6D7u80ODih5HpItXj6jcnTBStk94ILQY3+0ZdJ29wQMEW0yzUuIK/NnaqfH
	5WFJQnJn56PNv9Joa/wfAKOKmxFgA3D4DEDQSLyDq50C6tOk1uErA6ypkmA4ZYqmDfGUyfFh3dd
	EpBagIPDnJk9yOkvTEwmhrT9jukuTIdlO4Je8CCZh6fhBqGXnTSALhms4DPz1GSTFgZivjJ/V3+
	cBRUQxKsxSC6CB4gNTSR6kdBsHJ+8uQmei2Z17TFGECFZYZCSr5m4vzeZci/ZKkPDE/WawPjfxP
	XdlIzEbG/9L4RSyPYfK581XL06pY5cz3mpCi057sJMexqhUTBxz4zYAknkEm+wMWle3eSEdyMNU
	wOtgPhrPJ2m1Izp/vV0JHEoKbYajOgDnHCqRsypOx34cmpjjyu3OPVkCvEbrSLrUGn9fv73pUZO
	n7+cA4PdN+SF3/d7In5LDjJcHajwwgmb0iQypwlV1S
X-Received: by 2002:a17:90a:82:b0:369:3c3d:f899 with SMTP id 98e67ed59e1d1-3693c3e0547mr1013202a91.2.1778764918397;
        Thu, 14 May 2026 06:21:58 -0700 (PDT)
X-Received: by 2002:a17:90a:82:b0:369:3c3d:f899 with SMTP id 98e67ed59e1d1-3693c3e0547mr1013178a91.2.1778764917844;
        Thu, 14 May 2026 06:21:57 -0700 (PDT)
Received: from [10.190.200.212] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm975092a91.7.2026.05.14.06.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:21:57 -0700 (PDT)
Message-ID: <0867695e-d1f2-46ff-80d7-564b7d646e93@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:51:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add psci reboot-mode edl
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505-glymur_reboot_mode-v1-1-59fe3e9a6868@oss.qualcomm.com>
 <af_49utiHCPDlbEd@baldur>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <af_49utiHCPDlbEd@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05cc77 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NZaXKhJlTt4XDMuIunoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzNCBTYWx0ZWRfX0EnQoKtLcG3F
 ctYyWuL5jmeyPnOsOeJ6Oo5xyYnARhoOjcDHigTBMLvu2wq7X9ikfAiBAawmeWYxG7N8PLPZQ7P
 AkinVWwdosKSgg6UiXhp3FyYn80dPUsH5FpOAD+I8XCw9Ik9x0RKSqbErVC6nOM7la/OoEa86Bj
 0rujtT/7Rhw4MzL/a2mcaMg+XZPs6mv3p3aJ2/qMKE/e+v6KmVBQB93hgrLWsjbbYe63eLG/Jio
 j0uWgz2Oj7kNxILioMl2pyBvQo37KsI6GKHaGaftjD9d1XuNcr9XBHo8rtP7UKrRmIpaCwgRiZO
 tvzYhK3rBk2P3qF/Z528rKfg4slt7UeggxYzlZtj6zDjZcIYCw3fkXP6N2ywpdQF6e9iUqIPER5
 69daXD1mBw1LV4t8GTHKr0BJ9532dYa2+ofAPAhNCVpYRBwlMLO8tkEGfr+XQdlNi/SsoKzCXCD
 TDjpF3LETOZO7yvJvIQ==
X-Proofpoint-ORIG-GUID: NpZiVX5T9t48rFH9J7wezKrMDhmXmhwj
X-Proofpoint-GUID: NpZiVX5T9t48rFH9J7wezKrMDhmXmhwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140134

On 5/10/2026 8:58 AM, Bjorn Andersson wrote:
> On Tue, May 05, 2026 at 07:07:27PM +0530, Pankaj Patil wrote:
>> Add PSCI SYSTEM_RESET2 reboot-modes for glymur to be invoked by the psci
> 
> "Glymur"
> 
>> reboot-mode driver.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> states that you should start your commit message by describing the
> "problem" your patch is addressing. This commit message fully assumes
> that the reader already knows everything about this topic and why this
> should be added.
> 
>>
>> The following modes are defined:
>> - edl: reboot into emergency download mode for image loading via
>> the Firehose protocol.
> 
> I presume that would be the Sahara protocol, but you don't need to be
> specific about how that implementation works. It's sufficient to say
> that "edl" reboots the device into "emergency download mode (EDL)".
> 
Sure,
Will update
>>
>> Support for these modes is dependent on the psci firmware
> 
> What are the implications of that?
> 

Without the firmware support, device will reboot instead of switching to edl mode

>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 6 ++++++
>>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 2 +-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 2852d257ac8c..397519e95ca1 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -560,6 +560,12 @@ &pon_resin {
>>  	status = "okay";
>>  };
>>  
>> +&psci {
>> +	reboot-mode {
>> +		mode-edl = <0x80000000 0x1>;
> 
> Does the statement about "psci firmware" somehow relate to the fact that
> this is defined in the crd.dtsi?
>

Will add in the soc dtsi

>> +	};
>> +};
>> +
>>  &tlmm {
>>  	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
>>  			       <10 2>, /* OOB UART */
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..7f426efe40ab 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -382,7 +382,7 @@ pmu {
>>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>  	};
>>  
>> -	psci {
>> +	psci: psci {
>>  		compatible = "arm,psci-1.0";
>>  		method = "smc";
>>  
>>
>> ---
>> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
>> change-id: 20260407-glymur_reboot_mode-4441770e6a8a
>> prerequisite-message-id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
> 
> As far as I can tell from the discussion, that's not settled yet.
> Not sure what you want me to do with this patch then...
> 
> Regards,
> Bjorn

Shivendra will be picking up this patch in next revision of psci reset series,
I should've sent as RFC

> 
>> prerequisite-patch-id: 70829f19896a982ef4ac19fa82bf571b9eb6defa
>> prerequisite-patch-id: 600337ba5717c51204c4f426acb28bd6287e56ec
>> prerequisite-patch-id: e7a6e85c94e35b71c9813c322e811a270233c854
>> prerequisite-patch-id: 7bb3e4b151f32129e8ce5d3c1015150cbd741d13
>> prerequisite-patch-id: a61561c5070b9485399a840ff48252842393f01a
>> prerequisite-patch-id: c7f5c86cf5f88c6d5dd576565bcce25ee3848b19
>> prerequisite-patch-id: e4d851cd0a6dfb96d62e4c9d3ebfa1422b9571a6
>> prerequisite-patch-id: e6ffbbec586e6c4b508bd366615e33928a910190
>> prerequisite-patch-id: 8ae267aee51f48992d2232f18dc5795b08fd8e54
>> prerequisite-patch-id: 10b585e49a96767c3324c9e3c623a4716a641fda
>> prerequisite-patch-id: 5abbfae8b6577899e0423b36b4690adf1046cac2
>> prerequisite-patch-id: edb89ac23b7a3d5ade9b9cc1e1a77ee4d1a663cf
>> prerequisite-patch-id: 555f1b64be3631d6286f2f1e140dc38c6935d646
>>
>> Best regards,
>> -- 
>> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>


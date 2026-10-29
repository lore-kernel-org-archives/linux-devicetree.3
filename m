Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275051;
	b=Uu32V3iBoAcddl8TGui3G/ZUMdnomWQv7oQQ5oTkAK7yo09KokOmvDrypMroI2GkAtso
	 oEo58w+yTrMrIaPJ6XB07nr98PQGjBKeRYyiK+IHV524lw0rpV+K0OIvr5+U7rbobJYHt
	 GPEyBW2HgeAuR92LrAxLp6oQNUWRcYCdqnCO5Jq/hd3dLwsZ15KFyVPh21BLDo942owed
	 P+V+3JtPRgq7TpGAF1R1BUFFvCtsGNYisw8Ua06w71j0XSeRJv3iTa1uYw/aLWX5ODAzt
	 vpvIpgljkX9sErNmQIP60Y+nSQBlyyBVbUK489BK/MOgTd2ksBeCyi+ylflfHu5uq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=;
	b=LqxnYlO3vLinjMIYF551I/nOFsY/h13DUCV7YobMpDm6eav6ciIYqAY8syYZXEMqi/AO
	 9tmMtH/C6kPxRJYbZo+BcTUMaA/cGVO0eeX0ecwD81GpeWzOFMyx6moiJBbSncYjkAVui
	 BTFElaAhyY/PbEbGu/6KxO/Ol6rrMExRzHgiVbd9dPaSWIFWEOOJWjGx7BZP+RH5K5DYv
	 QgwT2wgxvZY216BtwDa3xsu9KDdco7kJnGgu0fuRvlslDNQNpjMY6OGeQyKnNHJYMORZp
	 9pMZjsBWlWPRCtPD9HI5cYECYgNEG6DkEuR3lCeNoSwhInCa12t0OUrAoqb8vM/ZElw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hxDCDgSp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jc87VFCV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B538606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B538606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hxDCDgSp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jc87VFCV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vE163825009
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=; b=hxDCDgSpdqTC37gI
	bNJOqlq9LiLUaQSYCfEFwS0tIxx2QY7UNOEiWgxH+TxvS5mjCDfdI37sBgeBijPb
	M6bgzcS6s72WolElyQ2vgNNcohJGbWcxjESXclKAWsTo2Lad/ie+W1w9RFAXf1am
	CrGqN7muw0IhiBgZLLw3FG8EI3A9B5shRRGFVw8v32rmDFu0K+8Q307VvgdetElE
	lSQI1r3IMLANdwIXrfPhvgINV5Wbu4SrM9W+iqfPBErUNSLtpFREgoOiD4sriuvZ
	RyM72ySDXQh9u42hcStgzoOLxJwZSH6Y3T7oj9oIQfQuZD2/YtykMmvhkHJ/xB0p
	AfR9cA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3j7e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:57:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so3048116eec.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793275049; x=1793879849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=;
        b=jc87VFCVL1oCdGPPzg5HSL05fQe4kzW3JsuWeOfCFGIlPIzKyJnGK/Ku0XwDvc9aoC
         oJRjpaergNxxC6zCajWndxF5eOYU/kwDJiLzoToIRNcPB7jRg1t1j7EsNT7Qr38ym+8F
         UNLIZHTAnTsYfPRECmcpeQSMlRCCMAW2hHlhyuMVZrKgXbaFOWAzhACauKIL63pBBDSN
         0FEPo95aKFcdfOPxn8/0Tsv9VjMvWUPCUZrCSAA+YBihTWFR/QJ2uvIzBqw9RqO1fP+6
         8bIo5YGgIaanmLFpnxYajnxZM43BLNy0I2VfhUDpHb5tNDNuiq0crmNjq1TDQpkfxTDt
         9oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275049; x=1793879849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=;
        b=gPcteHvgoKEpCqBmkYNy1z+8hw6LtwdZ47fgwrtQPslhATFNpVypBYd2bQWUAzuXBC
         vixvCThx7lkj23IcUIDZ6riwAneN77x2gdMqSKVkA9iIyVWW/milb7XkORPe4DOH4Nww
         fP+kSkw0//MnbWjFimS2VhTU2GzrDcATFFt3FBWuekaQf8fzCqfFWf6iHi4+4HpdJRVY
         vW7ViOu9rDqqGqIkoGsy+jKaCozZfQyHuHEzJJkqA79aDNNKFFv38yCQAX79VGGmH05t
         TDoAc61ejtabYYww97HJxqXW+52k+NvBJgnZtSnc5FACLP593/ypn10vNkKDEOczr8fH
         QYVw==
X-Gm-Message-State: AFq9FYLJvFc0MQhL8IZ1Ubzq5jA+1M1sBmYP/OgPyS7chZYhE4zVuT+l
	CHuvASjkPbH+5ZZx8jpxXphY7ZbTOanwRqg1jEqg+weiuEWaaXop/9Z3QFPcB022aQ10HoRHUi+
	1GOi1rOoiKaIm3vLRpJiUIDHDrFwzy4UnC75X5rJcXZXSRhePOiswS3lCBWH/G1WLv336mEv6
X-Gm-Gg: AYBFou0fUuV3OImaqsmqTtjaK0Qcl1wVD5E/pIYr1A4q9Skw1pu/GhDCGCflo0eSkb3
	92Pg2eDWK+P8MVhG97CwIJbYAsVM83QFcdRNW3Akp3cNfYuMtsdYLzY9kwJ/Qw9ORfwNuPggAy7
	q9wdnh1Frm3mpLMRjM0fMogspaPvfwPTgMMuF5VAWR7J8G2QlsKrZV7xZLJGrW5oY2PIOpyVbt0
	PJnRrj4pZgF+2j7OY5RyplHoSg3wdhnfAKmKxY8km6tsR2DysULCQCwRhuS6Gof67pgmgYHx6Cu
	AFTqhgi3ImDUuEXYc/jkLYiWFTEwRQWubBU9ag/t1GILynydXhwYMYIauvgwKXDGz36Rz6Zr85G
	3UC1xeZr4xScyAAyG8hqx8JtBo93YbLcYKKkJJrwdYqWP0fjay/ZJjgX8tU2JIqbmu+L6SXNyb0
	dCnJmodTPw8FITVLaNLuc8OcU5A1GzABYSKlZ5k0Ef501sbrEEYHUztJuUrEX5rooefO23WHRiL
	WA=
X-Received: by 2002:a05:693c:2510:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a203d426amr7045679eec.22.1793275049269;
        Thu, 29 Oct 2026 04:57:29 -0700 (PDT)
X-Received: by 2002:a05:693c:2510:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a203d426amr7045650eec.22.1793275048596;
        Thu, 29 Oct 2026 04:57:28 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm21157004eec.20.2026.10.29.04.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:57:28 -0700 (PDT)
Message-ID: <8ed020cc-7d82-466c-8f99-e25f52ef34b2@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:27:25 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
 <sashiko-outbox-186232@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-186232@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NiBTYWx0ZWRfX3HHtGkMh1otA
 xVIh08UPYALH7RAjFHUA1V2I56905t0RO7SyNdPdETDfYT6IbsBnTbPeUwViGxL4R4O34zqAoLy
 sfp4JasBYMIzw1rky38tJoA6YtfTlOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NiBTYWx0ZWRfX21acrYzk0SE+
 TsmkI1EnjxIwR97ALzvLcT2WXUTj9rvCe+sgvuVMzdZh7lxHuEkONBJkdZUwrKChu7WvFw/NxgM
 FnksG0SOMsbfAodwxDpNuvR9DKfj3bXV/vVDMUNvg1TgUjy+N6PEntiS66dAHxXJjzlKzTDDL/v
 lOxADBnzkbb0yfcoBltV0edfr0VDHfMXyjEA3JE1S82eop0sJyAxQngrvjoHW5qRcetV2LeWVDe
 E1W9g4K9qBHNIatADajPDXNJoTzNKbOcXRkr9k7p9JHkUZxMh/ykvzV0XGYewX6VB81AQcLMX/v
 MWH8B9atsxladYgucvWGUvrmCkyWj9vLM7+B+fc4mUZAYKIvRhzO/5OM/K1s+6sNPwLnzKBFXMl
 phG0oECgEp9Jh52tbyijAR0sSSFafYTDgh3AlCCk3cydJILjKtcc+OmQJtngtjQfcsNjOZF92qW
 mXbrTOMrk1hYSJI7qHg==
X-Proofpoint-ORIG-GUID: _ZpdtXE9KWChf5f7hw6FR_uZjwmLV4LZ
X-Proofpoint-GUID: _ZpdtXE9KWChf5f7hw6FR_uZjwmLV4LZ
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae334aa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eOIwicZ2piiRI3fgtboA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290046



On 10/27/2026 1:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] arm64: dts: qcom: SAM compatible mismatch breaks ssam_platform_hub_probe()
> - [Medium] arm64: dts: qcom: stdout-path points to Surface SAM EC UART on uart22
> - [Medium] arm64: dts: qcom: missing qcom,uefi-rtc-info property on pmk8850_rtc
> --
> 
> commit dc92104026c28877c07bc41ec0441b8b4cc8661a
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
> 
> This commit adds the device tree for the Microsoft Surface Laptop 13.8" 8th
> Edition based on the Qualcomm Mahua SoC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> new file mode 100644
>> index 0000000000000..9acba318ab52b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> @@ -0,0 +1,1176 @@
> 
> [ ... ]
> 
>> +/ {
>> +	model = "Microsoft Surface Laptop 8th Edition (13.8 inch)";
>> +	compatible = "microsoft,surface-laptop-8-13p8", "qcom,mahua";
> 
> [Severity: High]
> Will ssam_platform_hub_probe() fail to match this root compatible string?
> 
> When ssam_serial_hub_probe() probes the microsoft,surface-sam node on
> uart22, it registers surface_aggregator_platform_hub. In
> drivers/platform/surface/surface_aggregator_registry.c,
> ssam_platform_hub_probe() looks up the board's software_node group against
> ssam_platform_hub_of_match:
> 
> drivers/platform/surface/surface_aggregator_registry.c:
> static const struct of_device_id ssam_platform_hub_of_match[] = {
> 	...
> 	/* Surface Laptop 8th Edition (13.8") */
> 	{ .compatible = "microsoft,surface-laptop-8-13in", (void *)ssam_node_group_sl7 },
> 	{ },
> };
> 
> [...]
> 
> Because ssam_platform_hub_of_match checks for
> microsoft,surface-laptop-8-13in while the root node here uses
> microsoft,surface-laptop-8-13p8, of_machine_get_match_data() returns NULL
> and ssam_platform_hub_probe() fails with -ENODEV, leaving the keyboard, fan,
> and platform profile unregistered.
> 

Thanks for the review.

The wrong SAM compatible in surface_aggregator_registry.c is fixed
separately here:
https://lore.kernel.org/all/20261027-surface-laptop-8-sam-compatible-v1-1-022cc782b0f4@oss.qualcomm.com/

>> +
>> [...]
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
> 
> [Severity: Medium]
> Should stdout-path be omitted here since serial0 points to uart22?
> 
> In this device tree, uart21 (the debug UART) is disabled and uart22 is
> dedicated to the Surface Aggregator Module embedded controller at 4000000
> baud:
> 
> [...]
> 
> Setting stdout-path to serial0:115200n8 causes of_alias_scan() to resolve
> of_stdout to uart22 and directs any earlycon, bootloader, or userspace
> console consumer honoring /chosen/stdout-path to reconfigure uart22 to
> 115200 8N1 and write console output to the binary SAM EC link. Other
> Qualcomm-based Surface device trees omit stdout-path.
> 
> [ ... ]
> 

Right, uart22 is the SAM link, not a debug console. I'll drop 
stdout-path in v3, same as the other Surface DTs.

>> +&pmk8850_rtc {
>> +	qcom,no-alarm;
>> +};
> 
> [Severity: Medium]
> Is qcom,uefi-rtc-info missing from pmk8850_rtc?
> 
> [...]
> 
> Without qcom,uefi-rtc-info, rtc_dd->use_uefi remains false,
> pm8xxx_rtc_read_time() returns the unadjusted PMIC counter value, and
> pm8xxx_rtc_set_time() -> pm8xxx_rtc_update_offset() fails with -ENODEV.
> 

Agreed, I'll add qcom,uefi-rtc-info to pmk8850_rtc in v3 so the RTC
picks up the UEFI offset, like the other Glymur/Mahua laptops.


Thanks,
Gopikrishna

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77048357CFC
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538556; cv=none; b=ie8mxAzXs91NgXsPxjRd8Uhy0vTNH33rF3+ADKj8E6tSzV2YQrwUCEBai+RDbp3rP8+CWuUWNMpWxFIFEBprrq5tgSpXHtO3f26YpWMr5O3lFTiw+fa99Lc3LxM1bcIrAi+HtwB59vCOrckhDOPo3aWjAV4b7Yovkv9uM88xu2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538556; c=relaxed/simple;
	bh=HT6odfgIm31nAJlXlSvWqpoui4IahVtMLX93lrDvz0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9Y9rby80dWU/RgZBExjXIZCb2v9DZ5YfgtpooMM/Nl9RAOD3bTfVBT9S3Tt+VDelFvSL4WCMdh625Icy1qK/MMOgmkxKbs98njVTV3rsFN0JtRSsSo3wv9W+PrH4DKji25gb97n3pMk0DVDGsmErmhmJX6KPfnTDMWlIFfcgGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu0yGjTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzIQYkIV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu0yGjTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzIQYkIV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4cK23638018
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJ9VAtOW4dvyLTFJEa/GHt4ssfJ12G8OyYzymmqsAo4=; b=bu0yGjTwPU+skCKe
	8BcRSYnznUUuD/6w1Uc8YkK7lL3SaHWK8knn2W8SUaHNt7KJPNtE5VQQD28lODUR
	/YypukvxjsGI0gq7dWjAZq9sJpdN3vVWZkyM0JUOaP+p2tephTXzXOakodBX2tLK
	tK+yjGBVqJ0aZ5+m6bnmgAA6A5Wy/gm5HXiH343weEyOKnDfkXVG72LmK6XhtR5t
	/ALnWf+L8jx+8lqXL5//ACRzkIbzTz85vaZtnOktItKXIIHG9StSIEpBgjl8DWWT
	wyevSYWfYY1aErU9WjhkeCch0o7cdLNXMeXmLpcwVbnTGXRgKl0UVmmoovb577IM
	AxtpiQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrhmpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:42:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so2353203a91.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538549; x=1787143349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJ9VAtOW4dvyLTFJEa/GHt4ssfJ12G8OyYzymmqsAo4=;
        b=PzIQYkIVRgqculSy6QeBlNq3s2VvaB6mrAx6nYh/1xU7WEQSBMcAJKdmDxQjoPkTAA
         t2SofXHTUL7fRIzyp9Kzn7fFVRVCsGcg/ZFXQeHf6ntZiLIzDsmgZ6ci5xkykD7c0ZGQ
         G6XhUjYtBIKJl/L4EDzpdzt72Drg5Sef+VceDQdfqv6ZGKapWIInRyM7PnYrcd1iBxpV
         g9q7g9X0n1SHbxLX4EXWf0rH/UedFMmnKdyNr0qAFnHvQ3fHINrT8COi1s5yaSOKY093
         iF+yaXc3f2hnwzwCNYqlSQa+c65wfWdvgvmB3uLCXK8CcImptH9VtPsOpKJEsQx4d6Mr
         Iz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538549; x=1787143349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJ9VAtOW4dvyLTFJEa/GHt4ssfJ12G8OyYzymmqsAo4=;
        b=bYBO2DRhtjTdpuCBkpWgQWVwLzVWNYNaPDtBOng2Lot8OH8GBDKLHKVzrp+yy2sMVU
         VnM1OId0wUF66BvYZm62cDVZKQ3bZEmdGYWwaC2bqURaIjX+5d/ITUiVJKTJndcNyoUP
         FSRF+fb1/uv5EVIt3FVw80cx81QjmEfP4imTezlLSz2M93V6pXpf2zoMl1Too+u66Z8A
         yZ2mg1L5hof0wo1Zgpzoo0oTW2zb2jEJ0awvdi1Ngv/CMmxnd2IPjFueLcnh9nTNcdut
         fPsIOQCrpZ6Q69oTPF1hTreHfEM1FfSXzNv/SWSdQTU7r4FncVBAjFnRGDnl+SuB/VmA
         vUOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKxDio1MqrcdMTMw81NR/kXVVSZIVATTbuQEtVl8KxguGs5DG+o5/w6TZ2hGg5F2qYx3GcaUeNv9Ec@vger.kernel.org
X-Gm-Message-State: AOJu0YxhvqnvqRnA0kL1T3d5aOvzpicCcHfCLtJdPJoRVxZc3DLWD4Kn
	Rs2vZ4p2qQCnE2ASksSinv7RIVL6eoxDuC4kzP6QRQJmJLotMZYuUje7oyAd6c1MkTIMX8vLAEM
	NoM+yymzwAUYxWryzOQgyZAwIOFzK8kGQRsaU69Whs9hqnFNROei2C5CoIjsAYnzY
X-Gm-Gg: AR+sD13lLKE8zZdel6ZrJ08Koe1l6b4I28r00rowTrDFTQl+hyFcSoAdrwmzxVRUYXV
	a+xVWzQebVb3FqRl5tALY7pKqoVPjGmdmyV+I0HdBifX/iRacg9SQkDs16duFPsqdNDRaCXyXSV
	xfdddMZmydW2tZMzygd3oiG2cLUHBDGX/+JptAqsmtaqI+BiPJqhG5IA/c/3c14sMLvg/pH2nJc
	vCCD0u2vNCP948ZbxHMopsog5yS0Ooq4FO1Ddc478zEZcNhqFeLvH+J3U5KluqT+AQbqPtfk/JY
	HzJtfHkIome3EyI1s/JHhxfSgKy/hihvyADq6zEq3Obq2gUypPGX7myb4UeuVxgi3B8ZkWI0UXJ
	caK5tx4OLof6k4hh05XwwVruhfzvIw6jYJmJ2Ar4Mg/OI8gBaq9pkdC81XjfJOXvoyxM=
X-Received: by 2002:a17:90b:4b81:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-393011b2a20mr4777118a91.1.1786538548629;
        Wed, 12 Aug 2026 05:42:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4b81:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-393011b2a20mr4777039a91.1.1786538548133;
        Wed, 12 Aug 2026 05:42:28 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.240.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94adf39sm3478809a91.11.2026.08.12.05.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 05:42:27 -0700 (PDT)
Message-ID: <f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 18:12:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power
 and bandwidth votes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Greg Ociepka <greg@ferrisoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260812083522.774711-1-greg@ferrisoft.com>
 <qsxaqckpbvqlrtpd27fcufrmo3fmrp3zf432a2fn5hpvw57mnq@xekhebfewl4s>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <qsxaqckpbvqlrtpd27fcufrmo3fmrp3zf432a2fn5hpvw57mnq@xekhebfewl4s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX7ZoTkdOb6U/O
 EdlXb20cCp1j8+OW9RGM9hKfWpmJX181Hx38p7CdwZaqP/lBPvetsOXq1r/BDM6Tveg5hRtUw5n
 n0Y5ua5k7AVG8s1ppY8vBbOinuxV0LrM13DmJSP2toqq/qfQb4FNRvcPw3KxaR3XQMaVQxWR9Hn
 3IKF5EWWB0dK4CLC6ygudXHK7ZjzKaOXVa3+9WVPkLl7AoAKtWoh/JrNrzLOgocalQphnoAmaV1
 Vz2s5U0UsPSt0Ruah3/aFRFVFh1sHItAztpGvJVXPi2Zs8WTgIlUd4aLP4+I4YncoGevxYwhlkf
 M+UvDg6s3VfWKF0OxyZ4W5w0IlU081iq00gHB1n0u9gAXww2DUx7XbLCB1fl0Zjxq+zXmqRKMfm
 h3QcpehCs5N2roKgkjTjP8xTJFLL+eZCQAB6OygS8RRnARr0FVWsjsZgzJyTCJru6rpV2rTB8Rt
 4xBJ6jtT17V5eHKdCcA==
X-Proofpoint-ORIG-GUID: q_mI97s7Y-tcHAhNB45deNj3CZXWOddz
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c6a35 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=8gVGPzDiWuseyeRcxd+aqA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=a8UEx8NLAAAA:8 a=EUspDBNiAAAA:8 a=WuHgnROwf8Ibkt1w3KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-GUID: q_mI97s7Y-tcHAhNB45deNj3CZXWOddz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX+M5Ma8VNElhV
 1NT2ymjufQFJBsSENixUrIwzsZtbdhLVZYefZik2JDZsFGelVTUPctJfc6UNSWF7O2L72S9dpH8
 kbZIp5C7P5e3qRJ8AfimXaAW5mLMyrQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120103



On 8/12/2026 3:53 PM, Abel Vesa wrote:
> On 26-08-12 10:35:22, Greg Ociepka wrote:
>> The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
>> are missing three property groups that Glymur's own usb_hs node at
>> a200000 already carries, and that Hamoa (x1e80100) carries on all five
>> of its USB controllers:
>>
>>    - assigned-clocks / assigned-clock-rates
>>    - required-opps
>>    - interconnects / interconnect-names
>>
>> Without required-opps the controllers place no performance state vote
>> on their power domain. Measured on an Asus Zenbook A16 (UX3607OA) with
>> a SuperSpeed device enumerated, CX aggregates to SVS while the
>> controllers run their master clock at 200 MHz:
>>
>>    $ grep -E "^cx " /sys/kernel/debug/pm_genpd/pm_genpd_summary
>>    cx    on    128
>>
>>    $ grep "usb30.*master_clk " /sys/kernel/debug/clk/clk_summary
>>    gcc_usb30_sec_master_clk   ...  200000000
>>    gcc_usb30_prim_master_clk  ...  200000000
>>    gcc_usb30_mp_master_clk    ...  200000000
>>
>> 128 is RPMH_REGULATOR_LEVEL_SVS; rpmhpd_opp_nom is 256. With this
>> patch applied the same measurement reads 256 while a controller is
>> active.
>>
>> Without interconnects, dwc3_qcom_interconnect_init() silently does
>> nothing: of_icc_get() returns NULL rather than an error pointer for a
>> device without the property, so probe succeeds and icc_set_bw() on a
>> NULL path is a no-op. No USB-DDR bandwidth is ever requested.
>>
>> Without assigned-clock-rates nothing programs the master clock RCG,
>> which keeps whatever the bootloader left behind. On this machine that
>> happens to be the correct 200 MHz, but ftbl_gcc_usb30_mp_master_clk_src
>> also allows 66.67 and 133.33 MHz, neither of which sustains SuperSpeed.
>>
>> Add all three groups to the four nodes, mirroring usb_hs. The
>> interconnect paths follow the provider layout in
>> drivers/interconnect/qcom/glymur.c: usb_0/usb_1 sit on aggre4_noc,
>> usb_mp on aggre3_noc and usb_2 on aggre2_noc.
>>
>> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
>> Assisted-by: Claude:fable-5
>> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
> 
> This looks OK to me.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
>> ---
>> Note for reviewers: Hamoa additionally marks all five USB controllers
>> dma-coherent, while Glymur marks no peripheral DMA master as coherent
>> (only the SMMUs, PCIe controllers and remoteprocs). That difference is
>> deliberately not touched here since getting it wrong is a silent
>> data-corruption class of bug, but it looks like part of the same
>> omission. Is USB DMA coherent on Glymur?
> 
> I think so, but lets see what Wesley thinks.
> 
It is dma-coherent.

Regards,
Krishna,

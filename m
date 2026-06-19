Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02636894D
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872530; cv=none; b=eH9S1aIiPqQgslJBvcvEQJXxz4N2O3SjCZ+UNbKyUFDhpFtTXbJ5DRKf8/eelvoYHAAEMBXUGuimCN8tyBeRVIg2UzEhCL4/8P0DeSFRJGz38k/83j7rM9NQwC7swUsFM74SXkwCIePWBtZsJA3qvLQm7ApHXMrU+MI1SGMN6Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872530; c=relaxed/simple;
	bh=BHT2BEZP7d3v9gf40t9/eFCAW0HPszC1k2qd82uPBkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uee9zUuHsVc9/r2oXVk4JHhk8eg8OUxy13vC88PGlVGuIi+Kpa+Mp8uBaMC6ZptF4rh96c8Lyikn+o3i1/zy1/7TD8OdqADhdPimUY2Hj3MuHFZdspMgUp5La9vOX48p6v020GH7ni2P1l0svlC0SkIVhtoQXtAF77DBDm4LJto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsmCBC4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLVhap8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsmCBC4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLVhap8m"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Pqxl3620666
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3NhBX1Jobi1pxNTor8EgR7xCPiV5toNFXtLqEcMB0UU=; b=GsmCBC4hjfEK2wCz
	XEIGmsCefBRdpdODAFpvnI8yoJdsVDKj6JdM4qkUmPB0Y1eOoeTpA7gKCY/BF2sL
	Aw1i40bWq/9/z7l3Zof83+Bg+SCvWeLf/H0vrdcOWN72GzBgRuiQ3+sd2J/pQMaN
	/ape2mX6cwvH8JK5MojKhlbSO8MbvBtDmZWnWTj3Nf/yaylriavZxAUz++wcPGEU
	33EH6QsQxysCuuEqZRLygyhBPY+10peYIAJFRrufAE3yrZHevmeJbGy7fhYdjGeN
	JaiD5C71LuHgExdG0tvWDNzFiqScNHXAvVBf7L3uHdK11aHm2xm4qOAxiCIhHS2b
	wI7lcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evkvf3sem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:35:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158ecbfbc2so26205885a.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872526; x=1782477326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NhBX1Jobi1pxNTor8EgR7xCPiV5toNFXtLqEcMB0UU=;
        b=QLVhap8miTQ0xlTQl2C7nq0PLPIjIn3iS+2lsBTzbwY+n4jTVsXAnVaKOrFFdPy4sU
         eets1HvNjJE51DwdqGMgH/zdOaa6r4Y6XoYvRrETQrsEb89qNt4/5RLotEVD5RZIdDC6
         bjTRNIHNdEPhgVKITo8cT2Os4H0+PGlSzU+Mji9WSirOaH4BEj/0LLnYFnlyGTKK9OMD
         ybPb19zfQ58uXZV63rPJbidDn1Ymh+5AvdbTgqNK7mnlVv2hzXFrAyy9eaBjDQHcK14k
         NFRRQt3o6+co4CWBSVAoKmIFPrc9IyTOhGCs0oWK5UTI2oMtqRQIjEFbYgqTFfIsyRgH
         +Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872526; x=1782477326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NhBX1Jobi1pxNTor8EgR7xCPiV5toNFXtLqEcMB0UU=;
        b=hPqVwaHTptde9CSGhCUVZPTveZ07qcJ+LMO62r8qcHAhicLRHmZsEfJNPUuUvZ26L1
         rb40RrUsk08pYnveqxGQptxOL4+SokZrTcY8AHylZDeu6aH6pPskHbH3RCc/ZCsLU89+
         sjFFdK695894i3EpKhCqBb15hxAyGSjDd3N0lG5YVOmb5vd/wVWMK+hNkevHqb/DAn/j
         wazVCfAPV4M26OuPokU7LkYdYU7vt05KIGXc5ksooSitMpXo3kVj/28MJqURkmwAuKGR
         3Ycm3s3PCgQMIi787HqcTt9ViGF4sOXuTBBaBh/Rd0U6UTRb7iY8S3MAmsl5xqd03pOx
         VyhA==
X-Forwarded-Encrypted: i=1; AFNElJ8mPQL9HbBc0CyzeyNFXfX9syR/ZrkdF5G8Aj2FygdSD9MUgBi3g7QvU+qLnfqSDhraSasQ5+V2PLh0@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHKxgU81uALjSNNj55uS5Y4YVV+aYF9PKZTzSTBeGtboUAJGu
	QDzAAvUI3bxsjkV3SUetIynez07hsmK3QQc9h7Cn+5xOU+5NKyL+3tQcWYbcia51fTn3DWBM4WD
	tzXq/I7+2qbF1me+gpFMmBGyAdh+b0uVFMAYI7CDRxmS9cMt8LCAXa7gZr8uufqsW
X-Gm-Gg: AfdE7cn0xTROmUXUryNNB+D0rptUCiI7Xt6YUJq0cVIctc4hH/pJS7PEQDUQ7xoQLCc
	wm3C8YdEcysxvzxAX9fhrVsRNpdkfgtf9hVG3OOkuQ/F391BQv/Mechys0m6CUb49t6eDdCYc86
	CgEN9F8i26ZqsEZveyPDr/qcrJjm3Vp5ydixm9SEX/Ae3sl9EDUQkajNIZPDsuEUC9V5h3m7ED/
	o3Z65RjvSwE4fpixNwneD5XPEru2yUdmjMOzOIRNPbnZ9T8E0ORqZJit72VhzqRcCGI24tJcOJN
	zSc22ebTaa1zvV21vaGfk0lSzl4oVYwgrXFt6t3V8BWkmVa+jhwbmqpi9IAau39VvKysaoijXiJ
	GFPHtoT1hqZ5g7R3IPRvLiD8wWj/Js3dKyIc=
X-Received: by 2002:a05:620a:471f:b0:91c:9d38:30ac with SMTP id af79cd13be357-9208ccfd7c0mr323278785a.4.1781872526056;
        Fri, 19 Jun 2026 05:35:26 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:91c:9d38:30ac with SMTP id af79cd13be357-9208ccfd7c0mr323274285a.4.1781872525508;
        Fri, 19 Jun 2026 05:35:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f30d8bsm840334a12.14.2026.06.19.05.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:35:24 -0700 (PDT)
Message-ID: <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:35:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
 <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfX98aIi6XzGGcw
 FahkPzmZslWdAxitGFrnBjdNfrI3KxmOH1JZnZ92/ce2SSkOetkRhzGqiP3a4FTNo5x7Ip6oiHm
 HrxoVqHoWqUlG7XlCD0Uhr09oLNZzVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfX7N6DibmTcFlO
 ApJp7U3FsxJNDUpPdGI/7CsjDzA3EOzcOVNWM4f9Aqf3t7TD45NqyIB78dQW4TwbijLvDsWbnvx
 0+hfDyWfKeeBHIPVvvdlUkCktVdpkGKEk1/S9Qm3u2ashQ+Kg6xATT+FtAnOADTal43tEAabwwY
 wx0I9Nr+IpcEWqYhpBub4YlrX4BPhOIwN6hKkkZvH+MBU4XjCx9bfLR26ISVRWHMA3UdNb2A6To
 s/RWih7NYVRSzkcRwJ+RlvARL1kouJ+9ujaSgAaXoSQiccsivNABr9Zl5zxSXyOvAoI/8U5hngS
 dky8pKkzZ1YoqMp9yvCoZHCMkf+0+RmFflYd7VcwdUHE9ptlSzdlSTr77PsvE7fxs+U+aAOwucj
 Gnq+z9D9QCphoa3q4C9/GTEwKpf0Qcq+RDVAyguU0WapCVwy7Tp284e5M4Rlfq96adHttu/UxxQ
 rEB5Hn+9yaj2S4l+tyQ==
X-Authority-Analysis: v=2.4 cv=H/3rBeYi c=1 sm=1 tr=0 ts=6a35378f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=whVkP5h3prY9SN6-RgsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GKtoER_iv1idg0OfA_Zwc2h2Pl5jS8Gm
X-Proofpoint-GUID: GKtoER_iv1idg0OfA_Zwc2h2Pl5jS8Gm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190118

On 6/11/26 7:29 AM, Pengyu Luo wrote:
> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>
>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>  1 file changed, 56 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>                       gpio-ranges = <&tlmm 0 0 230>;
>>>                       wakeup-parent = <&pdc>;
>>>
>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>> +                             pins = "gpio119";
>>> +                             function = "cam_mclk";
>>> +                             drive-strength = <6>;
>>
>> Other platforms set this to 2 by default.
>>
>> What's the value set on Windows when the camera is in use?
>>
> 
> It is 6mA.
> 
> Let us get ctl_reg first on Windows
> 
> lkd> !dd f111000 L8
> # f111000 00000284 00000002 000000e2 00000000
> # f111010 00000001 00000801 00000000 00000000
> 
> ctl_reg => 0x284
> 
> in msm_gpio_dbg_show_one()
> ...
> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
> ...
> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
> ...
> 
> x13s should be the same as gaokun3 in this part.

I confirmed as much and I'm willing to believe this is a default for
all 8280 devices

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

for the second patch, please mention in the commit message that the value
will now match windows and please add a fixes tag

Konrad

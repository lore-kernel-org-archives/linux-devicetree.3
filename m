Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72323B42CE
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075686; cv=none; b=CM/QVYrC2koC4YtgFwYiRky9wcffyEdKMTTkPvH4C8EfOoJU4/QQuLNJYxF5TSnM8pw7VA0RAu4PJkNtcIsagQwOhsqMNrQsx/eRXfVlfU+ntgSArMGKkDwt6ugv0uNtiqmtMM6QrN4zdM7H1yTHNfG7vyuBWpshyK7HHX8xuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075686; c=relaxed/simple;
	bh=4Ycg/GcVo8WSr0D5tkwR5AE/jsWTs6WUMlVsmyKcOt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTQqoWra2d0loxJK6yR59wiViRRjtO4a18f/1wZ7VXbheaJ2pY7dOVrfOZOm76XoseDwIXKoJ0FS7sX03RIcimTgWryRrgFCuu5XzVHsT/cyLcyC6beEfVRH+c3vj3mMx2QO7rwBuSHH0pXduex3WNB3DSYXFjShRS+TpyPxTHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DkHkiQbm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gis8OIlu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkHkiQbm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gis8OIlu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTPO2809304
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmH7QPeA+guVN98xiuHA2xPqcWvEQNWan5fCzKwsQxs=; b=DkHkiQbmvZtSjEvw
	jr8B6TCJ1ZNOujHo6oywaxFz5Rp561aaG5u/IbjYieghBMLUT0V/NmqTluyGGM88
	mwWXRg2jBcpVItuwq1n+yizeZvfW6tUccAENwREX95XLJr3wn9FSjmiuaBNVcRc4
	qIwLFKScbLk3P0h6qIEnp3mkfITDYUDmw03R3Xc16OYjemyfyDwqoIwaAoDGOlhq
	ulXjux1AZ/F25WmDpKTJReGLvM+4pxmbCID7wOv7C4CRXjMsj+wqWtjffHGDsPnW
	A+/O+sjoNw59uEetUGyNlBO0Aeuuo+nqdsjDH2lv6E6StLXD1Y/jasgqfYuoUfS0
	Q+6Q7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54u4x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:48:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso62396285a.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075683; x=1792680483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmH7QPeA+guVN98xiuHA2xPqcWvEQNWan5fCzKwsQxs=;
        b=Gis8OIluXjXxpQmVElYuNraQUixoYi39HGAzNNBcc2tlkZxkmAvC48ugCVBkV4mj6H
         4tozf1z08VLERzNH6TbIQQAubgT3LuQag3pKwnX5vDsaTIR+L7cZmiOYv0P9aAE2tmnH
         4y0xrqzxFtVknpIVJ+mtkv6krmwZqQlf+caQAL/Z93ugiOgvD6N7OBE/SwD78bRk1n9l
         OtDQUAwj9EbgPHzAMPwBU502lsnBs3OK++fJLJ3TNjOkQlruZMR5uLdFY7sUHN+P//uU
         uvqeNs+tkHN/qGb5u1jMnRIYq3f1Wh8X3BORk4449Ybh5B5zvP6COmfputZaH2OqMNsk
         yiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075683; x=1792680483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmH7QPeA+guVN98xiuHA2xPqcWvEQNWan5fCzKwsQxs=;
        b=y35vI63yPo1qLvr5YJF9RL9ior8X05DYCTikaI3DMeWf5oAaDw2zQdDZLCQWGecOB1
         ONWrsCTCTDDm6MjtVGr5vjiRN3rb+Wx2hCnifD9EOP6DfPDrN16MY6hsIrEBFiE7LQ2b
         sGMKWjWY8exnRrKnV0Zn9ZQMkcYR+KXm0s9/+xTHDsyJzu9AQEZHN7A32PiGQFfvsvUw
         jlw8IvwT8GHdMTdSggVZidq3BdvSUH1lxKRGaRyHFZUOUQAqZA4a792ikdPJQ6G4tt46
         033/q+7x/JLRVaVu4gThxpX27HSWC058jSJQ+jrKttj4O5fZw4PNnqE6JD6gKpdUKHvT
         SMWA==
X-Forwarded-Encrypted: i=1; AKwUvBzPNj0pkHVB3XhmZIUOTMDEQKPJ4+IMsHp98XSZMbjJPlFBxoDysyWXJIhqb7aw+meHvrwYytDQQhya@vger.kernel.org
X-Gm-Message-State: AFq9FYJmXkHdaw0gMfPRuYKL+6Mtid43Go3m/IfzJ4t7EqbbidK1rzMc
	lzEgtxnZgQyhlxigsGKaY+N8lNjo2mC7ADeMAXFaRqAchcqpSZ/TOQ2q/1+SOP7A9JVTwPM1lDQ
	ZiV5iyMf06n0Fb9qB1PcR5TjLGh1pP/IEfkLRqvgnGjf+w1wqEKW6hdhMhWEla9Sh
X-Gm-Gg: AYBFou2eifoSq/SSWgzQDIQPM/ihDzgnFanDCIuNmTlhh/Hb+KFSzFLMnZ14l/NrfPv
	c3rPsQDuk5M3pU77fNcXN6mYiHDSJ4xVaLKfkoey0wLgosqvlhvL1qQG1yNigsb3mYWalGo+9CJ
	Z8rXY6OHtIdSUq8eeL4xStwSNq9UIyLIkPWVCv0wY8ypHvcS08u1EwH3HFo8As2S9Qdiu+F9I0+
	XxschZ7uPchJftAOj6ogwz6w8m4WgSy2iVEtQyyDXnUyCJxb4hcdj6P3rSAssGrng/7N0MQyst7
	Tdnx8odzsQcC/SEqUJxm6VlA7j71U4EMwAbQlfWYedsXh1JYfao+zr7avWwlgWuSAjR4Gx9zObk
	zadCBOq7yrQUQzbZInyD6ag==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3536614785a.4.1792075682847;
        Thu, 15 Oct 2026 07:48:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3536604985a.4.1792075682121;
        Thu, 15 Oct 2026 07:48:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d856a2sm1394214e87.48.2026.10.15.07.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:48:00 -0700 (PDT)
Message-ID: <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:47:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0e7a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=l9_-Xfrj8dEtznJ1M3oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX+th5ZZnOKitb
 8oWqeSHOKdsQPunX1F5MlfJiamYZ4xmlHAiX80wL0uBSDnwMHG+BTqauuQ9UEsMEWoT0W6LwIA8
 yzaMNPGRTcAm9lkyWjwAd1clgWi3s0uWkfYohTYq7BSrlOWa31dxBDi5CX+qSM96roVP952JnTl
 t37odfB5r4+XQKILis8ShWhog0GAY1wV6r4TKHkJ+f+uQUidkuW3VdBD2J8pFUSkLqgIz2bao+R
 x59lEvS/UjNOpWM/fF+tk4pLDmCX/qEwlOzwsX9eqNWZGR/nFcG0QakR46h8TjQD8NKNwqxMe8Z
 BXq81uSH/D6eo3hh0rVjYDuT4ZetF+mrIb+uTt8y/wFjtRdLSMPdmCuUeKrJkaFLrJXGCMYxS5t
 SrAMAtFm/A1KzQoUgvwTk9CydiSE7HgecF4doe+h9WBdy5kN+6K8Zmp16B74oYNXYOaGlnV2pte
 O3mFLjVOgV3qgfUZz2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX0to/6XpHOXR0
 6qvCi+vjT8hJtQbwU99Ydpp2j98RxLT3iMc4dPbu9OMoF01CUqT9IP+dw+rvcU70NazcpNJTBdD
 Qdb/GdbSTG+L2OGGiU9Gy529L/tzNTs=
X-Proofpoint-GUID: l4m6_MAWU0AnVLDAG_Dupz8TNAJYAqal
X-Proofpoint-ORIG-GUID: l4m6_MAWU0AnVLDAG_Dupz8TNAJYAqal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 10/15/26 4:24 PM, Ilpo Järvinen wrote:
> On Thu, 15 Oct 2026, Konrad Dybcio wrote:
> 
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
>> least the Zenbook A14 and A16) expose a custom, somewhat
>> Qualcomm reference-derived EC interface. Introduce a driver to
>> communicate with said EC, allowing for fan speed reporting, keyboard
>> backlight setting and receiving of a number of miscellaneous sideband
>> events.

[...]

>> +/* RAM addresses are sent MSB first, while returned data is LSB first. */
>> +struct asus_qcom_ec_ram_request {
>> +	__be16 addr;
>> +	u8 count;
>> +	u8 reserved[2];
>> +} __packed;
>> +
>> +struct asus_qcom_ec_ram_response {
>> +	__le16 data;
>> +	u8 unused[3];
>> +} __packed;
> 
> Endianness stuff looks sane now but __packed also needs an include.

Some fun statistics:

$ rg compiler_attributes.h drivers -l | wc -l
30

$ rg __packed drivers -l | wc -l
1228

[...]

>> +static int asus_qcom_ec_read_ram(struct asus_ec *ec, u16 addr, u8 count, u16 *out)
>> +{
>> +	struct asus_qcom_ec_ram_request req = {
>> +		.addr = cpu_to_be16(addr),
>> +		.count = count,
>> +		.reserved = { 0 },
> 
> 0 is the default init value so generally = {} should be enough but I think 
> it's not necessary to add the reserved member at all because the entire 
> struct should be initialized anyway by the surrounding construct.
> 
> With these fixed,
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Yeah I know. I still left it in deliberately so that in case anyone
wants to audit the format here and compare it to the DSDT it's more
obvious that this wasn't an oversight. Do you still prefer I resend
(or maybe you'd like to fix that up while applying, which I don't
mind either)?

Konrad

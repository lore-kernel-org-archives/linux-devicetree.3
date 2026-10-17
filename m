Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD035B5AB
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792199768; cv=none; b=JzvMI2Jk7noICeoUK85i5tbuZ32SDyYKFYXk/OTnAoKSiFBFJZ7Vi31auWlS6bkEVBnQi/95pfpncYiLzi6T75p/eF4YGpaN3bXaZptzMETv7FozM90LT/YtReu9s2ONk7LPfOFHdma3/qyvLDdoJyGyWUXkkxFrHnnliCu6SS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792199768; c=relaxed/simple;
	bh=N1UX1ePJTEvGDwKfCxkM5pQz3wXgY0ArFM7AyF8x7EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8fFxsMuJ3e4FOvQN0FnNQ6dy9bmAxVT1U0TI8ctDuogfZkrSJ2zGX2ajxphdobTZIvWYjOloGNdG6Kc37gDiIBkyJ8tlO44jfb7OKkGGTl3DqTHlGziDf8ZcMVzLOxJvXXVXblXMk9M2isBRvDGy9jPXsdD/MtZY/1P/2vas0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHFrDeCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIzcYpfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHFrDeCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIzcYpfr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H0JqeE3611112
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=; b=AHFrDeCMOkINo1kC
	/0JQUdQs7UnjSYAc7H2oufk8bzQUzPq8rNnFcymWR2LRp+4MfDb3lnwT8NeQNV6B
	NoMql0m20iygtC/kjWNGO4Am6F8uKBw+TQhGnldWSHBYQ6v08DeZulCVGy33UUce
	ZXR+5QCLhhwHPFwcQ5s7sbAadAZDIhoyZB+HN4+QH5dPZMX0x8BfdXSIICCukCSr
	RG0v+0MtLOPzDAG+lo42l3N/piOUNNUW6fi9GB5cudhLBQZdEUNuk9f/KS9olaPU
	xj4B3p9kAoyw/tQ2rTDc+4SSesky/Nu1g8OjGt8YzH2pIhve0XEEMTDhIP715Q7v
	vXzlCA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnr3fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:16:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1105052eec.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 18:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792199765; x=1792804565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=;
        b=gIzcYpfrX8ROvWcjHZ4kA9r1sIMlekqnCOHhijxs1s1mXbalErW7jGahp0PwL9PNKg
         JxIcnTjsn7eEeDk+RTgXRthk1/Oxr+Pchs798Awsq4fTX69q2cbolBh/AtIeH7c0sWMa
         QwQF3F/OmN7KvUmRK1Inh2sjVesXXrsWMBO5JFQsenLqisXolK8ELxzbaGMcCngknLkp
         1qVYdTsolPaKLO9VEgTyf65Kex98Cs1TwfD3uaLzOVN97ttJyQuzJq0cmJBCPpzt78hH
         Sd3LpQmOYrGZZcXoz8HfaOPOAUeH/Vn3RpvQGN9ZsUWsx/gKdBVXjS5BC81YXR/IJWbA
         +qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792199765; x=1792804565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=;
        b=n3nulBqAbV3FDZlhPOhsvNsGx8znXgxwvGzoEbOQGMem/ZND+MGAVMPiblrHXVJbQL
         wMBBgM7SLRhAB5TOqQh6iZX4Hj36FK/Z8xtt3+tEaIYt4TMIOK3l5GFejCiR7jbA/Sjl
         ExricNefrxOHjGtg9d3rc9T665VUQOz7phrpXrBsRzLMSoq1yoLqZzlE6J7DOTmq9Pny
         pxDQBRCppaK/iwqfEbMJDp7uxzpyokYNLyDRLFTmEuMCVAolXNtEe4NgSW1Rgn5txdMw
         CmfxafHe0c/0MhcI5CCLwyKFFwXEDRJI6VPoGIIORA6i8su+3hG1wWdCzTqdf7xsQcAD
         6FzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVPXBphvgoJopW74b6Wb3ygR6Lrfsvcv0ARkVCFGNCGPeUYTeyIN5spFHEUTFaRi715IdPvogK0SF8@vger.kernel.org
X-Gm-Message-State: AFq9FYK7fPDRkUk7mCVVP5Y+8k4HeZbKkKNLFrP582SeESKhsLBUPXAu
	GCY71XIz/ZuKWUixhBzv421XePZtSJNlOHqoNc4VFgVqU44KLCuKXxvslivI0tn7mL7fgEDnbaq
	jmxeoFYrUab+So6Dc4IDFWmOlWtBY4MEfDsMQsfPPA2MrwC6uuvOYitCkD+Bcc0ka
X-Gm-Gg: AYBFou1XFjQ4n34HSjrhQ58YtEqxiqFX9UGL7gsIuxILDC4iuMH3voWCTCsYCFwRvWs
	4rhZxKzu9R77iqQkOJWzNgYnEMfr+NE1leNT+b34nRtVDIeSVC62eqeKwYti1EMM9P+EvDEXs/N
	fhQkRYT4wPEH2rlRO559jFEoE688yG1wl2MnTbVAv1FffyjZpbl9xlvdbbx7weSM4ohpT0SzzIj
	IFsFBnwj3CnZ7enwAGkHJB07jOCYs27mkhCjpSq5xRCJQPQpqEfkGCC8aDhtzfEvo5vVhBjqr/T
	K0d505+vgC/WCbSe61CzEEgdHqjZcsWvT88U5gZt3pFJDIpf3T9GeY2xIEZDVIL9KUrxZraa+dP
	0TbX8ATOIMSWRdWCTy1mcJVALZexe4g==
X-Received: by 2002:a05:701a:c90a:b0:167:4198:2cb3 with SMTP id a92af1059eb24-18512c384cemr2002761c88.18.1792199764888;
        Fri, 16 Oct 2026 18:16:04 -0700 (PDT)
X-Received: by 2002:a05:701a:c90a:b0:167:4198:2cb3 with SMTP id a92af1059eb24-18512c384cemr2002728c88.18.1792199764314;
        Fri, 16 Oct 2026 18:16:04 -0700 (PDT)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ca95700sm8902773c88.23.2026.10.16.18.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 18:16:03 -0700 (PDT)
Message-ID: <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:16:02 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad2cc56 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nSKOGGwR5b_Qa3AChTEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: mXF_GVOlIL3UhSXDL8zHWk_jmLv7qZHK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfXyyC4UeFZWFaW
 RKdnAuvYufn6RUbauz0496nT+18EJXyluxQ0YANTGDCLH6l/6mXAcDRLvQFOtxpU09jlT18cY2Z
 jaUF5jM9qIZlqwuR+gtCI46u/u8YNBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX5iaV9wx1XT2j
 0LWY5wGKJLBMr8PtwhojdFv/D8afqZcXUtsEVje9SSBLg7XgMN1lrNlsrbDpPhFX7PL+C9aBf+j
 QLJwaKUJqXhqKn6175kpprgbWJMXd47b4JEtcPunERApBqH0QIZGAB85HjBNv826eWYYeNFH5Es
 sO52Ztz7yJflvJBpGkvyYfP+WoMQiviZAt7+VvQwcxj5P+VIRsvCyq6xGMMyB4BsJqxRNBG+90W
 wTYa0bOrCMr3t2AA++K76qTpqAvWJBU8zQo5R0JGK70mKDrY4ZmTpD/I9olvs7ODatHVj9NdNP3
 PXAA+MB52d5ClTcXLQnfVzXzVw+WrHpjs26A5Xl6UBIxBTU36xaNdDxAabdQ7jJSzZa8MDfu2xi
 ccDZfSH3g6l/Nk4/lQlbjNPQiZv7xSlLrp8+NEp4AkfmSSMEQxivuu4XCHOLsmACHRSdou6N1+o
 RbAPrV3raSquetfhHlA==
X-Proofpoint-ORIG-GUID: mXF_GVOlIL3UhSXDL8zHWk_jmLv7qZHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170004



On 10/15/2026 7:43 AM, Konrad Dybcio wrote:
> On 9/29/26 11:35 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
>>
>> Restructure the driver to support per-path role switches and remove the
>> chip-level role switch. Additionally, as EUD need not modify the USB
>> role upon enabling, remove the unnecessary role switch call from
>> enable_eud().
>>
>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
> 
> 
> [...]
> 
>> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>> +	if (!sw) {
>> +		of_node_put(controller_node);
>> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
>> +				     "Failed to get controller role switch for path %d\n",
>> +				     path_num);
>> +	}
> 
> This will always probe defer on a fixed-role controller, we should patch
> dwc3 to always register a roleswitch
> 
You mean for fixed-role controllers where an explicit `dr_mode` is not
provided in DT and the fixed mode is derived from the HW capabilities?
For explicit `dr_mode=host/peripheral` cases we bail out earlier and
never reach this path.

The EUD databook does not explicitly mention fixed-role controllers,
so I was assuming all DWC3 controllers relevant to EUD are DR-capable
and register a role switch.

I can see how a no-op role switch would address this case. Would it be
reasonable to handle that as a follow-up improvement for controllers
that resolve to a fixed role at runtime, rather than as part of this
series?

Thanks
Elson

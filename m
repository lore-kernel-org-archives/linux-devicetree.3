Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F863D3CF0
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788347; cv=none; b=C90laB0B+b795Uw7/t1pMKUyMHF1BG6+HnPl3hPYSlP8RGJb4bDjOI77+727jff/hABnrk3r7PeYWkz5pU9OdGmeBXohLMW5O4qXckZ3b3SZTa7pDn0DMRPTQ1rAyvUUsWBOSXo5C9wzj4mbOK7wYyHFn/ho2ffoIe0otfZlKAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788347; c=relaxed/simple;
	bh=xGbbke4qs67cQaM7X06MHN9UsL3fDt1K8ypn24U7MH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzIIlnJOSgSz04oqIA9ndsTX1mV+8weXtV6wCaP21mfi9w4ANJQn4hzybuhKniVaSUek7hN1TzHxR/AqzT/UsTBH4oNPFHo/e7x7WCw3g38oafUBlG/uQISVhmbE0cVNgTaxczyCh/Yo2ClaqFTw1Sxvq5YbkhCVaU245CzCY+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLVqS289; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbQM7Z9Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLVqS289";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbQM7Z9Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5Pqfx079206
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUEHZrut4x8hOGmiwUwt+Zp4CsxN2AZtJNhdB6w6WY0=; b=lLVqS289yE9mP6Cq
	27Xl0rqQcHh8cOK01DCylyNL5RzIzjEqcPYKfbgngji/85uQLpq0zgpdiqIjBP/8
	wXElgFfXa1D5wevf7Flg394sypcE0UtT+ABY9g7Bqg9d2ppOaK05B/msiY4NzZQt
	vgfVu2PjtLtP847KckxY/F0hkMskf0pJrvclB/NCN/dQBaBT0xYSY90dQlIcDpNj
	1huCbK7rnmPUk/jGDaTivvcAKGVpOGl++L68H+ygeQZbs8iTAPh3MzS0fP5zCaGD
	293QORNFphaz1CfCzAzaFHTlEltL4mwiwbOhVUFSJzOYlDhowVLGUFdwj65V2TUy
	byXJfQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmac25p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:39:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662668b825so3197317a91.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 02:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779788344; x=1780393144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUEHZrut4x8hOGmiwUwt+Zp4CsxN2AZtJNhdB6w6WY0=;
        b=cbQM7Z9Y/JMSKTD2qE/9/eXVetKjsnmFsAcgJhdxRG3JL5ZhlB38wEXWvi9B2pOl8I
         uxgU93cymOpig4BGE5f/tUypV28jhGGn5LGZpNO/HgK9XS91fpcFr/5LSj21U0za3HZW
         WNGAmo2Pd7kCsSfv4UearNbAQvmfqgY7daE41qaTO71VDTSK2W3B5NZ7XyZriq2oYDOZ
         5AuFLaU/cq6p2VcPrOv4Jcls8F2QuGqtRIN/5SvNTx1Zp0zOPLksaD1NPcqw0ai10C9k
         Me+POorHtnd6ceMEfT8nJGmopWnayh4IULmAPanstb7I3614tG1NmyWwX87iQnGB+cQG
         kc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788344; x=1780393144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUEHZrut4x8hOGmiwUwt+Zp4CsxN2AZtJNhdB6w6WY0=;
        b=dPQUBuewxbRZgt7HWKkeERlSS4RBnyXGS4ZYOfbCD08/K/ue/E1mpRJbMthCwDtKrA
         ZA1coQiyDr2G/+TSuhSN+JSv2fe3wtbh+Wq5pzUsHT2jAWJfhuhsk//uuFbRl5T6RcNU
         Y+BptzzNH+vYN3CwbPJ2eqOOcJdiBf624wyTjzyNc9g6Y+oc/EeheuwDIAQiiUgqrbkL
         nJtgA9u1WfEFRQSFo5IRRcypj9xRAfUigsNzNwCVckrbKUD1lV2O066QZW5oSNFgONvB
         Oy0SvfIrgt4R6Yu85Rb2HMgCu9Pw3WjJM22krvb/YXM1FN1ehvN08k04H8OJ09zxIklP
         TlCA==
X-Forwarded-Encrypted: i=1; AFNElJ8jQKNDHddCHAQ1mJSBU/qKpy7JHWNz3ryaorQYtUUsEyJzcbgQDRZMb+uqG7/mL7lvbDlecQegD7yl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dandr6itzAeVblsjAAh+ZWYM8aZzy++HeStQmHRMvuQ+rYzq
	sjCa8CGTVU44wyZtmEJ3Urz06W1mAKikNb+4cpOhD1feGqkwM8OqVL5FbwqRPT3GdOSHdCmdIOg
	5yBlqnmF4yVo7Yzt9N+5IK+gTH7oJh7Vv26fzvzWn1KjTYUuCP/JOKMvW7CRojbax
X-Gm-Gg: Acq92OHZ8gMjkbAx90Xd0wc3LOfHLaOMMglI+sIkydnUZ9YPo2LfgaN5bAU9+FG3n73
	fad60grzu18yWXGZRVqqyjk1rBvgBX8NZ8kIf84+E9gpOqSFUNRxyf64X53qSTVrf5qAA6GdIrH
	PMZ+zWYeTLI3DxD3D4VnHDFtVf8bjieZcqJ5F/IO+/2JFMChZ7RgL0GpZYE7T3W48bc0dA/MPHZ
	/k98jONB6VV8OkgD37LUKjSwgedgpYk1OMRnf5I45AX305ZRc0jOS41wYpDJFu6bq+0wtn0dWg1
	sIuUBQjDgOJmQve2QFBRuJjU5CO9cjX0LYOKH1w8vkM1XZFHYpJNwWcwdY+I6OshFwFOJdJANJF
	g4Z5y2M876Ts4vsPd3NHiNcOpTfDJ1A6Mywxq7ndYelloHL7muaUZ8deiBl0=
X-Received: by 2002:a17:90b:2b88:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36a6785aedcmr18232541a91.26.1779788344409;
        Tue, 26 May 2026 02:39:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2b88:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36a6785aedcmr18232491a91.26.1779788343870;
        Tue, 26 May 2026 02:39:03 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36af07555edsm1381606a91.5.2026.05.26.02.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:39:03 -0700 (PDT)
Message-ID: <e438be10-e8b7-4c2f-a0a6-49a61da491e0@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:08:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: mp8899: Add MPS MP8899 PMIC regulator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-2-30d14421b7f1@oss.qualcomm.com>
 <20260520-luminous-tacky-swallow-a455d3@quoll>
 <0993456c-40ed-4fc2-b9a8-036cca928709@oss.qualcomm.com>
 <a7518314-727e-4932-aa60-844a5ec79ab8@kernel.org>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <a7518314-727e-4932-aa60-844a5ec79ab8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a156a39 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UBsTDkLht3fk7gMvnXgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vHyDz1Rcun4GtNl4FximFNftBNt73nsO
X-Proofpoint-GUID: vHyDz1Rcun4GtNl4FximFNftBNt73nsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4NCBTYWx0ZWRfX+25204w+fgWN
 n+zVKV6UVlvhvAyoAV6VUUPlaANulEnz9EVNwH1PtZ+s+qufNxCcFx2cx+vlzjSPcTSomZCrIct
 /LioYGBzu6qXwiRiWzeC4DgcTmV7UfDdiWXDAAQv2KflpoW9RF8reyUQTuITiXqIRZGPNY5SG6T
 SnNOEN85IFcRGJiaexleqnShVv/CqAaczDVWxOQ5W+pkDrkH7OBkZ8mJC4WtF4LOk08xdTquodG
 XbwWsvTdrcLO36x71iC3TlUt8y1iF7vitFYv6KolFQl1S3IQ/57ZOF5qZnDwjH7P/b+F6S7GDKi
 emO1BI3Zge3I0p547Rjgy1n2M9sfEBskT2Qb0H3FTDoZo49yyUpKqHx9A8E4fCXhCMPjPL50BzA
 zlzvx2ZgtySQvLnunUST6CkSrt6ComdpMAaQo1QPYzIjDznP0uoS2ekdnZRv1/dE60/a48SDm1f
 /4cBqEjCGXmFVGjaw7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260084



On 5/26/2026 2:58 PM, Krzysztof Kozlowski wrote:
> On 26/05/2026 09:39, Vignesh Viswanathan wrote:
>>>> + */
>>>> +static int mp8899_i2c_probe(struct i2c_client *client)
>>>> +{
>>>> +	struct mp8899_regulator_info *info;
>>>> +	struct regulator_config config = {};
>>>> +	struct device *dev = &client->dev;
>>>> +	struct regulator_dev *rdev;
>>>> +	struct regmap *regmap;
>>>> +	unsigned int vout_select;
>>>> +	int i, ret;
>>>> +
>>>> +	info = devm_kzalloc(dev, sizeof(struct mp8899_regulator_info), GFP_KERNEL);
>>>
>>> This is some very old code. If you were working on upstream, you would
>>> notice that syntax is sizeof(*). But NOW the syntax is even simpler: kzalloc_obj().
>>
>> Ack, will fix this.
> 
> I might be wrong about second part - it seems there is no
> devm_kzalloc_obj, so devm_kzalloc is correct. But anyway please use
> sizeof(*) style.

Sure Krzysztof, Will do.

Thanks,
Vignesh
> 
> Best regards,
> Krzysztof


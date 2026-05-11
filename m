Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B1372ECF
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499000; cv=none; b=GglIIq6zO21VSF79bUg0YurABTySqDPFJIJRya6wlwIHiSBOCcUZvlZ+Zq2zn7Zxvj/eYoW2HBIHzpb+J6maB3Zxn9Tfv7Ra8sszeOCMlAQALoy+gPqY8lN1XTTIidvhWyF8XYjnWGEuZX+NggQjJW1BtQxl5cSfATRetfcv14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499000; c=relaxed/simple;
	bh=8xGv9bUKTHf/ZB7Ao/E/sq5w6bskwcGpeSkW4mzz4Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFlAz6nZnolyC+Il91IQ64er4Q0hcUZxQnctLWsEW78huflY7yVI40zyM0GIfqgEeF0nHQD95JzNdGcS2SgkL3Abudhgbl+/9ZX9Wqz17ggJc+MzeOWFfkjUrf4/nh7YNrbqgEOGvZfwZiTzdqjZymAxd91tTU+ZErODnPJZyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmWIukNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRpfVqSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmWIukNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRpfVqSy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B79Dtw2575028
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54Qf1gEPNGHjmFmXmXwQUZrhQwDWCIR6PrV8xkmilpI=; b=bmWIukNYsoGByNKh
	gJ4IZVCWKYIG5JF0W6IBSHTElBRcA1eKfuP4nFa0QV+SpFI9Ngq3aHhGb2esmHcI
	/h6bMpDWf0dB83KUoYKypCKLIJPYs8E1RyjokCH8yPnoT+alRv14l7tVhLWB7dIl
	2CsaahDM547mqSksddxYdMkb96eHBGQntIPBc7mnqkr9CxoxyVdlfAM+CPnYP1zJ
	FR3YpNtUMb+y78cLZsNuBM9/gbb9OZHl5Rweam5Bx+UNZ4/Y8JtrvlHNZ4gD596b
	yfaguNig7DQYs8GKpRMxMAIPXhU5l3bfSI0ZzUoJgFO/V3Qkp360JS21qqs8Tpxi
	zlo3IA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79np8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:29:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e429ba4dfso10341621cf.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778498997; x=1779103797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54Qf1gEPNGHjmFmXmXwQUZrhQwDWCIR6PrV8xkmilpI=;
        b=XRpfVqSyUAfHYo0ZH/W67GYbVThDZIprP1PBZjOwkIFRmt0cwZJIslBaAW5Gc+FFNa
         SfBYkwATC1kHdVnQMSn7dtnGmaGZb45q/b3Cv0qECV724LmNzotU9GKNusSTd2daEfuV
         Gqj0NoEzstiojS3AXNrRQVf4jgRSGjtiWScpt2zNKvByGq+/xTKWbqg+RK6zqOanL06D
         JriplDvHEgsLCB0ElPgRn/CHSF/xtDa62+yph+p+4NtbZchXloU6A/O3yqSyKm/OvkDj
         MX5buNbazD9ONQuT139hwT5CfwW3V18SueTZhHpfHkR8d8SWHdOuD4sGQbBrGx0C8naI
         5pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778498997; x=1779103797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54Qf1gEPNGHjmFmXmXwQUZrhQwDWCIR6PrV8xkmilpI=;
        b=tQfX2oVLqkjiyD3O81vCe40wsbuZaqLdCCFtva6SOipGxotcG50DwId/vGBkIvIIxp
         Cx9kbOfEIBedrB31rZlPmCrOjca/D1SUiFs6qIn/X8hrWhb8QXTCFdl/c57KmBON6376
         980RYkIltyuS7jPK21GBg5fjBS1RSkWAQsuOme5eWg20F1ILUXhWLkCkxane1FpP3BpR
         w3hJSe3yUsOIpFOfaNduO4G+CafFvqyDP6jpPF3zuyNNJSTVfee6N98+ET96JuBAmg97
         /aOB0j5JCSP56YGJOYSe6fOuU1LlM5VO4Vt0Sqo7uOm9Zb+OPjT6zODgAjytSBOY5ohg
         tubA==
X-Forwarded-Encrypted: i=1; AFNElJ9Mf5RKJXmdUowqg6ksvBw6OQHDtt87ISBDwBSNwEonCk0VDQHmPsK80s5eERfeiBVJs8e4LcLA1KNU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr001pds3Z5gjfauodgvPMrWoVfyXZQOplIKzHLErcR9bL8qsr
	H6d0Ro25OlM/iTsOUVRXEEp5auxXPk+Y6cLYFC00+OOqocxwJf05Tx/yDu0ytTpup9TXF+enIyl
	OHbg2punoG4H1SA6AC6U6yS60q7N3kVjRcb+vFN6O2mB7mVPNHiOWyciKlynJaR9/Ozq3CjEd
X-Gm-Gg: Acq92OF5KCO9ZmuXM8NNIpUBEfCh8dz6yRAZ8AAAwruIk/a1iq//ZlXFeRo+CLP5LSm
	FkqJFNvCYvHE6gisLK0WP4Y+WSZjKMEgRkxWbQFa1sXId+ewiesNkLHtQp0nCG02xQ6uoqO9FVc
	Pzs7PgEJlqihESJkOTU1Xwz73M5fHr0v/SxHXS+cOCrm3x44DwY6HkO5oNcD7wKJM1C5P+qqnA7
	LyqcwVD0I/tsWA1UQ32dG+fCHJap9onZ8FZCgQ2FJifeib26ikNFE2nUKjWrJMcPcqGjvC5EpgL
	9KDq8FnANll1dvXxtyMf+mliSET4Q3vs+EiHEvPhQg5ER2sBTsWNU9rPCGt9LypLX347su9xjk6
	d1Oy9XkbagP3Nxu673960bB4McitRfpW/yoKYDd84ndrPcnjxCMIQvWYm9y66n/yUBttfRvqw0m
	ts18Q=
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr231374161cf.0.1778498997102;
        Mon, 11 May 2026 04:29:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr231373951cf.0.1778498996632;
        Mon, 11 May 2026 04:29:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1c2f9sm3593976a12.28.2026.05.11.04.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:29:55 -0700 (PDT)
Message-ID: <d63e251d-439a-4514-8b39-cc93b056bafe@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:29:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake
 GPIOs to PCIe port nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zHtnu54n0kq56NBVgMKJ7w0EvGXGzN5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyNyBTYWx0ZWRfX1tCtLOeTmUwH
 NZmfFOleoWN8NAGK5lXQ7O6FkfGef48tmGqVvtd4NQ3JB41zMqSAe593ckICaTsI0og0jTuizPK
 Yrc5ctyYWe+hB4eTmNnlZ9wgQTxqSZ9taHuH3ZMo4x3ZPwgvumOURCWBGrahXknSpD5ZJUmwNTY
 M7j5X3PJH0lWk3YgIbkgVDiwGvvSn4jahYfNWrff1zCrtQErxgERR7kgAq9csPq3BPuueUS3mQY
 kPVzshfSLWSJrEC49znZqqHjx8GMwDmSE47u4iWV8rd7B0JyqMMPn64TLmAIBTAjblWNnMHx4yS
 B0yeHVJY2rB3sd6LhzRkoZqx7G36KBt6Ks7/CC24UCbRKDCSIIUR+ghKHKBJ7YaTWL7QQjBYNcl
 cw3b5VNkab+AMEXapqJqp0gxFH8cmiP9Fxt8DNaQ6OdXgMW76CZ80g6wtBLQ8vbs9F7MxdzElj1
 oiIEe9YWPXIRiIVSqOw==
X-Proofpoint-GUID: zHtnu54n0kq56NBVgMKJ7w0EvGXGzN5i
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01bdb6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=uuc0Ltyocxd8-3Z4bL0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110127

On 5/7/26 4:16 PM, Xilin Wu wrote:
> Since describing the PCIe PHY directly under the RC node is now
> deprecated, move the references to the respective PCIe port nodes.
> 
> And also move the PCIe PERST and wake GPIOs from the controller nodes to
> the corresponding PCIe port nodes on sc8280xp-based platforms:
> 
>  - sa8295p-adp
>  - sa8540p-ride
>  - sc8280xp-crd
>  - sc8280xp-huawei-gaokun3
>  - sc8280xp-lenovo-thinkpad-x13s
>  - sc8280xp-microsoft-arcata
>  - sc8280xp-microsoft-blackrock
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

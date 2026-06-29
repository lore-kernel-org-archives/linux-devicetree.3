Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6814884C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731471; cv=none; b=t/cYre0YME4o4oPCajca8NcoMeXJO2PMELYeDKPDabWM7hM8cpJxO0DKar77m/mcFagNJi2z81J+UJLFW2oA8rappBdrglWFk50ScnUtMlCsGcMnzy226D21UF9lmYeSZxazy/Gw+gh84GYLCJ7rKW4vFyXhtkZVA0dspxGja2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731471; c=relaxed/simple;
	bh=6VI1cOI4DIVFsX2jNSg2ArLpeV8w/QTRo+eIPG6eK40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLo27AKVveREjDiipxlSdoZ9axuwNVLHvRl2LpzpxcT1jYMqUmQQVskCG4aXZ5kxF9bI5CYVcySc9Nry0Y/sAH8ZJQMJ+sEVM7XEpI3WKeAkCbMuS6A8JySzNmSVQL5FLlRSSabMyne/UL8Q5dlcZDcVV3UJmBcY8IH4a/UWbtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSuOCJ+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/FU0TRv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSuOCJ+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/FU0TRv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATE7j2579138
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=; b=HSuOCJ+zxyreW0Hk
	IyDtB9ytcO3gjFdlN1o5A9tsQZ00nr5VO/Zl0oxoWn6IHiwtq2vXO3rDTYhCri5A
	qm0S/QSFeST0yw289rrveeZhA3CRBNVd/nmJphq8qeaZ8JxE/5QcI/3qJpTunv3f
	5KDnrEt1AlmiHWTtZzxkviB9bWjsSKcaBfrLMllOvSKV2DjxNL6y7WXIian91fZE
	CTSUoBcK6u7JhftAS1BqldyeBeUfruSPMfZfQ04ZrAsT6BpbDDIqwm1bOyeGq4hd
	Cu0ILbeffTMdQ7L7CK1x31iVhYuXXXqMOCkPFTCey7mvxkRm1E4YrJkjTMLazMs6
	KeeZcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7h1cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:11:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9ae1da340so33096435ad.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782731469; x=1783336269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=;
        b=P/FU0TRvmrNd7f6WKU5sOzzBIc1JrV7vN04OTDt0IZICm3+mn/VWO0F4wHyEUYgyFW
         tS5p9lVjm38ydIqLadD9DvhcZUoCFWF1gYHz5yU57U+X+62agv2WaPaIwjL0UNm5CU8g
         btb3O4ym+4IjkP2veb4FKuGLgYm8sGRL++jAumQlnhSl2iZFTxL6msFYRP/PBs9dh6lr
         wK6IZj7DRb6mD8ER3y1UH6GJ8obFJqOStlwCr9MzTn6BpaeVBFmkOf2JzVdQtvm/bEoB
         TSGk8H0s8CQGUDxV5+Yndxwv1L/yyww5StBlvqMtuBzeqH0rhXszAJenzUbkfDcqJm8R
         9tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731469; x=1783336269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=;
        b=GZaljcbDrNO0r65HlEIIqrZWPyO6WvvGXL5/g5Z6yhesA/GY21wFuy4bnDxpthJKSP
         CmLCGp7vd2fnsSCayy278QbxxT7vBCJpZdOWTewdOgtk2IXH8w2K/WfzmxrQbyooOJL0
         P/+5WIEpMV41JUksnLR0tA57evTfrUaW6ISGbNJmGYPBHkbcvwpaexNHztt6CYDUlRQy
         BoE3aXa6Yr9RobCJGRa4CIqTLxyQ3DLWQVmU+tZqG5xwpdqDqByPRNTg+F9lEBRI6fl/
         U5AcbDBEpZbEaLy4SCUQhe5U+wEaqWydEMkD5DyUIPw4ZzjEQ9QUGKy5357/1fzrOlM0
         APjA==
X-Forwarded-Encrypted: i=1; AHgh+RrPlriChpx5AfIHdNAXy+c95IUcpFIG/CizQyYjJbxDTkntNDazPR32S4SoBAQRse6/vPpeE0QsmUfx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/TbuwfIMYxHh1Ennk+nJcU7cC6GRKKnxFfESAY0xP21aHS1f7
	x1sfEKW4RiF0ROgE8hcfF66VsglZZGxBunIu8/xy//gJqVjoaD88OUDPU3H+RlYa/MFez1gyblG
	yO0lTMf38iB5adB+AU617cjqQZbec7wHJ+OaVaVxJ1xN/wAMVDfhHSzBHbKmIsxKY
X-Gm-Gg: AfdE7cnbfpA1HHsyRiJMR1Rmrzef6R9syMhCEQZr/GU4bXt2oBCU5silBe1Qc4N/Xyt
	xF4XQUgKIAf+/zTh5AmfsqaRRtjJ+MjKG5Rw4IuDiSVjAgXviZ0pSjuqJu1YlD6Au2OYMnTG7qg
	tq8VC7XqGjWRfZciSWShb7vo5u7kaOLrSEGDUrQrOGrDQJb8QMa7fo1tUhUuqbHuD3/pGfnjatk
	FcUer7wlJa+BKcT3TDBO4T7TAkg/Xyh6HgZngHsvmAxXNypXLqR0t2d9b1BCqrGlHtHB3HHBqwH
	Gn0CP2oPZEjN5MxS0sHzhkv62NzG0tiX7J+y3B4yCNt3yAyC2NSii+FXFBPhr58SGFhvOOlUeNf
	SzE/X0tSmimR8iohoZV1aZ4250hn+MyPJ0f9QCQ==
X-Received: by 2002:a17:902:db04:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2c9c46b131emr62758905ad.34.1782731469362;
        Mon, 29 Jun 2026 04:11:09 -0700 (PDT)
X-Received: by 2002:a17:902:db04:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2c9c46b131emr62758755ad.34.1782731468960;
        Mon, 29 Jun 2026 04:11:08 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9f452ccfasm22477525ad.17.2026.06.29.04.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:11:08 -0700 (PDT)
Message-ID: <11514281-234b-470b-860f-e7c620ca28ec@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:41:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
 <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
 <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
 <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfXyi4v3u3JfcNX
 DNBSarP04Df1juJdAVWS4CZ9Rsd0GsBPdsAWraDNyZIxGqCsdoCXPKJCgt12Ox/eSmIfdUGgVzP
 +EBlOZnKU5z4pE3nazV+hUDxhUGzIIQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfXzbqYFcHKRwNI
 kew0Xl8gbD2qQu1qLVMyBRUXpmGHWWx7NjDsvRgP2l3oUTb2O9m+1sm3F8qQk2CFSO9L0hZEKcX
 juL7pkrrM/U2MGXTesOsGUz4j2pMKscTuE3CJvxaJpEqC4jm/sKHHMbV1Yp0mR5GSVLjGleNCBl
 h7PXWt451qRPg/gB+nEDJW/MeX2LUvOzHiSOYrP0uYT+KqxTAptdR/rpNyyfpvoDgyyW/vuxSdL
 aGPq1sD+QzavW8MwY7QehJNmOmypff4KUHBzM43AhWZLPHtAviEiWEJd2PFa75E3IN+oYRWeuc0
 CzM1bllmaEesk//Gw5Aw1xzkcuKMg/a+4GqDu0clmcHspEDDhLuQhpsaQVrE2qi9SwZQAn2B5Pl
 k1Cg5iAz3pqyb94vRNm5NWfeIQyUQJZoMbCtQ1NPKU1DMIekyegSBnbZTNtxR7jciaRaeL16AKQ
 SR208/Zn/U+lNE3ey1w==
X-Proofpoint-ORIG-GUID: pUVVuK33RinMGaEOBo_y_svedmUTYCxr
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4252ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DhQjvcdHTzzIjdopfFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pUVVuK33RinMGaEOBo_y_svedmUTYCxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290091



On 29-06-2026 03:21 pm, Konrad Dybcio wrote:
> On 6/29/26 8:43 AM, Imran Shaik wrote:
>>
>>
>> On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
>>> On 6/4/26 7:26 AM, Imran Shaik wrote:
>>>> Add support for Display clock controller and GPU clock controller nodes
>>>> on Qualcomm Shikra SoCs.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +                      "gcc_disp_gpll0_clk_src",
>>>> +                      "gcc_disp_gpll0_div_clk_src",
>>>> +                      "dsi0_phy_pll_out_byteclk",
>>>> +                      "dsi0_phy_pll_out_dsiclk",
>>>> +                      "dsi1_phy_pll_out_byteclk",
>>>> +                      "dsi1_phy_pll_out_dsiclk",
>>>> +                      "sleep_clk";
>>>> +            #clock-cells = <1>;
>>>> +            #reset-cells = <1>;
>>>> +            #power-domain-cells = <1>;
>>>
>>> DISP_CC also needs to source power from somewhere!
>>>
>>
>> The Shikra bindings aligns with the existing Agatti bindings, as it is a re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be always ON when APPS is active.
> 
> Yes, it will be on, but currently the genpd performance state requests
> (i.e. RPMH states) go to /dev/null because DISP_CC is an orphan
> 

Sure, will check and add the power-domains support as well in the
bindings and update the DT accordingly for Shikra and Agatti both.

Thanks,
Imran

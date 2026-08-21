Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF65647FB03
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329183; cv=none; b=TX3zUn0ViFysr7JfAq2/USXxwpYWo1Czlhrx/T5oUvWLDMHtBPN7nrBzYvmAYGAgO4OZOrFKnsUvSckIShKHMSTf3sMywxKMb3MmvFrxq7tCS3NMPFJ9ss6NpOKjCRGKAPe53Vn1cJujBY2JqRQ+lI6nhdLIXL5/uTIfci2CVxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329183; c=relaxed/simple;
	bh=X10fgcE/VdvZBiLYK96ZfvDAsItFNmfond2stuPddA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ueUhjJf1cpRLcLY6RHG2BaB9is31MbmcxsLVaxely1xk4grCn1A5jGN3gOGEb7hnRlTfwGrKwlX3aYNaLIt1LkzuTGky9q/BALNK5uUkXgBeRRtXC0TL6yGHM6VT1ojUL3PV9t8uByWkfgTZWAdUR1snxT8RssC5y7sNOVdWfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N71lhcbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1IPRsxu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N71lhcbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1IPRsxu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmG2d2403838
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=; b=N71lhcbr5rc5+Ma7
	v7CHr5pI0zWKHpS5WKfVzmaKWSDa0qPLNneY6rafufgyARMVgi9FcrqVaWYBBHrY
	COagBa67FingibI8pSKl3ZwRQA9CnJ5QMJBs6Z4TjfF2GhOwIr2vp3P1uMeIIG4t
	qmYRQR3ydxJpNjiwhamZ4GfR6vuUGjPkmNG/wjhw7aue4GfQo+tL4uDY2pkovlLi
	+dcVHB5V7ynk77UYXI9igboWYJBlMlZ7vZXn8ML+KVjbaIDJLqogTXzyrh2tERZe
	Q6CfduM2rbDDPPMwB9E36inNdUhnSpN0Zzd50lct6zIe71nJpniAs06X+P+IOYuD
	gULumQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d06b4qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:19:38 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4488f192768so1702217fac.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329178; x=1787933978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=V1IPRsxuDG6rg7FbMrCs755o/yJHxniVx8t3O/XDpKeH4JHqh1Ejeb54QKZEzfxhOZ
         D4RY9/mo5xct8nyGObaLIoZ+0V7t/vcTnzrHpjTQ3ccBZ7tqbcfS1lAXhUK+yR+8ShQc
         bRKNg1rGygzqSjmoPFo5enrWMg/tvvVdLSbuJv894LBcpbGV2wfmBnelUHzNzjOoLV8d
         N/xW0oNLqVVMi+eVmy5Dj6fAZ6BIsDVgq6QTJRFG2Ek4sDf8emYqY5Sy/z8+ALYrTRd0
         aF3qqjks6zjWzbAjPeetunghHd/HnjMrh5OHsa+VqQC6SM1ZPpdo1YmNkQi9fgjjBX6o
         ad5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329178; x=1787933978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=GNyF+caWxML9PXOh+6BmlayN60nsqwLvR7ihb+balciXSn0MenduTRXFy+m0kqXfNl
         z9Wcfzp7RkjbwufcJ//Rdf/OqQC5zdj1HLC6BIdkprs5aLsrrrWg/N1ly1TLByJJbhYD
         XU6Qej+AzSgxFPYI0tQIvgj7aXketDF/5a0T9ut6DvRYTMWcKdyu00eUr6p1oSiPE6j4
         xcW+SFoo8wM4B57XY5JJ/JDZVtnahdyOCTIet3aoaYf5nbQ/tpWaM0eLayqEUIzuP1Dc
         12ISWlvo+wZ+1b8NQWGcMck4EA3R11qzSt3IxH4m5rd4Yc/tYHLsaiX8+cBsIGejDGBT
         qkVw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/gbAUAuN7esOmgbVkomuoWOeICX2d9nml4sF0XobQcEu1FVzTfYB8HtSGfjtR4t1qv00/927t+G71@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs01SxWIxhHryEGi48LMvpXuJfyMwGEkZziSo9SC9Yzps46DBg
	ulsXCbzg8remEB7UHJAa5SWzfd+1dJIt7JOXbQoD1R3+HprAXLuUjiHqVuxZQmyyQ82V5UtrDJN
	5dnvwwJtYh7+wPkCmJoOHtYYRQkyJavvUKhGa886eIZa9+3LkcV0SUIQ4Kq0ayJgd
X-Gm-Gg: AR+sD10w99dvs04BAaEv62en4j05AdNTx50NwsaP6nCETUpWqZWOabyr1EzSNOK4MuD
	Oml85+5QKfmskrMFKBkO3imlrT5cS4E/z0a4b3no/U46UL4OqO9E1bduHqrh3mPaJdmHO6+M/dc
	1nPahd+9ajwvgbAKWmIM33ld5lT5BXa5GHQUSshP0ULd45GuIE+H9BtJmivqouLu2iPF7soiZaS
	CspqMn96ScLZze16Cx9ghug/OEn6ezM/ks/JTwAfqKaoTlU+mmfAD8jNBF1Ua79vw2xDxo43wWS
	R3YEAQ6K5EegoLSvGyNm0DIhjdOIppvTh9hXKp4wtFVmx8zJ2cFJPvWDrnDnb1kXVt5ONXEL1HG
	uVpjStC9Qm97lQB2g+FRfkNLn2EUevRLq
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606910eaf.24.1787329178080;
        Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606821eaf.24.1787329177641;
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632a6c360asm4738369fac.5.2026.08.21.09.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Message-ID: <c82359a1-6b64-468d-9823-a196f291df0c@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:49:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
 <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
 <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX14j62VUBiuKM
 rPEmw9qhYCQPPGW6CbcodNoICgzA/xSV3gP2V99eL54R3DefGvSc9i9/Lla9e4D1NQt6O9Uf8rc
 f6ImGbQyevgs2SnAi2aVdWVCgJcLSBYPyuKopMPk884XKl/lnZpjeWESltyf5TuMbtpCeFEMx5H
 DRQsUwZEICOI7g3HVQOH41qV24akN2zyQ535cs6FrUkp1HsxGtfw2hqe9BSULq7nSzIm/nBHv4Q
 BpPZCskOr9Rp2XfNDQI3nf4DcqbjNdUPpU6g5w8wuaNCEsKHiJuKq2nNOteOPbAhTsKuS43iAfv
 m+S6ol4HMGb9/oEtW/DTd/VhrWNxUbt3Vhg4efNYwAVLneewztKNqWMwtBKtyr4R2oPR7eRcQyU
 Mxk51UvrQRsDulbGG5oqD8xn9/ZQhVCN7rKD2STrnIo0Qzc737pVfE/Mzk6wbeO5adkjBmwy1V8
 lcBR9HaTeeSxUUIzyWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfXypZTd92Bfj6s
 4uCHNBm8u3B6BQPeFSkPFOWFuGcYUX//vHS4lwn3WgZBu2V0RUhsIJLkc/gA8VQLY4MVcigv40v
 MHr3/3LNLZZvo/pDIaCmjNwhDZ5UeAA=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a887a9a cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A1cAmru4g_ti7Hb5znAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: U8MXaSE3BIjOUvdC5lmJ6klfp9Ww8oZK
X-Proofpoint-GUID: U8MXaSE3BIjOUvdC5lmJ6klfp9Ww8oZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210127


On 8/17/2026 8:55 PM, Konrad Dybcio wrote:
> On 8/17/26 3:42 PM, Hardeep Sharma wrote:
>> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>>> interface through the common pinctrl-msm driver.
>>>>
>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> Function3 can't be selected because of repeating names
>>>
>>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>>> Perhaps there was a longer name that got truncated?
>>>
>>> Konrad
>> Thanks Konrad for review.
>>
>> It's a real qdss_cti_trig1 line - the in/out
>> mirror partner of funcsel 2:
>>
>>     GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>>     GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
>>
>> Both map to the same name because the driver uses one coarse
>> "qdss_cti_trig1" for the in/out mirror variants.
> But these are physically separate functions, even if the mirror feature
> makes them seemingly one and the same
>
>> Listing the function on both funcsels is the normal sdx convention for
>> these mirror pairs - the in-tree drivers do it, including the same pins
>> on sdx65:
>>
>>     - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
>> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>>     - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>>     - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
>> do it.
>>
>> Only funcsel 2
>> is selectable from DT (first-match), which is expected and matches those
>> drivers.
> As you described it, you found a bug (FSEL3 is not selectable), please
> fix it in all the instances you've mentioned.
>
> Konrad

Thanks for review.

Corrected in v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma


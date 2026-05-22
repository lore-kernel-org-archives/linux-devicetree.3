Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95E37D128
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461629; cv=none; b=NUyqLXJrXzwiL5P0JbbY7TmRw9TTRmG8MT2+Wkf/EQHtRk7wJsFEHqM9BWq1VsKfJMS11Hq+LYH1jZfgaadS/zGXwlwkAVA6nt8lrnfJ82ce9Y/ZEofrVSH1plgbU6TAehlKSGnesQpML6j0WXm1VpjSw4v5t/PQfmWmOJH7Q9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461629; c=relaxed/simple;
	bh=/hE5m6idKzPlu3vSzifAN7VDr9wafOIGeMe/a7NlIic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1nBbK4Y5Odgtd3UWa0AeLImgX7wUtW8bf2a+GUwFS5oueSopt7yve4fQoula1ezlNLKtgiEkJjcHkIJTwFDVoTzJXFaWvNTTopsfk+KGNXJohfMUjQdg2swCFB1ylWOtekONgbCPGza7/8miDd8HLREI+bSMoH9UwjYqxnsdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8qdpqXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpJZHWi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8qdpqXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpJZHWi/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MEmcqv399163
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=; b=A8qdpqXIdD+wK2d0
	ChuGOZuBtcHbqljrLdX+7PwkYJgrw1VaUaDQeupHtAmPznVpxewtMFjg/BVWORqL
	fpm+qwNeIieM+uSkNNEI02Bf49zv1cWp/5WnD1ZyBmtq5cR7pJv7spbfqdlcWWlQ
	p/YW9t8iKcBwnmyCIin3L2GTQHNsq3LRgmKHBv2YILtM0wQ9xz5wcY4E1K4l/t1b
	IXlGqQCdjeFv6kUwfrNPzzd3cNvQT/uqf83dnCxuD3uHbQtQ8W/58FKrkN7UmIWZ
	Ke2d0gw2ZpAdt5fhapSstGj6nyD3wRyBRlYCmT1XdjxM/gve6Ff6GeoVgyR8mEy8
	Od+NlA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9vubf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:53:47 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd726a9569so139448367b3.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779461626; x=1780066426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=;
        b=CpJZHWi/+UzBJRWHTGCY6Jt/p3hoyW8ERdsuu9iG1gFuLaN5nj3GIlwOpHSC8Nitcn
         6QBbIF0JSA+KUxymRUig1l+jZuBolWZtxkzdoLMXd1Ql4e91UXnbu+FQF6KxXEYPLGpv
         wjlsIgbGzZ2ZQfKUlw8N8R1Xjh2EHvvZ+SsGKJeomvi0R6INFQ74fr9WqgRQTYwd5R4U
         iay7VdMcsGh4vHkUvaUpTMtbqplPD7KFQPb15Cf9nGL6ZFHyTMmV9llC0nyGN5SA3CxJ
         xR2AcBDBx+9sBkrQln4g85RBfxPVioA5R9VGJR3ffJm+U5VST/iIAip2u1fYg6Gn94sW
         WCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461626; x=1780066426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=;
        b=bMior5bvs2dU9UbxoZlY7IhGIH4PqGentoNkCIvWXJe97G2p9iVFDkUMN0HQYzxEgS
         M0dwViTWo+7eXVDDXIGdT3t+1sqkT3fzTGVODzb2hL3X3z3LxKElRlyOA9MdbXqRD1vT
         avi0IVdoUTZ65yXz0VggX1FY7j8hx9SAnMf8FaRATHx4ciK9uQ0VXf89DeUMe114EXbs
         utEzCkr63u/Hk+CvTnz6QLI5Yycxgr0+g4loYvbTJY5Ksv0BXP15JZuTDTNyomf2Pphz
         J9647kA6Jdpv3ghjIQwWHxpTQYnyj+oHNjJr+I+P/6smTPTyZCElEKqNM+9iug/cZiD4
         NR9g==
X-Forwarded-Encrypted: i=1; AFNElJ+WjFd+MrR7s7AUgmxtQ1AvuggpUx3cjUfmQRbAgVGAvYrEwls36XL44WgOWUVRzHLexrpsXnnSuoit@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdax5emHRrhciCyexfZIwkLrmLI1iyz+gbBNCaW0UxqNSgkob+
	3UMLyW+qC/oWukmmw0/PhPKk7q5x4oqHBlXypiCkDU7FkcIxQP603FkUQ1fb4dgukKOFcZqjpBQ
	VH8BcOmR38KPNpNQ1EhQUq4ZjTJbkuNp+ydahCz5ZvccJGQLO1awKkPc09pkgj+qK
X-Gm-Gg: Acq92OHj+Q1ZpE04wIiIddcBxEBSJ5eIsuuOnI7K5r5xZ6Ht8eIfaQH7k7DuwIju8c5
	mlOREEPb91Gb8CTVxcdIlknAxZjHqPBGkznGu5PMArSNGSn4ILH/6qqFSJmOIFVNmsieVmZrj5g
	rmtgXDGYzEMnChS0GENS0OEX4D4c0tAkErPbFY4dQldGmdol4Pg4U+mHX02uxWNi0YeUUr5sF0G
	CGC6kNqQRreWERA3SU397YjPmeBpvEp/cZhMSJuylCLMDT+j+e5IhNC7dNN/vMmxAB9hfZkUQBe
	rEfhR5CcBhnnMj1DtFX8bE3qRIYaKQqv+P70sR34I/LpzbaTSK1AcrcAADqPYt2bFTnZfsvci5a
	s2xJDpteXFWjSK7ixcPDbbrEZTaF+X419RLNPC2YKEA1Wup+t
X-Received: by 2002:a05:690c:6084:b0:7c0:d0ab:28af with SMTP id 00721157ae682-7d3343d787fmr44563877b3.21.1779461626431;
        Fri, 22 May 2026 07:53:46 -0700 (PDT)
X-Received: by 2002:a05:690c:6084:b0:7c0:d0ab:28af with SMTP id 00721157ae682-7d3343d787fmr44563537b3.21.1779461625912;
        Fri, 22 May 2026 07:53:45 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be2dc9csm8941917b3.24.2026.05.22.07.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:53:45 -0700 (PDT)
Message-ID: <c265dfd2-e077-4ac1-993c-e1d7c4dcca8d@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:23:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
 <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
 <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a106dfb cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jH77VO39CjRCDWMup1EA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: dnAgBTgafPdk-zFtLg_DSf8LLd_j3Mwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0OCBTYWx0ZWRfX/rI9eedjWUxz
 Rlecmb0+7AK7NNZHkawrdxLZIn735JqGekurrJU0SlKObLKPHjjZh7h3VpwWUaYF4ky/9z2hDVh
 PmHyfqWIVxJFD2f2TjtRm9s2AZI48eabHeiXUe+EjkDi5qTYiAahYIoWmsZgmGIOC5cMV1FoRUv
 slIK8SnsZWGXy+0ALcPVOQYeDfmr3k983enUKnqwgvWUKU3Tuy07GwT/pq+pyenrbvdrueFIlOs
 Iv9ssTmYCTNvyTRkNGmoo6JCzP2vhRSQCubEPnzdU+Vz2EYYHNkJjYimiAh5rjMYOvxYT/y4O+S
 PsqKPXVynN6Uhpxeb2PqIkfm/hezFHfElx8e37kIyGT7e3tRJLyB2gUBIajeVoHtyf2lm0GvpZM
 CAaAfKb5cDgLZeP2bCj1Eb6y/LSysiNTRjw/sGXznLyfsD2OHs/rYC45QFOouTEQzUTydjTwOAo
 2hfuasJhUb1uqtBwbtQ==
X-Proofpoint-ORIG-GUID: dnAgBTgafPdk-zFtLg_DSf8LLd_j3Mwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220148


On 5/22/2026 7:48 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 02:13:08PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 5:03 PM, Komal Bajaj wrote:
>>> On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
>>>> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>>>>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>
>>>>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>>>>> for the Qualcomm Shikra SoC.
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>>> ---
>> [...]
>>
>>> Ack, I'll address it in next revision.
>>>
>>>> point you can use sc8180x_mpss_resource instead.
>>> minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
>>> For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>
>> Is there a chance the same ID would be applicable to 8180 as well,
>> just that we missed it in the past?
> Do we know, which platforms were the first to support minidump at all?

I am not entirely sure from which target minidump support was 
introduced, but SC8180X does not seem to support it.

Thanks
Komal

>
>> Konrad


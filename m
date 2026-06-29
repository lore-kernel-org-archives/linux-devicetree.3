Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2093B71BA
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726976; cv=none; b=iOlsZuM/Yyp0GGkAOgCpOOu5Y0M6Yo3so92m6QjjEMIG+cUpm66eyG813chQGubEShYQC1nccUyBeNbOIFdyNXfq9ptwvj79rPSNpbP30DSwfNsNYJs+VvAoKDl58gsy54wCwiIfDpi9ElZ+43nlKmiwSaX40xFDxN5pkLih96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726976; c=relaxed/simple;
	bh=TrPGv/zl/q9riZcQ557K3m/9tohKczPiBQpjOOFNp00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQG080mS07WKD2fQM7TRzvybn1N9T7QqH0OzCS4qgFUw8yQOJH1sWgiImAz2sDMI8z4+lxWXBj9g7CxLOjVy5ca0B1dfruADLCC0j/kQS9lK9hZbIA6pES8CYUzTE+gBOhCnUiPzJ4YYIZgZLaU1U9cWV0JwcDOfkE6f6Vp3Mjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJu75Ot5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bi3DO1iR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJu75Ot5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bi3DO1iR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xiap2431986
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GpxxFw2UM30Ce8Qa2rv3JI9XcKMO4o2jYpPU5f/yv8=; b=oJu75Ot5ed9PVbIe
	goukbMpUXMmZO0aBBSV6tGMj7UYIo7EI280cIOrF1hyDLCjx7cf5pGTE5FvMv0X6
	UINAqxzguJvgq1PiRK/Snv6541tVOPwQ3ZnMytFJFK5XkdOeMKJN+5DZxL/RMZqh
	+e5kaIwY9vPgmUBMifJ5LAID4V+TgNH+9q1utRjJENdU5LTNn4G7Q1tAz2I6+Ghu
	/Yts4ukPx2bBtKSkC9KFcgL+UbYpd6aG/xRQHPRw36IZCSv+Lkyf1e34wsqnedxB
	fvcB6/M4UEQNVWWUvXu2gD0qUTHxwJiyN92xqDakvzg+ZVcxKT7sW6Ei3r9phv5p
	ETE3ow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper82c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:56:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a07295d67so8306571cf.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726973; x=1783331773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GpxxFw2UM30Ce8Qa2rv3JI9XcKMO4o2jYpPU5f/yv8=;
        b=bi3DO1iR0pKW8EGf/lxp1ZIfOk+Pn/RrI40R9iYEmdlM7HdkhkfYssFWLbk6A4b4XI
         piETdB5jf5dlX4NyGxXMxYTp90zXetJZigHOkP4bVtQ4HOI0SPx0ZQQv4wzlaD2ZhyIO
         ZxAYFQbfFqBTgB61km1plrDM5wZme/M5HxF4wFeY/hoYqfrlY6XfoMSzb0LDz1X92j3k
         EwAiGt5pLJ+32A4+ADAcFfLF4DgxmPByaXkFn++PA/rRzDZZqZF1DOgFWDAIP31sl/fL
         RYLyePi4iLJd5SLUexcRPPu1J6c0QJVAk/uW1BeytFUMPnnDu/6fUmc8tt27bZ/Rl5jq
         HPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726973; x=1783331773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GpxxFw2UM30Ce8Qa2rv3JI9XcKMO4o2jYpPU5f/yv8=;
        b=C2Io/dbmrD4WN/NjXCXV8EmitlDZbRwpabb+Y8mP02JxMdSCT/Dc4syWcZYj+CMJcY
         5DBA8aHpf2ArPEgkF+u4Ld1dQ5el3b232v6sjICiRHCJlWXNM2UgkheZWZFjyOJGGbJc
         SIjD3myTwHMM74aZLA4jrBjVprUHMZaITh8wOPI3isL86bIY3G+ZLck2mpFtQCiW/e3F
         blonex1bspjylJUpsT2IdZdE8iAiOvLRjn9MXAUo3rNAhJsvywY+1YRANxZRi0WnHEvr
         fI3S4XpIY1cG+R+/LDpBZgcpKH6ncgLGfq74yGoNFbXUssATS/azuwuYWTZc9UMyLjgJ
         Owgw==
X-Forwarded-Encrypted: i=1; AFNElJ99Evdgum5FDp86Ri9qpZ19Jz1MJ37AyYTzRvRWm9SOuInsZ5Qpvolnj4qt3sD7KaiAB6/Q8srQCl3L@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/txXZRNktMoLu0V6oX6KTTeYyLGTTf2nPJq8EBBfdIqJcmSI
	8uFbzfCVFlgrLoDT96I4iBLd1seDpi+Ci/PiGhqxQXdVSaRicKFfO+1YPvvpdr9jEdevf+RMSyI
	0AUPdROnMnP4vJAgmfRn2fs4pYQf3RYJtDpZaxw8e3K8P/tHa827oo+kxv/lfQXZJ
X-Gm-Gg: AfdE7ck6cah5E0kP/oiGkH9W0ptxl4I/AbPpz+tKFCtF14oa6r20tmT1QC3kMjNi5gT
	1La00+hwmiGcziRLoF8wWXPYVNBN4CF590/ELigOjrCGvwbfMlXY61CqSku8VqAEhI17jKgI+co
	GnZMYwc3sM3NQZ9sJSiw3/AWlzvmui4hhddtqKnbuwg6AuSBxfgNwB+cpPHI/p2ocbDQxqyanI1
	hZnCd8mv1EdDGm+ETBerCmz9+TphxzAjbtg/RBdQsayCX3VLHz10/wIYNwIcQduDMEXcU6r/qK9
	Ex7aqGVV3nuVECP5IVkd/tq0PUdmSxj3f+rdJPGBMLCkUz0BRY0t1BCsA4gfPdHRIz+AYVDlFvH
	MCtrAFn5fv+0GsFiV2nbCpySyijsFGYwYsvY=
X-Received: by 2002:ac8:7f82:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51a8c9b94admr77692531cf.11.1782726973136;
        Mon, 29 Jun 2026 02:56:13 -0700 (PDT)
X-Received: by 2002:ac8:7f82:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51a8c9b94admr77692291cf.11.1782726972635;
        Mon, 29 Jun 2026 02:56:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1252b4e6e0sm231458666b.2.2026.06.29.02.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:56:11 -0700 (PDT)
Message-ID: <2d6e7b56-01a8-4b92-921d-629417c7f5c9@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:56:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
 <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
 <91fa4b98-d99e-401c-bb1f-f235034f3aab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <91fa4b98-d99e-401c-bb1f-f235034f3aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXw5HXCsFaxO9h
 i6rJdjOnRp9eaiACgzZz6qFT7RMvT9kUFnFwLMmPa5LGHLZIwEyLwWk2Bu6h2FGZ+Sr8jbuDwNg
 F8G5yfI7SN6PVsUAGy8xTqxbEwiMeTLLhcibWPGvQz5Hjm8LNz4K6zNMJBQyu0CWPlD8oMtVi/u
 Un4l7ybyrL1WZlF2U+yG07G5fU9uzRkeBkVWcsE89o7mVqEGTVBPH4RZ8u/dkzcjgG8bN2v38tQ
 /lEXFnmd8gKUyDGV5lnOOVXKgOVDlvXuhm+KyZCv6mJxao8//mmLUmVecyAjk/jztQpsv/+AAYG
 0A67PTp25LqToGCyiRl07Sw8Z581eyzfpy2b71CAZwUQBetwfTtiRf1RvOGUhWHLNpVTUvj/3pk
 VlF5zS3XbhZgBIrWIWWt37n/aWhuFSO5ahGDMn8UAHv5lR8tmTSetSqWu2Ty7mCECX30d36H2/+
 ONN57Lis8orpmxDokHg==
X-Proofpoint-ORIG-GUID: C4vjNZVS-xzb2bppMflqYVdQ6zcIBahM
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42413e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hGRUbYMsCoS4gC--qvEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXyI0d120q6g5d
 KV1RiKj4muca3uD9ptMqtI+qO35+CBk1Chck5ID7y/LHlvf87Tk9wu5hDfgNUIGOOifKRspiHhc
 xAQEk2ERRSKAwNhT9vc0s/Cz8HEznnE=
X-Proofpoint-GUID: C4vjNZVS-xzb2bppMflqYVdQ6zcIBahM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290079

On 6/25/26 11:19 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 6/17/2026 6:56 PM, Konrad Dybcio wrote:
>> On 6/16/26 11:25 AM, Maulik Shah wrote:
>>> There are multiple statics used. Move all to struct pdc_desc to better
>>> align with versioning support. Document them.
>>>
>>> No functional impact.
>>>
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  static void pdc_enable_intr(struct irq_data *d, bool on)
>>>  {
>>> -	unsigned long flags;
>>> +	guard(raw_spinlock)(&pdc->lock);
>>
>> tglx suggested to use guard(irq) around "the other callsite"..
>> which I'm not sure where it'd be - maybe around __pdc_enable_intr()
>> in pdc_setup_pin_mapping()?
>>
>> Otherwise this patch looks good to me
>>
>> Konrad
> 
> All callers will be from irqchip except pdc_setup_pin_mapping() which was
> invoking lock-less because at that time irqchip is not setup and as such
> can stay lock less.
> 
> Once the patch-3 of this series is applied pdc_setup_pin_mapping() too
> will use the lock as it makes direct use of pdc->enable_intr() where the new lock
> is kept (only for v2.7 version specific enable function).

Ack, thanks

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18A40D563
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923224; cv=none; b=SgC5ULCXvfUey4mBOQzgUvNvZfiGWPXvAruGsTk4Ahn39owuqXMAsAfRjm9N5wOUgjKgZ8Q2xIZrMfEzFg+Fpl6cgRdP1zh6UhzAUMSZ0Cgp2nhBJ/IVn0DrOWviJFvdkJ7foXs0eyPG5zVXutqtUmH6xLbC81ITxRs3+/IZiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923224; c=relaxed/simple;
	bh=v+OR/g2WIKdKAOzCMyPBTLhd4+l4DtGt19dXcjU42yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTzrBv5caO0QYxEwOD6oSqIqCLP2TngXFv53d9sAeMnevavdTjlFcRdu2RcIHAJQU+gs+QhX6yQ+SbfVjo3YRoJ2h3xmoWFVrFxPCPm2ZjJbXSAjN2rAVDvVFHOK5Tcn3alyUy4Q+XfUnW1EmU9JoVGYVmRIDq8u3ktIIcMPT9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtpODAzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbHIN57v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtpODAzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbHIN57v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dFSX2132533
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 09:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLfftjsgZ0ATS3LHc9M6pEfnyeZQZM/mhXGUirf5zlk=; b=RtpODAzn5Jml3utF
	P3vmIJMGVOU0I9i7Y6FUkm99/CfQ+KxQgL3xCJCnL5lNJp1FKVuL1jB//IS59kTP
	t3hJkJXgyX7cBBQsMHg+DyIvTGOiLiX3QnvIyF7RvD+MJ6BDJrUYRs++3cZCR0+g
	W113tAvq8nQ5pAopRFd5AL10qStsAKr5SCrQ3fQ/k/k16fLZEHhqHXopqU7A96vk
	DbwdaKG+8gg/khTOjlhxcf9wH67OV0j4EeEXkNa6hzRaA62vOxiWqsQU2ymLOqnO
	EaQ5hBsE7bnCEDR7fQu7lKx81DB/0t/F0xBPrPr9qRoxtE0iB/sPR/ezfnxHkp8j
	HNcbKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56bwdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:47:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38827cee19eso1078234a91.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785923220; x=1786528020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLfftjsgZ0ATS3LHc9M6pEfnyeZQZM/mhXGUirf5zlk=;
        b=UbHIN57vNzrqEp6ZmvY3GXnj51oFDljaEcHMED2/gfemw+qCV6G1l8TM7ZsnqPbNMF
         F3XQ1xO0qG4ve5Extiu8VltKt6/jZx0NOhno0luyh8i6+zWL1o2+s1DzKPppp68zxDSZ
         oSSJxeVaiLfAwaVJIiMHWQZrqM7zkv2Foi48tqzITxlfBjIGajlv8Zpn8ToeKV0lebBA
         5iXUtEluGbed8oCUFRBDJisAT66FZ4zzMTotYbOJdKuyDVV3G1INKarRPfrhXjh/CeEJ
         7ljKJGyb7pTeX3oK8QeI++MKeGU3lJvq80QomgAyYOE0mUDo3S4peUmuKlfKw7B2kk7l
         mWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923220; x=1786528020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLfftjsgZ0ATS3LHc9M6pEfnyeZQZM/mhXGUirf5zlk=;
        b=nP7DF9jR4t8mV7ljKTV/fz9WGuDJBQKsUEvscMCuShutifqLTfHq/QZYUzsT8VvuWF
         kuOcQmA2r2d1nSaq+Vosup9lSZ8QpxvAVJBUrx9Y52Cnv3Zq+2zP7lLUHR9pzwVgi1VP
         JYyIFUIwsNr8RTeJGwCF1DKcQRFg2OJSeoQ/O7lBNPBmNVDhyUaWo4ZD2WMs41DYJhX1
         k12OguSJvaDVmJRzcJo5H0Qr3tRG/zBa7Busxrnco7P9ZqCch67CFPcA2qRoz/ilmF8S
         j8U3oOsst49Iww3+xY/DtSgRDfZoSFpsscQQEWxIoueYSlVRqetS8R/SSS//Ptsj4gKJ
         Da3w==
X-Forwarded-Encrypted: i=1; AHgh+RoJXBLiHTs0gDdUX13nX+fSOy8ldxPFc27lP3Xjbw79GqBLvEAJNgYsd1mIbMnwXIIvZuWggnxtwoer@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YBm4LuTZ0suQ+qiNijRxajD7ZF2FyYncwuoGyg61i6sm0ezB
	rKzQVtm9RJp9oiRCbvnkwV/ilSmswiIziqueaXd+u0QNdTw+GUtSBorX8G7/ICL2C6ZgsfZSZd6
	40OFhye+96odFwgAIkTgU2K5eYLoC5JD96NJzx0w5265qZbdjEQSIUqdglhgqvxoZ
X-Gm-Gg: AR+sD122FHKCywgeTJE0FHOMdnONT4/Fcg5x1j0cINDwWXnDo/wNgE+2KmDHQzIPUsp
	+F6n4qFgIYzVz3JbfEDJWxrQwCMp1dlNhDzvq5i6uQ/PLGvvsqTxg/vupAvhaD0a/6eUn62YClz
	GhTGjJoftOIWSsl60sKKbCNrKMN31pbWNYYjcbSVloOgt7Eh7LuCcSMWH5Nh3eEjqLk+4hNw/Qs
	Z1JYoNGjW3gLENWD//qAkdfjqgMcHnNsfvwPH93Io+DRsK8mHcgfvNXwV3CaLRSxMiIkEnNn1pw
	ocq3dnW2gJEfCpdPIrxYPN0DkTzIo2EOmfVGmlGdgCdHVXxgY8StTry5OXcMpTrICVSm3d6rRCZ
	flslSWKyudBWufMcscmy8g//BJ8giQj0LbQ==
X-Received: by 2002:a17:90b:288b:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-3903c54d9a2mr5788378a91.6.1785923220048;
        Wed, 05 Aug 2026 02:47:00 -0700 (PDT)
X-Received: by 2002:a17:90b:288b:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-3903c54d9a2mr5788316a91.6.1785923219589;
        Wed, 05 Aug 2026 02:46:59 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39039141945sm2693692a91.3.2026.08.05.02.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:46:59 -0700 (PDT)
Message-ID: <2742d623-6d7e-440d-931c-fcf200cb60dc@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:16:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
 <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
 <c1f8b5bc-6d50-42bc-b671-7e91d76cb975@oss.qualcomm.com>
 <cbc62091-ace6-4e4b-8cae-fdf9b83b118d@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <cbc62091-ace6-4e4b-8cae-fdf9b83b118d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3NyBTYWx0ZWRfX/XmtSdbWjBrg
 0ghgVuOupHwLkct96LGroEaeljQwS69XSDAoINfobt5JU9JTjvzoZ3WsmJLGuAjhSWnV1tv/TU2
 m2Qm+aNEyABM49mZta/MpWac0rb+N+l76zW8024feTTup5sNhUPShV3tqgrr7jUwHyP2dETHkV/
 npT/wnVGndlVOmHhvJXjSMytQMYnkyUYnk1N7hRIp6yNkkivwrDtMp3H4F56gopL7AaFMfjz2+X
 1ionYeuuU8KkKw4S4j+o83rbICG314VDAEvd++YsdT1fdl8ph3bbgUy4GrqEWTAWLzDAKLYVDn7
 0MsGlL/eH9Kon9UKUra60ZL3h2n0kcL95ujWMJh/JBebK8qH5hIeRr1wJIhpBbVivnGA+9ohLpf
 neSDVV6Y9A+AAiw1MwwUtlTGIBgboD1AgAeV9LrEs3Q9A7NR33Worm5u6Uqo4nmGuezyeoElG0B
 hPuFvuZQyxbq7ZZFYsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3NyBTYWx0ZWRfXyehmrCIXFfkb
 R+aTy5/z7uTUM0+Rw/RAXTl6WR+Aurbxsg57p+2PggCcv0Dx5/iBMDEgq5GEHu2fiJZRKfhyEOy
 foRstJNjcuOwgG2tygGWW5eC1xwxR1c=
X-Proofpoint-GUID: mGYrBF7uYlmcIuUdsUH1_yAWaPr_XxFW
X-Proofpoint-ORIG-GUID: mGYrBF7uYlmcIuUdsUH1_yAWaPr_XxFW
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a730695 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=hE9VN46VHmwWYIJWFdoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050077


On 04-08-2026 09:08 pm, Krzysztof Kozlowski wrote:
> On 04/08/2026 17:18, Vishnu Santhosh wrote:
>> On 30-07-2026 12:53 pm, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 29, 2026 at 02:21:01PM +0530, Vishnu Santhosh wrote:
>>>> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
>>> No, it does not. Look:
>>>
>>>     $  git describe
>>>     next-20260729
>>>     $ git grep bam-dmux
>>>     No child node shown
>> The commit message overstated this. The dt changes are yet to be merged.
>> I'll correct it in v3.
>>
>>> Why isn't this part of Shikra remoteproc commit/patch? How any code
>>> could pass validation otherwise?
>> By the time the BAM-DMUX support was brought up and validated, the
>> remoteproc changes was already in a stable state. Therefore, the
> No, it was not in stable state if it was not merged.
>
>> bam-dmux change is being submitted separately.
> No, bindings should be complete.

Understood on both. I'll correct the commit message to describe this
as enabling the bam-dmux subnode in the binding, rather than
asserting the node already exists in a DT or that this fixes a
failure that doesn't exist today.

>
>>>> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
>>>> does not list bam-dmux, so any DT adding this subnode fails schema
>>>> validation.
>>> Fails how? How can I reproduce the error?
>>>
>>> There is no bam-dma in this binding example.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>> Did you mean bam-dmux (the property this patch adds)? If so, I'll add
>> an example with a bam-dmux subnode in v3.
> You claim something fails. Prove it.
>
>
> Best regards,
> Krzysztof

I will fix the commit message, removing the false claim, and will fold
the bam-dmux example node into the yaml in the next revision so
dt_binding_check can be used to verify this patch.


Thanks,
Vishnu


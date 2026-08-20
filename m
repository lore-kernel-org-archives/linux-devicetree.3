Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80F3C10A8
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221787; cv=none; b=A8vvvmo78VFbjxPKfrsVVq05GqGCxfOtNMLi1cs5UJld69ajUL4zLktu9SpuGbfuy57h246jKO4/s5YcrVauiSGhf2qvN8VIMA7mJZc2x90T1cCFC0JyXjFcVp6QLqIzd60oL2KmZ7Ruvl++JF5ugFWAlzkpAh58ciVYYgcUGJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221787; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVBtoGkCsm6t0aBrvxtMoToP4aqiPy26TxsYjO/dfR6Wc2LqxWOBo/e6LI0LdJfmF5Xh5wPeSz5qlxyTd98WJlV20/UuTXlZV9Ae9I6+FsY/CHHv8L4pUdcBosoFGMdb7g5cWCUDJ5O1bZcRGJSWLwtTRmBfWQYeuKD5kzUsyro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpZBWo0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPxyJu1A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpZBWo0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPxyJu1A"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3JZi3454887
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=DpZBWo0P6nm4tfds
	UU9baKjzzEiiarXCl6W3oHfDnpasoJEweOrfPb5JuSKOBcZ2fS9ZBnIkcxCGgb3C
	K12xMfTlcnd1KpymL8/+20QbYrkGxdr/K6mdjSqV8OWWvdn3TTSkZ71eEOl+N+Pn
	LwzyHmWslzOk/r4RsZns6THivYqj2nE3qS4XyqaMcFiEq3yi6gCb6xoM5FKUCLQ8
	vy8oUuGgOwmH7fqeFcg8EV4dpGKJO735RlPGvvxcmNXNQkY1MGtROe4bTv055PbR
	M/Dl2DSyeBy+I4tkxIIsGpBA7wQl7uZb6KFTR/u1c9AphXLf1TljGu/4y2WvyNyN
	lNf33w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg883hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:29:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so32751685a.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221783; x=1787826583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=NPxyJu1ApqlXETDzfpnLxrgJ/hTkiRzTgvA2Q/7uslpuaVLc0v4YhT2w7Q0quVhYU8
         2zsGudo5M8UcfnGmHbhDCVIDAliDURBHPdLorlg6Qn9Ndgl+nr6BlJaArfTCT+fMr7xu
         FdQwgH1jPsH0guj3Z4NzC6kUEvBuI++lCXeFeQoRX6TS4w10vc/QEIfij3S1/bfnYxTI
         qPU5l7lP1VPaLAzTJWesAaW3TDhk3WYZACfhA41EccsuoixjhA2yjSmF3z5hkDmQ0Fgx
         l1TKPEax6kFGIAtwxXPvc0zca96pTDABWam5Ow6ip7gfyjM66CFnKKoit2qMMd5cy2lp
         f2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221783; x=1787826583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=Nu7i4l1G8HSKJ+w/XWa9PGApBQ7OVHvx5Eo382+Ve0gZzFMvMusGuq9IxoGi+7FZO3
         LeuVfLuViq8DYjVr9417L4hWm6/yuiZshHKAXhUmSfBeE8j+h5wTlqUWUonK/1nSA5tS
         o0OUcln4iH36UFOc5w+20qfhc9yfNMvDIzQDKfw9jUY2bEXWeSID7UkYkUorgOCCPqke
         F5e6BTd8isquQ//HGngB1v0YpdOFE9/dGXL/UQn0gJ8r0AK1i9Z5xy88FRhgsm/IC4Kw
         0XcQ+Ce9K0Vs9B+oXTIi0PcVSFCb8LlKi6txP1HvafoU4d8MVyBdHDAdLNhVaR/qpcNj
         AXDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPK71DD5zjk4YtK4ZWQO59YPWNjgsfptUD10jmRnnt64mIF21ka/iZe0B5tYHaSUdHmgYYbZpcbud1@vger.kernel.org
X-Gm-Message-State: AOJu0YxnXM+medV9J/s/vXYnjsrW+qULo6CP/xdm5koPucIdyijN8Cy+
	KAmn+YAtMm1yLVMYJxatiwibRrZKgLMor5bj2EnAepHpBs7JXJwpbt3VqBWWr4EzwYehWnH16S5
	nlvrdeq9Jaabq3+tq3j49H8qE/90yb48+yeDBUyFVJGhnymyGI+pADDiWddFElxC4
X-Gm-Gg: AR+sD132HKSetDRpHXBc/ohukCvPUog4cvgeqmdV91BpHiQieOt71UcBoZlehYSWp/p
	FHFpy/NkMd9GIw6nOaxs16Y8o/WBgMjpjSbvm6RB5DibPxQ/nrHPrx67bKN+NYMRHkzAgqI6A+L
	7QLe7umXM257SNa50CQs8Llaxkj3GV1lfRll7PlZFOnZutghhOh3D268LrVN8rYAYPBYo9jEE4T
	USEnqmQDAB1KPGrMw5pGZpk9/qYo6kA4pMV5PRiXX0F9wW0PXcEphtr1q9oz/pcuuQOTCCFrQBN
	jbGcF5RiaZdJbm/DOPHl3xSCok5C6TjmY++Gdx372K6Q7ogvUJzyF2wDao+2eUbRjUkE8LYIFMZ
	rOjvSqi+LqLW4Fgso2cuv2CGf
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr728474785a.3.1787221783590;
        Thu, 20 Aug 2026 03:29:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr728471585a.3.1787221783120;
        Thu, 20 Aug 2026 03:29:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:29:42 -0700 (PDT)
Message-ID: <30a9027f-f565-4c53-b1a5-137f63f2fe81@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:29:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX8RtZrTSxGLq5
 JJ/4cj0x7vAacrTozgwUZEAq7kJOtMVqZCz63JvIEHS4iJruGmbl/mxBQI6SovPlkDFviy3OlWo
 suZ3TcUfDtDqr/CQhDBxFMcCT3yjkec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX2eAe/i3MPiim
 WbwrHdzlqtloCRPpFCECO+uSRhahgXJgYQbdo5ItlAs5oVXCY7jmco7VYqdqgzoLuBkWVaCQXCp
 i9G3+hZ18m32dl6/rmb7w1Y79L95w2GRJfHAIimGuoy6MyOxdB7MbFXuTKqyLdXnC1tAn5/vON3
 3MIgjPp1TSYGL3cYg79Ej5nLOoBy4SHMLwZ8Ka7xR0XmZtHiYXrrqSJOck9LWrnUUEgTiAxVRJh
 iM0LIxOubcbsGctLw0pEjMa3Cjcvsk1Wwp0w64Vi2LNI+VLv1iaKLojmn66aiS+wkdzJkOPdgXO
 eCxXDoLq68tQ6KsJKoiFct/wJJvFL64SSD89hkkb1vcawHwJ3EcSv23gCPLApvwEl3Q9cjzxj9d
 od4r40wHiGC01B4MRWR0N5P2dPtLHim33DtuupWM51BNPlt+wRIILVIzppY8h+WeVLRW/yxmESc
 bQmnQ4HIopf2IjAiQOA==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d718 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 266gthhPlNCEeqpeTE6hn2KolKuGHqU2
X-Proofpoint-ORIG-GUID: 266gthhPlNCEeqpeTE6hn2KolKuGHqU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2332380FF1
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785606326; cv=none; b=NqUNCoIwnCOkuXUVCS22vmNyGoPB3qIX7khCBwnUsNILr5VKweVX+vpwuiI5KHT6A6gPkes5dqRRzgEp4afueK1zqBCjr2PT/0wcfAcVluiWKK0SZQ9ezBh9Av1HTmrvRHmeFNZmtE6SeYTLRl43bYCDvlKjpqbkrvVcYN1uxGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785606326; c=relaxed/simple;
	bh=hPQbJvA7gMVD50CKXon7gKfap7mU9lt5Y4S4dZwveAo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s8ZEoUkxEdDp3msT6uHgNHTETi4hZVnddEkduqbyls2ydErb+KfKhomvts6e9Y6mLVKMKavakxFx/CyX0L3PHK80Q94u0DzFu7ZfRzfM75q9WDwObSGMq8qB/BFI3nUKXHdyzrhwUeKFjAS4KoG5HABtHpxVbbWz5We21acPZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIaeiz1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiB3NFqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIaeiz1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiB3NFqW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Fap0E2763134
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 17:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGjjO5dar3w2Av1GvDHB4MrSJNjoKJ09PTImAv5jOrU=; b=mIaeiz1F6dg3Q03q
	j+3t5smYYUMy/wD4Mnn6JJfv/X9obTWjUKda7ifgFMXcQuaWINhnR5RCGHNAwQdt
	bt1tEq2Byf+KPyNPn95ZE+iiOaTTrwUePG1p9aWBPnynLQW/3dOPxyfC9YZbQpU1
	Ip8f6oiTN/CiCc/LaGxuVPT1ULGNce7EgapB+XgQbYcOgDl+SCjs2IcZw3x2fCQU
	PkJgjZIAPA2TdOZ1FcsMYe3b8IRM9cjDdDbbGQAiYZC/6ekdCZPE1A+/Cw8/QoOq
	JYAqVu4/vmy0mHZy1pVfY7O9kSaR8k45MaTp6nQTvujSBM0GD1BL/7ZbBxTLGe2q
	1az7Eg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygh70q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 17:45:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so14978761cf.3
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785606319; x=1786211119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGjjO5dar3w2Av1GvDHB4MrSJNjoKJ09PTImAv5jOrU=;
        b=LiB3NFqWkBaRb7lzVS9sTw3Cz4HGQ1/g9p8N6JEt6bE9kZ8J7aWUr5s8kKsbnRINBE
         6UDMu9iKELwoZErkFgonfdp9CGPLQ9p+XnKKCjbYYLR3gco2UAtKLfMfr3Ck0g1lafVF
         ZwmAiZzeT4/+W9SwAdPPM9ygXoSQ88xxW34tV8vifmnxsxVq11gQ92cEY5vx3/G/e5Pv
         JTNklQJm456rUTOw/Pz2Qtyo1JjJnzJj8rvE9PUUzLW5j1soDsc7arfnRa2FojLt/gJL
         XekP230oXyn+UwZPK8oTTAKPY28wymfxxF0eisxABfqQ7O1VpjzRtA/ONc8C2GsWegry
         ZmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606319; x=1786211119;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGjjO5dar3w2Av1GvDHB4MrSJNjoKJ09PTImAv5jOrU=;
        b=d6kURDE166PDVlWvoX9EFmRgKIW6F7Yn2w/xSEqhOAjz/NpEsYfAyRr2Mn3KVlk12Z
         4ernO8IU0LEqSqgT7TO4wZtHVHVYhh4nHyxzJHVx9LZ7KXP0+cdKpUkU+6rqZAZ0y1hY
         KgdMOTIWtMAkCf0yvnvPgunDgv0koMY7GU8+2gvFG46BS5NWpVoowvWxtxpRJOJuuOJB
         N8nx5+scyQUgUiW+sh5003Bk1MuBezqR55PjiQGTiOMQPEKMQd/4eRZkw7gXt1Ef2sqm
         a9CREqGSShU+rb/W7kZgf12U6sJ0pH4/jyKssNVUC/dfnX9Fy56Is3B+w7yn9MPZZyrR
         Hqxw==
X-Forwarded-Encrypted: i=1; AHgh+RpFP3ToGSWqLHqkjrnALh5A2cRuHpGdKIiSk/6k6OztZW45IVxLLXlF3jPQoWaT9HOV5GJ9YIELf7Hf@vger.kernel.org
X-Gm-Message-State: AOJu0YyepMuSuvm1ebEw5/83nFj1sbl/PPZIAL+55c46d201ooKIez4q
	MBHUJM4ptUUZuh6eogB3hvHhE2a6ChxsT0DCZOc0swHguR3KF5aR0YcXLzujSzgwzqhLacr+SF9
	J+Q9G0l0KNh2S60MtuBHQ5wbIVgHIhLZrCrDOTotPP6RwujwEtrQDgZI6AgD+QQEw
X-Gm-Gg: AR+sD12z5YGaqOzHeNW77D1J2W614FWNbgY/otlk3bqu70aXw6T/0PLvHW+ul+0Zd36
	U9is4Je3UV7vsuC5VgPkA4NOeATPLDUniRt2RpiGCbXwxIZhsDolegFz2SkD3eXzRckmH/z15cZ
	/IgSf4vq367C/oZYWrRDEhdKRABHNsV3LdpqMiS0SxyrwdyHk3dOcx9PiFA+HteqZAKu+RkUxpI
	nJMnTU00coohFfGsPnjnvvpUL7rINW4zeLfO32GGe25/BmN8k/9vhnbZWYVVeBNgtPrE4Yt7j9G
	bgzXfa/9+4bUJb0fllseFyuNhPovLRagNl8Vf8JD+G3mCSoZb2nlz2YK2uFq0hsN+2Qf2/oD2wC
	lhigMlMd9hCo1XXiYJiTD3Sf01ADsVQ==
X-Received: by 2002:ac8:574d:0:b0:519:89b6:78b4 with SMTP id d75a77b69052e-52b567dab59mr83295211cf.40.1785606319387;
        Sat, 01 Aug 2026 10:45:19 -0700 (PDT)
X-Received: by 2002:ac8:574d:0:b0:519:89b6:78b4 with SMTP id d75a77b69052e-52b567dab59mr83294761cf.40.1785606318926;
        Sat, 01 Aug 2026 10:45:18 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm17416391f8f.28.2026.08.01.10.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 10:45:18 -0700 (PDT)
Message-ID: <0521a961-0468-41a1-8dc7-6eb25635dcc1@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 19:45:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dtc: dt-check-style: Handle root node in overlays
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-3-b05b8f897670@oss.qualcomm.com>
 <20260726160058.229B71F000E9@smtp.kernel.org>
 <98d13cfe-b94e-40bf-bee7-541db92ac12b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <98d13cfe-b94e-40bf-bee7-541db92ac12b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfX2SjsWFnnOumG
 BPx5O7mkAzSzXHpJSPB3bjIOhMjYvx9dvTTmzExVGV9z3ITZEDDqWymzc/pjTrDai+yn6/d5F3e
 x5DgX+0/eahhTol1ju5482lNYizcnlw=
X-Proofpoint-GUID: LNowY5NsEHSZZ2MMapOS4n_0Frhmjy9n
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e30b4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=dTbKHLgmssTIFSNd2vEA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LNowY5NsEHSZZ2MMapOS4n_0Frhmjy9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfX4h8wHcZW1U/h
 WSMONHNy1DmZo1ADB3KsSnPlIF0QC3Y+bfg7z4v9cszHv8yaWBoLmLtuCXOBwIvJy5MioEBscgJ
 Uqg3AOeXtN4qLR+UWHE2x6DRzmpTWmesBs0qHBJtmtlo3p2QnZhu/5JWi6wSmckh6rbX/u/Az4F
 sEXTQOHTCx1JvjrsUHijLrDBZpXINoGTUK+qA32Mh4I9Ci0k0coU87eOAy7wd7qAV7r0JgGujHg
 asay2foeDSQQzDLKiY9MsMXTkobST+bjPnP+gfTUTT6Xsbf6G1pLeP8R2b7qbZhLQGrk8ni5nFk
 StQXWyyY6ZOU4B8tNGr7X2mqHyvVnKgFTVF8S1QNHQehkobeMrT8paCw8E4cFMhK9nikYwhNaR8
 srWrMglwyMl4tuhVaM8eH/K2ui+WoS5q/7LsRbprUrZxI0egOj2/VTiiD69N9exT5hpk+bhuRGJ
 O2PwOmGucbbmSw7oOhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010142

On 01/08/2026 19:43, Krzysztof Kozlowski wrote:
> On 26/07/2026 18:00, sashiko-bot@kernel.org wrote:
>>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>>> --- a/scripts/dtc/dt-check-style
>>> +++ b/scripts/dtc/dt-check-style
>>
>> [ ... ]
>>
>>> @@ -228,7 +229,10 @@ def classify_lines(text):
>>>              continue
>>>  
>>>          if code.endswith('{'):
>>> -            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
>>> +            is_root = False
>>> +            if code == '&{/} {' or code == '/ {':
>>
>> [Severity: Medium]
>> Will this exact string match handle valid alternative spacings or labels?
>> For example, if the code contains a label like "label: / {" or extra
> 
> We don't label root node, but I will add a test for that.
> 

Root node cannot have label, so no need.

Best regards,
Krzysztof

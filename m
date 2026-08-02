Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E98242D6C
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785658948; cv=none; b=qm+NVegisgFjNh+gALyT9frTtvzrUlyL80z5siz4ccGqSgysy52Jf7tQuSPs8PwgnIV1qiotAf20UJx4RpvHLTyMp/5j+xs3HwJBEDOJkYVcXg4he3rkfOAwaBbQIA3RjJsYeH1fxzVLiq/CgCfMUPOWnM9+U2pLa3Qmp1cXH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785658948; c=relaxed/simple;
	bh=cnJ9LZfb8FmOra/boiI5kqLmXzZxbeSjElqbSgD4FqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiTcRXHW2E7AW12D9ML7+Pwjq7/7q2alMuxyEgNQVWfZgajomfG9lfe5+ZILYHWphxuYsAu3HaafzDrtKXntmxDfOok8FVjuXikdPWD57TtRVRJNbhHY3mzHrDL9/HFcBSDAC/uU1w1cWlhU7E+j3A54X8hwgdx9AXTSwvrDSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcUlmz4S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bjrmxjvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcUlmz4S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bjrmxjvv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727m7LC1262358
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oy5c54Ws3qiep/orrNmhOL0YpuXwaWYyCy6oSaQSYII=; b=lcUlmz4SA/RM7Hq4
	/SnHnCcNpY1YHUMN1hpYkucv/1p+urie58L66k7kF+O5Gk5udiU8EIpQwGBjV2AR
	ZS7tzhWiwvTxhAG+m+2QyS4djCeZJxOoBfLzrw6squ5kmST8qwPgkvNC0wnrPd8M
	TrgkhDNPqa4PIAb5pqZbTZpfaUoN88Rsx2nvvfYIuVZ/yGkkrubhDYdQlH74yhc2
	svJ4rEUHCILgZN18Nd2rzKGyh2QK5XPe7Gr88y2l0PmfCn5WyXEKYEnt93Mi8lvT
	tYJATFU+nBAPy6RQvm+bcJfGt1HLWRT2p1IYLyt1MlDJGOE9GVwaK4dzUIz5nS25
	5XJJDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911afhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:22:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so43404101cf.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785658945; x=1786263745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy5c54Ws3qiep/orrNmhOL0YpuXwaWYyCy6oSaQSYII=;
        b=BjrmxjvvbzfEP5VmO8YGorSX5wHUGm4ugFSVOW4j7ZOgN/+IKMyDZEx+bcyiRD/010
         AHs1xDZdm4yOPSkuveMMRu7uK1oYgBElln78edbI42D11h2c+eWjRLpvw+IExG5oa7KX
         nzma6Um1lmjCx3HX0yn4r+ez/3CHVj+uF8vbh7Xn7Ghq30/++BVlB/WWAqyje2kJcAyY
         W03YmJoMKQSmrK8gWzKqlTI2LG1eToFLO0BTCxKbeiW+YHtGcc8YsGS1mVJCd37gNm1i
         0fPiX3zFuFARwT7vFIyvJV64UV5nMKRL4evMqomOma6Zgw/RfgkeJliz/MpGoeyqG/si
         XF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658945; x=1786263745;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy5c54Ws3qiep/orrNmhOL0YpuXwaWYyCy6oSaQSYII=;
        b=Sm681EIMigsod79Cn2FuAdICRvv2J4tySZa2953+ckOpCFObyctRwnO+Pe3KIohO2G
         sWZKgZAyDdqXpBKzypShuhs0Dhv9rrAjWeOy4Tl0xMUhIyuwUq+ovNuNTs0Rkz6hCnvi
         SLY75c4tY+h9LDSX6RcSQx78vz9sM0WZLBVtNgvhsd9z8FPTBaTJ2SqDF15GrQcjcALo
         VbGS4KOcDCPjdGH6xlQO2Rd09U0ueMoHVgTxPAmW+in3c4FdeQCxQX1llCF+R/3NT55j
         6TQDcAhks7AdqOSHI7OatruuKfIFIFe9hCSJbiDDao/SB0Q8fACZW2DGWhHfZWNeDz2b
         oYWQ==
X-Gm-Message-State: AOJu0YwHGPgrKYvURRFd/hh9fnngJVidwziZI9mBZI8tAFRMgvKMVQdJ
	S2MABMNzClIvF2MB6QwS7+WETdF5EFrWhow+H4LLh3HEe96AJ8FAp8Xp3VgSsjKBSnCmWVtorBf
	l4JFM7HWw9mjfQnx50AxlV1y2bHXU8l0UhKH5EqXre2rcU+ScMVit8o5rpEkwOT3J
X-Gm-Gg: AR+sD12j9xMdkqnNjNDakWUqw0buldj9EHCwcRP7dlxhLQ0wwljh8DdGxO2s7/Wmt7s
	XgGrIyPNLRiUqkowW7q7+4a3bZyIHPn09xUoZSM3z6tnDjWzVX0cy200d6wL5n+RTGOyInzf3xR
	aLVraFgYH3gr/JRTsNA1sX3AeXB6ENcI+8pW8xzr9AnzofYRi3tEopY7KiKxVmNZmvUCAtaVmID
	Ms/UuqNvRl4TsagcjWeCYZ9CP0hsc01s2IAd6rYcFESuscwX+TRIMm3xvPcnZTmSiEkZXk54Kkd
	DAD0XQZKeduSbRUZaeS8i6/cwzfWdPVt1RgA8UKq4bjtbUpswCKkkaSOlHi4HJUkTJIAWZI7fmw
	QCrGlaK6dJrTZ9jHWD60S1qAu0sObHw==
X-Received: by 2002:a05:622a:5816:b0:51a:329:e802 with SMTP id d75a77b69052e-52b567d3c6emr120252281cf.41.1785658945148;
        Sun, 02 Aug 2026 01:22:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5816:b0:51a:329:e802 with SMTP id d75a77b69052e-52b567d3c6emr120252151cf.41.1785658944740;
        Sun, 02 Aug 2026 01:22:24 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm21343657f8f.4.2026.08.02.01.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:22:23 -0700 (PDT)
Message-ID: <03e6c777-8afe-4d8a-8267-bc5bc60fefbf@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 10:22:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] dtc: dt-check-style: Fix alignment of values in
 continued property lines
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-6-b05b8f897670@oss.qualcomm.com>
 <20260726155645.81CEF1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726155645.81CEF1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA2OCBTYWx0ZWRfX+8/lqwT17A5K
 nAJlNLviIwXn3hDSTHMx9Ev2LAX+VrXhTFGUuw1ebh02s54DZ2bVkqkIZ/nXHO+2o8YsHdV/LXv
 /Im1tUqxbVh+9/529x2cA88G+Ee1LdY=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6efe42 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mo4jH7J_H-v84ocW3QcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BB8zLCZ01K6N6M9kK-p7tLwW0Vu7qaIW
X-Proofpoint-ORIG-GUID: BB8zLCZ01K6N6M9kK-p7tLwW0Vu7qaIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA2OCBTYWx0ZWRfX+I9n7uyNGBar
 +/R9ZhAuMgTNaravsdMntwY5i5tFXOSM0o790nSQi4vmZIrNhB3U10ZVxWti3ajZcwpHmve6eau
 oTUtUSFZD9P4u3Kq6EiRcQWMPQeQlv3H9CriV+AB0lfFvMEZg2tjw1ukA6gJ2Q4jYpswAlh+nYl
 xqcArZkF4QV+YKEJhKPsP8gzCfULUQyYY72sH8Le0KMadx/Bu5LpUw5lRWtbP7UdIqDDDla0C4+
 OyHy8PJiNMurerSUWRC7c4JRZ/q2Nd3DpgSob+1ncPuQ405qBboKBtnUScj1CBgIVRfY6pVI2Cu
 yivEbUcoBr9w2T+fw0H5vArI/yNHPNkAKsXggGNw3gtV4yvrLyfbJlCPoXGmT6kBiwz65v/Jhpz
 pa03wZJjIsFn2Cm/xqVM+w5vmaiAgsvwcwEfYmJllW9l446G0v/et9czJyJUHdOVK0vAW5ysNVQ
 fW3odbT/q8TFVpzUHxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020068

On 26/07/2026 17:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The new alignment rule incorrectly forces a standalone closing bracket (e.g., '>;') to align with inner values instead of the opening bracket.
> - [Low] The hardcoded error message is misleading when target_offset == 1, as it claims the expected column is 'under < or "'.
> --
> 
> --- Patch [6]: [PATCH 6/9] dtc: dt-check-style: Fix alignment of values in continued property lines ---
> commit 3d17d86c35121d71a779318164c4a25fa384d8c1
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Fix alignment of values in continued property lines
> 
> This commit updates the dt-check-style script to enforce that continued
> property lines aligning to inner values are indented one space past the
> opening '<' or '"'. It also includes tests to verify this behavior.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 4d90fbec0e391..171a5e12fcbd8 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -928,15 +929,18 @@ def check_continuation_alignment(ctx):
>>              continue
>>          # First '<' or '"' after '='
>>          rest = dl.raw[eq + 1:]
>> -        m = re.search(r'[<"]', rest)
>> +        m = re.search(r'\s*([<"])', rest)
>>          if not m:
>>              continue
>> -        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
>> +        target_col = _display_col(dl.raw[:eq + 1 + m.start(1)])
>>          for cont in dl.continuations:
>> -            if _display_col(cont.indent_str) != target_col:
>> +            target_offset = 0
>> +            if not re.match(r'[<"]', cont.stripped):
>> +                target_offset = 1
> 
> [Severity: Medium]
> Will this new alignment rule incorrectly flag standalone closing brackets?
> 
> If a continuation line is just a closing bracket like ">;", the script
> evaluates re.match(r'[<"]', cont.stripped) as false, which sets
> target_offset = 1. This forces developers to indent the closing bracket
> one space to the right of the opening bracket instead of aligning them.

There is no rule for that yet.

> 
>> +            if _display_col(cont.indent_str) != target_col + target_offset:
>>                  yield (cont.lineno,
>>                         'continuation should align to column %d '
>> -                       '(under < or ")' % (target_col + 1))
>> +                       '(under < or ")' % (target_col + target_offset + 1))
> 
> [Severity: Low]
> Is this error message accurate when target_offset is 1?
> 
> When the script expects alignment to the inner value (target_offset == 1),
> the error message still tells developers to align "(under < or ")". This
> could be confusing since the target column provided is actually one space
> to the right of the bracket or quote.

I'll improve err msg.


Best regards,
Krzysztof

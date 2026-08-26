Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352323AAF67
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742761; cv=none; b=OSsu+7FyS18qSRi/MNhuEsGqgdPVU9jDKfvJHnFouBlR3Oz6lFpykgx2xpKei34+Y5mop2srwJtvmOi1tMfN/RLpXbPwKFZub3COVEAXx/U92WPVKgKd+iIvrxVzSFsQGvfrBs4U2kXsojolIgbrWWwFxiE5HXZT81zD0UIO5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742761; c=relaxed/simple;
	bh=Wlu+ktKfRlou/B+/Pe7oGWaibbylJ/3djIOC7b6aGAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scKRIDzx5JcFFeLpmbL4Ozk7FtRs/+F9yQSQvPXtFJr6/LBr4Td7KzI+Mj0ANi/mLmyMLNd7xVDpvpMta5hFwNz5KoXSIJxVE6QKXHEPHh8G7x00UkGsv+7kMF2YmiLqeaYJKHYNcqreMyULPaZzsdS99UhitnK7GnSSwC9343A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WilAeGba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMT/du2V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WilAeGba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMT/du2V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHju9973691
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUS/etacm3c3KN3n5IqkXsQQm6CQm1jZW8/qgl2uVoY=; b=WilAeGba5L9P9aKy
	9oYkJGOaOwrfMJWhBYfHi1Sbr17NlfqzOrxwPUJxtgU4KkBXSLx6DxZUXSAxQXub
	kMkexbkKWvWfXxg4liIbCltM5Wz1K5yRkKF+c9f3UO8cUBX3j4yptG/7Ki4pm4I9
	ioSrl7JmEeq/2W7gQqRC9A23ZYdVUT4SxoV5ntjQ2wTmYaJqA3xY2qvi/1OuwhLL
	Nqf5HRyXAdkm0YaFf6w4yvPgZS9bfBnG6/XWF/mK2RXDg2rpr5ymgWqxPtU4+t3+
	ZG974099xDyUpjns+nL0xXPwXqEDAICOQcsvqbl7UED+SMctIBZY8YNeCNwBB012
	AGVtAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghr9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:12:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so7967821cf.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742744; x=1788347544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUS/etacm3c3KN3n5IqkXsQQm6CQm1jZW8/qgl2uVoY=;
        b=fMT/du2VJaZvhi/8fCaUHMMze2trAq45bb6p9AAXAQSeaAysuck0lJcDAad5b4H8vh
         PriWmcBEC9Kyry9zja25JrmRjI7/RWdlKKC+6mc+hW6k4ybkPXi+g6K4WIJl2LZx0/eB
         KP9nEce4qXsziQniedI0dl7+nHVBwn5oCPGzzmgl39qeDGhY9IUOFZauphCrxpdhaF2R
         MMNcA5utlgLFmt9iZ+YfTQXAcsKBR4OuT2FO5JVDpG3BEgYHKtMLU8tojstPih0l81Nm
         8Op9a4EwgqFSuvLhOAoDZWn76WE8LZtyf6Gk2zlJ4BqxdZbc7/T9STfLnBKDtugWHszZ
         tFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742744; x=1788347544;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUS/etacm3c3KN3n5IqkXsQQm6CQm1jZW8/qgl2uVoY=;
        b=UTLvdpipkrPT7UBsq1mIWeSMORdqw1epPmLuBFH5k95W8TXlkBT1qtv7h24aWTl2sn
         HU3ouqKhL+O/jcMWxNsCLx/ngAladFsTnz89wmvv0+qv0d6eQfTcfA7WTt1CZwROHU/A
         DkQtjd+xavH/QB4aCcyPk5YL1TidzLdfZV1Rmo+Jb1eBqTpdiJw3Kxxy0uTL7UQ3Ev8U
         lqbULvUBz4400xoc38m9kGbR5nFHbYEYYxoPPnbD9cQrV9kPyN/HYGgtIIz8/U/aZHKq
         GQRV82X1445vtgLQ8lPKQMcZYdGi3OKOSiBiYsYcEGfq/+GFK1Hj7i8DEVaUR61DCGnt
         z7+g==
X-Forwarded-Encrypted: i=1; AHgh+RpBWlHduM1HxCzXuCawQiJpJZNFQoR9fjOhyVi5F1UXpB0z3Xy8bV+5wZmCED5QRju+5VQ47jV0t0yz@vger.kernel.org
X-Gm-Message-State: AFuF++nXF6QwKi5qvoeoxWV8vzjLTQQzi4xd/nNBsAaV4W3bwe+8RsMM
	7iYdjz4uoDihbqVLyL8Zew/sMj/+3xGhD3dVcXs92WJUgNN48C+amVseBI2DfzBPNVxOKcElmJf
	P9gjZJmwOSNB0CEHxSJtHhR+E0NB8w+0AsawBcJrCJJcfWnZcVkoGacIz33kZF1tA2O7cbtyJ
X-Gm-Gg: AR+sD11zsaLAoWP2yDLfhIJ5QzHspV9U7/Q0Z00w0XfoxOgj4nSUsXbZYr/vJCuiDpl
	CQ4aFiwNbnNfwHBDKJIXcoqbYVdAECpREcG7t76eSrr9ae14WJkXwdJUfh53VJmCijHjcnSLkZf
	ZpZ0kdVMj7jK/C+N8vJkzvaUocFPAizqhl8cD6sxtC/QYdkqe2XKLfk10Z77gZDqXpQ02odh4FR
	UoMOwUCWTCVj7bPuGqT65SglXogiNXkZB/VYfXNVn3KqwdOK0m0+dN+QWHjtPRS903vWFYTBeHg
	3JEiyh75U2VoFM5RiLj4kpzfRMoLHKFqLRe1XtwXPgaE7El8G14ROshbRQFIWCS6/pd3DWFpIiT
	otIs1Xx4JJP/0SRUlm7xSdaF8ncBt
X-Received: by 2002:ac8:58c9:0:b0:52d:7b2a:938 with SMTP id d75a77b69052e-52e42213198mr49541071cf.6.1787742744004;
        Wed, 26 Aug 2026 04:12:24 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:52d:7b2a:938 with SMTP id d75a77b69052e-52e42213198mr49540681cf.6.1787742743575;
        Wed, 26 Aug 2026 04:12:23 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4561670a12.13.2026.08.26.04.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:12:22 -0700 (PDT)
Message-ID: <ab6d51e0-3877-4703-b5e8-092bdfd12ca0@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:12:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-9-fdd16ca6e771@oss.qualcomm.com>
 <20260826103319.BC26A1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826103319.BC26A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CJrxZGoEbscFWeN-dQK21tdc1upmlyF7
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eca18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qyT_vzTtd-Zm1bSrVmAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX+EKvHy9js6E9
 K0ynq6YXiTFSfW3ynheqZhg2LSX8ZnXqG/sFCSxhkK/WQwffFw0r4JgOCaQxFi/oA1zFvfC9hp4
 gtuqDonrZLuD6F++jbxtR2TQtVy2LU0=
X-Proofpoint-ORIG-GUID: CJrxZGoEbscFWeN-dQK21tdc1upmlyF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX9aTFPcfKkrCX
 LZRF3OoeXLom84T75n8IyceRBptqD0xWWuURXn6yAz9cBaOMcytE7Z+lA4qPoFO4L7vUX+KWxdg
 uswOjqqGTYk4u2A2EnPDJpGDdcRyFwb8gFzUefm3aVAuMj6hcSxft9mzL4IshugAplWzvDkxC0S
 aXI3QwG6YFPg6s3cy2JD9Qf6LI5+pMMPxjpK7BbxzQX8lQB5sFXPMiTX2bXQvUiuZVznzMShKBF
 DWK5ehApD8cMNhX7BibV3t3l0B52NBaODrnldeLNyN+w9K1pf2pUONSEQmV4oCLQs1rnIpJt9Ed
 0KYKN5uDI+Ww7KGVO3R8rz6vFTx4hhZ/TNpKfm34Os22ZA07SLSQ8n+HeZnbkhfPs6aRauQ7Bly
 rRWZaVxus+x8C6QEsLNdbhbAfT8EwTCDVqIGgZuCZyt6o1CCk7g11yGvjrXFmpV927cwv68Lwrb
 OhK+vkU5R2ST05k/U4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

On 26/08/2026 12:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The patch adds an undocumented check for redundant whitespace after ':', creating a meaningful commit message and code mismatch.
> - [Low] The newly added `check_redundant_whitespace_strict` function fails to inspect continuation lines.
> --
> 
> commit 57a0fd97078063900e6ed8376ac59fb6edea822d
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Add warning for redundant white-spaces
> 
> Show warnings of too many spaces around '=', before '{' and ';'
> characters, or using tabs for these.  Both in-tree DTS and DT bindings
> have many warnings for the first case (too mant spaces around '='), thus
> keep this one only for 'strict' mode.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index da7edd5ea079d..a60891d76137f 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
>> @@ -349,6 +349,42 @@ def check_trailing_whitespace(ctx):
>>              yield (dl.lineno, 'trailing whitespace')
>>  
>>  
>> +def _check_redundant_whitespace(dl):
>> +    if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
>> +                        LineType.COMMENT_END, LineType.COMMENT_START,
>> +                        LineType.PREPROCESSOR):
>> +        return
>> +    if re.search(r'(\s\s+|\t)\{', dl.code):
>> +        yield (dl.lineno, 'extra whitespace before {')
>> +    if re.search(r':(\s\s+|\t)', dl.code):
>> +        yield (dl.lineno, 'extra whitespace after :')
> 
> [Severity: Medium]
> The commit message states: "Show warnings of too many spaces around '=',
> before '{' and ';' characters, or using tabs for these."
> 
> Does this undocumented check for redundant whitespace after ':' in
> _check_redundant_whitespace() create a meaningful mismatch between the
> commit message and the code?

That's a nit, updated commit msg. Commit msg does not to repeat every
thing what the code is doing.


> 
>> +    if re.search(r'\s+;', dl.code):
>> +        yield (dl.lineno, 'extra whitespace before ;')
>> +
>> +
>> +def check_redundant_whitespace(ctx):
>> +    """No whitespace between brackets or other code elements.
>> +    See also check_value_whitespace() for more checks."""
>> +    for dl in ctx.lines:
>> +        yield from _check_redundant_whitespace(dl)
>> +        for cont in dl.continuations:
>> +            yield from _check_redundant_whitespace(cont)
>> +
>> +
>> +def check_redundant_whitespace_strict(ctx):
>> +    """No whitespace between brackets or other code elements.
>> +    See also check_value_whitespace() for more checks."""
>> +    for dl in ctx.lines:
>> +        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
>> +                           LineType.COMMENT_END, LineType.COMMENT_START,
>> +                           LineType.PREPROCESSOR):
>> +            continue
>> +        if re.search(r'(\s\s+|\t)=', dl.code):
>> +            yield (dl.lineno, 'extra whitespace before =')
>> +        if re.search(r'=(\s\s+|\t)', dl.code):
>> +            yield (dl.lineno, 'extra whitespace after =')
> 
> [Severity: Low]
> This function fails to inspect continuation lines in
> check_redundant_whitespace_strict().

Cannot happen, false positive.


Best regards,
Krzysztof

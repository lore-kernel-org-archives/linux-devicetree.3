Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B447D418A54
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488847; cv=none; b=Xf7EqdSM9NFRLnKE0id9h6NbY99AeQkBfosWM0A9ZYVX8jKllV0Tls/GIOZvCEfOKlpGlESNV3DwuvmDpOfBKq4undt8Dty8nAoBACcayhBl2N/iOcaNngPeU6D81ajoPqvzHo/6F2VQScuc5wMGmC5xkegq6+hMfuwgroNV3Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488847; c=relaxed/simple;
	bh=MlHKCIDftQUUiqdo7pY6YogHn8cAYCZTI1TX4Gk+PkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CevC3eVF993RZah+BdkLxwhFPzK7FkWvGUydI9iViW2mvt9wtXp0bkwYyvRV+mRYtD2qf/UP1AdXokrHxh/GhYrPREYRTaXrWQxfN46xx8l4ajtYZ+NprvjrVgUFRahQKLEFZ47oUsB1flhe0RgS0xV+lVAO/j+m/Fcj7bQrHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NN03Ugo4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bj+U3T/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NN03Ugo4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bj+U3T/u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFApgs125467
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEByWohEt8UD32R858BbZHwlO9aNQnUjtPRKe85QaV0=; b=NN03Ugo4Y3iGUuRF
	Qmqams3nA3Ibn7zgg+vgTzwF2RqBy9aJxAmOL5NA4cICe/jPd667j06qmUxOO++A
	L25KlBfYZ6IZX6hqCPfZgUnUhhwi/dAvmiE0Z0QPVjoxh1c+1++ygHTti/ttm7kD
	7ypPfjDhCNsjsalNpmwPE8O1J0eyAYj2kV5rk3lJBZYuuPVfngey6NjSN9AgHdqs
	6vgtiRlQ0WAK3YcYaBHyxoXTzvxvbbpJ613FyeN9GWCSpIZKaEFqhElpWh7eqTow
	mDjQPKKfq66XB4pl7/Bvevv+2gmR9NzvId9krl54yH0B+jEuW5NP7r7t3iQ8qu43
	9FNRjg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtt2n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:14:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fea4e86f5so1057605137.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488844; x=1790093644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEByWohEt8UD32R858BbZHwlO9aNQnUjtPRKe85QaV0=;
        b=Bj+U3T/uttpvHTjxz9XPdHX74gKG/FWmSP4xNe40WsrhRm9V0ZzPtZpBu+zJxfUqCb
         BuGn075OiDDm2darbhukr/b55WHBpYlB4RrHdPZhcj4Ow1ic5mScLHu/UzZOx+5NVXpC
         qereGpY9nr2+BhXA7vEeBzUu/lgw8LfjsT7+/max+0JZFzyyfd/F3Usm3Q1XKjZQA+xn
         R99w7ES2ZCfC7XvVG9T9/MVLQS/r7ehSpl9J6lboR/iYGS/uj4ko+YB6q4pxekii7dqk
         P0bfwAlx+gbRpYo9AAjHDgEV5bpmPV7Aq8l6j41kvvLlfoOMWBsG8o/93A8CdWi7cyls
         OR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488844; x=1790093644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEByWohEt8UD32R858BbZHwlO9aNQnUjtPRKe85QaV0=;
        b=p6PTkUlyZyCiOIjn3LlpXSZmKevZsgHXfbaMFgsFetvYkaAl9TqYu7qR0rta/ft3xQ
         /kLpqWD+ksPrZje03WutirE+XkPgAxiicX2tIvcfVhN9HT2xI0M3LcDOXjNs3bjV8XBa
         WN6GD7oU7xZ0eRudfIhE/9RBNB6O8EOpNiIikwAl0BjudopDWqIq5RfbVte8vtvwYBf0
         Q8Bd316t+w0gwTjslP2UaI7MkA+6/Z/bExAORJ8SZ2sGQdA9aQ+q3HwY7bOAVaC0J5sS
         9ehiRW7Z+//C7v0zWR0z4BNq6HUBeVnIYeYHajYVGY4i7qsCK9Rm2HDMF4QSYOBGIzoR
         xF5A==
X-Forwarded-Encrypted: i=1; AKwUvByW7C2Q6rKdkkYP4VIjXxPfZnliMQJpwrQWKJ8exaUGmVdWams+WnEZufpK7r6GsstnNmI/DTlyDvj0@vger.kernel.org
X-Gm-Message-State: AFuF++myE6aiWfr6RPj6UY8r+/07neUd95uiqAuDG9r8H4PIXfvf8fSV
	CtdNe3veM9MG+Y1mTnGDA7gPPJCN20Q4RT+mmRZY1nxjPrp/LV1YYpv0MEb482mcJ3hXBrbQaOP
	eBhvZ3gPxH0tDEAHaU7cA02DExcTkWbUpX6WKdKeXR953tAOoEXSoqOA8QsfXeeXl
X-Gm-Gg: AYBFou2liGFjn1lPn8zFQ/g7Fct2kz0G0s5NMCWVswKymONnSVOVjqFrNqNoJsxG7wC
	qHt5i46vjgQ/nO27PYLq1UWykBd2jX1iZqHK/g8KEwh5BGieq23t1QM03LZ47T+73j7hSrNcn/3
	ASOgKktH+AdTNxeaCmFejEEPJYKYJ0uGr6virPp3pDNlE7burbDpHAKpFRcmYF6XuExr6tBlId3
	0JZZMuxIKL3QSje/h+gR4upKybTOVoASNb2Xv2rpPfh8EYD/LN+iBbDuqNHQi9M0IVZiQWg6hLc
	FGySmrlDWL7XOM7UKBijlcFrYKlfI0s1DDSg62maIjeREMr7YzwOcnTUxJ1jcpbs5x3kSpfMHUw
	+bSKWQVH94XVMB7pDJobd26RZWdAy
X-Received: by 2002:a05:6102:869a:20b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-79d29e9c6c5mr2229694137.21.1789488843716;
        Tue, 15 Sep 2026 09:14:03 -0700 (PDT)
X-Received: by 2002:a05:6102:869a:20b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-79d29e9c6c5mr2229638137.21.1789488843240;
        Tue, 15 Sep 2026 09:14:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a28ba2sm7765205e9.0.2026.09.15.09.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:14:02 -0700 (PDT)
Message-ID: <f76bee25-df72-4c5f-8434-14b3671f1f8c@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:14:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
 <20260915142742.GA1926857-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915142742.GA1926857-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fJMHCC7Ewj5I5mnKffVxWUerwcjOxwC3
X-Proofpoint-GUID: fJMHCC7Ewj5I5mnKffVxWUerwcjOxwC3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzNyBTYWx0ZWRfX+LtSi0CD5nr+
 aDdM5DLUZdBEcRwlvRIgHpUw9r5Y8CQQcdQLIwU5TqMjdd7y+SEjpRnXUTwuGV6Ttr9gk7ER9XH
 YDxwiQCNCNwyD9NpyuFAkHL0ESRXZ4g=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa96ecc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SUcpoxMgBbu-HAYh0a4A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzNyBTYWx0ZWRfXzalF25ON+2BW
 St65qrTSOTbQXOIM4s7H2WWWMHeUmL+nDcGuFrctQ0Tmezy+G/FzXDXRhcKLEOHH3D0Q420E5O2
 Sfih9UIL+vC/HhX18VPVahPVIhRnetPG8xlOClMGD8lX9hEH5/h8SmJJQl0idls6D+wE/HjX5Bs
 zWrCV6sbhALUfYHGC2LZHvq4tl0cCIh+zs1+NIbuMe9HksTnCKDPTFJxRXt+WzvsNVEcHLP5Cog
 zbeuvxZKjnXvNZhDhxoQ+6GYhw44zm1TZw9P9jY2gVvb5KJJC0PkGIAWT5y+oKbIIqZSekDdrL7
 wIzRS0bFqzth+03bBMpM7RHeoiBDYKwR4thkCMIEJ6NoIFhVHYTp8SH86WEesLsmZv5aKPrLDBq
 md1aGvjUn4JJZbmJBFgrPIzHt4825Kyf0oWXVTpbJvE5cNrXWFUicgZbtrpOj/CAb5rL4brnOET
 aVxJ3DmVguc/ddZ3Z+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150237

On 15/09/2026 16:27, Rob Herring wrote:
> On Wed, Sep 09, 2026 at 03:10:34PM +0200, Krzysztof Kozlowski wrote:
>> Changes in v3:
>> - New commit:
>>   "dtc: dt-check-style: Relax property ordering rules (drop alphabetical)"
>> - Improve commit msg of "Unduplicate checks in
>>   check_mixed_indent_chars()" patch.
>> - Link to v2: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com
>>
>> Changes in v2:
>> 1. Four new commits 1-4
>> 2. Drop last commit
>> v1: https://lore.kernel.org/all/20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com/
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (7):
>>       dtc: dt-check-style: Handle continued lines in check_hex_case()
>>       dtc: dt-check-style: Handle continued lines in check_line_length()
>>       dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
>>       dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
>>       dtc: dt-check-style: Right strip whitespaces, leftovers before comments
>>       dtc: dt-check-style: Properly detect comments in multi-line properties
>>       dtc: dt-check-style: Relax property ordering rules (drop alphabetical)
> 
> Patch 7 doesn't apply.
> 
>> base-commit: 694b801ceb1bea205878f2136e8b25c888e51be7
> 
> And I don't have this commit in my tree to resolve the conflicts.

Ah my bad, I had a WIP commit somewhere in the history used as base for
it. I'll rebase and send a new version

Best regards,
Krzysztof

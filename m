Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71597332634
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799632; cv=none; b=A59hFuRdw0xLAZAHaipMnhK6F6uhE96iUx4WqreKxa3NBcCzVSATgLSx1O3+9m4dvAmu84+7OJQYZrcy48Lo9ioWmFROC38kpF9BDUl4dzFUAs3veQeDE5K+oiVZxBs5LVE3b8ZkJb45/45R38zoEe2awdGO6bmZ4/Yx85qYt4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799632; c=relaxed/simple;
	bh=TP9W1/vr5g6Ajt9WHgalU9mKPslVHZAMY8HCinsiB/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDDxXz2t8WvU2Pxifs2Wl1wIdj7nQj/KLlAfAvAxBZUPYlr3UIfMlWWoDmS2gBUeN0/zvi4ff11DrO+9XqeuGofwlGhmW3h8TGFbVAaDHq82Xf3x6h9mNjdOTD+254XcbPs41x20L3PzlHDCL2xbhZuJ8LTbPlpkzqFSNqsfQTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZecMkZHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAWGYqyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZecMkZHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAWGYqyZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639K2iCb1432467
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DcNacFAO9bIM6QzaU9Jv2x9Xq7zx68ZMs6W4qHDrfsQ=; b=ZecMkZHqILLn3LPt
	ooHSjMQVIz50mQ2we/rycYGl3BCvzfgYvb6P9BCNAjRieeCkl2AxWDmkQQJwtIEA
	S7Fsvanb3uzugSZ5/fKNcIohDmtPnFQ+NcDvRuYuc/jy3KaKhmeKlr4fQAy7olfL
	XGZ9mRFSN6lCqAFg0kMdz/CC2h7x/8WVNmSEWAonrLvJwDnelUlWSHYU8dhg4Wjy
	MLoF2ITu46MWioQixJR1Kc1arqZR6eAX5Xao/iMFlXIVxU8fdNTJ6LAyFOTLceEX
	vSlDpYeOOT29KYGrfoz3+ADgXO9FhRlUwhrgF9BtCDvtxm5sT1d+1lGQpJ/+c7PH
	QAtedA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfavnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:40:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso1853162a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 22:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775799629; x=1776404429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcNacFAO9bIM6QzaU9Jv2x9Xq7zx68ZMs6W4qHDrfsQ=;
        b=IAWGYqyZZ8NzGriCt+z9kIVcHeMU5YvYATiKaJUCAR+bcwovPtjrPYF6TnWvr8XqVu
         c9pZjcBI6sbX9nynfSFg/3mkfbKVzA4dHTUabL6W/5MnOtkniEXM4ykJ6W4W2RYIbWTy
         U1sTYtjuohqLjKLGAWhJKwD4irjXdJ2HAXcjCJti4FtKoVkFllhNicKpJmg9N0q4Cti+
         vYSoiL6oIDPIWjr+wkD6RfQtQqNsaIE11m0l+90AVdVJwN7/mqxLTqziGCPuFFM7VDyL
         WNU14aKGpdJXzZsli137QLlFvXchC8XV/CNToavx0G0cUHMqGipczJt4dpIGph/q2TZr
         ALeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775799629; x=1776404429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcNacFAO9bIM6QzaU9Jv2x9Xq7zx68ZMs6W4qHDrfsQ=;
        b=BUyN4VT7wv0pOTdtkqeWdPQ9bexG4ZVDTYQunECgiE1YV+rPazIaaDIBlEVX307Xy5
         bdVZsSo6HSVFob/cWVAHfdokjtP0O0JfGL4MA5CCoiOhmEWmSoiW15th4mrIL5tvzSkR
         wbNKIbK7FUcGDk4DmT2Xag2oZtkm8j+wV3XD3IqbqKZxXuNWhyh2YJeOT+DOaP2sW98P
         TDSgB96qZPPCJ/Fj5+P2bCTyBxykyEX1tnwRsuO9AoGypdeutCHFz/Z7Gddr+hJaunSU
         6hl0Zkn0637C/4XCXUm8L9HTYygapqDkYZrYk3xO+nPI7qXtOWzGHuCskt1XzebFFQRh
         iZJw==
X-Forwarded-Encrypted: i=1; AJvYcCVdRuRreYKcsG30iQfCF9sSudPvHaPL3q2cMRK3YpdI9lwiW+Z/E2zq1OSGwaauswq7fV4Xh5FZLwZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YyOhZpMHNe8ggf9rTia6Wwes4ZjrPJsi04NJBJ/SnNC1a6nkDnz
	gdlBBf3XH0ar8ruh0GHnQIuweYVSVpZih3sJasolmtZdmRZPzdlvtE6t5k4LnQDlfkktBconmjp
	ZaOvtM3X7w/YPJ7fwywrbU26rJLtLd9Fy3Dk6/Lq37qh5nCEd6JBdc5bh3owyRwqn
X-Gm-Gg: AeBDies+Id+w6z+cVT6q/mX+wIvKjZrbfJyFQl62xV7A9WF4UjW7p644o9mQg9SOjAh
	eIikUugKJkohnvY1frDBaU96xgbIhKpuV043p7b6JNnKBk8t/rOX3/CVCDHLz8I3X9M4iKt+lFh
	yrGlfvIL3N0ZyhfbwhEnmAPBBOg5KNnSTBZ2NmCMvnKsjnUxnUoL8TSh0rV6ft6hsjN/FFECufW
	A25Hjui5nBHm1W1zIRRdulypj0rZGF47V1BgI1SJ70oJNpO6l9oqUUU4d0lzsXhkl175/A4tgpv
	C4oOIUsnSFhywB8DcR4USS3f1NUSp2UmsnfNmtJUgKiVequ8QgxN+MbWswrfdBHqzW+N1E4IKLN
	TWY/Qr/58VQ7J6A17xi3vUar7rnPNmb4BHNXdnwmq9QC2sA==
X-Received: by 2002:a17:90b:2e84:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35e42768bfemr1877309a91.7.1775799629414;
        Thu, 09 Apr 2026 22:40:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2e84:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35e42768bfemr1877286a91.7.1775799628889;
        Thu, 09 Apr 2026 22:40:28 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41345f63sm1765599a91.16.2026.04.09.22.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:40:28 -0700 (PDT)
Message-ID: <8d97669b-7bde-4a21-8131-0907554f534e@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:10:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <fea78031-e570-4348-a4b3-d113b5749fec@sirena.org.uk>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <fea78031-e570-4348-a4b3-d113b5749fec@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d88d4e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Tjl11wupZS1xL07QWgYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0OSBTYWx0ZWRfX4GEshYJNtQpU
 Vm7CqGc+qUA3B8smiZxg6fo2fEvvmV7NqumPFS8pVk2KUI70s7hK4RUC2jFPAkBe0u/SoFe8Oo8
 Z3EG9qVd57rYrP1YkACihTemp+ETLNr/rGQbX/V5wiFyGHemU565fahLivHGvXB99HsdlXwr9+Q
 IRb3UB4nVLA7WqI6TlOxQI+P0du7eqMkPpI3RA3WG6WscKy7C2Pk8eDrTrbAFdUa1GUs2azoh1+
 Ke6Y8MhKQtT4BDfIGZgSU5T37iO8sfmij4GtH3s4BEXBqhBYKC9+orc4llA5ZR3x6hgER5FLQqH
 +QZszFWejaTfnp0ZRJQvF2VAaNqL1U1egDIe86D7NaXCqVtPEKMauCumZKRxRK3HkI02N1Xh9ZQ
 TmP2tLBMfVTshCNemdCMTe8h9HkR9FW+WZAbTZ+DiGrIDh/FugxIXHO1KXO5wk+D+vjl0Jhbq6G
 3L4A1DB46xKzeZ59aeA==
X-Proofpoint-ORIG-GUID: WI2ahXKau1tlPbxVliBsj-3PhN18XQw8
X-Proofpoint-GUID: WI2ahXKau1tlPbxVliBsj-3PhN18XQw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100049

Hi @Mark ,

On the indus mezz skew, The codec rails are distributed through fixed 
Vdd (3.3V supply). These rails are Board‑controlled , not switched by 
the codec and not power‑cycled dynamically. There is no per‑codec 
enable/disable control exposed to software.The codec is wired to rails 
that are always powered when the board is powered. Hence this justifies 
it being handled as a board dt property.

On 4/2/2026 4:53 PM, Mark Brown wrote:
> On Thu, Apr 02, 2026 at 12:52:56PM +0530, karthik.s wrote:
>> Add has_always_on_supplies for managing regulators. Indicates that the
>> codec power supplies are provided by the board as always-on rails and
>> are not switchable by the codec or its associated regulators. This implies
>> that the codec supply regulators are always enabled by the system and
>> must not be requested or enabled by the codec driver.
> Same issue, why would we want this?

Thanks and regards,
Karthik S


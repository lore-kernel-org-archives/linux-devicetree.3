Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353175;
	b=DwOnwy8WpcmJiKitvAaRprGFy1Vz41lD83IEb+uhDe+r+4s+gCYY6C4K6cgt+a+dJmAa
	 siYuYfzPRxMuaSPuFU0uJ3gHk2MtZohpVrFtW3ottWme///4H3/aEqYPG9ScyMncR0QtJ
	 gZTAmqwBSQh3Hq2vkAmMuxba9Cd8TLmlk0ujXNF5IIcFRAjVzNbixoscCPScIbjJBsvRb
	 nQ9J8XP9hVCpuVahXCZ5490Ux5TobV/UNhUdpVU4JZ1H9N6lFISmu9ySQFQqzBLL/f7Nh
	 SL0XOT381zHAlN5BBBtADB83LZYX899w32MuRzZKSkkn3GOL58WTvn0wnSpX2HspwCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
	b=mTt2+kCHZrPsueV2GvIlDz5/0mi06Em4HOlL4UIK9x8c+0kYcehE+Mjpxh7U13+gsnHm
	 rjZ6vMoVWctybZA9VoykZWqd4VUy56kAzzOyf7dAaK3adqrpZ37FW5VkQvKQZBHCCmsdc
	 7jlgMVqvfIMiGBVQo6e0a14sZJVlZD0YuUCUNFOL2g649qsxWSmYRgxfanarIXntLGB2d
	 aVEkZvnPrqSBxjFLRnyR31RkK5oDniwmySTcbRWsaxhRjkeEAOiIyd8oXQpR7tWCGR7x2
	 HhWhayl019FosqQy7QWUEZP9Qk0kjbSG4QW6erSX8EYG4ipXL6MLXLlnUItDQsT8jgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWrRr6lY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjljdw6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C8606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWrRr6lY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjljdw6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8ErPC3737721
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=; b=RWrRr6lYaahDYwc8
	dAeWhIyeIqJ7u+wgKrKjWW6fuVo9f7ZInfVbLhyITDORMvlGYrDA8qlrtACNtD7E
	yz8s7iqTzpgzT9l4lLabTxPJDQEPvcBapWbbDNyum5yyYyKcgAqFGpYfQmJMltCB
	HlamSbXS3xEZfvZN3vq1eaQwCAGderXDodph7sv7SMPLmz0vmGr62Y69ymAOyvNI
	BbQ4uc4xxntHkNwHwqHjClnDjbRFsNr7B6XiFlV+FP0XjAjk/GHRQRv45isNXdO6
	oziz65z93uMBjG0tWdIbK4v7NXti646wbPVG7ad5MXPjYlZbEfhxZGXIMfvwDoLX
	/qKUfg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75271e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1483544eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353173; x=1793957973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
        b=FAjljdw6WbdGz8JKKFfBRpsr75CTlX0xKXVcU5HMRIoTony/Srp/0fFnQZStf+TGVH
         digwhqOE9NtbQFblET/bMGVzuXeS1g8TDHC48FlWcbZw6mCHA05KgK56GLKX+Bx78b7q
         wyeVtzOAsOlcy5eieG6d0IKGtL3xBRVPQhaJIviBtlgW+TPP+ZKL8YK0AB1dWYnte3ei
         +BxlzghV4rlecUPLb5RFNOhQvWRZLX4VIdTBZUfrrObINASJ8392veKNNWf8BLak/yoL
         +dUTDZXzhXnImTK7ndKdsj3kM+DJ3zPhHsLZXib+SmZfisZQnJLDgxsX+scTcWV1mVst
         Q+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353173; x=1793957973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
        b=YkMr03Yy3u0jkkYK08PWEcM4WMztoikc57+nXV9Fw4bizb/HHhl5FSjvV+stLe7mNS
         xk8BpfR9JzWv5v86t7HSRIv5TOeDn96qRPbb3EfPvgpLYYBz7a14dpfzKXcV9ONZGDVO
         SXbbewjA8qHpCmjjCKHCVa5iy3K12F2E1CQKJus2SoXPQlersNzsCnYKiCOGnHAvVt6s
         iDctvAY5rmkdCQhUofPks66a/5uHq7P0bdqH7rFTNnMr1wRrubJNaQ+7Xs3TFy9WXsMO
         puDPKG9O2KUistNYSEk1UhCcZEGeLjkntooKXoHuVHKrh/n6NWR2mBw3Wa4ipwGmQMlD
         ZLKA==
X-Forwarded-Encrypted: i=1; AKwUvBwcNlbMdVxH77yLTCIiaRMZJSinCW8sVWRcNMFi1E3y2c2BJeX+pDT+VNWqbGf+ZMF0+MDREfsEyOcm@vger.kernel.org
X-Gm-Message-State: AFq9FYII8pKOYDseS98SCQ1QVt5HzT8xUfvSwHr/R+In1NzXT+vxLR82
	hMbVj78WjRjE2xPrxaA7K+jHlOTypqdeQW/6bvj1hS0kGckzFmi/umqA+ROGTd+eGNTUWctJPyv
	7vO7nJmnPDrQS0nsRBgtsdydpqfz6lBDDitfR2HNqXLyTv0NExxjXUcA1u//W3ePO
X-Gm-Gg: AYBFou3ALyoMGbyTXTel7a3cYhYXnI3HHYspVW+sKbcKD/3hL+Hh7z8Wr+0EVFqS5v6
	ewau5pEjB0sIakLo8I5plCqdWE6svGwt11nIyp0ha5lQoghy4EKNg4FTkbS0ePRsLaKRXixnhvB
	Gvv1ACktvLzdJFnImbXiVnSoOe2n/TdQT1GNnoY7qBRS8xKqvD6ijjIUg8FTJi0qD9MqKK3XRiw
	286lJ8fvMmMr4+ddAEt+IeJjU3I7+63Ys+3AeMxmDycNn3+08TSmEbvf7lLdlEGMGXrjRscmC7f
	WI4qis7u5Q5csKzMQaOlxNNdRinM09RMyEoZJt0k8L4iCLkuyqFBKKq8yrJxe+/szD6ICPJCSnS
	HdYf4uFvatxSSe8GGD1TO9PGUdyz7XG9UbyqPGfV9c7NFPgwFY3sIZc2k3OjO+CnJx9h7vNJYvd
	IosMcG
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr2925512eec.38.1793353173389;
        Fri, 30 Oct 2026 02:39:33 -0700 (PDT)
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr2925463eec.38.1793353172638;
        Fri, 30 Oct 2026 02:39:32 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm5716667eec.28.2026.10.30.02.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:39:32 -0700 (PDT)
Message-ID: <2e26e864-1f17-48b1-b84d-17057e7a343f@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:09:26 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
 <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
 <20261009-space-crane-of-prosperity-bba4d7@quoll>
 <1276435d-7102-42f7-ad92-84c61aed6d2c@oss.qualcomm.com>
 <30044b8e-cd81-4798-991c-dd2e7ca6d502@kernel.org>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <30044b8e-cd81-4798-991c-dd2e7ca6d502@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Q-5IATObazrIXIot0y8EEqxUA6Jp0Qp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX4cEgdqUS7uMy
 TDB0AkaBVqTpvNip2AEv7lNA/ncbsufx8P8XC9clXtNgc2DJ3PFkyjzsPsqZpcud+1vzH2QyL22
 APq+NRMIgtxoOeOrhHvS4zJSetrtaHZBm7lmKC0hTuBoyEXUMoQdOKrtVQyiJPRXO6L6SwWNCa9
 dXMwSilkwzzmzvX9bNGKquzCKELknFT8xZobpDojmxLq6njabXRxbZREoBaiPJSTXpO+ye28XPT
 QJvuXbtjOJXwSM0r2bLhgDuqOerVDOBsoSUEWiWeXeBQvmHJP5TE+DgKBmH9wVEsr8YBoAFoovh
 9N2Ki4HA9jw27QOxaJ5jKQV6oPcMjgH/RyELnWRouKkaVcFxNIFdr7P1LDs+MSPLr3aku/D9lF9
 nhr+BPv2XriEIbhHyMVP/xSIra9o+FWORY+/J52dL0l6yEFSDBVnJkYgLsUes/nFbRYDMz9wJRf
 aZZlr/3E/gzd+97287w==
X-Proofpoint-ORIG-GUID: 8Q-5IATObazrIXIot0y8EEqxUA6Jp0Qp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX899PVvHBKo25
 ZpDOI+skyfIR4Ny5nLv3BpbL5LRMqv7OCVyb9SUg1fF2JjAX4gYW11MrpQLKVQn81llyoC4JIxi
 05pBsg134DGkzx+pP+xS4gbDgyiPrSU=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae465d6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iXeEQ78Lhshhe8WC178A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038



On 10/27/2026 7:57 PM, Krzysztof Kozlowski wrote:
> On 27/10/2026 14:12, Vinayak Katoch wrote:
>>>>
>>>> Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
>>>> allow platforms that require 64-bit values in iommu-ranges to pass
>>>> binding validation.
>>>
>>> Which platforms are these?
>>>
>>
>> Kaanapali onwards, I'll update it in the commit message.
> 
> Then why all of them are changed... anyway, you responded two weeks
> after comments, so that's only fair if we also review in two weeks time.
> 
> Best regards,
> Krzysztof

Agreed, relaxing the cells for all compatibles was too broad, and sorry
for the late reply.

In the next version, I will add conditions so that the 2/2 layout is
accepted only for Kaanapali onwards, and plain "qcom,fastrpc" stays at
1/0. I will also update the commit message and add the new example.


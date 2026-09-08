Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EF437B02E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 05:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845970; cv=none; b=r5uUapAZctLjFCi+2cN8WkpbPK4s34qRybf3AK4gMvMexis78EgkCzRiZJJyON1yAWuhuXlxGUDlnK9Oj+Ls61SeZwujhfDVczyzLQOwP7ol0fE7F2n1s4KT9ESSqCViZwwmFmuzhqN8JBKCk8C5+nTWchtGEeY7x8j9m9+//0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845970; c=relaxed/simple;
	bh=5aoWEdoIK4LG8jJFDqvXeQojo/uZNre8Vv41wWy/GXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1wP/nL2naJ2NAIee1mDa/QrZdVa0z4Bb4lCy19vb5VhRqAG6lUPWFqAFMIfSSNA9++zFgehP/HTonWzczCT+szJ4m+vzt0mY6hGgwaePOT9C4v5YYtwl7VubGCbU5jTUrKnMCy3HGWU3t3qrk6L5auqMU1c8iBO9KdBlkxurtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/BhhBwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHYyu08p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/BhhBwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHYyu08p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlXnB107728
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 05:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgXJRuS6j45tDk50aJ/oEXxMgdJ1P69nwuH1jm3ZTs8=; b=a/BhhBwLUUXM2Ams
	UKjGYQsshyhWnq0ujOrCSpk/JOiNz2KONFU70OA3hdAd1l0mfZQNyi8WaX18yWzE
	OrR/69sk3b2aiiM3NLp8jBnf2HP22qz/XAAMOaB7sQ+1ZOuTKM95XDRo0fXt0bFA
	X86WfZ7abxpF4BltOTHPkdSkG9kNLSnI3ZPXwTPNIxy7PTS3ICAYaPSK6796TC0o
	4ESSUwfkyJ1AGSeWg6ijNKIiC97n8BFnifRRgfSHHeaeyG/VZZ8M59+nmxLUl+UH
	r0lmoS1q1yx26J75WiH77edD0D/dfMnWCe/sPhSPj90u/dU+PBBrtAODWZrmYVSm
	iacqIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty3fst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:39:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso8144588a91.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 22:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788845964; x=1789450764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgXJRuS6j45tDk50aJ/oEXxMgdJ1P69nwuH1jm3ZTs8=;
        b=OHYyu08p5NRQg2U4MsVq0oEp6wVODueYqaJkWfWIMc3AwURymxuiKLCrxIZB9h/XVt
         3bjJogXSnHy2IQk1TivU8/M6EX1ttcRnBnHOYRAZKTue9h80EY5bz//JpCaYK0g9Wq9D
         SOjjb7YkL5PLQp4kacYUJvzh/NswScSwV4UQqSUJCUxbCZQu/CMlJjj5mN0G57zUbvIW
         WoyoNYAwim3hJmnccjGS+vqdp1hATrk/EmjNQGwx711IuHpGypj73tqjt0t/kTGbYPak
         F4qjsPcrwmN/1/rKv8+WmPcbTGFCJ8C/sUWxjDtDlfRPU1mg5p/ygEt8OVHXGmVoz9gK
         li7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845964; x=1789450764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgXJRuS6j45tDk50aJ/oEXxMgdJ1P69nwuH1jm3ZTs8=;
        b=eYXTG8ZHQUwftB+fxVdRMWBhz5OZuZ9UwOoPwUhg1zZ+Aiig+26+bT9wsvzgPzXUwB
         qXZP/Cswei7H8ahA01oJti3fbzXZ5gEEmtc54gCbkAECGV22TA28nidy18jqKmoXghVr
         9O9vegwUStzKmzwxUeKuejiq3yZgor//b6j8a9tOkrkI2nml+m2diE6hKKZXHarn33oC
         7ZRHCcS3/7rIcRULrKQ5qJqp5aU3hNsVglyp70ISwT7fZ84emEDgGQiq9S3Hw+yN0NE/
         msY3w8ZZ/baWJ4Yg9zMAivcYbeqZb8JeTIsUPKyenoSaIj20IJCVDj7bFfpR59+FbZD9
         tWpw==
X-Forwarded-Encrypted: i=1; AKwUvBxvozlSSHbY1m7D+31OoEZe9fZSG2IxSZmBxUD44dEE6CQRVQ+7UWlRmHrQzo4IcXmOt6ZmhaiLpqUM@vger.kernel.org
X-Gm-Message-State: AFuF++mymQVVu37rPhEiGo+z1uW91lpdKiCnULcVdjbCBmvlfoeeLHhv
	foRWqnhX/jA+bP8i4yFZYA83tx/mNJ4xImOhk1EU92CC909gQxzuQ4GCA4PYYMQ1eBero//oeBZ
	e3S7Q7Hxjp0BvoVA+tN6dtsmB/QyDVVhjGMsA7jT6NA/Yq09MoR4Cicp5jc+1Y7wP
X-Gm-Gg: AYBFou2UWqKL/GDEVqN9aeuu+/LVCTBvLfHkbR6h1zSQDT4uTpi7VAS3sdpzcbF2PTL
	xX0HWFq+NdNVOSYRM7P9khDOZlFtqzfsZvr73qALhjI+3jaoyXDs6uIMsbeJ9krDbkOoDWAbcZY
	Dj2LCO1MRgZhJDafGKVTX58ok67CFcNyBHUNaJahWkruPt+oPWxtmIGpgmUpLpawMYdw4IaAtsH
	2KhFHghxg9/xlv5P4N6xUUHzAr3+zDHzBOY3SuGvM5p+0Ub01MydKJoZJTYwIBuXWw6ScYyvbZv
	OxpdkWfjbXcqjI/+kgBgfp9IBI270Z4T+J+jAH0HwEQr5NfKtzvnPFYYCvn6Io10NuiPqcDuzQy
	Lu6yBPmBr6f062mHs6hYyvwVtBiARoA==
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr46802505a91.0.1788845964447;
        Mon, 07 Sep 2026 22:39:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr46802442a91.0.1788845964016;
        Mon, 07 Sep 2026 22:39:24 -0700 (PDT)
Received: from [10.92.169.30] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm27672840c88.6.2026.09.07.22.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 22:39:23 -0700 (PDT)
Message-ID: <8d10d92f-0afb-425d-a517-1a7b24b80342@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:09:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] Shikra: Support for QCE
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <CAMRc=Me=JxgZv=cuysWhmwQjUp5eHcxzkzoPUnDWipjoNdn4Ag@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAMRc=Me=JxgZv=cuysWhmwQjUp5eHcxzkzoPUnDWipjoNdn4Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9f9f8d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rOgB9dYqbrrgEkEPSjwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: AWrl4P1LaFPcLGuLz0vexY30Rg0cmqDv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfXw6MwP0CyZJ48
 h/40j5I3VIpvhqi/LCl0ztZIjVBCsqmY79vqtOIRfU4LWwhTGk9h4inBmHFtdB3yKgoPsKbnkMo
 LICYX9g2jMQFkbA7b8uU3yb52UekZRU=
X-Proofpoint-GUID: AWrl4P1LaFPcLGuLz0vexY30Rg0cmqDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfX6oI9RyYx6YQc
 nE+MX3w6Sl80KLF41cOGb8Lz7ijHugd0cV8TMD4yvu8crpZY8mbp//rxC0TDR6lOkPzNHaYp5FS
 QUMFuXsfiSCws71boU0H/NozNC4E6UEIWntLGnBTEFo/jDqLP1iPFz+3YW0cooAyWS9BF98+fHE
 8v7n8Fyo0TXrsDmmljtUKZG0fIGHggG3yY4xKARpLXKi7wet7wD/kf1zE+oSoWm7iFQa3LSmF6T
 ZTAyvqxyItlfqay0ReWtfnDcu0zIq3k4WWfHN0NG3BMNyZy5XlVNQUuwsTRnFWi1XChmuk0EHqc
 vBFA61DGBoPYUUHC+cwkTnC8wYgBnqUDOIshKwliMR6QgH6TedrOTGNNpMgGwjDMlky30JJYHDU
 30LbcM0QF79hOyupSSHNAfsELrs3mShx6i4sGrurrfre1T40uFjlXuE8KKTpCy/i2fIU8JcPFp4
 pP/JJuzBwiNfCZ4fNWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080059

On 07-09-2026 19:16, Bartosz Golaszewski wrote:
> On Mon, 7 Sep 2026 14:03:35 +0200, Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> said:
>> This patch series enable QCE support on Shikra.
>> Shikra is derived from agatti target and QCE was using different
>> compatible configuration.
>> Also, one more reason to update QCE is, clk-smd-rpm was doing proxy
>> voting and crypto was consuming it. With proxy vote removal, qce need to
>> vote for it's own clocks explicitly which is already being done for
>> agatti target. Adapt same mechanism to Shikra QCE too.
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/agatti.dtsi#n889
>>
> 
> This looks like a set of fixes to something that's already been queued, why
> is this a v6 and not its own new series?

Umm, both commits are having fixes tag so indeed it should be new
series. I'll collect feedback on current patchsets and send v1 version
next time.

-- 
Regards
Kuldeep


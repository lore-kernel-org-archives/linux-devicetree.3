Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F57346769
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326391; cv=none; b=KUWlBn4n9DNqKu5Oqc6hR7WUraAHlJyxNJL8aVPVyyt4e/54evF+2Xah61z0DcRiOcXkH6qeq9hcOYCwGwVZNrZgJTcXK6Okwe4tOeB1eqqHTOh3qyGTYMc8tDY4oHqR32ihSXPqeXGWX4kEL45MUyz+SbICHQxr5gfqE6ZEDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326391; c=relaxed/simple;
	bh=1cTTBQ3qWhJxNM1sV4sUI0cqeKNL3UuiEjSneSIzNU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4+M2AmGGSaSunefud96G+Bt2liQHuP+woiQXGljexPVzz0LUu/pSqLMJEq49v+UJPuD65l69LNDm7IyENS2zQl7xzgp9UroMyX2MlxejQJ5FAT26YjGM+f44HddUgdqOpCUK8RQLpK1rkGkue1mSq5uKrYrkorc6EhSfKokEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVwkjl2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WzYqJ2qd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVwkjl2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WzYqJ2qd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66683Zbg4150790
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj11zQeX+e/pg0HlyRM5ASymmrHqeGIypaNCd6BtBz8=; b=VVwkjl2bCCf2PjlB
	KBDt/Q8L5k5nurZ+bQjgxktoS+jZVgf7wdi4PDZzArjBBF3l3wg5CGO5b28IxEBT
	3tgBPEIFV9vrICZniKuF2O93061xqbTqI8z1HsCC/5XTFMcFKdE8ngNGBfVqMoah
	Sruz9RQjReDhyCY7WGUFN34tMd+UeGYjyN8f323Do2RqAF7V/PT0GQfO5fvqIJWy
	otPqoVUFUElLwB334/Lq/ZbQh6qpAjjNDuWg66R8/lRHplGTcNzvVm5O1XzlZGB2
	TvafTdlu8AdbjPoQ4jfNalqlobSiz8Ki9E1Gr1GJI9NDa6qvXPaD0baW21I0tei0
	VsLFYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h502rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:26:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c267931ebso19089961cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326375; x=1783931175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fj11zQeX+e/pg0HlyRM5ASymmrHqeGIypaNCd6BtBz8=;
        b=WzYqJ2qdPD25igo5tqYhQs6PEXhTJeChcABw+POoxumQ3LSmP6TLYU1YRTIeTaaQ6O
         vp2mebtX0mUztew1sr1179R1VfBaYZv60T4Aqu8Sihux5nnW3fQb59YW3KKppgyop5Ff
         vWW9Q629wlQwppqkWo2VwyfARe4KP9OElHtjvfwLpGzpxa5Y629dFrOutQvvatIT3vGN
         Lc/PHNu2OW4tIMwSiw+igoaZ5hRo+JqXrPpu8tpeA4ujewnelep0balGZWx7ChNQJ0bw
         PB7pL+FVaeR9vODX+ipU3fioCXBA+QMEqkzxTXaGYGV3vdhs7OMstJQqdJZq4B/1bRN3
         pxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326375; x=1783931175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj11zQeX+e/pg0HlyRM5ASymmrHqeGIypaNCd6BtBz8=;
        b=A3RsYQfUWaneTPx4yNdYpOEBu43kojG3ZjH0pJQaDI7gZ9SpPvYn/tOFVMORSNREGV
         mvltSMlTo83Q5ALXeSxawdUYeO2Fu7j0L1LBBKPD8ylJELwHpKQum8sTLuddZyzgghsd
         7sXV2d0i3rXtBi2PwSKGmy9o3BUyYw6FxaUOrE4kAHtBXDcnKFsNU92lFT6/XrCVmXuM
         GBzJq8JZYxisov45MWhykaN8I3EAUAEex8AAh8EI/L+4TDmKFJKebuzXXbUElACmiTY3
         fI5ByFZYEfg1T7ML+c35cz0s7gxPyg3NAOwqeiYuRp30wChVGdba0cn7XdPp/hHrEDSD
         T59g==
X-Forwarded-Encrypted: i=1; AHgh+RpQ45vA9/Q5kTszo8EFfj2FtJorlukiBjaXEkUcShz8fV7G6e80fhVNBSU0KuFOUD0kRCSbNJU46IvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRA1lRqbNd3FI4mHSJxFaXCkF7cFQBV59TwF3T35QPbrWlF+4
	5zUFoNlkvKiE2CwUF+DrOr+laBCAyXgNMNZ5WcbCty5ltA+iVGzvulSdU/eEO6F7NPLVUACXoUX
	wsGM1t38+VJ4LQ8bhE3QtRthUoX6OJk93/9KETL5fd8FJw+iRJTQ+bJ05W9zc0ivz
X-Gm-Gg: AfdE7clg241wgy97CDZRvLVw72pDK8jHaccpDdisNMgP6NcIBaVbPWdYHpVtbMREoab
	sMYcAou3jiM3jHF7WjaqQCouekPAlMH+xvWqeo9Vp/dVdIUjrIWikRhVCLn0khCiB9RKeRL/wgf
	hlYs2r8u+ipRNGSKfSMKocJer5Ac9s3kzzjOzHzrzal2H5r4CzLR7BvbLvITtUQBmE1dTH4d4BQ
	IO7B37dHRfcqwnkBR/y370ypv9PA9vowWmgVgwEopGEcWvlFu9uvafpbBATLMa5fJOyYkvegZdz
	zGDhtsxB8XFlQ+Y+sYcgcKo6msitQLKrlVq79XX5DRMhZ2kYMaGKQ466t0e8jCxRcCG7/C3kcvR
	Q8yV/oMCwWs6jdHYpsg9HHIcOAGWAw6oZrJ4=
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr84424611cf.5.1783326373833;
        Mon, 06 Jul 2026 01:26:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr84424051cf.5.1783326371901;
        Mon, 06 Jul 2026 01:26:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f54c8sm691379766b.55.2026.07.06.01.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:26:10 -0700 (PDT)
Message-ID: <0d90e8d0-1ca8-4070-a8b2-a889c046ecdc@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:26:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Correct whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-4-16ce82a2bcfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-4-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0HNSJTM8diuSLopzrUOzkni_oYJ0KPTS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX2J3KkJ9QZs2f
 PXswXbuArRjz+9G1ZEw1V9baFh7HH2h520qs+XnWm6EYgWwzammZIVzADLj/yNDl7VdGyjDc+hU
 FXaOkhKX0ct8/C2r6hiwfoxbrfK77Yc=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b66a7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NeRUaqBbCO0IiGDskO8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX4iqsjK/qEQSE
 6pT3KvvVYWegUX9pySH6JjIoVtilfJ9OKze/tUfXm1GaNcGTQe3LOTdf7NmiHvGAEtpFQj2OLwr
 jbwdeyOYx9+dNisjDn3uDxlQQegvu2bR1p/3S36WmGeJJ4GkZ9dE2LLDd3x3Laoesc8BgZOzjYn
 hSin5KtCZjUZixKC5n4tUuSRsyG/nQzIMJ0Z3pKv/PWMq1RYhLJjxIJugat/PkfFQpVG8osVj0q
 ZBpzePyIP+WoUOldSfHcW2UFo5XAUvWcQ0z2r1nWyn2q/Lj89aA/P2D+bDTY1sAdmkkr4tyELCl
 SVEoPo/VdicTVxAKyjYqXlgIBNjr3ZSt75tMW5YJBn9rAxJqM9rtvMjE0WtTI5t1UkWgpHPmvS6
 M0Re3Cos1AwjiDDfPIe31g/hUz4iKQpwz9apyxKMyubGdoZ9LyS1KsA9RLTiaF+H5HRxDtW24Zo
 lMN+DKeDWT0j3Cuts5g==
X-Proofpoint-ORIG-GUID: 0HNSJTM8diuSLopzrUOzkni_oYJ0KPTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

On 7/6/26 9:03 AM, Krzysztof Kozlowski wrote:
> Coding convention asks that equal character '=' in property assignment
> is preceded and followed by a space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

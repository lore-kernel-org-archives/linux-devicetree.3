Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2E3914FC
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263020; cv=none; b=mpY30ZHJw/b262Uqn3ESs2685jRFSxEhU2zZnACI49x1yqpQBeFSF0AkEffnd86v8z/F1yD+i7w/uN+whr4H7OxWNjdxWtFaqp9nvQfSV0RV72rcMomfihO3cC/S8/VMs8yWq7vAIHvaTc/vVrF05D6oWXsxYsL47AWGxr/gCWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263020; c=relaxed/simple;
	bh=UZAC4stAGVhtkOpRkbo+a1Bu9TF8D63nsUj9pvsRPl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBa1TQmY9pZZ9w0bkaDw1Njlids6dMOVBmcn5/VZAnVCQp4OMUCcdOPjcSm85VYDjXfTkryWI/UoKns1+WT2BJWs4Obf/xNoC2LWbOkC7N1aGwe5X8GYPHgX9l5Y4hOBFE3el+CsLocpjkjijwfDI/Yx17wWk9a0TWIy+L6SWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hynfWN9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4G8plQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hynfWN9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4G8plQ9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83iN41364063
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lmuE2hjC4bi9AnbpQ6hvc2PkKbo8iohz8RVpr2tyak=; b=hynfWN9b6u+FslT1
	hku4Ertisl5EdfLIcNM0RwG5OCWdVUu8zQo4L48FUxyn0riIWco8zeNPjiCqAxBp
	8+SJKIf1dLnXZdnvJT75Y7WAiK584oYCa5aF14BnWHK5fhgS9/RykLC1WFm69cF/
	tYdVIZb4KoI5aJkiNJpn4jCZAfZUTXi/M2idsCEdGZGDnUtRHiJP1QWqlZy2MbGl
	grCLsJofdQ4N2ByoBPWwkUsGOcpP/BbHT8MwrTQCXk9Sd1dl0hgGUkb+Ncj54fQU
	B/qfp74juq0GxnvnDHmeCNGCY+FzuTW8l/w/BktdrJ6ZjC4PPNvvHL5c0Ab0stYK
	Ye9I6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78m6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:50:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd97debc51so326083885a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263017; x=1774867817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lmuE2hjC4bi9AnbpQ6hvc2PkKbo8iohz8RVpr2tyak=;
        b=i4G8plQ9KygN1rv5A+1lz3J96ScSt/8D8fTxRzu9G2BpW807Gmnl20EIKv1w26/ZsL
         WeKUcYmtbtARB+Rs/92b+mQEgmgX8h1K7ulr+DlHIUJ7XQ9/M3esVSWpArA7FALpJ/yG
         O3utzd1MbgNBcdaE9XqmkQ8jTV+lNW6r0eUh47DmPO2l9zXFK0s+EI8fCj9gDmsUDgp1
         1v7/CL3BBDYU2kR+rKvKNWLegbqbMRIJJPBRdJ5C3rfBsJqfLllW7NqtK83gH2Ge0bjQ
         /EBo1ENw4reEqrs+vQBHL9pyr95XJumUOvwCHTDA19/g3U74bdNnjOkEqNKFM9CmWpDl
         1VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263017; x=1774867817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lmuE2hjC4bi9AnbpQ6hvc2PkKbo8iohz8RVpr2tyak=;
        b=G78+RMTNfF4WD3FN4tCxRysdXiEFZZaNJcxWIKcRMcm8P1vdXwQMx1/j6TId42xI+c
         o4RwSCtpLxxe746vuEPfI0MFJIjdXCwUjuPXVwrEYFrMtApQ6mTJTHtE1DlU9233EZQC
         5uFR/NgM8ueZaRxuonWTxKGHkRMQsa4B+qSR9J1QFCxt1SYWO58EP1KUhBPZIiNDpILh
         qXQYY8a/NVWyYoeO4t0BOHpWzWyddQ+VS11p0LdHfy4hg3cU2Baf0Sf3ocKUJfz5NN2V
         bm2r9ucZIpSJR0KQRwLl6jINjEKkvj1AXgRs1RJ9XkfhT4Nz7fghqj/2oZT/yIjThIx2
         keLA==
X-Forwarded-Encrypted: i=1; AJvYcCUgG2GVa2MZ/9jg8yyDhbZe7vxUbUhP8t9RO2CG8PhfQb5tz+O7l+NO1shO1YXlmCYML0vqT82g1ImV@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjnLLgNBKve3S7aZCSRB8VuKpM/p9X48y0HCyME2zvD8Eq94R
	9JeDAIFHKJ6f+mv5ruzn9Xn73iBHO2EojJKmVwMbl/oCUR7QRWoqqa72/oaLEz7ZrvxrLX+fMmW
	svn/LuXesFFm5bDi02l9w86Y2aw7LnWQ2S0ON33uSc7ca6MTS8Nmikg6YNMJV7gitHZQVlvh7
X-Gm-Gg: ATEYQzxJ9a5jtRLvwZyuSmZoj+x8G7zcYIivEISTaqmIbFJUpK1MXhbVqQgj6F9/DQb
	GkyiyntzeTa7J/0zZaUD+1g3sLqlVpItcO56SgszOmZkQStgDg7vOa/sbaSeKlih9alihFtrtrR
	o6Hv2RPTruPlqR7YKD50TDKoEhbmUGC2vdDvs1006iP8U9/o5zGLCXbLIpVomdyIHtkphFuEoft
	ztEn5wxeLtBPBNOZzO+OgtI1Gz9AoskVz7iMbNMaU/e8JDBAspH0hXL5au/Y9nYgxHWXgFAL20T
	rNuj9Sx6z5QvAHfxqWzoUFHSoGR69FCm28F8RuwWfvOwUJypuUecMCYJddlHogKqlG28Xal6Yiu
	nJ7f0JN/4utt5aQsh/uur5AfVU4BsChcc+KLhqmi+MkuN3gL/DfcKqth5oY+PwZh/ZzdBlcS6k+
	znDPQ=
X-Received: by 2002:a05:620a:40c3:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8cfc7a6d50cmr1190576485a.0.1774263016676;
        Mon, 23 Mar 2026 03:50:16 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8cfc7a6d50cmr1190573985a.0.1774263016137;
        Mon, 23 Mar 2026 03:50:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-669c2ffe59dsm1083674a12.15.2026.03.23.03.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:50:14 -0700 (PDT)
Message-ID: <a5ecc234-eebc-4800-b9e3-8cbf2ce8cd63@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:50:12 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c11ae9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TdatPKb3Q4b5MMZQtZgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: pylceRwUFNYjele9MkKlbaTh4vJW45S2
X-Proofpoint-GUID: pylceRwUFNYjele9MkKlbaTh4vJW45S2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX1f/0XaW/wTU9
 rpZGgLqr+bwutzt9O93YbarTNSADUNkn/hCXkpt6x0S7ZEB9A5lMSBHsDAJaRhO0tmZc/lJojcL
 ujHbuwzFC3FCmSqFtwJXVGdku+AOVQms5JW+fUWpE3ItG6yB4bnGHrand6+tHzs8gUXUup9xaua
 hBoOls4GuRp1SToNOaBUrSNf4vw+MJN69SaiaDqR/FOgGuMkR1k7gF5WSGMnqceRvcegCM8n2M5
 4FQLvyuHsSaSFoyMcJAkfmVre1yvbHcVtlcdpRvHIHkNJ/C46GEZwMvzgKRuGLBozUkoy3xmYuZ
 YSnCtHC8yy70Yw1qTFz6XM0AbdRraNlgGQ0xw3gY7KVp+o+vWgpeazDj8wTTrU1gq5m6GCw3Thc
 KgZuLTg+FGKICo24z3tDaVO1Ak1GFgWsFzSKHBxB2qvNtj55Y32hLkHe99RBEX+dTHkC3+Rtxjx
 ELkfuYw/fTjGL4L92YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083

On 3/22/26 5:08 PM, Abel Vesa wrote:
> Some coding style issues were raised during review but the devicetree
> was merged meanwhile. Address them here.
> 
> These changes are non-functional.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

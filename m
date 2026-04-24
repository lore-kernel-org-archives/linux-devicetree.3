Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0835A3BE
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024680; cv=none; b=HhR7wWjBLUPZW5Ukfo+8VN8XgggSOkTUe9OBthTjlg0L10ex4ZN4676Aqc1BiNEe9ry60iAketrDwvKiKU0HlzHao9LDL90UajmtoEilp+NRvFl3JjGepGNgCJtiPzdP8e8OQb6J9IKLKjKk+QxrBBgHy0xcwF4zhWgGOOfhsHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024680; c=relaxed/simple;
	bh=J16O8mbX3f9+o+eGZKWTF1OPBmq7iglLoR6+YzVSKUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dy4/Ag/6X/zQ/SQmHoO3Iv49wmwcRIXJtxQ25/Thf5QKEMHABnV6NQT37cCibBZK2KuFCMH3MV+rdVUZ6Ru4tzoycwMS3To8gm5MyHv+HcnAWxPvOsb24fvgpjrPzhybHwT4yYyG2fhB3OOrC98/DyCeRo36CEYJNwlj5BfSq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mp8vjZZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/XlAD5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mp8vjZZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/XlAD5u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5kUZk1959422
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=; b=Mp8vjZZnMucCsJqr
	XP/3Hg2eZa/6abuUttAMRfM9RLhaNqJLrwMWLmjTUztFK0KNgTbNjv4X5pWWDsud
	O7wqkIx3pt9lTHqVucLKydA1s4vBEgbCz4zm6eXovEOtSTtJZo11ZiYNAnvYmkQf
	zAjf1+8cQQUJZcxynF5j6BV0bNagnyHKh8Ek0h/5+B98qs7BDiQLxgAMR26n8Djh
	KKToFbWm1LwmMg2e+M4J3hBzcCsqtkN70DN9c37RNt3IhSA/QbbZX3C3o3KGz8M0
	xO/mLeOZW7cgWwrZXkZ8fNyiBdJ85RN1OldUpY+ba9T0jKkbaLNVfRmeJFqk8gR5
	mDKWzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrh392-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:57:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so150572885a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024678; x=1777629478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=;
        b=J/XlAD5urAnNH4G56RUEOEFMaHO2S/rXjKeqPlsOujqFzU12GHWgs8C3BxLILz036m
         cImKqYVyV3YKm4iIBz+YgS0T/hayPky/rpYo/1XJsQ3bkl/o3DQLWXKVu2mg6Y/nHPgg
         8iKp3XLpelErm5pGno8pxX2oAUZzvo2IADr5fr35adLLUy61sbKxzQuf73fg6zs8yYVa
         6KSqlRh9sWMyIqGb01CrgWVz+RxpjdW5UbGx4s+tzJ8fr5uavrmVsCZoJpN7O8sZ9W9k
         BdREHmZQoQqaeg7vpIYMsSb51BCApFj0IKFaPzKIMG3Zl2FhokwMGByDTe3DC3Nj3FXN
         5bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024678; x=1777629478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=;
        b=YirH6q2OKdTBhHxTiH3bcDQnf+P3BTSOabWVfQbuPJPttPs/RiLzc0uphdjIh/4icl
         Qw3gyXNISMVNvUte+bL4Y2+VieUr++tok0x+HOpc8z9AtPzIlpqNG4e74wWYeKSN3xoM
         BJZN877WFj35IxyLVRqPBMHZSbPwdyVuzFpEp+dHpHBZlWqye3n7uKmvY9IUxoDcEnig
         wn6g0R/TtxNPDdpnECC0anInZJn2OuwdHKJ6QiTkSvusEv4V9FdiUUP7aSMZN8Ob4sU2
         ROkKd3o83w8VYbJGZyepR+juSOR5V7P+tHsXr7jQJNfEGs1dN/69qwrB02eo1yQwcJNU
         6PBg==
X-Forwarded-Encrypted: i=1; AFNElJ+Pva8mzn65WjeCFaNFLSGnzPI3x/F3BXH5EI+baAcw4YdFGdZTIJZpUPqgHd9LebmE/f9p32TPYG90@vger.kernel.org
X-Gm-Message-State: AOJu0YxOcw37LSXzkCewE99bppKtWyttn2c629DppzIe7a56jMwq+OPk
	Ragq80KGbVS94lpFtWDfpiGFHn7DtV+qvNzyBBBiLIUmosWyPPZ8hPOKnXQlqkeQn47OfZokpOc
	9qRQNnylutG+vk3FORYmBHU9sZcxbEv8pC+AYwTbdg1oO9ayBXY0XB/JQ6ffgfpGZ
X-Gm-Gg: AeBDievSdE4+jSUWb5VMAKtPPYUUzu005JMbmm0DzELtv8OGrG+zSYJ/13kOfLXgpyA
	sHp5W3O/X/r2r9rrqFI2HD8oh0mfzHkxDBOLxisIES1JdjBppv54RaplEoGMCFUj41qMTBYP3NN
	kOo014B7qn5TCny1cy7ni2mbx2PQJnxJgMVPtr8FdSOBJRFaMuqWXcIV2m4Yf6JdeROtVEVzEnY
	NKQec8jqEyfwArVsGKkHOGafVcBhBOKCGHUu4edMHjvZTzcSbJTZGaGEq5lNhsXjrbov+ztYNzW
	+e9Yv5Ie5B/7dzagK9BfL+IVuv2Xc0o5sDogvXCMMMonb1oYfSpyoIDcN+UnIw9c5u+hIpzbSTR
	zP1+tPsKO4KxYEEOi5sbTyDDOAO6DZ0rX552HX+SteKf+uLQ9pq/mxlbp3qwSlm5u7Fp70C08cr
	dBP3Yjf7tmgcBLeQ==
X-Received: by 2002:a05:620a:4408:b0:8ee:91d6:cd34 with SMTP id af79cd13be357-8ee91d6d432mr1427460885a.3.1777024677654;
        Fri, 24 Apr 2026 02:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:91d6:cd34 with SMTP id af79cd13be357-8ee91d6d432mr1427458785a.3.1777024677271;
        Fri, 24 Apr 2026 02:57:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4861717a12.3.2026.04.24.02.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:57:56 -0700 (PDT)
Message-ID: <4ac1d868-8b78-43e1-8a3b-66526a5e7ab7@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:57:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8450: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX8usE3IECsS7P
 4ce2SD8kLisBdMFsN/Yu60SHoaNNZi7iHXrTWmU83Sw0dFRK9wyFdjKJasayvxWt4hh+z7fEZjA
 CWS2Lm7MEw31bjEQ+y4HkwQwV3LHiaikIy00Px1aHCUEA4rn1UW7esBtHzZq3uw63h2CbSUpWIo
 +k7VyV305Laidl2y/I0AcD9STFGEeX+0bWApEYA01XS8ELqB3y/rpxPfz6spVnYB5NBekP1GTx5
 lHV4U/SApcRWZzQMvtevcaiLkivRf28a4I5jvsapeI5mOYdv13sSe3dQFR3ubpWfNbQpQYIq0ly
 ry2SJ4QGblBL7pCFr8XwwjsBUu7A6169Bfp6OxIc9E3F3fMjMdxEJf9B+xhYMTNVG9pgrkGNKLg
 U1cp2rh08TVB5pJu7gg/CSU4NNbkxy4z1/scwflkxSAqeB1AViNLCvFrFE4WRUeYnaPcGs5elw0
 IFTZiGf6ska2y/HXWaA==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb3ea6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lsswLgpQNPgVMRHppxBkruqRL-KH5tOK
X-Proofpoint-GUID: lsswLgpQNPgVMRHppxBkruqRL-KH5tOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240093

On 4/24/26 11:07 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983A236E48E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 04:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400199; cv=none; b=tXkSy/KTY3QhcGqPW0CQJepHOi0n0/lAQvVIrR3Ig7lYPD7yyI+wtZMTQaP1O57cRHCZQwa3qBK6B3863SrU2QrVItlgvSekifn5XqDvNgxk/0bZa7plXW2YkXOQPvGbum7Km6H4IUIzgveWm5+C3NEd1jRfbjc4tCZ+MdSbkaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400199; c=relaxed/simple;
	bh=mlRumB9cj3I5e+lkTXBh8BkejiErVbUy+fnvn4ziiBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEizX9yLp64b0RjMQyg12IvgE9wahUy9dTlrbgc0JqoY6JGsRWDsb8hmjg7KBuS2PD7wMN58bargVFVdzPS/Gfk2MEE9e8qZy00f2UGq0AraI70qkRCQLqmzn1IniFHw/KS7+iok+f7OiAmjvOoLGVH7i5hMddfQKnk1eic/U0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaEG282g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUFWhOn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaEG282g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUFWhOn9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667495582498887
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 04:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=; b=RaEG282gCobcPoTv
	lXLDIX6vFMP/KmKGFQByZhfts6PobiV3iaE33+I15JI/xvYYRyXNvqqP+Upl4Dzs
	atcaT1PB1ZzqDQHOeq4rRAbYyY/+HrAB+z1LrD95r3r1AqiI5cRnR01O7TrC8Dz8
	fn/9JOZG6drPfbDp/+hpn/zJs9kMFYF/JsWaGrOopSufKMne3v4K2fGemvzKRlkH
	v/C8BcgtysaBAyrGqSiMRKpr4T1qb/8jcpYRXOSSUoash97rYsmKW+sTSyK0AN06
	N5enwb3omUlowcEImAC3u6O1hH2KrKya5S7Y7VfasiSrm8dMFTaofhEtMw50IWxD
	AxXOJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscmgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:56:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso7169835ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400195; x=1784004995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=;
        b=NUFWhOn9kcNA0cTYU1w840fjCxKGgtvFMYKX6xOeJ441EcCewXmFStCYs85HMmswUK
         MbwlVfeuxxg3X7NKFjy7rLdflHJpUZ06YEr8ereb8LetftH6ihvcAnaBhGbrIDG56GKD
         /nsH1sULo8WIIu8gxc2u2ws1600NoH1VkJ0zlHho83sXtNFe4L5wG0jJ7dN7F8EJoDy+
         2uoWidodN+A78KDgwhYpDDPlBt/SI/yIpzfN1lf2aUGuCwiqXfuRpN35lE6agw2m6FSA
         dBhIIzuU7aEGgUIMQbNNgVQpfZUGtum366+HRkK1b2RwzqgTYKJJ8QYdf2ElrXxgdn5u
         EkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400195; x=1784004995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=;
        b=LnNNbxk+OiYN8+eBZI5RoD+9MgTE3Vvxb77guK6+IoZay6TWKaNAjedk/X8rdQ+M/s
         qc0TepOz6tL778PREGZWlp8elJMsHWKjTSc/wjZ9Z+apjOLG4x29tAeqhfYBLL1RyjLn
         eBDynNRbPiUvKBRFFo9yHtS+ZcvAdqo5z7USZqsFexPeB3F/IiJt/U1Wr42XlIWZpsmy
         IX/tW1ulVZ6lPVQv/y2bpoDa5up8DB700BlV7uBHSDrma2NAF7gpaBEjh3/GA80DD0yL
         0WMw5UIcqaK1Uwe+pkKfy7yY1qyn/jjwRWD6zXLoVePXkc6oGny7HVOA4Bb7faFxrG3L
         xB9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoLxMDQ2Hw5zvI0rOwBKy3kOEXPplh1Xijoy+ox/x3b4VzcPTX610zS1Af5G8fdoW6//RrsUgT6X/sB@vger.kernel.org
X-Gm-Message-State: AOJu0YyCiIPsNavBLmXUnANNzErB7Ud1hjRgZ44bgch4rftwWKqEtatw
	vYRS+0f1YPNsPMVQprAD+A8mbBUkDzM+0jGZJRZpaERWBhm42whS5Cz2o5NNtqjW7WRObsqsrys
	qkHhDdkaPf+12qXmNSfwVFtqgopolqj6fAyUDBmcizp/nfABirIlaGm3S1+wWDqxu
X-Gm-Gg: AfdE7clfN3lUXFOzI3YRVy2Sl524RkxwFDDtX1h3Xsj8XWS/LNPKmvVOnS00xkHM5qn
	EKwOY/u1pKBtqxCMlHFF/yDWnlkTmGPKkebYXqENVl1kBm+E5oH9cYwyApmXaAXpoURCiD2AnrX
	jNkZMj1jIZYSO65lZIANxUaIPTHNFNbWJOp+W4Ht6uyzT/EflrlxVN59fxP0XjJgdGpzJWK8+tS
	BwEPjbVTwvdkWpJdnGR/gWQzfrk+FJDX9TmHKS3BDDKd0Mv1ahQs5wwiDCwgLT3Mt9VetsA9Bk7
	Z4G9pJoNPKkjLsLBNi0JcCSN8h4P1XDbUSad15oCbrqyJXwJHs3A2bkm21Yv2S4EbHpBuH82Elj
	hgC/kZvGX94GJQaadvPxnyStacIZNh4NZMoGUIyQ=
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr39933215ad.2.1783400195622;
        Mon, 06 Jul 2026 21:56:35 -0700 (PDT)
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr39932945ad.2.1783400195167;
        Mon, 06 Jul 2026 21:56:35 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm4515115ad.77.2026.07.06.21.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:34 -0700 (PDT)
Message-ID: <ca6149f9-d6a2-4dd5-972b-12999c7243c3@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
 <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ql5RH06uByZ9f-H5Vq_Ycejiz5IRIuMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX9ca3Z3iCyjwo
 2YR19ur+nOrt+GqQmAnmkYodaOTMja+KEt4uWr8m7eeMkpMdAugprO1hkdUZZmgv/ELrNYvYQXC
 DgjKRsZMW+ZULSOzHgTh1Vi8qWCqHGbLRG4LQaU8fVhI9fwJNAQtmq0PVHUBAcdbkJwKyzsWe0z
 tMYv2X1Ur0Npd0VY+XlH1Ks39xRTKDtT1M67CWhHQszYMF4/VW84gAKCiN1IAD4S9GWeYFQMDoW
 570J6SO8VQXxucZaF15yFTXpwWJoNc9qP+ePU+GKApwGBza1yulDh2KMxbteKTrFasCegF84Q+1
 Z8TrjuFlgwoxNiwcH84xo3U3eMJdxa5fbl9LcAkoOIc8lIZs3Lkkz4nKiH9AdN18qYmE8gS0pgS
 dh+QO2NhaEQ0LdzYnPISwOeSMWh1gNwWHzUxaSD1lU9JSOT9Kix3UEuz0Xc8i3vxsIC9T7sFI9+
 Rs+HRgI8KEbQg8nMprQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX3xh8/kyK+Ou0
 P97+muWAdd0tOokEnNK49X+vKGwA2ivyPDZX5SXMvB+CvPYND6aRWvtnkt2zzNp2jk5OuArLZzE
 pAXvEtiOXnCVWF3q2V49xJ4DFnUkz3Q=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c8704 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kwMOkDkW8xLcxF6SdFYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ql5RH06uByZ9f-H5Vq_Ycejiz5IRIuMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070043



On 6/24/2026 8:12 AM, Shawn Guo wrote:
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> This include shouldn't be needed.


Yes, I will remove this in the next patch.

-- 
Thanks,
Taniya Das


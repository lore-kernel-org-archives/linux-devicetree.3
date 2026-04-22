Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2523C141A
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850622; cv=none; b=BLiUzW9CB/ZZRr7O6wpCu3IRnEn+FOp/PpmgTW9z1aod5vYW5t98tUAZqxub6ygfBq1j+vU+K1KFoA0Bc3fMhGaU2XiDeBxT7ybe22OOic8f78HIAF04PStNPJ1CnIrNHbW6IqK23VcEVOdVgNsNDSiPpAJjO6bWxoth7zqiiUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850622; c=relaxed/simple;
	bh=UbBhHaJO6heGVNOk8TuHjs23y+8tZ1bBbmcd1rAsPkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLuLcODNxt0s4UU7SWJ4BVDEJEUMMUHpEWq0hI01WV57rhpAtmhh47SsgmiN4B4thvZ0kcgGEaPrXm25wKj2mB3DRZT8kpjcijf914lrDDRrAzfMI1d7k7pevO4ELkQ+9NC+5fCXicr1HHq309FZcakCA2owylhWKq4zQXgtLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPdlqKbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdDKlmCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPdlqKbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdDKlmCC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M51hRW3083125
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejxmbc3pCj/J84KsedCUn+567n5vQQYG8MwogqE8brM=; b=nPdlqKbJ/fOSPDAr
	DIn0NMDa1GFZW77RzzK954tsTqcVQqWHteMGbMHN+dSjB6OgowoVEE91k+m4WMrt
	4Kf8buR+w8JtKpGDj5jKKJtra+hIsS1y731ktQYAL8yso18Jwj4Nup0iO41DFrAC
	cI7VM8Z3sjeNWFnYZ3R5TDl0tQlzMZpNByR7NDOAF9JMM5PtYpIYiJIIwym7ao3t
	y4nwZnQZ+8KJX8OKbv5aMW03KGtDSjt3f2CKJX8vuTimfwMRVdTVVDY1UmQ4/pxa
	SNC3u9T/tdp/phhtS2/lReGAuRe0sNQe+OB8affq/wKMSYKeOhICE/Wvi2LUntSf
	TcfEXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmjvre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:37:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ee23ab9f14so35545485a.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850619; x=1777455419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejxmbc3pCj/J84KsedCUn+567n5vQQYG8MwogqE8brM=;
        b=KdDKlmCC+FQjXMrxPEsVrENl2RFWQLT0fuRCAmHXvCi4l5SC7USPVSTwcBJk0wuzOE
         duMpeTXGSfIf08w+A+UM3jRLQtzMeatQmKw0yZkjWNKcg7+W+zW8lwqBJnb50yVnkCHv
         djpVo/HQWtIVZzV76KAxyT8CAmLCToqprSgcS/pMj/llUQW0DpVZP+RSLHEr9nT2lT9F
         Gib8HLhbn8vO8SnCugLzdnVCN7lOJN0YlPWkXM9ZvqpaCbfC0HLPKnXIGwEjLGCouSUy
         rzW1Pp6UW0O4hMjFLkqdlXzndJSczjclz6lHRIUs00EQFwff5y5j7lL/kerATNmhjLBA
         MnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850619; x=1777455419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejxmbc3pCj/J84KsedCUn+567n5vQQYG8MwogqE8brM=;
        b=MLRFjc0j5e8g30y1SFrVsaxgCMz+BjlFkIQwV3+a9VmJER/85DY7hX6CiLpifrlWdU
         YdBO1fD56HWwpHc8s/MdauuhtIT74tE+I9z0OXWpFKlpQPQ8fph0ZUGZnBlET7fUWm0d
         /JvBt9v5MQCY1rz+dCLJV0jRJiCzv1pWsU09AR9aZBZkG/GPecEWBGY3Lp+8mV4AM3lZ
         wFSU2UXm9Hy8zwAVv5h79lZVLquX/4NDAaqR3zzVz3J3NvtFfgQghXEEfZFW9Snfkgrz
         PWN0+TPS338Zb4Y5WfsPC/aQvIMmF+/YoX4AiadQOVuNC1aV/UGgWWz+M8yVOGStAXFU
         grJw==
X-Forwarded-Encrypted: i=1; AFNElJ+5nB0p/cXqXFNl/94quPg8OGwceGrvT3GtcMqcYQN9T297gjiJ4Z7AadhrLW7almfls1+fG2ITcOIY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1lPuqUmnxNIFtqFaXDojZ1+/MuLtEAz/W9Hv1iFA7G1Ddgbp
	FUWZxAqK1V42uvfb/r32Ke55EIjvxLCBe/5tR8LLOzz/Ih7H/pUEz/ZmVXTrOy8QnYLeNcKs/4x
	zR/aqSVlCzQs4TWkfqt7QQgPyuwmgELTsN6UbHJEprRdU9SvL+yzJq9qUAKhx5KGu
X-Gm-Gg: AeBDieuN0TIAoiLobXiLJbJbz9jIT720yVkxxmJ5S9csymyzvKAJMUoLHDNw3fNOWY5
	INTNWh76gxn482/jI9qzcPg4vSzKGcomnoNbHN4lbxNAtUsTFzMPwCvxgoPzx/dkC/kGA53Kf3A
	yB//eJSi+Zkk8+Jlc/Uhl4ih1jFMebkSPuEqKVtLCH2hJyuFrTEml2W8xySJym7vwYwzc3Z4OBk
	uhEOvYK0d0wHbuCfbi/5k6YqclkR5Ep3HTi6OlnYeMyJKOmWfffZoYcWaI4R2fBkEqsnDND/XoQ
	0tU58pfg69a5okEwNYwRloqR2RdNcQA1NuvnH6NAM+C6vOL5H+XA6R5f3xDFqPewJKlSVZvQtrP
	k0502O0YJkqqbknEl3FYSAY6w6VB6in0QeV7EVTfJgOPH2OX9WDpG83ueb6zgrreWbYFgTsHMOj
	84TJMVK329OKi0jw==
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr844035785a.7.1776850619096;
        Wed, 22 Apr 2026 02:36:59 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr844033685a.7.1776850618562;
        Wed, 22 Apr 2026 02:36:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5de13sm3245083a12.26.2026.04.22.02.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:36:56 -0700 (PDT)
Message-ID: <d66d3163-202e-46a4-8e7e-c61eec4122b7@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:36:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b6uT05JppYCQT9JufzI3aQnxXW01KX0l
X-Proofpoint-ORIG-GUID: b6uT05JppYCQT9JufzI3aQnxXW01KX0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MSBTYWx0ZWRfXwmDmL7gXtV7H
 2hsjcDkZ+sg4JLfCrdyQmeLvnhT6Cd8t6SQ3YVuWM0WaeyTGLOdoj0PeIdaPOsO7IDgmZ1BiyQS
 hejzOVkKngUGaoww0in/lLBL56bdC8JfupNOv203JewVQQ1YcysIwlhLou/7BsJXSX49ia1f0sF
 qH7mmDbYEWofdfeqzNxbmS86m3HMLF6us4rBVr6RsWUR8N2sKgpDtkf9GNQebdJ5meOsn1lQybb
 ZeumRETWGlzW+nohZ/wk6qLyDo1PaNz2mrrFztfCTK1C3OS+iFi78ZEz8iT79rMP4VcnerY64sG
 xcRitzxfQSUYcB6UdHZAj4BkhHL4tRxQcO/wVDdKDT3kleUO1X3kCxkSAz7jq4QOWdEe4tL1nZX
 wXwrRZCnQPa/bxa/wMkSQvHgV0Wv32ItEjuYuOV/tPGwsX4AiaB9TpMhamvqTP3OH6SkqlC/UK6
 ivWxWYJk1PUd3QTmd1Q==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e896bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OVYcTxqJx27R85M3AYkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220091

On 4/19/26 12:15 PM, Mahadevan P wrote:
> The existing DP PHY PLL and AUX configuration for the Glymur platform
> does not fully follow the Hardware Programming Guide requirements for
> DP over Type-C, which results in DP link bring-up failures.
> 
> Update the DP PHY programming sequence and PLL-related register
> settings to align with the latest HPG recommendations. With this
> change, DP link training completes successfully on Glymur-based
> platforms.
> 
> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>

The tag chain is invalid as-is.
Should this patch have "Author: Ritesh Kumar"?

Konrad


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740FE4A68AA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820263; cv=none; b=GrAefhAH0TWjzrhb+6o3pHWzO6URAccyzeXXCR7I27Py4OlXGBXM3vVSQwbdhUnq1ce0FFwHe2tPFqQ9CM/YlMUuacX5I9ZKXOgQmiilT0FrvL29dhDnxY8iyGaQtdtumD5YwXEE5ddwn9jL5sQwnqFWE8h0GXsJG4sVyVzuusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820263; c=relaxed/simple;
	bh=b4y/kM9nQQeiicS4RTPuO/cyCI6SZtxImdln7AP0eZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k49gq5P2UGtJkI96yaQqmfiohAiwCdDiOt4+YHd8yrhCxt8U7VMtmHgD/67DGr4eY6NH42Pe5gtHOpYxJgPM2xvbakZ8w4EMen5EUP6o0yqNM30pItl1nD2nuBBkQ+wrgYwIOLFY+nQWiLc+pycngAqhHDHvvMghhrjVNyGXndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgnKMsfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDdIE5Bw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgnKMsfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDdIE5Bw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFfBVp1291156
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=; b=LgnKMsfRmMGGmS8G
	ROI0RLnP4v8Z8mPlbD1mgqYJewbFWdzNTuPkCXc16FYH2HH7LBLrJ8ygTVE38SPS
	9wp+tfTiGrZAURct1c/AJmPl1j9LPova8wtloEdj71qJV7kGpD1Gc8XdA9IcVkl1
	/kvxltAGkD3oPMXmqP8RCVPaKtiexVrFvy+QqvC6cm1kMQm3B/LrG/lpgyjVMMV4
	2iOK6R3jDXW5iI3TUxcRhrOOlVqWw/fPDM42PS6azVoXCakAA9+1JA1Tt107ngR/
	8nLVsNqbMuHSXjlM28sZR6W6njyAGW+Y5yJCCn3UWtHNrxl41MzzGgLN7Qi2oiCI
	m9oc1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsgh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso22495485a.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820261; x=1792425061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=dDdIE5Bw5KCYNCII2fqcPoiD2m9yHgRgmMzLijVd3fWPDE5gCWwWy6L1VJwFJ9GnoT
         2lzosVxG0hRzK8SGFvl6uPRvncrE7wwSf676LEk+Op3utkmTYMtEMwMan/ndqDVk2J75
         2iBHIPsUpTGD45c020BabrH1J9lnQXOKguy/ijs8qv3DTBxSSD1V+uuR+T3p/z1F1Yi0
         nyiz+ggjy9SExQC3cnHxueMF5DP4vgs2jCd6T5RFT4ngfvbm4Xsi+LyTphzqSWWtEAXS
         4Ke9rogvn3DMUGEUBu6UwVG4QAzNPEHxHAB55a5ygEiqkuMG/cMGAg1ayH0xEXrAkqLw
         y3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820261; x=1792425061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=yqHZycg3nJ4RDDekhD4Ck/7tIRGkKXU8bQ0eKl1zJ57xYQS9YFkTeY4Gz8sET5SpLA
         0roBVbr+MXhIjwb2jyUY6SzktWAnxw0e1mf0iQFoGX29WVRMCvTiZd81QRZO9vhdw1/w
         iUFWbZeXX1OJ0wT6C1Bmnxogc6wrf5wz0spdqCLCmq537dbiqrrw+MLbRowDE9Vwe5C4
         s9Ru+beeECG1Y90AetpSHaW3r3vVrs9awEuO3y6C4M1ItMI68JmMoBUkg7arcWO83lOS
         uooCr4ZC3SxCRHDUhOO/T9alBbwX9PtivlPwVPDHp/k2WPe7R4bfIQUhuVJrz6sofTkp
         S9tw==
X-Forwarded-Encrypted: i=1; AKwUvBx4i/5qACrf9qVNS9IDTzpA5stxlsKAFnI+9YWNxRqA9xeJuuvfDViE+FwEjNc6uzD6DOs+ax60c5OA@vger.kernel.org
X-Gm-Message-State: AFq9FYKGB/9V+pGyqdht1wPPYaUnaIVkY2h3LCVBtMVIedGRu0Vp7Mdz
	sJeL7Dz+97/LV9Rrao9Xj6FtXj3N/5XG6tP8EZQiuC7wW+MpWboLHknzYqpVoW6KYcCzAHw7P+v
	dNvISfAFf36eaGYBTNtRpkitCLJOYN1kKaQV9jqsTNgQXDwBp0SLK70D7Cr1hJcIdC9cnS3TU
X-Gm-Gg: AYBFou1tDJ1BxN9hd0p5L0OSGtWVNTV6UfhZ4AAQPabv44lYypGuJUC0kROchVusGh8
	UPQv7AjNgsXGUcwXSCeLQG/dIv/NSOdTNl90EPRfAPRif9rwwyu2Ia2rWTGTECfAuJGfZDZyemM
	9qtcs9Dk9g/el5DwndN2mrxo9R5sG6lmThyg1NbLZ6ZiJVC98c/Fd7dj8TKeXXUFVcFl4MLB3Cl
	MIX5Lmu0CK0/NhFy8GvyJH7+vwfNDf24AfqwXygNsl/6x8/1mPZyj2m0dyGJ0Q5UMLEBBrXBLcz
	yy5igHLQAZbc6m2uLlS61NBOhhhJbnnapTI7vRQf0FVrqZEVSVYqFe8kjvkS3kAvlHNEjZlbm++
	DbqIxnyDdXJLILS7+JGZisw==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1783961085a.6.1791820260779;
        Mon, 12 Oct 2026 08:51:00 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1783956085a.6.1791820260306;
        Mon, 12 Oct 2026 08:51:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:50:59 -0700 (PDT)
Message-ID: <92707388-73e5-4843-bf7d-b43fa5a59bba@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/38] arm: dts: qcom: msm8660: Align closing array
 bracket
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rc4pmjEZkITiFEQgk6fKdRyfjnhbhyRQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX/nAIbLL1GRXr
 q/EPJ5piMeXKzw0tKmTdWsZRd8qwRRtRy7/0dTB00VxCBql559ilR+l8XOgA9U8azM01J3m4alh
 /KsmGmy3V2dGrWAgVU9538bImvboJDg=
X-Proofpoint-ORIG-GUID: Rc4pmjEZkITiFEQgk6fKdRyfjnhbhyRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX9KhLbGb8j8Ni
 5UWbVjEK2nX75wkt3q/dpJnDIXx0mtwoMTuiOoSGsNjgZvgjeYyjBki0q2/V2V8GgHXHzQNddAk
 YymSXK2TYLqa/9wHsJDaRLd3YrQXkVHeyUSAcq7SK70Bg9HfPvkeDcmz3IXyt9R1ONmRvOxrT9O
 A3hla8N9qPuWkybGY/CcsLd3mhzp0QXuJBcMrGlMlTQ2shpAfdJxy/H9nOLkscDcthXvj2PGIjf
 FvgmNv145nbNCnvkGgW4hJlprR4FtO4UiEEg3ftUIw0SbWQKgvq62Ne2ubY5Exeo09s4LsBsMIv
 8vgq/aK0ZI+S84TLtM4yWllARfIT56RYFDd7D+aESF4JhAQ74+FmITUk2BibyD3ZzomdYnBTTT/
 ud7yoR5voAyerpFWkCtdqgCvvQQ0+0LG3aZgpH0y93YF4ZyzxABnWXWjLQt4cX/d2n13XZcUGQk
 3G1U8GO26SSXnLnynEw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd01e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=C61bhbeWJC_1YFl37gcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing angle bracket of an array should be indented like property name.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D644242910
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048753; cv=none; b=eLnx6q++S52mCa9mn+yqNXCuhqgle44Clj9EhTDNE6O6rZcmxi0vP097bJscJok8jzEcWf1uxWGPuwy+OQhLj+0lE1/lRUiGgAkrDiRZnDW803fPLpEfbwEy23KPJJoZXIT8+sYv5yVQXxTDZ170B4x8XnTm/0mstMeC56uIx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048753; c=relaxed/simple;
	bh=1r0XTOMQGU2xqD/jHwP1HAytUoDOeZBgYrOUJrEQslg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxiIH2ejdGea4UoN7Y5vMDCmSssXIWz6QvI4Bb967zxB5lojihG0OHYe19PVF/4AHR82RrXSuGMxtGY/SALolrY48Yjuv5Ng8Ge3yPG1AFpljDghTzmsyhiTIZXhcfzF/SDSKy9xmYgI6df+sJ8SXsG6Stl6NJkaKodigs7lXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbIZUxXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qedll7Xj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbIZUxXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qedll7Xj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9u8en1514110
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=; b=bbIZUxXQXnDMy3YS
	Bzz6sEk/pcPyBTN7y4Rfw9c8hMEq6WRdDCGi7O/fp3HPRViXBiMHQO90P9I8LQVl
	Y6TzFl00AzomyRLThMNjfhuz6PuPO4CtlX1MhN+mOcZ1WCccDqEcioK3lq/s1RPc
	GeUy2KLMHI5X/iU41RwpQx+daNKJvkj0xNgJTGwpCntrXeKQ5shRf4B6cABn2DdL
	+AyC1+NOSgh8YUDMYhM29ZoRIFUO1HSbv10stFHZiTcjMpYc0EkZEVlMCpFHTrBa
	Xu3raFDD1GFjlCT253Kyo0gRmIONdoeJ/Fe+HWQ3IrrMlT1Hk8h2H3kr3+PjR8dO
	JKjubQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm582xpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:32:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c5dfb67b7so4080735a91.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048751; x=1782653551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=;
        b=Qedll7XjAt5VxInBr+JEWf0YMNslsv+KwP6U+iXxBH2nhr2OGIwWwDex8Y7NTUqSaN
         dxtFqGS+stQAzf6BGO0hikmrvQiGWPZF9VhBRVwrr9AcnGlKNC4ghF90nEwHhmIUhPoP
         3kLO3PiZa/WTZ37tzUa+jotix3/S9zkxs0IpV9f4TlEtnBRcZeTJ97hC2wVq2w1dITUS
         zP4k/itZ0lPjnxHccHa+7GsD4KHHfLe0b8bwW4AfX157UFboPkSOJkrxaFdVArr/BqQx
         w7YfzReIg3ZfZPobxplzvJEJHV/UH7bj9Wdu4/SqNkon6f7XTWqPSWuP9wxO/mQv+6L1
         5KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048751; x=1782653551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=;
        b=oeQmONK3DuoJOtGyMCavRSYu8RccI47XKv0ETRuz6px2PdjI2K3Oldbm54IXLR5LVB
         rfStxOJO9ZerTUd9qFVyNFg36toZKiPnwwfLUqVkxK4UhRRzHwGAm/hg7X8Aa/Nx2Eky
         GNhI6Kt6NH+pRTb53+dlmo+v+B0Xz4G9YCPAv1Ja1B81VNoWXX+DGfkPM6kLFtHwWwtk
         e1NL2+FyioZBD49rloKM/xnsnqHos3VSzPOWknU7J+N8dZjhUfU/N8G61A0j9AaXZj2p
         ora9od2rHjy8NzYdDbjMYliZQbEU8o89oQSxcXZ0fs72foN6r2ZbWqO3xZtGs1qJ6oAf
         +jLg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0LCk2aK0v4//hhh2Gqv/EPi6VDknuuXaX73U7e0VMqpU7+bkbrnruKtii3nldqnkHMrX6egVUyAdI@vger.kernel.org
X-Gm-Message-State: AOJu0YwBj2Ee5DgwGRKpJbCdjT+d7P2IT/l6OCypaiBUo29anH+D6NDm
	e1XxlUyosImK/kErDAT8k/lGUh7JAo22JkrLbtwOgKtpHj+nFkTepz7ypDbcmcxmWn99jJLfpDY
	GhWsRH+/6WzPNB+8zWxalwdITtIKpRtS1Riv72+5mq9BFdRL51WVNqu2KqQABNr3i
X-Gm-Gg: AfdE7cl8NsNQvtrJYpJhnLEl52lxs5G/QvqTPhwBro9ZqVQmr/x0C7NBjwjP+Odo7QN
	FbJWo8MjuaR4VMHaY3fL6+LjFS1z2XHWYKCU4N0nNybvMfrVFUpRVDWuoWdCNSUjM1TtzhYQuAK
	sSsO0S22Ql9i8FpRiHXdAZ/TOhNL5wTzxq6TH0NFQFqMHXXY69DdF/Gj88wQE9UAq+4nhGgI3KF
	skUf07QIduMeLhJMoB2zNHBMv8rdvWNsJol1/W10jsm1tLnzJg2OQBAuxsN3y3Qhsa1ETXvz37J
	R5IamswyGqJC2hetUcTrt9gT5qOIVADhlY138FaMkjrPOoPbToJmMa8iNs8LFzFQu93erRu+zUU
	Lz7Gv7kOGIX4IZaPkxHPpDz6vDpmraxgILLfJabuP
X-Received: by 2002:a17:90b:2d8f:b0:37c:c39c:c636 with SMTP id 98e67ed59e1d1-37d15e8df93mr11895185a91.18.1782048751316;
        Sun, 21 Jun 2026 06:32:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8f:b0:37c:c39c:c636 with SMTP id 98e67ed59e1d1-37d15e8df93mr11895160a91.18.1782048750919;
        Sun, 21 Jun 2026 06:32:30 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1536a6ffsm7658954a91.4.2026.06.21.06.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:32:30 -0700 (PDT)
Message-ID: <20c9f6d4-0c94-4ef9-b931-7c835131da3c@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:02:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
 <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dVC3HIetrMtWxS0VBeBhlKUBRKtYzAT6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX5NiPeX5gqNUY
 6UgICIVRy2OMSGP5HVgQRWfWToGVOrVgpLX4NVPzTeQQbFKfBGI5HR9uHUpol/Be/Ed/6xj/CvS
 xYzOL6INI1S1wxJD8vWkf0hMFNOr4W4=
X-Proofpoint-GUID: dVC3HIetrMtWxS0VBeBhlKUBRKtYzAT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX+NA1PuW3OOzO
 QIJsb9mwjxhV54c0hHCRgRToamvreFahK7MP8bCBu0Z0l5sHYl3O6mvuG+84fIlUhmPzYeMg1eb
 Vx52JPye/w1A8tjkvyOHA7jieIkHSwyFazI6MwWEM+krXrWIEVOats711nJXEQiyFKcD8W/nE1F
 ZX2AJVZaZYyH4p3PuQnejZrChvcmZpVYZcNQ7GQZmqrlzeS7Hrh1xVQcheS6L33T6tY2Uk8YWt3
 CkY2qRr70hfou9YOdtWGGl0ATZBrevjIr1hKy3uP1BxkxHBo1NKOxfkqGLfbj7JGjmFbXmHFTEa
 Gj0eMgH+3Gps3cwPYy+G/7ysS362/16U+pgojctMP1YHoTC7vUe9e/HWXDZROQwVtaAVFQJi58Q
 cMs2oBgB57N84fjsMJxf/umgAIg/K+2xeVb2M8N13JK32TPuCTm4KFZxZY/x9b8jhd7IXlxjlOS
 Ub5IiWE4+3U4riduHWw==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a37e7ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uBvOtI65r_ZeAi5v0UAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137



On 10-06-2026 07:30 pm, Konrad Dybcio wrote:
> On 6/4/26 7:26 AM, Imran Shaik wrote:
>> The RCG's clk src has to be parked at XO while disabling as per the
>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> This RCG isn't marked as "safe" downstream, was it overlooked there
> too?
> 

Apologies for the late reply.

In Shikra downstream it is marked as "safe" properly, but in Agatti 
seems it is overlooked.

> In any case, this needs a Fixes tag
> 

Sure, will add the Fixes tag in the next series.

Thanks,
Imran

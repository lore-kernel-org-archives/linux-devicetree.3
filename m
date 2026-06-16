Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3CC3C9896
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590758; cv=none; b=HZg/5v5A2UeagaFzi2gLcxUykN47WInEsa85XmmEjj+3ERb4sdDhvBvp8FQvIpsI91W5n6ZIydsFqSS6CICwrTdA1U8AnLMEOTUqmLCJk2V2TXtXh+znWQmRM9Mv9mOO5k5+Er+x7hbqL9LNn2cYUEfA5M+tV6YtJqlQUDys3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590758; c=relaxed/simple;
	bh=HySDzHfG5PXiuMyvybA0VhJPAM36NZzNkcvZL+8XOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vo0KNG9FrKEZrDY0Fp3JEhxXxI2+LMw2fyC8DQb26p8G/afzyzD8YKXtdVDqrFrnTx/GM5soi5exr2WuTI5j1Sg9+yzbRmCjX7t3D/eU6cootBhXE63plvNlUxnTKqogl7Vq5awIjNFdFP+2oRyw76YyDd9ECiMjqWzYU2t+Vco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8oixFR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/CD7hba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8oixFR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/CD7hba"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64THP2316396
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=; b=I8oixFR09bldnOjt
	4euoRF/q0kDmI6mTv/GJphoomU1Qndvb/0ysGYqEJ1a9H15TKdzt7xV7D9B2vKQM
	ka25efwQ+6oxLFPyoaDPPc3Rotfz6ObgF3BAwYLTBUJXgkW1ukMmxcJbU192BbJS
	lWzw+WTxEqLtfDGJMbSWAOU0nhsZoKPMkS+odltNpergTgbTizH46+AW5ZL0OeoH
	wIappONLaHVIdvO0SA34XYBbLHyqJJw9O+Pdi1cwiwDww33Sj/l6oJvYFyJR3Snj
	Y2tdStQ0xOvyTNPWNFCgUYz4wnzuALjpGvnWPFjxDIBbNDxW7i7Vu8qxnPhfbDtq
	LOmeiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydd5sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:19:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423970cb30so2903948b3a.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781590756; x=1782195556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=;
        b=Q/CD7hbaRqZuMkn6dmZgS7iKPPXPaVOas62ib5fWALCLYW/uAWNdCLkIB/4Vt6hCsb
         W0JDQBFGexxasS+KglYFs0JV5t1yposcAKxr2eJQU+2ZMRAOSyovhDYtpJDvxevJ7M+B
         pQggoClZBkElcBR062Zy7/qWyRQTaXhC/0E7KTuZLNsS0sdQYWF+bKtdfiNh87l7WsRv
         Smwv47HeThi5O/b/WlZ/juQKhJbvarUsC330PmNekn6u3QFtVEPNepFHJ1+6kiby0gac
         mM023WBe/zPY/ONZGT6GLOsXAeE1QpVPdrEvDw+R+Z0lYdRGaBLqWNy4mTabdVSzaFo+
         yC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590756; x=1782195556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=;
        b=LCdpL6eAP0WR+XWL6grA//BfgIz0dSIsuVWi75chc9vhj1DCA3giJcrQkIoFNkXbBq
         65iUH1ms8XfuyDyK7j79RZwKqKh3k3gBamGZTB7Y8WwFIa3S2ukok77+QgbedAART4XU
         G8MJ+qeCewBVitE9ODEwsTnsXbkOB7hTJXz5Bst5vnh2CxxCrLY28z7tKw527zaSf2yr
         9B/6ssWQca4J1t+UPhHvDGdYxO48F0WM27VTgaUxSf4rUeYQcSVglI8cPCudhQwbvla5
         OPoy9wyrsavYtFgwlFVIt2u/xcGHDJfblBzqbuXv6Bz7IzjD3ZSa6HooeF4UUiWLUHKH
         x4wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ArqcAB/GizGpWE0ue8FcakR4UFsz6M/tFmuo8uveFVnLeaZLmRmO/O653k28ZYCLaofcyWpnLFg3m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt5JaHOJ3Ou4U4N71RtiL7iGpANxhxgFHLw5XEYQUV18vE4UeG
	aSE9T7nN3I60t5TOTdtr9mj/gvN7taSoWtDXr9VomuZ5GDCJeNEs2Fp0s8o9cmLvr7bpJKU0s/z
	lezo7HDLuMrQMtYmIfJvMxePOr9jtlsEZyZotfMG8s8ZeSNgTK5UZloERysNcaRjR
X-Gm-Gg: Acq92OGt3ZD7Fz2ZzR8K1hMKxpBR8uEltoID3c92An1SyRJJUszgXSQAmNLKWG8r7Rl
	mqbUirNIqSl6bQQV31SjQ9P7SE2d+B3LIu1iaeIaOg49OrOop/QDihYPxLnh1WYXA00X+eqXoqE
	QDND6+4BvwIY/aPWf29wsYBU4kFdwLmD7t4iEY8Pv+xZr6pU9sIt6DuWEc4v25AmPcSjHvLmxJC
	uqQgfiXfx4ShlqLza6yBvwTi4sViAzA3FDez2Z39lrifrmXOCA9LE7FdUBvDrdIdcyUYqm9XrG0
	U6W+M+N8Bic/QBA+rVsrWKXPoaX0RkkJBNnz3TKwRJXtyvAFjHUPPqlTbLV3nryE9T3dc4CtADe
	oJfOOdOdMNoflom6KzgxUyh4P/zdqiFuuV9yU0h3Qj8vw/5b/Ng==
X-Received: by 2002:a05:6a00:2991:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-844e1a7970cmr15081631b3a.35.1781590756330;
        Mon, 15 Jun 2026 23:19:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2991:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-844e1a7970cmr15081615b3a.35.1781590755919;
        Mon, 15 Jun 2026 23:19:15 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acca7ecsm12187454b3a.13.2026.06.15.23.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:19:15 -0700 (PDT)
Message-ID: <9b04b4a2-f3e1-407b-9458-1d6c061429ba@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:49:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
 <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
 <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AymoiIYD0xwAwBT_UHaV0bNnVbIN-ghQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1OSBTYWx0ZWRfX47wEuF4y4ffu
 cv2eQiR3fAVOuxxHLfUu062TwEm21GEInjeA62QgA04ohI0MxmKITLhQQYYiulVvVNLTWriIykX
 9Tb+OaMoVZYgsdVSbUOWjeE/M6egYVU=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30eae4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Qv26el8sPAtkdzQ7tU4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: AymoiIYD0xwAwBT_UHaV0bNnVbIN-ghQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1OSBTYWx0ZWRfX/aDQys0f5RQD
 PLjPMAbGk3b5HNFlOIuQ6mrnqRH4QFGwi1VQDWOO46yT9yyByeHMvEwJcZKtKS09j8NmEre6Kvl
 NfrVZKhu4hBJvKEFPUITlSaSser2YQYvgnLqNXLbjrp61PP9vv+I34Ms7aLh4U2eIgdoVXwoFPh
 vPDJpNNwM2c05Z2DE/0sJjz+AeFWp9X0gI1SZvPFF7qSGMAfeVBKu+P2p4coV0JUgYGn/mSjOss
 FJB3tDj5ZX+s59gl5X13Khh+JT5eUpvsAOgKH0gB7iOG7vwOYsZfZdQGZlEuzQjrSCCYOBwi9SS
 /09xi2WauRSevoeJwNPZkP4Nzq2z6bVEUuNjrvaNNzOqRds70WhgUHfow6AYt+SAk+ZBl3WMxMX
 x7oywIBAPeN0iNnUTudQ/ZnW+1bpiq0mhaaKGl580cwMlF4REqJVjFhL5Jq+ZW7Pxhz96TqqaWC
 gixxyjiqIAnk8Yv0CoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160059



On 6/11/2026 5:31 PM, Konrad Dybcio wrote:
>>> If registered as normal branch clocks, they may be gated, which
>>> breaks access to the EVA clock controller during clock controller probe.
>> At least for the gcc_eva_ahb_clk I'd expect platforms actually reference that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk it's fine as it follows other XO clocks, but please add it to the commit message.
> +1
> 


I will update in the next patch.

-- 
Thanks,
Taniya Das


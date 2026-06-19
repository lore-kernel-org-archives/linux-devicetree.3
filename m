Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D7731F9A4
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879185; cv=none; b=RHmYVVuY0ElNPgJOnHSs6OQdR5EyjTVqXolJ3ndJvLPcVa7lq65VONy0gs0BzGDrREezsRxtD/9+oCAB66Na2SvVgALUOriIZbFcCEYTZnKtwub2AyUtejGk8jdeDzlWoTz1LCcDemOrKF+Q5DhMfsUCrB3S5ct6WaNOMvR2v80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879185; c=relaxed/simple;
	bh=egm6cUnjrRwhkBM2NOmjdLhTnnx59v551kQr0aIjwNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8O1IMn9RiZzlyb4hfcJRsgOtaGiYoFstJmhTsAUD6VNFKspeYlc8ElB4zZlmqJ9cennPTifQ/oRWJla5f8qLLZW6LLc2G57kenPeWaW8whVg9SFSGfkfUJDMtuFKEpdC71wAVbP9zEdDCGz7eDds/Lld8Fs3DqlnraDxJdcWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFfiNbII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3wm9oOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFfiNbII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3wm9oOw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JEERr1970428
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwcgIm8EDE/CcWVJa59n/Ut1MbMx3b1rb55Z5ug4nTk=; b=UFfiNbII9rEySUc0
	nSUAAB837eoTdL9VywEX47cPcFmvMcpjY5S0hfOophXaCUPvdbUHMRa3y99cn9gf
	lWqY7T3JpjwmhiHTRfzsx3Dt5pWCpE+GwPlb534vQi/fUa7ap/VUSRHm4dyB/T/T
	A5XU9gfYof0hBbvVNerkjpp3MjFsJTdiqd5ZowN82OX3dqd2UT845L8PONrEn3WZ
	Ju7JO7jrGKWzO8MzT1rZICX8wRCv6WLPhbODAlJgIr8WNUi6NNZ/t6YKZXDwU8rz
	Cap2cRPtsiFdEomLTC9gZhXtL8gnKJXs4j4pr90xCLAd5QUcSJS6beV7XNuCM+y2
	PrbYdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22c8w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:26:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915827fb1a3so37835185a.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781879183; x=1782483983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwcgIm8EDE/CcWVJa59n/Ut1MbMx3b1rb55Z5ug4nTk=;
        b=D3wm9oOw2NSRwkkvm8GsEhcSo0fneBswdLbvn/AE6XPF7q4oyvaDQal+y+ajAsE0DK
         RpFin41/n7We9SAgr+rJo/V3tQlpejMZSO3DfRgM1cui6z6spytSUEZqCWUsRAty7iVn
         sf3uVaBq7Z1wx64KjeLGDsJHndJgYwLmgdn89qSJyBQkvV896d1o009rquPSmQfPYW9f
         1VYqKFTZY7UJBXdOjDfF155bcWJ7advCVEQW9A8FwYP2KWj1vVNgY/1nTAXJPAFCmf9b
         9un+Wh1EW9Su5+/ZCPZh9wXR/eci3/zi6QKIz6CeBRmLJyZzZSMCxUaHnsBf22T3RzdN
         q7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781879183; x=1782483983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwcgIm8EDE/CcWVJa59n/Ut1MbMx3b1rb55Z5ug4nTk=;
        b=smIjBBrrfnBXmmKXzup+DjyVo8KrXFcxS/zqYivEBDLowfDqORZahvR6mkifazTZ75
         oHfF4+/ZXJRVB/StXMqo6Tv9+kDLx8Kqy4iT1Ya/OJ9ZNC9rI9ixH6glqtzXUv4yyMGP
         huh1XMKR6J1WFQ806hY7AtHMRVNG619Yn548OZkw5zeFCW07wXOZDe8a/zeJrS0UYMph
         tAYZWtvp28h3ooaUILIbAj2/apjntrwnofgjuwHmD5TVcl3lVkafOBh4YHXheeectUZ+
         A+L9nHKZT59L9bTeKX0N68vAgGWb04J5SvM3HtRS9ub/bXGAROr3q70XTJl3FDRVe5m0
         MMxg==
X-Forwarded-Encrypted: i=1; AFNElJ+ylFN2HdItFcMa5AlyuEm1Nrmj7lxCoHscuZAT35JGcr8jZsH9lJ1j7My4KoxgFDaWFtGmYQ0VfGjV@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQDNzu/9u7bWnmnL3qg5JM19nyvFGvn+ulU26zWBYO4xmbmqO
	unajym1P8Y0WtNY95jpR4tlgt2+B/xnIx3TtXUwgfau05jtgDYsYqJSqMERpOnkmir8rpV4w4Fb
	8m/t/8m6YOZcJoZAyH7h/p2MAMdef9kj0gUloXc06ZQ/s6hisD+umN50O89Q35mqN
X-Gm-Gg: AfdE7cmg1y5GIioNZ3TvTmWmellkVrLvt/Wk/pBRumU4QFh1Ix3V5Ef9R2FCv5mjF1S
	FboL6ibXsvascxdKJ4Mbb+IWBKQ+ym1eLN3WYRJRhxQOFrgiA9xIjpM0lCrIHRBezafcZ3HmvCQ
	VGjTvEy8ctf1FeGh3/jsBd+fFdqWB2wPBXbtJZDg3HT7fb/dnLEjEW+J4XlQHc6J5mIgR5iGzVX
	DEuw3nMAcyHd4YAxte1kO1SRP49dC3Dx2uOAaqsQxkJqZl7oMtqkz+Ljd3Ftm9DN/It+lay5eU1
	h7ZBTyuqW4nykmWfjCsBfbTikBJn//+3hVh2dUtYGABMAhVwb6yvaFrEvDB7SCdsDZtBKAwGQj2
	92+DajPXwyTTm2mSP+FD0cLxH+aYNp4fRq8s=
X-Received: by 2002:a05:620a:43aa:b0:915:86a4:667b with SMTP id af79cd13be357-9208d2fd9ecmr289401385a.6.1781879182763;
        Fri, 19 Jun 2026 07:26:22 -0700 (PDT)
X-Received: by 2002:a05:620a:43aa:b0:915:86a4:667b with SMTP id af79cd13be357-9208d2fd9ecmr289397885a.6.1781879182203;
        Fri, 19 Jun 2026 07:26:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc75eb7sm939137a12.2.2026.06.19.07.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:26:20 -0700 (PDT)
Message-ID: <789ca358-35e5-4280-b759-c50bef0419a9@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 16:26:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
 <20260617-ipq9650_refgen-v4-3-c505ea6c6661@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-3-c505ea6c6661@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a35518f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TzvEKcyx141kUWjotGMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eDQR4JjU6l37uAvEPggYpbrZ1vwLfpFa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEzNiBTYWx0ZWRfX98rTt47dI9wH
 LE8PzUe1Kl5pVnwY2H+kumyK2st3O354vNO5psWSzsOYefJ/bLZ9FDQssNqERxexqH1ZfHqCqzx
 vdjaoEdv+jlCrFQHqxr3pcOdYcAETtg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEzNiBTYWx0ZWRfX63A0X07r6J45
 0TtGi/QLJMx3D/xXNTVDg8eyYGyKRfzSnr0cXQ7ii1wbx4Qp2GzlqT+ZBG55kXfY3Dtz9iaaM7A
 FlbRgIKnFphcQE8S36G35iRlRiNL8w0iL/eogPV/DeLPX5FuLqU6wSK/T7dQZo1WiSK/N7S6HCI
 KqQKdBvznPIVvLdIdcD3oovOB8FEzCQJo+BQL6rBVp7wfFIjr+n0FzvI9lsBFp6Ft/EQ7KG7lx+
 iBatwiUjCQTMxyVEP4fp4jidtrdacnrSIirOe89IwI80cMxrAz4DV8OUOJprH9Yz0rHSyaAfdL4
 9L/5/9xlteb+mVO/wBuhSzDKN+LlsW8ZP0qA5OsGARy6S2jPGoFelGviMO6XqWcZkfPbsxYLrH+
 SQRY7H7vbNlXzDKzIZppv5m+HB+JA5ghAf/3K/xLrmgqCFFZXciXXvD6cCsmDzbBlLrwgHPfiky
 ZNi/pycskAZrln/q+3w==
X-Proofpoint-ORIG-GUID: eDQR4JjU6l37uAvEPggYpbrZ1vwLfpFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190136

On 6/17/26 7:38 PM, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> Also, add the get_status() callback to report the regulator status to
> the userspace.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

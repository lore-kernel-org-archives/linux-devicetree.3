Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E99331A4C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617789; cv=none; b=YYuf3XMSZ6qjaTiLRz1YUfFvXVeCMcFSrF8hbnu7jLQbr8/Lg4YTy/kr6cUNWMLeq2bJvdFq+a/TalESPmyjVOBDpCejAyh/L7TAJ1GHuv5zV05No/XurkySu+I56KPg05CIysVLJRRVP2BgOkm27NEqzWQko5le1GMg4553RYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617789; c=relaxed/simple;
	bh=U3m38ZnTBCLXT1fk4054kddb06qI29b3fAIMoIUX3d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hho+zodNCGEwETGEMOR5Gm/Qhd+Wlc2a312wnLSSIDWn9eEjxjlb7A8l2dsyxbAaCcgM/pdITWEyOXbczRqkLzKZtTCdQvdkZtGF6bdV6ek5pB4vUXkWeeKcwNoczLsNPFJ8ce2AUORdVpt3mHjcGd9basa4CqCY+Gcsy7jvDqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqRSs0nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAtX7+mb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqRSs0nZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAtX7+mb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACIX23411101
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3HUXZFhXhPH0V+bMNq3sZ3bDJ3F1Q9yHOmR8odBe/w=; b=TqRSs0nZsH80tsJn
	NKApBFk28/sUrKSZbnFoaEoR1QMpvTj3ZJU70oj+Z6bgjU/KdbCJORo28HyEE+8r
	jRLthPsXJEAyq3thQeOJ6nRMHlg8FgFiHXt9kdXB3nx8+dnS5yR/f6p7XIDEJHas
	JTnDI/D/xiRsYc6hXJ/GQJbrF5sDu174uxbwqJYs2Oqi6IP3FkcsreONsj8WfDTg
	qsr+AXbmPJJVeYXA0uXGUTEBNtnyP0P6sh2QXSWPyOQAPvfTwzVdAp2zxDG2J/T5
	FEPY14YrY1GQERhD1yGOtw6lBY6XwcQoEN4Xsp8hC/ltGbtGoriKGrmWCtUxmDCI
	oKwKcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09ga4xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:49:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9160006de85so121885685a.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617786; x=1782222586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3HUXZFhXhPH0V+bMNq3sZ3bDJ3F1Q9yHOmR8odBe/w=;
        b=QAtX7+mbWtobvMFm8eXVy2agxntuwiFqEIUV5Q/NH4jGKlsHy8PKBY0loEqX1omUIM
         MhnWbrvFvlCs0xHBSExXdCBEs/GfwW/Lm9Lo0cC8x9PLVdOugobKTQct1MWx9DajcuIq
         rTLwZEmCroum0e79+YnSOuqjQRP5SN+uhyVrsObc9SJlNjw53PirBozxRpTVAYOiTFYa
         KQfBluoLEkv8kRz6uF34VJd5FWdymWdosu9dtSkIMTF4fUA95HjT+fU6pa2yBo4r0jtW
         ASiA9WqcO+ySGhI9M26rI5uYjA0OndHAyiiPsahCzXYbUcFqqn/wRizjcB/uw+ijQ7kK
         YtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617786; x=1782222586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3HUXZFhXhPH0V+bMNq3sZ3bDJ3F1Q9yHOmR8odBe/w=;
        b=qdbOBmEv1+oGLw0RRnnJ0eYBVzm1MxBNVCPcRE0SvVvqQcPU4yKL3CjWSrvJ6V8kU9
         N2dlmyQiGOw+uUykqLVBzUF5TToaA1Zob10QLLn4xyP8NUe0HO4QvBbjIag5RCfTtBIr
         Q5cvGkagfOmUmbjKDuQ1WmC85en2wWRb3kEvi88YTSbr7Jd1mwKKcpEB3cY7bRoKc91C
         bmH6dUJ0puCDWEJqDZCkyu8a/3DdO2pLu6j1Y0AxbX5OHLqieQiYSSvx/dNVasSuSRUg
         boCASvcBkhcc6KeOrd4PYPoF/sEGjJdQQufsobkHgudcdelzvY9vcD3hL+E9A47RV+D5
         OWTA==
X-Forwarded-Encrypted: i=1; AFNElJ8L3bgvdyaYqXIzcTu1cBIbPtjMKESZ7nRKjwO/BnlxmFlSF6/A4o1oSOkqb3KEWCZNbxtj5K4WVcvr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxqlvrp4071Of9ux/PJ2gH3dMqHO9MAj5RtJp6JiVbWZMa5A7z
	DBGTm0hIq7NxMD7vFNG1MbHGail719K83eis8tU9LIFQAgX4OSxTYj64vYBu4kfahjTgDgtUskT
	FLrbIjbjY2deRvx7E4j3M4gfmZBu7KFJN2g+CKANZFlsmSbNeh9FUoHdEBL771vTlvmREoaAf
X-Gm-Gg: Acq92OG6vDwSSF/sP5E+V2BTfhNA5fC4zAQ72rJnEgi52YoOpe7gai4/nTOCGB3+ZH8
	03kUS3hIqn0+urM82mgTDZt61AFjoRlWrdPwmLL5Edo8DE1Zlc7smEyZkZt/AuoHVhyeUDz1RSK
	cgSpQe1oju/VuSUuu2uiEi9iQHZvCMnA1JpLjryUVirrXmapFIn6JjewwWDSWgLCotBTFjlnyMd
	++L/WXFfC1vwKmDjwrUunf6WuvKP7s8k8n7JZdecZSHmFslY7oz6/L9uaMSqTEAYmB1tpBdgIdk
	pwGbu9z+gHFdfNxuz8JeOPRlrYrL4TExJa7up8+YH+XN178mOTALxijtkKjSImM5L79lybuBKm3
	bc+JqBPZB7jZoFz5o5g7VmBYsI4c3Bv0zRbRlXQu6aNjzoA==
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1623498485a.3.1781617786303;
        Tue, 16 Jun 2026 06:49:46 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1623493285a.3.1781617785451;
        Tue, 16 Jun 2026 06:49:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22544sm645993466b.14.2026.06.16.06.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:49:44 -0700 (PDT)
Message-ID: <24c7d8b3-9eb3-4c18-9c47-c3316ce30957@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:49:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX8EzXMZ+oGV92
 PPu1UiX1v/ELP+/iZ1PaLqhHW2fUd96EyUqDq80UQvlFLh9KN5pb4QL5hOPpZ9MmYObqd8HzJVO
 9QQssG41QuJwgcUbc7yhru3uDZcMfBP2jp7msrZS+3KUJ+mmRbcAcXYElHACx+zQKAblLi5XI0V
 2EXX/Iw7smKIPT1q3u0c+Dq/6moAeyiVc6OqBO1fI+HZ1YbWmldAWUUAmgoWbG0lyfaJcnydBk/
 WXqh3xZHXjHMstiRgI5ppdt5IlwjGhXG9npiOzci1mrewwaVkOQHmt31804HW99ignsYlRKArpB
 Vo36dGPpkJoT58gxozQM86qdT12WFoly2oodRbh4PJNb7INbAuuWVgWC9LiKlurBdKNvY8JUZNB
 8/0IoclZuJ6wARjXiz8oIaIJ4QI+4haDSEbEPlmljbYVbIlBPF++fOrQEmJHZ5ex6CKv4058jJq
 23kJc/3w+DxBEq+JLMw==
X-Proofpoint-ORIG-GUID: cEBIMzlWPP8ocgTHYWT_P1AG1bfSLtrJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX1jOIzGpYfA4U
 UysF6+PKHyR1Cm6IxwvviuNz6BDySe1zCqoPyeG0Ru2G+xhHIPM3054hlrTk4yGEg/dSc7m5hYl
 BEEzDXXhpx2sJoD7IUgVEBVXqmOTA1I=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a31547a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cEBIMzlWPP8ocgTHYWT_P1AG1bfSLtrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140

On 4/27/26 8:26 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for talos-evk-som platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

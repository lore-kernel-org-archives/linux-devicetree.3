Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F548D874
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158112; cv=none; b=FEN2z3B1E4Oeim1/vKdbXmNLr5iHabqWxyLTcOvrG7jHYIaz4ArAcdYKWt4V48Gt4BPNc8GNVnSxlsf9TRZqCzJJoEotQhqRQiIGFWSijeG41BBVXNLN3M5eL7zYIAqgKTEs+LCWDigXphuz9OieUsaT75xzdAC+hCKKL9W6XIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158112; c=relaxed/simple;
	bh=QlH75jraYA/wHmkNHrnrgxH66NC84yTqhMid+3Ga8So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qElBJnCWlxm7BciFZ7UjR5nOTTri+HFybSxiXqc4D/cdL9g/vrMJE9ypusOJo9IQqRWmwbyO5iCGRdnaruJfq4NTC8NlpXfTbQgRrYrNyt3gEgOrNIL8iUims0of4aW6mykJraEelituJFuulWpR4OkaDxWKIBJnuxIJRr3LJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/tqZR3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LB0JCbLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/tqZR3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LB0JCbLG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbXOU566978
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=; b=Q/tqZR3zPGNbvJBo
	DeyKqFT1b520bcDqrgyk2O+KHjX9Q+iULEMpilKH9rHdex1m8Dzn/ngU10Y4+twJ
	6hcbomygNFJJQM7b/jEZE2o6RfVFH3F1h6Bv9t0A5I17iPY5BStqbQwbq9kzBBpo
	FuI1vNRdOJRvMafXRFRhB37A/zWSQm4PbBs0in8OgcXXZxMDHKcjfhh3nfL1TdxX
	92sTVNQZC2Q5eMq/hWYCOUH+9ZEMKkdkthxd0jSuUIWlC3AGjJFihbgm27REBTZA
	82O29mElEyy741WWTuOsI57etO1BEwHb9dvPZPoMw3HZtX6NNyhovE8nnmIyzWfW
	VIv2HA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa12n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso3355111cf.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158109; x=1787762909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=;
        b=LB0JCbLGaO94gW07ofmX952puI5fBmfbG/pvjxUDF1vVVizcp+zaobHE/M2h8qU3SV
         Zie/UZJmzn37uZUTKpbFeDOjycYzOejaNEGbc0W8czwFw9PZLcaW3fuq9sXaUD/w9WUT
         khF9AYiagTW2HCE8nL9P38ktV+GtsRNSvMOvBQFokbodz2jz+q74FIa8i5N7xNtiMVRL
         JjGCo244i2ISr5ilbiK8pxjGRUK4N0jGuVZgkh7Gz1jA+AaOUILm4nygZCTOAG/Iqz1n
         LK16xmpk1qPGXsEht4J9lfW2hvuK2rTl8z7b+W22rI9vWcOrL9oXQVa1zZcLObnTbgH9
         r47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158109; x=1787762909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=;
        b=jkkzHSaEUu7Q1sZBJwuc/oD+P3G5gasoTwxMBBIjKXgrH3bLHRyGUY6AFhpQnVhTxy
         2LHRGIAMQ6AES78uaXNsmmR9C6KHdGTz4LsdBBHtSKbHL2EWdH+ya2zIAlG+V3Ll48XV
         tycq3vYW3EQW6+swo9NXl+GQw0LfgYTKzKyg5ywq1Ul+xBwkwx4FJMoHEDjDWeW0LVeU
         ekolFesslCQ9cm1tFRJhhADdybltZaDxi43yEU2DJ0cDC83cuhP0Z69JhIokBTDP5zxi
         KxiktyTaPKkbaoEeeZ0gkd5XIOawLNoSRUa+IAAYcTJpbbtGvtMnfJlqlLfoaMSivEzI
         TfeA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy6KE7ryjbHe9we4A5ll9Izn3R5wn8Pjszo3uB0/42kKJc4F4VFHrljl/ix6wkZ+sMX9W37UveJXjw@vger.kernel.org
X-Gm-Message-State: AOJu0YzX4zwL628n1VYnjOrTNQd7MwK+234FEDicGdppOfACQXtgKx5x
	vxA/0HX1LWgg9aN41gHIllvAA1QZ2EG1T8r715juFTnUpvw7UZGLmMVEhG/gNVuCdhTPchx6JGY
	A77wAVQ0HoA7/+3BrH/zRlr8KN4bm6NG3MH6nSsiVmQnJtLRFzShWfopPGQJjkJwe
X-Gm-Gg: AR+sD1233GrY4MaIjzsym+zihIC+PySH0oCgpL+5dS+7Z8bvaai0ac5vZQ5WoeVLLaN
	0HJ8sRBNJMRqcoIfEPep+VyjY5uS5FbwCPkiZ7cIUlUUi4vBFgKZBLPMmnlGVlQ1OtNwkhIvEV5
	rCDHEypFR/BORvbW+dilk5m94/gjWWQLFtiQmLeqN5Ag3TAGBLlUYWHwF3ETJTBM1UWYCJCbsCP
	GAFl1AT+4w92r13XIkcpAkn2zbxsW0N5j6fW7/E321JVP2sVWGD4Qa2VXblSxmF6MRj1YIcXIXh
	kQTJu/F1nlU7TojX28Sfk49sFkwKNLS8F9lZyXHMa2sF3i7i+0gSJJUP68XVk8R/llPcY4YOUS7
	qUbE8daPiaBaDYlkV/OeNqo5m
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr42220371cf.2.1787158108990;
        Wed, 19 Aug 2026 09:48:28 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr42219791cf.2.1787158108473;
        Wed, 19 Aug 2026 09:48:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:26 -0700 (PDT)
Message-ID: <6eb07d01-c28a-4da3-8d1d-d950369dfdac@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85de5e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: OJqDpw4TmzPqVLsDpyCu5ef6ROuqFBRR
X-Proofpoint-ORIG-GUID: OJqDpw4TmzPqVLsDpyCu5ef6ROuqFBRR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX+uiyZPTSwuWE
 uaz1ecMCrPuObTdZQys2ZmsR6dcDzl4+HuQC74qXU/P/9IZWN499adIcjwVOzoKUoZhnJhbO3u/
 R44bovZWFRvYdqmjvHHbiwOfXnov32o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX1TnZZ8xUL6Z1
 0QssOs6J2Cu+gnrI53KbtwGKPvjSg8Wlesbg0rUQjrxhRHwZn3rNwro2E99GGuh7UfOCVj+ds/s
 tJTatDs5knLnM1/uo/B27ws45FyjiTJwxlZ/yz735dF2fvHc1yqSpKsB3+B6Zlagm6IBHR2sT/F
 jAFWLjV8h3Y0bP7nT82GtzgEDqK1UJPy6GkVsq1awYFGaCkS1xnn9hs762IlTu4ulzCM/YaaGpe
 jzqExUYUlPIYKPmCULv6Vp5Mz2VIPGA745LCsARBPXIZLHgTCCnSy7yF1lVtfd64krNzL7O5vE2
 4TR9RBB5WqEiLNAHrq5TRFM3oEjkZuHWgIBvKBpgmusZQDETAvRp12h6o/SeHwpnN1wg8uJEs5Q
 Kpn9+JUcZAkjPXq7csr8Nhum50urUJryvGA9hC4aUoL5FlnidksMdQd6zeUuH7sxJgcQh7o79tu
 CCnsqH0sMViHAkdM5kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

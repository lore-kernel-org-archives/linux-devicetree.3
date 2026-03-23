Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5F3876C6
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259783; cv=none; b=pkHc1/8tXqaVjv/ZlCBEErS5f3cwbSeDRP0hXUHOTlr6i7/JeOgB3j7Lx+P/+p3Vmvhhga0Zo7F/vOSSFOxunK5OdM6lcfFJI6DTZGobG+AKkrREX1vOcxXaBrGv8scwQwn4fbjy6H30sPB+BYJZ4jifudxVKrbs7kS5BhOjvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259783; c=relaxed/simple;
	bh=oYni9gC47PxHkEwCBV+JakQe0K5hugq6gJXxrC0XwSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5A116PLhiF2OYWYFtBfty9xctFwYw97AWmppoc27cWzDrDpUYmxDPuDnlfIgPNBxmNVn29+xCqVZ+ylOU5scJIhFJ+NO2WvrIUij/YE1fIyTEYIkTLL+r7drx+Bg1heQP3zRRL+U9jda43iritpleXW8dJQm+6XKS+CHuwKbW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YX9t1XUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP692iWY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YX9t1XUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP692iWY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tUGT1627050
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=; b=YX9t1XUJhm0n4Mxb
	G3XgkgHzTVjxIg1TRbOaiK6Vzup6u5FwedFP6vuMuM/7VFHIo5BW3JglpmFfb1jF
	opKCpyQMsIPs5WW3+yCXU1dD/AmWqC+reIZiEU3ApECnHtgDKWit5WXrtF35E+fW
	ZSvLn0Vp2Pt36GV40xsccfM7gvlg3uWu5sh5ZVPdf5RIzJTrYOU0XSavPtSzg7m6
	GuvYKw0c7cnhKqwalanAPwQOYAZJ/dIb3YpaScOh55AyekpPtybgDOM6KesF2j2C
	31b1D0bxbgAc8wfZ9caM2DNDpXrHTu2TPTmtIoBH3WZt+T8ClBWq0AtxObfT4Yy0
	59i7cA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0e87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50943e69b08so33763071cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259780; x=1774864580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=;
        b=KP692iWYQMXhJq1KmcAXmxPmy9P1gszN6npJ6VX/7qEQ1oZP5OXJMGdXD3ccZ5KPz8
         5d4Q6ZWlMaC/BmJIT6Ixi+hoQ64YbQBgU2qreTT2uRfqhC138Nk1nOWc/Z2NmtUM4oK6
         Gy/QC/yF762OLNq6EK8EESI7CRBgB/NXpYJmpEMQYtUBcn0SNBEE6qAe+1URrOVwwLxo
         WIPeDh98UholpTKG1aAE92hPXs+ATiYU4Ux6mhYf3x4lMrGxs2rRZA5Z28e3wA4v2RwG
         vhsSrq0zu8/DhPFIIa+urkG/B0Pbo38erq4m78Fl+8WjLOVKZqfDOy06V1XyS45Gob1O
         0TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259780; x=1774864580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=;
        b=edUD+pQf1pSOawuvfLtNiB2KDKg1PjCEE8XOZrmOoMHT9q2BsLEJ4n68gBbBSpY7Hc
         CLTHRk4FLmX2XHRrg4lPQ3zLM9n2j8JbbcUfklNZ5bE9v8TvW/iATYrnU8NQYkrrTF+V
         G6s093qIct7ggRvJsuVkGYYbwq9uvMLzUPZfgDEfdsy3Wa+/Fbr/zTvjAn9R844hWD+w
         B7UKyRysb1D8CIo4PrVCxcKhk6cbyh0OzVYn6NBVKDTtGRKhPf4U0vaYhd1EZOEfxXIg
         EEAF5tGVUikq7nGUijZ4dMf+moY113sGOl2bxMn5wZIqGTL2xq4uCqfxy5j6ALhuw5I6
         12qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlAXqydh+jsb+B4ToG5gqCiZG1+raK70o8L8DPYpFBKapYvryx/nnY53y9MZL+avTfmDyOkFLVHbfj@vger.kernel.org
X-Gm-Message-State: AOJu0YzfujJNvnUljCVbFvGOlH3IBWz6h+ecmbLrPMcB8PnRKt8L25Ir
	rzmvyFSLFdnNVHlmmkOm/6mSXpameknEr4bjpWGXyomC1HaUuYTlYJnfowtCFTwhRtkgLOOd1y+
	OOK0B4fIuF7x6iB+detbykQAMtpxD5mQnLbC9/536A+Hdo/LOe2nv8vZiNfabc/fF
X-Gm-Gg: ATEYQzx5FJlRZACNh0h3YtZ4o/LEqe8a0TfKLa1NC3bHrsB1s2YHnYIan8iyHwitJ20
	Z9y2QcnUlxDEbCnJ1RwAqU8tTprLnceNoJkEsF117GbXu9VTcLS4znU9YxHIUVr40T+KryznxTM
	mWuXhzIj82yMe7HZW8zazgZmZhfU5I5mR32LnXa/CPnNgMzGcX6X/ZS+odcy2MruUTJR0/LLdR8
	l3a7s4E/2VSxdkWXjlRT9lxDRUL06NGHVWMVWVflEyo2KgECWsKiRiPLxFYxV6Lr3pjYwT7KaLt
	GrFlSJzGHroWM7eWDU6DkU7YLOVM3yG18lWXgH/jXLup06suDPe3iMeNGf2ixlrf2zWyoY3TtZC
	y773nCOS72v4vfAT1EH+IgrqQ9aZEbn4b8g5CnoBe9LhW3f3fLg9isqlde0Sqb+PDDwozFji3Os
	2F8As=
X-Received: by 2002:ac8:424d:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-50b52870762mr43885351cf.6.1774259780176;
        Mon, 23 Mar 2026 02:56:20 -0700 (PDT)
X-Received: by 2002:ac8:424d:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-50b52870762mr43885241cf.6.1774259779795;
        Mon, 23 Mar 2026 02:56:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192dbfsm2448274e87.1.2026.03.23.02.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:17 -0700 (PDT)
Message-ID: <182a6226-bb23-4ad6-b454-4913ab461264@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:56:15 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c10e45 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=JQuORDkdG-Em1TT35vkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QIuSdkhyEm_EFrqu64rOeffNEBoGxm5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX1PEd0j0GToJs
 QnjmKRk9nkqGd9dyG+gDsJDIL5BCTMD53gj4pZomZQCQ3IfzKrMJWwMsnk7wiIOWb1uonciv/rI
 LjJnwVgIYd6Nu6YS4Ts6hG7cVUouTPvd4yoriSoGE7ZBU4FuxPu7DQ+xdJQt4UFienUQ1nVaCxk
 2ax3CcROGmGZctF1d8nRIuURweoQlDm+FPKy7qiWjaL0SJJ8ypPxXkiHIHq11fuyh+TXeeMQdKx
 I/YRGJjju3gu2R/vXZUtWBOL9fM1iU8PpYNHrHfsokwrk0nARAISPyEpvbFsxASMu15SGjGm/ic
 7ML8mPpKXVWkvCBtpdzvOaxud4AVhCFDJBgFN9IWASxODchYHODXXIJEUVW+NrFhPv/vxcInjhU
 Q996YCDT2xWE1WCifQDKo8EVJ9PYZk9k6FhUlhCJVc5XjO8RQkr6Kv7e2rCrp/SNG3bPwbUzkMM
 33PYsFEaFhHeYIbszVQ==
X-Proofpoint-ORIG-GUID: QIuSdkhyEm_EFrqu64rOeffNEBoGxm5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230076

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Sets a higher rate than the default for good responsiveness of
> touchscreen.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I assume this is in line with downstream (i.e. you're not trying to make
the panel IC work too hard?)

Konrad

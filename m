Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C042883B
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607175; cv=none; b=lUZUV/ejeSWka9TzjQvYBe4IYkNp1iwA2W2714dLec69/zp7GEtZOJCFQhuItdRw4/MzS163ezB+9hrg+yh/ZqOm0zo322HtEPP/N78gS6LRkHeB4Bu1L1moJhriT34qp6yWvcM78zZvFablYBVaTYGp5mOnu/lMVla02RaojYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607175; c=relaxed/simple;
	bh=+CbG4B3JxMY7uH+JI1+n6IET9IrEjXhSBpbN9epGDU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=af2FOIw0TVfCWEiZ+dLZ263nX1/L+xQpCAoCj8M49c5xIqaKea00NAw+IZZDNxoz7fOEllqokAdxAMXG7naiQTiyARCxv7jUYRjRdFEWhQVP5ok56kA1hLCIjxxE7M0j1aRAidnOxzbIPbtqCEkPtjAlNvnYM11ppWmqpZat/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY4WjJaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jd9bsmAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UY4WjJaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jd9bsmAu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Slc2846268
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aV5EdZ6TwwmY6Bn8F8Ucvgg5WDTVmvSF7rfydXeVao=; b=UY4WjJaW/kcm1PZe
	M9KprQPUoy5O1Ew/r1yFOTB6Znom1XRSz1f3onWETtUCyFUw1clgx9RowUir9gh+
	tfPxun1hmRt9W/DLL4Exz5jeFvnGeBMU0LFgZQmw8AvN89m1TjKOe7xto0JM8gJg
	NMGOwxtF/qsAo+ig4o+P60vu+WBIExElcC7Rf/TW7T/Qi31K+RFHTsgh27hZvYhb
	PjEec9zmKKOjcoKCv8b6t0gnVNWlppZg5NigWbhsQX65xVYeoEHc3wTiJV7xGqoy
	YETHykrGWU2zRVtzyj3HrJFHYxpdJO4Rsbj6QwR8H6mPMLVRnKaivbzqk4fRHL8p
	x5Fnpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8k9vj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:52:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so98023585a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607173; x=1782211973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aV5EdZ6TwwmY6Bn8F8Ucvgg5WDTVmvSF7rfydXeVao=;
        b=jd9bsmAui8SLEWr9BBOmjKgnhvDs6tOo0QTW4awXELnp0nF0+8ARJM5ctz8Cm/YmLh
         xWC8hfbNinuEjyWpstQNvEfXQfTCQeFJLZTU5Epx8NXARMPUX0WBSxCM082DMoevK6HH
         HpzSZdTXTx67UC3VzD9I9uirH0SgFBO+sVDn8CPQpuPUcRx/czw6yeVctcRVdxfx2GCA
         WXbTYMpsEhtcJbxPEa4NuZFZPBrYWE+GidvWdNULypBb69VRKNLDlGZQXzDQ9VdAbxtz
         t+qHp4e7NyKpMyxktRznJ5O+x1NtMDcYgx08f6BaBKQYZf1zAcfFpUTdzOFejOWOeuU6
         k6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607173; x=1782211973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aV5EdZ6TwwmY6Bn8F8Ucvgg5WDTVmvSF7rfydXeVao=;
        b=mFrFOAMjNf9j9UtKHEsmSRVaOv9nQ8jAbFr6gk9iRgd+Bn2ty1quRGoFOLEOtHt4y0
         3z4M4IgqSJ+dXYSLWFFHhb803wm7tYKHcxCMoS0+JtaV2qiYcgiwexEFA5ZQZDX+wVU8
         Ickp3QcFqNfuSXZPk/JEPNwZiL7+5e3DCDWhqp35bH1O0ZcX7ceM18wOd9mq5MvPT3YL
         9rvWa3vfYgOYv1oiBTGr4ZFWWxQR3ku8oypeWbluBSxMuAmMqUNvV0qixiQi7JSdMaK5
         fg28ZO/NzMg5Q7WjvU4Lyp6lz+iHeBEt6XlYT8CH7gp7yh73dw4mihk4HrBbKUL7BS/d
         XCNw==
X-Forwarded-Encrypted: i=1; AFNElJ8JRZkL0OcK5xFVQWDZumMNv1tAkUr0keG6eRnbQQotzCivghcUe7pyo7rrGIEMt5HPvpMUS5RJHpzy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9pgqG58TZTuWFyBKa/EvDarj1Z6NG+wdLmc2Knskdur2GolS
	VaLpIz0xhOFYUfGgOQXPbshNbtYvijDWbrQXrMNYpg7Y8V4i70t1vaOF1xFPog601Gyl3ibHAC7
	ddSJu5S/F07yjXdGPSzWZ5tjqNIiBxfLYz0e0LFE2B6rxCLtCxlms1gRvTGTxr5SH
X-Gm-Gg: Acq92OHyF/XLDVeayMSUNVchJbLzjf7O+w/nca4KkWAZ5D+CQuQtXKJllyMBttj+Ezm
	SviPnBJN5jDZGwLSRDGAe6kiwVyheiKOUk7zFSNEkB+qfULmtYCT1QAObFKs+DwYYC/61s2oaPk
	vQg65d8xwxTHTEyk+pPP93Q7pl7d5KUgIF1WumnsAqEV1aywW+sg5XUYhpxkgN7NWQqyJ+vPEB1
	EQ3jxV5kOAFBlA7XgHRUflNIUnkatGl3lMj1CqeqR+vdwMiujMjPFn/KzN2EI2k4fbwtYa1+20k
	8zm8QRSAenKXeE1neRBXCGgGpleximg+QImMoSF3onG9/joHtjnj5R1dnLTwsUE4Sof+hBythuH
	2rpJIejIt6TS5f1VdzdyKK7JVeDE0iiihdCOcpw4INdy4Lw==
X-Received: by 2002:a05:620a:1791:b0:915:8055:3f9f with SMTP id af79cd13be357-9161bcdbce5mr1719230085a.6.1781607173050;
        Tue, 16 Jun 2026 03:52:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:8055:3f9f with SMTP id af79cd13be357-9161bcdbce5mr1719228485a.6.1781607172664;
        Tue, 16 Jun 2026 03:52:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbd7sm615295866b.29.2026.06.16.03.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:52:51 -0700 (PDT)
Message-ID: <1b30fd97-b298-435d-83a4-944e536bc8d4@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:52:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
 <aimlsgJssczxBGhQ@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aimlsgJssczxBGhQ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX/vbrxuwJiEh5
 HuhlHu/c1hIof0h28O5aAHYfMQ6+uDKmJeOWM0at3yWmEeyOQRtAcMt7uFvyfBzs32Hcq5rOqBY
 pCfPOciyMgBGxrgoNJ7fGPyNGJWNxO4tUWGfsu6hyyJp6sMVZ7UclkI07om3qf5b8T+NKiEU8+A
 9utwGYLfppeRO3FtFucYUij3l1fC78x486M6tTQ/OEYCNrM63ihq9rUjJl4mojRBmIqViqu172i
 i42ywGcsn7V44pj9E6FXVAukpzlliCKfnIOC7N2u52aw1R7yj1PnVIkKqKJxDl704jaq1HmNoSa
 6K7ZHB9iSfqkNiZkZZ2GiAh0jEeorG94e/8BqFl+be6IT7j1JdejkfVh5V/tivt0rkIkqezUjKf
 6EgDs41bcsZzCBtwxThVxcuaw9Sccq1bHzOLFxoP0rNukDGZaJLptSLHN4q8wmTFaLNGnKFuOO1
 AKAaqnn+C93J5a5DhLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX59OFVPxim3XM
 JxaAgdYhPo7SPyG9wk6JaMPP4N98QliRbP1RKQTKPRgvt0PMOSH6azlK5WxaCerG59Dqc13Wx5k
 xKogkSPITlTZxaReHSI6cN1893yT/Os=
X-Proofpoint-ORIG-GUID: YV8Um_yeiXULVIxhrtl9fqXZM1mnJUhp
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a312b05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Uo6mbPUbqXj1CD9ImokA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: YV8Um_yeiXULVIxhrtl9fqXZM1mnJUhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160110

On 6/10/26 7:58 PM, Stephan Gerhold wrote:
> On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
>> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
>>> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
>>> match nowadays is gcc-msm8909. Looking at the differences between
>>> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
>>> definitions for the BIMC PLL.
>>>
>>> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
>>> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
>>> used for GPLL2.
>>
>> BIMC PLL is never controlled from High Level OS (APSS). These are
>> controlled by other subsystems and voting should be via the ICC for BW
>> requirements.
>>
> 
> The driver doesn't really control the BIMC PLL here, the PLL is defined
> with fixed/shared/read-only ops so it mostly just exists to model the
> clock tree properly and have the clock rate readable for the PLL itself
> and any downstream consumers.
> 
> There are multiple drivers that do it like this (e.g. gcc-msm8916,
> gcc-msm8939), is there a reason why we should drop this?

My fear is that the kernel may have stale data at any point.. perhaps
unless we set CLK_GET_RATE_NOCACHE?

Konrad

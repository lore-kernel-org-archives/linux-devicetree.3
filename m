Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766DF52CCD2
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867870; cv=none; b=pvODhD9k8MBAIPWqntMW+gu96mM10dlILoNHvQIoHUQIsQRWhbgh4Zt8vQk9LBcOpyLLK4FE2YzBrWObUZfjwMIghpKcTpnIGybQxx2XM4fyE0MyOyBrPnMksB6/q6Vmt5//x/ohG8a9j+oiHrJ0ry17KSsXaoIDuCp5uz/dsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867870; c=relaxed/simple;
	bh=gRrLejhesPlhA7Xz2dlfXy/meqOFn/5hVQ2m7BwvNqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wy0zzMw9BMzsZ0uPq+ZFYFjDL6WLsoa6rnKL33HH3SJHfyRXt3CilkikQRYhJD5pIdknWpm7k6z62S1QBODCWQfD0GyJW+pjbrRMXmEujgoCNxfoCfaSd8FBC3nHbP/rrStVVAHLhcfykTEa99Iasaazm7dB9Xr4ITe0/aEbTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPeqynPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q97RMqva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPeqynPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q97RMqva"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjH9A2825529
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pcro7zJwdFcRn5YH+e0+2xi96JdVmiXjIGnGyGaSNaA=; b=ZPeqynPHA059s8kJ
	V1/Jvq9PWsrx81KzNOC6r1fAxtj8Jg720nRJ/UgvJUAtR8RqHI5KgV+5FAO26sLx
	2wwrh+UZX4Nm0KlIXJn5U5DMNI2Dx7chuL4J/xh+BJiFsFYErR1tvoaY1GwUK6lE
	yvuhKFhIxt62MCrrkl4kN6j9V3gSLjOryd0IYxRgYsqhQ8z9pE0hvqEimj+w/FNj
	RQ+MVgXQYzAy0/sovFsjvQNflCf5nOdeBTK4Dp4dCMoV1c0IXiWcsR+IJx8TRAhF
	2k/TjTB560iAWREX9WGN7ALSfKwF54QObGsH/97DNUUBbnyTIAX0ILs+5SQvcQ0u
	3tQCeQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft8nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:17:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d952ad4bb3so25579e0c.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867866; x=1791472666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pcro7zJwdFcRn5YH+e0+2xi96JdVmiXjIGnGyGaSNaA=;
        b=Q97RMqvaaRMyRKHejfP22GlWo1HwZDtClMdu+CS2CM5v5Rl7W8YX08z8lrOQxHQ+ZX
         f6cqFNx2xAICi3Eq0SoDP6rp45PFyq48dYoktF+tKXc/vAkNaEsz83Y2HYv4LD+Ltkia
         Rg6FOuPrs9y1ZeydWtX5RTw+i8T0uumS4vDS7HhLCfa0wFKvfqpgo1Tn2a3l+lzrwPj4
         E3wlbU3fj63h1vr4U1zOygGp5O8rDEmHHL+ge/G/UmPHVuE5ll72eJUVYvL/43kLvlm8
         qry2pXjNcRePaParBE0A9V3Gz9ibcs1f8ZPg8MUM7GMi45G3kHB7iWWyvYBiBi8tRSpV
         hS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867866; x=1791472666;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pcro7zJwdFcRn5YH+e0+2xi96JdVmiXjIGnGyGaSNaA=;
        b=CohqxZoQNsXGZwKyAvLMbksYJ0Z20ik8p9od5UsuKZ6bEw+6VEHnPtwfOp0Ct1CK6O
         Y7f81rTOYNfNCpmlZhTRxSs2iHZoTK0xryO8xND59Vy6VrS9BxDZlhM7Nc85+Hecvh1m
         HC7DTtmOI+bAA6UXjhFH2wKfK+k0Rrf59v9Sf4/tnlQ6o7N9nNTvrbJtKgHq2v0whe8g
         w0axw93wLrsWmNI541zHLxm7DfnyV9grSTg3MvZ5ZVQo2++rCBR7VqAxe5A4ok2dLCWZ
         gr5ttUP9UxM/oKEsuweGm9MCtgYnQLWuHGsABHlNSuFmZOdNdl+JTiVJ/xX8khqkEZqf
         jKbg==
X-Forwarded-Encrypted: i=1; AKwUvBwtN9Od+Fy2arSNF1OVe5IEXVzul8VhN/aVCxGClnFfUe5/qp2h6uSPa+q8SRb2wR8OQioChqKYhZfI@vger.kernel.org
X-Gm-Message-State: AFq9FYJkSLsuLSNXwMEUJ4T6wMUDSjZlBK7/jVWdDhXfRJGbha4R1qRw
	KGCRkeZBnPVbf2kK4FfCB1bykpIqAqjCS2ZQMOeFmmvC1tptq+K73YVg0Iw2G32ok03cda4AZTW
	0iYHNZs0vEJhwkLHG8PDvop3gcI6r6LxyuanK1m/5rkwnS5HeAT0dltqpbfwXq0ia
X-Gm-Gg: AYBFou0Cu0Kf2Gh6qR8anECnd86MD6wcXrzNM8H6/9nGoZjEEST4/MsfLkuou8bbU3Q
	QAJkNEYnxqMe2FStWnXASfYOpPwZPF61N/stLuHHV7vWgINy0+6wCFnB17PBWAtx/TwvL7ICNPP
	427Wd+YP/Sdbr97RI3kGQCtonhQYCPYwduE1xc9ZwhEKcnIy5RikfKnt1D3eD0lKIN+sfRHRdy0
	UR3KT0nSbItDLvnS8rZAaRuEeU2R7jQ3peUnmf8IhkFtTdrreDB+lAA8y2j8yjkbNjdPdP3uafu
	+YSu1XR1R5jFTQg+FJtHB0VKUmlMLHgHVrcMW4Tr6frWbYLxuzC+W8ylrFrMHcCG9ZCXzSiZ7YB
	zdyN6zbCyZPAzC1GnkFmj5g==
X-Received: by 2002:a05:6102:5ccb:b0:7b4:d43b:43d2 with SMTP id ada2fe7eead31-7be729aee46mr1036361137.3.1790867866287;
        Thu, 01 Oct 2026 08:17:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:7b4:d43b:43d2 with SMTP id ada2fe7eead31-7be729aee46mr1036346137.3.1790867865602;
        Thu, 01 Oct 2026 08:17:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca73cb0sm1239974a12.26.2026.10.01.08.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:17:43 -0700 (PDT)
Message-ID: <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 17:17:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX7WXHzIVGMQoY
 tM4/TegZg08VC1drOqf6tB6rqWNynqdXwmXJnG+NYJJmsckYBXvFjbLBqTMd5yxK9CrLWkYBXYZ
 2cMgu0bSv4hSop41CdjMN4Bn/55J+E8=
X-Proofpoint-GUID: BShqd75eRxSh5Nyiig97ZcLOOJXghUlD
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe799b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VmrP8RlAhg8Y3bONdaEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: BShqd75eRxSh5Nyiig97ZcLOOJXghUlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX+JOQ30XWsnwU
 gD+vX7hDFvtjhtHO4FVl9JAwlqFhiKwbl2SASAagbKUudVDnsUlXt9qaKdI0O/TXH8UELqRr3gP
 hWI4Dls6yJaXIA9oMXLevo8X89M60kxFauyLpxBKKs+HqsnRhmULhmBjkpXCsWs6dgtkeQ6C8bT
 /4zRhMHxN7oArIxZ9V9NYdIUVRo6e0iIXbvZFJQLe3frySyXL0nYWPsw5KXBXsknCjRf+pFJlDM
 y3myfJAOxgrBzbb5WMfQ/1/bOz6Sl7kOma+hOlnZMmFvO+s8/RQdbc/VZorERLn4v4bOCPJpB3c
 pX0QdOZQabixjSxc0D0qiBeqTYwVfmkuidzn8L1J75axS5TRmaaxv+SpsC7EMLymDE5v6TKC43m
 OH52tWzg8lmw1w7261/Pw9tXayb3e7UbHvZM9CCTI1UZfSCWjzmOK0IdjFuoRSy7fHURoQIukwx
 TgjQSlCEQNqg85ysMWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

On 9/23/26 9:21 PM, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

While reviewing this, GPT reports a pre-existing issue, please take a look:

zonda_pll_adjust_l_val() in drivers/clk/qcom/clk-alpha-pll.c writes the
requested frequency into the PLL's integer divider instead of the
calculated quotient. After remainder = do_div(quotient, prate), the
assignment should use quotient, but currently reads
*l = rate + (u32)(remainder * 2 >= prate). For example, a 1.2 GHz request
with a 19.2 MHz parent produces L = 1200000001 instead of 63, which is
then written to PLL_L_VAL. This path is taken when the fractional alpha
word's MSB is set, so it affects existing Zonda users as well as the
proposed 28-bit support.

The regression was introduced by a4d89b11aca3 ("clk: qcom: clk-alpha-pll:
Simplify the zonda_pll_adjust_l_val()"), which accidentally replaced the
quotient with the original rate while simplifying the rounding
condition. Replacing rate with quotient in that assignment restores the
original calculation without reintroducing the division that caused
the ARM32 build failure.

Suggested fix:

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
 	quotient = rate;
 	remainder = do_div(quotient, prate);
 
-	*l = rate + (u32)(remainder * 2 >= prate);
+	*l = quotient + (u32)(remainder * 2 >= prate);
 }

Konrad

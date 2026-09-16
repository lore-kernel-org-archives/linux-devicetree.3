Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A397335C6B3
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532227; cv=none; b=T44oZW8aVuBu/Tfuk4b//3tjVGdg7n2PD8ZA8BYlXzmshA/cM2Ebtxu8ZsdWBRZgDsxG30r+dV49DxcBtBFD3MOGfArm5B43PhbR1RVu4qqxDUsSITKX6BLitj4Y7o88PHydZyASPrbMSKGr/8OT7vdvGddlerK4MFcN+1dNr60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532227; c=relaxed/simple;
	bh=QEmS7gtQJV8lPegcQMTne5W34bluBivKSixSide/zvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMxF6dNbsjzkbu2K4IYSV9aY5EpvmNetvZxfML0+2tIcOyO8gj6q2VfBYlfhV63e8le/rJ3bbUTpxvVkWynbKzasn/jol9shl+jnBch3N2TiF617/Ariyxy2SiRPY7xu+zLgI1ggQ+jIybYmErXC5XFgfJs/mglvex07i8gmRFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibWvfTpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTWF8jfZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibWvfTpO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTWF8jfZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYl00721307
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWpVeKnOVisrvOzrWemV8ElUFW/G4gO+jtiKlrfdLr4=; b=ibWvfTpOLf7VQIj2
	zX0JLLIiGXmsdo5vGSLYOJOMMpoP/S0f3JtlJ8IxMIgfTKWyPNxFuGp0C811i35L
	eh1nJtMZHD8i7sSEOdD+Z1z6rjCL8wONDxwTBTV6gmJu9ILwJXzqei6/+2HbaMYV
	Y8/vueiEwJzrycVzmGE/oaD57UlNJ8COf4W1fBd8du4OWq51aVWnCywjgWsDcPUI
	L0PhI2Or7mJpEE0TTFO3scYqEo7vZsEr/3oZvp8W4J/8cVgg+vT4p0nx4U92NzTE
	f0pWYxvuoJaa1AMG5isKvUQxIy+OTMhvOVySQxCrhUDLnWTcipsBf/FjUqjtgTBY
	EWzTOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9t7wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:17:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so7442968a12.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789532223; x=1790137023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWpVeKnOVisrvOzrWemV8ElUFW/G4gO+jtiKlrfdLr4=;
        b=WTWF8jfZEMRlL3znDp5lSSuDVXlbiyZODo8ZOhRkrdOHcDN3Vghw9+KX5bY6eIenHr
         HTESwquN9zbPhXYG3iQNA3Tw/P/1Lp75tEct+HLNIkmBwx35gtDYMtH4piFAi0m9s20U
         Da3XB089u7j1l2FR4/pDZRzTH9cJ//lKZeFCqcJxV8TrdSYlU/G2Rpfq+M5NMyXPK9ca
         yAimptIdzKMq3bo+UjMITqSPKWUFrLbEiF7aAhh3QBE1LP+E0ysatyiNo7O9BfLiGgft
         dFzqAD5sdJ0lUUOoov31xdNTYDMgQ5I+ql8mP4fq9YbErDaFiwPN3xQnXeVXyY0i3g8f
         THfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532223; x=1790137023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWpVeKnOVisrvOzrWemV8ElUFW/G4gO+jtiKlrfdLr4=;
        b=yXazYeUtivmNUwunBELFmeZa3DTZyqrYZnNfeiH3G0moz4kLEE+47160nmfYZt7IdI
         eqfqZ/ZU9uQh+29MzMo6zIHoqe6FIplX1RJsQkD7nlmnPmMR3CtjPvziZH6khh4++mPO
         DztwbzGXRimBzRJ6e+/TcEtUS290LAPfGasoJ8BU8ABEWt0f1++7Qqukpxo+ZuQAITys
         JZChqbPCzHjB0mpaJ5whV47lvieUXyGHzC4NWIHbc+e1cAwTAOMt70TTwKQvSys42RV+
         YwG1rU21G/gaTDSwCQ9vD9am40f/Srd7cjpv6yAZgtoVEM+ejyaFKMSCXuvg6dEypWan
         v71g==
X-Forwarded-Encrypted: i=1; AKwUvBx7jxthWttD1XjyNcvkNSROCYkNuGj9LpN9uISbHGf3n5XQzgYbQSoeXbGNgeebuD3Iypflh1VmgFiX@vger.kernel.org
X-Gm-Message-State: AFuF++mLtezTb+UgXHvr7BEmEcVv++XPRFpx20EpHZDyr/Z3IaVsIh+z
	3ySv90VXBSmEu5Lf2niRMNvgk4zEh3UQtHPAEYNGYONNQIuubn0wk2Hjqil8bXJzrZ3ZHQxiUbP
	uv3V5uEP6M7HUnMCukKWagtAcOHwhpbb2+fa8HszSnY3+8evZdCYfm3zRcI58u51m
X-Gm-Gg: AYBFou3EOgjUk07RzbjNiEV3oGKm7YeVlorzLZarEHF/d0yg3mMRWhVNoXR/r6Mrzzd
	BUACd4CoChALpblra83fR11fsEypK2+GkwKUAy/yW/oHqvUkzKudPp7qkqGNy6hnPSmFiVYibbA
	WQvekDaCKtLKTUWGI8EWP5K/NOuv2Z7eNFee2uB/iDi5EM8jm0XkseWH9nEqxg4EH/vacqqEkz3
	VsVuWBvhLwRkhEbEtW2gHDfrir0TEQ0FJWTpXAO6hNiJbVIi4s2fe1SukyExun3D4wnjbH6hwzb
	PL/TyJOxwrg5xdjv1owLClcDUAm7VxoR6bhutwiSmMgs8PTxb+j2AvIolPFBkIWN3nJWWr3CbGQ
	ysyo1F8BG0tlByTA1YOpple79cWs=
X-Received: by 2002:a05:6a21:4c81:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3dd5f3c1abcmr2875685637.2.1789532223464;
        Tue, 15 Sep 2026 21:17:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c81:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3dd5f3c1abcmr2875642637.2.1789532223009;
        Tue, 15 Sep 2026 21:17:03 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm3901657eec.28.2026.09.15.21.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 21:17:02 -0700 (PDT)
Message-ID: <3e4949cc-4703-44de-ab86-867051ddc2b2@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:46:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa1840 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: JdUyTAafHajrD2B_su8_feHVmtISgFH-
X-Proofpoint-GUID: JdUyTAafHajrD2B_su8_feHVmtISgFH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfXzGhGoDjV11zt
 jZoDLNgirqiAxRtQ5DPzlV1M5hGhyBdjaM8ldpRMc1G5NfJMS9+Wb7ZzmPlQGcTXp8S6xeJfmRe
 toqeHT+dF8FDBz1QAKPhoYI1426DmNmYapu+JLbSPH9/uGFcO4ccixWXTmbSR+p+4QpjMYDbF6B
 CpOeuxnfi243vtcLZyWoFhZNKUgrHlrcZlZ7vTC/32LrO5MCO/jaaja9AwxmMBarRHrXhsBB+Z3
 cH40R4uNKrYSqw9Vz+mH5XC6FE2wvH/HkKFuMRNb66eX33l2/jq9CaadOLaAj9K7Jm0G0AtXcel
 4etHo9j2qRsrUfeb2yhnXQNJKAcvTkq1B7IQl8JnMtcsPAE1kMR40qwx0SHxG5XkN+Fz382HZbm
 zsG6nTW5iajqRh3w8VJLFtxx0lNkyfBSNVmJ1GS9ou66coMtfXz91E8sWmhzHUFlgGGDDbiDuH9
 pa52bh8Qa7KxnmYAtpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfX/rMGcQFvepur
 z6Iq4XwhoSWvCkwmee1R4c6uM3//T+pUxaSadk/Hk+ZJyWHPwa1Je3d9G6OIZU6WsBK77txS0vP
 e+rFD7s+t0VlnpFGvXROwEUrPGqkM4g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160052



On 9/15/2026 5:37 PM, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das


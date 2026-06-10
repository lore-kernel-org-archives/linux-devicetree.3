Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0475405C49
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099166; cv=none; b=cX4lm/MAxuav+GLxet70Ig/1FY2293I4hitjWQex6MGtMng1Jp/VJiN7cBQ/rpKdp//Q7TSjSkFwcxSRz4mo+A3MLTpODIoqw42fimrNhGMS/H9GAO8DhbFHI/C2AlJrHyWX9xIsiLwwQ53PHbwYJdSTL9u9GmWmgL/Lg+snzqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099166; c=relaxed/simple;
	bh=/SKklmSTWg0NDrPS5nK53kFHuLxXsbQJfhttvNNstCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9Jk6jkW9ljtViez9YolS06vd/uwkpjzcJVzBP047mvpVpLDf2rjMfs22Xm0sjbcYGzLefXMK40j+hsph96JkOaYBnkNI3npjKbzVb+kBrLNHKUclI6xrprByuPCdIoeC6e2dmmjQvUON+jXq73UvG8T8njwON7iOqankEd2m4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPKfVCyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOSCK42/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPKfVCyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOSCK42/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCHc61472577
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9Qfs3uEyJpapaY7d3zFlRclpUk+M+Cozx7EeNpDX/s=; b=OPKfVCyJgcTC7bo/
	8vWGU7vdfVbwYGaNsUP+qxFUPTMiK3iyndW1+zHQf9WxZyLFc6/ZNzIdBzgU23tV
	+tDfudlnQ+gzpfqslG24ffuxY7ihxAdpgTA4k9NLKKL3UVX5BUoQKzP+YW3mmkRv
	gefoJkuZ5Njn8HvFXwiIAngsglzDJLxg9HfbpOaEjyJgeJEe0fUEiKdcUANiJrmS
	9XEdc/Me6F2dsEOaaoByEweYK95CHJl6uMBqpf6Q7cZtUBDbYSExusdjjEz5beCy
	MZhVtc9tlnVrNRPlMytC9gFIxYndx/QeOjwQ3CCT1Qlzi8atYfl7kGkKD18flo7H
	BK4svw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda3nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:46:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157b3e5182so87298285a.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099164; x=1781703964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9Qfs3uEyJpapaY7d3zFlRclpUk+M+Cozx7EeNpDX/s=;
        b=DOSCK42/tRiVRaOexAfWihmqEXO4jwc0AKxIrpp7Dfk1e2YA+CW4l2S69FCuPcWrxp
         V7mSxcMIKB8LYNwAR6O31IdMmarBGrrkbhaiIC2/9RRG5R+VW2GpNz8QiNtCZHoeJXby
         4uHp6r+QviXMRCQkNq53iB0POWB+0jhLksC3FfGCdZOeq+JdYwrzTOYJKkJPNlZy1qLw
         oZf37u1B7TCTpD8wA3KJ+myYGiWDYOCUQ5bzBxXI2ab9cFPcD7wCeg/q+ytOn3Y5Mw6H
         tzw2pnKb/cPGwp4+qnBzLBsW07mWOi2A1jaeVkq2qjDa8zdVTURpIW2decXJ7CydAN8b
         EkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099164; x=1781703964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9Qfs3uEyJpapaY7d3zFlRclpUk+M+Cozx7EeNpDX/s=;
        b=duwTEdhcHofvkUERIJ+XheI3/3ohoqDQ5gDcFst3QwtK2+hzqejWggSLyodiLWyYfU
         8kd3U/lIVSpSzmLJOd/r6vpOH5EN60htyztD6CXl0EXZXAf00+f+BjaHiXtmO6U5t9pZ
         AAmNH+gralfEy7+bySCWno1CQDmVzXCQopbEpN5EiPYHGmZywCG8tcbKVYaqkCb00B5C
         wdM27kji5sjM1KlUZH9NxlVXZPHeRWl6fYGvoUq024I+OgPrg3uuqCQNOnxuWDtj7zwI
         14r9Ee9ZAIr5pbPUzBghCRYmAq2wuniCKtHcI0zrBfhbHLkeLry2ZqzaDP+14TeqX8t/
         plSQ==
X-Forwarded-Encrypted: i=1; AFNElJ88/aLHxK/zSm0w9yqmqAAFzcaw0vbX22tFTGyxg6KCtHihpbtPqiza9p7QhYJ/LpQQoUYPQWF+aSn2@vger.kernel.org
X-Gm-Message-State: AOJu0YyQQ4lsFY7+h0xKXXlzN544+ve3eWXsSaofbBJYifpzv44BXtFZ
	XI44Gvv0v5wG9wQJDBmsAU5m1ATddKwmuPd6dHl5+KEpc83As5N4x9Wqgn/S9XgcchPtMPBUAoi
	Qb2t7HLymvfjC7jnJP4wwpOoY1Sfk8E87ZcmvYXGzVCK/xRT2s8b6XRKS2KxDYyKf
X-Gm-Gg: Acq92OGIGCa6zgqypjeH+0yb1wgHjNO5XVGhVi9aOe7CTN7Om1eJXChE34q79613pNS
	yNFFjvD6pfjw9FLRQCZvQSVgUmXKwqdJICLdcWsWaHCl/6OIQJZzgrW+3ihPuF0YZrm9377hYOA
	xk+Ch/yXGFfVsUfZcDRZGw7Kjhs9jb2sA/B/eaaixoJLbFP6BgFeIUK54I9AVxY7C8fuBLDeE8e
	7TjGIpWMUxXQwmK0shMIOYoCACXqjsTz6djTm8hqtutLdcOKigWX42vEmQmVtwgXqUcCnRsuu2D
	1jzOmnANEhyhsb9/y0E9axDk8616eZ8/+xk1PsGZ77FQMlu2Nqo04zskMBnJPZT9vrbq/U3ZDW+
	nbRlN3d0Suh9sMBa5Tqlp94anAr67jQscA12xR/Slx4I1sl2h/iI4PA+8
X-Received: by 2002:a05:620a:3723:b0:8f3:5988:f97c with SMTP id af79cd13be357-915e6d7a437mr766628885a.3.1781099163942;
        Wed, 10 Jun 2026 06:46:03 -0700 (PDT)
X-Received: by 2002:a05:620a:3723:b0:8f3:5988:f97c with SMTP id af79cd13be357-915e6d7a437mr766626185a.3.1781099163460;
        Wed, 10 Jun 2026 06:46:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm1226019366b.26.2026.06.10.06.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:46:02 -0700 (PDT)
Message-ID: <69cc948f-bb4f-49e7-b050-9e3805aef758@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:46:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a296a9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=oZK_lny2TaSriTy3aD0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-GUID: nPZF64LJrRsF2L8ngapNPsRWMSdXcYQX
X-Proofpoint-ORIG-GUID: nPZF64LJrRsF2L8ngapNPsRWMSdXcYQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX67C/2KtE7Dip
 qMqSaLKfs19rQ6w7Run6OKzRMUHDyu+xCY1fnHa2rh122BCDBqaIGn9dGanId7UWxjQy1JQkUU/
 Hr+SHTjGRKNJ4T3s9SFoc3uL5RvSxF6mfNvOINwtZTVvBQRDv3XjoGb5uPHVDAqhpkqil0BIzS9
 tp3ojWiXDL1zyfWkIfAjGsGliJKGFgRGYdfZeIXWztgt5kqNu/HM1LSTLbd1Qt7xuSz2nm06F2O
 M/QGmWSuOwCtL4w1M8cYaBEGaMvDnzYaAw2+YIJtPHWOmmNjm6tf/ptYK2u21EtB7CMxysEqiS1
 3W+TcBUSmLWvRGDglpIT1A1WZSROBRSYkN6MTHOK72Tyh7rhlnfK/fUT66RJGbLTFwUxT5f/Mo0
 a9jCNE/TN9t1LsuxbGJlU48p0WC/X8onMDt31Jucd5ij9RZpBpTHMUOmljWKL/CB4xx3VFsymvR
 18CxlADnfNG1MQasQoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> match nowadays is gcc-msm8909. Looking at the differences between
> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> definitions for the BIMC PLL.
> 
> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> used for GPLL2.
> 
> Replace the definitions of the BIMC PLL in gcc-mdm9607 with the ones from
> gcc-msm8909 to make sure we read the PLL status correctly and don't make
> accidental incorrect changes to the PLL configuration. With this change,
> the rate of the BIMC PLL (600.6 MHz) is displayed correctly in debugfs.
> 
> The clock naming typically used for Alpha PLLs differs from the older vote
> PLLs. There is no device tree upstream for MDM9607 yet, so we can still
> safely change the dt-bindings. Nevertheless, by keeping the old ID values
> and swapping the two entries we can preserve ABI compatibility for compiled
> DTBs. Previously, BIMC_PLL_VOTE (71) was the final PLL clock to reference
> when needed, this is now just BIMC_PLL. The previous parent BIMC_PLL (70)
> is now the parent BIMC_PLL_EARLY clock.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

I think we may be better off removing the NoC PLLs and defer controlling
them to RPM, on all platforms that define them..

Konrad

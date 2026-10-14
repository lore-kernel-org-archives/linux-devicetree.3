Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA63549390
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987663; cv=none; b=u2nOowhlSj/drKtQxl+sJhJM8bz84p5JQOivyyarQKs4d0rysxNkipLrmYNLp+8+042bXPb4quvaSdsodJ/TwznZDbsQIueHTxoc1YTFFH3eoRF1Fchxz1Rr5zGfdZHV3sHRF9BCyqugn7JDW5cuV6pCuCo1cifi3RUouxhN/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987663; c=relaxed/simple;
	bh=XGNrFoZ7MV8C7/dY+VSILAwCYiTvCmyJQJRuuRE54UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+gVMwEVENlBm5FuFeP69MFIDfHrS2w68Wmu749U547IFWsC1NxMcN75GJEem4V8IOYwebPzOhX/lZAxqROOZP8P/pgjmlUNChmghr4obPTYJwcPTj3uhLPT/hBkNih4mH0EXKIiTpHYD7H/Ob6dTtnfJZfUY2V2KBQkANjCg1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQsQ3V2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCsYsYns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQsQ3V2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCsYsYns"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBLuQ23951277
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=; b=XQsQ3V2+7aeVELol
	Ty82a8+AuF1t9jlkHQFWPGqV0R1T/GK+hcYNI/jB/xE2U98nVKQjh5LTXxgH9Z/p
	vXORGa0AWtbQzyGpze8vXqeSkm/EQSTQUBEDHb4PIce784LMrvhQQisXC/+VrQg1
	uqEXXg1kM64HJJ0Vb6vywpDypIJZ+5ofYbMUUCa6vkaVMV+zhIRGXm+OyNQMYJmA
	tdBDVH3qrmhCc5rDyyGwV2XdSDQ5DWw1QXD1+5F3vt9ggiq/cVRAAQ17B2qEVMLj
	3RbBcP91MMTjRXH7h8bYm0/ezdrYQmBFfkFgDhiK2OgCf5/fzf4oytw483Dyw4iM
	FYpRpg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p20qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e95e7cc02fso76252e0c.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987660; x=1792592460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=hCsYsYns9JjdldGvVgZdsiZ/Ap5OQD/8g3yztfGHtisUHqhoYTSDeVBR0CjrpxsBcD
         FFLe5spTCOecLGum9Irb+2Ujvyfm4izc1/jq0+dlFw5yp+ODXdIC1qV9g6aASoxFKdnh
         ZAcUaqEOnLhajrikc+0CMi4kmSb1tkv+kOXSGLiPNJT4YXcgoZhft6pnU+dwH6dHhs2A
         /0BbonRX3LvZZtlpCH4XX7X1K4DGxptj05XHRNNlL3AFoCI5o/xW8uZdAEnLDe+6LvCt
         fnQq2989W9hfpTIXc75UBVRK13WLKvzY0bskNLENjHndrzqTP7nFjf4D1iLwU3Fcj2K2
         34Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987660; x=1792592460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=b0soy65VeMMoXaXi+UDUsHMogjaN9d2sRuoi9Npt4O7H1G1lulL9hlIHc4MSq8LoX6
         BlFzOG46WUPEX0nnYFCReyNsxG4npQI3+cNjUTZu1V8G2Ov3Ul+3yvzKZ0JRhsKn5YRR
         NMy6efnDnlYH8b+QBl/T84dxjpqif6elwBdTnQV+BZStJrUN1OPFguYjQeoG6QysY1QC
         5qWKCR6dhrqcrB48pyMRjLhE7JfhB9y60R0zy67CeEbh0SzbNLEaXxfeqRzRvv+sd9SL
         7d2dmtkXGpK1LdYKuhv/feLeqgNIJwvpzhCWDdjITyUhlYz2bgyP6NWSwHX0Yf9xNN03
         tOvA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ91/EpOE6rdpE3sX0y0QKXJ7e9zAYGNP886RsSzNtFimjydxO5pAJ7ejC8X/IqH+Mvm30/nvY+hwQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJcVhdH4tkLbopeRGU5FIAkjQu7k8G/HDqQa5kLKqA8T+5MmAHS
	LJEQMWDbyKnYB3SHt1cAbU5j/fcSD+ecCzn8tMcof6ZkRBq2BBLYB/YEQ1ySBYygZJfKarHuyle
	jMZ5dmaq8R00XEonGtvH5rytfZc+N3s/bkOwtMGqGYK6509vcwJHGYh1enPYe7SUA
X-Gm-Gg: AYBFou3Pb7SSsar0bQw5RCEV3fuR+wIIaauogbc4xqbMZ1WQPqDIqlOsWGZFkq3SI8C
	9h9FOpgYcZwArDfaJdSsu/86KB6jus7nIERgFsPMFC2eCaGUM2nVUEPylC0yHgdnyeTMrlHl5/3
	FuZRqSjQub21gBZ4g1yAqDLgSRW/nWjbFKCvnPKtkpRX5W+aekJMG+OlSbPEb1DVvVFzUDSZPsP
	zNO+/guaU8aQgn1vOGHEYEDVKYb6u+CRLwkP6PPF7ZRNM4CRr3wFMD5LcbUambf7kahOOVUJgBc
	5WU8qdI4D1/7CJCidae8bNEIkzEG5osAkOxHAHKp0k1zW8Xonrmd4QvyAjpwqXgXRxwQM9/kWpf
	o+xwv10eHal/RJp3aS06/Xg==
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157613e0c.3.1791987660494;
        Wed, 14 Oct 2026 07:21:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157584e0c.3.1791987659925;
        Wed, 14 Oct 2026 07:20:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388ad72sm1182036a12.24.2026.10.14.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:20:57 -0700 (PDT)
Message-ID: <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:20:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX3hQSvghy741N
 bp3iAyh8hLea5nkvps+aMHPJcx7f3si1YsxcP97yJki1KZDAi2OnHuj0tLoqvr5iyiflH8Nch/A
 ce2S7MPQCsnHrU3szrlHf1JIylaN7CA=
X-Proofpoint-ORIG-GUID: liis4Qoe-FepYwqmG3LWGAq9UaYLGqwc
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf8fcd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NbljYO6N7a6c2dGYBmcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXyRtJW7Fhw3Up
 0RM5scrKB1zr0lNxnArIFZc1o2pJOvGZ+n8S5czN0X6J7jrGvibKR4PzwIV7CHMFCq1FytPYB2d
 4YQSqCGje0oADuqld+z6MqB6TSWZBU+/L8oO6mYT16E9pKrgpiVf+VfLFtAIpCUrrWAmKEBpKmY
 GROaAiSPMdvpoo0Lal70e0O67ZfDESC9qwDXLNVDo5DjKEIpUeghfN0LdSP1rwE+cAEcl6RSzOu
 tefBDt5SGcuvb3zoT09bPtBEQV97/NUJf38i2D7+u3nfIP/ctcYGGwABaGtTBgtioZF9uS4Y468
 QbVmIYJJVYbXrF/ikMXxJNXcS+wpk7UUFcg3kYfkuXgAZYheDs/Bw9qNVrOv0wIfepffixtegIO
 qWJiCVlPm3XNjbzFkzaxrYqzRnifaVYiGwA77vwmXBHKvjE7kgJesQinoCMCa2Xc+WFaYrlOERj
 xZPiRxevP2QiqNf8Ktg==
X-Proofpoint-GUID: liis4Qoe-FepYwqmG3LWGAq9UaYLGqwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140057

On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Clock controller power-domain attachments currently become parents of all
>> top-level GDSCs exported by that controller. This conflates resources
>> needed to access or operate the controller with actual power-collapse
>> hierarchy.
>>
>> Allow callers of gdsc_register() to suppress parents inferred from the
>> controller device and its attached domain list.
> 
> I think, each GDSC has a parent (in the hardware). If we don't represent
> it in practice, we likely need to fix that.

The next patch allows setting a precise set of parents instead. Perhaps
this commit message could be improved.

Konrad

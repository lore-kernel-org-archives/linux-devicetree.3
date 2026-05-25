Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B7B1A285
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688271; cv=none; b=PXQNXI2U2ZbScXen172L6hUYgzx7p+nGGptlHMKYQNkZDR7Qj3bC9urlduw+8Gu1ECRI0bpBUV/tdYXX5ACX0JcEpjqQc1YDCbNqJVrTK1wZODFi24fjFM6Niz9zGqTCqEgq7i2Gkr40hrsbA9JaFGvGVrsDn5S+VVMdbQP/rPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688271; c=relaxed/simple;
	bh=vl/IvMjHQaPAG9h0CsmqVgUy8/dTJ2JHEUpBkVfgozE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rkcx6gzoDsTb2j8oQFN29F08aT/R/EceufuNYObH23VDYNliobdjP52ukRwnpsMZKW3iJ4oCzuMkCbk1hnhbi057q1BkGiV/fGnz1NNy0ORIaBsMlZ10Oejvnju8/aqzWrfP5yco9ZjIubuQ6xQZE5maDZN/zo82jxEGXLShKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuUsyAIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YabP8PU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuUsyAIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YabP8PU+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OEEMwa723934
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=; b=WuUsyAIWUlyQijQk
	8xCNHknZt3TjwD55WSqnMX1np2l7sh+fHzt4zgIlDmxQK/fvVpOohPz6ojnzDERH
	sz8+MASuZZKwlTLiRJA1ApN2ht+aWkRUV+upRwABFYLkVFk7C/odOhX9kcxdolxO
	8TSxJHA9vAPr4qDpG5uY/kViS06gf3AcUro/OJi+zEya2nHJv1uYgO8d367JKa56
	zKKxL/2hSLus/0luPi9VUs8kLLFJ+kFIoYw9euFE+LTEj7acavFD5Y35BGbNdevE
	q3AxveC5rtonLlNfU+gq/rYoxXABihQSoxjrWoKk6ajyvjvz9fV+Itq8hlsbfCzw
	wSX1/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w4kt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:51:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baedd2fd43so63665385ad.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 22:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779688269; x=1780293069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=YabP8PU+vQmGuLw843AvYJRsknPKbPtbTDz8MdiatTfLU7jD7MvbGrnk/w2nk9tK0g
         8h/GbDfk0cYHRmqrI6iPOHc5TjWSsK+3WbdiVNPzeqZQdEEefoZWr2pkixR1ISgH6wFP
         8bDcGOHDj5Zxh2URrUf9W2qe+Tpmg0nXLb9R9NSURzfWvXSOe6KaWSwjrud1F4SQI+O2
         DSoSzKL58C/9TzgIVYc/11KZAWQr3tLNQuAkn9hdtAbndh8gtTuJFrHTx4hhtuOgqqbd
         KCUJyB+GWV7eidIzohPHhUhtarkcxdoGqIwCeFgCb+2wpKMzbpWivLj0F+sro2dRc9Aw
         o4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779688269; x=1780293069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=ivJzchbKD+xYNmfGEy+8ysLHMo5oqwiPfi6T2bpmf/pfT1+FahUSgLUlyiRz06qvkJ
         CAmkhjBVeeb+WUyCJinAaG0GYupd159uTom4lYrKnw8ZBvEOiu4vA8xnja3+lgzOHb0F
         pONYJ4e5gdrXvK7NlMK8Qqyj5x/6pRmNICZSsSUGfYV5snqZHTXDlj42mvPeD7xs0uL3
         PdlfPlSYM3oPlOoSoaXgX4Io/5iQJtNP+lVbXA8q+nFMklrq8Wg1XrT1vvXIgW9Qojhr
         XyZHpTNmIJondm9gmFxAjY9d8RpUgRczK4IRGXOWlUjm/w4iVKYx2Pan5gS9N+S8Yxpz
         744Q==
X-Forwarded-Encrypted: i=1; AFNElJ+dwSo3QkcI2jnKflqnpKsLd7ggqkui49bZGM3rDSummnEf8uELF8BdF6+AAk3Wc9dTbrsvhzM1txNr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ROTXIGlBqFJmUvkanMxzHJC8PyvnaYJ+BfV7u5IH+6t010WT
	fpYFE6iu4MDBDoVwQlsXMda05hE1vZk8SNtCMZ7mQyd1SV55oaczLPisKu7LxF7JGtS79JN3mjP
	VpCcpINld0/X1J9l4VVU3/wnePTPrmqw3XpkhRkAmVWX2lXcM8ObVa0GQVGHmXiUg
X-Gm-Gg: Acq92OHr42l13ynVSLK1X+tOuJVqoZ3wyDw6NVmPvpP9EP12/X8e4ey2VE6366AGAvk
	7i/7Jy38hze2ytjOLAAvYs/lnGAuD/Ds3m7Aq8sU89/tw+JXtc6QzOFg7PSYyhdfVdzNr89A3Om
	ClH9kZFu1ixJfyKK8GvvHUgZV2evCqT+GDL3MS0sdgs6ZvcZKI8Zl8q1l7oNNMInf4+XvfzoWno
	myWrd8RXrPuLVsqZUdz1eY0zv6dMWV4rg0lELbMmx8aYXtJJwrYu+qFs9NTk6ySJeupl9jWBg8F
	dpU6pHkwd0tyJ+ukFKexJX0gdW6f2FDDX5sHiQQ7hNX5cDJM+jlYIePv53vDTxG6rEvcVW3oQ0q
	ba45I/gTsAFYPVwbESuZqL1XFDhXj9fW/zJzqruh4s+KpWyF+
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233415ad.12.1779688268659;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233085ad.12.1779688268163;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dba7bsm80743675ad.66.2026.05.24.22.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 22:51:07 -0700 (PDT)
Message-ID: <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:21:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a13e34d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4fXVvXKQPWswVA94wWgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1NSBTYWx0ZWRfX86SR2eFuQ3SB
 Ts52TLYWn0Df9PsQNQDcr+psxGL3vZhl0F6wZK3X52DiykGzJDZ2ofKGOGRGamEzpFIZGjyoJ+C
 QUsgADLhAKuvITeI0qeI0M1ej2qvi+HfKP4NZLHdCApvoGXTBgXhzwszpokqydlvZ2szxnAyDcD
 L0DN8YVP3CU9qaapiKkBZ0tr4nPH/QUdntTAbF8u3e0SIbNnfb4ptsJwlhuMTlTkULmIGue4ZGk
 CIezF9ja0rRGcEmk+9iXRmxe7AJtmnlrjO8Qb/ot0H4+FxNkWFk9nKO78h9BUEgE19a1XRm1FrM
 97jiEM/tQypHF6JZ4cBktZ2yD2GC1S6CPmP7ltFgqHnfZ3Covr5ob2EhZhfBIBi9HI4NqeGz8ks
 rElutJcvnDPMl9dVl+CU8FEHqaE5P/qp5K0oFWsyPjpnboLvYPHDDLNOxd1g4LotXvUuIpmNDOg
 kd5zLRq8y498mrnOdSg==
X-Proofpoint-ORIG-GUID: Mixx6ISh2J0qyQnAXail1GgfGvobBFI1
X-Proofpoint-GUID: Mixx6ISh2J0qyQnAXail1GgfGvobBFI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250055



On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>       .halt_reg = 0x4c02c,
>>>> +    .halt_check = BRANCH_HALT_SKIP,
>> please use .halt_check = BRANCH_HALT
>>
> If I do that, the clock fails to power on on boot.
> [   20.324488] ------------[ cut here ]------------
> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at


I am hoping the Venus driver has enabled the GDSC before requesting the
clock enable.

-- 
Thanks,
Taniya Das


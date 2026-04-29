Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5231A682C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435294; cv=none; b=mWb20EIY663VVW8Vjk4MqolCcNcoBqsdJr0X3FfTwlo9P6qFceLpSouM+wFhK98s5YtUxPxQYWtlhoWJOPuoSDXYaLn9DEDJIHmZbkWaOwD1U0lzBVXII/wgIjxbDRw/8ZoFBSjnUpkuMU3c+jBpZm4ZEHla3PaGi0NbVGPeJQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435294; c=relaxed/simple;
	bh=wWwq+KhbkFxgwgPt7dPMwgoRpN9PMBmSkiRZgZ9cims=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1nojQzbubtC4L29g0qGCIXcK7ObHZoKsnZuBakEXIHaXEOU7XXDbwYFqgTUG5ri3y7GuuMdiyL7CEugwSGF8KfEl0O3Whz+mEYx99ZAFOtw3JCS5HBv8WCaw42ScQtqQ4gzrlH9TpYds8tGb835asMyA6jVE8lh9RqcvLIC8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNkjBacD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6iq3i0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNkjBacD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6iq3i0g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2P42n2984630
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=; b=VNkjBacDR2+5SsTA
	DQ5OZnYg9M86d7YfqDCjOj5haxJvONLqxvzHG65jiYtdIZs4yYHYK5LYeyxHufXp
	Oj0vO5+SkHBNd/3xAXEtK+3O1tto6utfHc4/7cu3tDSqyzFizPcJIUlR5aHVvBVt
	iW08qhcTHk4hFh79Sn1XVtpS3EqDysblJhR3dKfd9uu7Pk4FX25wAyMavGLXnjGW
	8t5foEo+CRyoGY8Iu2hZF0ruz79LHi8i31Tp+boT5RiDHqOOob/PjVLlvbwnhZwQ
	tpoE9cougmQculqK9Jm2YloGCqncLVwJiV6lm70yVckhtgVpZD0pA2JR/9ICuMXw
	/LswJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1syd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:01:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso13997686b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777435292; x=1778040092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=;
        b=I6iq3i0gtFUPnbc1+WMkTGmXMGWvoQ7aPc88loRzS2/qpxYh4p3T+qxKA4WXEoh6ls
         4zSwDiadqQun1Hf/wHYjr8D2Gd2troGwE4ffr0EjR0NXAeMp26Jf4Tm72iIMDskW0qew
         sYl+SAbWRB6Ox+qqOjPhJewLaTQHNFCYAIOtXxgB48ESVAVcZkJaeJyW3+QYR/Z6t/UM
         eZone7AYy3AIiOaKxDE56pnB4zG4m7SxCdLzjXqXvhHDmWcwEo4M6nCKcbRQFc1bNjJf
         WGahWBanFsXJdmxrSHrmSqTjX+NbQUv7RIVtNvaJCGR0RcEOy0dpVnLHKNuNPsQBTlGO
         QYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777435292; x=1778040092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=;
        b=BrjxQpS7XiXB6Dxo3P37k6O3tzy0yFF7R7AmUKp5TqBBAneggQSuzebD5Wuo6tcfPt
         BFslsOMtqNWsLm2ydPli4UAAMfYnrDo83pqFWuW9nyRn6yLIdmK9jrgseBNqYhKAZrbB
         GnL+o648UriSLAnGUNmIkz2qsvvFFgm+kNtlUQ7U+WkPvBNzwiuVb7/sIKRdvTA86DH1
         lelBDPUVpWuZlzHfq7RGRFcUzYpt4SqN4prT8iUwLPPyJBZ2KwB0ZWRHoIXyVH2BKjNa
         ymoAVkSNAT/iJT29uKb1T+zTdnfh/jCjaZCZ/zlR64y94UivWdHdZJp41p72l40pxYfU
         7bhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PwloMz0XfxChpPEPIQrYnGxiCpmbVHAJwCdliVJl+IIQM7SHL1xslcRjxsLX1bCuuI5pNRrFFshBg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy6uAfWtzKTos8aREXQd4sFmudmqILfpIvW1TXgPk0Db1F9PVG
	LM6LgkDGCQVJEW0Fk2VtkoSYnE1XfLmYVQ0LM6/49QTaI6tpqB8TaSuiM7WEQay6EMg4MAOr3AT
	meXblwZXoRIZmpuFCwG46eIWeXGcHGODewfMxAaz33RpDB6ry0FWDORURjtocpadR
X-Gm-Gg: AeBDieu2+n8Xxoez5lV5YjMjf45mG6K8WOLB2UNHKpWmE/Tf/JVhjEFClnd3sefOBcS
	Q4MxjcjV2gCiIYodnY7P10fSW9FBqoDeoSKzBlc7IhyIorzJ3+7FnkscY9GrRfpG2kuY/4UFq/i
	T0BuQrs83850WSmsVW9phdF2cb+OXKL5Ipo6nfabJuS+YVAjJV3Rswlqce4qf4ZJLSBlhkK+AWH
	GeePjr8/7vYOxcvvDF5CpPFkJUdiskssriuBx132KgLy+nkk50qdbY8iOofLlcmE3tKDo+3CmfL
	YX2d3hQ0m5IzFOSbZqv4/0zlus4tAivZAL6/lvbiTiR2TOK4jLbEw5pncAVDngZD/5Wpu3czPRm
	Af8SOw6MjNaVD8r+Zqf9LLV/skE6MpOGL7mJ6Oj10VHOZ3mZSoU9XTtqYg8zLnnfevUGI5O0BFA
	==
X-Received: by 2002:a05:6a00:3989:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-834ddc9558amr5619410b3a.50.1777435291992;
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3989:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-834ddc9558amr5619381b3a.50.1777435291564;
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
Received: from [10.48.22.70] ([27.60.165.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6debacsm550349b3a.33.2026.04.28.21.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
Message-ID: <6a2a4766-2dd8-4da0-a180-0c8ce3dc8d8a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:31:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
 <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bibHkodnLSKvfa8paZaowZrFGAyTQ-qE
X-Proofpoint-ORIG-GUID: bibHkodnLSKvfa8paZaowZrFGAyTQ-qE
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1829c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=XvYZRKXU5Z7yJT35SDuk6Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aBoApAjKkzgGVCnEwe8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzNCBTYWx0ZWRfX/Xapnj/WzcMk
 YTbg4eSucJ/QwaPiER6pjY4ZGM3CaubBYr6UGP0jjx9s5O72o3dN674fVGiTqO6MV8tKcYYJIlh
 yG4eZEUBEerWHm69pD4u3PL9RRMVna1k3ybP6GLfZ/ued86RXhnE5FQpK+JyIDX4P3PqI7eFMTC
 P3JBXLyEiiw0d2Oa1QrWn110M+VgytxzkQXp4I7/t1g9+Y8BY9Ul7oddOp0f5febRYZt3cXomJg
 tszjv3tT6FBvP420oJkHPQSq6kvlWJ4oX+yPX+3INMIBt36vtjD/FX8j2KVesWZNs8S3WbIL9ep
 7h5D42TdMZ6tmxpiLzdcNhh2f+Mv1p9xUC8bzcSHt9wmJUTabVip1JNlpCKNwjzc5LZb/xjuLch
 Pc5F/av1uZHU1UhQchAnkwWJtNG2ZNL+Glxp2jZ7+Kf96R1wtUHkiRyLAjFbd+cUFH+wTr3Xqle
 GMRycpwP3cn0kEMovjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290034


On 4/24/2026 5:00 PM, Konrad Dybcio wrote:
> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>> Add support for the global clock controller found on IPQ9650 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
>> +	.cmd_rcgr = 0x31004,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_0,
>> +	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_pcnoc_bfdcd_clk_src",
>> +		.parent_data = gcc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>> +		/*
>> +		 * There are no consumers for this source in kernel yet,
>> +		 * (will be added soon), so the clock framework
>> +		 * disables this source. But some of the clocks
>> +		 * initialized by boot loaders uses this source. So we
>> +		 * need to keep this clock ON. Add the
>> +		 * CLK_IGNORE_UNUSED flag so the clock will not be
>> +		 * disabled. Once the consumer in kernel is added, we
>> +		 * can get rid of this flag.
>> +		 */
>> +		.flags = CLK_IS_CRITICAL,
> I think this clock is normally governed by RPM.. is there RPM/H on this
> platform? (doc access still pending..)

There is no RPM in this SoC.

> If not, what's your plan for this? icc-clk?

USB and PCIe clocks uses this source. So once those peripheral supports 
are landed, we can get rid off this.

>
> Konrad

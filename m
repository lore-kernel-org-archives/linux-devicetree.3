Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3A3EA97A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561199; cv=none; b=MFloMy6gy8V5QNzPuqxpav0RCk+3SNiuLpIkIeX8/vZbx6SLkmbXWOHcP5b2I8G7Nx6gwWt7FDjim0TvV/j2Lm6CnUc+k2gV9b2guc1Wrnwb2aW6Zcw5Cw7psvfCMEwcs39Nc9VHxQ9+UUQfxHBbQ35u+Sd+cset9FGqMthh7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561199; c=relaxed/simple;
	bh=6Gxu/Q3MLXMDvfJ5qrWScz+sQ63hWuceqhbpR6SOQwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpv1Te+eD4kKLMQOeBtUhr3ffX18lDhJeU1/rjp1aDJ0pUb0t0sEmoSD8JTeVO16EX6DkHitfhmVy+FnIzddWBblSVx4aq2NKgQkd+o+YW70nyKlVXRdFC3SGLylRinckzeiI7VXfhwfth382ziv+1Ar2sfvnZrNw0hYMqrv9GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF6fuQC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOYjgO7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF6fuQC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOYjgO7N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R8xp2041427
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lY8DjFZzzT5968A84BYBfpc5TdKTpgJSJdTt0s//IQ=; b=HF6fuQC0r3s+V3lO
	rH4oPnySiVrrfJ8kC0nzVixCKrTuaIKxX5UsjsZduaO4ZB5rK7zEHq2w834kYD5n
	ivIGOaDR0Ws0uVF/gSxGGoytzUyxntawKVOxKUs8+6r8bfPKyLPqrGWxroeMpoj1
	st8jl2/eqoneCQLUKxKF/Rvh07y3NMeSxkQWzV2QAb5dYkqzqhKpSc8uI2gD0pVT
	a+6tbOL2rTOLWjGODGzj3WVhOMCe+V7CQd3mshGaKTt2npuyI8q3OyZdcoFJVe29
	0QjeKoDTFKBhu3Kf7ljFvNzKITaJy5T/mELW4U1IQceLORPjYovnjwyt0PPoK6c7
	DXtQWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hqkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:46:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936cf9b6f32so20925585a.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561188; x=1788165988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lY8DjFZzzT5968A84BYBfpc5TdKTpgJSJdTt0s//IQ=;
        b=XOYjgO7NiNKfrDiAysD9fQYL9ZmRHGnuB4az7uDQEGtszV1XIOm2p9TO7PptXdG4Sv
         F05mFvR8wMt0e06q44bun59uhR5yJ/33OCFKD1Rr5SkSBzYl7jO1LU0rFYfJJppMmDCS
         9/G7FrkP3ZFPgHYAbQPwsmgaHyBAyY8aH/G3qtVO4sz6SUNAQgQyAAlOln5dIRDM3Jfv
         SFbADnxEc+LetfyzsBvjyiReM5LeVZRfESfdUVElSsESzJ4JBepX4GnI5P1+yGxq9ENd
         Rra3sN2smwmQbv0xBC6z4nNH+ltlwLtlQN9iu/1nsM40pCFaYdkoCuhic9RIfufrUdpB
         pAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561188; x=1788165988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lY8DjFZzzT5968A84BYBfpc5TdKTpgJSJdTt0s//IQ=;
        b=Z8TKRN5n4r5606WZDJ7iPQsnFnjiUsKCADsS1b/ovbgWl8MhwfYwmlVbXLIQc92Pw5
         M+/YJYSh573NxkhEShr+COE5fzz4xTiG82tS0AKuB7O6xiARaRIzbP3Qpzgrc5zs2ZqQ
         F7AQW7dnr0qWu1ch/EBT15UYQAbQZSZLeNUCC6THO/0ilAmQj29jIwhv4BZd7aUZnbu+
         FwHiH/HtKSXETGdcR4iXEunUQb9txjTbTnfqrbS49cYyHM9I0NHwpBTBgtq8LxgPYvmu
         Zc+/NJg9YQ3ijhgQcC9ymjcv1oZ9zDd29lQmvaB+8PeZc+f/7DLsd+oqDS2ciY76am5C
         22Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rohu/MpxFlb6HShDTWmfYzvcCqSO006ct3k1KQCsjpL3xzPoQ1IHT745AQYLBidZ+9X9oIXgInMDlAw@vger.kernel.org
X-Gm-Message-State: AFuF++nI1zklH4CuRVl1NRKIrZUZzX8Jv8h7YDG55llrZ/3OziER/1A4
	sWBZVOW9JGwqpa9qcK0RlCnXWKrUU+T3/PdUiF6OD1WI6pFRs71ilfVghdcds4aeelKkVA+EK4K
	7j0gUJ96L73d8UgUHvitzCHSTvOf/Q8stvlVUNdbn9qTeZmuDzruJsizGetBgIXY4
X-Gm-Gg: AR+sD12Um+jQkjYi38JqVGkWGZPzpTzwWhOIAW8LmuuhajlsbDtxZwFDz81V9L4wp+7
	RPLW+RPbj0l313VtBv15atU9ilTaWjei/4bpNhTMhW4jzz0q/3oSRpy0YFpKhkAG4DIS3/W6/cT
	u1+yeQKzQy+IzCq9/i2jhibk/VEcPLEZc3qoEE/ZEHWJiqD36msXGYOrXdDWdvyM+VKt4v8YZ40
	/JXWuHbOewqjXvN6V1jrTUHpFS0DY0j6DPvRcZh7SFADLDo3rB9ekOlCuNVep3DaXlgKl5LKIDF
	aNmG/BqvFXjlgxRu/HZs+tj3Se8Qvg1bELwdnnxqaYZGha4M+fqjU9MrqKi4eDE6ikiQDF60alU
	CpXG6bGTpSwZCxhVhqKc+lQhu
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1686970285a.3.1787561187783;
        Mon, 24 Aug 2026 01:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1686966685a.3.1787561187347;
        Mon, 24 Aug 2026 01:46:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1296097266b.12.2026.08.24.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:46:26 -0700 (PDT)
Message-ID: <b73224d4-91b3-4040-b67b-b107c2eae607@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:46:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-7-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821154030.2514-7-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c04e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y6nKStmhB18y6u4H4U0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX3HZ5z5JBLIBh
 RLUp4ZlZB+CVUMZFq7l0sEoSSyBtUfc7YGQpipGBsYm++/dC0Ac2Quv4fKtBETqLCx07Y7mzicJ
 xFPnVhbOBdK9X8E7uZoewbpNxQe5Jeg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX7/hGfiGnbOD8
 Wh2mwMpHtHpEkwySPe77ezrdIkF1PRwO1erjFXmbSMDOOYUl6vwOKNm3MSe491SohwjjFDchc+6
 eafpH92tQJPWcLBbvdxBTJcEGIt94dTn0gy+xRrMrOVffDiLMQobCHUys8kB9jRf5TbLmXVTNzX
 +vVZPaetcWXq+m2ui1xvXUl4FuOFUF6dj6nV2HWwrgLqb7cLRGsaLE8GjPjpiEHsWJHnBc95oFy
 aWCI4wj/9N/W8Ypjb1Fd5F6IsQ7k76I+H+JSoiQUBmv9Ft51wo/0lfcPI9wopsDPWqfsDH3JKom
 yXxay+mSvkCNRx7ZuByn1+fM7aUami2mSwdi483+MWe2LJbWXel9uQaqeJAiSEa2bHEJKJXczZZ
 B8n/pI+mWGw8tV46eD29ISl1WLir4CJEMb1G92KTJn1q5QgC9Ou2jFUo1YbWp/xKz8UAeSzfnH5
 0x2CcnEoW72AgK0yGiw==
X-Proofpoint-ORIG-GUID: Ctf38BCQUprOQXVh0BJeyOdPtik4554i
X-Proofpoint-GUID: Ctf38BCQUprOQXVh0BJeyOdPtik4554i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240077

On 8/21/26 5:40 PM, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

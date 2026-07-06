Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15A3BB13D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 04:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313767; cv=none; b=rYnp7pAzLQGbyVxvdAhy6iRKHBYHFHsVeOwilmVtLnfH27VzN1/8m4uJ9UTsjZxlhqHwdCigqcn/cR3gL6U2Ze3y1jifW7U0G9QKAUT+vM8PTg03ME+56p4nFZF3jgwtyHvAj9m3ShNTDRD34Sh5nw9uqe6eWZN97rFSNkNGDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313767; c=relaxed/simple;
	bh=9b/4FZ+3+qRq+fXpfPVgslie5izhocjgJJoFMG79fvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noe5TfPOThHzMbColwj3BqKC29uE++L43QMvvpzZxGu16SkED/KQYe8H9RmNaibnLY/S3eXCEcVfPLYvVfJPPAIIVaChuESGzsIJJSYlxDLdL1NOAYj7+xNJMMoxVwrzhNkwPTbW2D6g4M0KlYqXTN9NYTjfnBp2ERKa4qN9uEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4LmCalt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnrvUr52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4LmCalt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnrvUr52"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cJk3470529
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 04:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=; b=j4LmCaltYE0CabBi
	kSx3so/eLQvWs3aD8BM2OdPb4VrmUEhXHPRP6PHTurRAUGApb4DI8wBbHohRNuzE
	DwjXosTJH0ygtSmymmyS+PfzIHWEovaj3Tbzcp44Siw+f/A4x/22UrYMU6Lxv48L
	B+P2XT3XZN3nJnu9J8/ccPFFbDqWpKHIyG4kLhhFKrPQPEmEnW+Q4TUTiYRJ5Fhc
	PItKcXkNHhckYJKE6L48DzrG6xUjuDMgn5IAT3D+VncxXz1RfXWKizgJejigU2hU
	5DUV/d5KE3tuU4YXMC3DN+8hnKwDazsWO7HG7W2lGXX2YxTWpi0fYcJEH/VWXwPM
	Cjfgzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txem9fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:56:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so4287002a91.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 21:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313761; x=1783918561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=;
        b=SnrvUr52EwfTpazaBmOhtcWGLTHGZaLb+86PCkDbNV4hRXiQIP5ADoO6Uj0apvX66r
         /UG3D2ZtE67N4L4IfWUk3YTR+M+zhTIPOMDzNtcJofS+TB6tXXBAvVTSxcmB4ESSoHxp
         o3qvnu6oRTa0rypi0d9TlLqPc0aI6UZwF2giZ7qb9/bAXo0c0nTwb4vLfDxesVA1AA0p
         urIHCBeIlnCXNZxcHJQxJ2ue2fKUELiN8xgJrXR7Ju1KKpg6wj7SWwB5LbuORb/yXXUV
         1T6pv7HkYB5Ioe+TU9JDWWu74wP1SICM8IxBxtaAxaM3E/XzBuJzbCrjreqjDDaGJB47
         aE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313761; x=1783918561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=;
        b=qewYLRjVgcGZBfcS7FyJfDbephM+sszeTETsKVHhrtBicdceu4cYF/BljLDwLPnFYT
         cIGcBsmBppJQ17aUfI6uAJVB4ZqJe6GYnf+JRgGzDdg4pBfbWh7e6ICPL7+BD6fIz/32
         3Yu1DT3u2fCKNyJD6HSAHQgOkXDoH23FQ1TCOQ4eitHaHopbmCcnMAqAnU04B6zRffVw
         1marBUfFAUoiFhvuYDK2fC9TmmRjHYEoP7++tqMPzRRTKmiGM5pQnz2BwyAcbZFOXATJ
         1eO5A/9/2r59dxHWBx4HwAccwj2+G7R6RT+aCYLq4Wyw/osry8LlKrIY6NFgaxfUraHY
         6jdg==
X-Forwarded-Encrypted: i=1; AHgh+RoRDpVwUe8CB9vyLRdAo2nLg+fS8CItCvpCMKdjCHsFxaVl+e9n/DYILNXvVecsq/dyVhIS0qviarD7@vger.kernel.org
X-Gm-Message-State: AOJu0YyetEEBwp6WTExTpl2o/HTsOZVfwYKxo/q/V3DtlTjnEVxArqgN
	HkibJmQNTpEpfD2xxFxTQfq+rYSb/UFdFF/RwYCjQ6nmH/qKJxZFLzK1UWZHS+3pcxBFwqmxRJ4
	fqxasPM6K5+I1H3ldxnyUfTSPiIzHmumoUnSG7SPpWACsebzxtN8IHzSqJ2ULO3Ct
X-Gm-Gg: AfdE7cl+uyPkduWvCw/+bXEQVUlbGi2fWI5CtAizOsQgnVDR7ZZzV5IWYoV5HVsG7Te
	b/bLx0l8WczhjL0hdQEQMk+nkvfCZaqNDrYxCXIDucXgUSG3IvcdgD0bThFRjLuP3kBdLl1yzZA
	IClfznxvf5dIyBmK01sTZ29KasG6+XKKsW1qiNZ3P/DJ7r2u602iZKMaJVwlBiRIXiFygARK2hw
	VPvMggtV2J2Fa4tq8m4n7F62c8YHY/q2L4Cy9KW8C2aWz66RvTjqWF48lj/SdqLzciV0WuuqKGW
	M0HwI0XOxUbILRXG6CtzwNL2Ka59B+soLOkoMm2ZCpvHMMK60cyETq1IV0OUIDpINNP6Zeja7zz
	dy4cNrrowJDMdfN49bFpOtAiGLMUUktoZ4QEI1zo=
X-Received: by 2002:a05:6a20:6a07:b0:3bf:bdbc:bb0a with SMTP id adf61e73a8af0-3c03e21c329mr9214406637.17.1783313761499;
        Sun, 05 Jul 2026 21:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a07:b0:3bf:bdbc:bb0a with SMTP id adf61e73a8af0-3c03e21c329mr9214364637.17.1783313761066;
        Sun, 05 Jul 2026 21:56:01 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm62052392c88.12.2026.07.05.21.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:56:00 -0700 (PDT)
Message-ID: <6b691eb6-07b6-48e8-9952-8a88e315a5ea@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
 <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfXz15GGaH9yLBR
 2yUCwvDg2GXUXWJzVRfUh3Ox8LcxyKVuFHTcWMqY6mPwOaSBnAcwWWypwN/Ga0aE343wRcZbn2S
 QRJ6yhjhFYSJpROokVbopYFGVL4UTLM=
X-Proofpoint-GUID: 5IWVQueWY90V_MoX34yxZQhIwh-xex4p
X-Proofpoint-ORIG-GUID: 5IWVQueWY90V_MoX34yxZQhIwh-xex4p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfXz11XiAJurWT+
 GAZNnPKR8RSJSEIvf3kFEHS4+TKItX7+HF/cVf0oeaQUW/NLPxV2W6rouMyJrrjpB0jiy/vAYbm
 yZjykbU2GQLkv8UjxLhtB5inftUwWHH5d+U0tJj+FGWkVU2SOHLGZQzFUAUupPYqOohoX+zgUMs
 zU9W6NdfEMmT/xgBzECvY0Vo0NNRsZ8P6f1YE9NesGyjIgWr0a1YHydn0ACpWDWCXyk62eFMOIJ
 rsCLyBcCHDrkxSnWwJrwpxY6I8xJZEl872lX/4RcG6e5aDw2+6KHraaNTnTSsYKW2GmyGwmF3V2
 y/eOrG9yPd/Z5oiOn1j4gyD1ERLkWPSzH7V05jW4bxPxsoCevCnoedfVWU51eelbBgV26wxhYf2
 YsuUgPrJM+M7E1KTaah5w2HDcESmNzou7HGB8gGB78BhFP6Q29OEG8e1gSFeYqjHNRIQxdUTFlN
 TxqapT2PPyypCs1WCyA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b3562 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=tZh_4sgZHyZb0SdsJiQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045



On 6/22/2026 7:30 PM, Konrad Dybcio wrote:
>> +	/*
>> +	 * Maili-only clocks: NULL here to size the array to the highest Maili
>> +	 * clock index.
>> +	 */
>> +	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,
> we have:
> 
> --- common.c
> qcom_cc_really_probe():
> 
> ...
> cc->rclks = rclks; // desc->clks
> cc->num_rclks = num_clks; // desc->num_clks
> ...
> 
>  -> devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> 
> and qcom_cc_clk_hw_get() has:
> 
> if (idx >= cc->num_rclks) {
> 	pr_err("%s: invalid index %u\n", __func__, idx);
> 	return ERR_PTR(-EINVAL);
> }
> 
> so I think this should be unnecessary
> 

Though common clock driver takes care of the check of idx, in order to
allocate the memory for the new clocks present on top of Hawi, we need
this piece of code.

> Besides, is that new set of clocks actually unique to Maili, or
> is it bound to a QSPI usecase on the specific QUP?

Yes, these are specifically new clocks added to Maili.

-- 
Thanks,
Taniya Das


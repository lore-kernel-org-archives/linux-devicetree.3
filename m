Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EF82D29C8
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640462; cv=none; b=fVU6Bnfn7BiIj7ZsneY79s1eRJxiFm/x0WpAZQt8hxXYYemdICLycm0J5FcAqilcqiisTMMds+GWUnpJormNo/gpkARie+3rGIVf4RSZWRQhJqF62hsj+AvIdnr2cXlsto6nnxmy1fUxSST/ggF5fQcba140fu1SjRzXWDfwxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640462; c=relaxed/simple;
	bh=CX5oI2pqEyh9d3ryopeYurnSMROrTwXOKqM3hBZlf5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0kWQj96YQnJ8DPtL7xPeaN2QbqCKiiMxlOp8dh7YlP9xGkEJn14dm+zJoTefyngaTEjl3qKwWqFWczotwE5jh3u3RdYPWa9YrfE+++gTjx3xZ3zxkcrjowt/z9fzXoLJQc1k4e32KJC77Aj1tmSzk7FpgzjMcjL4OUn3BNbEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkZ0ZVON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQG2dEJj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkZ0ZVON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQG2dEJj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387YP0x1259479
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=; b=fkZ0ZVONVJpl8dZL
	Uc6bqguJWU12pzJ80JI++gkVZq0I5OrHsXzZalT0faDWok4Lx8y1YXK1OLb6bZ47
	SXmPJBZlnJEydP5Oe3c6l549cFPGOuOymc/Xu5z+nS+nIDW5t0tnONWmyt9FKTBn
	61ZQRf+xOvkyF8ZdWLsXVnzU/5YUfs7u5VZgHwgxUB4l+yi+aq7A64RWybjcilFS
	29M6cpScnczJL0L+67d11fRh3siVO/7s68gzw+Trpnv89WyiQ1PQ72yKWz3HjgL0
	MzzmDlLJF/4bTO45j/PLv5ug3Ltp37Ijh7+FDNMjJglGLj5y++5aKPg3L1HV7WCI
	uz7uMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsv0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:27:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d45ebdbc9fso140554585a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640460; x=1776245260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=;
        b=HQG2dEJjN5p/LPNNOXj3rhnlorWH++QkmzeKUz3tzh9oz3wlxfwoF18g3Lszil3x0m
         WhDnvlMJDIKny+gqltsbR2k7dRB0bkRFQgHclIBiXZKg+E2P7uc7JVMv2pleqlBIorhd
         SESyo+QGYDHME2rwYeTXMqUtySgU4kWl0TIw+b8Ws0y883l4KQ+p/znUMI+AX0T84oqb
         rlNV/FP7nb/NJsg1rItC/Jwm679dpsx7bJKmeD+Tg2Tb07bNNHbHkTf/dr89YuDdg+yq
         pDIQsaaHFdYO9X/tQoW5ZFV3bpBdYTkjlND+HxIR9o63T4nv3s6XoxGCv9WM00Zk2EtE
         dGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640460; x=1776245260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=;
        b=NY2GWgM1f8vmWBKm/ZrTp+jSQxWVyV/sx3gFHpHmFHYeLN/HWGsynCC5HtGido+sTO
         hMaRyZno8hLwZbnB4qSlTB52A11P5jaNLpfMnWGd4DUf2w+OpZVBUTZnR7i5aXzLDb1v
         D0z+yMxq0jKpSyz8hZHCBqjlHlcXCuJz327103qCK0AGIS8Iakwe5y44X4R0K2PyAwmy
         WRJUGk+L1JqfWJVB8905tYT2mc0O2S/tjcuzPBasGstrmTzgZIQOYs7+EbSMMaNLWhPu
         UYNzLdU2bjDEbCiumw58lo8adDlTcsoQf+xowvHRR6FXauy3YumLp/PB9obA7gT3IBfz
         KHMw==
X-Forwarded-Encrypted: i=1; AJvYcCV6lhsSNwbuiQEMFCOt4XJGFwjFjrbxc887JnLYiVk4eCXJvup0qml8WuPJI1iDncSWtb8ZnYR+2Otl@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmrnmkZrF1F9cvymI00CmfRwJ6ZGHQRY8cq8hu5v6t5477EyB
	iIpxLCp2yRANgguP0Tc7oyJ9oEyzneMRJdPVv9mHnp0MmcdgFi3bxP7/Thq8YAwFZLQKP9taqrA
	sB9Qy8paHtZJlKZv7AmSoJCWJn6SiYhdbo4anWHQ/li598LWbfIM8E//rWQErKXbI
X-Gm-Gg: AeBDies3y9OM+FoFqEO0dwEv0LDeGv3FJxFmMMkvQHrfFQofWICfnfDz75i+PZoVWsK
	4Rm82N1K1nyeOOgHrttawIikrY2tcg5j61NX6KTOfcTFiPuCefb38RxF4g+C+nHEG+AYASmhqgZ
	mNu2NXOeWJj+XskjKI4JThGONHercRzbv5dMpwBJmjn+Dl+EU6dkyuDllke47yhGPxTr4EOhUFd
	RZYeLlrCPTNKFQcRcdwszicdiFagRccu2I43tn+gj4HbbuLWtliVWRzii9Sd1kACD/vTYLnpLjX
	nX0yhJPja3CIwPDfEBpDRFxW3PZCeAsC58hYi9uX+ZfT0mNtY8kuidzyNelBynTmxOiwgm6zepm
	cgCVCILLDtabXe6FifG4yBqLbWK+4PnK35b6n8fYk5xfDGzxQgxZ0UmEeum9n6IMmYgQUWLPqnX
	hfjYQ=
X-Received: by 2002:a05:622a:1814:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50db003635emr32335691cf.1.1775640459873;
        Wed, 08 Apr 2026 02:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1814:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50db003635emr32335441cf.1.1775640459351;
        Wed, 08 Apr 2026 02:27:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5202505a12.22.2026.04.08.02.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:27:37 -0700 (PDT)
Message-ID: <f07c3b39-da9a-46b6-827c-c8287916ea61@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:27:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OBzkqJDPlZ4tpmw-4zoY2Al1VOmtyOM0
X-Proofpoint-GUID: OBzkqJDPlZ4tpmw-4zoY2Al1VOmtyOM0
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d61f8c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=cmy2-XsDip5EG_5K_9YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NiBTYWx0ZWRfXypD1MLGGPJjQ
 ras+P+D115PZH05W+fMbPXpEawuIncF6dlxGyaxda9YO2s6x9OTR9HZkO9UNEiI/Sl9PFGjGVqn
 d1VuZMaV2GZD6bGk876V7jP+FyQn+2tBx70zoLbm2csO7v6ZJVNaqsvr85ozhfZKcwyatiw4Yek
 rOOWF1K+Fm8UgWrXX7ODhHEaHnt4pQAfI64odsrmUfqHFgR7HvC0mGbbyA+6DTEeBhKxjJyamF1
 f8+YAjcR+6usYpDbP4vNTOBNrPesAqguPTP40Y7uemf9lq6HdNWZG876PEFeixwU9u5gK8EJPDE
 cLDc7NjROXMLYb5fjEdtvshY0UDd3kiL0YBrm81+dPqDuW4zgum6NQWbLfi4sDGstgUN3VfRYNm
 eWGQCdmHZxxe099TC1JGdyuEu0yY0j0l2jKE1C3a7K+rQ3P2NtKCaBQp4iuk6YexcOoZ0p2ollC
 k+/+twu9POe8B9SyhXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080086

On 4/4/26 2:55 PM, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

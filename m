Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734E421222
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888481; cv=none; b=pcbI39n0UmcEEfM1AccR8wMt3UteNNYpL39Eog2itInGbzZ/RBFX48dhYQBA/Ta75uCMRBfJCBRYTjeYxjo31iBoUCQdnTphq3GxzbU0va5foJFPSvgXglC8nxb5LaBMd2axnEqg8wbUwtep5pavOwbkFAJ9XtYSRNM2L068Q5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888481; c=relaxed/simple;
	bh=RajtyGnvqSZANrMBnJyOPLjvBP7Bm9/LvSNzKUVqiCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pq1h/PwpSG2gUEr6vCGU3kVV+LBmisdI9dL2qZ/QZ2vuJw/V0SlYzXBF/Vovp3Tp/NLOspV9uPua+VF3nJKhjCUgpTQFduWOjpj6c6wobDS0r1VAAIuepp2d0ouFSWckiCmQM3/BpYOANLvSD7Rfq7zbFNZdqYJrK3mDGqlOMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRzELO4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXq2hZn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRzELO4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXq2hZn3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADUPE2720574
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=; b=ZRzELO4zyihGjziS
	72Nlcb3z3s0+7l5QxHhHql8T64UTRRfr1tJSs5oO4pvzdqFpnt0Q0lSz1yZCJ1Rk
	zPoFELxhAyJHMfDzMoWWYVGS19pSgrr1AucfANF9QRSXjew499/Kjhdy/8+WRkXS
	VyJmFHZe+EE72oXZMUjURfNlPTnMjJ9wev1IGseM0595zRpY4m/6a40E3neQGXiX
	C/qCPH4AQGM6lcR3PpoRLJwHYa0/V/7rE1ChdCFBWCj7UNWP57rV10MMBTxlyKlN
	ELS441cdSCt5nL6YxPCa7G+Isc0y9CTYr0wcf4P0qmng5npxp/IjnLE8UooRoeuu
	kgqN2A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag23s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:21:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so471191b3a.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888478; x=1785493278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=VXq2hZn3ygLz2+6SnjffKGSj/nNH8bSEUST0Ulb96xW1bfA821cESnLpzJa2hn7PlA
         BGhnWndmahZ7czVP6FIyvfruQul61HQ5oa+L5ZP1qw66hVxR1NTwWbFuEWwELXGXiSLm
         QuYF7XSvaesGrCDGBAD1VCMFyLZLhOwd4agEEuRgOvaRk368yt2Oj/bOWQgbwoIDqz8I
         L94a9gahC9xE1fb/FS6O27O6wFZwxr8ZWUboQ5mzM9SSNLSVhPBqr1V6ERe/q4Q4l4KC
         7gNbD9Zh45wYJEe0HqtsBShOB2v7KgvtW/K4i/Imrl9ZEeZFPjmI7wpovvNCyjoACFtb
         1nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888478; x=1785493278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=DTSNEDTBnwLYQLl0ATkbBm3d3IQMmgSVTpvdCYu8F45LhkPcBiJI7y3ezhdI5eYDlm
         8QEGXO5OJUNVFf+XS5whL89mLd9dqWK2QpYOa/pHbo7J9DNg1xeDbh2gdHVB98nlIO0Q
         jBNsGrzUawzD2Q68N4lp3dh2eqfdckGOP3gHMvL3mG+tUVrKoue9XRu/Vbl2RcCAPksR
         ORuYHR23CI7/2xqiibJhyDS5Uv5wnhedyi7whsYRnZ/oFSuN1zb6RUdmCq/pB10uQnME
         ZLNukSms780ZFEsDzrRCylhClwrAO+Nw0aWHlhFJQNNQ/lZvjj3ZAaKtz2Z+qTQdOp93
         rQSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcHwE5FFpKvqnZJ+xucxLevyjE6k22gw0uf7jntTrdBe2wVQXFSWdpOl/IXUS/JIDYqGdE/1D5/0WH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhanm0HZu8Zzjg+R6gjRGcwYmEVSxqnbStm1VLmtBOOdHIvKrm
	NjiyBP3Bp/wuaxs63gqiN68D5FH2DDPDLPY6Hp+v2eC7c11feBqXXybkPorPfvUjPZqH4s3CjA5
	VGh0KHLCnkZS83f99jb8dOb/puhTXQBjXWP5sck/qOt/10n2toe3UqtOPlpvTuFM1
X-Gm-Gg: AR+sD13/gI7i6ePNpxrg4rDS7GeRT5Qh7PfHdn1gesrFgNPuQ3NChIg/hAEyh5bJJWP
	4g35vvGh8fUc2viGJRI7szcNQrAuWaYB2xHYe3lLOBBkjLCuJiGWSy4hLcGnonTqpfUMluaJGFp
	dcvdPhysgGXDOsYpqGOXuK4OpwZ0TpHrt6Dja6IjuDhoKio1epErI965VaNbdyKBehfH62pYIlp
	8BcsOdgPNyh47U6FZQ6++1pdMXWTjN6r70q+Y0skHvfEt5uaM0Vm/II8nV1x0TRekpocHjlmTV9
	UYQqJVR42krWq/fl8tXqSndZiMYa3GRqZWOlpqp/5osn0IcKW08F8Y3kEWROk7tSRhbwrtJN0PE
	f3shYRonQFiKtLcOTRN1JcuWtKAUs93Y=
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265050b3a.71.1784888477633;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265010b3a.71.1784888477145;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm4451448b3a.48.2026.07.24.03.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:21:16 -0700 (PDT)
Message-ID: <950e7499-fc8b-44fd-999b-d3197bc92308@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:51:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX+ZZBYclo4D3W
 MMumW3fRXJIZFN5c1SWlgdhr3edDNUU+9tR5sYAqZX+UE9n6631LXvA/8Jl3vYKNfPXBcPjF1av
 vtwTuUelLgvztq1RqVDlAa+mVZ50UrA=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a633c9e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vyOKmKYE018VkNFVGwIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: i0BZ7BYNlNgRwVjfhYWjK99NtM6QBC4q
X-Proofpoint-ORIG-GUID: i0BZ7BYNlNgRwVjfhYWjK99NtM6QBC4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfXzeK9wD/gs/Lf
 4q9gIOAU9GOSu+Px5ajWK2Im/aJLd9fV5FweeElonBoJRmR524WbU0ZXZ42n93B0qrH/5l+kEIE
 2GVsWzmDwDhc6Nq4KznwjFooDZ6QFehi2WuNgGyVmKar5SG3bAdpS0rav/y9C9d17CtdM91LV1s
 EQzAGVNgDZduPuHN+GjFPinbiOy/WsDdAY9DRyW++zegTsj4SZktz4L7hXJvpbrCZdQKIoDr/q4
 9v0HFRS4+UFC+8Qq5uDuyDTx2unKkPoLmjJE/CpCYPElIJyPnduiEmtgNYqtyfuyZV6/V2tATEz
 bdSFvsts9z9NVYdvZ8GdHKXISwhiy7sML+Anc7+rL1uPgKReuLSrdYNtGw9xocAJBXdmCTniCuP
 ddbqYjxmvGKuRGBhlPB31nbnOUqC/vqi1rUzQCo+QpWC9ME38cLvsRrhiPEjF7TorSL5cEOlshG
 +3bpjKZbPj1PT/ksdFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240093



On 7/17/2026 1:01 PM, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

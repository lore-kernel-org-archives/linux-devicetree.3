Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7EE4E1401
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449772; cv=none; b=qtuhIiUff02Q/Yu8A9omRP0JjmHiIEr8Xdkj9nrrDLQJbRz8vXo2Fhu5jS5OvDnM2tqVEfce4b9t7MmE6drEXMPBtx20sSiK/psXQhJSoJU7r6KSWOO1WUBvWYOPJK5wCNQBgsPXCixC5RTbaokfTpShk3NUMc+v5FimTj77PTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449772; c=relaxed/simple;
	bh=V9D8GuQ4SakAuLfzhLF1uQ1WBbPG5alQqM4F4fDdBwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jObOKy6g11vpoaoBHbKR/CMv06FHTWQZqyhqekQ4gss4KSnf29ZK6HYZJkXJ5EDMEHMIwWFmwAa9/6N9iA3BshWrp1jRNEGlIyYi8JvBXlmLHfBgrgVRO2sb3G/6estCcv8yi4btAfsSdfP/WaWceXqrzLxfksHq+VJXgB4i0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmDVb7Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2sYsZ8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmDVb7Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2sYsZ8t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAcqt822662
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=; b=QmDVb7BhKrLHB+o4
	Cz5WHcLlAk9fc2bzSukd/88uzvcxxndoLrITDeJf1HEWZQvkEliL+gHBewl3Pf+c
	KvCrngAwQaPSICfImGSrksmjfzNdlu4n3PlfKv/DR8CDMTTfBkyP2hJ2E86ca4BE
	CeIeO9wUPIg7kA/LkS6dMEaaRuWhJm5q2tZ9RiAjGab69Q5AXwtibfiee74XwwGr
	HTogC87BnILx5SjZA/2sTuZ2Ep+fWAaZvASP8L5lB0q+2dtRYbODKl3xLE9fdQYW
	wHNVYi/fe5CVPGnz1WpX+N2tS7DY/Oq4NJaqKd6MwtRt4xDLWlk2KNUVscEbRJYY
	ATQrAg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p71fyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:36:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-853d0d87123so1840006b3a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449769; x=1789054569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=;
        b=C2sYsZ8tJdNqlPZVtlIU4PNkccbwtynNCsPPcrMJXDg3conKV4h7fmNQ1V1psp2ww0
         qbxNpRcfDKJzvPWNS28lTzYxs5nw1SmuwDJPKg6t+QuYKajCqlSN6mc1nz0A+iIdjR+M
         BUJ/5s8IPxJhzm1p4bY5O0OvB8d9jp2bPQwmlArBMvEjfx2HK8BdUhaxvzvT1BEeAYIt
         Tj7sDfp9dSv+2J0PDakdmxmYdeAmz0jttCpqpvm4O8o1/Uh46Jv19jmRfKQcmp43keTJ
         5OdujS8FINWbWNM0+JRRIDTNqjNKLbnlBRXrVp/VlNhcigldwjOIAjvT19f6WMzeuBDQ
         2B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449769; x=1789054569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=;
        b=fjmqCgmSrRRw9ScGgXNCs5tIRmqMWd/N5ZBzZDuF6Ms3B5QoC+dFF816EMeU2Gvnzr
         Lfrv00Ul+zT/cVh5I/K7YdSWHadWcGll2/6c9MzL5oDW6A3itu1SVKPS8OgQQ1dAkGCy
         kuAeQj51fhSPA/mfW8EgPs+08mjQ1wdsNfECACqMyYygJz+qNjXmKE/gnVYMrhCZ+CW3
         pkN7OgZ39Y6bwey1q+hGETmta7jKPrPOqY8eUAcdRaI4ynlgqANHBUY2YXqy32ZAus6n
         CxHsRtDMWvJhcepVmbf4k/qDSya4Bti/tWQ3+seI2Fhi30tdCXrhD4VMfGnPdBsYM+Gt
         92sQ==
X-Forwarded-Encrypted: i=1; AKwUvByvoJOapqVZJSAegbBUBuf7/emQnS+XDFNHYNt43/gAbCZkA53OE+zsOFNwvArTS0BZkFyevt0ixaSn@vger.kernel.org
X-Gm-Message-State: AFuF++nLILNs9qRP97MgU2e9oWpSjB/tc3f8Civlijr0n7QfUZ3l7J+4
	7qAfbqWWHpiWAKZj60TXGeMPUxl+InYmErLg5+sW2h03hVeAlhQDLva2K1pIeO+gP/SdHmNFfMZ
	JD7WZu4VklefPQanXlEfwyC5KT6jYO68udu5/cnSx9kiLf/FiE4czGxbui8MDIbEQ
X-Gm-Gg: AYBFou1qW/ReOzLj5E3Ink/ZOYB3puWB66OOrp+TdtdhGG8NX7ZKFFcq9Z4fmU1wy9y
	Yu/pEjcejrD4rbkIh5R1+mWRjsbcxLnbTNxawloj4EXoOpVkqy8NPIYb8AAE2ac3ACA/VgUdIIu
	N2bOlgA/NRLhUtlEMpn0AYORkvCsHMs/Y+KxVOyuzeBZonpWaMTvgUdRHzR0TTPM6r2AuB1nTpK
	Fz0xXPg24o6X80x9NExAYKLiG/5swlyY6YH2IIqPAlq5Z8ANQJqTVGD9bP3i4ftlUfZNGs/wC6f
	EjiXT5Vv7/hKrta1XukB+vA+xrrXQg5hph5802yADQxIvS0kkvcAnlr99yyh+lKWqJMUHM0P1q/
	wBcZtrDi2ekfrVBP423uDjOEXqIEiuaOTtA8wc3705JqO1CQNBYhhVr/Eqepsb9w=
X-Received: by 2002:a05:6a00:23cb:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-85ed26e5420mr17401923b3a.9.1788449769125;
        Thu, 03 Sep 2026 08:36:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cb:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-85ed26e5420mr17401830b3a.9.1788449768573;
        Thu, 03 Sep 2026 08:36:08 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f872269sm105836b3a.6.2026.09.03.08.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:36:06 -0700 (PDT)
Message-ID: <d9ca8f52-b00c-499a-b924-49ae4490b4dd@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:36:01 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
 <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tHiRuKwiiJfSg-AWeVq4EBSL8thuIjYT
X-Proofpoint-ORIG-GUID: tHiRuKwiiJfSg-AWeVq4EBSL8thuIjYT
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a9993ea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QVThMpbGrsNalZwocfEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfXwnx5O4UgD6oS
 HXOjUwziUDn/cwdjs1YIJx1xxovWmebQh0IOAhRW78nF9zi6MY4eM/O9gcauARs87GaviQX9d74
 4rWvKAj4mfYFwy1t0Qa5AWtHX+6hogU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfX4uDg6syDS4xl
 c4N4xFKI26BCcXS08d9pH6uGHYn76cajZfJGnuMvgM5TRyieko/wNy8Ac+1yMKQeR6rj2zsPBj1
 TW4prmsTWoeT9ETNht1uqpnd3CZIzEIHt6YDH5OAJtHUxRRxhsmNDmHjPTygqalinlLexbrCTqp
 FMa3FmKxJE32/kKBhvp4LAqt91iB80vQNx2oGcBajq5rxRGVD9L8MxPXmJ/cByFcoY8jHuosWce
 wA1lVpo6itI8m1LxgbPS13IcIyZqlyRyz0pW6p9JVHy7Qgvd9N7HS913eTIoUWTyZnz9JF4YXtn
 roB3tXealCemOfs+ZrMnjqlSR2F/KTSFyRflDlQmXHk1LicAI91vM05/RVDp7bjRqheSH9104S6
 3C3MQQy7L6TkNXoLxDoBlK9/zMrk79+M6kDTekrPxVCV+NmDXKKpRe4wMbZxcIkjPl1d5ZxLXgo
 Q98v/R+hJWk/p2AEXJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030135



On 9/3/2026 7:59 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> Some CMN PLL output clocks require a hardware gate in addition to a
>> fixed rate. The gate control bits reside in the register
>> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
>> new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
>> rate with enable/disable/is_enabled gate control through the shared
>> regmap for CMN_PLL_OUTPUT_RELATED_1.
> 
> [...]
> 
>> +static int clk_fixed_gate_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +			       BIT(gate_clk->enable_bit));
>> +}
>> +
>> +static void clk_fixed_gate_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +			  BIT(gate_clk->enable_bit));
>> +}
>> +
>> +static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +				BIT(gate_clk->enable_bit));
>> +}
> 
> This is also all just clk_regmap / clk_branch
> 
> Konrad

OK. I will use the existing clk_regmap/clk_branch infrastructure for
these gated outputs.


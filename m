Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174AE13790B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782192350; cv=none; b=fObjuVYl0mIcmWZqS70inSlWx2TstVtZidheJiE/yWjRD+iw1DEitiLVuSS2Q6KwamA39aDWmA0sRyD7QD+0rZCDqNnuTAE+HeKnCL6BRmH3WE3f6tH3JmLUWh3VjlLaCEQ0nuweV1j8iEiQXuX7lWneFetHVmOZ7H5kb64BVBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782192350; c=relaxed/simple;
	bh=QPclMq6yipwkPj1Y6BOJ7Kw/T8v7Va2JBtOWeCrz4qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWVQl0ICAUKEjEiV2QkZgmtKGufq4N05s1XzRQmfAXhskc6Kv7bjfIKRVApTvyCHDJCLtPVW3Yvr8meRPwIufQLfOBgKa5ndOpk77kj/Czi2k9XcsU8m9n1GMvZOfOjo/rBKsGZm1JyCfKwjkrrmq9CYOJdIRMICJwBjrDapvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtTT5Cfz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9+YMMQ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtTT5Cfz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9+YMMQ/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N1Y5g92672716
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zoIULz17ekYPmgM7r3aqGaIUb99WUo1F+H4X6IxzHQ=; b=TtTT5Cfzq5wMAVL5
	48QIkAJrg+PJn+OH8Lr9vRARGDHrkaJZudOi11NCWV8SswAkIOxNMXhtRj2NRCmV
	Gyeld7M/GR/+ZvDdGdkal32bW+ayWoF7qBGXkXd9hzUSSz0i+czvLz6SOl6V66tG
	8Dd3+ysvZUCzRJPxNmW+jYBRDvqckVBBexPEepyhWwqiup07rlHH1Ln/PbajMsTR
	k2lH+pAz0PdRoFRESPZrVUD+6HdtB7G9bSg9+NOv1ZXZWCe7g7fdgvW86eZ4uCdn
	Zn+/bY/Z1BKW6XrT+4C7L6QadXpUsRvAHYRxeAUuqpl35XdtbHzeXoPIoKF7DA+Y
	G/6LjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjgnep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:25:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f6ff639aso1320535085a.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 22:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782192346; x=1782797146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zoIULz17ekYPmgM7r3aqGaIUb99WUo1F+H4X6IxzHQ=;
        b=S9+YMMQ/wEl8Y1OlUaSb+N6n0nqgs89FUGU1FBAgKIFdUzayMA1LAIDHyakuQEj3JE
         dn8ylv2DdJsZMdd5GYds/YTtdXc4X6wgY1psMVdXkEqalpEMrxLXUX2X7F4/3+a33r2b
         zHT3NdCZLw0NMaLhwF63gO03EkWJXPx2quaUNnf5y6oxcaFpV6/xjKq6ZDelQyutURx4
         mC79vlc/KArzT/a1JGmH5jHHzqnohJZGzQ/BOoFI3Ch1NOfEidhkVUEL6XF5crYWgqpq
         ySRTsqamrJvQSfm1/v4lKxwGj9VdkT1VrBdHlUhRT5TtxxsOEOQn8FE9KwBpilp2dBYK
         8YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192346; x=1782797146;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zoIULz17ekYPmgM7r3aqGaIUb99WUo1F+H4X6IxzHQ=;
        b=dT+1K8msNrF5D0ZpbTOShf8Pv7/bkHGL+mPO6KA7pT9pzdo3wKuwm94jxS9AQ/VKQm
         frMq22fXObH1tiLa0R+n0sOWpbqNnkjP1jRcP8PNTFPOzHXZ/zuUl1Qt8i/0XRCcp2GW
         RoLupJ5MUBDzZ/5VvB6lnYwvIBstharoR4EyV0DWlUIDfUAgs1x1akLupVRX4XGMu9MW
         DOw63mnyjCFbyNu6VpatTeIIZpRmT0OmnaDgKNdwPo515PxVmkreZIUEfGdKJRK4MUiD
         gKCJze7wOIN9t6eWPL62UzFwh5Ho2HL7Gfo3hzqI5tGH5mx547P+TDfkcRif8qo4aW+8
         y2Bw==
X-Forwarded-Encrypted: i=1; AFNElJ+hu0ife1M/rWucF/yEBSoUmXtJTW6kuT45xRMyzDcfwlVVPV+n3Td0+IbZZlSDHdTwft4DXX+qm1GM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yzr67Nb7bX6Ay/Xq+br93aOSTjf3TQaTBbOx73X7mXdwQyPJ
	RSHlDEp2bMSwpFZP2H0+hH4BIzhSLs7FQQzxMbbN5sC6F03mXzq5lEwMyuYUB1B1yTTfffP5Qm0
	NLrqMtE6K1MGCUcAvAQaqBB/KUWfl9X5MORrlzwDYtn8f5YCd9P5K+OazLQJJ2G42
X-Gm-Gg: AfdE7clFL1nyBSdBprubs8lQT8RItJW0AmdAggI/r9nTlyAGY4jn8SArfYeKEiNdBR9
	sRBxyWoaynOhCdmCdNRT8FQyEnx7Ka30KgeccLhLU9T8jz3+f/UWB/o3Zn5nF8GjMst8ZzCO709
	sXQGeYvpJuxIKwW1nGDe+8G41TyWGEkPfQAszMI8DpG5JkBemgeuetGjYrDoYDLrpsGA/cm59RC
	0SwF0Zszz1dqa2Xn2Pr7Yj5UMoF/XWqnR3P7UP78t+mSP+maO4eD8YlRZWo4eAf62XvsNfF0sGx
	69CMG4bA7Vvf6beJl/2N88OLrtjPaP+YWMgzt1g6uWYBPKlub1vLHJGs+fpCcbER3xOJDJPh4QK
	FSxOcjIFAWAZtoXs11HfIvFYOZQGq1HenpDhUkjQW
X-Received: by 2002:a05:620a:440b:b0:915:aa7d:42bc with SMTP id af79cd13be357-9266b97e61bmr158674185a.10.1782192346269;
        Mon, 22 Jun 2026 22:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:440b:b0:915:aa7d:42bc with SMTP id af79cd13be357-9266b97e61bmr158672285a.10.1782192345820;
        Mon, 22 Jun 2026 22:25:45 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm469575935e9.0.2026.06.22.22.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 22:25:44 -0700 (PDT)
Message-ID: <926e37a1-1186-46bd-9090-ded1d082535f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 07:25:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
To: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
 <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>
 <20260622-mindful-civet-of-refinement-02d3da@quoll>
 <ajl8YparXoIXL0wm@abscue.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ajl8YparXoIXL0wm@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0MSBTYWx0ZWRfX3LAqQISDwakB
 ZPutm2NBUYtx5Rmq3rB9ddoHwT4sWeFNwaLUMSSX0HToiYM9I+IXwuqdiuT+6qVpzWhxvELV4+B
 yd+hDJm39hV9lq3eWT1jBWgYi513XiK6Jjlse4gDGvg8pHLr0jhOhfjV90etjxhIGdK8lEGPoGy
 qOBeZJiiO8X/8b3exzxDYykdxMSB9ttwMFpTKaPLeGTi6j5qdSYYe8Z6nhHtZM033pSI85KNKkK
 E2cN9vRbJcgLBmvpvb8IeSC4fDo0y8IyUSzxyqjl0g9mjrKgu6DF3uGcM9q/IW4ZCJ19UN8DI4n
 lbphaFruTuMCE1NJvpZV1llcus6dJet1RKZKt4yHhDFO+bAOiioSXiuz/oPZoUD+GOTYSxXuyNy
 n/BtqEosnI6w+EL6MasQgF+KtyYOxHLgMtkNt80jrDP6XCFGlG2N01qd9QlWLraO4ulmkls+CPR
 6qVevaiQQ36PBJ5X6PQ==
X-Proofpoint-GUID: ncOBR8-MSd-KS3TywzrFiE_mFLDnNwJr
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a18db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QbD1Hp0j8WHELfzl3sYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0MSBTYWx0ZWRfXz9IIS9nziPAP
 TGK3D642b/kQjv7psyGPneQ55fERLA3WsDMjM61gfUN49vD0IrseQ4sCilkvJtj0Gl085ZH9GOr
 CxqcwPTiuiGYfpl8D1tNDC6oIndITig=
X-Proofpoint-ORIG-GUID: ncOBR8-MSd-KS3TywzrFiE_mFLDnNwJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230041

On 22/06/2026 20:18, Otto Pflüger wrote:
> On Mon, Jun 22, 2026 at 09:29:20AM +0200, Krzysztof Kozlowski wrote:
>> On Sat, Jun 20, 2026 at 10:54:00AM +0200, Otto Pflüger wrote:
>>> Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
>>> PMIC, used e.g. with the UMS512 and UMS9230 SoCs.
>>>
>>> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>  .../bindings/regulator/sprd,sc2730-regulator.yaml  | 44 ++++++++++++++++++++++
>>>  1 file changed, 44 insertions(+)
>>>
>>
>> Sashiko has good point - where is any user of this binding (through
>> reference)? Without $ref, this won't match thus is a noop for validation.
> 
> For some reason, the patch adding the binding references from v3 of
> this series was merged by Lee Jones. This means that a user exists now:
> Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml includes this
> binding as one of the options.

Explain that in the cover letter, if you ever send something like this
(or v7).

Best regards,
Krzysztof

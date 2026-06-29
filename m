Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E939D3F88B5
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726673; cv=none; b=XEOpqafOf9rw/0nAlS8gXnKrKBR+pCXfINyNwL19w6rMP0CZMdsTPReQfEZEHW9cfOhmDK+Zdsldj5GpYKdqkOnl3ba87auobWAosQ/YN4vkzbE8zPdwjIrljV0C1UUMHyaZIwFjyWhgwBl/MqKpgDr2NpJNZa/UtasnZ3IvWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726673; c=relaxed/simple;
	bh=clg0AzGHYAP/V3MGodBAGw/7RE1WclMLvIgKBJ9RdiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi1QqVpTENQcV5vNcNRIXR7Oiih63w4ZAR4qLSOWU/TeRurRPiyVjtsBmSSnjklGgor7Se6kJWAOdIPoZg9aWPyAypw29nJLD58mFcrSBgmJnz0xrYknsuj3c8Zu95W555+UMFAeAQYf+hI0g7CMyx/A4I49QO72wC+y1Oc7aWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4F7cJSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/beJeHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4F7cJSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/beJeHD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wV7C2391251
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=; b=m4F7cJSsDLVJ8KQR
	xRAK8vfkJtOncPfJ4Of0R2q3n5FwWBzepSVlDxzpMsIADkshZgCj/oeIzaoZviL4
	EwJYZESsriOFsRzC1Lvc6ViLV51T+3U5XK8d4UZXPusEKbgTzAwjFNTL9HH6KWqF
	9CMtL7byypShWGHjRDEtc6EbagtgvlDsr1WRXp13wvizwHAI++aBrGqkomlc0QZH
	nPbxi9zp7wF2+dtDkPXxFq1mgAiTPH/TYmAzKukwgrqbjHiD0jD1PkJYFfNJAmCf
	nFIWDa2Dz9PU6kYAOJjWmleIBu6eBJH/ewzSf+rfAuNy51L7p/302uQpUABPix1l
	y4M4Uw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw87pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e566bae1bso9772985a.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726670; x=1783331470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=;
        b=I/beJeHDpjYCrgx2O92qmp1XXZHX8gJJtbuhX6ZIQ8fOGWRxjyxcJzAMsyMFMojVJN
         RvCtH265BIvn3bdFjACupFm0ZfQnGx2VLdNwvcxDz/mzs1MCvpGMsLsT1RSYqy+9TuSO
         9Q/z+D2n2iw1ZwHANQ8S4S0WA4B0KOPT+A4CfFA6LstTUyY3DTf9W+fjMmFnIcOQciAN
         mFku4qkzIjxdLY+CLLbHqsOptlZMtMskm8irnfKIMZO1m4ZFn7+EsHq+Ii2jtbqzDXUI
         UMlcFYBEd3DZu3WnDq3yAwUyWtMcZa4SSfV1opLgqX1JR2M133DxZkzmavvHgLbjm08G
         yABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726670; x=1783331470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=;
        b=QWOP/5Uv/1j7BOdl4Rq0Adza6quR+n+8OHsOXof0JEEvUfCcGnQtK9yT6OXA4TTPjm
         VZFUjQajmBXTChPETUYUIRbu+7f8I53cAXkRZwk1wV8GsyB9ushmHCOXKkmEfacaGwpz
         IqHfdTY1esDSb0zU/0PMEYSKitalc2Ev1KQG2iQO3NSi6Rp65TS7kEqBKzKQd782uOF8
         xwqjIhAar3QfONMxmpJj2k4JgNSbN8FQBgnmtQuOQ+eaOb6RK3+55Mfmh1J9Eh/6IkMq
         Lj4eTmD0Xg/1apkX4uHsMBajNsMWdVvq2RZb7LiVj83ROUwPq5NtHbVPG+rWldA5hiZR
         k+nA==
X-Forwarded-Encrypted: i=1; AFNElJ97a6IjTEfmOIppprQrh0qEZKiEsowN+hWbk5mZw7hNzAR6esNKsl5nzhxqrXj4N/IfuMPUmAPIaZzG@vger.kernel.org
X-Gm-Message-State: AOJu0YzO3rjZh17Yo8Ib3IySmUe50zR/Nt402OgL7HOiZ+32HI0fZQWx
	LCSeSAKzw7QMpHOsFgw1o+sMZuhxhVOKTeTcVSIOChyCa/qXRsTVjkhZQgH0TyKPTVrrdSI1Uts
	4pyJGeZXWUS4W/3qvnT2LcKo0SYbva23UaC8LhEgs05jgMJw9gIvoiCphfIT1DWTs
X-Gm-Gg: AfdE7clEBKNeEBpMwGog9WJwVlM6oxXLbsTqY7EhrTgdxmiRcW35n5SgUmKja4A7moF
	jUAVEqpCUKdCM9SmSq6t3ZbPAFNluDvh0bt5Tb/cc5+pcY6KUOr/V3kU4C5vX491y94TPC7Q232
	urYo5xb1+S1j+uh/VrRvY2pbXeUBuzmfET4Ulk/wMFO8i9ojJX+il2gmyDDOYQtubyQh89GLYls
	lHR+Rf/HXatHob2ZipN5rWnP8ZESL8R0wePYXMEgvO+wcEGU0FarOf5Xalxr8yXke+F0zUwS3au
	KAVfXpqiR/c5Rz7e5ro/wiZflLrYSMf1jSux2n5XLEAgGssAFCBWa2s33wGFLJDPQG6bZZAjzzt
	Tvo673j3cmxWEF5yDVbZJg/sNsKhupeLLvw8=
X-Received: by 2002:a05:620a:2b46:b0:915:7c1a:1388 with SMTP id af79cd13be357-9293d8a98edmr1528682085a.5.1782726670218;
        Mon, 29 Jun 2026 02:51:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:915:7c1a:1388 with SMTP id af79cd13be357-9293d8a98edmr1528679585a.5.1782726669775;
        Mon, 29 Jun 2026 02:51:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba677csm744546666b.11.2026.06.29.02.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:51:08 -0700 (PDT)
Message-ID: <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:51:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
 <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
 <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX1zyS90/09N1H
 p2fJ99DvbBCF5n3McGCu56tIlDUVHpkGRIMVrDfqz1IPyANbDPvzckjSmHCmRsPoT+AYvbU4pcf
 IBNKsg4ytkkxCEdbkjZ57uF6yzuTsNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX1P6WWTjcrMCx
 MFYX9OZ6y2XBT6kGtfSRQcRdYs+xV9LyQLFc9Bp3MnI7OtR2WCpBxy9iuhoMXSq2LZZ88BY9U0W
 hZdFcq3/PJBKktOfw2Id2HWkhkZymVZ9+5rs/PqfnRb99JgM9q66SLOcHH1XpQQSeHSlLgZW/ZW
 DyT+ITB4edsh0AP+jw4ifqu8uxjlrea9cX6jWXrAeo4/aJBZoys/Q3IyJMIJO4Eu7/INlo9Qwoj
 x2BKDegI7O9bdnIHFzlEED/KX3kBp2to8+wUaXYHX4aQmOd3gzrY2odSGWSKp9lzK0/4t1gwKML
 BmWe4K/OHFWAKHlY9j3QclUXxQOWEXioAwAmE5KqBlu4Gi6ao6arquvqnl08fSgHccUp+cfdgob
 /12MBeXvIWTJ2SFU3Kbgv1NOyhmWXaJZfUAkZZqDweckJmXEIMNr3QOHBmm4Tt5rEs+kuc13t/w
 vU/2loLwNAL5z4wB/TQ==
X-Proofpoint-GUID: ndH9459urLL4jJTzYPYBGg7dejJCwI4I
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42400f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6UAb0L3E1jN75_jUm_YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ndH9459urLL4jJTzYPYBGg7dejJCwI4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290079

On 6/29/26 8:43 AM, Imran Shaik wrote:
> 
> 
> On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
>> On 6/4/26 7:26 AM, Imran Shaik wrote:
>>> Add support for Display clock controller and GPU clock controller nodes
>>> on Qualcomm Shikra SoCs.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---

[...]

>>> +                      "gcc_disp_gpll0_clk_src",
>>> +                      "gcc_disp_gpll0_div_clk_src",
>>> +                      "dsi0_phy_pll_out_byteclk",
>>> +                      "dsi0_phy_pll_out_dsiclk",
>>> +                      "dsi1_phy_pll_out_byteclk",
>>> +                      "dsi1_phy_pll_out_dsiclk",
>>> +                      "sleep_clk";
>>> +            #clock-cells = <1>;
>>> +            #reset-cells = <1>;
>>> +            #power-domain-cells = <1>;
>>
>> DISP_CC also needs to source power from somewhere!
>>
> 
> The Shikra bindings aligns with the existing Agatti bindings, as it is a re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be always ON when APPS is active.

Yes, it will be on, but currently the genpd performance state requests
(i.e. RPMH states) go to /dev/null because DISP_CC is an orphan

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBE31353B
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775467246; cv=none; b=cOoSzkH/PqL+RejaQrlDvj5QkWz526Kski3k+jk4HEHsNToC1/kicDTZO1XkaAdD8DUwq6DUatr7TGSP4jqPn8ZDr+IdBK/yf4jv7njbDhO+k/wrcMj29ogbou4VxQPXN4p4FtNlUCJk4GCRjY4gBwPbBxGGQAFAK7mOJhaaHZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775467246; c=relaxed/simple;
	bh=DCHRPKSmvuFc4FHBCvz3E0fZTDZUHBdIvM7B0LvU9Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fx+P+y7KDRlHGM0M4czAuUWASv3CB3Xo/vNwJ8/ra8vrGyXC7dZX2gczNaJpfoIQzWM1DQ23HV7CAlbcxpsSbpf524EtL0VldmQIfbYZFrnsJWyk7hPVo3k7OLdCg6dsCku20Nb6MYsw1JIKwiaqtKY3tW+vrl6yVPZXeH5bvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkG//0wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f39qrQUA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkG//0wV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f39qrQUA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6368WHTm2512035
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 09:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oi9ZzHP39tOQKwyOOyXPrvxRWV8ztbCB4HAl7sf3U+4=; b=TkG//0wVfKAvuxSP
	9ZjVZ16elwDk7XBW8uUIcQeyuPPUleVHNVYC9eXT/FsFopwNq6RhniaUGinE8dEm
	hFLmdoTc+I/S6esSJbpJ9YKhNAwl1JBWGmpMP3qGHwuxv35PfG8O70mZ9GNVXVkI
	xbGgseONmMNzTwuJEzRB1+9ifzpKQkUzGgxuTKp4EMb3k1t8OTLm0DJbDBr36C++
	DR5HTl7EKtLtwDy/ASEZhjuZgzGlMdxvyFR4kco8N8KV88OBNcTYhuJeD0tsMfJF
	+77wml87pBDaKeFl4u0xEFHGya3upWL/0dhfMVa5GiZoa1YWUCyUYV7zf5dznAkh
	4fuFKA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8ckf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 09:20:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24308165dso98130635ad.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775467244; x=1776072044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi9ZzHP39tOQKwyOOyXPrvxRWV8ztbCB4HAl7sf3U+4=;
        b=f39qrQUArySmPNY0EDXsWDIplRezLrecoVHevgiOzvGG5WdojjNUXEncRzQgGue8VM
         HOW7GL+MdZrth26zgkOyCWzjcxZLDvCHN3NA+6swrgr29AscPX93ZxmOHCeUjTAxCxbW
         ipDLzejT1yHU5JvgeSs/Yf/ZFjiKVAAQKOKoF6NvWOizLMINonGKhLIE8n7J9hCpJJIb
         0Xem54WtIB70rTNsy3AQX7tt+U7p0mjYPpsOAy5mOMmXvkk0GjRsiE+OCAA/1K8mtO8E
         bOcR82WmRBUlYIKoi7yfTX8A3HXM5IwiTSBIUfGKUhixc+wwxTPfTOct4pqLzZqJ20XG
         te9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775467244; x=1776072044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oi9ZzHP39tOQKwyOOyXPrvxRWV8ztbCB4HAl7sf3U+4=;
        b=lpYsNuJKCQJ74r427Xf3+eywUS4sTViP0lCoe8e8ZLXzKTPT9x6waljl+slBKplrIV
         0Xz5Xs5iKtoIhkszeGPdnVWFlaCL6c6jWovEGFx9Y1NX81P00IWDlcDtXIWHdWx7zcEN
         Md6BgOePr+kkF2rP2WiKEy/3LzGbf6CHFcah4e6OCGEeduUOxnoF8xdchmoNwx1CPbU3
         EnQ/7d49XrXuu4lSXT0s7mWxlrDs+slFBO++KpITwUQ6ai/so66kWqiUt0kDUoASNVE1
         5n0b1l+d2dedjc7XBXChU7KkORe7nzhQnM+Vz6Wg2pXFqFEboeDlgzWOlmK/4zMJOwDc
         NpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB0pxvdB0CthITEVw/TKQR2xaTwsnPv4TfGKLFrPFaFGE2I+GmeYxtB6eCm7qkrPgJaeCANjkOND5T@vger.kernel.org
X-Gm-Message-State: AOJu0YxpkfRvw0NiGHQiONQmvVVIMRBQvYcyrKvbwybHG0iJW/fQzeMg
	AmYW6P5Atpfl3iwRuibx66iIgF2wlXT0zKJAubPPR7BXbVizBqBvVll4r7mqgPDMCpuQ6pb5Yyz
	2ojeGQHnP2fLkEcF0XBk4HAmVeJ+a+zW6F/VmxMgiqWshKqre6RM9j29Xl+lHwkzE
X-Gm-Gg: AeBDietLzs+a7cA+/HMxY/qNH6pKb8jeIXKc3rHlMz0PNPmfStsX7l1UEdJigUaIWqG
	XTwxpUp/61+MZBkBmMWqZ802pGojY/BK7XfkJDoD4hiHCoHOJeTV/rz7KNlWh79lWvJzRGuM3L1
	zPjzcBxDaaF9ImJIyJzOx85uGE0HR2m9NtV+r+Qu4PgeFObuA9gE9SuBFCl4mx2yB5tOs3KjbfX
	P49GiRLY4lYrOSDVDx2jywEjGuiaToFzdb0hH01Hs+oe+NnTKKOkyxwRLiFAJZoPDNwA0nJYH2W
	JXH8uNO7oyZobqLrXbo9IO5BC1J2R3nYAliMvYLnsG36XqOWL62gTlK2JG8phIADKqnUGr5SgHM
	aU2fhNDzj8a0HlIfFQ5DoWhKf0lQEVmQFlDAvFEEvQvAXmrAzc5E=
X-Received: by 2002:a17:903:2a86:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b281706f07mr140727935ad.5.1775467243715;
        Mon, 06 Apr 2026 02:20:43 -0700 (PDT)
X-Received: by 2002:a17:903:2a86:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b281706f07mr140727445ad.5.1775467243190;
        Mon, 06 Apr 2026 02:20:43 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a3af9sm126837105ad.63.2026.04.06.02.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:20:42 -0700 (PDT)
Message-ID: <5d4e0b57-e5f6-4c2f-918b-7a23e50ea6ad@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 14:50:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
 <30327e35-6d32-4aac-a55d-134ed5271603@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <30327e35-6d32-4aac-a55d-134ed5271603@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lfkijBNHybA-tLIVm2ujlIIvjiz6yWDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5MSBTYWx0ZWRfX8h8q695WS1eN
 2Gr3H4ft2qkBOVGnU+8OKNee2/w647QWPqxsjjdEP3PSFChe5fO46TOSbonMvzo9U4dIujQn8v/
 9fci5deDSDL1pid3m8ER8MEZ27Z7HYyd/HfOGONZq5USPgj0+TSgufSFytCuzja1FIRfuj6em7i
 tRBOugO8rZN4aYVTUFnHrIu6rp8Sy2yhNEzuX2Qd4cRInhz27rY2iYolDdcT1iTInm8fIYeI8ES
 GRLGefrhGhvtLlTI0m+2G1cfgogcg63zi9qBC/06XG57F+Nz9O/F5XNwfsWqP6NgwllMoLhgwvt
 6n/bKdo3CK46p1n+C45apS661jyCJTC+mgrHrWuaOWSns2WUatIkgTgVBPFPUi4tQcZPJbEUIc3
 CEaJIFSVzidDCwuvktMQrGXtAB/snQyxnno7Pts5pNrKoQSgeqnyyvl3cQ1JK3bPWFwASASwZtM
 Wc8nMqjyeFYVtZX09wg==
X-Proofpoint-GUID: lfkijBNHybA-tLIVm2ujlIIvjiz6yWDa
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d37aec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CMx50Ybjb1gtcuyIV48A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060091



On 4/6/2026 2:07 PM, Krzysztof Kozlowski wrote:
> On 23/03/2026 10:17, Harshal Dev wrote:
>> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
>> power-domain and iface clock. Without enabling the iface clock and the
>> associated power-domain the ICE hardware cannot function correctly and
>> leads to unclocked hardware accesses being observed during probe.
>>
>> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
>> power-domain and iface clock for new devices (Eliza and Milos) introduced
>> in the current release (7.0) with yet-to-stabilize ABI, while preserving
>> backward compatibility for older devices.
>>
>> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
>> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
>>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Thank you for the review Krzysztof. I believe since we are targeting current RC fix, I need
to send a patch for adding the clock and power-domain for Milos and Eliza DT as well to
conform to the binding since both changes defining the ICE node for them are already picked
up by Bjorn:
https://lore.kernel.org/all/177432155637.28714.2511351512032518031.b4-ty@kernel.org/
https://lore.kernel.org/all/whoikp5tdu34gujfjqpopbhywzj6dvcxebywtwufip6jxdwp2s@oepb2y36a2hw/

Is it fine if I spin a v5 of this patch adding the DT changes for Eliza and Milos? I don't
think sending a separate patch series for updating these two DT makes sense given the RC
will close shortly.

I'll send a v5 today itself, hopefully Abel and Luca can review.

Regards,
Harshal

> Best regards,
> Krzysztof


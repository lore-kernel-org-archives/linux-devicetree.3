Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605296;
	b=uiXIpgByqDxYQ2Tn4MZq+afus76mnsz7QUe1hQins7oLNCJsaYI7zaRfgM3f2rUNwX8I
	 F98M38aXlcKyOM1sTWmOOHtdUwremhi4nywdvAJS/TJnhTxWOYRYgUJ+yuIM58PzDJAl0
	 sOHtUQgO1wnpDSWHvH8/W+udxwVMok9lL8NOVfCCcnWEMzyieKjq/szpSCwwfL/bnUFEw
	 Xl+BilYaOxIVKKeLmYrVMOPqTGu7/CZV96bMjuIsXonZj5KhkjN8/ZhsQFXTCMLsvsaEi
	 WV6bEZOPI5yZA2Omu7mSiSCjG7Emy1Eg4G/gu2btjIA+3jS7t7clBzesvibnIbXaIJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
	b=BJ4gqVaxyrBB+0fGV5rSDeWpi7sE6eoz6OxK7wKIwHuCgqhgqrxlM59G+gu8GXAbJdcu
	 HA5aRQ+1ewdoxG7SxxO2vZCvo4d593sVTvzZnf/qz8bePS9Ej0dPZYFTT/lXgA4QuNMXY
	 vbRwBXSEeiHAUWFL16aohZyq6Ms2HoroGGElwHwGJJrpLLlVFcfTowMuD6aDiIvEjERN/
	 I3YJ9gFOYMO4y80p1QkOWnnZaYLtl+0z0uTDnfI0m0O5/iyQc4d3PYLkEmGE88Es6ajR7
	 tIXFLk5+Vs7WCBaucTfHUa1TIgIEXiA+ny84RlVO6h+xroWkFtc16iTgCaIz2CCK12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iw5L/c5L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BongjRyo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98612606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98612606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iw5L/c5L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BongjRyo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNA8555519
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=; b=iw5L/c5LEqMKQlxs
	Kt++vdZNGXxSwIk+/wLeTfFOIwc0MYXU5ybGhgbBclLOlG8ydyNqc8EvjixXRsOV
	WpGa9R8sZUzhlzi1oGAaGPDXR2ppX/ZYjYzhqE0pfhKbBf955eJlAMRYqbWKOexN
	AX7Zaj+BMsWQgBWDnnVpueAwL9oA6YbEQaq9AgMkMSL0kKqrGeMFqV7Zp6eZ02YV
	KIPf+s9h5i0qPEg4Wson5+ERDfvMRMVoq3ZmDjeZtQopukHgsRWbA359yuwJ+O0W
	9Be2NJLJXN8XKgQ8xIfzx0TemdYfwfgbTQqn2MMJt9hvoXuZBLTWnpHsXHUgw75S
	u2pU5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrgqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso49039085a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605294; x=1796210094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
        b=BongjRyoKMsyr9dR4Hw9a3/5kqY015TcMbMXkhCLD497R/v0oIKkLWBz4wakMU8fcc
         L/cerJEdtswQcsJafKbO7CBPKbnA4rRr5Hyk5GmdSPO9Qu8sGV+lLmQIoH/z2RXnjwGs
         laJn+b04uPrS1zVx6m9Lby5RRLO/r7np4vI75hUU7OFsZjheM+pXQRFhmrMSJRtR90at
         o9ApiRsZ/gXuWXFhrYN+AFt2FhoMRB1AwRlDldpVPlZOlKMC8ouIWhMW+pj9nmbB+tKn
         NFljZqLYma6IQhZ7fWO1Ly3Nzs/9awWFqf4UCGjQTtsS7NQPSUCusOSsQfIQy56F6/66
         ir6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605294; x=1796210094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
        b=uKTQbOwek6Vf5Z/5Xa6FBGUyQz3gSmytTdxuHIB/GTcKE7tltdrnP8YS1LvmmMXtyj
         7u0pwMWio/OFPIPvzveCGXRyRspgcQUZaaxOkh2iaH8vtksth9QPWEjwQKl3h4ZQZ7IT
         13fA6Hk4+bw2P0b5DrWjGYZy5xiDij+F+9Hikg6Hebf21Xoqe76WjikZpEG4IhdhCutm
         4nnkeOCeYIDoOxK4hdvZPrqLvydXyq4Qab/vmeDUsWPBpEq2HZRgYGAfsPMIN7P+x2WF
         6lAB4jA5gO7R4C6sRdARK27wimJBgN2OgKXQ6JSEbujgFs5l9EqBfQVEdomBFlbDVbQ+
         +foQ==
X-Forwarded-Encrypted: i=1; AL+hErGKY3DerGTPA6xWGXX+fYj/tkQ+qLSx20V/+b1j0rwuUk8ZoYb+R7vbWpdczymq0ysP0xgM/L/r9bSo@vger.kernel.org
X-Gm-Message-State: APuU4Z+OHPu0yxlOHRCLZBU/tia8pmap4t+JQH1PMWNeiHS61U58+lX2
	Az+z/fnP01v3+aJffj9ZDrTeCsOa4B8/sAbqXoX0KeYovebSnmA3TIdYQzex7ZJ7gA6bC4c9IcS
	UtiTTstEtUMc6f7vWJfj4x9Q+4W9BlPVXC+O8ocbDqbqqRQic2iUF+jATU5qD9Nav
X-Gm-Gg: AZFdTZfS4A5S3Wq8tje/NkPmxpGlCuzg5TD7enKFX4znpxk0EIPWC6TMQ0eVg+LIIXb
	jl3juSwq/j7qB5Tol1sJwTsfXHzeGTJpTrJRxMgbHNaqMDU0Sfu2cu6kRoupm9dw/RjvPRj1Rrq
	UXLXGb2Oe/RfK/2TsvvFzBHI80HPlB0njcstaQ5qfyylGVMDJzqJS5jO8awaLJoOwDxNQSc/KWi
	u4RT9rSHk8lp1/VVuXJcXs9lCoImKtgVvRvwmCGvBzw8qZSXnsZU5XdMrKWc2I4lxbeES+s/Wii
	FZExBPgBGZeDgh/HvmvORmVbVRBBCuBUjvKIIbVSC4zx8LXGGJhj6jMyRZuB3utPlEd1rkfUCJ1
	j/7z9tEulFafbRKDK4bLZJwmNii7huK5ifyzjkW2xFniR3m43rvRZB/wjDCNE5oO0RO51emc=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3334183685a.2.1795605293896;
        Wed, 25 Nov 2026 03:14:53 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3334179885a.2.1795605293467;
        Wed, 25 Nov 2026 03:14:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm617344866b.37.2026.11.25.03.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:14:52 -0800 (PST)
Message-ID: <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:14:49 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
 <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX+b+MBmP3vCEF
 XK3//HVSJXSIRHGUj1RBsJ4jBxFdtg1SymoeI1/oWeSqg53Fp4fFlkCEYLbWVWvO2gy0NWR3JOO
 5B66uyikz8bWJxCYXqYWEC8rdegEykl2ADlYYKbE7ObSWQNZf9mdb+v8+k4WvGttcGT/ES0Onqr
 iLgccFfatcwA91Jh7Y4mT8lQEaXlz2ZKy+4wUybp+BeIqhbdZ5Kmx8klCpKHc3JySDeF6fMy3qz
 eFLcfhUgxas21z3I7Dc1qtzFewz38krfx5/acnr6BXAD7o+0AhREC1UjWF4OcB2ZA2bUIdR6hFm
 QRCa/e21q4Bp1TwAcuHNEg/jBcSXgXj8hHaez2ArOpbojW6WxXONgYWWqSQqpQkPuNdjy9/Yo8Z
 el4wfGAOM5yI6yRxGagXhtk7kcUugGeucz4WXGQ0ZvJgwyzUpas0EjtMipX7+b6uj7vIZfh5/df
 vfZqcHvCoWU5wkbwwvw==
X-Proofpoint-ORIG-GUID: rcO8An0F9B9dPaqmiaoiiRKuECsDJMAK
X-Proofpoint-GUID: rcO8An0F9B9dPaqmiaoiiRKuECsDJMAK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXw9pumYnoIyVh
 3I1L6QwDWI3Y+PDP9f2h9wg6UxwhnOh+b2x0DEW+UReWuxDxBr8yxP7TFCQoIKCSst95C7i6F52
 4wOYuG4DcBo78xS/KH2yd4RiNSYggZA=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06c32e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NWOE7OTWcffpa4NYhI8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 11/25/26 12:05 PM, Krzysztof Kozlowski wrote:
> On 25/11/2026 12:03, Konrad Dybcio wrote:
>>>
>>> True, not ABI in meaning something agreed between DTS and driver, but
>>> the values are used by bootloader, DTS and the driver, so I would just
>>> leave them as is. I rather care about not growing this for newer platforms.
>>
>> Right, but they are compared against a hardware readout of a
>> well-defined value, not against made-up indices (i.e. these are
>> not bindings). I really don't like this ending up with 2 files
>> doing the same thing.
> 
> Not two files doing the same, but one for legacy and one for new.
> 
> OK, let's drop the bindings, but then what do you put into the drivers?
> Hard-coded values duplicating another hard-coded values from DTS header?

Or we can have the defines live in include/soc/?

Konrad

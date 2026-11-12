Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475918;
	b=1hoeihGE07Lp5AxfYjkB08O1lAqYin7ujKY6JNncjv5KFtBGuSXU2EVDic5j2W2rU5o0
	 7KlpstkFoR0oLyWLeXs+qCytGCvEPqdcCyiAMRtxJDA6iHJRC0YcTGLiiMjimBI/ExJke
	 VfzP0vYhgbFf99QGejasZfEb076dNBAuJXpruQu2Jta8BXYhgC6CgJwfn/jMJNjT2jDcW
	 MNIt4TkSqvjrmkZZggl1bqr94gUHe4AvUPLrEYnEqD4Nvx2AttH+71lYqEOdDO2oqWGfn
	 2i1OOrZQz3CFdeHiLoC81uFfxYEhdz7H7QRDPHAdyoTcFXu3HDfwwsS3zJQeK0eXpag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475918;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
	b=yoVP/yxvGSX/9lhgw6oQOQhlnadwzMRXruRFYymu6Sx8J8qUN9Xoca9H5SaIc/D7BT8Z
	 z5xGpZ5LpW2PQlwyOYJvoyjDmIUBcLHdA+eqIGCNKekliPPhh11LfkjGyaujwf5HNaWNa
	 m6GD+M515bWLl70Was3yuJL1UrBTbEBBK2uHzHjm4ERPSH/Fu4qO9BxYcY40L3SlvvV+x
	 ZAaAotLRI2kHQzaW7CDXEdF60reMznKy9IvYQa3YurykICXsGoLCXZnJvjkoxmc3Z+T+g
	 lx/yNMqns5qB4ZeWxxPXCwdxH+Gj02oPiqY5SbcBKGdcex50mtEq7w1ZyAsaObcP2IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D7CE/Tbh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vYyHGU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE2606A89D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EE2606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D7CE/Tbh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vYyHGU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9OLoY904507
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=; b=D7CE/TbhTazlPtzH
	NyXnko+sJjN8ZOueSlXJCSYCGpuwEfGMnxBmv9ZMBzD3Lzj6w3fHLna/jJAkLm0S
	9xXZnaLviW/cBwhqRvjNF9udK886qUkyh4iqu1qIcVUP4WDiuyVb6vQRQEN1d7DH
	oFbb1XZV43MnKVCZJB3TY8AI5B8LCUbS3KMZBbsO+d2clOxYOD5l067hzfn/i1D9
	5e7pcXSXmK9LHaAv0McfZ6Rcf/hjjfvjRvp/ZGtCdJ62R1h1Yb65iHoSSS3Y0FYi
	kYpUkgDMWE8n14AMEd0H3ElacOSeLlwexcYonOwwAu9VUfzA6YKmiUSNvaDHqLVT
	Cg6J/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uby28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:31:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so5694296a91.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475917; x=1795080717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
        b=f1vYyHGUXqiLqzGdXK8nuXhwV7obY47U/Usfy+R75vioJBArxC/ZnA5gAn6sZ7+qE7
         ofIl8tmKxtjqiE/FfmCzyEPp5Cl/6rA3Sc2B62Ezi6R0oXJtsNjIUNvIH1lHjI8Z4khn
         0l7HuTgDGGq7fzfM+Zrw6Vg0esdH+60cV+InnZ2Byk9XdzVenKBbJFu/kmuN2hs/tSSH
         GrvRUZga1+OO9ElUYQbJpXZAtSKdR7L1TK6NUyUCdGm8CJKN1163ifqHgauWyVilVq9m
         2VDfk41SDWhS85a+fpiiqdElN5ZdlBKA9qUtiZEf/fR0YNBWUSies/i3gb0NSHxmpC6r
         2ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475917; x=1795080717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
        b=mHEu4PCS3E3yUXUhmF5UBO5O+A55U5HmPDo/8rrCo9HGm5nCMXOwVNlvKIJUi4XqS8
         1DMrvfwW0F1yzHqiIqM2Xb1JKHmz5WqlbOZL+vwsS91ixpIj8H2LHkdob0UTQyQS3KLR
         CjjbXhaDqBHqm4J/1M52NC8J8K83mxXiyeZ2sFnM/Edqk/Mq/RRPHSOlIBX6HPVqlDNi
         qH4QArYMAsIilZJ3ssazFHOOK3dM9dxPlNH67Cbg7xbwTPBzyQLbF0zlNWrMOLtOSg4g
         hVvXULK0oN9L9HCh5CdE3CIB/Jph2IgWhJsCL7D0SBvTtT+He/tFAbV+Dd+knI5PMtML
         tI7Q==
X-Forwarded-Encrypted: i=1; AL+hErEd3ZIabRUVFkJu4+qfI/52BfiK6NSegHYroPx/h47lq7I8GHqhYTcIohQDFDZs66BL3Cfjwrqih+2Y@vger.kernel.org
X-Gm-Message-State: APuU4Z/YOL81p3DZXuSFCdvmZ62zz65sanOTFAwJ29bMBOHzEFSc26jR
	WtolxkGXYY/kPi4mw+OB3dxnMJVPQJwAHwGklqRgJ8TalpWx5d3y2NVtPt6V/wDSkbpwd+A4wn1
	g2gslmILsOyUxEo3jSeKZvbaXhYe5UVULxFRUG911voERLMrg+ZhIowKiH6V2euOQ
X-Gm-Gg: AYBFou02XX/A8G1y5PG0gkrUa15Yv0/o4DmPstpD6CKGL5fsORG3ihRZdPjUjeqFFQr
	4mRpKLJyjNxj5tcaNIHVaZ3/2qar0FzkSOuUcvqWRpaaOLbHEhesITDSKAx59q41u20F3FE4Tbb
	wu2gZmgzOQMdc6ABIj29Vd6krRINF9EPtxEDZxk47WfpjCNiCBhLTiDRGqIwu8p/JnWlFWjhCm8
	0at7F+ZD8kJ0fiTte5Y1sdObSLNPfvB47e5g6JGGPE4c0E3CxjfnTkEqxbPc2Cmco7jWFJUnQJ4
	TBVtmKeOlLuo03gtxi21povmL5AsElsO1nWW5FzBbCdkPlAsn+yDi46oW5CAQ9IXCWT35epN1mi
	zz7ZXBWnWRjzTI18D1hot0PKaWPbcmjL3V0nzvjMKAIXuI2/RL3MhxwwfYXQxDKcaWFQvxFkC1+
	Uf
X-Received: by 2002:a17:90b:4c49:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3b182e6f54fmr4910355a91.19.1794475916854;
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
X-Received: by 2002:a17:90b:4c49:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3b182e6f54fmr4910327a91.19.1794475916412;
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c9d7c1sm3869051a91.17.2026.11.12.01.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
Message-ID: <f2b119c7-ba01-46fd-96c4-10b918f98d53@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:01:32 +0530
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
Subject: Re: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
 <20261109-qualified-pristine-newt-ba1c0c@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-qualified-pristine-newt-ba1c0c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX41QmarDeIk8p
 KXZbgumIzwYVncO6cjY0DFu2QurjzMVEhUs4xTwoCAuuG0iArCfiYN4bTB94ykIBTlxv1QdQXnD
 8Ymhc8JMfoPfIdGbDVk5RkDOzf51GLE=
X-Proofpoint-GUID: rY0pmRE8GUg7wirfVRqeXoQTm6A2NGzF
X-Proofpoint-ORIG-GUID: rY0pmRE8GUg7wirfVRqeXoQTm6A2NGzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX2sRzoYNQLNCK
 oqma/mUu4NR5x2TxwdXGJwUJsrGFpLK7zDztnn3Tj6vuKtGA+b+6zLPkwbv5NiJhgoP40eNov4y
 ObRnIAp90iXOjC46vwDnpAguiA2UMBFFuOFLlVGvt4TMoDsG8MSrT6CQTVoFYNoGlfh0EOKScCj
 pfzFx98yyvxiAt0WybPTo+wvNphg+Dv3539WiJhZu/3yH8iS9sXPYThcMIIicUhPdumQ1Geh1gm
 SDqHDlMuz2iiAqdQMQu8Cy66PQYCHL0N27qVRxEjgl7c6MRy9eKoLON7aEMCjx28804aiWz9uLt
 z9WOyRN20LM52iQgRT/JoKWAdAF5l48HtiiIlhC1aqeoGf93Yv+9X/ymKYYtbzjYYgx/fIcqSMM
 IpJqnvjZLI9TK7kjZhDUIT+gjYLWTR8JeoYqIX4LO85aAZFkIHVob38BWJXr+BwKrbn0Xb93ve9
 3R70NcMX4mrR1ktC8gw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af5878d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=-_rbqcG8Jwc29zszMZcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120037



On 09-11-2026 06:18 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:22PM +0530, Imran Shaik wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sa8775p-tscss
>> +      - items:
>> +          - const: qcom,qcs8300-tscss
>> +          - const: qcom,sa8775p-tscss
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    minItems: 1
>> +    items:
>> +      - const: tsc
>> +      - const: etu
> 
> ...
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        reg-names:
>> +          contains:
>> +            const: etu
> 
> Reason for same devices with different address space details should be
> provided somewhere, preferrably in description. Assuming in the first
> place, that this stays because how two devices can be basically
> identical (same compatible) if they have different programming
> interface?
> 

TSCSS is a single hardware device, split into two sub-blocks - TSC and
ETU, each with its own register address. Every SoC with this compatible
has both blocks in hardware.

What changes is whether the vendor/board actually wires up the ETU's
external event. The ETU block captures a timestamp from the TSC block
when an external event fires one of the ETU slices, which are driven
through board-level GPIO/IRQs. If a board doesn't wire any slice,
there's nothing in the ETU region for Linux to use.

So interrupts/pinctrl/qcom,etu-* only matter once a slice is actually
connected. Because of this, only the tsc reg space is described in the
DTS patches today.

Instead, I'll use the "qcom,etu-slice" property to drive the required
constraints, and add reg/reg-names support in DTS by default for both
TSC and ETU, and update the description with the above details in the
next series. I hope that works.

Thanks,
Imran

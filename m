Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C2930DEA9
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466307; cv=none; b=GT16lxSeoJmQoJotbx4czaYniNVPoRyLJHiWX1TwlCT+/oAZD1K9rpFQJR55wqI4EogppglkWilzdxuR/wiaP5P5ZM4PNlZm0ZgblfXS3W+2sveI4xJzEnatrsQts9wB6Fz/MRyNqZ1q5YM8HTNCCvJ0OWQYO++Dy3GW7kTS6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466307; c=relaxed/simple;
	bh=JCFwUhX8n6J6cLvZHBT/nylt0d34jPjdOhcY0lO5Akg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVYEEu7R3V0872+8VP1n2ID2ktRfU6nlm5Kctv1nmOpoCqjn8ZzTQfTL+ZCq6t0dQH7m9TVewG4x5CzQ2aUWn6b28wbT2Bb9PV2F9FKIw97uIlkUicb6Dw3lDnZUJvzNFhxdOO078bczudPt/pQPijBiMbIlSuc5t2oyY9HIvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WokG1jV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV6ZjB6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WokG1jV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV6ZjB6R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635NSrsq560732
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 09:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=; b=WokG1jV8TTdAeLH0
	WsES62KZhpnmUicCUJBlMBRKguACz/XLQ9xgrlE1bA8MbMFu1mO10oPDsWTHtHfW
	Fy35bNo0seziStC/yDhZGPbiVtsRKOhab/MIKKwr+Flfend6sAYd/T++zDJARBYr
	S0WBm28qk7J6eEGmnXtpyE/M80BjyvCpW2fHuzCY9cHWrtU/3krYOxmFeZanpBtk
	qsMHQaxcyYvkB9z9QRxbOSGwxoHTQ2JzMZC5+NYZrpxSYJIxpZ5KBsECTLjnXLU5
	aypwI1kSsBTzSCFY/8RwMy/ko9V9VGd5QPRMFVx7zZehfh92bz/tZuXG8+MNf/v2
	TVr+wA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsmhwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 09:05:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249975139so98618005ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775466304; x=1776071104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=;
        b=MV6ZjB6RamvVIkf6ebMgGxst+yCuc92A8F06Y+ZZSOGQSayiY/h4+nNmh3MzhKIZ2/
         DPcjNjgvzf2vj6+4G3CSqozTHTj7llI6Ktj0eIiIi/2mL/9tbebO64iv2ltCvyPgkdH7
         t6CMLug9ZL3V07iM2FG0BlRFUVApyd7ktUyl8V9t+bjddUFdc7kn1zRPP52HFOrBMwd5
         ACLm36ZLIZCvzTfOFVKzxh/Xk8P/rjbfTLWILMCaY80j8Sz8JbbVSO6pwfaWRzH+NjKq
         HXAhO6+w2bDSmOF8/5JiRygbRjJEfDa8pdl0Tv4loxnHEato5Noizwd+07z9VKBRDPX9
         4qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466304; x=1776071104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=;
        b=pmB2VGipEV8/l1hu4ZQN7CDBjfzldccCnQ6ehVvC4CcTnxWPEyOunpNpCkYncAJU5F
         1x6MZYdrJI71D8fOrbm2yQ9z8FjUD62eXPg8ix5NZU3hKOavKBOQEhkiAS1Ott1TTXkE
         569pED727PLSV77fxH2RLOKhn+vcFQIV2qXjuoh8RQYbt3R/tP99skVaoaNPu56KgyTP
         7MsV1GwKX74TBk5RGUbvMW1XvsXFA5Q565o+CyvLiu5VHpL2dMKiSAL4ASg1Nl/RX2oW
         jcrFO4fBaWsuMwuDhciYb9hrr1UXQQMkTqaa2GZUpuA4BAOtRAOunnS/yLfyLAs6M3b2
         sQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUon591/xXiuEkR8XNovb6tm858ii+jMBBlBmBEewn1nmSNSxtpgZUObMuJ+rtM0fPY4b1Yuz2wqDyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjnHJC/vOv51e3hOZmvAd24LJQBr9ATUcb3RrO6tqf1U/R/08
	av0PGnFZmKAGjdUTC6pfbGMV15avHJT5HJY9SXcpLLuLtPDXFf3Uwglf76xtBndoLGtY/AKJQPH
	PV1QfxUqLETSEewWlyQopEzeb5wlhp9UDNQyCKM5kfHayd/gTphAA0bY3g287zRqs
X-Gm-Gg: AeBDievUW/lIq7hLxWtgBSr4K55cjO9D4nk42QewAoLKUYZMUhaYh9WKLUuP9h12JFF
	ROot2EvJ5nh1aW8Wr8tK6KBTXAr1SY/pCa5xohFZgm+7X+ohwNlh0ZivhiJJU3szdYlCFvkOfUb
	6zZECgL18E3BDWKjk9Pr7NT/xd+rSO8uPtBRViIUH3jhTPx1bX+TCEpnossZdw9J1/ulSU7Cs+o
	fwkDZ7uhLt8DFoEVx8W89wemquGV0G5DkReol0oM4BvZ4gvCAWjDPOEzpwUT2LvKZgmsu+rn/m8
	NRFY8t5EeZMhpE4XTdaxVMbdMtE2U7p/buf5EiH5pnV64DezsTXpI+chWK4Z0uN8yfD+6fV/Xvx
	mlQF/ogFsmsG4qaian35XZh8SDlBJyyWmrnH7AveSJjXi2j0fL9DKumemoBLobhbrNQ==
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr125987595ad.22.1775466303882;
        Mon, 06 Apr 2026 02:05:03 -0700 (PDT)
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr125987295ad.22.1775466303395;
        Mon, 06 Apr 2026 02:05:03 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af19sm129633005ad.50.2026.04.06.02.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:05:02 -0700 (PDT)
Message-ID: <5c0a53c5-3750-4b80-b3b0-0bc7595454d9@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 14:34:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
 <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d37740 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rkh08bgVQrwZcmFFEZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8rjXUggJ3aVQ4U4KrHvWoIHLOHiiNi99
X-Proofpoint-GUID: 8rjXUggJ3aVQ4U4KrHvWoIHLOHiiNi99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4NiBTYWx0ZWRfX45CG8w3lKvf7
 IaXpUyrKHOxxoicHLMSm+4fzu5hUxtLVPGz775H773BF3fSVtovFZ+eikUNJgG6VsE1FVddw/IP
 r8OAi43+tDsNvGWJO9XgaJNsj8HEjWaDi06JATodB2VGYqpFCVPkM/eaOmJklcNLN81MPvcF3KY
 LMOOrdWDPig5WQ0fLrpkGj0qkm3gtE3Vqs/fQT74KVXSeTO0/XUjNC4RtlvNPZADZG4gD00sgxT
 95wO0ccUSIcrrGBa8DflSVXE6sgahW8CnmpueTDa56oslHE2AyqxEaoO8zpcvgA2Ql/z/cjdqLi
 qAfSQ85+3UDML6rSxtiCEsqmsUcL7XnnFaDRIAG1CRcwH4hexfXKbwpPsrfZBrZQp94fqLqcfaQ
 fZKGDw43DGLDXbsDTsNusPc3AP+qkBlBL8uqzB3/dpvsWeN6a8Rde/eEn08laKA9eiwNA7hPq3D
 npGcIZQ6nVVZ7BhcXow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060086


On 3/30/2026 2:11 PM, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 6:51 AM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
>> Add the pinctrl support for the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Patches applied!

Linus, I don't see these patches in linux-next or in linux-pinctrl tree. 
Do I miss something here?

>
> Yours,
> Linus Walleij

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE523812EB
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373210; cv=none; b=jkvPGrMMITw88MOlvv2LeMkiAF6HduYOnDLNPpIJudNOKbYKY7Vip8+coXtLONztlNnWexktp+ItqH9Z3faWW8Jh8r4vnZHXggci283OY1TuJTC7bOyMcbzb7JFliU05D4rhIU2kJM347brgPZum9fmLO/0tKyUK3dZ6vQaYRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373210; c=relaxed/simple;
	bh=6LMaV7tSjo2C/B0aYBV81KfWE/PDaGlSWTVSu4v8Rvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWoeWpAyIs78in11cqpNel4skRk1H4X8ViP1pgOKt9JGVTFquZLSlyUARXRCUW/r+9oUpAs/vQw6t2EWm38QW/dUUPU416twOJhhI5u0XyqIAaypJwCbu0BNX5rKLKkwWD1V1ZNMt7fpzhaGi41ZGE/LwowfPehXoJmJN9GgtAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPdJC32n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dajSjBKG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPdJC32n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dajSjBKG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eO5Y1102993
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/4C4/vcdt4WFOXcl6HzVU9MdIEVo3PNCuawT5cNjq0=; b=hPdJC32ndoS62Ptk
	XP3uYf6bJlQ1DcpVu7pkym7pIrqBmddGJeKrexZYoWb9/WP/oLyM9mGveO9DeHOQ
	MevYXdSZoajVQBHKdWhtc1x//mW4sHgElllJ2JDSyO+x7ltm7scsuxKSaWIHRh6s
	9hvMwFT1oUMbOUTH8++0U0aRKBPzABYA+V7gXQQ7S1ebjGPF/Uyxt25JwjGdCGmx
	8LJsL9l38hAuyuohvnryfAZQyRoufVoYAa8NMj1vsmlmWst6LBpCVTinCQQQ34zK
	BJcVGthoRwHN4kYCKBO5vQzrTFdk1RZl62JhHeaa92Qi1eJtvvVJ4HjewU4nUaGx
	WdTgjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu937m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:40:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so16836725ad.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 00:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373206; x=1782978006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/4C4/vcdt4WFOXcl6HzVU9MdIEVo3PNCuawT5cNjq0=;
        b=dajSjBKGT1C8qSe/nH+fDGfaiYfC6lgZ1gVRqu59IRzKuOXxeVQyIGrcVitOPwXqSQ
         FD3VahvOgtswuP1Q93IAQDBAIhAbtOJItwX3C+m1Qp3Yt/Tph9kfa3DMeQAOLGxIsQB1
         GdM7fuTjYE16USpjeTjRaOyc47RccGjbs8cHxLE5CvRWs5+F/xDlAVBCKYPTtLhogGVu
         rJ1PeraUPLifpOwfU4nilDH2+lqJL7J/L50X4Lzkz6GT3zhnN18VsS7lovUSXf4OODDu
         nsom63RF0tNuL4oRKSadTMQAucmJJTNfPawXZbYZizlGS5GSCZ8gOU3yLgtiEHyBr6Tq
         o1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373206; x=1782978006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/4C4/vcdt4WFOXcl6HzVU9MdIEVo3PNCuawT5cNjq0=;
        b=jVfrTeo6sfH4IAuJ/CzbwW25J0S7jYHsdxIpgYt4nllxT0n5NGrykCN5eUYu5BkJXL
         hGBZbli0KpqxU552mIChTGPHNzql26LYC4lUUMQ8DXOkKje5FSeIi19Hji3yyBkBnW8D
         9cRJwwYY0adz/OZ+RjWRSr1dJARJvDC2B51nWxcVBelw7SkpmpRXMmfoUVmbVvSO7d5g
         6JJWTYx4KTk+fPZJLj27hpR7Snb9ksKnONkZKU/FE8jBBIoBylTgSCF7uAIgfSsBeqGX
         zu3pHzagX1aO7cbbkGcINK5Wp0Y5IBuSWg8FZQMr31bDDGfaes3bxaOBj1cpxHo+mw3L
         hS7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoK/KdBqiH9bsVxnGtG6gIHbFKGmEZgWUoYsP/ocXzR2/lahP1l6wMcgKOviEgqXdLSoE++iKwkcNe7@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBs+dG3c4wK3cfmGobMg9vPvDu08It7+gINyVsQCIQ5SXIe7r
	4OR3Hlx7Eo71TdC2fvCvhztooENy60TH3z3ePxkbCKidadVyzrYIfede2XGSR66X0WegLZ/wUpX
	ArNHImtWOP7bBLMgjwV7aRRd6jlOIislBd+y9iDzW95irzXpwGyRbXHzujCmctVtp
X-Gm-Gg: AfdE7cmrJBJX+PdyZSOoFjjYE8ZkmbszwHkOTLUgJo1KqZJw8968lgYV/8L0qZKXaQT
	ap71kzMAlCvm/aKDGM6P3TX4qjhChgczKD2X1MF93Qt2wqU6h6I9LbrkFFaEIUSp36XxMPj/Fbc
	VlLzpe7DHLWznbg7Vd4YsUNJHxtelAlLC7PGIhXT/+T8U9nPny8jxkW68+9U+flEP6RwGaSD7rN
	seWhv6pyu9Zgbc3oflNMdVWswprkgRfggtpviMygvAkL0VX6SyFhJIApd2oGnGm/uPpP+2ZERb1
	v0yU8BCRU0wS96kPAQ14OQ6MYcyg6gyBjzE+q49KTFiKdybb/v1Ju29+/t2jETX6Rn3VpFvs3y6
	g7BuQ8XqPh0qn6nHJCEfKDAiGJLnqSv9LAtLHM1/lGt5uSjcMWSx4F8B8sUB91ykHgNkhSyJ/bV
	v/7EUZ
X-Received: by 2002:a17:902:cec1:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7fc696019mr14046575ad.10.1782373205814;
        Thu, 25 Jun 2026 00:40:05 -0700 (PDT)
X-Received: by 2002:a17:902:cec1:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7fc696019mr14046365ad.10.1782373205343;
        Thu, 25 Jun 2026 00:40:05 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f6518bb1sm13912915ad.84.2026.06.25.00.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:40:04 -0700 (PDT)
Message-ID: <32ba0f9c-7f01-431e-8cb0-8eba9f546adf@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:39:59 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
 <20260624-qcom-spmi-haptics-v2-1-b9118e60f3e3@oss.qualcomm.com>
 <5a5fc753-977a-4e21-984c-9b4a09d002b5@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <5a5fc753-977a-4e21-984c-9b4a09d002b5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y0VP9qMVlYs8JfQUlnnmkUzddRk4cgBf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfXxfJRxlheNOwq
 26mD22OD2nppuCDcRB6mMxzNfUTYL+GXPLT1FFT03rXZkEZ8Aau/KP4ssk+mjgt2ijEJm9wbwa9
 +JcCY7J3+x/oNgJTDRMxiq2tDmhyi70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfXzOIF7dUPk2n4
 uCsgIiShGlCvBQ4Y0g62HLLrouc/9szS9yyiaX3Zsk4oCL0w4U/OLfaQnSFpynhvYvLiPo6wxXJ
 4+0PLMRRIG1bZQN1aBx9Z24icosERn+t/wiXyX/b3yQA99W3OfEAkg+veTHjat8zUoERUD+nC5G
 zk1ZjCeKCtnEk2ncCyZCKRpMKx3oFcgl8egZTjQp3gufZ6LFSNOyBLyAVrx0k6eos+ctb3K3Ms5
 hAeNupVLLTyX6n+WEKzMChnQ5UKvmh3Xa5Nc2GMNS+gFfrFq8+XJ/lvU/qydCWZjnFA07eAtevN
 F9sDhMVj2iYmJH8hs7wqqthe9YlXAbGsFHdgCK0QzwDVMMsN3z0sPBsHFdqJbLJhBDKkXY8uROT
 UcpUBMYjaGzhIg40imwO4C7sLJ1pm03IDVBONpVe60FxrAGUdTZPUBVIT7PJ5btM0btrL1vC5Mz
 dkw/jz7zI4P7159l1Cg==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cdb57 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=epH8AEZvAp_WDEgYvPwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Y0VP9qMVlYs8JfQUlnnmkUzddRk4cgBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250065


On 6/25/2026 2:23 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 04:00, Fenglin Wu wrote:
>> Add binding document for the haptics module inside Qualcomm PMIC
>> PMIH0108.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   .../bindings/input/qcom,spmi-haptics.yaml          | 132 +++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>
> You did not test this before sending, therefore this fits in to AI slop
> category. I do not accept AI slop to be sent to mailing list.
>
> Best regards,
> Krzysztof
Hmm, I used AI in the very early version but I didn't use it after 
realized it was not good. I don't know how I missed the issue when 
running dt_binding_check. I will pay more attention next time.

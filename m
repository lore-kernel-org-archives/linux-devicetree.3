Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771273;
	b=mqDFTLRF5A7pkox+ueddlf10EOHBTXMIgde/kTvBOk1nwEpr0z2l0UVhHa0hb6HjXvLn
	 qnPW92/g9Ta/XJnlvICS90xziG77e1Rc7R92LUaNBellYYaDpWkfM3lm6Lf7o0RA9uKeA
	 TJg9AigCDk4zoB9B6LrcT85ias2oeouu50tppS5TWeJ0RZrUxLLHcSp+NLeq9s44wTab6
	 2FMNYkmZfNgQiS7rmWc32Jq6C2eicZ+XDm0PaNZ0fNNRHcQbNynuOmSU0IZCsMC0ubsz7
	 VTnVTaYTU9VDixnXHyW5vEWFypgKmtOW5lT6AJzsDhRTZq134y83FT2TritoTZ7MPCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
	b=k15vCcd+hA5PFvmwQjRL/hqZjWQm15XWgjs0/sBx1yBgaPkzp+QXYthg3k+tsGTNlBE9
	 ZY/eEx0Kwktu6ei9xQUpU5ttnY7D68ggDvjIz2xIzRIgs8X+I1/TWnFDUPorR8Mkna+uL
	 XO0pgNx3zPpf4Ak50l3XF3PxuU+9ioB7wnwBKWAZBOcFLhCpUm9uISyzK4074xlrUTRAX
	 WlGM2kNoV9G191zsFK4bv6coBFZQLuFgxRENLf552bMczUyJjcOHR4IsjoF8P0Tw27BBB
	 ipUB68t/sDexKqExnSJLwX10xNrbavTFjDi1u9E1Na+m1tFe865+9Zyzkrn3WPYCYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C9606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GlJ53759296
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=; b=D2eT4WIDJ1W9AyvF
	iqDjQTZkazX7hjX5tvxXGGUQwOODekepDblkgQKW8sHjN//bLgfVAg3Z97vTS2sA
	LCtaFSK3zELURNRphpjw+L45D7aCVQBNVc3hkdkaF/0nuhcNMzrQ2j6CnXUCso3X
	A1wq7SIr9JXJntAlDUanesYofwhjSrWrqQRvBaZUdF4JPO6E25y/Q22+fM5OLLZg
	Ss7I8bwy5+2ADToMXku4bM7L1CYTszhhnJoqLXOJYLv5BJ9j4hRTIUhHTMEnseLo
	wbUo15deJ5qpVIvaZGpbphIm1xqEmmszpS8r3hWAdJIvjUpLJdBgFbv17XMpjaEc
	2dRLiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rnvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:21:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92100ea3296so16374036d6.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771271; x=1796376071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=RmIeleTMV22FW6ke2EZjVjsuG+B6c24ZqlvL8uFK+RPDoQIzddBOky3U095Q7nrqwd
         zLtCcdcchYbm5mDfg9Tg+uCbGk0HgC2GW1Hex5XgUOiv5Vbu6mlTINUT6XRR9mEvj54B
         ePJAux0Efvte4iNudklB3ahkt7o0OcdjvI2OVY8hUOiq6vpD7sfh10ayytSwQpMjdkqw
         pHk5I8h4hs2gbyWkBbuqKmU8TT+2LUDr5KmOBIgBINBBfG34kD/ccnOBTbje3l0a8Zu+
         rwidaB6g2N2gvDGNlUWbkkA1fZHVf2PB63hBA0xFtzSsRQAZKnzdhNbIAD74rRHD/CmN
         Mraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771271; x=1796376071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=Kuf7chY9SqHcvvg3fkAxVC0qsDvOIZ90PwIZ3E6yZ8N7JGTYXrA01bjko+MOQKXG0m
         iRfHPKXi5QWUTKQCKRk2rbm8LekGo93vKpSrocYuRUL5IAc8ppj9HdThnR67/cJU4LvA
         AdpKsCDdrMmA+znbgoAo0x654Xp2YQ4lXGEWTJdwKmJwd3+o5bdIXwprp+AM2NPjemFe
         i9F2xIM8WD4KiP75sKK8AdFjnGaTBZOmnE4kheRoWRWsAXJ/SYPATKpu4JBEVLnyZNfy
         /CF5dPyVLVYjrNo4TrpAA2pIXDPMXt2Om3Lfy6x7izyC3/K9OV38PBkKtslUd0vXGiv8
         dPCg==
X-Forwarded-Encrypted: i=1; AL+hErH6cQeoXDG4uGU71oRhn/vWWlNpyzLrtvtdkbUrEkfq5nIaGNSoCOS39z40KlaJElKIyuYVDEJuY/sT@vger.kernel.org
X-Gm-Message-State: APuU4Z8OVGtjEZ0DTxZ1r3cnULDaBXbrNx1pzFQOal/jAots9bBPuwxZ
	QZYWHdN6hgngVBlK16Bjc2vsZbjWQIh1eCb01y7ZUzxZYIjqV7NyvLHtSQ0noMSlrKU4grg96af
	JJTeZN5TTGBKA38nv+L55WOzkFRwPyxRzepeehqUW6BFHRdzEirQW9S2jjKY0iH4Y
X-Gm-Gg: AZFdTZc7Qr3Sfd/Ebi/r5MRiKwnkS2sksJRtsgYblN+Rkv5zGYKrjMeyyOrjZivek8T
	eLYvKFEDBa53Eht+smPTh1KlVZjHS0UFHph3pe2Bas6Mft9ay5MJOP1S5sWMU0vl7y1ucGUmf1M
	84yWK0PlZTwhEQ4mbCKLkZCHSQZ2ol0oEql8HNhjYMbMdJYpTFE07YGS+UQ18qSn7d11sZHFPsP
	sI729/IGZqBxuhAJj8rRCpELxYkDSr37BDkMRVvEO3yg2CSK9tG3NRCsW6NCci8yHx4D6FgwwBQ
	9F6Odw1GdxvCUAp71fE+VBnJTCtqrgLUnPJQ0j7vI4JxzAh/XjYcko9pogrV6f6UsHE5QWX/PR0
	hJX6C5McibJhy+gUbn5ClVkGNwUG91kTcGaqQhvfvbr9wV8d02q3TBxgFkytf/AIzMAerXOQ=
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663492885a.5.1795771270764;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663489085a.5.1795771270296;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm820746966b.82.2026.11.27.01.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:21:09 -0800 (PST)
Message-ID: <59c63049-8996-4b07-b3b9-928c810f928c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:21:06 +0100
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
Subject: Re: [PATCH v3 4/4] clk: qcom: rpmh: Add Netrani clock resources
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
 <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bAr_f2lK6EAeliZxwbXCNfVxI2U7Pgc0
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b094b87 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4CYXjMiqXY9n0OJUL2UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX2/nQ58Tq6BKL
 G/fMc/82vE/0hig7A3q350rIfh+d9pLF7CoXpyxgZGf8wh9L+NZhK99mV2hEjz7E65hUAOQktb4
 FmF5I67ys7HsTm9soEzubZOl1atIqBI=
X-Proofpoint-GUID: bAr_f2lK6EAeliZxwbXCNfVxI2U7Pgc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX1xcXl5+7yfdJ
 7k57BGgxjyzkjfliqg0MFSAAPNmoJ9uk7J6m7kPkl4ZO1PqXn2eezgKeY7N2Dyt+55UwRMSUtHF
 7lZ8z4si9XnsaaQOtSKilksIMYK8wC7MyU23NFaInGqeML03PZJCJ+3amIwfBamehBa63QxcxR4
 MGx1JCeOzGrBEkSdFf78JhssatfRsRBRSMIZMyfaVKAN+5y1txJHhT7lf5NLblW/KHPGwGAlIEH
 0fkhqxVoLdvc3p5gvm681g92ulIAnwr9KGaZnnX9ZZIDlYxfYXCN8thT47+RmQBGEfOsUhk5lqL
 wHHwqHxEOD5k2Vio+4BNlbOVTzcyAClqXPrIvis6tu9Nsn+7ebZqzjSlJVSsQ9Nwelq908EIu5C
 5pfv7QXaLJeRuoB1TOcg6NgbqJGK6ugcsNfkniqrRh8T0GniIPPffW2CtF7ZjOhdNmkKBXdc5X1
 WSnQ04NrmRcQpqrOzHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

On 11/25/26 1:59 PM, SignKirigami wrote:
> Describe the Netrani XO, line/broadband, RF and IPA resource clocks.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

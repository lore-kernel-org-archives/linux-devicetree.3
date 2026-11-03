Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724462;
	b=1yu5raYRIh2+/CE2+7vuxmdNEehvldq8GyiOIwM5vlwGZTorqmU4TG73pVLiO8/8wjjg
	 e8Ntma/FzGuWxUrRvJZjNHEaBYoVR6kk5E85CuSS0oQdPbJHRoJliTvcB5Eg/AwFLZ72J
	 LVHDeMRxG3TX64kiPkTfplqydEEiIZ/hpW30MTsyQzPcFdqwjbt9N4wLj7MbRiygn7pK8
	 VdtzHx9w6QewGHV6JGPFYj1znEiljDyQJmb+LtFe2r9W8cTCRup6Anj1rwvz0d/Dy1Xk/
	 /lj+W0O1YSQCYRdvUN/I4IDsDdbZoe7STARINMzSABgEgvOo7XuWNVK0IvpUS1e4FqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
	b=n7VclrnLdY1fRQ2QNjVwh5r0nfMJru8+56D7aeBwr4kCh0+puJDq3zz1TIkyltaDK1E9
	 xqqcuvU0U8CFjuc+/53Ir8IxF+yZEZQzIthpZlNVgJkRHxKsz9q4buufyA9bt9kKYcTSs
	 o50VN9lLeIsmjJ52MX0omjRoRkcAeiXei6ejQIeVcyIuAcyHEB2aGLTGaV0cp6O3KGPOs
	 +jGnfdVlTB3BfTtKXTGPAR4ef1yDyWFZBZJyFFjFvk2KG8Ja4hemeqT39xb83WqG+u40b
	 uJAfpq8rB0LwNSLZD9UuUD03IxkJ6DpyfxoG2mrPHwfWK5d3ZJNABn2L9ALBr+nIf1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC62606A32D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC62606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EALYY3690080
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 16:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=; b=bhn+6NiQkuOQKXG6
	XR2m53GsSTThmw+w27tl/BJmR4EFjS0irkF/k1h+e1fkw3OdIxc71YE3cT04Wnq5
	VLq5MfNX2Zogbp1rCP23LJcEhL0EYKx+1dg75LRngxkznojXxPkX9Ig6KJ4cvH5y
	CtETC/QVuj6CgNZt779t3+4DCN11aPXiv5ofMqy4ZZb/PPvQTC/ym35f16EOivP1
	d32nmGAA7DwvnGJmjnDZKSyU6jcP8Mr3liGyA04Hpw5fJaJXGObmClAcSKhSDdfd
	at+XJYYh9vg48qwb/U9YL8+VIUsDNHoX+q7yFDTZTFZWzUnlzhIdPuDcwHfNLbFe
	OiKh0Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9baj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 16:47:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so4706065b3a.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793724460; x=1794329260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=GustMljW74EyHYAGxYnZJlmz7VB6Z7HF6zWtTvun2Jan967g7FZKW+2SDHqbJnm7iY
         V2wG7rQpR75Et+VAP9DAfCP0cBX3XEH49+ro+fYD9u2SSewjW4hffIUe47m+ujzsq5Gz
         ROEjh6qyBbbEOLAcobLucguM4gaDJjITG/fReHcbEWYnFSo17nuW8VqgPy82rq+KCuvW
         uAj76L10GqPKH9lK5uV9rfm6Kx7NIux3rkW7bG1pu70mQiNEnXcA9VBFjyLnQ2xGZeIw
         jlfTSCe3d/h8M88U4Yozk7tqhJjasfsK0k+XPljafncPrK6FA0T5RZPAEKWN1qCDqGsv
         CTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724460; x=1794329260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=i9Obpb04+w2y5iz7aid5hCnbYTN+eqTgQbaqSrULJJYFcDfAhMhJLUd8hH6enyt067
         Ch1W3p7uS+zleuFadqdcklOeaZJg3KWVep6bBcR8VpBkxAEWDujjyH6St5N1HSdaxXYK
         qQyJGng1PrfYysJvYnIp/pydYeSDcqhygyxB9slEBRdu5FPjp+TYE+bRsfy3ejVFbAcw
         FyU76nf3+pYXtKXpIAfZ4/G49gOVZ3St089yvgzTQFq5vPxOcVNSBy0i3X95knEA+rDt
         T3FNwhJYA95UzTqcQeyIUAShkTv4q4hh4J1pt3wqv73/6qIxO5a74Wy+fKEBvoN5D/7S
         3pKA==
X-Forwarded-Encrypted: i=1; AKwUvBwKgZ5etnOia7HKFPDnZap3sr7vJe1KNqqGf1xLWXHIP7VNYVu2/A1902mDRhYYdM0CkUSOm+l1IsUa@vger.kernel.org
X-Gm-Message-State: APuU4Z/RCuVkCESqeSUld2c8EIijz0ea3oSHsJQ07sQyHr7227u2OB5H
	7QRR+qkXFq/QUmlQOsVbc1R5J/jYE9Rx0j5D3aru6BtIcSPsbt8WdilyBJjKCNmx2pR36SFmRY2
	kd/RDp8Nt2NbOfnZztP4PddUolAuYWYKJAowga2KU56mO+u1HGan/GAi6oe453bMQ
X-Gm-Gg: AYBFou25cq4S0c4vZBEX+9o7kMG33k7sNS04tuH7L4PalNewhXUC8NifdEz1hhkzcmL
	gs1XqYakpkVjdOoaQTgj0ucrWMg1QIDfa+VAD57fzdWifqjK0TRTWsdNXCXpQ1jZlU0aF0u4PgM
	hYh/lPYJqmrWwRHRAH09WTS3DQN3xqNNGxHiWgVrj7cFv7OaDacW3P1LHbKyxepZ/cZZ5NdY31f
	nUlQHUl0kBVBknk/dFN7ZbP6H6vxcQ/3CpHGtMg3ime9CcQ8lOxpjl+756WCn9lBRk/y1qTW3Bh
	2c7VDNdOGVcFmBfFn7E27zdzEileSp5MC4+gjYA80LiMvDUDMNrG2hO1W8ZqWWUVcNjLxnj171L
	K5QmBqK3vdL0QY9c3ftyxpOAYH3SSyVfuxSGw62fpSpUkHfCe7rPdC6VWsAyjd81S/1ur267HWh
	OL
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008319637.3.1793724459651;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008297637.3.1793724459204;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3400303b3a.37.2026.11.03.08.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:47:38 -0800 (PST)
Message-ID: <ef38c950-5fa4-4b57-b97c-8f306b2295e9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 22:17:29 +0530
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
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
 <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qKt_Mt5V8rCIJveqx0L5ooefKrM3ub6r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfXyV/Dg3VEqudb
 Q55MU2zin01IfqQj6u0F3g++1Za8iz7R9jch/89sdmTUxCehkm8uz+WIZ/h8L091/lGmoYOe8sZ
 EsoxIHrGE6YIIGDiCw3kxnc31mIpHro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfX8VWO6M2yeFz4
 qeBqAJ3MzfmoTfJYR7wVJSCiQrmmimRnpAoIjx4MWPOE8lZvC3nsqv5+6I9koeWEIZHtKaWnGqA
 n/y/dLNUUDkOxEfpovAtK8bhGeVETUIo/taF0WjtjICsDXJNi46unzmD2RMxRpJWTCNRLJ2o5Mp
 YqZ9wACagJ7pgE4YQwsdlcUPyTXLq/2S59Kd5tE0ru5V2DT7naENx1J7l3JYLf8ML2G2Ejkj/9O
 mXcnJp7/mIY+4voIToZjnRzv8+TrVwaZJPDWCyQdtTXJVC9KqHALtZ5ij7Q42VZ+MzPdKRIVMoh
 gFtS6d0tV1NJef7/2ZSd4YmHLwlWXz5Ac5PbqSAbsRDrrck7uc2Xf/w1C5CuRs1gBbADz7KxLGN
 vgbk3ENW7SoHekB/7dRFvMY2gf2GdVFB+kVYNfD+MNpMxuqYvqYc3LLoRccuGubQWs9j3XghKHu
 B3QJ+5AmH0BS4sKO2Rw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6aea102c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DwxOReZszbjtibhM6OkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: qKt_Mt5V8rCIJveqx0L5ooefKrM3ub6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030066



On 03-11-2026 19:03, Abel Vesa wrote:
>>> OPE is a memory-to-memory block with no board-level dependencies, so
>>> the node is left enabled for all Shikra boards.
>>>
>>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
> This tag will probably not be picked up by b4 and it will probably confuse
> some of the scripts maintainers use. It needs to be "Tested-by:".

Thanks for pointing this out, sorry for the typo.

Please use:
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Shikra CQM

-- 
Regards,
Nihal Kumar Gupta


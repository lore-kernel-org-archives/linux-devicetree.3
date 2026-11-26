Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704760;
	b=J1hmEEmByXwRZI8OukWZij0imXUZlMSoMOfCQmUISs/gnNkyW8r4U5w7SaJuA2Up0PMy
	 XlweID5DkahWXp6oOUNiD4sffjTOCnvL5HXrSuIKRNLZU/E5qLrBi2mCFumMeVVW6/4aD
	 uaU5oVDIHDJGSzvOn4c51NF33cpn9wV/uGmdxVQ43jmsV27DqWMNUqc9J5Zq+ztKL0M2u
	 8WkcBn6ndQO5+urVeLzkZ/uDq91kqhqNOjEmqS6l2prloCMuRyfYTqXgerxzhQYnrlo2o
	 Xh5xASdxjs4drKqLCqtsyqsKoDr39jwmWzERlqd0Za1lcQv0K9WPMlpyVs1/XUAeKeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
	b=E6gtLTM5YN2iboLs/LuI000BHC0K4UQAcX475t93JWWJiVftYg1+yUl8q9db662E+6Sk
	 Rj/0PdjuTBapsnZ19q9tc9qY7NNJSevhp6FfKM4OdcRgeBukeNKtlKpFxXBcZawZk0V2w
	 pPvy6p3ByPTJ5GHD3TmxWFc2ieWp8lvhZSmFIZFtuz+VrXr1o5m0EgArenvKDfvYl1qEa
	 hkfZuZseicWPnvWu1uxsdnTaJo6UMRHepzMoR7+R3mbLIsA+5Te+aliGuUqv5T9MwzOxb
	 9uwvhAX4yP7urpd06qVYvljosl2HGEBo63WTuCC35FNW9ymBc9rqgzZA+93KV7jk63g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AI3Bw4np;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fso5GcE4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14497606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14497606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AI3Bw4np;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fso5GcE4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVYmc3298771
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=; b=AI3Bw4npSU2oaWtt
	G55jW4G6xRjVrK9rstWXiuIUDUWauueM1cSfY7lyiPftN9OdUiTlFa5ameJvY80B
	+B32cV1RFuzvNm6ve4tBQ//4bD+in7UN29gTT8qbqkv+Gw4D89J2lk6J5I+jXxo+
	olo+Qkdy6vkXPVD7Ek4oKSM/iSTx0nTfRh3ld6+h6U3UhtsI4gZYCjqVkFVKtilh
	N5okf8CBNbF6FRaXv9nTh07Y5jU3VGFYcJT6PU4ol2wlJ2cz/6+TlBdVD06txpr2
	hiErXVOpOATPSNjGUSr8ekNfGxJVnQIeCyLV09X3ceSjTyGW9bFbBoX8YxZnDWnM
	UnVGjw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02qbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:38 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso296860e0c.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704758; x=1796309558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
        b=fso5GcE4xDq7wrTe7F1sR0CT17LTvMyniyT4w2Ftcv36mZBxfdGSyI84DuGs/fBNKJ
         YJRudVYzmKlNagJ4VjGJzPJSPLPvSMEcyaxKE7mc7TfL7N8GYvsjC8Xh6nnM7KLWNelh
         eWfvdKhrqPWgoIk42VF+qEnF5SfzPRjjP79p4LNtlNB83qgv3zhg7ickXstmuw4F2nhn
         GfxGAjSYVmB+q+3YRE+CFoEZwtvKj1SsxtJAZ3jeUhGzDw1xKCaZ1im3bgqJ3+8SFbA8
         r92ybdb3OkjlwYYIgNDJU5alVbUQ9257a/MdK9eCRBxNgk+Z08CnG//5Dm+Hn3NlUqcd
         NNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704758; x=1796309558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
        b=T14LQ6bPbRkJ5Y6p3la1IGrJK6PNTS8xkBXRhf6VY+WtbLUm+i2Z0VwuXz2I+Sk4bm
         w4NtKEG40QI4KagbSm8CwrQhAJfC+A+nczLZcyhnU68/wb8QIuPREIzl7gMxfuPEr33H
         B/mNdpdM1PA/mKI47iVqRKbBQfRdnKen+10rEV/HG+BUJG1oRlVL9T9JRzGXEEqA1WJh
         yijU+FQughLRBETNS8PCdFJ473Ivst0FsN++fQXeHx4dbGA2V1S+WHpPYs1tqpTvCItm
         qMP4NWMy2k+zUtutXRae+HzHoV012mahCwjMMFiXOJGGT/FR6QsaoCWTGOsRVxRNgG/8
         abbg==
X-Forwarded-Encrypted: i=1; AL+hErFJgqeQ89o+t8VyfPwZRdNYCQbBeG5RoegNIokBlCDZHc+TC/OWsJgFPGfAgnMe//o8N+zuwbzO9JKy@vger.kernel.org
X-Gm-Message-State: APuU4Z87T7S3wk3cjwAwc7jZbDJDmcTYsb6W2XLtsc6yj/jrFul/cgvO
	9ziR06A+078wecaZn2+qUyEDzEDV8qrOi+IzdKpT+wsgk/mkCNm9KUB9QL5IfkZDMW76+MCO87h
	QDYU+B6bK6i/mCEvn6k23ifJHVu5gJ61bLZ1LcJSZeSZBR8R982CcRHJ5I+7LQJKt
X-Gm-Gg: AZFdTZdDZixB01+WrFuy4ZrD1dRwHZip0EF2PkFYcDbE5PHXkZzzhx1cTbn8zRGXl1g
	y4F1j0PmMXPeMoYRPEXhkENDQMDBLTFZ7ZIV/TtrR1Jg/uaYkz3vmOq3KseWXzSt0YA7z3GA02B
	WL+FDbuzLqO98wUNdTF35QiuF8u/IR1bXxK2fHkxi3uZdvuEffWNDKvUpwPvN5UcZ08xmys1E6z
	40tEoUSCE6CN6gabxU4rTdaxVaswDLKFvyYvRjOaYpPXeAUQkpPGBsOfKqjkBU/NWid7H8HsO48
	alocxCmr+GY0Bs1pBzuB00zWehsQK0nDALv9pVzpA80VuQVVkQi1BN6pqbZRwWraS/CHd4PGRSB
	PjKnuHUzzgl2DCkKfqXO/6EhlBfp8YADmLqdasp0oX4emJ7fik/KhXlxtAjPeJ/ZjM45iTeM=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr18380997e0c.2.1795704758315;
        Thu, 26 Nov 2026 06:52:38 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr18380954e0c.2.1795704757878;
        Thu, 26 Nov 2026 06:52:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm9871519a12.28.2026.11.26.06.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:36 -0800 (PST)
Message-ID: <0caa0ffa-edcc-44a1-94e4-cd5ad52eb80b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:34 +0100
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add rear
 flash LED
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-3-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-3-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b0847b6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: poXmZhqKYjellENtqbtQwV3KhDWMwsjR
X-Proofpoint-GUID: poXmZhqKYjellENtqbtQwV3KhDWMwsjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX+IBkhPPFogQa
 hP8smR9siCiqZQfCkTYijEdU5tHt3cDAHWBFQH/ieyHoTvh76R2qYs5bfTqb3BdwlksGRGHOL63
 eyiTK+6xvPpcuOqaM0gR1zMXJLT6pJV//hTsnGNLXtEhD4vRN72V973e0wovMS8TCb6Av0WeYfm
 knlxWs6aTeJpiXauWGMCLI5drwzqwNBma1k8q+o6lajBD95BGy+pAmNEVhrjBqUdsGHuLp8Javo
 FnD3OMDphopLoRiKiCKO9pfToYfnLwxwvp7U+0mXtnI1+HXnNEbgbhcZJPcgeRVNWWI6MydtfGx
 S4AhIHrll8CUz0vCJgilExkcEC1YR9r72fwKU0EnvMUP2gYIFXMrt4mal1T5192ehgAmviyQUTJ
 gsPf5CEYIBYRJ2TNXIvJk3BaS2Gm/rQgKKS6GklyBB525P3CiKnc15wRdH6bDZLK/i+OBwJTUyX
 za7yKHLvFCcwrG6d5nQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX6kNSLuGjiiH+
 2AJRGKd4TovE5nVvjkHgahDMjhVXoUsV4bfqCnggNPZKT9plsgAuZAibeuoXkB4pZBWTn584WYA
 dyz/BvzbV1p8zvqHUHnHnwguqGSv2+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The rear flash is a white LED driven by the first two channels of the
> PM8550 flash module. The flash current and timeout limits are those of
> the vendor kernel, and the torch current is limited to 500 mA as on
> SM8550 QRD and Xperia 1 V.

This comes from the hw spec of the connected LED. Please consult
your downstream DTS to prevent potential damage.

Konrad

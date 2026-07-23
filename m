Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9B3D25A2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791624; cv=none; b=QaZXd6lWlyRv6OF+gnjn1qCSLQf37myZYfyhA73U87lSAuBOy7mI6QLzs5NOUL3PfhBuNjyI64AL1Y5NWGcYFJ8G6ahIPVHZmSPPbliUZu1AAbgf9GKC9+/wz0NzuHvXDZgCbiCqT3sey/z3YTKj5zwscLuEVd2QH9scsoxCp+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791624; c=relaxed/simple;
	bh=SZxLuPo3nupO9EgENaNy/Na5GfdFyAFcRsipN5CXojk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkECH2T8nJEB8yin1ybmPsxFD7z+IcdmpC6aeyJfHWjzfrt0AjW+K15C9hFOe8DtUJXzWMH0xql+ZQB/QD/munD228xrZLk0Cfbj3yugJWFoghzA1h/id5V0rRuwLuPHho1ZUu79QcIwm6gf42qfZx1lOf90Vqe9dxPFTPLMOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWNBaCIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kqc6VrYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWNBaCIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kqc6VrYz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BcsF234546
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IrEKno5Qp8Qgk63iqK87KlZZ8lw++1vvwO3p9fEpe8=; b=SWNBaCIBoCrXCxRx
	7Sevj7zLzk0T8W7Ah6oCtPcUXZ1SlKCXK0L/v7E3g5RiTk41YjPfBtQEBri6IOZY
	ZyKa8oRX1PUSn5DVkaaGrfqWgvnl6Keud3qUvHIRyyhsD0nUbh6vB9NsD9sa6KDk
	xyZbcXNfbH7/UY6ufqFbZcZnZGUMjji/EYcBoU1aadS3Y/HfbiIxql3HdqjlZmbT
	f9o0RScWXIWIipzheYeiy5ymy3tWpW6sz6YL3iJDQuXEfnxD0u6W5g2wVM6igrtw
	nQN5nel14LhhMpWi5XWxgEeXpqrq5CET3gbeSfK2Hv0JdfQy/n94Z7muEXKO6XUa
	/tk4DQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xtupv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:27:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so644678a91.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 00:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784791621; x=1785396421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3IrEKno5Qp8Qgk63iqK87KlZZ8lw++1vvwO3p9fEpe8=;
        b=Kqc6VrYzyMDUVPonPlWixDGxPlDMbljHLJT/bSUbPAiaZyNYsOTdX0cZsSf7GBwWQS
         5sy4L+K3EFJ8cW9SYl0IEqWv+0CL7XsDHWMpZ9J2UnmG/+/nfC+vMdlmihdbymBXJz5q
         YVbr2Ga7LhB5pJrHBKaEAKZd5x7hh6+WAEGiF75hwD33cb4qXuWjeafzUxup+py6AZSL
         ETGZi6/ICmCWb6SNEdrF/aV1CDglw6fEfkT2tTHo4DyWiKESAiQfsK+N055Y45CY0CPU
         3YDaMWTak13BBcnI/p0JR+7is2JuQWz2J6I5tzC+eRJATwxAD7r6RKmfjSbPfRpA3Ari
         gI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784791621; x=1785396421;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3IrEKno5Qp8Qgk63iqK87KlZZ8lw++1vvwO3p9fEpe8=;
        b=neGOTCh2766dY/9bs3ZO+xlaCsQwpM5dFeXgisqr0FgTX3J2P1lR7+l9W4ApTZtbnG
         o5Ttop1PGiLryScAYXfl+bldbTmsT1FPN/0aYTuKdUuDUahTzlAd3i5Y+shIb8x/Aqib
         nWnMRxhg8Dud9kPU7U1ZAQ21WQ49IRzQLv40o46x7vYeMtJgzioniVxxgkPndnuF4ErI
         7UvSo7EHGcwdKf4qX03YYduNGeZEGsGHZHqS4y8nsp4nNuxsKNyZEa0bEKM8+c9z0FzE
         jKyA4IFIALdNin0Co7NVx3yHYVQRcCopa/0BepTq/wCXLoxdjs3gi1kL7bblu6rKIQZy
         iJ3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr7uhiYFfGFjm73FjMxKuqyiupdtbUbvC/75x4CUnVEPli0kVVHGbV3FHheK4SS5ZTLLhh0D4j3O59H@vger.kernel.org
X-Gm-Message-State: AOJu0YyBCMvJxT1HZgUspOgGy9Vqc92UEL6YShxL1imAdnqRGKsPCk1G
	5/TXQyb4HkHzFGX/5xz60lns4o5C+d7qdSCvq/pt4GtmkvXPzaGopvdTiQrkmdG2O+nZNv5Oeb0
	uVnlOdjMd5uqqRKPzj+Zi1+LvKZUB+PxMutyPY52wOM+FipPT5MUocoX9G0oHBVmU
X-Gm-Gg: AR+sD12Zxqa65TvjCtJP8Pkm2fH0yDf6OF6P6EhwXnjFfODiK20K2aMwHKY31yf9U/k
	u4eNdJXPJql5OhtPgyNfZaBsD58LS/xyg/CHS2IVz8L8LPT5FPnGy+SX7SAk3ncOuQq9s1urQTY
	YDzcHYCZhFN02uowDD8sLy3Lyos0cC1kSqdgcwJVs3h5kC3+LYFmAAdW7QnLTzmprbh0o5LJ6bz
	GrXlNM1jPZX4TT/HLQ52aWz8CLg8xuMnAfGqm2i1QfpAXc3V3cCWWaO2wvBPa9x6lLf1mesUKW9
	cKzmvb3UUO7TzUCx2HlBsyOqYb8zVSjsWkG7aNCBF2UGGatnfEXQ4IlMxhgNFEyvLsYb9iVvULG
	wEZJIDSovQzoV96cEhSxuVMBjGrQ=
X-Received: by 2002:a17:90b:4b08:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38ec65fc538mr2037598a91.22.1784791621010;
        Thu, 23 Jul 2026 00:27:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38ec65fc538mr2037570a91.22.1784791620591;
        Thu, 23 Jul 2026 00:27:00 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ecaaf26e7sm518567a91.13.2026.07.23.00.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:27:00 -0700 (PDT)
Message-ID: <bf2b6d96-d69e-42d3-9ef4-f5c1f13328ef@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:56:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add x1e80100 support
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
 <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GzuTmrlttfwoXcsnZnPVBgfbez2alHaH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NCBTYWx0ZWRfX2TYbGyT9wM5H
 vxuPQ+fO+vpeezilNj5Qj8hLwc88BK8pN8clP/CmP2HhwRIxmOgTsARsJaYQqngyJRM/+5+U3me
 xKE40h7IQomLB6d8987N8eQ/ukdlso0=
X-Proofpoint-GUID: GzuTmrlttfwoXcsnZnPVBgfbez2alHaH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NCBTYWx0ZWRfXywHZOqSuk35i
 oJ34C/DnnjMDkIK5JxvjTDezsITKw04QVNrTn404JfpOfpoFUOfY4qITjvqK0i0LuEmAMfXs+Ly
 WyhvOS+JjHktLZTzQG8Sq3CHhHrzTT1spMXRk4AJc0pvd3c8T7a4FAX2VHOj4pZGnjJKFC83f14
 K3c9hK4YevFkbrAgGEJ5Iyz1tXFhmwPa3Myjb9mXohRTCZ4Y96EEXnlozyFilNoxNr39/izZ9ae
 PfltCZuvb2DXf/MMJmg0TN2zNGHD/KpjDaOWefmhJ0mVlCx18zwHo+8MNjui7EWD/dS1OeQNqF1
 JG7fPrZTmgFWtncr5Ro6DbBvk2T0cafzOmRmuXOIoBz0ByMX046tiQ/hn/ez7xnWRhE2Gnesokl
 MvKz7fu0GKA1GhzG5udM6s1FZeqqX70Q8d7wSRObSINdIHp0TvQReVQN6QBDRUEs0RmFlp/j4Cj
 mLBE6w9Yp5JE76vh8+Q==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61c245 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HSc_6wNcEdKxni9k-c4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230074



On 22-07-2026 02:56 pm, Wenjia Zhang wrote:
> Document the compatible string for inline crypto engine found
> on the Qualcomm X1E80100 SoC, used by the Hamoa IoT EVK board.
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index 92c3ba6eae13dbd8a6a448057e942a08cc3a3ea7..07d6778a287631262282d75c0d233919f4241edd 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -25,6 +25,7 @@ properties:
>            - qcom,sm8550-inline-crypto-engine
>            - qcom,sm8650-inline-crypto-engine
>            - qcom,sm8750-inline-crypto-engine
> +          - qcom,x1e80100-inline-crypto-engine


Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

>        - const: qcom,inline-crypto-engine
>  
>    reg:
> 


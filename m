Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793682957;
	b=ZJUNVGt5MRQF4Oji9HgNVo++goEVLSSWZwpJ2SoEuDhPxKTgO+T03N6SxFOWE83bnpWw
	 OkWreazMNekfj6QsdHzDvzv3OA+MZugKPdmburDNkqEGgaT8qkSvz3fYJuAembayriwZq
	 e9WoeAOcxwyRcJ+ffKG7Eue+4ewdqeZxtztIr/S760nK1POTAv0fTIi6LehdvrLgn0kPd
	 bUSNWVy+IIPx3NJvOCc/nTe93AfKN3oQjTmGJ9tXZuY0oifVlJcswhmdJATZgPBAv5VYj
	 SDOjEdBrAKF5CyWNw0eCX/9/2fisqesWAZj+soPZFUT+d1sW6N6wsx611eQxcFst8Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793682957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
	b=K/8IbtZ6CQKNZt4Suc0se0t4ZnCYyntoIJcb/TsbjDeIwTTIqFzNYuI9eO5ZjxKgcVB+
	 ZcYrR7zdRHxHhfzQrw5Yt5jk1Pab88p9osLb/kdBOBia9WfA7pCUUj40CTLP/Fz6jni6l
	 V5NHR1QyZg7kQ0DnbKKwu1F6LddauXNobycKGPkheDoHVjoD8Up4xAX2Gc3+afKZMEFjB
	 dfo4oFTAqEk3qpk0/eLNP7Ebt7OCrp7elyIaDRjedrELVY/agrMGy36xVtCkaNpFzgszu
	 7q1h6Q1bgfcqmE0IVFy2GNleA1mssJvV9r5kCE1otmbXOGgmGp106cekry/nrdP0tZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORvIJS1n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+alEup;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED5A606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 05:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED5A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORvIJS1n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+alEup
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32ojCe2609059
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 05:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=; b=ORvIJS1na4Fn+v0g
	HinKegmpNDkvU7G0tetJOyhqavkqpXre145VlmM0+jKXaQHMghxlhdRejYPvQZmC
	6nS4kryPLvxWJZ7YjUx3cgOeoMANYeUrVffL23zQoA0eta6Nk4inQANaoxJIAFOj
	6Na04QeZmKDxauru1pTAUmhHOQyG5BwRFxFJ36vrx3LjaskEmacpDlHLcm1DjEWa
	dDOoi9ocDLvy5TaARCk0nZY1PU0y8TffXMSLCjSBerZpeD/w2E4Ov61E6XzEw8tG
	D170URgRj8ylBeMEtmfx2rK6AAVo+SMtdWHXAVtmw5WP4qnteHwGNybPaxTs08bC
	OC66vw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d8ew8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:15:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so150034a91.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 21:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793682955; x=1794287755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
        b=FE+alEupiVxijjhG4JjH+aGSk4hEpVFNZ36t5rFp3A3mNElh8ZiQZFC1qGwusqiV8M
         pADYaIxg4rxdM1Ku8DVzrTNHdYGbI3/X0OMNyE5P1YRi409n+QwKFEryZHnoUY952HX6
         G1oM/eEXxnSG1uEuTT15ydHu30vtEFLLdRj5vgtJqjiefg8SAnK2uaR2M9CkGKxOx19Z
         SPfgDILFeGkvXyk/FGZxvIDOo27EY1jM5Ty0Pnn1jJWnfJBypleq/q+gQUlo5th692c4
         Ll9CNanx+sRvjVf3j30fPcwWtymxvRs7Y8I5RjO4D6OqUGgmyUFTpbkrj2+aXhuDI1Lj
         MHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793682955; x=1794287755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
        b=aRqFNXNYClqoic0MEv6pY1/1CVbsdbTiS9D08HcvN18AAcbibFILcsuRPDT+pZE8X3
         XGME3oyz5fEHNWUhsC41Z9Gjipq0dYfHzJp+pcTpgnI9qhsx7HlJhPseyF/aWJliEDNH
         9I13/W2lZGk0iY2tIGxQfd+bS7drdrV4q+/pEOruVPmHSllb4HtVSTURCcGs3SO+TYIj
         zos92eQ4md4csyWLLz7ixDao0rLk+mCF1YxPvF3rMKGRqPIQTJN5H5XFBAt00p5lUnFJ
         qlPKZIrIQbJ5R8EO7yT9IDUh5yOFDwl8jvl47fdTYFbIdMeJ/1hdGnKf/GoVbz9qwfJ6
         Q0hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVJu8u0tw0Wj9ZaF+b1njLcBkcsm72uFcayajfkvK5NSdpJIK8ksHbCH0hD34z9IxtGx8vMpT/e+l2@vger.kernel.org
X-Gm-Message-State: APuU4Z9qq8ewFDZOiGl7PeHhrK7ExVZUJ4gMvbrYgZIN/z9l70NQhiJQ
	jAPksAHiulI2pW6jTGGwXMfaEa52XCDNKYSp4Yu2HfxxVq1GdXdjnv5KDdb6E+EP3zAt3P2Nz9c
	Wi0QNpFbOgokHpC1aSlbmz05dslx9e9Omb5Z8ODyKatkz7Dwc2nvYZR5qMqaVa7AE
X-Gm-Gg: AYBFou0dNoNIdT5dURHrvwyp2hRcT3apaGPzmLkVEHZ9AXFYLrQOKXishsapXOdTI5w
	AyQypPFjFauxRzFZSrO57EgCVB9HVX4h326UNxGYMRQjuBpzlAIGWh37W9kv9rt/TXbN0yJM1Hu
	hxlEJoOt1qwm5GSilUvY446T3Gno+eUa9bBU22zYE2gYRmWkuNtsSOsUsNBlD3whjcPgTpFPWWe
	eamixhEtKdAKW6sU7bLoGN/hIAERbleefNE4AzgRgoPbo9NYyOwd2RSVpLR8y/Xp3J3Rzmhnlxi
	wkmRPCC0JSohe7yCMyAvC+fFntrn9uPG6DpODXuc+J5+3aNJjc1APHXnIsB2OT+eqM4eoN/YboL
	DzVM51knW1fWbGbYtMVt302aWd/iv4x8KoFpUJF87F8GiQeacZH7Pzoau04bKgf1OL5AE8Y4+Sl
	RwiQ==
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr10861946a91.62.1793682955138;
        Mon, 02 Nov 2026 21:15:55 -0800 (PST)
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr10861935a91.62.1793682954712;
        Mon, 02 Nov 2026 21:15:54 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5814basm2423083a91.2.2026.11.02.21.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:15:54 -0800 (PST)
Message-ID: <43f340a6-3999-4cab-90dd-2cf7a537f5a4@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:45:48 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
References: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae96e0b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B0GhShHi1rKA2Csm87UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfXz1SpVOzJK1Mk
 zuvEeuJUGu60hdwyqR/UhTiJk55Ec53puq9BI4HIpKfvhmZpcQQT1vO7lBR0/9cMLHvZ8xxmUWE
 k867MhXlF83XjTp9Nh70oXABbV8oXmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfX33Equ5kFuS8n
 UFIrAs3zcCZtQjsir60Mc6RXiGKd9Ud+Lc6ocbzvLs06Mqng5ojvoP8fsruv0LQuky+N0Cr/7zr
 feb2Rn3AHu2+84jl6hjTj5ra21lrhuDKceQf256K9EMw+OGR3iTCDarJ7jckIU7TRSHl5Uec3Ab
 sn8HwPdRA1S9YVImIv0YouWX/cFnest9JJXi/WK3hFBal1HaEiT+V+UO+0SudDSSLDQGcTSfzHA
 CchyfmNwDmVg03k6W/HCUz7YVZZsgw0mBJTOhE9otxSWkvUMOgclPfcTvIbvMZPH0RmDCjDtWME
 NYfglYD9YmypmILVtHg2je+X1+zZTvgK6Ki4tb376hhx+16KpibXwAbleSM4a3MzNSlVOp8mcBj
 vCtVZO4sySnlM8EU/cKM/i/YHO+XKgk6q9NL69H9MIhSK59BzEPU4J4NcFKRE0jBrIcO4JZZ1w1
 zZBgnq5U6vuRcqUzk7Q==
X-Proofpoint-GUID: 6pPsHLBcSVk77VjAc2IsXWxU7V8w55y2
X-Proofpoint-ORIG-GUID: 6pPsHLBcSVk77VjAc2IsXWxU7V8w55y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030020

On 29-10-2026 20:11, Vinayak Katoch wrote:
> The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
> these two context banks fail to probe.
> 
> Fix the masks:
>  - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
>  - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40
> 
> Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B8517BC6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060822; cv=none; b=JDwHFonyXBbDjXR1PaX8fC0+FfC4l/Ew9Jp82cOFyIK5QLyp2hhvKJ3DEBqmNepPuMfnpXwTRmupv2hdCwtTZ0QUN5TmCnUx+TcsS2SbKfU1q0aTtqVe9kA1Ti76sX6pYnRTwDxrPAn7CbNmReO1CeiJJq6uFIGch+3OkNYzGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060822; c=relaxed/simple;
	bh=wSNftRjlmC816H3vVNI2YUYCRfcrqAPU8eOTfIKmBEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf/EMKdx2rmuKV4wwdmLqOkmgpV2c9oEzvfT7DRkbL9Mx2L3ze6ZQzKk4NYvEHinYRQyoXrCirNQNUSma9thH/GdlJgRUvCTI36vMsTeKoAy7zZE2lhcZQhEb1IaM59XlV2bTYSIIQB9OtmG/Ex3pZD/c7LBVd1zgdurS6Cc3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a30+kFIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iqw2fcKj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a30+kFIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iqw2fcKj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kFTZ2999159
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=; b=a30+kFIREsx8Qgbu
	iEq6xPiywjQNZTCmMZHbL07xnHF/EGA7Z6JD3asLsAygukqydnnOjWlIt6Gzn50v
	GwsgS+kghaty1SObscPu4YyZ+awnZWbPY1CAq2tjrfA0smLV6ChQ+2keXbgsG1Gl
	DwsV2Aa3eWa9pKRmqmUiqAf7np4LGVk8NQbSbXIGqxlhJlt+KhRQNDEqJ6G3T9us
	pMiaPBRoW7zwEyioMps7ePV/qG8LkWgoipNDr7w7sr7WO9FZv+amzYzfUMqITyHz
	11XDo+7Cs6cM6xKlnt9P5LqfmZXjcdGqzD1zO2h+rTg5/s/FbueOY8ZcGbk7Kf44
	7MAw2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0fr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:40:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc19d8e59so61647885a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060819; x=1792665619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=Iqw2fcKj2ooCBSARz2rhJF44VkPwItleNPr4EEtsB7qmppscFmKuS7hckCibEtvFVN
         zaik5lFfmu2bLjXne51i3DuaNVRPD1krIVdZ3GbC5o9TJcgA57H4KRm8HthJAB02OfHS
         Iuuomn+BwNCRJrD6ssg6hR3p2/Ep7Bv6v2VGFbaokm0oYSZFDWC043c9WjeCqds1d4m2
         vAknwoLp4yZOE2wb+nFGyc34ScYClqgCG5NmTqleX56UzlIBYp/UIBhGL1p2aV1Ks0n7
         f5dPWHO49QEr2qU4/xKazYvxY1AaZDAzMf5sj3I3vbVRBCqUDDjzyBJOkAnGnl1Kv1lh
         735g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060819; x=1792665619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=MCt3113Q1Li0XyMuln3aVjpMMxwSc+ELwaYLW+ndQYEJTX9NwHU052q34nLzb+eO6Y
         6UfVXB15i7mClmeaJCXh8F/Pwwe5D8M4UOktfv627skBmpiVSZJ57c6E2GxnE2hIicLf
         4wW9pqDK+2LIXa/OoLb++PugH0lX80vExyYK3oXWdSZb6BxtaTVLad3tHbr+kH0nVLPN
         lMxxNBNgNUgU3h3KAa5PWYHBYZ7O+em/cV45JTogri1fQm+pmBYWBISuG/ZE4J9RmzN8
         5GjEZtYVar5jLFqHbwHzytgADykz8Tb3HL3sJI4pD2/Si4fszav3/aLTyhjeF3/Bsk6N
         wwgg==
X-Forwarded-Encrypted: i=1; AKwUvBw7lyg43bQP3v7De2L+eU0gIcygTlsWrVU6e6sV7iP6J1/WVa7WKsYtnzHfVjP5m6dYWRHk4odGvnv7@vger.kernel.org
X-Gm-Message-State: AFq9FYKRaw+U1OTRxoPDTA4aOljHcgx83qDky6aMVhFJFMXzvmkCvho/
	dD0mgEHTpx+jE7NamRLjjK4Y2YdbIRN1mIM0TskU4tQ6YuHzfAH7I90AYI16t/k+LvU0yLhNTMu
	Nf9FUJy0Ucorr/iddmu3/c5YGrjVxxwlRg0Ddgpfc8ZOCbMv2DsLcHI0Jm6ieNRlr
X-Gm-Gg: AYBFou3sJK+xPmH7R665EvgaZjT7x1XdjzULSVwH2bmE94JzJsQqiqLf0JOj9y/+Ve0
	xdEPZOLU1XflsgesXkjFJfMOjeKa3Z/mNcrHOFyuFFpqMfycqAUWMLDwoO8oZXDm1ySac2ZRDMG
	IcE8Vh6cWjO+MywCusRVP1yFqDoa36swAWZXRa334dcOvJxTM1zRF9kQ+IfbJY+RAPaAikAPkIh
	05kkc9Dh2qojwhwiAjvr+ng6utc+5EoVa00RLhyNUJ87l7/Ni51GjBSQYm43Inr57Lxptb8H56v
	AP6l7oLWTAEWG+SoAR6fdi2w4d3VkTxStLyZF7lOiU1s2u+WSuOx3MR1T48fqipbv71vBlvW1dP
	4JrJfHovdOs4Ur2uO8DQiGQ==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396442185a.3.1792060818907;
        Thu, 15 Oct 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396431485a.3.1792060817539;
        Thu, 15 Oct 2026 03:40:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0c3sm107372166b.44.2026.10.15.03.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:40:15 -0700 (PDT)
Message-ID: <890b127e-746e-4870-9a52-9b716854ba38@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:40:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ARM: dts: qcom: Add initial device tree for Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sW5E7yWUnoehCC0sdwr11lkpQDWK-XVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX4NN3ZKCApidK
 P32iNtM1tJeUNj35uKimklhuDtUWO4hdootjYc/TOBolOM7s9WDQ2ldO6fKnJqE4PPmkcViNhqq
 kgbIirWTk6clB6YOQ/h++m/vQvx565ZQ9TJR3qssw9BI3jDlr2mF96PF3IAkaVATX8+ocRU/VmS
 NH+9HMVVRwhBo8dP3yMujg8WJNTcpaTydEt3AFX0ICFSEb2HipXJgpD5wdn34Q/mD2qmbEx741r
 7DW2NrcQc4Vc9chg9kCE1UqTqg8YAwFojTJrdYr8ihFV1CIT/M0++H5Pg5Og9rd/hDdKnVT4Mry
 Z1theTRXZpiz/7Ksiua3VERJrggY4qkMuOGskbiX1G6zOJ1p6hdogzyhgBCuc7m7a2yw09aUhX4
 YfZFytylZh71Axn6/Xew9M7o6GqXVp7EX1fOA5VTXUUVlb9MJMlDzW9zVvvOl8e/wWj1doOzAoy
 /Q+6xDzBkREow4gfugw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX+pC7s1Nv+GEM
 WlEyGzBua/JOowmHhY559zL3f2YzyDlX4QOgknHDYptmFlTsIfQO6mBzt+pJft7lo1YbFPeQHDA
 baNUsiDQ97tG3OlkQawqJgZ/CRsB4Yg=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0ad94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6qbC1cy8WFjiKmmiPwMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sW5E7yWUnoehCC0sdwr11lkpQDWK-XVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/29/26 8:46 AM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

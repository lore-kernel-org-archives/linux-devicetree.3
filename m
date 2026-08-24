Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956343750CF
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552949; cv=none; b=tKp2WNR+Ly91Z8viF1+S0J/uAfYhDZyz9EGs4gje4wlcAISH95wES9RmxRnPqNa6J5FMOjCSrghO6kHBdu00PRecHgaiJ/6yAkfUhHSsXjRMlMCRxbPUYy8K9l2J6qPsWnwj7+L1p/VOLJoWfjEV81q8CuzIytuBrEOyadZ0+iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552949; c=relaxed/simple;
	bh=op+XOYRJq04sh3gXNWeul76iO6T7iCZ2gTj1rKrfj2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPy5JeVRSXcNENbXWxr/y4SJdhzVDyS7TLXP/SmEvnhGkE7oR0lwvc5mZbaurX8MKTgA3tBVg84UG1dIzCkqcxM3K2ktKCslc73UwMTMTVaujKAiXmlwYUYAXmRzepB8uzKML24a6gIWCSYVlFoalcAQqcw0VqQm51Wr1Jgg8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBT36tnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8ZdkiAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBT36tnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8ZdkiAu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RHte1577198
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msf0BsVoaAbFJDAn5wjcuvBVEXnrv7/hlZQ732W3wxw=; b=TBT36tnGD2i023bx
	sTTJnoHcRadepDDHOFHmG9qrBmiXyqXMIJZCSp8iZEsS5wDQEu2XoziRHyrsEW9X
	Gbpa1V5lCgUNGCcBRKivhn2+fEXg+d7ZXbgSbjg5q/Vh4wWbaNSSNJW2+zhbfk6v
	H/tWZWkp7hqOceQ3+w/pyXhea9kpFqqhA5+7C5f4VUlD6tY1FDYiFrsGCIqQTPc0
	SnY8agL/LpKPGUvNdXovv2OFtL0bulOxOgj0qozZW1SUS1NjETkiAWrmVWSHDQ/6
	22I8PfK+elkfefrHJA9yaEaQNW0rh6qzAmOa/fRZbwFwW1oaiDi4HGffZWsHb1wo
	0786rQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcwgsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:29:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ddb567146so6511331cf.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552947; x=1788157747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msf0BsVoaAbFJDAn5wjcuvBVEXnrv7/hlZQ732W3wxw=;
        b=d8ZdkiAubqSfABvlAB71Ieiqa7tb3NKcja6vHX937qmYGYrAx8OW0quC2F5Qhf49Tq
         Cz8whAVfYd+CDbRHH0kVcqF+kGo8iReJYuM8dw84+7DTvRgTecxDYxhcTXZ0SUGj5nZ3
         JyKR2v38r1PnWNuBs/W8wOTvb2hoLkzKJocDcD7fjms26ORfgbB24suLbgEieDOg1uP9
         /2KKkOMe8SEiahi1DgiBO3pxOnK2eFpd9+KHj3a7lHdujOFdIxhHgZrB+g0Y4SJ1LS59
         HazmYJY1rG0ojDz4PrxEfEVMDXzQuhUvGxG4vQ2IFgNoQ7I2U1ObnttgmBP1R88t8a7T
         JAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552947; x=1788157747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msf0BsVoaAbFJDAn5wjcuvBVEXnrv7/hlZQ732W3wxw=;
        b=h6tRTyKgTxr80m8ewhsPVvCipjaJkMKDcytDrde3CtFcwtqmnKid9IBZaAIf8UOci+
         elV3aOTzZN05K7zyrL10P3kmcAebm+qMUF9WPHigOpbioGP0FhdWRKIu8a/CPrgONCPf
         DMLsJA40mQY4IzE6NTPcbbLxiBbOnQmFztmllD6PcNUQW82mcqQ20yYwlRPsA0axRN5Z
         EYZ50gBZ5TkvVfxyp5DqOIyVBLhCbN2hVnC3S4krgVOt8lUBKyKAgIoB0Us41a+plWK/
         +70GKzJKxPwQ1KSiK5cZF54Ju5Bcyul/gdGgUm15eC2r/CXZ1LbdAS6Kb4m43jUT6uz/
         uyFg==
X-Forwarded-Encrypted: i=1; AHgh+RqqOIyY9K5EV6HkmAPlGA7N5QAiEEES6MT94dztmIAUWokesS3+WVny0w15vU4VZSW7EZ6MTu/+9/Z5@vger.kernel.org
X-Gm-Message-State: AFuF++lqF6wgv7D68MJ15wIhumUz3dFzso/hADf6W01ih6nFaymmgbgN
	PwRQ7c5WO4meKefkgC4h+nQZg3mxgWKv3aWas+iDbY0R8LNvEJGwwkY4Z56Fwv8gAM/Hz+F+nOB
	wN6LPQh0K6Ynaq4dehr8F3NFGGyC4mRUSyc+wSQFb5d1HdxixmXEL44VmYuV0cTK2
X-Gm-Gg: AR+sD11EEvcTGoaGA4JcQ4PsxFtrfi5b2XMR+gqie2L0nRxizHywiN+sMZzhhX936CJ
	eMWONOkGoMFtnM6UBb8r0I4yRB+QaC7fruApI2yJxsG5AV97tF2f7XmyPX73DOct2ziMojojyrt
	q/C+FCmWb4mtr7M28iJpSVmQqVjXqXb6KoJTttbT6oHKNTjSvUJ1WsWQK+Im/J7Sc7ixKrrFpTN
	QoayiaRjDnWNkb5/d3M5JVI3rEyYfjXM9QaEhMsWAa9oBTkgP000D2eDl0M2OVYj+3rzKFA/+HY
	yEv7FMK9N69/3pZ60wQo4IlB2xYOlWdkzQ/cS44+LyCKShMH4Ey43nqlzGpiOITNtZ42/vMjNKG
	dP/iTKU6yFxLmnEkoc9/pRJJ+
X-Received: by 2002:a05:622a:1210:b0:51a:8945:312d with SMTP id d75a77b69052e-52df549e41bmr173318991cf.0.1787552947057;
        Sun, 23 Aug 2026 23:29:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1210:b0:51a:8945:312d with SMTP id d75a77b69052e-52df549e41bmr173318721cf.0.1787552946673;
        Sun, 23 Aug 2026 23:29:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295632sm1211537366b.18.2026.08.23.23.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:29:05 -0700 (PDT)
Message-ID: <6a496782-1bfe-447d-81b7-ef0663963b41@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:29:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add
 notification LED support
To: Reza Kurniawan <imkyufie@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820110347.98068-1-imkyufie@gmail.com>
 <20260820110347.98068-4-imkyufie@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820110347.98068-4-imkyufie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RYw4Wei0BofW683Gw8FzQhbY0bGwH-Wg
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a8be4b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=67D7fx9BXWbfjn7edTUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: RYw4Wei0BofW683Gw8FzQhbY0bGwH-Wg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfXwm+E2kPCrEPl
 pc7Y0z6swd8+XvX5oDSSwc9E647P+MMjXNoDda4ohf/03eIVJGRClwqWCW9eN2xivy8OWD4MPTe
 TV+22ISxwRUKLce07R5NFZJ/wWcLQ9LCPIfc5kj1LAwr244afxQuWRyWeB+ZmBWOmJltWhOy986
 TySH2Z5W4A4TLrHwcLUfMrImz28uz6GFnvDxuCQqZ1eZHCs18v7XbtfwGHrJPNfPrl8UCcDfF54
 uLxV4AodrZn0iyewPIwCKyxgnnWEnpHlLYLzkkv+CfV9BwkfjPpwzuihhg+yxgeSMRycmioEeUd
 LWcs/MDN0g1A3/qZkTtMdrBBAG6ZDMTXwD2XAyW3MSHkmBGAb6gfM9jYQPBxR/QEnV2jrWCvAbT
 SUxpzedCwiBvbj4QVWBp1LqUPRhM3ZZYVi8lHeykqptdsBZYchzaHkkPrIIab2+65RGBpZ0fH3j
 V0Is74phXn7qEBOOlAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX4gvvMb1D9xuO
 W4fltCz0F3ZFtNdMiNfMZ4y9T9wNnuzcphV2Z04v/N3uWOceDvOS+3TZo2JcJPTbFsS6epFuNfN
 n40WgmNtgIiP73nFS5gpGeKP8sEgMjE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On 8/20/26 1:03 PM, Reza Kurniawan wrote:
> Add the aw2013 led-controller node for controlling the notification LED.
> Since it communicates through I2C, also enable the blsp1_i2c2 node.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6B3BED42
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766684; cv=none; b=siey4H7hv+T2cLgejxlmFbWu+0X0sQOiPY85acQsNTPIxcUwV2tVQwJCvmTwBsWFPx5PF3Tinuu1MVTy6pi+b3At7EVSKRw6wznhQyOiMf1nWpz+ZUpStUMRRrdOQpALR3lbeeexve2Kn0E2MfQp6eGiMnPA1We3HVCBruoRj6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766684; c=relaxed/simple;
	bh=i7/Ddmlv/nASy9qZy1FJthLav9YvKAiAioDkGWvdURs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJcmcDjyFci7Pds7YH4qrPDbw7OT9fscyUiCYzhGjXx5KojESXlBM6c194qGcTjz9UPd1DMnbqxoElEPwbj1MXITxmG8gPfjgbfUs3oq6Ng5IbKbwA2zhBokHdHOvVFzJPP6tgNHPtm8INcfNVM8LPR930TBxqNXcNvcsUW+PVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDIEd0ga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/12L8ce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDIEd0ga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/12L8ce"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7Me13554848
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLSP6RP/ktPW0pVnkumOxr/DfzMe7aMYty59LE3rHJ8=; b=FDIEd0gaYezmy4ft
	kxcmynOkHQKgYz97TpHAfasoAOpmCtvyUyKIoOGiRCb9LB5zrYPrAT6LhgqfiFYF
	4U8HzrQOsnoxZt2D5D9xrSBGxh8o4X4IgIt9Nee4NzBAZUW0fR+2oue3cPSKR3fr
	snsXCuPYV3XmfzMcIMBLPgybjLU9a0vBgek+XPDQfE2wfuAHr3X9KBjjUyNPLSFI
	raikEBg5ZDcrI8gy73Bb4gGRDsNzUFevNH4cHxxEt9x1E4WMTx7L37HR4ZD5DJsl
	v29O19qW6f1fWpDoUeieuRrbU1bn1zVHKYbLgsCEOeO3nrxT0/Xbl0kaJAkfn+rE
	DKvIcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk89f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:11:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53320ebbaeaso8152651cf.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766680; x=1791371480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLSP6RP/ktPW0pVnkumOxr/DfzMe7aMYty59LE3rHJ8=;
        b=X/12L8ceE4o4+PIBEMWxyZRJNY/pvOW+K4CvSb4NkDY8bWAx6eq6yKkaw9+JncVl+2
         RVIlwmUKpPW+QwzhlLEnyLEbLzkk7JeH2gfXMoqc2rjxddxBsLEkduEYor8pHg68rsKs
         j8gd5I8ayoDNs+40MebqYeWfaubVVTjBYg4HOGDWECz28MepwFB2GhCRb96h9K6V08eH
         IgZoY+VfQvY4/eMC6n43r2I8B5P7F9GzBMDuKXD90mGREDMxXP7rVM0VpOvrQBKyWjnS
         dJMYK4Kn5dx+tkZc7XO8H/1r0UuRNEh7Sp/Zw7JBRYL6wwEI8QaJCxRjTFZYWdo1VId7
         paCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766680; x=1791371480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLSP6RP/ktPW0pVnkumOxr/DfzMe7aMYty59LE3rHJ8=;
        b=UzERBozKdG3OpG7hCf9++BU3+APeYn3pxkc5WnhxwcMrE67ONIhQL27H/ypj/mbcWt
         oUxduQNC3PxacJ04DMWQYRJc3kP1JqT3SPSstQexUF8juEYFDZ94masoARRibgWK2nkB
         xNv4NzE6QyeIQpXFFVqDuydlRDdk8e1QolaJULVmlgymZU0sA8ozFW7sR5RJBR8dK0dI
         ZtOjTIf+YHa/hqxAR7nG3wXWtNt6FaElFOpHAxi0P3zs/afbaT3+7x5laUOL1uMAQO6o
         3DJ7kUbLdDBHeqYi5hP0XRelnvRtmsgRrnRJQPayv/EoN8oGiRYXujSXERZpJ76LrYPN
         zq/w==
X-Forwarded-Encrypted: i=1; AKwUvBy5bxX4WkgoE/5LhVE0qTbOM+wNK6W3BDwNn4lZKwAQcz8g+Te4GRTZFChy+5+jybfIKVKwcDNx8Brq@vger.kernel.org
X-Gm-Message-State: AFuF++mMnUzrY0gSXLgFbJWgV/PCQcOSdmCrqy2oQiDw57SLAsazn7EN
	DpnpytsDyiC12CoAM0mVViL7ekPpTGxoZeUBpkPlYR5J2OxP9BERzlXUb2prnQpFkJ7O7TwbdJP
	ncKqQhBco7sl3GV5PtJfBv93g1hox2cRuLNf+sOxQLCE0fYU8eAjFh5Uq3hjTZQ3v
X-Gm-Gg: AYBFou1F/oqrEuvBIS1lalblNmjBfivT9dpoIItSLWNRvfqHS+09oYjSqIUmNUR7Plu
	SoFwNDpOWsd+/D1u33Q/G6raTFj5QNIV/CUaHqEkaQoYjSiFgYwytxx0Rdbj7TKKaqqpUvgyKCx
	Nt0qe1cmgvO/nVW2iNGv29aVPm62HNl5zgm5rAfV7dYtpiOF1JFXjivyFAOc2OwmCio0hqXR7F0
	FgxGVvrh1WgerMXe5WNGx9oG5uLueVWGNIbBx6z3h9aL3xfNlm7qaNM11IVUjjsCUdBij78ohoo
	WauGVVvgrblUXMAVQsxJzUk4O0SPPOIwaiYTskW2uurzDpTFFPNeg/Izojx6D1LSJ5kGmeztJr5
	MRSD//u6AwBioDjMtoXQ0iQ==
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr150231285a.0.1790766680521;
        Wed, 30 Sep 2026 04:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr150224085a.0.1790766679866;
        Wed, 30 Sep 2026 04:11:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7ea6fsm48243366b.40.2026.09.30.04.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:11:19 -0700 (PDT)
Message-ID: <84a3c9e4-4ddd-4ef4-a4ec-d71c30122128@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:11:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/15] arm64: dts: qcom: maili: Add camera MCLK
 pinctrl for Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-13-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-13-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JpdtB9RVHKwuQ4SGkDQX6XZ4hG-q01q3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXyIVZiLbq2ibO
 7PGGubDKIcpB3msiiAgxjsl+6JH/TBECS95LpsXJZgTqepW10ULPbHSvZazu5cpcOm7ZfyPob8K
 mftRd724h7yGJ6LB/flh7iN2kZbn8BncMZrWFIIURofAyjLMbXeKYlYA6q9oHMejtCCPopPXNYE
 4rEFPXTQAJJmR8Xtt9JvYZBpIhbJI5PCrrUNsYpsZRuWLnTUgtuejOP9/M2J5EoOz03kAIdom6T
 xhhJQzOx8tMR50R4NwLjvUzuiEiRAonT4R4fCQn99VUJX9W4oEN5L7EcOHNX5ihGZLxOB9EioF3
 /g34kSTFFllLbs0TpiEauuInVHNb4f27foaGH2xB5rD0IlUIpqViTbgftUSqB7xprFmkqNwPbHZ
 /qzzfDqYeKtkDg3Ptc578EwcBGywqwCwOiti6OK8uJIm82sfdizgvnEK4Mw7nUFbN5S6/M0POV6
 PqCEeB/U2NmfCpguzgw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abcee59 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2DWhv4IeyTXb80rK1lUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX2gOESEdr3GWW
 XRXb99V6FLAvgrRIoWuViA+Lo65z2zQnGDChaJuTVjeV/g8JCJbz1qgZ/q1hmjxpMoAPWZdUj4r
 9IRwwyFegoJU7TkHer+t6rS85nLpUEc=
X-Proofpoint-ORIG-GUID: JpdtB9RVHKwuQ4SGkDQX6XZ4hG-q01q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300044

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> Define pinctrl definitions to enable camera master clocks on Maili.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

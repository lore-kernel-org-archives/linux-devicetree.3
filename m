Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C23368263
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349321; cv=none; b=EHNSyvqoKpFO+ozNrjkoJlu8B6zE2oJ+6OgJpmySt2ZxXpgaY6xnBoNtTExtFw7ouTrQDqxRSNdtnbMhfclP/YEepLomOdHadqfIfbd/RlH3Nzu/HHr3hqqMNPFzmJeyUrTnp5tx8FBx/Qa3lCbo+8ZaUjSWwHrgNQcbVgy4S0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349321; c=relaxed/simple;
	bh=lL4bCSw68GqewS1SJ9/DkQuLrzIpX5hWINWoB6HXivk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFBhVUH6li2c9XmOlwLK0j5JzdKjUZ+VwmvzVcPn0hL8Y6aawTY8uXaOquHscV6ij+in60W74Rn1gz5MLmkYph25AAuzqJ74q+q3WqzZJ/JBTdh8GbYP96D5ZdxgPvIY7xG2M0RMIRAD7RyUjqq4d9dTolOYS/d/RSS1aIiTHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTx/fR+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESo2QFNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTx/fR+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESo2QFNa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OA30Om1762739
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=; b=TTx/fR+8Fw4oIrwy
	XTzytTc1BlGCrKqWiVuo7RMKYj7UOYWjwbUJwkT/8OHGc5unsOKEMY2fQB4rP6dY
	uTN9v9eIGAtx1DI9s3pp8SQkVmayI+TUeL+7DwstIqKoXdZCsFQfYj2frgQOxku0
	oUyO/5tTffMf9zbx+neyKrKMgJ/Z8aggiIPwcOOgKf2BgILOt8LI83CcOCLTReNo
	WVIPuU0ORHodmM9LJ5KqK76Hp4EYUW52VGZSjAwx/V2CKM0bvKkgo173GW8dVvtu
	PZ963vxb9ozdsGhhzwVpvGAyNnEPlMqJPE/LJC0RJx8yLe/W6SZ8t0CDjf4IyWyC
	HDeHRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0c3qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50943e69b08so41599441cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349317; x=1774954117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=;
        b=ESo2QFNauC/AegNNfTmL7SSBZWCUYvSWSFWVm/sY+nNvwgtNeQ/IQ6Vnn2/uQnNBQf
         1TnU3xVBe+fOCieyhfQsnoWY3lgYRLcA3ib3vgEbU/Bqaxh4DZhIBKEtZRY0vrccQZNL
         7dNdHHF09q6kFIxbIsVisZjWFAgMc5XyKKK56l/hdEXeBDDgTZSl6IZoN6aGoESoZQEa
         pxWXepC6pGM3ECntMJgoMAyjDw1BmWDtavCjRHt4y7gX2Apt8TGQav9icgo65ACULuo3
         d2PtzBiaFIGH4hs+gchyBuv4E07VfF/ZEhvzd+EHcvkcVQDHQcZBGNnxi2A3fm4CpIbH
         5SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349317; x=1774954117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=;
        b=NzfGnmAOQawyWDxh9QsCHJ9raaX3MRSMy0WpRxT7NIek7k2JWvo3NxJmA9b1ZbGqi/
         Zo6VIQ7k2BKzOXQ1Z8W9S/LovIFFwQZJ677Le1IpeZhfsBeE+AbgvZi4veMiEOqv04bG
         zblsVT3fjzgZo7QFnWjTHL/AdAiBJIUx+JjLEJzI3PnWRVoDcSPqA/GSIlMKHjNWeQmT
         mx+M0bIgZEf/eO8Gq+3/XuTe+BspgYqcEm3T4MxWlwJzDJdwcyhdTzemhR8WaxN71AgD
         b1TKzBcT1m+DzxZaIx5lab6zcsph2Ve/jfPPY+VTMWFigFGHD9J/V75cgDB2Qj3O/lua
         ASlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1941kOeKR+fJvImo+Ya5uo4iRi77Bhs66QHxk+CRTEbH/yivycaF8fOPW2uZXvtx2x2isL0BGHwGt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6quPFJxfWXDMmki8WsYMO66eVcgrmYTtnO52pk8/LuIAZDU3h
	i0pMdbBy93giy3ssmAwfjn/Svdw2Gux2xFlkbw33WKVOcuf2PpGsUOO8aHJhELvNN8tLcWqTUsq
	+6v5hDXdHztqvuKIGif1Qca66w9bN9j4zOovnBSKKWTOLkWVlT6YtihuvhLPa8Cf6
X-Gm-Gg: ATEYQzx63pl/2K6tbDziEi+km9Q7pW1S+IQyKBPoLcpWMPsOuS7HRRVODIG1Lz3U6iX
	QDjyCbXyZQU4Rw/uYTSp7CcQ5U6yX1VqXmMvWQjdx73uC2Q9fjxxHpWQ6uYaImEguPynRfbCzWV
	A7WV2VYuPnbzPMMrymNNtYoN/13vIRqMH3S7wEfyNcnAZxe2NVyHW/qNWG6nY9qAY7hyaIHUmRc
	pUuaHwRasABBO9DzitDq0Rba8Csa8PeSwOO/JLbEf7djE4uBd3GyV5nRFeThbr5ElvGQnYNi5/H
	p73blDcGoKYD/UOAHzNugvV7OlQ8DLWWynKPn511ykVaSW+D0Rg951gGvoO7DQiJ0E5ONgaVXit
	I4IDhfNiWyST7RFr1/pKiHPwqCB6Qb+bRuqcq2z1cByPCQRIkS7clr7hr+PiV/E56deZS+nQnPh
	0yeJk=
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175482471cf.8.1774349317491;
        Tue, 24 Mar 2026 03:48:37 -0700 (PDT)
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175482181cf.8.1774349317073;
        Tue, 24 Mar 2026 03:48:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm640162866b.4.2026.03.24.03.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:48:35 -0700 (PDT)
Message-ID: <05d8f1ba-25a0-4fa7-8b63-d07c52d2676e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:48:33 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c26c06 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Gbw9aFdXAAAA:8 a=zP3sOliNIdXZDfanJcgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: XYY8pKf2XTCF-GMOOHIb45m11C163_Yh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX5IuHWwgJzS2R
 3BZI5SfdCDh/2Wk4mnFlEwe5HCdqlgG9KcwLEqLaagknspKTM7LHoKgRqOxnLfl4Z94nnXv7YTM
 UGS/MUqNL39RnFxc6TOfZs88gudA2LbfMzDkiky+IFN8rpiF8MFFK486VsYFQghHFtA8PQXPNMV
 Uo1eCcq94C5tYmIVLAEXPyylVDpctPzevLMxN/kvc8vC2ibLn6O2WHVyUB/N9wjuIed7miuXrR8
 141kwOM7o8cNnEZwI4R3EExcMfqqTCx2zca6nD9/D/aAIWqZhz3Zb2oI4knwo62YEeSfcnzBB4E
 8uUKCGzysn5WRN6gMkzlCJ2o5ATPgLAnbGYSmzGT+663xGBHfMHrZRQkBWpCQY/o367P0fzgDyO
 JDgsF7clpCnSijCul+jTz/z0W7tpPEwbxuFLlBlioku6xJGu2etA8SfakE5VHEbCRl3EWYGtmhJ
 dJ6Ergfyjt8NxkMOEJQ==
X-Proofpoint-GUID: XYY8pKf2XTCF-GMOOHIb45m11C163_Yh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240086

On 3/24/26 3:06 AM, Paul Sajna wrote:
> Qualcomm video en/de-coder
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 93ed8f240461..87ac41ec2e46 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -580,3 +580,7 @@ &usb_1_qmpphy {
>  
>  	status = "okay";
>  };
> +
> +&venus {
> +	status = "okay";

This patch isn't useful without patch 9

Konrad

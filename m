Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB04C3BE156
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212574; cv=none; b=ALR4pOKtPxgBAxd6nFTU7iq2fDye3/68jihBJC/NxkhF61IZ5xlz0lFMc4FutcWyjTiFuhSaGs66UZc9URzOcQ/M1PXj+mq0iYClZhy6R/ebOwiZfShxR32PFqCoTZYJsyvhkFi6qp03rxZDn5NubxijY1bvRG6kJTffPokVsaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212574; c=relaxed/simple;
	bh=ZoZVHIcb20ztaVZGDCK46IymHjRjY+Yi4pkPjRPyYng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmzRI66MYGmOx1oq2Fz1nFYNNxeCSFY+Rusc98//wB9SEjlsz9O532RiM+izdqMZkzbVgaAfx+esAqV+V+26kW225kcDpgB3z0fJQcf8yXF5v0NUSSG0IQgl/qBD2tTDsciDKQkgsU7aqHgnz1md2IAz341D8oS+LFHF8fJ7RVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZvUU46G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0f8s6mE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZvUU46G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0f8s6mE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsLL0042140
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=; b=iZvUU46GibMAwNkz
	AoK7VQzXe+5QNe2NDKKB/mgDiLZOo5GlZXwA/ce67JAiyVLIDN4WwaqOHLLQYnab
	vBvCZ3Q57JQwnF3JshLMTYyR5HF5NGIzzMJR8TWC0N3NYhPMFUx2EqA7l1FU9dU/
	pE/LJoxOVj7x+BnGbz8TfH44/R/DMg7zLiyMOoQRA32bUDzWZk5OtUyWaNw3eKYU
	NgJRdeZH158uWFnqlLx8WmF415Gz2na1sFuj6vDNC8UOplKUTMJStLdbfZlvJDV/
	I5V3KoTsvE4S1ZFmAaijS5B02SRmfvlhsOw6zr0k2+KJfCEwCdUBW0vIlHeZVjAe
	fnjmFA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3207ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:02:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c9239a1dccso365032137.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212570; x=1782817370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=;
        b=G0f8s6mEbVMpSKoc61441HdIB1Bqpcvt3u+E1OTmh0pR2L0lr/V5KJZ1LcZ/TrOCZH
         RV4757WTUFA6SCrTqIbSIZSYZ5VdLeOgGPnA6BoRM8geM17YglNmrxIMJax4uuM9FrCN
         IgeexyjFBcBUK2Kb/vKrLbr0SlTD5yw9ipAcxP6keY3pQjLV9S/iGszJe5k+b84Zff3p
         0LNodXd39ggXTXg659uwuEWKKc+d40GBZdsgKoUBEqnkxa7iyKiN5m1QWxVTaYI+u7aE
         VX6yBhOfJp/cOgk1NniEWgjLvsc7Ug8A0yiskJutbs4rr4FAs7SadJjGgux4p7sZ2Iql
         /uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212570; x=1782817370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=;
        b=XOrUVLCWMhlrpP784nAORkB0EAv2X9HdRe/xuACxAbfNzZG9gkAKo1J8NWnEa1RKpf
         Kv48T8Xa9bCUEPlBxBCCQ+RkJayNuuD9l9rmyCd/PaHncNRUzIksPEcNZ0SR/dSBMHuE
         8Ah5m3ySmVl/yrJA++EazjazsoguqpNPc9lVw8qsQ0J+2NBipkjXELhpnnKwhWAFXgyA
         av54X7RK9FDoHbvcrGkTKQxLSIgMJF1NPQOwndVJGCDdIX5GQFejLifMPR2PnIVb/+u4
         EgsoU6xCLJ3kHMg18Sj8Ix7QZ6rzPbH6gmHMxLCBKCaqxUU8wVsnTDT7OCqH5W1wVhZr
         bxNw==
X-Forwarded-Encrypted: i=1; AFNElJ/Jfa+Z+C2GciXMwari6ymEsinuboKiyII8TMWQ3LlhSNWL/CnoiTnRDtehc76QOVGrP4CF/kAfJevx@vger.kernel.org
X-Gm-Message-State: AOJu0YyBvnAskxREj/PV5VCs22o0TJdSq6OudxdrNBrlEvN2Yj3zYIhn
	nVFRot1Rbh5wTVeURfsUXipMob16K+ttoPusuLaguMMo2Hd5x1LGeFKHrdJk7sUaKxU9lBWTZDH
	7USQCP7ra86r4X0yXaImGpVw60P6PsaK7yIuEeJ9ZU0e7g8s0PrK7kz6SmK19wopo
X-Gm-Gg: AfdE7ckZpoiNOAJxco61Co+gmZRIZVmtDXrImev9EB36i6c6ZGCQa5IMwIED2m5voBt
	4D+lakBFJIw0G6zRd9b22OWh2POhrEpxKxjxAoKHCm3wlor9Tt4lhuSvDg3lzUnkq492V7zqvHf
	K2ZE5FWdkZAuNvhsnQI9DgjauAvddOoQiUG64SGm6bwM2AfKlH+prTXQfVWyW3jLggwGc3ZneSC
	gRQ6+RwOV3uwmM0T7fwLEI+psc7Vjzn6K+AXFJKFIoD9zQlUcT9H62AhmZiJDcwiyFRc7yhiMlY
	IblstddCnFTSWHvuu71DmI6sDb2jII6Ju9tCt6/2xdu4Qo6NNnOvyIsHZ2zNdQwKFjKsWd1QE77
	oopJNdzbrwpiKINhinJO9UWWvF9Xs4KkADLc=
X-Received: by 2002:a05:6102:3f14:b0:720:2ba:5299 with SMTP id ada2fe7eead31-72f3ac9650cmr1080749137.6.1782212570282;
        Tue, 23 Jun 2026 04:02:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3f14:b0:720:2ba:5299 with SMTP id ada2fe7eead31-72f3ac9650cmr1080720137.6.1782212569762;
        Tue, 23 Jun 2026 04:02:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cedsm491816166b.4.2026.06.23.04.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:02:48 -0700 (PDT)
Message-ID: <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:02:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX4Y1li1049NEt
 jcgAm3ZYS3Ix2IrFs1KGRsICIkfSDEZEPJj0rHE0ifQh764s9IHg6U5Y85XtdFQ5+9Rylmi3k74
 FgYAppr3Q5QIifcSYbk68EKe9ovTO7Q=
X-Proofpoint-ORIG-GUID: rHDJEeZoZFCdkk1XdJAgZF7uID44TDUh
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a67da cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dk325V_gTbMn8ZHce38A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX2IRLFNBRD7gB
 dhl+3GDctRoDXB6erg0vKn6bDF7ArxpNRZB3wCfN2Kqq9oLrvGOkH+tMrx3OlATl2u/3gh/Jqtm
 9n0DrVRjf7jmGdEl9jK2xTDaGhJytAbkQa0bD/GyOTF8ZSzsPtB2ZQRAdDY7Y8+cYT+CjkzghBe
 0vMsbg+U3JqWuchw1aaHeMdI8eFPaZJt43uNPuB+Y7TKI3xSeWoNenVQ7nepnm/0YuOwwLtTdeL
 EdIMHvrR11Z5Mxp3G0Yh9QwZcGuPnwy0P6vx/ect0qceOcJD0k/uPM+eYChL/bSx+bHv2lNMoQK
 v568JjnduUSqmQQXirjYPo+wZTkuxd097fk6xTYpSWFntSucIuSq4/HUqLamHzzDeY+iHWLX9Vb
 5rQi+coo2frYJ14HId+Q8csc3O4wignmwbuhbO5gSmMpHfPh2TgxTUkNTRwh/wdRJXPopXFaVS9
 7ZF8MLu1wvcFCyZQU0Q==
X-Proofpoint-GUID: rHDJEeZoZFCdkk1XdJAgZF7uID44TDUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230089

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These nodes are not present on downstream device trees and only take
> memory away from the AP.
> No crashes occur without these nodes, so remove them.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 56cb6e959e4e..e34e3c05bf74 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -752,11 +752,6 @@ oem_vm_mem: memory@bb000000 {
>  			no-map;
>  		};
>  
> -		mte_mem: memory@c0000000 {
> -			reg = <0x0 0xc0000000 0x0 0x20000000>;
> -			no-map;
> -		};

This is mentioned in the memory map description, but is not part
of it.

I booted up a 8450 HDK and it doesn't even have MTE, so it's
probably valid

> -
>  		qheebsp_reserved_mem: memory@e0000000 {
>  			reg = <0x0 0xe0000000 0x0 0x600000>;
>  			no-map;
> @@ -806,16 +801,6 @@ qtee_mem: memory@e9b00000 {
>  			reg = <0x0 0xe9b00000 0x0 0x500000>;
>  			no-map;
>  		};
> -
> -		trusted_apps_mem: memory@ea000000 {
> -			reg = <0x0 0xea000000 0x0 0x3900000>;
> -			no-map;
> -		};
> -
> -		trusted_apps_ext_mem: memory@ed900000 {
> -			reg = <0x0 0xed900000 0x0 0x3b00000>;
> -			no-map;
> -		};

These exist in the memory map, but I'd guess they may be unused if
you don't load any trusted apps

Konrad

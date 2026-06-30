Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E8291C10
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821083; cv=none; b=NFO1KYEpEu6YCOvIvRaV/wADP01vT5XOZt4GvbshPmc03Q7X8ptMb8vJgJV2iuLmagQO+ptoQPIXlzRlIu6co/S5oBZpcDxqfH/MxQlDEEe8f0U4i2N2YBP04RQE2wd7ALLcq/TgDYYMwRUy/wjsNPXey4AQ6VXWPVKMkvD8Fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821083; c=relaxed/simple;
	bh=2u1+1s3LllqRcXvrtwNyjdlEgfbYJsRTb31iaSqge2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3ihUDJO69ZpC8fYsWg9CEmTbG/kvfCwMYOU4/86zXy0lC8HvMOnWzrL9u/gplxcXQ9wdC4IeK/4aEot5JkmyWMR94YBeqAykwjnkrULGtsiHPbJh/L6KuYELMbPgrlQTnh19zoaPm3JEyhQeZEjWFG/F/l/zQRDS2fx4ni+6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWsZJXTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYaPxATI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWsZJXTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYaPxATI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n07A1613515
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+30fU8u7ebAIK9tBeViJ2CQuNZoM6yp3p/ercnVPPxs=; b=CWsZJXTkef4pdvqf
	/qcr9ap24auSylx3VWie1K/SBvMf/FR5e6y7HU8IW1CjtyV8tdul0A3Z4ceflAk6
	P9t49NkyHdUgaireLYNO+hTILgYoRzdcCbT1Nyx4y2kWEJEO/eGaFglp8gUVA2IJ
	B249ZMHzH5a//+WjzYjy96Yr0urhYHGvE/B2u5RUwUBiVWwRx60K5Lix+0ff0KUd
	yFrqTF42FjeCqhETRjfbiQKcQCNjhn11JauCiyzvSPbS7qgolgFoiiKSeDv65fKP
	ro0EcieAT80Vwpk0jiSVnyiovwVYW/lE0C2lSTEMEz7krTW65ybkkfCxYa9ob2X8
	VM6IhA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cuqxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:04:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96920484543so144771241.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821080; x=1783425880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+30fU8u7ebAIK9tBeViJ2CQuNZoM6yp3p/ercnVPPxs=;
        b=KYaPxATILr3G+4Jj66AFBnmp/yztNewGeKiGDxmiC1OYaGQGAtE2vrzgyRaBL/Pvub
         ZaAoBSlUP2HdqyLTFzvadXcdtp94ZGEVJwbXOsRwZZfbkwyLo367wJ77xbs4yJlWpZOy
         7NlwSzeA+kFRZseFsEHJGqEpFsg6XiHG7zS4jQysNvRtpfRnB9yGiOFegPg6F1oT5/yM
         ODlpiDoKBe7JkaC5pHs2tUBAWr+e860WA/l5I8nQay2fhIAx9GsNftymSlByN0mFBqpA
         dlLymQ9MyPIMonxne6lTEgG47fnjHVAD+wC2vFBuWNJqu3MHV1khnDXLefaaX+Nf/5dT
         dJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821080; x=1783425880;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+30fU8u7ebAIK9tBeViJ2CQuNZoM6yp3p/ercnVPPxs=;
        b=tLGDwMnlZomXvmuJS6ksZrgLRYCxzNyRVs/ngaaZ+s5HnzmW5UbIK+XRb1PpwQZKuW
         /WWH0gaqpDw0/IQx8VcKkL9u7ZvLhdvb4YgUQ0ash9n1r00dCh8VUznWj1sBx1KZkomx
         I3Koh3SBi4ePxWVnH3j4q6cNIiIM+vTNQG2mMcD1acBu9cOVQnfG+gLArhQ2t/LFC81r
         lnXPDYhgaXQ0DsxP022QswtV9oFSXjbpJGKI7vwAgHXX+I/nOCHD1hUWRQEaFG63PvXx
         viwnWF0lsbddC61jSaDEfRM8Fmcg99HtFEtYh2b+L18VPo9DXcANNEVedDBmH8H+RG64
         zRUA==
X-Forwarded-Encrypted: i=1; AHgh+Rqku47LCGMUAHV22FPfXX+YUWp1M5LmpvunCtUkgKGjwvA5HtvAmbcS6Sbz+FsCRaayulWGxJ/MnHvI@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXl1XX6NcAJVPg0HsnbSLqWqWLi/3bsrz8PfRVkco2fb4+Ekj
	nDGM6c/+qe16HAZ/Rhxvr06qW8q2ZtLKd3sRLO05NWcqO74Qxjc8eqTVE9nBtB5ec7/MgdojiBZ
	GaaPEsrrTvOml0hv+TWBafMJeFJ7dkRa5xNP7piwJHMO/esSmDa42k3d56HTMCOpP
X-Gm-Gg: AfdE7ckwCMAbVukaogUin0ZoYkUadhdopWzA+0cnfN61dSwQg+WVdiPG8T0DCxu6hHj
	d4qcpXhTrioabe6HojaJW6ibbSr7oCvRBe6kGOn/LywqbUekTRWMFI3zHIdOkDp4ZWCuNzYK3zn
	wQXGKvbzrmTbLqHovXo39b9C9uwmkRHo8I/Drk0VNKrsbb4fPfI4SX2BrpvrFZrbCEVrW1bIqr5
	CcyLOuFXbE7fJclL9Sy/DtHY62T0J9TGfId/vbyr2GFMjRofbbsoog6OYz/lryaBM7RfYLdfARv
	QW5GU6Y2frGHJSziMcdDNIKm7tJqsQEVl4UugvfjzG6S+LPKr/U92DboRM+v2ldm1xbgw4QtWzT
	zumh79xNT/2OVe8mEtIe69YT+knOIa4j+yp8=
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr562308137.4.1782821079598;
        Tue, 30 Jun 2026 05:04:39 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr562301137.4.1782821079207;
        Tue, 30 Jun 2026 05:04:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3b5ca9sm1117702a12.9.2026.06.30.05.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:04:38 -0700 (PDT)
Message-ID: <4571c6af-2a5b-49ac-903e-b158d9cbad16@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:04:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support
 for PMM8654au
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfXytxs74l3z3+m
 /DdELoGc9fJD34BCvKYnTiJxrK2pyoeTFpMWQJ85NA6grDY71QFzoBZXYb9DTLXyss7dS9/Rrht
 SrJeVR2y/wGTep0Yc8mym96Y8Y7ZbdyWJSo5VHlW4rwE/Jk1uamCfyt4wDYWZnx/kTBPMfdicNd
 O+sg9xlk6McIfIYBXUo0q6JnIEIMWB7xJxG7vmNRoQO8pb+FO33QT8e1gR8CMSFUnQqiZLtXqT7
 kyPgPQqI9pGxXin3wKBmKTEnmYyF49OGXkU5/M9I9y87qQd3irWuamI6ZaKP4B27bNapuS9XKNP
 Ty3e0XmBkA1aSSlp+JN9jxbPotBfnm3c5DX86ftywHwfMLC2OZbi18QB4Le86x/IaL9PUvFvye7
 zyy5zQjKrmCFDCVkcnQ5p8cc+0J2/NF9h4/4bldxoxr4DX38S/nuW7P5RG+BBX4tETWdmJ7xOvW
 R75A1Tpp6p+XJT6GWRQ==
X-Proofpoint-ORIG-GUID: -DXMVlOpwjZ_gTGlU-7AiBsP6CaYsXj_
X-Proofpoint-GUID: -DXMVlOpwjZ_gTGlU-7AiBsP6CaYsXj_
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43b0d8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bnp5ujGDWJDzncnA5ckA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfX1zBEQQDrVoy/
 hn4WMJAqwfIx11HEmrCLxLoGl+Qq3V8XtG8l8d492dr7DTMocJV7irKgSzev9o77lgGjbIV+0qp
 rYiKwvBJUxglNfwsEkbobW3TyQ8n6zY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300111

On 6/14/26 10:05 AM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
> pmm8654au_3) on the Lemans platform.
> 
> Each ADC node exposes the following ADC channels:
> - DIE_TEMP: PMIC die temperature channel
> - VPH_PWR: Battery/supply voltage channel
> 
> Also add the io-channels and io-channel-names properties under
> the temp-alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

[...]

> +		pmm8654au_0_adc: adc@8000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x8000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;

Same nit as patch 3

and only now I realized - s/interrupts/interrupts-extended - this is
necessary for !Linux, see

2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics: Specify interrupt parent explicitly")

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

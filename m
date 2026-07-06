Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A5E423763
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339225; cv=none; b=SciXeAiWGlTlziOhYE35eP3Erq0Zduq0cKoQ0M+HaQMO7EMOvXeJNuEpxtLkPnkKxweKzzZzw/km+B8sdMMWOBifLLMp+dAYvE8memqfwB2kreGZLbmHx82NYPmjavR+nOfMkBnP18bePXCFc0c0OvkcTN2XMmFHn+PF9D71lg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339225; c=relaxed/simple;
	bh=qWTjPqDLGc6UFeJaIHNML9p3hZ3NmfrLS1LYIRLfcw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AryOUM+zAjyF5sC+CeSmIdw9+jozpJGNUGbW4cd5aW7ANVb1bxsdPIUEtbhprNAerjfyNE4o7tjGrAhxhHcEHcVoxutSFxlCa1Kv+puW/PVGVDnGy7ccdRAIj50vVnGZ5ec5K7+HfMvUyxSLOHGUuhOA2CqaSBKb+syViZAPz6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ozq9EFv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/wGS95i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ozq9EFv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/wGS95i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxHLD174798
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=; b=Ozq9EFv4nHOcKDUf
	CqObyb7p6KT4C56FDXh3dGzoMPhZf4ordV+J6wvdxaT1f8bzmvWIUyc07mgkQRmY
	BByd7MA97pMop2XZJkQagSxMjos1eM+C8dxFyrfH+JxISYLZoYEcElZdzj3kH3j+
	in0TMY+Y1w+XAkTZKPfWLogORp0egMHzebFiDQtJakRApCNkEZG2P8xn6qN+CLwT
	zr7Yg6qlFIGB6sQ906nIG1hbgcRRVxskawFnZF60Y7dVCNohP0SKPBDbbD1+ED8w
	GdJRgQjiRs0InRxwkGRajn6oFk3qnDpqfRA2uVHx9ASNYBB1nJkRa1nk2JTXKm6M
	nlfmhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs3yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:00:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e7579ded2so43426785a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339222; x=1783944022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=E/wGS95iPF1ID+BTgIf7Y9ar85K8U12sWRMMGhFWzMtaUoNfmzCsjqMhjOdm+k0m6R
         Owq03y8QCeg1VvVjvbfYupnJS0GmUoInnZMG+tKSunY3xvcWiCG4DPlBNZpLrMsVjGj7
         Bt08nlWHt7DGEDg1qnOec1r301PD1ukjdhVd7b37Y45thD8wvAEJmtN60/HfJizolbnw
         i8YAvS9VFQOurNjpSQ7KjYwwTUAUZOQGRGgWSA9np+6JRFEFal8nLVq+XY30S6w5Uqfj
         oqRywwho4AJD2MaB7E3NGnDQd3GDFdzwlwgBscjkP499mJ4oP9R43ropsOLfBMJZgJO5
         vYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339222; x=1783944022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=EKT52+dY9KQhLQtvYowQPEtewBRUEM89xVpIU2LEhP6IOn931eAPAcb4QJUz0rYkyZ
         fC9lDeArOYQV1EvxVDT9MkVt1WDr+TVM4xdL5WzImvDa1YQKbAb80oT212ZJaRPVNYOC
         0GjszEzJLbPiFApGIlIEEYyTKhWV+K74vj93vsU6gPxjBoE6tI5+58v5Itcsv9P1efOQ
         r1HC2pOluUZC0XwcT1RgcaPhwXt+7Ixqi7PKpRVc44oIgpBYQTU33NFhG/NylCraR6jf
         kQRt1P8BlHbkJ/e+hrO5/6FNJ0n6FRVaFCPSNHc5huBJmS07REivTMKl0tl8GK+FMLQ6
         HP8A==
X-Forwarded-Encrypted: i=1; AHgh+RoJcxKFJIil37bWRpDIMRcDNDLGlLaz2NCPd8yyKTcUFusuvwV4jkwvkQKWD+qX5mGUlY+azZshBsBm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa30slzSzqCMj/GpK4LpZyzc2r/K5kmYnHpeTQaCxwf1vXU3Nh
	frYAHx+M4K3Ip4Iv/z1y7Fft7W61u1vrvf0qXVxbCQ4dfN64ir/mzl2GHDzfAEE7I9dtjnz1cY8
	MURNmKSfdE3nw8Tj9JXxy98Iv3jzSH4h5u6PBe3U4l58YfUccdZ+AeCo6pOIv1DLM
X-Gm-Gg: AfdE7clKmoBcwRH8mTHrGM8XE118MDhzafHVMtacmAbrEhSIpSMvGfmPMhzqnrZehmF
	LGGcNv8SHWzmdVDuF9N87tvUVOMOykIXM7+Q4pOi1Vb6oKomjWwY9hYfrELWoS84Al2tVrSvp9N
	Eld8vvqymKJ04iJJGfMkLiuh0NyviF335MbFLCqmNxj0FPVkafQrPxIO9iLWwbZs2Hkh1IKlklG
	Qk4tNpu+RB3g/9Yeow4eyXqCGryz/aX407CL/2FiAwWHRvz2vO3MYo/heG7bAUu8yPiVfTsA498
	FKN2gbTLubURr/WaqdLBFs21kwModdJqg1BCId9/W2TcegBl82Z5y+afWatgBYKjBGRGIPwUKbE
	haFk6blrcjKAnrFkBiMBZ72b89OOziYELAgg=
X-Received: by 2002:a05:620a:4447:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e9a091291mr945890485a.6.1783339221497;
        Mon, 06 Jul 2026 05:00:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4447:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e9a091291mr945865585a.6.1783339219863;
        Mon, 06 Jul 2026 05:00:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm726569366b.19.2026.07.06.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:00:18 -0700 (PDT)
Message-ID: <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:00:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xJQUHLvTQ00SfWs2xJwY8QKFfdm48f0N
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b98d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1P2StzUqvI1H_hqdaE8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXxv9VSweHAiku
 LhPmqk7FEZh9UHXO5VbmZ2Wr7kwd5d+O1apkgZ6s60BUpBt2VuHmHJ0jlRdyxTWkAYs66+XQBBG
 vJJYDo5HrkjaCViT58OwFxPnZN83T7g=
X-Proofpoint-GUID: xJQUHLvTQ00SfWs2xJwY8QKFfdm48f0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX9F/nH0+7/zZ2
 czgX4OyC66GjQg9shgPtpTldx+4ucjt0jzo4RXRF3t9JmbWsX6ZLynBG2TVX4CIB1/5O0xxtkbG
 KVEshfJrXULJqKfhEt3ld969UvCFJ26g/nKOUAIH1QaDFpPvJEOflX9UMnDb/uv4447l069IdnE
 9c6booyNA5ofhgJ8azgvRU2WE3pzI8KsImfatENQj/ZEXi8WXywGs5lpGMUSnikdZTyHqGfb1qr
 jLMvyZZuCPP9XXpAf1b7vurZwyHX1HM13YGj9L/J/biU7jb9IcnS9iHfVwYvtM3tj+DpNoXWD6Q
 gh8j3lZWtFI5ZiFnQ/eZ0lOL7+SB53jjpXRFu7nLbuCw6+a59Z0c3cthE+vI6fjJjNK9+9kocC5
 iykzsG7IkX/ltWnb/T2D6A/NSbvnq5gGrhtT8Sy1TWGyAwThVr0TMDqNjChhAmb0Xu6KODrq8rO
 g1gTwhWgG9UBQxpN9bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060121

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/* CS35L36, Bottom Speaker */
> +	cs35l36_bottom: audio-codec@40 {
> +		compatible = "cirrus,cs35l36";
> +		reg = <0x40>;
> +		reset-gpios = <&tlmm 112 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Right"; /* Bottom */

One comment's enough (either above the node or here)

[...]

> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	cs35l36-dai-link {
> +		link-name = "Speaker Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
> +		};

nit: 'co'dec < 'cp'u < 'p'latform

also 'c's35l36-dai-link < `m`m1-dai-link

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad


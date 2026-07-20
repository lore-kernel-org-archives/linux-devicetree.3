Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A33CF021
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535899; cv=none; b=E7XhS1gHianCWRSCZayqoS0mPMW1Q7gqY5bknnZoHGEuhoCU3sxLqjwahAZCWlg+iQTCCiLIMdzVlVbYdiATVTkhO/OnbDNRnbNpHaKMjvLqBHOCLZlQhR1YfahmPSvepf82nWJ7zNST1Mbu8VIwHrovrv2Dtb4jcaTumyaGDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535899; c=relaxed/simple;
	bh=waHbqcBZdYRc8JsjHtNidcoWbr6SLqkMAwOxCxRofkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gB1Xuu8nkuYBvtPzrJMWB2jHv3g0RDxgEldnoS+Csci/EMTaMYeTLPVKm4t+sttUvYREZKg1GGq5n9wZm1EHwZczmxKiLkLOsfRpZvAJdmesehBxyPSBnqyI+4LjwOsj/9elzWBbnWHROqxP0MdJvmVYDNoWizf44Z+q+eAzvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSPAEAqS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWcX1Zxj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSPAEAqS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWcX1Zxj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YF2O2043824
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bL7PVVg75Jth1HsfxflnLYBX9Vi18Fh5UEv4H2ildT4=; b=LSPAEAqSMDawS6iM
	JgyiTQ3dDyOFrudHZcTTIy/IlQxESaiwX4rxM/XI9axFnwEYdAENoZh6KD3PKoPe
	0tmJbl+6QkRlO4w1h6G25bxd5SLj/93lmBM/Y0Plshj0/Twq9Z9E+5TwPkX6NVbZ
	BbAmx9Ywl5KrD77Ki/d2QoOepXyJRPW3O+g2LPLaVffYA7a/rP1h6cvO4MEo8qax
	jG0R77qb+sqcSU+U+1DCrHqjlh+2NlJZ2T4pgAysQ45UzZ/6JLdDAZiu4xfy93M1
	EMjlWoonus2csm/f4y1o3oWssRkqtoOuWljUO0lOmmiRzTmK6U7ddexJANUCyQNU
	Yuk+bA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcg5ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:24:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so30335781cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535896; x=1785140696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bL7PVVg75Jth1HsfxflnLYBX9Vi18Fh5UEv4H2ildT4=;
        b=AWcX1ZxjoU27S5mCRFzdeD9clfHlSpwiYlXk/1cc2HenI9IXNsjULF/p7Ws/a68ocb
         DdnJ+0N8uVtSYgzObjAkVUPlr798GUWAvn5Qsue2XuSNPEaT4dalDxSm/kIl5VoK65bZ
         S/GZuWV2lVRD2qsWSEHKy4ufxM1l5iBr50nSCBjpUfjRR/Wd8nD5WAJ1ppnAvEsR/PjV
         vNH+racIJc03CGIkl5MFSFXlp20Gr76YiBlDJqzCriEW5lvQVa9SUMsooKmAay3A4wmr
         UtG1qet0jcEXNSoGPxV3ohWruVINP382imOHZiyGVD49pQWIKWRiFDSke+l+2ZfU8Q32
         CEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535896; x=1785140696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bL7PVVg75Jth1HsfxflnLYBX9Vi18Fh5UEv4H2ildT4=;
        b=kvpTs+nkjQ/LtscamOrnhQPV0EE/scNGSZI7gsgnOowZWe1k3bQiuIwU4z0p71sLc2
         3tlE7UtlbIV7YcN5O1XFOF4WmBT3m76x7Y18t5YPJC45SBkY7ES/hjOa/8a9yJ59MvSE
         DBOHns/53qmKgiT31zvwb03nuXfRTsN2nt19VZr3ykXhK1fwXUr3cB3k0NUF15t2zs3j
         OlaHOFZtMgrn79l1Kez5m+UPSZ6r6jDJoTI1IXA9BNaPKS2C6aSvi/jJUVodxqR3Qw8Q
         1d/VWYEN3u/5awr2/wVWX3dvnXvihfkmiAlC2B2mKWeW250A71XvD35NGz9FUPWeOeRV
         JHVg==
X-Forwarded-Encrypted: i=1; AHgh+RrNyrVnt6rhy7AL3ud66ZC4znDj52UgvreQQHVZF4k3IRX9sNwZRQA5/heUZQQw5ydG7SV0Zu0J6Zq0@vger.kernel.org
X-Gm-Message-State: AOJu0YzhpepfX/y21yxgYrca9UE++xJQ83C2jOjtVEhullfl4RdO13fO
	TGMHIL7kfjwYqsvMdYdUr5WyCXp+aVulWrQCvS4ViX1YiBCq+yxRGs2R5webMZ+X8lLf9t6fdVN
	rxt+lWnu4tq81HILhBq1eVXQnblz72sCcnLuaBijL+9r3Q1+dlybGOA3qrZ/+brI2
X-Gm-Gg: AfdE7cmBXAuisBELFy3LpOzfXsSIJq6aNdUkWQQhmO7+dcrEK4H6xxaebM1NQ+8/hoT
	xK7kqyj1PPUHC3++2/wucnpReIvOkFyoszOMY9u4EnFWDFcZezPhQ1w1EMgPwQXioYVzXEWWYv5
	2g6n1FI8KDH5bu0v12WygtYtH/PxValtQ/Z4i0JHSEPhsZPyy14xy7naxGlAmoYUTA7vskFO3Qo
	I9PBpsZ66yEzqPeffWz+S6Q/U74AkffhDDX+FwZAn6HFdVyeKuPkSVUfLzICcVfD9Gg7u0uj3T8
	WInh/AzN5AH7khai+cqIbE6VK562AW7OtIEu73rxyCU8nnJIMztl+oL5GUVewHlrI8h6zMVSFGF
	/PfcBSOOV/ANjG0l3mvEWQtbc
X-Received: by 2002:a05:622a:aa05:20b0:517:5d21:9899 with SMTP id d75a77b69052e-5213d2b85efmr73668661cf.5.1784535896323;
        Mon, 20 Jul 2026 01:24:56 -0700 (PDT)
X-Received: by 2002:a05:622a:aa05:20b0:517:5d21:9899 with SMTP id d75a77b69052e-5213d2b85efmr73668591cf.5.1784535895851;
        Mon, 20 Jul 2026 01:24:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50ab7sm426171866b.50.2026.07.20.01.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:24:55 -0700 (PDT)
Message-ID: <d8e2c2fe-a504-4ba6-806d-f3923ea0249a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:24:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz>
 <20260719-pixel3-camera-v5-1-99593f1bd8ec@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719-pixel3-camera-v5-1-99593f1bd8ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _1cEzJpPmGfE_cLNbUQsstpQKzUV_oQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX2b4X5lpnTAtQ
 foL+zBBsKP0ZolZ3OU4QZm5odPc5g7v4RD6N1G94XbK1DMKdj2pCmmKwbyR9s1qeveoOblgO9RP
 gjBfKB9/81gsLF+3CB0kgVeQqZvRI+toQi05EG5gDpt4Xn6M8IE1sVhdBDLrtROahoxukNJxYMh
 9DY1cabrGDo7ujMDppy63F9zMG9sXYLQaPONPdmrvma32yKU/icentP3Q35l1CoRlOjKr9b2oqU
 jx7HQdZBK0pESNttB3nqvN43FbA7Lue9Hxx7YmUprn7hXyzNQ3nG9mFaPsFfyysjyrumGLJ9wuJ
 xpILMm0gwW83dEgDXWyDjXylY71fyE1wgprAK7B203rN5eFaAHXU5rx2AbMNdlsA2i5yBGHbMXK
 LFhICSw+8YWEVuA1TqcrUHFo0ZjEK8BR9SODn+BLggL8VEDg8CpTu99bYFF72nsQSbaNehyeht5
 wVjNyvnikdqxMdJDNcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX+EHm+0Q/s3uu
 YX2Qk6yhRfFmxf7OGCi4d2W90giy8NZcio62lEV0Up+1Bc7vXaJbd4tLNcHS87mLmYMwvZTwSGq
 5WHq7LrPuihw9gjZqNHDNNPnywdoFpc=
X-Proofpoint-GUID: _1cEzJpPmGfE_cLNbUQsstpQKzUV_oQd
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5ddb59 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ecbwrVNTdaeG15ON8XIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200092

On 7/19/26 8:03 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> @@ -127,16 +128,48 @@ vreg_s4a_1p8: regulator-vreg-s4a-1p8 {

/\ is regulator-foo

>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <1800000>;
>  		regulator-always-on;
>  		regulator-boot-on;
>  
>  		vin-supply = <&vph_pwr>;
>  	};
> 

\/ this is foo-regulator, please stick to the former
 
> +	camera_front_avdd: front-cam-avdd-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "front_cam_avdd";

[...]

> +	cam_front_avdd_default_pin: cam-avdd-default-pins {
> +		pins = "gpio8";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_front_aux_reset_default_pin: cam-front-aux-reset-default-pins {
> +		pins = "gpio9";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_front_aux_avdd_default_pin: cam-avdd-aux-default-pins {
> +		pins = "gpio14";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_front_reset_default_pin: cam-front-reset-default-pins {
> +		pins = "gpio21";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

This addition fails dtbs_check

Konrad

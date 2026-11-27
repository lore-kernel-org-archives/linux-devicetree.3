Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789652;
	b=sWN4vF+G8IuJKugLDFu1xPh6xWC8QsbUVSDM+GEHN26ewMm3lYIwqyoPZrXdd55PjTS1
	 meVQDBtiFVJxDU/Nnf1YvxkVHAHe44uOmNM0dEy253VSpuy8BtjOW30qemfjnRn+CiVtd
	 sEyu9U7S9SFAbET3JsfOhOAYmq9Q10O979n5np0+ns0nhuwFCWlwI1yz0eNcHZMWIfnrF
	 Siy4/jBOYl8Qnj3LcnUM8NfftNmffXbpLJgjs2T+ksDeTn+WNktKU7L8ocmGudhJ2EGrR
	 drCyyPpJID2sgzDSnk1aVRyx7B4OZ98c/fJ3a75UbS1rWvwoRPnsm9cMOhoOpMQfCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
	b=NYMqslY7oyZbL5+0kLY+224dcvExGTs2o646vAofDRPsDrOMzLEQZlnn5tKmRorPxzFT
	 AdvCTPf3Ut4YJPOSN3SUD1cuyVHnSidZJybEDAyReFaGIh9x1DN3ocM1YfbwZaho4HaKM
	 6eaKDdmzEreqfR0Wn+WwHDs/rHkI17H7ADTIdZxxqMu3OSs9JLk/U2prl9FPRin6+7KfP
	 85MzExz2MP0/yZZn8QrNZyXP5vpsnZcyeVpF5qY1QWzhob9h+V+l0PBSwhkTeUf7vQJCD
	 PKOaPPaM/Wujb/RcVtKfvljywMh6aoIjYIB1cpF+LYmAhmJXzJI8M9sra1ts+37VhBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIi3g66+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b9/KAsjr";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212C8606C734
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212C8606C734
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIi3g66+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9/KAsjr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1FHo2376237
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=; b=cIi3g66+bwoqhM3F
	3d2o0zwCGyXUmNTuYG44OuMAi4OppCOxYlvs7WgYEJ6xLR0NzuKf3xnL7sbjUUbi
	GXDcIiP+oarqZwB3pZuohtrlPrCuU8EyckNJqhfxMC9rbuipKjSBupceyb7Achdz
	7kkvpn7uirLfIksWSR7kizv6Meh2jNt99OdkYn/IJpDYwwA4pFiIuE23KGB/VqQr
	VF+bX6l4Mglp3nDwwp5ieFFBXDBJpoaG39hvbY4N6Rqp5lkSEZ8r2OjkPLRFzepA
	GGmqMi9ZJw1bYOnC+pAQkcyEnlfn4MJOl0j2BpWQUSMfWQZ+BtZW64kTjVHThVzW
	dS3+Lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huefr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:27:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495f7e03b9so79259685a.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789649; x=1796394449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
        b=b9/KAsjrYvPmTdtvC63MgRwhntd0u4hLKU3HEjV6iWtVWrnVMtpm/u4Asu5o3dU0Ud
         gzJQli2quABTI0I+kFogCu6Rt8MagAtuiNd3AD41swXthjAurIVOBB8PK/Hxd/LDNsdr
         l6GKrgiHq0TC0xsSbx0PFYjnlnFt+9n5lFZHT6OdkTDrPfta5hJK2pR9T1B96N5dBoyY
         DRPBjMcUwGRNT1d3wKcYJLZJqetdR/MHfjmjpbitvkCgze1MeA4Hll8sAh3I0u4EzJkJ
         FFydfY87DjfRnyt9xywQKM5VyovQORme/JzwvdGSVh5FEGFz9J+jD4mnRwMLmb0PtAlH
         UWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789649; x=1796394449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
        b=uQnxrnkxq68tkd6ghcGj2ChfAKw/hy0d1KWjZbUnPxwQ+Ddx7YQ6528b1bEpIfUT8a
         xXA+gqQuIpm97t/Cdb32AKaalyS2wcchXfBjOtizTi/L8judYh1cePYP9qCHRk9PYK7a
         ZM1ytJKy8FYiFrmgYbJapePmRekukJYtkkLy2VGneSAN83t4KEVopA3EdSx4WaHFwhss
         pMWvqDXVCGEFI3Pu/0B8io7ei8SqFDB7nL8EwNJOt1Sl9PE6aCPkUIIafdtJ/T8lf7NP
         sVGNFY1rxCz8XzXTkMQqt5Ycz2ALYIIDvAjr7yBQ2QwArgi1z3uJFquXFxMAMuuzha2h
         Y4DA==
X-Forwarded-Encrypted: i=1; AL+hErG8M1EYBpK5IKTSdkLvWcDzG+p1FpAaN96+3EOnBuNrikNmPg/g2EiY1+DDHI2dDSUtiZydUW9fADL3@vger.kernel.org
X-Gm-Message-State: APuU4Z+d8iS2VqYG6DNX+wEng0V4ueE1aUMOnJfugA/B5NFHSI2P1cWW
	Dkhw+PE2TO3iNqSX/eutur/CmQGth+2hoMsqV1X659NS3gRrnn/8D3eqlQdI3o/4xx3HLOKyNpE
	qFo5/COYmPRzFCfzRc4TJDmGC/rHV81UppX/lraymPudchaLAvMn0phvgLOeVk9+X
X-Gm-Gg: AZFdTZc0f4zkaHhXh6FnNkLq+nDZZW8MfXrTsN/T9Y+OMhGAoZWdx3H3jmuePLJo5d7
	gbycx5xC24kUh8mb7DwH8wAnwL4liMs1I0jHQDmREqa6IhUgeMOIP4f3p3Gxy1jooxOliO2Kf35
	u5S9ejzOi++I5ZPdjjuyiDZ6a5BOZGZ940znouvViTtIQVoHZzMpLSqG+AE+fJyR0HE/Ic88gBV
	V4HDhejbmbk9ACC9R6HKb+XHa6q/SkddQbrzH2L1Vkn7MY8RxtEP5xbHUr7nH8soFk8suCAh5BQ
	axnZLWARfN9Fe3fOK7J9ZGMyHWNsklXCylhVoWFoCmM/E6nmPi5Q6DQHxOaB7HEFsjb3eJ19Iru
	gssScfGdJbDLa5rYVhbw3/IYEGRPa3ogd/DlFz8X9u9eh40CFa3IjoujALnmvS1HZ7kAAKu4=
X-Received: by 2002:a05:620a:219b:b0:949:aa1b:1243 with SMTP id af79cd13be357-949bab2c992mr4628947585a.5.1795789649459;
        Fri, 27 Nov 2026 06:27:29 -0800 (PST)
X-Received: by 2002:a05:620a:219b:b0:949:aa1b:1243 with SMTP id af79cd13be357-949bab2c992mr4628942185a.5.1795789648977;
        Fri, 27 Nov 2026 06:27:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm9285824a12.36.2026.11.27.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:27:28 -0800 (PST)
Message-ID: <0a37b7e2-2489-4d9e-9ba0-f5545f962ab1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:27:24 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX0mKYKLP+QoVg
 uAm1C2kyelZg96C6YJjFu7fNX3EWGQl7/UXkZIEpzsADAJJCtuf+4w3wmGan07C2kskefs+t54d
 ncT5OcIb5CqzmFTDaPC0PJNSKinZ8Aw=
X-Proofpoint-GUID: 2kTVxa1fwXqCWhveDENudjGDzCLybEg1
X-Proofpoint-ORIG-GUID: 2kTVxa1fwXqCWhveDENudjGDzCLybEg1
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b099352 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BO6MpYfuLILTTXtsdh8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXxM4FPiEVk3F8
 jNBjy1JD49v/G4W+pHRREAxWazPTvkdGsGZF5Hxxpkxto61HkuxWexBvM7cG2gMn6/wnTz12qTj
 DZrsghlnQLWQiLF6c4/oRWgoTQU9OaD6JYjG2kkntKiYJFytFZjTvyvhCGcKLGEfBuZkfDCDVis
 XvxFeHtOHAteDkH06IkQLHmLor2Nkeia5GGiP6jnsYVHwJezTXXYZ1Fklm8ACX9jQHnELhvERTA
 IKAuiVmxoKeI5S0Kr/sljA4ni+ZKTE/fLo1dt/+agQdltl/MjE/ogcusZJ0824mTuwM2NOB5M95
 2NUIkjk/TyDaUVOxLhLaEd+2JGYAxIHXXuqdxIh+j00YoPG1GNEr4+LhPo0HHnoQ3M8jCX0xSmD
 vVqNTHsjZbEgyR/ToSP0lrdr3ijXxgzv55tobwAGqoezW9OTGfa+pWpS0rbtOCWM4Pb11yc/tVP
 bpWe73Xf16rzegJydpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/11/26 6:45 PM, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

It's not useless in the way that the hardware could still be cleanly
shut down (which the driver could be made to do), since even a device
without a display may have the bootloader initializing parts of mdss

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E43FBEA3
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968602; cv=none; b=NpQxnvhCGCfBwa+O0+5dJ+xWYepaZxfzCpBkmGtbM/BjoCbkg/DGT60Al1nHmt+nc0/K+61gqixVjFZ4jt0lgKQMOUvr7lJ1YZ6w8S6iVh4r77ziwKqZwfULPfWG5L37JqvtlXIrOzQTw5hUtPY/MIti5UTfXePk98HyhOLuh2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968602; c=relaxed/simple;
	bh=uQSh2cLd2Gm07T4EPeonWnywCZO7h0/ltQbAEHvPKYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g54kAj+4WW7CF+6skmXBweT0STZEjM1xh0Ejca/14bPXnMjihbiQQWh52nLuB/RHOGunwhyy8fiDW1CXHse5pz76zlsmK3A+UK8B0jsgDfgOg/c8F1OISwt/BEiDd652pR0ZbzLcUQv1SpECuiy3DMtrx4sF+H2ll8NfbTbNE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iskVCLRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBueOl1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iskVCLRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBueOl1C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VESWBJ331977
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIEgX6Sq7suOHGbniJetydJ4MMVyt7S+QbkGd84G4SU=; b=iskVCLRHhXt7pc3N
	5rCv9R3YA7iOdMg7439gZ4FECiFbyDX++HsfuSDSiei/dCyHKfYm5IYrfWyR3UAN
	IdG5wOA1xYCcCfwvZhqaOIzCrefF2YKXhi5KGLio+uaw944/FMhzcY/gHFgCWSb1
	gyMvGf+bB6VYXBEVuoKhK8tL2OtjaDHrMb4gY1f/5u5+TpZcKgnlwkIH71EuFVdG
	xM1RHVd45NkvM9wkh8AVqFxdoY7C/a/ASiJ9ZC07knNgvIfvJnUNZjwe7clYGKyh
	jZ39APfcVnriYhxibMBW3aczs59ZvmwizFA7BWJJstwLPpKUyTJw3Rb9pNkRh5ym
	8aYkkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2ar3fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:50:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50947db2e97so15765701cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774968599; x=1775573399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIEgX6Sq7suOHGbniJetydJ4MMVyt7S+QbkGd84G4SU=;
        b=OBueOl1CelXiKbz5zpu4qsloe5v6lco6X0T73Vya9t3KbVGyXFnIYxfL4I0Cm69iTe
         pFQKkz+DqYenOMf0pzQ/wuDMVoM2rkBR2csjrN2ubQYlgJAmcKv+9ArK2tiDNd6+ZLy4
         XeJpogM3LqnPtl/d1rcU15w9AlTuca6xj8NyzOr4QrINHlsp2viUHynqV1AEBmyWVxH0
         cal/ZVJIMBX3sLQ2h3jh8gsaDtJZupQaGfiD8hdDnoIwz3kdMAwSvoHTp+2d194SSO7e
         pOX+ZRqTQTWYZszMO3MjLBhhrJY42z3ApxGDpVig3JqANhZDjbrqonSEJJR3JWke3Ihf
         0tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968599; x=1775573399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIEgX6Sq7suOHGbniJetydJ4MMVyt7S+QbkGd84G4SU=;
        b=S+IBr4LfUteMrHBNjH7KXnpP4VkuOXo+32MCMqhx5zQzCT5D6gEisub7QUrs0MqsN5
         476MobxuVH2+2lLM/0HTyBqWTU8sdDr4LCfNUoF2R4d+xGPU2zlOuhjqQ5njGOXP2wnS
         7RyLMWI0U6gw5fmNyv808k41vSq6hCIjYCps3rQCDLsDcTLWb2wXEv2B2P6fI30OK+QE
         Y984sBlY1kQpH+9Pm0s0ZcDIQDGCemqj/dDT/VvVzia7dfYU+xKHSicFKl+Mg96csbFK
         qEj2bE2XyHJxua/MoNqRDvKpaystUsV1lWw8Pw5Ztq2de41WjDqOVA8QFSpc3sm88GjA
         iqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzXUtVNZpYj4Tln0wHj9UXr0og2u71eQue84a6LJo2fK8a7KIy6y5cwONxjHvepiOmfYzMFepwMp+t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3OGIzGPcJMfoITMvjMssgLKgYJomJMRvHYGtXlcAAXpgF7+6
	bufMlgnWphU74F7ZYRozmK1gE9sGIb4PGTnR15MWdFFrY0Ke6UFAJA+KDfP6H1JXZftaicmRkEI
	ixmWj2R93ifrnUXeAg1S8kt7lL+6LvYWdsOqkN9pxP9O+vYYNr0oR4r/tTX8kNgQw
X-Gm-Gg: ATEYQzyAg380dqbkCQ2qYZgyLqzToA/7V9hIQuc3KAkfom4U++1YezpWUvS2cMY/DNa
	PcD9vHzWRAG09Qk7CKYzWYM57Sah5Hel4oDUpV4MK/b0wrdUBn78L1GtnOZhi2gttURbTnAx4KD
	kfvhP0u8eP18L07u4JZmi68/C3XUkBgG6qu6D4QaL3fIk27lrGta5ESj1MCuAtip5BZn1dJWDuI
	GwcK2VQ0LXjSpR9/NaZj+piXt5gqN+kPBb9CuFapbUUo8ZhfdS4lQfXzDHeDf7f6Y7Lautoi57q
	2+tsSNcsdolcVeulgCYr0Ot19jAtssfIbbt34NaqKAvCWCA54CYEO5cEcqwbBwRxeIo/lH10lIr
	jVG8uvGTZdGFze3cGzXjTzztRrz+pK2ZYyf3LboSS43tpzFI76CMUh+VwA9Aw7mpfNzc00b8uJW
	4L5z0=
X-Received: by 2002:ac8:5fd3:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50ba381931bmr178437111cf.2.1774968599005;
        Tue, 31 Mar 2026 07:49:59 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50ba381931bmr178436731cf.2.1774968598477;
        Tue, 31 Mar 2026 07:49:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b227393sm414235166b.63.2026.03.31.07.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 07:49:57 -0700 (PDT)
Message-ID: <e4cad76c-09ad-45e9-8725-ec156c121bb8@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:49:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NCBTYWx0ZWRfX5lQx16GnMZ2R
 iwxJ/8GpxMZEaPtAR9VvgOcbNXRGC5/imngvVqRS9uC8Rcqz0Ga2JiCltbjd9mAfqd3feo3PCJj
 qBaSDKl1qG/6X8PjxtwZSdk04hInGtAnKs5cRDQg2q6DcjuLRRr6BPGUomzOsTp1sm1sZxr+bB9
 rFONK+YnfFANl9LX4ISg01ls9u+KI/ZEUWzn2qiQ2K0tMXiLrpn04ytTofEJcbOJ6DnMHDj4YXq
 PbOriSwP2AkECzY8R6HhyLTXq5s3OKtIT6FAjNhKo488dhrjc36U1+9F8kEEpLkBiPjbZyAmes8
 Cf15kRuzFP3owDagFDUwiYmNM9CjxzYE1u8sKW3Phr+JfnSATdOlJdzFghOodVtJJC/Oj3glSbt
 5/FL96xlikzujPwtLhBl3LuaqQ9zrRg+P/WjrcktYF0AU6ZzhnF58InvcRlvmfCZnWDmXJK8KWn
 YINNxolG9+3aFOMmo6A==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cbdf18 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NCrPhelpScx7X8brxEwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: eV4a3V68UW0MySwC8vQAlXqWBbt7X3B8
X-Proofpoint-ORIG-GUID: eV4a3V68UW0MySwC8vQAlXqWBbt7X3B8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310144

On 3/31/26 4:02 PM, Krzysztof Kozlowski wrote:
> Dependency
> ==========
> Depends on USB patches, which are being reviewed, therefore marking it
> as RFC as it cannot be applied.
> https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/
> 
> Unmerged bindings used here
> ===========================
> dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
> (DRM MDSS bindings were applied)
> 
> Description
> ===========
> I did not enable DisplayPort because it does not work on my board and I
> don't know why. I double checked QMP combo phy and other bits, and
> everything is looking fine, but still no USB display, so maybe I miss
> some other dependencies as this is early upstream.

What was the furthest that you got? We can certainly try to help..

Got USB Type-C mode mux events?
PHY initialized and configured to 2/4-lane DP mode?
Are the AUX transfers failling?

Konrad

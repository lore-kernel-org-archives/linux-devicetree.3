Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1948425E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312406; cv=none; b=U/spv8bDuWSc3manUpqH4lthbtBtq8AIjYkE8RltwSb7p/tZtuoOL/G/URvbosWXRMy7EGPFV5ED7gu0yTtk/qiB3n7Sc0mR/RNeDfvrrrNOw2w58v7yFyJYMxV6eEYLEPBq3j075F+LjdLljMs85bNI9dVnuWc3tGALlk1Pt8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312406; c=relaxed/simple;
	bh=KCYuvQq0jPJQHOiJa2q+PvHghOT9g5DhGN3VcWy+t/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy5OfDN6LDXoqnwvKvAGqGlJkQPCiLqono24x4yZoQ+9fCQ5CSQYqzNBYK/PoBX0Ilw/AZHcJqw1rSbOx6ffTIn/NuQfwfsY6k9HQPo5K+hL36+tMvvx7f6h4rVItDYjHJckGGrOXpUuYhdi/4FtZJ8O0PRABIXsPhX0clT9QJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av1Xw4Ip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYueVwyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av1Xw4Ip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYueVwyN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LtZi1799152
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DyqjuBsp+SzIbVc21yNsTsvr
	T6fTKh4Kr2nkvCI+gYU=; b=Av1Xw4Ipo6vijxSuKxEct1VNSsFBjio+xYYAmNb3
	hP7yh6rl2bS4HOl7u97jn1xkOr+iqDB/OfTwClWoM0CQRzoWkHC81rN79ErMlHAP
	KXv0ViOpUpMa5dyq7/yzgz+saS0S+dwW+SX2Z19LCc1XkBhIsL7DvQBdEHouc2aT
	vPctz8RTtcq8xRfjN4iz8fhG/BGNoItxL3EE1/f0QdLmhtubKcsgLCoUhOWUccqE
	kRdJEOHmFSyCF3AjcWVX5bDyURPFI95MNNzfEM7VrUvled0KJSfLMe43mGyiBZ3F
	Jld/9RmPMLQSri9vXJvXGkg2tSMxdIjYKqpOTDYDMy2e1w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9qm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:40:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73858d44c8aso205564137.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787312401; x=1787917201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DyqjuBsp+SzIbVc21yNsTsvrT6fTKh4Kr2nkvCI+gYU=;
        b=WYueVwyNYQoymKpP58n6yC9d+NFzKygPA0wk0eEwiL6mGKfDWOZto6fI5PNXdzeJyQ
         N2O13wwqAj3R3a43Mxb1N/vmZgEO0UiI+dnTGc7zk7FCMUzR3ciQi0FCUTRDyW3XcmRl
         Sv/TDqpVK83nVaTiQilYOoORYbQYw0hpebpLMwQZOMkIfT66FVW/+jNpohWcuwSglBuF
         NWSXaTAocbZTE3S2Sn784L4oCf/ygsVhoHPd61tUeesw2G+dyL66VJSj7lYPct1T2Nvd
         ivFroLtAiU2kw7zHa8ZdfMCrgVEIuFCeieNEGHknSxGrDjEJNcH+1s6my2L42uaX71kJ
         FKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312401; x=1787917201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyqjuBsp+SzIbVc21yNsTsvrT6fTKh4Kr2nkvCI+gYU=;
        b=siwGJCXfn+n5wyLgnG+dG1VRWut6o3Nb6PLSAdEKzNZAdc7t4uKtRElFfWdh+3/Rc8
         +u6NfLawuM+spXk2F7eb9tLbfM5uCOsp7XSmxTCRGjxWD4/AnwdzFEJaBB7VUQpXj2/g
         8iYVbGOhNRB8X5afi66Vo2+hVbvgiKx7mJrzrKQF5mOXd+ExwGKHTc4gCq7vRTvUWMXA
         jBZYfeUCXFM3AfFygw5esHWFyF45h6z/JSzf0BFPGRtS3pU6W6XNNFmBZzidgeTtjGBj
         1PAzt7WlQit1VEqV5ggjIvUCTly+/pdJLmFuggNube6d6AsX5UKfNwO+YhQFvmBChHAE
         0JJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ/dRd18RrxHn/Z6GO1s4KX6GNTLtUhfxdNCtbgQXM+jBpTVXtmiSaalnOW3O+IenJVJNSG3rvq787@vger.kernel.org
X-Gm-Message-State: AFuF++n+EuLkuWEJlhYXJmbiYPXUGXMP+tda8LlnXbSBuiCv9buKt2Eo
	Uc73DJZb+re4/Oka/A8RRB+BYGVzA7caz8xAojMWcaAhBsk8hJvNldIpkYs3VFkgJe0+UEIqADk
	Tjz4+OvoHgCTmsm8Eg/KZvL9g8XKm/HbNIsso6toK6qnZD59wJRdUu2uwgDvSqY10
X-Gm-Gg: AR+sD11JEEldXEmLUwDNj0TDhsykYIjPFxNx0KGcGWFcSE1gCv5JvGVoD5517wiKAFk
	DZ0T+8iyVp5rKwhFRNM99yEXLYDP7ecMZMWTjcgdrYP5l49rrv3x2q/r6SGtmUCwB100lK7tQag
	Enh1QRAt52hjkLtxzIcEW7MGHgC+HaRBcSXeXLx3LEksk3oxFhZnf8kagIz/cVXAzNLlNL0jJZR
	FI6bt2WbTeY3AXsUYIyj/SXG5DJ+mWZDdRl0hP8zpJkTQUWxmgV0MZR9zTzJ4XNNZxLAbevDwJ8
	vW+OsDejPv160SSo6P1KlrNSEGDZ1235gDFW77AkGW9rE3bFyxZ6jJS+6Arkmav8dcf5XyDR6FN
	59g+/zfT10DPBP8o=
X-Received: by 2002:a05:6102:5f07:b0:779:5049:87b2 with SMTP id ada2fe7eead31-77a5f7f88aamr1872133137.0.1787312400896;
        Fri, 21 Aug 2026 04:40:00 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:779:5049:87b2 with SMTP id ada2fe7eead31-77a5f7f88aamr1872116137.0.1787312400306;
        Fri, 21 Aug 2026 04:40:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm5961196a12.7.2026.08.21.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:39:59 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:39:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229
 Type-C controller support
Message-ID: <s2ktdbck6jsb7eb2axjofhhxc57pqeslybqbgjuwmbjzjlt23s@rwkqmyfeqh2v>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OCBTYWx0ZWRfXyfZU3acBxcZq
 Et2l/i+gV0+/4Lggg41a8N+AbdyPHZ3nFdmujiKlQeksa0BL1W0dqlvJUczF/RgffSO/J8RY5HC
 f+rZPDVYipnLfZJxhwaYSe+WQtkkbfHv71NaXRPwl4rekzvSfwLjILsyGq4jYd37z4l2AeoHNjX
 ipGs2vq6snve3pvRsUrwoS66tr8xIbSv80DPA5+lBfKuJUWe/OzXEAXoyZyq6Zc8jTtiD9KFD/u
 z43tEhy8evofHVrNiXl3uQqRbAtbrSjzrs6eBSTrb2BNWT3BrYS3DaPGC3Nhb0xstpr3ZrWlkQ2
 8l+ljf5m2IM5P1spJ2/gOKmjLBPH4hMIAu+vr8+Z2+CI4UJtMUE0NTcznHEaOAMYqv8/mYFQ+5u
 M6FtMqc8AI3No5hwiEf+/GEO4EKxQxytQN00KDJFCaXvu6Tk0LEUAn3Pu7rO6M3UlQJ2SXZICvb
 Xk3Uaw+p9yCf4fv/7Mw==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a883911 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=diHLKiv1CRy_QSkn2kYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: KMRoHwttA8R7BPpy1fc6GfXGsaZ7yjJ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OCBTYWx0ZWRfXzPbsmFPnZg4f
 u/5YfbQTkq8LH7vyv/XdPbNXF61Vr74ctHrj3E0EiSUfvWsDs3FhgXbLezZNCDQdwQu3ZXWZhyc
 UYYYChhICX0TyGFEnJGXDSkecsItuoc=
X-Proofpoint-ORIG-GUID: KMRoHwttA8R7BPpy1fc6GfXGsaZ7yjJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210088

On 26-08-21 15:56:49, Akash Kumar wrote:
> This series adds support for the Cypress cypd6129/cypd6229 dual
> Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
> handle usb-role-switch, and wires up the corresponding DT nodes.
> 
> Changes in v2:
> - dt-bindings: add a top-level "wakeup-source" property on the
>   controller node (matching richtek,rt1719.yaml/ti,tps6598x.yaml) and
>   move "wakeup-source;" in the example out of "connector@0" onto the
>   parent node, since usb-connector.yaml ends in
>   "unevaluatedProperties: false" and does not itself declare
>   "wakeup-source" -- placing it inside the connector node fails
>   dtbs_check. Also fixed related whitespace nitpicks in the example.
> - dts: apply the same wakeup-source relocation to all three affected
>   boards (shikra-cqm-evk, shikra-cqs-evk, shikra-iqs-evk).
> - dts: fix shikra-iqs-evk's cypd6229 node to use the
>   "cypress,cypd6229", "cypress,cypd6129" fallback compatible string
>   pair required by the binding, instead of "cypress,cypd6229" alone.
> - dts: fix shikra-cqm-evk/shikra-cqs-evk wiring so CYPD6129 connects
>   to usb_2_dwc3_hs (secondary port) and PM4125's built-in typec
>   connects to usb_1_dwc3_hs/pm4125_hs_in (primary port), and add the
>   missing reverse remote-endpoint links on pm4125_hs_in/pm4125_ss_in.
> - No changes to patch 2/3 (driver match table).
> 
> Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Please do not send as reply to earlier revisions.

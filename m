Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839E335E936
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734947; cv=none; b=HLK5tdyytni/dim/v85JS5EGFMz6I9dzv1/aP9WCBO8lBqoKvfGFcVZp+UDnDlzRte647Q5QylMn+V638vfvNGteq/7uuylgHdGGFB7/IspQZf2i/6fE0pWwSawwAoItTWhP+WQvls/WGdUT/KeyZsTJIswpdzag+eQAvGSgh4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734947; c=relaxed/simple;
	bh=X9Y0e4u/UT6nrErat1cN5yiXzX2yZlRBfIzftosOrRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYCNWGcCbJGUKeYQkqGvi1EDNiSW4NTSgAgftMAexQe4/N77iXbcCvcfG8T57GxhMGZzKXTLttTIvfCrA+B9SzCcdqZmNYMVJiMdAxu7ynD4DNkvyxemZSD23fX7/Wb1IyLa1jOtYoOeyXkixDCIMJ7iLUT9f6TKFNkRy/dbzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elMw2G7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsLJqlvZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elMw2G7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsLJqlvZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWZe42878349
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 05:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxWror5dk2LdACMJB3tBxD8tiNkkasZcIcWSCrhlEAc=; b=elMw2G7LMhwh+zVm
	UL0Ir2uPmvxwzpHXyhtA0+hZqw5+ObEPYKbB/kPHDBmzIYd/VDp6dqbsheEk0ryP
	mEl5ku6ShHMpz/5AwHI7w9y1UfajNyI7iLPM8JbW90pbbLZuYpN2BDfaYJ/HP2+t
	xl4c7tsY0zenUuI08sC+8SOURJFm41CfJzJW6I00ZNIaWIFZyD8rS1DgQqhFy73o
	CFsWxP6LNmha4+kazjmqwpdEzTkZrfnFJCb7tlIPeOt9KrB8maxjnJmbLdg14eK+
	lz0HpvyGmZMzjk3dZkDtFmjfuVONuzzNFCrwByb2QC+sicwLLX64G+Rl+C71gszz
	Bfs9Xg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vtcqe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:29:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fcaa5f82cso1260582a91.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785734944; x=1786339744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxWror5dk2LdACMJB3tBxD8tiNkkasZcIcWSCrhlEAc=;
        b=PsLJqlvZz7zzvk+y/WHXtcSEJkXEmDoe4okSnbokm5WUq3jtd3f80EsuZvK2NW4rNA
         /vEIXPEtklu+HBD1XouJarqyKgD75G77TtHlWwTJS+sXlAraFjmGphqpWBl8QfA94xkl
         vszPerMAmf+Mzh5dg0q7j5HJVx6q6Q2juZV76YqXTSaJqMZIjTxBjPX4HD7Ek4OVJrMn
         AhBxrLdN/GOnWfSANN3mIr6y4ULh87GhOK/vThFFVCKUx1amnE8a6y4L2EPtENUaMi6l
         a8Vaigfug+tKgC0e9v0+L3TWzUnXtwh1y8AMIKGFhUn0oj3pmLpkP5ZZU5IP47oFm2rE
         I31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734944; x=1786339744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxWror5dk2LdACMJB3tBxD8tiNkkasZcIcWSCrhlEAc=;
        b=qs6d+UKfnPQ8KE+6tkPnAPuOhMu37rojkweIhAhrevNQdZqpQTo4eqjwdApp260X5y
         blqLA6hJkInZvq1FH+aRR+k/UFCbRfZ9PHqtszN/qk1b6lY1yVUfRQBk3YfPZXIcTXab
         /bpbKUC7q6GSsRC08+uN6qABskPubbzCGkIbSyvsn9vgO08+RyQ6/8gQ27tdUcbn1QO/
         ptVOArbb48D3DWa/tOwK8g5dGuBzhJaD3BxAChR9JsPzhK0eV+dHL63tcNNkJziPi4z4
         zaqfxVtPB//cuqL+3+rtbVjQ84anSG5d/VyWVAnSRaH5GH5vEkuolG74RJXCgk2gGAmz
         DcGA==
X-Forwarded-Encrypted: i=1; AHgh+Rpkt4SW0C2Ai1NwV7dyRQu4ToSjieac4qp/Qq269JZMt7fPscdB0KmMUw93rAg8qLwzXtsi3zzNHQGI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Ve+BJu0kF6d1W3j9H5B4UsXgM3DQXV87MuDZ+wNVOqo9M16y
	zSWRptCxSJg1BJKBlUmCXwxwutX+IsMvCu9S70Jly1NhjXcug83eCVEHrSspalawZ2syvy/RkGk
	twmn4oxNBpQYLIZ5cYOTZixCuj5XeGq0Hi6ZGPCfdiOVDL6sn1/pp2XQu63KWSNZ8
X-Gm-Gg: AR+sD11sJc381AmBYIAjCF0W2lMKUbR1XTCasz42uiu5gy3GHwi+n/T3SmKNruUDL6V
	/gUMdcy1MY5bFejaZnkFsNhmXFkTdOKbeQkHs0lHfc8oWz2fix0a03XKGHUyO0KjSawHlVqQHhK
	lpD6aAM824j1m8bdjTYpocD/D4SRJ4BdUpGsaCMZsUxr2eZxW5TZ6hE/iHCvpDjTf3G5mI2SYZX
	N+jbJgxHRoetOLDSAKqgHaAWr9oeJRlbszoOhm8A2JKDh9Wp5Ft5HWXmwiT/TxxZPY2H2gq58dt
	pj3Sp4cNb/2Y7B7Uj5GlBTt0LLK7UVyNaNvcnuwO3GZyG8UT5y3qpnu2myGyRkWFzJH8WRwj/xh
	sld9j5fzYnSOsnGcPwm1V6mAe0JXd
X-Received: by 2002:a17:90b:4c0e:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-38fbc48e76cmr7675161a91.14.1785734944391;
        Sun, 02 Aug 2026 22:29:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0e:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-38fbc48e76cmr7675141a91.14.1785734943929;
        Sun, 02 Aug 2026 22:29:03 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm32428360eec.20.2026.08.02.22.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 22:29:03 -0700 (PDT)
Message-ID: <70c41e03-ce16-4e5c-8054-0f41c1f5a14d@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 10:58:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <2bec0856-4d51-447e-97bc-13917c11a985@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <2bec0856-4d51-447e-97bc-13917c11a985@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfXxxsaYCtrCp+r
 9OJjVCoR09W3oKgrVlKc/4PCUVE2Om+XeRcKmrXh+WggKcRFSbpC6hVkKqQ8psMBBnbkxU6ZoVX
 CSglpyPmDXEkCOZkhGZMhBoYjm64YtE=
X-Proofpoint-ORIG-GUID: tIqNWZENxiDOD_IOXW90s_bL3FgHRfX7
X-Proofpoint-GUID: tIqNWZENxiDOD_IOXW90s_bL3FgHRfX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfX0zNIODydIaxy
 f68PsIhOHuI9/CkynEsleHo8ZqsV43t6A5bQgEAzhVUA2hRQWERdLJXrreExxMKvNnq6mVija+w
 QxFgu0LBHullvCepvPrK2Qx0OXLE1v8miOINW3cXdvCUSUPA/8E6VEqpFF6qUdgxSlSB+dEBm4K
 HxgoVqYBx3wf/hgwCwIwul2rjfSO65M1BehZ0ATMZr6+dxW/P5KFzRRRmaui7pRFT0tUtUlBHmE
 AnGidOhDOc2ba/0dR5lYZi3EDEH/Lwup+1VTVPGvPhQ1OmqV2YLfvTKUAQtgwrwpfN2jqKyFGaI
 T+qPUoOaS2xssjA04LwOkcMIg8DlzUrpcvZ7iRnHHclZSQi3nkhcAW2Hum3m2Z+kQ8qqh8ZDKok
 YSBvwEO+fO8lpwkEkuvk5OWB6X0ZmhQhH4fP2hhYYeIr6paVpiG5nWpjjbvdRoVJWOjciyrDxCI
 RZo67SVHjueMRGOmzfw==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a702721 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=aJKyoP8-HFX-j1aC8PIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030045

On 13-Jul-26 4:56 PM, Konrad Dybcio wrote:
> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>> Remove #power-domain-cells property and add power-domains property for
>> MPM device.
> 
> "why"?

The reason has been specified in cover letter and driver change, but you are
right to point this out. I will add a brief explanation on the "why" part in this
patch in v2.

Thanks,
Sneh

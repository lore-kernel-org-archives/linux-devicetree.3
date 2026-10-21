Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573852;
	b=3TfsdCW0/ES9zvPJg/qiEOvGG/4UwRRnMwtM0P71EfMEXwqyXumppMQXSL3Katgdhxm8
	 h7q1mLOvJYNetYS5uHeO7+r8XEeXFnb4IPdHQmJJnbiksA33XbbvH+wg1KxY6T4aa/SrX
	 rxl5bceLkLJ+R+96oM71G3kGp2xfhIArWE26pgXu9/SHRqDu5yGcSvEorxdRtYHFNOZEO
	 XA0fCZvZiACtZ34TMQJpOIcrYgbVrfGwHuMOqUwgVZZPmhma/SBiWeIV127+Efu2vYgBV
	 4ATpZIeJGh8fFX/iIs+L76Friu0q4RdYpIFUgMd5+LP6WzxiFw1gW7kx2E/mqTSQY4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
	b=HeBKzedIrDvxXkIhAwYf6IpnilAmVViuMr5wlYyDwXbUsPN3dw5TKmiBBA88+ulf4oq8
	 kQmAa9YyRr5G7o8PB1NC6+JjOu9YQFQSUkxh7nhH/Qo94eph9GDEZXm7TXxnGOc5UqI2t
	 IFgJrHMpLU4w38IMshuNUZ2CFzugifZttb4ovUxuBbwX9qDgQwu+fx6B+yK+amTL8a8st
	 X/hj0F9Xh+mSIy1+ePgCE9xoiRKN9Pj96qqqVfgdxjIVaUv0tVcjcVNi9vkR4quWp5ffy
	 vjyKl1yQj2Qlgmz70Shjd8mm18wAHcDgQRIFiYz5oXSNpFxBmTdVVjPp84uPxwmK7qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiF2H0On;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNvgLoF7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F61606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F61606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiF2H0On;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNvgLoF7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iugZ3018442
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6puuBI2ATZ/1hU0RMS24Pbs
	5fMXMv853wpEmKEbFSI=; b=OiF2H0OnLtVMFT2JYGZ0lp+VhxtsdXfI0ZS2tpNO
	6pxEI/ocEWQKgUj9DItROwzCGDh9+pxp8Hd7A15K/JVV7lxme7Zpqpq/rhwOhSei
	HFW/eBOkZpyRzblEK5s4haxyyABfXvVw3bScOsGsMtkZsdaOqpeT+8rIatNfQ2xE
	LAIY6oUfylQJYY8ocz5DVTmHG+Crcbwpg+sxZe2nmk2OUA8U5BG8qkOWaPtUqJSY
	L9PfZ6rh0vsVs+EYHojDG2B1DpxpGwOoZM0+Qey8WAf7RiOEAvhGnIGySKZHs/Gi
	OYtTCIZYz1mgUo7N57Ih9Ye9i4u4A7/kfmIhwt0LPjUCuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3kd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:10:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so108138385a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573847; x=1793178647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
        b=UNvgLoF7KVDjUcYTbEp/fVSKTpcriRkym5LVevLmiTzLA4LXO7Ev2jT1LI8R75y6Iv
         eOH8w0GA1I5+EK4MZ8MejY2BS1ikSfHny2RZa4n4jFW9jy8cx5zqqjcMyFyEso+S05KC
         BIOnV929Hodi+AgGrSj3uf/UaOOTVPTZwrn4Tq0x4xA4BQxxD1jN8izU+7aIGZ7MLrlP
         JBQYsH2wVSWRpVVVb6c3C9MLcQ/QZCXuuePSqDl8jKoDlQpIjTZgVWHtyAhGZDUJjCMI
         5CnhCIUkbNAz79lLayfj2C7Aed0iCQrFnyDWw9/F6uHM4Ib865VE+KRRaB+IkNGvAoNR
         eDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573847; x=1793178647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
        b=kgFNB3Ux317fJYsaT2eU/tBkRbojhiNyYdLpHxlRdtUcUSTPeiDWGyCCNq42cR/Iko
         PmBS+/djN9ahgVt3leyjjSO8HEC9QbRcvddPnbk/bQL+dncOh2or+qbr/m/8lqeqRRF0
         OgmytlEAMS1/jsKqNNCVxagIAHt2+FJbZQh5yJEORQQpdjgIIr+insPSmot4z39HQz05
         9zem6JRZpRrjAozx2ozPd1aqvtWByXAcc9ieSfjXhVQzTcLonTFBB3BIDZ6sJ7m8WhiZ
         HMlbZSs/JuDtRYUrSEC0rrCCWmMhZ2BPWjTeshWNM22tENMnE/kS582wdxoiYkZgLXt8
         DdGQ==
X-Forwarded-Encrypted: i=1; AKwUvBywjRRe2GG6OEQUojLdaWAQtLv2+9myOqslfvhuCsA/d1gFl79whPDioqNb96MF7P/oFy6BR+kkabKY@vger.kernel.org
X-Gm-Message-State: AFq9FYLV/Wq8T63cSB+mdjKNDiJRLj6i8lpHhvFMOlvh3A5HhK+ueDc8
	p6IO3M03qAO1NLmMvXgSJn8Krv+AVtLtrLZlUhxIqy85aK++i7vw/RB/mE3wkxFCcC5vRCtwwss
	ejHqGUvoVs4hvdVdhVjdRKhjfA2fhssOn1zvcx8KkinCgLiUp5L215DRkUcradWpK
X-Gm-Gg: AYBFou0WaYzN+9QJV7y5RIo5ZOolvS53WitA8dXpkAR4A1mPRe5STOE4T8KEEzwdzJn
	iJkClIzpWYJ6F2udLG0y5DSsd0azaD4isD8L461LsLZKAV4zOf8POnAANBVVEuKw25d7VDZzvg6
	LBSv6R8pqgTftmjAS6iFbZAblxBokSC+t0F1TLy8kluahnSvaTULR60TEi3M3FOGknA+HxZtvzt
	771Ud/6YEBdap9CKkWoqGW+RVUtzEXp14x/mgCj1ovuINjopS54HAPWPZJLlpRzbKiw/0krDPIY
	PBegK3LXkbVdLb9Y8cG/Hd8GKM4HdCxozO1r3fDwokTrEc0JNSpJSA4rRx+96726bTvo9tMOskR
	CWicEomyBNG9+DHCB
X-Received: by 2002:a05:620a:17a2:b0:93f:2658:7e54 with SMTP id af79cd13be357-93f57f06332mr317714685a.3.1792573846415;
        Wed, 21 Oct 2026 02:10:46 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:2658:7e54 with SMTP id af79cd13be357-93f57f06332mr317710585a.3.1792573845821;
        Wed, 21 Oct 2026 02:10:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm4195689f8f.59.2026.10.21.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:10:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/5] arm64: dts: qcom: nord: Add gpr node
Message-ID: <3j6nufnupwtmqsf6jwbwgcpdyklw4yja4jdxsbz5eitjgooclb@rpngddb3zcvy>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX5uhSvJYvWY1O
 ekRhj9bNluifpOUhTM2fBbEexKS9YngLb0hnfxyPOFwjSR9K8pBfC32ZnlNY+TVuK5irFz1mxOF
 8X4bayeXs4QhbgviSQ4wt7ARrxOhIyQXsYuxcHH4ErRGmz62Q9EuhpSi/nEzT+zCglSCPIFfhf6
 RU9jhWg3Ds/WgiFZAlPvXhIm35ERr/Exkt3ZzBfy2sBdnuaC+gPY5jPrtG5o2qfLRH2yowQUMoI
 SWN23Q3gx4N8UwjZyRx0p9rpbo7iU6m6kZEqIeKFg70gwcQCSCJ/7fPG5ee12uovXaKszd0X+2f
 WzZUWmMPtK2Oa00TcmgS/DxOzwQrr58pN1mpdyg3jO8elpQMd/MCOugooukHQ16rDvWkViafI4l
 xSKLyBubHyp0H1+Pq1eNduxCMjgJsYR4SsXVLA+jKP2POx2KLpwMxidaXhOPcZV4CntcbreqMRN
 Bze59jww8D5VBo2t+aw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8819b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_V8OVpiSj6jlPu8_cr8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: k3G_HRNuK27k3DWNSCbH2ED2L2y4lPRP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX3SC528wLyDiU
 AbzUuqVZTdhe7nYEovr+55RGJIRcgCm1m1pQuVhFhlBp7pECBcWpmPikEM/eADQGRUUqsvpiiZx
 g1bcfbeslKt6Q6YijJfaTLgdgESaMeU=
X-Proofpoint-GUID: k3G_HRNuK27k3DWNSCbH2ED2L2y4lPRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036

On 26-10-21 15:36:30, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along

Nord 

> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With the comment above fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7602E1F06
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214281; cv=none; b=ePUSrBV6eVnEbvyfg27JUMEsq1Cg1G0VJtsNYcKzMN7y/ctVSowgYD4s82RKrAY+e59xglznLdKMM5om0tgn7fiY0XbQyNTuF3uSrORaQwwz0ZULGKKlNXORfPLl8unI0SoaS6d/KyZnN3v067LpAjesolFSRQBxFQ8ed5AWIX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214281; c=relaxed/simple;
	bh=uhbvM1A1lkYcLVt0VEQC+1D0xdK/L0Qexms2FDRDGFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kv9BVuF2DwZpsy4BqVxIRVHphOtfiFVxbXA6KRtl179dZyhVl7WA7/4FV3c9GsHr2vBZx+SwrpSEi2G1pVTYNQRZqBbr044ihGCzp8S1bec1CwfYJUZJVv9oH6BZmLHAu3rkX9jCLWurONqn2YcgWg1f4gPooIto22yFy2+wmq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVxTZkdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVb8xATf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVxTZkdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVb8xATf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LIMu2753147
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tx3cBEJCJNmhBvYLSTPoH6tb
	pxzqlnwnHOBsIUd32DI=; b=pVxTZkdTM6PNoYSvxz8XPpU1yOKNTKRQgfbI5drW
	uZmB6b9/y3U7h7vvS6UVvlfWIrKp6l67LN6n23kg/PAFrh/kXmPbU83byOAs/WOX
	p0evbQAYZTLQZ/vn9T6NIQzGCraWBm89Vp9o+Dd6/faOZnt7DzcJ5kYVOQr1dljL
	vG6MkYh0LDuyQXeuILV9+McWl/5HZeXBEL6UJ+hpPXFgYlkJbXeLsm+27vB2v4Xc
	3BR/WKFDjtcWdYoArNm+I73WGSy3YhZ63SL9pjDImtYkujElRgpTXC/F5vzAETvF
	SOCWZeQ5Dt82HvKrUMUJdP+xZb2hbpIAocgpL7+EFfJ/gA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w4987e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:24:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so210751185a.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214279; x=1787819079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tx3cBEJCJNmhBvYLSTPoH6tbpxzqlnwnHOBsIUd32DI=;
        b=WVb8xATfqpi6PUaPgC4NKa4G34RrjwPT5epQ5fV3FTwfK7pk1JHPedqa3HrngQ+ccG
         YeOf67GXvn6/5VBlD4IffOQ0HRlM8VyUsA1Z19KTwhlGKWbwpPgXG8mS2LNBNeyrY2bV
         /cBEZNl+nCszxsdpq2s7Xqy3Q9EGKcqTGuQV5P82i+r/4RIBlJdiGzac7R41HCVPQZSh
         elOcIRUQG4nyEdRXai/vAO41AcsjiFu4lKgeGgLUF0rofB6DOqPzncOGtFwMhpM7VBUE
         R4jbLwALBysbYi9O9AhRevPc2FTv95U9rRQbzPMNZYP0cmY6vvcMcCSZEPnemX9fPazp
         2JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214279; x=1787819079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tx3cBEJCJNmhBvYLSTPoH6tbpxzqlnwnHOBsIUd32DI=;
        b=NB9joWfgDzpzH6M7iMrcpylPe5ZU9JtMp8bAnDA9BiDTOQiJ6DCsEO/L2TOoLmswJT
         tp18TekLehI2lhivRKQvNmPc2lUtReTy3ayLAZteoH9ZMrXCsttIqg0qz3y2VrZ1qa6O
         4g1fkSng5yBC85jM6IorO9GmOAgB3d+EpsneKaEiOpEt1TQ9kN2sQ6k0K2wnuwNW8Uos
         XFV4u6fNt2ASHMfeB3p8LpK6QOy6uf+Kn/sqm3iPuyQqCcMUcPxt1ZsH1Du2GFYFsHEK
         pnY4r/cbHwbWdXr7Zc3NXdZqjuzZVxMV55pQEJsbBPLciqFptWUit4sWgRONWt3T4sQj
         /biQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUymc/0FORtlXMQYbYuk8dm8S6hvgeq96lpvpFWX+bJGNlQ2IIlYhYEsu8j1IsNOz7Ott7ADpPJjUZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3KbO3hL9XietRRDTK6xiPQUsPYN/9GiHJUQFohW1qRG3qw8Lm
	PgrRLVxl9DF8dtAB/vvFk5F1tAqA47IMeVjqJJsofkvJdLFnlgARXzlCc4U7uMM2to9cAqUyECn
	uudZTNYiX1l7c4Z+Tr5k0vkYbysCCMuESeQvRZRFTdaui/Q2K331htLB5Frpt4ZYP
X-Gm-Gg: AR+sD11iRhv7aGz+EDm3LZqy0uedI6zgJwJIV6rjLDkL+T3YyavHRnUqHJat8nPmVha
	cyItHga7DF0kfPH7EJfZNzVdKUN97Oc0mhFuEUhNdlGUfXcWbccXLpiUBTyllBcy0FauoVLvOv4
	EygG5Znv9Xpav2JFd/Cexg6yIBRUj5YAKaLraFBZ7dLvKXfHCWmn74lXqyLJ0mfLIHOxSkkdwJ+
	6mUyHHBeAnLcIQ5OPRKgCH7GesG1VFxtacSs4DP422xiR8cqQwHN3MrXbQIXPOiI1gHXFYzxxk3
	Gs2R8Px5tsbOiv8CpUOLXIY76VyyweMUkjNvxJZAqN8fOfWOCZrjFKW1KVx7t25eW14G4rrqVUR
	cDKTLtoUr2nbLDgQ=
X-Received: by 2002:a05:620a:458d:b0:936:d2a9:1dba with SMTP id af79cd13be357-9371e204e3emr846861385a.1.1787214278636;
        Thu, 20 Aug 2026 01:24:38 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:936:d2a9:1dba with SMTP id af79cd13be357-9371e204e3emr846858085a.1.1787214278101;
        Thu, 20 Aug 2026 01:24:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm12926289f8f.29.2026.08.20.01.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:24:37 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:24:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 HSIC host
Message-ID: <unxuswp7lghhaa64rcerxdxi3n3sc6oz3iket6mf4z7hqtji42@7temhlkxanse>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX+Yai0jtepCgv
 GqoOTZ58xuf4ny4xB9t95JEtC8xWeiD4IGqXM9heHlCXY7zCRu0YseFrFR/X3cyWpbP4xmBZL4s
 g5XL7wts8LZkriGTcCTg/B+cn2Fnh6g=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86b9c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=u23MIztejtzZNv9v5ywA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: W30V_B0iZE0o58OIGfSV4-Clr3p7wtEk
X-Proofpoint-GUID: W30V_B0iZE0o58OIGfSV4-Clr3p7wtEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX97oiiJytNOBM
 Ur82aCB+diZciVt2grl4oWdeCrsxBziEv6y1FWZh9ZvvmSr5Y5xAi6BnCYyooyNcxZdDC8+6zZ/
 w8veb6X5zp1tCstLGz8hGvwY4ny0R77MgQvhhZLN+AIXr2cFP54s7XlbCKmBDxF4sV5hwHDRBHf
 S8wuVLj8m4XVaAowNBuwLGKwgBtED8d+rjjJWNj2bBSopwRHsBeXf2LPhrzvRJJsGjsJPL9cPCy
 D19Y/99SdM8pGvunxPlQsFs71oAQj9sFld6znbF1NZr8riURpO7DwUk7KES6UHKNrpzSEMUZdZG
 86qvuOMZ5bL5x5KaPZQdU7nAiX5ELQFt/3e/a8L4zgUuv0yFmwURMqtW4h1UC5mjazfxnGIGO0k
 CLhe7TsizGLg5tH73/oxZjrOPd0yMSLFvre4ulsZ20nnzsHC4jYVO2zNCiOvfnEew75cJPAPdLu
 hZX2fq4KIDjzIlkFYHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200059

On 26-08-10 18:42:14, Dmitry Baryshkov wrote:
> The dragonboard carries an SMSC USB4604 HSIC hub, but with the HSIC
> controller undescribed the whole HSIC-attached part of the board is
> dead.
> 
> Enable the HSIC controller. The USB4604 hub isn't controllable through
> the I2C because of the board design issues, so reference it as a simple
> USB device, describing the reset line.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

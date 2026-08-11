Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CDD42668B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439577; cv=none; b=K6/YDzBX7StsTxkwKtqp+qLzl//MjacfcUuP1xpsXP1HPeCu+06g8USQBBs+2dvIrbxIFdAWCVXoIYxgXvkRXfFSo9ACrYKquRrLGhOeMEBJWOAmsx42hfHwES9/RTKkdUNUoPjreQI3d7W7EKLjMo4iwHFCJoFoTEE3LllQ+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439577; c=relaxed/simple;
	bh=HbMRcUd2IR9+AKd4eYu59PgzfutvcCldJ+T+OmNP+DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWar3p/ix8roGDFVvfXx6aUDPb4mIXZfOm74Q4NoM21kjs4nDkC0fSmkW302fbT0n+nfjwoXChXNle1HUWibdlqqIXhfOoo4hwrwCV/h9m9WsQIsScZFTgtNw1ZZpW49u/ciE4PaTtL/PP6C0K0AcuJngSDzIVKWJLnyoNZam0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJMLAvpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZXEpPiJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJMLAvpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZXEpPiJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6oq0L2705334
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PYbmL5om4yZbKjFtuY1xAW57
	q9lUv9Daz0PG1f5WID0=; b=oJMLAvpEVMcJH5/QQVi18Xo05ex0VHrd+zwQzALL
	m3BlnReGzggQuwwq8V70Am/9gghxA8qLKguyBF8l5bXTt5PPao7+TzmKnkoAt8L2
	tF8GrlGWDmyen9iX5rRkO54o/dUgBKrww1B4rO9JWMMGaN0YZDzMj3BOu4es+TcS
	txvYXUMZklscAVVl7mzieiZ19HXQB6vmyIbaXzn9u7NNguKQL7nWBeTBIuGMA92D
	d1DQmg+B5oObe8vi4DXjV0XMvACWxq8X99mWLhI1fY1/g17cwkGg44xfeQIFMfgo
	8vRgMP9lOgHmRhYVBWeyG9vPibrdyBm63jGyM3gJSOPORg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk63c02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:12:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso33004791cf.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786439575; x=1787044375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PYbmL5om4yZbKjFtuY1xAW57q9lUv9Daz0PG1f5WID0=;
        b=iZXEpPiJggtp+UtKta41q6wsHFm1ecU2gt8FIlz6udtYz30qkvQ/98LJnDo7nbt3z7
         yVNVWYbWYXRIepsfC7gFaKmQCPouYc/5M5Bl5HagrZfnRu2cK4+knHoy9k2S3dR4ixCz
         XyjgK01aGO6Z77TfQbTtCMkWDFVT7IgsERlNH9q4pmDp717uYEudvEjk1SVtqIboxR3t
         72nxdYeNdQEhSnlTdEGbGRGWmKVkFDHkYAulFer0XecQWWANo0yBDwn6Fqhizpvq4Q6M
         d3ukhW+9V9r7mDAUemONipT2PsOJbRIoGtRaxLIucroeclbSS4MtxuboCO3i6WdcoZ95
         HmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439575; x=1787044375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYbmL5om4yZbKjFtuY1xAW57q9lUv9Daz0PG1f5WID0=;
        b=Q22524RumlCJ0hiT0omtFYAHyHALAFxcVJD9JEMEOAkykbzbJ7re3DXrXTJBJ/ipCb
         7kGcKhiwbZgIV4G68A10tew44HaiHMkrQQyPMNJ7aHP4D4cWbVkz9fWaS3/UDO+REal7
         1sz8Md88yZiyhIx4YwwYVWski9+PSD5gChKsXT3WkgmJ0Pq+n7tq95+ypZbudUE6eF9A
         ClsfS0SrJVjFgql6Sk6mUYGljVfjzKIYV715g6aeIDKs8Hi1GmF1/aErh/hpQtZ9sDLI
         f3+vJhE+nlausLlh7Nb7oyM/R0GY7OxQB0OF6M2p6SjfV0UmOG1F/5dqXpPDFc7uy/oC
         aq0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpH0VkmdUorF8yKgXkPv3VJFQWBAiW9KGyPmu0RBC2A18P/aGklyCTg00yuOLIfng08qEr5pJLXikO6@vger.kernel.org
X-Gm-Message-State: AOJu0YxGB/TDx0xeY5mfZpaLnux6NY6hB3PETzqsJk2AL9r1NMMuUsVW
	js79eYEBjwAkRxy95mO8wvSx1EAfTX/PuiG9hKc4WvtlCPuYN1Zb/QCleQpVM+1sXGdrBomqXUs
	8V5Pxhlg2ooLa7s1GxaP85XUZAxKTUzljB1KY4r4DQkKkxPjRvt9vqlGYiqILYvB1
X-Gm-Gg: AR+sD13SeKJZ9rsb5emYrphwysYdWlc/N7n9WgorKK9EndKEewSxN1RB7wqFdty3W+m
	YUR5yOJMB8glUROPLOvMHm5bQHnF/76NwnKXxEqXpvzEBPQsgNZJQEiIeAbsnRTI5bzytPoEJXh
	xZMDXr5GQE7ZpFNWg98JV+QJ9LzO8IuE5qK+tYqa9CgUQYk4mQMsLU1mjqdSVmOUIBBurV6NE7S
	FGZY58h2bYwztNpeeCkkCgSXVTF3Vb6Ftv8akqdbwnqRSWxdptCgep3YcM1yKJI8mclMOp1w1vB
	5K9f5lKJtelCn4IHpf8o8536r4CMbMNJm+MXgC5pPj2uK9kGBTY1Ikh7EjSKeykN3myO3kyaQFz
	ZZuvnzsp3ToWJL6AVKetNjZijIZQ8OklXkVYTQCqwjCZOAUwqOh6RZ6Rhhfr7lLwazc4/qnDrnZ
	PqcdmXKEZ5EyQc5Q==
X-Received: by 2002:ac8:58c7:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52d584f6869mr11929371cf.11.1786439574776;
        Tue, 11 Aug 2026 02:12:54 -0700 (PDT)
X-Received: by 2002:ac8:58c7:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52d584f6869mr11929061cf.11.1786439574399;
        Tue, 11 Aug 2026 02:12:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa6e0eb8sm1307051fa.38.2026.08.11.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:12:53 -0700 (PDT)
Date: Tue, 11 Aug 2026 12:12:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Motorola One
Message-ID: <c6zmjiwf7kplcu5qjb5bwq32ddppzexqturyhobrjwrr3c374c@nrtwenzvlkj4>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-3-79a779d76173@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-next-patches-v1-3-79a779d76173@gmail.com>
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7ae797 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=Az-PErcXXn3KkYGSV6QA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Xs2FXzs7KxMYAg1u9T1ubB3cox9hl_QM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NSBTYWx0ZWRfX2sZgnW9TkZnP
 G1Z5I0PBUfN2FYzMGzi1kaf/BTL+p3sUp+Q8tKMm/X0gmwvraQNVILEOOKE5h1Kom6TWG65S/JY
 smxx9HBU+Qh4oOwmUFMkjL1mJ2TcCL0=
X-Proofpoint-GUID: Xs2FXzs7KxMYAg1u9T1ubB3cox9hl_QM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NSBTYWx0ZWRfX6/wI+RZwwlcD
 NP3TPQ1lnB5wN4o216D42bZeqrq/Q4g7+uwcYNh3VP3fqrMts7WtOU641CF0Fuznl1MotwOs+iC
 jnPZUl0Jp/F8MtY3BIf8MHGPhdO59utEp0Wq51o0gbmGzniWhv/k7zihJRe1mTncUwpiBKxg5VI
 Z8W+skuec/VivLdSWfK120VFbN4dqzufkab7YTZ2g6cHpn4PMoro7gG+pVD1f3S0cgC5OErIsH/
 KQbts0qpqaPmwTALcaFi5P6tibMHY0f6oWxsCYDeTcv4DFyhZZ9DFTY/Igt7WCNoPUFqeg10gMd
 BBL4z1NuUpKGTIDf1UepvlL6nTIVN8WyEB18wY+xIEDTCTZX469/3VIhRYmLkvVvD2OD4XPAj1t
 yuSXiUMdHZghWoT23vKHnJ7/DYXVbZa3FePWQgESWkf1k/9lgT+SqaPs1hN4eGNtDC79Pu65SDQ
 mu20Gb970BOBcfG++yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110075

On Mon, Aug 10, 2026 at 06:55:36PM +0200, Adam Skladowski wrote:
> Add a devicetree for the Motorola One smartphone, which is based
> on the Jacala/MSM8953 SoC.
> 
> Supported functionality as of this initial submission:
> * I2C peripherals (Touchscreen,NFC)
> * Power Button, Volume Keys
> * Regulators (PM8953)
> * Remoteprocs (ADSP, MPSS, WCNSS)
> * USB
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts | 443 +++++++++++++++++++++
>  2 files changed, 444 insertions(+)
> 
> +
> +&i2c_1 {
> +	status = "disabled";
> +
> +	typec-portc@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_RISING>;

LEVEL_LOW ?

-- 
With best wishes
Dmitry

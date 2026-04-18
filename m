Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA1E29AAF3
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776556032; cv=none; b=Q7HnYjKmg0kEAbeL/D74aDc8dq8hUr0eQG4PK1jt4AAxaThjd+IzDVCYnnZRkXjkj9sFDDyJndyO83bwgkHu/bVyjw1tVboxsN92qlUF74Bt4JXWtP7h6XG5Spfj+77XHbmHf0MqxCAjha4GrYvYqm5zdN6gFqcyvaXvhu459Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776556032; c=relaxed/simple;
	bh=ZIq3ZFZ3ccjd2F7BAVM8KR1tPxZH5+doNDatLqhgqZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1M9UZqzNvl5VJlFoCHAxiVF0H2ylRrIW3KRS5ka8h9r1wypjX+le1lDoXOO2p3OHRZB7V7RNi0eeqbD8jgkrnp5t+cAcmD5zVg8E5aYAcoAR0bgwPVlpFYdNbBqOL07rWk6KctV5g/1wtUIQ8m7frbPVLXoVEhuhyF/MyfNY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8Lj18rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NizHDYnV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8Lj18rh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NizHDYnV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63INeitG2812344
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 23:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mf9OnmoHEVZ1CoA/TLWVuCr7
	h/Q+VXDFuGsuLoR9U9g=; b=l8Lj18rhmcm+9cV4pJDbqtyViizLvMd4VY8jFAt7
	rRfMEGKc5DV99pQ3YP7mkbsgf7L6F4Q4o+fBmcgIugeqgr9OOxMdd/CvWNfdLNNO
	8hV1aiItk6k29if2G3Vy4qrP+g+/SOVvUaO4d9XtgeCCeCG+kO7MLbpMq5gjlHYu
	bEksLLiVWPiUycHJquZghFeHkrKMkEiP+Njkqojnov1hw1hLiNi8ZjHGn6CEUR09
	hu46d6RZoNvOzTV+mF24eESfpLB+JsMQXh+KFS4ry6tos2BWGtvHjI5gmeE5haYZ
	fSpqUzBXEv1uN7cvGW5cF5Im+y54ZuNQxItOGHHTQ+WLVw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b71kjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 23:47:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d402a0cabso1558297e0c.2
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776556029; x=1777160829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf9OnmoHEVZ1CoA/TLWVuCr7h/Q+VXDFuGsuLoR9U9g=;
        b=NizHDYnVIEnu0CUS2x8JEGm5HteNuTK032t4DB0Y1VmIs8q7Sfg6zVs2mGB+BGFSkB
         l14Eko9Gln3Dgp9qVQLhJ/Pr2/xQQI/s4O//WurlNj0nj5HhiKNU3yEP9+OREJIZK682
         CIRVsMdrxR4jImiUM3RNNngSX/TQoKu5poozVg4atY4LGTUeodrRvuVsnuUWLXVKOxKa
         h/R/ipC8EVxHDWRYu0+OSaXL/BJBs5MeBiBwv0v5HqhH4Y7QZQADAkyw0SLP1pYE7/DP
         B56lVSXCJnXnUdgsv/NWnSqAPIig3j+msBhqZd77HzurcspK5Cj4Wqsgt6hhXPoRpvci
         5/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776556029; x=1777160829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mf9OnmoHEVZ1CoA/TLWVuCr7h/Q+VXDFuGsuLoR9U9g=;
        b=pFrVN2t+LkaflqIgn12jyACPMy2SWGd2RJEJfTzxbZch9rd9q/rUXO19NlCyJPog4N
         GnmtOmpyPx96/JFwphjPUpI//h06CpS9EWz7gWETzPiGofTwQmv57sXr+2KhV2e/Y6jp
         mk15QA2wjGF6q2X9ZHl5GbBbrDRtB3ihMj8haHCxj4aIFDkzwjyKA6Lxw6fiRSVpAGvz
         86aMD6Q/WlcPbLfxVzwZBg2m3DYBePYmT93Wokf6yIGQHMx+ESsE03GtaN/S4A4YthBz
         7CeWBUMufeTcOCeO2OFagSRvcYITCvAGsqh4JLv8MNXkKDqmhaFdFVAz2k3TfBZeucjj
         NvLA==
X-Gm-Message-State: AOJu0YzPF0t8KZS4uCOdW+gLKE+m4OvN6MskiRvwPqrdn4ZDzhJ2vpCp
	78Of77mZA48se0TVk265vS0yDwVWg1/cdIMX4HemN3XgcANFhhyCKtyaswaWuFSZFFEtpIFbrDR
	XE6krg/9yHQ0YTmlS8oEn8aXNYqDv3XnAwqp4gk7d5wYH8lAQ2ZQcMNQPlYd1mVSU
X-Gm-Gg: AeBDievnvMYrlQWZDaw+Hd+hi0uOgMSDgyszafBH4o6EXKTWVyXaQyHw4DXIshFM6lq
	cTtwcaey5QiUh2CcHMbMIQmC7s4p6h1gcRJVOFxOaCi//KEK4TQV7bbvFi0F5MfuuphEapfDEpH
	xf+tFI+fsGdW0whEfWzBxJOzmzsaf8A8Fsa14WHLI4nYppzJYVH+GJRkvRhZa4/NTsRLjtqUOM2
	7jBiH5fEAKHu8ujwwIT7TP9vkUrIDYVp4bG4fIqpZ9PiH5T69SKHFMY8Byhv7OOxn9Yn5hpFv5l
	dFjo1lIEuoCGG3k7BL3pgwfb3946c/Ru70HtWx0Zf5mqNZsu0h/5AX0g+377HMSdXaNAVfLa6yh
	7FTpfDbikm10zWaMliPThWSrjlVt7KctC6wnosqal9uuSoYckBS0pqeiu8Igel2kAbw3yQkNXqV
	vpX9MOLtCoeLSU5HWRF+8kpmH+dNoDg1KioGDyYAl7SSbXDQ==
X-Received: by 2002:a05:6102:568d:b0:608:706b:b346 with SMTP id ada2fe7eead31-616f784511fmr3026421137.20.1776556029331;
        Sat, 18 Apr 2026 16:47:09 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:608:706b:b346 with SMTP id ada2fe7eead31-616f784511fmr3026410137.20.1776556028819;
        Sat, 18 Apr 2026 16:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b6dsm14310291fa.20.2026.04.18.16.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 16:47:06 -0700 (PDT)
Date: Sun, 19 Apr 2026 02:47:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417084749.253242-3-zstaseg@gmail.com>
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e417fe cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=-fOaLbwZGdKy0L1vIOsA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDI0MCBTYWx0ZWRfX2HXAxM5pWJQR
 FP1Wx14CtGZbZkI3iLP2ONk7MFutmw76KPX1nGuj3YYkjaw9YE9xB8s5+2V5EK6rSC0QA7rDfIc
 K4Pv+oTfPPPunO+xguaDYOHq/3WY0JpA0yVnKOeswfa7VBjDwfRi9mhi8HD+0h1Qi4FK7QwYuZY
 gwJMdLFU4U/VN0xSvQmcDSqomMvDC/eBru8mr5WuazcQaeHo06VWsGxZ4hHzgcv1J9lFmf4b1k2
 xRhjJde/5khVnk0rUpjaYEH4ZXXk+214/qZAwaKmq0fgM+6F8/AEOBqSdP6Lz172s4/r7LpB8Gd
 FxK7s1o92t9Y3jyNWsP+eYW2oPJz1rLXCeaPdqEQs5aavCWdQ0FdW0Rlub3Y0K58Hzj9e4Gyzja
 PCgX6a9v+JohCFvX8FqGXo81IvGA+v4eFWDclFKrbzHeZdI8I2WLUwRN6MzcV+zkuoXedKJKN+a
 2UPwoeBpYqZ9glYxf/w==
X-Proofpoint-GUID: L0mQePzRW-VZw6um8fDKxRBLFPfz7Ih8
X-Proofpoint-ORIG-GUID: L0mQePzRW-VZw6um8fDKxRBLFPfz7Ih8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180240

On Fri, Apr 17, 2026 at 10:47:49AM +0200, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
>  2 files changed, 908 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

Could you please move these properties to SoC dtsi (as a separate
commit).

> +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
> +
> +	status = "okay";
> +};
> +
> +
> +&tlmm {
> +	gpio-reserved-ranges = <48 4>, <56 4>;

Could you please add a comment why they are reserved? I _assume_ that 48
is NFC SE and 56 is fingerprint reader

> +
> +
> +&wifi {
> +	qcom,calibration-variant = "Xiaomi_taoyao";
> +
> +	status = "okay";
> +};
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

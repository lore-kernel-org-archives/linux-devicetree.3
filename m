Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3821A9FA4
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775920864; cv=none; b=fDHo2sYd7NQGRMpLghkzSfElLYXJ0mdNVETh0kjeoU3JTr/Jul/6WjvL5UwoMCn46wG8qEG2erFKn6+c8gIfH0cWb8Exc4qaSrNnTmIQ1o7MKdsGuPayMShi+Zc9Rr3oM9LCle8wRDp1rYC7Bl1fZCBrblXaLJAKrJJ4LI5emFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775920864; c=relaxed/simple;
	bh=2dsnOpTyHGg5d4ByDswOZRwCDlSavjpyCW0ZgxHckxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns3g1zvNENIppFyMQQoPoAtQs8kKhT2+DR9QT0HnVUu6ofYwJiTa07eD5fD7dPqkEekeBpuGSm8uWkG4NwyelSddoHqMwzdSVZzG2FNrQENmLq2pPcgC11c1hlsupo0mmETc8hUDD2Leo1ecQFcs2jf+XxVmUSquouACugq+uHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f118YPds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrHNULzt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f118YPds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrHNULzt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4lPXM1836113
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 15:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q1aZr1LclelNS9hB5lQ79N/H
	Dg+ucGyWzEG/IfDrNyw=; b=f118YPdsmjQXduKkTKUaAHaq43qXrKcRnoYYjQxF
	n84GHwt7gDNYUFXC2Yjsf+VnCADvVB3wQ889og3Yjdd5e4xKTrUbZJLFrAoVeFm2
	fQpxzlIUtuII+etSe0sVKuWfKYaXNCHWKhWtnfgte8fJCG4/yl4rGH6DtNzdBNtQ
	Bm2DqkEaVnf3WAeWDVVyZZ4T0KBbCi9/0LBRA1sGJZXNYG60FbwEnC+IS+GF16PB
	pJK4v7Wfggkn++PaZTa7i4M/rReBX5FvYZjY23BvUY4MdtgQvCPHmRJYcHJmFCAc
	gpeUTc1BzORqDvbJQ1WJNjYcNnagXz8QQXz2HaDu/lW60A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6gw34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 15:21:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso80187821cf.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775920861; x=1776525661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1aZr1LclelNS9hB5lQ79N/HDg+ucGyWzEG/IfDrNyw=;
        b=PrHNULztL3G8x4Z2qelFjWdzVfkwfLcFB7gv6VOwvDoLnOu1q41JDtNNtQa1bV+RJp
         n92fMfk04Xz+I+B2WqIQozS8JJlpbRBrs1ImjMpFSFuxwZktSe9Ffj2CZIUmPkARFEDl
         6Aw3d+S1ONGU0WiafGWJraTsy7y4rottK1CMWM7A3K0C4/hWnYS/DaRH6V3GbYzqw7I9
         78nFKrgNihoacRKpY1L2RzGPkSp/Oi+8o9UWQAOuXPzDhKtYcOrpBcMWSZARmUq7AYLq
         ONBScuKLjB2dH/lxdprfxiuAGc2HXZeq3HLGlaSY5kO9etgDck4JDfa4Z1vFvtXWsibf
         HUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775920861; x=1776525661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1aZr1LclelNS9hB5lQ79N/HDg+ucGyWzEG/IfDrNyw=;
        b=A8r/AqhZRTgzyGongL9/faL7oMSysBobJSRDrB2kX49k7D7+TcWqnEHhTMtlynZxeY
         UIY5GRtOTGsVLciZBOgUc6wXAcgG6ge3ItJfYp/z0T3C0x0CIJkA8xSPbUoHDSR90RP8
         HvrzDLaC/XE6ZEKBqHt4bdjpLq4OCTXZsKPrRK/A4gz2IuJtCRdbs1uISpsk3bvqtC4j
         ORAzw00jsJitfgIzGL02KpIgpHCRX7E9KjvPQm/0MPIKe/91Lkqv9I4gxW7wisS6vsff
         akw9EuRtKPLjXJIISiFdFnzmK3k2MP8iBXrQSqBD0By8hYeuhPe1woZdbwaxAxcEo/Kd
         ZLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRMtLLoEO4bD5jh87zg4ghwxbr30DKp+Hee/K1IDNe/4Y2hJnTBvFDBnNse3SMe5P1eSAAloVJTTPa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zCUHVGF1ShItpXDO5dRkO6DOuml5hD4ZREow/O1JcxDz9iZF
	OJXC1+efPI6uTH3eTi/xPMuwxry3HehjMtLzjq9JzQ17U1xOoRCta6sBszEM7JX4C1wFWwTtu4m
	C309jHQ5bK3b9C9Wx2PCEsFbsIwwzZGTeBDdUWuKRlTsiVDKI12aMWuWDOjjYLYmA
X-Gm-Gg: AeBDieuhOY2ClYqhK0eiTd83Ss1IDlkutib7QmauLu95sh7OIGtQJk3XGbGobQuFh0k
	+TU6i+dR1RHgb67N1KJGzUXkjrAAXGlcHLfBytpBd4yc59XUvVTqvD23Gv7phQlBR3TqI6NnoCF
	lIZDGKdOdDRl0vVOcrBOFgWBZYGKoodT4hGKC4QjYXxG56tq+wL9IrKVjkO9viPmQq8p5uzY56d
	shiA89O6Ynj2CvfY881dpM4CAncJmJI61+Pu7cWQORhCgyVvBv3u3YSxx7V6pytRANJ3r4p3V1g
	mftMh+L68AfqnnNhoCyyLk8cFR7oY/qZxssevNWdwmkQ/Ee1u3WzM0yyehfZYwm2qiPNzCWjqmc
	AMWL6jUOsjZ2CF7i3vF6kPddyEl3N8ZjwD/PV9qWdKAPZV7Es5njsQrEtfkIHz6figpsQuoBSbE
	uLHrt4g/OJ5AVkiVnf05+KYMQtVdbLnptT9Wo=
X-Received: by 2002:a05:622a:1915:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50dd5b775d5mr107453561cf.22.1775920860916;
        Sat, 11 Apr 2026 08:21:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1915:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50dd5b775d5mr107453241cf.22.1775920860525;
        Sat, 11 Apr 2026 08:21:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495ae96fsm12543531fa.39.2026.04.11.08.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 08:20:57 -0700 (PDT)
Date: Sat, 11 Apr 2026 18:20:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
Message-ID: <ntjffipqq63azsi6sbpz55b6pf23x7rcomot5zvc6adi62472m@bwwvv46faqh7>
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-3-9674cfc0b5a2@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-expressatt_fuel_guage-v3-3-9674cfc0b5a2@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEzMyBTYWx0ZWRfX0PpD4gSgl6eC
 ugJg8MaD61L6isaSnWHwpXE60UAzEYKbXFbNA5gIrRw/f6TmT1H3o9DfWDgvHCc3Tc6dLPYwVMi
 NFlhvc9RrTME14BP6eP923HoEK+F0HYCEto5Tc0wUM3Qi9YlVRl5fys30aGgIcxQzRA+5PS40W6
 8jKlHEMaPdTTiaFk8NzUs3qnft7xBAeJ3XJOuH6H4Vwn9qhJS02i9nDwZvLIhpN+PPyUUUprUnF
 Sxb+5OZ9RNcOKoF5xOjDbiUpuZC8MAbmdrgKH6RarGAys8W8Ahj2yrDjfKDO1T5W20ZA8iP4pY/
 fOZ8X4XGblCioddmKVn+bCeJ0bo7k//Ry2MuOEJtKpsYzND6Ij7eSU7mPnlE8kwds+tlWt2RWng
 i/ZfIbjUZAPDxINc4qQQZmuumH4aNGVaQuvlYMDrJPaJiSvz18Rv64R68XBKTKGZELUwWyZIPXZ
 xdxLiSg0wWEPTRPycHg==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69da66dd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Apu4DP7LmR_xVQy10KIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WVobJX4SxIW9EUYCyBqBhpwGenlydSVe
X-Proofpoint-ORIG-GUID: WVobJX4SxIW9EUYCyBqBhpwGenlydSVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110133

On Wed, Apr 01, 2026 at 01:32:15PM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the I2C controller node for GSBI5 (gpio24/gpio25) alongside
> its pinctrl default and sleep states.
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

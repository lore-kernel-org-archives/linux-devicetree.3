Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C221638D
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331603; cv=none; b=afZAM1Y32yMWGIJBIzzd8O31MLybBge7TOTzo6NLJDAJ4YwMTRsqDzRYB9ROBtFWYRH/2EN2ajGPYZlHrs8BLyx48x0Qh4+AaJiEM9/EebVHvh3sJQqHpOtJDiQTaCc1nWniZm1uEPqStN2Ma32PzqFaYYwLysSypnkKdfAmMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331603; c=relaxed/simple;
	bh=p2OfzzG4G8KLwtyNQkO96oL7pLRWUkBiDbP6JOfz9PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cf7Ssl9qfpgZWlJo3VmKXYffgWA1YFeShHeFsrqQadDM9YE2bPdEhsqH7FLiAdvd5FuFoJQ9MmHwq0C7HlRbMyYQ8QffIQ5wpcsNjOHoCUGjKqpg5Q71xDJBOGzfGuEgaH6zhxZ55MaFQvFtbFBGqaH2/jUt9yJJyluD6DOFjQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOesOBMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhxjyY7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOesOBMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhxjyY7C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344eMA42973665
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Y6sw1A3WFhL+VkvUlWOCSa1
	jxqngojoEzA2TO7osGU=; b=LOesOBMDdO4ohdP6woHJWtkzkIUaGMVs3B/bbVs0
	RToNL52FSs3JAdaIGIxzXjFsBVYHJb47YVfFwkb0NqrSl+eEV4D8jdX9IpXm1Nqd
	Zyz9ok2rk+fAes5iBbnwRSIQTBuSLXD6vIFuvqqzjJlnEnJmkkydGXODJziN0ic3
	lgt0Z7qYToJXTR9rXorUa4cdibfc+4r76gX/Zpeh4dfbmXXgXJaHpzFvY6kOcbMz
	v/gD86vsD4Q6jCni3OhXGestmL6T4r2LVkm+ofIWI3a4JAuHg8ZG4x1a+bcd2TSY
	W0a9ceRIExC0+LuM5Qws1T+W9UHJ8PalqgooU8KILxgvMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauth99ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:40:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so132353051cf.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331601; x=1775936401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y6sw1A3WFhL+VkvUlWOCSa1jxqngojoEzA2TO7osGU=;
        b=bhxjyY7C7e9JX4P328FRxL/QKuV/5sTyFAULL9+PuWczrS3ndDa7cCmJefZWSEs6C9
         bmtKRZeREEUM782PfjQq+sNKxOCzXBZa6S8UZVHGzDNZWZVEZxfcR4uU9+cHN8ZIekDy
         BDCqpUZY0RbhKPam09g6H8rr7FhHH0E/r8N6ZbonMZtqZpX0T7UPtKWD6t00qA1u3RMs
         iNgOaANKOpI+ibbNheJJX6OAov/7emcvUXCOOjFJbWsqHGo8kenQvyWwQhrKSjhI7+p5
         qhcN8/meWUnuLtYul3+1rpOni0g45HZw0JSaRJDjQAh/C1dajPnlC1tKAz6FywY6qqiQ
         SIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331601; x=1775936401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y6sw1A3WFhL+VkvUlWOCSa1jxqngojoEzA2TO7osGU=;
        b=EHasVq1MvZTKWAtcWQcPBZYZmBs+XBYnBL3ZCZYft0LDIW0BTGfqxqtjQzuz7nM3/Y
         o6bU4PI7dYi+o7WEJ38SLqAV9EkcKVD9kNjitlVrSkVoA/6hLPb2Y5SwcFoxbsbl0/gy
         +SFBGnUFThMq8RqQa9lxNKVs2ETN4ijQ5jFCdl3JBqGkh399NUx01Jj6BWk4+y6iSmBH
         XdeUJ1hAwRzAV93dv7rFZ0+xiJQ5IdYbWmKEADOGYQNrpz9KehUtczhMELFqr/3lvnmK
         3RYjupUiHg+CUN52IRXAU2WdsID3IouT0/0WKxr8/hbIn0CiDIIitZX63s4KoV2vx7iu
         JrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIIQoFCHm6gxxwLWNnJVyMWxSEsEfmgc6j1acUlX+S03ciMaEt6jl1+vlzCAUey0FelUSDulaR6hPA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw3nAyKv8YAqEeRqUhYzGP53/FXacfuGfFbE9PIn/QER1OZlCQ
	asezapYIFUTA4IJ1M4A4GMwNO/87zlJiVtSUU7TOnYM2BN1jOAl9xayM2G6tMJcM9ABFod+fp4o
	IoDXtE9V8+KcbSooOEVBYMPOj7M9t4GgPYt9BQFb6/cuqLc/19jbZgOETa053HppF
X-Gm-Gg: AeBDieuKwLhmyx/cALTWO6c5VoX47ALaJUZpVWo10i2ddVpWQWB5JqrbMVbsyPgQqbt
	szrKFQycnmKR376Y2ApMnUzI61MvNEYwk6kAs8VIX/vZ9S4j23cTjoBFiSpmJbpdAUittpPiANI
	uYSCVvPzE0zAW/WNg9hMV9QJWsJ00Tcjmq7BcWhDDVeW0ltIQiRl+vTL8VSjFYLQ0c9h/RvUr/l
	ELBWDfepNSFrx64i7DA/lzDiF7S+xZhvHPH0RiLyuBE93PMONuZLzXcsY6sQIL7mdY4LeS+oF7q
	AR9AMOljxIG/RTsNkVepHUXcRR/W0Syei/aYqOZbRNohhxjNwo3VJ/plrkia0BOZZLlaqvdm7DR
	hH0r4QJ6pzaBpoDyOMjUXWFpyke7TtUWkhdjtVBd5z4SijinnQttNgE5rfWCSzQQDxXjns+9eYx
	jM2AXnKhGLXJQGtmYARLUZX8MMCAj7hsLDk2I=
X-Received: by 2002:a05:622a:17c6:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50d628b8b00mr126201121cf.27.1775331600966;
        Sat, 04 Apr 2026 12:40:00 -0700 (PDT)
X-Received: by 2002:a05:622a:17c6:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50d628b8b00mr126200751cf.27.1775331600525;
        Sat, 04 Apr 2026 12:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd31afsm2273992e87.71.2026.04.04.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:39:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:39:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warning
Message-ID: <ydu3ammavu4phhd2x4vayivgeelgmbrmm3dqz7elvs2m655lm3@fb64yvkr5rz4>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-1-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-1-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfXxqL4A9Vl7s4M
 j+Fpt+tFlEDIrVgUENJnKd1g3BKyecrK1ZrjoSlz3tvRer8glFeHOKaaFdbdci/QUPOSJnvN3a5
 rwdhDQc6cc73qupYbGlj0MvulmqlXFW2WqEU1TqXD+E0DIPyIZqHNRHExxkg0atclInQgZAm5/1
 AG+bAw7k010GNaVRp5pu8zaNBfFLkxLBPQJdphCFosQdaifnrysXi7eUw1/4VGEIYQwdqE1wsvF
 mvP74TqlRJoArO7VwoDNgezVD9IspAdaUaYECjHWmnrutIyjaiknEWwt6dh0EZgBwN1z96xBy9l
 rxY4P2i5RYgnXIYg3fcvhaITF4Fz7J/HziYtf5KHG++44W8GzztASVTV62fAONQEvLKNY/hy7wB
 AYY9sceBMOwDCzY4h8+nqLBwE7lSxKg0N+lM6dw5xjMFNldDNraPecKhilYYiCmLkV/ujPIXhD6
 0CRwVB2uXT7AW6sftXQ==
X-Proofpoint-GUID: JAYxurZJnF3-38Kb7DviVoqa96_L5KhW
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d16912 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=XHkm8BA-63ghdt9qD3EA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JAYxurZJnF3-38Kb7DviVoqa96_L5KhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040187

On Sat, Apr 04, 2026 at 11:51:00AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of USB node in Qualcomm Glymur SoC DTSI to fix
> W=1 DTC warning:
> 
>   glymur.dtsi:4027.23-4093.5: Warning (simple_bus_reg): /soc@0/usb@a2f8800: simple-bus unit address format error, expected "a200000"
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

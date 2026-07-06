Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09C3D8115
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366073; cv=none; b=Vm+uOFRCbDCvzerUzO5tjA84V6ZnKGSjTYimFQ+VCBIjB6pin9bDy7iSfNtoVpqaXnC2dyd3U5T7QfHaNS/oglaCAqtD/oaSbP+fY+CCch84UO6/Tvw5ys9ylkOj5kiAeOZkegSKtg7u4JBMKNgvFaj4KrxEfZCbYcZZTqAhSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366073; c=relaxed/simple;
	bh=KwFroddWHFnfpsjjmJcfTGs4Cx+LN3mYnxqBFPiVtrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkYyW2lRmuZBk+hibAj0Q5yB0l1UUHI86jlbfdZT3wi2tIzPYX8lAwglL6EAihBqqvx9fDdBxeP5K5cBVtxxHFHz9y8lHUkq4pFcauQiVEycN3siV0e09Z0bCGCY+H050LwLZXJ8YniQkLCwGFpso22Uwger1q/UN+8otgW4PrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDm8+83/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/YDRlHs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDm8+83/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/YDRlHs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1kq825622
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 19:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RrsznZZTAsFf9rgod+XonTC0
	tHI1lPnoz4qCTniAIfI=; b=CDm8+83/EBqBtCafuPl/E6BEeEPNBQLMnsA/r6xI
	78dVO3E7UqXuvyxlS9d9nP3NTmwb7XUxU5+f4CAWqan5wMp53XwU3501AyuwhKyq
	S9H3Jg+t8jRRK4J4FRwVypsBUbBMuNxKezwLzPuNt0nqZxt7A+SEe4sw9ca6mj7z
	wIxVAagYUUJqsnIryN0jd/gH0dG5ZgdcKTVI+3jUJrYT02tzobEMwr3wjo/kBgAV
	ACCH1jIfiTLjLMvi/U2a0te2Vd7qlABTlTbZPiITWYDQdYcbnsVL74r8rjWJEleA
	nqTrrmPh+vRwYNl56N1qD6f7cDjSZZGGFQ4d7+5ZMJk5Lw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8aw7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 19:27:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd6f09f03aso4519386e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366070; x=1783970870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrsznZZTAsFf9rgod+XonTC0tHI1lPnoz4qCTniAIfI=;
        b=W/YDRlHsD9v7uPY4oCMs9qpaPUQeVyUY1AsGR5XDRUjNfABcbYknH7/5Gbsw0/fBvY
         u9WH1WVqa0koh+wlEFR4d4Isfx8twBTLgXYvUJ+r01X4ygUXaR76dqYeruxL/vPALmpj
         77JUFQjNZvRBA84KTyrRkHJ/zgqWp37yC2k4JiDSSobdTPxjuV104F1zcCKn+aZXgWV0
         +Pqy4qOIpeiqq9j0XA91hCg57lzrZhMhI1wXxOhjxOwk/bt0afastcab6su6VHHYj777
         zrcM+UzmHoz7O9fXhlWcvNmLsnEpyjYka6KX/Fq47sRgCsN4kYyyRAhHni9rudJlc46v
         Blbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366070; x=1783970870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrsznZZTAsFf9rgod+XonTC0tHI1lPnoz4qCTniAIfI=;
        b=TVje/UOX8yLKdQFFOKT8AZm+Cy5ZZpnlVID7paJIhlDsayQcQ5FD+vNfJiCiZHixkq
         Ue8Y2xTrNMWJPk+lArNpySMqa0Opc+6vkQVvNjcnMy6hXIOGf9AroFaqYUE0SZo/Kfir
         DOWTLLFTtSUK7tawhW5j/1RILMVhXc8Hw56+6WecCnJbFhG289A46h0aj3tw38yQnfK+
         snKgzZbQLtH/z3f9M/QbF1mo8j4d+mRsGb589IPUzwSNcHEimZxW1jTk7Ht2Zq5TYRfE
         +Vxb4ThiduHMXh+8Hc2yzNKyrdEcYbtamzV0iNoy/2YAEXlE85dxq0a5MQtu/XV3PBB/
         Mw4g==
X-Forwarded-Encrypted: i=1; AHgh+RpGCXxNXSB73QUd2Z4p8v537LZty++wFNpoO/yj9WumnO5zj99QaD2rkZf2J/vkkwITM6vYkmQoQMbE@vger.kernel.org
X-Gm-Message-State: AOJu0YwrV7QgUxCsYt/Pk8lfh3IthJ8fCnjpr8Tyn8m0FaNU/Ti11pZ+
	SF8PqZ/b+ypSezIhbMHPdO0/i8DUMwB4RlxE42/+maO4T7E09WK8u4SAYTXL5EKsVAJ8M8c4k9P
	rhTB2M+MGHIZNcHWVSp+Z5Bqv4IGIDb2KJc5vIVpk5bxjG4KlNCUYN/0FqiZxXSw9
X-Gm-Gg: AfdE7cnkyxjxiXsbjx27pg5XtuBGEChK3KIGBZaw6Ofmi97uf0MHhUhaJ9banjaHNZD
	yyqcXI6o5vCkZVfe90vtyaRM7P2jaPjM7Jd9ftj8+4LLdGguTXTTcqvSPnuvs+f1TRlKFFVQL/C
	HoezyZnncqq1RuylahUMQqQAD6+GWvnEyNwBS7giGgRuI5noQSv1kX93wh2w/Rtlrmy/Ix79uAp
	jBbj81L2C1gpgyXscdxymzJ2QVGo3PqgQ95VJK1lyMI+reTlbCJctgQdN7ZKI0w+A9OoUCK39Hj
	6oQJQ3PgFWr8el1zPKf5ZGWnCWBTmJQONK6oDp2m6iryJ8ywD4cV80MayX96WaXbPc/dhN3r2Nt
	3PEEeeexbXC1CaFx0ONHfnO0k0lzS9AWEuSJfIiH154Gcfo1wFEKJH8eMMiNkGM5KHzCqo70dSw
	dwb3LeT+Ud+9+Vk+8BCCgF5G9B
X-Received: by 2002:a05:6122:1d04:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5be9078494cmr1239874e0c.8.1783366070397;
        Mon, 06 Jul 2026 12:27:50 -0700 (PDT)
X-Received: by 2002:a05:6122:1d04:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5be9078494cmr1239866e0c.8.1783366069969;
        Mon, 06 Jul 2026 12:27:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfdfdsm3144066e87.59.2026.07.06.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:27:47 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:27:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Message-ID: <x6gbkwgyr4z7ueuu5twvnz66ie2nusql7fmp22moet7l3ltlit@6lpm2vbnrqhd>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX1Exy4IewqI9d
 47ZNntgSjbAyGKkMLNpp9RZ6vwcxKWTXCQMCaTP8rIo/HU9hijmaf1fAyKle9VKwIUcjRKONIG5
 IzmNc6s8DoC2TtJaT6p0C50yZB+Xu0E=
X-Proofpoint-GUID: QHiITzzlOmJ8j6Xq-1iWa97cAZh0tYxq
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4c01b7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=AzhOnzq_2AA1uY-T__EA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QHiITzzlOmJ8j6Xq-1iWa97cAZh0tYxq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX/TwK7BRQGrb9
 4eu+IxtPwzR0ta+PHnFu+MxUx3+MZYopkJeBBRbDysEdAMsdvwcU/Vwsnv/DFCfPN33NycfbWQe
 33uzdrS8XYBSH+ZxzD8LiGPFo2M0WzNiB2B/CeTzbanB3qo3Y7scdW7OuJXX/YY85mYIh9RLxOx
 kQOc4sZRkUaREZUFHQysWkC6W5+KDF9wAT6hFv+vApsGyxm4R9b1fw47TZms1C0qW2KCYxtlbSi
 S1IKyoniRfG80mRV3W1f+pQ6Fp+ZzpZFoCVBApLsWacDh7CUKWv1rjah2xT9XSOIdrPMt7sH0bY
 pJ3n/qn3GJlpjTpIAD7xbbrI4juj17L7ZIscNBuHazjbmCyHTQpTM+i5Lds1xIIbNESHzNESA2n
 HN4Pv5b9lJa5LxyK3KKi+3T3XNkx+zdQJk8wTivnjt9gk0V0q2DvaCbmdXUQDuvO6H201eMcTrH
 Rl/0lY42Up+LL31XEOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060197

On Mon, Jul 06, 2026 at 08:46:48PM +0200, Daniel Lezcano wrote:
> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
> 
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.
> 
> The keyboard thermal zone defines passive and hot trip points, while
> the charging thermal zone also associates a cooling map with the CPU
> clusters, allowing the generic thermal framework to apply CPU
> throttling when the charging circuitry temperature exceeds the passive
> threshold.
> 
> This integrates the EC temperature sensors with the Linux thermal
> framework and enables platform thermal management using standard
> thermal zone definitions.
> 
> The EC protocol currently does not provide a mechanism to program trip
> points from Linux. Consequently, the thermal zones rely on periodic
> polling to detect threshold crossings.
> 
> Using the charging circuitry temperature for thermal mitigation provides
> a conservative approximation of the platform thermal state and prevents
> the platform from reaching critical temperatures under sustained heavy
> CPU load.
> 
> Without this change the platform reaches a critical thermal condition
> and resets under heavy load.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry

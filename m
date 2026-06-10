Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC20407CFF
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096026; cv=none; b=oZ2XnWeXh2oj3g5Ueiteaz/gtYNUlXw8OK6xFh0mDKMOFKyiPdUQObSQ6Mwty8B3ChvhzePIAGYN17N9JvrKX4qGfKsP6alawp8o/wjVhAauYT9nUddxtZxYE+iuEFGV2ShpJOBobwLGtlt0Ka8pUQZQAkshMPHV/k4HkaRCc5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096026; c=relaxed/simple;
	bh=EeApxjdziYk+v1CqK9EjHXZ5g3LW6KqHkJgmLUNfrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzbAxUzJ1DyFN/w0iQvU9YxRwl2gaHxVQrCQSoog0k0hGweg3ib5nSIcobQTMYERHaPDETUcxHBe/5YT3cyO50DHC4Ppms3DxLRMwUQmb0uliNv3Qgbh3ulP1H3D+RSN903QVZpV9cVF9ZEIt68RZbJ0an4V9rDTTBU/aBqKQwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmKBvOT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVl4nQX8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmKBvOT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVl4nQX8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBsS53763976
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFcFkn5T+1Ccf0UcQnldD5+L
	2Dp6NWivFCPOAqO4D1c=; b=cmKBvOT3LrOh/GjnDhP4CI6pcl2PZbDuOMyk0tmS
	KPF9fqC0EF1b5y0oMOO+TZ5DcLk1WUnzFTWQwPRznAfeA4e/X4bWwjxmGRBgW2hW
	zLnVxJoUDhxL8UrhEP8VM8RPEGwMH4nROEscYxNJrUiBzLlfGR3lgyPRbEzKba+O
	DYHcWh/3P61e9Id3S28GaJewglDAeDLRvu30f+BYPaFDhLtJoYE2PLcXUW//Bj6u
	JBu8RMM5ONjdcJKBzPvc64QHD78786StE1cidR9kH6Nh865/mFxfCV0rLaoTqyeg
	diwwIQ5XfIQi6tfn2OlI/0oe6jvT5SuNSQRI845pNZaDJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetgp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:53:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517d766e05aso38108841cf.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096023; x=1781700823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFcFkn5T+1Ccf0UcQnldD5+L2Dp6NWivFCPOAqO4D1c=;
        b=gVl4nQX8VNzvz0tBMximjzSV8ykxub1WNr910/rFZP4cHni+JgfW5mJzheDzuVtjiQ
         X+ikm/cTdxUw9xZGBaF0HDM8PMJwDRaMDEGCpyz7ijCjRTtwP6tE8DbILdEgXBqmgKiQ
         Qku7dKC5Y0RJRP9p3tgjY0fiI45tdcwfJyTGoF3NJNZbpdn3s+IIrNNaMRA7c7TndTMX
         +2kVLdJ+Mj+LY0XOh470rU80O8tguqT0OPOTCSYWHMcvz6mzN8yZgX0i/xfZUbWWVa9p
         vjmPKpY8gv/ascAwpyh7oGUl9DimriZS+d6LhbqgaChxMT7mLd9mbTZ57GQj2c+M+27b
         qrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096023; x=1781700823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFcFkn5T+1Ccf0UcQnldD5+L2Dp6NWivFCPOAqO4D1c=;
        b=C9yWJu4upWGph0t+0LciqIpLQmau8knmpttAIe88Znbhrg/j1w0nUbFb8W9pmcToXb
         m8VaFfYaAFZv62ZWJRGmbwHeiqe48JkhzxsGnXcEUTzE1td6ibHa8/1spzKWZj0KzK9P
         N+lGywpqYz5vnsE+eygW2PcULyvmWD3f48TH6HtSGIS3p+8vIp0lQTtQSuzcsB/eJFEA
         oVOGCvWuvqb0oXmhp/av3edlEnVJvTRfAMbCFMrQUw59SSoa3E9AOzvyl+B2gNYPSyJs
         QWuhwQ+lPUq4iLmafqZJvsGY11I3c/LunXueEGbGA9Z+hkWRE2jpQMlxWOfBtjg0wmgs
         oanw==
X-Forwarded-Encrypted: i=1; AFNElJ/YIGdIBsLATUXosgrNh2oo/920YLmytsmpi7z7OfL36Fw46T1J+04rY9RG9ITi9kxk2MSzmqmxBjfR@vger.kernel.org
X-Gm-Message-State: AOJu0YxoK/nNoI29dZKP9OHSt/ZIfXdRQ0uhI5Ud0Aa/YVOwVIfb8yFF
	L4lA7dg79dniqUC/QifVG0XRHlZid3dnQV5b4sWb5LUfJzF8tDl50YAJhjLn57DXnYZAsuJ7acn
	vjews7ef09nuGjWWyFhMxC7BErtkYfP5JWLbqFr+nUxKfuwDpnusyhhJxErnUOpDG
X-Gm-Gg: Acq92OG24vJQVrDR4N2Oq/lM96Ky6KlGxP4tQt5qQ3Ry3ncPgV6wPnchq2lej/XgfLl
	HjUiIu5JDoq3yDKYkJynePdzugW75GX36lCziaFv2Lq1P0PIh2YsNKPjYm1Q/wBoz2IiopRr/MM
	4glWlFlWVeq5AObcjPp1y1nBlV3Aa+lfUPB24FhfavW3WqB3La1Ts7Id+U78SSje3PfxXLQ05Lp
	ANUPaiMSXMOV54mEj7dhpav86AqdqzOH/5TebXR5mnTFYL6rWy46ZGrLt0hhc6JH0eJkCdM+yI2
	eyEqOhGoBqUkQk0qibKSf9qAcjnn04urUE0rq17UwakB8ToXmKHDM7qGOzdwMCdaNueLQ4FuNWt
	T+6xffgMNqr4m9wsGajkthQIJYkvRM0qeRqew/A3Wt4O9dN6gOHFJ3wFjz4MMwl7geqg5I4Cm0c
	H/oSY/Q42g+I+1JXRXgunN0mZ3Itg8mCHuy31Uj+dwCbr9pg==
X-Received: by 2002:a05:622a:c86:b0:516:d803:af03 with SMTP id d75a77b69052e-5179888396amr279529131cf.40.1781096022908;
        Wed, 10 Jun 2026 05:53:42 -0700 (PDT)
X-Received: by 2002:a05:622a:c86:b0:516:d803:af03 with SMTP id d75a77b69052e-5179888396amr279528671cf.40.1781096022323;
        Wed, 10 Jun 2026 05:53:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a714sm5438040e87.43.2026.06.10.05.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:53:41 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:53:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm6125: Fix QUSB2 compatible
Message-ID: <h77lj4jdhvqi3pqsnl2lhhjo2g2ffmlam6vlcn75t4dogboju6@2lhpsexbd2tn>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-4-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-4-d7135980e78f@oss.qualcomm.com>
X-Proofpoint-GUID: sLFhOyMbKXJTbw9c3QtN43vs2-QOKpMM
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a295e57 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LZHrLB2tbJw_R4RbR5EA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: sLFhOyMbKXJTbw9c3QtN43vs2-QOKpMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX5QZzzgVZZZBo
 apgLEjJhLkw3uFjKk/b6aS8utQhQ2dJHlurrUnzq+uTL5nLjt1+WhSx84Pm4aT+oUM4OX/rRsBp
 WjKLvpdN3G66auqyJxT9RieyxRU8rtndiHHZBhRqoMEjt2S9uIOgkRKm2cnumiy3kbTf1X+itwv
 EsG3r0gAOK5uEKikhUPR/Ydz+rTZZqsR7Jgg/Q4Agn6q3E6f/Wg1bDOe2H/Ub5TsL0OSXLV/XQb
 ubcVNpQg3jqEZhZtBzTMOhGwXg9facwBCk2tOS/cYHzYkwwyL5pGGxItRzfjuSVtrBoSdYpMQz7
 +hGUL7l/v84IclstxOi8B8MHr3iDLDLQePDslrSrwQMvgfZvCFomTjFGdBje8V0PSMBuxGjvjL/
 hpgKFAsVm0MNGh83wsNQNTOVDILnK8HV++7aT9lDebD9LV8QasZICSE2Y3P4nhx73ws8cll1luC
 Y7kvT+U9bqLBPmXfb0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100123

On Wed, Jun 10, 2026 at 02:04:17PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are a couple issues with the current description:
> 
> 1) The msm8996 compatible is wholly reused, without a SM6125-specific
>    primary compatible
> 2) MSM8996 has a different power setup (VDD powered through a RPMPD
>    power-domain vs a regulator)
> 3) MSM8996 uses a different init sequence
> 
> As part of fixing all of them, use a SM6125-specific compatible with a
> SM6115 fallback.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

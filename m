Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A256634888F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872454; cv=none; b=ThsWw6MI8GLd0rl75UjjyTTQ7MzW3u61amXIpF1QFjK4335ZoOoUftUGDT/kLLipBQ0tG/oerCveL8RbtWdrFv9V/xnP4RgMUch6ajpO9xswArxMoHd09+W12RsoMn6xzBbu5XWUHGdzTzZALzu8omEgygQ7+9egdxeOBGQROeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872454; c=relaxed/simple;
	bh=gISfBUTrd3rk9lDywwx210g2IehhkT01roF0u5uVCbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDqr5vtNuXOmSuB1rSkj0geNt/Yb27hYS6H8bkcgciSZtRdGH5VXJXwWZGQEVZ/P5EXG4H6yMqxdmXFvtQbJKYv7SvOAsKvhTQCDdMld0RKBretbXufNphNiRPLy+Q0YlizKp15xMey8fSc+T7YAIOGyE6o3YNGMWh3lBHuvLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=om4gPZcj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjJjquhK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="om4gPZcj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjJjquhK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFUBln664394
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsOwuU5VF89mii546Kyz+61LRVFRAUl5bGi3Mv6LCuk=; b=om4gPZcjbZeOOwSS
	V1DYCEZQGYf9c5yZQ8ro4btSBeNiwFOrpmIDspDkTL+CGtgPa60g05cb/5HrkYHF
	lJK3WAKUWJ4xqe8oUDsoVzpJNB32Bl562NrNZGgfczpO/jtdaJKsH73tGHGeQIYD
	dO+gCvMoFPqhOYUIrNYfigY/giCnOZouzgNRNFinjh9HDNGfyPkchP2zsDN4GFj7
	DpmkHicgco5Rei9Cm8QY4R4kbP/cFLZa9MqEQYzhmhbFOSkM5GDI8yT2dTgFB4Y1
	I94JQpY5+NJ5QoElp3RfAufWK1XRVrzxS6YdlbIyp8JmeCnxEFqu1kT64GxY0Xdl
	PILBCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgse56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:40:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso48935371cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776872449; x=1777477249; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsOwuU5VF89mii546Kyz+61LRVFRAUl5bGi3Mv6LCuk=;
        b=TjJjquhKAfiTpCmIzSjqfB++g2oTr1TWPpGHO5Sj3yjX6emGBl6Kri1d9gIN/sIXb/
         QEwY4BoXLxxs4BBaZVElR5kFRv9MeFASmVbSwEjFZmjjfVVoGE2CMNegue0mw2QyZeT/
         cNly4sfalEBpv8LIcaF9xHqreZ3cQldDgRApBUkI7g/6HBt4XHeRoW+bRNZmtvEpVuWd
         QaJo1Att+w1zvfXI8QlU24kbejEC9mHp0p3xPolk4mcd+97YbyQmgy0rv9CJCVco2oL5
         FZWQM9LkUaDSwjH2BysWPYHxw3g+VIpUCinmq0lmVPaPIJwWmChohWy3YFZ0/ZphXUsN
         zgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872449; x=1777477249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsOwuU5VF89mii546Kyz+61LRVFRAUl5bGi3Mv6LCuk=;
        b=czc9IW/x0NSxr+WIIwT9IvYvy1C5xyGa29PVQbMkEEfumajMYfTYj77SpokiyFXSMZ
         L5Lr1Rmcnmuh0MZkeZIt2q4WGdJU95aW5/D5TAz9dCdA0kpnETYrZULRGedKzt0EtYBL
         WfgyFvpvsU8K0T4PTP99fJcW2aYxwaVXl2lp9kCrizSlSAaOQoG+eLOPF0R9SGQd7Bgb
         G84DJNsofvVq2D8GQ9XXQ+kE/7CRS41uHIIGa4SAj6uX/z5tYfHBAaDzlli91xcWBtv5
         kPfJKtIr5ZK4m9ajBkYrY3I3O9AUgKgU90ySnriPrA1/1IjlzTEOeaM7Ieu6nXYhs/I4
         vNdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f4ioHHSCmhwzsA9BYY3AbODIqRDvJf0OKRcAFlY5RirWhI6yn0TRB+WicrwwUwo2quZEGrlwIenJ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3noNReMg9ejvNqaW7jdxgI9HvC5Gp2oHC/cH1BjWZl3UcSSCP
	Tudn1bR6nj2o1zTwO7b+sRg/r8qhqQYgc5lQ3VIvMDTL1txSghrIecBnAaXR0FkHcU8VtENh/Jc
	qjgQA/GgNJnk3mBKmI1DHlCezT3Y5nzNM5v1w+2EBngk/aEMpZoYY8XuFlABwlsLG
X-Gm-Gg: AeBDieuF9OIVqVDJPVxwaQWmGNHsdLP9+ZK64JTLc2M5i3qQHLnOtglZRvWcDm4ozNA
	jKfxv61+jn/yf96l/mkFZ8rmy761Sg+bgy+mPsH5GXHm5J7l34cN7rjVoKf3GzKu9rx4zKn3xgW
	8Micc0rjX3b9hCJdx81cyDWMeqHatja8hB4WQRZAQshNY74vQB5TLJQ2ouOuoZxnYMjh4A5GAk/
	Vk+t+cwlFL6T9ArLzwJUOdKw+x/74JYAWz74b/tAwGDkGDs6Tc2r5sYlqt/MzFwyzhp6Pp2qaWq
	Jcy8dTSF6sLZ2EBRFAgtzaNy55s12r+Jmdt85k0eCyhxA6GmW4O6QXUGy0GFTz9Jkq3xCOVxT2z
	VMkYv/BdKs5DARDftTQ1p/kEuGeV73svV7Ta48RMvHM5P2C1+6+MgD6e12JefAbFbHrBtOTe7QW
	DaH2mb0tELoi8Qt9JrxnRQE3t9w5j/odHPRirckP7D3Y9Pow==
X-Received: by 2002:a05:622a:6782:b0:50e:5eac:cf7d with SMTP id d75a77b69052e-50e5eace505mr3978291cf.25.1776872448854;
        Wed, 22 Apr 2026 08:40:48 -0700 (PDT)
X-Received: by 2002:a05:622a:6782:b0:50e:5eac:cf7d with SMTP id d75a77b69052e-50e5eace505mr3976581cf.25.1776872446447;
        Wed, 22 Apr 2026 08:40:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad11fsm4473453e87.14.2026.04.22.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:40:45 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:40:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
Message-ID: <losxljshogx6zhqdbyhgqq7oagonbvnqf5shrkv7hvy67o4724@oq5n7fg5bbxq>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
 <CAO9ioeXT0jxu875jBsAbOVrDqonASWSmmxJbP0AiitXb-gUANQ@mail.gmail.com>
 <a967d7ec-66f7-4eaa-91e3-0a96e5a8ec7f@oss.qualcomm.com>
 <b21b1f73-881a-40bd-aef6-5c34aed0e266@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b21b1f73-881a-40bd-aef6-5c34aed0e266@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: D_VzxGGEk6e0uWiMmcBDuuOh7XVhTmiy
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8ec02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_2zAH8VQ4YyU6FB8qREA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: D_VzxGGEk6e0uWiMmcBDuuOh7XVhTmiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MiBTYWx0ZWRfX7w9eSqDcREhN
 uBYz+DADubzlT8d2lL2buk3NvWXdyQJjCW1y8qLb9Rkf7+oPVtKEkcuTTyUe2KXJp65giMZKHLM
 2m63UQLW2f4BdyF08dC0iWa5NqGxuJfp9mgdSF/KMmRQWH1zgdSHgrqGkDmCnzy+THiOJDwxMtQ
 K15FbkxjorAiqiLBOy1xZ9V2Ry2pbJ+T3YIz3r1sA8c7M62Sc8GXXn8R0O0kBgqt9oT9rIF+itY
 4niBTRQ7IxhKZTrLEeIibY8BshHikkjQzHtVJJrUbW+cZ51BZkmYkrDEiWPFgQuDwTHJqn29KNr
 SSZsUInl/qKvFzj0dhncmaOzG6NS8sHNMUkuSpX0vDpPYhNTOsha880rdnDEbcUs3Fx1UtCXeOY
 BNpvAJyHL2HKEdQNBWVyO+MnyraQAvLw0DeeLegMkrAI8lMH1zVQkEUq7YhdunfPqhCYlD5ih1y
 4AYaESKUT6qtQc8iH5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220152

On Wed, Apr 22, 2026 at 11:54:30AM +0200, Konrad Dybcio wrote:
> On 4/20/26 4:18 PM, Mahadevan P wrote:
> > 
> > 
> > On 4/19/2026 6:48 PM, Dmitry Baryshkov wrote:
> >> On Sun, 19 Apr 2026 at 13:16, Mahadevan P <mahadevan.p@oss.qualcomm.com> wrote:
> >>>
> >>> The existing DP PHY PLL and AUX configuration for the Glymur platform
> >>> does not fully follow the Hardware Programming Guide requirements for
> >>> DP over Type-C, which results in DP link bring-up failures.
> >>>
> >>> Update the DP PHY programming sequence and PLL-related register
> >>> settings to align with the latest HPG recommendations. With this
> >>> change, DP link training completes successfully on Glymur-based
> >>> platforms.
> >>>
> >>> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> >>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> >>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >>> +       writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> >>> +
> >>> +       writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> >>
> >> Are you saying that we don't need to write 0x4c here in case of the
> >> reverse mode? Was that changed and why?
> > Yes for glymur it is changed
> > DP2_PHY_DP_PHY_PD_CTL
> > Normal Orientation: 0x7D for 4lane; 0x75 for 1Lane or 2Lanne
> > Flip Orientation: 0x7D for 4Lane; 0x6D for 1Lane or 2Lane
> 
> 
> Dmitry asked about the other register - DP_PHY_MODE.
> 
> I checked the reg description, and at least for Glymur, BIT(5)
> (the difference between 0x4c and 0x5c) says "take bit 4 into
> consideration, otherwise let the HW decide". I wonder if we need
> to set it at all, for any target.

I think it depends on the orientation GPIO being correctly wired from
PMIC to the device. I don't remember why, but it's easier to use the
software switch instead.

> 
> Konrad

-- 
With best wishes
Dmitry

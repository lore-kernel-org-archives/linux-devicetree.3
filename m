Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8C22E7BD6
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781685; cv=none; b=OyIkhnOvztTgC+i3C6jSKtihBwhzb0i/A5bysKMML5R1k18n2rjydBKhkUMtl2JXYJNIirijSzomVzxc8QfgsEt4blOJtvCzf2T34tcg08ysYa9lUS6YG61lVNdDsqv9CflLeXxdZsD4MB/Dx0wdmhPczZcyh4gGSK0rwmggr6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781685; c=relaxed/simple;
	bh=CowOeEomkcF6Ph/cwykM1M22aW/lBwWVtBHLRKFkSVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtgdOIeAszYsackingc1gu2bn+zJGEoK0CpexjecLLnyLArB/Md/o9Nbd8PVemqlYS6ribrEayHo7BdgdSv6thpYcOHozJux5OvHi2y3loxVuYzPeRmcQNxxTdVf/YlYohDg80ZbNAdTN0FaFr9kcQ07ycherqz/unBBARXPn68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZtU5N9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMchCMq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZtU5N9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMchCMq7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi7MQ812865
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UePRAAybQXDx4YMT9nuMB125
	aVT64hKSuR/Bw8La4Ao=; b=PZtU5N9mYqhmE8EGVCnt5ywvJJ58pDDRHqCdgTjT
	YW9ZKig2z1PN+wKmhMy3k8ylkZrHLToCWOxyWSbZLH1r2+DTzgV4IhF76SRkL0+x
	pj9aDJqi96NaN/pTy8K5Zy7br83XQHN17V2owMJJ68nGCyGNDFF2F5fIZvpGbKT9
	6O+ow57wiJOjXVv51ONw+0O7YNZX6bSlR1dodWCLrOOqgk4prmBGs+AyxSLO8KOk
	2fbwmYOLvLiKcrQqRAC4tiPusXhKFxDCAvf+FZPKyk7u6312QUviTGiK7bcyfAkK
	xZ2gTwLU7BvAeFqCrrt2hZ52wlTtMJ/xVnLQyBj7WBkjVA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7akvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:54:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso105102631cf.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781680; x=1775386480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UePRAAybQXDx4YMT9nuMB125aVT64hKSuR/Bw8La4Ao=;
        b=dMchCMq70NBlUCk97GrhDxMbgs3EFRtRkr+NcnEicbS9xkYqJmJU7jh5m90Q8V7gA/
         dJMtiwIZVjL5ioSI+i4wZOcfefs8X00U0DxcYyus+frvkA3DJ/0Hu4AHNiJGb9bPge+X
         TDiFbh6i5S61P/qibVbcLaLpSZ/tFYoPZCvvEVhvC3KIDJ2XVuBMceaCQpJ+YQhF0glm
         zEk1dc8aUfq/ffvVEeYg/jc+cWCwNs5w+oXbWB3IyYmp54LxZc0fOxDm6HJB3BQawrJb
         0fBqIZvLnnCvElgrnP1fzCRlmDQEnGN2tETxo8V+SAA818e5571ThYEgP90HUYeJ9cHh
         o/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781680; x=1775386480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UePRAAybQXDx4YMT9nuMB125aVT64hKSuR/Bw8La4Ao=;
        b=qD9DS18A5Czjd12wZmvJufHDYlkYe3QlyCecVcXWhz0+vv3TEHnPqOcTewMckBRxDD
         acisoU+czwHwWTMyx4ASVOiW08/d3LGAaJmaEVeuKMo3Ptdsm5LR189YshXWGGwlXBFj
         urpQfgnKp1Y+vzgcCJa26OIBmmfaDZwbhXESVr3gHRSDRrYntExVKDPghB+t5kX7B6WU
         5L4WReDZ22hv9A1md6R/iMsKyTBARPiIO2A5yzdwvrqcMy5xsCl+12GQwXHiraTIWAP5
         n3Yyofk9io/slSkGFvl8eiZH/xL8lAP68+ZEbS5eF1DAdIErSImc63HDIBwRYsLHesyK
         mk1g==
X-Forwarded-Encrypted: i=1; AJvYcCVRkFAok7PifB3LNG+aV3k9FIZKHmMyZf0Q9xDLAUnWhLDRpv8akbYYxtGqZ58z0WA22nhoZVu4aZNb@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSyRTiuCDkDsPsWXyK3gXsepY9z5fhmPi/bbzI0cstXiZQHGN
	jXL3nx+AOVOa4N5QIS4zohfUMTq3sqXLuqkULw76qearX37F3fgh/Zy5ME1ZnHfSYCIW8jECrRT
	zYM9t3llYyuFOOoi+GMZTK0dVxv24ZfvSMBJlMqnV0gG5wmlbD2m0b1YGUl81ohkV
X-Gm-Gg: ATEYQzypG9n1bMWMakxDb81jXJdlf/H+ajAmpcfI3MgMawUDniQi1pkfqHWDAtmoJXP
	OhqCQV4O9WcuIvd0KojP2YdzawgQCcKGvARt9BrLEP8ibO5cRF0lJRwToQRcAl2aF0PBiY++k9q
	+K95h+aRizT82zi+mj2L6UpeumFLDJMbr7eWtUozgt04ErjpkpSMjxAshB9lreXjCMk9jm+Kzic
	5GtaV1dQ5S0NLEVOpPmxs24fliENoWNlAOdWptuu4PxA22xsDmV3Q0uk20OP7RBO1I7MlBRAd9I
	Ka0q+2aECNpFmeVJodmSnb58/bxHulwE+LPxhwLqEjEL+UvyG6b4xyk/3rhEfZjdLdvyLQ18OT6
	6MzcdFWj1d7KhRZ9I/qClwwuYWoqya9Qorj6F4e1hfjO6w2nkxJcWzJI+DnQvbs6zsTwQ4dlLuj
	wYe/KOCE788DUkEfJuqRCaczPk0rOTmO/k5/w=
X-Received: by 2002:a05:622a:64b:b0:50b:49c0:b6f0 with SMTP id d75a77b69052e-50ba39aaf73mr119224171cf.61.1774781680459;
        Sun, 29 Mar 2026 03:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:50b:49c0:b6f0 with SMTP id d75a77b69052e-50ba39aaf73mr119224021cf.61.1774781680010;
        Sun, 29 Mar 2026 03:54:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144f5dbsm981035e87.59.2026.03.29.03.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:54:37 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:54:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <r767islbwq2a3m6rf4wvl4hxzafdsw74jhev7jjz665kfymn56@vcn4p233n74f>
References: <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <vcj9b-49PycEnk8KeGcgXAaN09KfYZnW7g0LayiEPie9p-4krmMDfNO6Nx4DLgwoKHdKJughl7zoxvmKVkqOag==@protonmail.internalid>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
 <0322e0b3-bce8-4415-90b2-d14445986e23@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0322e0b3-bce8-4415-90b2-d14445986e23@kernel.org>
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c904f1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Qxd1fPiA_TqsfyApjdEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: XsLaEvl5Q9ct3dVuO6SIpIoT7z_ySitu
X-Proofpoint-ORIG-GUID: XsLaEvl5Q9ct3dVuO6SIpIoT7z_ySitu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfXwU2JPUb+jpY7
 DmijXI7IpAgAfzdEO8l0/GIP/5k1FY5Egu8bNxZyGgsSXwheej3cpTIX0V5scUpH2rrjTKh2hFa
 fXvXJqYRoPdhCXGOVPg3mcryrMNst4yXUowzL6cflFgcPhY9nU7D03yI7QX/UEKIBMe4h/OPz9P
 KNjeu6+76oSSXgpo1E8I6B9v1V23DnlxY8U839TbN8ExypOSTCvjpUg6Cs7c3gz1Vm5JxI5FpqY
 iwumm/fBv+VnnYDRnfSu5bkERgl7Lknqzx+c5NfCGAKV3JUOW6OgeP9MazJrvopxMMUFF2T7K7T
 Lw7SkmtVXA3WR5xWvRlyIO6kG8gx1lY/uCA2ewJ4a1Xt3DNZXLPsT7mX5ofXpjEs3IG1A7J6dht
 Yhj0BbCD3mKcJKjOsS/RGSa1+Euq/WRFerCNF+Pm1+i7+U+SRT4ekIHpw6QGweVOd+vaT3z588m
 RnQwHS9eS7I/9NCPSGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290082

On Fri, Mar 27, 2026 at 11:40:51PM +0000, Bryan O'Donoghue wrote:
> On 27/03/2026 23:23, Dmitry Baryshkov wrote:
> > On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
> > > On 3/28/26 00:29, Bryan O'Donoghue wrote:
> > > > On 27/03/2026 20:51, Dmitry Baryshkov wrote:
> > > > > > That's just not true. If you read the camx source code you can see
> > > > > > split/combo mode 2+1 1+1 data/clock mode requires special programming of the
> > > > > > PHY to support.
> > > > > This needs to be identified from the data-lanes / clock-lanes topology.
> > > > > And once you do that, there would be (probably) no difference in the
> > > > > hardware definition.
> > > > > 
> > > > > 
> > > > > In other words, I'd also ask to drop this mode from the DT. This
> > > > > infromation can and should be deduced from other, already-defined
> > > > > properties.
> > > > 
> > > > It still needs to be communicated to the PHY from the controller,
> > > > however that is not a problem I am trying to solve now.
> > > > 
> > > > If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
> > > > 
> > > > I'll aim for DPHY only and we can come back to this topic when someone
> > > > actually tries to enable it.
> > > > 
> > > 
> > > DPHY may be the only supported phy type in the driver, it does not matter
> > > at this point, however it's totally essential to cover the called by you
> > > 'split mode' right from the beginning in the renewed device tree binding
> > > descriptions of CAMSS IPs to progress further.
> > 
> > Okay. How would we describe that there are two sensors connected to the
> > single PHY anyway? How would it be described with the current bindings?
> > 
> > --
> > With best wishes
> > Dmitry
> 
> Assuming you add endpoints to the PHY i.e. that is what Neil appears to be
> asking for and I personally am _fine_ with that, then it should just be
> 
> port@0
> port@1
> 
> if port@1 exists, you know you are in split-phy mode.
> 
> Its actually straight forward enough, really. To be clear though I can write
> that yaml - the _most_ support I'm willing to put into the PHY code is to
> detect the port@1 and say "nope not supported yet", since like CPHY its not.

SGTM. But let's define the schema for those usecases.

> 
> ---
> bod

-- 
With best wishes
Dmitry

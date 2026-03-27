Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC99334688
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774653791; cv=none; b=W+GaxOfMSnY9jV7yJtgMIus9VvswGVC1QCCiKvLMUHWW5Q6EiMTXA1wIUBbxWAGRi9G7/LRD4/AGGEylvpx8yjzmveBQtpOHmMUGQYsANU+s0edA7hpV2GE/OhWykiViI/3dK8gNYBP7Qc/aw7GvNBXXqrXcmxwWI/sX3VZxGmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774653791; c=relaxed/simple;
	bh=KKoEVadXmfX+eJOn11MSj9QhT70dAnjq94IVOwZj52g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQH4fwEDDfshoiPgYeUpP9nGSky0lB59k9CEPbpHw1mTBmsHhGqWn3PF0w/CF8QgNjShtsPEEh9CUD2qQ1Guass/YVO54tbQJjZf6/rCKhT9Szx1FF3JzaMYTB7tuAGr4DSBV6MRV3kUvEZU6Eo0pj8hsawqJjSbMtq3avz1nXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fR5AAmKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmTbdwrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fR5AAmKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmTbdwrl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN4DNn1526151
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VdliwqcRhp5SljuMOcgQ5BLR
	pJRliwtVYafIt3tKDSc=; b=fR5AAmKkwLOClErr9exH1TTRqZ7F8HZ2FK5PpqF4
	bez41oQIRzjiTx4h0pyu+2eS3whyBoqGe0ZfTYFOFTQMaS8b+rXul6RhwHhqkZ5D
	9NVOX+IlW9lQfj+VTDX8CLVsi6EksEZYuhQrnSjkA6t7QJEV14r8dS3iTRvw7lTr
	XOEKkvK55MjlrTYg0TfOpLhJTSO0wX7RGB45/Qlitqr92PJJdukKS4x5lBvODN0H
	5B+UKxHhS7V0TU5tdDwVHWGwZ4rDQ9/4XyqeMMXTEst371q+MNmvOG1IVtgyU/96
	Bf/2NQM1VZETFMywdFNdfvPQLa03HXnzz7mfQXxH7L4pig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6saq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:23:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso27494951cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774653789; x=1775258589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdliwqcRhp5SljuMOcgQ5BLRpJRliwtVYafIt3tKDSc=;
        b=EmTbdwrl8dTimlpPQGtizrF8l4GLcEfb18LoWlN+ChVxdzEGVuhWzPt901BeVvTNNv
         TewiZo27buCO55pmla/ld96ITxVToAMPdCKf+/j8DuRbYmd/PS6GzWIJ4BXiUFCa3E2S
         pCuBOzMl/gs8UZBA8OJkrFnHuoWFwRuv5wOsiT1QAqe16TpeZqt1hMWmZuheuLZ6ooXW
         IqJXVxfuxazI0V+JcFAglOAtcogPq7MD6m4woqznUYrvS4XPB8kzCRvHbpfgZ7StPlRz
         u1mUJ11Y+wdqksZ406g2gr2mXxqkZ0XiZQxrjpTV4KPTwZneblHxuo+UDf8kv7mD+SnG
         yKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653789; x=1775258589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdliwqcRhp5SljuMOcgQ5BLRpJRliwtVYafIt3tKDSc=;
        b=d5dctEWLd20HTGdbpeWohb2GO60x61k0thzkEEUBCX78vLm4Ma582o3Vpr3e8kZIer
         e6GVoPOCnFErIBEVgnf5bvVc4OCDfH6Ea59bdrs2P4mAtBqatkXPKLtmpIpL9XnvmUif
         wSLbSn5XRy9e+/uKMxpUGwhDNsAi9eZqI/JWFkWwVgmfRyX5VX5Qi2NzQt7c1Oob3il6
         HMx9QP+k8DnIZ6OhaM9RX1dTepJJzoKodjisbJm15rXMT8GrVM+Ql72p2comO2h0faSO
         Ws3+/UfZ4ehWMUz7kUCTRhvVbCYQWWn4MzdgKv6Kd1SWD9C1C9Y32LseaeAtD+Z/j+lA
         k6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWnCji81YpLujWvu00y5TdfqdXR5GyN717T6bw7XDHqEJPfpUbNihqihyTizEWTZlcyFS/Q00FAdOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtUobPXl5RIdu65mtFJ9HG1q8XAjIAI92LjTVY7K1BXai79cZI
	0uzEtS7nTNA0DPUIRtjCUL2bxnNYC2Lqm7r2y+UjfQSm8m9E3Rf1aBQLTlgqw5T0lvSRk2schnq
	+t3He3kxSzfNtp0fUjJ7nrE7K4nAI9KM+/R5an7/P29+reuAovnJK4t7tTgCEeR0c
X-Gm-Gg: ATEYQzwQZ0Dvy5naQ8WtY5gF2enNDd9+oSfK920+RlfxMhPpQD5CbsTgcWfDUBVqRT1
	7JWzVoLuxL0lXQ5qRdn+P7TDHZ5iFiHgZU60Y04JVlIVGj+LOe5CzcmU3CRO/U4LYmNyvA9ycLr
	rmIdTQQ0YZLi45viSrhnODNUkr7q3qavGq2UeSocYKMoJ5cLKyh3XDKj/HDvVVCZh+g0CqaBe6j
	ZY1dminvpResXqfnuj1h57vtleYRKRyXBgUATXaeSWFWjARvBRQeO5A1TxPC4vIH32RPm4qEgIF
	RuNffNg3UE2vQzqfmqJteIlq+Bs9S610zXAPXp3KUOen9+dCbdczsr8vyrBM9jDuY8Ho7NJdVMT
	dytcg3Lpp0erPZ8jw6+sfOu8r8jbxrQkNrtAYEIPjhVereHD9tL8fqX3XV3u4vC9UexwAfy/EyE
	1zS+mT2kVFLcmp4dHRIYFPxffNSX+vE4ZDfR8=
X-Received: by 2002:ac8:5f12:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50ba38bbf67mr62332791cf.43.1774653788733;
        Fri, 27 Mar 2026 16:23:08 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50ba38bbf67mr62332421cf.43.1774653788222;
        Fri, 27 Mar 2026 16:23:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f429fsm83853e87.2.2026.03.27.16.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:23:07 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:23:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
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
Message-ID: <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
References: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c7115d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NHJkdllwlKbNI_IFlBcA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: aBnvGNICy7F9BPUGp3qJ1tXMXrbTjMcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NCBTYWx0ZWRfX4e4rPXStZhHH
 W8Q2vDS7AGp//R+oXSPcZl2u09tPQ/1dM/fC2ihmbqPd5jCOKvwsztFCNZ5Nf+or/lc3KcWYw4L
 5uHSlOE7L2S/KjSMPphAs/sw2vyR/WtTKDHUwKhw824DkJeVfbH+YVPXBqg6pgb85qnhYNmqEn8
 BiQrWXgdo10TTxDtjAPXhZTWaaAgkp0ZG1aT5+Lq/RlKblX7JDPl1l16xFKZ+0Abz2Sg+Mh/bHG
 P2bPqv9I86bcGOlAh4d3bNFjcwCMb0ni2FmwdhJOabr+83d9/JiTnJl5GTf4JnETghLrajEB9/C
 18chye8doVMbtSA/IhskTSV2wDNAnYOOS6NbUXI2qeA4r9lOp2ZakTVpG96EOGVFFxx3+BE4Lwr
 3aC43lCv95BvAPraFHNOZ6ajlWaljaQDJAVskacXToGiPWLnMEedfa/y0D5JcioW1r+u/Li8gfL
 91aDLdfVabF//85Y/IQ==
X-Proofpoint-GUID: aBnvGNICy7F9BPUGp3qJ1tXMXrbTjMcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270164

On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
> On 3/28/26 00:29, Bryan O'Donoghue wrote:
> > On 27/03/2026 20:51, Dmitry Baryshkov wrote:
> > > > That's just not true. If you read the camx source code you can see
> > > > split/combo mode 2+1 1+1 data/clock mode requires special programming of the
> > > > PHY to support.
> > > This needs to be identified from the data-lanes / clock-lanes topology.
> > > And once you do that, there would be (probably) no difference in the
> > > hardware definition.
> > > 
> > > 
> > > In other words, I'd also ask to drop this mode from the DT. This
> > > infromation can and should be deduced from other, already-defined
> > > properties.
> > 
> > It still needs to be communicated to the PHY from the controller,
> > however that is not a problem I am trying to solve now.
> > 
> > If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
> > 
> > I'll aim for DPHY only and we can come back to this topic when someone
> > actually tries to enable it.
> > 
> 
> DPHY may be the only supported phy type in the driver, it does not matter
> at this point, however it's totally essential to cover the called by you
> 'split mode' right from the beginning in the renewed device tree binding
> descriptions of CAMSS IPs to progress further.

Okay. How would we describe that there are two sensors connected to the
single PHY anyway? How would it be described with the current bindings?

-- 
With best wishes
Dmitry

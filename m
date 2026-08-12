Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F5142379A
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530429; cv=none; b=IHnUm3rwg/TG2/NgJJmDSdRTCakExgyloqsl0z6aVR8QLExF2+hI22hqyASN+S84MRhqYhNfWriW9i6Z4ZsFhmociFtMDaQr68yAhNX52o/RfJwTjW1GDbbaB+l0aq52Xx0sqPjFZZQoXLlMQFOPKgIjiRF2ZiuQQqblDnL82Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530429; c=relaxed/simple;
	bh=0A93pA/VhMlMcCcOOhq7yj86uFXhscYwCYZ5ylaDr0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFWUdvIMVeUFYo5CK62+RwsbgmEY7r/hPqUfJBWgLMCAkvQbe9+/3wQ7QlfJ1XSsEnKlyNWF95zbCaN+hxOeX3mDlPoF+NmtNQdls8hLK4mmxeWAGlYuZKSY+aVS3CZo+8Eas/8M4N/icHK3nLppDsDCG4ZRu4Y/A02fDDC4CUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN0HUuB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXKaISdj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN0HUuB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXKaISdj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fpjM3357786
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1/y4ILfqQT6FHvqHpmsSVfBp
	bakwfT0CniCQEUEhWNc=; b=EN0HUuB7r+9MMvSSDM4e5fKAk87QZT00qrWux6lo
	DR1NLGu40/5WFLUEQ5DleymJfZic1B3tlkrwP3j8xYb/I+5R+DdLSxYc8J7+O+rx
	VNT4C7Hvh7SVdPnwuSc5FFVARW0ZkxNoqAINUiEmZoWqkDSEdB0KcwqGirOzEzZ0
	Cnanef1g8iR+W4cvmqionoabENEeHe78XJEFbj3MScv3hcFG1NdoMStyoxJjWZmJ
	jdWFTmNGLPUwYtd+ic3wiqhg2Rk0I1pi48PVc6KKfWhmAhmskjHcat4kbWUFhEc3
	U850RzBeq82StzX89su4EJpEpEHJTAqTCHG2phw21CjA6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1hc3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:27:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so9630921cf.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530426; x=1787135226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/y4ILfqQT6FHvqHpmsSVfBpbakwfT0CniCQEUEhWNc=;
        b=PXKaISdjpE68IpGj4LnFNQDLa2rLy2CoFR5GUCjW58R7o45yYU3KD6NXIVh4hu50Km
         PbQuq4s9QguIrMC2ODZsuRpGf85alKovwzEDTPZB/xa4SgbY6djZYKNH2Ey/IDIJhUEB
         AsMv1SN3Wi8LKSl7LEeeyebrEcWIJzuGL9Bee0NCdodT+OMAivHAXJ7p42tJ5p1y5VBW
         gJhVczwqP3P+riGXK2XhBg7QYoNs+LgqJ0lpWc2SVIUFT2Yu5ZyaWOprr5kAKtIqxAX0
         8TOmS5V/LpF5IdSQb46QZgIfNf729PBlRda8EflJ80XZpLrRGqJNETOjo+h3UKpsf5uu
         7mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530426; x=1787135226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/y4ILfqQT6FHvqHpmsSVfBpbakwfT0CniCQEUEhWNc=;
        b=Adtu4x+Et1TDUSClOmmf10/vNtnW292huyYfjAideqWTgRTIAhfUmgCFDL8PzpcT3g
         MtBeod8rxwuQfhcz+v21xEZZ8eLC7UHa06jjQj9G5mRKdTU3yQApBnZIubMHfBun0CKf
         s8E1N4EGYYK4DHDH7N5LRhblGJTpxpmnDR9Wy7TnqBvZHC58A4mYLnPiM262QlMgeFUs
         aQVe6NABNVVoylh2Y8VQjt75gvOffuKEMeWwGCzfoV9DdewV6qnnsjATlhERIOQwKdP5
         8OruVKNBy4ScYW/EZ774SGZWXsAjA/xpTreMpzfoW8cCAAVHkWdT/CXCuQoMMUslrm6O
         rwhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9mHlvHleAiFLzR1owpyOTZ3w24lmppdDQNX2w8csuobt6pmssJpfCIFVROCpVi5m+z/SMPWyghoA4@vger.kernel.org
X-Gm-Message-State: AOJu0YycbqgK+Md45wIbc5tHEQf7LXoNYXDh+w7XB0tO2vK5edecCBAV
	O5lUzWxKWnOfSmX7KW1Ar0nz5qrZ/6fdkDZCy2Y2sSCRP6MQ7txXg6/vDnDRFRY5kyhiU6WtcAB
	lIDn6Tu5sLE9idYm62AVq5PeFqj6cy6f8UOBU8v3Jsw8GVcLwBmfwmYDkoLOdsnsI
X-Gm-Gg: AR+sD10u0By0b1U3XcCkix7ZCtlIOsr541UVJ+wa8Lfx3Kj768uMKo8BzJNpKIsh/f+
	CXu1kh4814t7aE5+wEcAz1xB6vbEho8t0Gi5tTmcOTPMSyBLX9aGAn+0olsut/cGwSwH8mbRnND
	R1lCGJ3zCLUYUjVStTObBtKJ5GXKZwNFg8Y93bFY4x/yLlfooYDCyGAfk67f+Hk+9JqF7+pM0H1
	Z2Lig3dRjtNX684Hg1UlbLQHiiHhQk4AtDvOSly931SPB3OAuMq6uvo4ElC1W3iATZafk9YUTWy
	CABjkaqG+WYi70LEyyZ//lPnqHo/LAoX0kyIpT/WBiyVTgbnul+dIpVTvE4ftFX56dC9Sc0i7wq
	m/0ZfiAFscXeVat4=
X-Received: by 2002:a05:622a:1825:b0:528:38b1:b550 with SMTP id d75a77b69052e-52d6030d315mr59919031cf.16.1786530425720;
        Wed, 12 Aug 2026 03:27:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1825:b0:528:38b1:b550 with SMTP id d75a77b69052e-52d6030d315mr59917601cf.16.1786530424037;
        Wed, 12 Aug 2026 03:27:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aa3ebe0sm70833055e9.0.2026.08.12.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:27:03 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:27:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <ge3ufdl2dwvl3tff77dqmkbcddp7zepvves7uqyyuxkiqsewfe@nftn252kk5zt>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: A2tn5D4V2PeQVOQwRUVn2OLhXwn9TEXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX97JVbmZJRWQt
 KAp4AzmYYnUW/0EUrDnbN5zHzW01myqDPnYhtOkPV/6ZSf8fAz33sLdMJvFUp02o2ThbVjv5ooG
 e+tNTPAUup8kXItA0Mbz54WGo3VucFaoUy2ypJQXISCEn/1P4eLuqpO3pA2qXGK3nGEE7TGL8XD
 D54e0F+GBhx7ChGCT0/B0qw2lQYd2YKm+7A8aybX3tem+ESRhCZvpw+xHQIwo2NirhlEYXxh44T
 u/s2Cw/sHekuV3zYEz6zGWkIjx9gJEt5vA87fq+Im3Ve8Onhm7exBL1IdXyecpfJn4Ana5YyDlM
 72FzuYT+BFdLZePK5WNj+ZVvcQmjzJMYal7P8EwPrd9JFjnOFttj2MtDvRQz0nPB9F6BnLVlvyj
 H6DHiiTrC3W9yT08ckQ5GmEIj5BVPyVg3mq3Oh6UmFPMheuRHpjl5VO0NhaUNKl8EjFA5JZ1eQd
 g5/L8EzIwG/rE52PSZA==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c4a7a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gEJiVQBakSoUq9HfEjsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: A2tn5D4V2PeQVOQwRUVn2OLhXwn9TEXz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX2IqO6/wT5WDB
 uMEv6/zBX2c7CdFA620I1atAkRjDyYzGhfbzRD4/2kRYGfzztpsdQQNd2wuKGR3upK71f2wbYP+
 Ep3z0CwnW0eo2iqHc3oF16M8QJ9tPYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120084

On 26-07-30 16:19:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.
> 
> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> Only one USB protocol (and flavor of pipe clock) can be active at a
> given moment (not to be confused with USB3 not being able to be
> tunneled as USB4 packets - that of course remains possible).
> The DP PLL is still used for clocking tunneled DP links. It may be
> turned off to save power when no tunnels are active, but that's left as
> a TODO item for now.
> 
> Due to the nature of USB4, the Type-C handling happens entirely inside
> the Host Router, and as such the QMPPHY's mux_set() function is
> nullified for the period when USB4 PHY remains active. This is strictly
> necessary, as the Host Router driver is going to excercise manual
> control over the USB4 PHY's power state, which is needed by the suspend
> and resume flows. Failure to control that synchronously with other
> parts of the code results in a SoC crash by unlocked access.
> 
> Because of that, a new struct phy is spawned to expose the USB4 mode,
> along with a .set_mode callback to allow toggling between USB4 and TBT3
> submodes.
> 
> Thunderbolt 3, having a number of differences vs USB4, requires a
> couple specific overrides, pertaining to electrical characteristics,
> which are easily accommodated for.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A1443303
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675542; cv=none; b=Jo8zKOJsVrDlv+3W3mrRv5oBygDxsxvFQj0Rn7jFmUTpAtN26Kf3NElMkwNDeXc0zGwjNCq3VdPe7BY9DrQWZAq11K+HcLm16IQCrkJwh0JHbYXnfY9/l+BCrDfgEcsZCJ/kTfUZqV4b2R+HBXaNPCjae/uTGJ8IvQw/46JF4r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675542; c=relaxed/simple;
	bh=Vl8rdLXA/zWODT5DG80RoiJoKnYzEvwuaitp4xFqIRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nugHgTAYd+hvQGUfaQCB/R8PfX2vQ8+wYrhQ432TKfVNZdbDdqf4vL0733QFglsXU6kh0cYkoIN993dc6sPHS1wztxYmjaOdxDtcpzZIl16pXEa+7BFNS5iisTQEbwbzlq8SKeQpB6raGyCHULb+SlEXyIv8rCdlsv65yjBj/C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCfZDsuy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZYGPZdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCfZDsuy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZYGPZdT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ3d73061636
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=; b=gCfZDsuyx8wMiPx6
	EjB1L9/DUuBEJcexYw9PgKGiBCWx0LhrRNZDnTEtr4oZxr9P3ly25ZHfHVEKxSJY
	9kK1ufSBa7LZRQmbFZwOZxxyRQvZhnQc7Q5eu+4KB5syWvGe04yqCfHBI1ObuGLA
	e9xx0GnN0cFqNfj8dPDgD45Z/lINTd9Yow4xiY1mJqireeQIxlrPKa4Gmp5J2+A9
	u//EPfo6OEc8dpgB4cNiH4U0FYq41I8WqdOzJLrtTYx12R1SLGGzos9k/52QVrVX
	iixs/rsoNEs083G2eSwF0XCNiCZAxab6sYzdfhkmEETNKBIPu0yyZ/gRwIr1hc/q
	5Phr6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a97ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:12:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso97479751cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675538; x=1785280338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=;
        b=eZYGPZdTZeUyLiFgHtkxVwwsHrQCJNQS0MfA8po9h9YZHmhI8dMwN8iWAH4nI1LCUf
         0crx3eAqsciFZtI28rdIlPCuwPQMeVI+6zbALE2QHZJySm2K4FV2TJezmKRYlrRARVwr
         1V+ZqnDllpCMKIEoJDF7EO5ZbBVKgqS9ucu9D5Puj8dM6LUraoYevqOaS2Plgji80HKc
         koCeIIAlJJIP7TVaLVEOPzofaMlWS2BOoQtRo+0s2fKCXYHZ6yYivn0i8Pz1PWk0U5Yd
         z9DNz97SN217iAI6dLD08FLbjALb2uuHKbPhWKLW8ErfaVuAgq7zULwlHzEmK5toQks+
         6MKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675538; x=1785280338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=;
        b=nUCdCkAcivrDzooh540VEde3uh8dj9xBp2aRfs7dNyginujTiPXuMiWWj0Ktb3v3yI
         CxTN37tO0SlJld+XTsk4w5y25E/rKjT6t7StBksM3jWBsDrC3LnPV5YUdyW8vgT3/7Zu
         AHgC9kInmdlgFid7BDUQerbmtJN62/nWd9gi4xsbRkGe7eJvU0q5hrrXUNtUiMIZ+Cu0
         jaQRLLtHD2wqpnIaGMd57Q5iXiL7oUoQAStlcF6+kX8izsED4wKOzZAcyj7wL2BOEWTt
         mGw0qlVX6RnKiMJ4NjKDwS4dZzQzoSZu4KuR+eYLASd5paZ37KGo4MoKfX8tFoBDCM/i
         WN8A==
X-Forwarded-Encrypted: i=1; AHgh+RqKQCV7mQylIXZG/5N4xznMm2O6kW70wW4Zrdc5JFwNx6r0WCOBaABNtA65yS0MNc4/4GCMmWDp9xWl@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNWcSRiZoLi/7pTm4U86xrs5W6Y538UuMtE0H3lhpDN8gNs7j
	aYZz936RM9+zS7DweYMHtVgS6OZsl4vnB7K5H6YFphiHWpT76jW/9gQ3LXOYEDc5Gtl9N0mTutR
	S74Iuj81rmRFNnaGurAmluZAxl+reCRB6NaXPX7eoQkGLwRZw2nkQLjrk2ttoyJ2m
X-Gm-Gg: AfdE7clSlIIgjm5/jPyEXRdyDQ+tCxAoUdu8taFNxwL3JZzVryT3goG8trgXupcmkSJ
	EDN6VHn9d+qtJQ2sd8RoCPRoPMRH8Ik+gwujDXQ3ToIwRlz5Gs7dIg/XT9/U6vvqPI/o+ifT1hM
	cW97vcM2I8R2Ack7WuEYxVm7+vn7ZpfcCb529Y+YCBoHEqeYUhdqCGwgEfRbKSVuSbhYntu4nn3
	P3hRtBWv4+p/CqUp/hMavKIOKlyhZiKvODpwD2OpP3T1NrYyaj35n+4ig13/a3Xc+F5bh5SR6xb
	NMZN7+dKelHu0iOUE1MoM0RATc4sGJaAHyDcJcgwMuurJ2qaJr/WFoOD8PzQXuybvxW+tStj/gw
	KKyq6m8wKdAIT4Xv3unqaR3B6aelBofK/gaemMLdL2L2ezXlJo1f9LuYkLLYw8F36aII4ef/VLg
	XY3mRXcPCsJldM8Q==
X-Received: by 2002:ac8:7dd4:0:b0:519:f884:b587 with SMTP id d75a77b69052e-5213ab6d3a9mr195185231cf.27.1784675537747;
        Tue, 21 Jul 2026 16:12:17 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:519:f884:b587 with SMTP id d75a77b69052e-5213ab6d3a9mr195184921cf.27.1784675537347;
        Tue, 21 Jul 2026 16:12:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b7425sm1387111fa.11.2026.07.21.16.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:12:15 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
Message-ID: <mi4irfwanrjjv56p62nn352yinzzxuig56amv3xkpkscwlrywl@pst3udv3kpth>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-6-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-6-99620e07f505@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX4l8zIOXrc/qp
 QONsk8sNG4E56cx35/fOO0Mq/qu7VpvYGXXVFpuLlKQRfg86gUw5zGuopWje78gfoOenvx3EOI9
 +HXXolwtP1h4KlWGs7XMnzL1rBInq9Td2pLbxpqLu1VRyNFxmUgDIHEuAi7lso3QycCmgmHmM+z
 Xb9ULESYqmLwPZZHQyX5d93yOYPtSX8uHXa2o2AIREhci6pWCUdq6cJkhHimB+BtVuYDHRaHuXF
 5JsT2O1L/Z0XnNHzL4PqEV5+1YNIiEPHcQJ5XuFcCIMiZG6dIFGzHaa5XvMKcVWe7yXplGOps5i
 Sy9+j6/1rFClfVHo7mQuhkXk6S3eq97SbXnI4udGyIC6xu3LK4MH/A0XeKPFu23pJHXUQlrGHMP
 J15fYpQN7pi8Ece/b3KiO4DQ5ivgwTz5IXEbQu80Ql/KiRW6o+vkCTo+eiJGkIekoNeg/N5PtO5
 MeCVsLzjS2kiylfwhjg==
X-Proofpoint-GUID: wNJsKtg_djqLSJnHMQmrmyIZMVuRtSwO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX24yfdK72rcOA
 vPOCirSuIcvC8zE9v2ILjD4/B2FCyR5iztSMZU1eZeRIJiFbDXyPjY6Y8SQhyM2cr+Ek8dCpNC3
 68ANp1oa1f2u2B7QJ4Kzzwe+CXl7NS8=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5ffcd2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ysZNT-AePBnC6ZdsTwIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: wNJsKtg_djqLSJnHMQmrmyIZMVuRtSwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:03AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 125 +++++++++++++++++++++++++++++++----
>  1 file changed, 113 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

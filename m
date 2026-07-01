Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11823E0251
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895356; cv=none; b=FVB3BMVg44eberFC0P28dzn5xgW0RADu9kWm5UtCoUYf+B4qeDjQUUbUpfE3BclGzD92RMvvNKQd3NM7/aFS6mj9vW/44ZjFSYQmy8OcwSEKHKpFrokMdFM+Inpm6B7jC/PKl6wvKcHfrVSLrgcSzi1vuUWc+HZEOd/urrQEhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895356; c=relaxed/simple;
	bh=5xMX/jS64sihrUDNVUY2o5SYi6XayswfcKqfnFSmBXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8mITPmEbeeVc5GByeHWTbEDp2UueavfJ0O2Xt1aVerhWT2tIKN+SHQn5NgN3HaW3RxFEM1xaeBGJRzdf/qMllr2jf79LoO+3bHTHbFoRdTho+8Vuenr5kHeRJTYFyQc6nm/0zOqpXREd4f+Zotu5w/Fde1IyLv5QQJMGrIMrbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZjTlVP6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjhGYCn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZjTlVP6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjhGYCn8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618FtVj479247
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ubvpnL1jK75HS3RX6DuGp9XR
	y8g70A3eerKMwr4sygY=; b=pZjTlVP6kZm2HvjDT8kzP7Rvsk0NwJu7lNljSR0l
	Ayr44WETuvGytyea/h03RXO0G2WxXa3SUmdB5isJgf5A/gAzcRVeRvwFCegXY811
	9hzIUFbVNIHde1jKPPnx3ShMr8IgYe4n8QzUiGuxhnTUSU02OGJp1Wk4PGNI9ORV
	t8fXcwwP76odiHdRV9j2m2oowF7i11ewG6r3+VWk0Z7cawFRFFehcYeXY6/kR0z8
	wy8byyPfiJRGyiBnVh4NnU42VqzyxtynPAhSl/ZuQca7K89bT/2ihqSGYgd0uFoD
	tx2+LRu89XJMNU2lQZNYDxgYl4OWQNXd2OFuVGxqtUEJ+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tghdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:42:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fd707bc1aso403810a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895354; x=1783500154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubvpnL1jK75HS3RX6DuGp9XRy8g70A3eerKMwr4sygY=;
        b=VjhGYCn8l+o6+1vuvOgF/ngDmFrVko/6rfWOj2eulfSXkhHbxyjjJchufTgSUUrnSc
         G5+kbwYBjAFkgYn1kSKVbcHZq3VfyNhPzfTuCmy/9pSm/7afrAvKsnlezmSf7jqmA7Y7
         dI2cRtZyKL8pOIOOsK5qJOPp3g+qATkNQZbLpTsfcAk7fkfjE5Hu1dIQ3Yw3kX/r0Hyk
         Sf4Q+CVv0mtwaq4dvKRlsXK+R3Cm2DO0jn1ClcinO4zuFSeXbuNIp9C0/OqXF0ridnsy
         MEX3tbZe+LTcwTkN5c5Kr9GPGcSDedwZ+tQb/AVt22TFcQ5di8+J1/KL4NDbEoZaXMYb
         bR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895354; x=1783500154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubvpnL1jK75HS3RX6DuGp9XRy8g70A3eerKMwr4sygY=;
        b=bAhcff4pcSShbuM9UO9+YcQRarxjfG3Qpti2+ckB9NkvoK9ng8h8HVdMESy9G1jE5R
         hYPQnRg48zB6akXPIC82rz8RCIIrZSJmQm6qgkpQgXtm++ly1QOkbAiyq4QAOp4J8Uq0
         NNbHMRVWR++h2WE+Ec4HlcHhvC6AJiaTcUjcGbrxnCS8rOtgsx8BJE/nvBgFb2ahcsNL
         A9S7JNwGlbSZE972iRAR6Ch/BHMkaj7zym7zNIAS9CiZaibf6k/y4hYz0KmCmUprD/dL
         PETeNPH5VkVKtlL22zDYUO/qIQ0q4EPVcfroZyD4vPoqVoHRke2Z1yvKwtWWfGSXTxog
         NhJg==
X-Forwarded-Encrypted: i=1; AHgh+RqMFoA7ZH3Ot55WjsK6H42qQq6gaUb1ClRKaHm75pnoTr0nAuVuLzE4/YeQA7G+Bf830BKwzAHALD0o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6lYG2EBnAAml7dyEq7zdj9sFvp7cUX8kMh6644H+eWI1ueXhD
	8yoysJEAIMjsdBq6mXSGT2kc1cExVi9UQoBqt3f84+mrdmjY5pFvme9p8tuWozUp9NYn8FkU8yZ
	Qgd8cHEvNvF9vME80hNIwhxAA2YTRODzqTB0C3D02UbR91wF+185JC73UHP6hYKoo
X-Gm-Gg: AfdE7cmViJjDWlmdTgNhfN1jVX5BMbtfkObUbaCbe+GFCiblecjY0JSqtGKN+VSgBL5
	Lp6ZA4tThTuzN5WwljiWfaouWdVfALnyoJHw9vNdBShJ7wF49qSHic1xTff8IQJ2ArmPFgz//M7
	Od/smnZssJF8OUfvu6+i56S3Q8+wEOPeXu7WXHXvS3Z1kt/9iIKosxPSvh+GW6GzerBA+nM6gG6
	JoXQWs9kUxEQUif01RSvxSeH10kc81C1EsyVPGoUywyr1vOReGWsWlIn62ge8XtwzhOcT0rtsom
	ttKffgkh7igfj6+u7DMSzsJXvHsPYjCZOKHef+A1DmOlL/VQseNs19wkbJSqoAjsE6MAXXDNyKP
	isejuz02+LmHOchXzVY3YLNDIx6aaZO9Z6ECQPNzHF30hmg==
X-Received: by 2002:a17:90b:3e8e:b0:37f:9ce0:af36 with SMTP id 98e67ed59e1d1-380aa22ae2bmr738376a91.33.1782895353686;
        Wed, 01 Jul 2026 01:42:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8e:b0:37f:9ce0:af36 with SMTP id 98e67ed59e1d1-380aa22ae2bmr738351a91.33.1782895353223;
        Wed, 01 Jul 2026 01:42:33 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bb30dsm27935845ad.68.2026.07.01.01.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:42:32 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:12:26 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V1 1/2] arm64: dts: qcom: lemans-evk: Move SD card
 support to overlay
Message-ID: <akTS8j74c13kvJIQ@hu-mchunara-hyd.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
 <20260227102405.2339544-2-monish.chunara@oss.qualcomm.com>
 <c2atmwzjfw453hgmjava6ygs5tkvxg5lic5ss5jnhmxbgsr3b3@afqveapmmo7x>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2atmwzjfw453hgmjava6ygs5tkvxg5lic5ss5jnhmxbgsr3b3@afqveapmmo7x>
X-Proofpoint-GUID: Kut6o70Nw5UZDJKRLyl8vUMRh8gSQ9sd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OCBTYWx0ZWRfX25OhfrVS62Cl
 UeIpGhTLqdNrX+jOxgccyntwBJxxHC87S23JFzvSgBErg77th1cBHMLW4rJY+UeMkUy4C1xfOCV
 PEjAahbqzxD8GV9acmXX4Np5n5xxkhY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OCBTYWx0ZWRfX3DLFx4vV1DK+
 B3B8fjyLkYLGcrkfq1cnrSlR6iGpo6oidG2+0zdv0lLJjnn33/Y/5bSsLqVl2kVo2VoJosPbk3s
 ebVZ7aVzeFWPK1ZOIRB92D1pNfqM3G6ARFvicOrfrImGi6F8MskJ5QxUdfC+vfhIf8XJNWfFoll
 GBfnXz4pqbHNqYlPC5lXK5UtzRQzc3iXAhuxzIIM6s5UYRORdRtIHA1JodMa5eMsa/TangmqSAl
 FZINVOP++7n1ayFelrktgBL/VOrgLnjKULNvy6MwBcc9MlDjp63kMBqFF5iRYGQIHa2HVuK8+LH
 A6F4/tC/NycNrcNd8uy3/ChTVxRQ2UCH9LFCtlHD/fFaow0394Bv21bVJuwZuATyceQ4KW4mOqu
 vtPsukVKs1qNcElgGPkEYA22+iFvGDOaJxxi8Kl7jE5W5HHRxM8HKh1Pl20ScjoA4q9YclehAN6
 hCllLaHbp0PQtBnW35w==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44d2fa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=WvwDqqP-NZ-AofKDq4AA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Kut6o70Nw5UZDJKRLyl8vUMRh8gSQ9sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010088

On Fri, Feb 27, 2026 at 10:08:03PM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 03:54:04PM +0530, Monish Chunara wrote:
> > The lemans EVK board supports either eMMC or SD-card, but only one can
> > be active at a time.
> > 
> > Move the SDHC node for SD card into a dedicated device tree overlay.
> > This decoupling allows the storage medium to be selected dynamically by
> > applying the appropriate overlay for either SD card or eMMC support.
> 
> What is wrong the SD being a default one?
>

As discussed, the recipe changes for FIT configs would ensure that SD card
overlay is picked by default as per the default DIP switch configuration on the
board. 

However, due to conflicting properties and dtso limitations, SD card properties
couldn't be added as default in the SoC DT, therefore shifing it to the platform
file for better handling.

Regards,
Monish 

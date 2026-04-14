Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB733033D6
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188821; cv=none; b=Gtp4mT3qy9IiXigsyx5+7tP4qHe1EtSker51nq5PGiYXTOgMVUvmWjWs4NTKkv6HGqSXqW1q6KCruAc/erzxJ7JxmiKwr9DLogAiErM7mznsQNCo85Xo6ac8ySj0XpBR/Ht9owMfKI2faswMdt8+HsR5+sgYz4S9RXiDRRBOhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188821; c=relaxed/simple;
	bh=Az8jUdqjdALxclH4zeNPwiXwr4cGG16iIaRABsqhT1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cj4VRtsXnwHdumZKkOwRynDsCdfMsiTBieWXMdGDc6SAVm11Sr3rNK3YBFbAk4sGboqNcFeOaJs05I16VbuaORzbeKBTyIoWeLMtH5uDF2yOfCpGAJ9PNmfGG6fXy78svQ1SiR6o5RiEzcZs5Dr2QOnZ1qE9ajTqh7MLcbhqwiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/Kh6z4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQBENdZu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/Kh6z4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQBENdZu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG4s6F2006431
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGTVhNHPdzV7VNIwQ2/A5yra
	FcoMaJ4fGpKnAXy6Ivs=; b=V/Kh6z4nP1cj7/7WhFQ7m7ovv8sATNrePAssnP/J
	gq31iFCDyKRYbmOhgQvlZtxGZFNP6jb/70ln6PPhZPKwhoOInO9ZCvmgQ/gW/JQT
	AXfIMupFjlErmMHYhMkHcxRSGJVoZsL+q1rSGFBSXI19LshaCnstBGeTDktyTthj
	GDuhmXF7M2T4B1ks4NKEwwxNZg/wIjFKCrLCd3FnW2bIkl9gU0MMxF7iis8o3dqu
	ros8AYi7Y6HEDEtWan1YHSLluf0JZsb9C9g1Sn+vGKYUJ4PpIIEfhJmolrIezFcW
	qpUNsb58jPatZdESFLWZs1BeW2lPqUCWC0eP6owhLRMgOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjrdpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:46:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so140958261cf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776188817; x=1776793617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGTVhNHPdzV7VNIwQ2/A5yraFcoMaJ4fGpKnAXy6Ivs=;
        b=fQBENdZu2RPHw6dVQoyUfxXdv9IJadebNRtV0M0yLCimIBr2BirhrPtzMBoWngxc3u
         mHMBAXHzfJwzxLIHfo1K1bLt+lMROKI5sqpcbpHws+gIJr7hJUB0HVU55szIh6dDR+JQ
         gaKQeqBtZacemL5NwuRLHR0/ofXxti1lJoErzPAwimpaGthrmA4p8wcrCnpHIl0TZ1qJ
         yvcvUVK+YZ8iqTjLUkhy9DB2JgMjxSrEITi5SBZo8Uvo2J7RTKt9gv3XdOnhld1YCIMm
         CI1JsmbaHZVxBP2pr3KXh8lMcvYSg7mmGBkmhRyDymcP02AZk/jUBjdPgdoShY4Efzdh
         wYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188817; x=1776793617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGTVhNHPdzV7VNIwQ2/A5yraFcoMaJ4fGpKnAXy6Ivs=;
        b=lowKeqI0EuJS1KRjU3fRiT17c3ZX4o9acSr0OXaIqAr9ny9Mqq/7+u4xPi+9NGrW6R
         2Z+QhJro0+yiTucXnEDl5b9GyufG4n6c+2Zc0mAd6EzbPCY52pdhvoeLtw59oXPV+nsW
         hVqHsZ56OaFNirYJ/A9ZY/I4bL8Ews3EaEmzrYgSAWckJQ0zk3fc1ignjQVJezStkuyC
         PA1UlpVQcAj0Z9lzN8zaTG8BG5Wx0EjlIEbEf2M1aLUFQLbfKri23R0T13QURGT+mc6C
         WRfmqjGHEeRRJiGO5BSqyVciP0cvyc53UZ6HmQUXtxYdqxuCCvUpctcgV23SahLkb77R
         ky1w==
X-Forwarded-Encrypted: i=1; AFNElJ+5wELpHhcPJkhvV+TcEPhuARKLWj3YDjUb2G6cI3HgaQ39WNFCdt2GIJ6cUYnfemyjZfMfptrVrHcM@vger.kernel.org
X-Gm-Message-State: AOJu0YxXD5IuTpx6L4SYyqE1wNjgT/RqR9MS2ek3qLCogjDh28qJFzkx
	NudR4KtiInENWItuvtcv1LGg7OmGmYS0zfBh0rZA9WTRNEgssefijWhlblBxA4cm/xIEV6en5wi
	9T1PE7Cvmtkn/GmYdZ7tbI/zoysOTHf2X6Zyaf6Ipa3NmOTRwM+DikNWWOWI4tFhn
X-Gm-Gg: AeBDieuVOS3V0XEPwHCgfdIjzpoAjGYC4WYNWLLLzbugeI6a1tLZGtCututmEJ1pjxv
	sxelgLpvFwrQv1jnwJSQjQXSF3KA+bGybG1blXws88gk/hD5yNBP/vcv3dbpaDjqFddyv2VtPCl
	1XzEvGyx8uplYYTJkOOjjoOS0n/+Y5KWbOWvah6HdDydKnbLutTSa8mj80ItI+X6qlXysDoaQM0
	om+PiB2wmg1I36x4G2HUEwsBevk++lI1wE9sRuME41zRLwyqOpppPRtqKy2xt05UWHYvCMHqmxL
	fiGbujDqIc7nWbG+QJ2vUMGARq9d+VDPk5ipg5z0FqBfoWJ4Rt903eB9l46k8N1ryTFyU8gsEQY
	cBfwBOncFOt0y/qcpI4tOuo1cG2//q7D4fDNWEjMx/S0Twb1hkdxpMu76a+vfrgtWKtd2y3aM6r
	8BuwE/u9x5bVJ5u2+pT5JQjpoT2unwzvwRzS8qPwUoyFfcfA==
X-Received: by 2002:a05:622a:4d4e:b0:50d:6ef4:b38c with SMTP id d75a77b69052e-50dd5acb6c3mr246211301cf.20.1776188816840;
        Tue, 14 Apr 2026 10:46:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4e:b0:50d:6ef4:b38c with SMTP id d75a77b69052e-50dd5acb6c3mr246210721cf.20.1776188816199;
        Tue, 14 Apr 2026 10:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe7db18bsm1378509e87.47.2026.04.14.10.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:46:55 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:46:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
Message-ID: <p3nx234uwvrsrrpyfhwoc6lfzax5mvaixhaqtbehbiirvp4h3m@vzalm3esidnn>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-2-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-spi-nor-v2-2-bcca40de4b5f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69de7d91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nVvXuFPTU1805r-_gQIA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qnmG0EW9hlKG3QSlmHZxbeW4UKUE8p-H
X-Proofpoint-GUID: qnmG0EW9hlKG3QSlmHZxbeW4UKUE8p-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NiBTYWx0ZWRfX4RNSz/e4zny8
 VMdXhAE/QGry3hMh2lzHZRZDJfyElR9UY9U+1qdHIGjG3EwKwqVSyIRc5+V4at0bLx2BhiB1IAb
 I2PbDZUPzwJpznrDm4BeLAjQcVgnbbhVLwMG+BKqULR2unfJOqKkEORphtcnWZQbYpYxVukCMzs
 alTSOKdBdUftK8iaFdoL5PZLzrGFpDz3S+1TvSPluLrcPXbr5Dza9hsQ2R/0XPy+tVmWFZ/ozpr
 wGFcNrpsGIlcFTSKc3LWiPYtVw/IUoHcull2XJ+MNMLi0egeEMNq0f9emTOr+6t3jazdJMyuaGy
 wGkPLcXWaK05bC/B9ZlDjMGZtTRUh6ipbDQKrhG0ZNWOdByolTShLiiF0PzwrFZMIptuJY52o6X
 9RBL7pxpOqY9ITMyqZTqzM8VPsFD8ndJHnAPJHw/FW19gub4dzwDHgxGjANk93sCMM1uq/X06Xy
 BlKf4xJLxY6mpJM2nEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140166

On Tue, Apr 14, 2026 at 10:38:20PM +0530, Viken Dadhaniya wrote:
> The runtime PM functions had incomplete error handling that could leave the
> system in an inconsistent state. If any operation failed midway through
> suspend or resume, some resources would be left in the wrong state while
> others were already changed, leading to potential clock/power imbalances.
> 
> Fix by adding proper error checking for all operations and using goto-based
> cleanup to ensure all successfully acquired resources are properly released
> on any error.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

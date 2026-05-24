Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D1B222584
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640437; cv=none; b=mZ+hODsAtubqNA5n/3baj2Tc7fsc6MajU9sSjdXRf6DZCGYVXDZ9gpV51y7UDv54cYnguo7g961WwlC9pl2FAnFEi9cKbrJT/EqV4aHV1QlCkBmrJuUBwsRVkS2NT+lXhMeSCGtaNnstpJkuIUt9Zjz75cgpLClWUZ0AnJ5E/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640437; c=relaxed/simple;
	bh=NxoTYHofa6gKV2PIwxhjNn1qlSn+vhIA3HWh0oWKIaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJev5Pc5rmmo1a79HI9vYKitjbyNRZe2ABTNdDEMa1quPQnKB/tGGITYB4MZw7HdKbz1elbweBC94zhD+dw7F2risa54QXbKG7B0GCkk1X9P+zko59lRx/yh+RrwS/7yskq3Ug64c909GzA6dB0H97IF9+UPyo0LcQyLdNaa034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evqtIquE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGgoV/aS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evqtIquE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGgoV/aS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O4hjCl4156310
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wrvxcU9Tac+9ZjUKvUObJ9ge
	mc2+OvvMLP3GIcBqox4=; b=evqtIquEr/Hg/mYsDx529pGt2wI7r0m24QPkWfhI
	F8gUg/8dSATAr9EOVpQFz77jNgS6Zh5BI+oHArZw/ClXpXYVEcSl6Ho7N0F9gpG2
	+ox849XVXs3NxRHwHDxr6MEsaNtmdqy08tV/1ytED6kNCghFy0cLWBZC/tQx9ipa
	NeLYTxNYE+0YbRDPrAWiHBRTady5YBwj4RbLZw30E8VfNQrAMOcwWzD9SgalayQ9
	wDlBxmvlk5++EIJ7XOOoEzOPVDft609uNiSvxWuc6uNk10lVul5ub+bT29A5higc
	/IAArS1wOl/KGHpEDdMHIhMSNyGj1HmHtB2om5Muohic2w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7khuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:33:55 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so15050630241.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779640434; x=1780245234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wrvxcU9Tac+9ZjUKvUObJ9gemc2+OvvMLP3GIcBqox4=;
        b=fGgoV/aSJbxjfm3ysTq+3XXUrMDJdiXF75nv0Tn8F5KR3IXbLjC+geKA6SvV6FRiYv
         zC8C/3FlS1zHl2L6X81zfg3aYvb6sC3lONJoiglwn3sn8ynFfos2wt3qPVNzXc3gJnFA
         EkCODyLwvNi8K6qFExGYk9IfvDyoWy4l8lGr3T6FGwwjiVHZrjF0cxQR/HGo2SYrZspw
         8Gll9j6ZHjkYvBPynGF5Q+jIOQp7nn35cwHkFIB+qhs8BLGGDyHD188wssKBlcwF1dbf
         s737tX8WfTtfg5g6dOnt0lfv6tEzR5ScKkH2zIyR4MNzm7H+1BXUw/ca73ZDgXrLr06k
         PaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640434; x=1780245234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrvxcU9Tac+9ZjUKvUObJ9gemc2+OvvMLP3GIcBqox4=;
        b=HX1GY00sD8ISKbvHaGOH6tFJMgnlpKlyjftzaadAjv2BZGICZLekRCdWxMuWYjCZxn
         t6/EhO/NjJWSmscXmJxFQgyQpR97O6mWLmJu+lmXZbaJlpeYNwZvVXComRUaF39TlFgt
         tq47bQJmkMzWMqKv2cFxuAqTkZm8b4ujPSVJElwQKFEhtU5u84cTXhDfHDyQz2Q7oWTp
         6xlvjEFFDt9kBfwhniQBO4SosfKk5/dPh6r0Yn61Az8WX2YoP58VmzsNVLZU7M6nH6Tt
         3IaN+7GjV9rs/luw8rAPJvlpFyCa/hTFPeQcbv8FS883sbGkXzs3upYOP8x31lWE1zwc
         G3vg==
X-Forwarded-Encrypted: i=1; AFNElJ/HCdpVbL2HLLFVcIsl60/Zs9iAuQQ0D0N8SZQmBFczcQ2+wxie4iYwwfM8eMkPisj3tdNeO9AoNAXu@vger.kernel.org
X-Gm-Message-State: AOJu0YytMEkRkkG0CQ7WVmYF7X66LyaJUoZceJ55Z1G/qfc5TDnG3AAU
	l6mmY7rSzQX+fQeywBrS79ZBqM8ZgbYEcj6GcHjRImITwnWE4j8LbgKU1IsAVoZO/uCecvdRJ0k
	7TPzE5i5qqMXjADDDf/5EGszTJ704O654TusxLSewCElT9siGOAZauSZA/8PQoT08
X-Gm-Gg: Acq92OGi8cr8Gc8AWLnbPhHxkcbo5UAvkndahUzPjTENXGnkUInTyQKaJNKVOxJQwq+
	AHUKWPVGBDGEAj28kTPmwU08EO3jteKfxPIkk0atZpmO6PwD30TpX1/W9UV1mCDEZOReyitarBO
	CoymRUmH0w2JSYGdmyKdq+HG6aC/wOGwe7gDehQcFbSxmnf7noTBmYKHzu2c8zb+GA7YIJcGduF
	dGFrSuVO/V6/oo1X0iIexxCnycs2dTPnP0ZCjX3fe1zO4E0I49M0C0W82wwcjZTs8/VofnbtCJg
	dQxTxvP8hZ/66mqb/7vU2/XjJp5jQhDxse09vjgtxYhJAQap1DRuLFfSYZyXJPPSI4ZcC2tpqbr
	Xk0/8Ihivv12jIIz9TBK5KH70nUuEF1f0ZpNXYqe1rMqPm6Ok6z12lTfyEN3G1GrW7THJRdH/Y8
	BNqDycgFaBDPNnUXyKw9zw+5qw+Ws/MdJsfxI=
X-Received: by 2002:a05:6102:3e22:b0:631:ab8b:c348 with SMTP id ada2fe7eead31-67c803c8b93mr5581660137.8.1779640434555;
        Sun, 24 May 2026 09:33:54 -0700 (PDT)
X-Received: by 2002:a05:6102:3e22:b0:631:ab8b:c348 with SMTP id ada2fe7eead31-67c803c8b93mr5581642137.8.1779640434160;
        Sun, 24 May 2026 09:33:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb258sm2040482e87.48.2026.05.24.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:33:52 -0700 (PDT)
Date: Sun, 24 May 2026 19:33:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Graham O'Connor <graham.oconnor@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] firmware: qcom: scm: Allow EFI variable access on
 Radxa Dragon Q6A
Message-ID: <65pjothj3tjvfmpjemktdinmeouxnuodkhjx3s53it2spmldwz@l2jhbuxeutyk>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-3-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522060645.4399-3-graham.oconnor@gmail.com>
X-Proofpoint-GUID: Zd9H0WiLXstfbflom_j4pnX3h-ERVVGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2NyBTYWx0ZWRfX8r2lUTkQBq6F
 AX9EJJ/hVta/HAX8cPb56tMpz7ohbM9fyrD0L0jzJrBGieo2lExq3LHjBAGCSBQzihVJUBmkX2K
 3RP9VBTqoOT15G593kYf18zYPeFi+JtDVMU6bgC29T0x2NfvaSXSk18OUGYbbiolPR8GBA8BQ0N
 tXhnPwBfI1UgQ4uVRaR/RbWdtyVQxUTr20j3XWHUo0f3LfoX6Ix2tml8QKXqJcM7NpCQNet7MjR
 yEPT1j3XrOao7pDRZgjNl5G+HOhktlOwmRENe/dIuwBdXuEl+YyfSIQjmVyWR8QSngbY89VDg48
 noZB3Jb8zlaxiqW9s1mx4qoogXq09Dvto8H83qYWGE061Zn9eb//8ADHKbS5p8lXE2jqiMhGEYA
 kPCHjeIZ8X3ct93TUxEgeKSb5AMYpmEq/AR+Idjearwjc97eSLoZQMEIYN7FD3IhAKi8SQwvOVs
 dF0vTislQChfhtn2LJw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a132873 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=tsHZmUjQ-Mj4z8azS1oA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: Zd9H0WiLXstfbflom_j4pnX3h-ERVVGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240167

On Fri, May 22, 2026 at 06:06:41PM +1200, Graham O'Connor wrote:
> Add the Radxa Dragon Q6A compatible string to the SCM allowlist to
> enable EFI variable access on this platform. Without this entry,
> the SCM driver refuses to service EFI variable requests, preventing
> the system from reading and writing UEFI variables.

Which medium is used by Q6A to store UEFI vars?

> 
> Tested on Radxa Dragon Q6A (QCS6490)
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 6b601a4b8..4702ad898 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2320,6 +2320,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "qcom,x1e80100-crd" },
>  	{ .compatible = "qcom,x1e80100-qcp" },
>  	{ .compatible = "qcom,x1p42100-crd" },
> +	{ .compatible = "radxa,dragon-q6a" },
>  	{ }
>  };
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

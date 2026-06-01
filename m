Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B433603F8
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313563; cv=none; b=fYTxe8RIwMEjtlYb8m+9N1IquXHbVuCeByHGQo1HSJ07Mvtj92vNG8qyg3kGFbAF8VjByLEt2wRawLHwHY3RumMRxXjnOZ/5L01+AZTAXKiydX0kHO3+gV7oCjsnzmBhCAxRbaHYVylDIJ1MmNR+4IEY3IAqI/wToVQzSpBYU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313563; c=relaxed/simple;
	bh=KinhUJbjrVceL/4Wl+dsdy4Ce3twecfvD0JpSPSj5UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyDntxqwmS5hOUsNd2/RzPGxJrWiLx8XBSg/sjmnr0quhYqQsoN3wxtRnZo/GMJW6zom3pdkU1bbfdVnzNk+O9+9ub6McTD8Dl7WB4ccEmiIa4xz5syjW8ICK60tXAyA4Q2n6EAm6Gss6+Ek7MLaW1RYLLGoup19KyIf+WbInIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2lSDYN7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCX6dJ7a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2lSDYN7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCX6dJ7a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518SGXG600453
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TcNMxS8xRhmU7EwCryiVhoez
	FRvWo2OX6g5i8iYoWQE=; b=i2lSDYN7NYJxU/JcM+TRKvV+SVJvK80al4qrAUCU
	TQXhsnY2ZjxRYmiDpGi12d3DHuxBWjrvuXXNhNgoDVoj+O5KL978gktcCEgT7gsD
	inuvM6f0jC2ryPNTVA18oQsQDxTraYtrnnYhRio5Rt1uZgUzOEdmzbC0nOSEPM4u
	0Yfjat9FIyckDkSK7ZDDFVq81tZ9qomJHOIwEv9rNTjYZj7PAJwd8j7ps41tUBbM
	gl9OjDIeE0Jt7Bm55yr2ATyP9Ux7IcS5NsT1wjw68rUYascAciT38gJz9WAer0A9
	LI+IIHr7C6eml5ARDUvwJLiUP1IEg4Y9lrUrdIZbzOC7tw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7ffdak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:32:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfb3463931so1757653137.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313558; x=1780918358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TcNMxS8xRhmU7EwCryiVhoezFRvWo2OX6g5i8iYoWQE=;
        b=aCX6dJ7aKCyZqclKAa7Xlg99yK8GbwfmJw8CkCk+/zyLvhMUw56evDeTQgNzbGbmPV
         HEeAJ2UcJuYF8uxFtz4GWW517C8JjKJuBiFOKisxkwWqKEp9Jq15DRBOkKBZ/EdjJZIR
         WxtBrgreV+Uxjd3486CQOyfUVATz4l9OljzD5qepngyyUerJkkViqQUtuFsk0adGIF9I
         c9Ml/LxoWTyTk1BaHIw2+r5XSygkuwmCLInbIpGQyrsXpVM31Erdt7x5cgdj1QuXqe9Y
         b/2UvDBZKotJ6ZVKVBZSZyX/vMnir6wZK6rTVjlSHX+shx+28wDrK0kWTrCGvwLdZkFN
         Mq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313558; x=1780918358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcNMxS8xRhmU7EwCryiVhoezFRvWo2OX6g5i8iYoWQE=;
        b=QRIKj7hoIO1vVp3wgrghC8/xYbkrPHiCdHLZ6xPnrvCzB5N2bOwZffOb+fMFmBhQ9B
         JY1UvnD8gxEowB+SX0pdUC0CnlAyylKjEEpwb4ILgXYF3HW8CzrsD6o8Ep5glEOnTxla
         cYuKwZmbP8Ji4OlPqxpGVAstXRNpSgAxcVSwfmiLqBTPz/CWu85UTovjoe+UTjxs5FVY
         Oxe1eMFcxH4mksy+j5sGC0mmQZb54TObL5b+bWvvxN2MXhQCv4tHe8UP+lTNTvYxJ19r
         4M8Gy8zavw7edAiXnD2X9563ZSuBcSV2hiKt+U+JO+049ygLeClvwngsf/jTco2XFxOV
         KKFg==
X-Forwarded-Encrypted: i=1; AFNElJ9OTrwaJbsFagWOM040W3yu64ovNGUJryzBYOXUhvoGGiYaBca5Bl2xf2hq2v89c7Hx1zcFM3dPlRN9@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZaz7QH0dTmkF8jyOtR+5+n8NbDLFiDHZq+1eqkGINELPd1sJ
	hf37DE6LGTM3kszjDZXxjJlMSRMYwV6Z3NSVLxQSNseDCl+iOKU6REf1MTMSStSZWcicGdWkJaV
	8uwZW6ftWD3JBpvPU9KOdydkNF6IsfxhJgU4k5xoxygsh2Zi3aNYCld4HOngJ94tx
X-Gm-Gg: Acq92OFlC4OIMKdm0aV+DH+fFidOJLVvcZJESgLPO6OWluchLdfD7IZ1pjd7O8a+JnS
	MgF84Hbl1V9ERhS0zRgXiXEHCRmvUPD+fvNGNdNdhFv3+0d4+3MztmiOsKAUCM/ahPsyUUztdVl
	ePmb8ZLp4X+46JL3aEnJjltF1fiQGZ9THT/oEhz0xFVLmWBIKSCTTowhHlNP34oWShZtPOr7/mh
	SRPX66LAtNz0c7/lhtIvfW4XV/qrhbIHxcT7p9HI/ALgXPKSw9LGBnf12fpd2bD9pjxuXnDrT8a
	IK7mneGuggAgH4JjXqgDrBO7B6VW5YrBEJhYbFZ+mIyq6XmXNiLUoMiwzDAdWrRO+vwXKBD1+ZP
	9NZvf2vL+kJ2efu2xKII+7UCfB83QmaajY+iNkMwlQ6O/oR49NQL+vKWp7CrQl/XEfQJ2uJD2ol
	EiR10g929LAHPh+mybSZpw6Ij+qCEbuR9p8onIWhibQmelbg==
X-Received: by 2002:a05:6102:9d0:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-6c6a72cc962mr3699790137.21.1780313558093;
        Mon, 01 Jun 2026 04:32:38 -0700 (PDT)
X-Received: by 2002:a05:6102:9d0:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-6c6a72cc962mr3699774137.21.1780313557681;
        Mon, 01 Jun 2026 04:32:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396840dcfa1sm6288321fa.40.2026.06.01.04.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:32:35 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:32:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] pmdomain: qcom: rpmpd: Add Shikra RPM Power
 Domains
Message-ID: <l63dp6mv6nu3dquqs5mzjw3izg7rk652dszq42qddd2yj76yai@bhxr4cekvu7w>
References: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
 <20260522-add_rpmpd_shikra-v3-2-632838e2428a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-add_rpmpd_shikra-v3-2-632838e2428a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N7Jh_izhX9izWyj8L8I5k9qA9ANqXwEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX7AwzyYZhp4jV
 2w6A7aPj3Sxw4nI/Wcz/O9SYc8EIaGsJK1cUnIs5JB++7rBGiF0+jI18l0GKySk/ZfqVSNyegge
 XHq9BQ1In+JR9iuLNsGlY+UlQh+QWThggwlsxUq2jHz4rKi28K17LoyZv7UrG1IQ2Foc+MM5+sF
 7C7VcrEjV0E7zs9rxWcfZTYC2mHGTFfMb3HJwJWkECSUMSlqQv9Dg00w69MUYRQoeDfhqLt8PJ9
 UZTiOfRCtmqrfMVsLE5+0jiD2/l/YctRPGjkFPmtdhc++X7LLZYtTLrIbRK9bjgvTw+ZI51Di4P
 o50+pbZ9XZUXND0Net6K5oEA8pJhuhK4L8/1HGe7wP/NJDLbgAfGAtYgjxBJqg6f5dgUT6yMYZ4
 fJk5rHw+slcoxL5BdcekSyx8s4W5tqv2CLjcz9gPvRdiOjXnchJFqI39OWD7dfWGxSX0RAoNPIk
 qjvjDSLAJngM8oHevnA==
X-Proofpoint-GUID: N7Jh_izhX9izWyj8L8I5k9qA9ANqXwEN
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d6dd6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=uP2ZawwrIzpawsG4yqYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010116

On Fri, May 22, 2026 at 01:51:55PM +0530, Rakesh Kota wrote:
> Add RPM power domain support for Shikra, reusing SM6125 power
> domains with RPM_SMD_LEVEL_TURBO_NO_CPR as the max state.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
> Changes in v3:
>  - update the subject.
> 
> Changes in v2:
>  - Collected Reviewed-by tag.
>  - reused SM6125 power domains as suggested by Konrad Dybcio.
> ---
>  drivers/pmdomain/qcom/rpmpd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

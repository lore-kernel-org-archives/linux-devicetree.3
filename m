Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52D142AA9
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180189; cv=none; b=OKcoj7yaOZKideTSYdzKcIN5Kxmy13xRtg71YFaUTqDMMMDhLxZfifTsPU5HLKcNF1h9LwPJxZXJrtkvN2dR+B7Ui8e9dFUNAUNcSfeOOvOw3DcfJ4HWcfY6vkc44j0ggOaQKMEM76fMsPL3/PtXNzIgFceL720zsjxE4PvQJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180189; c=relaxed/simple;
	bh=YVhjTvXHuSPVIRlL0H/IfiEgu8exSYm/iuSPi/1/0QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu0fJNgyADXIEt+qr1n2I59ZGpTo5UKaxU9LPHpa0ahER79IfP0mE53rTHjbUQGssl4Qz6ImYVv14f9PqOW6pH/QFSjuoP9yL15lJOXTIvOXGcz2fa31v6l7u6KdkJ/DwziqNRKib5gS6ZH/q3ZbuX6T0UaS1CdMXAXvNEKRutQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4OR15BY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBaTD+kT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4OR15BY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBaTD+kT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBo42v3157277
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y9wbisI+nGNtkqqokTeJEVlq
	dPP903JLL6TnQpDpxaA=; b=D4OR15BYyfbtWujqwtpPY6qqw1bw8wAatyKjfdd3
	NH6J7SKSFmJaaXHrW92xrOzteWeX0ND6ObId5lIllTGHjInFMGJjqKxik/XFB+t8
	ErOwXQw4IAIvVXF4GHHFERWM5moNG7b9Cjn0UWln8LwOwPywqw+Vt+yXYudFnwzR
	GNKYW+TjzWFeuYkpVcB/gnIAPy+IGO7lbVe7v7yw+M5WcjTZqf7PMrNnoh5/sbAK
	uwLwYn0uNIarkPJe2SFFyyq9DBdno+xefFx0mzfK60m4RsFjFTFe5wywfWY68vIL
	QCoyoZhFH0ktKMYFNNvNuxM/UsgRbp+wjYPzjoZjsi2GHw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bb9n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:23:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-605c1beb746so4412808137.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776180187; x=1776784987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9wbisI+nGNtkqqokTeJEVlqdPP903JLL6TnQpDpxaA=;
        b=JBaTD+kTxgX5/ZktuS+xeQWmIKGpksU4t5bCa6x694tFk3gisZQOyJOkzZFooUHqaR
         DZyzNaUpH8UccMtDuuDWW/LKeglBeIxCNsf7d/aKAv4lb2y4JxDlmZgqt6cnFI0DLSSF
         kuIg/UZny5njmSV6d2KLkuyWXpyuGQKEOXeERFZ5Fn66X/A3nCmWw9dBPIbBMc96LjSN
         PWq/BDXKbClrAc9peyaFfLIoNITeUqrsJ8B73S1RXigmeH7HsHGjOfeJYutY+Mhe5IGD
         zg02Yt39wkws3Ynm0wA2qL8qBgGAPUuCrdykMfxb+jJtPq+89ISANpHD98/3TnI7+YOl
         ygUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776180187; x=1776784987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9wbisI+nGNtkqqokTeJEVlqdPP903JLL6TnQpDpxaA=;
        b=nt6f6p2HTKF7ResJCKU7z8W/eBqQG0+amM4DZRI3lH4Cbhpp1QJvUSi9s+iG9dixoG
         aK5emoi1npcISAknX97K4CSXR/O7eNL7k1ivkr01YSsU5mm+8Zlj7eNSIhQm3WCUEelJ
         sfpqQrcJs7YHKWmGvD1d+kySDMdfyYczDfWAga+Bkrr/5M+u9mvmAxwwcke5MBJIwh2T
         jt+guIkpW1D1u5qpzNwFgB/FamkaoWWGbZYjY3P9fRAxGT13RMGwZOqTsDWuVwHhdOzX
         XeDDPY4EIjnOgjMV4E6oJy5304NeBYHWECMWKEYvpFh7ZTwVoJ3xOh9Ex47ViQeZezhz
         iDag==
X-Forwarded-Encrypted: i=1; AFNElJ+/HKpOdpyyt7KhPZhc8vBtw7z0tRpT7FuwRQEO1cVPa6UpJGF2na7eo6COMrCkUo15nXBifHycuyrf@vger.kernel.org
X-Gm-Message-State: AOJu0YzMfRJOSFP7f5I9fwJ/+y/V0neikSiDFbABh0CsqpB7u2WJvnfE
	eUm0ooDm3Nrm6XSROsavfbHqDWO/0enz8Sbufa+BwefV5vte6JS2rPxmI5PPv/lpey6kVZTs+cQ
	CIsxGtLaL58GNjEQYv9pkvmNMxfVxPZpZxkWP4b7ogLyjzAWbuKEjdBW5WLml457U
X-Gm-Gg: AeBDies36CC+oDB5JMEXSoJBGdGceIpXJ9wo09d7rzGW3hIpw2cbWhuOJOTV6Jbslyf
	mqERNitVNiO7257qvVinTQbqqag4TIktP+Q7nJgReDDmjcZX2HATPHM5oO3XV3LxO99cssxM/s3
	EqJ6FykS37FwtGz32BpNOf8ECclUtHeyF8t7brm/llOAkmnHEqJ9QgWI6i1Eh5p7WxU0F0Dx18f
	NCVPKr34lFzq7zIS1z8tjXp7ZHhscVksyUkY6TWIY5CbKCjfDBbdVx9yAa84FVa34nVVYXJsml3
	InlbbPZyl1oC7FqdeNHebl6M1GnEEqutiW/id5tbsMG4P+Vd0pCaS7wwHS8qTiVSr9Q1UjpM+3M
	zaJOI52u3/iuS0oQwkTQk4KEmZYGxO4I6un0Yt5zWhPmE4RGefO3tKGQ7m7HN5M02RPnUTiOBE6
	p+eSwZZM8g+dLjZCBPDqykTtfA0wEIyr6ocQli+amCSqxWvg==
X-Received: by 2002:a05:6102:3e04:b0:605:1f22:10f1 with SMTP id ada2fe7eead31-609ff5dbfe9mr9259899137.13.1776180186936;
        Tue, 14 Apr 2026 08:23:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3e04:b0:605:1f22:10f1 with SMTP id ada2fe7eead31-609ff5dbfe9mr9259845137.13.1776180186461;
        Tue, 14 Apr 2026 08:23:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e8467114esm10716141fa.34.2026.04.14.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:23:05 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:23:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 08/11] media: iris: Add power sequence for Glymur
Message-ID: <7lfcntx7axffy7seg3w2hstomzba2hwnvo4rfb6l7d6ki3z6q7@pt66xxbbvrl6>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0NCBTYWx0ZWRfX3b8Za9YfgV2F
 qIbo3Sc8H8mgAWfZsrHc4vJ7B2zMrp665F/0zQWy/90ZrwB6ZFpVVNsBB/Q5Cab69EVwv+i1pO1
 AlhpdxADJhaLqePaMIfwJi5zEdTxwX6/sucog1DfjhPL0eGOUS7/pX4BRHJgcMYAyy63u6FAImh
 vTqRt8mjw92oVvcPqE5b0l9ilizIj0XBROvo2VPSyYg7kREmviQriYMa1c1yPs3df3Q70zS8IaK
 6MIhGL4pfoFcxZuTS89SixgteMqZ9lUsjb03uHz/qBZ0brQuS6rEjCd9+0D9IuuaOWS9dBmK4Nm
 Yrzwf4qtWwK+NBi0LS6ume0zDU8Q8e5UUfsElJh5ECYMzBuRCZaNGzPVaUguVFF3i1rqe11pbt5
 RUCAaWBq+TNRjt3MazLRF0f9ykvo/9AT4OFFE93TC7EvmVPav/VFOxxc5bGApffn5c8IFHgiGPX
 sFNbU7ylzO/14X85yPg==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de5bdb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=57hCUadNtg4o-QVSfuQA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: H8vQjOHg3ZTepMESJKax5p9xnT4-aL4G
X-Proofpoint-GUID: H8vQjOHg3ZTepMESJKax5p9xnT4-aL4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140144

On Tue, Apr 14, 2026 at 10:30:04AM +0530, Vishnu Reddy wrote:
> Add power sequence hooks for controller, vcodec and vcodec1. reuse the
> existing code where ever is possible. add vcodec1 power on and off code
> separately which has different power domains and clocks.

You need to describe, what vcodec1 is and what are the requirements. Is
it supposed to be brought up together with the vcodec0 or is it a
separate entity?

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   9 ++
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 123 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>  4 files changed, 140 insertions(+)
> 

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7253CBE95
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041427; cv=none; b=g+wqLmKSj+cn9I6evHVqKgiBDQHRHWnsq9kkDmvLOBG0vU1hq4pxXvfAR/uslwhCXccdK7+xdrACeT0y5NMGoaJOBCk2XaVBbaL4nNCn+5SFIg9Cqs1dHxTIbebcmoHXLF3j2JlAm4UarJLBKC0kKi0YkOJG8WMlS0C5C02oyDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041427; c=relaxed/simple;
	bh=Z7UubD0nbMVEh0Y171+jX7DCQQjHM40ZOHv5ApHrDbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDvK5nXV0Y8VfwMCaoW7fKVVyzMA92AQf6uWlwN+eIKi09iVHhR5llbllee516DHQtGUgvCsYK+8JWy356qAOXwYdUcH7GY7ibADpKPgD7vMtpIHY8EascbAWa9uhq/VQr5AbSraNv6Dq6i0bVMbgacRDjT6uwqeBbXpXTVF3JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6kEBRRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kjzji2zf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6kEBRRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kjzji2zf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HAmHfu3327805
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YCjoQRyXXAzAPRC76KDlYSqx
	pQjcG8I9xbZRDJMHxR0=; b=S6kEBRRbbcyzoSMMdn2bw1Cb7mf0Q4oBhlHYi3z2
	deMxPkVYhG7ZnRLT5kklgXXiRpiYqxmPIScls4eTq31fpywiCZF4vqFR3Ad/29mC
	t6CwYJWAn78p7cGWzZXAIiaWgRoE1CFQwZ9lpx5crPegy/L42lOC4Ao6Mu8NqIJv
	FFTgLpvyRhGIiSWx7A3hU3xm0kVjDrGP+azwIWbRawqi7uqzEUQyI/Ci54hg7oRZ
	OcMRB/8KlXyw1pNv+wA5w1xw3wO8rjYwopQ8sjyKsKHIXLq2OF+0KWhrOo5bS9WN
	GJ+OWddnloxEvYzxNkk+MvnRxWGUjSYKIkXogHX+JiZnQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw3b1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:10:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so56479921cf.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041423; x=1779646223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCjoQRyXXAzAPRC76KDlYSqxpQjcG8I9xbZRDJMHxR0=;
        b=Kjzji2zfa1kiPI9LGdsDhA2pumABLlNiCtL+Z66AfA4Xxm+nHh0lLB5ctAHlDReNtK
         /+P2n1dPK4qs5bUpMJ+nFRKvPK+mk/rUBcKtJ7WSjoGL9atx83ajOfiKYaKW7K1Q4j5u
         7KLeW8SPkRkHRfFUP7aMx97UwHPM62lh0VNYN1kKXNBi4TdBjqbwENg3hqoBIEv4AarA
         OXJh1aGU29w6ZRqXPT4CHgliDkYvyDU02XXGp1wHZ7N5jAlzpCTbjCCIVlw+TA2G0WKK
         2Hk3hGvcTMqZq06VGx14EHnQnLJShVk0OihKXKpHyK/28HKnccgu4xMfOGsgbkMD2O4B
         py8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041423; x=1779646223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCjoQRyXXAzAPRC76KDlYSqxpQjcG8I9xbZRDJMHxR0=;
        b=WF7LkAbqOuaIqU596FBZ9lT7I1G6IKB2NDCO3yHXOMKEBPWmwpTnwLYvPAitgnw9vg
         E6uzBi9NslZwP7VOspVdfxFW1JcqwAuPh3Y4Iq+TqmGzfnTWA27TVsFl+Mk7iD3PrrzO
         81v2yMejdjOj70X3x87MN0ZIwJr5Eepqs2FA6bBKjA+/8qHx3WM+/X1fTNQaVvQqnHBT
         lGX/eKh08591Mf5xNQ3APqXRv+PKrcaWBPE5QmoAW+nDYjBlPC8gkCenNKh/xPNZFAM/
         aQNyfO8HDgCaEp2vfwKxoBQ1hsBsYZzkXGESHULNdR8XHPmaqSyw0s+ieZ91s3GaB9DS
         fWYg==
X-Forwarded-Encrypted: i=1; AFNElJ/iI8woAqT4eRZHkAo+Vle4CKAr9QselfqvbQPkdXlSZesjK56JG2r9+7faxNUYMFHVvLBkE5etTeuv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh1nhSBSmtuDxUsN0zAYCQsDufuBI9m/H0DyWvISALt377BLV5
	4YPt9mU8MvOV1YUekIEPTIK+948LPluB+ZpoL3Os0z2aT6HEIWWqtSYo4rL4QM2oc4bzfsde+Tr
	cr3PNt6e8CoffY5MYq7tQq6t/oXpw3Ba8R51kM0dweq6x6VEnobIycBLGRjeaAlsw
X-Gm-Gg: Acq92OFB8WouaNpbfTdsolyW02qM26a4cX9jSEKWpRl3lM+Di4IWB1yxJY7OogiZYk7
	Xj4CEQLhQuMMrIkuWEeVZ3DvTzLgEETRsHWmbxHUZB+wlHHr9jTPLgWPuRJZuEv82SPsDHuNkPE
	vP3Np3VV3/sBzK39XwTaL0w77PwuGhp1r0dvFpx7d8UBTSh2dQuVrKeQZBRtMbirFsHfE/4RsOI
	JWRqsZd5q8TlXpM2TejofuLFJC9UPRQwu1DUp/4MXrmgSF4moS7MelvG57Zs/RG9YnirVag8UzU
	y67grO5tb5B/jvG5dxQp2bpUoet2JBcclKkzyC1jAtkyn77n5tHz/P4fJTQKej/AYJgbBW+zpD5
	S807S1fHEsznDp/6ou3moZ84B82CNdFTksl3ELy44G+HFqq9m2YWPI3ZBZk+qY9VJ/cfxavLXhX
	WdWj/St4eSTySDTvrsXEqgItVhPitGTZ2ko7Q=
X-Received: by 2002:a05:622a:5910:b0:50d:819f:e7bd with SMTP id d75a77b69052e-51659ff9a0amr171584271cf.4.1779041423288;
        Sun, 17 May 2026 11:10:23 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:50d:819f:e7bd with SMTP id d75a77b69052e-51659ff9a0amr171583671cf.4.1779041422797;
        Sun, 17 May 2026 11:10:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2845867e87.70.2026.05.17.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:10:21 -0700 (PDT)
Date: Sun, 17 May 2026 21:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 11/14] media: iris: Add support to select core for
 dual core platforms
Message-ID: <4g6anygi3vmqomhbjjwlasw2arfvrr4bf425v4ohlatnudz7qk@btriuufbnlil>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-11-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-11-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NiBTYWx0ZWRfXzpeufoURL3cl
 KdLeLkd/Qf/AXpBtB6lS6KwL36BLyPJiZRagDQ0TwXFG0v9bE5RKVLGDcLL8/Qch/TEkhZ2EyHj
 qznFtk6m/7wz5CbTeMtrM+14L6XzNp9sd37Ao3Hk3wXPevkm/k5EGHuHN1vFTGl4O0PBSVpejoM
 BxG+mRPogsYSDUKBIsKE62SkOCTviSV855UaowAvvOItMN8r/R/tY7W8x9JxU9cBE5TGL/7eI/J
 sIj97Onrt7NTkEKbVKA97+ep1ZyMj1S6xAV7AisT3w1fbZR/plHBPjmI/i0ytrJ/GqIkvBJxNu5
 Kwu+VgbYSa6XtUGRdNv245QT3igsL4LTPEZV+xlfJqXsmtvpPTW/OiQg9J1TFMTfucBmmyLDPqm
 HwgWh4SM9WKcXZgc/Kat7BR6WSwibi5a/cFgzn+i8ccsu3XQQvcytCVYDaxujgyHxodsFJ41zvQ
 fSAD3b3JFhaepaMn8rA==
X-Proofpoint-GUID: xJle0pyyFMNDdoD0TK7wpljJEd_shTzW
X-Proofpoint-ORIG-GUID: xJle0pyyFMNDdoD0TK7wpljJEd_shTzW
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0a048f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dWoGYy8sgvYCzfpHzJwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170196

On Fri, May 15, 2026 at 04:51:26PM +0530, Vishnu Reddy wrote:
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> 
> Since both cores share the same clock source, the required clock
> frequency is the maximum of the aggregated frequencies across both
> cores.
> 
> The total session count limit is scaled by the number of cores, since
> each core independently supports sessions up to its own limit.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
>  drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_power.c      | 20 +++++--
>  drivers/media/platform/qcom/iris/iris_utils.c      | 58 +++++++++++++-------
>  drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  7 ++-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 63 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
>  15 files changed, 173 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

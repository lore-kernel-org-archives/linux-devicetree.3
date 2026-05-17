Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80433C6A27
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039001; cv=none; b=VIkDBLkTVcrCD6So9vCJl9nUCqNjinnU3QbtYhD+0U5oGOb8VcMLFdKXIDUy/XJnG2NEjPhVeZV5jp3PWKADLbR0xvKEBxzcRoCSpeLuGfJnU/aKX0cC9uyeRHYd/oIJ2wTghu0Rm80acWqnPrQq24G8O0qtJGULfPaG1dLYPYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039001; c=relaxed/simple;
	bh=6py1zoHaVdRk/ukIHqAdD7V61Ikdrr3sm0apl9nG3Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EITntXqioutG0tN2z+xmn/1QfCPS6U40fNcTmS82NuKqZCN3dzTAoDJvxMUjvM65qVfqOG2IY09slfsEKlZ1yWjsiSREjaQweUPBDInB+xx0kBAb983BnxwVNmE//1SOBsIxgtZs9e78G+Oy/1ESRhq1924A3oF5KUl+gYhixTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2zaxeiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4sJ6gmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2zaxeiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4sJ6gmH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNK2751931006
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JpdeiS1uA+pl00HV/TMDS+WW
	ayMzmhtr2xGT+L36+54=; b=a2zaxeiVGVoq4L/MfYoLpjoCw8rrZVrcuElfi8G4
	ZPiOY9VgXyJAAtkRo0RXWEk/6IcJuerIyGVgycOF7bkTaYBUqRrS8B6xab2MYQO0
	+o/Tvg5gLaE3cd5d616BX0HBzo8TSFV7/klc1j6cWjoP3ogVWVPxE0dmRkGqnQDh
	CG+AqgeZqzE6Wvif5h/Mu9wREMoemT3V2TKxVBs3MCuLzrNHYgVo7ofLsVDyNf5n
	yYNqLXqc/+mU3QoWIQ9bxcQZJwo+QyiojF9HK8lYGVq+GEC1pF0rPmBMZRhLS1Vb
	fVHd5DOmWDWql7Um+Dwrmw4Z7As9t3zr0DtTWb8y7cxjdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6u8je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:29:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso48982671cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779038998; x=1779643798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpdeiS1uA+pl00HV/TMDS+WWayMzmhtr2xGT+L36+54=;
        b=J4sJ6gmHM6v+w/CKOElgTF/RFsvztbXrrDv3bR7HSNaqBA17aHQl01kv+tYe0IbrV2
         d9IKHbDKnxrZXjC/aZSaBENKt0ffYBUNoxAMXmvDqTH1j/931z7kiwwHgWqWQjNZVW8D
         TIU+qZ1eRPggG3CxHAmlZliNw3+/yf0rnJvHCqdxCRG2avB8HUV6oaRsvn10V9FrcY6c
         FJxFak25gwcMSzSX7xutVB0CberTmpVLqME2leXO6wmvf7LWlEdarGYG7TqPnY1Ewty1
         i40cd1n45TCu6BYmjej9Dnom+bFZS4Esv6MdoteImktqcGQyikyDbbn/mVxljtCvShDg
         VS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038998; x=1779643798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpdeiS1uA+pl00HV/TMDS+WWayMzmhtr2xGT+L36+54=;
        b=Ou2DFTXkzYL8yo5ZsnG8DcO7Y+BvaYohC0U8vmp0r2N9b0Vaqx7rAcQHA/pfp6Bg/L
         N4c4wxu5YZoP0/BIxZKb5J92xXIWCEtfsaRzuryG3VOcQ/XhH2RtEihCTQt6tIHNxErW
         h91hWibC8gagFGyjql6HCbJZtMsuVMXdc6McgoaZQlkhwAhwCDS3/6ogpJzwAG7TaISj
         6GsNVT7mXYpTvOHXCKj1fB21UGOodgwkWDSmUY5mIqG7jHJ2a8CZTX0sXtLljtlzdCII
         rzMKZADPvMpdc8URqFJXpr0OpwmoVGPKvWYn7ju9aXbIAHxrbwVBo9orPbvP/AZMP8D0
         wIaQ==
X-Forwarded-Encrypted: i=1; AFNElJ87E0WjyFfmMUWVZOawllyWZMiP2fdKCSXQB9ZkHazEASH4a9Go3Vzuv2zGSqluRq1TBhT0sP+S2jsR@vger.kernel.org
X-Gm-Message-State: AOJu0YzjpkYq4KmIPVLX62mDmwzBCl1tMxlXQ+f1BJHfSJZGARUh+xjj
	68aoO9nW6DaJkSK9voGYrr3Huwcyugs3UloZHgiEQy1jMdXlqjZeJ8j/NdS/eO8Wf9IXwcVfu89
	DXtvxprC9lLUV/OJN+p20JjJvWkSmOYyuqpSdxFO/zNQ7IHwnbTbL5EK9iFB/JSwz
X-Gm-Gg: Acq92OEkfeVNOKp+Ijwiosbu1qEpo+pE2KFarur3dMvnMtqxxzExhUmBqcXYD5n21iJ
	ZG+Wqxc8jvQdsHyFkbe40Iu3RXmEoJMGGQzFNbrFTsegQvYBHJl5Rao0ztXvn1EmpddzXRznnSv
	YPCIWuFo8XhbjytAphB5Qnxmyap94/asXA5Y16wgZivybaYvUFM903S1hv4dk3Yum3a/6TwLzni
	6inSbxKgJCQL7+9Spqbyi3cKLZFWntx35qEypDTJPRZeCGQdxohXd91plIiwNeDayHQY+iMbCIt
	fQuwbzcf2lyCh04khD9PC5ngGL9nnxQrXL875ypX3bgpKZAc7ri2o0xrWlnMNzswe0K77BurfE/
	aJ4JebKbJRj2Z9GjfEhnZLnhknQGlU6ktsZfbXYYerxbrdwkjmwpVhX76kwIrYBVUXAQB+jv4vJ
	h1yZ3nmvPUpCA5tjWvgV3ajb7YDYdXdDWd7jM=
X-Received: by 2002:a05:622a:6bc6:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-5165a1eadf4mr127697161cf.31.1779038998118;
        Sun, 17 May 2026 10:29:58 -0700 (PDT)
X-Received: by 2002:a05:622a:6bc6:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-5165a1eadf4mr127696841cf.31.1779038997655;
        Sun, 17 May 2026 10:29:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c4683sm6281841fa.13.2026.05.17.10.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:29:55 -0700 (PDT)
Date: Sun, 17 May 2026 20:29:53 +0300
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Message-ID: <izj6zy7c4ec2cjbsznkaxa4q3hupwteqprjzpajjquwchwa227@mplk7d7uccz7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
 <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
 <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: h5fZ6VgnskzvB7NilIST8VnQV0k5kPmp
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a09fb17 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oM8CjG1BZR9KsnUa8EkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: h5fZ6VgnskzvB7NilIST8VnQV0k5kPmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OCBTYWx0ZWRfXwLGQQ64FKz+6
 RJERTrP/b/xKbV/1wEsMxJXND7QaFAgkjfFV4gUysrQ3ytqowh+YKBZNj6sbC6fwAW8zgmB/QLJ
 fCONfE2U8QCnh4wp6cyd/DxlKDLFivAKZRUmNEBLswskyzqYhUsNj9JDGDZequ/5teA+xk4V+Hl
 2o1E/AxFWGO8/cfNs9e3QcNySRbXRoyqfrdckUdNj8AwS6uU9iUpQDtc4mOsa45D+dVbBqMvIjO
 080kJUK24iQAUQntpIwvS3YND/OM843yDHUmageNvH8ww7Tj8V+hKTFw+FUpV9u+Lm7BbgBIlX2
 TjZmHxUjnqup6VExuT2Yt1sb2ni+A6BiHZXR8TUANo4LUyVt3feqUnjoSs71rCzyNVibe22xhJV
 /WKdjK3lsaInTcI+TF2/mGjWwpX46Svun2tGKU7Whn1hfTPzXj+fHEl1le3lTIGdKaPRnYcOvRV
 10Acx02DVeJqhnuX1uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170188

On Fri, May 15, 2026 at 04:48:44PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 12:50 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
> >> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> >> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> >> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> >> remove this write to leave the register at its reset value of 0. This does
> >> not affect other platforms as only Glymur firmware uses this register,
> >> earlier platform firmwares ignore it.
> > The explanation is pretty suspicious. I can see this write in venus
> > sources too and it was added in the initial submission, dating 2017. The
> > driver targeted two platforms, MSM8916 and MSM8996, so this write
> > predates Glymur pretty much.
> 
> Thank you for the historical context! I checked with the firmware team and
> confirmed that this register is not read by any of the platform firmwares
> currently supported in the Iris driver. Regarding MSM8916 and MSM8996, those
> are not supported in the Iris driver.

So, which platforms actually needed that register? The "currently
supported" is not strong enough. We are bringing in Agatti support and
support for SM8150 and SDM845 is in discussion. I would not be surprised
if we end up porting other older platforms too. So, you are changing the
historical behaviour. You need to document the applicability of the
change.

> 
> >> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> >> Cc: stable@vger.kernel.org
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>

-- 
With best wishes
Dmitry

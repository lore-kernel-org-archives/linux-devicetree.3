Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9E3C9EE0
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294833; cv=none; b=mdWKGfQ2n9ul9uXlqxSktnouF6jmxKfYk8BY6bYcNwgwbsbKsLNnlbSylY3AMOeYgd0EYpa1D+r7T5iWhteJy6w+0X8J4ZT+xoMVX4d5xRVxwq2qA/qeLzlQyMbFlJuNpzu3P/BSDWEWlwd1154NncYU+9MkrWtYLpeZ9tGAZoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294833; c=relaxed/simple;
	bh=/Vo5RdswgfOHNJuNuRmCqc/7gYBqdZHdOW/lFNmJNE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnGnrN/AaJXD1RQvSgc0nMbKJcNEYnszGbfUjbXBGmUFLmr5/mk1wNTBFK9Xgq2NJL09MHysfEicec9lU6yPVCANE3FOXqaTw2w6LRtmUFIkWUo/ZzU0PM5SCObwfxUu0qj06xbpgKpQII1Tn+bgYQJKxv6PnB0N/QwA17wW0g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6BEJ0Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJ5wGTVl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6BEJ0Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJ5wGTVl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAo62793094
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=; b=Q6BEJ0Mmw4PMQHaG
	cGf0U4RS6zQAh2TenqOqUpm1qqfck7uK4qCYtyGWHTdJzriENvpIoJFyKYRnDpgV
	GfpRlhYPBvDiEY1j0GhqovR8durrd+Rc8HdJWUgNouuncQ9v+mDMIcJu+2tQ/UAJ
	bhMKYBlDiJejF3uhCZhIL0De9CC1wXDSOe5lYZCV66cC2b5UKPzRQ72KhqN6BdOM
	NOQCVkrkZB5ya1iEyp9MBBtUwyw/tBCqcZmjz+R5TTDOA6V/sCYzO+8a3+papD21
	Yxj/Nz0YEeaye/1IyycN+/dzANbWqHSCEbBMocnKCQiQNjCdx0eI2x9HmRkM9mFU
	tjIJZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv8ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:00:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50de6db1eabso20519601cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294820; x=1777899620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=;
        b=KJ5wGTVlRmJwaOLbvjPI5/2XfU/7uo1KjMDgeL7b7bEO2IGncW+Z9JhUTpNBHJCpSY
         oFNgO6yQsHvDkJ+eT5kN02ghWr2M8DIEcZq8es9KDx7uC31vjQObwgbSlVNH/VoZ891S
         V97X8SC7jke8Wfrkbk60tMMwUzbD6TVsDXX9/u9g80EbiwtJBShcLxMl36sOQIqQLcuO
         VIrBeG3nEth2cM8YO5GXIEiWh21s9vPDUd4lIvsP3EooIMawVZkyA7NeItVhHCWNXe2G
         5SLzAmYE7qLKCNB0VzSLmmOoaGi6Yo0Sa/sP7m1197zIKz1GzrjatnonEyz7Ghw0f9eK
         FJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294820; x=1777899620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=;
        b=G7pXuRWFlWgSKz/VtBIBb1VagiDXu0mg+QCPA1icDdceafAT4+9PDK4QbVPproaize
         PK78Y8vX/MShbK3CjLh6m7rMoTdYhcr9gJE/DO2zjqbJ5FSEDVbj9T5qdwQdyG8V7uoS
         fqEM7lKAeb90m5eNQL4HwvTeF8Uk6/utvN5G8L7LwiCqGhMjQ6ZNyffa6KgjzU0jfL+C
         dszX2BK5UDYdRZH4ShBwHMgfjY+N/aho1xbZC3BL2tR16I9xNXAhYLZtIQF0Zp+BY/KA
         eyRP73IpCseKslQqq9aERBcieIy1UawwfQn8uFRv/qFnXW+3X3iQk/DrtNoFJ/MChopx
         iOUw==
X-Forwarded-Encrypted: i=1; AFNElJ++aQ2SlFW4hggdEbg2fqO9/EApnAqJFKAGvIvE32MnD/I+thHaU6vt68CgCIt6zYwd2Qzn0N5ZVUfY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3OpD7em0uZFMvsDvSK3ZQezSDD2OzuoEZwLG+xZjiOVGDXYcd
	FwL0GOE4hbXJmoNzXsCVD2q0Apg/ckwQsSsdnRariL+4H7NAQetQPjZ69dSN0jIuVhTrg5JtpNt
	Q+o2gaPCFuLEMgdoz6LodmGZdSV/cRwXquIYD4Ny52/8cTx2h5dmz3cP7O5CkvmD2
X-Gm-Gg: AeBDietqjgA2e4WzM5b5DD5Gev+tf89N9sEsYiFt1CS2JIjIpic1lX6845VrqADqvG/
	eNj7eSBGBdYv8KtL8Uc6HOUO2fMknkcVpfLR9cZ7ZDQZ2nf76K5vzjn+2ekVj3efy3FfO8hpL4d
	bgxiZqH2zlZ+Chvax2R13tmvdwTJIxutp2Uu86XKNc515g2bYaVY5fayEmpe9XCQQwtIwSMYaMf
	f4dtzlikCLQpZ3Lxq6CGCcjolJT2zhELD/+lNLhBM5n8+60sm1iJwIdz8cHZePPjku79/bSTU0K
	faZIOIqzzmhuDpblbvtNtzAQd+Vxp+kwyp6Yt8Lh5/OCTA2IHfh7jtMnk6LwXxCaMOr7x9rcoY7
	i3h8wYTJUu5nnGbCYZ0/qibOZIcaYceWVx8TcSjEZlHR/9HzpiFzjoM+xbf6swI8qYIar0saXzI
	F4JDh51nZMlGvLDQ==
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr408672441cf.7.1777294818719;
        Mon, 27 Apr 2026 06:00:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr408671681cf.7.1777294818137;
        Mon, 27 Apr 2026 06:00:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451ae5f2dsm1099761466b.21.2026.04.27.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:00:17 -0700 (PDT)
Message-ID: <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:00:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425105300.745044-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2MB1j4QEYDMhaulcUt_EXnB7CzBNQI_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNyBTYWx0ZWRfX6jMpqPQdgcv+
 hSommJju87Wz+XICYjHdi+UGIrlVs/iJk7Y0OF2/gQyY4FhYh+BKW5bWleSlt/3Vgfu/fAxZcqY
 pWe4b/CKsnsjYkR8yyHVnIlHF2F4SL7HShvKbZUJH6hZvLqqOU+p9D56mmgH5TQkYXAw+kjDZw9
 McDQTCxXcaRRv9HB4zPPCv4gZcPIXH4BRTOmrk+BVjRPk4gUcflEDi4+ItGQcQ0nkBdm6Ir6eJH
 15hd/pkzs0vP3ticV6MiYkPPlaT3td1qwq5mFnWJv4weg/FfWjV04J+GxbcMdPiPMqrQ/RbXe1I
 2XqmtDTD1UueoWlq3Nzd+K0wq+3YjRS/AYiCUh4IOi7NMsdmFU07LLL4oWgEbj18yH0z2f57FQ+
 LDJjmGENRodyAz2WX4DdwyIflUxH3Yl7gY3upeSLTDrVkSpJEeiP1h6MYxSEmTgA1Zx36YzrlQ9
 +p+XZuZ/ueRlRLaQFWA==
X-Proofpoint-ORIG-GUID: 2MB1j4QEYDMhaulcUt_EXnB7CzBNQI_c
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5de5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7hjUlyXiQ9dVm2DUhQYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270137

On 4/25/26 12:52 PM, Pengyu Luo wrote:
> Hi846 is found on my Gaokun3, descripting it.
> 
> Note that it seems that only Goakun3(3.0GHz) version is equipped with
> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.

Are there any other noticeable hw differences between the two variants,
that could warrant the DT to be split?

[...]

> +		orientation = <0>;	/* Front facing */

Please either drop the comment or s/tab/space

Konrad

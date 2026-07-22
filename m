Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669F346E7E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729049; cv=none; b=phYBiPDfid8/Qtm32guQUNNBTiTnEqYhlQo7N+gJ+CobxU4zUVN+dek31hTU5+HJXtrv15UJHB1vstmmzPi7kd8RkX151q1G3u9WMPeYmdyO9b3ZWY+hO+3Po+fb0QkfInnoWbcyHh5DgWk1t17z4dTZW5M/uBJMoH8qLxMXBfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729049; c=relaxed/simple;
	bh=vXRowRzjtjaxrwD+rji2hr2nDDh0fvUrsn1Nk+7jjc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fheUQmH3ta8Srv2gRXiTxBS2ZRFspEoktw4rjOzAUY/z05gbSjWV+7y/5nliVa+pfrpLaWIyJcgw2upPxn52d/juZABSeCzXgxjzpB001UbpNnaUaYsBiFCPSxQDr3BkA0ZDGyx8jKG6E69GewlnHP/7Aat8RBJf6RZKA/Paww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7+uhPs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ye7S7/eC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7+uhPs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ye7S7/eC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWit8860766
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jRWoVSO4ykvp/ib+Cr2av0mo
	9ut/H+oT06MlZHe2x9o=; b=C7+uhPs8U4bTkQ5F+4B4PNYp4shC6tF+Jc3mFOfV
	skKHC87TgKJSHWYnD0BCLZa/hXViOh9r5Erjr5UD8/MmoXPpYWgkTcKAfgZ+Rgzv
	q68qu6HMMSEmmxH6YDjt3uDjMNWkpSEMlNzNNu1En7loPQr3N9GEmHe9l0Wd5RzZ
	eVhSHtGq3vKqzzzprglO+TruUsEPAw/YVc5NU7/SYrPoMNLV80391ylgaqngWJnY
	OGNymrbsGMSPo26Yz7qQzBoWLu0mkIoV/323zWhV3CHxOBViMd0C9AF22V9YKnta
	Gp+jmb4Pt3K7qxKWk/+ou21nWNU8aloLukigNNj8bg9rjg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2gdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:04:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9771c8f5045so3191245241.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729046; x=1785333846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jRWoVSO4ykvp/ib+Cr2av0mo9ut/H+oT06MlZHe2x9o=;
        b=Ye7S7/eCwHCKP4kPuLMYFODk0zMHWKvfZRs84/3X+xEYVjn8zqMKiQOiXKI8UymqAw
         RPdtXqgSh4wWBB3f3MeqSVn1Ng//UCMeTYH+n1uXwiiUCuWhotNQP9EYpo55ngS8bnEi
         DxziBaRmhu/SrFvnrSRQpJucsQ7saPekIUmzWcdqOLCywPpa/iqMsdII4hgha3JKUbbR
         SiW27Ai4Hxj1nMb0mpJprdH40/xgAWqBU2r2n9szi6ceZUMP4FVtlXx3L2tAtLba2nvP
         EDdL5+qm0gr7snQ2zd94pZHGRkHjxP9bOhtCPNOeYzhOHVLJy2/yH4Vgt8chDc1OuF+1
         xyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729046; x=1785333846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRWoVSO4ykvp/ib+Cr2av0mo9ut/H+oT06MlZHe2x9o=;
        b=PY5uokw62V7L7DYLBuR9vQvf381Z2t2Cr8IJzIA6mt4x13M66tKNqUFgNpnK2JxOkp
         XZ7Vw48k8mbVpstoN1UZRNU/lBxoptTleupFhp3UudU8osK+CZrQ98gYqudho1IfSNzq
         A2ClDx9Sgw7PkB86IAKPRsqnTnEDve9bj341kP6TsAzREDC2FD5FzsF7AufrBAa/0lPv
         0WatKy2dmoFZfzdL73VIKVpiLjoWoIzUPV1AtviyOECo6aqAEOGKcYBj8tdrQyL5uJ4f
         yGJtdCyQTlBxRuTmd+OqaVWfqmMdE6biCxAbTU3QMjSzczyMgMSyfNtp/JEB/rx8h67b
         wNKA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw7Qb1IMiiJTKbaoreZIA42jIiifMFRY0VO+XisXOoKHAJu1nDI8We+C/0f8FlUuHPNjMhONiDEb6Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwCSpQfCPkTnOjAFJ5TpI4onDXq/exlNQHDrL/ZszXFuME9vi
	JlICguxs8Rwubn0PD+M1ht6QQoaSCgWhoB9/kgoE1jgSkEBy3y/EBoXSegUD6CTXu0CXRgN3wIF
	ROtVWaceQFSS0Wq7B0gqlcSkRt8zMmXEwNssvF764wsCIxYZcKB5uIZC6Hf45UGMoiERizbN3
X-Gm-Gg: AR+sD129WJWzs9v4aSN22jdLokvRlO5JzpxkxMXv/fyuP19ohSWL8cKvcTBVqtwU8wB
	P36y4RdMjBTVrv6pmSp0uI4BSAnxulKrUjdJMsoP2AtshfTCzOzst3VQBTXDf4l//CPS+fvHGsK
	25Oz6cdhgtYu/W8Rb4W4VIkxkdvraFVMTez7o5ti0/dS6TuinNSNYtdWQk5tngTQCuWuecnF/VM
	5H1ZpkRkYbfDC65CXplo2PGXUVw8xsQ65GGomMIJkd/tmKrwOYPv0h69hnpp0ixPOw5lizBM3xZ
	tvl0lpNxWGMYjzo19uE3CFsLhR+N1UDvA52iQx1eP+k/xKarRLGL24qVaKt6/k1b5bmLrIX8VbQ
	991nGro8bn5vMEfPkKm6+QlS6xJ3VeFh36TuBX7Xs1hBd5KrJh/hvNHIu0DYRe2AVIYx18HvdYF
	U9kWhHGlDjsy498A==
X-Received: by 2002:a05:6102:6a81:b0:738:a8a5:4c89 with SMTP id ada2fe7eead31-747536cc599mr8709178137.18.1784729046596;
        Wed, 22 Jul 2026 07:04:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6a81:b0:738:a8a5:4c89 with SMTP id ada2fe7eead31-747536cc599mr8709058137.18.1784729043791;
        Wed, 22 Jul 2026 07:04:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41f9esm4375821fa.26.2026.07.22.07.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:04:02 -0700 (PDT)
Date: Wed, 22 Jul 2026 17:04:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
Message-ID: <aimahyy7gnnw44pdedtt5xovq7nqw236fb6hwsm2fqjzagmcm2@7767eiubcdz2>
References: <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
 <ag-NLvh4ROgTCs_L@baldur>
 <d4001407-cdb0-48ee-a138-87c94b5dab01@oss.qualcomm.com>
 <20260702111737.2qtjcfskulav4usd@hu-kotarake-hyd.qualcomm.com>
 <5d5c693b-bd07-40a4-aea5-d9e1884aac50@kernel.org>
 <20260703091319.5kcsqjtx4e4rshsy@hu-kotarake-hyd.qualcomm.com>
 <7c7ab43f-45c0-48bc-921a-8820408c88c9@kernel.org>
 <20260716084850.gssw67izy6vq36tg@hu-kotarake-hyd.qualcomm.com>
 <alltBcYWULOv7nEv@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alltBcYWULOv7nEv@baldur>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60cdd7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Hma63FIqJW4f3ALk-BsA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: PvG8yZOXP-AO83HweETCa9UoKUrKzVYc
X-Proofpoint-ORIG-GUID: PvG8yZOXP-AO83HweETCa9UoKUrKzVYc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfX2XD6Aw788B9Y
 CrqrhxOc68eWSMiTLkJu6dAm/NV9Mu+rbiYOdzdCsSveTlbJQCm8a3eYvLehHcndv6xdDPpcSt2
 SJLf1cJuuHIL3Z9DJZe+O38zeQdTozs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfXwlUNhOZ/bOe5
 +3G/S/1iSamq/em/JTzCp26gNlAdCNbqkMJ6oZwPvszt+MRBJ0RteNp55LRNyJdyewaj2Pj8yw0
 cUwczEzmc6Hqilil0jp15azZ7bOGtceLs74vKqHwYlBN7OaEn2G4AWEKTlXZP9SDtWZ0fSoTjP0
 QWZTSS5oRKOkVrmuPX+cRGHBxXE2iMPJs5nM0Bar2EubHiDcYcJYg7kymCG2K2cCKr5avTPdZJK
 pmVx+mR9PajHA0GVHQSiAzLlAkDwpRVZF7CRP80oMt26TSEygLR25YKwWHF3cT4smwuwOoYTJHv
 +aMCrEJqgwTKykvBza/Tb3Q856jH8PQIc0Jkr8gfk2YqwWiR3oUuJz4zT/o5UDIHAoX3F4buITI
 PYb26NAlIBcqoKSAiGuxEFPRYnLkKazbcsCVJW1l7GX0veXF3D7HStkrkd3ZJBEwEMfOtsksfK+
 6q/iI5J6FE8CPXO0RNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220137

On Thu, Jul 16, 2026 at 06:54:36PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 16, 2026 at 02:18:50PM +0530, Rakesh Kota wrote:
> 
> I think this is similar to if we had a discrete charger block that we
> describe in DeviceTree, we would somehow have to describe the
> "configuration" of that component.
> 
> But I don't think you considered those other use cases. Perhaps this
> should be an optional qcom,battmgr-interfaces = "ac", "usb" ...; taking
> the list of interfaces that is actually implemented.

I like this idea.

-- 
With best wishes
Dmitry

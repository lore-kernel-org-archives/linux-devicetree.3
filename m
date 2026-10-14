Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3E640EB8E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967073; cv=none; b=b9zEYdwGGMemaaxqjkihPY1OdIaCk/0q3Pv/bQnQ8iOyPtF+bn1el//geYAx7dVz6pG1x9sdRL9oj8HVT1L1IqMRTLGT2NGx9lD4NxxhIu30rYz6Gu9Fu05mLm8/Mm89c0M0uTyMApVXmHEDYxfhjzqoJTyz+oPkvPE/PI9lB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967073; c=relaxed/simple;
	bh=w6i7lW/hwahzDmlSA6tJQSUGt6IJk5yjdUIT7PvGf7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRjELeIwjWIBnvFUe4Hk4QN/oUPaED7wB2k9H5VdwLUfWYFfz+SBdi9NOB6BmAxJSSW3Mia/AmZ/n/Hwbdh4JWZKtjpJqm0iaV//5wbmbTf7IADDSjQL7ZfmDdTLqVR52FQR6j3wP+AjJumueHx1VEQubcVnlB5svwG9P/zOO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHTLEYrf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQlcIwuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHTLEYrf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQlcIwuG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663ND3365337
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/dO9wEXpKZ351zph6knNuG++
	0aS0MxQ81WRUeQ8zWvw=; b=nHTLEYrfHkTzxG5g6MzkDShNgP/4lVqSYgfELiBT
	B5R1VgO4aXByJQP28PwMmdaZwoWTRpkcGZfo0cLRY0f8OCoQxAxNNuzD1KFJFp91
	PSXPp89W3fPwK1+nckz0iAUDtFL4zGGV8K5wYdRRVOk/+F8UzDVEQl15ASgMHXiD
	f5H7/mSYutVG4ddfhKIiJMpvdAlSNVSwhOP7pNUsN6WgiF/yr3HfFYAU33Znaq/V
	qruLhlBgHX303zlA9U1q2DKk+xbvYH3nF5mb0I6HaEXohPgfD3c5MyhOTMooBZ1c
	viPyvboM7W8fvPsVsPSdaesN0IvxGGM9jmUMGFzH15kMLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620kk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:37:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338c59f90dso13604281cf.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967070; x=1792571870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dO9wEXpKZ351zph6knNuG++0aS0MxQ81WRUeQ8zWvw=;
        b=DQlcIwuGJwc56Z+nXopZ84HFL7hyqsnP/ciBPYz9jEWKvXduYZbeUT0KBG6UbeUQyL
         R2chSim7kRnK4S0Au0E7t87LLcN7KVwjLuZlBjJzBNql8Is3FKnPoyjbCQwtHZLvaC12
         SloCwpxsc5dkbglUdplwPWep7U7werOtlYfsVjoy66uth5BGEPxQpT787gVhdZHLma0H
         38On6MBu39W1qznKuLue4dxYRlWsVfIq6r6kVBl/7L2KTenTz5EvAbS37uc7yPGWF+46
         IqiawUK437eRcJei5qLi3hq2xkJppQ4HDd5e4tzvFsA38TyGhFP8gHkzAw8OqSBTDRBi
         3RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967070; x=1792571870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dO9wEXpKZ351zph6knNuG++0aS0MxQ81WRUeQ8zWvw=;
        b=yt0kYfgO5FBaAPxunRoifmAK5hRIU2GBDdpl7WInF+Cx4x18EmRTucXA9ht5xV9YhV
         XMfjJ5en1E3EAvaZ7HOIewCvPbrvzNZbtOedrN2zxklJizE6AQ0yc29ZPlJTNib/keqe
         gHiHU+RF/7kdCIkG/5sLoKnhMoOCiJkEM3wDkzXt4JXoZK6VuIiN93V/0/Q3ws8WN+7J
         5v1cmncM+ssbiXWTNpRzDeNGfwSN4EHTabVqcWxm/d+Uq4u7RcH/nF9eaodjqVBuGZeB
         jiE7h28Xw7SSO86EZXCzKdJd4o3MXLKMrjuKfuAt/vN3s3lAb08aegpoDfHP/hywxAEd
         rNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9RpEYlSp2eeFHNntqByy0nqX03bDcN75F8dQix28caUslYhKI9AX0aSIgIMeiTyabLxvGTyrCv96v@vger.kernel.org
X-Gm-Message-State: AFq9FYKtiP8AjL3KsFmuCmJ9XlbaWVQ8k+oUS9YxM7Dgg/+zIG4CZhuD
	OqfBKxpekghopZNZK/WhxN9GL+rpu1oISKkicmYegt2xlC2LCr3s2a3q2UvyYCRSwEjck36yC8l
	3wFR0l5FWhmNSe9MxUxBwIMklbjzVMnjrfkSB6BgGYWRlSFCGuAZYv9KXrpU+a8uC
X-Gm-Gg: AYBFou3qgoHB6dLQ0ExQzhJG+DByCDlMIqNsmUB4euC8a5F+wG6nI4zErPVv45Vg2ky
	xGKziTDZHpAoG0rqlz8AwHHz02/8zk/+2oH+vAP6vdi+pBfaO8NTtIG6JRFKy2mYUYP/+yeq5qh
	cXj1y+FntBro0vQ53mhs6JlYS2TuXFekscD2ZXS1si2QEQNUqaAwKsY3Aevc0sgFnVrM4EuNIkH
	IjJluwe8bb0mXLL5FiHsPz+uEav22p2kJWDL4MZhGfBTdIu6vnx957ChrHns8aau/omCz+avCZ8
	dapShV2/8lU2F4ymJJemM22AHTT39+zE8Gj5DCveYde1sJm4aJN8O0elMXXuMttC4G4DsZDkwJ3
	+5+Zrj05f78ZprZXJ
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2481091185a.17.1791967069962;
        Wed, 14 Oct 2026 01:37:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2481087685a.17.1791967069285;
        Wed, 14 Oct 2026 01:37:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm767149055e9.9.2026.10.14.01.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:37:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:37:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: yoxcu <mick@yoxcu.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt
 through the PDC
Message-ID: <juep7e5qyp3fnlet2r5fqfeepwbkmhhaey4xxy46s2rfsjtg7c@ax2q5tionsuk>
References: <20261013203749.3078262-1-mick@yoxcu.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013203749.3078262-1-mick@yoxcu.de>
X-Proofpoint-ORIG-GUID: 6XJn-tEwsanbcO5Qq7TIih5wHz8VSEL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXzLRkDh2X6oHp
 aCKp7+sVYHPpWWXEAxeGO+2rEl4wz7UvuxZ7GpLL/GForJsn+nqqLUPLzTFXDZzJF8hsQ+cT/ln
 n926W6rgIa79Ohz/Xv0TSsKJUGR1uXf8+xbF822rOTUS+4Ns0TjrSdBkGGV8ShV6DXSbu41Os9p
 tkwFavqw5wyrfwBXZwipOnL0uFySYXRFKbjvanDxJ+MTUQEqoqnJ54DQNMprvynGLGpAHIxa/cK
 sEo0mE+NH+L1jWHY+zrJrNbAXyoZZTfU4YBEpKfXjLyxS/8Rp6dv+W5e2iqArt0kPWaexYE2pin
 jN6HKuRYE1089qQUW5w2uPqF560WxTMyAvQP4goyvl1avUsNcYxqWKyc59dj6zsLk2KT2lIxEVv
 SyxMcPkvVnEgtPOvSmPdOVmF4nrOJZI6dtaWzcEz6dyF5JTk7Bz1Li1gIt47uBsP+57ZOJCYOVA
 XlhBqbKfsgyOfs6zlyQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf3f5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FxBUbxoBbJN2jJ9NEDIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX61tknt4OYXLI
 CjQhh6pi0V5Ri20bMkjJ+GtxTWkPNbLgct8iquAIN80rFATBwFv7poQpZIZNMLfKzyKE0ARqsWl
 GiruPZf5WjC3LkkzeLnnJmvRhRqDaZs=
X-Proofpoint-GUID: 6XJn-tEwsanbcO5Qq7TIih5wHz8VSEL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

On 26-10-13 22:37:49, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
> directly to GIC SPI 481. In CX collapse the GIC does not detect
> interrupts, so only interrupts routed through the PDC can wake the SoC.
> 
> SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
> sm8250 and sc8280xp already do.
> 
> On a OnePlus 6 in CX collapse, a 60 s RTC alarm did not end s2idle. The
> phone slept for 456 s, until the modem woke it. With this change the
> alarm wakes it on time (after 62 s), and the power key wakes it too.
> 
> Assisted-by: LLM
> Signed-off-by: Michael Auer <mick@yoxcu.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

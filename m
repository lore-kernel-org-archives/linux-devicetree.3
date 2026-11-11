Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402102;
	b=wti6zT+ypIGUHDz9UIqYfodJ7KiE6bUIGne9p9XBJ+QO+4GNHQvqJDyb5d1wulUvo3nS
	 zbDsdpbOAQxTIpDQ5MwRnu5rWEGE61PUIuaO4mJJCgGPM51jXvk+dQnTAx2GuJeyZF4yL
	 AAluxSq7Ap5UIrVLdXGn6JK+d/rI+/ClsEJrXcYr+TsZvxrcQO3f4SFokycYze8lbcYes
	 xDUvqch801ElM4HUrMivgd4Ur7f2ANekDKrmjNDVZvtDDLLg4QzxQd3LA/kkXc0aUt6o7
	 7kh9B7fXEhnVZovTGpcexgi1m8BQ0OBzI5BbDljDFvO2bUhorFEm/iXGPgpM086vArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
	b=R9FUprVSih39SJu3VfsSIYxk8ecxSBm/iUfaSBkyMPDmYNTOhhskxTguWwpBlUNkelbS
	 HEtvHtmk9iJApqgoaB/6taMCl8ZAVJN9J5G2Vf8XOsknSQlXRQTQnUtl4UWFLYNlEaP5n
	 Fbn1LAiJKiR/04vq1drRS7zKRIQPo09nPLOK8BCD0kCLgceYKSseyOtJSdj6KtU0XXkmO
	 ixOhndfj4ftSGaeOnvT3unVugMfGI+a7d4GqMNXm+uKKT/ln3dSpsB3ndUgqbksmNM1wV
	 zgom0f44cple12JZDIs4FcjuNC+9/GyaZ8P59z2/w0zS7lKcJWVJgriBa3JzgkuA0Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF69606A339
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF69606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ8Df2338385
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fNNA5DINfFRpf2eORoYgUUVl
	bLJUUgtkmYcnEbAYKiY=; b=p6q+meWfh8pxTAsOPcNqXBXxXBRbH+GJDC4uiwKA
	LJ5hYTCU3/k1FKYji7ugZnbHErDA5WuhE5KzDaz8lgoup47Kf0aitPgAEw3rW0lp
	tMtswTpUYDD8q4tClQtiOBprE7ZUy4pXagV9SgI+lMAfwYQfVHVebO5KPPIcUnid
	chmnqaobA7mVsL+v/gdx+NJL5U1KFoj9M4mB1lr2ZMcQaWN29IzteadEmIgwVhrK
	EIpAcU2xW1xN36ygYXdO+5SKN19CrB5t79dsRs5D885Pvk1tYO8MeB2FCyVs7Qv2
	wejjCK8v+qWke5jhjykBYz7/jQCHfyyuSVzlG19XahwgNg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmapby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:01:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece3cd5a00so2423217e0c.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402099; x=1795006899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=ahN0AjmkD63PvVgeHmTW9R+4V623g7CKUjFoxTx/rILg6XoSPLCx7vdHPmEiblcs9+
         OXFKV7KwAzlj2DLe0CbFaW5Bl+jini2AbY9yNuUlleNQsjl8UoD/rLmNakZWu011wDRz
         38XM8LokSGsfwigtXiC7FcGwIKOc7I2XZxri8d7jzBWcGK4gC/ypzwPsIgP4XWflydYe
         RvqfloJW/9ugMzKTVIOYs+R/w5gem1fhgrJt9duQl6Q62scnAmDmH8VUXAEEpO75agNy
         j8BI4XUxTGkuy4yAazi5PoyFxyec5jlQglS9mkW6IXcVyjrruY5FmAnPRdATuGlT8Bjm
         HNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402099; x=1795006899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=vci0irdbyggtDysBPbrUXn2u2XjsYDlw8K/Gp7Q8TJlaNT3U9tEBWoYa8UvChDuRDy
         RhWfhFayVlJF0Dinyinq4+SK7UkhquETs8qxLmEq1VAc+Kdy1MJCyaCUj1CdH0GAjw+j
         4AN/mQJqcjVt4AjtOPNO5kJP5W22R7kqYW8FmkiRJmh1iKQWd/kH5wPBElYYmDUsFvRC
         AEDg/5LWZcM5CWowXEDNZGKeZYYoePmYP6hs+pig/jzPSKrLmc8Hc4DuTTgcMmSsZ5uZ
         OiQvJITMFAkv0qwb3fCAlAY8DLyD/XrDVyaFdYWx63hS2BzjM/i7cwo3pG1LE6RY3Z99
         bDSA==
X-Forwarded-Encrypted: i=1; AL+hErGAdJCBoR62qkB6rbxMC8uXiqhbkXxsAPeO4BVxKLT5nqXdjACQX4cOa5xzca5q6Fps2vyoTWXOelOy@vger.kernel.org
X-Gm-Message-State: APuU4Z+5BXaFdAfJSHb+9aBmCwtfTjRDyGYRONgccF45DXw55XF6CUO8
	gEJtALGgK2RmUdZexBIQZfY0lUQmaIlae5s0dPTc4pY0ro3d8wx+kQ1znnblF4Ra0oG+Gwd9Exy
	UyGHX/G0fRe9GyqofCB3y6X5IjDzeKDZd/vpmyqraS7ef8YpS9e58/Y06VZn0UtCP
X-Gm-Gg: AYBFou12bdVzhd8C+qKaYgb0msuor/t5fuenwWyGUqSruxYn9PSR25A9aijzm5PwGSb
	vwQHRtpkv7FD2SlTfL1ds/TpOQuP/2FZr4WlGM1Q1JYjn0QkxF0qDqOIxFnfPU0mW9VtvPQ+3Kt
	TDy79vtcJLwOdTnXslYgrUaYmGKRNLXvZs4vMMnEnHVYMNUrCXpz2jZOLLUzrW2wQUB9zjll3Rl
	w3Mh9vRm6uFxwE37Px5SdJzBdGLtJd4KqmkP92g1G9/yqQ4+alX+gFxV5LV7kkzgxOqOPv7TXIP
	MPj17h8+tbZnxaGbsrY4a4kucIlRiyq1AV9EHONCDStK6hByRg8J8xDYeGDLp4mptKrqUZ1LSx/
	xthBX2mMJnZuEqtooNZYVy7BjCOySOhgRYz66lBBqkUBIlgfAEeFsyAMTkXFsg10/FxaY0wCV7h
	aKA6UOLD7VKZE22lRTbhKYbTpQpshnLjoohKWZEA0cQpz1qO4z9QNH+MLT1VGR5Q==
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672587e0c.8.1794402098897;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672510e0c.8.1794402098347;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a657sm947505e87.11.2026.11.11.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:01:37 -0800 (PST)
Date: Wed, 11 Nov 2026 15:01:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] of_iommu: add support for "iommu-ranges"
Message-ID: <h7j7lyl6d67xfdw3gyabfngpurumbqd6fkcvuhyi4juashcx5r@egybwhfdaonn>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 938ebhw40EDvhzSfm3xUlFZgryDpIVjj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXyXOtMDxpjsvs
 wNa8z4Wgt/Su3ZvW8mETKF6Q/DhhBuoTX2qq62p+Epht8MISEOjxwLQrSER2ebepBBwLIx7QR2A
 tkH5EPnoWPNSMICLuC1kSQmGcdy4rAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXwMyz0+cQFuPB
 vhhxksfvjBG30izofTvCW+cy6lvJ3Ey8zA05BixxWRzJf2noz2SvIb5ZyQsFWlt8O/4zZIQ/Omd
 NsXdWo3vXQ8B3RnxjeoInRiNwcQiRfobTBNRHawftLI+kqKETowKoC4ukdwE8p4yYIi7Bb6pJ0Q
 g+And89BKms99if8lsnnW+wg2kmD0o32vytk5SsAqs1xFiq4reDiD8Z5a7OubWr1t7dd7Y3X4jA
 U61EBNdPqzxOq3Pi5l9/xkSCmWpRrfRgIOzYFjl81bb1+5vQqDfP/0Z0uutGHqnvHMnBbdtcZ7R
 llBNa322xz2DSK74eREJ+sBWjVvZlYRiPnZ1gOHKnL4b52QbTlQ8yVv/I3Z4SLxmauFJnY9Kq6o
 k1A5RCLrc/XsNHvNdw8CactIbL3kl6DwWtJROSR3IhOtvTUI924ljt5EnYlmSeATe3wiRB54od0
 dUNOOU+V+ydg/5XRNBw==
X-Proofpoint-GUID: 938ebhw40EDvhzSfm3xUlFZgryDpIVjj
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af46734 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ycv8Z8E-TvjlFfbjzzEA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:23PM +0530, Vikash Garodia wrote:
> The series adds support for recently introduced property 
> "iommu-ranges". It adds the required checks to error out for cases 
> which are not following the schema definition.
> 
> Iommu-ranges was defined in schema with this PR
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> The patch series is being posted as revision v6, since the patches 
> were initially part of the media series [1]. The patches are moved out 
> to get review comments from iommu reviewers, which was otherwise looking 
> as a media series. Happy to move this back to media series if anyone have 
> any concerns. 
> [1] 
> https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

FWIW these changes are also required for the DCP display controller to
work on Qualcomm platforms...

-- 
With best wishes
Dmitry

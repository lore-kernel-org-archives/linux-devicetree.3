Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402248;
	b=LoJq4/XOsGwgfSJUfDsYNzhkxhjgoHSZVzVnDhtg4fo5UAnRdf4+LgChUcWKrR5XilrI
	 mfJx7BC48GXAoLyq9LQwmx9MARfjDTkMaoma5tAb9zKl1A6yjO9SuGYSf9aAqFgNPC4FB
	 HIlUN0QBwWSctHQYuzEIF6oq64aXCawIJ85mS8iTElsXP8DFMM7E5ZoKmQxogwMu0sUlv
	 hdueQv+OekGxuT2ibqeqUCNQn9YB3gFmxW2qRUk66S1g/ZTWp2L05FIB6SZOUJfzdJQjI
	 n8XI0W0E41oIU63y6rStW5bT/yByeOWzL2UoNsrj5u0gsu8iCt5TRFEn+RdDZGLg5fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
	b=PZD7QbomVkzjhgS8JLGJ54VeeSbNrYDpgXjeNXUO0xB4JcSkFzEODl0f9SmM3TABlpX4
	 INtXur5MR0dhzQcajbbkDgKSpwPRKKEyV/1Y5VApws/YTyKgZFlTgQwJr2BNt8TqXKx2R
	 kidpQY28YRhb7eq7pNXTQIDP7Yh3HZw/yY+FdhK2cSZ42Fg7feg0GTFV4QvJx39ngW5aB
	 lOYPTw741rCO+0/X3ySUu7h5EQgmjikFD+WelhUstQmt9SBdkrH8zmEYSe24bTPdj4Y9D
	 pA2KZ5hGunw9qO5nY+arZxMyiP91ED+i9coylLHGWwsU13tHxwciZimnNI8dQ9Ee3hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA5606A336
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95FA5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYwkV2356537
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hXFO6nUxnCW4XbKSEmI+WWHT
	tNiBaotTU8OUh9DkrJ4=; b=ZXQgzpip5uTvPSftHjwaOcUkWjomKAoZGLBjeYPm
	o1VQ1fRKMILYH+E2uFvWC/UqY3Yc/4Q4Cqy7cnrDFiv4EcuAgnTv3xA+bwMUFWPo
	TOKcHIcBcPBQwTeI6WiNqonqVAiFrS98rjxib8gIQlgalfftVkLQgbSl5+8L9hzN
	2ojK22wdT3LQwRit1G1MrsSzRYQ9WRi5bskOADsWRZ+IDlHaN2bK9DM4sO2KqbBD
	n6fexJdluRTZPVh/Q0Ax3hc2fl3bhyCm3VDwbPe0oGwC43BtkpXpu+dDgqGY0ShZ
	vKLCnaMizQ98DjuFwWT3CLzuTlwV6efLjINJtlAuzKZipw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhwwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:04:05 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac41ff334so2899972e0c.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402244; x=1795007044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=CO7diadGiAttY4E/+4kLfuiiHeeRkXpOKDBR78nRQSn4cnlrP9f1b9i+N2TfYtUXky
         kIzJy2WJ1U5w/lQigNsSxgKmsJj5aiH4B8jdQZULkDn+lDYTl5M/6uknK9yI0Y+sNDCb
         NL4aJTRvkWYeHNAZ0PfxZGLAsl9Hu9qsM2o1FY/rFEpYxmvpwxOCMfxib0kbz1iLb7uv
         C8WFBxZwecyQf4UUfaFt2qCHsh9qOWo8GaYMoYYxKbKkRp7nVSX++1qKfaJfCI6dgelW
         4KvAQCMMJBQClZr7Krz6jJR+nDdQK0fEdTLjTxDD3sOCtsb+1+B42veaMJZ6kyKt1j/p
         tG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402244; x=1795007044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=Rd3YMd0JKd6AhR8HrXqt0kjNvKnaHAUIDpnvko59bfguzzTHyrZ0DkEXHQzxmVKqdP
         ECT/Eu7LY5drS9U2s79ZFViWmVb5PTiSlSdcMoIDC8D/Jx+DVRlCreRejm6R2qf76Jnw
         PyHdb0FH3bBreT+sVDQpE1xsKRyZbZNR+uxltLR8CSKZAIzFoT0UyTvVlDOEWLR/rUoW
         9uvF1rGGTxi+rpg39T0E2ZkbGBQ9yOzKZinYQcWXyKesQ9EjU/EfpxrZv3JdDipCEcaW
         gQOpSkF9ZECjTvwphqhMHRpJnUdLNzBFAZIuPj8beuVXPg0cWOvQVhA+k30v2yJu0LKK
         WrpA==
X-Forwarded-Encrypted: i=1; AL+hErGkn61pjx1enoN+73A4sqi93CltEFagH/pXxtqhT5QezC/ol00/o6+/Zt0zmdX8bO3oYBKYeH7wR8Qm@vger.kernel.org
X-Gm-Message-State: APuU4Z/DMoEsUV+gU99lp0/ejCJtktaK/0e1ssxaRIYMhio9w+7Yxcex
	l/ii4uzeIC4pq/aPz1u4qEaIC6ByTtCsm7Z9m+m87Gy4SKT5CLb+83ZvZ29H6PYTxZWaR2Gie7e
	WNDS1s4CW/In+ha+Vk1BsssakcnpFoYF1+iEZEjNj+JmVhBb322Nflk3k0JxNe602
X-Gm-Gg: AYBFou2cJzdL65a9t5ljzt7Lxivoq/4uvJjaOWo/vQ5Xcs/c9cDN7mSuDqZnRDe+FLb
	5jVutvmtQDpq7fL1XEdp1dLQt+ePtvjDt0KtrnKMpOYY+d0TWvaYjqex5+jJjpI0GAQFM6auci5
	ywgMJ+LwK1Y2z4y6PeSS1FpoT1XiktzVgi/8u6yPvyZhvRBmUrnCLxYnJEYEgY2ZE+fvn/yKcW5
	6/KWdKpcWF+KvGz/+dx/WIniCS2vyCBOvTM4ZaJQ+N/ao/OgKbq7I0+4j5K0mb2UgCZ0XQvWpk9
	oKTqg0d2lvJFNcROmVApHNOmc++AgnhDsRtaQPoKJYKnjqAfQgj7ap95ksSWgat295GZju0HT1v
	92Tka5qZYQuLBCxsaVH0Tfs/aZzzc3GF39/cCxf2SDtw2k8MN9demnPKdqpW4Mp7M33P68sgiXp
	Dsnch9FTTrDe9y2Sns14QkDCi/4YyNorSoRyl/V85sV4WA5baJGsOCusn3WuApSw==
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604711e0c.21.1794402244013;
        Wed, 11 Nov 2026 05:04:04 -0800 (PST)
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604634e0c.21.1794402243470;
        Wed, 11 Nov 2026 05:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb758esm944566e87.67.2026.11.11.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:04:01 -0800 (PST)
Date: Wed, 11 Nov 2026 15:03:59 +0200
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
Message-ID: <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af467c5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=icXyEQzqa7ihQCE8Zv4A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: UGrCO56w3oGUEShKTijKgE6poeWclZ-o
X-Proofpoint-GUID: UGrCO56w3oGUEShKTijKgE6poeWclZ-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX7loLSOzsXka0
 FcdnrNc/3c73sDWDnEXdVnbEYPA+2ceTLsMPvfHm0BSvg4wfLE7GqTZXHg5OvYcgdN49nJ8rQ/d
 p32SxgMBRIp1np8vJg6pc9ZayZn0iNfiu/Ez2HGStsdEV7K7ccRJzCWOr3FuNLj+i87+iF+SF3X
 EqxGJG4a04NUmO1GDalHu7mHCsKOh7FKJdKE4ToDqn+IC1eKwV/9SrfyEMIS+0XMnMisw+G4eVo
 zZyfR2gCUCab0PXAFOtDssag4Hk1I0QjqWZpGriHL8HReg7T19m8qiaZAipG47A8wei9DVvNJSZ
 ZQrD65kO6giwmolKAzn4DDx6dCP816woQsrtSbhKKaxpCumN9ORXG/dlsSB0Jgyv5UK+2qPLT/8
 VAJCTEoYBI3XXkfFrfbGikDi9pphGX8khj99jVMBLD+Abahr17U4Sgz0iITt7yAt5/Q0P+rlUzP
 J8E3xZXQ9TvDRKN4jyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX06vINQXQczBY
 JSsnhOrPnl0KmXr/CUDIviT6MUQIq0vg2m4E5rRZv2GAz3kKfv3sNQDPNirMl3S//D4buxyAWjt
 9WmMKGwGQ+/t1m6w6QlxduegR2LztwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
> The OF_IOMMU code relies on OF address parsing helpers, but the
> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
> annotation to handle configurations where OF_ADDRESS is disabled.
> 
> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
> preprocessor guards and __maybe_unused annotation.

Why? What's the problem that you are solving? Why is the current code
bad?

> 
> The only architecture supporting OF without OF_ADDRESS is SPARC, which
> does not use OF_IOMMU, so no functional change is intended.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/Kconfig    | 2 +-
>  drivers/iommu/of_iommu.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

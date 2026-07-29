Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0543F927A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309647; cv=none; b=gWwbfYALFvDLKFd8kgkUWtdePhrfhnmbHetEIHKL/xOGvVzP6c0WmfzbOPJcRo5Hfn//0F0m98mYTs1LDav/ooqXP9tmRJx1uinC/UAXUcHSo7VXDJBL6mV456ODFf9DUXkg8wyd8a/fi2vTtj+gKtaBC4TvHRR0qR1V90IVN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309647; c=relaxed/simple;
	bh=F3osq0NQLSA1IaSPhSx8AeYk1CenoWaLoKonJzx3tfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4U/+P5OgvFhfuXjtl9KNdgynGWYWC5XE5J9J0QgPVeMQ37wKh7RIKTmdhOqGdhPdgkRaqT4XRQhIDiKG/myMrexxEWuh0n405IMWuJ+ObT4TPaX663hcyma6OP3U0+qO3jFWUZ+JRP/CaqIKbWF1KjJkph3jRNQCH/GgbPpCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VanMweZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNz8WidP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VanMweZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNz8WidP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5hprI1099248
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/DgIWD5Lly5mly0/f905YXhV
	vh1IPuOymULqG3vH/W0=; b=VanMweZkX08xlyvYO4bmHTKWP419D/58OYFGnOgO
	SCAh43pGFh/uNtg7nFiBAOt9jzQwb8ZNuYCXQ4W1fyAakMqSXF2h6dHe1r+2THF/
	5hT1u+M66yB74XD/VTwxHJewxHRJkH3Ha7pBkkXIk0QVlOnfIADLMjUo9OhxB0Kw
	iJPHw9E97MKJ+ZaUiaHswLMGExy3d6tnm7YbdfWC68bKPaw7m2Y3hZzHMwXu72rT
	J+6s93sYQLmmY3XpM2QxRBl4q+pfhCED4daV2yfkbisZ8MXaq75z4IvspDepHUmO
	E/5gtZR7nlsvvUqqhs2Cwtpv2NGRwhVxnpVvRVJik7n5Dw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm8c67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:20:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so665412a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309636; x=1785914436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/DgIWD5Lly5mly0/f905YXhVvh1IPuOymULqG3vH/W0=;
        b=fNz8WidP988SCEE9QrqXvNxbpoCV4dnGKSOZTyV2cZZpWRmV55Evmp8R46Tl8H29sq
         7sNxNiSQ/lMu/B6Da0PppIywOrpDeXUAqGotnP3gJVdzZm08GbGc7nsRv546e9U1wFhQ
         OBu22jmgxM9JW34T1rKg7dnKbGLfIAdWPSHkUE+MIULDimNoUD1VMjSeTB+wUWY2d1Aa
         48LVFVIAZAIEjMLy6zDED0nl4Pkx/wIg384AYlPM8ggcRUfA/J6jyz2PNORx4kqFzpgX
         QcX0wagNoFN9iD4slz4tEtHpcpnM8gNuy2brll9VpSP1/wLg09GyI0Dnhr2z/dkT107i
         xfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309636; x=1785914436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DgIWD5Lly5mly0/f905YXhVvh1IPuOymULqG3vH/W0=;
        b=BxambFKuKdP3KDGAbCZcvWxPZaZoopmqCXQ/QqvpFikIPlNmta/KCIvuW4gGPEW3lD
         jssW9AwphHCQl2WyyzI7JP8EZJbkpR5C+ZKOx/qY3IxPRHjtSNFCBEfRiA90EFQmEtpv
         6MiU3GkhAY5T3y9oarBPKCEqJLAIMGH6e2KbBZZx5voPzkUam5eBfg9QBEk8a2NfpFBE
         cxByOUZRVfLmzG9PXafhaod7V7Gs+nXX2kZCEKrpTJFELcQdOdAsHfTZWTveF/SwLRq1
         x3+nQaXwNelqhNkHZ2tECHC7N7e6i+qHmQkAJxrCQM0yPXJRkRSR9FLZoxehAvQ7isio
         IL5w==
X-Forwarded-Encrypted: i=1; AHgh+RrX5aUnvR5Mmk64BcGMdLny1gYBGvhDmC2O4nmzT0MJGRq6fSJXfTc/6CPVK+0NEcno+LWcqbJUUfvB@vger.kernel.org
X-Gm-Message-State: AOJu0YyxeaQ0aM82rkxIPVwmQAJi1oPxae5qfd/iJiVtXcvBP87pMJvk
	dCMAIGh6S8qIiGZVoPxLGEUWm/Dg8iFlVRY2Nh8CljYhAGx+0DvGnmQImMx4ibq8yDe+ycw3fqK
	y68MpK2YAfKYivFd6Y2kYaPQgmRQh/O1YKaoAFrlzrgVyZxteJic9wqNyap+3ZKGw
X-Gm-Gg: AR+sD129cWyWCbqAXUXevLyoehP8ZYdeSNUhBWqOGhU9rcv3C35TKym0ICt01xNxCJB
	URUQygqit9axDyce0qA6/GNp6SDwyrjiar1pPNh67PB0OLdzP6sZOaaKcZx2s/WhTNsjeFBYU6S
	ULm4GpUE9HqDBHLwpCsKYPCTxD9Zg9vkVqS036FbsThH+GSsd255ojd72vNh7Y4tk2fMLJRyx9q
	r1zNfVFM3y1BNRbDHxZ3oWA4aKvCAtx2ZZqaqSKukyemmBbei/COaACRJtuXhEW42lGycq7dlWS
	nFVQnXflY74Tghj3EkTKOEs4Tonbex4dWBp/WTypLbeJ5w/Y9IIZ+tSduVSeCbq6LMHODogrutb
	ytk3TKjISZrqrwppJ62f0OiTWLuMjzoaDlBGZiN0OlA4=
X-Received: by 2002:a05:6a21:3946:b0:3c3:d298:81b2 with SMTP id adf61e73a8af0-3c8e467b0c1mr1234267637.1.1785309636090;
        Wed, 29 Jul 2026 00:20:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3946:b0:3c3:d298:81b2 with SMTP id adf61e73a8af0-3c8e467b0c1mr1234227637.1.1785309635643;
        Wed, 29 Jul 2026 00:20:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba351979sm514790a12.15.2026.07.29.00.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:20:35 -0700 (PDT)
Date: Wed, 29 Jul 2026 15:20:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/6] Add initial device trees for Nord platform
Message-ID: <ammpvbKeGgComA1L@QCOM-aGQu4IUr3Y>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX9OxowoScnx+l
 Jql31m/J0SMRbNAABOwJO5/cvG5i9zcAsDhyyaOTRrzG12eomrFcbHszADIz22BO6iJoyvsuxje
 +t6+MhGUhxaDNmQgmptrxmQgVdFVbxs=
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a69a9c5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8 a=PPB80SP1y2LXfg1cI6sA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: WMZxqtJ7Wj0pq2M1FYDaAK4YosIrGNco
X-Proofpoint-ORIG-GUID: WMZxqtJ7Wj0pq2M1FYDaAK4YosIrGNco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX14cJRGL13DgU
 aNUE8uRl2FQw0PbdPxP693DQ/GB2g9dOhxCHZkiEnmotfxhjBKyAD76jnNQLlh84fmc4YClNbD+
 YFVw52ppQuAOGqGPmevsbDMNpt4YcwMLmLfjlS0JjjVvFBYjEn5WO0pdzBcQFWlpEnW/BB1II3V
 HS3wYxDIlwWPi4LIYSjHq/oeMPc49RrcYRpAPdubkusNauPA1O2Ib+7/XK31jkI3gSVA0HklYFA
 bkjhI+PLf9U7w5OzcwzN5JALJuMnviQImZRFzSYWG2MkdFThiQ6NrisISUO9RLEIYM9bulK3J8f
 WYB41/mUKC/womw9t4u7/9DKSwL/FjUVgD6Eo4o0CEIfezVQaq7LO7gn1Xbjs0yjegScVFzFaEO
 f/MXK8swjJ8Fb9cR0hBG4mb9f30Kn9JiG7BUkttCq1Z7HdMRlU9wjd+Tpjstz9M0RisXHf/Gz5c
 WbDq7Cv2W7H1o5dRCYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290058

On Wed, Jul 29, 2026 at 09:00:16AM +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SoC
> and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
> for Robotics.
> 
> Nord includes two variants, GearVM and Embedded. The GearVM variant has
> platform resources (clocks, regulators, powerdomains, etc.) controlled
> by SCMI server running on a VM. And the Embedded variant has the resources
> directly controlled by the operating system.
> 
> SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
> on Embedded variant.
> 
> Tested on next-20260728.
> 
> Changes for v8:
> - Drop UFS support from gearvm variant to clear binding dependency
> - Link to v7: https://lore.kernel.org/all/20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com/

Hi Bjorn,

You can ignore v8 and just apply v7, as Martin picked up UFS binding[1]
now.

Shawn

[1] https://lore.kernel.org/all/178529373848.132455.4656284480950878568.b4-ty@oracle.com/

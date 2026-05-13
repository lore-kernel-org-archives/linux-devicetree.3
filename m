Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE32E719C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687771; cv=none; b=pyldNUKdkL49TeTomFfDwBZUs3E611qGCviWVesxzam/FfaIVc+qShUPJNZ3gZJRiVE1r4u6GRNBh2SgGz2x3UTdEvCKkFdtG7PQwRjz6btDpl9E65j3chcYz+vqZAsNkWzBMQLnCrgHw1f5EzbJhl/gy3MT0PlAIOI1YPPlMuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687771; c=relaxed/simple;
	bh=9mPNCinHnbhstt0b+g8l4cy2ftNyDXQeq2rRfKU7a6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uydc7m5MzPtln/HH3y7YEu4nL8/dx0EslOha0DwZMneRg0WH8ZE8TcTlYIF6FyT/ejncCyBE8aSQ4UuV6Ptw+QnZcdb/Oebcro+t14+InDp9N4XsyduenGKcspD0IXgIq4OVqxfB3r4Wi+NJmfg8QMJEaAnf4rmHdPfCauFE+uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5PQweja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTfk1H5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5PQweja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTfk1H5x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWpgm1393169
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FV62wPVqhcL8BTl6zWBGVeKP
	No6dhCw0zP2Wz9XZfdg=; b=n5PQwejakgy1Saq6D2G03GmD6kBJncnv8hU27ZiB
	Uto/DUdOe3r/ZM6zSO3Eo81hzGMzxZNu7eYrUsjLon2XAQt1D2EWQyr1wMgyLr95
	flB4aeyO5XZ54jLVAlqceRmj/BPzMcISmh7epxztJjuZ9XNP0X+OznK7MZJZocnE
	Pb2teSiY+ISgraRD4+ooddaQdytqdA0sbUi2aS/Zrt1TA2PGwdpQN0nm6kHQM18n
	DJJylK5gT7yPDfog79SgA7uUK7JJEfA7ZoY0+/YWMkPAKNjBa/bzb0Y4jnGl6mBn
	bA9p9Xl5tTsMGpCL4G4jSai102pKgP8ypLlqDtkqUZwUig==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262fu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:56:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-634ce585b41so1981430137.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778687768; x=1779292568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FV62wPVqhcL8BTl6zWBGVeKPNo6dhCw0zP2Wz9XZfdg=;
        b=ZTfk1H5xlrP4lXexznhE41a0YlW0VqOwrqVJpGJvTZoHxHcdAm9EPh9WqxQAISt9n7
         njv0CBDGXeK/6lVzt+xhq281vkOruUa5OguExb+mTpSanye/EDMhsd+kV/KAmzNej1hu
         F5y6LGF2mvO2k5KTAwTISMs/IhkKfg2lfexXvOp/pMsGMLpHgw0TEWxDUlgVR4yZdGiq
         jRzvF+y2h924lPwRY/YPeQvaA0v8wgH6daYzch+69KKBnZQRpAIodB9HXIuO3CiHvrMW
         nFnigtGavDt2yb2fcAgThtJ+xeBIxAZQSYGhCAdC/Gkj3rFMXFqPDeJq2eRvLJHsUpcq
         EHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687768; x=1779292568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV62wPVqhcL8BTl6zWBGVeKPNo6dhCw0zP2Wz9XZfdg=;
        b=oaMGfpWeJ6m/49crsftW0gG8vac7b/Db5aEe0wpTeiSyJEFOAOTgdbmU+kMdvzTmeF
         BAbvAQouBpoRduWqSxioYRyTebtAAWEgkjyt7M2I31KI7/8e0bY6dPBjpV7L2E9vGWRP
         dwaJmpgZBBBQYwQAYMijBKNqdzsQW3Lbdwp+nT9i6aTM/Sxyf+Es3O2x//GMTqsMlzD2
         RxRdmhpnXPvjHdc81riOGWq5JzTu/zKaElRqtrlrOwF/u6i5j2PAknrgv2SXkiWwraRA
         NoFAi8K7QkISL6rgBLPAuzfIxr9Z6xIcFc3BqHw8zSjJWjEKhrj+tNgVUhZcuHX99BFD
         KIlg==
X-Forwarded-Encrypted: i=1; AFNElJ+IYRuXOhyypiJaThZqZPTC8en5Kq8p1lCl5WyfrJOopUf3wHlNZKfQz4GNrxB0uhR7Vd452ZFM3CD2@vger.kernel.org
X-Gm-Message-State: AOJu0YwCgp/G87B5Wr4AQQ7mnwaUVmOhkGI2I8pFffv0Inzw6UpHLtRs
	3Mb9TJLa+oRWcbCAc+HVoqeDABBoFkRWx+BCulfEQ38Scci5BQ/iUoSUVDxY6llieozGr9mm6ER
	M8jwPnpylFIQx3aENqC8V3FkvZoCxtJzjb4FlFUpqa2jkaejP343hgYH23lDmvaHt
X-Gm-Gg: Acq92OFokNJd2MonNastJe9SEKnS2qq/PusEscgYNdhHJkdxI14wD1t2BnGvJiGJnxk
	Mivi26px7/QCtt61hXur+piC1QmpLEBQFkLxvuLBkfe0fsrFJHclU65qlyQAuiPLSmmXXoyJITa
	KRWIxKbzVMSOClAlUApUXKYlBt8TaUxO96C08XTO4HQyXvvRw11O8V1DAK2OFTyeGlFPQTPlHbm
	Er2kuNpEB7QU/YEUcKgFOBAMV5QRo4BYyDhs+HPiSUv/PsC+Nv5PpRJ191Wh9lZv3k8WVOFnDAo
	XMcD9QABkyTS/xUYXQCDfj5ovoige21Bb0Co+JdBK5UzbXsAwGa4n6yuEKCjQYmjMb02nDZcBbh
	68N9obYBYdb7CUHrExBeGgGMOV43Tmq9RQZaMktSfiy1pL/Xl4Ng6E7CTAzkJAdFizAcISFtsIq
	S3851I8mb329K0boeAFslhzjoeYFif8yFDaLk=
X-Received: by 2002:a05:6102:3909:b0:631:d3e4:efb6 with SMTP id ada2fe7eead31-637749a964amr1944845137.21.1778687768446;
        Wed, 13 May 2026 08:56:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3909:b0:631:d3e4:efb6 with SMTP id ada2fe7eead31-637749a964amr1944833137.21.1778687767933;
        Wed, 13 May 2026 08:56:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c873fd59sm2547257e87.57.2026.05.13.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:56:05 -0700 (PDT)
Date: Wed, 13 May 2026 18:56:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>, Nick Hawkins <nick.hawkins@hpe.com>,
        Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] leds: is31fl319x: Fix shutdown GPIO and update DT
 bindings
Message-ID: <tyzqx4s6puwkee4i65ysimcayc54a5wy3sgps4h5cgb76zpsl5@r5ijowlt5ujw>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a049f19 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=nkdmZr8mgQ_COcTxPvYA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MiBTYWx0ZWRfX/Ha3Z5SfH5oM
 Cpueau/MuLjJZMHDbxhwmhUT9ni+2m6uUKfXC0g1Q7C3kB38Bmc4Ct6Fry0Ct1s4mMzdPbnz55Q
 Wzo1vmAxodus/xQuoHktzsmRhTLtGfX/8C5uSzNBiwozzc/Ji6DMf14iG28SRd1Vzxq8bESjy+q
 tMZTz/KUv8/olfuA9OBAkecDHx3FSt3QVVLDrMHuAuKuSY80XiqM1jQCcWSR5yuNq9g+BPbzsj7
 0mYAjYlu42k8DxZpz3mAAnizmty1tGMkaQZUPCq9NCzD1B7eA9CP5ud/z3Rs3UIgGGVe74CFr4Q
 3rR+HVx9kJsxveuxB6vsYCoDtPxeCp8zKSVyLRZPd0/Ta1xTREgoy3eQGrq2GeeanxAL/urXwqc
 Sp5NjEAuI2GRPOyGibdLL6CxE8QrUtnsQx2yxKON5GRxwCXTam8F1T3pGMuinJ7wi+JdIrdjERw
 uwbGGdn2HrnMmMFCIBQ==
X-Proofpoint-ORIG-GUID: _m38uf3O_cVZP-yFxF9TXXZD_0vueTbK
X-Proofpoint-GUID: _m38uf3O_cVZP-yFxF9TXXZD_0vueTbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130162

On Fri, May 08, 2026 at 11:24:17PM +0800, Jun Yan wrote:
> This series fixes incorrect shutdown GPIO polarity and improves
> shutdown-gpios description in DT bindings.
> 
> Patch 1 adds detailed shutdown-gpios description and fixes example
> in DT bindings.
> 
> Patch 2 fixes shutdown GPIO initial state and removes redundant
> startup toggling.
> 
> Patches 3-5 correct shutdown GPIO polarity in board DTS files.
> 
> Jun Yan (5):
>   dt-bindings: leds: issi,is31fl319x: Add description for the
>     shutdown-gpios property
>   leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
>     startup pulse
>   arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
>     polarity
>   ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
>     polarity
>   arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
>     GPIO polarity

There is no easy way to merge the series. LEDs and DT patches go to
different trees (well, three different trees). So when any of them is
merged, the branch after the patch will be broken until all the patches
hit the same branch.

> 
>  .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts     | 2 +-
>  arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts     | 2 +-
>  drivers/leds/leds-is31fl319x.c                           | 8 +-------
>  5 files changed, 11 insertions(+), 12 deletions(-)
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

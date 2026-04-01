Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9A3E1235
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042186; cv=none; b=lFRq2rSOBaWsKu7ZcV/ebVkAqfqDzhFO/w96sE6xLyU6DP3BpzQXY8j4WwsG93SSxNrqyebiGiX04djJDZRQ8wrIASeehcrNZG0Z2sfZPhN2PTRfIeL8vY27IGgJ+dcauT8ArfHV1J75q2EIgTNWkllSKdpuI9GP0KIK+2XjHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042186; c=relaxed/simple;
	bh=qrjimdc8fUGGL6e/x+go4AG4L1NYu4PPzmNfdhrjJ6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHI3xkvIzW80P5MqOAGDnpHEYubn7rVB+MVcbKQ250v3avgHlxoFVVqb4fCok+mj96WuHDdYWQqByULr+VWVfNRWCBUQfZ/kzJ1QhwHq82TGayAAsQ8SEEzErM1Ea+wvlIKNRFDmGHT6La2ngrTUx36As1Lz5YH98XvGe1BIeLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1/unxNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iz+oa4Np; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1/unxNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iz+oa4Np"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317jtfg1004266
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4bX2wJqvWiPBo1lENEnVQEMD
	UI/E0+pzixl0+6Wm0Ac=; b=g1/unxNBlZnuDn++tEhNuFSbTfQGEIbnlQAlRkk4
	9J83KGLtv5wyT0SYfkcrKXbw68ODsB7o5sHuxJi/EStSFAj5yjy8WxasTvcRgt/2
	4A6h8EmNnJmVGmiV508JcpAKrZw+pO1v0o4ya9ksv8HjAwkSQl2z8IztA6YLvQ2V
	MxjIR0ijINNi4JufsQz82YPFXoxrQ2mpp+/LdKyIJmEELR4cc4YePtK5rUcp04S9
	K/0Qnbi5hCjtuEIWvyyqYYVjc1BGyEj/GslmpnQkVZ4LuWWlmHYrRbttRMpD6QxA
	9xH5FtlLZdEouRBPENAp1vVKx/NqFfp6E1Z8JL6usdhzkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjj0gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:16:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50925fed647so81030231cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042183; x=1775646983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bX2wJqvWiPBo1lENEnVQEMDUI/E0+pzixl0+6Wm0Ac=;
        b=iz+oa4NprYIihHwYUUUrthO1pidajaYP48A0dERAYU1+YEm98TsCHZB2vhPFcBHRrD
         ceBElgTQY+Ixex3McAyhk0MTYQYihyKO4myT1eZwj6i2oBueO4ny5Uo3BxgdSzLn5o+b
         egutsrjopStG6vZw93vzbX5563xM9gtQeiuf1zWSYOZZ7uUTMZg1s79dBJ8eU6S60BfB
         CPQtwtshtDxXtWyC5nInwhgTnbWk3V14cYk45jshUhtBt8HDfs9syY+g38sdHrxG9NIo
         7hT/tWOkpOnQGzGNv+EbNabWin3lX1EX4XBpzsufFSOc5g2cf1qcsLJOBCn9PC6sH7J3
         Gg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042183; x=1775646983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bX2wJqvWiPBo1lENEnVQEMDUI/E0+pzixl0+6Wm0Ac=;
        b=YamLA1XvegWguCDst1MNYRyQycFGE2GB4PM+GO2B8cQZJnAIC1mcd3PMQ45kegjkSW
         aja+ibeaXkkB1FWsPlfdr2ntrfGK4CjnxOspfeVpuD4bL+PlaqVBssYuhUX5ys9LI0JT
         7GiWOgZB/NbFmzfGSleNvR5cSxq4ptyQLgm1y8ut+owlTyk4YkE3+oOMzv5N5MOefY8k
         sJ8Ek7B+AmkJrw1Q3AhuE0QqxEJWk9N6Vi1YA3AGvSuEu0j79NWFO3zFfDHjQP0wRS+Z
         mlsUwJLuuVEFMZCsQRDxqz2FSqwAjX4VRugAk9SkEcqXn7odyUMt8l4jqkr8DUhUpzU6
         ERjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwunhUrAtqbtwToLxSsqPNw1m4Ew+b5dTvfJ3MyR9Zcokjo52w7phn4d+Q34IIWIhkDzioyx2BkJsa@vger.kernel.org
X-Gm-Message-State: AOJu0Yygb2ccdwsZvu73m5R7Eooy7M/qpaVWPEPmKkCf9SW+KiPSyUBg
	lXwM+Z7pfoR0WF6Fo3cQwqYXqQvzzr0lbfAwhIhfTg3BxWYMomj5p5ixBWMa/ZXe0RKtXFJDFV+
	Ep2lI5FzSgpoadPWDdG21wZXViygXu1vfyLuX0srpZAfQJl3D3Ov/05LbZ35BNy/C
X-Gm-Gg: ATEYQzxM+kwBvcX63KNVuw6btzIcBD1w/4irEt7YjuRDk+glnZidKAjjgp4PaD3BtDf
	0ljTsYEGFPvIn7WuXpIoyoMM5kGApa4XI9tViXUxFxYN/VLXSSu+UXyjcfupHNCx7SnG49emqxQ
	84PfJwJuWZDeV6/c88Fmufvx5GqNMy06S8tT5wBI6AxU3s5Rf1zR7SQAYRWgrUcFzF+HYL9ivRT
	faIo27dxSiJ06k5oW8Lxhc3fr0siGyrJjtuY88ppu6/5MtSFmx1jzU8SCHggEtcTSzYqm9/D0Of
	FMkWQrizbBECN3jg6NaHzePJWBFymM3DrEAZ6KYqdPgt5evJVK/zH1MW+fZgV+vmc5+2/wwZT6Z
	I5aItxthSUTxMV8OTpP0JO7S/wbPZ0NA0JHi8Rb2quDxg/2zmMuMfow+NVVWPXuqe26iDys57Rr
	h5tt2LxdW+CC16OpWtO6szBbFfz3cHrfp+p20=
X-Received: by 2002:a05:622a:580a:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50d3bc2e0f7mr44673581cf.7.1775042183315;
        Wed, 01 Apr 2026 04:16:23 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50d3bc2e0f7mr44673021cf.7.1775042182841;
        Wed, 01 Apr 2026 04:16:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83903e44sm25698371fa.40.2026.04.01.04.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:16:21 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:16:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add qfprom efuse node
Message-ID: <edqobjetzofwvlxanmxtpbq6yzldy3monq5stbov6hctopycee@qvh4d47pxpvl>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
 <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
X-Proofpoint-GUID: atihDPUQmdH6kmcTw8sR5WJ4Pv20OA4p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMyBTYWx0ZWRfX/dOZwEvjg3GT
 L6HwO7nYeMssgwO5e0pljyCP5cO/rxCbBa1HBiGx29xcO0UNAfTn4gnAvH7JiI5fwQpR+nbVtG4
 Xf6HXKklqgshSIMW7hy9NbVDjyhFrvUDAza9hHEH8hunXOwjW9RPygJSQbqiBMoBQpNuxJ3p4xT
 B+cwsAJzobRkguRAEzSzFGZqjpfnnviEhJWSQMoAa0QYvyBqKbkG8LzR35YEjsU/p5n/fQLvASE
 YejWAk5AIxyPT0UtLZVNpzsF+z3KcVZK7iCLCVZ1Sokh2SbgP0JJ1IES7PzPKMDyC+Rtco3Iu+i
 BoSbmfwGCnc9KUHKDgBIVEjnu+0hzkJPJ4VCXjjIj5QBQtBkcozLZIV4IoI1oXiuffrXmyr3Cps
 GYJOFXfdwnrgO5LyYkHlN5/tGErOf3Y5qxa4JIosIYeTbeTSMRE4iM6yYYGVC3HMob/KUmRRDPr
 KIkp+1zr8ok/MzMDc8A==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccfe88 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ukwwJ_iyby0_xtxX_Q4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: atihDPUQmdH6kmcTw8sR5WJ4Pv20OA4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010103

On Wed, Apr 01, 2026 at 02:25:07AM +0000, Alexander Koskovich wrote:
> Add the qfprom efuse node and describe where the GPU speedbin fuse is
> located on Milos.
> 
> Note that for SM7635-AB at least, the value is "221", the max frequency
> for this is 1050MHz. There's another speedbin out there for 1150MHz but
> we do not know the value for it so just document in this commit.
> 
> Once the value is discovered we should add the speedbins to the A810
> Adreno entry and update devicetree.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

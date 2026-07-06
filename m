Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93243370AE9
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346523; cv=none; b=ImwPwfyu9Uux+aRdkBPaVfrGvcBtWHsrvOHI6r7WKGmGGtygoc9y/Jv9/gmXUzVLR4lUcZUW0P/5a9UXwELs9o4gnnpQTq2qLPpP+gF8DZVEsF9wlCwtSyauOnYUvT9mVGfWY2SMljlTqtWzVrjqiaiG+QO7RlybaSGobcS1ha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346523; c=relaxed/simple;
	bh=Q4NF35YjcGaZ1qiI2gAwTlaeT8DyWjM7S9YOGEGRCBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl0CHkfhdTZ+wE6ZL8g8ebmjHELIg4txbIjvbCCGFwwwgaCu1uuybtKf4Q4lZMCCsa+KZ6EOELKadS+445nl6veQ7JTX7mgvuTgaVBj9/hogFtEYaGmt+qDqkwkTxIgq4UdSZMVnv21TueiF/CmwMZ2xOSjswp2OEcKW00zdDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqUAEoMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjGCgzlY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqUAEoMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjGCgzlY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDYT395293
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=; b=kqUAEoMQJxRM2hhX
	iBs7jjS2FheG8635qyX0M44bmv23d5h0JNNPwu7757h+FnZR5SoB/rCykQ2Xnfzs
	eIGQaTZF4JZdMcIgR8mF18ZPbgpXWXDYRPpUcu0fvWabrlBbMY14LRX+6m7b7Wnn
	o+E7KRpGsPxjcWycwkKMFo60h4YyI965NJS7TvigXNl88PORoQOCs5WA4RTf0wDy
	KtoePdXtwBjdvq/gtn+sQod4LkTOtlzAmlzdHl55OHQCRUgD1/eP4uHG+75ARhDg
	s3Xum65aIv3vPXIWHdPm1DcRjbXeUiulrRkla1sPddo+yrbkDUnVkEzbF17wvLrh
	g/zkIg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qph2pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:01:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd797e447cso4370720e0c.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346519; x=1783951319; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=;
        b=FjGCgzlYIefAeKOMezpAqt7Dcdnqay/DRduDFcpEl4yuCjGfePYqpG+eX/pTA3sBcN
         5HUI4LTb65zrfdaq2ImOdMDISHr/rh0RSgGiLWy5JUhZJyAbw3MNlVBssQw3Po7L/Hn+
         qPBRQiD/TnRgZwbCqv6n2CcFfgGkPK3YJvDicBkv6ET3c9ELP/UJXyusb2n8OTLiPFhj
         4UXQE2i7875C90M64dzf5ZEZv3Sa/XePnkSMGadqzSWU2uAkA5J3FTQLJ4ocQERLIRhF
         +sN/RvPV/8WpijiUaPVXCkAVIrnJOVFJChoTMBLTHSZiS907rCjKGhFrIB+Gh1NkuxTE
         +XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346519; x=1783951319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=;
        b=VK5jEuoj4xmpsXURR6Me9S8p9oX/1+3Jk16g9eeGo8IKo88IHOTYg8zOaylILqOJ47
         0OppBQyrXvj7m2qFjBnqC6VGeLCx9fWxlsn6TE1Cbiel/+w58f1wvip0gxCQgsS84N0U
         xjF1tGJADpW6iXe/iIIhSwyxFt+/j8LQvJAKy675xackuAjxGHj8B2+OcCJRNDscdweS
         CN2IpuLbtGBXQ/eI7FOYJKRXrqnQK39V24VnzJxxPqqTxLEAwIYOhh98Rg3oNzodXZay
         OT7qs/i5PQkWX6XyG4twI+bVpExHOA8NCo5wmnzhAEXl5CN9gDqsrfzvnEU0NxIe6Y55
         00tg==
X-Forwarded-Encrypted: i=1; AHgh+RqkZjQ0YeybujxWHs37a+GuOrWpzekBs4Kwe6/OjCZ1+If9LcxFO2QYRKaByqMIHtBDgK8V/lojEQDo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhi3KhaMTdqpEXWPxfc3UELQxCmlDIZKxDwi4m76rcBAkLYzJm
	C3XnkzTMGZ7EnZxmKuGEKr1hTyEqgmoyr4FiFcN56ghrprTKbxlAYH/9LBytxcjQAabltTsL700
	gnpLZFYgeAxahhPFG9tmI4kr1WyES0BoMm7w24LZoeTMwbktWggYGnUFmKE4KkgBgkSbCZEQs
X-Gm-Gg: AfdE7cltEpbXmmWubLYRDjzvtDkHNYCwprcVimrBCFMdSaeUn1bcR9F7tfn1Uu/1EV9
	4FY5Bk178mj+dIZ43wCZxg9hPRGoRoqGNXGhhsTvV+0IItsOFLyHoiqX8DRdeQTOah7ngI2DvvH
	a468A5Mz+KJfL5rFWjbR7fmLmg3LS34zMKcFusKiwnb/3iyezfIZgdQ9tEVt//6RX8J+KxtJxLI
	KJyYHn3PYh1ok1J9qyVgcGHrnMXKeraoR5I+TDQ8mt1PWxufiTOpf6Wh+kIAUke3imQVkGs9ASN
	VEDeLSro6si+6QaFU0vpCbPPMpRKo+oWhwUFY4wp8zksRP7M04uoSvyZZeRnjEZ4iG9FdjvHDR7
	v4DMBo7dLD/G5vj1zD84fRqkeZiNeB8p0Bh1YUZ3MFe7xGltytgEbyik3L0PXJt6/mL7/7ILYkw
	/pO6cc0GbAVyEhaJ8A27gOweJG
X-Received: by 2002:a05:6122:791:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5be98955cdbmr332905e0c.14.1783346515716;
        Mon, 06 Jul 2026 07:01:55 -0700 (PDT)
X-Received: by 2002:a05:6122:791:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5be98955cdbmr332384e0c.14.1783346511346;
        Mon, 06 Jul 2026 07:01:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm2898513e87.36.2026.07.06.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:01:50 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:01:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Add support for the Iris codec on Milos
Message-ID: <2eguh5xk7ykfbpwnjly7e5gkupxgteqimdnpbxdddvs5zfhu6s@orfjibovsg3x>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bb558 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=s7MOqckuTC5V7MsndsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: fB9vJSN1HCDO386TjEFwdUAur9mb0zKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX/IOFwxcSJxr9
 K9UPrJQg+Zw9Xj1p7m/YjRodu2VgGtcqZoXO8ddVRMtYVHpNZ6/rKOpWPVmgIyy3FXEPvWT1htx
 yv97LwU1JWzOu9yRrhD6Du2CUY33QCpheGI0pMlJcSriMsRUtb0dZO532kEd7r9vdSq7/G44ueI
 GjE5l3mjv3kxgGkW96tqT+g+czfdsa7BoyANSv7MgK8NGCGTTG8/2QwNLzUUacN0mX0Pd7VCWxE
 +p6MhJLhcNHxjhQNBQfaxREXmby6KpwEUp1kJUEeMWCqpOcEWMfFcOMX5aQE2F9tBS8RABY1L5E
 SGElttGg1Vi6hjAgVMsWGwF3+01ZqGX5IEAL4JBPBCtgXGeI4LrzM0peZj7Mu+LUadPJsWwTkbh
 PpL3XCVoiQxcZDxc6qASCq/+ghdMEd/Ruc7/htdQad7vW1UTusjUb6Mfq28Xaqy/4tGDgUPH2IL
 F97rBO5YrS9foEdooDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX9Kcr20Yb12MP
 Jtnqc1SpiaTVuFW7I7I9f0LRaBzbG2OToYWnEVqHS7DuCTVXHF7tw6gHFt6O1HuNO8rMRmRnsv+
 aqqadgPagyXxWc3UdoGxNRq+LLHOSF8=
X-Proofpoint-GUID: fB9vJSN1HCDO386TjEFwdUAur9mb0zKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060142

On Sun, Jul 05, 2026 at 10:10:18AM +0000, Alexander Koskovich wrote:
> This series adds the bindings, nodes and platform data for the Milos platform
> for the Iris video codec, allowing Milos to use hardware‑accelerated video
> encoding and decoding.
> 
> Ran v4l2-compliance and some fluster tests, though a concerning amount of them
> failed. Attaching v4l2-compliance output and the full fluster results below.
> 
> nothing-asteroids:~$ v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
> 
> 
> nothing-asteroids:~/fluster$ ./fluster.py --no-emoji run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2

Could you please run the tests against the full test suite and submit
the results to https://github.com/linux-msm/fluster-tests ? There is a
script to run the tests.

> ****************************************************************************************************
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
> Using 8 parallel job(s)

-j1 might also be nicer.

> ****************************************************************************************************
> 

-- 
With best wishes
Dmitry

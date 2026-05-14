Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1E3CE4A7
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762231; cv=none; b=MEOAuI2hUD6OTp0TsfKbjn1oW0kiGrPGiNh1WGx6h98yO+9YxmufZMKJuxeWZ7vyhX61tq2zGUviv0Qgw0fwdqzH7ZttibTm0msosrGg8OfJL3/PXwjCU5BYKyoZEfqzC+nEfvIG1XImPSVrx2S9oj1fYMhSQHZkw4Cw4SBslvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762231; c=relaxed/simple;
	bh=mWZA0swnjoA8588DZQ2qd6kAUz7BB2U37Lx+KCeAKQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeKU37RgSYkgrl2l0PHlE5VbGcUXcrKwbkqCdzyjrb0ZuLhBVVqEvO3+CMWWvPrJl3Jz3QOcrvwUDdHZYbg5Xo9WLAoA4YxS9FqAnYctxOhzp8UDydD2i3/XY0+oWfSWnHIyYQZg96MkLyEE/2RJV8hLEPcBK9dqiphds3QsMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YO3C7bqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UegEFRDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YO3C7bqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UegEFRDY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeTZJ889388
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=; b=YO3C7bqTNygIL/rR
	zg77oN8KLtLkXw1o9VI6MvzrB6UO7CpuTxul8EfDF3ylpXFy4PlS9YB65ZpR8uuQ
	kQSzpsFi97NIDDLMkMZ0t0ll/vbQifE8iZE849QYOjqmINbfVtcP+6Lv0uNZEeE5
	plu6CnxD6EGbJNiBU2nfloYUR9laruvX1+mNd0NV2a1tVvb7nSKCyDT9f+4dexqN
	yzbF6ss/mLueX8iJvzhDKN5ao0aRWsgf3waW3bf42B35O14bClIGEm/7/i+UOnB4
	/jpuJ424cuxQRSmIbOQ85vsSTPYulquAkAvnGdj+oaJDobPcarkiAmgVQVK+sGRL
	2NKmaQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjktw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:37:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f71af9dddso683310e0c.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762229; x=1779367029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=;
        b=UegEFRDYqkLPdVuPTuDPZxdK1rEaE8jQ1otxT8QD4j0aPzQvEEbO7k4n/jU7eMYsuk
         4FXyek7ROfwL2CBJ/jtkDjFR8dYKqZR+9uKPwrjoVHsOxkmvEhC6onV03ESuw/3+y1dK
         8Q36O1HysmU/3yizP/OUmgb4M1Yhbb+U/eZraLG+tzSvVwJe3xcJLP2dGeV9yg4tzUrJ
         R/IMLtlkHmeBCYaFsM4UU2w033rwfFN/j8Z1ej5SF5JdUbitF4wAAS1mzAYKXrPkFYNR
         dBPpoQBDz8nkcEGINyduVUwWcoULVrG84wO5uBT5qJFi+S9eVm85xvc3qyr6mJp9RHgk
         rTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762229; x=1779367029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=;
        b=kiEZ3gBJ4LYfrMD24JZheu2QtZwHVI0UQ74GBeWUnvvgKzi82EfM2Te4VNeTMiIvcd
         ArNe9i07kCedXZ/9FIPipJyTGINoJL5/b/FvC2s3WZNEHU5EmjtwWNpYpHyOvqhBehih
         eIGSgoEI2FjwfXuH/RP7MKCA8nR1biSsHRFcC1xiIy2x5EdV7s0o0SoEXwr9mu+2JjEV
         zjS6da73R4lyWwt5o2eNpU8GQQRmKKt9EbvZlXYvax9OpCqqZd5eE2UdYHRLpRIzptxJ
         wToKtU4LSrIU6G5DuzZ2WLjYxPtdgEdt/FfpILe5FHI5SN8BJaeryGrUJJPIkcHXx6xQ
         Mekg==
X-Forwarded-Encrypted: i=1; AFNElJ8O2ZrorHblrn9ThQeGPgwi8erbUTRwp9M6HRey/jHrI9YimJM0aYoWvVXfNQZx3f8HsnFHMPNBD124@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFCewpMToNfoPduota1WY4MxHtP1XL5C/ioYA1Nmi98R14+eu
	LbALLf+3lYZkIhfXIZoPMQakTN6KFBdSTHcuxJ5WAo0K7Z2osfxFgwUTLtCidbLMCHXy/5KJGE8
	xEsSnSHE5Gj9zqbNeWYu5eBLOv0G95K4rfqqvO9k+c/zYM2m2BOqkWAl1SvBJlosb
X-Gm-Gg: Acq92OE3+BzgR7jm9wzuYBP0aOPcqUnfwqL2NJUx4TC5hCW53fcsjws/XsZUQIdylko
	N6l24vs3zXGZqNaXfAYhX86M5aLaoLWSYN80/nejx+HUBByf28TAc/Ie+T77/Xx3+ssoIcCxUUC
	1uopPULN6GMXvd+mFU6tWCgJ48oxSREsxARGUMXj48syD0AsPzZ42JC55eeMGDI4sUU0w1T81dj
	HPiim5nWM9Vd9B6wqSFbF4vt5hNfXrMW0lGVUX9RohvxJVaYNsLafPtB3oVxLdT0r/TpFWRc04p
	BbWambIOueDckOSc5X3SPMPZHBCc4iYzYDtwVi+0rhTxhfFZT/a9gzuqNpwtTlO38TX2DArRi57
	6FK2UNlhYt8tGVCfLKo9D3ObADrofI/O/VVTYVQ+byvee246jUwP4tcJ02qHwUeuK1m6KoBHBiD
	QjoSg=
X-Received: by 2002:a05:6102:2157:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-637733f0556mr1164961137.3.1778762228444;
        Thu, 14 May 2026 05:37:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2157:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-637733f0556mr1164943137.3.1778762228059;
        Thu, 14 May 2026 05:37:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm84302766b.1.2026.05.14.05.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:37:07 -0700 (PDT)
Message-ID: <2a19abc9-4e73-4e8c-8cff-c2b28100abb5@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:37:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LBspHCCWBhmVEYnDOkKR7TdDnk6v6Sii
X-Proofpoint-ORIG-GUID: LBspHCCWBhmVEYnDOkKR7TdDnk6v6Sii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfX0B8YuBxzN6ow
 XgnBNrvRE2nTmRR88u/Uz857Dz4kioFKTW8bvixeL38rldIQuUQziAXFMSOyMUftdjbByNpNlab
 shj+oC5w3viPWA8XV1SytwjgK7OS8vO8A26VzJVpWJgUEXuWF9fBxv1rhzQ3Tmkle4HumZY4r4p
 YprvbdAxFj0h1N3YsCFJg1yLWSQxXI8Ul+ROMSlmUOpa3I3sr6cESdTgJ4a1VD9tvn7zOuA0MKL
 U1DNzwvBCexwDYYqJls3EXgTm0c/f0LzBbhWLHlSwNsu1qh8z3i6meHpmgDTUQJozq5x0wGr/4z
 mvpg2w18E8+2PyhpIxoONL3wxHjzWDQ1iio11TlLZqQ8P4hopMhimWBp8ZyytTFpx4P9YnvvGZW
 sG6Uegcz+tw6m1r+G3h79PnP0EvQmUhjHgVZqbFmYsr0SYNILBVJqPcjusUy+D7Sw0m20EyCLeW
 pabDXplsUw5d+KmjIPQ==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a05c1f5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OwxjEWw48HTU6ZCEJDcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140126

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali QRD device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

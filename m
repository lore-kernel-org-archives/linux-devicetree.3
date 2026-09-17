Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501193B3C13
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658342; cv=none; b=B0l2ElBSWmx6xJpddxVpkdQtyEwQvshSDsNQePE/7fNecm/HP1Dv4+LCWB5MjHRO9drvL9lOxNUBMWE+NFsZOyahr/LhErY0eM3awy9VdTU4dPheslgPTPfy5I2tRlebJjgdRKma9f2kw8BgBu/8DGj4cd2gf14ZvJzZqXU3a7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658342; c=relaxed/simple;
	bh=kELmudUjcgsQ8KhsRQraj2ps1KtN9s+Jx499XU/pG1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEyH0MY4qTi/go+ezBuQe6zm6dweUsnszRTdvrJudATuleW7gVqYD88iJcYPx+K1OMMRQUvxlXN2uQe3bYOABOx8HyaDKUvsdqSBEuDHh7GcdhSBXhY/75zI2BeO8qdHrxv4YfQkdDsO3NdC9qCL7qE14Sj5p3Bq5zPMUr6NYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFy3zPLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBUUNZLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFy3zPLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBUUNZLm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDipto1137791
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eDFZ7vk2von69CQmhrGnntWS
	hCc8tgxQSOHrgI2CZEc=; b=PFy3zPLplKzeUn+Bh8E88upjXttjqBAYfGL3d872
	3mJ3wXCCUxfrP9Y6Jg9YADGoOzH5zEvvobCbiy0kHzX186nAq5jjCk7moIDB6N/H
	GE273ffyG8UeBrh3/2IqXWZvY7Heev3u1F7HcaeAmkfvP+A86zQcFCMpo5e3fOSm
	l2OB1uq5OJNnKrif/M8SiXmkuPUsZmEEgj4c6BCYfwRAPc1TVs4kOjjdRIDNC4Mp
	6PjQ0MBpvU+g6nQne+PKEu0pmqxgplS1W5PWSgUsD2mXlCQsbu17bAx8V8+jM6Or
	oJ4QTB2WzeXurpHFv7ZZneiGwb0g2yGfKenGC6u3/Twvgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2ucu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:18:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91051512080so15986096d6.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658328; x=1790263128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDFZ7vk2von69CQmhrGnntWShCc8tgxQSOHrgI2CZEc=;
        b=iBUUNZLmYelzNhgtTFd3g0gE4pe5apmCtJ7ViBmcSwi4SokA+J1F3IACcr9Ff1zegI
         8g6R+hog2MaNMPUqzSo4NeeXyYNNKR63EurrmI7a9sKSpknxByLk3FRh1qdfiLwpwWlv
         +8mTyonFqaSYv2n3086xHtiMKi0fs3t9iSWY23eBeANvzR1ntVlSIv8VCcRd2sA0r2Ms
         GnVZUCECg6oafNRPBs1naxl53wtboKcQfcamMqM3VQxEkjIfdaV89WT0gZIe5h5ySH1t
         NsVONigO/11pA022z/BU3i85Yfn5A3bMFSMK9wNOhWxZ/cofe1lqyBXGsK1G8yOlpqcu
         vWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658328; x=1790263128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDFZ7vk2von69CQmhrGnntWShCc8tgxQSOHrgI2CZEc=;
        b=NMCJgJyevhUI8enqo8Zkbn4Qkk0feIx1ijWMdAJC1E0QqgcAlkuT7o6CVsblSnb55L
         fmkcR+VdGBqiR/y6Vop9HlvvFape4iF9OkB75aCJf7iF8/ChPcaSF+AEPYeeWzhrounq
         47tHwleYFqSZ3qLO34MXwfcdAlQ3BSMR6Fps+itEjuWETiWZkxl+vvzIJiinl2TJuUO0
         TKkuSuHrqJMjASV1x5pJUJ85YFh/GFR8sNBv+iGUZevVsx5MpEbb9PBHlTdweEqcOE6O
         kNObsuf1dGBcePLG0uhs8GZ/J5CJ8OscuKuCgi3bfYlPRwp+DSGvnedv4P89BoPjEji7
         1lqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcuTDR5qtNSKOcat2v8fMJJOZQf9mELptCHtWsIa0zVVOtQ46W3vWO8MJqfxTpsdzC5HqVInnZu7P3@vger.kernel.org
X-Gm-Message-State: AFuF++nCCsIcNMNHB12LkgfUlXppbRre+GbXHwJBOwXgm3DBVMxhFd1B
	sj35qSODzcMe/j5/mmh7y92azVwiem+Ppf9JqKLSKHdUYoJd7brXoYZcBy7hkk8WZ9e42W+W4UN
	rPlocWzU3cKu8oeExDwr5OQAXX7SjnswYMkuiJ06APlfBk+QI7IDqAAirb0u/DD0S
X-Gm-Gg: AYBFou2hxcMoBzx3YuvlpAdMmiSSQDCbG7CAYSkCRGEUeOa7QBecdf0a9eS8Ok1xRQF
	vVfi15nFCzLz9J08cDHDwdOTB7x+m3t5sUqBqd9cp+ng7wdsGRaspxdSeFuOKMX13BQrRelICLZ
	b6ITTzhs0jJLSwdv02kOQ8Xq650u4jUoMm0cKlM1UM/k2HDsTP7PEfGiZXfslnbSF9OEZjSNENP
	H8T6dGG+Tl8uGsUTSIYWmuGAbNSNUWSxMDm3eJAGy7y5TPiIFeLs1J3I0a4tMiR1gAyvzsT2gjZ
	7mSyT9x4xGKtWsV5ZbExlD/T2lGD8WajP4uY7YncI2c+GwnouaSS2mhW9kFY9fCAgxNaGPqymzd
	2FlJ3ZCFA2qGOvAs=
X-Received: by 2002:a05:6214:262b:b0:90c:e389:a627 with SMTP id 6a1803df08f44-9123d62a6e0mr132215606d6.0.1789658327586;
        Thu, 17 Sep 2026 08:18:47 -0700 (PDT)
X-Received: by 2002:a05:6214:262b:b0:90c:e389:a627 with SMTP id 6a1803df08f44-9123d62a6e0mr132214906d6.0.1789658327001;
        Thu, 17 Sep 2026 08:18:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bcc7d1esm16166920f8f.0.2026.09.17.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:46 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:18:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/15] arm64: dts: qcom: sm8350: Move PCIe phy and
 GPIOs to root port node
Message-ID: <7ly7dy2uqil3ysjw2jomjoh73cmzi72alsgsqhugikzdwj2sib@ktjg566sylkl>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B-v1DRQjQkDlo3EogzJG01FzgFTRZhl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX995ekURYnrvR
 M7kiXImXHdu5K81AxfiIiVUzJWcrH/w7jl4ttxoTjPziecGYzrLW/auBtSGfLrAGrIBqDiZL9CU
 MMzmtXo6L4mg5ZOMXP06tprhLDpzfIQrUouGcSp+aaVISrnfmuMxaQjv7IGVUGg4xlYXbrgHsbt
 5H/0UiOL9rE8e2M8sOK7TweEW0Mpq2W9oy7YbRNv5Hw5CEZY2juFwzuXpRSTu29X2Kl4RPAMaZV
 QoipwMSriYKKF9bNkwgUctDaMz8vclaZlo2TcSnpTxkUrPtqcC1IMwger+d8p5h49lQDKrKtMgu
 r3QN29B2rsYYwe6a1YgpnySMy/sYeP4+JudTO0sKGiSNQgiXEA/G1niOm9NFIoGis30BP/85MYj
 /qZS1OOsS8nUx8diNrGcLQbRjmd9daRQPsl5XzM9yZM1ORSC4rAPo2qciEG0Hjp5oFVA/LyuGpx
 hGy0WxRIcnpuu91yZxw==
X-Proofpoint-GUID: B-v1DRQjQkDlo3EogzJG01FzgFTRZhl5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX2eXVzgEKxX2D
 psddwsi29mghhPk5PDHyF31GigOVCLWflkZupfKti/49XahVJbn1ho5QAOhQGOExCeK4r6llPuf
 BZ7lth/KZ62Cn2Ji7CL4Vnou89XwXPs=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac04d8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170216

On 26-09-17 17:55:23, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board file,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

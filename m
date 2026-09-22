Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288ED53D9CA
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081994; cv=none; b=F6VylEuatyl+I4oGIGD4pLu+9AbR2k8Zq0FBREp7wnQTqfSbSy4a6zBvszhoT6aF/DSQuD0MXzSPF6uCZ5umHaJ7KsHS97R+6P0DibblXWFPeXZgSUru01fqUEDhI8O3Y3/0hMncA6mJXlViUED9+Hr+go04GzqOWNpxURRMotA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081994; c=relaxed/simple;
	bh=8GgRFTvdkZTLwU8sEzbVj60ny4PaVMNkfY2LkfBn7gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuGdi0DmLwToClf3NhvOGiWFhPZAs4+/8M3xiWrhGHNPmH/BonotftT6NdkZehZBEznOdsR4osTzPaewuAqcMNUFDr2qok3rXcQhzp7KbpKgdHjIoO9cfz2TNLyTnVlhdKB964ETDsHAhymwTQojEhgPfHxjxmoUK5MznZ2VuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcKRdATF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk/CYH8V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcKRdATF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk/CYH8V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPlAu134573
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=24nvX1TJGWoOIXKdPCihYhYy
	Gf+Fdgo4j/yi1DrWoEQ=; b=GcKRdATFNSz2dDkn3chhXt4IugWSiezzYmaNOZ+6
	6QzKlZZcCJ6tNk7aYB7++k08PTuxb7vb5biZXw68eCUckJ8XPjtv83lJ6OaTTO4L
	STOxhBzZHZxAPzz+EBQzFwr+m56mSQ7I8JkghZQhS6hGlL9TikjWlSvGoCxmbvs1
	0pwbFx0A6roUxuCtSByyGDrTiPrCd/avq9BpPc5DdVzhLSmfe8Ekzb95eZwl8pYZ
	MOkO+UhY/GB7W3od+BE5mV1u8SnPEGkY41iFPAnRtdHxzkvbjrykXHJurrnj4SKa
	Qzbb7cvbBpCL/VGhvaYMVEeLXcc+hU6DzRrUqT2s1VuLZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkja0tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:59:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso552077485a.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081991; x=1790686791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24nvX1TJGWoOIXKdPCihYhYyGf+Fdgo4j/yi1DrWoEQ=;
        b=dk/CYH8VP6m8TbGZ/mobUXqiJ1PBUKchk4xS8YbhyabYfAqKlABgM8x33T+J7lgi4l
         6MPOS5EIsQIOzn7y7fW4eCPP7PjEyUWsQXVJD+A0zrey16oRABX4XU9MHcpg4itkory0
         XuL669oc8tBN99yVoQoWDTIpXts0L7szmYnOC9tq+sGPFuFZWvC9/CDi2w8D85IST7sX
         18JSXCtaO/gLO8kS+LHd6MDse2GtturVTi5FNHKBnypOO963PhEkrr8FnBFA/nKzAmiH
         +nEKzyRjsw1KVneME6lpVRLUa2kJIakOYA+zGowgHRRkL05s7kux0pBAUDPk/kwydQSu
         CdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081991; x=1790686791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24nvX1TJGWoOIXKdPCihYhYyGf+Fdgo4j/yi1DrWoEQ=;
        b=CZ/MrIpqFIV5UomGLHmP6T3uqSOyX2EdK07/IWITzFdpWcG3c5PQRlZyDAV/5PLnJJ
         neaBkGrqtYPhEGKulv5jezgIUCFZvuVsRu2U7CGXqm9Z08ONP1cQZ6ud7jJqa+VBb5dL
         q0gLjjhAid/ig1xM5VP0TmJlA5RMPMtLNmPox33RtdhRlmm6x+3zpB8J3jlc/YbNW1jL
         uiPHYVnSxRZkD/5vAy5j7jgeqNcsUPVJMTrtsA+U6+hdT0jOZovQ7EFpTncsqdwSZ+SH
         Ay5+xClCyduyf8GR2BciAUKmTLJMeVkuKBqPDPgNOxbDuMNwQHWP5j3Qq6XDdH0DthAc
         FOwA==
X-Forwarded-Encrypted: i=1; AKwUvByp0wxHA9BSn7/YYNFozujN5EGs/EoP1taXW+lHbfYm45vnWx9gWIkxEOspl6gxnqBEqXONeWbZKzCo@vger.kernel.org
X-Gm-Message-State: AFuF++mQGDHn3WHA2eOg4Z3w4uZhMEzdV4iKPiDylyyW26+D7Tx0F4Ol
	zTeHVfV0UPhH4XP9ta02i8wkdSV5Xhb5+On6O5rkr6yk1m0Tqmqg1gXLTXeuh0mqVwgP9VQowgs
	ZIdYgZAKWTLXMjIwI9wZYDGIaNRcpmVnbHylHV1PaJ6J7rrORHrlUJr8FcL5Gxh4G
X-Gm-Gg: AYBFou2kj8xDUFOy2gt7jCxKerEjQgaYkmmhdGD0FalTXj3H+PIftWT/v03qE9PgBIh
	UvxRmvsZZpwYfWd+KHua17bEPWXAShViPEie/30gUuCxofLW8v7UjA9TQGke9lSu7Es63Or7PCc
	rvxP8Zl5PBHmC6f4hoSaK3qxRWnMd0gCzNxi7DPEEw12nLGH62GLQTN6wb+VyQfmpizi3/3O1kv
	1txj6LY+9+1Q2rj/KC6jKPIE1NKyH3JEIjN/ITAnO6RW0cOg8aEFUkUjH+SBA1cCt2YtLEeYnsr
	9mvZTceanc0nAzVSD904CR4drvt7n3S5rf6zm/GCvlQ01VNsaifrGkW91SDI91ra+r5OhHe/NPP
	FSPgrzZ/mm+WRCFqpyjAIjPGGO+dvzWZ1rw2N6nDXE4jHxclUbCTC502bjfnCb9rKHY1nCZAse2
	hqZFNj7YP5z9mp
X-Received: by 2002:a05:620a:29cb:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c15d91370mr579610785a.23.1790081991052;
        Tue, 22 Sep 2026 05:59:51 -0700 (PDT)
X-Received: by 2002:a05:620a:29cb:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c15d91370mr579605885a.23.1790081990524;
        Tue, 22 Sep 2026 05:59:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a627d779aasm5197741fa.28.2026.09.22.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:59:49 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:59:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/9] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Message-ID: <pk5j7gr5m23eocsliy2rtqcwbtzonzxidxdon7w3doysgehiiy@yxtjrrp337ex>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com>
X-Proofpoint-GUID: xDZ3hKKAYnUUEzFT8BbWWkZSMjBaMdoQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfXz26z447U7qW1
 y2rxmfnSvCwVXOMeit0L12TTYDzphkJctoc7NU9xr2zhWZGmk1snAKIXtzNtHX0yT3mFtL5WjEQ
 W4l/C6o5L4Ck+6KqHS0/h80P6Wuo6G+JsQ2kD8JvbFG242/mB5UHf80NJvOnWSAtVc0SX9YTnqc
 ncJ/i6hhVXWixNK3UgtjVpY7xA24qJyhjrwJpc4qI35L2E6Gii3s8drfFjcr+xSXY20250rfHG8
 krWwiN3NcSTQINnpdN4iExC8WIXVjRf8u5ktgrr/9Jzwvuxk6ZkKaz/iAyyrQI/b7yNtwFgnFyK
 V/V3AqzIqaLXxVIeS/xJwhBoVCtjoY4n8SKajoqpfZxbDmHzhZx66S58aeqQ+TYFTSDTFZgUIy6
 lPRERZux0Dq2SXz/atVtqN8S53YxTjAbNIWv1QTMHUYAzdvkx6qCiBnivkFlNRU0TtmWlFGPS9q
 mLWOuiETLqykhfthW8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfXxMej4Us2RjwT
 VwZBHfmASWhXNfYULTspzUuYpJDkgDBGYb8fszFj8MypBgZX9GO7TTPOlDLDe34gPuy6bV95nYo
 gB26OS7v9bQ5YQruLfN+sy1R0zkh5aI=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab27bc8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=wWFq8rog9-yQDf1E76wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: xDZ3hKKAYnUUEzFT8BbWWkZSMjBaMdoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220189

On Thu, Sep 17, 2026 at 10:30:20AM +0530, Vishnu Reddy wrote:
> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence. The
> current maxItems constraints for clocks, power-domains and non-pixel
> iommus in the common venus schema were sized for platforms available at
> the time of authoring. The glymur platform introduces a dual core
> architecture that requires more clocks and power domains, exceeding these
> limits. Raise maxItems for clocks, clock-names, power-domains,
> power-domain-names and non-pixel iommus to accommodate glymur platform.
> The glymur platform specific schema have fixed constraints for these
> properties, so the common schema only acts as an upper bound. Since the
> common schema now only acts as an upper bound, add explicit maxItems
> overrides for the non-pixel iommus in the qcom,sm8550-iris and
> qcom,sm8750-iris schemas to keep the fixed constraints as before.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
>  .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
>  .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
>  .../bindings/media/qcom,venus-common.yaml          |  11 +-
>  4 files changed, 236 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> new file mode 100644
> index 000000000000..de4792f3b658
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> @@ -0,0 +1,218 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-iris
> +
> +  clocks:
> +    maxItems: 9
> +
> +  clock-names:
> +    items:
> +      - const: core_iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: vcodec0_iface
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +      - const: vcodec1_iface
> +      - const: vcodec1_core

Nit: is there any logic in the order of the clocks? Why vcodec0_core
comes before vcodec0_iface, but vcodec1_core comes after vcodec1_iface?

> +      - const: vcodec1_core_freerun
> +
> +  dma-coherent: true
> +
> +  interconnects:
> +    maxItems: 2


-- 
With best wishes
Dmitry

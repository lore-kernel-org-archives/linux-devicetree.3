Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084856;
	b=n6eDtydwGYltk86/pZsUs92C275q9h55qhm2eYjKtjC/1/D+b4UBpIx0LJ0lVwmnmcEV
	 44rHVl2ZV2IhD8NmghdrH8mBwhKqjKoP3jm96Vcm2zmOSZO6L4JIg+L0N/uAWWetNGCb/
	 FvoTVuhNOkrxKESbZUUCYMRlEh6dgkuLw8Jz/f+HEcOCB4uSn8lfd3yKg6s2x5EbkqP4U
	 CPRweJn2AKLEX6eTBqfto7rulPtC/+K4yC8Zpg88BkJsmM7KwVOQgHOxU7rP2LV8SbDoq
	 X43dOayP8z+hOYRhM3k32Y9ic5CLSDD5YVd4djklloFBkpYd+3v0Qucel9hsK6sPEKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084856;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uWn3Y+Jdz87hhj+gJPn7knzbPk6e9lytITsJOXk9EDQ=;
	b=O0NTROQCge01GGaWXsfJVKTlgFD4sQ5eFA3aTMcN8Tk5z8/byYxJUjM22Dhurmankpop
	 vQovb7bgImw5JNLSOQisML8LF4GbTH5Sw8pR3VaD2W4vJ/O3LL8lROxsEmqqwIvzvAU5G
	 8jFjcazACmfHHEygPQp6Ugdqe9chTStygPYF5BhSXPwlK9oLz67UgHSj0r+aGnp7lA7zy
	 Ihrt++xM1XDjG9ESuislqOVWiISbaeqMou0otKqmg/5kl+EfRLrAjLcZhSTpIPuG91h95
	 0i01UU1nW97mHn7Bs4PEa84oplAWoIZVQUInV6l6HIagzAeGW4GV652cpzzhmC4RPug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKS44ki5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JbMVzEDV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45860A2600
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E45860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKS44ki5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JbMVzEDV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v7IP2030654
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uWn3Y+Jdz87hhj+gJPn7knzb
	Pk6e9lytITsJOXk9EDQ=; b=pKS44ki5JI8wObyvuYSumrjV1F5uMVnuWt59cV09
	bRFFE7A7VpaPuOM7Dbqd6ZZh6PASdsXRtcxjAaRTRTv4Rg/yL8IY9394U7Tp+qTe
	P/EAgkr5hs5MOLN0HRRZByTTjRCVXnfFE13AaCeV8l8svPyZOoxn9CCPUzmy+j3t
	X6WVigE6NAG+ZUoI/oRP9nz+eNVNwVLxIpYQmpFVgM/VfU7QWQ1wo1zod+v2I5Qb
	9wy6GIZMmBu6DArSWgh/sKYGOewFyTsUZY96ohYerxdWgsXiFyEksFx32tDmoltW
	UnQzyK5RQ0esjcC9cDasrNWusVJFhsD1Rc60qM41NObSYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kv2vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:40:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso443364085a.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 02:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084850; x=1795689650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWn3Y+Jdz87hhj+gJPn7knzbPk6e9lytITsJOXk9EDQ=;
        b=JbMVzEDVTonCN2k097ARRHghZWoC55YCGFr431+WiqeeVuoLyPDx4xDyArtZGpfbQW
         0J4FOFSWah+YdAOkWaQE3DKWAP/Go/mv7P3qfkhGTVtopAMnBtkuhYPOmuz9T2jvrc3S
         I2nhq9AKxExaKxIp+i7RHnjKB1ddMi4HiujIu+1brzgF/4FGoy8VZLQ2r23bHblsOuJh
         VgMXr59a1+eo93AP0aE23aKYmhSutVIFI7X+q4zwTTBz/754hXg41PWZ9V8XPWMrR9xZ
         0DZVneLhJ+tUJ94nhsvWgB59uQWo9ByO4/AuM0/qX0qqIVwetSnPgYNEEZEgt+2SRfzQ
         HWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084850; x=1795689650;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWn3Y+Jdz87hhj+gJPn7knzbPk6e9lytITsJOXk9EDQ=;
        b=Kq/lrCgWxGAWJCd37QtU9BV0tW6jr+I5P34aqfMhq2w1ZJGh1M8iV6Izl3MYBGDK5F
         7fz4lWH3wBZSPs/SkZm7CPMjXzLyOQ7U41KPzpXzzKCS8H6H7ZDlgIVxluo8/jqm2NKt
         KIkmp/gAYcnXN4Beh2gGOQr/jtNu3MnOqxsrQefmBZYMvSBUsYDPl+nmWXQ9zlwJRPjM
         9yZsHUVtinlBq+8erH+boHUaCdouHRNps6xUhUYpggs0dE3CnSSpFkaBr5KvKDRg8TnB
         KZaaKtlVTkWAYIhMEElzcnaehph4vSIuQotiLOJiIeTjPSZBjIKRCquqga8ks4h6vfOd
         zLwA==
X-Forwarded-Encrypted: i=1; AL+hErEdXH3V7Dg48gbB/ndZWqKLFwquptCglUGrj000bWTe7j7BWJlUY/Rbm7zgMb/qy7VvnLG+tgYsuAWw@vger.kernel.org
X-Gm-Message-State: APuU4Z91OyR4Jz5dOFqwdytte9yCJ2LYxATdBl/w/Ix1zl2brmscNn7N
	D1kcdpnKRgLYp5wogFo4Nlkj4f+VcTjHxs5/ugZXfHKdSYwLadBHZHPEzotfCEHj+SKddsQraCY
	sYZNIfseVAF2BcDlZ7sy1yKjdilhGZ0sz4/oay1kXO8igW34fuwkeOUOp8WY9K2fc
X-Gm-Gg: AYBFou3nAkOVSihbGpMDUxl8DxBjbKlw7EaznqAQP+8xRxNDNNfd3gouPcAuszxPVGE
	p7c3bBx5qvuF8O6XJqRKI6cMP9WVWfYKYNMQIhFkojLs/gG+iwi5wzlsrVSG29dDLMT7c5lvLTx
	FBEM+z6l+BKxi/PQY/slM2is4i0MqxLnuTDB37xndAoPRQs4r60utROYRS6PY0KNzbfkuCz1Z8P
	lW1K0P3cnOskpCRV3sO7wLL/9kYaDWwP4W7cd5snwCoEgTMwEdHi3/ytWuYXKd4F5vZUMkFkuxf
	c/3QeAmuQfbw6/EtRhaTfNhCGp2fEQCLpkzT2pMyJX3b5LIE6pTSlcmymYRubzpV4FnS7oUPWyk
	Ix9GfYo6AUCDW7ZNAU1M/sMSIjT+/ucJtQZADgyaipUA651zzmBlu2nUbQpACFH7t4n7EqP8Id9
	ezh1Uewdp05XE=
X-Received: by 2002:a05:620a:461e:b0:93f:dea:3b7e with SMTP id af79cd13be357-94999721e29mr990592685a.24.1795084850170;
        Thu, 19 Nov 2026 02:40:50 -0800 (PST)
X-Received: by 2002:a05:620a:461e:b0:93f:dea:3b7e with SMTP id af79cd13be357-94999721e29mr990589785a.24.1795084849693;
        Thu, 19 Nov 2026 02:40:49 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343607sm31483185e9.6.2026.11.19.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:40:48 -0800 (PST)
Date: Thu, 19 Nov 2026 11:40:46 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm: Support for GPU in Nord
Message-ID: <av7SLvRI48ZfOqU7@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
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
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfX5tw4U3nDvex0
 3FgTywLO7okwKAqe6XjiIr6SoojlK8W+yai7odzhy9l01/JtZoZxw6Oa8CX9pj/YDvHubXdFpnK
 M9xLd/pPi1101cbuZNY4GuShy84E9UnyTeuqq/vZGzJAS4Fuxrci+eLMI29fPAZYhT4vnU0Lrj5
 JjiebbXXgEv6TMJ96TxFWPHx+JX84+VFkD9XfK84fkF4Bvwg4b5oz4f95vwnA+EIDHvWpUjn6+6
 VsDiV2WATjbdmjFk38HWdYXKSJf7Hsp5j1DxQd/moi71XDuUtUN3iVF9tDJFT86qwftWePidLpK
 c4oCzypxBA1Pv6df5NYuoW62T1x37pb33sgcxaRxXQcjrBf+UwUieGG6nWjUjJahjzsoZ1R2s30
 LxKHhstewzn/RKn4jeZ9ljugvdl7PzTgm3/enmfo0r3ScIKbmgRHlMnuuTPf60a1MhuwBl6k4iB
 4tC5+4nOpHHjgQ8ioVA==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afed232 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-_VEVeJjoQ_3OyoAHY0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfXwI5Ao9OhnS3B
 odv2NhmTSip3sxarzEBoCnbKdwAfmmRDA9WDdJOoh9PBU1IXvRPhLZChab/5V2fSwAhEZvhcgVz
 gSBVUW+14H0wK/nq/vNQvOO1f4jeFXw=
X-Proofpoint-ORIG-GUID: YTVvjKBE3B3rh1yAkX6jBo4x_WrjhVnC
X-Proofpoint-GUID: YTVvjKBE3B3rh1yAkX6jBo4x_WrjhVnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190042

On Wed, Nov 18, 2026 at 04:30:03AM +0530, Akhil P Oommen wrote:
> Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
> an Adreno 753 GPU which is very similar to the existing A750 (SM8650
> chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
> This series adds support for the A753 GPU. A735 support will come later
> in a separate series.
> 
> The driver and dt-bindings patches are for Rob Clark and the devicetree
> bits are for Bjorn to pick up.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on next-20261116
> - Collect trailers
> - Split the GPU and GMU nodes between nord.dtsi and nord-embedded.dtsi to
>   match the existing Nord layout (Shawn)
> - Moved the GPU cooling maps into nord.dtsi alongside the thermal zones (Shawn)
> - Fixed the GMU OPP table to match the clock plan (Konrad)
> - Link to v1: https://lore.kernel.org/r/20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com
> 
> ---
> Aastha Pandey (1):
>       arm64: dts: qcom: nord: Add GPU cooling
> 
> Shivam Rawat (4):
>       drm/msm/a6xx: Add Adreno 753 support
>       dt-bindings: display/msm: Document Adreno 753 GPU/GMU
>       arm64: dts: qcom: nord: Add GPU and GMU nodes
>       arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU

Akhil,

For the future posting, can we split driver and DTS changes?

Shawn

> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  33 ++++
>  .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        |  79 ++++++++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |  12 ++
>  arch/arm64/boot/dts/qcom/nord.dtsi                 | 220 ++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   5 +-
>  drivers/gpu/drm/msm/adreno/a7xx_catalog.c          |  35 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
>  9 files changed, 361 insertions(+), 35 deletions(-)
> ---
> base-commit: 38c8be16846f10f3a710351357e4f4ace7254c8e
> change-id: 20261008-nord-gpu1-7e71a91ae653
> 
> Best regards,
> -- 
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> 

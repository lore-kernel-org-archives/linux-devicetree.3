Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53879493D47
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994785; cv=pass; b=h+VW0DhjGb3J8hl4dqSi4RGSA1/CSjozexZPh96UygktHfgOZSvIgfWeBMIwVqUBK8OXYn1l/zyVtJluQApb/Z3HASEjAEOX4j5dlyNz2ScuQNaKJNcVzzwaxI/huyXMuc0vcCvsfs8XNlQgvjQCxrUl5wuxm9qxUFydG4BYOVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994785; c=relaxed/simple;
	bh=zhes51yOam9nrMY50t2XhGSjaWOq58zdOVkwQ6/JTTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcwFbFT9OCM6uyAqZCJmcrlNzNcvoSsemXvX9+D2g72mjqHaLcwHL/5ctz4+VVbz4pybtUgnEhTdk+DQK4YqBuuOJeVv9WYYBM6xErNN57xwydUUI0Ez7mwE9p3PCV/8jcSFGvn2/Iaff1rmasYWsoXBK56ju9KSLJE4S8+88xM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDV/uRKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOEseVby; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDV/uRKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOEseVby"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe1xx1563503
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=; b=FDV/uRKtPIY5Te0O
	/bQLtP7WCvqplyZdNh/yoW+2tP/GxJRj2pu/B6Bsl0tycX9TtwpAkZ2N0+iOYQKl
	JoIpLSfJsY+e7FBiFpYhQMo6g3XgQhIwE1nJh3JJb9MfQWsyWEC67O1f35xHuyZX
	z9qj1VvujtNw6wroAqLSizpGFKgzMfc5UYFj9zFzgjqJMMEnIgx1EYa5V6PwjB2a
	eidrXvUd6D9+bsRQYXBngget4ljibpHdqFk+dqh8Azy7g4c/vHo0NXQIrO3go1Ax
	kN0Go5GB7uylS/SACc7SzmeISBCOdGJhbq82oCS0UvZ4gOSftSsIEswUdfChrIa7
	CyqGeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw1ac1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:46:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso11213a12.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789994781; cv=none;
        d=google.com; s=arc-20260327;
        b=GxERSJxrKpQi6ho+6tIYMNMIUnpcN5DAfU82DMnQj4JYqshWWqw9HqMuwRrQhV5Jdg
         Bn1D+eVk2XXv5zfHLeVBei9mWjtMn6cQgntIR0UAxjNLiKhtGnYrUlgQciPzqkzefq9H
         ReB+Czv0J17xoVov7q8qmZrNhr8i9y7ZGDjrBn7AWo5zR9xY4Lb492JyNqJXjxaHka2f
         lsvKOQE1McNeZ9PVwT1HLkZ4zkptdeI97A0z+BAvCNW4d6eekhrcA1/5cB4dpUvXbPaE
         DlS9WhblJaXzFMjNbQGH/yyYFCA5c7C5fK4XMsKzU3Okt2v0mSYjFtMfBIFLiQkB1Nyr
         tfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        fh=WLxTunX9hnaduQwRGwnbzDOK/fZHCeTDC/3xYje6CaM=;
        b=kori8OFhTZ/S4dMCsSdtetpgQ+X+WgOOtb7sRZjNiw0KpsMLwfnKL09mJxRg7OTlJx
         V1UkyEUEaaEakAzUkml4XbITBwNLCcy2U5CTF2ZIzeHIMtF4IwWtSaCa8GUe2jmhrWoO
         96T1jY2yF5vU3ZLGaZHn5GkE02Y5K7xSGCpTJ6cwgFeaGq7un4xfMzNxwdaP+U0rW6Q9
         D18vo2vJU/r8bzI2Arq0ybGuCjdfPYtdipWmBIwxyeoPtAwTw9qwKmbwfO0C2RN2ybaS
         4rjqR1bnDfmG6yjkaUW4/biQnPjK5ysElsT6wGS7gjfr0ri3MMQJR5PBox5oy5xc2gez
         Su2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994781; x=1790599581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        b=GOEseVbyfZNt7wUgeRrqbxA/hDoOilk0zGgdb4pVahg5gGMpTFbVBkQ6JnWUH5UWu1
         VNZlH/kN/7KlOGMuMYeXHyt5RtR8eCUIPeiH/ddXTJuDxLFp7HIwzvXIdh8limPRjw/O
         njsFnBsRrSuW8CdY0UFknGapmraoPh3gDSuwtf25yY64LUzAxFNMz13V5ENSmpMOSTjh
         HFaXqeEBR3DMtwSJFvhT1Qh+k+kvQREycV3d4YcqmWEohMitjkZ+eMpLUiezdbK0sN+y
         +85YR0UTnfdkbW2N82ZeyA/QysuwSlbh9defJMIRL1ebAngAcwJDjar4r1HeWKtPFRlN
         OEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994781; x=1790599581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        b=g9BWDcoC6nhkuWCvid7VQB5aVgO140PZObtXLFGRPUSbGoJmQUpPbI+9BWSJ0qyysP
         k1qCiMzTZkq/lODO9n52WKaKYB2nd6jpsaZA9Uu6zIHWuunbZ0H/6gPg+b7+UoFVMj/B
         GHWP4rQBs7JA6UPtIZcabAhELqqPcMmJIK1Nv4rVGRoohtSpDh6zMCL9JXxQogEHPoA+
         PMURoHlHf4nzIEgwwta1DjFHHDViu60l4tyAyEbBlZjmSWpSVIIjripvKoEhcbQMyUbJ
         GgT6guuIE0heCSOY1E+rVxSzAvmRZ0HL4mcwfyvV9RFWBp2SlfC/UV+hU5+SLYSklL8h
         bSKA==
X-Forwarded-Encrypted: i=1; AKwUvBxyO5SQilsjzNCEg6AYLmYpy+mngDGR5YFNjeO9ozyi/enzQuaySl0MCV+CX4Wh1FIpdCCb7Bc5GhA4@vger.kernel.org
X-Gm-Message-State: AFuF++lfnJ1nNGc42kzWVwkWGsmorQtpD3gNuO7CuxKpwMjICibHZOiD
	u9UYCADlXVVtm/pmd5A6uXh9rRn2upbxdukwHqNrRJphJ+Z/n4jOo1lRR+VJhznrOPCSxNQQBXR
	dpPEGrcYtmxzM3E+mEzUD/uhT5fJRr5O0NIERXhpA2j5PPpCjYXUZc6AmslFhG2RtnFEUJCcOoK
	sYcdPEKSWW69L9jkd1dhxmmubodViE5130lpVtEII=
X-Gm-Gg: AYBFou1lpbLztoLjY50c+hH6K6GmEIipFIbPhCusmW0Dv2AzhGLHP4wQYJvGw40dXVk
	y2CzHi0KKa7EbyVWjET8CHfuS2cRT5ReRAs152FbteKfvPQz/sKTVeN/8HDa8ANLq0aO5V7ivGW
	+ft3LlOZY1LhX+R6IEsBzr0axXJNAtD5ZdH+UJb+TUTibjWbOKJ7NGsG7Rkg==
X-Received: by 2002:a05:6a21:6f87:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3dda197f85emr11235070637.57.1789994780992;
        Mon, 21 Sep 2026 05:46:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f87:b0:3dd:a197:edea with SMTP id
 adf61e73a8af0-3dda197f85emr11235017637.57.1789994780421; Mon, 21 Sep 2026
 05:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915104328.45901-1-gahing@gahingwoo.com>
In-Reply-To: <20260915104328.45901-1-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:46:07 +0200
X-Gm-Features: AcwNN1X9mUUfG00OJyVIt6nOyuDWy2ZSHbWKT6BOlwyDwHXMMZbGC4tmToAM-O4
Message-ID: <CAPx+jO8EixqfXmrD8zkMkJe_B+2AATo=YNFJraAdE_O9X4KM-w@mail.gmail.com>
Subject: Re: [PATCH v13 00/14] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
        sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
        u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
        diederik@cknow-tech.com, alchark@flipper.net,
        dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NSBTYWx0ZWRfX+H9gjiemjWJW
 MCEgjAO91AmIFC6cLxqSVIO8VYBWah/JW2hv3tXZ9Zn05ou4WuK6Bxc2FEC+F4v3/A5wXjahVK4
 TeeO/9nWY3ClIkaGwnIzSx/1P6R94WIoF2uI1fl7Dp4fjOKuosuUq5APrmZwGzBOrILq4LO9TPm
 gptIPBfIxFZoljk3MsYL7uxu1n0/IokzW9TeLq2dRY+U67ByZ48lJ/SSJDgXbGi+OZ3iwbzrUJa
 QL3WgvbJTyDbCpyRai/qut4Ck1jQFfDUuSaA4LH9rtPZNs0p2cDAfq3HMIYgBfd4kymFLTdBFKt
 ayNU0EMulQo39UWIq8bVfxe/PQAyODiXwk0LygxxLSWAjbAAryC3dZd7y45nSWDIBtekp1mdwEV
 MPrUxJr1ePD4fgBXZnnrElDE94775vFwb0OJeLg4v/sv9Z+pDerutl8xHeNsPgz7lZVHw5vlRHW
 +x7s0NwSAt+RXroDg9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NSBTYWx0ZWRfX3SlxgHsT13YY
 2WIeRPRzNUggUMTtRI6KFjCjCTdYP97PNO4CdcCeBT+qjYaDfnPyrV5EyrQV4NJuQeKd9a6LlzE
 LbKl72fILdqDW8iK2ql59ZQDn6GPbSE=
X-Proofpoint-ORIG-GUID: iaJ3gIyAsT7sw2sPza4vhSrs46aDpw-a
X-Proofpoint-GUID: iaJ3gIyAsT7sw2sPza4vhSrs46aDpw-a
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab1271e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=9GNsruGHAAAA:8 a=uuLM8HNXhctW1a4qv2gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210185

On Tue, Sep 15, 2026 at 12:43=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> =
wrote:
>
> This adds the RK3576 NPU to accel/rocket, which today supports RK3588
> only. The RK3576 carries two cores of the same RKNN block, wired up
> differently. Two extra convolution buffer clocks, two power domains per
> core, one reset where the RK3588 has two, no NPU SRAM rail, and a
> PC_TASK_CON that packs the task number into sixteen bits, not twelve.
>

[...]

> Igor Paunovic (1):
>   accel/rocket: request the core clocks by name
>
> Jiaxing Hu (13):
>   accel/rocket: take the completion register writes under job_lock
>   accel/rocket: wait for a running IRQ handler before resetting a core
>   accel/rocket: let the core suspend after a reset
>   accel/rocket: factor the completion tail out of the IRQ handler
>   dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
>   dt-bindings: power: rockchip: allow resets in a power domain node
>   dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
>   pmdomain: rockchip: add optional per-domain power-on settle delay
>   pmdomain: rockchip: cycle optional power-domain resets on power-on
>   accel/rocket: select the per-core clock and reset counts from match
>     data
>   accel/rocket: add RK3576 NPU (RKNN) support
>   arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
>   arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
>
>  .../bindings/iommu/rockchip,iommu.yaml        |  28 ++++
>  .../npu/rockchip,rk3588-rknn-core.yaml        |  47 +++++-
>  .../power/rockchip,power-controller.yaml      |   8 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      |  22 +++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  86 +++++++++-
>  drivers/accel/rocket/rocket_core.c            |  32 +++-
>  drivers/accel/rocket/rocket_core.h            |  11 +-
>  drivers/accel/rocket/rocket_device.c          |   7 +-
>  drivers/accel/rocket/rocket_drv.c             |  42 ++++-
>  drivers/accel/rocket/rocket_drv.h             |   2 +
>  drivers/accel/rocket/rocket_job.c             | 151 +++++++++++++++---
>  drivers/pmdomain/rockchip/pm-domains.c        |  83 +++++++---
>  12 files changed, 456 insertions(+), 63 deletions(-)
>
>
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> --
> 2.43.0
>

I assume it's fine for me to pick up patch7, 9 and 10 from this series
and funnel them via my pmdomain tree. If not, please let me know!

Kind regards
Uffe

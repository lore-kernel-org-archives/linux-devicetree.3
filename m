Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65C4D2ED8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527554; cv=none; b=XWyeI7Nh9fBKTmcAAHZnNa8v1Plhdr8B9wkks9h8sll+EnkzHzvK+L/TwK2W9BxCEs1r1v4xLUVtStN9M+3LBlDe31tUvRTavW/8IbxRmMwW6cti2Yny50Kl/YMnIpoMnnVTulzmvueaPadaSBaQoyCwcFVhLWXUkXZ9hB/86Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527554; c=relaxed/simple;
	bh=RoiQDo2vHkOIYi8QYhXjdnc885eNLNOiDk6hnbsmcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXMyrojT1mqNH8nm9jKiPZN4JHhRYKShUpoMwfgUcXXABHd48HX6Y4PQlLFeJ0AsVpY9trT6PyB5omyeMlnxfczQZ+RdI6ZQoEzsZRwoEK2/rppyFJ7oQisFOZoSNvfgwrDbgZrz3kEgoiWq0muSZ4xrcfu24HjpR0kIe8s8szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUsHQt0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0hemTnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUsHQt0D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0hemTnA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653GoCCP3552136
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 22:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONnM8cPGqCvQUEArvOdVRHLA
	7AjrNnYCfdYyBl3uu6Q=; b=JUsHQt0DxYLPJKgSTR9tREQC+/92i/jaL10JeZka
	jx+w7LeQXnnmF1WukUK+kcEWnvuxt/l+kFvuthhHCI4AaDnS76xdU7CZe4PJzwyz
	K4pbBszfCfx+alv7S7iFmtT9ExLdFXbo7XeJLWvND6VGIKR9I6rEOyaIC7iQ90Xg
	9iCkzFtDeVSeFE9jXjV05X+B3ZHU8eGLF3uNdxHjQ9Y5yb4DSJt1nRiG8no/6vX1
	96gpOiH9tdw6cUja413gftwtc/vaKQ+VyGGi+jsd9T/Go18S/qq31wYXJCMNU+uF
	jhitbT5yARcAW7GDcsEOVJ2x/bh93aalFtYzYhWqyr/g6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mu2ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:59:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b2863d62so53268241.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527551; x=1781132351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=S0hemTnABc55P2MEnw2s91jIzBAv7AzMH8b3cG7jrMijv4v2Y7hOZcZR+k6RsDGVJ2
         Spl47iP9i0iV4PRgb8kDABjTu9fBI/vDZ0O0nD/UbfGfMc303Pcr/5bUzrHhKcLQ2lh8
         t+0H72svZwVSduEaO5fApNiYYd3rI1I0y00ejuOfLm1tRK+egBfHboWeBf5IXEArn8A8
         wHsNNaDU/8gGf175JaDRnsExwrpShvNbCDuNo//EnMh2eOIbLC29BFCIahJfJ3P+8/KM
         4yZ99G773Cjs4DTVZJ0vdwORQHXDYbV4wbBkgoL4mo9zj3uwybUbV9JsrW1Mx3c4gmVx
         X2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527551; x=1781132351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=eVUs2/XHrnoBYXJY3GPC0M9DReOP2TePZtrN8B3va1gnAH6oSOm/GpDvTKs4B6lE76
         TRh4dGPiCSmnwSII4VHS+LqsG46EiEsijGi+jEKJONo4ZhrNSSo7MDco0Kf+VPVC5wtV
         3l3kvUQsFZaqsBnfmP+ghXegueLfkYwPM3kDY+SZ1NFthStpf4KXPDeYX8G3o8k4wx+k
         i6xvqxk3e0yU7OHo/iGePRadyOb/M6ErTKFhwaqxy1VFCX5H4JTGCuHiQTVWxP7wzt7I
         NV6pVg8sS2PfN7gEf7hvfqwkgg7RVNRFxk9yMfPdVGu96fOjCPtfKTdQXg6SnQyyO1D9
         b0Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+L0EwWAFPsGOgtSfnBtz9BfulSCoYzwDFHqS9PhOg/7Ky2/HT2svSf3BwMxGWAGoAJDZZ4OcEMmbnb@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDn1rHOdgOUD4kO3z4MFbUbmfvSfbldyS9ZPJ+PvofIRoAHFj
	MnyODsl33iAnvVgryyXOFq3XE64PTum/UVF2E1Fx8nagEvs8mgiwyegJd1I8gt9VySlBZrispCq
	7Lo0ZRGYgkJD2w7ZLWwo2pRr7DBN1ya1SbXlPHrT4iLw4sC3gm0+DWl60UQVXjVAg
X-Gm-Gg: Acq92OFmXbPOYiNHxeXlhRn86gTuH+WQTRL4tOeIRxIwL5bnnVhZV93yaF1UHVIASH0
	qnCqTQo/XE201PuUNZp2LIBm7pMpekFY5kASolsdUiyCafN/2eLYJf9AHKyZ6kxMN2cUK5J0a+n
	7FhxWSMzD2FaLrfLvbMNFU8zJE5MWJ/F8Wjysa7tv+8S7UsujUCGkX7CIWkC+HUBVGIPkATTxt1
	u25TC5TkjKCYSW7WlRgXg/AvxVQ16IynKupiFeNMIu3wuB8nWdjs5Cr2fC1K35hU4oUEWYeAqbh
	sFTNaSrlRLGuxWLKkMIcgmynY5eaee5yHpJPa2tZ8S059k2UsJKM49BMsh68ybhs9kyVkNDponx
	sFS2asgIMCq1/3wPWBrMMx6hgaxv1mu+0CFE0uy4wc+85LNlpyDzsBBxp0OFOW7BWuzHd86H9Lf
	ALlP518BH2ndItpWVRu7n1AT0sr8supAk2iXsb2jo0ZONV1Q==
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216900137.18.1780527551690;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216884137.18.1780527551258;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac29sm880386e87.52.2026.06.03.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:59:08 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Julius Werner <jwerner@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
 Chromium-based /firmware
Message-ID: <pfo7vpd3ooiyfuo3wjom7qzknnnkiyel2kdu5fjqqrq5nccysq@e63rs7lgdfl4>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <20260428200712.2660635-8-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
X-Proofpoint-GUID: s82ysXMghn1Gh75TBc9P-kuBHC1dB3RC
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20b1c0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=MUleZ9s-AAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=iD_vE5mCeOLV2fS3_3cA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=f0F4d6ZXEnSYrzQLsEx4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNCBTYWx0ZWRfX6AZYJY7hzDX2
 wuufOst/GERvdrJIqElXwIsJvcJ54L6FuqD/jE5i76/qnbtuEj9oJOfoZqxHN3tLXdTzDkDZ1BM
 RKZTGbiiQlU6cLE5S4/+ZERVhUUUU32b3etHEas1K76n0W55M7iFBYgtgI80e2dqfawvS90wgRJ
 anZWY5tVtAQ/dtbulvv+rHYigUkA6bRsQPzW+1hDel1gOmPJv+AJBQt3Eu7KMGzjftoB80APi9j
 hiNd4XMdeMQnquROVHqYmY9OTSFzi5uKyaBDsUq7/8ptaHJ3Ovh8Oea8+Q8aWuxQUk1hZ36zuTO
 WMztmJJ1icLgNn5knRX2ZeZg1DjnYPfgW+Y29ZD3AHqwGVxiQ8wRcv4LFxNFW4dE09Efaoyqq+q
 Gxj1nqsN7IPgA0dADaDuB3Sjt9O1LPB0uZQnHsSOkrM2vduZp2DYdfAuQAHZff7VS4dN/b24NMc
 ylmlijBo2ezkWIiOphg==
X-Proofpoint-ORIG-GUID: s82ysXMghn1Gh75TBc9P-kuBHC1dB3RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030224

On Tue, Apr 28, 2026 at 01:06:59PM -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
>                 coreboot {
>                         compatible = "coreboot";
>                         reg = <...>;
>                         ...;
>                 };
>         };
> };
> 
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> Add appropriate #{address,size}-cells to work around the problem.
> 
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
> 
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
> 
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

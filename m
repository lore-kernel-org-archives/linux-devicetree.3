Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240E024BBF0
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722679; cv=none; b=SKCpxDqxwcWT55TPrVftkTEQ8ALUGQeZywcZwpEf8xnlQ8vgbOV6Iv88f8ah2cOeGaWOWgUMwNlGorU1OvPrBbilvLe5HEqAkJdqVsItb70J2Da7IiJYDWuWzuC/9LCdlse8fgvH/YQfWjel3VvTfM2fp99BAMSFBQ8hpQpalfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722679; c=relaxed/simple;
	bh=Pp7CzaUNan1GgAKYKdMXo81H1EROhXGbCrOtUoiWFEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cELKMm20TRNU8H29xf8ENCUNYXtcQ3f7B7lBz6811mJ55AKetlHsrinJ6+1F0gZXZLL8vFuyPnjiXFl/g4gevzovg3ntQkLATQEeapV3wskOAlGEWaPCyZiAezuf/SEkHwQMlPM9k/EgCy83H5HpM04N/kWIr4RRfOyvOShazYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQ0sC51c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7/c1sCG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQ0sC51c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7/c1sCG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xds1123857
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zFADLEvI/qGdS1XKXSZzOMH4
	EpOSXlY0GIxunmujHh8=; b=PQ0sC51cKHxZauomgkIaa2PQ1TNzaGEv168JNE4v
	ryjvjGL/djBzVIFMMZOI1hoQ7afm6HIkT7Y/WbCTqRdSP4znHTKoV9aDiiKlr+vb
	eSZH6vbL2ijIOb9VffgNvXj8maT4wz4+hwM74sv5ohUY/oCZP3SKgv7ReEOjXSnK
	FIb42VxLv/z/fOERX3DcCYVNeubZaojXCiSY4LLBz6rLxpFznCZYR4g7//ZxZw4R
	yy3Yn7yI5zlL3e1WMt98ebKIujtI6XB0MdAGxYYbgL5/Kb1TVJLrMcMflVPZEWvG
	1e7oog/n2yZCFVNE+l0/19YzNpUPDRxZ+Y5PFJa9/Eihsg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4t23h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:17:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f871so238226356d6.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784722676; x=1785327476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFADLEvI/qGdS1XKXSZzOMH4EpOSXlY0GIxunmujHh8=;
        b=F7/c1sCGk1shN68oUPZtzVzHrR6rcFD7Hup22H5PYK2WI/QfbGOuqT0MlKx/xc76Ok
         VdrAYmlv6hV3c44Dif/0YKxrJkcLUx76p/07Ra7F9YcJirAGlySS7vrAjeA0NaPpgF7w
         5WLZv/qoF03XyB6wGhVJ2WQHDL8+a2BGVA2gPlryVzPG6r+pgxaI4D1EGpxtvDa7ft4o
         7crwUOoMsOag3gMkIX1gn6ZGnp9HQ2ThCPjnZG/Xw6a0u/jOmS19SiSy673qv2Y4i3sp
         MWymLmXM6JSIH4VSMGcP1OSExJs4zCxpC9eW4bYJJxrX5gMzzDIRVaHNZxuFw50wwOzs
         WAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722676; x=1785327476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFADLEvI/qGdS1XKXSZzOMH4EpOSXlY0GIxunmujHh8=;
        b=Z+BqjNX0iHJqZzb2RWguVF/ctOSfF68Mq37tTjJ2H0tmgfWqBovVqDCMZtiEWWMq6W
         lHUa1yXfOoG6kmysN0VXT5d+ROaQACblnYHKPXBI+cZ1uOIs2AXZCOljCRFd6W0YN2Ll
         0557taP+nuX/bUU6GoY5o/+zgCVAMuyB6HIlc0LwoHqr6zrbn3iee4ZQ9Z4oun0Q+WQA
         1d4++s+JD5VhUyHiYLMfEec4YgsKt3TFhn8endGVqhWyawGRe2n3bS5VgkvvPQETu3WG
         FPKTWpqnK46B31VDcRQ82BQ+528p3THT1Xfrm08ztsWlgJM0HkRQtV5kx9mkA05kamLR
         hsfw==
X-Forwarded-Encrypted: i=1; AHgh+RpBL9PNf8jDfMdPqwI64efGJmzfIQZldrtarkQ65IhYuFcnZPDOBFegmNTYpB5rHGFL/qFTNHXjaw4q@vger.kernel.org
X-Gm-Message-State: AOJu0YwMln6MhGpnzSTQWwCthu681MEe/fXmzENUScNLc7GqWXdtRBfc
	2VavHqCEpuO3zjaB4PdecYgx+O/yashLZiVBc7cuKb+TtaXs7vSgRe1i+lNgLtl5Bdcu9pVtOwS
	Hdq2PVSLNUqEs2S3UIX7VsfEhXFDS2Su9RFgRtFRrZj7vRgLvEOVuBRk0Ni0+5e4I
X-Gm-Gg: AR+sD11yMAJx5FwyKJqA4ryf+Z1sxXRTRQG3p7Pw7Ao/ZBxOReb6W8Lv/EzQvvNyVxE
	9WnqzYKnGIQfOGASJaL6GOFWsgbJ9YCm2CkaXPkKwkXqM4pVaSRgk8Q5j3Dziq51jVA+n0lBKbp
	qw9QUkw+miWFUY7VRPs22StoZPqifQnT4jam3qVMX3jUr4PuWVxQH1E1rTkf6a0QAPWDtVlh2sd
	IX6heNlOxdm+7TebTEbBpsYhxGFDTWXxh1x9U6cixqqN0FrkbWdC821pKDAA22cOzroHQjUYaaG
	MAyTh5SQ7Klugz5NL6/MN53O3pCEOVSZkgFoh5haLaUEErKSN8yjhap1yw473wPfx5PwxKCloCo
	4pPfyo4b17aX1bNKvIDZ4AYlMxu6UKnsUPwArcvOtUoadcyvVnGZ3oUhvmAGRUsAcM8/yVZrhiA
	ncK35nTKIwkho8MQ==
X-Received: by 2002:a05:6214:2d48:b0:907:c31d:dfad with SMTP id 6a1803df08f44-907c31de507mr8947966d6.9.1784722676359;
        Wed, 22 Jul 2026 05:17:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2d48:b0:907:c31d:dfad with SMTP id 6a1803df08f44-907c31de507mr8947596d6.9.1784722675876;
        Wed, 22 Jul 2026 05:17:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8bd17sm3985571fa.38.2026.07.22.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:17:54 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:17:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pavan Kumar <pavan.m@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: qcom6490-idp: Add IPA node
Message-ID: <kdbo46iqmo2oxkdrjjkoumab7kveg6bmgijbqadi6aknzhuj4a@eo6ditkssiyy>
References: <20260722082314.1502072-1-pavan.m@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722082314.1502072-1-pavan.m@oss.qualcomm.com>
X-Proofpoint-GUID: EnLL12-Qh8FAhhSQ3VunUJUU05LSOKxZ
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60b4f5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FyoPX5VLu3k4-qMXoUMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMCBTYWx0ZWRfXzkS+FR2GzKe8
 W6783ecbv3HStJXrcbjUe5iEL89puZgOw4SRtwR/7lLUlT1VUF+sWAFdr3HzJDVYicghbyacnM6
 0ccxzvXpnDRGqEVU9OpdS/SWVklvOGfLGWVYCjE8icuBBzkH66bl9rSyozh0HVmurh34+8ffIUA
 /fZ09JiM5KpsUxCt7CwvR8yhh/EQ69Nmi6o9sHcEUGFTkicENB28+9SN7ow/exyUpSg14RThBCS
 XP1DDJGGJzXCXYKesuA0qjNplnwY4uy2z4W+gQuVuKsbLIF+x84UlRKjeemPNVEcdCIyBfXPV9P
 UZxaow7m/W4UGdvoFgeAclnbkpLBcuifw6ixp/YzVN4BTmCmdufeZlefa04SGENrhlFIFdwkeqh
 ybhvAlw/O3WefKMF/TOf+6sG9yslMl4KhfYAsmRqUq0nxF5PlqUaTOGcqHuSkYczUfXMWLxTXFN
 ky71Bg7d+DPeXQNb5pg==
X-Proofpoint-ORIG-GUID: EnLL12-Qh8FAhhSQ3VunUJUU05LSOKxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMCBTYWx0ZWRfX7jGrVageqwf2
 dxfpvqWe40k+fwC8S7mZy0ewKd773nbxlXOegHwEkJC9M9+8nk8GAoVFKBAZNlwWgYy6KD7C2dg
 +oPFozYJ9ATWyKitxA6yBMg20bLnvRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220120

> [PATCH v5] arm64: dts: qcom: qcom6490-idp: Add IPA node

-ENOSUCHBOARD, it's qcm6490-idp.


On Wed, Jul 22, 2026 at 01:53:14PM +0530, Pavan Kumar wrote:
> Enable the IPA block and provide the firmware name
> required for firmware loading on qcm6490-idp.
> 
> Signed-off-by: Pavan Kumar <pavan.m@oss.qualcomm.com>
> ---
> Changes in v5:
> - Reworked commit message to describe the functionality being enabled.
> - Removed IPA property consolidation explanation.
> - Removed obsolete Link tag to IPA loader series.
> - Clarified that the change applies to qcm6490-idp.
> Changes in v4:
> - Removed empty line between Link and Signed-off-by tags.
> - Added empty line before the status property in the IPA node.
> - Sent as a new thread instead of replying to the previous revision.
> Changes in v3:
> - Rebased on top of IPA property consolidation series.
> - Dropped qcom,gsi-loader and memory-region properties as they are now
>   provided by kodiak.dtsi.
> - Added Link tag to the dependent IPA loader series.
> Changes in v2:
> - Modified firmware file extension from .mdt to .mbn
> 
> v4: https://lore.kernel.org/all/20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com/
> v3: https://lore.kernel.org/all/20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com/
> v2: https://lore.kernel.org/all/20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com/
> v1: https://lore.kernel.org/all/20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Other than the subject:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

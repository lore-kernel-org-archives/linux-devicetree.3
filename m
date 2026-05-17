Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E9433987
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779019182; cv=none; b=gxD4ewWMXtkY53kRqRuKlU8wV0BbaohHVNLeBDdjkN07xoaCn5bbI4hrhKVpzbVrGQZvhuZZ5JGeswzAcm+5r79tdJm58DelEf15JaqeZypqlVXghhl2/o0wbRNJYquD5T3NVUOadfLrpw2Zsk4R+yGp6xtQRTqn8yzpEsP3g6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779019182; c=relaxed/simple;
	bh=uwcAosqgeuh/Ws6oeipHKBE9NRJcqMoNk+g2JvGoW4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5Rrv3x2uHLoqZ+KcDb8HtVusjiJ5Pm/TC1vga7Akf/jeDIlIUKN4Dvdh5tfwapjigyOQQbYB40koog0/7k0aLz0MzVAwhKaWOkPaj3jeW7Z5z8HAZWDeybjxUelWieFWful7VG86cXEEGgcfuyGyPCa9yyBRdxrgpMy9+aTf84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCMMVceB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSVTB+Gt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCMMVceB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSVTB+Gt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GHUMEB1146717
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=If2VTiwv89luQR2PmL2+TW4D
	swboSIiiteX2/ZQl/m8=; b=gCMMVceB2mNUoUVgavly643igLSb0diRz+I/5fG/
	yeyEUfH+7xIe63WEAAOXYKMG5oztK9rIF3qAcFJucuXK0dUjL/IPjYsolSOJSuhh
	dD7qkD6Sej3ZDU9hGqMgRGzfmFqbK8mmtjbxodB6RJL+hBBtFZT1Z54yh4JCIi6g
	vMj0MtaSuhXgCWGevgIXn1mxZDM8gsyb8/k8v9Vl0XJGjERKwOB/wKXhF6NHryXJ
	LdQ9h+19UtuoBiwaP01lLJZjBVFdz8yClM2JcRSbGMhQTCaLG7X6kEnzOU435MsF
	cxLo/xkPPQiOhjhdsIKWlFd2RVh0jIXRFSwHlq2SeS2v1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqtry2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:59:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso49733221cf.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779019179; x=1779623979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=If2VTiwv89luQR2PmL2+TW4DswboSIiiteX2/ZQl/m8=;
        b=SSVTB+Gt7uOyfDkKdLUok4S4JBWIaoQChoie6nJRjPk1eVt53mCl1wdtQRAoxON+z/
         5wRDy7Ej3MX2+6ciBMfgf/GbIntA04NWhx3dMbTOvubRrYoAepKa46GoX2foY1+49WIz
         RBHFn8v1CsCfXzfsEShIbMyOmGjPwmdhnVbDHSuhV6H1a1+0g/eCENvnOVV6fSE/q3kv
         OwJ608dGgNVP5ki96xxcBzGRv8un8XTMWCwnY0Vh49hG5t52WSmQrpkonRD2MQL7lM8i
         w3LuzawqEo/H0lcMPaKsUe05NYclYf+gZQKAE+B/VFmVE2IfJFnpKIz3ISBkeNI/5tiX
         5TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779019179; x=1779623979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If2VTiwv89luQR2PmL2+TW4DswboSIiiteX2/ZQl/m8=;
        b=ERj3sY262q3WT1YRNPRW6kIK/36EWXUY2/X0eM3RjDSTEg+MmyLpefagG/f6cbHGNi
         TH0SdkXdf85jl7yx6DZcEwKkE5IPGGSACr7WmRP/m90KfflVLzRRHBdWcrowwqlE24Qx
         o7+TIt+dIPNWIWrhBH6uh1YEhLIMxgXPCc0Rh+trtNp3oNQmCS4uKPk8dQIZ3qn/qfnN
         K7bg83pycNhFkEt3DzbxOL3uRVNfpI/BhmkUkkxerbJ/FcuiO3dNFmPf+vgmmH8gov/a
         3x5kpfRlHMbws7+Uf1duJ/hq70wgfZWrDbO1bCs7XUa5opqDUjH3IXgiT9/K8b11juu3
         ZalA==
X-Forwarded-Encrypted: i=1; AFNElJ+na/ucDWUrfsQMsMU0+VWPiMINW2bo86VAsT2NsPghTXZ5KSg/gZYR8TSX373VwMoPEz4kIY6Da7c+@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmUcrR4yqD8OY50dGpxCita6VRgSHouE2ZJddudkOHEh1BVCA
	dTaHk8ZVr+8z8rdpksCciIDdsRrI2D8glkCidVlant4UPOflpuVJP4yqseHHzMa1fjfP8pV66tg
	X/tTuFDD/xICM2riu2uYnC28MJUPRL69K852K6dm0Rjo+9dRjG+FyXeJsmA/sd+00
X-Gm-Gg: Acq92OGtrpx9Zeyr6gWuLfVD+4LOM+gfOmEKyHBj8FXH0jrd1FFjzsTs96Aas7D1Ijk
	h+pwuZG5zW97N5IlzsEaBRiKukYAoiAXION9MVJnlSoZyV50fGQ91BMHvrXi1dySNTge1rqwRoh
	JGu+GfEi4xIeYX0ARtIpKbGy3O69HL20bfyaVyvqw9q7hb+n14MpLvrk8hnQFQ1nz8IyLPOsnnW
	vCW7l6mEbZISLliYhpdSWEvT9G83YlVvUGgPDia2M2ktaU70/38NG5xmcnGXG4DJV3ihhWLW9po
	8m036qacOoTcTEOrcGWMaLCEZumt9e98Kx1yK/TKK2OZcFvbIYKc0DxvcCO8MxG5gRYrsN2RO28
	no6By1ImFnv+i/UBBp9cL3QoI71nVq6gA4npnvsRqJf/EUR9L1doWwq1G6FP75dJQ5WhAL9uLLz
	G7SpEUanrwYmqlNS0emrcKhN52swrFFmhS4GM=
X-Received: by 2002:ac8:5cc9:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5165a012712mr142397681cf.4.1779019178804;
        Sun, 17 May 2026 04:59:38 -0700 (PDT)
X-Received: by 2002:ac8:5cc9:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5165a012712mr142397551cf.4.1779019178357;
        Sun, 17 May 2026 04:59:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c0c67sm4769841fa.10.2026.05.17.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:59:37 -0700 (PDT)
Date: Sun, 17 May 2026 14:59:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
Message-ID: <dlpgdby6m5zsl6onu7rqzzatbq3jiqm5r5gvtxoh5k6lmuzqzo@gk4clmoa762b>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
X-Proofpoint-GUID: ERDmo7OrFuWAjfWWHs_ovuLPHTiM0r4F
X-Proofpoint-ORIG-GUID: ERDmo7OrFuWAjfWWHs_ovuLPHTiM0r4F
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a09adab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=OKCoC0DIYrHrkD67fT4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDEyOCBTYWx0ZWRfX8I6q6sFM3mv+
 atjvtl974tKowkIL+ivo/9HIXwn5nQyFI8lyhSqXLlP/JAl8e1FCaUuWf33PYjfoYcT2G5xlWt6
 nqbGRYVl2OW+a33w2712lhWuEFfCxauwE0oXn9wzujrhzj7aG5yZ5Nz9MHMA3vCkHQ37zg3Vp+/
 zj2eNHHshKoLTRBLPohLCQyqXxlXXJMt/wyG5MH7sxWa4BD7NYnJBbmRK32gGJqYcze2+sYYsYL
 emYAigQJom/3qycwTDvPkFyvSFfe98XcP2blLXyZ/014f9AcbJWobAG3LLi5PioWJ9SgtST/mzx
 fycvSbO7EEWT/7rPkHzNp6GH6wAHuQXMSzLj7TJhoMcHdsEflGwEBUp2mQVqiSOievRkrWzsiqi
 w4/wBWvNq/mhmqeX4J/arUDxOWROmYxyxdoZwhNOCvk2i+DMJKohO4WBDhgIqdeyuwbSc/EKcCV
 RwJvixO+0YLM6xgYgOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170128

On Mon, Jun 09, 2025 at 10:53:56PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The usb0 port didn't switch to dp altmode, investigation into DSDT
> UCS0 device resulted into GPIO 100.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This patch amends the enable gpio for the usb0-sbu-mux to the one
> found in the DSDT file for this box. It shows a list of GPIOs in 
> a certain order, and it has 2 buffers with conflicting values. 
> The one deviating is in the second buffer, at the place where one 
> would expect the GPIO for the select pin of USB0 (by pattern 
> application from USB1). The GPIO previously used is also there, but 
> at the end of the UCS0 buffer structure). Changing it resulted in 
> a working dp altmode functionality on usb0.
> 
> This debug effort is a result of work / testing of the 4-lanes patch
> [1] on all available devices. Independent of it, it enables dp 
> altmode on usb0, and with it, also 4 lanes, making it even more useful.
> 
> [1]: https://lore.kernel.org/all/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

P.S. Might it be that you need to set both GPIOs? Might the other GPIO
be related to USB4 tunnelling?

-- 
With best wishes
Dmitry

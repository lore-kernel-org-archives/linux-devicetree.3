Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895DA2E7F3A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901790; cv=none; b=knxW0D+7gbHQCsHiVw5BwrIQdfZi5k7VFW0XUt2LovYTkNPmLCvw6BuOMTkppJHsWjljje5EAGIm0N/w2+ytW5qE7PHHdalWjCei85MHI4LQrrK69AAA2R4JJsk4i4CDfsi6Ji+9NDm60LGCMnhhBKwo6tLGl3n8M2SlAITr8ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901790; c=relaxed/simple;
	bh=KqlGR9biIhMlNdFTrAQoHD6YnqoAiv2WGq4LdJhtbDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NopqvB+87Dop36DTqTth5F8xnS9AlP34YUs4mm9HXWljOrrN2jro9RrUC39r3VuSGbYafRCUBdtfZ+8eVNPM6QrAt4VfIQMX8UIASsUcKmUW2j1FYQq2xKLoSLXzoY+dUH+FcTBQcC+urQYr9u6ag96tlHiFbVsIYlXtq5T2WfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOtKPITR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcEdl2t1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOtKPITR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcEdl2t1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PlaO2733126
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 06:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sDJvWTVEGOUQxwxd+IZUiqxC
	pZ3z+NvRZh6WslCfjos=; b=dOtKPITRwDunlS4VRA8U8VTbgTGox4HcIEsQj6Uf
	8RxhPThUY2Zvlsgyj/urSei/Y7oJckaBUhh1IgglpMYpo9jrFUVybKNVnKOqYQRR
	lf6FhOGTh8+VFzFMPF+WUX6Y/lzdO/6RBd7XlEtB9jKPGB0fvH9XuHDCkc/VCSeG
	z0zpSMUE5sqtqKg2aW4RrMP1ES26dF3GwBH/vuS4ZYQpC5PuXgImc7wpuWeC2sid
	NbDTabdMoysiTfoug2GXkfgshsYo4u0Rv71TZGPu5GOhYt5rOqnKOJuGgxvAuw+4
	NsTEv6Qq6oA1/m6BveuNV1iMy+eJ/P7KIF7QRSNFFOWFfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6g22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:56:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517afbeda8eso29791401cf.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901788; x=1781506588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sDJvWTVEGOUQxwxd+IZUiqxCpZ3z+NvRZh6WslCfjos=;
        b=CcEdl2t1bEmvE8Aa58ZgNg9TNLhMlodIIh0RWk3nD0x6SIaHXyhXrrRT46Ze/vDPxx
         apKf8Ym9nXaNdVdATR0luzVV3IgSgbJblDYfIi2Ff06TQqZ92qSWpyINJNenk7x/1237
         +WO4Sk6fkz1VHB7H1pDtoVLuLoqSbvALJiX1pA33EAf5s23GUWx++i8pEy5KuNtvnW4k
         ZfQMuOV/fQgrc2di8kW8iKawR5Dzu52kIpfT0ZmqbAjV5ArQ0JAkTAXgi4naeLBBedpR
         Q7N2Tbxaz3NGS8pjMEoDPzDTHOu/BbWUAhEu43qd2QiZA2EFdpQ9lDwnjdVTceq+oUu8
         /RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901788; x=1781506588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDJvWTVEGOUQxwxd+IZUiqxCpZ3z+NvRZh6WslCfjos=;
        b=swlkqXa2kQmQYDLY+9JlcSaLd0TLkBMoC1KuN+/A/UsMADRF87F9Bu1oijr/lPyk+a
         1wZGNxZt+VJzMzIIXTp7tKVxmE2Db6ogSxoe+OeVrHWTzwr17h4N+6ZXeoe4YPjEssu0
         9l+Oa00kybYcZggcZE7oijDzxo/rBKlvbu1r92nbv8Ud52VACb32KPDEbz/XEcqUydgf
         Ml+VQ+8Sr4VkJyWJXmhR8B7rWvtLVWaSdMynkv6BYiNN2WutCW+YxnocKhuIrFbB+CET
         eM+Eg/QT5hNBNgFAVj5/6BFs7qGKIyZABubbaMbkZDc1VjAl1u4o43KknPtnHKJaekz5
         V9Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/GY9a9itbNdnynKluH+WzRpetsEcN1oqiZ40w/DsXBc03WVBrwGOKJFWnB356zmZG9VUFOTAmTQ1kV@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+rI415WTWE8Jxj410Hch0/mCTHfLNJvPL7eKvT3rHPxWJvcC
	YSi9e6gphhjulgXFqgzF7RFybI+v1WX3C0Y3PKOi2123eGt/AD1Il57ay6dQBP9SB3ocynZZKs3
	fBC4s79535qMWZ6+JCnuYCGEt/rUUr8xV6YHOdYm++CAdp4kNJ4vz+iD4UTLtd4j8
X-Gm-Gg: Acq92OGAxHz3ZYn1T4r1Uazuq2ewa36BgoBgiFhRfu5pf6tY5AKitIuLqVuV9nUnk5v
	vzcKELijuUlSg33CTe+5SddadOdSBSGVEh0Dh8PgYee8q5rXY/4pfl9kJ9ZwCfezYc1v8fJ6CF8
	tJrni/TI0IyfFdWYem194dfa/CUjFeQhNWQ8RVpMSBdQ8S5c8EQHdOewXVc3LLxhPqtgy7vkpkt
	t7DClvAJeu1oQKWOumBz6k8GKI4szkhOSCXD8YQwjznFfER78Y8Q3oXmfADSrq2CLzXI+1tzaG9
	HJUrX37ASK5Jlm2dPEI8+mDaShjZqR1pYjyikL32snn2h7CXl1X/q5D1230+KQxVHEtEExZMCfd
	2eaa/vHs9X/xZUHkamrzOPkrgpnipKSR7kRq/y1tq9GTYqFBUCs361I0Yx4cjhLVHtlxBtd0kT0
	Q+mEuNFe5OkvTfILtgxzSf6nqcGkVPeOENkcRLkyKDwC6Iww==
X-Received: by 2002:a05:622a:250e:b0:517:7701:c085 with SMTP id d75a77b69052e-51795b9e6efmr221642131cf.21.1780901788020;
        Sun, 07 Jun 2026 23:56:28 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:517:7701:c085 with SMTP id d75a77b69052e-51795b9e6efmr221641561cf.21.1780901787165;
        Sun, 07 Jun 2026 23:56:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be00dsm42953011fa.24.2026.06.07.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:56:26 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:56:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26679c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wA38C85zNOdD-9IkiXoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yG4TUliV6wzeJ1IFiiFCeoHlZ7T6Zl_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX4O+z+WLXCwDI
 4rYVvMEFR1TqNf4Au1V3+5BLFmGWV21CvlT1A/5CRrja+DDuuSHiM2NollX62mnR4DLlTIHBwfM
 KqulKyH82FZ3HyNbziyIezokAoWp2uaEr171TFJu3sH+yhVOOKad4EZQcKhlRBuDpeYN7vFA3Fe
 HK9cKQxl1BwIFyXCfLXV0yhrJAescfUnhNzdfgMOcLMtpRwgdcJpSDwPFczrsmEQkJCi4pD+P8v
 U7xyIcCwrK20ctbgoFE+SrSXICw1gWBq6attqkOdC6qEU/PLDagIV4k1UQBFNagxPOgRV8f0Ic/
 8eiR6Elgu56pD9n+4KR2Cxf1O60uS6cYKXZeMBOlO6YARwQcZfB6IPB44o9g34ItC73s6nQNEkT
 8tWjZIMPErYOIB4XhfCDumR2Tc+XcVRlC2ScTZkgu1aAUWDWhSuxov/g4ZfQxyiJC0J64MqoUrq
 P3YPGLGv3cgfmOW58kw==
X-Proofpoint-GUID: yG4TUliV6wzeJ1IFiiFCeoHlZ7T6Zl_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062

On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> supply.
> 
> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> refgen regulator supply.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>  1 file changed, 220 insertions(+)
> 
> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll",
>  };
>  
> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> +	"refgen",
> +};

Now vdda-phy / vdda-pll supplies?

> +
>  static const char * const sm8550_qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll", "vdda-qref",
>  };

-- 
With best wishes
Dmitry

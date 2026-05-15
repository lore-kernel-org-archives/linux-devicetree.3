Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C3047A0C7
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847295; cv=none; b=dk5tW22AR7LVSiDraAeahsOyBI86wU5bAB+QiMOAXtKdk/GI4giJWklm/sfLLppmXHYUkwmkq9PQ6R9FNDgwpFgFgrWPYWoDNltAUfawqbjhJkATRvz7DKR++K3Ue6cqxCEgAsdIBrJd9ImQdYaBm+DCsfLRotcE4+SKSB7N9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847295; c=relaxed/simple;
	bh=hgNv+ptqA/p+YpoA+ShbxU2tfcJNNiY/B0OGGogvVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbMJUuXQ070X/YShSchhbYhTvm07eytZ37pFWDxdThsu2fphoqXteUL8/UgKZs0p03o6wjLj2nVWB/MdTrKi4Mu6tZYqpqLWmrFzq5z+M9o8FgQ7ACBS2GoS94MH5b2PhjlgC1AbPA51vH9ywbQn/gtMlJyqB5EEeMx7vIZn5kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0AgFTG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwhAEAO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0AgFTG0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwhAEAO/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBLY7a2676235
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FEsFbDmLghK84t+EIxt+lyDAO45eJmqJ7geiYDij2c=; b=O0AgFTG0qiMZfvlv
	vHj2Q5uToQc7FGwk6jcxttBotNo83Eg1sBTBB9zUjhn55UhIVwzFQ5MHjQOtaG8/
	xFDqky9SophdU/xq4UlSwB56S3ZMjp3y/o3sHWDOsjYklllpNDm8afORalTSwB07
	qPUJhn81Skuj7pDmWFGfkFDd264oUahiff92uuogPBDMvkuiLrdaOABVU1Vjb0T4
	DHLtA9w6kpYMTOp0tWlvFxw4SxbWtZXmpgaKBddDogEHZbGgqDoGtBJYefsdW8xC
	v3rv4cY/z7uFZNyBr/gSJxQn9fxr4Dj7efDcrt6fL7DOTjlK9QfuSafTJRlBYrTW
	D9n5bQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vu6rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:14:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-634ce585b41so3103109137.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847292; x=1779452092; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7FEsFbDmLghK84t+EIxt+lyDAO45eJmqJ7geiYDij2c=;
        b=dwhAEAO/noIUBMGqNsFU8Pj+OMoXGLLVd1xFWkPueG4U4cO/lyD5SmT7RMqH86vhb/
         iSbmxhH2pceTDlON1XcqHxHnr/PL3hQDyAMNxt/DLc89fd6+gEcTSGyyehrYqL57+gMW
         b9GXLY7QN7UvnsWaCVPe+55bpOLxtqWGAC0ubAbRH4ng6QrQVWOHCG6h+58Fol/m0483
         LcIyEt4pbt+bsU/Sq86NGfjK/mULsakK62tUslFqXlrwh2fea2YXdR+fcst2TP5tL5rv
         /QS+2J746ciWQwndtzJ5chASsCv6WfS4Yac5sQwQn9TYJvodS9ce9kJGlOeKE2AJ9fp6
         D2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847292; x=1779452092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FEsFbDmLghK84t+EIxt+lyDAO45eJmqJ7geiYDij2c=;
        b=Woa91wuSS5wpjlh+9Eg9F9qZDq+8iuNLrQKlZUjUDTRTA9xPr8TOKe+bMUBFsX74p+
         XuQctYQpKz06UcQYpnzBO11lUR2FANiBqVrT1HegJ1GZMhDLLz+4kzczHWTEdxMPR8XX
         hzW/IZWdsAFCb/Pos16yTNBUg8pStt3tqRCsF2HtCDwfORvv5zQBlyuk865F5mAGvAVF
         ZxWYbRrXkYiAW4unmEVbxGJ/m6FmNlFcKQSshzeXasyrwiM9Gv0mcISxFxUbdmiaBGew
         1ppqW0QHdpkEUP3weVqRjlf7+EbsmAc+5qsAXvnEZ1OWM/qgh/dSSsGiDx3S7nC52l4R
         tB3w==
X-Forwarded-Encrypted: i=1; AFNElJ+M3fr8dKWJ/uKPjBSJ5VQOOXvWIwkU2nq9HKMVVkggkXHliLI9zugKTDchzJvx4xo8BSzu8/yCmJ01@vger.kernel.org
X-Gm-Message-State: AOJu0YyPev5Ob/MwtM8h4iybOdm+5WkoKO0CbpU3Xk9U+56IXIoraIzM
	+jWC546pYa1AUAg9M9dmjHnZGNjfOlrB6/I5zpbmpG+pTJGfDfxqpLiCHb/w8CIyvYeGhicy2ky
	feQiCgX0aW9tMsTR7zYJrBEqy2bdaOF5xfvqLqwh3b7uS9V05GHusJ/By7YoIpv6H
X-Gm-Gg: Acq92OGhxKv3p9uNEr81qHA8NRq/N+hoZoaVC9VsiHdz9H9UAZssEMeJP/80GJUdrQV
	XxDyf0saZs9H+q+GsG3qqtHHljYy1gXdC38aQ1GQy6DmVKPuhcmR8nasQuvZv3OfE8rs9cNYK5G
	9FuEz2Iih4jRmNFtIqfOJiisUTyRrgGUzlB4IYYt7ZjWtzZwmO+rwIQTenFjMBRBafqtuM0XQ7T
	EoYXCMUhzXnBhoz0ItjiAos8BFE/TAoYptsUUU5+lCOX6JfioHupLZjZG3HzOlWPHxZTftWJDof
	jOdPKeM8qaFngFSIAy54hhqhIf5tvGhVaPL0RcnGom5u8/9W4DZFybbdG0B1pf9q5oNFY0TF77C
	hip1z2NSQZvcyCu7KyohLDjxboTQ7k2DHtBONCO2g2NsBnS0+DXKD+HvvFAoLwJL98bBC+2gEkE
	kPw1dN5EJjOBso7OWIbAFL6nNHj8l89r4D/wgGOIaT3j2l2A==
X-Received: by 2002:a05:6102:5e8e:b0:631:44bc:c0fd with SMTP id ada2fe7eead31-63a3d322d11mr1670458137.8.1778847292060;
        Fri, 15 May 2026 05:14:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8e:b0:631:44bc:c0fd with SMTP id ada2fe7eead31-63a3d322d11mr1670416137.8.1778847291607;
        Fri, 15 May 2026 05:14:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd86dsm1278246e87.69.2026.05.15.05.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:14:49 -0700 (PDT)
Date: Fri, 15 May 2026 15:14:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Message-ID: <mecxgb7kbzcwr37pqc7zuqm5kkzgv455qpitrnntmk2lz6s7rp@57hnu4rjx7r7>
References: <20260515-iris-sc8280xp-v7-3-2e21f6db1897@oss.qualcomm.com>
 <20260515114207.B877AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515114207.B877AC2BCB0@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a070e3d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zP1zt5cwujKoDgLrck0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=crWF4MFLhNY0qMRaF8an:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfXyMVD9hg+E+gm
 vljE22VBFKXDRMUXppAt0JfgbsFXJgzd/evI5wO1/umI7vujXxk30Z0y2y7TNVG0koWgaQ4zne3
 oWMf7PyLuPKz9wtiGyGJG2FW5gL7kWq+lq2SgkAM0yTMxmHk8lHvEHfs9e83Dx4BjqoFzusIfbZ
 2+J+jbyY8Ie/an+25eBMkOQeGGCmKhk+Ocmqa9jxt1oVZEW4/1vswubOnYDB0Ovu0vekcrE+5t2
 fNbEcngMbP11ti0YG4hYMjJTy7KKLWcdjVzGm+k+O+kn7UpDbVmb2kR6C04S72cCHlAm/ohCWAo
 3ZismMNjbWhtsPTy1yI9YSdVeshKxO46sFu3Plf0FxkRm6nSuJrSdM8SWQMlsg5NqTJ0Pwy91pZ
 oa/pVbzUG3SGjYS0ANZdKpW+1u/7EVPm1RGNYLgNxt0H7yVbP2Sz5yhK07jPmaNOgSf74z34gyr
 IJJNkj5poF28vimUVPg==
X-Proofpoint-ORIG-GUID: u5c8bLthdHQrcKz1wmd5UDh_mcPU4Q5I
X-Proofpoint-GUID: u5c8bLthdHQrcKz1wmd5UDh_mcPU4Q5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123

On Fri, May 15, 2026 at 11:42:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `iris` device tree node adds an `mmcx` power domain and two `required-opps` per OPP entry, which violates the fallback compatible's DT binding schema and causes hardware instability due to unhandled power domain scaling.

This comment and the other comment for SM8350: no, it's a part of the
media-pending tree.

> --
> 
> commit 39fd9222ebc24cef337abe30cd891e4af77696e1
> Author: Konrad Dybcio <konradybcio@kernel.org>
> 
> arm64: dts: qcom: sc8280xp: Add Iris core
> 
> Add the required nodes to enable Iris core on SC8280XP.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index 41c57e7dc4333..45e1dd5a230cd 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> [ ... ]
> > @@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
> >  			};
> >  		};
> >  
> > +		iris: video-codec@aa00000 {
> > +			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
> > +			reg = <0x0 0x0aa00000 0x0 0x100000>;
> > +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> [ ... ]
> > +			power-domains = <&videocc MVS0C_GDSC>,
> > +					<&videocc MVS0_GDSC>,
> > +					<&rpmhpd SC8280XP_MX>,
> > +					<&rpmhpd SC8280XP_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> The qcom,sm8250-venus fallback compatible is used here. Does the
> qcom,sm8250-venus.yaml device tree binding schema support a fourth power
> domain?
> 
> It appears the schema might restrict power-domains to a maximum of 3 items
> (venus, vcodec0, mx), which could trigger dtbs_check failures when mmcx
> is added.
> 
> [ ... ]
> > +			iris_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-240000000 {
> > +					opp-hz = /bits/ 64 <240000000>;
> > +					required-opps = <&rpmhpd_opp_svs>,
> > +							<&rpmhpd_opp_low_svs>;
> > +				};
> [ ... ]
> > +				opp-560000000 {
> > +					opp-hz = /bits/ 64 <560000000>;
> > +					required-opps = <&rpmhpd_opp_nom>,
> > +							<&rpmhpd_opp_turbo_l1>;
> > +				};
> > +			};
> > +		};
> 
> When using the qcom,sm8250-venus fallback, the Venus driver currently
> configures a single OPP PM domain (mx) via dev_pm_opp_set_config().
> 
> Since this node specifies two required-opps per state, will the generic OPP
> core skip scaling the mmcx rail? When _set_required_opps() in
> drivers/opp/core.c iterates over expected devices, a missing mmcx device
> pointer might cause the mmcx rail to remain trapped at the static low_svs
> level voted by the videocc node.
> 
> If the Venus hardware operates at turbo frequencies (e.g., 560MHz) while mmcx
> remains at low_svs, can this undervolt the hardware and cause system
> instability?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com?part=3

-- 
With best wishes
Dmitry

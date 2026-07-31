Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795E3D5C2A
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500959; cv=none; b=F8LUsD5m0ilrSKXqLY+35PHIAbADzgJGiD6TaJVknP15oyNXzinzjXNpao/Bn3X728fR5vp/TpGUwaFPVfKHg0PdkzGFtVVvqjGmWAtPfzr0LWvD3GkUmjPXZoloGAW6D5KXRdvemDkWWCm3SkomFOGXstjnPmY5EU3eQxS04h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500959; c=relaxed/simple;
	bh=H02tK31YCq04BwEgpnWejUmgmdJHg8vGTKDpAd8w2Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUebWVGS0cfsIh9U4Su++U4fINJ2O1+CTHr7iGUcOaHu6hmOzb03D+a9L6DPXwYTEepJtIpwOURl7JKkeRT7x9F6Np63x6xOY7iyj2lvEskK41/Ru8u/V2okwmpCowzwMYTgumDBRzPwwgAwbho7eJIdVEkRMEo7Y7ilW8blM1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gxb7ec/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UD6pIgHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gxb7ec/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UD6pIgHl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBjjMN4054768
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YDsorips3PTPKViSLkf1nm9sjWClIKsdYAqhnCzxWg=; b=Gxb7ec/h4Uyjsvjx
	I6OQWmH9KWph5RJnTD3bqLqUYGt+04vzDR2tQ0oY2jHG2pQog59Ikz9us27lsNwC
	0VRiV9vwaijcWX/BkylMJci3f3jYQ5BSkzZeRS7MB110iQewFJlXerqU6PjHTCtz
	F1LlUQNHneCF5lUu5cWgBbRiYgJ1h7psCLJUETayx2iui24Aoi57fkPMVoErrHTm
	EArAeDH69xEqcOQ6MvrK+lgbMI1kWaElwVssa8Yrh6fCVcJSccRPpXq+uBdH4KT0
	6ZkutfBmw7PVay7+6CvE+m/wRuuTxGNok1PkBGAOBrCyOVtM46kKeJZI9p2MMd2v
	6zpCyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru4804gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:29:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso9350471cf.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785500956; x=1786105756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YDsorips3PTPKViSLkf1nm9sjWClIKsdYAqhnCzxWg=;
        b=UD6pIgHlMQjJ59w9VJ9oMR6jhf/IOwCjwhxsFCdqmm1pg8nYR2jhDpGpu6Dew6CQF/
         +zemSxbl+TFyX+opDOgAGU+uf3f1BdkD/vOVvXndrIGcE8KgeVVxEsdztYM0wE9sGaFR
         NX9XfTwO/pWgcKV/a7SovUbnylsYKHijpP039QBeA5ff/+sM9CLHEwsYHbDhTD6770gk
         /oY6Zt2OMUFzOH+GXHgtQgjI6yrr5JKXLwxKErJ493TdQVbJs+HDjqKcmUc9nqrf3Qsf
         uyF5I9qeiJJrcyVcNsI30eywsrm9qxHdG04APsrElOXp2qqKp1OcOyfa0AkecxEqxumm
         vQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785500956; x=1786105756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+YDsorips3PTPKViSLkf1nm9sjWClIKsdYAqhnCzxWg=;
        b=sBDElDkDyvw1brfAb2Cw4USAQLLMa0ssHaaB/R96FJu4RpO0jg0BcGN08OtQ/KRli8
         IbEopnOaToARSxoVSjnRyvGtii29nSLcKXXJGdoY5J4BPHG6ZrIn7LYtVlkTgygfsfsU
         4G4xxUV1Bscr0r9DawuVyKwCnMGIryz1ZbWCd29z3gf4F4+rdIBigwOn0R30u8qKBZ1/
         HEz9+pGLIRO8EXaFmyjM9vo9y2RwXQN4LXRFjbHNS8M8PkuK3TEZOSxEce1DijS0bh54
         X6xXhK8m7LjxNSd/ct3XqT9/DC25uwFeLwHjg+Bf25xiigv9pAzHvfVVZML0ZoQIciuw
         hjmA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0dK1Porzkh+deU4nAozqJL7p2BowHK11jc53VkXCVE5PrQB2TxutH8jdblhEnQVzKBCe9vJNFj1Lc@vger.kernel.org
X-Gm-Message-State: AOJu0YyplFOjSsT/O3bXKCuD8V/sAysxQTzxQBu5+YpiPhuEOaGHUi4j
	CdFgZW0Lx39rvNkF6GIys+wD7VEvI5Sz/xK7iXsW3AVjhf1rlZwKbVw9qJlDnVXKg6/b4TXbTRu
	sSIQknMqbCotP1f1qK/x5F2aaE9cOdVFd/N6gHc4FzUe7nx5nt6ZjA3fG32LxlO7ns8YPJImp
X-Gm-Gg: AR+sD12ySmx5AIJbQfsYZ/9S+qJcZu38ZYQxfbzYKBpzHjb66Npg06HfZRMNEcZRrIq
	0+ZOwJaSPwsqYfw16FPulxIcQmIRwUD+tmfPqdDmUOonsuUSKTCFUO+NFtPN9NhjRFjJ2utXHi8
	gw+dRW6p0rGtHFh0bJecGF3inKFhad0ZVB1qNSf/dNpQtg0WaawG7Q5UbNa8K/mabtBg/ZRz8L6
	OshbaV1GCpD2HdawG9GA/AZIVyJE7DCQVQaJx2VqEGySsyj5YInpBfrb1mTezN4EaUHwLuJYccR
	WQBGhkBk3x1xnszfAf/bz2r8lWShc95LYdxBsG8ZOQy4faurj9C96LdnvNdgfPUDnZNtAdmOysh
	PT4mO7gyurVaOxHBpbq30snNpb9+4PtvlTAkok0GwauokmhCVQSGcPt/OJmYcI7v4tasykMW4Zk
	8Mq0dkXCyR8RDaoQ==
X-Received: by 2002:a05:622a:4cc4:b0:528:3882:3866 with SMTP id d75a77b69052e-52b4aed0cc2mr27800181cf.15.1785500956532;
        Fri, 31 Jul 2026 05:29:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc4:b0:528:3882:3866 with SMTP id d75a77b69052e-52b4aed0cc2mr27799791cf.15.1785500956040;
        Fri, 31 Jul 2026 05:29:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cb44bsm273123e87.23.2026.07.31.05.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:29:14 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Message-ID: <zyxl3lww2j7e6iw2n4dggczd3ma5m7mfpsgmubftnibkt6s4fm@m3xepjruqt72>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715142224.5FA721F00A3A@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=IJsyzAvG c=1 sm=1 tr=0 ts=6a6c951d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Hx64Y_J6jGrKGZATseoA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfXyPp+oq6NWpC9
 EqhfoIDnU7wQyV3V6mjNm3t03NxL1Y5Le5/TnZKI4nEN9HoVPL2rR7RMF60I//1pUmGIGPNqgEb
 hvV7bXE8PbZOFK6EVz96ytwRouzMra4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfX6xVtSe97dft7
 rOFEP/wagjmGqiSeofHbQtMY4Dkm4/CdJxByXTC4MaXyVOr3NrDglYr3SXRGdyO0bOlsMzD3tyJ
 9vXaW/3Cxk/0XcMFZ23FawQORFZsaG5ybMoejaxcYNOrIR8mZKtLfC0YMKW05CiHMl2bocJTEKN
 qNMdEzlB7BeilB25IeaaAiuqe5c+PXcKrhMI4KInG5UoBK6GcY2GgWKd/UPTu5Q7r69NtM6lALz
 95fJCKP0+JpLrBxKJe9vqRQNCFvCyeGcnUAQ2AmtCcFF1kb6XqB/fYB7w/4LlmDqc6rSOsRXByn
 76TaP8VOrv86h/K0yFV9H0UkMr8f7aeBk0mxmsSxbiwMOEpFmdJdvt+00UTAUJq3yBgjL1k/8Cq
 qHa04S9ylQt1AYGHPj2xYbkYmXLF7lCOfkVNvoTgx1NVhHtgR1RdRnDbCyPa/4LUOPHLeHiaJkB
 daIGR7Uml208mAAgv0g==
X-Proofpoint-GUID: nW-_ZkbW7JubhByCUUCunxO6Ii6_m8nk
X-Proofpoint-ORIG-GUID: nW-_ZkbW7JubhByCUUCunxO6Ii6_m8nk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310095

On Wed, Jul 15, 2026 at 02:22:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
> --
> 
> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
> 
> This commit adds the device tree binding for the Qualcomm Glymur Iris video
> codec. It introduces a new dual-core architecture requiring additional
> power domains and clocks, and updates the maxItems limits in the common
> venus schema to accommodate these changes.
> 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> > @@ -0,0 +1,255 @@
> [ ... ]
> > +  interconnect-names:
> > +    items:
> > +      - const: cpu-cfg
> > +      - const: video-mem
> > +
> > +  '#address-cells':
> > +    const: 2
> > +
> > +  '#size-cells':
> > +    const: 2
> 
> [Severity: Low]
> Are these properties necessary here? The schema strictly enforces const: 2
> for #address-cells and #size-cells at the root node, but none of the child
> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
> does not define a ranges property. 
> 
> Will this cause the DeviceTree compiler (dtc) to emit an 
> avoid_unnecessary_addr_size warning when compiling device trees using this
> node?

Indeed, it does (with W=1)

arch/arm64/boot/dts/qcom/glymur.dtsi:5365.29-5482.5: Warning
(avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary
#address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
or "ranges" property


> 
> > +
> > +  non-pixel:
> > +    type: object
> [ ... ]
> > +        resets = <&gcc_video_axi0c_clk_ares>,
> > +                 <&gcc_video_axi0_clk_ares>,
> > +                 <&videocc_mvs0c_freerun_clk_ares>,
> > +                 <&videocc_mvs0_freerun_clk_ares>,
> > +                 <&gcc_video_axi1_clk_ares>,
> > +                 <&videocc_mvs1_freerun_clk_ares>;
> > +        reset-names = "core_bus",
> > +                      "vcodec0_bus",
> > +                      "core",
> > +                      "vcodec0_core",
> > +                      "vcodec1_bus",
> > +                      "vcodec1_core";
> > +
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> 
> [Severity: Low]
> Does the example need #address-cells and #size-cells? It demonstrates their
> use without any child nodes containing reg properties, which directly causes a
> dtc warning during dt_binding_check validation.
> 
> > +
> > +        non-pixel {
> > +            iommus = <&apps_smmu 0x1940 0x0000>,
> > +                     <&apps_smmu 0x1944 0x0000>,
> > +                     <&apps_smmu 0x19e0 0x0000>;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com?part=1

-- 
With best wishes
Dmitry

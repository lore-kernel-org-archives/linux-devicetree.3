Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838F2E62D9
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 04:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781757871; cv=none; b=nxgCyCNS/KvvqiFsw1xyz7EtcOWORs7oZtiCfuB+hFQjE1MRvXqC7YaSy9WE5chLvNgHeodqf7V943u3M6B9p8avBvNQuvFsTd+AVAgFC4pyFRVbKX6vIhbSg+/9Mq4HeMdSrn0CaWvZMZV3OnpINnKItCVtHfOGn2K4QlSRg5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781757871; c=relaxed/simple;
	bh=e2X3uLyEyJwxM5HjZMv7HNmigKfP2gEwrUoXrdaESkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5xCoNFjHvO9GX0MRWr5rMPHGPlVTIaJxetuvUc/MJzQKn3ZnFj5/SwP4j3+JGs5RUbMr6B3REDC77UkO2NEF69ieAv+zkisESu3wdClVzvOU7NHhGXwCD2Va6/LSG1fiT9Vq9CUGU2nfhBm4wrVvmWmFZGV0HkxwEppnfxSIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbiO7uKu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NW/VVPgT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbiO7uKu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NW/VVPgT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I4NfaM3577354
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 04:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TTyZtbn6rwu4RjX2VYmmyUvR
	qm9Y3D608YZqL4TcQDg=; b=cbiO7uKuI7iG/4dvMRCT91ZpwfANL9HtWo5FsymJ
	DUza1/WQRp58RU6yBxST6QoirvbOcYMJTrfE+FacjmOOVUxpFwwJ+eTX7ZxFeTwl
	kp/p2hIyxglfjXQE3Ovg2r0y+KTvDOmlKLxrcOS61mzepZWMMfV0fQyv7AWJgF0p
	BX6orKnRo+c9m2hp3mgVabTBGxm8oSJi08DJc/0jGK+eifPnCufXM5sUvfftKPIM
	MbRibK1wSQrleVouV+/yPW41hKxRlSMVl2zkG/QngLtjet33ZrrQI0H245ctn3Uq
	cm/tvqvP4nFQ8K+/UJ0yAQVldMs0185nQiHQzzR8RkC32w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7j0sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 04:44:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13992d6a729so1643172c88.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 21:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781757868; x=1782362668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TTyZtbn6rwu4RjX2VYmmyUvRqm9Y3D608YZqL4TcQDg=;
        b=NW/VVPgTR+eL045c1omPCxGWh4PgadN/OyzVyULba+szg0Stpxn5l2qmZtyLLrF6/w
         m2FkylvRYSRK42V7u7ux3GF8T33FyVcfT/Wp6fNGLTWadh4uMMJIQVrolpFFtc2lssX4
         87cKqtUnYE3PVS0PWA+P+Wt5+JyrkG5lo2MoA/9aBBAvXfhjduh/p2ubGDa84WjJwGX1
         Jh6VJn43Ob5ibr6LLGkSLhbdF1u73T4ZJSKFvgl4r2Y4qomWAcM7U6120ydmdm5kP3mz
         RedjFQbvExGy3psHQPSNdmZ/FSY/zubdmfOdK/3wIwF/zSU82jqGcyGifqlN7Bb5KvsD
         4i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781757868; x=1782362668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTyZtbn6rwu4RjX2VYmmyUvRqm9Y3D608YZqL4TcQDg=;
        b=AekHJTgAfHKtDVRqBMVmyVhohhGjzBl6aKWq1buCGhsQriHZs8fMD8xMPM4LSnQtDN
         ZskYzEw1J6J/tub+SHJ2fNG5hShZtegc7Jqq1S0XpJxxmWsRpsmlIAYhOblVrBRrYqwo
         yRsYQJXByEskzC7zCFIgfiQ0dwkCdaYNA58ox3mGe7JX6mUrGZ07pnOYBq5+MdVff6o2
         s32Wd4l/2YEzIGTI1cixOasjVwqHpWz6aQxvrEmXzy7CoDWY+K7vVDWKz9OpEP+BjpFn
         PEAdnihr3nWELQJjlEHs5FuVw6bGr/4ywGqlOCTcmmtogtr0AhykzI5ptA47uSvC4sR3
         Ni+A==
X-Forwarded-Encrypted: i=1; AFNElJ+zutfaugOkiFl58ZGJxExegk4vzxgYmoi2fTLhC48Pmt2x0LXaJJ3mTAUXK6xHgQ02GsjgjJZkeLA6@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsOX5Zirgp3HCWAFLxucC4Vtuwo75pP4gJ7zr7R6SfKYfbM6S
	Cfe0YR7EipHK5t74wDlNU7GH5/yrbR5JgLSiyg2OThf58nGIZ8MZOcOdJCO6V2YC5W/fUUAJcVO
	PCyvIUBvO7uGN2OZ58/UB7VluOISPmWRBz8m7NSfZ1sSILqgBrJ88bV/wk8pU3f0B
X-Gm-Gg: Acq92OGrlvLDjRpAozj7MzF35d85MgHwFaIKQYRZoI29RqKxBsOOhMI9JdFC6ZCSJf9
	tsOnhyJnEETRcylR+c8q5z2NpBwrNLLBgH03kdrjxYFB3r2QHuNQl5rDLdQws7QOf//tyCXiVGG
	9Gj7EbnEJZN79BbE6TFMOtYrJWByp2/Kccp/umlMmZ23/Ov2h+2b+jkaQTnKH0Gs+93/WkqZzWW
	zmxLzLmpQ6vYlG4hv0Svj9G3MavXyfkZGLphqWostchSWTam1tALjw7csdU1aVblgs2cIiqAxJt
	Rotr2R842oys9T8vIlybJvHRs7aCpH0pmgUm5wKrXdl2SljcvmBhzlnIydWGUnLwOZxABw3JX2U
	30+tMm1VJ9+mnh6UYvkmgbrMVVvhI3qvdNwWNapSE+qrblJkII1dT5eD7WanMCFJMlsk=
X-Received: by 2002:a05:7022:493:b0:138:2a54:f6d9 with SMTP id a92af1059eb24-13997c79011mr1185374c88.25.1781757868347;
        Wed, 17 Jun 2026 21:44:28 -0700 (PDT)
X-Received: by 2002:a05:7022:493:b0:138:2a54:f6d9 with SMTP id a92af1059eb24-13997c79011mr1185341c88.25.1781757867797;
        Wed, 17 Jun 2026 21:44:27 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd23401ecsm4461963eec.25.2026.06.17.21.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:44:27 -0700 (PDT)
Date: Wed, 17 Jun 2026 21:44:25 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <ajN3qfWV75SqNzgo@hu-mattleun-lv.qualcomm.com>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
 <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
 <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
 <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA0MCBTYWx0ZWRfX/+qGaTnmSQIW
 sIZbRr0B4k40FFMvYUXk784+cx3OkyCbdAAA270i48HcVNcnoW1Mc8/wuD9FxjoAQCXCz+34h1Y
 Fpay+m//UEqbElScrJuYAda+InMuyf34LqXMxOcs7cF04LG8QVZ2I0Sk4apRXWfHUiAo3uFEPzC
 vneRTd9xqEpoocpYm/et8pPVHY+Ci4AGtMp3Se5H0Hng5DoZerjOEdu6Zq5QdgAunGKuMGzC72U
 pBTd2pMymzcki1/+YDP6sxa1duVHSbOL6di5NAr5Ogj8MhTB+JhVtq5OGeL6ldGGcrrCsdSRKpV
 /NbM5RXGaEMQwCPUBFbD3G9Zg7ROcmsbNrvWmU5BMYZDtAhP066E+m61X6nyVR1LFAHE5b7zwZ5
 DWUpISINuVaAo+NUQg3191a5ff2tkgDCeZ2bKuAx03wHgW6LSMIlyN3771UEOHdAkLRzlmVxfju
 /prMrdMXt18wm56nJaQ==
X-Proofpoint-GUID: RSyszhXliatVFWkA_y70_YP1K1CrVAqk
X-Proofpoint-ORIG-GUID: RSyszhXliatVFWkA_y70_YP1K1CrVAqk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA0MCBTYWx0ZWRfXzQMjwmkG0osx
 GF2hRYnIjBYKVUrtd8He5/QCeE9GgX/fnqdLqQv8XicdAgL6pxXFVziEPjAqvyWRE2WxkukmMl8
 ZWHKooRVUHKQS2Oy5s8uVou2c0svAS4=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a3377ad cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8dstwiPKDIhgTtwZBQUA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180040

On Fri, Jun 12, 2026 at 09:22:10AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 06:17:57PM -0700, Matthew Leung wrote:
> > On Sun, Jun 07, 2026 at 11:01:10PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> > > > Add a dedicated schema for the PCIe controllers found on the Hawi
> > > > platform.
> > > > 
> > > > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > > > ---
> > > >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
> > > >  1 file changed, 204 insertions(+)
> > > > 
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +    #include <dt-bindings/interconnect/qcom,icc.h>
> > > > +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> > > 
> > > Stop referencing clocks and interconnect header files. Replace used nocs
> > > with ephemeral values.
> > > 
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > 
> > > Not looking around should be a sin. Take a look at other Qualcomm PCIe
> > > bindings. Compare them to yours. Then fix yours to follow.
> > > 
> > > Hint: the extra soc node is useless. This is just an example, so use the
> > > default, 1 cells for address and size.
> > 
> > Thank you for the feedback. This new binding follows the examples set in
> > the qcom,pcie-sm8x50 bindings and retains the same formatting (extra soc
> > node and header references).
> 
> Hmm, interesting. Then I'm a sinner :-)
> 
> I looked at msm8996, but I didn't notice that the rest of the files use
> the soc node (and match what you've sent). Please excuse me.

It's all good! :)

> 
> > 
> > I understand the example can be simplified with your suggestions but
> > want additional confirmation that these will be the convention for new
> > bindings going forward.
> 
> At least, let's keep it for now. The other comment stands. To remove
> dependencies please use ephemeral nodes instead of depending on DT
> bindings from other subsystems.

Agree. Will update in next version.

> 
> > 
> > > 
> > > > +
> > > > +        pcie@1c00000 {
> > > > +            compatible = "qcom,hawi-pcie";
> > > > +            reg = <0 0x01c00000 0 0x3000>,
> > > > +                  <0 0x40000000 0 0xf1d>,
> > > > +                  <0 0x40000f20 0 0xa8>,
> > > > +                  <0 0x40001000 0 0x1000>,
> > > > +                  <0 0x40100000 0 0x100000>;
> > > > +            reg-names = "parf", "dbi", "elbi", "atu", "config";
> > > > +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > > > +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
> > > > +
> > > > +            bus-range = <0x00 0xff>;
> > > > +            device_type = "pci";
> > > > +            linux,pci-domain = <0>;
> > > > +            num-lanes = <2>;
> > > > +
> > > > +            #address-cells = <3>;
> > > > +            #size-cells = <2>;
> > > > +
> > > > +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> > > 
> > > <&gcc_pcie_0_aux_clk>, etc.
> > > 
> > > > +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> > > > +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> > > > +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> > > > +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> > > > +                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> > > > +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A843546F7
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245336; cv=none; b=F0jLrLk1mbPkpR3LC58xMlYtulqBVEeBya0//NnFAUzul6FgxgW9xf5nOTDPjAkxeOy6tEJmdiYUPScyuzKYdUsgqdkJic05wrI/3yrN+14+PH1kofIAau1AwZb0vl7qm1bCEFX03kQBvwJuSTsDEt5elITuzemiMt4EPKPrUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245336; c=relaxed/simple;
	bh=9iqy1lLQxvVwdgkFr/jdiScy6r805+sd9YPN4XMJ5oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iILVPvp/rJWmsYCmJdmIuvdirfB9aEzWKovwxzlOkshpiZAoLDjHIz4ijhQHieshlcqVKQtH1Scw7tfsZuJBpi31C2qqi9ZOc8SrGGfnS+oMC3qoiigSvIjQMVQUh9M/cQn4CG0A/UnQH0t+O4soIYCeaz7q0iHfw5nOZioC074=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZFgzOXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7a8XEre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZFgzOXK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7a8XEre"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39PKb2475903
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n7Yf1YYFjiuiIuFcDTEBV9uJ
	IVRQFm5qqW6YmchUZPg=; b=jZFgzOXK9pKsRi2r5t7j3LL0DzuWJGnuEJvYH0Gd
	CXK0x0Sn8WX7d28XX2Qz7rbvbz0nvfJyJYkG+FxBa9SzhEK4XlckEZuuhHxna15m
	vQau1gp5ZqWskc7mVmf3RgoBBRCDbr93dKQ3/iZXoTIPGpn43K/DYvfF/ESw+/ez
	SfllUhLNKp/jFNUCroHLzTdp+KhLZACJLyb+6Jzi5EIdsX/YZTeruBfkA7lEG9uN
	cm7OYFoCOyU7WheX24qlJsN969sn17nYm6PUT1GTRhsbdPR7bWRKfXkkMHpNaN2q
	rYhXJYf6wLuamA70or1UgOrWYGzLoqKtf1lSGMtgC1F7+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5sv7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:22:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517dadd84f8so12097011cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781245334; x=1781850134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n7Yf1YYFjiuiIuFcDTEBV9uJIVRQFm5qqW6YmchUZPg=;
        b=P7a8XEresDdl0eww1tsRJN1CQ+AFQSv15H0dUStl5O3MG9o4hQbdgk0hl73i0Nw2MK
         WBNEZeRqeb3hVOM4fhRHWTZgVSty1ZeXZg7n6S7WlikaL6V12t1NG6rjFrqYmN+NVSnz
         WyD4r+NFmVkDzPW2gqiblklKDWPLsAzWWhYKnAcItK2LI12CgEyTb4/U7uvC0kU7MAuE
         y6ul1KC1UJYTgCGOryIYCMnL3YyYZTQqoeInokm30k8tff7vIWep+guXbbTFtoup+m7j
         o+QCtJK3/UhBLjGpzg7BjiT9G26gbhXZxFDsKLsCPdf453j4Pq6Y23uPAYrhVEPBwTjT
         SW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781245334; x=1781850134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7Yf1YYFjiuiIuFcDTEBV9uJIVRQFm5qqW6YmchUZPg=;
        b=RfBZ4/odQkCPOd2E43el42VgCuWncoYPbNq9GAYuYiCRQKPCdB3rqQ15OX/zmZeMPr
         Qio6UEsX1CVoghTSLIUD8CtpHwyc8juJBGItVuY8sJyRMVBmOZel0H7pdaAUPbgpSnQ8
         ztueRe5vTTSJmUZgqN2dpoSu8i/jwEM4YNhT/m598q9hz5NYVHPMFmy31csI78L2EwFN
         TGZK0HSjiuONC6JauFSgt9PvFvPqeC1flviWehsFVC7ECUWL5K+AAu8HDzNTcKY/8Xat
         cPBLGZ6nzSoreTOV9N3lRz+vZ+CegFZF07/jWLyVTQSxeYtkOh2EwbSQ3L4V3jma0b/s
         2rog==
X-Forwarded-Encrypted: i=1; AFNElJ/3kKPqydQ4Kg2aGzMPjE3TKRC1ZTphkoB9jO4hS2Kt6fBa9tHTgLu8YseJpUyfP6O1lNespegJ7GOy@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEBPmOtlqbHw+t3rg0h8QNpLeN4bbgxITQu7OeAi+DR2lX8Nv
	7nZcpWi9FtJAyiCNxgUaVbHKAl2Tl1F/vIp5l4DjJWxW7+f/oIZPILT1thEI+gPUUVBTMsEaYr5
	Aq1GcE0kthh0FZhelgMqpHfPRhDN2Ef5ssKEqUY314NtNJiHF9JGtufoQi8dzb9lQ
X-Gm-Gg: Acq92OHVDkx0fwuYi+eBReQQ2E7aL8yRZW2jDpRE+0hWS3nz5izIwArmpLaihRyfM4C
	WAJBg6GLbaK1VprctkH433tj+B5eO1YKjMa+ZWbdEn6XHrPLFAAN1u+qXkpHFphXnxsiQ6gUwVX
	eyefaWj95XDXb497YIaGsI3ASe/1+CUVy9/XIB5cabjGweZ+Qp9+moe1qIxOgsEewYquT+amFS+
	LPOUcMvp6QmdMWpVs1jdz6rZsF5b8OXKfEUQB6wdyYgae/Ku7ItrD86eCa2Nt9PM7qZcyKPGxTl
	40NWLsLBDhshj7aaZwpA2Q3HExp1cWia2iET9d72m0R61/QRz+9Zpxrbwf2+IGUHfXPbwYWXcRf
	gUS1z5GZ6hsQbcSyxMQoq6zjPySaNJ3MsIL6LvfQAv9w2c6XhxX+PYcY7L6olhqLEaexvPaH1NU
	KDiIm6WCzmOz2lFipa13hWIFo54hclzW2OiAg=
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr18736071cf.52.1781245333855;
        Thu, 11 Jun 2026 23:22:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr18735801cf.52.1781245333414;
        Thu, 11 Jun 2026 23:22:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aeb6dsm253549e87.64.2026.06.11.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:22:12 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:22:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
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
Message-ID: <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
 <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
 <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6t02o0ebxC4CAEO7tQDbMGA5PeixXtFt
X-Proofpoint-GUID: 6t02o0ebxC4CAEO7tQDbMGA5PeixXtFt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfX94/NyFKBZRO1
 8bSHjXIA676vUanKngo0ZXUFhkexTvCqbsANXEmeQF/x1Hwk85h/hyRmBmRrjJwL/nI/jga5nNt
 r+iH+hUg82gbFJbfyAVaKrzJizcgB8M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfXxfXt0q+x4nRR
 DkhtA3Va7lo6NBJ5+RQX/9FQaS7QqWb8C//HpZv2qMXlJhPQZxYAuJaKn+bIfyDCkBw5EebY6+d
 envhxxz90CBbC4eDNZ4ykrp7Fhc78QwsP5o54PzDqzl5JQfuMl0hfWjpKqE5Z7y6iSuAtsMWc4b
 8XSOXuFX7i5w94iNvAX2BbSLysW49cyE/GGoRtZskdurVplzemVKGamREf7PHlRJ3lu5KD0E1mp
 +tgsv5XBgFGI7e6JBvGD7UtvAKMAu3F5my/vsOAYIr3502wcWZtbusN//5EQF0zvt7t+VfwpGe8
 X31sUIgQ8lQYJMzuh0DkQQzxYxo/kNwl/kJDR2nkgIpolyE5NIisxqou3h/8HuLE0wVtqnER8rD
 rN0LgSxXwZNsr9Wt4N3wyZWl1i46Mn3fspUtJvvoYuncueZaaA0j4V2WGfJeg79thelrTmBjQj/
 dk7gJxaO5S/Xl9cpgwg==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2ba596 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=onbnNvR133blzQGUTA0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120055

On Thu, Jun 11, 2026 at 06:17:57PM -0700, Matthew Leung wrote:
> On Sun, Jun 07, 2026 at 11:01:10PM +0300, Dmitry Baryshkov wrote:
> > On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> > > Add a dedicated schema for the PCIe controllers found on the Hawi
> > > platform.
> > > 
> > > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > > ---
> > >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
> > >  1 file changed, 204 insertions(+)
> > > 
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/interconnect/qcom,icc.h>
> > > +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> > 
> > Stop referencing clocks and interconnect header files. Replace used nocs
> > with ephemeral values.
> > 
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > 
> > Not looking around should be a sin. Take a look at other Qualcomm PCIe
> > bindings. Compare them to yours. Then fix yours to follow.
> > 
> > Hint: the extra soc node is useless. This is just an example, so use the
> > default, 1 cells for address and size.
> 
> Thank you for the feedback. This new binding follows the examples set in
> the qcom,pcie-sm8x50 bindings and retains the same formatting (extra soc
> node and header references).

Hmm, interesting. Then I'm a sinner :-)

I looked at msm8996, but I didn't notice that the rest of the files use
the soc node (and match what you've sent). Please excuse me.

> 
> I understand the example can be simplified with your suggestions but
> want additional confirmation that these will be the convention for new
> bindings going forward.

At least, let's keep it for now. The other comment stands. To remove
dependencies please use ephemeral nodes instead of depending on DT
bindings from other subsystems.

> 
> > 
> > > +
> > > +        pcie@1c00000 {
> > > +            compatible = "qcom,hawi-pcie";
> > > +            reg = <0 0x01c00000 0 0x3000>,
> > > +                  <0 0x40000000 0 0xf1d>,
> > > +                  <0 0x40000f20 0 0xa8>,
> > > +                  <0 0x40001000 0 0x1000>,
> > > +                  <0 0x40100000 0 0x100000>;
> > > +            reg-names = "parf", "dbi", "elbi", "atu", "config";
> > > +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > > +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
> > > +
> > > +            bus-range = <0x00 0xff>;
> > > +            device_type = "pci";
> > > +            linux,pci-domain = <0>;
> > > +            num-lanes = <2>;
> > > +
> > > +            #address-cells = <3>;
> > > +            #size-cells = <2>;
> > > +
> > > +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> > 
> > <&gcc_pcie_0_aux_clk>, etc.
> > 
> > > +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> > > +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> > > +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> > > +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> > > +                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> > > +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

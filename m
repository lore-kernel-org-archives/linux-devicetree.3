Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A7DDCD
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671888; cv=none; b=vGcJ50jbo8Om2U/9MvkkqtkSvnC4UjhyMRM1ZKMqUv3iwtreHyugxIwWEhU6mwq4oPzFUpCZOKMWznExfb4R8O6eOrOJaEMcrbjV/1dTVyI4B8l+ywnnLI/BtXkEu6S/4K54/6MUXw2cnEK+6YwDUCUtXtUAVCFO3DbcRZ4naAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671888; c=relaxed/simple;
	bh=z6Do6shpURmOZRYKvFoXbHBi8MAMQOej+11njW40oFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kClPdfZogewzpNc0f5/NwgM26o00/1XvAydlkrWuj7qVJwwfACzmZKB1DKP6oTe0XLokpGgWS4lWlastwNf55XG/djifHkKXFGzVADFs2UsFv/AInBRx6PX3b9qtvzDXRLnUVBZkVyG4am0k/qOWvUhoSirfm+4Ga38HpJpKfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+wmpP8d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuAvoLTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+wmpP8d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuAvoLTL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79IkR1598349
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yji7lTIBXwCeSFI+byPZJvWM
	ffhhwyr+nkMpWfwkLng=; b=H+wmpP8dDKJLdvF8GAHgo0f3u+vsX+5QeeMyuEXh
	UaC//Sf9ipf+0Bs67aK8v2RXlBGJBYcJPZZLz+/c6V/wsQK9TdtGun9RQNQsbzN9
	+zTfrtMsNemIzXTZt+GoMzOaiM5P2rRHMMILf1/OH47gkUA8GEHFc7aYYfFK8Tvy
	dDJhClk2NL+MreHGT9Rd7/1phAm26gXZ576GHXVXIXbbXw1DdDZ9FQ/VuhluAP66
	G6q8RBK5lG9T4hGhohKNQ1h6MLoqdEbVrZIOSDht/r/xiGQ5yo3vr4LPqPXFcaFv
	oQCgrrlsCDaIQ1erN3VkyHWz8PLkApA+xj/NMc0urwZUkw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgng1ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:23:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so2663924eec.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776669802; x=1777274602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yji7lTIBXwCeSFI+byPZJvWMffhhwyr+nkMpWfwkLng=;
        b=fuAvoLTLx8Y/JAaRxTMtW0v/ExRcwV81NYodyY3a8YXkKdTBh0nXDj70jDOV9kLAX5
         Nxqt9Kh+6joOymYqdWQwBh8abtB50rePGdetru/6oiGXW1XSqVbSJ/D3/qESvz/K/eZS
         hdD/iC47UBWNMX3HVXKa95uVzJaZlexafgrA9k0dcolo9ho8urwn+Pc/uwZJi3KzFOR0
         bLWAyUFbbY20TO8yU2kK61iAI8Cgu67y31ITOFnGWRp/X3zIUo0+juTQnLfAPEFrdZ+w
         HXfT4w5/Z6X2bUjUcRx8hyxvXywl/RLKaAPH1KFwHMWYmmt6hz9/Bb2XR18th1thUe3V
         uuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776669802; x=1777274602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yji7lTIBXwCeSFI+byPZJvWMffhhwyr+nkMpWfwkLng=;
        b=ENcvdF5hxRHTTm2IYuXQuUMf2i97KCwuwM5eTOorYrlS0+PJdmAZY1WKmefPHOlq4a
         lig/pUVbOCCqLbStapDqsoph3IkvK7nPr6RhwpeMexV7JUWO5KgEAFZN5E2U2DOKvmld
         dzzhx2HPS73yRFeilRJv8Si/od+20FWr4/wguKRFovMXYOrw/oJdb1rw/RTI1rVSIn1o
         lGPVMNEv4szpkF5Ojtz/WcztKFvjTAN14h5xCoXfDqWe8zF+/6j8ggfej69Z6lfxotYD
         xpubaZSK9lqTQeqMw6vyHBLst+aUAMprpY2RugM5Osb/ZBp6CayNDEFtE34x/v6aVe1G
         aMlg==
X-Forwarded-Encrypted: i=1; AFNElJ8lwfq2Y13+XBgA0+bTDLCuis/t2GO5zGD+4lDsVqy71pWVpK7Rp+2VZgxQcbT4cq7HgqljLRDO0oMw@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhmNRzoatDbQaVTu6NBKPYK0xHY4rZ36Si7kAZRX64FJYlksm
	4InFTBASJ0+GCS5wlfML1ENR2zSNFBEP8VArjT+eXnGb2+vuYAVicYyzWLhwIF+R9QR+d4TCUnK
	y52Pav2q8E1JPuaQVKtKa12xF+QhxElbZI3OdC8Ec/GXCqFKYExMLp+bj900a7LGH
X-Gm-Gg: AeBDievH5UzrnXPXAg6NhNfWuGhVKHdnvqCji1maPBXY2t7Xm1mpc11fuavAiMjL38A
	dwbypBHhk9ir14Biec5ZmIqVCTTjOJ/AxUISxPNfyYjXq2C5d5W9o1otm6oY8e5pIBDS+dS2hZs
	FOJWsY7c46qHYf6JTtn6N0LV8oHI3U2Vr3ktW3C0zTofh6e+AOxPWoHVBsSUq1AIYkqT9JwiaiI
	m7yLXX5rgBaa1SF9RWgo1jlmH2DNGXmaS5ZtrBLhYMczXX0uevO454xJE7Qcjus2N7iP3stHe34
	NRDqONKC1hnsdllGIy2OZN8/270VlUxmzfHgl1mNwuDQoUhuQiu7UGEXTz9CUs/4AdxVyTdlCT5
	req1gBKhCIZ8U905AW7/Is00Je11ps0nfBLlrCcn985aGKbANV7W8+kGRxoJfJ0+JfAH4GEY7T3
	IoxY4=
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr4773544eec.3.1776669802073;
        Mon, 20 Apr 2026 00:23:22 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr4773527eec.3.1776669801485;
        Mon, 20 Apr 2026 00:23:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm13637143eec.18.2026.04.20.00.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:23:21 -0700 (PDT)
Date: Mon, 20 Apr 2026 00:23:19 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <aeXUZ1uSEJ9InUtw@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
 <20260417-awesome-tacky-coot-e59a30@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-awesome-tacky-coot-e59a30@quoll>
X-Proofpoint-ORIG-GUID: 3fB5VDYGTmXiaR6vH16h48ySKUBld46w
X-Proofpoint-GUID: 3fB5VDYGTmXiaR6vH16h48ySKUBld46w
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5d46a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AG9yAhbetzltrioosGgA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MSBTYWx0ZWRfX+20uYdpNl/P9
 oRsveReHfe/haGDyIdtNt66dre/qqErkgsCfI9syJ7sg03+oL8SfI6Q6EDeSXOGnZRsJvjMENK8
 GeDzTL0jm2CBMUF324hfS36+L2GW6h4kW8ZdnJuNVcAM0yVQFeDgvL6q0aeMJJ4Is7akcfkWMmf
 ExdcJx4D8Ip8Q3SPCsQ7RguY+fuT4yh74WI1LkYuBGOlivv+C46cWn5n9E5i6KrdQoipHniy1BM
 QTRumZa7hLTsvJES59aQmXq4JGg3D7IFjUBgJVNnbDnDNmQ5cNBAwNSBqXumOyqlfK3MTNvQ+LS
 tiwVrWu90xXSDRpcit2RoLS90xH1ziH8owNtJzQ7YdSxHcTzOK8yz2P1ibE9Y9XM4jkkuZX0ASh
 e/qeOa0fDDhp2O2B/LVfOutIYjq30LZccpwdE5PmsgsB0ewMEfQ1yzxF6537MfZNHluUbO4PpIt
 GW2S8meW11vb00IFtNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200071

On Fri, Apr 17, 2026 at 11:18:08AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 15, 2026 at 07:58:13PM -0700, Qiang Yu wrote:
> > On Wed, Apr 15, 2026 at 09:50:28AM +0200, Krzysztof Kozlowski wrote:
> > > On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> > > > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > > > 
> > > > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> > > >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > > > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> > > >    follower to form a single 8-lane PCIe Gen5 interface
> > > > 
> > > > In bifurcation mode, the hardware design requires controlling additional
> > > > resources beyond the standard pcie3a PHY configuration:
> > > > 
> > > > - pcie3b's aux_clk (phy_b_aux)
> > > > - pcie3b's phy_gdsc power domain
> > > > - pcie3b's bcr/nocsr reset
> > > > 
> > > > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > > > 8-lane bifurcation configuration.
> > > 
> > > Do you describe PCI3A or PCI3B or something combined PCI3?
> > 
> > I describe a single x8 PHY with resources from both the pcie3a and pcie3b
> > PHY blocks for x8 operation.
> > 
> > > 
> > > > 
> > > > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > > > requiring the clock-names enum to be extended to support both
> > > > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > > > pattern used for [rchng, refgen] clocks at index 3.
> > > > 
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
> > > >  1 file changed, 45 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> > > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > @@ -18,6 +18,7 @@ properties:
> > > >      enum:
> > > >        - qcom,glymur-qmp-gen4x2-pcie-phy
> > > >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > > > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > > 
> > > That's the same device as 5x4, no? One device, one compatible and this
> > > suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?
> > > 
> > 
> > It is not the same as the 5x4 PHY. In DT, we model three PHY nodes:
> > phy_3a (1x4), phy_3b (1x4), and a separate phy_1x8 node for x8 mode.
> 
> OK, that's what I wanted to hear. And that's what should not be done,
> 
> You should not have a separate node for the same hardware. First, DTC
> will give you a W=1 warning, although warning itself should be moved to
> W=2.
> 
> Second, the warning tells important story - same hardware is described
> twice.
> 
> You only need phy_3a and phy_3b, so only two in total.

We can keep only phy_3a and phy_3b, but still add new compatible
qcom,glymur-qmp-gen5x8-pcie-phy in binding, right?

For boards that support pcie3a(1x4) + pcie3b(1x4), DTS would be:

pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };

For boards that support 1x8, we would override pcie3a_phy with:

pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x8-pcie-phy"; /* additional resources */ };
pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };

This still uses only two PHY nodes and DTC will not report warning.

- Qiang Yu
> 
> phy_3a could have resources of phy_3b OR could have a phandle to
> companion (follower) phy to fetch resources from it. I don't know yet
> which choice is better, though.
> 
> Best regards,
> Krzysztof
> 

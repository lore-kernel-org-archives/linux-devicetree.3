Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B457D296BCC
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838771; cv=none; b=U7KtLrAgGCsICjLQlDatqB14dYZDAFNxsxvB8TkaTKig60ZYlcGJ+qOd42BhB9yx7yWhHOsI4Ua4eC/TAjgONQyWvCOJyPhNeUGXb1KNFbii5WoIww1vj9cAgcsgmJZ5OKOoZJVP+/jwYyyNb2B4UZHYwNJxmpZusFoWhMOCKl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838771; c=relaxed/simple;
	bh=ZWJ8Ef6AbesvoB5+xOJ5iH6ZutkR4jctdzADniNUbpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tncRq86QuicWqWoSdlMOhafqddaZAGwMw2m3a9zoaMvl+PTLPq0pOW1z6t/cVvBkYA5g6y9pkhWeAKlXOrIKlfVvEv25oLJTJpjoJ2p+8XAuuhlKlhu6CEKeheHBUy+zWr0C21MHP9BIJFO89ZHr2sICdOlw3Oe+7gqNTLpFlmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnA4b+hW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UakllVGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnA4b+hW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UakllVGG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5WE9C3730717
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IZDqBmsRSxFLnbIPiI9lg3ef
	yggUSYIXImGxQoi+iYI=; b=jnA4b+hWcSUhbaXH28EHm7gEnsNNpTKwBUVj+XQw
	F+MMsinf8sJaWxhnCo0/lY5f6PnJPjNXkI51UHyY+nS56GxBtncGmtfoxHmi2UWb
	1+GVCnSkM964UcuXJ8j0z7K0xaVw2lIWT17BVOI5R4Cobj5YIMF7uSAdi4zDirvg
	m9bEveEHKBP1F9zvQbS8Uoilyjh2I4cnbcZC/LyaVGYG4oXTKiQXs0cPvrtzQsKe
	mfCvZhDsPTjdmwkZjTcbjbnCyxiZ03RgNKWKAq8T0s3L/lrndtWKqOplP4Idykin
	WzPS4bQx8ZoEzO9rPA4ua81K26HVsnVX4xkqZLdBLVa9Sg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfsw9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:19:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso6143839eec.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776838768; x=1777443568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZDqBmsRSxFLnbIPiI9lg3efyggUSYIXImGxQoi+iYI=;
        b=UakllVGGAGnMI1bnp9ehUeKx9zZyXsWPy+aAcaX0tTUhlu07dLg88lmriXdaU7kR5B
         cADsrtPp1sOZejVkkm98TraYtg2a0QRgn4Gi1tmybT2Nj7E4sWaycgF+6g7WFVGbJ5Vh
         gyV4/dx7nvM+FqsXyeApSbgFIhKF34qMFS5F46RIOENpMY1mPCA6o7X0KBQRC6cE9L09
         CropoOXAGxP37D5mYG9kFRkOt+5/GeryUbVsZVhIqx/wD2IK7T/mD2hNDSIk9mqGNsgf
         mLeiII9vb/i7n2D87xl7Bf6pkT2hplkbsrT00/2NvRK9aj3PaS0ZCeReiR18dNmLoXyG
         TCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838768; x=1777443568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZDqBmsRSxFLnbIPiI9lg3efyggUSYIXImGxQoi+iYI=;
        b=QqBYj+uwZ++3Qn3wc3CUC3SxOedHAHTU1Y8o4/hbxdwgn0PmNAkzjZaO5t+o/0mEPh
         611q84oZBYMxDw0dWrzCt2M21mXH1vCLlzAqLyrDMxM4JF1OvJNLtxK3tWibbUe/JIZ/
         X251TICyb3fa1OdcsY9dSzlv52osK9YhvPiApR2x/yAYIkn5wds/ZR2vfS9ZH1IhW1jG
         gOznhcgMdgS/bMaIEJZi87MQKqNOmKgoi5N6ChnW5P2ubmruUvWIZeOL345iLe+uokK1
         EQkkc/WZAhg9LoQBfkLHWIbJ8ihr5+WAYVvaSHp2LPOSpt6A4iJMh24UkAvoljj/6hAo
         Vn3g==
X-Forwarded-Encrypted: i=1; AFNElJ9XdiIyN6+3c9+fYbZQLCfmqkBkAXWHpRNiJEe6MNgtOIRP6zWEdxgrNPHv22sG4+RbGPSD6I6sq2H7@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIZZXPZ3rcOLnfYYdPx/hRi6PY5TrV4LXYf4Xyd0zI9NcsZaX
	vHe4nO7XXzbsfD8cgcDwrSPYEoEVfRBrOLhFZC6B4OYCQFwzgSmYUktVF8hewV+PqUw9JITT7kZ
	2muZk3Ixoi7ncoXQXhenXdxLHq9mtVQeSAoMpTKZuJu0MyVZYkURRQAfNTwKwd4FZ
X-Gm-Gg: AeBDievFHB6JEPtG+kNkedVV4hBqCOGvgJFpam6Bniud+ztLs8dlGrfABw/1BXgKIyk
	8760owWCNbL5BIyUSJFuFmqO5HTbGprxWzpQFFO6G5KXMofYTmuEzvVf3aEUAlsWAjYTgTlz8BE
	4hO9HYfjoRqm2G368qEjpD5SC/TGcSt765T7eSc9e8SvkRcWU+afURWlDhwZ2EzN3QXmKlEsvhh
	7eKRPpi3M85ESFUC6mDvynyXGj3lvfbOBUGUU15Hcs5PScMSukR6+1wrO0nsAJ/L2uX3SbHgLCB
	D/ueOdZjYBMjLqMJ8JcdmozVqF0Pvy3UkajP2FpwRy/mEzibKq98i8q5uiHcgjejKj9DJmn0/Vw
	97jG+r2Cp3JkoqJ+CFtdJWWdrP613M/iW22Wa6nUzzX/X0+dvR2tWfleQ6kr4zYWCyQY7XR6Fp1
	L/ySg=
X-Received: by 2002:a05:7300:1352:b0:2dd:6937:79c3 with SMTP id 5a478bee46e88-2e479210772mr12236270eec.25.1776838767652;
        Tue, 21 Apr 2026 23:19:27 -0700 (PDT)
X-Received: by 2002:a05:7300:1352:b0:2dd:6937:79c3 with SMTP id 5a478bee46e88-2e479210772mr12236241eec.25.1776838766937;
        Tue, 21 Apr 2026 23:19:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a80c7sm27395199eec.10.2026.04.21.23.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:19:26 -0700 (PDT)
Date: Tue, 21 Apr 2026 23:19:24 -0700
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
Message-ID: <aehobKDsh3XGOmsw@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
 <20260417-awesome-tacky-coot-e59a30@quoll>
 <aeXUZ1uSEJ9InUtw@hu-qianyu-lv.qualcomm.com>
 <20260420-optimistic-unnatural-stingray-80da35@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-optimistic-unnatural-stingray-80da35@quoll>
X-Proofpoint-GUID: oJVVaEg5N94WO1-CKloC760-JAi-ijTc
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e86870 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TH_F0qHjsvcmixwPkT0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NyBTYWx0ZWRfX+pxAC6vWPAd1
 1TJ7lAo8lgVAirvgy/ZrF4i0fkoO9q8otpQ83+JL223vN9t/0KGndO0l34vM337tZPqVL6OmzlI
 AgibDBojHdc5wxYvBGpaaTPKWXfXzpWgedAthLfkfUx4O2md/l/AaFm4qNuLCPzsSF2O+iFew8o
 LWcIG7G65EX2f9jY/xfvRQdG/SZCHS2JQSWV4k63ezwzBRzAuztDlU2Su3aLergetz5+0Mf9JEN
 ZFWgPu5XfIUuT2+23cc0ZK84WW1+TAcrBhmxClRDBgBXrmKuf9fy4fxfuKvUyXZp1iQVlGxsXnG
 xTjqeW22wVzPCD+QViKnO+/Tx/VX1oNi7eTzZup7mlqTWK68JUpYQnOb4I8rp0Rwy/+h0iGGCXv
 VlI4y7SvvdFkKlAUciB80g02zg8jfLx4j/X+y+rYoUYdq3rejn+Ev9vCwrlImP7sLc3LH2fUFIU
 gLJdrDBg3BcLVscPqYw==
X-Proofpoint-ORIG-GUID: oJVVaEg5N94WO1-CKloC760-JAi-ijTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220057

On Mon, Apr 20, 2026 at 03:23:43PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 20, 2026 at 12:23:19AM -0700, Qiang Yu wrote:
> > On Fri, Apr 17, 2026 at 11:18:08AM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, Apr 15, 2026 at 07:58:13PM -0700, Qiang Yu wrote:
> > > > On Wed, Apr 15, 2026 at 09:50:28AM +0200, Krzysztof Kozlowski wrote:
> > > > > On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> > > > > > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > > > > > 
> > > > > > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> > > > > >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > > > > > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> > > > > >    follower to form a single 8-lane PCIe Gen5 interface
> > > > > > 
> > > > > > In bifurcation mode, the hardware design requires controlling additional
> > > > > > resources beyond the standard pcie3a PHY configuration:
> > > > > > 
> > > > > > - pcie3b's aux_clk (phy_b_aux)
> > > > > > - pcie3b's phy_gdsc power domain
> > > > > > - pcie3b's bcr/nocsr reset
> > > > > > 
> > > > > > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > > > > > 8-lane bifurcation configuration.
> > > > > 
> > > > > Do you describe PCI3A or PCI3B or something combined PCI3?
> > > > 
> > > > I describe a single x8 PHY with resources from both the pcie3a and pcie3b
> > > > PHY blocks for x8 operation.
> > > > 
> > > > > 
> > > > > > 
> > > > > > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > > > > > requiring the clock-names enum to be extended to support both
> > > > > > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > > > > > pattern used for [rchng, refgen] clocks at index 3.
> > > > > > 
> > > > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > > > ---
> > > > > >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
> > > > > >  1 file changed, 45 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> > > > > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > > @@ -18,6 +18,7 @@ properties:
> > > > > >      enum:
> > > > > >        - qcom,glymur-qmp-gen4x2-pcie-phy
> > > > > >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > > > > > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > > > > 
> > > > > That's the same device as 5x4, no? One device, one compatible and this
> > > > > suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?
> > > > > 
> > > > 
> > > > It is not the same as the 5x4 PHY. In DT, we model three PHY nodes:
> > > > phy_3a (1x4), phy_3b (1x4), and a separate phy_1x8 node for x8 mode.
> > > 
> > > OK, that's what I wanted to hear. And that's what should not be done,
> > > 
> > > You should not have a separate node for the same hardware. First, DTC
> > > will give you a W=1 warning, although warning itself should be moved to
> > > W=2.
> > > 
> > > Second, the warning tells important story - same hardware is described
> > > twice.
> > > 
> > > You only need phy_3a and phy_3b, so only two in total.
> > 
> > We can keep only phy_3a and phy_3b, but still add new compatible
> > qcom,glymur-qmp-gen5x8-pcie-phy in binding, right?
> > 
> > For boards that support pcie3a(1x4) + pcie3b(1x4), DTS would be:
> > 
> > pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> > pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> > 
> > For boards that support 1x8, we would override pcie3a_phy with:
> > 
> > pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x8-pcie-phy"; /* additional resources */ };
> > pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> > 
> > This still uses only two PHY nodes and DTC will not report warning.
> 
> IMO, you do not need another compatible. Device is exactly the same. If
> wiring on the board differs, e.g. you have 8x instead of 4x, you:
> 1. disable unused 3B phy.
> 2. Add to 3A missing resources or the phandle to companion node.
> 
> At least that is what I tought till now, when I opened the HPG/manual
> for Glymur phy.  Someone skipped important information when PCIe PHY was
> upstreamed first and glymur.dtsi already got PHY 3B described.
> 
> Reminder: writing bindings asks you explicitly to post COMPLETE
> bindings.
> 
> If you posted COMPLETE bindings we would question all this and you would
> have to check in user manual that this is actually ONE device.
> 
> There is no 5x4 phy 3A and 3B, at least HPG is pretty clear here.

PHY_A and PHY_B are two sub PHYs that can act independently. I thought we
can describe them. And for previous target eg Hamoa, we also descibed like
this.

> 
> And you should start with that.
> 
> But you posted first incomplete binding, hiding the rest and now you
> have 5x4 merged into DTSI.
> 
> So let's rephrase based on manual:
> You have only one PCIE phy3. Not 3A + 3B. That one phy3 can be
> configured by consumers (board) differently, e.g. by requesting 8-lane
> or twice 4-lane phys.
> 
> Let me send correction note for glymur.dtsi.
> 

So we can have only one compatible "qcom,glymur-qmp-gen5x8-pcie-phy" and
one phy dts node?

- Qiang Yu

> Best regards,
> Krzysztof
> 

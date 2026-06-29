Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925326A1C4
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710338; cv=none; b=nEiOvaMe561g6toznIbJGhi4M3A80ZnvSmPPRuMTiNYs/XegxLkXvWvdE9Dls6oS7j0DuCuRE/0HWt8fSRf0NkKP0oCpj97mgC3R9UyICgGlQU70MlSI7QT2y0tFmzEdrA//h7GHfnz76XmUGM2wEtont39i/bHuE9JlqMsJiiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710338; c=relaxed/simple;
	bh=S8fkSao44xeOcVPaAIheQwuHzrixBRDdW2lLDSTiHzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ja7BNwiXj12HXDdj/ToRS90TIbHaLqnC8g0p42sf8lTwKetQkm+RFI9rUb0P5d0RXcylcsJugGfAb5a0xokE1/VSlG0GrybHGD+bUIy8Dg2LL317oAAX7pzov6aiWN4JYL655vbU9IyHVmrX1dgRAdJwrzYUUbophW95T8/g5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvGKEi1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6qaGho1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvGKEi1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6qaGho1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHaL1787648
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aymJ2Te3Ti6zcqD0Sr/Ev4D+
	oYziEjIRd/G7pRUp6DU=; b=DvGKEi1VgLheChoQ3f76P6mzdqBkKh+uMuLUKBiS
	8UN/2VPWnSogd/e8Hq4DnUpb+049lrk6iUFeZLsOrcGji6tm5Ke19TwjFRuZ08Fl
	bxnLL7gHKlNOzspBPMaXavmJaVbTYHeLv7kwUG00oSZuKHBqSLARX8HAqi1/wuq7
	VJ+HI4atxmzpWSTHIAUeSECwTytWgQSrPDOlL3h6LFWU8ziLoJgNSllryPlJf8Sy
	QFvpQRBpvh0m7USoAKDOoOt7JfGh8lNq9227RPHmPic9/ZZnXVDPdOEzQxLFYA1p
	Ss3LOwP4jNeLrBiy4khqCvCxZmLgvzxjtbe7x9ANMPIIvQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuvkw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:18:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0a27ad86so6844953eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710335; x=1783315135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aymJ2Te3Ti6zcqD0Sr/Ev4D+oYziEjIRd/G7pRUp6DU=;
        b=J6qaGho1B277dIHfvRWE89/KZ6a/eneLVQBXCQTSzXXJA8JfAeWTQgfLXIW2Sw58z8
         Tpq8jT2q9PRgP1ORWEw2oF3s8RmCwruwubMUNtOPMvfTMYVQjyLAdhrQv4irkoFFaiL/
         JNcAXUW3wDfhEFeuRZBt4RcCctbtzzjvROElQPcfP3MJyVWejF/SwzfoJqGTcr9CiZBV
         bFnV+OWqtRXHU/SUa4KXLtjNEkmB8qDrRhuX5zVg4yAbJeDuQ9oVhr1ooC8Hy83ipX5U
         3oxzof6vTmaJW+GRdRjxRedGTHyKsmTZWibCSXcefpAnhELcq1zzqvfRDXrdBdLX6Og+
         l9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710335; x=1783315135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aymJ2Te3Ti6zcqD0Sr/Ev4D+oYziEjIRd/G7pRUp6DU=;
        b=VBfCjFYexIY4ydeO+oPeXdIVpo4gENTsfQYC1XF0RQnwqdGnepYyGgYRsrqJI950OT
         ZikykoOHFq5frYu9j61T6UBUpeBTkX1JKeRpXxSIzw+Ec7YkxQ/gpoUflL5nC9vH3K/t
         4fPDETCTKVwWlEZHpl8ahlkaVZ7ri5QqRkH1XixBXAb5E4AXaPkF3MHdho9zdW6I3vT1
         ip1xk7SVBzhQOZ2X8KvsbaYKzCnz8gVlIbIsv/uTfMZ+f4JqaaRDibADPvcCcSbebyc1
         W5EswBXuflTiYVz2iROITxwxO8PZkF0NZSCV+BULQFmzqmGRE4xUt5szpybL+YwwqCXP
         6Ybg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6LEzateBONwfcF1fbPlXROr/5dJGq67ZEu+qAsI4cOPrfxKUw8n1XYvoJepLOVxox0FkFQ1ym7rOF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqx1XdmZMe7NFBlM438lcDrlkUtCSQXNoKoBgUisjYIBaURp//
	Mel9eW6L+Y/8odzEXMHR+n2Cc3zAk6hcHaJs3b5kNX3AYawQm84ceFLjmSPoEPpPoFv+rCeA/Yu
	KK7bWc1b81Z34Z4NBtGTE1aopq7+6cm/72hCJLbShbs7UHXBKidNYd0CP9A/zp+Mb
X-Gm-Gg: AfdE7ckBqJDFLRuUiulH6v9y+IYtbdK2OthKKBFH+p9iv9AdffvbiiX7lL6Ei4kxait
	jCn2iPJ9kUYyK8gHX/jg49f5uFNgPKCgj11q4oNRHKiPLcfuaP1kPadd6cq6d4yjsLeAKos7HNp
	Rw3DwHNsQWulz4QTpIH7iMRnecC6cwkeFEmfmSczhgWng0Tg4h/JZMuZXHb79w8LXxCf4w7XwKc
	EOxLIv3+uu04bex8ZSBwGvArqhF2aLxzdBDf0TzhdN0BAarRVSYuoOYqNLvxePGe2X3t31EbGVp
	pNZ7azVooveo5CslrcYvKihbJ013X+WRcP2bmulxztMYkqHp+LRXfAAJoWRNmu14shDOjSsHMsh
	humo/YD720jJjrP8PwStpBgpycrXyjOeODpHFD7t8GcYWuY/RSpxkhNV20w==
X-Received: by 2002:a05:7300:4316:b0:30c:550d:3c7b with SMTP id 5a478bee46e88-30c84d9efa8mr17428906eec.1.1782710335587;
        Sun, 28 Jun 2026 22:18:55 -0700 (PDT)
X-Received: by 2002:a05:7300:4316:b0:30c:550d:3c7b with SMTP id 5a478bee46e88-30c84d9efa8mr17428878eec.1.1782710335089;
        Sun, 28 Jun 2026 22:18:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm42698612eec.11.2026.06.28.22.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 22:18:54 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:18:52 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
Message-ID: <akIAPK7daXxPH5JO@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
 <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX7LrFrJJv3MEP
 v6g68h7AHXOtioFIr9aEp+BbjF1aJE5gJgR+Kgsa1cq1ntyE9SAHK1Eyc5CvwbeJ0AuwrkM2/BW
 Yu1h0oZ2jGJTZn/VQzqZbyE18abU2bs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX8n6m5C9tI2ya
 deeaDJ/y1ezU2wZjOjcKLbVMeoU3FbwVFeTmj+5pYNGyPMuPg0QcxMOwfzZ9EJo7sP5uZccLYri
 v2E+ce5BjEPGdHKDCnMcBQouKG3h23JdNWeiRX7sMMCGNiNyhGKf7Y8rwyfX8JnkJJWFP2C1tuF
 vZEXHoU13ZGJmyJONLUYB9wxlOX673b7rLxTW8zDwcYU6PjHL49V6P8t0/7yPCbhAxZRquifEgo
 Az/u3nwceHLowdP+1OZX8Zrkc5sHHAFi28zp79tY8WJries/Wa24wIIfO77Avc5+dxzYn7Y7wQo
 RTcM0bPNvMAVeYxMRU+sTCfCGJmcz2/Pxq/QQ4I63fVIrP25zbU6o7x8RBO9ok1r8HEej33UCJ7
 fL4pY/aDSljmQLZEizm50TaZV1hBtsdjnV3gZvVyEkRmU7gjAycSnF8JXBvYr4URhXIOqK4Y33p
 G5lVp0TS3Kp6FsWSOfA==
X-Proofpoint-GUID: LBZDU9RtwOaKxt9ivl6XPKXwbNa54Bde
X-Proofpoint-ORIG-GUID: LBZDU9RtwOaKxt9ivl6XPKXwbNa54Bde
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a420040 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vrcMDjKIvnehLc830DYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043

On Tue, Jun 16, 2026 at 04:07:27PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:47 AM, Qiang Yu wrote:
> > Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
> > link mode QMP PHY:
> > 
> > - QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
> >   values for QMP providers that expose multiple PHY instances under a
> >   single DT node (i.e. #phy-cells = <1>).
> > 
> > - QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
> >   values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
> >   selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
> > index 6b43ea9e0051..befa76f8392f 100644
> > --- a/include/dt-bindings/phy/phy-qcom-qmp.h
> > +++ b/include/dt-bindings/phy/phy-qcom-qmp.h
> > @@ -21,4 +21,12 @@
> >  #define QMP_PCIE_PIPE_CLK		0
> >  #define QMP_PCIE_PHY_AUX_CLK		1
> >  
> > +/* Generic QMP logical PHY selectors */
> > +#define QMP_PHY_SELECTOR_0		0
> > +#define QMP_PHY_SELECTOR_1		1
> 
> Is this for the second phy cell? FWIW I think it's fine to use raw
> numbers as they're just indices (i.e. "nth bifurcated phy") anyway

I can't use lane numbers. In x4+x4 case, I need to tell phy the first 4
lanes or second 4 lanes are required.

- Qiang Yu

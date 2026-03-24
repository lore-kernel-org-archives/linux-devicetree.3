Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09253783C8
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390805; cv=none; b=rglXcPYI+wNlRJgsWG8TPCWRDNgQ4Fr1/JRythRwiOaiXvpy9sRYs1jtCoB1puvnbB2fzemr5A9W4IxXNk2s4E49YrhHJyDn6Aj7ras0VeNRNMT5CG4RK1VDTj0LHWyeyplSdKK/qeW9nEIkgYtP+IoWu5ayELm3OqM0vr1+Yl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390805; c=relaxed/simple;
	bh=0GEDeTiHUpsHyCgP/15tglbvgfhfh8UB69k6+ilIvD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qF1uSolH69fhfJ1RiVGva67Rtrs4tcgX3utQMNnbocU/dfgukVSaeswPhU2bmLj3LegzuGTq9+ew0HZWp/aDbnO0zU9StehmAow19KVjIq7o+fF1DT9uBucAqXT8HNlw45O9nzmedB6RbV4HYLiOP5XD4MRMWnhE+jumCNiIE3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRUlYJcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsqKd/4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRUlYJcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsqKd/4W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD9CU2146836
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DXfDq3Ed/IGLER8UTluc261t
	apAHFbnvzfmNWppFei8=; b=KRUlYJcq6++KH3hcFE3AzmTVq9QteFk2BxBcsBFy
	Udag8jUwIhFKslaE2/HCbAqLkc4XGzibmDRsdQnTVN+DxcjcIuch94TwpZXSJzm4
	MgJZmKsb3ebAQQhTFf0CwJt1doDnFkDDQxr+dbsDqF1iFzbb9wEnKVTl/Rtmi4Ll
	3I4UMjm1SCRoeqo6Y2ayu2Zj0IWsg5JRaHZT8iAeGOJBhNBSt+DZLOkrRLFXOAqD
	jhjJt7flLxk0Qe7nqDSsdchjeQirwH4Nd+bfpxdnD7Om61otP1Pd29XjzalqAnnq
	S5Hych4IiZbiKie30zx8Q9esJs293NlCrez43XaXUHr7cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexugra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:20:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so100593671cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774390801; x=1774995601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXfDq3Ed/IGLER8UTluc261tapAHFbnvzfmNWppFei8=;
        b=TsqKd/4WsVE5YhWd1zNChDXhL71X9/l+XKyA+pwp1uLXT2dNQMMbKuNJjv6zXznstG
         V2pIHC03q9tdc6uwtghf1VmY0AbyrXTmB7Kw44gEe7EWopa1m3AjOSVT6AhBHS3HJbuC
         RGaMSnR8ljQgw5hMYpc/9+WWl87UxqLJEvsc600cBFfZ2GoeHcdvnxGrhQE5BmnO7ao9
         9HMWwhbIMuA7QYTdVsNZpZK8+s9zoT+iNO0BHJCR9Tnu72ADRLcYvhzdh4AV9Yo83L4a
         ecbOk9bHd6yb4YHt3JTtDQz1jJ/tZqaI9jEadd81Jq7orc6tYngzj26mTFeQCqYin6rJ
         oDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390801; x=1774995601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXfDq3Ed/IGLER8UTluc261tapAHFbnvzfmNWppFei8=;
        b=s3tl6L1mD+NPO4GNFH/3CAHTfQLvJ+xp8xl1r2nj0XeWRMSbLAWrFf4P5LGQBISHDY
         QyL8VzSLuza7WzLsYsgzLCR6s3qp+eViDGp1+zEr9i/D6v57k+xGhf1PRKgR/Ufuw+rz
         8FMyEyHxbA2NLl92Wo413yRUtN1yz8+khvZhh7ixmNLttCrHDQ0rMwSVO0KY9PL0icje
         mJi7P2O3GJgqbsLMHBDcw0qHcNs5yUGveyyzlmoghJLncIDcvo58baw8/u6yTR1ora0O
         pUBYdgjmjS4A3s5fBZsiztjjuCbkr8neIiAIeBQ63TI+kbgoQniij73bPH0B2M8Xy4r2
         GLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuz8bPZb9//yH/z4OqaNwDEYIC9WA2rQ/KFlAKomjXJTOovnlL58r0wJh8tthAOg2TpU1OFyd1izVw@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXhx3H1BGZMQUiMG9/4iv+y/GqV3zDGTotbBggu13uXAnlxq8
	f1ewHgGidrlbesoJKQY84dYvnuhHyGae1OqGYzORJn8fou71oMM2PDhYSg/SsW9pZhqGuepPFfw
	fXXHlocC1iBHSjxaZV7DvBrL90j/59eIrrETjC7eHilSWef08C24p8DhnG4kcOtth
X-Gm-Gg: ATEYQzxR7Q5wtTlXNCbqOXr6f0V+zVA6HPvYUdb5HK95pnHijV3J5cUDkpbuXbWa7/m
	u9raDtzF2yyaHI6v8WyigBdpd6MuqwVwSaQAajhS3WPhFuNpMAT+4DNLS/DmJMpTAUSwkTNtc/8
	M2Fj8rHtMyo3A6ZXaTHiYgpqJgkEBvNZUig6Q7MiD5KUWDhm23uo7VLyfmgCs4pQIk/fiD9gs+Z
	qsNMtDrV61q+0bjTFHTojgldxUT/vE5WlqlgBcDPVjC0ZzObMzgKCBViH7vwqgLq9K/PqPX/DaA
	jgaUBZe7umRzNzEG2+yvIvno2Q0+j0+4yWPPO26jiW0OTFN1Y8xrkJXbx3xOW6NlikXX2cJHOpU
	MY9X4kAniwlIX8U7BzmRcA8axBC/UDb/q1DFcHvWQl7EQRzAUHdLVOlZfgvGyjqZfCxLj2Od7vE
	AzlVhXpqnW/yMs5KuYoqmvqvylrvQmAvyXQh4=
X-Received: by 2002:a05:622a:820d:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b80ea6259mr17386091cf.61.1774390800856;
        Tue, 24 Mar 2026 15:20:00 -0700 (PDT)
X-Received: by 2002:a05:622a:820d:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b80ea6259mr17385761cf.61.1774390800305;
        Tue, 24 Mar 2026 15:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972bbaasm33033261fa.6.2026.03.24.15.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:19:57 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:19:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <fh7rfswcwcrquijgjq547b6jjuq2v3wxiweh5xnnd4z5ql5n7r@gt425ujkpctu>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-1-d4b8ee867de7@protonmail.com>
 <sdcfwycey5ykhn2fghun7imx3tjtnwat3ny3mut5dwstl7wvw6@maqrzlycwdn5>
 <GF8zsK-szOM98Ck2jznCOZ4xjuJTl9g1b0uPc1N79Dzf7PNzOiVgewdqPFGjqF3YD7tOUa2tzdc7rG_e7iNH8yjHOJ9DobsihTxRLUk8EL4=@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GF8zsK-szOM98Ck2jznCOZ4xjuJTl9g1b0uPc1N79Dzf7PNzOiVgewdqPFGjqF3YD7tOUa2tzdc7rG_e7iNH8yjHOJ9DobsihTxRLUk8EL4=@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfX40Po5ZsrKxPT
 CaeqHSua3bqD75/aN+kv4MtdFE4fZYWbglAfgo6AONgz90wUKkCkHNccB3Lt91oS4HTtnh6BzcA
 1B7iZr+Hw8p76hla7U6HuWhlyo86FlybX1gX4ecsDZ8k+QhHyk5VI67F9t/92J7iSyZzrXRqyhb
 zs2rDYmLPZ8qTKGMv9l4oHOePBkkRsr+OvS3Q09SpUvcsVrk0MU74fIFx3++gutl1jz2vVP7mXR
 GIm7m/9mwr4G3sS5dD97arJAcExVUNVNihR5j0Lyl+NvE1Qs5TK64MTA+paiRpu4vXHZ4WYwjTz
 gLHZ6QpQ9PsbP1POPrp9zKeZblnj4ySVB0dGQshd3hWwtXsJ1iWa55SQJdlKh5Wo2/Sb+AreyHB
 VnATBuCTzFAgP1RYAMwn94yFGfoAvWDoNbuoiG5nIllfx6kLEet0wxK2g2mFfSC/azUD0ExiG4t
 FyVTcJ1l+I6byNEnIMA==
X-Proofpoint-GUID: vasjiDUzkd3QkP-S3jPnX_29tLutgB7i
X-Proofpoint-ORIG-GUID: vasjiDUzkd3QkP-S3jPnX_29tLutgB7i
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c30e12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=0x0uYR1eAAAA:20
 a=zvOWnUYkAAAA:20 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=BSL3PQau86bbBt3lHzsA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172

On Tue, Mar 24, 2026 at 01:10:13PM +0000, cristian_ci wrote:
> On Saturday, March 21st, 2026 at 17:46, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Sat, Mar 21, 2026 at 05:23:20PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >
> > > Document Novatek NT35532-based DSI display panel.
> > >
> > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > ---
> > >  .../bindings/display/panel/novatek,nt35532.yaml    | 77 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  5 ++
> > >  2 files changed, 82 insertions(+)
> > 
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: novatek,nt35532
> > 
> > This is not enough to identify the panel. This name identifies the
> > controller inside the panel, however the exact settings (and the
> > behaviour) would depend on the exact TFT "glass" used with this
> > controller. Downstream usually doesn't care that much and frequently
> > just uses the controller name or the the controller with some kind of
> > "description" like ("wqhd-dsc-cmd").
> 
> Ok but I just don't understand the following: I'd like to know (also 
> considering that I find it difficult to find someone, outside of this 
> ML, available to discuss this stuff, specifically) exactly why the 
> current bindings are not enough.
> I mean: looking at schematics and datasheets of other similar devices 
> and based on observations about my device, I believe the generic bindings 
> approach for nt35532 works quite well for panels.
> Novatek made the IC first and then whoever buys it can be a display 
> vendor. If we talk about downstream, differences between panels are described 
> there (i.e. my panel makes use of four supplies, while other ones could use 
> a different configuration).

Different "glass" means different programming sequences. Take a look
at the existing drivers which handle multiple panels. Sequences, modes,
etc. are different though the DDIC (controller) is the same. For Android
kernels this is handled by putting all the information into the DT. This
approach does not align well with the upstream DT expectations /
guidelines / philosophy / etc.

For example, let's take two NT35532 panels described by [1], [2]. The
sequences are somewhat similar, but the contents is completely
different. From the upstream point of view, each should be described by
its own compatible string (so that the kernel can identify them).

[1] https://github.com/eliot-shao/qcom/blob/master/display/LCM-NT35532-JM55FH-1080p/kernel/arch/arm/boot/dts/qcom/dsi-panel-nt35532-jm55fh-1080p-video.dtsi
[2] https://github.com/balika011/android_kernel_xiaomi_msm8953/blob/master/arch/arm/boot/dts/qcom/dsi-panel-nt35532-fhd-video.dtsi

> 
> > What does it mean for the upstream:
> > - Try identifying the actual panel used for the phones. Sometimes
> >   googling for spare or replacement parts would reveal such a name.
> >   Sometimes it can be seen as a marking on the cable or on the backside
> >   of the panel (again, googling).
> 
> It seems that 'google' approach fails, in my case :( (I only know that 
> the vendor assigned Smartron the work to design the HW - but SW too - 
> of the device. Nevertheless, Smartron is neither OEM nor ODM, so the 
> company was relying, at the time, on a series of chinese manufacturers to provide 
> parts required for this device, including panel suppliers: in general, 
> the list of panel suppliers for Smartron includes BOE, Tianma and other known 
> companies. So, this panel may be any of those, paired with NT35532, and work 
> anyway). Unfortunately, even if marking on the cable is known, that doesn't 
> identify the panel but the cable itself (which is available on the market, 
> though), instead, in this case.
> 
> > - If not found, come up with some artificial identifier that would
> >   identify the controller+glass combo (e.g. "tianma,fhd-video" or
> >   "lenovo,j606f-boe-nt36523w" (where lenovo,j6006f is a device name and
> >   boe is a "supplier").
> 
> Assuming that resources available which I've as source of information 
> for this panel are limited (the ones also described in v1's review thread), 
> my vendor devicetree describes the panel in  'qcom,mdss_dsi_nt35532_1080p_cs_video' 
> node and makes use of:
> 
> qcom,mdss-dsi-panel-name = "nt35532 1080p cs video mode dsi panel";
> 
> property. Until now, close-to-mainline devicetree I was using the following 
> compatible for the panel:
> 
> compatible = "flipkart,rimob-nt35532-cs";

In the lack of any information, this is probably as good as anything
else. Please describe in your commit message that you don't know the
exact vendor of the panel (nor the id of the panel).

> 
> and I'm not sure about the exact meaning of 'cs' suffix. I cannot state 'CS' 
> as panel supplier and use that upstream without proof/evidence. What do 
> you suggest, in this regard?
> 
> 

-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC2F41D136
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786805079; cv=none; b=jR3r3bJotLl30diFsBJ+dMGo5QE/86NNAnhjKr1wC4gbj+I4E0m5QF4VSfZI92EDQizBmNdjwwWG6IZ8AKwEv8J41Rc0gpm30Pwn15SV7B1qNqjjur1yqsbYwlReqUmECAERCsaSLhKw8QxmoBVaS9u0eHDgnQ4cBdH2GqhNV2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786805079; c=relaxed/simple;
	bh=yGfj/l5DctNSx5LLzusNalM1y7aUIbVLf39gaaRaENM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwy7ttzRz9h18IzFMHCgOf+kT8N0+ON2Ipy7ULyyX3LzYCou6mezXviLbG4CqeJcyikY7FRXdqN8EaiWey0sCYbQw6X+TA4T0ksVOgiT9lLJr5EuDHUfAhfofcmkaUy47KDhhztQYpgqpcfTTk6FNeQ+tdLpMVNNPkSKxGYcLEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UG9yRJ8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itkpTkGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UG9yRJ8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itkpTkGh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMJhE1168925
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfNWKRJxUJh6VQ1tMySicy4cv5Y6FOCC7PXOPAYPB/g=; b=UG9yRJ8IMMSzbVwH
	U63G9QOFyrV7a4JS7DPESla8TWqgmGhBLC64Kecotc7KFjUYNmPDmiSGp6ywTmEs
	aQTdmf2eAdTgNzQATZoDfl+f9sMg4WTaXvqU1QbVjpjYXoxp4MNrwUdf+gZp/Xqr
	r7Sf9ttH8r1KMhTnwJSAgEhXkEWwn6/CKB/0HQdoJnbU8vZTAYE0SQRNnSFJwSR2
	mndrUP3fpsXwxoHZ5eufNnNtr2+ixp+FOswBScd5oxQzwixyM17/DjoPSn8jGvO6
	p2iTVx1UJTlOGzonhH79wjHy07mhl5V2YmQinkCU0kCIg2suQT9EJ0vSGD2nihEC
	QVpFYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwh6qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 14:44:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so25136991cf.2
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786805075; x=1787409875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfNWKRJxUJh6VQ1tMySicy4cv5Y6FOCC7PXOPAYPB/g=;
        b=itkpTkGh5cijDYfXwBmxRonJ/OqJxHOxDQblJsgWTadYMRaPfTzWbjfPof9qckEghF
         t/TcbzgLCGRHeZnU/MXdIAmBJO4Yj8IXCy3ssG/guD467oCXP0IuqTTTtuLmsCqgTm3v
         BruRO6u1eIm1ROlq2IEczYrFctGc2UMqU5VpE65nGKpdKw8PrO1/UPTeUhcNew4pkdL6
         GP5rfWARcA7XgcS/8agNlFvRpD94LmqEXH/ZxgCmFmw+gJld4qj4T4y/6sSJGkZDq49G
         zt+aiilF8h0eT5GFTEvtXzF/1Vsfik6GDvxlvO5RpCT6oSUVjHN09T2ASq4559jJKk1D
         cq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786805075; x=1787409875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dfNWKRJxUJh6VQ1tMySicy4cv5Y6FOCC7PXOPAYPB/g=;
        b=HjGmNwQ7AAQhnPlemtV5TSOsdvJwiI+jVQevxODOtjsbtVwNs9lvgdzR3qPAzbzpT0
         Gs6vsjpy9dXAYh8Wyp/5jNb67kkY7uzETOGTpvmEdKk5kW+MOUvF0O3MfyR+g/eRxOgK
         fR/TnKXfKHhoC2Z2xm0522x2YcAUSmjXcuwCMxm2OPfPt/5+hv4oeqbJyLo5P4ToQ83g
         jLXIeNAheZiaBqBXYU0KzXHll4Ed7g+JRIubmF+lTs+I0BCVRi4LxY8bMl1aJFBI6apj
         cnjiCATATsk8hKXqZTMH6S4qyl3dSYBeJxG6GsarRzAVYrXP/8miAcA54G8Gd/4f0zxz
         u6qw==
X-Forwarded-Encrypted: i=1; AHgh+RomqGlY0fD/uUonn/nQMq8CXKRiqbn2MwjIA1K6VNdnPIqwyEeh8vMKbZ6PAmZTj2t240QLwmNwOaU7@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXiG7WYpkul7+OA30Ec8rGzglx6OQfa20TSHk8d8kBXebGr/M
	XK55VGXDS0/ag1C0BXQ2xWHkiateenP1Unewe73vhWVrNDZWRHJIY/Q4jI9IfATttMEMHtRllP0
	1U3B5wACqEODmL55vKR2rSdwbjfxkPeuDMp7TE8jdFI9xpunG4HQdkNZ+J5wxhiIX
X-Gm-Gg: AR+sD12FD6MpxzN1I95LR58TbujE4zkSOf0eq7PSmUcmVBcu909w+NLDa9miF8Lr2uY
	2cI5DmPQPslMA81bKsaYOeHxcmFX5/wQBT6Gf/GXQnCQ9oSYyMxPvXV3ZtdTbHGaoWyyBD7eQJE
	ELC9TqzWRUzlM/JRrgh+wBnVmUl1y7dZRwY3Q3OTtJzQLKV+LBAP7FhrHiKKMomtUz1AzUdIt11
	NzY+5ZJnLL45CZwrXEW8VpfZAB0UuCvQvJBvm7RK0UGeIvhdopn82d6GAsFginzshAmQFUY4RGs
	7oWzB/2VEMpUVOeBJPIaIgI4x4+/lo6ctU/uq7y8N0bKOnqmCFOzr3dX+IbyVCePbA8HxkgHG0B
	VPvTtmB2YgzhWkCO5AeEu9zYBj2gyeVUKyQsTGhXa4XxjrvF6RFB8XeNyRDEvgIru24EPUhyIsl
	SpF9dqIw1xyDZp
X-Received: by 2002:a05:622a:144d:b0:52d:8271:926c with SMTP id d75a77b69052e-52d854d3195mr122151511cf.37.1786805075228;
        Sat, 15 Aug 2026 07:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:144d:b0:52d:8271:926c with SMTP id d75a77b69052e-52d854d3195mr122151111cf.37.1786805074752;
        Sat, 15 Aug 2026 07:44:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130874512sm11881441fa.2.2026.08.15.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 07:44:31 -0700 (PDT)
Date: Sat, 15 Aug 2026 17:44:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
Message-ID: <4vt23tosseomh2j6iawx5ij6hp5gycuf2okjntwp6zygw6kflt@tavh75hc7fiy>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
 <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
 <CALHNRZ9c_+ahDALiQos+H7nWOz7HK8dOfWg3_vnkX+k4=vSp4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ9c_+ahDALiQos+H7nWOz7HK8dOfWg3_vnkX+k4=vSp4A@mail.gmail.com>
X-Proofpoint-ORIG-GUID: eGx1vJ8mA9eEwLMx9psEnNn9tAW8czPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEwNyBTYWx0ZWRfXzQfJpjarxTcZ
 sshGE1fvuomRMvLOo54QY/lrFMro8X1WPehm4POL+gTQCr/W6rmHUots1mSPX41yRtkZRCQDwsT
 3cC3vPKGnhl8Ol5buors3Kjpa+Gr/FXFBGaEK5rjCnBlg9qje+MUKu2GfgCD8cueQfi9Q3LvZpi
 HXSrG14fsHPaC/eQbrtBs4BDCMF7nut+5S8g3OINYqkQHR7fAofcaJU4QWQ1CNCtdYYHkniG3Tg
 /sY0oJdwgkPxQKGaLiMoq6tZXA4Hr8ca4JmZq7skaJr2j4tUOu+6xLBngDcqEEZ4ojuzCGRJqaG
 7v3yMg4puIInpeINotUwiukGTRs6zt8AuJwg3uFQu+MdcdQah5qjIxEK4qwka7I5/pyskQyDQ9t
 pvbBBPsHzhRbmiZ6hRsFS/JczojtpXlCxKiUzyj3xfd1BeCxg0mJRZ140RF1e8nriWOKdJ9hHwh
 q+HexJ8t7hGFq3cOsGA==
X-Proofpoint-GUID: eGx1vJ8mA9eEwLMx9psEnNn9tAW8czPp
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a807b54 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=QBfilD8PbD4vc2bz1Y0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEwNyBTYWx0ZWRfX0XdZdtZVhnTC
 B60ABcuwCs+Zju4gqxRAaX+8BqtqxKDOcVtE16MytlDkl5bvmOsLw82IX/W8GZbLe+hVGrvLgIf
 Iv9oYmcdd7Ihq5wt8O1yikdYCLxbVSQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150107

On Fri, Aug 14, 2026 at 01:59:55PM -0500, Aaron Kling wrote:
> On Thu, Aug 13, 2026 at 2:06 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Aug 08, 2026 at 12:37:57PM -0500, Aaron Kling via B4 Relay wrote:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> > > console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> > > 5.5-inch AMOLED touchscreen.
> > >
> > > This is based on the support by ROCKNIX, however their history does not
> > > show who the original author was, so direct attributation cannot be
> > > given.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > >  .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++++++++++
> > >  2 files changed, 123 insertions(+)
> > >
> > > +
> > > +     vdd_disp_1v8: vdd-disp-1v8-regulator {
> >
> > regulator-foo
> 
> I see these are inconsistent, I missed that when pulling the support
> in. However, looking at the associated AYN series, all regulators are
> named foo-regulator. Using regulator-foo would make that inconsistent,
> is that really desired?


I think, it's generally a better ide. Feel free to rename the regulator
nodes in the existing DTs that you import in a spearate patch (although
that might get rejected by other reviewers as "noise").

> 
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "vdd_disp_1v8";
> > > +
> > > +             regulator-min-microvolt = <1800000>;
> > > +             regulator-max-microvolt = <1800000>;
> > > +
> > > +             gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > > +     vdd_disp_2v8: vdd-disp-2v8-regulator {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "vdd_disp_2v8";
> > > +
> > > +             regulator-min-microvolt = <2800000>;
> > > +             regulator-max-microvolt = <2800000>;
> > > +
> > > +             gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > > +     ts_avdd_3v0: regulator-ts-avdd-3v0 {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "ts_avdd_3v0";
> > > +
> > > +             regulator-min-microvolt = <3000000>;
> > > +             regulator-max-microvolt = <3000000>;
> > > +
> > > +             gpio = <&tlmm 144 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > > +     ts_vddio_1v8: regulator-ts-vddio-1v8 {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "ts_vddio_1v8";
> > > +
> > > +             regulator-min-microvolt = <1800000>;
> > > +             regulator-max-microvolt = <1800000>;
> > > +
> > > +             gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +};
> > > +
> > > +&mdss_dsi1 {
> >
> > Out of place.
> 
> Oops.
> 
> > > +     status = "disabled";
> >
> > Isn't this a default? If so, no need to repeat it.
> 
> qcs8550-ayntec-common.dtsi enables this because most of the variants
> have a panel on this connector. So as one of the odd ones out, this
> needs turned back off.

Yep, I missed it. THanks for the pointer.

> 
> > > +};
> > > +
> > > +&i2c_hub_3 {
> > > +     clock-frequency = <100000>;
> > > +
> > > +     status = "okay";
> > > +
> > > +     touchscreen@38 {
> > > +             compatible = "focaltech,ft5426";
> > > +             reg = <0x38>;
> > > +
> > > +             interrupt-parent = <&tlmm>;
> > > +             interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> > > +             reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
> > > +
> > > +             vcc-supply = <&ts_avdd_3v0>;
> > > +             iovcc-supply = <&ts_vddio_1v8>;
> > > +
> > > +             pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
> > > +             pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
> > > +             pinctrl-names = "default", "sleep";
> > > +
> > > +             touchscreen-size-x = <1080>;
> > > +             touchscreen-size-y = <1920>;
> > > +             touchscreen-swapped-x-y;
> > > +     };
> > > +};
> > > +
> > > +&pmk8550_pwm {
> > > +     status = "okay";
> > > +};
> > > +
> > > +&remoteproc_adsp {
> > > +     firmware-name = "qcom/sm8550/retroidpocket/rp6/adsp.mbn",
> > > +                     "qcom/sm8550/retroidpocket/rp6/adsp_dtb.mbn";
> > > +
> > > +     status = "okay";
> > > +};
> > > +
> > > +&spk_amp_l {
> > > +     firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> > > +};
> > > +
> > > +&spk_amp_r {
> > > +     firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> > > +};
> > >
> > > --
> > > 2.54.0
> > >
> > >
> >
> > --
> > With best wishes
> > Dmitry
> 
> Aaron

-- 
With best wishes
Dmitry

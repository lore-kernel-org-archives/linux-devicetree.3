Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0031A065
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743765; cv=none; b=EZUMWTuK9JVZbhMcceqSanwIIfD5POSMjncqHOeJBatfJZ1HNEVFmrZm0PKnjI0hjD4gjxEPTJZz5z3RoWVtC5Ifo+oIUqlSzvoC7sC5AgnHl9T1g5tnum/pVoYeUiGU36PtzEtLeFWUykqXsvEekNPoJBop5eW4mmia0BegaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743765; c=relaxed/simple;
	bh=EkHkhtZcjH1ZWXi05MLIF8vYqX/yxr5AlwxocmiI1Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbA6xSaTuWtj1pjy6HbohGQAsSRsVFZO514P0hFP0MWYVi6Z2K31Eqk738k6s5/2lNVr7ra1TZf61G1pVplhsTEAl/PJtoDF388SGKqbp7p4lfJdZZNqyAI5mhb1Jv3jC9VAyXdR+T47Smlwz0DHESmCD8qvaWhYccbwU6BPg0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfTKmqQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYw0t3tj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfTKmqQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYw0t3tj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736XMYJ3929490
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 07:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GYEKEsLD5+RSuHyzzYJcx+SU
	LIwPICEpqweNWaypYq0=; b=SfTKmqQAw2VZPoKIjgc4+k8kTWH+n5Se0dFSVYCL
	sRQ+SDxD9HVwtRRdVoMNVNazd1rtRUzA5CMy1gTs9LBu2oYHo7Re4NprrKtNAYKt
	fBW9en0m7c0wJxuAQOqHHwM1Gsb7SBUByq35TCxf91FRn5ug3xR1NdOSUYKxd5Q7
	CTdRlo04/zp+7SSAMPVl5JQ3cpw4g/wyFqLHK6rlBHXkxfCV4A8tjWhdjPcgJ2wN
	iTXuPsxprnwN+Tsmmn5h4hVa4/L/XgtNZFuOS6ugd8Bk+a8aP+KfickyrPnBlE+Y
	Dvre9LUYWZKQ1qgMpEPregvmXAtX/myah0AIPfVvfRWS4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgd4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 07:56:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so307555885a.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785743761; x=1786348561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GYEKEsLD5+RSuHyzzYJcx+SULIwPICEpqweNWaypYq0=;
        b=TYw0t3tjr1wf0sVMFW0aCY5bf7G0YcwWjANW71fYU5NUv2WQwsiLmm6JpuNTuvR6cB
         A9bUx1Vmf7rqyRRZzG47tstuBy5a3sZmv7e3L4zf3utK2uvJxC5P4t/fO7YncbQJVIK4
         2qdoACahMD3YYAYLHtuC4x5xg8JEwVV8v6IYzuZSzugCkg+mnKNU0VMfzPBqFiqtvNXR
         xqSfugs5xGasn1SfP7jMZApD7A6zPAR7hnEK+pkSC1wTGdV9zPVk/P2eRAVkzHixpE8r
         iREDB5xjEXvBxKjQNS4RbwoLIoBjDpyiEDB+2W0+rBh8qnwcxVyO4w+bBMUc50jQNs3P
         sUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743761; x=1786348561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYEKEsLD5+RSuHyzzYJcx+SULIwPICEpqweNWaypYq0=;
        b=CCGFy0qCX7hgiLXv40bQwfO87oV1rhb6hJWBjap1adZhBBEC1Vh3ADD+lyz7IUzCUn
         x9+lj9+TMvyEG5Bcbop4qO0Kq5mEeWDU5VyTmGLKZJ9RKml8lJAoN4d3q1F7YV/siGUP
         whnaBNuA/wGuuGDBer/u2p8HdwdUkDKCk2ddSHuzEmyZqvo15WkEBYsQWrRI5P1sa0mb
         Q9KmZnYcGlWdqC7foDDlHvNrP/7HtGg6V2YdlruBx9uFUAaPtx4BS5NqYVscad5b4rkI
         d8Py1iPgeTlXWGaQBw7lPbB0Bi7ZbfUCrtp6RmlRx6Mc49k/85bSQF2dsakwFx0mJnx8
         3rpA==
X-Forwarded-Encrypted: i=1; AHgh+RpjznMfKrKwiuFkpXz5EveYUdsnDytndCLMdDMMtwOBei9vYUZ1P6Ebp9qwq1xnE/kqcUxkQ/1t0k8S@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdkNnmyfhMRxV5CYq8eD2oSMYg1Kd6L2BQ19v5cjqePPCfjQE
	7Y7czwxkKPGWwqujCRXiQ2lAg0IGKdc39Bn+vsjMhxLHsGKzAbUexFPS9PK0IS7skCommSDwZUX
	X+hgjPocjkQNJLYlScUIvObPlAzfBQSwRu96z0LMMTzfejqbLuvRUxDeA/9n4H+3l
X-Gm-Gg: AR+sD127oqLXAJBomqp5prKR4ZqmUv3RjiP9U4gJww/QTS3LJzAz/qin+Ti/X9YpUhQ
	jV2a8XKUvCeXnn7UlkxC50rVEuxZw3Icg56WK41mOkTOCBbKXf4eDbWLJ9zBkmqoMdZGjV3BAI4
	oKU+bxiuXwrRrVds2u/ZIWXf39qCHoc5t34yMHyXZ78NE/y68j+NQ2R4viHpPpVRpFOkIdZ/G+e
	qox8Z/2Wb/xfcoIr/ujBn4Q0FbeJAqG/SjwH9D7UkMMNtcBw/eQdR2wG6D27lppKyBlNX09Gruz
	LGVUKJszsitU2B+7bH87QzEMX4Bb+P1pWj2yzc/IhM2XelJrh9syt8MT9J8hr07cs6kjGnpBXUw
	lS2bL6iyE+b4oy4GOFPsBgz8YGQsUuWBYJLEiBnoOvbHDygACFecr8wfIWC2S3bU=
X-Received: by 2002:a05:620a:1b9c:b0:92b:1233:99e with SMTP id af79cd13be357-934a0a77725mr1890555085a.35.1785743761275;
        Mon, 03 Aug 2026 00:56:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9c:b0:92b:1233:99e with SMTP id af79cd13be357-934a0a77725mr1890552885a.35.1785743760823;
        Mon, 03 Aug 2026 00:56:00 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc25db2sm618024485a.2.2026.08.03.00.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:56:00 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:55:53 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Message-ID: <anBJic0f2SPRi6RR@YUANJIEY2.ap.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
 <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
 <amsfSzgMArno9zRH@YUANJIEY2.ap.qualcomm.com>
 <2eb33f53-2320-40dc-8098-79fc4f48af8e@kernel.org>
 <28fb7750-bd46-4f3f-a3ba-7cc1fb88b235@kernel.org>
 <anAx4kqb4PwEImeE@YUANJIEY2.ap.qualcomm.com>
 <fe9d0f2b-3a86-4950-ae4e-fa5182706a38@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe9d0f2b-3a86-4950-ae4e-fa5182706a38@kernel.org>
X-Proofpoint-GUID: r-F7VD7ELTdg4HP4sCfN0eAKHtAsaxw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2OCBTYWx0ZWRfX4f76VjZ4lOmP
 FTmOBGFEObWh/FPpYYPYtbfHLypttCQr2YftmTzod9Uoy3mcv9gyrb66b3aBAxWRX56J7CyY1Ms
 dEfx4c3jgmv5/wAz2MZnTpdN+WJ7eSk1+FiQNhOn2NQGcI2fr9dbxgo568p0dNHTm4xYbJPFtFJ
 bZPdsAI+V3NsR2huNXmKWC4qlomdb53XmM/C1zBnlU/WDDbDnsWzX0kKrKf3EqSYm9AbncApBwj
 ijiNeL8OmsyM/3Xo9Vu6LxP3NKgMjW1xsJi1InbRIqjkqdNZQW4i/JxT4hwqDiqgSkIgn06dCjb
 a7PzeGLIzxHA8dxVT2HoGEc3AOr+O4mWxainKfPP0XcmJVG1PsOM+N5v/gJ2PwOeW1qGOcLWGCO
 jXJRWYJPFtlr+HxuP968XLklKJxerv3xQ/deln4Xe3/yAlD48Ao+nF0J71Dg0mDmrjV8Wg1poAG
 d1T/C4LEkOW/f9TEaPw==
X-Proofpoint-ORIG-GUID: r-F7VD7ELTdg4HP4sCfN0eAKHtAsaxw1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2OCBTYWx0ZWRfX6Lnt2Fs6xR8m
 Co5lZQrY+nAIwHR5W6u2nQNiYfPKaWJa/r90mzsBOUu04dZDhbt4sEXXXR9Ik4rusYDt6WXwtFT
 hmZG096RMGF3QTAp4XsMrtivekJt7Ms=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a704992 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=m8ToADvmAAAA:8 a=CfPy2gZGbKdSMgFAa3AA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Q0W1slMkcave-rSCEGgY:22
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030068

On Mon, Aug 03, 2026 at 08:36:11AM +0200, Krzysztof Kozlowski wrote:
> On 03/08/2026 08:14, yuanjiey wrote:
> > On Thu, Jul 30, 2026 at 12:23:56PM +0200, Krzysztof Kozlowski wrote:
> >> On 30/07/2026 12:08, Krzysztof Kozlowski wrote:
> >>> On 30/07/2026 11:54, yuanjiey wrote:
> >>>> On Thu, Jul 30, 2026 at 08:51:40AM +0200, Krzysztof Kozlowski wrote:
> >>>>> On Mon, Jul 27, 2026 at 03:07:16PM +0800, Yuanjie Yang wrote:
> >>>>>> Document the device tree binding for the HAMOA-IOT-COME board based on
> >>>>>> the Qualcomm X1E80100 SoC.
> >>>>>>
> >>>>>> The platform consists of a system-on-module (SoM) mounted on a carrier
> >>>>>> board. The SoM integrates the core system functionality, including a
> >>>>>> SiP containing the X1E80100 SoC and its supporting components.
> >>>>>>
> >>>>>> The COME SiP hardware is effectively the same as the SoM used on the
> >>>>>
> >>>>> Effectively the same or the same? I googled for "hamoa iot come" and it
> >>>>> gives me zero results. Provide some URLs describing both.
> >>>> The same.
> >>>>
> >>>>
> >>>> Here is pdf about the "hamoa iot come" SiP and SoM
> >>>> link: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
> >>>>
> >>>> The preliminary figure provides a complete overview of architecture, including the SiP, SoM.
> >>>>
> >>>> In Block Diagram
> >>>> hamoa come Qualcomm X-Elite SiP Module is the SoM on haoma evk.
> >>>
> >>> I see on that PDF "SOM-6820", not "Hamoa IoT Come".
> >>>
> >>> I have an impression that all this and previous bindings and DTs did not
> >>> match reality at all. Or did not match how upstream works with such
> >>> hardware.
> >>>
> >>
> >> Adding more: I did ask in the past to properly represent SoM and
> >> carriers. I pointed to other examples how this is done correctly. I did
> >> look now inside and found absolutely no reference of actual product
> >> called "Hamoa IoT" or "Purwa IoT". For sure there is no "Hamoa IoT Come"
> >> SoM (sometimes COMe appears).
> > 
> > I check the hamoa iot evk board page:
> > https://docs.qualcomm.com/doc/80-77183-262/topic/Getting-started.html#get-familiar
> > and 
> 
> It says it has "IQ-X7xxx module".
> 
> > purwa iot evk board page:
> > https://docs.qualcomm.com/doc/80-80022-297/80-80022-297_REV_AC_Qualcomm_IQ-X_Series_Evaluation_Kit_-_Linux_Bringup_guide.pdf
> 
> And this is "IQ-X5xxx"
> 
> So how is this anyhow related to Hamoa IoT or Hamoa Iot Come?

Our current naming does not clearly reflect the specific hardware document it refers to.

Maybe "IQ-X7181 evk module" and "IQ-X5121 evk module" can would better reflect the actual
hardware configuration.  
just like:
hamoa-iot-som.dtsi --> iq-x7181-evk-som.dtsi
purwa-iot-som.dtsi --> iq-x5121-evk-som.dtsi

IQ-X7181 evk board: 
do some dts name fix, just like:

hamoa-iq-x7181-evk.dts
  iq-x7181-evk-som.dtsi
    hamoa.dtsi        

> 
> > 
> > And I see below info:
> > 
> > Dragonwing IQ-X7xxx EVK components:
> > The kit includes the following components:
> > Dragonwing IQ-X7xxx EVK mainboard
> > "System in package (SiP) "
> > 
> > I think the current naming of hamoa-iot-som.dtsi and purwa-iot-som.dtsi in the
> > Linux device tree is incorrect. They should be renamed to hamoa-iot-sip.dtsi
> > and purwa-iot-sip.dtsi.
> 
> som/sip does not matter here. That's not what we discuss.
> 
> 
> > 
> > hamoa-iot-som.dtsi --> hamoa-iot-sip.dtsi
> > purwa-iot-som.dtsi --> purwa-iot-sip.dtsi
> > 
> >> Look, this is a SoM:
> >> https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> >>
> >> And you can find corresponding bindings and DTS in tree.
> >>
> >> I refuse to accept more of this fake products trying to imitate well
> >> known industry standards in their own way and effectively pushing some
> >> downstream crap, just because that's how we do it in downstream.
> >>
> >> Unless you can present us with such product details matching what you
> >> send, I will be NAK-ing these and future patches like that.
> > 
> > Thanks for your tips:
> > 
> > I check hamoa come som page:
> > https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
> > and come board page:
> > https://www.advantech.com.cn/zh-cn/products/1-fc23ff/som-db5830/mod_16b1a718-27d6-4a4c-8684-e8f2a8e9c57b
> > 
> > So I should rename come binding with real devices name:
> > binding should be:
> > 
> >       - items:
> >           - enum:
> >               - hamoa-som6820-db5830.dts
> >           - const: hamoa-som6820.dtsi
> 
> No clue what is this. But the links above are Advantech.

correct here: 

      - items:
          - enum:
              - advantech,som-db5830            
          - const: advantech,som-6820
          - const: qcom,iq-x7181-evk-som
          - const: qcom,x1e80100


Thanks,
Yuanjie


> 
> 
> Best regards,
> Krzysztof

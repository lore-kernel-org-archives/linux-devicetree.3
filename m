Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793895494;
	b=pPytleeEyYNGwCOCyxDRvY7997RcaW5r/VOOCPYpbf02AdgFXMUI3HuNrJ++3bgrRWiM
	 F+0jLEPdJ2f8Yuzy1Dlw9pT9gex5bgPdlqjOyIoSy/5bjkhYF/RfWKrVyA6h8y54gfqRI
	 nkM7MZFo3VQY8jru2li/YzfyPrPRKrWO5xBaN1nCS2RMcsXBujDOj4T+hsMdVuMtw9ZD0
	 m+3rMMEphhazG7CkasnIKq14wDrXcxYGnDdTUuzEqlDnoZVjmQrDaReFCL3vX2Q0bIJcg
	 rcVkYnNgJMtW5sq7ysFkrukMcWX/Iq6JiVXXbr2Y3t3J4AcXN7Wsgv1seqCT7mtcS2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
	b=lS7kQcyKWA5ZV2gQXDTsIkxo5NH3zbljKs7NUqTBj3z8YPKvqQvQucL9rOpKcvaMP7na
	 TU+pNZPvEC+aYAdCnvJS/SL70g0d1bj4a/sSGIFVgSkTOAySDChE4rdGx04h2qtr5RlgU
	 QHaua1fU7ACgDwwZKbITg3C05oU3I+PNElDxTFjdl+KckR5TTW9Tj3c3x/ybJ96eo71vp
	 kFlwkTY9lgygbj+e6TlnEkT/fUWvnVJPru1af4w2T1vAM+otdG5Q9PETFfPbKgjTQpNLi
	 5uE4aLKi4M7WVhzs0Czl7p3yY3ACYvFrIvYUY+S5A4VCh3/x9tblig5cZsJ+beeamMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JLPOlPCd;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54E606EE9C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C54E606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JLPOlPCd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQBqY686819
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=; b=TJ5E9oPfEBfB/Uap
	OuMLttHgoJ+Ljst9nb794fGPdkaPnHil3RfUJcmQvkWZSdqnuC9jeImWBkK/H0v5
	KBldy6ubniZQcXsBd9AK7iC3WEOr4dOLVhm0Z4fG4SIbBuKbiMBrO+0WbSbx9vPc
	a+G8Ecljd4M0CkHKJW54TQYVbtdoXJL2dc+0dxz76RuCwN0k1uGRZ33XrMxhJUSV
	TrX4X0vpYEitqqlmkeAwy8btJ/eQI/bZlMRhlURrEgFkNKpKRuEpXEX743unYEnz
	eygLe3trZZQ/pV0ZfXAugabZdM2QQSvm4QQSZRA1RtJhGZx0Vi1m1sk4jMj0+tmA
	0uPIUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p1tb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 16:18:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so416794085a.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:18:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793895493; cv=none;
        d=google.com; s=arc-20260327;
        b=jl4ARfO1rvFAJpWjBMPS2q7JbyljrmZNhSTdY0k+2+iFC6rFrDZWSOXO2L6s0F/k57
         XUba/AGV0dvSmmn8JjcqPYn1lVfuqrEcVEI7W/oyKVBgppxz2hds4GlKTzZ0Z2fda6UW
         ETSOkFearv0HXA197KMFQ5dp3KATMIvKkK5ri8I4AF6JO9kLtqddpu+r6e+awxWaM86o
         JT8EmJmh1VcIEtVi08uKZLCOkEssV6h9g6pzUa6EGRGcgjY/nNGWIINut9kn8OpZntJB
         45Y0j+x+8EJ4kDKgWbFvTPImeCIUlCN3pgDV09TnnWhR4x13Aeo+C4LYrz3V0b5sHV9r
         MgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        fh=z7d15UalfcQ05fewAJXVVX7Q4KKVCTTB1l7K7iaMkYE=;
        b=cPn7E4dEeb6QwIKj0k/cdhghlRKczQBeWNtVx2iyanwWfYQGl/eeyLPKweSvlmlVDR
         QlZKekwvVFnAlHaxdLpaynSjbLuTQYZkKJIJRghKvBk/Csuik8tLa/9fpgAWVrj9X1ih
         +lfE5P0saS9iRccCxhbfwreoff3BLhvxEhdd1H2e4eTcudGAJQjn3IG8zOmB7Ek47WRn
         eKlsDh9m//eTzjpwvk+BoBN5B6F7sKH5NxaBxP7RAglTBaWfpUWYUTeFMRp9fpnT62Sz
         RMFAnxDirKfuUxsC4O5+bpgJ8qqHf9zC1EEjBfSDa+U6Wxsz8vEBVZrp8urVuvz43EL9
         b2mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793895493; x=1794500293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=JLPOlPCdzYubN8z7qVwXFTQGG5r5+xKrIwkM8eMRTowP5H8ztJrITKjOY9se70m2Vk
         MSslQG5WG9qvjY991+X8yuBrTSwG4FMYpxtB/MJRDOQ7HI1Q4oAn+4/IpGDaQajdRbWA
         drcflPaHwSOBGGHxakEtmgb3h7OZwsp0VOFvEC+o0eVqqO/pNcjIkrbwxx3OI7JzEzEk
         4eJ7ZpjNHQLSa67JYjdwJE+guQU9HzRP5SzmtxPM1f7XxUU4/Tq+J5oe+MgnhGI9NbqX
         qkGbjRExbRzB70l9PccFUsHdnky1YHkx8Y64Vo4zFIhvaXgTp9Yf7+/MHeu1GMPSf7iw
         bfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895493; x=1794500293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=QArGAZxVacpHZ2GyrBVS/W+rnNvP6RIHXXgUdF34REAYDBoGTyaS086xlsgIEqIt29
         9haDXDwWvtdwWbYHlXCKjCir6ASZbn1RFtS6BIdThu/tTXrP+chHwxyNXuwVTkCb43Nd
         VN9weCk334Kopc72X4nNw7P2LsFUpumaY6Hk/yW/vxFrMKnjAM8pBfNQNbIS10V1uohe
         w37uoJTOL/wkEkdB+SCuoYoB+CVoMxHhpIey/UhI87liCUOTz7qAfR0HQaZsgbsLov8I
         aQst6H4IxEij4+BdgB3KP3JhF/i9CdlKMATyRgy8W+y0T2LXGa9sUUNZUbIwHgX9FlKi
         7a4g==
X-Forwarded-Encrypted: i=1; AKwUvBwXTlVWpIu5nctteK5sDJjlHqXXsT+/iFvbjDGZYqnn9c0QIt2M7H3wMue/Kc1FKQMcrw8IZ2Iy1wPi@vger.kernel.org
X-Gm-Message-State: APuU4Z/aa2l8Roi0xZGopbXT+okOt6nSLLfa1X3hfuBrPgYYRhtecXUJ
	dCh5KBBhv4EwlemDSxDG38vLWXoUgbr6LdKjOj4Zi/OXgu0GSx6lsur0KQxxXb8Z6ZS/hjRCkHS
	XR2U2k08OY6jdDCCUn0yJNNnVwEI6ytTreoJ0Zxmi61DAQbHjvqanJpPEa0zyOso0a1gGwxUe+u
	Wm/bSzeLW7F8MWM/fqIwlwhYkDdI6rarUTGIecEAM=
X-Gm-Gg: AYBFou2l5+hh7+vp5Y9HIl7b1DjOJrhCxMQu4NdVBfgD0yGH6lV9LGFPC5bc9zbcXSC
	ayJChSb4RVOxTtWmQKAzt/dTURoINRylLoSdSCre5zuUq0+O2YXn1dqTuoWv87V0C/xLFWxWWBo
	/4G3s8N/TCNYvqugrQ7q3sQXX+WrPoS7RGrukHZL5W7Sa8FnDEeaJVRp2nn2nlLNUGIDhLDKZ3v
	+GDkkSi3G6+qrLJxqDPC6FCCasldpDb13ztvSRFb2u3xBHCNWCOCS7OyVEjCzs4rNlTm2eDfEo=
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id af79cd13be357-944217942dfmr3213721785a.55.1793895492466;
        Thu, 05 Nov 2026 08:18:12 -0800 (PST)
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id
 af79cd13be357-944217942dfmr3213713185a.55.1793895491627; Thu, 05 Nov 2026
 08:18:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org> <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com> <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
In-Reply-To: <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:18:00 +0100
X-Gm-Features: AclHuK8YSQ-kFGWQeNw5tClylojuV0W0oBaKhzme8TxRz7tVIdZ33iLLr-iQkJ0
Message-ID: <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aecac45 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=oudGAjWChX48PZ3fjK8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfXyfj12FkeUlT8
 fvV44WKPy27NRpWNzOdw8LwZxEXjsIuH1HEyjtp+9EQzbxF8HSKmOoLi1iNGRlC8o7ywOkdGAah
 TEp8QlhxNc54yCjgbL6ZXLADJH4ZthzlKqcA9c3HV6PdfxwByAV5PXgVjcdoWRcd06KW+K4fIQ7
 dWHF7M0cwVS6wWEJJ/cX0vs2Fy+0dfEn+w9dTf9XrCXTMdDhMKajyEky7Ca6qpnD5vlDYMiKUWd
 K8K3wRq6a2C3CEA2M3JkH0W5phsYYE35uXCej1MLAhLBns9Ns1XzlK0ZGhcnGuO3vC/+XQDbcLh
 VfhStBaYVKIKYR2D4+ciTiQS/2fR/UsHPcRy+VgYBq9fBy0L3058dqqKiiNYyd76VmSbyawymkV
 FnpGRYhTV0MZJjrvNNHhveoalX3iODJwmDSPepPcGB98oNH1yr5ZJ6EV0iN9Gvt3VNhIa8E0UkR
 4zQz8mr7P7/gIfgsZgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfXwn9gnD8Utrx+
 N3e5DkfSAUqJQElFfg0QjB0aRSWOC5tugoV0r+2u5BYgoTeoU8tNGeY/pRsFLkT34OY+Ak6fR1k
 /2XO8SjzvzBb1rKIWmzz6kvgjdjIO6Q=
X-Proofpoint-ORIG-GUID: m97iArJmBq15IUFClnQc8YmjLy_jV-r3
X-Proofpoint-GUID: m97iArJmBq15IUFClnQc8YmjLy_jV-r3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050064

On Thu, Nov 5, 2026 at 4:46=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> wr=
ote:
>
> On 05/11/2026 14:01, Loic Poulain wrote:
> >>> The CSIPHYs are connected to the CAMSS input ports, which can then be
> >>> multiplexed and routed to different CSIDs. The mux identifies its PHY
> >>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as th=
e
> >>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> >>> connected.
> >> I could not find that information in Glymur HPG, but maybe I looked
> >> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I =
am
> >> looking at wrong device description/interface...
> > Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> > (CSID_LITE0-1). These blocks select the PHY source to be routed by
> > programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
> > PHY_NUM_SEL field in CSI2_RX_CFG0.
> >
> > If the CAMSS port ID matches the PHY index, the port ID can be used
> > directly as a routing reference, which keeps the implementation
> > straightforward.
> >
> > Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> > makes sense. In that case, the driver would simply maintain an
> > internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> > } to PHY indices { 0, 1, 4 }.
>
> The media-graph informs which PHY connects to which CSID. The
> port-number in the DT really only identifies the fact a PHY input exists
> - it should be considered a mux in front of the set of CSIDs with the
> media-graph being the route.
>
> Since the route is runtime selectable, the media-graph is the boss, not D=
T.
>
> You can try this on any CAMSS device right now, PHYs connect
> independently to CSI decoders.
>
> PHY_NUM_SEL is derived in the driver, not taken directly from the port
> number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is
> the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.
>
> More work should be done to represent the fact-of-life - the mux. This
> was discussed extensively in the standalone PHY series.
>
> The ports being numbered with the PHYs was a consequence of the PHYs
> living inside the CAMSS node - which we have the opportunity now to
> break with and should.
>
> Port number in DT should just be a linear 0-X for the number of PHY
> inputs. Which CSI decoder that port routes to is still a runtime selectio=
n.

I think we're all aligned on that. Point was not about describing the
runtime muxing or routing to the CSID, but rather about describing the
CAMSS PHY input ID/link, which corresponds to the input of the CAMSS
block (MUX input).

So yes, we could argue that the port ID itself has no inherent
meaning, but it acquires meaning through the convention we define,
since we still need a way to map DT ports to CAMSS input IDs. What is
really changing here is the convention used to describe that mapping.
So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
inputs { 0, 1, 4 }.

If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
the ports are associated with their corresponding INTF numbers, and
interfaces that are not present are simply omitted. As a result, the
port numbering contains holes, for example {0, 4, 5, 6}.

>
> Honestly I don=E2=80=99t see much value in continuing to treat port numbe=
rs as
> hardware mappings in DT now that standalone PHYs have landed.

As long as it is clearly documented in the binding, that should be
fine. We will need to introduce a mapping table for platforms that do
not expose the legacy PHY numbering, or otherwise derive the
corresponding information from 'somewhere'.

Regards,
Loic

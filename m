Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F95175A9D
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546777; cv=none; b=b0ctC10ISl03fhOkE6Jq/vp335LPbIbXzUywGKruF/jhGQNvCldJGfC6eEmYI2576vJIb9MOBNh5o/LH7hY0cpgN73Mbhwqq6wVDtd/nVgbZwpkHaAMrgiN9I0J8KAPHZB5aYYuHlqg9W8q1RCqWhQPLf+adXpvh0b+jsej13eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546777; c=relaxed/simple;
	bh=j+1ZOes4kWP7FAkpcojmQmiuJSCqnncwy86K3mTRxl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hao20OgJCy+2gB8D7hVfc4GW7J6FK5jHchEl0E8NJKwo3QUGSgFf6nD8x8U2LSAI3XsGF/IH+tpPm8ajdY1M/qnmyER6xgqMAzQwd81LcWst/WYlFuKVQGvdbimTrZpyVvERvvR18SPptiYvjBmeGSrsPkaUCBqv2lNICAWlh/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULmMrf4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jtb96aRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULmMrf4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jtb96aRE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHk7c1151798
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bvne7HECiZvG5t61nBxUCDlI
	c5mqbwFgVydcIZZ6aPE=; b=ULmMrf4rdQk4fHXC5NzSRck1gg0RthPnycO4EyKl
	6cQm7QUB5bvsd5eNmLl8cI9W38NnaDu0UB+qwVUEQsuDhE99yzOTl+WJfXLAPqao
	eWlZAxj6sLg1EghOi/+SJQYSYCt66uRnYrorFcW7qBl+in5m4DkMuLXAdvoEDCeZ
	FG/qLHDW1NM0zSqXpdjyx3EotyD7vqsH2H4mTdzyf1Z4wPnYFroiIHLe+LkAVLXC
	8xFCL/JSdtz1W+TL2z8pEcw31DNHdpZz+WB+p+cFgFSfvo7d1apP/69ZvvIX6q7a
	Kfd5NVDbOtR+mRqubut8q0m7LiOq5b5guRFl6Xg4DAAw5w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00ys45c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 18:32:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73858d44c8aso297974137.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 11:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788546773; x=1789151573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bvne7HECiZvG5t61nBxUCDlIc5mqbwFgVydcIZZ6aPE=;
        b=Jtb96aREDnvVuNNiYlLd8vDhuwj+YbfxpZ8vR7ca3rkCTMLlDmKVAskPgSh95Ul0dX
         0LYS0FkagYG5w+47yMPOZUsjXjS2xq6xNGixWyik2MRtOlzj+ZNQ+m5FI/Yu0Bxc5bSG
         l/IWMxGmPgQTLIbNPrSUtPrJVwxGd+s6TuMaST6INzBoMECNLhPA6Vxxo2jjpYPi7tte
         3lCiOvAkjhvoZQ2g7e5E6HdR6cQm23C9vJMtJTAI93p0T/im6+6dei4bPEfRM/uvtsw+
         TyTkEH0+hSH5Hv9qmp3ksnl8guImNM1580PZ/lNVolCs4xqSR3PkgsfP1lB3W6Q6ZPEx
         g7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546773; x=1789151573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvne7HECiZvG5t61nBxUCDlIc5mqbwFgVydcIZZ6aPE=;
        b=hJeJdnRVaRnxwGpS2uhPo3aZvPzOH+l6TEzlLKlGMs995kp3slpgox+DhoFZc42S1X
         ACJtuZVYRmI3rlsdWvwVoUIuu3ayZhYx1cBKkOk4C6H5Mx8qcGrtZAr/dNzTsPlUFxNC
         5UjUIAibsAmv/PeJ2cdy+MRj9k/zVlwl7zGYvSv6hSmgbLKgSNcqF0nkliLvMdtAldpQ
         Yc/5JfwUS1nzz232oQuUMHaCYKXjSSwiH+G6sDcm7N4B1ZdAN0RTJbLvdsGuQG/9qhfq
         /YNu2/RV6943HN/7//AbRRk0C1uqL+M9Vtztb5JDaLebAKKaBw7cuTJyZINgD9f1x3BI
         WoxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbcwFMurcz/FAuzmcDvLHkiuhAK3cdwmgn6rcXFk9mHh+5+flvf31lipzUILOivUwrDwZU6V5VxkpT@vger.kernel.org
X-Gm-Message-State: AFuF++m1vAIyFpkAzxpAyliV4URuYYcfSPlvp+X5RQbdNgbIoBa7YXDC
	J/sZ2W6IHn3DRUejkgujhPIF4AjlTM/zBdjnNgHXB237ej9CiObVXt6wachP+OAI+tuzdhwLv79
	3OTlDz2ozgWkv2z7786gV2n675w4mA/sAnnmxOHpzDsDlnaI6mizXqZzVvhUXxMdrFNH1rI0G
X-Gm-Gg: AYBFou2m7sNmyeP0kwz4eACg61x131TxWk3VRahOvC8S+NFV5UQ91wOGZtVsoLXsyjr
	tX3QimADLFtxi/9mCt9nViS4qXzwiHzbtW9k1pvIW/uv3El3iLJKs+2usIyDbpcd4ScWJDvYV+t
	aPRN0yYeqheQJVlfx/rPcqKmFarqAvuYS4sX4FFnz/j3aH9LnAHe0N/2eIDxvr0gyaGZFV6GIHI
	GmQ4K0Yz4MVEKMwFwCVNj8pRLdDX3fhCUxtab7Iyx5M1iLsggKeaJbT+bcwBO42wZflSXNHpQTu
	ty/TYeLh7OuSpVGorZ5UaCaNNNRqlCeIVnNO+Oh73dNdaKdFjbe0CJ+7llSVlVZeycTus9a9w/1
	y7R7bJS0cIZrvKg==
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr2482584137.7.1788546772874;
        Fri, 04 Sep 2026 11:32:52 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr2482567137.7.1788546772398;
        Fri, 04 Sep 2026 11:32:52 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm168209295e9.3.2026.09.04.11.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:32:50 -0700 (PDT)
Date: Fri, 4 Sep 2026 20:32:49 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: PCI: toshiba,tc9563: Document
 embedded GPIO controller
Message-ID: <apsO0dPYIiCujiM5@lore-desk>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-1-5b1449d62ba2@oss.qualcomm.com>
 <20260904172114.2CF8F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewcNLQpfoQlfLSzs"
Content-Disposition: inline
In-Reply-To: <20260904172114.2CF8F1F00A3D@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=baFbluPB c=1 sm=1 tr=0 ts=6a9b0ed6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=86Be0pIABdjnZPeXsFYA:9 a=wPNLvfGTeEIA:10
 a=kRZTEHTrMTxrHKFV5dYA:9 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: L4TIi7ktWpoZmGYIwhji5j2bldfUf96a
X-Proofpoint-GUID: L4TIi7ktWpoZmGYIwhji5j2bldfUf96a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE2OSBTYWx0ZWRfX1Pp6tyl5AodL
 s4YoMil5kDTyMp+YSNppK3PhSLeCyoIRM2MVBaYGnLlKdSKOaIn0zkJyzsNEhaeLG4Enq88XBwU
 cd8ShceEmPfEf7tsc9t7vQf+rg0iMzfja7NzjhjfI8AV5crimJHtV1q33Xc1cy6MRT+Z6pXzEhL
 xS0q2hiKvmfAQRbBndFpakwfbD3lfqQiWfyCRBcl3BGnEy+GCKDBbdGYjcRGvpMf/TYsDIeNQzO
 4nNpwENhrsfbtzai0YaCgDGATwATZj5igDi/GuKKpBLZ2n8ovel8mngJVineEqCq4v4i7gs/8Yj
 5jHVguCRmxkjVztgskHYxVpf0Q7KP22t+QNp77ePUgkLf9c06VLWicn5YKwr52lBjoQknjwoeb0
 VCI58D5aa7+k9j0BbYwpz5H0NEO/eK1BEga+AGj6m+NsAxo3pt9zxBIhc8k25mwjI9LQol2+7qe
 8j9gxML9Ub0369AICLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE2OSBTYWx0ZWRfX8tyDey5U5Y9P
 wmq5I8SXhNuMR1RoY8ZfI8nO/SfPYH/ECmhkc4uC8PlD2e/9/vjFh8Ya8zqBMUjoCKJxInvtfYU
 v9EDkptGj/V0wi6vECAK72055Lhe1hQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040169

--ewcNLQpfoQlfLSzs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The 'gpio-controller' and '#gpio-cells' properties were added =
to the binding to document GPIO provider capabilities, but were not added t=
o the 'required' list.
> --
>=20
> commit 167159eda5a6932cbffa6730117f8dd7e23b2970
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
>=20
> This commit documents the embedded GPIO controller within the TC9563 PCIe
> switch. It adds gpio-controller and #gpio-cells properties to the device
> tree binding, along with the reset-gpios property for the downstream port.
>=20
> > diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml =
b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > index f084830c6d0cb..c4cd162cb084b 100644
> > --- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > +++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > @@ -31,6 +31,11 @@ properties:
> >      description:
> >        GPIO controlling the RESX# pin.
> > =20
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
>=20
> [Severity: Medium]
> Should gpio-controller and #gpio-cells be added to the required list?
>=20
> Looking at the required list in
> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml around line 108,
> these newly added GPIO provider capabilities are missing:
>=20
> required:
>   - resx-gpios
>   - vdd18-supply
>   - vdd09-supply
>   - vddc-supply
>=20
> Without being added to the required list, device trees with incomplete
> configurations (missing the newly added GPIO controller properties) will
> silently pass schema validation when running dt_binding_check or dtbs_che=
ck.

ack, I will fix it in v4.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260904-pci-tc9563-=
aux-v3-0-5b1449d62ba2@oss.qualcomm.com?part=3D1

--ewcNLQpfoQlfLSzs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapsO0QAKCRA6cBh0uS2t
rAIPAP9ldnovE+inPbu1tazRg/kLnB87xWlHIQ/I9Tf1dz1JlgEAo4dME/cIbVWt
XSEfFwuOSDseGq//+7sOhx6dxC3CvQc=
=7vvW
-----END PGP SIGNATURE-----

--ewcNLQpfoQlfLSzs--

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE546D080
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425799; cv=none; b=haJoMYG1bP2/Lujs2DX6p+oBFvqZcvpiKoHAHJDLmNfiOuu8bWjoYLgw9DL1vsPp5W28AURfq8ATrPFUX8TEOCysWcnHzZbAi9+zRWMnHCHj35vlMlru8yHYa66LpFQjNS5rDlllGcoBgjnZM1/aRNkJ/8B8Vxh1VUzLZ6sbYGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425799; c=relaxed/simple;
	bh=s+WM17+wy+w97Nd0SVsUPfPKHG6tJqD5wyyV11TwqOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjB+awkJerGaL4WWbMDCeIJ2dXNPpYqWEXg9HdtE484ac/odICpmiCXqMqiGxeg3Nen2w5axHMKhMBpsYeFxH9VV71tkJb+K4gL/7Tn/k5UvMOGyamKrAFV1gnIM9crxyqNLpg7EOxjfXHTcfwbRAOsmHrJIXdjx9zHq1VGatCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4CWQYls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buL6oEon; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4CWQYls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buL6oEon"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lL9N3113943
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s+WM17+wy+w97Nd0SVsUPfPK
	HG6tJqD5wyyV11TwqOo=; b=T4CWQYls73PuDS12PTaMYLyNbudm/dKPjQ9Ff3TW
	QEjMErLPhs/7YwPQjbzvd/WMdYypCgGdruKTfW4HxRaggJO0vv/E7P8ZTNizUsFL
	ZX6xGYSsAO6fVF04khBMm/wz2vKizPzqI9UtV8kMhw1m8Byktk3odT9GBNcKa5OX
	XFo+zK3rUUEzi6TLWYI6fbspFfdGa6/WjLAG7CZMrgPHnsU7JGwDOUibqzLk+96w
	87h2hmRCloc9LbAQxejrtQTuQVPmcXSjIcKLgWyXyteiOyUIj7q2TAqIcY8Dsk5c
	0uQmp/ZfzgnRdM3hq8PV9nnmJvR47XrkBiSyhXdppXcVLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs91w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:56:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-933023a5980so469222885a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425794; x=1789030594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s+WM17+wy+w97Nd0SVsUPfPKHG6tJqD5wyyV11TwqOo=;
        b=buL6oEon7iGr3AUJrNg5Q1wNxvva0JNmp/Yswd7HUVM5b49dYcbxRgwDGCIDxyzp0a
         TdVKd6/59RzBYS6WCHhxHyDUQST6STwfYALGZyc1D5Yfj10NIZlWcf+VTEnnr2yh1K3b
         mCLKn9qWTumMOPUAKgI3Xa9ZmmSJkWDp8k0FBXL2+VRzhoWxFnUuIeWWfAJ71DvgEQVp
         i/6v15rG9hkw3luENYTC0rsGrjk08iFLXiiXtd6mWu+K9OMo8LXsqwYfKBAOgqv2KZmC
         4G9K4hcMVKC0RfG1lr7C9ozPm+2JpWiPa1O9IRbKs6pDw+pJD+iXF5k3rnNRFx/yj/v5
         1wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425794; x=1789030594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+WM17+wy+w97Nd0SVsUPfPKHG6tJqD5wyyV11TwqOo=;
        b=OvWlf7O4E+piCdqy8ML6V6HULhr4pW+Bk/Lc3Vkv/45nT0tbY8apYhFij5PmfVvwCE
         QA0TVQKXvStOVv0ZzAS0QZ55ichi2gob4/+0IVSK2yfhMHVr4541HyWjW4rO7kKneAOd
         LEt6SV7JBkGmfv9YVNATYZPSC/RzpViqNLbQ622BWaTxxv8unOelrfoPOvJyonT//og1
         B1z0WO6Hevcd3TQY7HWQZQV2zJQ9jKY5dV1ZY25uLToJMihYo6Yy9SCtD3LJsxtU3D3L
         VUfILZWKNnk1Orir++AYq+BWSjlOxzy5zGzZQuASezEDaiEtIxcYpWZ819DSnj6ZfidQ
         KZsA==
X-Forwarded-Encrypted: i=1; AKwUvBxrguV0gZzZq+B6u/BiXYO2O58T8GnDh3aYbIid8x94A8b1vrlYtQhN8YSxC4TVaxoQtylTm03Jt2uk@vger.kernel.org
X-Gm-Message-State: AFuF++klJ1fASoczXCSjehluS9fn/zqxwA4gK5uKmIEU1kFf5Zkz4hOF
	booKFyEBUXvheEDYU8NhVBXs9d16jl97s0LtbzCuianIqXml+pKmZZ6gqeKbL5pW8WRQL43lkXK
	LfZgHYgPGS7qH3VTNC5IYG6Vqm/hQfrEz1kABDYekoOBFacE8481tsNjsU14OH8qK
X-Gm-Gg: AYBFou3SmRK0JUgeFIjhjY9Lu83oir15O3yR3IVWi0yMP1upn9ps5RX44HV4WAipaNj
	IQmcFya18X6nwaLOvEmGyx57GTXXHowPbvQk74aafaLasngekZkkU3chhHO3ulkfpUYQT7JnTih
	iEIrttSuU9hur4Btm9AgiZ5K9zpSzMMegxgCF8lmwOnCmNyBd5ZJK90Gmrkoi6Ug1wSLa0bNHic
	Kw6k32PalgCH1SbvryNyp+wi3PGMmTPSLgcLvv2IytECksMMpTbaDapoKiLJ4b1H6zWRRcqywSe
	ykWF5BhwvJ0CFcudLmzmt7R8PaU8UiEgT+/yCfQaHz0rfh/n3Kmia2xh//6Cq94lYBY579empHH
	wLm3PU9eh16MrTw==
X-Received: by 2002:a05:620a:271d:b0:939:6de8:43dc with SMTP id af79cd13be357-9396de84598mr660442185a.48.1788425793907;
        Thu, 03 Sep 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:939:6de8:43dc with SMTP id af79cd13be357-9396de84598mr660435785a.48.1788425793041;
        Thu, 03 Sep 2026 01:56:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm12132859f8f.16.2026.09.03.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:56:32 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:56:31 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2 2/5] gpio: tc9563: add support for the embedded GPIO
 controller
Message-ID: <apk2PzowUumzH_Ly@lore-desk>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-2-34c625b542c1@oss.qualcomm.com>
 <CAMRc=Mf6-7Y7nDvBA-zpw10_EeQ9mr+TkLfr_msBU7EU58LQ=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OVTXnIBT/tYhlLRp"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf6-7Y7nDvBA-zpw10_EeQ9mr+TkLfr_msBU7EU58LQ=A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX2qhYmUhLzt7S
 WMRK/DCBXh7GrTCJTyPUBqdd/D9bIpPKCU6XFIjTKDSL5pJf5HDerC98mhjTz6hJq0OG3XhN79V
 WRyGETstDbZivjD5D2cKu0hrKH3INKzAVAWKabtTt98b/DbYjK1een0wdvKeNfaHUYVZQbYMlDG
 BBhQoNSwFHGlgfwtviwa/h9gXc7zu+jo9egevODrFLzk1oX7yPZ319kmQzWpxfgAMvGjTR4u5Bn
 8HpwijROjnqvvMQRmlvIiH9Yn1xCv6MPPyrNvwV3SJX2Jpi4pSnhFtjklBniQYdURU3MY0OdOlI
 VBYUIkWEhZuJheLzxbO4jg21WrdStomeAX/We2mtE3kI8IPB67B2kIxhjex32guAkxF8VXYEtbn
 SL7ZDcTiEj3km9gOU+P2tv5WhI0mGOpIyQeNsTMEzZDygFEwO6ZqprUhDi8jyqEdo9Ud/XFG5gi
 Kl/HXXgDGhF7fakVy4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX99Uv0t0ctIcD
 GKvU9qEhE6nyWmTgbgTkzskqmJP1SGrK/hgyrLRxeHiNp26l1I73+29Ewgw/N0CasnlhKIdCDxs
 GPjfO+Iu1/k3+QLfY+isLmo+/0moWBQ=
X-Proofpoint-GUID: U7m75xrrVgp78X8k0S5AkmCkjM7Vx-Ht
X-Proofpoint-ORIG-GUID: U7m75xrrVgp78X8k0S5AkmCkjM7Vx-Ht
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a993643 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ee_2aqc6AAAA:8 a=QdqtlxgJISnalKBtFgoA:9 a=CjuIK1q_8ugA:10
 a=GUhdYjh1zgis1m3ksQcA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077

--OVTXnIBT/tYhlLRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 3 Sep 2026 09:52:58 +0200, Lorenzo Bianconi
> <lorenzo.bianconi@oss.qualcomm.com> said:
> > From: Alex Elder <elder@riscstar.com>
> >
> > Add a driver for the GPIO controller embedded in the Toshiba TC9563
> > PCIe switch (and the Qualcomm QPS615). The device implements 35
> > GPIOs using two register banks: three registers control the first 32
> > GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
> > GPIOs 22-24, 27-28, 31, and 34 are input-only.
> >
> > The driver is registered as an auxiliary device driver; the TC9563
> > power controller creates the auxiliary device and provides a regmap
> > that gives access to the GPIO registers, so the gpio-regmap helpers
> > are used to implement the GPIO chip.
> >
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
>=20
> Looks good to me. What is the merge strategy? If you want Bjorn to take it
> through the PCI tree:
>=20
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Hi Bartosz,

thx for the review. I am completely fine if this series goes via pci tree.

Regards,
Lorenzo

--OVTXnIBT/tYhlLRp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapk2PwAKCRA6cBh0uS2t
rL9GAP42pYHv0DqXiAJEOnJW25UpKh1ja9yTXZSetPI8q0DLswEAmO1vrIStPQ/j
eYwzySrIWS6Bb0DotcwTu4UQ9xF2YQM=
=prqZ
-----END PGP SIGNATURE-----

--OVTXnIBT/tYhlLRp--

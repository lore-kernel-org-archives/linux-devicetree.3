Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995072;
	b=Bp+ctfSwi2w7FdNj5sLqVWMnrJj1+51jmHQLarkn8nCUMh6hr4UxIa6rTx+Rf16t9AbY
	 0Ad7lLTRRJWza1JiN0IwWrQ2gjYHqWYQhtpuJbljg04Cw6pffEIEq+HjrNCjd+xLGfFkW
	 fLp776KguICGws7KnzwspK3Y2hlg25XW5tLAACaD+GT7oLIsOYX6FP+MS5FcBN4f9uHmn
	 vIFI1l7bRx84o1/mUT9/p7l150lE8Cq4E86H4oUxHBQ6P1aB9w1iYmzQ1nTMBSEnbp11O
	 rb0z4LNtLaG/WIhScQ6ikc5+BPjDeKVu+IKDfBWvzwMgjSMMDmRcDdnoyswwYXBThzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
	b=J2uEisiutcYSDoYgxvUKckBChGLSYB1drDRi07zJr9FcgIVX2XqMkjfGLSitmZbnSv8W
	 8pd9pm8YqNdlKQ7pifPVpCrOpWBRAb2vUtvjmR2TWkl208ENv66WeAWC0pF+Nmd6q6CEV
	 f2cX2/fQh2r8CbLblZoXhkKpJLeGb3rxBH+2npX6sczHMTYOQ1z2JzN0KzlXPGYk6ZDdb
	 pLIg3foPy5F+yuqmmIvh8CGzk2ndSF5J4//o/uwmeASY9Uxp4ERwgWJkH9eld+ukVLnPG
	 qb8BI/srPlCouM03Gqt4e54W14Q74xxByu1YBVgaqIN4kiSz2o9BlJQPi4Lpt5wJuNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lxf6Sm/4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dw0qR+dL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A4606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxf6Sm/4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dw0qR+dL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8HxhQ1430592
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UD6Ea5YtRKAN6/w2L3NLQU8h
	WxRurH6m4E/cCzEvjsM=; b=lxf6Sm/4aFYe/mEejA1fegl4KiJLdCnHKNPerLji
	pCROGBJq8Jj1rXJQR6fWcoKxdvDGLJ6vziOuy+0tAKouR9hWOY6Ty1VRIoVStETj
	0oZMxfwMEyxTv8lXY8XUhB1KlUtT7mrzoYMFRnZ4A5FEkmBsRXdkvvarelUEPGyM
	fC1WLAidfAzw3KMVnE5/0a9s5sCWoAo6fpfrIPu/nC74WfMHKRZXl8AV2FZ9kouJ
	rloy4cfMcekALU6jT5LpGH/Mrq6shq1r7cIuwz1hvzROaAZP/vhMaD/MG4Cc3FSF
	24bLThos47qHsDESPVnSqCLhjB4+HwKO7zKUc0n90NASug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92cv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:44:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2f5f1e1dso11631931cf.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995069; x=1795599869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
        b=Dw0qR+dLZF26yg/TE++0jNgd1YISzrITswRXYLT0V2r520+dI3soxM6oqlnojpmRSK
         uaHGs5ijbzMDKsy/RuKUrDBLMppv0ONTQZ/MBlXLm7fnog7XBzQ4hW9+RvqCdL5YtyQa
         pzR9mKd3quGH+SokZ3WZAZibOTH+J0nyhlyKbgeeMPHWDsP1NreGs+r0pxedJAku3umU
         5POTzzHERV1pM8bhIIXycNEKZw9QRBr6rJKv9VCpfgz+RT4ySF3qaxQWWDL1a3mOu49D
         HL2CVei8erT2+8pthrqnaGghkWPOK8smmhXc0SG3oLzKsoqwkvc5U9cqjW59NWraQWQ6
         7oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995069; x=1795599869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
        b=EkcTSFHP4G1+46Tu5xveFgx3Khl9O/UJKJeDvFAux4o3xdOYW+QrsTOkAP2I4NHG+F
         Vc3OC3BCGbR0//FPBA0vfrTy1DsBHVXx0AJHGGSq2Map5kUgEtDjCiqK0ycjFVpFcVzd
         oqUfIAsFtDctR3ne6NtTanhCQ6JXlr6tpAX4osPrGm3sE5S8bf0zeDS8Ad87Cigf+YEx
         miH5VtmxM0KRBob3pECLn+Oh9T1Q/BPFWWMCVPQRdBbu2q3mIIVjzYNMy4KL82zq0pJ0
         GhQeJ6QzJyuc7FqEFwzQAnfH5Po6kdNlhjt5VActXDfGoE3D0jH38MjROLM0uNJC/B3D
         CFZw==
X-Forwarded-Encrypted: i=1; AL+hErGKoEBSXiYfChDmAYG72aduvJV0YXCgKRfAHc6hVpKKWUqlk9YMzfeZwYuuFSxkvyzxjsQok9hMrK/9@vger.kernel.org
X-Gm-Message-State: APuU4Z9lZqXE225S+KhpSQ9QL+2jyEw46RQmpXxCtbU3O56DyAaquZjm
	l550XkJOY+n+zfs2hWQ9homzKDM5vKfv7BjYyV6JS2p3SbVXWsK7EwHKOuO1fIm/+iS1OReZb/B
	vo1cXNbKnWKISu3aHB41HkbEw6YHQt/UibYjqsL9KD0L0a84XYAZ5ZhnHbg5Q6ij9
X-Gm-Gg: AYBFou0lSrm9+giA/jc2CCYpFeiaXw/VqEmZsb0ZdA60KnDCUgzKouQqHtTQ2U6dtLP
	nGbNCWXxzPEDlAnZo2n2fGXoFDkiVCsI07zTua5uLAtsb/rLhTc/znLdlW0Hj16OmpFxcYp+vdP
	1q+hFFFGgKF7p4+F07D1KAxesT5FJYGu5DMk7RJN5HqcqPoOupTShvbmlAjPxtNZ2CxtLBTSjb/
	tCAa5j5gNbbxtwyT6E9004if9LoGA1TgAdAkgqyt6lfBU9aSyxF8EvnHRNbk9YIyL+830jtZAso
	NjoaQbDi1+n9rxODDmy4ksnFQgqbLMu7WJNZv7oB2kMjWMotXTR0JRUazcJjvLZIRGwV8UbHg/4
	rX/Jv5usCdQYb7jjkYLq88FjyX7GEVki2xXjfm3/Wj5A23R9kFM91kNGQbfK6Stw=
X-Received: by 2002:a05:622a:5807:b0:55d:2e60:886c with SMTP id d75a77b69052e-55d5a57f065mr29804551cf.16.1794995069200;
        Wed, 18 Nov 2026 01:44:29 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:55d:2e60:886c with SMTP id d75a77b69052e-55d5a57f065mr29804001cf.16.1794995068605;
        Wed, 18 Nov 2026 01:44:28 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm240232215e9.3.2026.11.18.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:44:27 -0800 (PST)
Date: Wed, 18 Nov 2026 10:44:26 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
Message-ID: <av1zehivK9azUIom@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YRK1tvd/MI9w8hzH"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX7H4G3bDQPwV1
 GEAhtgFP8jWFZO5/EuCW0v0rBQk+M9CAEGWv2BVDfdKK6kAJU0dlwpRmJLI3q4ehJ4Y02DluA6R
 /CZ/CQEMeIi6nF+QB9MRDlBJKes9VIZFPrzVzcUDLrvPJOEMuNFQng4EqRlPabGQn2c60hYHHZt
 Unxr1kGsZQ38Ts4temd+wetnaHEsEXijxXbtG+tOedrEKVSczgU9xwr4A252nJbDETOaCKHIEYP
 sKnlSGPRMmaKQUgWqpMJ8uOs/IIvHcpkpHi8PfYx8yDFhACW0wwzRIzSZPALDkTtfEFI0UMAynw
 LEG54IvvgV/B7IeZ+rW/y+S+h0mIe1nc5Mf85NPoTMFysvYwingxwB4lTE5okbCBhvyBBgXk/dH
 BklwnDxuyVal2StgiNj4IPXoZxEnNOtdDNFUzmRx/eNzE+6YCd5D90zXWAvz1JL7vxE8pIPLYco
 +30ZTHHk2TFRap6Sh7Q==
X-Proofpoint-GUID: WShirg-Ef73byFblWuFb6uA13atF--t5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX/gXB7lTveMT0
 B9tzhshpPlNk5EeFQELW9dW0FsUun96UoBM68rsQJra7LvXkEX2UpyT3ICy7d1IPnyoQthMaf0T
 Rsk4ZM1jpiFOCDSdz1zycWnbOoP8E8o=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd737e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8Sm9gzTdqpzl8EHs-poA:9 a=CjuIK1q_8ugA:10 a=7X8ZIgrw44ctfyHyHP0A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WShirg-Ef73byFblWuFb6uA13atF--t5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

--YRK1tvd/MI9w8hzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> QCS615 (Talos) uses an ETHQOS controller which is extremely similar to
> the QCS404 version, but unlike QCS404 its RGMII clock source supports
> the 25 MHz and 2.5 MHz rates used at 100M and 10M with PHY-managed
> delays.
>=20
> Add a dedicated qcom,qcs615-ethqos match and descriptor and enable
> phy_managed_delays so rgmii-id uses the DLL-bypass configuration.
>=20
> The bypass sequence has been tested on three QCS615 board designs,
> two with a Micrel KSZ9031 PHY and one with a TI DP83867 PHY. The
> existing compatible binding and qcom,qcs404-ethqos fallback remain
> unchanged.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v4: this is a new commit which ensures that the phy managed delays only
> affect actually tested hardware (Shikra and QCS615).
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a7fdba73da2b..790159ae1be7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_=
3_0_data =3D {
>  	.setup =3D ethqos_hlos_setup,
>  };
> =20
> +static const struct ethqos_emac_driver_data qcs615_data =3D {
> +	.rgmii_config_loopback_en =3D true,
> +	.phy_managed_delays =3D true,
> +	.has_emac_ge_3 =3D false,
> +	.setup =3D ethqos_hlos_setup,
> +};
> +
>  static const struct ethqos_emac_por emac_v2_1_0_por[] =3D {
>  	{ .offset =3D RGMII_IO_MACRO_CONFIG,	.value =3D 0x40C01343 },
>  	{ .offset =3D SDCC_HC_REG_DLL_CONFIG,	.value =3D 0x2004642C },
> @@ -1116,6 +1123,7 @@ static int qcom_ethqos_probe(struct platform_device=
 *pdev)
> =20
>  static const struct of_device_id qcom_ethqos_match[] =3D {
>  	{ .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_v2_3_0_data},
> +	{ .compatible =3D "qcom,qcs615-ethqos", .data =3D &qcs615_data},
>  	{ .compatible =3D "qcom,sa8255p-ethqos", .data =3D &emac_v4_0_0_scmi_da=
ta},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
>=20
> --=20
> 2.34.1
>=20

--YRK1tvd/MI9w8hzH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1zegAKCRA6cBh0uS2t
rKbqAP0Y9Jlze5h2MB2o6B8iauLXSq6ptrMeehkAecNddaYyHgD+MmMk4Rpz4f13
U9ddshl+n6SmpBBaR7puRzI+Ei3OuA0=
=s6vu
-----END PGP SIGNATURE-----

--YRK1tvd/MI9w8hzH--

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C6435C69E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973728; cv=none; b=KNk+o37dRFmIWSX0uO6cRmjgnfaisI26FbhH/mU5GKWqBNZ7wMKPq6jpBgLF+qLjn3dEe7TmBK0nHPpAsBpqSxFn65DCBiyOZ3u+uWtnns/8OepZp8Nx1/jBNOH8NEiOm+u818KLsISMKhAWr4a4BpZWPPrr8p/h9uAQlHqwiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973728; c=relaxed/simple;
	bh=a2Q00hhq8FgtKObRRTGE/RZijDxUqzAGqRWDuS9C4jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kt8fZd07AriK3zvSXfeFaOwOaSQ9JNEnRtVpA5xPwij3mIercYH5gRYyhKU8ae9M8UbpMBHK0gyuQzUrNcsWkDYcX0cUfw2WmJHIyixjQujAc9h92Le0f0L39fx43gCkdTflhtN44sNh/7u4E5BjvWwFruzYhn/q2LiKY7DtpEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daU+XEpv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrByy8gB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daU+XEpv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrByy8gB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H70l21389007
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 17:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G1YWjulGrHQXzMx6OGl6R6Sv
	TvcP7k1AMvCnp6YruR8=; b=daU+XEpvUaNWTAd7+b1SU8Ge0rZiT+O08N4gzT16
	GAEJfsSPMr46R0FtmLfAxckUf2f75A4bdPaMxyqfiZmge+YYxT5wh7AIHoWP9+/s
	Y2kq1Goc/+rdh0ejzvWMaKzjLr41xAtSuEyLdL0AqKmiuFhb6jO7xxTxCC9Jdp9Y
	+NTgeYQ/fwaCLBVvv12wUHBQUIkus23c/FEr3ihrNAEEpqoF22M67zUXNTorLOvE
	cFjfkntCrHhcIP3AvvzxsiYgmRQWqoIHjVpMkxdnLYoGvMpVwRYNGOznlbe1yZeO
	oXySDHwPKkPojs+Psp5VvQgKqyIhCnV7NbITKGX8OofBFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk9rh0qf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 17:08:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1195359085a.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788973724; x=1789578524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1YWjulGrHQXzMx6OGl6R6SvTvcP7k1AMvCnp6YruR8=;
        b=PrByy8gBN0MVRXf40zjA5ww3zhbjNpwspB0hMUgvfZ7qwYlGEjZe5cfwCsSNW1CxYE
         aRvvteNXMl6Kt4Gxe9N/ZcD4PojofPc4JYVNfnihh9XAarmx4IWhp9wu/MCrLopc5QTV
         ukLABfkstbzQ5YBygC+wgI1+wK+JZ3LJfHPqsB4M30e8VXyYdWvxGZpMOfYbD7UIetxj
         N4lHP/XCNO2LBW6aMq+pwv1hKRRz9kYvB78/ZYEpnulDotCiXZz7v97haQJYtPhs+5H5
         O2Xbwi1CGSN3KrxQOPHtrgvtW4y57zoyrgLFk0uI4QSR/ZjNQT8qm629hkK/dbBh7nfg
         aQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973724; x=1789578524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1YWjulGrHQXzMx6OGl6R6SvTvcP7k1AMvCnp6YruR8=;
        b=JtVUz7mhgqmQMB1o6eh0yssyVxb2xH+0l++cbnNmTBLNt8/urPL3f4a5Yf8gtBMdzH
         /XQMcmpPuKg/pecgUQRYpie6xO0pTfLJ5Xs2IHIhkT6JQ8D5nQ3JJK2vC2jQ8VwXFCx0
         Ng8QjUB1nPT/0oQYzMW4io2IohlCkM0wCrQg+EXPDzrpjNxKcN4ahDP6G+BisxFmBNBW
         tgvWEMZ9X2UAUzxD6yxj9G5Q0+N1ttIJgd11vZzBhiVbt8b/8jgUWyPjf27JCJbk/MRG
         EP1FRBcgc6L6bDqvtUC+b01sA/cfXL6Rh6ZhbLM3HgNIQGCwUzD1j1dBffGlPyfarMt4
         96iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkkXV986PrzG/jNAjFc+bo4DbZa2V+z2IhuET1xwltQqszd9dEltgNxTJG+TXGmQCkdmNNTJN/cDAE@vger.kernel.org
X-Gm-Message-State: AFuF++nghwM+gxFT0eMN3qX/AasUk4f+GuVcmEn+EefdTnlVStgE3jQ0
	LsM1tM3x/2uaaCle2S/MWHqhPQ7ck3dAb+EcoEVAr0fuEvnxVqzoryOtxq4WUPcTULtOmcXkxWC
	Vwta35TLsSlKT8mmsExCKyx2DlubL4rr3YquwHsfa9GmAHz1UZVXC6Xi6bcoayB1J
X-Gm-Gg: AYBFou0PWsnjzsmPs2L2jDU/sJZQl14M7AAZd05QyD5vkQIBUMtcdFC7WnVTA/fclB2
	KtiGouUVQIEBDNrlik9dGwlDALkAl894kL9stxAUcf6U2m8BuikXqFitAkjaFQnSyVbiNYk2ckE
	LgPJmvrS8ekWgmjIN4D4ZwRPhbK8Ma0u5cSzEY5NM/Br77dbx56eRlc47gqzuquRkfGYzRR5G+w
	7lEoSB+Pygi8Zb+OCNH4muxkUs4jXkuJfC9/BS3yqbs5IXiNLlIX900BOYvjUOfoqB/j33uiWuK
	4/Gay5A7v2xicRMovJnPTOI3Eh7Z7aEGMEeYDIYqOi6h14o6LbSAsrAnshJksLchls/c5T2CaRS
	eWzMYmMgqN4wbpg==
X-Received: by 2002:a05:620a:d89:b0:938:39e7:725 with SMTP id af79cd13be357-939c94a60ecmr1014705285a.32.1788973724291;
        Wed, 09 Sep 2026 10:08:44 -0700 (PDT)
X-Received: by 2002:a05:620a:d89:b0:938:39e7:725 with SMTP id af79cd13be357-939c94a60ecmr1014685785a.32.1788973723191;
        Wed, 09 Sep 2026 10:08:43 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfc1sm5185045e9.4.2026.09.09.10.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:08:42 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:08:41 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: Re: [PATCH net-next v2 2/9] net: phy: dp83867: add regulator supply
 management
Message-ID: <aqGSmVslLLsp7tJu@lore-desk>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c9IX8H6zKLOh4Z/N"
Content-Disposition: inline
In-Reply-To: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ff8HAp+6 c=1 sm=1 tr=0 ts=6aa1929d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Tc_FYgHOodJxOJMde3UA:9 a=CjuIK1q_8ugA:10 a=eESnzHPFhmDI2KvGUDgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MSBTYWx0ZWRfX1gcmv9a0HbUl
 Irz7bwIhQ7a0mR//tvpvaHM8KqfkegFycC19cmk0m5CecAQHQWAcNx+vKQttAGYLyC1SJZtQju/
 pCzwv9Yhux7g8we23xMsJmhLGbCOWgITSNDkh3cHVMJgBhAJRJI5ahzs+3LOc5eQeUJrolsSC+y
 bMQ1XHfsohRr6Tdg44esZ3LXx/gPGvUuMcPK5JfbTgLGF1KvDQjwIcN5rUn76FuRG4SfEhKYh1r
 P7lDSuDDm1hAjrEGvGgDP7FyY4Yk08U+/4EMicllnDirZAbdg7wcEYy7/g0SZq8VrugpxJlRPU5
 nOu4Z5sO/vocJ/E009qoh1vwDIV9IDwlJXW5M99Pwin+pw46asKw3JjJJlPKRZ+QDTdwal+Oyz8
 SCa55McGVDgljcL9dh1ZqTLYfAUpbW6p+RINWIICPi9w6TX012mDiouj7gPg2Jox95p2n2p4UCJ
 jh63izt160m9vHCBPvQ==
X-Proofpoint-ORIG-GUID: 03-WCrwMy8l1pZKIQwqv7eVSNU84ma9g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MSBTYWx0ZWRfX/UXAffwXUjCY
 L3uR0/Vaj3IdCKbbYf/ZMbj3YTeFCIhsMt6UYO2j50FSuBo6W1g6htlJWPxdC5v3iHZ3nRNFxN0
 qT/+Bhg2s1p1tpNzWdVRUoejmi/kUJA=
X-Proofpoint-GUID: 03-WCrwMy8l1pZKIQwqv7eVSNU84ma9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090191

--c9IX8H6zKLOh4Z/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Some embedded board designs use GPIO-controlled regulators for the
> DP83867 power rails. Add dp83867_power_on() to enable all four supply
> domains at probe time. Absent supplies are silently skipped, so boards
> that do not describe them are unaffected.
>=20
> When any supply is newly enabled the driver sleeps for 200 ms before
> returning.  This satisfies the post power-up stabilisation requirement
> mentioned in section 6.6 of the DP83867E/IS/CS datasheet.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/phy/dp83867.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index 88255e92b4cdbd6da2e2c1d10f9c72348d28dbc3..dbeee7cad6f0cbfeb127bfd28=
f43ee2a16c78879 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c
> @@ -15,6 +15,7 @@
>  #include <linux/etherdevice.h>
>  #include <linux/bitfield.h>
>  #include <linux/nvmem-consumer.h>
> +#include <linux/regulator/consumer.h>
> =20
>  #include <dt-bindings/net/ti-dp83867.h>
> =20
> @@ -719,9 +720,41 @@ static int dp83867_resume(struct phy_device *phydev)
>  	return 0;
>  }
> =20
> +static int dp83867_power_on(struct phy_device *phydev)
> +{
> +#ifdef CONFIG_OF
> +	static const char * const supply_names[] =3D {
> +		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
> +	};
> +	struct device *dev =3D &phydev->mdio.dev;
> +	u32 count =3D 0;
> +	int i, ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(supply_names); i++) {
> +		ret =3D devm_regulator_get_enable_optional(dev, supply_names[i]);

nit: I guess it easier to read if you do something like:

		if (ret !=3D -ENODEV)
			return dev_err_probe();

		count +=3D !ret;

> +		if (!ret)
> +			count++;
> +		else if (ret !=3D -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable %s supply\n",
> +					     supply_names[i]);
> +	}
> +
> +	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
> +	if (count)
> +		fsleep(200000);
> +#endif
> +	return 0;
> +}
> +
>  static int dp83867_probe(struct phy_device *phydev)
>  {
>  	struct dp83867_private *dp83867;
> +	int ret;
> +
> +	ret =3D dp83867_power_on(phydev);
> +	if (ret)
> +		return ret;
> =20
>  	dp83867 =3D devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
>  			       GFP_KERNEL);
>=20
> --=20
> 2.34.1
>=20
>=20

--c9IX8H6zKLOh4Z/N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqGSmQAKCRA6cBh0uS2t
rNquAQC5wJNUN95Ep26s8XtzLNRj4JBV+qFthkyWqQAnIRtBTgEA+pcM+Wip2fRN
UHB7AACiMwvDdjPTHaF37W2hm07h/g0=
=eyly
-----END PGP SIGNATURE-----

--c9IX8H6zKLOh4Z/N--

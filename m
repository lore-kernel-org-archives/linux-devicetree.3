Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993209;
	b=g8n3B2lD/3IdYu3QjpdeqBS1XT6wx0sShSNXi06TIJeQW89dRGBhpU8ukcaO/Z8QYa//
	 w+NZZVUoH8q1QJvVDOUkg8rBMzwrZywrjjQAf7/YebQmqNdAD2xoHfrQPKCsi0hD+NNRJ
	 3mGJBvh2ccddmeaMG/x3+RGIdx3L+7Fk3wjYZPNqidlvxwXNN26eV6SAjqXoXIyGu0IZy
	 WIAcAU8DYV53Lu5dB4HinlFbhL7U7NaKg9HbkUdhBxmVGHsCX8CV5EdPIx6FcOiSZweCr
	 +pO8YNZn1zppMw2N/tOsXIVEwsn940XyA2jndAV0B3cHqt4qIL6IwdzqxQCnw4lxdLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
	b=ZZRsEHnHTxef7MsG6DkyvoaZonolAbu8VYBhxGDNydnVrEStFDdH7TQ/Q6Ra/Z7LMU0L
	 4ehl3OIiwyWmhXGucD/mDyojztxnQKHHBAywX/ncFDcoLjuJPfKn/VLuHHapkgb+GPMt4
	 FoNSSSpaH7G83bv2/ZV0bixjBHjCdWImNCMccAEvQUptsoaOvppJEAP6l7zQUKCAUURcw
	 q7yYl0CEM23grSFbTGAl2NsMeBNWBV3d+DBY1vz94172OEsXq3UvQSQ1T43VlwzKc6pvp
	 cxJ2ulda+zwfL5QPCJv98m3ZP5t2gP2U3rGD224rhsR54zLrnnJyASYPGHlsPY3gm9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pkek45nb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXSt+6+a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022F606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1022F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pkek45nb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXSt+6+a
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI7UjRD2648324
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mgNqGNkSyaCHbgQrLwcGSMfA
	aOL0GqaL9ZS9mVJYGS0=; b=pkek45nbZFw72X9I8v8wMsLNJXBCsEMpfHvRIst7
	kM04LP2uU7f5U1c95BoC5DPA4ehI2dhuQ07JZHLebGvWwdE+3QTyPKALXHO+9pBP
	81621wRkxS5w17kMXJBHXH3DI9gjIFUY1HjshMe++yBiBzeM8vCxCAUWKfeqHx+j
	5o5KEEduiMP0hfg2DV+lpzrR0SSadcP6c1RJ/vHyjU0ldHfQgLjB+83SYVMqvX7F
	wDXCMQU9LGh3vLK0BTQag0/WwwhJ/YIz8LEIUKNQmeG9lqS/kVVdWN54nufevHnc
	8jbTFXaxZW/oyhFZEV8niu5HRXs/Q5hUw5ivkMM3leHNDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8j841-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:13:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so205452685a.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993207; x=1795598007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
        b=PXSt+6+aE9/P372Gpfe00GB07ZTkanSHMmS3UrWpVLhIHmy7KJzpwxF6fdUZxOsRQJ
         ye4whvdtsVhvunvQt2Mu6It/KGAQgHFSGOslYIBA4xnG9jgWrTtpBPnR8l5VwXM4jDrW
         wrbjy1O40cDoLYBd54OdePSdmyYGyaPWcYOUEGTlsPbvTBu1ig++2yDp+HyF/oG5Z4IA
         ky8UG4uw0jlr/mj74Mt3Twfsoj3UZgUnXZKFEdjkyyAHwu/m0De+fuNZ3KQTeBbtvv+G
         bqkDzdD0ZsJ046N89187hFCs9GshFPTUjJhm1bse/aqx9CAaZjqzdlZWZJACon3A1bCc
         u6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993207; x=1795598007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
        b=qfcjKrY7mPv3vPk1DAXCJX4jYF8Yzy2MCvyNS3md5mklfRDk+T1dwESywnwqBGEkoW
         nwbaz/viMNgm/ccM/haLk5XnURQV1DrsBxBeqmGBPz6m7V8lzzSpBomNfLCPVB4SGED6
         tKnXyE96ket6g8AdPvxnkmj6Y0ARMVqfYMBWD+ZrniTF4pzB9PdGmvUXW/t4XbQLm+59
         aMnuoY7sp4vn/7ax0hof0ATomOU/cTbDwW0LTcrd9uqGx64xpGoyx1hGx6ow3RYEzo6R
         XslqggmDmyGTlhEvNPpBVZQVk0O3AY8DrRHEyaZexvCv9d3uG3bRv9cyG6w5MqmeQcXA
         c6KA==
X-Forwarded-Encrypted: i=1; AL+hErHnsBTO3Bmb8PjuDfyIVw1QJRSrbBCSLz6bsEun+f72IniaqDzukhoEKIGqaen94e732h6jwEMfmDOZ@vger.kernel.org
X-Gm-Message-State: APuU4Z934jVFN5mXQ4XfiU56UszVFq/e2cID8QYEn47n8VBfbELqNaw7
	PXsTwZOuvQxY8woRl6YRUQVfbT+0zIA88XOzur7xalhEsmjiarqojIi9JjNX9uOsXh4lU6Vqb6i
	oXS/yBDOPL10PoFILFaSo8iTDzULXkTk47QZQ+jzeKeLaGzJExSw9UKioYi+QLIIS
X-Gm-Gg: AYBFou0/7/vXD+P3XR6jafasF9aekn6+eaaArW8IHw3k20VdYU/EuG/DeFx3/QVoL/E
	FnAuJxaxGznjc2eW4+GTghM4BPnv8pNaVl85EDcTHsc+CXkQ03V7mnge2t0CHMUaFWgpQpTHLG5
	u+pY/hetv8UXvMLux1qPvpJztfdrmVh3jXXAVY/I7df/MrHXkpv0q3VJkfyIcFk+74ZH+xzv/Sl
	M35B3jVMJ4leSE8mlAbEyVPxt5qAYeTwqCEEarL4IAMuE/bCtH+rxrkyXoOmVS/ZPsz+zWBtCkv
	f7nqe5Z1S5XKkAyj3THhQ6ULR51EXBA8Wm7a0hDZsrk/0v+b1E8MmDrsn6hznrxbDJq3w8hDq9N
	InprQWBTZWJnIVmKsxAfecSfEw/mmz9H5UOQ71BknXO5IIpiQ/1e6aQe11G0Ifmc=
X-Received: by 2002:a05:620a:4413:b0:947:81e0:bd0b with SMTP id af79cd13be357-9499957e922mr390440285a.20.1794993207089;
        Wed, 18 Nov 2026 01:13:27 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:947:81e0:bd0b with SMTP id af79cd13be357-9499957e922mr390436285a.20.1794993206497;
        Wed, 18 Nov 2026 01:13:26 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65693389dsm3301484f8f.48.2026.11.18.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:13:22 -0800 (PST)
Date: Wed, 18 Nov 2026 10:13:21 +0100
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
Subject: Re: [PATCH net-next v4 06/10] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Message-ID: <av1sMajsn4Al-xgw@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="rKfa5t58Xe8YK57u"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-GUID: WyLE_U09s85SQMooS2bAvNuma5Ljr3NP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX5n7SxPL4twAs
 jnrsSr978urJiKOHULMhwbMvdc+dOsu8vACwAArfozF6bHo7zJGs5fXfeU2wLU1fgCad3jv/Kfu
 P1oJzA7Wx1ptygmlETMQS3HkgUX+m+4=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd6c37 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=RmR1C2qGtOR5igIFRNkA:9 a=CjuIK1q_8ugA:10
 a=qFG7hDbQzpJO8DkesHAA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX139RP9F07mEg
 zxjK0nI9aAm3aXY4h94Vu+sw5f0ToirtQapVxUsyNKtdIeAoCP33nITHfDLjT4ZUv4dGziyXdR7
 sE6W5KqLEd0lJL73BdWa4Wbnr+uqyHYc7kGlDgjTYwxY7TxjuUyluNfsZ86Wvi/nXHYfS0tSKCK
 VUS/7EUolyt+4rUeMF3CrAC10E+tKFRkv3/62EAsm4a5tcrG9HRzaZzA1BZ9XchfeUl/yb+pPL2
 NxCX6GO34szthZVEDKRbeHrl09w7Q2vGyeiInAokWn1FS1gI+MjJDW4TkOupy25MsatHH5hT4I8
 DfL8NizYzwddTDbmEycsVLoSU47U5rCW1jAdmC96VWI2wpHJ/oJQKcrTvreZlY127hhC4H0+KoF
 xuGZAjZM9LkQaCe5hnDWJ0W5/GNMBTXwsdlryqa7asnrc6udgE3a2LYMlHcjjxHdvsO+UyPgjJs
 NnSC+b955ajx+eWEGEg==
X-Proofpoint-ORIG-GUID: WyLE_U09s85SQMooS2bAvNuma5Ljr3NP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036

--rKfa5t58Xe8YK57u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On probe the RGMII link clock is initialised at SPEED_1000, which
> translates to a 250 MHz source clock even when no PHY link is present,
> drawing unnecessary power.
>=20
> Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
> a link is established.
>=20
> The DLL locking is not affected by the current clock rate. This has
> been confirmed with actual hardware testing as well as the fact that
> the existing code performs the DLL lock first before changing the clock
> rate when the link speed changes.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v4: add some details in the commit message to address concerns raised
> by Sashiko.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 99ea7e0cfb00..192788e00dfa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -828,7 +828,7 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethq=
os,
>  	if (ret)
>  		return ret;
> =20
> -	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_100=
0);
> +	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_10);
>  	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);
> =20
>=20
> --=20
> 2.34.1
>=20

--rKfa5t58Xe8YK57u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1sMQAKCRA6cBh0uS2t
rEoxAQCXFnBdtRXO+i6NHOYmwXKbg0uyCKdVXH/7nhAU25CIswEA79MQ20mTgIZQ
/VNRnKPr2gb/4bOoyHks5lzMSJAhZQs=
=aBpG
-----END PGP SIGNATURE-----

--rKfa5t58Xe8YK57u--

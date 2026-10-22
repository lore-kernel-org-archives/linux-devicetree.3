Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689943;
	b=aNpCoi78BUFQLl+vKUIyY2FPVKL3eLXdCv7CeFWysLPp1Y5edMuHqLtQV30j8AnQYH6e
	 nftHPueb3oCTN9AyhENFmpdpAhLAxGngeyyn9Xhh0VbEmMmDJQuvdUJYCiJa1LoWLV4dy
	 RVRktLR1DlC26SheccE2/sWyQMfqoQi320SEM30JzMLx5cTVBGlRxsOQQCAHVAgxVVboh
	 K/S2otcg/shiqDzR1PakdbCZxMHPjmscDKKb0Y5JyZOogx25otVcOK3Q8QedQ6JjUlYO5
	 WppC/kpG4s4mxeZ0hH8jhC0tGiAYSF5r4n0SnKsAPmxlHr/vl4c6D6ZlVmKu5/fqaBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z6AktrNRc2FXQ2aAgAi4RpcR1aHmqBhSrhbs1Sqm0ko=;
	b=HquIM6bXTRN1lY94MwcmBU8HphQkzftmXD5j9qChJpfyiL3DjHeYkQnBTPnX8JB0Qspq
	 +Myfr4AYmsLjc/slNnG0qTK+/ej1S6J4GNHetk/cARhqKo0aNTnRtOL0nTfJqsZFoXnZN
	 lUCyOPy2ggQzc8cY6V8YbPmNOp9H6mpctT1c1SYDqV7Ri5ihwNSaZRRGK7SP9HUFsRAW3
	 uqWAD/48rC/+my8alksDYGwnd2gM1y2Gm0RbdlfHcsllm8D2PhDGBilzl/SjMAucEVYsl
	 JhLW4j44LXbMSDSC34zgQwvFDuoELXnA6xVLSeM/DCbGXAW7vZl64kcXy0zk1qSPgiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CWVb6AWS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfzXVGVJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDD4606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDD4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CWVb6AWS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfzXVGVJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MGk0Uu207580
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z6AktrNRc2FXQ2aAgAi4RpcR
	1aHmqBhSrhbs1Sqm0ko=; b=CWVb6AWSVmzhe1s1IEiTSHJAt5TbC5Fd9U2+RPS+
	JnmomB6jHHsWXmJce9U0I3dO8SR9Z726fBDPaUo0K6/inE0LsBOvrbEvFJ0IzbFa
	/EASM4VnVPXEoz8jb4SAQcU+Wm0nASBcW8AGtILybFMcHNEUj7Qd1upYAm1+XXc5
	2WUi76Ln4SCO5SgLlaZrK4T/LeaUwihuKYhbaJaCEn8G9UAoZenNIaxdKc7MIdQh
	0+JMTe9QnNbWHYLST+1TfBsZfpbuORYt/uLp00/0JY5A0nIK0fDNaMF2zVKDdHRN
	AZUPMG4x59TUf4Ldrf/nukMKEzn9NePnIalbRpk2YVbPmQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw08yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:25:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b92acedd9so2888226d6.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792689941; x=1793294741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6AktrNRc2FXQ2aAgAi4RpcR1aHmqBhSrhbs1Sqm0ko=;
        b=FfzXVGVJHBoXo7g611hnctNhOLrSjfw3dV6SOTnuepYkI8fYIpLC9jfFRLPDsUyu4W
         MPxIGTkxMOR/EhYFrwtRyp/fqsSgLYf3Z3wkkdeAkP12ujqflOdgbOjx7DI6z+6S0+H9
         ZDrN+ajJaxZ/o7J2Z2XlNQQfFP2wikUexoEbOykqlWOA+3ZyczsMbkisEwTkIDB8AbwV
         /pJlUWjCjxX5zVMbFv/FMSB4MrZmqHntoLMXgfpGUrnhDn5/8raBgfNpCj+hurqtgF2d
         i+qHMwMahuXpnBORydOUoXMOhUUzMMaQKgvmnmiLHHnw7NkrHaufIOq1B0d/IJphs+3Z
         taAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689941; x=1793294741;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6AktrNRc2FXQ2aAgAi4RpcR1aHmqBhSrhbs1Sqm0ko=;
        b=DyxTMvJzPLtiLdWyWokSfeqJjJqEzqOy2SS3POtBG6BWnm3YRbFlfkyc7dG2+bKc8y
         wtXrw/ZZdHc4CilXr1tTsdHa7HFxbBDa58yeNh7IBSCtrLI6Px0ZahBAQehxTZRoHKwt
         uaFdde/dQMoZVgh957OiN3LeEmO2St4q6vVpQfx7jlb6dA1vkmiupKrzCakroebfRgT4
         NHvtkLPFqcKnkiz1oWAeYoD9AQEOdqwOxohxcPF9pquANI5flZEs4sO41rQ17nBdxVP2
         dW+QK2CIInithrnsx2RgMj7GT4pJGac6nq27LiqxqOdYheSGa+UJD2ra2flSOE7SSu1I
         cD8Q==
X-Forwarded-Encrypted: i=1; AKwUvByPxVeUNAGhGQUPVIqveEJpwsAB2WnZvPEIr9ql2hCpxCoKqDpSU1prums35CcOrRiuemeP+B93W6Z7@vger.kernel.org
X-Gm-Message-State: AFq9FYI5UWlgkxqttjRxdsXsMkrAlCjcgrZJG3EjnzWC6CnpqVpL/EXg
	VPC8YF/I16qDZ3CULLZxZVRQroQMb/IBiwXYx6d6HZJ8Ouj24nDI8w7lclSLDwgnI/tztKFVE25
	PjGwVam25TO/QLywf9ff2pSZnF/775xhlTl2l/i1ezUjgH0QgfbQ8nqLZ0BzM03Wj
X-Gm-Gg: AYBFou1ecp3RKJqMDwh01UGIOPf3jhMPfwrY0wJsPLMWCWUPa1nZ85xdoaYw/6n649C
	RIUzhnKVHH24e6tAtpSDtw55nHLW0qMMtS/xn1QCqCGmRS6Q2/BmPM82VoBenfWBaEDhXDtAVPF
	ZjWW79tHK18wQ78slPxilPBVTBZtG1P9deszuRhf7pOV/33MWIH5u2lWIvBvR4jza9wyDAeNUpl
	jvHdBsBaWRsv6V8k/W58VAOpaxbBQN019AFkVKYS7K3/LREFBO3po7vEzHCsBKP4hcfMr4EG46W
	ZISy7MLrY9hj8FKW6QjGdcdtCsHPfmZ/giccOL2Pe2ocphB+gEdz8rVwK2G7/dHj6akbH4EyTGt
	BZHOByJEQY0Ow1g==
X-Received: by 2002:a05:620a:17a1:b0:93c:80d8:57ec with SMTP id af79cd13be357-93f6f851357mr22881985a.64.1792689940985;
        Thu, 22 Oct 2026 10:25:40 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:93c:80d8:57ec with SMTP id af79cd13be357-93f6f851357mr22875785a.64.1792689940357;
        Thu, 22 Oct 2026 10:25:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm13786270f8f.8.2026.10.22.10.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:25:39 -0700 (PDT)
Date: Thu, 22 Oct 2026 19:25:38 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
Message-ID: <atpHEpzw27_8wu7t@lore-desk>
References: <20261015172620.GA1780580@bhelgaas>
 <20261019220111.GA2271378@bhelgaas>
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
	protocol="application/pgp-signature"; boundary="THddspKwcrT7mb3a"
Content-Disposition: inline
In-Reply-To: <20261019220111.GA2271378@bhelgaas>
X-Proofpoint-GUID: 1K24Px0MTwMUX--2lDB9pn4gYBAscvu4
X-Proofpoint-ORIG-GUID: 1K24Px0MTwMUX--2lDB9pn4gYBAscvu4
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6ada4715 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ee_2aqc6AAAA:8 a=tAtCrcrtAcaxr7tUyVkA:9 a=QEXdDO2ut3YA:10
 a=plpxFqqDF8Z-DRInVI0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfX9Rz9IHV4JuJe
 F1GpL5ueQWwVDaB9nqPUI2VShBLHNN0o/GLP+Ot2aCRBK58HVvCRepry+3LBf0LRId7jbOLH6ic
 eJiITFfXuVL6vGWHdyQVDwZPItitYLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfX2jg8rbnnTd4u
 jlnGSF/Peu6hIKStZouye1smDOgxyXHMgawwW5GgyuSSc/LRmmIGoRI9qG3McgzCY1FLZ99CGXP
 OnnG8JdzrN5t9OWHFAcLW4nP1t/aGWtakfhdlmgEPBrPY9Yl24oZJey9kfqhcPxrBfpsUBd2lG/
 VeZr7pUGsS3WvPI1wG0/qX0WVOFwzJedLzWE8BsUhMzUWM2wpRfcm6Fpqxzi3kjHCFrPAKjaU0U
 hHXYzFkjLCHhT36aeX5Z+LIQQWpDQTIWuAnBhSTnLdcR134gRM5ntvtnuFqvqws21zux6Hll44k
 IS/G1he4+MEgwVpwTJsBLusYjNvgHLBS7B/Kbf2LwqXNBZ2/Nx6CA6A2/2PjPQYMbcwRi/ww3CS
 XYtsH8bID3CdpQsdFbUifxMENUNuMqvfrDx93xyvxkKfLEqg4lpslD6dDhPMZ8imoAvMg5vbtgi
 RWE1BEvGFw5oPvu/M+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220069

--THddspKwcrT7mb3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Oct 15, 2026 at 12:26:21PM -0500, Bjorn Helgaas wrote:
> > On Wed, Sep 09, 2026 at 04:55:57PM +0200, Lorenzo Bianconi wrote:
> > > The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 =
GPIO
> > > lines. The controller is registered as an auxiliary device by the TC9=
563
> > > power controller driver and accessed through the same i2c device.
> > >=20
> > > Describe the switch node itself as the embedded GPIO controller and us
> > > it to drive the PERST# reset lines of the two external downstream port
> > > (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller a=
fter
> > > switching to the GPIO descriptor API for per-port resets.
> > >=20
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Reviewed-by: Alex Elder <elder@riscstar.com>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> >=20
> > Bjorn A, I first applied this arch/arm64 DTS patch to the PCI tree
> > along with the rest of this series, but that was a mistake because=20
> > those changes should go through your tree instead.
> >=20
> > I dropped it from pci/pwrctrl.  Do you want to pick it up?
>=20
> Just following up to make sure this DTS patch gets merged somewhere...

Hi Bjorn A,

is this patch supposed to be applied to your tree?

Regards,
Lorenzo

>=20
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm6=
4/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > index a13315bf0fb0..4da7342ca90d 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > @@ -867,7 +867,7 @@ &pcie1_phy {
> > >  &pcie1_port0 {
> > >  	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > =20
> > > -	pcie@0,0 {
> > > +	tc9563: pcie@0,0 {
> > >  		compatible =3D "pci1179,0623";
> > >  		reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> > >  		#address-cells =3D <3>;
> > > @@ -891,6 +891,9 @@ pcie@0,0 {
> > >  		pinctrl-0 =3D <&tc9563_resx_n>;
> > >  		pinctrl-names =3D "default";
> > > =20
> > > +		gpio-controller;
> > > +		#gpio-cells =3D <2>;
> > > +
> > >  		pcie1_switch0_dsp1: pcie@1,0 {
> > >  			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
> > >  			#address-cells =3D <3>;
> > > @@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
> > >  			device_type =3D "pci";
> > >  			ranges;
> > >  			bus-range =3D <0x3 0xff>;
> > > +			reset-gpios =3D <&tc9563 2 GPIO_ACTIVE_LOW>;
> > >  		};
> > > =20
> > >  		pcie@2,0 {
> > > @@ -909,6 +913,7 @@ pcie@2,0 {
> > >  			device_type =3D "pci";
> > >  			ranges;
> > >  			bus-range =3D <0x4 0xff>;
> > > +			reset-gpios =3D <&tc9563 3 GPIO_ACTIVE_LOW>;
> > > =20
> > >  			/* Renesas =CE=BCPD720201 PCIe USB3.0 Host Controller */
> > >  			usb-controller@0,0 {
> > >=20
> > > --=20
> > > 2.55.0
> > >=20

--THddspKwcrT7mb3a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatpHEgAKCRA6cBh0uS2t
rIAcAQD9XMFk9P0Wcr2AnQ1Vo7zfOmzMMBX19nW9jYUu4UxD3wD/b0ihb2VzRcme
Iwdwa1q9ZZQu+2CgZgGygpLAkLGRqQc=
=CJkx
-----END PGP SIGNATURE-----

--THddspKwcrT7mb3a--

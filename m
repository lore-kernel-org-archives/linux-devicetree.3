Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919361F7569
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784339197; cv=none; b=ZB+CAzNskO1pat6ztWQLh8Dh/XlKfgVRE8imk0ZhUWaWZLHPWIN2X5sCa7AWRRFhGIPh9sSRfCpf5zv03VDvt5ZpZWHbWNV34okrpyMnTuXuQ85WDeCqTgyxfCC1WrGY6Db22V3ZUMW31af97hlm2N4Hz+skwogvgbqjAGuwb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784339197; c=relaxed/simple;
	bh=2BY/jOU2jW5sGPniP+dSUc4YrnmOUUIUVFBJZBa6g6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GjncumeikCoIxqMW8HjUTVV6VRPAD/4fHVL3NNsVZXUmDLGr0Ud88kN+i4jFLJJUpDyzCSEIRRUyerQi41WAD6YREPTnzhtwini84jSKBrmkW1+LamjxlJm8/1o1QBVayeZ6xnc0Y4/3eMoQ00lA44Nl77Oknsv/3MhtbDAsbSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWPi8s1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKMMsoNp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWPi8s1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKMMsoNp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEQgj3335927
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgCrjCImBhZvpsd46+fio8T962Fne8bdWlz6Aa88TKo=; b=mWPi8s1eZ5qm6mx6
	ZGeDopPGp80MCU9jZsc7jqhi6DnX5KjdVv1NLCJslPAwENvwTkQG/Xex1V+pmdVS
	fu0uqF5MamA1ngEgCbUbAX9pIpS6oni3srSDDPxOCHljkPC/wRlta1wbTfCgqaEi
	MIZHnxr/73AxEI+DCNp8b8WaSovgen8T/dHCCKy6+17pEU+cOIBcvAbS06WLBJoh
	M2UZ81iRXDy5KIyOFvXSZFSgFSxnUTlnK06oFPaG7yQBwvdrkjMKaRew1h3TKjfV
	GinepD94Z6ZSDgTsI2/rbAGHNBlOcgLRqpcXNX2puD/cakkjTh+YcsW4L9eV7JC5
	tL+O/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq9ek7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:46:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so11711021a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784339193; x=1784943993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tgCrjCImBhZvpsd46+fio8T962Fne8bdWlz6Aa88TKo=;
        b=OKMMsoNphG96FUD0Y2BtDN87jWu1Er892358gltYAKXEZjrE/VXzo+tRg85OrEHWw9
         d4qDoGzf5TBfuaqucXCWOoQWGVLSUHTzNr8PCm7Cx+D/B0/rTIDguv67vos33Tdyqc/e
         xvmEW6ZLYYd0IPheV3sOgvxb1Q00BKwrps+JVyyt6C+qhhzbJEwcKeR3UN/42VfrNoZj
         8Z1JzLIzewO/vhqIoyHcK1xqnGGLB3G6CT8Dk93VfyMEewArTFVgkUrE5ptqef2xgrO/
         amWd+TGQHKGrea4eO+nfy3jLXXnGsGlas3/IomXECsT7BG4X+9Zbc/xJSKM7Dd1DyWG/
         8Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784339193; x=1784943993;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgCrjCImBhZvpsd46+fio8T962Fne8bdWlz6Aa88TKo=;
        b=qdPYpKdzUgRWprZDbuxTytVd9klZSHCLQcOXY7lM1Ez6UQV2vrjzvtK9rcvKZOX6pR
         sqTH92PQj5TmwJXBZYEYP1/4cM6qMXCPnOb99F5gW+G7j1LHxh1kZG5ua3j8aIlig0JY
         9cAumhh5tb8WNG5gJmjDS7TKfmEjudrXsW8pFu/+R5bttOETQ8N6g4P7M3NlX7rUG2J+
         k9uXLmoZrk5fVFzOZ31NUUddOIqpO8gS5WP7XygmIPHbNoSYZkYAa3nHZSU+01fqL+2C
         3hyWXiRGpgddi+yaCs4BjLACKY6H3cVic9ANOJzw+3tTD2pPo1KF6PG+tnBx+ZeHHAEM
         3RYg==
X-Forwarded-Encrypted: i=1; AHgh+RrafrJtWgqxrZEtTR5poR7kkT1ogpGi/3ukAXyXZyt9UfexkqKwcb1F03dmqI0Ws8GLJWBX6XuBaADP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CsQexjozVE+2AhOulkSqAznZoRkNIC9Ipt0Gi4372T59ypRl
	hzEuNsuvwwagXu9ADcYu0nUxvPXCbE7CiXNH2o0wGnHQ+0h37AZ2lsw1kHw9bR9hwqFhGxFo6Ma
	o+U7Z86jsmCKk9C4ZwWy9/JmaXq/qjC0dWNzd8OukK09RI/okrNkVVxeQGwZS9zKv
X-Gm-Gg: AfdE7ckI9cDAvY0Ew8iMzFCV1PfBWkviLlfDUamh8pm0bf3V+hXSLcREQwVbl+aPryP
	bWRYNqAvo8v5aNhHXbpHM1U2UbrVyBvkNAzBLHdYltZyBoF3Bi0pUaEH1BT/NlyfogQ7vqEUmod
	G6mN9Mv0GIi9CPUH1JfeZfrCN5qgimbWhzCV2SSkd1QGZtOkD82b2Kef1jx9ZDRtestUrfzK9G0
	91F8Ooz9D97z+BDvY9dfzzni3S8AvWP3MeIbrxOmZC+knyFhK4j/TPBG0d1Ai+EvMysDSkJ0igk
	wNQTf0BFg7XP7OxgRG1IsNPMrk10URN3kXExmA4Xh9vrZ218mJifFUG78mTafUn1+qluc/ioY7p
	PO3yJYEINzaUuekOq
X-Received: by 2002:a17:90b:2dc1:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38e4b3e11a5mr5098999a91.7.1784339193106;
        Fri, 17 Jul 2026 18:46:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38e4b3e11a5mr5098978a91.7.1784339192658;
        Fri, 17 Jul 2026 18:46:32 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc117sm1929803a91.3.2026.07.17.18.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 18:46:32 -0700 (PDT)
Date: Sat, 18 Jul 2026 02:46:28 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: sashiko-reviews@lists.linux.dev,
        Marcelo Schmitt
 <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Message-ID: <20260718024628.3e2872ca@jic23-huawei>
In-Reply-To: <alpab2gBs4nPDU5g@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
	<5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
	<20260716212838.95B3F1F000E9@smtp.kernel.org>
	<alpab2gBs4nPDU5g@debian-BULLSEYE-live-builder-AMD64>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAxNCBTYWx0ZWRfX52ndSvCzR68E
 pqUgh5QTjYi4CeMund/slEjNletopjUzKYOOEYrCa+YBu6/gmcyO224z3jXc8PYwkx0uCCTS7yH
 jFI+GfE2kcrPg7ImNXna9VhyII+TlYM=
X-Proofpoint-ORIG-GUID: P0zlZng7tbmRMlKM6wLe5hsWWG6eYXjb
X-Proofpoint-GUID: P0zlZng7tbmRMlKM6wLe5hsWWG6eYXjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAxNCBTYWx0ZWRfX3+ANPA26ciAq
 EARJrAJDgAjQ8mpa+eOQvy/G5IUzMXXUDKdtCEn4cnT9f6eq7M2lTw7u+/QKaRN4jaDe9ZxaGEy
 pM+WaQdph7Tl5zA6KPX4guOLj3HsS0qPaV0bhvxcQrUIU9DA40jWv6QHgVQE/3XYZ934Yg+2zOZ
 YHoYSRy0qS0Hjhw5S6mZZNT1cjFFBySRQ0d8aa6SA4BcNDiCDLQOxruUlScQlnJQ0sLT7giPskr
 AMhJFLZ4SB+wDiW9GReqThQSK+5c73s9ZxRu4HONFLKJRqpIycgtAYRbuj4Cij+S0gE6F82HYpn
 BLDl9NJvVMeIdn4L3nIHUPW2pvSS6dagXGT5mkrvI7W49LifWEwMY+DmSenB2zIq2tbASK8DiQA
 YxD1IGcpqdu9aXz6KTrJ1KKmE7uxeitwC+iB0pT27wLM5/A1LuFBIaOnojwG0kn8ury1XUuUCnd
 CdM2e5RL75cqIeFyCmg==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5adafa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=8AirrxEcAAAA:8 a=c92rfblmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=Wwo5UH-IqIJyjYPLOEcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=ST-jHhOKWsTCqRlWije3:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180014

On Fri, 17 Jul 2026 13:38:07 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> On 07/16, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The `LTC2378_DIFF_CHANNEL` macro defines an IIO channel that=
 is intended to be differential but lacks the `.differential =3D 1`, `.inde=
xed =3D 1`, `.channel =3D 0`, and `.channel2 =3D 1` attributes.
> > --
> >=20
> > --- Patch [2]: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC237=
8-20 and similar ADCs ---
> > commit 5710d5f25b45906977e2522567c1964b1d3219f8
> > Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> >=20
> > iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs
> >=20
> > This commit adds a new driver for the Analog Devices LTC2378-20 and
> > similar analog-to-digital converters.
> >  =20
> > > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > > new file mode 100644
> > > index 0000000000000..5600c820c7f45
> > > --- /dev/null
> > > +++ b/drivers/iio/adc/ltc2378.c
> > > @@ -0,0 +1,416 @@ =20
> > [ ... ] =20
> > > +#define LTC2378_DIFF_CHANNEL(_sign, _real_bits, _storage_bits)			\
> > > +{										\
> > > +	.type =3D IIO_VOLTAGE,							\
> > > +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |				\
> > > +			      BIT(IIO_CHAN_INFO_SCALE),				\
> > > +	.scan_index =3D 0,							\ =20
> >=20
> > [Severity: Medium]
> > Does this macro need to set .differential =3D 1, .indexed =3D 1, .chann=
el =3D 0,
> > and .channel2 =3D 1? The name suggests these are differential channels,=
 but
> > without these attributes, the IIO ABI will expose them as single-ended
> > (e.g., in_voltage_raw instead of in_voltage0-voltage1_raw). =20
>=20
> For parts with multiple inputs and configurable differential channels (e.=
g.
> AD4130-8, MCP3561/2/4R, NAFE13388 [1, 2, 3]), the voltageY-voltageZ ABI h=
elps
> clarifying what physical inputs make up a channel. For differential only =
parts,
> the ABI seems to be flexible by only requiring a 'consistent labeling' (e=
ither
> voltageY or voltageY-voltageZ IIUC). Will set the channel with the differ=
ential
> ABI if maintainers believe that's the best way to have it. Might slightly=
 tweak
> the channel macros to keep .differential =3D 0 for pseudo-differential ch=
ips
> (e.g.LTC2369-18).

Whilst I get your point on differential only cases not really requiring the
specification of two inputs, I think that does provide a simple indication
to users that they are differential channel.

I would prefer that we make them 'look' like differential channels so make =
up
a suitable number for the negative side.

I vaguely recall we did once consider handling these as inX-inX but it seem=
ed
a little too weird.  Hohum. ABI was designed against the max1363 and I didn=
't
think much about device that always did differential.  What can I say, I was
young and foolish ;)

Jonathan

>=20
> [1]: https://www.analog.com/media/en/technical-documentation/data-sheets/=
ad4130-8.pdf
> [2]: https://ww1.microchip.com/downloads/aemDocuments/documents/APID/Prod=
uctDocuments/DataSheets/MCP3561_2_4R-Data-Sheet-DS200006391C.pdf
> [3]: https://www.nxp.com/docs/en/data-sheet/NAFE13388.pdf
>=20
> >  =20
> > > +	.scan_type =3D {								\
> > > +		.format =3D _sign ? IIO_SCAN_FORMAT_SIGNED_INT :			\
> > > +				  IIO_SCAN_FORMAT_UNSIGNED_INT,			\
> > > +		.realbits =3D _real_bits,						\
> > > +		.storagebits =3D _storage_bits,					\
> > > +		.shift =3D _storage_bits - _real_bits,				\
> > > +		.endianness =3D IIO_BE,						\
> > > +	},									\
> > > +}
> > > +
> > > +#define LTC2378_BIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > > +	LTC2378_DIFF_CHANNEL(1, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> > > +
> > > +#define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > > +	LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> > > + =20
> > [ ... ]
> >=20
> > --=20
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.178423559=
5.git.marcelo.schmitt@analog.com?part=3D2 =20
>=20


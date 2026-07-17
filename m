Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4093DDB1E
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331728; cv=none; b=hTbX4baY+0FeWcT/S80xJwjVqoR5oj+3gJbUI6Zwdvfu+tFdUFY0eHKC2z5aInm6QnPGud+uMNtK9cZFx2q7gRcs0/DBXU3/U8dDBQMg9p5JhpVxDd1YXHIm/Mh11Z3lBLfpkec4+mWc4U4svUesHvEXBa+aegXuPBE7qdV365M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331728; c=relaxed/simple;
	bh=Dh4PhUdgx0Srvx2iN+3TiJNnWorjoHEMHaISL8VgawU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iWzrBTYwG/AGtsw/SdmXvwV0g6WJVYV5xxd0X8DOB0pFdugaxUjzZyH6l3uaxWqgkWl13s0GiHXN1qxrranyEzMlrBYxxO/UVsYM0Box0/r32VY5VVxtCOY/d7vjNNDLRJFAfSQqHGWk8AKeWWCqRIar64NptdEHpRoqYMr8q0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhMwSkvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD6oPHbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhMwSkvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD6oPHbB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNESm23309467
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNk7g4pY92o6e2+1OUe9g8KgB5YklUhVrGTC39c/648=; b=HhMwSkvK0wJ+kYKZ
	ZvhNg2up1E1emTlNlkvgFvtp4uUKCLa6SI0z5ynLqjYV+l/DBDhINLHrLKg96Y0+
	4bqjt7a2/L64rpJOd285XPafACVrRt/ZakT1R+UPG2NOQ6yCmEN/STt4osZ95qDC
	McCUYfCxmKeWcbH/SyhdaurHZB+xK+mlwjW13ps4iKWa9l1VSzuKW7l6OUr3lRxl
	cqtjp9p72Ep4sxM4NAsabwJrg6VexcHjZ9tfGsslIKKZTu3fjCMiihvx/u3/uIa+
	QQqcGR2Wlc84f9S6Lg6k05NlmXl+p4f/+0OZpmfJIXPfwizrpVClL6hmKA2Vz/b1
	KrcXBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrqd982s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:42:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca5d2474c7so128581585ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784331724; x=1784936524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hNk7g4pY92o6e2+1OUe9g8KgB5YklUhVrGTC39c/648=;
        b=XD6oPHbBuODPXzKeRDLC/iOgB2F8OQio5qVFwjAQB7I2CB9JnDINPM1hx2ww1Q0cL1
         9mpJm5/OKI/ReJuo8gS93RWDa6jN9cKPh9Yk9iusZCOFcF8udSGX3HRoLq1W0rpAlMTW
         g+bp9WSvVtPRCoaL50BJzBx1aI6mIr1zaD987i2QZjHmNgKGypG34JV54z7fuuVM+PUV
         arIA4POR0GETUCndJfF84kbrGja0SYkMvMu6SbQAWHcSz6PsfDJz4s1oGuvnpRwqkPJA
         8lhtOp65Y2MT7veGn/Y8bnvXWzIFVe0dB33J11tnwoaHqKWIjRjHvUay5ES73K/+FQ4k
         PnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331724; x=1784936524;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNk7g4pY92o6e2+1OUe9g8KgB5YklUhVrGTC39c/648=;
        b=WtFnRZ2KInnsxzyrRzpQ2NT2bPpHz7s+3Ba+4eKbSEF46vvGz44g7POl+0c6kNcWzU
         BpP1E4DlEHg9Cpy5piAQZUoCt4Ni01b3liB/y9l6iu4UgA0P6iUu1s4yDckbhdipvU4E
         M4I6wloX3gIVT6OKjFPwk8GlXt6eBzwuwcjlRfTenA3zHqnu6a+97iYxSzCOkRKDI1Qj
         KNaTDea5rruWS3uY/RWuyPw5J1DGNDn2HTMrsU1h4sk9TXCczOMfuLgzhSmrpa0u6JFm
         n+9+KqTFjxNNAm5rFVgXy6sOYK0tbNhHE2ap1MgTVTxGc1lqffKCH1zLgU2WbygO+p8w
         j/1w==
X-Forwarded-Encrypted: i=1; AHgh+Rphn3jb0aHEB9dAjtZEn9BElanSqHuU6nWUV16oH+LN0C1Vb6WVsKFB5XdmCCLF1OMddPrJ7TBYzvJY@vger.kernel.org
X-Gm-Message-State: AOJu0YyNq8UPOCdf1LEpMCKUBQPQd2kArQmgPOFvEAl9CaNgb9cPItWA
	n8CHcyN6Rfqa1RjE+qLhCkSIH/3hNAxAyBFXVSOD5JPitVNf/pKkxZxiIC38QV8X7s2EzeQTxwO
	agA8bTRoE/SktJ5v/Eq6ZRtKUPwjqYUIt2UQwoWoBDk//EkDTjgRk099OHt1gZXM4
X-Gm-Gg: AfdE7ckWjfpdG44pYEXn/ILTxZo0HdvqJ/vjvlwlj4WhOzm7KXBIFuV6rgf1IP/yknr
	S0+NpP5YJWtWyJLq0/CypVuw9W6MhNk8dhotQfeVxkr+zC7+I+O/oB/xBoL2DDOsexSQPtaMbaL
	hJdpXHBz56/FECIazoSzR9tMabg1xsrbnRpwnnOe50qKrsDTduN2d7GLiua9aOyUg06cTAVTJXw
	EGQcLFi/cRwH0qMBqPGjPVdbYV/N8IQOJcuIATDexqp8mgWiBQrEHiXHy/0tz1R3uzydEkovrhp
	NP3d2JK6szgO5J3lvGV6EmjGUxGqC4Z4crcp9+rd/34RTSEj7Q4fAJFSEEnR7eussGDEuGXKKC0
	1Y2jdrg1O21prvEGT
X-Received: by 2002:a17:902:ccc9:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2cf34994dccmr53378715ad.32.1784331723859;
        Fri, 17 Jul 2026 16:42:03 -0700 (PDT)
X-Received: by 2002:a17:902:ccc9:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2cf34994dccmr53378495ad.32.1784331723381;
        Fri, 17 Jul 2026 16:42:03 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347554a2sm19070135ad.73.2026.07.17.16.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:42:03 -0700 (PDT)
Date: Sat, 18 Jul 2026 00:41:57 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org,
        Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Lechner
 <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Siratul Islam <siratul.islam@linux.dev>,
        Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
        Ciprian
 Hegbeli <ciprian.hegbeli@analog.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <20260718004145.079c5262@jic23-huawei>
In-Reply-To: <gnkthebcxlpbwvbo774hap4mphqro4gxho4zemj6p3ixa2qp7g@ncb5o7tw5wf3>
References: <20260715063652.368501-1-stefan.popa@analog.com>
	<20260715063652.368501-3-stefan.popa@analog.com>
	<gnkthebcxlpbwvbo774hap4mphqro4gxho4zemj6p3ixa2qp7g@ncb5o7tw5wf3>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3H-cC7Mv1AqDBK5ldKM9rh_B2-C_eVQn
X-Authority-Analysis: v=2.4 cv=DbYnbPtW c=1 sm=1 tr=0 ts=6a5abdcc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=4aaiC0Uwtqp2U5VG_rAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3H-cC7Mv1AqDBK5ldKM9rh_B2-C_eVQn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDI0MyBTYWx0ZWRfXwkJc6Bb43kSc
 XOdiOuWu6cFyw2jq6NfAVutUz1Pp0edX31K9tkK49CSRQsVrFOcuuP3l9Dk296fwqHWwy7awY0d
 3Xc5Zihri5dwyDoUrmWG8y16Yg+Neqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDI0MyBTYWx0ZWRfXxoHDl+IqxFnT
 jDGG7lwmmRUfvqnh9ymR1qfAi0cN/2i3X2W1ZAHuqi8zW5okpBmNWwS1CuNJ6AQsoqQWWcfhOBr
 C5XIz6zXLJ2S3V5I+2BDWuF+2uuXihgeQaJ5Vc6U2uFx+2CcHbKWZSATGXB+OJH5s6b3wsCOBrZ
 7mjJ1fUtlFw+/j7UFJgmD2SuPtFNA4KAc8CcyviY3oq+YEpmJW5CY3U+zZrRv81KZTwqycnPt01
 7O2VaL5maQQElhasSS/2ukZnjxZVlmAFtDA33A7UKwFIwJX0yQdTEAIAkvbD90gL+Dyi7kYPFeo
 xRkFPU8sUeP6szeBDcfmKJYMaaPYfdSZ8LNncR5Jf0f8p+50mnK4ijG+1xx8tGCqzdSkyOxS2bu
 kkaeBzpzXLa8X+68aQYJ9euM1TTjzCrYOCxwBSKwEV5UsnmkkVmNPL81g7yk7Vt1tUScG40iu9W
 kZhPUC2Y2Os+xck9KZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170243

On Wed, 15 Jul 2026 16:23:11 +0200
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> Hi Stefan,
>=20
> Some comments from me
>=20
> On Wed, Jul 15, 2026 at 09:36:17AM +0300, Stefan Popa wrote:
> > The MAX40080 is a bidirectional current-sense amplifier with an
> > integrated 12-bit ADC and an I2C/SMBus interface. It measures the
> > voltage across an external shunt resistor and the input bus voltage,
> > storing the results in an internal FIFO.
> >=20
> > No existing IIO driver covers this device or a register-compatible part.
> > The closest relatives target different silicon with incompatible regist=
er
> > maps and feature sets: max9611 is a unidirectional high-side sensor wit=
h a
> > die-temperature channel and MUX-selected gain and no FIFO/PEC, while
> > max34408 is an 8-bit multi-channel current monitor. The MAX40080 has a
> > device-specific register map with bidirectional 13-bit current, a 64-en=
try
> > FIFO, PEC, a single-measurement mode triggered by an SMBus Quick Comman=
d,
> > and two selectable input ranges, so it warrants its own driver.
> >=20
> > Add a direct-mode IIO driver exposing the current and voltage channels
> > with raw and scale attributes, a configurable oversampling (digital
> > averaging) ratio, and PEC-protected register access. The two selectable
> > current-sense ranges are exposed through scale/scale_available; the
> > current scale is derived from the shunt-resistor-micro-ohms device-tree
> > property.
> >=20
> > Link: https://www.analog.com/media/en/technical-documentation/data-shee=
ts/MAX40080.pdf
> >=20
> > Co-developed-by: Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> > Signed-off-by: Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> > Signed-off-by: Stefan Popa <stefan.popa@analog.com>

A couple of follow ups even though v4 is on list. =20

That should indicate clearly why you should slow down and let people
get to earlier versions.

Jonathan

> > diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> > new file mode 100644
> > index 0000000000000..a0c1144cfda7c
> > --- /dev/null
> > +++ b/drivers/iio/adc/max40080.c
> > @@ -0,0 +1,630 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * MAX40080 Digital Current-Sense Amplifier driver
> > + *
> > + * Copyright 2026 Analog Devices, Inc.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/i2c.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/math64.h>
> > +#include <linux/module.h> =20
>=20
> Typically I would say you're missing mod_devicetable.h but now we have:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
include/linux/device-id
>=20
> You might need to base your series on linux-next though.

I merged rc2 into the IIO togreg (and so testing as well) branches to resol=
ve
merge conflicts with that series.  Upshot is just don't bother
including mod_devicetable.h in any new code.  Also don't worry
about including any of the linux/device-id headers unless you don't
get them via i2c.h, spi.h etc

>=20
> > +#include <linux/mutex.h>
> > +#include <linux/pm.h>
> > +#include <linux/property.h>
> > +#include <linux/time.h>
> > +static int max40080_read_iv_once(struct max40080_state *st, u32 *iv)
> > +{
> > +	u8 buf[4];
> > +	int ret;
> > +
> > +	ret =3D i2c_smbus_read_i2c_block_data(st->client, MAX40080_REG_IV,
> > +					    sizeof(buf), buf); =20
>=20
> It's not clear to me that i2c will use safe buffer all the time (from a
> quick look). So I would say to make this DMA safe the usual way we do in
> IIO.

I2c always bounces unless you use specific dmasafe functions to indicate
that your particular buffer is DMA safe.

>=20
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret !=3D sizeof(buf))
> > +		return -EIO;
> > +
> > +	*iv =3D get_unaligned_le32(buf);
> > +
> > +	return 0;
> > +}
> > + =20

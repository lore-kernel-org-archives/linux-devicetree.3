Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E8D23EAAD
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784077017; cv=none; b=fl7eQjwT5H8nB8up+38zLMCaToSW8DR41d+eHePfxq2gi26P61MAl29BaNOGk39+dZuy553AiUc2UsGgrUyQk+U1TZN2/g6n4FJ/NH5yAa7A0Jvj5WSjz5xtcBDnIE6ElWAU9PxFAfLmw2e27GEeortmMuWGNdX4xH6leRJ9t4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784077017; c=relaxed/simple;
	bh=mrFYyVQ0KBWMb4CPv5kKuc6l3WHZmVhCNBe1hGaVu2g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLwnjM0oswGvnEqKIegDPnPWwahENxYhGkrugzRXbb8VbAxdsA3L1K0dEHREgRt3W/TgzoTOUyh7gKBnCa66gUHfyuOF9DgjkY0QGbaujATtX13pEvQdUr80RD5xx8Cs3BaHBW1BSgr8pfsBUDe7EFOOgC4nC+3uIw8YmXjggMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx2Qu0NQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOpGNdJL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx2Qu0NQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOpGNdJL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IQbO2171747
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuGYd+nbcS+7wxsqHNc6Na2GrKd6Tt0ThlI3iCDj1V0=; b=hx2Qu0NQQIdIes2z
	5EePa+h7cEDwcR87mO5c2BnhohGJI3uMDUrdtOtXAky378zItWoM7f1+CcxMzrTx
	3ruWDX0cfuTDG4TDgPkteGpJ3aTzxzDtc8zRYSxe35oypRBO1phT5bT/ehBushc/
	9J/vQE6l7M/FHxN6UR61hIqS3vT3IlhLRR250iOqQd0gqBhogfHCiIiV3tSTpimw
	scomkXcGUkv87YfF+Oel3dn2pb6RBUWIyszFmJNM/hSCnrJy36GTs20KA4Wh/4Ao
	L0XsvXTqwGm51xh5bBhryQMD4o7MGXIrXB5RN9q7e4w8UMFYiDux49D2oODOloMo
	IzU6/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtdv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:56:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so1395015ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784077010; x=1784681810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DuGYd+nbcS+7wxsqHNc6Na2GrKd6Tt0ThlI3iCDj1V0=;
        b=eOpGNdJLV46Ozw6ROK3biIrclfZ4cTOe1qy1dIuWVcbR0weuHZlRiEgaQ+0Hxz0L/M
         AVPv2vcejujVNOW+h97M+629ZAfbXDYxq1DdaxRXVHrvBC0MHfg6K0Hgo3GfpS3pN9Mf
         FXUKPVdIwrOR5Y8IOxqixHurCBEiTklf28q8rCEcrYPdwzFUf7gURvUikuFUi8UFIKIV
         L5vYgVafSWaDeBHpSro1BW+F0ScjFZPnI51H9Z59w8DoSpEFxQTJ/4cbpKMTvssZy1/J
         qHZDBSEGs6OGMcF9++I01K/nCsLiw7p9t0AAggcAzseaf0yspxZ/zce3RWKymKptDx4n
         Gmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784077010; x=1784681810;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuGYd+nbcS+7wxsqHNc6Na2GrKd6Tt0ThlI3iCDj1V0=;
        b=ZtCDMvcqwaIpHOJkjlvUKWVnkbTxSec2QC3R9RjuIKvGBxY1+K4rcCmBJ/SqmMeI6M
         AK4cb+FZ+lA6RxuNYSh7qiSe667W1EaKcMQGIyWByqpxnX4z7Kw3rQ55KFK1tAqf+XG8
         lDvK2M3swI4n6B6gCAiBVsTCKhz9cM62rsmKvAoSohcSTPVu8TxQQFP0JtMyj/gqNE+D
         UmBL6Y9af3mcAAW+VjMeIayDAKMfKthId/3P9PV+RQ7pHNi/KnIS5jIMLgYDgUsFV3Zo
         zCg46xNHDzGEyXQOS3dWYB+gOVW2hGFuwbPde1VI19xV+O7wZ5K9sOVK9cp9DIsn++Zi
         73iw==
X-Forwarded-Encrypted: i=1; AHgh+RqPsgr1ch0P6kMQcecSC7AnP8F18udRC2cRQQeSxsulIBQ1KJgpw/JTUFkBbFOngIQmhhqcTxo+FOV2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7d4On8Qfv0Fmn+q+pYiawK+bunCKpfxuxADZZV8rtxV+hIzgV
	Uch8Nk3ezaZsqxUofrDjZae69WIgimHG+wHtEHAIjVZ1q1HU2dUTlInmA0KZ2VixVjeeYcjcyyr
	iuPYpw2v/7AO2zcdGQ5JZznimjE4W/EPQ/Rj7ODcl29hkC/WriQVrwScUISfgd4/B
X-Gm-Gg: AfdE7cmGPoEmm2IaKeeoi+h5EpSYJ/gxitgLLq0WoIsT9ZnhREh0C34CoBvlSFrFHZG
	67mMG5SLa4/qIk7TyrcV+UN2Se0Wend1NeeQa9I+dv2+R9X/VadtTlFgnmlc9GyZfhPkdha2S/Z
	KJkLwQ4t/ByPTgb5d6HimjXtQXjbfVPqS1uI5O60VvEA6p7Qp/Fs5kOJdxEbLSLYmHZn18NaDM+
	q0hD6Lniu0PONJ7CN0GurTuk4xcyVHTh6A6UYIXKRt3b0L8F3fkM1DqUN41vhgxUuRj6t/NcymL
	yLpB2Jb4qdJqWviMhUYZX/7wdE+f3/6Wb1OZy2PUNbVmirZ2KRa0mCQCRi54LhHsXkhQTFs7HUA
	P0TUyXulXsLC0zZG58a7mXx577+tC+dAQSB0V
X-Received: by 2002:a05:6a20:d489:b0:3bd:1cfc:1b9b with SMTP id adf61e73a8af0-3c0f08f8997mr25125529637.10.1784077010210;
        Tue, 14 Jul 2026 17:56:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:d489:b0:3bd:1cfc:1b9b with SMTP id adf61e73a8af0-3c0f08f8997mr25125498637.10.1784077009752;
        Tue, 14 Jul 2026 17:56:49 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm77197449eec.9.2026.07.14.17.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 17:56:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 17:56:45 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jakub =?UTF-8?Q?Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        andy@kernel.org, antoniu.miclaus@analog.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dlechner@baylibre.com,
        duje@dujemihanovic.xyz, jishnu.prakash@oss.qualcomm.com,
        jorge.marques@analog.com, joshua.crofts1@gmail.com, krzk+dt@kernel.org,
        linusw@kernel.org, marcelo.schmitt@analog.com,
        mazziesaccount@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com,
        robh@kernel.org, sakari.ailus@linux.intel.com, wens@kernel.org
Subject: Re: [PATCH v6 1/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
Message-ID: <20260714175645.00003812@oss.qualcomm.com>
In-Reply-To: <CA+gq5JjOV2J87Ycm6bjpa1o=+eKELt6FZBk_KSdEt1zLiQs4MQ@mail.gmail.com>
References: <20260711184414.1013686-1-jakubszczudlo40@gmail.com>
	<20260711184414.1013686-2-jakubszczudlo40@gmail.com>
	<20260713022040.146555b6@jic23-huawei>
	<CA+gq5JjOV2J87Ycm6bjpa1o=+eKELt6FZBk_KSdEt1zLiQs4MQ@mail.gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwNSBTYWx0ZWRfX4HPfZDd10vnZ
 rF1sL/ZWtZishlbrMqMDO7VLZ1giPaRASsT/G18Ui9yQJ/lW2igs44ZEviRAfQk/WcQ/enPMxiu
 2Hn83N8CfnDJs1E/8FOsOoHQ1N3HwZ+pxPQwD930jbuNfRFq2QGdiO9cPi+vFWjcaVv0NeMUiC6
 ARooonoii2UEtMSnflgFGdj4hQE01tMox7OLK57XQDHUuOqHrAgt60xSkjn0NhTDaA7nVTWE+ts
 AqIDrAzApGm5CZgact954xTAduWrbMU87CR99HywA8ZUCzykQLsDb5433PiMPk3SERXVSVzeIUm
 oBcqxHpLtboeTdG22StxU9sTaEzuCYjkVBK8Rf3T3cjgwOUaH/zXiniq4djnpnliMh87M0S8zzx
 bLHCK6jih08AwQiAGzmj2CX6cGhilAsL/zqLL84OMuzieCiA/oJg7xTT2NGqOiT6nWjUYHTBjB/
 vmM6Hq4MTZuNrY1Vc2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwNSBTYWx0ZWRfX7Zap3A6EyKWh
 yf3vYIAfv5oTMM/HRLCoqIewEUQKbPj1ZMv4RFV5TNGLeDQlkb0TOOR/a0b1lb0343eTPs5Bxp0
 HGRm4ahkVrEW4C8YGrcToYKC4cUl2L0=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56dad3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=pGLkceISAAAA:8 a=WLc210Dr34ffwojkXyYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: WWtRMA869OlXAIM_9XiI5nIkkbHUbd2Q
X-Proofpoint-ORIG-GUID: WWtRMA869OlXAIM_9XiI5nIkkbHUbd2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150005

On Mon, 13 Jul 2026 12:53:49 +0200
Jakub Szczud=C5=82o <jakubszczudlo40@gmail.com> wrote:

> > > +     ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(b=
uffer)); =20
> >
> > In theory this can return short (generally reflects a misbehaving devic=
e).
> > =20
> > > +     if (ret < 0) {
> > > +             dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> > > +             return true;
> > > +     } =20
> >
> >         if (ret < sizeof(buffer))
> >                 return -EIO;
> > =20
> I have checked the source code for i2c_master_recv and it should
> return sizeof(buffer)
> or errno code. Also David and Andy in v4 told me to delete such check.

Fair point on it not being needed.  Gah, I get my i2c functions confused.
Only the multi transfer ones can return partial success.

> > > +
> > > +     return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> > > +}
> > > +
> > > +static int ads1100_poll_data_ready(struct ads1100_data *data)
> > > +{
> > > +     int data_rate_Hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MAS=
K, data->config)];
> > > +     /* To be sure we wait 5 times more than data rate */
> > > +     unsigned long wait_time_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, =
5 * data_rate_Hz);
> > > +     bool data_ready;
> > > +     u8 buffer[3];
> > > +     int ret;
> > > +
> > > +     /* To be sure that polled value will have value after config ch=
ange */
> > > +     ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(b=
uffer));
> > > +     if (ret < 0) {
> > > +             dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> > > +             return ret;
> > > +     } =20
> >         if (ret < sizeof(buffer))
> >                 reutrn -EIO; =20
> > > +
> > > +     return readx_poll_timeout(ads1100_new_data_not_ready, data,
> > > +                              data_ready, data_ready !=3D 0, =20
> >
> > Kind of related to David's question: sashiko doesn't like this.
> > https://sashiko.dev/#/patchset/20260711184414.1013686-1-jakubszczudlo40=
%40gmail.com
> > I think I agree with it.  Generally need to check for errors in the pol=
ling
> > routing as well and return those if seen (in data_ready I think at the =
end?)
> > =20
> > > +                              wait_time_us, ADS1100_MAX_DRDY_TIMEOUT=
_US);
> > > +} =20
> > =20
> sure I will update the function to return int instead of bool and
> check for errors
>=20
>=20


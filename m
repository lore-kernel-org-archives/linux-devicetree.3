Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89B313E29
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784414857; cv=none; b=mJSiIyzw/GP8kotBpjscRRwfPpVFyMRDef56YkZ0AsKlxsZDkYsMzCW0asEiClEfcJpyD/35MHQU3BxVu+gDwg7OJXUtH5Zi9yWzYVD3HAqVS34uoTT1is2Tc7H2gt657GguxkSAP/3oRPzej7X1yov2kr5g+lIwVQjFXlmnByw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784414857; c=relaxed/simple;
	bh=pckjIq8Ttd0rTEfVDBMjJ/G2Kb71+I0Uz2D4Kjr9KYU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScwEgYrp2ejJ8PgfqJcs0PArUIzHKCFtq8Eeru4icM74rubm25+riHwCTkKntGgY/qq9e/quJdYYuHW22AkcmymRSu4A8qQo5gP8LZhSPZ5GbGpLNSyyI2vi17ps+/rHnmWW6pYj3aZSbbUYHUYsipbIGN261vPDWrhnWneFkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2bSubJd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThdP1cjD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2bSubJd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThdP1cjD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IJsdAa1776216
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUxBuVxWLmE5joEMYT6ask8WyypP7efysolvlE+mCGE=; b=j2bSubJdrdVuJWnx
	7iFhwM1TgJySrjUC6XlcCHA/KLtJqlS0NBlPL4nDazA2X+kRCfZOWHWv1CR9VZ7w
	R9iA+r3lZf5Ft+Qh2SViWq4POfs2gNjOoC5S0CNWHR9m6Kdctn1XsWNmYIhYJ/nk
	+zPgDCy5j6OVaHKNd//RdZmYEgyLzzA9eUzDsP8uuYMZ2+jA/C8FRoQ0WVhVa+cg
	Rwl3FFuavwY2U+sW3qgexVvlmeo+2wXPiwmpZwEEuxJbVTxvQlljkBu3xSYzbN8O
	iwYytFmGm9ODgsewKsHrovQBIpxl8YFyhIkLX1V31EkzbUMqceVGHYDbKANU4ICI
	0dgwyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d91p7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:47:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84885a4fcabso6579017b3a.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784414855; x=1785019655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUxBuVxWLmE5joEMYT6ask8WyypP7efysolvlE+mCGE=;
        b=ThdP1cjDtabkg6vvyRcZSOKgBLQzGJs+NmVBiM7vV3HawwgN9Eitr8KDOKR1vTkkkf
         fFYzAzN2YL/VfHoziwtMXxQ8Wn0vKpFuIZX7M/JRfnFtzOBta9in9s4eazkXXUKBoRm6
         nJnqiHasTSe5eTn9APfgsdgorTV4g1/ItQ7uloxC4qCnsM0Bq6HyVo83Z2BSiMrgYOft
         pUhPlrhG1e76z2hYHEU2ti8WWLMqiOQZPDGKqG8A38LWwiIcmg7Lgp3c6UHGK4JptLzC
         vYsgsKlGP56LC4m82lUNUg6MNWOv5HEaCTKAaVqTd5LUSskoP/wHDTgcGTyUCpd0pO4d
         LGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784414855; x=1785019655;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUxBuVxWLmE5joEMYT6ask8WyypP7efysolvlE+mCGE=;
        b=lP80gJo4uwa2JINeHohZSQqFLQClXr7QshMzI6BfiBJfpyU83lg1/nId23cZNy9AIu
         9OlW3rHwabLbTMumUJhwyK6iMJ1iTtU9SMepRR3uyqxVCKF2GM+qF0dAYw2YVz0mZYHu
         PYX9Fh3rvRoK91jECOw0kWssl6i9Q+LEFUemtqyyxHpdaC1wy+TT5AZ3KwZA4U+yDrAX
         R4fn+iBiif3qusrgf7Nq0PjU86B0rOT5j08Nzm/aCdvKwXBtpyMZDKXok2cgMeHkE7mW
         s6OYXrBkap4UE64VB+7T+vvi9tuz7XoJ63dS0sBg84W5GiBDvRy1f7qvzhawKsM8T7IX
         l92w==
X-Forwarded-Encrypted: i=1; AHgh+RqFnf995KT7cM4zVjzD4DLIjq3SMdlR3KZG54HhVbXcD7XCie82v9NDDtpILG3ZmNkYyh/n054Knbo8@vger.kernel.org
X-Gm-Message-State: AOJu0YwM91flVyZKsIQYG954HobiDw+hXf0I3KQ5YLQzG/3fultvIDOW
	INco6WGgDXt9RL2cwlswY28xwlkBtEDYB3RHPBDIjec5adXfuuADDT1NfWkC5D57xWyK8NDAYAh
	AvwEoiHOcA1pVLaCL8xA06lf4ZelBp5qb6yG2RgsTbhUlF12JNRThSOrRq/daZQR6P0FNbs9x
X-Gm-Gg: AfdE7ckbkXEXLJSQyBU8tOk7aB8TvDqQktEYfNjeTkKxa6cv0POVrWccK8KeWGbADyL
	wUqEV3I9auQ22Snz+3Y9iHrvXsIvGn7q7NxTeIDE+64x+Sq9IvD2R+SUotDqPIHpOZENe1GC5be
	saFej9Qq6oOpq8eU3C/uSsqImg9sHCKsGU69060BAWOxPpIefhPxQ0fnuynETlY1Yb4msjDHK4A
	LyvsH8cBo8TYFgUIZsEr2tNo9g3F1PJ9tMfU+5aQSv1uOUQZeaQVclml/p1wHwOI0qrDQGA6VZ9
	U81ljxSsVmg2h98g+J2zY3hWBHzzmFrUq50WNftr1WjRHgeZ7xr++XPMZO/fsxm/Ox6qL7aoV/i
	onMro/b3nukdGmtYc
X-Received: by 2002:a05:6a00:1945:b0:847:7a61:e68e with SMTP id d2e1a72fcca58-84c292d2621mr7965894b3a.31.1784414854658;
        Sat, 18 Jul 2026 15:47:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1945:b0:847:7a61:e68e with SMTP id d2e1a72fcca58-84c292d2621mr7965874b3a.31.1784414854197;
        Sat, 18 Jul 2026 15:47:34 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8ffcbsm2526094a12.12.2026.07.18.15.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 15:47:33 -0700 (PDT)
Date: Sat, 18 Jul 2026 23:47:28 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: =?UTF-8?B?UGF3ZcWCIFdpxZtuaWV3c2tp?= <pawel.wis.me@gmail.com>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ak@it-klinger.de, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] iio: proximity: srf04: Add Cytron HC-SR04
 support
Message-ID: <20260718234717.6f361fb9@jic23-huawei>
In-Reply-To: <3fedc827a2581d61bef9ea639ed77cf90e80047a.1784221074.git.pawel.wis.me@gmail.com>
References: <cover.1784221074.git.pawel.wis.me@gmail.com>
	<3fedc827a2581d61bef9ea639ed77cf90e80047a.1784221074.git.pawel.wis.me@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5c0287 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=u0yN2JLCdhNhSCvD-MMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: m1kC7bCBY6fvXr3eRo1PU3Tts3-w9QN0
X-Proofpoint-ORIG-GUID: m1kC7bCBY6fvXr3eRo1PU3Tts3-w9QN0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDIzOSBTYWx0ZWRfXygh2PRZvNSUo
 IgaG0ebS2A5dQpNfHW98xXz+t47k0GfrIzFD25fak5DwGENJQ/anWI8F6MZ5GgI7dEJ9c5iZwgm
 PbpMQtkWnX4bIGiZ/2kwE+lBrVlqxq/+exQi/YCgnuAexoBpBbGJ+TpbaG0OqT/SdTGySbO2/gQ
 BCQOYgClK1uYWtvXP+ztjSNrABqIaifRypkF6rsc064YidiqPnLh5paNkhu2nDd4vbcH0a5wiD0
 2uNz24sv/YPVPFtg+r4FRIqCg3LRX6XnSdH4xpablP9pY8Trkz787zxePstYLnQS7qEWQCpgt+4
 gifMxK7fgtNgTxqrEybTt3fnzdNKB5GT8SgHTEMZgqWF0+IJh6zIFCKxxKxKItukiIv4ML5Aeqb
 U96WI7zKe+iaBeKMnEtuCRAbDuxRRb1BKQWhuwWX2tGvNECjGj55c6r7pw2S3W8WqhKaR3izad1
 xi6XLTKUckV7UYiw+Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDIzOSBTYWx0ZWRfX/UqGyZCBP9Fx
 KmpAQmIQUrZCSo/aWhBkuyJ1xcq3VZ02andm6YG36/VbY9EyC8Gx9WQFV1NwtLgbdjTN6t5K/cQ
 J8J4mdcvtNTtpspKV0TrUnBHyLYWAkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180239

On Thu, 16 Jul 2026 19:35:56 +0200
Pawe=C5=82 Wi=C5=9Bniewski <pawel.wis.me@gmail.com> wrote:

> Tested on a Raspberry Pi 3 Model B+ running
> 6.18.34+rpt-rpi-v8. The sensor was instantiated using only the
> cytron,hc-sr04 compatible, with trigger connected to GPIO17 and echo
> connected to GPIO27 through a 5 V to 3.3 V resistor divider. The
> driver bound to the device, registered an IIO device, and returned
> changing distance readings through in_distance_raw.
>=20
> Assisted-by: ChatGPT:GPT-5.6 Thinking
> Signed-off-by: Pawe=C5=82 Wi=C5=9Bniewski <pawel.wis.me@gmail.com>

This suggests that it is very much suited to a fallback compatible to the
Devantech SRF04 (see comment I made on the binding).

With that in place, we probably don't need a driver change.

Thanks,

Jonathan

> ---
>  drivers/iio/proximity/Kconfig | 1 +
>  drivers/iio/proximity/srf04.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
> index bb77fad2a1b3..89e9d57ceba6 100644
> --- a/drivers/iio/proximity/Kconfig
> +++ b/drivers/iio/proximity/Kconfig
> @@ -139,6 +139,7 @@ config SRF04
>  	  ranger sensor. This driver can be used to measure the distance
>  	  of objects. It is using two GPIOs.
>  	  Actually Supported types are:
> +	  - Cytron HC-SR04
>  	  - Devantech SRF04
>  	  - Maxbotix mb1000
>  	  - Maxbotix mb1010
> diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.c
> index 7be50bdebfcb..f5ee7d6572b5 100644
> --- a/drivers/iio/proximity/srf04.c
> +++ b/drivers/iio/proximity/srf04.c
> @@ -231,6 +231,7 @@ static const struct iio_chan_spec srf04_chan_spec[] =
=3D {
>  };
> =20
>  static const struct of_device_id of_srf04_match[] =3D {
> +	{ .compatible =3D "cytron,hc-sr04", .data =3D &srf04_cfg },
>  	{ .compatible =3D "devantech,srf04", .data =3D &srf04_cfg },
>  	{ .compatible =3D "maxbotix,mb1000", .data =3D &mb_lv_cfg },
>  	{ .compatible =3D "maxbotix,mb1010", .data =3D &mb_lv_cfg },


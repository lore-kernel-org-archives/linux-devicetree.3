Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0734D901
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332217; cv=none; b=FKdbnYBXgISyq5H4gqau7h5Chs/g8pRh/6lA+Y4e3l+Brf19mnWlQEx8xmBhtVCQOynMVQD6HUcR0WFtHjSiJCYiYDI/G/K7C6pZxXjQsty1QBcvS4t/tRhLYbLAZHkxkj1LUFrVA2OK8nHkuDJp4wJ5EN//TYD0JG34egJzsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332217; c=relaxed/simple;
	bh=33V8cq/BGKv37Mhviu9kCfjfR5ZQ8Fj4k7mX7rHq3tk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sijynMjEyHAAgkZB9NQgfgkjIuoaJZ31tFhOZ3FDaCgjDjabTDE8I36ung0dImdwmuEbfRCAPmN1ivq+hwxPn5ez0nIyVNdKmIK6Sz56I2pK/8sfyWNr+ifcyZACXtGNHWbzXfy6v/cTmapPip+YNQ8rlHviK5T+Py+M/0CMTWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuQTKuw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MResrnqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuQTKuw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MResrnqz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEe1g3312742
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GI0G6fviO4/XaaAPhfbl+CsWRkJWwUodGeivNieijC0=; b=SuQTKuw07h04rJYJ
	ktwyjQUzrEJIe/0qj6iOtSEm91BEn6UiSXiQp+s8IA9W+H0Px3JPvONbFzvqJYsZ
	f6R8lp2DTWftf44kIPuPlq8BjGxw81juUmViICmM2Sf/uVfINyrzoCgwn4itoK71
	e/P9jyELR6nOFK5qbVOR8Cm1mTYb0P6iU+BGROjlyG4Dsw2xQWR7uPbuLB14ZLn7
	CEaTBbH7RcQXPGxZHxZfcE/L7qr4UYVos4dtW3oUqiM7IZ7yxnQc3RHxjB4/Kw0O
	QPqdMet6ZNzdCvpdcxZw4Y5pM4GDSjRekA22h31OcXNJnhCihP/PBktYyTMoKDXC
	xvPnSA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfk39w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:50:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848551b54f5so15772330b3a.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784332214; x=1784937014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GI0G6fviO4/XaaAPhfbl+CsWRkJWwUodGeivNieijC0=;
        b=MResrnqzD9c2zHekZu4wjEKMOCcMXYkShAk4G0FShtq52z3Ls4gwIabpe8b1cBOcRt
         m7FtHclAEZmS4IhF0vMKuvJ5x2UR8rQk71a/JcKy06U1slTlUVbK9l4+QaeAYXNrUvVK
         msXgfnamUl7zmrU9vAN9YldOixBf6BX6VtCkt5SgnRdCfp/9N6ENgq3nrUu77Rd3ekQL
         e/m4nnwuN1t5ykawhxRVJHRRHpEL0jaeVakHdUKlCWN9jeWzfbRFmy1N5vomaTcNElUo
         AvNnpy6PaPmyNHQHNKHph6OnCRqbPoiJttHCX9+8HZD0s20KMLk1ii9pB84RRKFj0lIL
         8WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784332214; x=1784937014;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GI0G6fviO4/XaaAPhfbl+CsWRkJWwUodGeivNieijC0=;
        b=ipWWeYUz7bokcl1A/P9MLqhOGrz8/+gFOIv6XLh+xQZetSHX3mJLkm8Ye2tJ0I2nmc
         BfM0tGEXDKEcMQHCD0qxz8iz3o8do+/6TVPAx15ksTmSRKf8IWy2r0PK9dZ3xCAm9Wup
         4ujOHb+X25cm1cVFLal0IV/9Pkg3s19P42irYNLtni2MiRFjBXSftfGVlkzXVbmII22J
         e39KnpKOyLdYJUQniqHZFJNci++4h+eikKdgK8waUCsfayUVXbW4y+Ym2b1pKAf2NN3C
         8ZXaUJKcFj2sJ+JYtCYZYRFtERtXAYdLsz8oRxn4LM3nqzgBrwyOEJJJgNQArw3psvl/
         uIDw==
X-Forwarded-Encrypted: i=1; AHgh+RppU08PNTQrCM4TKb/PVNHJh4lpB1tScm8P/A7jPcgo5DEv1tDaRiOWNO3JGj0ttQhUi8kIc+pVzDnf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl5y+QDgVZr5S5iqDa7g0lPvMmlaMaeS3OezRbkH0yDRzme2ET
	DW6KasDxybUSNS3fBS9gJzyebLIDbtbAF+D+FEexpnkaxKzO6FwKhs9WoaLf73O8fv2RFuI+uFO
	rf7PgKf/ENwrASvbUw1VzTSvkvTQusOqxpFis1dFa8R+6p87bk8VlRSfjBP6l32dx
X-Gm-Gg: AfdE7clAUnUSQfp41zrYpuvVvH2wnRhdqSIb6hW3/zP9YChKJHEZUN0s8dlnPnAEtsx
	cazFFTPe3qUZlcNdvGJ+bO+GTe1cf2t5yyg6GISpmfT+jyuD4xXxuhYsMmFSNWJs3tIttBtj47i
	ZD9DzqDCLA/Bmvp8Fzz8d56q55nBRFnYwcUFvUU9GCrrN6aBPhbGh1OjtulaMqq6aGjC2vc3s74
	Myvs3t4UvJtgmFTDJ+6/95Cr/J6Sk1R5Zj3MHRhwt8WUhltKx7BLwvw9SR9biJ+87LlYuZc+pv5
	bgFGNtJiI2OFZp3Dy7uQQVWjzyuRNKNzZw5tZmRE+14xDsRXVmA661onMUtvbm/c9JGi+M8dQLD
	jZxzlU2G/+z5wzW80
X-Received: by 2002:a05:6a00:a20e:b0:84a:2c46:3fe2 with SMTP id d2e1a72fcca58-84c2948b0ebmr5112961b3a.48.1784332213691;
        Fri, 17 Jul 2026 16:50:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20e:b0:84a:2c46:3fe2 with SMTP id d2e1a72fcca58-84c2948b0ebmr5112942b3a.48.1784332213219;
        Fri, 17 Jul 2026 16:50:13 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3ebsm1837498b3a.46.2026.07.17.16.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:50:12 -0700 (PDT)
Date: Sat, 18 Jul 2026 00:50:08 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Stefan Popa <stefan.popa@analog.com>
Cc: <linux-iio@vger.kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <nuno.sa@analog.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <20260718005008.5d4779c6@jic23-huawei>
In-Reply-To: <20260717123852.1140893-1-stefan.popa@analog.com>
References: <20260717123852.1140893-1-stefan.popa@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDI0NSBTYWx0ZWRfX+vgUsfWeuBTa
 XbKyHBS2GPhRlCYleojhmRxRtAdL9G8ezLjDZdYRaTCeBVeXB2EBO5v7RpgHuqECbcE/G5JCvTx
 02+HDDGzcTxvyDgjEBkSo0D493uLAGkxHpnyj9sj17azlq/hxazglqEQU46oTlvb8rG++Vbhoyn
 vxV2n4fFKXpwS9m4ye5Zd3o3iJxv9z+azYZS8wY6/khlyGA6PKA2ySickz0g/SHvDhSHzMrz15a
 7E84cAf1yaa20hh9kKo0gmeGw5puvKw+NYjWkPxn04oNj9h+yv7+fk9jTO0QAcS5W4uif/EGBZQ
 F+5bJvvqGKXCGywrBVr4dAOHoq2tLxoDqveczSF0jsfyBX7SGQzWCYLrHst70h6nNnwVnphZaNl
 LwRuB1HEuBclW9/xoERWD/n0SvZ+oXBp1SK8kdUaCoLJS7Q5gxWvD0g3+0Q+h1h+r8VhSNR3qYM
 sYGwBwzrXZHurrJocLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDI0NSBTYWx0ZWRfX5Yjt3tW9Doid
 xMnEw3OBCUR07+7WBv0bvRg5ZUrvEtrI8wFXBWZpE1FH6JBCqXkwEfhBfWMvYI6OH11sWeSOjO7
 wPZ2uEyNDc6uuljHy1fdvjX4qLf+5Uk=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5abfb6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gAnH3GRIAAAA:8 a=Uc3r_U0CyWEYo97lCO8A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3rYMHvY9UPEdHLilX1QZvi03OujJ0-8z
X-Proofpoint-ORIG-GUID: 3rYMHvY9UPEdHLilX1QZvi03OujJ0-8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170245

On Fri, 17 Jul 2026 15:38:47 +0300
Stefan Popa <stefan.popa@analog.com> wrote:

> This series adds support for the Maxim MAX40080, a bidirectional
> current-sense amplifier with an integrated 12-bit ADC and an I2C/SMBus
> interface. It measures the voltage across an external shunt resistor and
> the input bus voltage.
> 
> The driver operates in direct (INDIO_DIRECT_MODE) mode. Each raw read
> triggers a single on-demand conversion (SMBus Quick Command) and reads
> back the matched current/voltage pair, so results are always fresh. It
> exposes the current and voltage channels with raw and scale attributes,
> a configurable oversampling (digital averaging) ratio, and PEC-protected
> register access. The two selectable current-sense ranges are exposed
> through scale/scale_available; the current scale is derived from the
> shunt-resistor-micro-ohms device-tree property.
> 
> Tested on hardware with four MAX40080 devices on an I2C bus.
> 
> Regarding regmap: it does not support SMBus PEC or Quick Command, both of
> which are required by this device. The mlx90614 driver uses the same raw
> i2c_smbus approach for similar reasons.

Why IIO rather than hwmon for this driver?  For any part that is involved
in monitoring I'd expect some text on what features etc need IIO.  This
will sample quickly but if you only intend to ever do DIRECT_MODE that
isn't being used.  Also you'd need to support i2c modes above the standard
400kHz one.  If it is remote borderline also +CC Guenter and linux-hwmon

Thanks

Jonathan

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CA313539
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497439; cv=none; b=MHm4kWhmdkxb2K1gWHbsfI9W5jdgH6YEQX6Cwq95CEz/0Ofs5G2Du0XJfSRM/z1gxpWv/nzT2wfg/dJEj1P62ZzhDduTDBrPne3Gcd0civ7GTpjwnj/gga8SWRJa4QPDqkT/Je/1Ft/3EXV9whLaDwk4KwBKxiYvQYg0X6FPHeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497439; c=relaxed/simple;
	bh=24Jq8jtvvNJ1q8WYV8dDG0Q4/VRFa7bxdszF2UUCwzE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eL68++UvZ1sK5PRhqFmOkZsMX7FNHujJCAL/rdfkGbs/qsuDOXsZzZCh5V5I3z4zJ9M1/Jh7ZJbByClHp6X888mGwjf/hxI7ZSsb47bnXBgkvAzSYKke+86oFPjWP28BaMINyZsDr/uSeACq6gEw0xJLqB3Wu48wvBpgfyEbveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk0UNqyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3jN3vXK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk0UNqyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3jN3vXK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKQlDG513733
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 21:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xz9vn9jbKAN5VIgfGuTHDQTWGSX34z5WNTsanpBwUg0=; b=Mk0UNqyMTGXVg1MD
	FHHoMpqtWtW7UkIt7ktgqMlvyvhJ4JyxiMVh0qpV5HGmF08GgNTdMs8Y/Juhr7bj
	6jEjT2BybH/2UUif53H19e8gZQu6YIT8oiwRBiWJiWBqmJ2pBjcG+h/0pxTCnm+h
	m+ZoYfRs8cxOS4fl6Mi6raCGls0QCYE6F8Oq3MCIfNsbGm2QDA636CrbdG9aG9H9
	ILrGcesrQXFh8SDoJ+ekZ5JGhd4TAbp52VmOQOlqAmF0u6tum103fAIO27yD+iJi
	eFfjbJRXznrlYYRyx4cUczcwZRfP00xRG8nYrPwBwF/PPjwQrG8wMCdHKGblLR0t
	bHX/5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6bhmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 21:43:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca3673560so171119625ad.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784497436; x=1785102236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xz9vn9jbKAN5VIgfGuTHDQTWGSX34z5WNTsanpBwUg0=;
        b=Y3jN3vXKS1tdtRk89e/OeFUNp4quE3dTuVsqOU4IZaONCmhO37r2btsYrUvi9wrnUr
         SoE2gL3YUn7Up4ZrwFw/X7hUe++e39E8UCXXz/3bf5gZ1wzrTH3iXhbPqDdU8OO5MgpS
         HPjHHxKfYeQBcpxzk88o36lihm7le0CsC5OV5QenAgjM+ThpfPSoKDz0bdYC4Cn8p6F3
         CbHGMWjEEmt9vsspgHtIgIgWQz75ls/Cz4G+pJxeb1+yDLCIeEjtwgxxA3RvW7pkp5Uz
         JEQ4i7JjQgE4UowGpvMggvohp2lG0j69lkb681HvGgI7bl7klpntERMJYFPpW8LEZQsb
         Yd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497436; x=1785102236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xz9vn9jbKAN5VIgfGuTHDQTWGSX34z5WNTsanpBwUg0=;
        b=Ua/K577Ei8GT1qxTAmn3e1RLJcd6GYLqNZBZ1MAf15SwFV4LuM+sTrtoMEyko9MOxE
         8/RagjMYI5HJw2RxP9Id0rnuxqtuQDJvuF4MxrkDD6F/HM9A3nzVM5+MSU+fjri4CBrp
         tVaVIrf1BmbXjnvGmz0Khan2XF9SwgMD8HvjSjyzjdrOo09q65IACZdoR/kOZenInkL0
         9JSuXXvixWmnTg5w8yEOEBqI4PpWkRy2styoSkf9ncfermyxkgmb6sa/y8aocH3AH9GE
         Vh5hV7V+iiylPJxUJcq1K5x6GhFwmVt5NyLtTdS6e0jp+sHmArko3qTgFasy3+VRZYnj
         ULeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkudqfMYi6WauCNIkYZKMWvZ9B1smzB2pcq1xs9qILbeyTGC/HvIZLf1R+Yz9l8VWXm7wE/61cG3h8@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfzkTmb7d5vdx4kYMJxLjjm3WslxL+4jFqi4KPPAVGuzMnLbo
	SLD0DAkcjXK693Y7o1FPh4S3xUP9mletZMAU+PNvcCKhpwWiICAGNsnzmZ6kaanuFiVPtlbcR3O
	MBOX202ld/oJwrZapRtCzmpkFsojqb/fv3snaSzYQy2P2apqFRWTt/o2z+YxFsUnE
X-Gm-Gg: AfdE7ckRhDjnu0kBG7nrKuQOY454WmdKcdOIdqOcuCOsncMNZr/I3srnhVngqjRY7Kq
	xFyJIegftFddLsk0UD5Nzq/Fax0dqU6BgBFvpMxnZKSPwV6UNzqpmHQfy1b2I1HIX/e2egKcpWQ
	VMpIeFn5aSUBAmcMqZ8k9sghy7TnwD/hY+Uyp3mc0szi2Mv/od/vX2D+/7tnDEIfaliCIQ0Lq7c
	qN/aOTQ5Vb0CN/557+R8OdtCgsf4OCuULjtQIbWJW3kQu1L+R7U/iL5e0Dldpfb/pr6rKQ4uoHw
	S9KjIAJzcMCOs+m+X/lYPrl8Bxf+FOgLAHw/E02peEcwVSHZW/MfR7Wj1i1YpKVun4KQoDaCpUc
	4bjHA3GmbOE88XfrP
X-Received: by 2002:a17:902:d2d2:b0:2cc:fd6c:c5c9 with SMTP id d9443c01a7336-2cf348961ecmr134067305ad.4.1784497435885;
        Sun, 19 Jul 2026 14:43:55 -0700 (PDT)
X-Received: by 2002:a17:902:d2d2:b0:2cc:fd6c:c5c9 with SMTP id d9443c01a7336-2cf348961ecmr134067125ad.4.1784497435497;
        Sun, 19 Jul 2026 14:43:55 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf345110besm45330985ad.36.2026.07.19.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:43:55 -0700 (PDT)
Date: Sun, 19 Jul 2026 22:43:51 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
        linux@analog.com, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        David Lechner <dlechner@baylibre.com>,
        Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 3/4] iio: dac: ad5686: extend device support with new
 parts
Message-ID: <20260719224351.1af8aef9@jic23-huawei>
In-Reply-To: <20260719-ad5686-extend-dev-support-v1-3-841ec75cf5d8@analog.com>
References: <20260719-ad5686-extend-dev-support-v1-0-841ec75cf5d8@analog.com>
	<20260719-ad5686-extend-dev-support-v1-3-841ec75cf5d8@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oxE-QasFSxYsZuekO8vVpNdfrT1NEeKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI0MyBTYWx0ZWRfXy1DNxUEbu7E+
 icZPXOtc5Uxgk2mJtXfuQb0VCtdPQxeJ1luLu3kIe/6kuCi6gycrcil0VW0aAC+0c9xpj4VzjOa
 NrK3jS0gmXXI2h/9KjKBKiNEyY6dgXssTgdTYGOAAFZ7ZZY4FjzrhoDZ2+x+xWB0ONaONLkgJdd
 acnCVSVF5L8mO62rAlnAog3HaClzqIZPp2EngceuWzD4FnVIL9q62unAvsJrPRBNJhfif0YwC7A
 7ESnYYCz/QCZKLvWOGR6IxAsq+m5CPzBLWU237RKqSShwKSW7KgKSJKjzoM/xJmaxJc4xDGterP
 A1eO0KYM+tGPt8hJxN6sGo24xKQHwuT8oPhdyiBGrPEFSCaYYEliKHycyCHcsgycxP+nbuBAOhT
 t0H4J4ukHNwWjWGiaVIFgWKqO6brpD18mwDDqj3XE47qNj9Cg9P1sLJ1cJCsyTkJgqD1KbDq8n5
 n+K0dvWwZ4AOAiUCapw==
X-Proofpoint-ORIG-GUID: oxE-QasFSxYsZuekO8vVpNdfrT1NEeKX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI0MyBTYWx0ZWRfX7hCEhY7eVwP5
 hrB67vOwafS2FBxPW2+uO59ttUPwFBoQ7zh1qYN2nz6k19pBXBitMjL5u7vOOygLwp2aVbPFi4b
 aHu8OJPtLu3BJ1VI/ZcKGLtZR+YLmF0=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5d451c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=2QJMpc5pe7ryNfTMuFQA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190243

On Sun, 19 Jul 2026 10:51:59 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add support for AD5313R, AD5317R, AD5674, AD5679, AD5687, AD5687R, AD5689,
> AD5689R to the AD5686 SPI driver. Also adding support for AD5316R, AD5675,
> AD5697R to the AD5696 I2C driver. AD5673R and AD5677R were missing from
> the of_match table.

Given I'm asking for a v2 anyway, please break out the missing of_match
table entries as a precursor.

> This includes the creation of seven chip info struct
> instances and reuse of existing ones.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
Thanks,

Jonathan


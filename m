Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1642D1DFFD
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784425927; cv=none; b=OZii6K6hwCiOaaRycf04Et3RRbBF/yKOaNQ04I/ygadMfiwofoILihBIcsuFSL/Tl1bNSrTrl266G3WyNwUqs/gPdkoZNdjZT2N/0tzAyFq/XUwXQk+cT5kUJHhUBAu6JDNkFVKPiy911L1pUW8lM1dutgazjgS3qxbx/B/vgxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784425927; c=relaxed/simple;
	bh=nQ0dx7z7VhqUX/xVZcJ7Oi8onwuylpkvTqsDeOO4N6w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dM3Npfkq6TZOjxS1ossKvzakMxl6mtSaWRasTpXRFoyRBfu+7EkS61q7Or6RqGZC2bodmkwAq2ljRLEbiKHZR2uKshh2G1iGX8zKm+5FmFFbSScogVlrgm1RUP6X3NVGkuM79r4kbnx9qNUQLUaLnhvIX540Xxst/3qDtafFeiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwVJvnaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZBG3u1W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwVJvnaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZBG3u1W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN26Mb1780781
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2ykhDO9D2xyYesZwOG2ikM2DWqpI4oz9KN9zr7iQ/k=; b=dwVJvnaJi4OO7626
	2dYrzPGBK7itoc6C+wAYB24hxf3vT7T6971WKpFKZJP8112gqrPxvmZp8k56qIpb
	ZNKURJ5uE2HdUBj6bFNnXd0vALGw3Xz+JVkVHL6236pNPhjSTBMeYusTDSZdOKVH
	vEgoyM+CUXT4JW/ZeyoYYOblx0YgyFsRe0dsNT/FHVHVI1vcoj2dWqxJEJa0CDev
	mLAPd43RANQ/LxWHFEYOBMW83q4zNG9KRCtgAkaMEZis/ujeldvcO49ljbyO6jUj
	WOBzaa7Q9hWnF+naUeHDQyhLi9oZvobOuhOnakzhOtj93PeU3F3K9HIrazKDY0x8
	6y2lUA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvswax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:52:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so5189297a91.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 18:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784425925; x=1785030725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m2ykhDO9D2xyYesZwOG2ikM2DWqpI4oz9KN9zr7iQ/k=;
        b=kZBG3u1WEbrE9AvIPgfCoVCBTPq208bxe7EiemxsNvPwStfnwvjjAwmxihFvxaMxlx
         /rpH7ibM95z/c0lq7389HA2mpFehhQEkiciM3cSMalhSnZ8tcub+l3QLtd1llNgXGs/E
         AozTO4/n/lt4zozvm4xC3Jv99kbNk9ps1TwaZCrs0AydsvxTWeV8/6uJri4eoIfz8nrP
         SXYzs9w9CP4iuTEhvaXy3lMcS8+49gTbm7p8WQ5WbjlH8WQLTtdpYyB6bshIJ/VUc52M
         8vK16j3zCvQB085dk2Ro4/GW2PVnHj3kt+Mw4l6A+dx1vSZwSWLgHESoBzwnGrhVVraN
         laZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784425925; x=1785030725;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2ykhDO9D2xyYesZwOG2ikM2DWqpI4oz9KN9zr7iQ/k=;
        b=AuzI7G3DEM6Pmc1bn2yF5W9vMZhfSsvicZy4DfjkSSCjSt8p57MazDwRl+BIAD5++j
         NopN54jJbEDoNuFW66xZtMUo4bbNxbFoE7pDBCtgTy7WE7bDyA0CCOfvS74ytsEzKH+5
         O3gO3A10dk/6GUuMNq25RKYAFp4iKfklJSmE+CosXkioXuigfKZQ7diUEZwJ17NTPuuv
         QdA857MQCwzcauXYhn3kdiToBfVzzbGYFkHU4fUQW0Op0IW43nwV+EcLRPISHUq1LZ0m
         aTYFHmmCcdSzsFkK7XiK/dHJdmrSP3kOE4vlMdrL3OH+MZsOQ/D38S+3SjdLYPrJNFBd
         zsxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtQ48S0hFdxM3Y4Ke6txYBxhZLGZomhFYZ/RPGX5KOroTLzC5GcTIEHlPr+lXFJfCSWFJYaG+e++GF@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTz/+I1ebTMPf2UObFxfyKjjlpVFxAmThhQXENFbYwIEMcjR/
	KPwSscsbysxKGVISZ6X7BCzlzrSPKF7ZevM87exgksLZBMwrxTA0k0FvjPCcPv/pKeHmj9mjTam
	tBHgCn1GUt14lRE/kbrnpc+0G+I79+NsrrgEkrkB/KWpILDJkAlHU26/n9l3ia/fp
X-Gm-Gg: AfdE7cllV5Plq4veFSDGKPCASrP8dt+Nhby98+90UTdfQPmRJ8wlsJSEStzQYnNZ+1z
	OiyDWZuAHnckFIhNKm65mEgtjlTjWg6hBNRlWCe92hKz/hKm9ulT4xN7010FQaJB2GFkKnctlkw
	Xny/YEHbi99oV2ZcU3Z17xYvSN7dOeLz7GgUxhB8WAADqs4+ETCO7X4WauZbcC2o1QVbXE5MMec
	eSProa23Cdnj2GiQKhMByOPDzEPaWJqTkQQpY1+TaY9QAbDrqFbH7cGS0v6oQimQ3kbZD8FEn0m
	qLeGmnvCaPLyo9PkxElcQUw7apOx7tMYULSnzdSixsH7+DtZ94ifpO5Z2ktwWITxo4YHwjW8lwX
	3XC92S+QmWTmoW6/g
X-Received: by 2002:a17:90b:17cf:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-38e4b4113d6mr8983431a91.11.1784425924607;
        Sat, 18 Jul 2026 18:52:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17cf:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-38e4b4113d6mr8983409a91.11.1784425924150;
        Sat, 18 Jul 2026 18:52:04 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a119c56sm5544147a91.16.2026.07.18.18.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 18:52:03 -0700 (PDT)
Date: Sun, 19 Jul 2026 02:51:58 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Esben Haabendal <esben@geanix.com>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Nikita Travkin <nikita@trvn.ru>,
        Maslov Dmitry
 <maslovdmitry@seeed.cc>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: light: ltr501: Power down chip if request
 irq fails
Message-ID: <20260719025158.1e4246c6@jic23-huawei>
In-Reply-To: <20260715-liteon-ltr329-v2-4-d18af55edab5@geanix.com>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
	<20260715-liteon-ltr329-v2-4-d18af55edab5@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -sA5J66GflPskIxCo4I6UmH7E9EgA4yk
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5c2dc5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ilKATfAMAAAA:8 a=K3nnHmk2jewTcsKXIS4A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=73awMTU50e6eLoBjGbzZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxNiBTYWx0ZWRfX+KibaZ3JjCIA
 FrLSE4EAbD9C87vhsQW+umAuCLoR0qvxqumcu6ldLmrawYj1wyB//duRkyYuYMvh8eL12h43Yx0
 hwQrTAjfWR/I91R8tM2gK+5ERJqdF+lon/QoV6xkEeWOaQ2HlUnAoxD4rX/8Zgqfu7alnR56ODh
 HEzY28/nsfmhvHA00wy9ZNOkBY4GzrYKMnLbnQepSJSnLNn8AoAvFvyaATSlNuwXYJ9a1KVeq2/
 uPgEKYYzeborI4Gf3k87mCOjsYPVvs2xCnka4hE96P6wxHSbTcH/6MjeYZ1u/1++vvG1g72G15e
 /+Jis2DlCEqK5odkCz2u+rhOT8Zp5dCclIBSb1NE7T/yUh/mRzEAkw1M5fauiFqobBo3YPNXzDX
 m9ozWT+z928VuetVH6fXs/QtZjcrLgTDkdtpUivlbiZQdBb52GmsZDZI8F/HKEEnGqbX9nQB766
 oYj1r0flVo/KNJ7EPLA==
X-Proofpoint-ORIG-GUID: -sA5J66GflPskIxCo4I6UmH7E9EgA4yk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxNiBTYWx0ZWRfX1wktyjN3ap91
 sSLbnlKWlEHtpKmbDekGkc5USVwMsLpGG+kEugr2ovQ/3n/KZRB5L374AfbLoviVXtFRnA18qZR
 QRTDNLd5OxPRGkVm9SG2J/1PX0MJvHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190016

On Wed, 15 Jul 2026 14:27:26 +0200
Esben Haabendal <esben@geanix.com> wrote:

> In case request irq failed, we were leaving the chip powered instead of
> powering it down again.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/light/ltr501.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 379e57ac5f5b..9d4de798e5ab 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -1571,7 +1571,7 @@ static int ltr501_probe(struct i2c_client *client)
>  		if (ret) {
>  			dev_err(&client->dev, "request irq (%d) failed\n",
>  				client->irq);
> -			return ret;
> +			goto powerdown_on_error;

A goto after a devm call rings ordering alarm bells.  The two calls will
be reverse of expected order (error handling generally reverse order of
setup).

Instead of doing this, register an extra callback with devm_add_action_or_reset()
for the power down.  That will do for the fix, then if you have time
convert remaining two calls to devm as well in a follow up patch.

Jonathan

>  		}
>  	} else {
>  		indio_dev->info = data->chip_info->info_no_irq;
> 


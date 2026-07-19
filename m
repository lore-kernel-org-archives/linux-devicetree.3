Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D06314D18
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784503109; cv=none; b=dckosvvQyxAy1HxZ6nqLVnmpY+QYHCDcgDWjZysd8CJYESUgujfkAJM4VlAzKtX/UdKn8fTNQLCHM5bMgye5YzADM74SPsfO0O1xviq/aF4jqAu3fOPNvS8NTHGJW+Cuv3PnWrOor9LexhS/H5NGF3jykth+qX/MA+Nw/zur5ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784503109; c=relaxed/simple;
	bh=jlZxa9vZboy0BksuXXTUMp6z/9XDE8IsRqB0EXK49kY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOc0uTs1A+yLQWj7stgwBJY8grv0pjPW0GkagllKxGripzFkxwujWKOStc8qKNLJGQ9E62/qFkT9VODjTcIZISprO8Jyjgw+IUiRk7FTek1cND0ooZnMvX/PaTSDtV2jmpMbNdhKRPyi7nwjnM0CXmJ3QBFsoeSvKfiCCHg3J9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgolratY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7tKP5RO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgolratY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7tKP5RO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKQfWk595084
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgeRlMIF4PNYTV0QauQI/hB2VqHL/8Zkn/RtkXBaTMg=; b=KgolratYUAK77z96
	n5xkG1LD+sx9M/Zvq/tQ/vBSEdK7DouV3O5Qdx9p/TcYcbCL3XkOkjXhX2Zi5bdk
	sBtTC/EqpBPF52YXaGfGxV/fRFDWeZsVltexUcszFKATp1HGJ7Hrhgo/glXU+pwh
	eChgy41J/GwxawyCXyHUaMREE5TDx70XxPMwDrWH7g66qg3GxrCwi6gLOP6QLNrq
	D1A2KkqcdOhZ5np75TokYY1gM+p0x2qWP8agpIxwoR4PJoa9i0PzeEFXnyPGf2Od
	F7dSpujuPsiRUHL5s/WeOhpzpy5JwGfolXYx2o9TNb3Iq40OkSPwjGb4w+24bWCT
	m98Zkg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d93n0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:18:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848452dd146so13907734b3a.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784503106; x=1785107906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QgeRlMIF4PNYTV0QauQI/hB2VqHL/8Zkn/RtkXBaTMg=;
        b=P7tKP5ROBzVk0lcdHTo9OjK/yAF0IppABWuGLLw7uDvBctUqHVzfRcwaxiwFYq8zlU
         YMg6L4ER/5dDQ7O5ZYFGshOCvpO81/7D54O5RrjN66jBpUqTsfpx8Qk9GD/qqi5n8Deg
         B/yoYIxu8sfYPgyN3+7EHxbaSeFNQHBD/5DR15GNGNdL2AlOaaRogE/y8Ku21Kp87NHG
         h338hOjXKmT8qiC+dshqMG6dhjIh8LgB6p8sxoyP3jts72CgtjsP2JHsVqariLFS2WVK
         tJG9gEessXopenAFjcy01hbCxDue3Con2lvjHprxNpnN0OUTOaMnMu+ozzlUbORxNT9z
         AGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784503106; x=1785107906;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgeRlMIF4PNYTV0QauQI/hB2VqHL/8Zkn/RtkXBaTMg=;
        b=q2p/dHRMudQqD7Jb79eDcfsB1m/2w/JP/VITSCxI4hhqW4QKu781OtD52TKzbYGd/L
         1eg7i//RZgi6zhdozJlKU9rc/hE/yMiUO7sbozVaRmN3ah9eHDMpP/N+KeyA5esvYDXO
         /Jam17TEx1d2nJ8JiGR8CLrxMwB3VK1RXAnKYxAQyJJceGgqNebyzNlRXzAQQ63b8hgp
         XGsf02fsYyRovlb/guXAKvlKrqn3QYaorqPXVwW/4vlq33HbgTHdp+ThWnC5lmqwNw2a
         WM8NoiPgNhNY9j3WEiYmRFOJwRKbucYW+bmbZ+T4vNK5mw77vTzrPQ0BLzgjfI2ps0sZ
         EAxg==
X-Forwarded-Encrypted: i=1; AHgh+RrmSiqt7+uUbevSqbHj1iX8wp5yBi0LDgRXKzJnZAeF+dGC1wrl00pm8ecmSLDiZlNMwPC3qLAOqhjx@vger.kernel.org
X-Gm-Message-State: AOJu0YwpMQ5To60WFtYplwa3o3zWqzXeDneJ3VEu7zOt4bmOIirBtFfM
	ZUUsn1fxxokzp8/K3+VlTfIS3XxIGYS8D5zLhX9es4dPZL6QmIC1icjaztu49PhYGpanSTvyqk4
	7ZtAWUSlNiMHp7dtGoYbezhwIn9JEepEEjQqR6s0KwLYayOOFw2GegBcVZOjBZvS6
X-Gm-Gg: AfdE7cmrzxTEZ23qp+6eeYXPEBaNoXHzXWoRNDLPRZRuieOh0WDPvmVmv5wQiE55Ru0
	eh556s8Nf99vGkxeVbMf2YDDEAGch2Cotr1gttl+xf+Ywy6sn2vxrYdBI5vgTkjI1hrBCs5qT2w
	JNk00mamTdE2m7+Xc5STPWucGiPNLoAvV6yKfLLDpA/WbH/mQsFHSPSfY05QcwcKOPNC0rCS/MQ
	uwbpIQx5YAXQUq1eDK9xklzPVABOGfYKgX/Iq1baXcoQmmXFG6avyRSwya3QuNk90+g9IHSIVdp
	VB/5oKjayLV7MBJX0X0zDuGtBLgdyoHVFGYxIqFVAtWsmb1ognbOKUInfvrTbZcLzGil63g4g8m
	ELmVaP09GerNifESl
X-Received: by 2002:a05:6a00:228b:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-84c29272e4amr12634560b3a.3.1784503106319;
        Sun, 19 Jul 2026 16:18:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:228b:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-84c29272e4amr12634541b3a.3.1784503105842;
        Sun, 19 Jul 2026 16:18:25 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519ae8684sm3634095a12.17.2026.07.19.16.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 16:18:25 -0700 (PDT)
Date: Mon, 20 Jul 2026 00:18:20 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chris Hall
 <c-hall@ti.com>,
        Patrick Edwards <pedwards@ti.com>, Kurt Borja
 <kuurtb@gmail.com>,
        Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] iio: adc: ti-ads112c14: add measurement channel
 support
Message-ID: <20260720001808.63d576af@jic23-huawei>
In-Reply-To: <20260714-iio-adc-ti-ads122c14-v4-8-25f8e3084485@baylibre.com>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
	<20260714-iio-adc-ti-ads122c14-v4-8-25f8e3084485@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5d5b43 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=IpJZQVW2AAAA:8 a=KzLlk2TKFSg7Zc6CKOQA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: ypUKwt8YG0XpFmq72YGOaSyvZZbNn1QO
X-Proofpoint-ORIG-GUID: ypUKwt8YG0XpFmq72YGOaSyvZZbNn1QO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI2MSBTYWx0ZWRfX4XBQCiFD1F5B
 hSer2HAl7lAjf9HrqqDFpN9q2R13BLbezqDvEEcioV6TcK+jVmMDzICg6BItxnbIUfaUW2YnOI5
 TTMeTA+1psVTeW2if5pcwo/Ut0QZzHjKObmblLvICE1muHB2HtSndmIzYWfDKh5nlvi9lmmyK2i
 dL2AZFY8/1NpsQUnZjlMkvJgVSTRuIqbLKwefnedT2n+Gu0YLgdL+j62CMnojXqiWk9vWUMvlWE
 LgIbwBJWm7LoVylSB6U83twI4z2MX8/2EsMACHUvzxuU8sGWVO9enFrN0B0xbxbue/QjXBcbrw3
 ZPCZEw0HHXBeCLYDpCrYDEuuCIpLaGBtyzv/xfSdwkcni8H0C8iXklHtoJ+EwUnV+UYR+i6th5s
 1Zar4BNdUMw+WGyJiaTjeLMzhoE4Iom0BFJwVJ3mqMWBg3ubVKOEpkfMVBWpzWDmcIVH4Wq+KW4
 WsHXWifkq0f0KUzynJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI2MSBTYWx0ZWRfX+niDXLcvnvva
 oLAPIMnjUacG2EkG1mlLYP2MAfyFsD20JGGXk3Xf/Higsfs1rgy/BPcE2OAxVZllxf69abKFpYN
 n3B25pYH2AFE8SkXmwVC3RAj2W/FEVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190261

On Tue, 14 Jul 2026 18:21:30 -0500
"David Lechner (TI)" <dlechner@baylibre.com> wrote:

> Add support for parsing devicetree properties for measurement channels
> and doing direct reads on these.
> 
> There are quite a lot of conditions that have to be met for each
> measurement to be made, so quite a bit of state and algorithms are
> required to handle it.
> 
> Channels are created dynamically since the number of possibilities is
> unreasonably large.
> 
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>

Huh. Sashiko had a field day on this one.  Other than the earlier
mentioned 'maybe' case of the i2c_smbus stuff returning short, I'm not
seeing any of the ones I looked at being true. I particular enjoyed the
hold statement that something didn't fit in a 3 bit field.  True, but
the field is 4 bits and there it does fit.

https://sashiko.dev/#/patchset/20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485%40baylibre.com

To me this all looks good.

Thanks

Jonathan


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4737930C17B
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784412337; cv=none; b=LfeWoV5EpMVqYPBqn9oCxZOTzmaXiOaPk4ZFZDYTYZPPN7SxcUDqy6e/8kj3TCHaMOOs0zohHSX5+4ywQ+4vCr6AkuOsMkbwj8NHC1mZ5agJGRmaulwf1CLX6YWyOgvN+3ermJG66h7PPef460yEujfemAv/Yol+741NXvfPdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784412337; c=relaxed/simple;
	bh=tpzh3sR7KQ3eoLTT8X6+G8GmKjP7P6coG5sSfKU4oGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZ5Y2OL0jW03KNUCQ4xllIA6pHmaUXFiIDg4wTaDJS+7km4mtxrBjwHdSzFRBSgzWk0rffWbzjYFzg6XGTON1IXwoAJuLJnWVLO2OnhCfhcNmKz4XYCL4AxFrsom7xUGyulnlL9NkYijAwE6TYDAxhuC8j+NGhESiXtRxIPXhGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDgOtrZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9xOtc+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDgOtrZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9xOtc+w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IJpmka1686997
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JalgrbbBIYkxGVvXSMno2dZ9hgEHgXLXu2M+8ScgSwA=; b=NDgOtrZ0O29QbV8Y
	xb84OrhH6qX7EI+omUBVo1uSZanzfPtz4uPQ4PlOj/qeLbhYLE8VJTPCEQWidZHK
	2Cjw7bwlUJbfzMsSy+9yCRglUulpIh6lEEDDlUgeNHEZi9taaVGxKJyvFj/ZqTcm
	6DpxKE08gRnaSD1nn1xfUI8rT102IGQdBcoGnlvIV0s4kIkAW2j6p86fJF+2+HZ2
	dkUGmvFzd4jY5PCWchM5Mi6MoEBVVnOE8sUhlOyhjfsWn+E5XJqVM7ZeUwpQX7fS
	HzgarpRhWsJNA+sJSQewRJxnJIx/f53TTtzXXb5CweSFZwFs1BCbpKl1H159dkn0
	TRE3UQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c69nhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:05:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so13073793a91.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 15:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784412334; x=1785017134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JalgrbbBIYkxGVvXSMno2dZ9hgEHgXLXu2M+8ScgSwA=;
        b=C9xOtc+w2uozhogKd5sHW/gMhwsnsYvuuUdXcG5lhClDs/xBF9GwV7n4+zoKSGY3aT
         3VSl725N7bfIWYEhTc1+1UYeG9qxjvAJpeWBqbFHx0hkC1XJyb+dTb7scA29LrfXG6En
         wkCl63pmi/prPPMvsFhuQByn08Q37h3IDHOMfde4yOIXAJxMv17M1jV98uv3oOF2JdzA
         2PkwBzqeSRJuTVFSy6rEOQ4uk8fVCHLGqlA8mYOZieVYI/yzqs4HtjkE7Nhsj6hCmMSn
         H4myxajeiYk8P2aQd2y0XKcKTClbU1eSAeXoSotdDhm8HQA2+mOavxRd3vm2H+NxxGYg
         0AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784412334; x=1785017134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JalgrbbBIYkxGVvXSMno2dZ9hgEHgXLXu2M+8ScgSwA=;
        b=JmD3Q2jSDkxYBd7My9H9S78iQD0xuyby9/1UnS6KRUrKfrbxzMb1wPKgNHHUfJO+gS
         zRXmTNwMfh50c/PUPUtXCqpn/esWqCbHchT4jejUkumQvr/UHqmg6i/cNpx1ibDBg9Ky
         NkHja/UeQGeKHMKiXWvEWdJAqO+hR4JQDI4PpehQ02FC/XgsJsq0NrgcgGyBNfnIKLbn
         kXmFQ1sndi/6TiUIxmneUYkgwmzo2nqadZdX4uh3EKzjYxyu67hMhRhgqkcj14wGTZHI
         wEIAfdmFlqbGZTyiuUwuo62FInCn+CaVp7gfvbdSq08eqfcxVzK3gI5yFNHb1AYJXDYV
         dfwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGdTWhh/a2SWy15TnFGMGzjINN/gxdXnLbXyGGSXE8TderYc93p9b9j1ukUrnsxnPX1Ufd+8gkjme2@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQKOIcuVozZksQDdehrRcA/EC6UPJHmqnUZtb25Z+ZVUQ3gxh
	ZGVi2/TRMqeHbmn0HHOWouED6TWrpFiciM+JevCiFoU8jjA7dRqCBr+DDuHKnHkOYfD2LfvcA03
	Yz5ICykW3FOhnsad+3xRtdUbNWTVWX6dBoK7hAqHZIDBI28ocuHbLVl14TU+Xj9b0
X-Gm-Gg: AfdE7cmVhEi+GgXG7zktoVovIULiMzO8OZ2CPQjMQ+jlYu6RiSWbAOu9PoanMyThn1N
	K1wVPx7QazSRS/fYWHdDevYx59Wti6UjdnGTGsqcbMIzb3rdGroIQ0PHpEkGewMnpzkwTChC2C+
	U6o6sNt/9+VKCb11hD6JOEoa3o1jQHjUwSAgYLvrlJ3mxOJagmGmADNdeNVyYighfpZxjPif+5k
	HrX8XCiqa7/p+PlYgf+F2zAF9fo+3dDQ5VB5ceXKUkzX8LfbfI332c+PhM0+GH8ZvUzNRJ9gV2J
	W5BMzWsU6USAOi8/q8KmxC4MfPPEX4TB2f6E6PUx/ic1qMfFblEV3RzWUMoCzfQWB2yfNrqbXTc
	zKYrdzC5t529pHTvd
X-Received: by 2002:a17:90b:2c84:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-38e4b422bebmr8808910a91.8.1784412333892;
        Sat, 18 Jul 2026 15:05:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2c84:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-38e4b422bebmr8808873a91.8.1784412333424;
        Sat, 18 Jul 2026 15:05:33 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e9c5fsm3304322a91.10.2026.07.18.15.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 15:05:32 -0700 (PDT)
Date: Sat, 18 Jul 2026 23:05:27 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Yahya Toubali <yahya@yahyatoubali.me>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        David Lechner <dlechner@baylibre.com>,
        Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux@analog.com (open list:ANALOG DEVICES INC IIO DRIVERS),
        linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v3] dt-bindings: iio: dac: fix spelling of 'reference'
 in adi,ad5791
Message-ID: <20260718230510.6cb748b1@jic23-huawei>
In-Reply-To: <20260718165615.1923592-1-yahya@yahyatoubali.me>
References: <20260718165615.1923592-1-yahya@yahyatoubali.me>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MUlwqxUjPIqshWVPQ1pwAlVHUfzMXr-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDIzMSBTYWx0ZWRfX6eEaDpyA90xL
 LdpHBItzW0MPkSk/IJLtJ4fBwcBXFxcwLoojOE3X4DY8ttg7LAPAvOEuCf+k26ziTJaSHoagPWy
 4e2sNKB9iMlowayAmCCfw77q6bjNNzhG+yAYAF6Dlv/g2H8tegky8MHsiYHKzIA3PjiWYfM1Kol
 WnXftZKBzQ8rqSBjvRTIBcPcu60362GlOWCg03HlUbxJJrWhNLnLam4IPKN85bkX3y/PSBSS1s2
 jThXRDCj8S7K8H1nBlTH4JvfVNt7OmH+u+QXcTCaXrc94nISDitbgq6rGJjw+zzEq6613FBD9Vy
 phvQ2u0xzGoY+TEH2gwxQHEaYnBeE2CVRu22/qlQChXLB+rVronIO20LBgeLEbC5BnPduTgxWol
 QOQjzXbS48LndA5qEzV0v0h0/mz5cbhPdMfn9RDbloMf2fJhOGpIFdP5tCUK6JnDAFvUugFBFVs
 ET329Ug9ABaOwjPDZvg==
X-Proofpoint-ORIG-GUID: MUlwqxUjPIqshWVPQ1pwAlVHUfzMXr-4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDIzMSBTYWx0ZWRfX02Bsd3nNHQJ8
 Vs2UEWC+MFS+WhwnShyxucdj9h3h3sMQgn94V1OSQYPhX6Dkq6rb3uPtvDLCg7a7UeeQQOa5Q7x
 +lCvpnZwAVy72oaiZhCiI4EV28rplrQ=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5bf8ae cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=swzr3jCMHCTGmKo2zWYA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180231

On Sat, 18 Jul 2026 17:56:14 +0100
Yahya Toubali <yahya@yahyatoubali.me> wrote:

> Fix misspelling of 'reference' (was 'referance') in the
> vrefp-supply and vrefn-supply descriptions.
> 
> Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>

Hi Yahya,  I'm not 100% sure why, but none of your postings made it
to my local inbox.  However, they were in patchwork and lore so it
might be a temporary problem my end.

Applied,

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml
> index 2bd89e0aa46b..80fb98035c6f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml
> @@ -36,11 +36,11 @@ properties:
>  
>    vrefp-supply:
>      description:
> -      Positive referance input voltage range. From 5v to (vdd - 2.5)
> +      Positive reference input voltage range. From 5v to (vdd - 2.5)
>  
>    vrefn-supply:
>      description:
> -      Negative referance input voltage range. From (vss + 2.5) to 0.
> +      Negative reference input voltage range. From (vss + 2.5) to 0.
>  
>    adi,rbuf-gain2-en:
>      description: Specify to allow an external amplifier to be connected in a
> 
> base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
> prerequisite-patch-id: c8aee5eb39e3cd6f2b2f28c82163565665288d2a
> prerequisite-patch-id: 60ad32e9f0e74902635d7886b97c4225ac8dc5ce


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764407;
	b=T9bKYb8Dvz7lpq6eGPbsaY//XFwHPuDlpacZYwdhIqs7qoOzspbh6Tr0NKXmrYW+cRLb
	 4OP5U6tw6Gl1W2QZ7t1xjtPU2u1PaHZRTGapQtpPse9m4HoRFpjscK8ICD1Z8MCcqdbs4
	 WaIxxq1bB4ap3bPJdOVLdON6+7uFVCHl0ffTXsh7ULqdWYk2EQQU2lU82PyplmuKw2xKM
	 5Bh/s5bSWcvAiw3W6i8gWtp7diur9J+i9VVrVMn9ahfg1DrKSc6SwUfacVn/wR021Samu
	 j60N4oFxZ3GWLs4JV97TEaofABBYOjdivBDw436zlpO2Onp+5GN8eglAwCnhHczGHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CIGT6T5jpQ5FmUlyBZ4+jWajUL9eR2jOzBgtYvKHzIU=;
	b=hdaAxnXY5bkjRWA5azlYcI7cPDkt2H2wI3jgANIPHDBEr9evdzzHXoikiha/I38kmFZQ
	 1y1iQa3NmzycXxQhesWRUIcaFrhBVdsirKRPkvQH4QUjkKxsWi2xpjeu+Vxm6MVX7KqrF
	 Bz6En20WB5PPnimNa0kfxclLvCENO+pocYP0FgsXy1i/+bfs+RQ5564mjhWRxXR/FnGL7
	 ZB4iUlkiR3/yBJZ1l2Cs23Jh00NbvfFHkHdVwlSnUyFcW6mYhA7Y1Y1cA5TOSg/vee7rB
	 ZT6i6dUfG60o4gVgqkjEZ4jIsw/m4CYnCj/NGewdcYcsXs3+FGNsvsVObyhkNRmFdCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LipgI+45;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDEXuszL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62B8606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62B8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LipgI+45;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDEXuszL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wOJ2109186
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CIGT6T5jpQ5FmUlyBZ4+jWaj
	UL9eR2jOzBgtYvKHzIU=; b=LipgI+45CzIQAaLn0Iqy8z5+4xdRW4IMx5NjkckG
	DLOzCswr8mZKejBi4M3evK/BQ+VjB03INlKZFPRGoludhrQG2LqN3W6RuJFKBnXx
	vgKYUtZmDY5xb+HdjuOCWLe0YO1p+HYibIZL2ngizrgjkhh6HDjz0ObaaoRJDXeQ
	ezpqLeeNo/pSU0wKl6WgE7CjCXsfdNI2bB6dUwiY7LPX4vyU5wuB9uFmc3+8Mjx7
	tMxClPG0Uk4Joj9pwietnSZ1sTRW36qqMn+yBkPp3EjwcicLBfGcfN/BUGAK71ok
	LQz1Dh3ZS+d60lQjVGwhm3rNqRnYOuL0YqGjhpP/ALH7aQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms408d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:06:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc2c29ba27so203500137.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764405; x=1793369205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CIGT6T5jpQ5FmUlyBZ4+jWajUL9eR2jOzBgtYvKHzIU=;
        b=iDEXuszLRryCwE0OUbdkA6M33xXqSUb88URBRnJaW5pq6Txg20OVrbYwcThbKAbq8e
         94jWC+s//2MT6I9Ty73D1bNSWrUAc3vQvxahYwOFemBxLH3XOqJc4UtI82g/y65Q40cB
         yfF50jtCN8RBq4EImncK55OlPvDwZ+Udgh6KfuPvR2Ea9gfDkSLceKTtNgcncx0VBZTK
         oKNEPz8iSWmoDK7IzK3ISKrZGmHfTO5OJ5pIcrQWstvnU81QvQQ+YiCbaM8kEf01exRM
         BGi5k7t3viHDYagQQmAoU+rS6BngG4mQZ24LZGAhuxNT2bXYAmURQAdMKuwJjvwf00oO
         57Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764405; x=1793369205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIGT6T5jpQ5FmUlyBZ4+jWajUL9eR2jOzBgtYvKHzIU=;
        b=sfolEkgtbv7qjbuX1exHuDMWrBtjKejW5lpFXYKgAMckmU0tAXjawFFsE0rqbOU/D3
         1XT0YrSqFHl8Nz9Ixrvq2NS5fyo2cZs0ynYVc+/aN0KuFkBr+d7NHiLlKDGs8RGsW3f8
         5XlJipv9GFivfcrWH4/biUqDjZJkyA3TLgxAfaSu8rC8UbEiybcVxTxhiF8OH7gRmaQs
         6guRLEawEkzV8SOpqqs6ZEDR9PLtm5LsRydRnFnP6ob5KAntgMg57Ey24wFrlE3mD6x3
         M5jHcDGmCWq92LOYE211zharKU2OXSJL1uZeg8PMtDaUcRajLA6mo+WcpSx38wNQfWy4
         gk7w==
X-Forwarded-Encrypted: i=1; AKwUvBxGyTka9tKgzkDDNx1/ZC7YKmi5AtUqPGTFusf9Oy9aYzkvn7IcSb/Vyd28pumr/tq9lfCFQWYDoHg+@vger.kernel.org
X-Gm-Message-State: AFq9FYIWleGB/PbiEwvWQS6sCjPomxdwud12szgySvSHBHMjdX+uk8PE
	WywSd2/iTYuXKiPZ5w1YWAOGXIcoDRYMLIekDUwlyWJY3AIm0iz5dGW5WKY0AQTq6oErJeZ935s
	uuHOwIbEFS4Ewt0MguG6aZxTsI7fTvuZ5kE9Qh5LU1gRf6nPQBEUcz3uesYxP82NF
X-Gm-Gg: AYBFou2nXXDNbBuj3MhfLGnM1mE34s9e807LjgVeWrZIoYeeSCAQOW90FlkNkTHgeao
	zWLq231dczoQumqEPluK+5Po3tQ0GwkROAa8hDnO9xKsqwBWxO+fad+kzw7Rbudal716DvzQLru
	umXtWnAXug7AwpyoC9BrO6l/HV0Y4dd4Jk5DC/3Y922YKSLYsXGJB7Zu/rxy3jlsLGOSO4HL4NK
	4lfRikSTZnNCsYXLk77BYQcV1+KjzVjU9InzWyCWjpPzD2FFX8xuMgJkPstzDvAMV9HtWXAlEEn
	99chOkt1uHL0t5dxgCdGF3pujfZHaEAW+oyDmh6+dSbTwdzMF1DWWHpWslY5bDmhx1uD68rPaDI
	J59jFUytsactgZg3tZsokm+Rky/tIU7mCsuNOf7K1xMqtNrA9C2hmkwK8fXvnqaMZmk+rnAxA6g
	5I3KvErZhCTKgY
X-Received: by 2002:a05:6102:54a8:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7ccc33f251dmr903860137.28.1792764404679;
        Fri, 23 Oct 2026 07:06:44 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7ccc33f251dmr903816137.28.1792764404087;
        Fri, 23 Oct 2026 07:06:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb027d282sm401608e87.42.2026.10.23.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:06:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:06:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/bridge: display-connector: Support hardcoded
 EDID for VGA connectors
Message-ID: <e37zh26agih6xocxiimewb4eulrvmuqrrb5gtrtmrix3zcsihm@3e752rnht5hu>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705213542.28987-4-laurent.pinchart+renesas@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NSBTYWx0ZWRfX7kp7qfbLPmfu
 vdreWGvTNI/FbUNjAmzHXjwO6UtW3ujqK3iQIw5TfpRdb9m0rYy9nGI2zp0BYssF8jv3YS5R7i4
 xemwAXcKZ12DF6dckyU+kAc+1nTVItRbqJFsvX5SenjMar9JLQ/uARATzkKMu+Y2pFoLoBC6N+f
 9WsAgNtSIMlVJPFEIzveS9884cq5WRniHYU6gmhRDn7sPRmVsV7kyKXH23vll8d6hFKyIxON/iT
 pxhqTboV/vNhuspIEd5B0/c9LqVNZqUYy/PHdrp740AGIzB8VfrkuGTc0khrVCPdFhX72qg1swR
 1J45QgI9G60qxzKM1yMpr8rpgBDUaO+/bwjSdBfh95ukSw2NL7SKXzl0J/rJjGnsu26I+/OoSum
 App4MN09N1ACCht3qT6w/CAs/rKrLMKcd4CGEYLa+x1lzidfDy5kfoXqvpkOEJKZ40BWOkJt+bJ
 WZK/Wi+lgWrSJGJBCOQ==
X-Proofpoint-GUID: Af0OLg9kxXdw-T2tMuQu8w0AaaHpG_2J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NSBTYWx0ZWRfXytZxr1c5q2Gj
 WKzGjP2910vv14TozyqcTKixVtyimV5sDORUJFNY26PwZFLqxKP9nUrzTzKoOSpEGEEa3pFaQJh
 GLOkz7jukh7FOO9rxA+Sul6mc5Ztb2M=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb69f5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P1BnusSwAAAA:8
 a=uezD57GckRT0Z6Tr3-kA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: Af0OLg9kxXdw-T2tMuQu8w0AaaHpG_2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230055

On Mon, Jul 06, 2026 at 12:35:41AM +0300, Laurent Pinchart wrote:
> The DT binding for VGA connectors allow providing an EDID blob in the
> device tree when the DDC signals are not connected. This is useful for
> devices where the VGA connector is internal and a display is guaranteed
> to always be connected.
> 
> Support this feature in the driver by parsing the EDID from DT if
> available. If a DDC bus is also specified, return an error from the
> probe function as DDC and hardcoded EDID are mutually exclusive.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 31 ++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Having stumbled upon a similar issue for non-VGA connectors, would it be
better if this is moved to the drm_edid.c? We already support
per-connector overrides and then loading the EDIDs from /lib/firmware
via the edid-firmware. Would it make sense to extend / reuse the same
mechanism? For example, enough of the LVDS panels come with the EDID
(and EDID lines) being wired, but in some case we might want to supply
the EDID (via the DT or via the request_firmware()).

-- 
With best wishes
Dmitry

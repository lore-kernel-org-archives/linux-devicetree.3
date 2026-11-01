Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793540268;
	b=S5ISyuhpArKQU7SPRcWciMJZcN7kM7WvfjYODzUYUS4TCXFJsa4nHKC8FVYo9xFnASp0
	 z141ituzdU5EaY6JkUchwzc5Y38HA1MkFpOcEJwfSSikBIimnFA54OxULoJM5aK18LAS7
	 GJmAxqBF91oJu0PR8gbk0NMniZ4eeAb4GKVmx+rMIK94/w6GhzXsO17Hrt/jNVYGkdK2u
	 Pki5AUYCX7dyExkDia2SCqZlNyf0CsL8uYMDgBsr8ohR0M8AJ/IVXTJtep94tj9HGptJ3
	 xF4wx9Fen1TwqIZm0cYh0HYLdDqR1Qfrmb/BHJ0LF3MuBwC/VzlKKw4t1dj7R87tq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
	b=KTcqe+eAeYdosyv5NfLs3OiGYNSwGa4nxksH5e3pZfKRT2Ak0820LCzGOvKck0Imxh6M
	 GvR5sG7tUph7S8CMmJKdgMqAQGq+o+/KJIBrIkZ9W8mwH6kNr+LWuhPhvkwmHzZHTDyeE
	 CwmQBCx+FtmScFKr8VrnpxrmVHdnVc46+a4o/rdZJDrD0M0i1unFLzPz6Zc8PD53RKwqs
	 gRymcvWgNU5tLHs4qJHfOePOPFk0397+RM7/fJf4iLBKl9gOPjPmn4WLO9++MhvY6kRPQ
	 43nfdSzPAN8q//g//we0Xg9LjOpiO7klbtM7QSWHz38SHk3sz5bwNTW14vSs2Ole0qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hy5n3c6w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOBPMW3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9A6606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 13:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB9A6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hy5n3c6w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOBPMW3L
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1BH8Dm1297101
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 13:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=; b=hy5n3c6wVjk99iUm
	GTO0ipvPEU4GmN8j1ywo3HUCdo6gKV63UgpZo90/cI24ZVC7T4z3GTwNoDsbNXIU
	Xn7JO+KbH3Zdubva4tt5dXVcca9GTW4Pl5YXlXUQArsxjjaVcjBvjEo8rln9Oaam
	iE9P+h+OYJSNwhw6GPoh03vjJ93kFB0eiy4+GlTO5+2kzt7o/Os4wiBO75AE9CL/
	ctOwpQFYIKQVhD3QTQwhzacr3VhVl76ohnX+k2ALP2d9m5afIo0wQxW4sWym3Cgy
	YZHLdtdC4YKrvslSK5QR4kTfRxpuLtWkSM0YaNJ+LnaJVoAK11ew0lgZOi1qFkQs
	c3ZwCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxkf6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 13:37:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so211592085a.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 05:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793540265; x=1794145065; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
        b=FOBPMW3LQkSm5q1Ly7cWyNuCzFpoGfxBoNUdSQdyOo9GlNgTw+yjPxlGGcWHfMAFg2
         XAF3maq7q1hNH/TJWmib/9jLC/zUO9EkO2dSvSiJwqF4FCbOhuqo/Wlj6X7YYM01VxHi
         kP/uxM0V3URgmyhe9KnI99m9fnYTETh64at8j4o0v/cui6Tuk+s+nWgl+/zM12h+3nWH
         NbQz7Oe0aQAoBfBQ4MYgqKzJiNgFtpTuYJ6GBpq8daKNXnJ8CJKTjrAQLvPbMd4tUoEB
         XlBicD/jsXZLxEpm8VbNKtR8ekT0AY90eVIFsDlnRDB2qckmdEYa9PF3WttMZXPVxBql
         KKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540265; x=1794145065;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
        b=KB8hL1+lQy6RlvnxvkE1xl9k98a+94Zeqr1T4gJupnX2fCSQZyqoKiG+2rgiGbX0e/
         G+LC0frc5FYqIYkuWtdx4H4IyyrJh+MEhq2xMtwY/3Sepm9nOfbxNmDQufx93+qRPxDS
         N0VjsnBPCXF2z1tRNhcQTCPt2fs3i4z6rr64ooWz+Yom/hjl6NKeWsLDCCuCKbZ9OCSa
         Vz3xNX87LpTvL9NO3abG3OKY2FKJ0mFjJYZwtoMvkzTnjJ8gYsRtUO+tS9tR8vEkmBGj
         QT7ho/gbboIg5rh80ROGG0bLNlosD4l9KWBgPIGsjfciuJElXQbo1ygQJVRd7epMnV73
         8FoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLazZ0ihbSrhRzi4njQSysLW63YoPSu52GcE0b0uNyNJMND7GxZVgrkgVVwIXmJOT9cgD+w4nR8NHc@vger.kernel.org
X-Gm-Message-State: AFq9FYKT872q3JsUuZQn6+FXsDJkK8QnkUlYPOw9DkJsEYQQBCP7tZyV
	3Jk3/n9DiPUv0fHQ3kdnytUlU1ju0TaCkcnVIJDa1m/9oAecny175aHN0WneiL/zJc7PAslAlfR
	yYEth/cqGzNBh+1i1RjlsYhMjc7H+5FPg+upi+us3nAZ21SkZR2UMxzOLWJHpLnJt
X-Gm-Gg: AYBFou0h4Ts/Li+sPdJkooMCFfa/qbPFd2faY0jrWBKgBOdUaPUoo/WSu5LgJv05lV5
	gRshkAhbn7cT6iJbwsFkngzWTEj/zyXvIFySxMYnvvWj0utyXG67zzLfzW4daw4yG+FqXcrQf0i
	gMSpCPzHyacI7AP77mlVzBD1QzUS2bRqRe6LCIUPgsWptQq1g7UBh0a97/aHx/EbR0UD1D5QPOf
	GwMLaAzXu+K+/XpUR66IEkr3pgQacoAgp3yV+fmEejAebrh1rWJ8sjY+1Z8bwb2vGY1850/LjOh
	6tCgRzCVj5zOVNjM7q1bXDLOi1JMI1+gAbmlZ67x2pX+lFOJP0MYgGHHQmg26nSerl8Opf3iPL2
	x5A/l034KV+eH38cGBLZIx0NegBZ0Lr/P9y8FgdNY5iIsobdgGSUVW23sIg99qKM=
X-Received: by 2002:a05:620a:8904:b0:93f:211b:a7a with SMTP id af79cd13be357-944216b7a6dmr1299171385a.29.1793540264817;
        Sun, 01 Nov 2026 05:37:44 -0800 (PST)
X-Received: by 2002:a05:620a:8904:b0:93f:211b:a7a with SMTP id af79cd13be357-944216b7a6dmr1299169185a.29.1793540264396;
        Sun, 01 Nov 2026 05:37:44 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm14029011f8f.43.2026.11.01.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:37:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
References: <20261014234949.1730808-1-luke@phorex.org>
Date: Sun, 01 Nov 2026 13:37:34 +0000
Message-Id: <179354025489.2686703.1864959237402110457.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=IdvitGyi+DIn1dy209zldQ8u1g3NQ/x+0UQJ6J50KDg=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBq50Ch+KOlEeSf8bGjUIvznUwOG+mV6MffOXTSk
 FOVArKpaHOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaudAoQAKCRBjTcTwaHBG
 +MqID/9O1uPoWpRwRV+yJG6AktczcmsHm8L+LmqPdz4L7UOSZPrPkxZpSgxPtP2OeArT3dQ2t1d
 /fWDLke81cc78ZmFKDU1lkYgLLILsCDF4rIQJtYHezMz74NSGsbwRrnUZ+A27GrU1gUyS6uLJn5
 1kMx+lBq+MP1iMSyZLeTc87dY/k0KZSEGUkT4p06wvVlnF7QDSV5hdNM1pISAsXbULxBMWr81Qn
 kEYGRTcUK7+ressnLeVGClGee4ZUHpO2aS+SqzAYOHg0lVgzTunXlOQY7KIUTDffZpbEuaAC/Ri
 3eOOnJ/+luvFU+bBM1PL7ly2EMKNToaVGLJHmUYWWyoGUPpInmQGsRohLd5HpWH7y+8/QHFpelr
 /ATS+Tn7TD+4BYeC7iNacTF5YswB2cfxeecjgPV3eUTPOL4nW/wMHXSUPIcBPXixa93CMmCSHa9
 RLpryTpAOIegFe8/hDKyUSF3UeXz6y2LDnpVFgDxIlWPWp8fX+TGDqrA0jrwQRksz5EETkC3hN3
 u3v/3m8NrbYo0IBsIxlyrtVKXlPBW2NjQzdPFQOT+F6pLQ7IIiJ7R3lroWyNspIKH6HayzD+tNC
 HoTMtrKA11if+zgSm1Vq/nfD6mwKKqhQ3qx0xrgTahtPjgeKRutlRledxyxdHXFfT6rv53q6T7A
 96gJy802YO1EvSg==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: WuxlXLfahvmK2sbhbv_18l3sVYHp9cOX
X-Proofpoint-ORIG-GUID: WuxlXLfahvmK2sbhbv_18l3sVYHp9cOX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA1NCBTYWx0ZWRfX50jKjUvZsbZu
 Foxdyy7xzRJzOLVu9kv26Vfvry4i4EgIrMNybmSfHqTfRIf8Lwrl+YqvVPI2xzY9lEptE6daGOQ
 7IVdDwghxdkohxFQBfF1ZF8uX9PjJ9U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA1NCBTYWx0ZWRfX1p/mojS5qofL
 1MwYOHNM6J38ll3IMug0PyHzekbuy/8mvQUrsUhVuATZNEBEor7cdnCi7TwwtJRd9bYyFh5GuK0
 lfriRURHRj18wwuZXXjUFlPS2ZEmL7oJCEBspKtA7kMYrx7ECOb4D5WvALjXWOebhhZEHaccNA/
 EpO8/wwYGMx05Zho/lvzstAsxQqghL2H9CB7xYd/03U/qRU8yUbdnp5xVutXazM6UEf0KpS6sbZ
 bgxSvfT0NMyY72bBdsXYur8eStRXql+APxZRkY6ysP8OZvqRFF3AvUMZSbq+5tFZiazrl8QGzJO
 Eh6Zq/AbzYqFwr3GEOaib7QxziqEgj0+pHktBI8WAE9k5mTruBF0wMv1VSek9MayXMg88+tc8ph
 CXRuJG/g7SGQHYqABdBapGq4aZiy4bdjo7SEm0yn7ePAoHFnBKj2rHvd7C/gn8IxzJJKf0vVAVg
 bJnGcPfI6FsYp0BO6zQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae740a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=mO8_gwkcAAAA:8
 a=EUspDBNiAAAA:8 a=DTIOQyTOvEYwzOPpGJoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010054

On Wed, 14 Oct 2026 17:49:49 -0600, Luke Macken <luke@phorex.org> wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard


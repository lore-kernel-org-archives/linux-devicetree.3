Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794655525;
	b=LkFHkUrsaeQWGVcgl6D/l6VsQ6oBbFYeAe4SnMFuigNqf2kpb2Lo8q+53E44M7ga8k7a
	 JLq+vehfaKHcwk4lVxiRJl7OaGgb4/jkZbHzMJ0X9uRIVSr5M3nteeLT/ukXw61u/YQgh
	 +0iO+wed9b7lvR9661saZdFQtJzGoNgeC/fdKM99gdSz0p/g3oFKPn9Tan2f1qpdjnAd0
	 eOZ5ty63ZXYTxtaEK1arQUe2Ul5J5bVTx44Si7woTDAdAGgDMcLbMVjLi1tw1pAulhAzj
	 nb+SKDB4EoIaL4S+gMRNiNzxZxl+JsmzyzuF80S7SPki4no65XNn3Qy/kSqjM07JssQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
	b=SmqSwOEnKxz0od3kx5K2MHX3tDgUlTDCKlf6k0dV+sqg3yoUhzC8Zx/GC4ZhXBByemOy
	 NfxoqAaBUvLFMXLQh1Z85bNGwDF/fMeahoEpRy40mCdZbmkmZexW3AuESFR5b77eOBfnc
	 pNPWimhjyX+xANhkNh3D3sl6NmFnWDUq1Zw5grr47jBA41SpkmS8WGMJx7q44ZuXx1vsZ
	 rh8TsZfKs8P/tPUIoiq4mWYjCHUSkHUYTbFGiNxdUDfduWfK872xBwZfAsLLnxT8CjJ1M
	 MmvlrQWZtagJ1sJoYC/fJl03JKEeOUExyrUYUEZ1/CpO9gB8J/HVXXUu+U4MFxv2LeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaRin3UN;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28970606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28970606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaRin3UN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wPi42710379
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=; b=QXgSS9Rda3Kv+k9P
	gzqe3kFPN/uWfUmI7OADtIldqWZDD+slzWtMPC/6dTDxMoFuvQd0N7gxLeJPQzVL
	Gx34zKckA+LaBZxTE6Es8GYa5XxLVKKy317T8OsxSwsgfLMrwNDpbiV3RWna2uNQ
	Q633p0yhEKggDTX7xY11chbADeulqMByJf3qChWKnbWHcJGNHise6+F6CcEqaBXO
	v7Rji8HvkddJBsZBOsexcXlNKMu6jOxc8MdeQ2/nDx6+sCsRyufemJ7r0Jkq9hAj
	v0Ns66yN3GBHSutZp6sEOu6Enxd5pUElkn+mYUsqEfaGQv8mIwxQ2sA9HyaUMbFB
	AVbl5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhgkwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:25:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so3104037a91.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794655524; cv=none;
        d=google.com; s=arc-20260327;
        b=dE09AazbptqhYDpZ7Km1pVdkmwNtXK8mJ3sskBH6VTncrQ/CUG4r00X9JNcD8KRcz/
         Xt51JpkCWBUo8TTB/jnTioxebSqtKwJ+hCAl3YwihIZ4sgF9H/UTFTkA8FNZifUI8NCz
         6rT6soHLerUqgcuFbBG4W3ShaSYEToBkNua3U+xiG3fiGJBXQ8yexNHCtJEsucAxa6Vn
         frOyVXW9uC/3EgvLytRsJZotdXhzvpR5ZebXcSLVxtPP4/b4FwsWrMy1VpzPhGbBs5ey
         kDuxsOCvS3H1e0dYTNV/AjBuP+aL28d5TpdUWIMWNYROW5Fh26BvdA0+Pg5CaE+U0qme
         bp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        fh=mKlTiKH3U7samXperW4ClobI1vHYtMimbqfAG1eB5Sg=;
        b=FZZ7U0nWTeIB+pNEJBvQukOjctL8QVGLb7zCEew6IELLjWZ58rK/f5XL3gjkuOQimW
         GnXiLH5SczeiUNOrGO/UUTcyR1wfx1XAY/Ei/bgYupnZk9HHRY9Khsp5RASSMvKSgTYa
         EbbF6tWDDzz8+7Da6/TI75u4T44zx0q4OVwz8RGZhmQbMIFYMyVRCQvz0vjlaOEEZkNU
         sJv9EpPHScFhjuUXAaM2VM9EU65emNmDFuMG6U/xbzZDftooKZB7nXSlORP6uXtwkW4r
         AuhalnUCbBeOwYe+UIqPRmfHZJG9NY6SV+2usDVv9Znt83mMmHUarptDBbdQ+k7HMxL5
         W2pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655524; x=1795260324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=gaRin3UNqXhDB/YURAsg1NbNfWKgh1yehCZFMlaT8YX9rr5tZsfT7Dih5G0GvWJOSm
         xvWb4tmWJAOEb5bHlGg56+NNS9q+LgULUCyLExKDiT8NhgafE+A2c87HJ16ZE7KS4Ypw
         iRv07UvoK2l9mhasYV/lsSSjbxeqByM1+YDJDF0AXu4ygUD0FWum+310aYxT4d07jPMY
         SqKIveZNUmECHZYtQtmW53BJtAo52x5Il/3ROs1nHJqGnP4VRVq1zipQXzv4IFf0eeZD
         xiu9xmBhFKXYP+JKhzZm9XsSZSZKeJu+xFB2j67q0HlAu3L7icoArOYDch6dRql4lSdh
         M+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655524; x=1795260324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=Nuoe9UD7Afgjqizy0aks7wQ6mUVJ4giUUKvGAYAXDLFOVOKANd6LRDAH0UZSqtmjxu
         plff2Rk93q/kJb9lH5R5tXTIyTp/NX311+iSyE19EqKRFpMb6z5zSY/2q5Ux20oN3EJV
         1bpQPbgMLeepnqefGzEDCC/5X32R+TL9bFY6cHfjVUUOYtKrw2aZANYOtVNUKkQlE3n0
         UxB2j8l7CF2O6pA2BNBtnwvzLuGWuHxbIA8NuXV196EEzErsCB9/9iAkDqZnT6+HH8Wp
         UxY31OuKqQKo6lI1vhT7roXou3ff4Azus/xHr2gk5z9mdQaldvBCsjAR7WNxuIGHh71U
         y3iA==
X-Forwarded-Encrypted: i=1; AL+hErHlSjlJB38S1daiO0X+SDD3ffLTBw8HeFCwyjgTCX4uxD3c1B9l8wDDOcqtUH3n3HyyUY/TZPiwXoFK@vger.kernel.org
X-Gm-Message-State: APuU4Z/OHDT6FCwBnNpv7ydTPQUE8me9Frr1FWhBvsypblDNClzQqp2Z
	Ol6U6aM5Unt56t3gmwNYszIMd1Jvq1j9z35IhGhamGVQSAnhvpFVV14+6B5r2P3S6zApoV7RAKP
	aAzeceYWIQHcIoSONFsLb7Ccq0DYeMdgkfxGNozean+iwU+89gluqed0///LmDeEt78UjYdB+kZ
	80N3hXD8uPoWppp2GT0z/opXoHnS+6x+4jplK8VfE=
X-Gm-Gg: AYBFou0ROvmwYw9N5JfhcCJAxdd4J8vBvPvZ/zZ/uGFAOkoo7JKeiN+iqxzOqS8Co3s
	9aIhZhKVM+aaJPsxd1lldOyZMDVNJOI2/6mA0KUIvJ6VpTYlwKC6jIZaHB2QIt5mUxMqXSjix8F
	daW8fAg1Q54Bo7obnyD+6Gss4Ojvj4Y9dfTtX8lSFtSayLFI9/At+0pbEPoQ==
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b1b0ba53d2mr5901021a91.31.1794655523731;
        Sat, 14 Nov 2026 03:25:23 -0800 (PST)
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id
 98e67ed59e1d1-3b1b0ba53d2mr5900978a91.31.1794655523156; Sat, 14 Nov 2026
 03:25:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:25:11 +0100
X-Gm-Features: AclHuK8s11-7hbgMIVd4tuDyslF9iqGa3b4ELmL8p_Ex5PIsvw1_iyvVguSEqG4
Message-ID: <CAPx+jO9GW7e0ai2o4Ycc4BKBywTaP=7NiWk68=c2kqcD_VrgRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] BCMBCA PMB power, clock, reset and hardware
 monitoring support
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: sfpHaqulYw6rRyGOpqO-ZXpeVCYsbKlf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX931myHFO+jLg
 TOBbTM3SEOTUDIBmxYIia3zrOIXiogUvIic7cHT2JIYSWn9E97FMLO3+mH5cJRYrm2FPAsHwtdo
 85o73thR+HePeLux6rVj3ce3PWXB49U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+IhMwcquJfth
 a6+7UYxmmOtTzku9W5xOBMuEc+vX6XEG5Ny+xMY5dOGPQ85jb7XQNdenH0w+aebxW1xpEQPtBPg
 PYkg6smT32VPgN/6i5E0n+oCLujshbiPxNNuigV87xGNbLyLhgrPYh33RZcY0pO3LkOIpI+Tb5Z
 bXesBJhdroUfqn4sLIeYuaXHDUGUlC7Cx7uWeuJutlGppX8uAJFOKFHhXvOcb0fc/e2zMlWctrF
 cncWMPgWI4Nf2g5GXL6ktQWjAbPugfLisD610JL9ccZ73RiA/IcIedPOopFt8iIP+MfukMWcdoU
 3aWjM+vG0zD/LmeL9oXxgMmVvE9zzWHSYZtaBolN7/Ei/XzLUaY87nr5eckCYLx4EEQIjUOe/YG
 ecnrb4E/xdtvECJqFOaasaAGCAFgdtyzEV4j+COidpO1D2IyQvniV7O4xc+3mY3Rahs+m1VPo4T
 zxWno7Ai05VsiXyzmOg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af84524 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=vyQqneORv_wdx-tV-QAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: sfpHaqulYw6rRyGOpqO-ZXpeVCYsbKlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

On Wed, Nov 11, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is another of these big upfront design binding and driver hoards
> that is the consequence of adding new SoC support.
>
> My stake is to be able to boot and test a full featured Cortex-A7
> system and the BCM6846 XG6846B is one such system on my desk.
>
> It's been cooking for a while in various prototype forms.
>
> IMPLEMENTATION:
>
> The PMC contains various stuff so this needs to be a simple MFD node
> so more things can be added into it later.
>
> Inside the PMC is the PMB, the power management bus. This bridges
> to several individual peripherals which are very clearly distinct
> devices on that bus.
>
> Handle the PMB with an MFD driver with power domain, clock, reset and hwm=
on
> providers.
>
> Expose the standard BPCM peripheral, memory, USB and PCIe domains and
> a combined XRDP domain covering XRDP, the three Runners and WAN. Keep
> the peripheral and memory domains always on. The power domain provider
> now owns zone transitions, leaving the reset provider to pulse resets.
> The CPU and PLL blocks use different register layouts and are excluded.
> This new power domain integration has not been tested on hardware.
>
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series. The zone
> power-up sequence also passed direct CFE flash boot in the Linux 6.18
> OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.
>
> MERGE STRATEGY:
>
> Through an MFD immutable branch once everyone ACKs the subdrivers,
> it will take time I guess. Queue the bindings and drivers in MFD.

 I assume you are referring to patch1, 2 and 3?

In regards to the power domain driver (patch4) at quick review it
looks good to me.

If Lee decides to host an immutable branch, just let me know so I call
pull it in to apply patch4.

[...]

Kind regards
Uffe

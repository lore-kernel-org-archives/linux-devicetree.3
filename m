Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592067;
	b=oRM2ZCEXPDYbLAYcSne8aeBswB4k1EHrVeVkGLPWZMh9jQqAblTpZE/5bBLrsN3inywy
	 k1VkvnxSr6gPD8oFTCAfgpE8v9+Xh9hbYABF9pirEklUjDNXCS0PJeqFYoJgN4CjaVFCD
	 NvWlyJYPAUBzAClKcSt0YNC/apRS2cBYMUcsQRwJB7dh92Inbd960SvjU/1m+MXEJ0dju
	 VqswU0dnG4XK4pvmxqMmXtr4UX5XSpnLX7CxC679kvQQtJJeILtJFHoZmzRMKaA0lzIXY
	 R1ladJ+rVFvbGgasmbvbvm+oLPDgpHWavIyaJ3mvchhZP2MDAsFEHkKBIVsVA+Ixgfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
	b=nOMEOUbBecHJCbQ/jyJPo1e2bzRGWWu104N2OBUc7yhSyPOUmrW/QbwcvZotkOFme0qs
	 mlPdSo8FpP/4p3mJJ0GolyWIq+cyMzrCjzsMWVlm+5TItpU9rK1/3+46ptlnMt836acJR
	 /bwnS87lf1D4tSDW+IablFFY3BojicuJIti/lO9og4pPvVGf2dMXRvswCVK8lSMVdmGQS
	 qxR45dSPmaO5DuD9UVUpkGRQL9RyPhGutKIlU+ytkchlFEjiMidZIhzq8t2zHpQi4ZbZ+
	 muBwg8ab1xzo5dFoOLEFJoOdEpBYM+qd7R3B9ASbL4tuWaD2zkamQliK3dwEEFRVrqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcznuWyK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkCkP7n5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D07606C09F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D07606C09F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcznuWyK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkCkP7n5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRAf2552194
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=; b=RcznuWyKp1IBp9Mf
	p6xVOeD3Y/BJqD1rDuzzbT3i/578VJmkuaXrNGeAW7aRQwD9RaoBB6eCuAoF84BZ
	9NhLPsT/8N78CBXiGQnn4bY5ohFkrk0VvKX05XSEGtKCNpEYi9Kc41pkBeTJ2yuB
	2y4Nbma6Y/pr40wypVnROv/iBBYhSdqdyZpGJvGrgyeAZF2gbZ2JJhhFeHiELT8d
	dpk3RfYzniz4y8bWkk7RWTNdnbKu/2yUJHZSMxleFXp4uYv0KvBoYoDk0tnaZplY
	GbXuf6uYLmXthYtNQFM1BlD9+jbtkNNp3XEnpc+mZp2ap3/Ki6FWCSbmR1vWdcPq
	ixjK1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwc401-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:47:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb869327e7so1194558a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592064; cv=none;
        d=google.com; s=arc-20260327;
        b=TUs+xV6H17dr7a5HkkiB/ZWu9OPmkh9SHyBWVNIr0obZm0Nn88t+usVGfQcymCtGve
         tg6Td5IeMa4XvB7gp0JtdDLznzREu10DIkgA+ew7K6y/wnEd6vxTRFWgxE3Ef7hY8g4z
         a7DUCTTmn+GYzbEhQ/H5h8h1kiSLWH9zPrbSmM+cCAJLHeIM2sjD+AeC6Kf0SghEZfvB
         Gfb5OZGt3EeL/KGCvAJa3uB13tEwltWPmxMqyQqV+LUqooHHUmqlswjtwwZ98Xi6Opw9
         Qzbh63++uGo4hS3rbzhhHJ1KDQI+tBW5ltk4DbGY2G50//9z4zp8hUzB6McXNa2DqLkd
         CkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        fh=crPBtgqrfZeRyEx40bqS0AIeMxsKrOVDqRhxHfVVpLU=;
        b=qRuTz81bZdTIeAZSSNbdY3LAKk2CIhoylyfMqhbOllKQmL6Uw/p0tkzjj83cUkSOTj
         qjcUKoNViPhHW0DSGOwjgSF8o4TbdZQs3JBnMmfwyq9yYlhQpCMSpvIry2USSsjh6Ee8
         ymx0FjvqGW6RQg93Z0cpjN2TJb0f5zGvNEmRaym5GhEGhVcER8DfECN87MzGW+PRiND+
         XXufhuuq2VY8TJH7+ZExeRhgjDpsrF0jq16WZVeHL4n1MDyALwIDE08fwFvmmwwHumcu
         2fCYLJg3n8Mo3Y8i26iKK514p5S9/Bw+GcdXLcI2YQGsNP0T1KM1PSmW2J212X8q31Kj
         LCGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592064; x=1795196864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        b=gkCkP7n5GIh2mJEaxkN9fdhigjWm/V5OVuf1uUpxzLni4FUhI7Wuec3HFvtJbDczDx
         qk5i2T7KUSHJRUIpHMf3+VFigtc0ylrU3kn75dWB59OdfIC7CC7xovXYtrf2qg/RZw9b
         OyS8SMEC8TPlwnEu9udtKUjzZ/zwL/5yKsh2/zW4hy9WRwuP2jHWYLxDOk0NTlz5PISW
         z/cvcoBTUzLuarKTB+kkl2slb/m/wde5BrgnlaX41CFKV2TWB/tsJfy9dd3P0p08ApQ7
         W3ThgPpw+Xyq2uKodynu4bUoJ0zd0DhSz7CLLUvS+xeAFaLctwR8vYiLaEcOtFamVsr9
         06pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592064; x=1795196864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        b=Yx7qxCEzvLzFUainV5LWO5IQNjlyokRDlUCqpy7+5rodz4xJemWB+V79+etCpokEFn
         +A/iwIcMY8+zFDfsvs/jAoRb7epMWLY7SS3XBJRKEqbgIulmo3eDUsWJYKZEF91+i6R2
         mrEBKESqyHj1GB+k65Xb7KnhHaeALN6jLKj8BWh1wUt1wgkqg8CgjVXhu9F4/QqwT8ov
         t96YURjszdBwwGiVJi1sDefjjrEEBTLIyHy2J8JAkbS7FbB4+/9KKe2qohQcYBQgGYdn
         jjZWsBzvzxAcwg36FuDcgnErB5k4BrHEA4kn4V4OXWf/sMNBqylpAYpvCCWZlcyOJvpn
         kqEw==
X-Forwarded-Encrypted: i=1; AL+hErERwEC9v6TvKrC+a4mknCSP4YMxWeWmEgSrjPjXQMhCFjmsyC6dx0gVOfB/CmBABOgdAdOXahm4qQGI@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZCk8pxfOWRjaiuQwQX4HQ5tSyhrQE5wepYdkNjdXHavdsVDGr
	24eOaPxAstbcP06YhFn16eKJyefzobdvjC0GF+yM6SpC24v7HBXMECj6xnReADP+B7n8v2RtJv9
	JegD2G9eNL9i1vE95+eijK2RAxmyZT9bB8TkW73ojHq7bGXrluBOhsVVAGFPtIYg/8kNHM4mlt7
	2I2MUKmE/2HKMHTDfh2uAvGeHVZrHDGeLEBxQnnU4=
X-Gm-Gg: AYBFou1rFYQcHhdxpTOhM7WtyNJjQMPHPxZ1qZ83VNzwsZhom4yUd27pz1gygOQfoTK
	INldrirMgtzMOdggeACKc8xCZ8ZcVv7K1F4shgLh523s4kE88VVlb3ynPtmOh3CYGU2ASL3XtRX
	+5XqkitPs1oah4bdvO8A1qs3op35GcAcWwrx4ReYsaRZfPvHXcWxbxP9lmVA==
X-Received: by 2002:a05:6a20:d48e:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3f7a68a5208mr3120350637.25.1794592064032;
        Fri, 13 Nov 2026 09:47:44 -0800 (PST)
X-Received: by 2002:a05:6a20:d48e:b0:3d3:aec2:4dcd with SMTP id
 adf61e73a8af0-3f7a68a5208mr3120329637.25.1794592063543; Fri, 13 Nov 2026
 09:47:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019092417.391522-1-leonard@lausen.nl> <20261019092417.391522-2-leonard@lausen.nl>
 <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com> <avYBtK0fyG_0--nN@venus>
In-Reply-To: <avYBtK0fyG_0--nN@venus>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:32 +0100
X-Gm-Features: AclHuK_J5EuV9dnZIsWrbl-naj0R0vX4a-pEYbeUab3qTKG86s3ZcxdOv5w6zDQ
Message-ID: <CAPx+jO82TGVDRqoz+TN86LVfraVVeNhHBFktTDNvVzM7S8zbng@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain supply
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Leonard Lausen <leonard@lausen.nl>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, detlev.casanova@collabora.com,
        finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
        inindev@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, gahing@gahingwoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af74d41 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=9GNsruGHAAAA:8 a=QX4gbG5DAAAA:8
 a=TNRU4YkNAAAA:8 a=mTdHOEkXxLqTN0UqMq0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=gf-oSkQAjqHFJRp-GQfY:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=T6RL-YpNOstmnv1gjOTq:22
X-Proofpoint-ORIG-GUID: XnGQInVQ3qikfepyP8A9PGJN187_SjCp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX4/4cDRYnY+sn
 H4iPkLoC+Ttb/4fy5qZSgiOMHL3fyWG5Pz8Ic9ZssVdkRXeNsrBmvwZI7/Grz9hlwfvl+rp7fd5
 wmjbr6383wbXC9VnN333Wz214ijKpExH9tNowSGNiWl4vTOIh7+AQpwM43UwcBoafGZwbwRccIQ
 SPtBSzT3zeUj/jv6cmHfcvwM4qOKycVE3+mTWg4Q0vlsDjqMy2NK7hdpjWnAZeoTDsJWYVv7jcg
 UpeS2OdcpKC2oPEKaatDmS91SoeSIom5MJWWsMybvlyV8WBxifHZFYMUGjZj/Z9t/sbiLlShST5
 TprY2uP/CKanlBoewQF9wd98FFebchm4MrTHcEGRL+23hDD7fhl/ucZVyAC/aaeL4O2sdJg7GWE
 +G0/k5l+LytjtH/GphUfiF0Q1+2mgB/nyea7Z+V2pkQA5VDKo7xGxRkHE9ydbCHmPKajtLW9ODI
 vWXUtwql+NBIlpo4czg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX7MT5qpoyH5s5
 PbbRXCw5vOeaxUE+MIcD2E128PUEaCJ1RmQPjf3FYGBnvXAc54PxHTSs4G13y6znSTqOFKaDS4i
 MPlQ197kFS4npIvRIbz1d/SCfLaVKWc=
X-Proofpoint-GUID: XnGQInVQ3qikfepyP8A9PGJN187_SjCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Thu, Nov 12, 2026 at 7:16=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Nov 12, 2026 at 04:19:58PM +0100, Ulf Hansson wrote:
> > On Mon, Oct 19, 2026 at 11:24=E2=80=AFAM Leonard Lausen <leonard@lausen=
.nl> wrote:
> > >
> > > On the NanoPi M5, boot hangs during Panfrost initialization. Before t=
his
> > > fix, booting required blacklisting Panfrost on the kernel command lin=
e.
> > > Loading Panfrost after boot reports a GPU power-domain acknowledgment
> > > timeout:
> > >
> > >   failed to get ack on domain 'gpu', val=3D0x113ff
> > >
> > > Add regulator support to the RK3576 domain descriptors and mark the G=
PU
> > > domain as regulator-dependent. This lets the existing Rockchip
> > > power-domain regulator handling manage the GPU domain supply.
> > >
> > > A corresponding domain-supply property is needed in the board DT.
> > >
> > > The regulator-capable descriptors are based on the regulator support =
in
> > > Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU se=
ttle
> > > delay changes.
> > >
> > > Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahi=
ngwoo.com/
> > > Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC"=
)
> > > Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> >
> > So this should be applied as a fix and tagged for stable kernels, right=
?
>
> Maybe like this, considering it requires regulator support, which
> landed in db6df2e3fc16 ("pmdomain: rockchip: add regulator
> support"):
>
> Cc: stable@vger.kernel.org # v6.15+

Alright!

Applied for fixes and by adding the above stable tag, thanks!

[...]

Kind regards
Uffe

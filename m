Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470785;
	b=fzwXMt4VueK0mxOjW62jXxpqlqA/7+0Ncf+oENb0JQDE9b9xKqvtaZRnfhFOuErd64mD
	 KheYAIA21hhUmJ/0L7lBdDBGi4G0uJAov32+aBv8CaUEEyYmJDQ2/pUMccmSRD/GwJqxB
	 sSGnkdFfsGRCahTMNsK7+WAfjtUPJg7C9h8a2b3R2XZtCb4C5Uo29d/HYKMV1fIbWzC54
	 rLmsU0HejecH7M/9XbJmpW07uw85f2+L48i0Jl0LqXWODDzSLGai6ASWBV+/q2H9DGVuX
	 Gl+8URTROffX3yPpBuoMOD4ftfpCzt7UhXuF/ft4UuZDb8Bq9ve5nDcARZXlXdeI8JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
	b=DgC6//3qH7lmmhVtSP6OL/ajY2N1jWdQTfNifErklADkVPFSSV04BNAjlegDbZolMIjy
	 Uxyn6OBBxhBETeIDk5U0/ixGUojUV0Wl/GVSgOdqulgkbW1Qh+D8d7xyHMAwBqyv73qeG
	 44w46/fCUC+vNQfgk5RvcZW5vVT+2rNdN4L5ohgCVPZ43D3J3k5eJ6fc5ln8hcV587JsJ
	 qBWwMMcfA52v4tXJWaAgAzt+yShzc81NAL3XT+E+LQqx4td1T8koZZuk47muQGTTCMnSb
	 MVwEZ5YXwT2yiNiMf9L2KLEI6RL1fnvZM5M4WSfQLNKY5ILgV87IplBlFi25+DdWcBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eEi9Scpq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632C2606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eEi9Scpq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5nlFR442006
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=; b=GCMGHbPBHiZjGm45
	eihsbjjHclEvPKwF0SXIHt/hk+pqn5tdeALQ5qh+MCit3sAPOuZ4STlimn9hCr1y
	9qBW984mW2+DAbuu5V8aqW5b0NLDQpKF5g6WZbf2KVnaVPMDQvSEP+KObioQpjZP
	ErNVr24Jj0IHJT8vLn1X2Ghh3w77iwaWO6lr2SzDh/CCBVFPzj1GIOuOTGcwBnXK
	4c4dzoiEWBrDa9oUqJLUbvwhqtNbGB/hdkD+Rk0u2CpDiiTiOrWeFRf+//wnQ5h3
	0CXfLJDT9M92fgXuvBh78Vs/QT7Q2BBTxNjJIENM9FvUQJ/V7V0eeZ1S8ijWsaCI
	6z3hJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0fra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:06:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so74794985a.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470784; cv=none;
        d=google.com; s=arc-20260327;
        b=XaMD/mkd5mvqKldR0bjdv3s8RETfx6GuW3ZBaSJCTavU1qNoQ6Zd/xDwNI7mHfZLKO
         GY6XV2nwij/eo8qScNHoIhm2v3xudXRb8sT77vsmXxrLuOYjuVX2lH+Q4VDXwTVmjF2f
         bbOqxkoEj0rx8RccbrSo2DNVPMI534Ope0JO3Pf0gSyxik2uBvT8bZg7joUMm9gcou/a
         m8gGH7Q3zg08dZdoEZoovTveDUzDvN4gFge1fgPBAWOAkVjAtTsVpCw59AVXv6IOfDtn
         O4MnvKu/fshBCv2i2y+N1zAptlNv8up3pZd5538CafHlgn+w2YEm5cS1kLEpGQhvpc13
         9PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        fh=mKa2S/0g8ahdoQUSt7FW5ldKqyBCdlFKW6AViDVqbh4=;
        b=sDqAn9WAE7F2PdC2B6Me/2qDXcEjwAxaNt+elIothXyLw8P4T85BQAZyCfWS6QT2SG
         o/GQtnWkSTRTOqfJbwEuTewy7UB2fs90ziSBHwpPEXyRyEz8A0YfqlC6Kko+x4lNFRme
         cRoTLh8ETfNlRZQgWqHgDVUEzY+yj7f/gGzahQMdgUXaEakBI3ZM8/WgIzlVLEx5/kgA
         8qIEn8QZnyR2VNVrhoW33r6UlbTCQZx4KdorkUxWnF4pOWwriNK4YLtYOwxnw7sPL66I
         ScdfDUVptYCDdP2sNcZnJWeRaUNvDi3RsxO5vNG31rw5wbaXLRft6I8lsQw4h4LZCdWd
         8CIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470784; x=1795075584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=eEi9ScpqVbXsNKE6X8r36/Kp4+RSmNKyJJARwpu5l1bzx8vXjG082QCz7lt9/HitVm
         dTGXkdB53fEyYlTGbm6Du+TNhf4lPBh5u8czaVFQwNPRbr/DZyAmqX1nHilwvGqo7Be4
         9gpPf2YR0PQ0pK+vPorG7NlzwRVHVSc+vQegcp1Ta40lOcmkDfdyltN/9LCKHrSG3+kv
         bhAVnlRgnmRFubtMwXRulnIswWJvPITgbftgLyBbO6Ylh18ZMFfjc/fNVcvY1qEeF4ba
         pXWdOPTBOnyou2aYbHSbB7F2jkhLQ27SdhQZ84ozDi2Wv3X/HYgrXa36E/VF7UmaI8YC
         CAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470784; x=1795075584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=LNr0nDUNQVEiiyk/iQlwaOagD9ONcZi2f2Z2LgYJoWljKjrUXjPzqPFLqKbPvMQuaq
         IGe9i6rDM1ZJxchBKcfqssK2rIrxr1qA85bh4Ed2nLxxMHuUJAxb9lT0TOc9BSHhuY5G
         x3P5P1Ky4OftmwBHZ27xkE8zyaj++mx1bRODEm7V26Uz5LdRFwLGOTCp4UzIdxZvrV8O
         k+VH3JuuVDPVFhT6zeHVqJNTSxE5PioU8y+rT8A03kBn5Kw52FqyN2sVZ4xwHxHLR+i6
         Z3NQOrME6SjfW0mYPf0O70TjyygZy4K72/zygU2uaUvBim1xS1Njie+KAjHfeaqw23L+
         z/aA==
X-Forwarded-Encrypted: i=1; AL+hErGu/PJgttVc3IlluF/dQnA+Dc4uzUqJqDGbHszOrpHOummCsSh7DZGTNqt3lxCkTbYQCECi/uPl0f14@vger.kernel.org
X-Gm-Message-State: APuU4Z/6yMtNDM1vJxTMC5aC0yXlPIPsKPgKQ/WBzG6FJ7fFOuwFZhzn
	+31lOiMrfsDYvKIjoJNt1Q0joBHiexLa4nHiLbAzNwJXZX6ustJqS+OKanXuKd4ewcoITxVXH9x
	sZa/M5orpVGc883JumZEN+FwngW3YpJmIazsVVG4gQwOg02U28+4oaxkgsda04D3Z8SEss9tuTu
	wHijJ4dgL+VGSYK1DCHO+diCyqt10n6FjfXmYLmBA=
X-Gm-Gg: AYBFou0+LIffV61KcyW0cFBh4kNVmUD0rqFeGeHKlpOP5p9xtjWlmjB31o3435HlmFG
	KiRZy13ylYxTMboVcaujkQ8VjFUJKpRsl7LGCJDwGFP1kyr3d5a8vpnqRufLqUCALBeZKGy2fp8
	A678ukpn6FxxU3dAjYBiSYk4Z5mDP4KKW2EkYfA8/jw2cMeSdO0JVI47K034bnHINkxBJqtcMU2
	6Zi8RoWqISQaH9Swl8p/mKtPC70BVq7dUXskLtwQ1w+ttIGNPdrgEDfspXrkkzR3izS2tTI9mo=
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id af79cd13be357-947aff88abemr902866085a.37.1794470783647;
        Thu, 12 Nov 2026 00:06:23 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id
 af79cd13be357-947aff88abemr902862685a.37.1794470783206; Thu, 12 Nov 2026
 00:06:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com> <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:06:12 +0100
X-Gm-Features: AclHuK9LrNxyKqjXo9lhssRniwpPC4kGf-DKVNvzPuscWH2E16tSx8OTAwPwjUg
Message-ID: <CAFEp6-0EXr=rWY5M=L__KU9eL3UDA06q_vmPWdd+CKxR4iEYdA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7 bits
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <Frank.Li@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: iyxSK2nsTTIJMH_69U9FV6SbqugMIRvs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX7ypo8IQvr0LB
 v9mPlYJpfIAyDx4MeApM4uSdM8bAKtE6FVDAr9bmypAA+BrehrEWUGumvQXr+t9KptbpQktWCM/
 cGPQHPeDb1lAHoP7uce3rVjOsexHxok=
X-Proofpoint-GUID: iyxSK2nsTTIJMH_69U9FV6SbqugMIRvs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX4uE5WnwcJ59a
 KTB8R6Hao8441bQew5N09b7QGpUZSAlc/EYMJ70cBLO2GcXCX63ZsJ+tdBOi7BS04IjL26Ggkcw
 NF1/7hmAJP0F+AfjpIjspN66ExHgGfStVFUWUMAopVtt+bfBwN/40NgIrmqqnW3F55aPnyErPFv
 xdzD/wqr9F4hgyTEEBusKWsH28PrwB/RhVUpRuE9v+wvLYWL2eQLycApoHsJy85De/HTtUfCmgM
 WfsfqbdTaaq4YieOLPRCeWEY8/dlBtKyYhZGLLRnw8xR3eV/CvmPITZpHlUuXMNqs/Jubr9R80F
 Qg3bUQcdgxZSAcjjb7MT18ui9o6pLKjE4pkr7HyJNJPn10KE/jDvg+0L1E8Se45jWZuaNuQ6DdU
 ecHEONrS28W30lKheUhwN6etJbUALXrw410xcgUtUqoK1dUA2dt9WFCQf0KWUKimZ5W56Sld8z7
 r9NLL5JcgfGDJ+Uea5g==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af57380 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=zoG6pt3vYd9LuZ-_mncA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120032

On Tue, Sep 29, 2026 at 10:48=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.c=
om> wrote:
>
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL                                          0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)                                        (=
(n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(2=
9, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(3=
0, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888                          0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888                          0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888                          0x02
>
> --
> 2.34.1
>

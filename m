Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36833A6EB
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556428; cv=pass; b=LeAfDXUCRCGlqL5Oxk8iU7JMV9F8ZlD7i0do/oNlpd5PGZFHYaNJ9gdM61zvUaiX9vSe4ZUYJc95qF3jmtXC4JybVqYjGGVqS+RTGjs182CsrbPpjGGC3SYV6lgRatm6BoR61p1GGn7jNpyIfB+f+dfvubRoP5VkBTPKI4VB/Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556428; c=relaxed/simple;
	bh=NZeBJC9QSEBrvBodfj4dor8expShVcP7Yt9IwugqSeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4x2pnH5X5eiag4K3/RMqy67HaBAMo+CsUp1f/6Te0rrZkNGhiLZ0DCEtdxd7JBjjU56Lj+mQ+TDW0+ysOUwPb9oqOue81eo95xXGT/6F2+p5+XFGvxoCXXtQ8ccRpXSzpjpf3Yj9AMdAJx2fVrGGlW9kSOJJE5Jz25A4p9J2sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahi9aH3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdlrGVZZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahi9aH3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdlrGVZZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKhrj887558
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 14:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=; b=ahi9aH3/VFaXEAr5
	8I2va2ktkJ+UNgIhUkf332tEbBGJGMS3n3T9vHBLzRGvj47hq5PjQO8vWDr4n54u
	qbe711kjDwiLaPSdYyO2MYgQteioYq6WvMvHAvra/xOV+P7e1mua5dqaz9Hf1nNi
	oGx3Ej5UtMdt6+R9RbBcHGEjY+157e4ozXPU2lznlMFpRyVaeOTOKgYTxWmn8dvS
	dmqkK/Ds7+63M8r+JHAhUtMjWGvx1JH7lTj0SiPeV+e0Qx+S1abEE17qoBBnVUcx
	92vY68O56UVYbPAQHDSbiRirux34GWUoJ3SKQI+tCe2188ovFRyVEA20IzPA4G6g
	8sQK4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3x3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:33:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e61a8eb087so39148895ad.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556425; cv=none;
        d=google.com; s=arc-20260327;
        b=GMOyOBPWcqf8HYDREAIXvPZlhRukAFlNxGvOioqWgV8A8HmPY3eH+kZNA9sdnIZpP1
         Qj+QmH6R5nv15izva3Fl/XwMafh3s26ozwbpxCmMhOvyyeOwM1NP7FM+rKIOYt5KGAxn
         HiCJyyLEIPLx7ai9x8EKCQrKllUJX6B8fhJuWsEgUvKOlPRXCqRfGnC0p36O7ufC8HJi
         Q+yZ2ky6woetQG6awSR3lOY9xL1zfQWAx8MzGlKXm+IKyuURU2i3W1teL9hOzk7ZQhbG
         fTfQwAkwtMfD9XKJ9khsX16ZuZ+RqrhCqvHbdqdP8MbgtvOHViNw91B1MmXtntDveYr+
         2XZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        fh=ESiSANR7N1mOFDEMkZcxkggxTXhPvkQ4w1N10t2p7oE=;
        b=IxDUvvWp3dJOzl0UZL1g/E7xtO6HNfuRfSPfzx4DmPjPCd2pizWyshn9qv1K/FSnDx
         vsk6lh6nx1LynAcMvi97RoLHxHc6YRMalrfJ5RFtcF+AvU3WSQ79lzQ8k+J10hFBAFC9
         6BKGCwcoz2uVMvuPwm1Wzy6EoS6YOq0Gt3NeC1k4Gyi0A7Rl1VVeUlcgEm90Qds6YHIW
         JAkbT/pCuPAJHYi3xnjGBVdYnapuYzD0ZIv+toyE1hLnd8TPZAvcaJUL+8yLJDLZUv9D
         h17xuDYtKZtUS2fXNJ418YMMaWhxn1I+Urue3Q/Of6hXIk80jR8nRt6Ag337wLspoudY
         s3Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556425; x=1792161225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        b=LdlrGVZZF/lJwgighdxiLJwSYjA5l4krqRzgTSMrIyT4OBj4MqIneO7n75ZkSnzDTJ
         qqOAIZf1P3osjA5CN3a0fzj65rAw+Sy7G71cNVXF2Zu9w5eJrZjO7ijn6nIJFqg2aJAv
         cRZTr6DnlPIZZnktYgb0DDh84+pXN2HlCrLTqSJun1DE4kU4ypMUwJAIaBdHgLnSYxUt
         oezmzoePl2rycTSmry2gDd0HkjDCX459a6KfnNljHf/y41SWMK5A15li04SBaFmNNUlu
         wjHkaF3xibZ7un/QtE5rvAqY0xdGI9wfLqebtTyQvPh+pFmKNn76GnT2aPDc1FeV+NeT
         psYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556425; x=1792161225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        b=EeKO8AKTUNQQ38EUCGnxNxA/J2lcRkYaz4JI1c0OLP5vjby+XybQ2d7Br79FGjNVdM
         y3oB96qfzbBOu/NgMbmBBx+3kHyBjLAH5XknwbR5Q9U/H5MyoRWHA7vN3TflITdZT0yn
         Pcz/AZG/I/bJE/BlpwmVZk4C74bdPhZFlGPS4VAyp80k2WeC7IvD8vnJgmMAWBgs0eS/
         UHSTBr0W5o8MOs1nEakrzpnsybsUjQj4xrfbhcThgnqqOLKE6R2g1SRY6ZMUyHh/Urto
         bJhV7G9PIOWHflMR8Byg0AwCZxMnPliQMzYhGw6l/TJ2Vdh8ORngrR24fRdo+FNZpj/X
         A6bg==
X-Forwarded-Encrypted: i=1; AKwUvBw0bvnK5RbZASmXEuYXtlUpGm3Rh4VAeDiXCrrT4oQxYjf3SF7TyoysXjccQCcbMjPPh8IgRun2hcOx@vger.kernel.org
X-Gm-Message-State: AFq9FYLQqoP8e/KoYTDVQvMHKT26VhjyYjGbu3WR5d0PxwHlqBBSBChb
	MOcXJdLEVNcIS3+UsgRetC9+iaQ5bM93lBSNKuzIgCUbIYacQDQ6jLqsh45J4k9UgNWeNmd7qh2
	wHOtLSdACLZ4C2Kr4pmbmNvKEiA0uY33xPP6vkWy4r8zO3aDZHWnjli7raEoQR3M+YoB7I1m2Qz
	iAYBsmlm9aYUU9KzF72UWV6Ewq1NP4WTcUEZMDuG8=
X-Gm-Gg: AYBFou2kigutc8KUUUKz1Rr87BkWRv7NpxodugfqroWi9qcAvTYBqYV18gT1uB8XSqa
	j8De+Krnt9E38hFEDhXA83kwBg0/dtiQC1E+i1JY4NsBEthfH0Odd7HnjRe00Bol6+YBkxC1IuF
	qgziEKm1j4xhGQHSq9lkAIRY/kHBgHJ3bh2qx/WNDYmSHea75KGy7Y4O5f3g==
X-Received: by 2002:a17:903:2f92:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2e842cd44b8mr19505925ad.13.1791556419673;
        Fri, 09 Oct 2026 07:33:39 -0700 (PDT)
X-Received: by 2002:a17:903:2f92:b0:2e5:98d7:8202 with SMTP id
 d9443c01a7336-2e842cd44b8mr19505565ad.13.1791556419166; Fri, 09 Oct 2026
 07:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
In-Reply-To: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:33:28 +0200
X-Gm-Features: AclHuK8BLLsnCLnhdwop9PNp8hP17bfQmxcAxbY57H8p7JbbxjDD7-48aE_iQho
Message-ID: <CAPx+jO9BiY=v=BQ20qjgmq6SJ99NK7krTHTMdGcTfR_dshodJA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: Basic DT defines for ux500 power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfXxlpEPoq+dUdx
 Q4vJ9YvrA+12a1qtd95rrWlGAwbivKtnIiZyx4pHF3SipHlZNClUkPOxkxfTOZaXivrqCCWd1f3
 hsR4jLeYekTh9q+aRK4psXqzxrVcviVbeVGBoqhff+9oSpPkgA4p4i5Y0PbxX8ZwPQ4T9e7fQ65
 JBIXQQkB+ebyA9FKHYMc2uk1nLcOjot9rjGOr+Fv97kWwGJXFk4hRVxIX0dsw+MF/i1KPcIO2pi
 Uj+GWSbdL9Cnb2H/iGuaOTARIUuV1mo5rmiZCz493Ulvr0tdm4pLqCe+JfLsN/iDzj9S4R5jCXa
 3zny4/KrjeU24fkmU12J8F4U/INtYgRVaf9dA7JkgXxk5bZOilXbk/STb/pYM2vHvBvfNp5Ue3n
 FcjOQp3Vaupt8Qts20klif/kEdXjBriXv+gX2KN9br9HLK36ImFCrHKKX7xRNoiPlClP+FNYFM5
 GAVM5fhJFj7lRHOiQhg==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8fb49 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=XH1a5p_xQohBom4lpSYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: rK5A1kcXEs9m5RGNtnqgxAuhXGaCvOpS
X-Proofpoint-ORIG-GUID: rK5A1kcXEs9m5RGNtnqgxAuhXGaCvOpS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX/dwYCHD9Ilf8
 68aVIV/VrsRksz4q3YLTnmOXX5JnwXdKeYJHMsiLk1FvYcJVHIiw2CZBiobyXcDwpgvev00ctOV
 GZfoOeM4f6g1fAzI0Lw+1XPjyruP2cg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090057

On Fri, Oct 9, 2026 at 2:15=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> This is three preparatory patches for v7.4.
>
> These three are an excerpt from the earlier sent series,
> updated according to comments and collecting ACKs.
>
> It also fixes an urgent dependency (my bad).
>
> The main ux500 power domain rework is targeted for v7.5.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (3):
>       dt-bindings: power: Convert Ux500 PM domains to schema
>       dt-bindings: arm: ux500: Drop NR_DOMAINS
>       dt-bindings: arm: Add the actual power domains on U8500
>
>  .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ----------------=
--
>  .../power/stericsson,ux500-pm-domains.yaml         | 41 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  drivers/pmdomain/st/ste-ux500-pm-domain.c          |  2 ++
>  include/dt-bindings/arm/ux500_pm_domains.h         | 17 +++++++--
>  5 files changed, 59 insertions(+), 37 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261009-ux500-power-domains-v7-3-rc1-redux-acdf755a5efc
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

Applied for next, thanks!

Note that these changes are also available on the immutable "dt" branch.

Kind regards
Uffe

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39D2AE78
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784339517; cv=none; b=oexELS/LPo1+cvbJU3YqGcCz4c+BWcdB591BgsnQthv2BUbys5erpy4M+PztcXAooLuOqVFIPvJF59O8AFMI2Unfveq1ybLoFrBITCIMALPMNacxNxjpcH3sEFvrEGEq20CwlYSj0pzZE72wZFW52H45lNCBC9/1rNHlvKy2A18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784339517; c=relaxed/simple;
	bh=uktmRHgaHId2Z3bEN8aBE0IcMStiNYNfmwhY+mzHKeo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVWNJj6rVhe9Sp8AXa7BCemM19SZas/dIbLOe1L6WtpmSlPubXA8hSggJ2vN9+ACOvgoDFlruGizZQ+fmJ9QRMIDDSXw5omUGfV2L3A8sObssC0/8G0H/IEXYXGqjtJ+Jku/3PkiGElizXaQoZmUW1v3pYaU2/qI6tgfHsaH/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jnb+ttwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTnA1Ihy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jnb+ttwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTnA1Ihy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66I1HN2u3340911
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gju1xgVLjNEMVzQtIE3O1WK5Xxgr/j2HRmtju0PVRAw=; b=Jnb+ttwr0jhyQepF
	1aY+6NDraVxHWPo4ouu6yuZju56xL5DYWE+S1ktRFfQtt2s31HcI/U2gYlM+R+Zo
	dZpP76YpxlDlybZEwPKwufwN/0rF29/O6ep5+aHlD4qSY/tUzFMno3Eb74CGDXbj
	YF9io3XqDxmcbBG2BON+mjBu3A0yLrTJ7fZpfyz2HTPRo4R4iy0qbTztpsciGrm3
	71UT90oayi3ock8q6O/JbjjINzTIDQDSCPk+qHqWcQ2lMRafluZH700/o3MMD3/N
	+JX+9iaMrz1wN/dNP5hc16at6vb8Sj5gzw5DVTOsTXCAYx1QHlv5W328GoWj1aZe
	JvxpbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffypqr1y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:51:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso147178815ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784339514; x=1784944314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gju1xgVLjNEMVzQtIE3O1WK5Xxgr/j2HRmtju0PVRAw=;
        b=BTnA1Ihy7v0q0ueOiRiKyncnTxzCtAbu88gtB6uCUfQbbzJyMh+ZG+hgdoXsDY8mzV
         n8KL7RkKIs42bCQJthqObUPM2lv6RTlf7bHno2yQoW5Aa5CYrbIrGJ9KnVPHbys8tEUI
         Z4DuZiVBtGwBu/mNmt/BWwG09UWsAG0Pl1H1B2+d5tM0zMdfaYY0GzB6aptUKh0IKDmR
         dzM8Doxrx6B3vtfd1O37L4LtShLKuZ/IDB1vAK2QysER3RFX/PVU38gvxT0LiTwHFaD9
         CoVxDNMWycyrTZVFKSm8GELrfy/XymmagzNXWGO5EAd4qrBmXIU8OjtYDUFFO5TcvczB
         /Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784339514; x=1784944314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gju1xgVLjNEMVzQtIE3O1WK5Xxgr/j2HRmtju0PVRAw=;
        b=iypmrHTC5cBZJ3AmnINgNrgA4cAoO3OlrZjr6o8MMl96/TfS494AameF24fjOMNqtk
         Bfhl9AgnRIRLrhceDfWa7WvbXFL0j9YObae6vEly1VCbgHy9dPM2srRRRhRXJkzClc3t
         Y2qWGqIBov/H3rO/OkQP/p2t93LtI+OxLfjCeGdQJVktOYL73yMdehhStUPdlT+mXdFc
         WXz6/4cJksbHJsFSuJLxd6T/ZV0kQGj85whaIUYGBRjwtQjZKWSRUvdYbxB/IHuTjdWl
         MY/GmFeVsb8dsy5P2OyHRnH9lVC6sanOGngAodB/EtIjgFgJ5MkFg9tKA5yrMaMMjx2p
         IBYg==
X-Forwarded-Encrypted: i=1; AHgh+RonM0IQOf1U3TO9Ocz38oQc4IQmwg4Le1P1Wg711NEBQGH8RKsjUyVHxH/fhGqTmsm0f1TaVo7tzjKF@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXDlhxsU+8fyO3cm7qWBI97qmhaYwRiqVme3lhoIs8UxqX2dd
	qE2ECaPEPqOLjVtGKHlazi5b1HKbUewChUKjqQUPvTSnbf04HaejPLmtKkob8Rgd5vgxJsNeJey
	Hum2TSlOhp3KAyHkEVYCaiXfg9RPnEaVu6ytt7rMT5pbAy9BkTpWTIy23cW8YSZ4d
X-Gm-Gg: AfdE7cl0/gthxLqoA/6SiXfOeS9bPMKdVrDL+HBU3EgqbK+XffxfCkgr4lcp4kQQAe/
	ezMXYIpJY5p92HuNzgyHdS0hqmruKHNREOjU7cw7gGZJ3fwH5Jmh07cxqi8VxrcwzubEGCP5ScG
	FZnc3zKcHjCCJeEk/yveNToyg4kd3quMHbsZPr2Hdbel7SCWi07/ojZKp1zTlBiguhN4Q0KiAw3
	kUrquJALT3fNBGkeZHLoIxUhPdFz895flh23XETSGg8kQ+ewVIuXLuGptIwR5KbLNhKnMI6s5wM
	By5PG6w3pojiLyhPvsYz+Z2zQoF0RG4iaQAZFq2wIUb1slq6yppRw6Gwo/LEVnOI24YlxYSSfaF
	jiftjDGa/FHSuLzoi
X-Received: by 2002:a17:902:f78c:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cf348bee75mr57045915ad.11.1784339514217;
        Fri, 17 Jul 2026 18:51:54 -0700 (PDT)
X-Received: by 2002:a17:902:f78c:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cf348bee75mr57045745ad.11.1784339513767;
        Fri, 17 Jul 2026 18:51:53 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471eb94sm20636455ad.62.2026.07.17.18.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 18:51:53 -0700 (PDT)
Date: Sat, 18 Jul 2026 02:51:49 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <nuno.sa@analog.com>,
        <Michael.Hennerich@analog.com>, <dlechner@baylibre.com>,
        <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <julianbraha@gmail.com>,
        <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Message-ID: <20260718025138.091beddd@jic23-huawei>
In-Reply-To: <5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
	<5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAxNSBTYWx0ZWRfXyPof6v7A4v6t
 TpEVmRRjP32DkzDV6KfGJnxRb7M1NsSeRvMF82pg3S4HNE5T5YiCKtPPkmAa1tke0KegP453TCJ
 eYdVZnl6QthVrVoPQElKxu+pFzZY4a4=
X-Authority-Analysis: v=2.4 cv=bst8wkai c=1 sm=1 tr=0 ts=6a5adc3b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gAnH3GRIAAAA:8 a=IpJZQVW2AAAA:8 a=U5XZBdOWIMhTiLln3IoA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: rzzohG605eZRQXAUR3UwQLlB8EtUYlJc
X-Proofpoint-ORIG-GUID: rzzohG605eZRQXAUR3UwQLlB8EtUYlJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAxNSBTYWx0ZWRfXx+z7nGkttKgs
 opg16MvcC1x22idiUJuv2iQPed5Vshha2nZu2GZiJReiZ12heRiizbszRNYCEqJWaLCuxXMDcQ4
 B93oUEmSHSWmjtu2a/5WEs1l1n8F53c8T9PCLP+aA490Su0DGIgg4tZDmG2MHGPEMKNEd9iIU+Q
 R+L85Kszh1TIlWruNFwmIEBHxXnw2lMbt5dl6s2Rp1OME+zEmU4Z3CwUEKbv9DxDhie3q2Iya+A
 +pbI8FIKZ+q3T7Est4kbemf+vmlOJjBX84gOMnmvMLY5S8aifljcoeSLByWa3MdEhv+dUnJOlzb
 8S+R/huFJItX3EX15aAE/U2HIP19ykeWsalMdlJVmVdBNDmt6pkr2mTOCoJ/vjoUy+twJ2QWes/
 hKi9LY2h787hvdhVGqyJbhKxFNbOR1JV+u9na8tUgwKVCdYmelmt/UyUF+4rb+f2hbdZJLTUwLP
 4rzIBnUCSFgs/+Mwiww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180015

On Thu, 16 Jul 2026 18:09:36 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Support for LTC2378-20 and similar analog-to-digital converters.
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
One entirely trivial comment.

Jonathan

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> index 000000000000..5600c820c7f4
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c

> +static int ltc2378_refin_setup(struct device *dev, struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	/*
> +	 * The internal reference buffer amplifies both the internal reference
> +	 * and REFIN by a factor of 2.
> +	 */
> +	ret = devm_regulator_get_enable_read_voltage(dev, "refin");
> +	if (ret == -ENODEV) { /* refin is optional */
> +		st->ref_uV = st->info->internal_ref_uV * 2;
> +		return 0;
> +	} else if (ret < 0) {

	if (ret < 0)

> +		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
> +	}
> +
> +	st->ref_uV = ret * 2;
> +
> +	return 0;
> +}


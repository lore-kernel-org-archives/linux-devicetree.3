Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108953AD50F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860946; cv=pass; b=Y+AS+1JBXGA6fnEX3PHRsSdLPKJBRo+WfDDwpQFs66nsquA5feOlmDSFfsTbSokS0fCdLuBdkr3Im5vzTnwCp2/X9fr5tSl9ykJ5wAeCXNnrMPHkI/MvYoVsDhfLZbEqYbVMKhKwnWw/3KSa7SsultI8uw+XsNQaItKrqw76kP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860946; c=relaxed/simple;
	bh=SRrNYohKxnZSbgLZfgaJEvQX/4xzIBNkhGypkqbdSYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aG0e6CuUpdJpfJda9QVuOnPsLbkEP0PFtVTIpXHnVZ0Dp2qc1UtCPEhrE/TWLlAnRW6z/lm9weMGadrMHc0sZ7mcgn0iPy+FY5z0hYLuvQOh5x+mE6WTnbp/yWaEADF7oYBsm7HeVaYK0tGhUuBq2UEjop231guu9KCTPePi4yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4CCJWdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNcBlIfI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4CCJWdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNcBlIfI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7ZAmP1246114
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=; b=A4CCJWdpZcJy7BHy
	s8rPnbA2OP8suuW5zKkGi5UNNCIz9NPJono6Yo+NFMcE7P6cKFEL3YQ1NRxr1tfh
	aI7q4zEstPqrd3EOiSkS6sQBOQ0tA5zV9yQenSNRn2eV1I9Dy5OZ0teB8E6tBkih
	29VP4t2Vu8NvSrzBrV4YUItdpF+BfX9v71zmgqKq5eDdVmOYHQIFP/O9bIG6FRUr
	g71dXbtPMaxsPSLFooKadWSoq5/ELH4pDKzn69n+DUxle/6xZp8gzfFssNI3cLCa
	PxBdsStk4UKWY2onpoz3VpY519+EF1d/Q2sEFMe0ke6cqGwc1qyiRr7tt99M98hF
	9RbfoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715af6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b781542c1so101400331cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860943; cv=none;
        d=google.com; s=arc-20240605;
        b=OunIaTvlrm/Oxhox4R2f0VmuB6WMH0WcYvG3Rgj9OdVFh6/ANHKtlGCR3JSGPm+a1p
         epLPMOZCpaEm+VocRS8S4ShQIv7YgW//nXkCcxRWGuvfCIWjshOacrG6RWCxM3/5yCdC
         qelZCkjeZy9d4GRw4fZ/JJGbc/lOJRlxbkAVtVBiM/I5aOLhG4hUzoI86tAM9Ls3O0xB
         s5Nrnf35HMZh/OgFK83Pb0d13WdqUClerhstx2dYhT8TH3DYMj2Kc+0zp5n/dCs+kyE0
         /EAQi2PF0YETianm0vV8hDLZfnlvbDp7l6TZgVxW16svYSlpK/gR8ptIfCENHJ6d2uq6
         39jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        fh=V0zr5thnbvuRkjt4H1sGz+dHc/6BTTv/jbPkBx+2uQM=;
        b=K4wRp7BbCFnkM0JjZoH7jdIWwkR9T6lRejWaWLUCEP9gDaGs73Np5xv+coGfDXtyVR
         yUgSVa5mkmiYuOvpHvVwbA9Z3dmhHUndZspmsOzzzTf+QcPGbWA4O15qkQ2xF4950a68
         YNFwtkSHFI9pTwm/OJOzsz/WNXlfjJHVIr1i6o+t6CktnbyMiC9Ntr/sUsvBxtVosSZf
         Qd5b+Sse++deIGFbA2DEosDjlJTmTyT6lZKKINTcvafezsIQNyIIa5+0heZeca+LiBvg
         63almAAufLCmHy3uLcpOiFX2SfC/LkTRKq+RiEjGESDPZ+C/H9voT4mXggRWus1P5lmj
         +Iyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860943; x=1775465743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=TNcBlIfIi/L4MQNGd8PeCf0aVsWT0V/0e+aAh0l2eCuGRpFOo5ch3GJQwvMObtglmM
         njkMGFre0k92Bi85MPZs0891LHJqT66XiMN1S7qUtm5yEz/jSTWHKcXbaDQ+7nBkOHtJ
         6PTdJJ7BxoPygySqfL8tNBKlPUslv1aTPbNDkegxKwWYqw6PvyxAzTGnWkMEv3RAV+Mz
         +gtyWOJw4TNFfs2GF2Fa6x01sS1nPlOTfvg84W9yucFZfoNJX7hi4/Nyk114zX7w41MU
         v5kG683pQGkDfMjlpEGLkVpTTmAG5TirpOowEzrvadko89yGqp+Fzk/1XWckr/3vghip
         fMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860943; x=1775465743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=AIoODNveYjCFpaPUj5RSCBlsHvvsAOni5mvUXbtr4tCm/Littwq+TTpNwk2fMFyVun
         Exd4+K5/nkPe5atAzxy5Sn9QFNpAya3y6Q1rOBiwYWPIYHa8cn9Pv2sbGSGWXAinpzW0
         ZhoREG4dSp6WTsaG/YO/7/CNvg0DrP6kvVHPVDTQxrxnZ7amcz/scTT8irXyWmwDARx5
         sNNcdxHxqatOgsc/BskLjVvg4kNDJxP9LDu/soyzkLheUH6uonMsPrd18DLkHMqlZPow
         RFHovP/Tse7DgpN7e0Hi01fhO3YtN5UEOzRWEfdsaFLSt42RkP12sabalL4Bp/bqk/gT
         DvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI90OlXAFUD4UDLQ2FlnVmPPoHPJgu+6Y8+FjYjpY7S1CgNs2Xe0zPK1hgDq5Aby9+u/f6PBH3pqVG@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEXJH5B2sDJJuc4+ijuHoZclhye9tvR4BAIRPhbvXBddl65KQ
	DSj1Pp1SxzxIMJ1ln7/kB5qwNAb3vOamSgS6Eh5aOc3RdXOSQ70gxsb1ocNS5EuXGMp3X8kxJqt
	fjCmF9S9dnlNek7b6HHfhFc/ve3OUz22je8gjia5a4pAHJghEdDuIW/p8pJxZQ8Qh8EKLDLz1ck
	/r2Pbt+65xo16ytNh+U1cV3ckTtunJ1Wcn6azlpDE=
X-Gm-Gg: ATEYQzzjbox2l8FZ+VQA317yxuuYSwbB/Az4N37nTKQQDvEeeFeQwYHcKIVm0EGZvWT
	gNDqa2K5J4/EeoQXvsbYYnx9qGuLn1ICGw5We8gEQx5pE+vZK56OlUMglj9LotkStYsokXAQ37h
	Kd488ewdSmk+Rr1q6d4jqfabMy7E5RIReeXP0oKRoVKWi3rGreBsM7Jsf42nArlM5d9ScPCPbx8
	0g28AnSc4QgYxqiwMcdo5ZDCpFamswf/fbpl6U=
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id d75a77b69052e-50ba37f5c80mr177297851cf.16.1774860943425;
        Mon, 30 Mar 2026 01:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id
 d75a77b69052e-50ba37f5c80mr177297741cf.16.1774860943044; Mon, 30 Mar 2026
 01:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:55:31 +0200
X-Gm-Features: AQROBzBxMB6veijPqkgVNgzq21VJpm26IzXgh3AXCyALUcCgg6JzL9jZ1w35UvA
Message-ID: <CAFEp6-2iSR_BBuYE6t__yuRr1e4WN8pGnqJSGS6YnKVFw+YPdg@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] media: qcom: camss: Add support for PHY API devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Zar1mfcHjWwnLxWeJG_aui1vXGuK6t0o
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca3a90 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=2ZO8jXjuQ1C68hZI1ogA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Zar1mfcHjWwnLxWeJG_aui1vXGuK6t0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2OSBTYWx0ZWRfX+C4bv8ECuknR
 2V+Z6hnxPsuUhh5DI3Tc1yZT1eqo8n84MYE0szjDZbwjAPJKG4zrryc4NuVoEi5nzbuu2FhWinC
 7gbHZhpYXn54lh2nhtbQAFhy0c8RqkiIgqAqrW8meMMboPN/yJNzI5i/RhIAMgDUZ4Bc50s2nAc
 iacdOZ/+h2f0SJ+zG1SB3aXEdN9JhJs+FjfT8DUnFP6f2EeLI/Jf6MSNMKIJY2DCp2b9UIe+Vht
 eyMo9DdQ09PHp06OvSGIr9/bMxXUW4oXSVLo0X/UIWjHuzTgtYDObuk+7eVSynYbmbGRFdMMkcN
 eWH1DVDZSqnOLhXz8/FJJAfSLUJxJzeyU6ImgNyPoGYZEQtelynVYROJG5T0Ji3Zk1qtIqFajwb
 0X0GYn77SHOs9oKthzP6wiR0K24RXsN901XddFq3QUVVYm3oaESX7Ln5tVNMhBwlGZlpQ+OBTDJ
 DxbPuSQFvd5yzmBXnzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300069

Hi Bryan,

On Thu, Mar 26, 2026 at 2:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.

This looks good and pragmatic to me. I just wanted to raise another
idea for discussion: would it be feasible to always rely on the PHY
interface, without maintaining a separate legacy path, by creating a
platform_device and attached resources from the legacy PHY
descriptors? This would allow camss driver to handle both cases
uniformly.



>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 189 +++++++++++++++++=
++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
>  drivers/media/platform/qcom/camss/camss.c        |  72 +++++++--
>  4 files changed, 239 insertions(+), 30 deletions(-)

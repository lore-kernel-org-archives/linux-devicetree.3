Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A67C374197
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481670; cv=pass; b=SP3p3bjWzO2vhgX4B9Y5FlstCrTZ4memp4YXbbDFfh0iFtWi9tA13KBMrmx5mcEi3C7bFX0b1ATwi97tLoykBQdB2l68YrLaKG8YrRfB+gz35g4zLkr3C/apUO76WfHbUqxCSNm+VfjEXj11cK94owVJQw6CGi1eaWLEZ+WLK2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481670; c=relaxed/simple;
	bh=Jk9heZwOVqGxyGDtvVS1hW7MiNx1ERlOZdcIgUuajXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qc4JjXvATi9gDPq9Nr4ebGdlbnMj/yYTdSvfYqDIjc7SJQ/a7paiEfaxL43PSzYTyF+kplzQwbIIfqBp44j7v11XN3/9WOJWfbjRnemsx3cZt6FW+lvfViCYw/PgO3Ho6isOq8pXK0yfEUlZq16qL5vcdS+KhEqNxglenz6Ee1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffAyZhc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fM7/0QJq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffAyZhc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fM7/0QJq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536vX1t1756374
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 10:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=; b=ffAyZhc0oZDXLZHI
	PBh9V5mRzbnzoqLOfggjyij/WxjXBfmx5SBgCK5pslCTfVwqfAXRIswIo1wN8djR
	Q1FsswYFtYmOKGMW565DTWwgv8PidsvVIILmCr/Ay7kvVZX8lSJoaI7+FQDyGJo6
	v3u9Xe1MuI426fiQx6zHalMtl3EnNShgMzTBP+8JBr9q71DtMl/MV9h9i+rlmgGb
	tb2cYkKDYRjXjeLM0QUigYEDDGtAmhMm0cmpveaWF5WQwDHYRBg8+G198eNl5hWE
	PKQH/vGxnW2NgSbU1Fn9BlKiyZOxZ0rTRjxmv/5kV6ecIfWOjxXDf/etLEj5ryKC
	pDxWVQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff00uah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 10:14:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccf62978bfso103942296d6.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 03:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481668; cv=none;
        d=google.com; s=arc-20240605;
        b=Abqtauwis40jA+M6+zxbXci5vkH5/Vqyes3qXZCtoaB/Ga2t7Ixol84/XLWCA0vzVl
         i/UzkJQ3Qh/aue49zWs+VHm1KRuRbMPaMjLCJ+1uWKET68pkc9YYml7T8jXAC04AHG5m
         5BOBUFhAPkJevVZHaiVoimIsTcewxMJn6I34VDNfJ/2Os6T3ZmTakXVnTrDoH96aReSB
         3+FQLl36CCpMqlZ5JurIhxFmX5evG3lYjtiOFRXSkFM61XJhb7oiY41504Flw8rNoIhz
         Dmio1zBe81ZXOjSUvFyFe9/XVU8rUhah9c3b+2hAXPyi7cpONhdmmn4lf4W3PQcTxJBo
         ubTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=;
        fh=ajdJwoPZxP1EseXHjiUIxJrOeDrIAN2fJfjJ4vLhyFE=;
        b=OuiEn8aOK4cKEoZ4qIyltteY+CJtQyd89CaqA0zz7ryI1GAx/kgT9x2ln6KHN+h1P0
         UR1Z6rSvwGcC0dijY/QvfubgsVHkD1EVVSwORrGhqdMwJ7vOmejG+kkqGav9hdKsWfXJ
         BHH+tlwHQojpHRAsjFZNk1fc7Juh1UHEnUve8I0RGWxn9SAbQa1wFgOuRDzTf6uQ+WtU
         cr0Ro6M4Yodnf+Ws6iAPty83HkUPHhm1zrG33l04nf79kEahNTxFzhgcckJ9LSM5DPff
         f5GAVOq8DT5Os6SIIkkZ9ZEmTuG79yjEqQhIYalSbU/TbHOQHNiWPBQ//gURm2Uqvwde
         h53w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481668; x=1781086468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=;
        b=fM7/0QJqcxS5HSFCwhrpzjPjMY+iqm2Ugo6Qz4QRpIg30zxrRJuA/NJ7cR+BMjGx/T
         wVr5y/nhJFy2bxAQDqc/s7yXmUKTnjqzURu+vggrO1bGLGr+sPyuHIiWefR0ZyJA5GXE
         cPmUurtAWnjUbKEf1MAqE5/IYT8YtA1KxnCNSBQ8H6auAP531XIsoYe4Rn1F08R+nTgI
         qlWy6PeCztczHFoykQzxMt0++FGOW+avVEVjX2118x9TGyf+4/Bn5BZWbXxmWZajkZRz
         r9uqy2oe/ZAheMORA2LOJNFQj1Xk+RKiuNWZvlCuutEJjwBEdD7PwUmCa4c7iv9BNch8
         ZrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481668; x=1781086468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=;
        b=OwzCh9q6Gesi4czzk5h1E0deWlMnLjGC6Q8s+OJsNntTPkcr/40yE1ItrvqXjBJNYY
         uT2smklqkufV4a+C3oKAR9Y87SyPO18gX1WfNPaq0/8KEEfcq4CT2v3lqKmQdBgLyROg
         I04qcNvKKGdmtJoOtnAbBuFmBHwVlZQAlwpExZIQz3lRBj6eZqbECumAfbvw+uf0uWZS
         Q4cKQGRrm2etolrT2nggUBz3H+X0BmiKdljt6uGdzq01JQYZNColhxV9idcgsxtw5CYK
         F+GBj0hPJfl5AkInkdBD/2WAFQNwcUgQIg8kLfKSZoTNjqmNJq0nUmS7paiEtqTmRtZm
         vfIA==
X-Forwarded-Encrypted: i=1; AFNElJ9/3+GZ2aw6+U99dikIezFNvZZxZsU8H6Ci9W0DVOmca0Pytlzu5pJbH46CVOWmniOe38BafrgeX/Ar@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRMV3MaA1OUgCfGhgDJ7PtZI3GYrwvxCV3EJdMgMfAJW3KLjq
	2y5EAKzLp7KhatUsCFbDIyEYeayIVtPTNq6gPeJ6iR1R+zi+5bl4nqUBkzu6dBLJ0AJfT7eAdkg
	dOeg1loa1fbym+EQs8pSxnUL0LW6l2ME/K6++wL2m6crX07VozuQRZLh/81dg0hW5Ge0tEc8ZmJ
	9SHM4nt+J2L9LmS4Nn1LpeG4v307dpCf7ioJUwMXU=
X-Gm-Gg: Acq92OEj5CO5+FrCfYCKaOq2I43PgYofExlDTmDNQ8GFNb1hLOBPk1qh4tlgnyoVtQ7
	LiW0gNNZsiflFF4a4EMIJmh3EfO3ru8YVa1/xiRU0e3O4AAHHlUxM7K8cu723q4P1xGfvUhY2sK
	KkkMPJaLwmV3DrdBrsX18XpVYarFkNzUvd8ETXnZUrYXTr/9yPBsn4+jkS6CRB8eb+6XrhEGHuo
	SNMGx4DaYen0k7W
X-Received: by 2002:a05:6214:80d5:10b0:8ce:b2e9:a4c2 with SMTP id 6a1803df08f44-8cecdc3c53amr29190886d6.19.1780481667844;
        Wed, 03 Jun 2026 03:14:27 -0700 (PDT)
X-Received: by 2002:a05:6214:80d5:10b0:8ce:b2e9:a4c2 with SMTP id
 6a1803df08f44-8cecdc3c53amr29190546d6.19.1780481667501; Wed, 03 Jun 2026
 03:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:14:16 +0200
X-Gm-Features: AVHnY4JP4vFOFIbIAZX0F8fhDzCXCFpBg8ic4yZD31H6-IgYc0KmsNfVvQFDArk
Message-ID: <CAPx+jO-urBm+rTHwQaVYk1Qy7senTUrSZr0SvEi8bXsxz1budQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: sFV7tjLcFKNgSfZBsnjh3VuZxfK_O1cF
X-Proofpoint-ORIG-GUID: sFV7tjLcFKNgSfZBsnjh3VuZxfK_O1cF
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a1ffe84 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=rNwRBFL3uO6c_JmZLCcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX8bn9mHqZGIql
 yMqBi7xPRFvgLQ3m2sS1UZhT/A/JkQXYq6bzeaB7w3tKoErsMaKU/424JKb4v4CDtvTppTWDL5m
 Y8gV5JaFq6Azwiv6H+feldmiDmlWkR8gEnY1rxk/5KOoeZUgdptZmt433G0JtoExLfIJQv423Ju
 921yHVc+4Th5x9jaGnPnntTspqtPKCZR1reXhHVrplhgZPAz3CnyLuEOEuXdk3c/kM4blrlfmNo
 hRWptUDVel5r6xQYPot1n82BWepP4oxzxfT9Pbu3Svh2B6JFWqv4bzv7Dakk3wPiyNKDDygZnPX
 6A4LV6m5AMENl16UM09CdqLWZDxd175muxoRdg49O25N34Zd+hMzr/5Ldc1pCw97X8ERB4eUUcI
 cqlBlIrr4QZ4RS8JwGGd8vIzJAvqJfljVakcsrEm61eIRe5umh3EofCaXUwai1U/2HDJ2WFuugm
 JaNFbTcxHZbD40pzaxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

On Tue, Apr 14, 2026 at 5:59=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> This series adds RPMh power domain support for the Qualcomm Nord SoC.
>
> The Nord SoC introduces two new power domains beyond the existing set: GF=
X1
> for the second GFX subsystem and NSP3 for the fourth NSP subsystem.  Patc=
h 1
> is a preparatory cleanup that fixes inconsistent whitespace in the RPMHPD
> define block before the new entries are added.  Patches 2-3 add the DT
> bindings and driver support for Nord respectively.
>
> Kamal Wadhwa (2):
>   dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
>   pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
>
> Shawn Guo (1):
>   dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                | 35 +++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h       | 18 +++++-----
>  3 files changed, 46 insertions(+), 8 deletions(-)
>
> --
> 2.43.0

The series applied for next, thanks!

Kind regards
Uffe

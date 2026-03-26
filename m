Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96DA35F612
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515557; cv=pass; b=DFcpCWndOh4n/OzKkkiJX2fsN6Jf68K95Zf6VFGlK6AEajvZbvt+sZzDQgkIwt+ug11+W4L8RY6gZ7xC/fLQLALQr5EMqVncq0eSdPMuU/UTaedno6WaEqrKu/a3NPLYHwsLTqRCAhHEDNMLpoml+vk46tVwBZEG79TCSlMvUfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515557; c=relaxed/simple;
	bh=Px4H6+Jn1fJXZv5W70EMXl8iv8Z8U7eG0T1zIOCbYdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRn/lm3YDCRZLwTNRRR6FSpwTZit0d/X1E19ilR92uxJ6oWTThoXkFdJcpst81XR8A3ayORMwWdUTj+odAzRS1z91rY5SvRs+BwvYRaxJc2iZiGdsZyQWGn3W7TgcZA489O8Oz2ARp4c1KoucypEUQy8z9uTKXL7tYThaiICTjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/eOHtnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5/aqDcW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/eOHtnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5/aqDcW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8VDtG1432136
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=; b=Z/eOHtnJcz7u7hDU
	SVr0jYOlDBWYp2gczFoshuG56R1wBuPz7kThQAqVCnQkGnpu2MneNyghWrm1oXNZ
	oYZERd4I04X7DkTYpg0z1cVHDhIUx4lU5nkERRZKRXMK2gnmHWmHma47K/h+BBtS
	V+R1DjtTxDsTFt5qizlbQKe/C7araLYRxGjKKMcnjP3ELftbnwYNH0hAQoZq8poI
	kmQBDdIs/tIyUKZE5wdw7cSL9JTSDuiu1ZZPZv0i+IbtjMaBuxERej9C046x10GB
	HgPHeM1W98xEDWz6e8Gn7u6D+60AMBOyEqfQREnzmmoMJ0sGNFN50+kd9pDqrCMO
	sV9qWQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc536kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:59:13 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1270dcd11c1so745618c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774515553; cv=none;
        d=google.com; s=arc-20240605;
        b=DZEx4y5RC8mofZuN566PXs3JLXfrRITrVU2LvbhVnvODmnRSUZypKhwjmIbxcoDgtQ
         xmFTjlXrz0X15PZ+dl5FXjuqh3bF3tEQF1Eze1WVOmIgZHw1HZY7FAi6orHWVJym8dKG
         2rFSl2FyNMSRn65ZIVRFrP6KKhVnOarhDIWFxwJRNLSJVBTXUXpHY0QtafIivyKr18mT
         rg1EZgPUIcJB6JTe6uYiIY2zEu7AUyo4DweXQiZQm5eLohHNakcaZX2PlpVRn9PoSXPt
         efx+jJP9fGvuxH0z8b+zB9f3UUO4nLkGJI/+FwYRCxlhOJ8GmR+6RhMDHCP+/IucmhLt
         z8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=;
        fh=TojvvmhirK3HoBALO9BFf9t/YopfmYeLqZb3m/TLJgE=;
        b=VDk/JM6pE8oF/ybLDyVBTyUsZROpmQ0Jg8iNH5ybYqBb2zi/fuzKqq2JAbvzogfTVk
         omm/dPibklX11Sgt1Xk2XKsHO8IDnh/RfvO75SVsdsXciZ25SXaDgi7zrZbNopkPF8MZ
         sszRWU9oqyEhYRLLsi+qs4uN1zzqPAXj3xY/UQc3GzovYeMCxsYHKM0E0IOWfEQTlQWH
         j9B6OBrFZxQIR7lVj8eJAgXnxvY8Gi6aBL+gmF4yT/qCVU/ZVlKmWZKPKukTE6j1E//M
         5uok3QTp63XVDRb5JGrk+nPH0IJqOapgDMsQxvvWCYTPhZB57auWIKrVDRco6+Kdpjb3
         d3MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774515553; x=1775120353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=;
        b=E5/aqDcWKMeaWPk79d2DUh0oiT5KlPVwe86G8U8AApwXfegkwNhHDKuOVUiXPwBCVt
         Bp4dQVRrV7IKcow+gub0nFoQL2oM+iJMYdnHSCuaPQlDYRZJ+s+al88KVUxnfhpD1hb8
         LfsBF1Iwff++cFjM8iKvqeUepQ0+9RA5S8/JXRCfJqtN3F21YbgEb2IXzt51A2xvpPg9
         trg/Nk2UAbrJrkT6BvaOuzNzlFkxXR++FbCZoIFsRIaQmtgh0cyxp3MiJzGf6QTudz1j
         jSkkuytnyIHdDmRHjFQvMmS3yn22VMXDVLZlBYoVWOB9D+YvyWkht+8b3BOk7Q9zT/oc
         IvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515553; x=1775120353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=;
        b=HFZ4v4KTePWjb6xfPZp3hc1tenaiI7OFnyPZRjCfia/X5dNBCAmNS90ZMxR3fTDaOk
         XO3EFjPBmfsQi/IKuNR0/4008VI+VXTCF0xNa1Q/jf47K0Ucj2ja5jamO6C21jg0Dnow
         njOqfEtaCODiTMATDn1UGsrEjiBWkCQYUTMlia3/ApZns+ZBsph0lUB4ugs5DTDlsicw
         IeCngGgOikUD3fVfapQYAqkPlvUg/i+x6zlyGJ7C61UUkg4IKQL6cILA67ZAgvWRcUEj
         jYVA06YCPrtSK2PCLq8qLRuhuYuaVxQ4ThwHdjjAeu3c8hgiCZOtWUntGVwlwV/yvFvm
         Fixg==
X-Forwarded-Encrypted: i=1; AJvYcCWXtDGO/dbfvLVatSn4QTam6V3GzC5WRInzlrovWy6vhJAA2QTGz7bnDIl6+iPehtq+ddNBKoofHi2L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2H3vODiqSNzELVyPKQiFzsK4LolRB2jDUsMUFsBOGY3qc5GgA
	vG8YDM9MvjotIi8BczepPcfh433cfgiuJ/TFR+jOgujSZJrrBneuzygvurdheNaQCfZ5+G8GmTh
	QSom1jIUTQCudnZXcLHhivlpRIzLMhlpiXrkcuuQAZqK5Fw9TA18zh9JurZISH+yKgSC/pkJ30v
	2efTJlbLzhqx/m0m964v1JtsQZW93Qc7WSe1NtuzQ=
X-Gm-Gg: ATEYQzyd1/RXnxGITfuCkkXbP/P4mU5Fu8ABL5Sifyk1O9eQTRNMhGZg4w4mAqljG14
	+GmBmlAlN7OpYe2rQ3sVWkCOY6Z0MxLYXU5+VDaINBR+gLJezll6pOT6V5qyKM63PCe789K9u0K
	D7y+KuxaVezLqdbvmDA21BfMW4nf+SOhxFix8gjuLUgD+8ybrQIJwI1oEDIJsRi99WDiRDnU8YG
	NV1S94=
X-Received: by 2002:a05:7022:ea2a:b0:128:d1cf:8ab with SMTP id a92af1059eb24-12a96e46fa2mr3330863c88.6.1774515552570;
        Thu, 26 Mar 2026 01:59:12 -0700 (PDT)
X-Received: by 2002:a05:7022:ea2a:b0:128:d1cf:8ab with SMTP id
 a92af1059eb24-12a96e46fa2mr3330834c88.6.1774515552022; Thu, 26 Mar 2026
 01:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 14:29:00 +0530
X-Gm-Features: AQROBzAUo4DH20fFy9231utP08t2yCcbvqzwHE_c69J9vb6d_jOiVNCU3yNfHHw
Message-ID: <CAGptzHNDSYrA9U0-Ej-Ay6xFu88inPc1RM04j941HOPwQ0m46w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing
 ranges in example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: KnC9dBJRstnAn77kAOKodvgn98rA7NO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NCBTYWx0ZWRfXyjLXsbT3vfIL
 mffNKJIlpEKVm7srzysssjyocGqFOqxc2W9Rn2Ljsi84z+b4T3vhy6OSmWFZq5MDR73OyvzOc5X
 C7ejPk+1bP00o66UBUqbWaaMulsEoniVnL36Nr5dqhwrNV2jNQEZovHGaZyis8uzsFPKJWSnPd0
 05Y3USllNQ8QhOLAEUNcynrFzN8YXgY9r4thezLxgikANS3NAaKk3bu2jDOwTsfRI0M2079oIbR
 A1NfpKjf5lwX2oEaYq3V2s7+mZzaNvqZayyOzbB4KJAOiAYl2saryAAtx+DHUNJESjcXtChKy9G
 K+ps3SwOavDKyVLW3YUCQS/9LGOaP9ODLYA3vAam0QxQLTZl50fPgMnKeXUtYD1xbniYa7Ut09M
 jT0dR0Hcsbaw5hhy2uAqUP6rLHl/QpOKG6PdWviKL/j8pNEnKVQJEfIz7tA06PBSMN1St1MAbxP
 cgD2gy6+KiNRCfzsOUw==
X-Proofpoint-ORIG-GUID: KnC9dBJRstnAn77kAOKodvgn98rA7NO9
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c4f561 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=u0WoYhsv3NxjMHURO3IA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260064

On Wed, Mar 25, 2026 at 5:52=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Device node has children with MMIO addressing, so must have ranges:
>
>   msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2=
290-mdss): 'ranges' is a required property
>
> Fixes: 966a08c293cb ("dt-bindings: display: msm: qcm2290-mdss: Fix iommus=
 property")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Fix for commit taken by Bjorn (Qualcomm SoC).
> ---
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-m=
dss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.=
yaml
> index 2772cdec7e42..bb09ecd1a5b4 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yam=
l
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yam=
l
> @@ -108,6 +108,7 @@ examples:
>                               "cpu-cfg";
>
>          iommus =3D <&apps_smmu 0x420 0x2>;
> +        ranges;


Ah, it was surely an oversight on my part, FWIW:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>
>          display-controller@5e01000 {
>              compatible =3D "qcom,qcm2290-dpu";
> --
> 2.51.0
>

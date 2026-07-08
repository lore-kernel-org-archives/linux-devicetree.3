Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A044212E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514387; cv=pass; b=aw26LLpo17MoXKaRNYs8ZgHHJuKpwHE8LAaaXzL7hs6k32MpUP3+6N6TtRYnWdqt9QvvyjKOzQ7zHqwRz5EVrmtVmdg1vV9iRW6ifiHV1T2FRBFX56iguV8TRngNxeihV6hZQji9Huwtj118ZJNRBtoykWwK2/pwr27smRq7HWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514387; c=relaxed/simple;
	bh=n/sGbbutQ73G342dpin2WL8qTmPSXEGKF9D4zc1iiXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Us6mdyyZNcgwcVRb8DEPUwV2s+kezHBv3llcT611Pw53uI13KbnTlaZbfpiPVNTqH8iBPAzCGJXSK4NsuNaQvU1KDUwhuqMhD3EY39B88kw4xQWESBTfZyMsuiysNm6d0qYWp4GE0D6hYg5pMfAxdhu4lcEfrBdhPfEdOVkUjy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMutdXuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ja3UGPQB; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMutdXuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ja3UGPQB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3hdS2580093
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=; b=WMutdXuMbVkKPC/j
	6HN9SqXaZSnN4OtWCnX8k4AsDfDfx9zvXEslzfZbDuBENNg8QNebTMaBz/dFqB1m
	OHhP5nD5UhVqtDryA283LgRfFPUFnRtp8tQiVuTITPeP1QamoPF1xuIHG+oA39Ri
	Pir7o6URI7gqHvWJFOv0H/qBblZNpDNvzkji4i4HEm1oG3o7qQ7kBMRpK5Djvwg5
	/oDq79tqVMuUDBGiJQB6sC+hgxrAoLAikyi3xWNseZ2+8+8ZmbItTvMf7H6A2AK2
	16niAirL4jz45iWfDJ20W51WL3f8c4c6//WmPFK7pvxGJF2Y3C9p/fkgnc0cMs0r
	Qe56ZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gaqjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:39:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efad04d884so18745366d6.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514384; cv=none;
        d=google.com; s=arc-20260327;
        b=Am1CHvMtT8LMg35hxF/vKzKENzeCDdpQkNe1P35A3IL+cBLjv4By81cLQ/e8dABgdK
         Bz1ef0H5/zuovY7s7YlBmilpd0S5PpfNYRWFeBuaZNiy0WhTmNn6eUY+y+XQl2RFXX6M
         bDcbRuvXFn77p/cAGqMQ/lkaJGwPp5flyGg7g9zmOG8/QqTa4MT9MrZSz9+7q/INpN9S
         3xXrpiiVuPYrMvskKR4l5fQsEBbOl7WcEkanNKZgc14rHrs0OyXBgA1W5XLJjstQ5z2x
         2S9oocOsZd3d772dlmIZUqPPiliKy3tnwiqKOEfsY77DD7NMFm0ZdgyR1TbaS7WUHyLc
         qKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        fh=VBJoFkB6QrJ8mHjOQS0FW/wFGO5O+CEuvQgqHIKI9S0=;
        b=UlLnYokdKs206ZELaUhmgRFLeIrACJlvAUIUYu7V4Hr4UHn81uRwMlX0Z2XL9AQBKK
         RJhNgJ2tkIoiE35IsMQ0uw/u2pfwl+zGjewSPlR7Gds0OfU5Qwsnf72jadTEvdeFikwI
         lxyRSYCbv2REMaiyb3gt9wmtghxfXmXnI77BUKrYt0f8NLu3FHQ6Y0coZJXU79Ho4XEc
         etlwT+Zth1wmrVSR9zfGVxI/hHF+hzpCZvQflxAPwArmOJRn75woae8ztRGlQQsKSaBr
         YWZczo7FR73KsmBRmgkqUniMLtiWlrBvNeIkXUfLAAJG8kSm4VGIod+YRsw8WSXCbwqi
         O3wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783514384; x=1784119184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=ja3UGPQB+LrSaE7IbXO7DRf+BBWAP0NenUr1rAbjQq1XdTWDtApLGJzjb01Bf3s6+7
         wjQABJfMnsB6GnMeLkoguC6MAojP2tVwDhAvnaeAncgZxsugijWzxXJnYQol0J9EfAvX
         fWUrKqWIy7pSFr9CiM7jv9GHRCJJ2qiEijb7Dv5Vx9OhnDqWeDP0xzg6nySyW1kuR9MV
         V7+6re3Xskw1jhABPwZ9jxuWQvDPuPdylhLOt6tT083pnxfITjAUhbp4ScrXEvsOF/xE
         7J/JOATgQB04h0oys+ybCGl+JJLsW7srPshDTP1TvBllz2EH+IfMUZSqojKRU1wI7+HO
         t6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514384; x=1784119184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=eHII8u0ltbPyt6axlWM5MpHQCywJu5NMIdqqkQ8UwBPQ+sVt1eJ1pn9IYWm3w5lHPs
         RFe83EuOr5V/FcXrSh9LrFCZjzlmwBm1dar67xEwcRskCYN6VScmVXv9WJf5i2dUHGyo
         6DvhaIXmMVGdfeX9R7INLuO8q1x6aw3g4MnaRGTVfxqNBi/zuNR89ZSnkcIFskSw2OfI
         CYhjFxnBxN9o0eHe0jyjVEXJcIkYVgwHI6D9EQ7ZW9YMg8X457dtjm4DLBsXDU1a+NJ5
         Sbbct4qOlJprIZjIhD4f9Ju/UN/v7Q47siDl4JVkho5ZyDroxL6ayNdkhOW532sJI0dn
         k3NA==
X-Forwarded-Encrypted: i=1; AHgh+RrBKQ2IrnDVFQGIK/4ynDrVhHvCHl3XrNkbsDks+e4LnHoux25cv8J4Edg1avzLCtk+1/Rn1idYU/qF@vger.kernel.org
X-Gm-Message-State: AOJu0YzBG+qjtCzqX1hDNUNKbxtnXbFzoyTnS4qdHdIN1Za7Gl4S3u6e
	lPfjCvOEnXxCBZix7eT9WsOBRZydIxe4zxCynOCpMViexn7Br2Qma5uMZQLxWX0fXyxlGTZCvok
	MzaGaEyFxRrJ+zKDN85JDHg/Bbv5i0rs2KcyRmg3K9j+04pkFZ/89S6KmWn8BpA6RADKBRzQQsa
	qmg32oHtqyGxE6Wo0dinY8U9m9G1ewMS1lF/WhGGk=
X-Gm-Gg: AfdE7cl+HyEzvmmYH6ZI2V7r0j88SbHUfkvWuSKGY3oWNeoxpF4Btue5c/k8yqmfJ0s
	qUiu8V4wn/NfS4RWqe4GCwqCyrSSN6MKygwHN7bOy+cvnV6x2MrS4lLnCUZOfCh751i57N3XVzk
	uEpY/8OEdx8tfVbGMesH9VaMaLJlmYf9+i6DtELtuTVtHNsibUJKoC70Z1E+wb60VxOqFM9NnbF
	RMBNTznSGGpMwc000DMCdXZDepk8DOVFDKcTsD7KTCLN4rFFSNXXC/2FUf9z4jqQ1vidasHxQhH
	mO/cMhUoBw==
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id 6a1803df08f44-8fec35246c7mr20100966d6.59.1783514384038;
        Wed, 08 Jul 2026 05:39:44 -0700 (PDT)
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id
 6a1803df08f44-8fec35246c7mr20100466d6.59.1783514383642; Wed, 08 Jul 2026
 05:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:39:31 +0200
X-Gm-Features: AVVi8CchIqRSdmxO0bXp2YqtKRf6VLcwQniYXaK_pILrgpsztuik_wMDiAIIoR0
Message-ID: <CAFEp6-3-OZKpn-2WV8hKC5dsid9X-usjmiYLdYHeaDKqHGRonA@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX6vyEi6uXTjs8
 qrUsDR+hxRKhnKdKWKl8KwhRBDFGr5g2pGa4M4N6wL1TKXmWm0bA0kBims+9hazwB2L4xDhKQ8F
 yastwkeFpip4gmcREV321O4rQn9ghec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfXwVBLemjw8aKn
 UVFLgJjzjEhZ/Ry34ML69FtBtDoMn5aOPdrtaNwjdxSlD6sDqjbntfStJlaOmKefHZrP+Zxa0U6
 D4464oeCHYVgSrxRTEHmfsL9nEi89Q9bbqNQ0GB1fM4HAtWcin7SMgF0chjhMwUG2iIRVAX/pI2
 5Uy/bgfAZDA8LXnoeA0pS30S8JQK1rIU9AxOTdRvpOTmx+EnKfxamEAeo5hF7AfegmBaeVPV0aE
 71MGOuH0xR5A7U76bt5uZvJZ56P4yr1FkvGw+buDzq5YuL++At4GMzBdaDFcDfajJQzK6FOXMAj
 AOVXU3yogYnRaJ6U0az8ohGKd1G00c9bZ4UlOrdB2OQMKHunafy3gJQe5v2ElzgxwYevtQdnUvQ
 njZhhgLIHnwljNpmMyUWlifYEwn5duG0VUY2OHVcuBo0AExQXa6ON+oYyDqHizI+Tgh5ysG9tBd
 vej2BWg1N6Sb2x8Gdfg==
X-Proofpoint-ORIG-GUID: uZ93a8MajCkLdHhpnhkVKMzDQamORbIJ
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e4510 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_SFytyMYinpwrXg1NNAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uZ93a8MajCkLdHhpnhkVKMzDQamORbIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080122

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The original iommus list included entries for ICP and BPS/IPE S1
> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
> CDM IFE. The remaining entries serve other hardware blocks which will
> be described in their own nodes as support is added.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++=
------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c17b9757b2c86..c4454355f07ea 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -112,7 +112,22 @@ properties:
>        - const: sf_icp_mnoc
>
>    iommus:
> -    maxItems: 8
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +          - description: Legacy slot 0 - do not use
> +          - description: Legacy slot 1 - do not use
> +          - description: Legacy slot 2 - do not use
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
>
>    power-domains:
>      items:
> @@ -361,13 +376,10 @@ examples:
>                                   "sf_icp_mnoc";
>
>              iommus =3D <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,
> -                     <&apps_smmu 0x1800 0x60>,
> -                     <&apps_smmu 0x1860 0x60>,
> -                     <&apps_smmu 0x18e0 0x00>,
> -                     <&apps_smmu 0x1980 0x20>,
> -                     <&apps_smmu 0x1900 0x00>,
> -                     <&apps_smmu 0x19a0 0x20>;
> +                     <&apps_smmu 0x18a0 0x0>;
>
>              power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
>                              <&camcc CAM_CC_IFE_1_GDSC>,
>
> --
> 2.54.0
>

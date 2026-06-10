Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A853BB695
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082083; cv=pass; b=FnZI1GKAAGcwFIH3SOXcC2xw9qI1YWI9hC70mZ5UiGjjef0u9/kYDPJSVNBunnwzRGafMlnSEe9fps0OqDS3qiv4vjnEksv8ZIZCow63arobDzjmcKYMepAEFEz322dS1TpKffgVsv2s7SyloYJ6bXfHHfaNwHe7MAHTSWs4cwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082083; c=relaxed/simple;
	bh=ygdIc/5cpQph1AaBtGCq+v9bKpdzx46UniyIDnMjYws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsJgzSuRoU5z9ZQfBx3kTnQ6FVDnDVCZ0silvoBOJF32Fn4ChGluL+hdQs1VI6FCoDQk8oVpC3JyR0bcadn6l3JC0TvgaJvrLKsK8eta2C63YlK1K/0BvXiv4NP2imL8tccY/vTFUwqE+9PnEN2r8wSRRpQSP9Ry11RDThBvTDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nR2HWt4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fy6Sdmbu; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nR2HWt4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fy6Sdmbu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hrxM3151704
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=; b=nR2HWt4M3gjNzZQn
	y4goQ+Y4ILHumR7+UOjs8u/yx128NLPk3ij/JkR6mbAvO+asUox2H7uIAuzcbrxZ
	NoICkgA143UJ5xxmikvQzNCjitjoWx/IxHquQNH6OFuycf5YFu+SnQS216b2igDk
	Xqqxb0MRgNEoe9cu/SfYWv0Y+l3d24FtFwS8GGMs1cBbUs6saEz6t63/MCmMQHqt
	bzuk4z/WxhsMGGdmfj3WTenJBza/N8QawmXiewtWccZMwdg72adf0tDLsO8rYd+b
	UMFlifF+wq2mYBL/x+ULAX7CDRmjvstQ5dewzYhhtDoYSkkWfZiAhKTwvtRq0nhS
	SN5SRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesmx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:01:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91565f8c589so1094077585a.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082081; cv=none;
        d=google.com; s=arc-20240605;
        b=P11hgRPDf8GMovknuSyhWZCja/1vvL9SilXuDpuP6tFgDLTfmb/n/ii6P/7KJxGBCh
         TvqPHLobGzFRy2xt+0ZX/lxrJWAnpUunDorygKmQ9FuhceRA5wRvlwy2pJ2IDGkTWI74
         86ENAYChIlotnGyw16R4DxP2URQdTx9PMNYgAEEYH+xQh/1w5f+CFvvNQcy6eytBWRNV
         0OZ9zUx4jRbj5q+/JldCmkup09M+eAGYIUQuBpCqmsK4dm+tNNyzkOTGOqythn2vzCce
         ZcQcJ0kvJwp1CfrekDFFxeBf0ZztchzrfJH89M7LkIWcJwEqU+vvUUU5VZidr2P2babH
         nmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        fh=U4lUpPZ/KmPMo/cBs1ayk3fSwm6DCe0jvynXksU9Aak=;
        b=bCDMkljCEeob0lFhetMsbRsTB3zzAHvyQd+amrQId5nv6MQKG3Mzl0MwZRs5EsffCD
         KZ/DRes4hgj703pesZqWAr0/sDMRnVz8H4coBa0U/LlvYdxB9BlK5LcCzkhyna1L0RBv
         yibo329xufXK7/mmGJG2R2BpAsdv+slyi6es7LCtSkGLZxtk3KONijOkbQ7yH0AEDcRT
         L3E94wy7JF5hzzJJBfQdJCAVeZJR1IEnwSQKMEREYKoAi0mT8kj8UGVxVw6FcGkOURMA
         3Zt3XIRrp38Qeq1abX66Cf/hwrbNfCBSj1oee686VC8iXdx5VW/bOIoeFxBBwvuc93uF
         O1tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082081; x=1781686881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        b=fy6SdmbuZrI4pYRh3IMcc4ao82QqlGN5A/GD2p8E/wHp7Bs6RCI1RuhP/WYib+tUgE
         vdDIOSCrQL4eyBjPujy7H1+RErZvf8foytQU7mKgLFbQy0k7lq00hjRB38SNpYTXLc+r
         kN8GI7lbMxq5DETd6m+ixA41jxq3O+5bRaOFOOL/UDgYcrdI8Pu0gwb6CnQdNvhDYI+R
         x3GtwOUiNAN+BFXzmnZcxblO2zuOP6jyvSKUmisEvRHjoMhcqz/V2yE5CXgNryWiI7Kg
         hpq6CVf6qxOyCKBCvjJ9m0Cv8yIf0RytzNeHRYRLt+sxDZrsSGMTPbrrs0eGF5oCkLLX
         eY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082081; x=1781686881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        b=EkK9YbBu4GRioPP5pAUacMHVDeFXbN00XItBZdnLiIjsBNWsyXcYYp2w2UcgSpe+8W
         MquttxXEGWcu48kkILFLZUi153zhAEdwnUG1jTRR2uoIHxt6q4UyMP4Elv5/MzQll27c
         CbVLPoTkSQ+FHwB4IDUhjtPYxeADfy0fB/Hop3e+3qIMGDxTuisBQyr6LGhEv5XIdzjy
         XLYoquAn5dCwcScAMTd0CVoi4YC5iYS6RXDYldddHfqOn7ZB0fBpm0ASbC7xfvSgYd0h
         STkGDcArABYKw5905vToESpS6akInpQMwTCAihFI05A0bZ/pcQaDimzXR50bmT/Ft2SQ
         7R6g==
X-Forwarded-Encrypted: i=1; AFNElJ8Cs4dz13uPkw8gMoh4ue4V8d0eRMN4i8pnV+vg34yNE/LL5ZHoYaysI35BDTLOXdRbIS+fpGXTZ/ur@vger.kernel.org
X-Gm-Message-State: AOJu0YyzwUC9j2XmntA2FFxHeZzG8BLnEbi1p3YsV1DVUPZnnIpV4CIv
	ZS1FWw8e6AKCj1/M0grNTANqGNZrv1xNdmpHe9emr/Hzc9EEa7tOSzHyXGgvYUVQpHYTRo9Diya
	lAV7Z4NOYnBfNZRhOIg+gujlhS64CXlnfs/9Tk7Cb+fHy0MK5SeoPsGR47fpOIA+E/XtjO+C5x3
	zGpBKtbaSCHMum7MlAzS+eJjYcoBEpV192IehmnG8=
X-Gm-Gg: Acq92OEcuqX/+CNTr2prdwvCw/tbqsccl91djdhrfs1Auakg0NkIwg1HQqzOKfD671a
	4HCOTeL51O3EddBVAKK1gxXFaDRxHqNj4rD1swFOnSozfhZ2zqYKgy94JnzCnxkp/kiUT7ZcvSL
	TKPS7FMdU1NRJS1CK267I+mqlKuuVkQoFYuAB9/ICY3W7zTFB/SaGl3xGPupmA1m7NcXs9oIHFT
	xjEVccMbYnIhJArCE27ugqlW0czB9AjQr7n/uRjJbUYk13J1MDImkg8qrGOFI0BfxecmoAzic5J
	DiDmtiN0EOvKuaquE3nQWByMJyRsDojn
X-Received: by 2002:a05:620a:1714:b0:914:bdfa:c782 with SMTP id af79cd13be357-915ad2f6fc0mr2781875885a.29.1781082080762;
        Wed, 10 Jun 2026 02:01:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1714:b0:914:bdfa:c782 with SMTP id
 af79cd13be357-915ad2f6fc0mr2781872285a.29.1781082080344; Wed, 10 Jun 2026
 02:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com> <20260610084110.95B9A1F00893@smtp.kernel.org>
In-Reply-To: <20260610084110.95B9A1F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:01:08 +0200
X-Gm-Features: AVVi8Cf101Etup7zdHfqr_Gk04nLmdhi5b2-2xH0c7qSlPjn2aMb_SPkRj0J0gA
Message-ID: <CAFEp6-1j9Mfo42HRUQC42uFZRtLU+O3XNQToHDbtztCcdM3zgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: SB7_RLEjuZeqq3LHUO-2gYdQ4HQAqpnP
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2927e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=FtrjkMYBM3xUHZKazO8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SB7_RLEjuZeqq3LHUO-2gYdQ4HQAqpnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfXzSUZTA9LeYKC
 /ZRoGHajvsDoyPrd9jCtCHRB1ogeSF4Nade+4O0Y7b4Ry7vGN9Ce8BFnDBhuzpdKNj62lgpGuTx
 MhB7QylP7SkvFYQJJhm6UR1PndiaataOUPA14xWP+UJggoKKvNTj3HC0SpSibFyYFPUJpPTcrTa
 Ls9iW2hz5v6H/CD+l1eTUXVCvD68kNA8J6eKyxG2cqVlsJKGTEsND7pHZZweYu8/t/2kT0bUtp0
 V7gRSvpeJXEPFCv+dKW0wbszpALOf1H6A45XmipUBfnIyAmLBjjT25zaG9qQqilG/BoTzLuBmSf
 kSDHGg3zU1uYmCGQJIbTsGV1A4AMb9tUPKJf2xj1rtsDcqbCYwXEFkQgaKinNWynH3E2A8SnFB5
 VTfTywaVwYjcSYjRuYKhHHAspRoARatE/ajRIJBEKztIct22c0HbqtsMFv3JJ3mg7WFCRh0gJeC
 bF11w2DYa3ypTlAH1HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084

On Wed, Jun 10, 2026 at 10:41=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The `ti,ina232` compatible string was added to the top-level enum=
 but omitted from the existing `if-then` conditional blocks that restrict u=
nsupported properties.
> --
>
> commit 3cd10611f4c71e7280e19fcd316cd7a918042ee6
> Author: Martino Facchin <m.facchin@arduino.cc>
>
> dt-bindings: hwmon: ina2xx: add ina232 compatible
>
> The INA232 is a current/power monitor from Texas Instruments sharing
> the same register map as the other INA2xx.
>
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/D=
ocumentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > index 009d78b308596..a30888c9156b9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > @@ -28,6 +28,7 @@ properties:
> >        - ti,ina228
> >        - ti,ina230
> >        - ti,ina231
> > +      - ti,ina232
>
> [Severity: Low]
> Does this new compatible string need to be added to the allOf conditional
> blocks further down in the schema file?
>
> By omitting ti,ina232 from the exclusion list for
> ti,maximum-expected-current-microamp, the schema might incorrectly allow
> this property for ti,ina232 nodes:
>
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - silergy,sq52206
>               ...
>               - ti,ina231
>               - ti,ina234
>               - ti,ina237
>     then:
>       properties:
>         ti,maximum-expected-current-microamp: false
>
> Should ti,ina232 be added alongside ti,ina231 here?
>
> Similarly, ti,ina232 appears to be omitted from the conditional block
> restricting ti,shunt-gain:
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - silergy,sy24655
>               ...
>               - ti,ina231
>               - ti,ina234
>               - ti,ina260
>     then:
>       properties:
>         ti,shunt-gain: false
>
> Could this weaken schema validation when checking device tree nodes for
> this specific hardware variant?

That's a valid point, will be addressed in v2.

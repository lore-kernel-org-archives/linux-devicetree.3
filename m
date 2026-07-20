Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291CB296BA9
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514500; cv=none; b=i1pk5IE9GD0E7YvdMSBolt+R3uAvFaW7adQUQRa57cqm4qtqHM84CCK1UnzVWJ+foBIWzEFe1RSK8jTRNZgMPJ7x10uAkKdTn/MsxkftpXXMz3CosaPvMA42AeErnFIXza+8tG4OAXFQRYAZEnsoKj+I9UdngetW4H3x6MAVdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514500; c=relaxed/simple;
	bh=+cA2/8KnHOcLjJklNMIphIkE0VFl036Nx66yo40sks0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RrySdKIlgVXl/vOYlMoEDVT1SuzXkawhebMzv/Fq9qbwdofcQcD0oa275d8FxcWEhIDzdvbJ2xj4qTaW7qfMtag6x7f+kW3h8+oHVtCXa8nNwIp/tK5DWRnN3aGypui6XhmpbY7LAqv3RKLqVn/Q407WptKhC9wkND2tc4K9Agk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlPT8okw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KE7dOEpn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlPT8okw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KE7dOEpn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNt2sK659124
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poxv4xx40oxQgMlpfFyOe+9+XO7OX7AMZ3eqJCAriiE=; b=NlPT8okwgn7YaR26
	0gDC5w2oHuLAjqL5F56/BSYSHSsYoN6vP/8KIUzyIZ+ZIuqgi6Oe1YThvD0WyTJD
	ZgiCs4foONtR+vOmtPhFny6w7Y6rYoSWL+eC15LIgDnkAVA85J+uIfB1P5EjXLlt
	UOT1mGWdLIAp0qHx6Qt4vvozKsUmCWXt4yfrjihsuv01wjLsq7fdKRueZP5GZ9q1
	m2NR+wUlhuBsJ5X5LkHkHBNS/jyS0CyPfFvk4FtVqSSggVYw16xBr1iRdY6NT1MB
	eN1uD5PJY8ZpKY94aIRLb8YcB6Rg4ef2E2dreMH/Tp2PjlapIrRBRvC4EV2gTka9
	37d0yw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chkyfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:28:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so3780163a91.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 19:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784514497; x=1785119297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poxv4xx40oxQgMlpfFyOe+9+XO7OX7AMZ3eqJCAriiE=;
        b=KE7dOEpnw8026RR0Xnnwc3IpxXO8o54m/3YCUlSELyQ8UciVSAQ5A1Lk/11q0NbrsS
         bpBSzzdWwTmsG2BeQzZzPWv2mk+KGbSnMsfVTtEhXIAaoZuhMLUeQlkobrUzyuvZMoKE
         nvPPuQbXAF8bv2hVfXuwAtSxj3jGOMfkIaBtOCm/t4YzLi0HB+8SvhYPniS9gVGnL/GC
         FoZWYvfMS/xZ/21VIPn9aLpGd/0EhRFWP4VOt0DZinjww5qMUbDWyET69Oh31LzEN82D
         N5E99uzwlbbjSCTuYyhYiq9szCoerlw6s9T7E3IICfekS5IwanYIJxLXc14Nt6w/ebLj
         XGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784514497; x=1785119297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poxv4xx40oxQgMlpfFyOe+9+XO7OX7AMZ3eqJCAriiE=;
        b=EKGpNnqy9WusxSW6Rn75PasE2+IVtik7tUG+nI773SQdlw6JsMyBITQzp50zSzPg/z
         2STLDXVE4EcYvFaR2mOqj+55byGdT8Rs7fAOMQc2bQR3wxblzrsTAzWFXCDuOfVkUes6
         xeTysAY20viABaOqEQ0BSIVhSKQToGJfEjdxEh2d/xVjT4naqdZ329G4pFIyqgL0qfOb
         58mkFfS4f+29PW8sXdVAgMAbFYfuVSMOli1jXKYY8iFJh+Osnkc/6zzy6GAEew1rmCZU
         dadIV809HS+HHaGuK4nhKbSltFiyJT9LZLsttypaDRPk3xRU9sUVN8di5ofINV1+7Qmt
         LxjA==
X-Forwarded-Encrypted: i=1; AHgh+RriQ028sAZB0Ee1MGK7uDDAq4KiiPRI3Ls8fCSpolWd/oesOaucBGzgfuVo71gMhS9k/enT5C6qlFAZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8a4fWwqgyMF4c3eafL0z3LJAfJX9toZMzFWWQ12o6qGR5XLey
	0B1yl2LpNoBkAGsnrbBvW8Yw/qlnLIDIEFRAQ8TK9bKeeFxo3g3ah6uHVthvUofUik0QVt+5Wen
	PjFM9ET8KmxzHULlma9XKz3rMCyhJx14eZ+Z45uecVmKmHAmbhkoMxnNttcsFdwXf
X-Gm-Gg: AfdE7cl4qITgz4n2z5yXAqRus5T/V2+pJuT9mZ0wlrTvB2M7XVEM5QZVu4GzcOUbq8V
	8vfJEGTtfKggBkPasicAsJctsIpRTTE8IucCJDyXBhnft8ucGHSnAtcAqyIpTo5OgUW02UPohQW
	l4ps1FS/HiMZEh0Rwz/Lv4Pk5ATk/0kSodBJuOBMFh9L/0A3ibD+U4R6vmd9msaBfgw+XKla0zC
	eIyqidfB5dsBP4+ACq/dwWjdVN0DI4HBfMZMQrbSu3POLaQ/CxzClwSLUqv4LpRTWceNrqeC6pC
	iwddbXzyvI4VWo311nia+bFPtgQh/3wa+OzcpAJgAtNm2oHPSFtWJLLQkdsW5cG1k3I8Vj97hXO
	iVbK+4OmQB+7SFAw6
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b3b with SMTP id 98e67ed59e1d1-38e679f4dd4mr5071277a91.29.1784514496839;
        Sun, 19 Jul 2026 19:28:16 -0700 (PDT)
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b3b with SMTP id 98e67ed59e1d1-38e679f4dd4mr5071268a91.29.1784514496348;
        Sun, 19 Jul 2026 19:28:16 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc117sm4771860a91.3.2026.07.19.19.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 19:28:15 -0700 (PDT)
Date: Mon, 20 Jul 2026 03:28:11 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wadim Mueller <wafgo01@gmail.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Maxwell Doose <maxwell@maxwelld.cc>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marcelo Schmitt
 <marcelo.schmitt1@gmail.com>,
        Rodrigo Alencar
 <455.rodrigo.alencar@gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: iio: flow: add Sensirion SLF3S
 liquid flow sensor
Message-ID: <20260720032759.579e16cf@jic23-huawei>
In-Reply-To: <b2c6cc45-5a52-4992-b72b-dfde02cbc94d@kernel.org>
References: <20260714085358.20842-1-wafgo01@gmail.com>
	<20260714085358.20842-3-wafgo01@gmail.com>
	<b2c6cc45-5a52-4992-b72b-dfde02cbc94d@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyNCBTYWx0ZWRfX9I+wFAaiPRsS
 Q0P6aySjQw72uEB0N35BhAQh3q+Ov4Xv/tpBrwAaDBq8o4Wtrt+DgQWLYCt/ka6XiBqfXMvqrKC
 PyXuXYJkkYmCISKMzBupp3dzlKIz4BU=
X-Proofpoint-GUID: XLY3ChMAwhH-sysFOtPdsJ8JHpCEOyyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyNCBTYWx0ZWRfX3mZQgqlffYCI
 jw7U5qbSZtIQ44tFB2+oc6avLXTtTftvxTgDypDBollLYPW9GhIQlRigaACGJWrlxsVLX0nvOFi
 /G/9v0ZXscuq6SFaki1NxMZVpgKMq/AS4SMqtrhwWLwVIxJORjENJ7zPjR1qjOVkkFPwW9eOfk4
 1UYhdUCN2R+lA6rs/nowQyUjMRG9dbhOhw32k9prl3QMY0TWeQTU/jL2aZxqmg1afGUvZjzvueS
 AgaRSvMscbYWpo4zulI8do95px535acTw4CvqodEGQJZezFrGlOU3OuCTA87aZRMkUhWMaqkaoN
 6yuAExFdsU+yaCxeytqUfKodXOW5ms8RkTVxnvOc6nUTfMBybjEMUl+s2JSAy8oIcjQeOSvdd3T
 unUo6r1agR9CwSG07BBwGM7dWVUZUrbWQWUGHVmL6Qzo7X+My+/EveL2xyXkqs6YKcVF1dTaQFk
 GuNrtLD+K+3cnuaDGfA==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5d87c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=lrFNs2ZA_w67TaOphz0A:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: XLY3ChMAwhH-sysFOtPdsJ8JHpCEOyyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200024

On Sun, 19 Jul 2026 08:19:34 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 14/07/2026 10:53, Wadim Mueller wrote:
> > Document the bindings for the Sensirion SLF3S family of digital
> > liquid-flow sensors on I2C.  The family currently covers the
> > SLF3S-0600F, SLF3S-1300F and SLF3S-4000B variants.
> > 
> > All variants share the same register map and are fully detectable
> > from the product-information register at probe time, so
> > sensirion,slf3s-1300f serves as the fallback compatible for the
> > other variants.
> > 
> > The active calibration medium (water / IPA) is runtime-switchable
> > via the in_volumeflow_medium sysfs attribute and therefore not a
> > DT property.
> > 
> > Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../bindings/iio/flow/sensirion,slf3s.yaml    | 58 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  2 files changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> > new file mode 100644
> > index 000000000000..c054a505b75d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/flow/sensirion,slf3s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sensirion SLF3S liquid flow sensor
> > +
> > +maintainers:
> > +  - Wadim Mueller <wafgo01@gmail.com>
> > +
> > +description:
> > +  Family of digital liquid-flow sensors from Sensirion with I2C interface. All
> > +  family members share the same register map; sub-types differ only in the flow
> > +  scale factor and the calibrated measurement range. The sub-type can be
> > +  identified from the product-information register.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: sensirion,slf3s-1300f
> > +      - items:
> > +          - enum:
> > +              - sensirion,slf3s-0600f
> > +              - sensirion,slf3s-4000b
> > +          - const: sensirion,slf3s-1300f  
> 
> This is fine with me, also fine with separate non-compatible compatibles.

Thanks!

I'd prefer separate to avoid confusing me at least! :)

It needs new version anyway as the driver (patch 4) doesn't seem to have
reached me or patchwork.

Jonathan

> 
> Best regards,
> Krzysztof


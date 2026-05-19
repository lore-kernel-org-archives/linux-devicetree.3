Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27973E8326
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180234; cv=none; b=VnknVcfh9KQzC7VzuGPv5Wr5e4IKZDpwLGUUZaXn+rKA6nrF7TugpylXiTAMnmLX4Mae44s8IvpS4b2MGfQr7EG+zjj1VRFVEzbtTQ6QhvVflBdNf5Oq6oU4QUiMWje6m5PgPypFsw4pIYFu2HtMc5swU+M/6eih30xtelBx4dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180234; c=relaxed/simple;
	bh=ML8Ctl/JCwpkRJcz+9uLrMFDdrS06nzomOLqlqMrF2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWUQCCZn4S0E3YnIVZoXNoXR5nfNnDc1wuoQjuPwrQ2TezhVRAFMx7r9xElUhcFPvG0tYaZdgzkbUuir2WFUVbNw+NZDEmV7ec8wsvZ8NDff34Hr/TXhTEpbWZcAO5FX86XILJte6jmrkkXKLA+RWrmjtX+Q7F9f1NuqQnrgG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c09MsG9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMQKz13m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c09MsG9z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMQKz13m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4sSV9254218
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Fvqj985nSMOY/viawN0/qJe1y6pa0P2ETL6bY1gUxo=; b=c09MsG9zdsLarGZ5
	83aumy8Edmlu/NUfIY9inIvDjzDLw4WnkIQh3LmjkUrDHY43/aCMngA+1bbKVdy3
	PFLZy4WyDSus1UPaWiYowgLPC/4YKJT8NR4m8ANKJCFeXtefb1yIR06dSniZe2OT
	y828zTZdJ73BzQhf09jZ+UW9BuhI2J5iFxP/gUXgaTqrfyhzwdSe5CGRlZrXhKJV
	D1Gcsr/YNtKDL2PK5jeWV6lSgcD/oqaN4NK2PP011vyQo6I8B9nynyKFdcLFNl0c
	vIFlWNdRaCzqkv+2LhK+sABdKADBZK1sF9uaJBtZArS2FXxGXb371CG+39X/PkYL
	GwAbOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87rxr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:43:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so34241125ad.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180228; x=1779785028; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Fvqj985nSMOY/viawN0/qJe1y6pa0P2ETL6bY1gUxo=;
        b=bMQKz13m2Jjyx9O3MIUV0dHo6ckwAFXAX9fod9WeclZQst4ewJn6cIySw9u1UrIiv5
         CzFmO5BSb2VSRP09U5NTiy6c+hoyTnz6fvjmYKmlPrbI9ciWK2/l79MYTbM8rAH7D1xS
         C8CLgnz9GEaIfdhF47gXk6lxjb75xDaKzm5qH8f2YVseDX3cyFcUW/flkTTnGrBOYI5H
         /Xc42RieqsAxdHyMwJjBdo+9d6+GYPFs2cpYpYqgoMET6fTe8ryFDii1NGRzl5/sVZXd
         xkh2cYnoz4BsjvMNMt2GGnxoh8szLVPQtn+e7+BK+551Yv7P8e8lJo9XOnEhN8YghpqK
         lNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180228; x=1779785028;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Fvqj985nSMOY/viawN0/qJe1y6pa0P2ETL6bY1gUxo=;
        b=hJYywiSz/7+/t9z2J1Sh42UEcp5fEU/nxLc/xpKJR5Xhhi/D66kwA2hOLobn7G0Hzq
         WJdc9bzV8U9zcYGmoZBWAWFMKvPKMS0AvESJNOmlQp8OvGITc0+V22CBcfDBcczQ4bdW
         eLmHMExcEILPF1EIjZHRRRMLMerIeb4LzGQ587o9TTrt9qXTlq+XQC8Zc9d0VTKktK0k
         Tgd1nGGticv7nw+D6iivQkNdeEHTUpsWgWAJp5ofoNqCpxOGe1rlm4xDixYmzX1yfg/K
         xuCk66B+gycvKsX8KHt6JHZ/xM9SQi1wJSPq//15YZkopc3bnm7rcCUVEgDx6lsu5cLH
         8rSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wmfqv+mUiQnBOU1oHoTBgqW6xz3h4VCc/mKgc7R04JwlHr/uDvo6Iu6TFnKK5mWJHU5TT5z/9RqyC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfwu+D8SkVwh9+RTzcb/vkYus76aSU4pgGldaIoqc/t7qNgP/M
	Td1lsGrIRy+GmI/9iY4yd6wSf8hGXh6YF1AD+tJe5+4AbHEMpxogBoIr2fuscisUcMS4LUd8FyE
	Le+TZib+fAjiLWwgIGn5IFDEN9tO6eA51lf91nnr4NdizlsealNqC2HKa0iOu5rMmZ+ppGn1e
X-Gm-Gg: Acq92OGqjWn+lYYxCzSjBAUX44XgFmGr+lZGxnbHBkUlJumr2DBrXEb0eLBRyDVCB4w
	dxQdLOF5Lh/b6OqXZDgE/TkHUnSEhysEUo3qXf8zzVKAdvQAY7fe9qAjF/Vo6DIJ864WarbDZKZ
	rrCFgaw7+lk0msqY1XupLwRwxDw1zFgjdCvPg8iwz9ggzg4X21x9B2NVwuNhQq1By0tz2guIaQn
	WS6DgOP/4+EcKeiCjYJUFDWxTXakG6wcW4tbmmw3TtGAdpkxwuH50Gh/XFANdfww9vpYeEONqWS
	WekOYT2ldkbRqA/coT6XXoTKA49V727jo2MzGP0b4xrDTMrdHfEcuSw1IGC3HIAkDgUBzB1/bZG
	B19jbKuLdvMxzxtHZj/whSWX1wQ0qFudmNdraCRYE/IjsIyJs
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr134007135ad.1.1779180227961;
        Tue, 19 May 2026 01:43:47 -0700 (PDT)
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr134006875ad.1.1779180227348;
        Tue, 19 May 2026 01:43:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11cbdesm178173755ad.71.2026.05.19.01.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:43:47 -0700 (PDT)
Date: Tue, 19 May 2026 14:13:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
Message-ID: <20260519084340.x7tdie5uahaxldbn@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
 <c0def708-4d95-4398-8a20-8d4a7533fcf1@oss.qualcomm.com>
 <CAL_JsqJNn=k64unun=k+3FOem74x452WuXKS7fZCL0Vxmcy9Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJNn=k64unun=k+3FOem74x452WuXKS7fZCL0Vxmcy9Uw@mail.gmail.com>
X-Proofpoint-GUID: ks9nsaV8aZe_kV57Tw0PeEcmksI8Uq87
X-Proofpoint-ORIG-GUID: ks9nsaV8aZe_kV57Tw0PeEcmksI8Uq87
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c22c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rnkpo5U1iQQg37PeS5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NSBTYWx0ZWRfX56Wf8QrxiOL/
 aG2wv9k7fCN/n6li71ShgxElezz6kVt9jrKMriFmmMEOH60aNH1pN+uQlQJcdPmEY7ljJNC6P3l
 p9xQgHAuEU04C6z2shOFxMznc9q6lQR3KTlronT0tpzrEUR91Br0POXbq4CNDbpRhT7H3mhfvbI
 E4HD1R3nS/h2E3aURhBDxsVn6gyJtuYYetkFZElkAO1Fp92JGMehX1A/SJ45LPrB4RNH1qeiHU4
 FB+IbYe1oKfrsj+e0CLhtsOOMdpFzlUC5H+t+T7eqbONDCDDx+PmYtJNuhoqC6GSREtH7f3Z73y
 FedJM5Zr1peeJ8/IdNF0M+rrC4uvIEwtklYmYQoMyJK5lYGXvkR6rUBlhqtcmURZ+lOcDudK15P
 rppJMx8oc8GMirEFM8+jaFlbo3ULS15K6f2kgw4Z2Hnd8WTYdTw86f2GSJOJvFTKq0T++Ql+u89
 yPiGxE2SSJjYRShfhtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190085

On Fri, May 08, 2026 at 07:09:50AM -0500, Rob Herring wrote:
> On Fri, May 8, 2026 at 5:50 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> > > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > > SRAM is shared between the kernel and boot firmware. Before DDR is
> > > initialised on the warm reset following a crash, firmware reads this
> > > word to decide if minidump is enabled and collect a minidump and where
> > >  to deliver it (USB upload to a host, or save to local storage).
> > >
> > > Add 'sram' and 'sram-names' properties to the SCM binding to describe
> > > a region in always-on SRAM where the minidump download destination
> > > value could be written. Boot firmware reads it before DDR is initialised
> > > on a warm reset to decide where to store the minidump either to host
> > > PC or to on device storage.
> > >
> > > Most of the Qualcomm SoC supporting minidump supports this, added the
> > > kaanapali SoC for now.
> > >
> > > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > index 7918d31f58b4..6813081fd74a 100644
> > > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > @@ -127,6 +127,22 @@ properties:
> > >            - description: offset of the download mode control register
> > >      description: TCSR hardware block
> > >
> > > +  sram:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description:
> > > +      Phandle to a region in always-on SRAM used to store the download
> > > +      mode value for boot firmware to read before DDR is initialised on
> > > +      the next warm reset.
> > > +    maxItems: 1
> > > +
> > > +  sram-names:
> > > +    items:
> > > +      - const: minidump
> > > +
> > > +dependencies:
> > > +  sram: [ sram-names ]
> > > +  sram-names: [ sram ]
> > > +
> > >  allOf:
> > >    # Clocks
> > >    - if:
> > > @@ -229,6 +245,18 @@ allOf:
> > >        properties:
> > >          memory-region: false
> > >
> > > +  - if:
> > > +      not:
> > > +        properties:
> > > +          compatible:
> > > +            contains:
> > > +              enum:
> > > +                - qcom,scm-kaanapali
> >
> > This list will grow super large - like mentioned in the commit message,
> > to list almost all platforms.. I don't know if it makes sense to limit
> > this. Krzysztof/Rob?
> 
> Probably not. If sram is not valid for a platform, you'd have to go
> out of your way to first add it and to have any effect if you did.
>

Sure, will remove restriction.

> Rob

-- 
-Mukesh Ojha

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E3937CD52
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956241; cv=none; b=Z2YPz91BzPWMyht0DpjTMMs/GwfTwr4P25OC9dF90KtUopRcK/LAMEP/DQS5TR6UDo8m0hMCNH6zRmj6k9dsTlBQ1l70Mgp/2xsdXpd85MqFLD1WZlC3/qpQqxbU1xSLoKi/M44CZa5O50Nf4FNeKF6MnSuB6GZFgElr6PXty4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956241; c=relaxed/simple;
	bh=Nig0z9be/bACiHxkv/zcR0n3Fa0ArflEoEv6FUY0xWE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJlFQ7+PAwjdBQ7kzLyoK+TdgLEBGMOCvFSXZNtYBQ1bx2DQ60PGtLcSRmjrbsUUdBkSUOemu5R44O0E9inCk0f1ke+X4kKk8m+xxIg05+eMG1XQ5K9ArKDtyy9hWLLcEu6EY09rQO0S5P/Ur8x1RA3ubwqcY3UzcG0Ya+W2YWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1/GfUJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=criIe1jm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1/GfUJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="criIe1jm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF87tW1701390
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hybZBC9zxwIZTXM83Re9UAcSKe/d52J9cAF6ZF3C0mg=; b=L1/GfUJ+vLRiJZbB
	hzsdl0qm/cfPmPDd6SALgDD2sIBDyV8vewwkIaStNdGqsdBN7znjt0HdABZHNijY
	HjMgervJmXDqsLj2pLJJUoqbI52Qtm+zXTFbY6fb6o7G6GMuM+SPYs3oMN2Ne9D5
	18yGrp41+/EW+2/bpykhdqlzNllXZ65WKdB3O4oHB9RgRjQooI7q96dl0Xdk4dcs
	tdAATaId9XJ4TidCkt11l3/6gqhUtV6eTAD7Q9i8FdQ37fLho/aHwi1Eg/uZeozi
	rjJ2k8ZpO1nslyq52aT/ZtpiWrFR71FKaVAGOOrL+dL7Xq4+DMOd0pjexKL7mJyi
	L2A6jw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3hbt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:23:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so4906566a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783956238; x=1784561038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hybZBC9zxwIZTXM83Re9UAcSKe/d52J9cAF6ZF3C0mg=;
        b=criIe1jmk1j029UFa0C7aYJMzSZO+C39Xiah8++D+4uv85nL+UjAdrYKhz+M2Pk002
         ObgFEImmCF98qBK8kr7D0vxj2b9XMVmSihCVErkc5JpY4bC/nrH1+HHUXkCkPfF4aDDI
         eSgzdTEQhyBqMNha8YL9/z2FGOM+pC8AMLzFeKIKmqmxS8otuYNb0MzP4yRJBOdHSVbv
         gaYLRqXPrfmoRR6FRJ4jvg6rX7xztXTu6LQ/YeSqtOHlUPrUdGSOw23X/JsDzJZFVyFx
         O2jPTs7G6TdMf3vaJEF2Z2zDwAf+fKR/6Y/kH0ohq8X9F72QG6JINlUphrbQeNkHk6YR
         Np2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783956238; x=1784561038;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hybZBC9zxwIZTXM83Re9UAcSKe/d52J9cAF6ZF3C0mg=;
        b=Vt03PDPDJ13GlT/pgma1+fSiwa5tRu8QhKJBt707TkMyivlutU396Q9pLNFZvZNCDL
         sin1HFnVKXPgsYsc3a3YNtB2EZvzSA0uueXe3vDXbaCGA20Kan4S6a9B4bQATv1xecnA
         KQ8klQrEHouc4ZkQeIkOEZusdGLavy6KIGIZdvUDoSp3HgCf9FoQi1TFKigVGD6zgsFb
         Uk6Tc1+xpnt9aLUwWqMMrUQ8mDZaWRM9lHOuDfyoK6JklGY0GKpi7D3n9Ja3918KOaXx
         T+aRk1sRKSnHxDUzOP78tniTwix1djcqEt7wdTgVGfqPEOXx41ifMbgPofCj+h2fbr7i
         s51g==
X-Forwarded-Encrypted: i=1; AHgh+RpZQLYb0+JL/Ofg/RyV+ozkpdy28j68jSrHtPq7Goj2i+G/EZ+FENyP1FgH4SBpKsR9Rq+UsaYhDCwM@vger.kernel.org
X-Gm-Message-State: AOJu0YxCNEhY723IsVh0x32Ny9Z5jgdpKGICOY3BRVmTc6Wbgjx1cAEU
	WHijdq8D9Sdf4JvdZOBJUVT48E9O7mymCDmkacqoBoBRQJmuzMpOVXcu2tC9xZv5/47T98j7klx
	kIUHrGaDW3Tt1Q+c+16R66Huf+H3YkeyXQ+yUl6PRbjGjIlsy1YlzxDhluqKILKAS
X-Gm-Gg: AfdE7ckA1zcRe5QptTNJlTbj4zx1s9XopeVcxqx/TrXVzKQ8bbJqHCPVcDY4UTqrEZo
	LZxJeVX7eRyVuaqGk9yt2vjQP8El2u6LONUmXk2BPYIdSx8TTbA6wRQUrCzchIS6+GdNLdQTTii
	4qhrVzOn7PZuVJ+1HNjpasusP1DAU5bnr6A45UHFmti/LGkXjM3F4I9XVEibyMLkTdbMLOBqQhT
	yI+NNR1k/5Tim6v5pnxK/Pymke9jgJ7gd2dkOKwFzCJVbxlAstxTbCzOoBSpgkoNZcIhJwjUb/h
	5q8zVm8FnGsiU5U9R/YA3RqqFILRqPN7EDuBtgxZMWc2Jz9HYnj14TNSYR//0dOhqnids+6ivkd
	lJWMPhP+3ZrjQe2KbZV6gsQD3Oj9vLsSPsUJK
X-Received: by 2002:a17:903:2f08:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2cee75fbe28mr3254815ad.23.1783956238476;
        Mon, 13 Jul 2026 08:23:58 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2cee75fbe28mr3254495ad.23.1783956237827;
        Mon, 13 Jul 2026 08:23:57 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm100605175ad.53.2026.07.13.08.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:23:57 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:24:00 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chris Hall <c-hall@ti.com>,
        Patrick Edwards
 <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
        Nguyen Minh Tien
 <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: iio: adc: add input-chopping
 property
Message-ID: <20260713082400.000024f1@oss.qualcomm.com>
In-Reply-To: <1700ed07-47b5-4831-87c5-a6115928baab@baylibre.com>
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
	<20260710-iio-adc-ti-ads122c14-v3-4-746d52cbf1d0@baylibre.com>
	<20260713023443.1a7a9acb@jic23-huawei>
	<1700ed07-47b5-4831-87c5-a6115928baab@baylibre.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UpWDzp16gDbzFxfGMsvh5dhPRTtNu0cc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2MCBTYWx0ZWRfX2xUJuy9Tb9LI
 b5kg1MbriwgSMZhTEbp5HIYPrDyoBwBulkHgnNH9TJlTKdr9J1FGcPoxh2T0Bssn7Mzj1OK9Tol
 JBn2i70i1541Utwmz12xfop1E1pS5OU=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a55030f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=IpJZQVW2AAAA:8 a=ALuaPTNhsiHwyfqByDAA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2MCBTYWx0ZWRfX1QvEySd8T+4y
 YAmrXgy27cuOjy5Oe4d8FWreGMkmwZOIE04BX9PjycLXSrfng+RJjKRophF9AGgdlEMqfVWH6RE
 yKpbRvTABiMCqbuI73ccXMGb+aoYoLg0mEN+0+1gDM6qRINBAREaw/WPTukJ8HTxsDLzbQjbIGc
 VwNwLpfYOu6kinBv9Bc2qYF91gynbED8tFqEr80IWwPaXT+y82GCcLLxzIJoI5wd7y8W6C77/Ew
 Ein84pA34cLSBerXcgJ+AZlDl2yCd/KP2SqI+PQKbqjrSJAdDDzZ6ESaGGn9dsdAf+8uHOtwWln
 P89cW9rMxAPeFH0WTPt3zNhN6hgk9xY1mO79lM8ItkkQcpchszMTZjG3czUOVbZTTozGq3zD+Sl
 5OYgR/7nzscVilGmTKFf/8Jxr2KzJUpFpKl0CIewpga5KxK+bB6SWmflmEGgjf43un1bg70k5Bc
 6RWtFGV6z0p9WFU8Lsg==
X-Proofpoint-GUID: UpWDzp16gDbzFxfGMsvh5dhPRTtNu0cc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130160

On Mon, 13 Jul 2026 09:55:53 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 7/12/26 8:34 PM, Jonathan Cameron wrote:
> > On Fri, 10 Jul 2026 17:50:37 -0500
> > "David Lechner (TI)" <dlechner@baylibre.com> wrote:
> >   
> >> Add a generic input-chopping property to adc.yaml. This is a feature
> >> seen frequently in ADCs that are designed to measure resistive loads,
> >> such as RTDs and strain gauges. Enabling this can reduce offset errors
> >> by swapping the positive and negative input channels on every other
> >> conversion. This can have side-effects in timing and filter response, so
> >> it is not always desirable to enable this feature in some applications.
> >> Therefore, it is best to make this a property that can be enabled or
> >> disabled in the device tree.
> >>
> >> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
> >> ---
> >> v3 changes:
> >> * Renamed property to input-chopping to reflect more common terminology.
> >> * Removed "allowed" from the description.
> >> * Extended description to explain when it should not be used.
> >>
> >> v2 changes:
> >> * New patch.
> >> ---
> >>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> >> index 308857f11220..c408feebd46d 100644
> >> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> >> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> >> @@ -80,6 +80,14 @@ properties:
> >>        ADCs usually allow choosing between internal reference sources or a pair
> >>        of external pins.
> >>  
> >> +  input-chopping:
> >> +    type: boolean
> >> +    description:
> >> +      If set, the positive and negative input channels are swapped on every
> >> +      other conversion to reduce offset error. This generally comes at the
> >> +      expense of added settling time between conversions, so should be omitted
> >> +      on systems with high-frequency signals or high data rate requirements.  
> > 
> > I'm lazy so I didn't check back, but in my mental model of this, the DT is simply
> > saying that the analog circuitry is suitable for doing chopping.  Driver decision
> > on whether to do it.  Perhaps we can reword it for that?  
> 
> Heh, that was the "allowed" part that I removed.
> 
> I think this is really more of a design decision between the tradeoff
> of less noise vs. data rate. By setting this property, we are saying
> we should favor less noise. So I think it is more about the expected
> signal than the circuitry.
> 
> So not sure that I would add anything here.
Fair enough.  Given the driver can always ignore what is in DT I guess it
is fine as is.

Thanks,

Jonathan

> 
> 
> >> +
> >>    excitation-channels:
> >>      $ref: /schemas/types.yaml#/definitions/uint32-array
> >>      description:
> >>  
> >   
> 
> 


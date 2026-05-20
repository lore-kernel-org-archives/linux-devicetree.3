Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38C3D16FC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271620; cv=none; b=UNJH2ADv2VyFRwBd2BG4HZurVk440Z1GWpJc/+xngcPn1Ag2yK8r1tLuueO1twW44z2UoP7lRTdUCibu4oMoH9TOOKMXt23Gs1Zvt5Y6KBdhcLFQf/mHl/Iz5XOCckdf1kTRG43JaEjOQItCCOTp7FO50w5mXc8OUI66oFqCb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271620; c=relaxed/simple;
	bh=j0UihkY+EzAeIyTlsNC4or/FEgB+Bl32BBoQvSHVKuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPvHR4VlU84OiU9RLMHCK/0VDw7+70ZWiLGEykV0gRno7aL90TO6m3cV45NvjfdmEEMbbvOBVwGctBDKKHk7YO1AiVdkG/xU+HRk402NDNkJgzIaFYM1ohXmnsJpSake7GQglLPogmgfxzM4mqkiC9xLFFFXk5/xReEY3vwL46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASPZoaiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq7LWZSh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASPZoaiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gq7LWZSh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K759jx1953988
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AGX+vAIPNPfSe9tyWRc0yWm/
	nuyWTcL1gkeha8UOlUw=; b=ASPZoaiwYTm34SroNifykAyTtqWWxXB7hxODcog1
	1Edg0MwNF+FlAzI/Cs3kCo1OQdd1Oa08swvOX+Af2bB0zt9fxSuu5WHXFW7sfYhN
	QVedubnhFR/muuTRL6nh5O90iE2wWQkPWwYPdcar/LxSvvpNXSnhOJKriVdShhGh
	VY7znRr1cOkxhtWqqDdEPbHKLe2Frh5sdcvBJJbfPxLlzdES6/qrcZCwSC09lNZs
	uV7p2Bbnc35zT6jfh+YlinvG1DSG74tDdYwtQRukkdZaFqBH4LvcTUnfW1OyUTEe
	lqx+tKjwzYTO2s4h+IFFyYlzYPynALW0knraRIFGgi1wLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xv7fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:06:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so130976641cf.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271617; x=1779876417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGX+vAIPNPfSe9tyWRc0yWm/nuyWTcL1gkeha8UOlUw=;
        b=gq7LWZShvj4M8vV6lBdIJmQyFtFcO+nqA19Ht5IQuGd5wLXO5vUXDriLZOqAyVQdnZ
         87Ltuv76vrjcFVK6fiMA+2gS8UGDPaEOt7niYPyzR9JAJ7jAXdxp0rBfuD2NkUCPixlu
         xZWvEVX0QHaDQbhL03B0aufd9FJvO4xznPbwYii7bflI2A5BeLYvzftqag/S9SolZUjd
         UIEw4TzsIc4SZg+x499EnZ3JjrPl1DopkkrShD6Sap42c5Y7JL+5OFQjYG8wZt3JrN+6
         tCXE1G3NZWMKi951beOH/dsmSynbzyga4YJHFAtgFi/MfroNKOmqUD/bjkPSx+YZ1peI
         jQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271617; x=1779876417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGX+vAIPNPfSe9tyWRc0yWm/nuyWTcL1gkeha8UOlUw=;
        b=mAguMHU7BottbGVhQ6WMrbLh6xeAS+9bokYsaTYMzrqoBI8qCJRFl3XQCE+heiRlBn
         rzY+t75dGCgWqlQys8pKOB5MasrXacPTN8da3JjnOr1jx29TIdD74BXlK6/PS6q5G3Wh
         YchbmVqTNIcsE3jLkW61mpL75yjTeAygTfWXdN52A4bFgzvZXBXd9nO86QdtU5dMRqBr
         NaZJkxQ9IEdIXovUNS+vsjDydFQU2ysz8oJFQC9PBc7Ije3IRWqGdKGMBav8I8fxrpMF
         dVutEh1c9T7toDxlJOGwmshLaeHN3DEy5spe4DmInmnGKuN6rHZylq3iyuIS7ALv5foS
         yTLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9deR48H5hm8+VTglFgsozrx3sywQhhXOSeesLQnywrQ1uE/mxI7BFTwW/Dd+5NF2k+q2w/HOWtSCYa@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMyvPIxFnbT8RflRwihaSwgUKGQoizrveFDHK7O5pwnFnd8KJ
	po1kFQN4dTdtvNoDyP8BoMjCy5MnU96agoa2/L4RkRC/khvWxUcCmLfH27Vlkoc1js3xCZxhMsb
	b8hB+476wRCezGCV/vCYvwduiLxHZUFz/0Rjs06geDFLwY3pIwwz1IXlH4PLQMtVc
X-Gm-Gg: Acq92OGqeuJwUsvWacW3ySOw+gPdd/XelmEPKc54gyYlxh/AhBKypMFteMsC0g8DubV
	4iVBKDb13+brydjTOcJl3TmimxYHtkAHJVT4xraVdIJVvduvLcDpUbbhTUTsk7M4YaDsuRu0xiW
	AOWqYPDjO4vPUSCm7g1zQs+IAqeNIG3nrLIgGWQ97lwir0V+Rphd2CzHqUUPTv38curStjpicjS
	7XeXmwQg9G5XlaZVDQZWfWPRDasTnUGH1hwqaGkW8imSSvjrHNRnBNaYQ9b+J5659sqbEFQHyLK
	9fw/dX2CdRK6wtrajrIS7W/6K4KBLMumdr+C+/KLM6WCwHgopW2IJLppzAm0VE5TdDyJFm/rbNC
	X5uyJsWUH2eonHbB2ITYE4IiIyb/j2D7IsdO0Do+bzEiPJQ1kzpLzMxgRkbILW4dIRlKrEISfCB
	lv4S1BaytFLWHxOKkgxSALv89vZoVxVZqasbg=
X-Received: by 2002:a05:622a:418a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5165a02aaf6mr311883261cf.15.1779271617266;
        Wed, 20 May 2026 03:06:57 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5165a02aaf6mr311882841cf.15.1779271616797;
        Wed, 20 May 2026 03:06:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a906c3ed96sm4935907e87.0.2026.05.20.03.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:06:55 -0700 (PDT)
Date: Wed, 20 May 2026 13:06:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
Message-ID: <kckacvc2bltflnfqcanuthjyaf4sel6qdrd4rec3t4srtnnm2x@clskftxo5uqx>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d87c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=u223MC-wQ-mL75DatgYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: CIM6udTDovQqb7xd23boYziGkuxpJ-aG
X-Proofpoint-ORIG-GUID: CIM6udTDovQqb7xd23boYziGkuxpJ-aG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfX+oKFqoTonCa4
 PNImjhYHIDi4oQEhKAO4NUWnbLgnty0ujRf2hv7GR5+hUbOIFtgJc+sOk8U72Mgdf/KpwSCJNbt
 4Qj/fX0EkH3DZ9jlYeJ7GUPk+nE64mVOstJ1Tsz0Ruus801avTz5/yhgT7WvKJ/Kz7fiVYkj/pp
 SuEheybZ2PxZBVb0V/iwhKBrdSWKHIOdYI/+Qv3bTd4IDdGi6qrWGeDFFaEsQ4h8dv+YaY441vq
 SYuUXOm+VAAhKgEyceD2FD1UsFPufkYbKCoUtpNWtl57NV0HeXxTZlnDdLFv+fRlBPYUpMfSS/v
 tPmi8DO6uXW/aFiMB4EQthNlFk/Czk724a+zAW6biZhNq3nntdeBeau9FhuVke8tpCCGwF/wV/7
 dRQY58byROsIN1rMD5gRWZJpp02IhMyL7jI/Mxae5cEhsdbKip+klNwDoBb+X8R6DfbQ9O50LcU
 aoVX1c3autiTakW6RSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200097

On Wed, May 20, 2026 at 03:07:32PM +0530, Akash Kumar wrote:
> Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
> EZ-PD CCGx UCSI controller.
> 
> The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
> valid compatible and permit the existing "cypress,cypd4226" fallback where
> appropriate.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index 0620d82508c1..90769c43ac95 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -15,7 +15,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: cypress,cypd4226
> +    oneOf:
> +      - enum:
> +          - cypress,cypd6129
> +          - cypress,cypd4226
> +      - items:
> +          - const: cypress,cypd6129
> +          - const: cypress,cypd4226

Missied it. So, is it a separate value or is it compatible, always
having cypress,cypd4226 as a fallback?

>  
>    '#address-cells':
>      const: 1

-- 
With best wishes
Dmitry

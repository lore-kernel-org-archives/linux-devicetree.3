Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174323E3C76
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698230; cv=none; b=hTSnEFEXWF1pQaj8X1n8scg8KynyVm5Hh2QNM9TJq6OpivfWyLSo0TBfz66cXXcPOiIsXwyHz2+aFx192qm9lZjkkNi/X+Lop3dPvs2EB9x9vAGeV3fs0RPYcKthZ2EnSUldnee6iaoUEuzYhPgJiG3bjlKHu2D45lQVQ4O3hYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698230; c=relaxed/simple;
	bh=/2eXHDTqS2VCauXTBQM8CGZ30KB9ijpuxtDmw3wQuNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dY7XXaGzgGESDyPhWEOSqg3hLwLovNyHbtZD4f0JNMbThck75hCl3NAQI4CDbdyD4hTr8xKt7rkU8Ko3dDW4wldXMbiS6ID6C7TlccuuPreI7Rr/ZIivfPg3F/FBVy53hoYfoI/hULoU3CuPNI3Lk7fKbpIraw143uFnCA65J4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKYYpZlL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDtZUEgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKYYpZlL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDtZUEgE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QS5R3063492
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fwx9ZLlt3548Y6WCHHCbQYxT
	TMoRGEnYiWYKbuoAZjU=; b=bKYYpZlLnVrZLl0MX9CRuSQ42aQNJyT1VlAR9H8m
	at0pQpZPZ3KoGk3SC33MKSZF+hjpvT2OSPsrS4gdKAPKGtMKctd3yZucc6V/SDkq
	g2sYkRqs5eEZoGRxNwcUwdfZ7D4lJakdkdeoALSABk5w7hAoIQ5hzY1/yrGGAQWz
	u/vXx4mcERtKPyU8Kt8bVA4u5lZXGKklWTElrpxeMvd+VuDvmxuL1pGqdU6FCmjq
	AVP2hH5+LwK3uXm08cpt7TxDdvJFVr7gH8aPNDtdBW0FQxk5bv01sbbjeDzamofd
	lyxdF6QwekNIZZ4PKHnbw/iiazFi29/MzFUB6EcXxLwQpA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gg94c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:37:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312af106fcso17358910137.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698226; x=1780303026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwx9ZLlt3548Y6WCHHCbQYxTTMoRGEnYiWYKbuoAZjU=;
        b=gDtZUEgEET+kgM2g7Qv9XRUYAugP4g2CamXRGs2jcdE3f38PFI5Ulkxij1amJtFzK2
         qNsdcdmN9xj4VXC3zKMed82Fct4ZtvZnOWIMmFMtUYFQR8xoLefNbaBQg9JSPkb0bGns
         rB6df+fznxOiA9sGjuy540uvVZ+tuEQ3kz2joy0AwMZHiwmeYpMGObpL0Oz9l8ypAbjT
         8wYgolzJUhLSDGBPej3q1jd7y5OB6TeVtmaxBskwK9yAdWDZ54wVLPdIxeU1DKoEHczK
         AzN+5mqQyoGtYG/Van7FPiWROjItSCyFkCB+UjUQNUBP3XlmmfiHRKN3IYzalv0KsMGP
         4UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698226; x=1780303026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fwx9ZLlt3548Y6WCHHCbQYxTTMoRGEnYiWYKbuoAZjU=;
        b=Fc7Czc6Gs3JTlRzfJdaEVMyBtN7VMzdzoH3I6OAEyjiCij13Ydhcy/kvM/ryJirEEr
         1IwtvKj/cqOf28PnI/Tc2WtUXlC8ph6fL+Il1oDVE7ZnV5btN8AIIkVnwix2+5BB0blD
         Cl4/KcbdQWvU6EgWzMFVCNQHrrTpG7B4g+YyxtbzEuIwsumQgW0usi63fbWNUKeZ4h9k
         L3EWXmQiK1jAad6uu3WgnjQW+UQ+zLYpDjkmuqPYnnxcuNzQwC870W1+bMUvHXz27/+w
         QtfIZLgXUBKxFsPXAMVVGofAKgDO5nVsKnBShBHeRiOAZgREH+5tC1SUS47ReJq9qnOw
         pJ0A==
X-Forwarded-Encrypted: i=1; AFNElJ9TA6cT9XhybCQaZpKCMIIVGIbeBnOE+Opz9nuabNieXJYcwczoVzeRb5ZcK8P4YtAfZ1oPzyOCJDF8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0d6xxOIJp/GvZJXjyIAeO8ZWyqFYXCC3QdE/HS+GSnwMvrdtV
	BZWFMRRg5/6y7R71h8OeTx+mYxgoBtziQ8oL7geSb8vG/vNNZSVsR6tkJnOCNAlBlrHuAwgdZ8X
	aakGzHgM4gNGmYNhZ8MbrwfbmyZFwasIqbN3ne8GzDL/4dX3K/1viuO1bUxWHiHcX
X-Gm-Gg: Acq92OEk0ZPcfBkQ3A8uhTWrheprUTUohe44hy9MSHGt2GP8rQBfAiCt0FOChrZ87A8
	nr3xxoVH4uwG0nZ67KcS1hCvsugHl6Nb0QUPHrMVk0Y8kUBzP1T9b//z0DkouQwkyfjwYkQxCl4
	qDSssjp4jn66qBNR1VhSycbe/KfQaNGl7o/8T7YDtlo+xFqB3vH7sYFMGRam/K2uNYcuZclKiG6
	VzRPknGKp21+PipucJKf0ChapMWRyI/hOLeMomYSxznKKeyWILc0M4KmL5DrrbBR2We9r400QqW
	JfMDBZh82LrVXIyOKr9cWNJy2kIR/qovI32gjfOh6WZwKgXKa8e5xS4Wp8cqe//AKsnj/SasqbM
	ZN0wtSwwwCUPKJX7Zuec7J3A0OztOGxlZTQFz//Cm7sL0WbdWEGgxQKrTTgymJYswVKfktAg0aH
	icsU2dOGP6s2Ykn40HSwH/D2RQX6cM2XSRJhk=
X-Received: by 2002:a05:6102:510b:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-67c798f21fdmr6526910137.2.1779698226431;
        Mon, 25 May 2026 01:37:06 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-67c798f21fdmr6526899137.2.1779698226077;
        Mon, 25 May 2026 01:37:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf9957sm2497662e87.81.2026.05.25.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:37:05 -0700 (PDT)
Date: Mon, 25 May 2026 11:37:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: atFeSdVqXcw9jFBMRQosYiBiB6yQTHeL
X-Proofpoint-GUID: atFeSdVqXcw9jFBMRQosYiBiB6yQTHeL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NyBTYWx0ZWRfX0T920YSPZVxR
 Phtqs/Eq6HkDpiU6sehAiDpqAWMckPin7AXswBjnigc5SpY+reMqxABMFoqf+FxrphsvrmJAgop
 6ZW65QqydgTe5pz5Qw1yqH3VN01ZjRP/O5k1PT16+1cWtcYekNDSMzmfZ1O5ut85NyBMxlaMi3v
 43E0h1HX1HQ3scGNcdi+CqfjRzRW1Q9aV8vz6LFlnwpPHnbe05VB2JvD0fmtWuDoWRHeAHcHrUf
 0PksibOjNfFDnmR14NXIGw3oHGho071iklnir4GsLcewpWsKDyGMmO428SP/Lz/ZHX6atj2RP5d
 MlT8oq4mYB4oHxhXBpuVbdMmK0T/TCeyxbWkM4Z14JxPfdcblteFdNuYJA5+Ab6Jdr2r2RK4Knk
 2LquXQSjiHsvBRCGsghi1+s4GdsFzpMlLJScGAfsYOgt6JMY7r609eaRgd3LrYRisbE46AQaxDQ
 BxwBNi7IUGF3QEAOd9g==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a140a32 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XtIZyzpYV7b62ySdhoYA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250087

On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
> Document compatible string for the FastRPC interface on the Qualcomm Maili
> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> fallback to Kaanapali.

Can I assume that it has the same bus width as Kaanapali?

> 
> Assisted-by: Claude:claude-opus-4-6

Claude assisting to write a one-liner patch? It's becoming ridiculous.

> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..afe52296bf1d 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - qcom,glymur-fastrpc
>                - qcom,hawi-fastrpc
> +              - qcom,maili-fastrpc
>            - const: qcom,kaanapali-fastrpc
>  
>    label:
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260512-fastrpc-9f3b691f8e2d
> 
> Best regards,
> --  
> Yijie Yang <yijie.yang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

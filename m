Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122DF303C9C
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775248128; cv=none; b=P3RwViZe6SjTp15YgIKCo4SeVNRJNRxesCOu5yFBq1yTKAD7rS9IA9c1SsTQWYpC+1gsitVT/LH81VE0Q71mwcYBbyQwt3mOzj7gwuq2Y6O55dGFfJ9MN1lnzicQr9MUHSUJM0Yh5P4qbmtYKP0UaCsD30oGXp9LXJMzQdQC92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775248128; c=relaxed/simple;
	bh=qrrW5DHRneVpOdMcREizH80SwXXqXh1GoF8jzymiKFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc1Q3UF7/gfdIxF4vCxO0SNahX8frBKbvpPicgZ9cLXRKW3M7Is7zHEq0DVlKdlWuYA5nrSlgDTlVj/vVFOZ5HI43qP4/rxI0UiBj9GSmJz7ljQLD9fqngM9y8AY0Ddqsmvh73Js4kXLXprCcwvHcHlS4gkWVLSRTybTwW+wgVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMeK7VGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QF6Rmltl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMeK7VGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QF6Rmltl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Fux3X258422
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J19NRcOFC4DO5B8IoTjtidQNHQSolsOYWwFm6ZIT5Nw=; b=BMeK7VGBwhdVTTv9
	FSdhQbn4wZOd8I+iaXF5f52I9aVDhFTFVgjqdj64Qb4JI/7noo/iIeOgvxS1FVQV
	2g1T1mfA771U1Iz9PeVtH4DYppnVFt7fVgDLqJ5dzz6MF09QLeD1SXj6dD0t7jyk
	LQEhMDjrf80Ltw9Zr7TNOgD0Fy4eaWnavEjvjnUk1fo7XXNuIYmUpxPnYTjdXbqE
	PAwKcjbLdLnRhE7t0zxikpK5weTkuo6TengkUs87xD4musE3BPW3GWhPrbIvGVCo
	bsFbAXr/D4RHvJcDdhcm+vyOCyTU+bqQko0+dmpbOEQQEf1ixNNd3VaVDpxeVLdF
	8Oz49Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20pfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:28:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so63190671cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775248125; x=1775852925; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J19NRcOFC4DO5B8IoTjtidQNHQSolsOYWwFm6ZIT5Nw=;
        b=QF6RmltlD6ibV/wmhyEbRILcpTPt3maO4FUf9MUGmLUxV8YWDxIL8sFClFRb/GFfJT
         g4J9mEPh7IJ1Le74GcWu+7qFAoWh6Ti0wCOewyLTKVg2kJoi8CUyFstja8n7NvxgHDxd
         BfJJWORUnI8DtjTpYUHd/o/c5Qz4/3nydFWKr9tjT1hbpQdv1Xuvzd/zRvELGScLwLlq
         wnE28rA9KzT6tal+ogRanEZM4dtOjVCRLu0JpjroMtB1dx3kZkFaWtZYpghf8Rzxr+Rc
         D5JaZS9v1cPt/mW+A0MKVf68SNG4oP1h43kMe/0SZLQ5kpDBT9z2iyZ4yBGrHAAXNDfG
         aRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775248125; x=1775852925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19NRcOFC4DO5B8IoTjtidQNHQSolsOYWwFm6ZIT5Nw=;
        b=ZnGkaY+fg1SdDNShp8PzB0hmdsrNm9tRo0PkdYaZ5A2mTt+iQqqadhYpk3TrqFvVEu
         M+K9ZaJoHLfK+UqUseP/GzjsGu4MKH3vhs2yZgXkGXonNumhuB+lRU2vJKB9h/K20x89
         6Xy5APOoxgUlRjhopjuyQZ/VWWgMudORemECm0+jKQeEnmyJm9w1zJVGVZtv88OIuW2H
         JPqlqrTH08VPWgfKAGvMGqDCoB2QMeVAbl3+9K/ITUXnzIuhFS7UcJnxq1UKWGKUx0U0
         /rgv1wViacI8ikUCZiZT0y9I4Sf2vQ2ypvw19WCFgP9MdsrMepXbeUm3UVaEGPaDcNIy
         4+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNluuY3iGjHAawap6GVVOI7amXgaX+R5IWPUXMObGeN37gb3WvwMop7+4qzXONkMKiIgswkR3/G6A7@vger.kernel.org
X-Gm-Message-State: AOJu0YxRdjJAaboZdcHQ7y5/f8oKkDejdMd6d4MPkL7xOlcTCs+9m6Yd
	kfNpd8QQPpo7v70+PaFg5Bs27neRiYEIvvAckN8khsXlgb1siFs0nFSTPf6Xc1aB5G4FTRZ8GQh
	9dULYKV1rx8gqnGRccQMdHNINjU081RDcbX0TyOI5u3BMRE4WSxoLhraSY/6GAU8g
X-Gm-Gg: ATEYQzx1Gc2+gGvj8UrRUBUY9N5APVRGlcCBXZuA4ZlubphAz/wrNmsgisvdGH8VNFQ
	cJjNYwbCN1NafPtR7QDqJ/dCRwhOo98Lu9uwJLLy/vilUOfzUteVChmDrR3ViWD/8JfMS7zBe7V
	g7wCaQLa61LQ87Qjhbi8SKIjSxMkikmTR95e+p68zlQDE5xfMfoMNXShHa7c4WUMLYc4BBE64zl
	vqDO9x80Fn1hOKdzI2Gj8n+kRfuFrpYt6KETW9FJc4scsVtakPr17DpaarxiW4FcIB9SE30Hhc+
	0GNwt7GZN7Y971qqCO3mLWKZQrZTRRzqW5QqC2AcovtqHNC1ooZYIPVtVFmoaZRdwJuwFuoZBU7
	Lqm0N0C70Fh4i15QuCvgjes0eE+gFl0Tu7pph+vSL/tEXbg7zsLGH+hBDNMmbProvSoSzOThojN
	o5fpT5ZTyOQv1dzdXIn3sIbTMNRDwQG/5dJUc=
X-Received: by 2002:a05:622a:153:b0:509:1e54:a501 with SMTP id d75a77b69052e-50d62614df9mr67424921cf.9.1775248125290;
        Fri, 03 Apr 2026 13:28:45 -0700 (PDT)
X-Received: by 2002:a05:622a:153:b0:509:1e54:a501 with SMTP id d75a77b69052e-50d62614df9mr67424531cf.9.1775248124765;
        Fri, 03 Apr 2026 13:28:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fa84b0sm15396251fa.2.2026.04.03.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:28:43 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:28:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Message-ID: <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MyBTYWx0ZWRfXw5klbodd8tgV
 5zHOC4Vq3+0KwBMU9t2n+TVg4HLm2BgH0bNqdP4MXWm4REhGe0Anu5a5Oe3Lwc+1tIV46ADRAjH
 3PreQGhr/2pdwvEDpsEWRfU8ccNhtDGCVpwsor4W+Cr+GpNUg+PsrDTcSMGktexQNPsM1okNFYB
 usWynEbaeDKx+k3CLfcixOlJ06C2LTeHX+BScrD6WOX5X/+XdVcO20WxWuLFzTyLxNzsK6YhqLf
 My501kRayeUoTJL5fwy77MSENccgmwd3fgC5SbFpe7IHoNLcenQ/JhBxO1whFE6zXiKrOGdA+w1
 6QiwlCExzzgnxpWEnAw+TbrmoytrrcTW7Hu7j9av1gq8l2g6a+6ZcjCubXgzoa8JZh4rvAj8e60
 LYIOhKxm2F6FgwlNB01g7OcmJmuo+xGB2sY7dZ7RSzlM7mAckMYmUrB9HhVlIKDCGSQl0oeSyW1
 KI6wuLW5A6gUkxcInNw==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d022fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bypAB7O1tipGkwTwlEMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7pGSo4WWG_zfbnTXsDiSDyIqmwN7AZ2M
X-Proofpoint-ORIG-GUID: 7pGSo4WWG_zfbnTXsDiSDyIqmwN7AZ2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030183

On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
> Hello Dmitry,
> 
> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
> > On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
> >> Introduce bindings for the monaco-evk-ac IoT board, which is
> >> based on the monaco-ac (QCS8300-AC) SoC variant.
> > 
> > If it is a different SoC SKU, should it be reflected in the SoC compat
> > strings?
> 
> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
> -- All IP blocks and bindings remain identical from S/W PoV, Hence
> haven't included the SoC SKU in the SoC compat strings.
> 
> Hope this is okay ? Your view on this ?

You are descibing -AC as the main difference between the kits, but then
you say that -AC doesn't bring new software interfaces. What is the
difference then between monako-evk and the -ac variant?

Also, from the naming point of view, it is monako-ac-evk, not the other
way.

> 
> > 
> >>
> >> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> index ca880c105f3b..c76365a89687 100644
> >> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> @@ -918,6 +918,7 @@ properties:
> >>            - enum:
> >>                - arduino,monza
> >>                - qcom,monaco-evk
> >> +              - qcom,monaco-evk-ac
> >>                - qcom,qcs8300-ride
> >>            - const: qcom,qcs8300
> >>  
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> Thanks,
> Umang

-- 
With best wishes
Dmitry

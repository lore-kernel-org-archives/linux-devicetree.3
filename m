Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8B414A05
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405271; cv=none; b=Ckk61OfS59PiGP+N67ITADZOdv1fxQ7NzJqeSXxhZBVCPIFQ3QD3y0lCGZZreOfc4BimD1GqO3Dpieo38RdkmOurARq1b7KCSBgMeE9wQwpAa/V6A927lOe6DOtiswuITo0TjUmo61Dkiu1qSdOeFVa1NkrPndA4w9W9ZtUtID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405271; c=relaxed/simple;
	bh=TWZcaoYedN9vt318azwnKiuxOwPacA2PqNrEVyKTDPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wyw4yy+kd4UWB8HA87RHjWfv0YuXxv/qSzD+qdDxSguYuqgzszgzbuiwwlsE/BLZxfisAuzTGdg0MHfuWkt62Ry0AI3N3BNGZq/n29BKPcMnEp6wYCY9KdXUMSsSyvoe2er+BSuH6TlT4yqJ/iQ56sjptWg9rlZCYLset+nR8TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoA3zj3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YubpepZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoA3zj3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YubpepZ0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9KmGP577525
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5Gsqudw6nv08tHMDqKGeWVj
	bE239pjZrounP9ra9MM=; b=MoA3zj3lm11svcKrUAGVVlVpivvAbaJIflscSbW7
	J9myvvmCrbUmU03zw+Byp1RlyQjXzrSqt1a6l8sO5++YZNems1csp+xKMPNRAjVN
	78RmWvLyYo8QYu53v9n5n2GGmNUEeadPmpMKyaA4SCfMtKIYMrLouLaVgqntI0u8
	9+J9aedx9lNKCyRdSMTFh/nOctHAVpUHpxPJQBVuULpg2j1HfjQyGrkJMv0Y2T0j
	cT5BEbFH9oG5tcKZX47Yf1YFVCF3Pt8inEJkSQpRUaPJVoQF7wqKJCxmp+DqYIX8
	hmoDmXqDbORcmY9An4nMtjI4biBxQ1+cTsu8hG2NRf//pg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3w605c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:54:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso21764906d6.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785405267; x=1786010067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/5Gsqudw6nv08tHMDqKGeWVjbE239pjZrounP9ra9MM=;
        b=YubpepZ03sRT5tZhCJgEXsLH+uc1+5gVU/D/hbOjl4LISMABsgZ7GlhgCtdq8hQt7a
         gNv8JvGBcpf9J8pLA6p32YP0BaJb+IGp2X91qIkcFARYY68v3feOaVnkCbFZOcpNVZxY
         I75eSYdoebaa5XrPnV991qgKK2vttqjEtLyL4OlljN/qp+tpNm5J+M6W2190zkAUoTgM
         D5UVPw2StF0D8BayUInQ7OcBehmOJh6SPkBh0XiOb2ZfN6hSPUqz6K/XMIw2UUN0yMiI
         me5MUXddX787HoAxMMU0+jrJo6PCxGCwUOYFhFPLEWDv2/8ynfPegNT7NRj8501OLGP9
         ctxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405267; x=1786010067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5Gsqudw6nv08tHMDqKGeWVjbE239pjZrounP9ra9MM=;
        b=LG8fQVcxIq6yRGIJtPrbCrBQhdzDUCIT0kJlfCcuikLkx82hilsAHKcn0rAX03pxPS
         wYVjnfQb6oZSt1byo+NyqdUVYZ3eiAz+8+x8EbMTgeZTtSoTzkdURFcoAUAByuGKGmaz
         3I54WTz0GvSAJWg8X3PsrZahiR0moaTBpuoU8MlkBvDlnaDtmoXEW7XOY9mpgeX4Esk4
         r/jqxa5E/aUz37hbpcifnEm8x3MyM6CJm9EBh/8KF+p9DsYkPLJhf+as6Xepw+Ec3YW2
         X6JVeSgs/+mGFG7qHBLr0SA1sNJzM6Kko+bOp1MmIo8A7mAmxfs4KOuBeXXQz3F4pWGx
         BJfg==
X-Forwarded-Encrypted: i=1; AHgh+RoQC2FEspINMhIX3MKLgwvCZ/qhHmdv9iefm3AIuvqgLdH7dDbJITwK6Wex4stiKlW14nckH4OvdahA@vger.kernel.org
X-Gm-Message-State: AOJu0YykCl4weFyeTr1+W46++1dJsED2xpSYHJz4w5HEa/M/3MbTy4EW
	UkzZgMJoL0FizbaggRqWYyoQR/1q3LalR3CggJKTphma/qpxNldCvukRNjOn+Ou9v84pz1JWTLG
	1dBBSV80ubsviESXPfuUSQwzKaVVvhnn6Ao8bwcT1FbpDqJ+zZ9dSXYRhiU2VLaGsgWPQuaWm
X-Gm-Gg: AR+sD10rASoKpIEBTljDyxRGDSmYW3G5QsDQ/HYm0LX+W/JAvJ50eJ5xHOyTEBgHxQC
	OxwxUllQsVlNch+q/HeNqiNCHCYiVivPeCPrda0fox5jlFST4vlkRUY1ESpU77gCmLLDdeAY0Vo
	TzjuGAPvpWKtfGXXcXnmiIolL14+5HPA6BvXry95mvBcV5kNF1bL2EMgLD0/MlPqNXfzlL2jYnW
	ILHRsGNUFj/eMKTDYYkQ8SmoTAqRGH1vNHComSkiiFEwEoqx0vpye9dM2+I+/0pWV0RtfRU1ZFb
	3hfUVPN6KRTGH2IDlMWw8b4OcOWGxI2EINGInanzeydG3AGqBC8okE6ymm49fdvNR1w+V6Xdr88
	lKXhv/nIUVX405oeDKQ1Cme53fhtJYY0winuRqNFdYr1DsL5P0sttzKPw7ttdp1Y=
X-Received: by 2002:a05:6214:5b08:b0:907:e7e6:9544 with SMTP id 6a1803df08f44-908346b0d3fmr15445926d6.9.1785405267628;
        Thu, 30 Jul 2026 02:54:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5b08:b0:907:e7e6:9544 with SMTP id 6a1803df08f44-908346b0d3fmr15445686d6.9.1785405267185;
        Thu, 30 Jul 2026 02:54:27 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9083231a56bsm14244746d6.14.2026.07.30.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:54:26 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:54:19 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Message-ID: <amsfSzgMArno9zRH@YUANJIEY2.ap.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
 <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MyBTYWx0ZWRfXy7+s+HxkQ91g
 eOrf/w8FVXeqeGqLzKjctqPzqsoSJGMDflFZWQWoGf7s3ud8e2yH1x/elNGpnGcpWhSQxwulGfY
 AAeCTAybh0nZZgzOocfFK3d8DBrC3So=
X-Authority-Analysis: v=2.4 cv=b9WCJNGx c=1 sm=1 tr=0 ts=6a6b1f54 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TJUqZQk6AAAA:8 a=DTc2QWxjjepgkL0GorEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-GUID: jGpO7DmZpmsAC5XHfogPWdCZZNhyQTBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MyBTYWx0ZWRfXxTkw8E5J8DiR
 qrKLc6H0LshdUESEzcl2fmWLVUNZancGxGBRxaQ3p89d3Y3eMH5y7Pw6O1yyQ52crdjOZohYiaD
 0TsMEtiEn6VHJTiqpY46MGCKq8w2MIAvdsyUzyJe9T0rc/KjqCnl62vDSdHTAQl8FkUgyLge4kd
 qqEGpnYTb+lhrxmVxhnDQs32hNg1y7O9/93hPFSc/hU+ali5YuYw36ybYRhAWg2wD+KfpqnrzZ1
 HrYKkEwEKOhGEh2H5t6nNnBM5wt7RU/QmKFNB2tCkvLGdZ7ockywiEbfmzbZasnE7GXlDULTEfz
 QOlae8YT9XnmM/8Kzw7fkni8JGYk/VuYc0FqS3dS7cMEYTW69P2gJg/I+IcbUqxgu4RtXxDtHvi
 kxhVKC6w+teH8dJJyTXzvyovSEbTSNR85fPqXk+tnbWLtM1OtArLZWeJ6rDntBwVWeAONPHrDQL
 VGATKkrrl58DsIxJT9w==
X-Proofpoint-ORIG-GUID: jGpO7DmZpmsAC5XHfogPWdCZZNhyQTBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300073

On Thu, Jul 30, 2026 at 08:51:40AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 03:07:16PM +0800, Yuanjie Yang wrote:
> > Document the device tree binding for the HAMOA-IOT-COME board based on
> > the Qualcomm X1E80100 SoC.
> > 
> > The platform consists of a system-on-module (SoM) mounted on a carrier
> > board. The SoM integrates the core system functionality, including a
> > SiP containing the X1E80100 SoC and its supporting components.
> > 
> > The COME SiP hardware is effectively the same as the SoM used on the
> 
> Effectively the same or the same? I googled for "hamoa iot come" and it
> gives me zero results. Provide some URLs describing both.
The same.


Here is pdf about the "hamoa iot come" SiP and SoM
link: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf

The preliminary figure provides a complete overview of architecture, including the SiP, SoM.

In Block Diagram
hamoa come Qualcomm X-Elite SiP Module is the SoM on haoma evk.

Thanks,
Yuanjie

> Are you calling same SoM differently based where did you mount it? That
> would be complete opposite of the idea of SoM, so I have doubts that
> this is SoM in the first place.
> 
> Best regards,
> Krzysztof
> 

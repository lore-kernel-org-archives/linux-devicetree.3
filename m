Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6290374A04
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033051; cv=none; b=CtDKgmeKeJiXu+5L+ClfEG4RavHUYZnTIQA/jGdmcgoa6bRhfIMvOXgUbNc8jRUTUAyKTjsBvCeF25I1Nb3hqADVZN5e8ol+/cHNUmZtU6ZnIHOlKvCu5Uir4JpqdjMpn5UpiX2IyZ9gr1H9+2SRfphi6YMd1disOL334YH12IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033051; c=relaxed/simple;
	bh=632XdGG0Qcm3CwM5+Nef/AUG7OBEdYAiPw86Tdaep2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbpd7/GDOy/JwSU9TV7nEWD5v7kXHNnhslSZrGi9gV5likMDP2lHjsY4lj1N2N9XErR9hA5qM7QvC3M4qsuyvRcm/PsHtVJVgUdDWdA2F8QkuxD5PSoulvjT+O7izBwOZOf9gZoGL/D1DsZ1+vsktfaAWWhOTecydjNcs2Hpd00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYrXvHwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpTX3QB/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYrXvHwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpTX3QB/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GODAV2748454
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 19:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUx1zEZveURPND1+5TwvqA+KP0PI1rp5pjFTilrWTJY=; b=aYrXvHwWT40Wh73z
	zxScp7jVPe5x2cMmhIhA8+9nSo6AzehqBcSLiGWp7pZz7VmMdOIAIL5RVP9duPNp
	FI6gIKjoeQkv0GHL/tGsBR9biSUiXk5D37VEIuIRFE8fDE+P2GC+5Q6yXBiWvfQ3
	Y9ZFmSuncUNRVRAfrLovCtTj3cwnSR5CscP8zPVXDyuYO6fQhONL5FbgMGVqL9l+
	BXh17pFdJ48/DG4CZPtYbE8Ncs8QOpRD030C2KZDxNFeUFQjyCnR43XLgavNKtER
	fwMoJmM+f7vXWPuDFKWvJyAmN08Ufgsfbslcn8l1zHrlWOwJjyu/5buELhnMBwWg
	9NIzww==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeeuqw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 19:24:09 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963a95e1250so1947673241.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781033048; x=1781637848; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PUx1zEZveURPND1+5TwvqA+KP0PI1rp5pjFTilrWTJY=;
        b=bpTX3QB/6Has+v7zAhDXGHMHNlkUeYZEPhIFya7mrzB468Svo0Orvvis7NxAAX80Me
         VoHI3XeptlOlG30MNr7+hnM8KljQRDnLN/QERF5l/FMIduLMAHIejhexE9tzcUbCnvdi
         j+RZznJXSZu8dv+jomWhtdGzbmgIFPyI3C5xkRS0KuMYyNOmqLQjcL18yJyQbdO7redn
         fMS46643jjUTXGbO2xTReNuARQBKS8Dv/NxQsv9sAUEOKgn1xXaE9RH0PEHoXqNJzDtC
         6lcNnkU6CNLKkOob6vuBjQtx6uwZcoGXkW5zcyFAa/EU64GKOqIqqjhD0Dw3irSdPH/w
         v/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033048; x=1781637848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUx1zEZveURPND1+5TwvqA+KP0PI1rp5pjFTilrWTJY=;
        b=akcZwkLrcet783hvbTDeYfs7HQ6Vei1RlPGkchr2kFZBwjwXJpkt/Ji3ER9ndrugGS
         OTm56h767jcDcPrW+z6szM85+8ARrZwvki0G/u2yPlP4gwyLZJvUgfkPGf5LO1lW4lEF
         72tkd+gllZlGf44S0HtI09KdtuZALEOF+yb2EkLMzm8WrBf20PUbg1x7shFKuKbNbrgq
         wQ6iGJIWHfMFV2bGj450L7eeWwd/85NgV0AhzWxKUxS6Dm7I4f3V8L3fqDuJm/VH9cBD
         KkLQoK68HUVO4z6gNvgYqgEG+CNy6CoKS7TggEYV3pT9tatFn8ohZhEhyqZ2HI7bTZwO
         tepQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YM8K3ozAgc4JGtFue9Ti5GISsV7Tp3f28mjqKEGrFL8JIkeP2XvN9AxRDyxIo5vAgRJjNDzfkRhfv@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHpjcNK/7/CNBInb7MOxbgqDxtnUEmA/22bT2OaDFNYmSNUw3
	2wrijP3zEGBNpwwe28Lmma5eTNq+5kHSpbbFd7gK3QQPsj9zlgmzu7KIEXGP1kuQLl3AZYn1Bw/
	rBLdAi5pHtIiNezKagzYDhCzbZpCvGkCBLop1555EneslOwNG/t0JdMqtMAuGZYdu
X-Gm-Gg: Acq92OHBYUUQYPH2Mov54FagN6LtSpOKXN9p888tkEDtHBdmka5bX2KaU4o0NfPhlgM
	08rLADL+JEbng1cupFKmTNpX3gGq1M1WFJ3ipH/Hal4/uiUwgHh9QZVls1y/rJXlXwKsmg/vdns
	bAbLn+WLhU4bjL9lIG9yVPPJoAnxvBOICiNKaWOjgc1ybonP4y52QPPPaX0muwDo38mTob61Sn4
	QM7M2BaLTTqzp4CHig+2XoM2RPJsALpuUm8CyuhnAolo2TOkfxd1IAJKkH7VQcxpw7L5whWPjI7
	TBK5WSmU2jPJ0Ro66iVc4Pz53X6+ca9zRwpxVsTZ2Yn/S9iJ/VeNGSa7rzKqRm7uhv9nnnXH/RK
	gUz7jPgfT2rGAaTvdq8YKtl3IwnXtwKU9sEcErgJ+iUv7aHvtTYoncz3RdhWvjPpC/+P2e4l/VY
	TdbnET8M8YB2BbeAj/2jiK2ljMkgbaH1LAdxg2AgrLVx98aA==
X-Received: by 2002:a05:6102:32ce:b0:6ae:dfe4:3821 with SMTP id ada2fe7eead31-6fefc6c865emr13119148137.22.1781033048043;
        Tue, 09 Jun 2026 12:24:08 -0700 (PDT)
X-Received: by 2002:a05:6102:32ce:b0:6ae:dfe4:3821 with SMTP id ada2fe7eead31-6fefc6c865emr13119081137.22.1781033047528;
        Tue, 09 Jun 2026 12:24:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm57102761fa.29.2026.06.09.12.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:24:06 -0700 (PDT)
Date: Tue, 9 Jun 2026 22:24:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/24] dt-bindings/dts: qcom: Fix PDC OS Direct
 Resource Voter region window size
Message-ID: <vrl6aszwe4otsgn5tgw7yrubjgi4q5g5i74y6qedme2pehsgjd@q5klliei4pcz>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a286859 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=04ycsxgslHV-TqkOUZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE4MiBTYWx0ZWRfX2WufopfKtDUT
 qn96UoUSJwXUeHt19H5ynDq3L+G6hPX9HcWjh0/1GW+fjM7Up/oOpPZAKOHufTOEUqI08lC0cfA
 zmz+nX1h/awUeLPfp36/Nn+ePpn9DMQcgBBI1j7CjxkaxwvhnkYcbnacl3BOBTsdFkTQEaptkJI
 Hj42MFjTliPP0A4FBf9eRCoegqHMMinNXPI0dVz7NeYxv2lkHLeB+3HZg/NJ25JDIIyDL3E7S/0
 pl0x1zMeQKJbLyZjwDt4qpwUng9cnDLWBSt8zsiiB2D6YceX7I1ysT+WVMFynCsbEieGEw6CqDE
 CX/66NOLAJhrVTNEiwrvOf8WkytJvwKYDSKC9O1FOUtqiYOkwBtiZ99f8hGoM5pA0KxbugUUlwO
 KYp6xLU3Ktj3O5V6H7jdgFHwARFBQZzX0hpu+9WwuqySwtLDBKLvVpZloq6vdEQYuYhrC69uJzV
 905hjpgdr5TR24pvOlA==
X-Proofpoint-ORIG-GUID: UNNMqrIcNGDJWDzuPtOP6ZYnQn34Pgqx
X-Proofpoint-GUID: UNNMqrIcNGDJWDzuPtOP6ZYnQn34Pgqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090182

On Wed, May 27, 2026 at 03:13:05PM +0530, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple
> Direct Resource Voter (DRV) regions, each 0x10000 bytes in size, where
> each region serves a specific system client like TZ, HYP, OS etc. Linux
> only needs access to the OS DRV region.
> 
> Despite this, most platform DTS files described the PDC reg window as
> 0x30000 bytes three DRV regions which was wider than necessary and
> matched the driver's QCOM_PDC_SIZE ioremap clamp introduced as a
> workaround for early sm8150 DTs that under-reported the window.
> 
> v1 of this series [1] addressed this in two parts: driver cleanup
> (tightening the ioremap clamp to 0x10000, refactoring version-specific
> interrupt enable paths, etc.) and DT corrections. The driver portion
> will be send separately depending on this series. This v2 sends the
> remaining DT-only portion.
> 
> Patch 1 corrects the binding example, which still showed the old 0x30000
> window and would mislead anyone writing a new PDC node.
> 
> Patches 2-24 correct the PDC reg size to 0x10000 across 23 platforms:
> sdm845, sdm670, sc7180, sc7280, sc8180x, sm8150, sc8280xp, sm8250,
> sm8350, sm8450, sm8550, sm8650, sm4450, x1e80100, sm6350, sar2130p,
> talos, monaco, lemans, sdx75, milos, qdu1000 and eliza.
> 
> The net result is that every PDC node in the tree now describes exactly
> one register region of 0x10000 bytes — the OS DRV region that the
> driver actually maps.
> 
> [1] https://lore.kernel.org/lkml/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
> 

Having the driver change merged,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169C37205C
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705849; cv=none; b=rBJ6doCwl2uMGIKNp7VJlsUB1UClaLEJmS1eQJk4YLACoRFg+wURSxf6U3FNXh7k2cLRN2uiGzlkftYq0NhiSufkrLDGG1hBXJtfWs7numzr8Q12kHuYANq5XdJHvhIG/cr+0rNIvi9LOb8wFLKiaaGFecqBXjQWzlZEQBtPW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705849; c=relaxed/simple;
	bh=h/uqjF3R3sz2YKYkVBCkZA1z2qZxypPsZhVBXAZQnQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqJ1TkFuTvvaaipOVLieGoIdjvKIjGq+84Lr54hRIpCeSrEAZ4F7Di9eTRU2Yih02J4bIF2PYw1hjbS7EB+g5+j9QrKMthtlIEGLgW86ZA9+m4aJEBE6YRJiw/LL4l2aHP3hswDcCO7Hr9Xk27mNoqo5yuHUk+7esOq9CPxGjbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbx/bydp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7yGZl8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbx/bydp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7yGZl8m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P5ZWXq128127
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z1raWWhLV0vMOZgDp8fhNzwX
	X9rXSsNT5f68RVt1IR8=; b=Pbx/bydpwQyQYuMslTHRkLL4d+B4FFarFnUiFEtQ
	nfjVfqqnpE1888w+zQ/1LKvErVSPgda8jYbtOdBHGN7q8JHna9pjtoSwP9DVr/GP
	alz465/XGeLqOUQ7XksPA9I0zOWj47T1wbIQW2iAV5bJ/NVTHoEUs3Y/EFwQQcXy
	qOb7GLuDgRub0JzWPheKVNfad4QrCyU4wp4kPvn1b4u7Vn+ze6VPVuDKVVqrIhUX
	DUfAmo9RTbs3Qmkm2MuGjq8dZQKo2cLyTOeEEc3dfZ8gElVks2pNI3cxMOGnAWtp
	aL7CFmncY4aHBvVZIqMRicBub7OA3TYCJWHKbZvMPkiazA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txpasc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:44:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d38bfe83so76860011cf.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705843; x=1780310643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1raWWhLV0vMOZgDp8fhNzwXX9rXSsNT5f68RVt1IR8=;
        b=M7yGZl8mrd+GW1/lCmROMiSBCIVn7OheKqCWe9/xr5BopDRgJO/+YHyGephHV5oBDb
         We8f46OV2qmuavVgXx8emJZ/QwGaIkkPIN5tEgcZBOf3dhA6ZRPc1gr7U4Wo1ThE3eau
         7xwbRfGjtXQrm181jvVh0OD3lrboWiWSWp9xarc7h5U8vDWPwmEqHgn829oHAtU2sex8
         Kz+8Ti9rL6C+gN702QKezwS5HC6kQoM9qeXZOZq0S8etm6HPOaX4u1jtqm9pihBqgNC6
         FaVd4F+yJy8kZlBH74eOPIIr/A9vq4kf5KmE0xyba1J/9hrM2CBJgBQWb2tZbPwoveTc
         QC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705843; x=1780310643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1raWWhLV0vMOZgDp8fhNzwXX9rXSsNT5f68RVt1IR8=;
        b=GD3P49yUDl93LoyYfzjwG9KBcC5EVo/bjKuHbf/q3FxaOeR7YQVtJPobAvrAhVpXFb
         ziIqvRy4KTHxoNypUJhitjKd09Q+aj8MaM+nY1PWcdXjafMBYvC/m9Cuq5HNsjA7o4r2
         ZTgOH1DGIFtuHXJGcFMbCwLQDfS0+AwSIsV6wNtNQMvJi1fPv0SmqHcDxdxn/+8vgdB8
         ZHwApB91+M/XgNBxsU6UiA8a38rJY3j9AgPEkznrIyHTbVs+95Iu65HPEsxTtPVgwnY0
         QGo7bBCOx056oViLYzK1xJCdRA4wegTikPezBlDQ34tUvdzT+yYg0xG4JsGF4QyEsr09
         /+/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/HPTcYns782CyGKqpOAkbljinphUrMm+uQAMViw0Fxyp8qIXhznkdTODbebXfLg5BHXQ4zvaTqNohM@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwt/AuO+prwvNSO4dYi1C/aFESt4Aq9JCC2fQt6XKSsRdNCRj
	L/jASNex0QU5GDk2QrALK9HjvSc4v/rmQyjgi+k5R3ZZ5lqQLZQ+wccYf47C3vfkPuw3o7jz8cQ
	RVZuixyIY6rv2guLMiCYpBhxH4RqivjNg9dne0PBmN+CGbIQRVcr7B3jwZXBQLs6r
X-Gm-Gg: Acq92OHSvKeuelSJdAWszwdhmkHruZaLTOy786HlVxEwefdUFkLN+bNfr00zWDb+e5P
	TzBND10ymH+HZBVTrx65Il2JBhdhJ+Kn2W8qekbGKYrewPURXG5QZDJFz5evziX4vu5jX5mJx7L
	MR5+qcQQ7Kzg1YYxiJOb5oeB43z8nT1dKu8/aCZmczQvVld2IjDldwkbnVt//Mi2e4QlD2LOOVk
	854XnlegSAoUJ7Jx0wun2dhh2j5vlygaIDtimTiGvQbxECz3/rAg9sTflyUdgpiXDrUuF5W6uYS
	bUsCTa1yJkxrUUSCefEsHJ0AdLPkOzHK9r4aeieue6HAM7Sr8CgmagPwSzPdzN+sHISu+GLempg
	b28RCapszKjUoScXC9H+MgZwA4zJ7LhTbKgj/CGuyKCBdOMalbVDrHB4lw9G+K33LSvbXlkdJNe
	mATCMzh/GcMaZb5rbawZrqXkuqEMepSVG3ukE=
X-Received: by 2002:a05:622a:418b:b0:50f:be4f:465e with SMTP id d75a77b69052e-516d466fb5dmr185267011cf.53.1779705843004;
        Mon, 25 May 2026 03:44:03 -0700 (PDT)
X-Received: by 2002:a05:622a:418b:b0:50f:be4f:465e with SMTP id d75a77b69052e-516d466fb5dmr185266741cf.53.1779705842593;
        Mon, 25 May 2026 03:44:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc0a9d8sm22226301fa.26.2026.05.25.03.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:44:01 -0700 (PDT)
Date: Mon, 25 May 2026 13:43:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
Message-ID: <cadke5cbqfnnbcwlafgajy6g2xj3s2apmtpzp5uwb5limtehyx@4nnoww2kmytp>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
 <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
 <57c26520-42dd-4159-bd2a-69874945cbbe@oss.qualcomm.com>
 <algvollvttjlu4qpawi3gnhwponwml6pts47ebmcvrjvlryl3a@qjq5ildo4qsm>
 <8a1d6c78-fd16-4994-bae9-cf75b1e7e3c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a1d6c78-fd16-4994-bae9-cf75b1e7e3c5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX4ehooq8/Oe1K
 gmWXDSvXKNKHeIuGj3IR00jXYrBH29D7iVaCOinp7D+0TPpfNUPTsVRCAbJ2r8FNd2s9lWMhaeH
 jRgYMAmcpAb9P/Pa4RGbOOhQNvWu+ZEkOTQQHTEWcZmXF/pDBPol8NaVYUnOX34HYrdFeeL/cqt
 IwPQ43BMe0NQLWk0JT8w7YjsYKho9TwslUmeumy3o2CFHffmWql6V7LdqYWoC330O+HA2na7Qu4
 Gm8HFfiQChUSpM7xIU/c6Db+6thNOeJprHkTLC0ohcGdj4NfrWXn13HigvvQ6s79ARup6fQ4+oK
 q1bbs873eQZUNd28bkrfVXhmbQQeV3hvF+uwVxPqu70Bd7hqlr/4RnkeGtdUv3lYucAp0O0KvTJ
 y0gSV347tAYu6mk5oLkzzgl0L+tWmtjSZ/4QQYdlwgHe4hkXSjvJffX8ikuwMmlsGdZaQGqrawa
 ki1png+4c17BGr6q2Fg==
X-Proofpoint-GUID: RFWYF48JP2vA3_1TuWqWOV2KECzSgg-t
X-Proofpoint-ORIG-GUID: RFWYF48JP2vA3_1TuWqWOV2KECzSgg-t
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a1427f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=eCBvbIXyoX1lJJg6tWAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109

On Mon, May 25, 2026 at 03:39:17PM +0530, Kuldeep Singh wrote:
> >>> These two entries are logically the same (SID & ~mask) as the first two,
> >>> does it still work if you remove them?
> >>
> >> Yes, resulting sid is same for 84/94 and 86/92.
> >> Basically, the resulting sid could be same, it's an optimization which
> >> smmu is doing which can result in same SMR(Stream matching register)
> >> routing 2 different sid to same context bank.
> >> So, 2 sid can be used even though resulting sid remains same.
> >>
> >> Also, DT usually dictates what hw capabilities are supported and hence,
> >> captured all apps entries here to match the hardware description.
> >>
> >> I hope this answers your query.
> > 
> > It doesn't. Can we drop them?
> 
> Could you please explain more on what's missing?

Usually we don't have duplciate SIDs in DT. Why is it not the case for
this device?

-- 
With best wishes
Dmitry

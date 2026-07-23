Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8145A3D1CAF
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833629; cv=none; b=JtNjLUTL1UTAIzDjIRNIgCpbZQe1iKAL4J9RAMOW76w+mXqy1G1AsFyL+etSq9g7vwL26PVyxUGQJECJ7YdXfUUBdzwplOBmsKRHO8o7t41jiFkq/lxTcWf9TASE7PyPCHsYzN1qc2yFXSDwgDR7wYSWj4RiT9+po6VwN5B3rjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833629; c=relaxed/simple;
	bh=rtoMW12MbOHAMhkFuhaCb1gwFY/CsybOHASfnKomgZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVq//3naC4HhxciTGcfzoE4cd9rL94neJDvD99chiu+ZyLrAR5u9zKPni0LGSWY1tmP2oe5spTxCI97cySSs5LpS5GU5J9H/7GtzV3MYVyxgkoIydwWB7SA3xNnP54mK4+6Gc/wLurPoMq8LIP2IySTFY1ln737h2aNVa/yzxV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lL8rP2XD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpNNT7CN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lL8rP2XD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpNNT7CN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImADR974742
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=maz1Ap2uB2Yi4KOKuTZbFxD/
	QNecuW97KMW4HvYQy2w=; b=lL8rP2XDHWmM50Vc0HCzAwO52r9Mg6FKSyCaMdof
	IlR+Zj94SZeX1e29cp++k3dbr4t1Uc7aqV+sPiRDYHOtshGvbydJhBCQjYE8aiza
	6hJLrWz6cYHFNLxWzZOmU4W+eLI4/keqduROjcYnJQGPryPMxHVVJMvzaqYBTU9K
	+jfOt3ojNjvDpy96IIQRfI9HoKIU8O7qFWh1D2Tvj6jIQ5FtWP6gTn6XYLIvMRBo
	QuZi+4jh2PgDwkX7/WYIXICSHnQ+rWzGVxxmC0wXQEpxCk/cnj3V/Oj6bnGZ9qpI
	dqY0OBNIbWVTx9EjtoQ+hiEokckdOMfMM3xXXMaoTHNytA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa08djp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:07:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-976cd199486so82580241.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784833624; x=1785438424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=maz1Ap2uB2Yi4KOKuTZbFxD/QNecuW97KMW4HvYQy2w=;
        b=QpNNT7CNawdDGnvcpIUiovHlKfFX/Kf0IZuIEvgwnlE2tXE8WKsW6ah+SPDx7fLZxw
         uxl91nrhykgM7ngOOJfTDaRyysNALN0x9ahKpj1uLnF4dOSAE/vfAuxXfnkx2x2Rj8XX
         kyms2WcMKMeGZzuqQ6QdBjoV/AbYMtuQX1LLRcaXqgxmweLnGortHPd5ZTTYTPpB828Y
         VfgI/Dd+38LSczqiFFHdwTr7XLrDZe4ue4i0qdjWtBSHBnIip9NYkSESwt29xlUFBMqn
         M6vYRZ91mFg43CtUe7vwpVB2EBN/2ssCL0eHbh0Z82WWrN4uGH760wP3JuQWqYqp8pcR
         19RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833624; x=1785438424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maz1Ap2uB2Yi4KOKuTZbFxD/QNecuW97KMW4HvYQy2w=;
        b=E1p5m30Fgom7jxg1fuZkQ6vbtMd73M75MyIdYQyEhGH9IoYEtSu5bOX4rTeGAWCzZr
         +rtf6zzRmv/oP/i4b64EQkPjtykA74QI2cs+pa7wzatYQyiWv6YqxSj80OoNeT85jA8M
         +LE3qbL8fAjF6fFP5+DmDR2mran2iE9K655vRrenyL2/igtjBImQx4HLIjjKfYQY9KPJ
         EMHzMx6Lcsw4iHXMuFCq9svxbJdO00g7B8oquzgLbJzKT7wlRfC4vU44L0MbRgzyqMNk
         /1HXXsGsghD+0ARFtQ14puAwjAOEirq2tUZFHjrYdJSYiVR9jM7uokimdbK1f0UMWeSs
         UnkA==
X-Forwarded-Encrypted: i=1; AHgh+RpjJTn1YRDM9KWUgL3fZM8fCan14Ux4L3QuRNBbEvlB9LJoVj0u28ceEYDpyjwZZmdOoiEzQdMj9H1f@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpIpyU1KwhrhzWtgVoppvac5HE9WEczBIuCjtFWV0VbYtNt2p
	YAg/zkEfQaWH9fygmM7zXycM3c5C+0bppLNzNHCszNFpUWzQmQm4vhlh8rRJ71nESOok7of7UCo
	0SX2+3xJqsq+57pDUEPiX/k5mC1VsF8zN2EcFSh8tUCKNY9+yrhKSJqspSOtcc/su
X-Gm-Gg: AR+sD10l2eVhtFI726KZF87qVTyNSSZo0c2MhEaSrcwPKNB4zUsgTc9g4Z7DPpjU8sT
	aDbUflA8lkx9gNT8DYlY15XgZ4tmcSQB8O76FnHwOIZEITWjBhRHWgQHq+DJF6BB2u5m49kYSzR
	uP18+XL14yvsrs6OpGAnBgWq455oiM3zeGzklCpx2IS5x9FHwmtbYt7wuGoY2ZMRPIPs+8QzKnd
	ov2OL4pzPhLnW0QKa6bWQgtPtbE58T7on+r7H2DMivugv1S3XSKpX8hxIGE2SPtmIsjohBW2kNJ
	UAE+cOkrCWsDomOfmvb3FgttGLwrg1Q7fbErH8ZrzqmTRwfvnP80kxZT9EyviXLkT2+FqIT6kNW
	oT7eIO4eb3FjoAxadu8ZW5GHPnJG6UonYi5jX1fKxxID+YLYmB7+xHB17Vec2UUgRRZQxdEF1hj
	F3NYJpUU0Q9UsaAQ==
X-Received: by 2002:a05:6102:3f87:b0:73e:5068:824d with SMTP id ada2fe7eead31-74d5fdd01a9mr2069223137.14.1784833623912;
        Thu, 23 Jul 2026 12:07:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3f87:b0:73e:5068:824d with SMTP id ada2fe7eead31-74d5fdd01a9mr2069203137.14.1784833623474;
        Thu, 23 Jul 2026 12:07:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6888579sm10165921fa.9.2026.07.23.12.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:07:02 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:06:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rahul Samana <rahul.samana@oss.qualcomm.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
Subject: Re: [PATCH 1/3] Bluetooth: qca: add QCC2072 support
Message-ID: <vxyc3lgvofl3yrodrzgxh7dtw3aegdcy4bwn7nf6eivhz3ld64@i7romsdep7e7>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rbIkU0ObL6i7hwKxtD9K2QKiEAEXx9Qw
X-Proofpoint-GUID: rbIkU0ObL6i7hwKxtD9K2QKiEAEXx9Qw
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a626658 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=80F9w9wYGjatkqxmWU0A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX0+MbXVAXHr0V
 aM7YfcqDmvFQwJDa9FgXOSe2SnmH4DTsgeuaCwvbPytCThhPHPX4/HlrtQppBAUbWoLDSrkutem
 fZvHRgvbUjZ+5BRvgCAJ8tBJitfSzHmUjVXWq0W5eoJfpCQrKdItV4lwlP1uD2teF4BhG/JaeFX
 /YO6jHUj/of+ZmBVHEBpJFzPqbSrILxifth1ucIfVcs0MSJFHMgevS1h/XxAob3XetATbgHoNcn
 t9UXDjB99nYbJ6ALW6uppO9+O4fQeW9fU3SGaK79k17xJwj7Gsf9T0qwMO5yN5GIkmZl4CLwdn+
 KUCHCyfvB6h1CC9CNd8e0JHOZomMBPvTD6tpbiCjLvN1ZYfa6paFRboSOra3D3IdxCxENjsAVoz
 76xoaPJw1ywuyaQUIEz7E2MSViaz6KHXjvwfuJnR6QYvrSx32OrWPHCvW7l9j0+vZtQfxU86kY4
 4/zZFapWCUq5qHuEEHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX88RiqW8q72Gi
 tKEK7yjppaLSMLvQfPXD3tVh5X6AYMkXMam3fU/ZlLcNMURGCpkwjSYNmJStVOhswp8VnHjibvc
 cWGO5XjdFr62cKXGxw9Pmc3vA7LL5kE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230186

On Thu, Jul 23, 2026 at 06:01:07PM +0530, Rahul Samana wrote:
> Add QCC2072 as a supported Qualcomm Bluetooth controller.
> 
> QCC2072 uses the ORN firmware and NVM naming scheme. Select the NVM file
> and BCS calibration file using the controller board ID when available,
> with fallback to the default files.
> 
> Register the QCC2072 compatible with hci_qca and route it through the
> same UART setup, speed switching and power-control paths as recent
> Qualcomm Bluetooth controllers.
> 
> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c   | 70 ++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/bluetooth/btqca.h   |  2 ++
>  drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++
>  3 files changed, 95 insertions(+), 1 deletion(-)

I think you are a third engineer who submits a patch with this name and
with no mentions of the previous work. Are you working in parallel with
no idea what other team is doing, are you ignoring the previous work and
implementing it from scratch or are you picking up a patch made by
somebody else and killing the authorship / SoB tags?


-- 
With best wishes
Dmitry

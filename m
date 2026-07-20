Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705D19049B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509112; cv=none; b=QwVzwaa4xYx50Qj52iW5cftg91apRaaO+XZgQUpIclMwDMckBcO646sk4EXi2+h/lyBq6Rw691b/mDMCc5Hmc5PYQ7Eph/jP8mGCEoE5pylHnnQ9BBvNRq0CeYcIkdwL4PcF2Qfdv1BC2MfhzpN9CZkxsZj7o3mYn+1Skb7Zcnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509112; c=relaxed/simple;
	bh=UfMxRsnOoAehwkOh0RFhkzyHR0CYrSyNtCXREQkkjMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Prbus4yNgEhy9sxI3TXJ9p4wA5wASQ/ltqQWW3n+qrMd8xjEZ2rDzU/Rx0jebGTrtVO5G+izGWs5FqJJvCRvlCKlVkbP2SqZJsXMak3lYJGKXh9d+qUyW5TbBcHpSn1KBbf5qN0/1aq0tg9RrQUR5IhLhzQ+Ik6jAsA6BXHLKOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9mpaHce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGOmtngt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9mpaHce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGOmtngt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtOhV941061
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xiDk4Kx2knDPDiUKLpy9BhcRDBcBn002Yb9VrPVwBJE=; b=W9mpaHce2tmcNPop
	7Uaf8HFRK0btXP/T1fH0QHHps8bAYH3pLgan0kDsjK5voeKzCk2RHQtU1mIVLxaN
	Hwg/qY0Xz4p7cV8Z4T6Q1KwmHYgdhhbZb5B4p1Q4X1mGQLACTmiHzesJ3bqFoK04
	BvRiCt590DGOl+q5pSuJ6WD3w4CLyMMBT0ZpAGWsNB6lpn7DcObS3mMvk5fvRtRG
	t/VtrMrBj7yItZrP2jDcrvfTLDB3GOntaY/PT1jWZWMYhQVq6BTzHHl4mfUcPZXV
	GRYVxc21XaoV60p+n1xHV1sgnaib0aK5U+F0q5r/tWYE7bbliQNoSn1OyJJrRnvu
	naj+3A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6btry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:58:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so4860890a12.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 17:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784509109; x=1785113909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiDk4Kx2knDPDiUKLpy9BhcRDBcBn002Yb9VrPVwBJE=;
        b=dGOmtngtN0AUbEDhanaOP5qffOCGdBpmRmDHgsM4zaLTJU2u8fgDix+G8SILI29ic6
         5ZqJeV9LquEDCCDxdYhTGJ8coFVJ/o6HO/gm2vklEA+6zFFYf8ZbTMvC8VzNqyQCBGvg
         RExcTf3LzDZZ37m5eZxvc7E8E7cL9VAYgBgpMIrCXhIHoX7f0ih8dNQsgT7GDdXxsUdF
         FLXm3DruNhJdpdeU8Ht1dId1+RhsnU8q3O4s29puNNyL0kKcmu9SRx2DgivjDOKP9Ioq
         CVI2/FQDFFPe6RqlWDDDAef3FfKCQi8GppY0D1nnSHNFABTYdaNybPnTMVe4t4C/6+BH
         +p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509109; x=1785113909;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiDk4Kx2knDPDiUKLpy9BhcRDBcBn002Yb9VrPVwBJE=;
        b=jIl2A9BD6C2bufxffjwyI0CveIT8k4ecGOWWmM4RLD5MDluUt60Xvv6P5ivAJLTbB9
         sIiKQ3eIRsfJ07xYPdKhrTfM+wYYpkMST19HoA/vy1ojZyjKFEPJvq0o4bjFLqcLYQ5a
         ZQTOBKSEaUlGxVYuBGAipX6THTeQwuPWOuHFIpeWQBBS1IebmUVXQuYYoq2A64SbD1W0
         ERoFLwJKMUVYoGxkQDbqySyhfVok0jCR+zyiGhkZtjLaFJZ/zLAP6WTU0CmG72cRR3kn
         Xfa6621PDIm66Pgdi8Snk9kbWt9ZyOJvz7aj7Ean5v2H+cdV/1dzAuIJt9sz47HCLXkU
         ggfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm6z8YmXI7QN03zReMzz0hjwALsqC2vK1/r7BaojYyiGgN+YJkYvC92C+c8iym1sPUcmQimVMldx2E@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuk9LV5ejmKIKb+h8Lx+KByCmqjcRqBDfgKKLJVIv/hdBmhbm3
	pCyBP7D1+r2Y8D3hMREFA9E815ohih7I8jOArxumHZSnZqt1H6+iIVNBzNKNBICLlm+WcxyuQMY
	7CHrWtN7AzHJJJNtYI6LTb3rJffVaMEj/R6eLtUn40LD3al/iB2+2TdvKHBfBO/bQ
X-Gm-Gg: AfdE7ckRdKAktcu9Gob3VvSdQrvogiKwwr7RIc6otRRRp9eAi4XD9e806txwMvvqDMF
	iLT0yXYPczsr0sYZTe46ZYgm99/LJFdh0q8rknhoMFhxbiDPg4gSw8sLWvNJnDJ0gX0FxHxEMQ5
	n3JzWIgnabDk0JVPeQlr6elD4aVEez46ukQd6o9M29vXFCkgOQamQ/iJsPe1aGoxa8bmS6O9eXW
	j7PRSEDXh8nIBDg0G+f9JX6JpQJ2zbSnMNIU+slmHPlcaaumjI1JU52e1LBCVH0J3TmoqFQ+oNP
	i4xrmULNxoWx2mup5wcZCWe7mjr+SLooJ4NsInD/KwjpbzxRdAsg1c4Rb3MEhuuZWpZAbYKPCIS
	KsXjUN34h2+5oEyd/
X-Received: by 2002:a17:90b:2f0f:b0:387:e0db:bc31 with SMTP id 98e67ed59e1d1-38e4b56ed5fmr12407927a91.39.1784509108796;
        Sun, 19 Jul 2026 17:58:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0f:b0:387:e0db:bc31 with SMTP id 98e67ed59e1d1-38e4b56ed5fmr12407899a91.39.1784509108343;
        Sun, 19 Jul 2026 17:58:28 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b22c0c0sm4759092a91.16.2026.07.19.17.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 17:58:27 -0700 (PDT)
Date: Mon, 20 Jul 2026 01:58:23 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Siratul Islam <siratul.islam@linux.dev>,
        David Lechner
 <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca
 Weiss <luca.weiss@fairphone.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: magnetometer: add QST QMC6308
Message-ID: <20260720015823.0b1e62f3@jic23-huawei>
In-Reply-To: <20260716141800.82761-1-jorijnvdgraaf@catcrafts.net>
References: <20260714202842.340293-1-jorijnvdgraaf@catcrafts.net>
	<20260714202842.340293-2-jorijnvdgraaf@catcrafts.net>
	<03e59d2907ffccc2cecd94ab44d19359f2474733.camel@linux.dev>
	<20260715204616.46517-1-jorijnvdgraaf@catcrafts.net>
	<989a9b6a2024415ce29c1aef162c6a4d341dfa45@linux.dev>
	<20260716141800.82761-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Odn_k9Kpm34mm4leibQ6lGnLv7LgJxep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAwNiBTYWx0ZWRfX8qmwy7+2uXJV
 4T3JAjHtzhtwWU61BV/mxcIxSO/70z7UxR4AVydzObZxsRXeOKokaAm3ytVnNi5F3nx7hNq0iqq
 2w+UdjsOqPqBpeTUbbcTQ7M3gly00RQZcw7hTLP3UvowCpHChl/+S74HXMkERQ71uRjH40ajBu4
 rTh0vBlIuhNsD1ZVdHqqwvCLyL2frjCd0vyi28jowBkOmlsq9KYWeCDZYb//t821KchiKvmkKw3
 Ifa4fW0nbuqmp6Agj+7ssxeZ8hRM1ULJmQ3SJi2z0UUK9RrgQ3DRDsCE41Kwk7PEbwHJv+ELjEv
 7L26lMCarur6Ad8LiD11vtv9/9u3Z61sZ0+t09xhDLIhy+ePCt6EHjDtO9Tgjvt+17Q1FSzVdf+
 wOKTc9xhrlp9cfygfVHcw6d50AXV7AW0KMBXF9Z0igtMcXKkmi3BDHTpFDcGy6GpocrRtBzSz/B
 wFH6NC86iK9ZC7AU4zg==
X-Proofpoint-ORIG-GUID: Odn_k9Kpm34mm4leibQ6lGnLv7LgJxep
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAwNiBTYWx0ZWRfX4vkzy3NTrb+S
 mXgZdWCVJsg4Otm9tnrsLuX9MDiuEKaVxxPD9YiQCI4sX8hI26rY7MiLqGBvgwGaVIdzDN0w8S9
 S2NH2GVyhT2Uj3oqC0gAUn0TuasEpsY=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5d72b5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=GYSh3LzNAAAA:8 a=FBOe7vr4YkI6Yy5QZKgA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200006

On Thu, 16 Jul 2026 16:18:00 +0200
Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net> wrote:

> Hi Sirat,
> 
> On Wed, 2026-07-15 at 22:16 +0000, Siratul Islam wrote:
> > > I'd lean towards keeping the separate file.  
> > Wait for more feedback before deciding, since you have a few days
> > before you send v2. DT maintainers usually prefer reusing the same
> > file where possible.  
> 
> Right, my previous email wasn't meant to lock in a decision,
> just my preference. If the DT maintainers want it merged in v2
> I'll happily do that.

DT maintainers may hold a different view but to me it sounds like
the overlap is small enough that the complexity of combining them
may well outweigh the advantages.

Thanks,

Jonathan

> 
> > Register compatibility is driver specific. Bindings are only for
> > describing hardware. So if there are reasons to use separate
> > bindings, this isn't one of them. A fallback-compatible
> > relationship isn't needed, as we are already using an enum to list
> > which different sensors the binding supports.  
> 
> Fair point on both counts; I'll drop that sentence. The lack of
> property overlap is the part that matters here.
> 
> Thanks,
> Jorijn


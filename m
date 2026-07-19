Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C24B1519B4
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784424890; cv=none; b=K70Eb+h+7dSBLOi/I1O9U89L2xliINmQPGFK4F0x6y+31gu0Jdt7vTJlIQMoL66BHzGR7wH2tDMZRWe9w6aBpi1cgQ0qTuJhMTXXI4/j3pZZ50oY7OLLU1sqnBG05iRnNB5c+4/fl6FWFwHbpwwadQB/N0NLshnzycPWq/gHdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784424890; c=relaxed/simple;
	bh=IuIbcXu/o2tL3GBFMD6CQrLT2R1109uRJSZnZMtHcwM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DEKaPF9Ts1pVeUJxICJAhrwYh5Bxi5eQRH/697Po4hclLqUJUzQXbzKwEHD16nQZwltpA8HdUm8XspYT7iJz+V5/raZIi+hjgWDsHl2ymzxDAU1HhGO/Jqb+oCLAbq+Bv3NId3ElOY0cBxKU3VAT+DKiyn38HlF/ghaipItJXFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpwcgqAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bl3kjZEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpwcgqAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bl3kjZEZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN26eK1812082
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJgbFeKB+r624rP0ry/B3RltSEhCVlIORufmQ5zSrNs=; b=YpwcgqAfw/tspHq8
	dDgDG892L5kGs/hw5z3cWQIpBc1FS25bQHKxTi4Zma/2WYK6dHjK9godAJigcbbs
	zoPUZL1ITlwDrVfo4L8XzFJmh5YxanpsxVjRm5Ld6FOEemzHVwdKrQY+usRyiRMX
	fUV67RUVcIZx5JABO6B4qtDF7UGX+/wVkomRObAqN9gcbhugMvEnNTw9BjvKGYZ9
	NX8OdiHtcrXaLYRf+6Q4AljEE1qdZOmtUUybO0yGgCZAudY37m/XmNZtwVMS5LYz
	dlgLQM6AISpkh+aKjQNX+p+dSueq7dtLk6Wlz9cxhBdJNMNoqd+a7igCmcOUcXig
	nNpYSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chhw00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:34:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso111600375ad.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 18:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784424887; x=1785029687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qJgbFeKB+r624rP0ry/B3RltSEhCVlIORufmQ5zSrNs=;
        b=Bl3kjZEZy1UlUeyNO2pyly0YJzbDLeJZZldkc1/Itj9Ie83WrmrK7zbWd7hTrdrvrB
         xZRCftf6HqYKC79yvZEQXDnnR2e8aTiVLyPNiMon6/OycgmgDR7IpjjT4HGrGRRJJc/g
         yLK7davRGpZDXwsicptyMZOEgyuCKTeHd+/5Jw2iJYwvZraBrexBrQYMvLWfibBEtUyk
         yNbHAIwMbr8l7X5H8JxuEcIikk+bqf6OCrhk/JdBACAt2G7Pv9+OXHl/xAP64fxNW4AK
         1gI/yzslvtwSjwhfMvzY9hFdDN35g7Bb2hgvg7iEdEfMLYdwreapyPt1Yd+2DeG6+pdv
         yUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784424887; x=1785029687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJgbFeKB+r624rP0ry/B3RltSEhCVlIORufmQ5zSrNs=;
        b=fCPaVOfqhduiRPNRs/QQDFV5Ntx/QhomkT2fAnX4ANjGIVDJOTOa1Wry4q82+D2SK5
         +6dxSGLBAOlYbhFR4n4yqtIVKJXvJAmn7796pUZSVvzFeEoB75A9WEBHbKZZ1dn2K5Dr
         FNg+K40qNHz7yjnyvRheBYxZhIakL1XIEBZN/eJjodhp5Rmj1fV3aknbjwNdWy1erMWn
         D47SK1JsIafwj4mwGQ5+B61JlSk1ndzbIgo8qF8xqklzgfe5nQwjlN0F++t8jM0ZezBl
         q+sQCAtRw5Re+IaN81qDdE3egz7o1zKtE8nXdYZgMcxiZm6iN4TNl66kqe49156eWBHj
         ysXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqilj/8ljjWdeckfzuy27c+b0iS8t33/inhwapwmyFSQSWLZsL573PhUw+0ETLFehoA56WBBfJS9g9w@vger.kernel.org
X-Gm-Message-State: AOJu0YzkxsbzLVWkBR5reKa68XnnsrGjv9xZSRmHbQIPd1FSwVxuBbU6
	2TaN0mQYQY2tupopMVGW0fv3hL2wzznIS99rZ80BThe3IuNM6a+PSiPMdTHsDmN4y698/eVb7sH
	v2gfsLUdn8QLS0Uksyc8hFEd/n1BqCZ5XLBPX7ZaKAg6OAqlEG5IWpws4cWzFcCAo
X-Gm-Gg: AfdE7ckDonuWtgJh1lz6chYAY7xL3o799YDwIo07cwFXiaKIAMDHid1oLg41WAElMDB
	bN1H1YJt/5hrYeQs84qiojs7TDnWBWMTlk3htPHu8JnlKObtLFC9BZ7U/mnDwT0+iE0Agf1oovX
	u3yhkmippquuZKUILB+a73dk8JkBVydVQRW9W8+w3iRijiH+OZV+ROQuoGPmDYnUbdEr5SnxNg0
	qSrk/5VnmPJ4EG6R7/lnEZKYH/BFkDZCSHgINS05e14mU2BPfkrH8cpYs7qAHCEEOfbxYmG1kXt
	qB9u0xwOgQTKaJBn3zFC9WrXmYqcP4HSr2647mONnG54RfskLtBcmn5ywimF1eaDGLbu6Rtv6Og
	+9g5uGGnnY73JWLyO
X-Received: by 2002:a17:903:24f:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2cf3494af9fmr95376375ad.26.1784424886870;
        Sat, 18 Jul 2026 18:34:46 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2cf3494af9fmr95376065ad.26.1784424886420;
        Sat, 18 Jul 2026 18:34:46 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da144sm33789245ad.38.2026.07.18.18.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 18:34:45 -0700 (PDT)
Date: Sun, 19 Jul 2026 02:34:39 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Esben Haabendal <esben@geanix.com>, Lars-Peter Clausen
 <lars@metafoo.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Kepplinger
 <martink@posteo.de>,
        Sean Nyekjaer <sean@geanix.com>,
        David Lechner
 <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy
 Shevchenko <andy@kernel.org>,
        Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] io: accel: mma8452: Allow open drain interrupt
 pin configuration
Message-ID: <20260719023349.063bba25@jic23-huawei>
In-Reply-To: <aleRUWg9MZWgXMVs@ashevche-desk.local>
References: <20260715-mma8452-open-drain-v2-0-95be9f5f4795@geanix.com>
	<aleRUWg9MZWgXMVs@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxMyBTYWx0ZWRfX50iXoC7trR/d
 DwjFW/xP4/uRXu45S1UpEsKq8vHlbVoOSXlEkH/zlWec058V2xaRYcE7oX1+DlkKoNmkv4Jg6EL
 x4zkH1/mLWxRd0Hv07dMizI9iUnUlOU=
X-Proofpoint-GUID: kj3V-OV0DNQ8y38tdLlnhDAHRwlpg_DY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxMyBTYWx0ZWRfX3lyqq5LIxggX
 ehVkWqAJt6joPlOqqPqcW94YMacHqjJ6YowByJIqM7VpKyVLTgBCqpyuyzzpVKOlq/kvIHZOPlL
 Zik6mGfb1jLc5e9DI+Dr73K/90viHML3IE21+7SP4Mei13+m0MGPLAmdLpa/Tdb1MsZLCHLQqw6
 xBCIQY+mHj4fr3SzHdNrfHrYmVijU8nNmbbODZY7vsoNXJ00/FnZGDsarWEwngLvoUYuq3K9RYj
 0Qdgq/IRcSIbe7pD1Hq7Vmucn6+2v/kNl1eANXG2GT+v9mgDFKn6XjkNDClrpfD4bXPbKEpMcte
 Fbxh3XfQ3G9krw/t3CM1/NecgPj1cUUNe4wRQKOn1vex5M29JwdfnCdx9hs8wjAOXtxpOn0o6y9
 BmrSh7+6P1f4MhZ/ak4Jczv7YrO7lSSkkb6QwVtLas9AOoKMvrWrxWnn/DRmNW+J7OqyEXPxfry
 TlCHpR0hlTF0btS57fQ==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5c29b7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QyXUC8HyAAAA:8 a=RhGOBlXrcc6CtF-tMBAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kj3V-OV0DNQ8y38tdLlnhDAHRwlpg_DY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190013

On Wed, 15 Jul 2026 16:55:29 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jul 15, 2026 at 02:33:26PM +0200, Esben Haabendal wrote:
> > Extend the mma8452 driver with support for configuration of the
> > interrupt line in open-drain mode, which is needed for hardware designs
> > where the interrupt line is shared with other chips.
> > 
> > Adding drive-open-drain property to mma8452 device-tree node for such
> > designs to enable switching pin configuration to open-drain mode.  
> 
> NAK.
> 
> Please, do not send a new version until everything is settled down in the
> previous round. Let's continue discussion in v1.
> 

Even if the conversation there hadn't been ongoing, please slow down
with new versions.  At least 24 hours, preferably a week between versions
of anything non trivial (and this turned out not to be!)

Jonathan

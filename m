Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B4330D25
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183655; cv=none; b=JaYQY+HWKFZAt5rAF8ysd1tK8o2IaSZ2sfSyZpadA5ogQTu9NaYLmz78nd9St+3PJ38aUFlm50W0roNWWz+z+IxJoR2OG9TxE8v2LSk7ITM+Rb5bCHoBKCUjpAp/07OuAQXAbEoaX6bUBdH9IcQJLScCYNI0Wf65rT0IaL3cFgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183655; c=relaxed/simple;
	bh=hIL3L/HH1tlkPJXoLUtfGubULcEn3sMJ9QTXWNymtkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIvbH+KH1W7kG6l/HLvuEAw/lixAPz4YRNDjm3GJ0fvAox7/grM6fJvaO0TGu/hfoUCu+DHdV772ENMneQHHcvCrf6vwJgJPCsvUPhS6ubM9NnIImSxb2+ctYDzW9qoqI1wCFdxXV7FtBQtNNHCHkbKXZ7qqW/8tBStsVJpiHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO9qK2Yv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jm934QOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TO9qK2Yv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jm934QOR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695104UL3688184
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sh7R+NUGgsXzLSIuUgY/DFj6UIp4Kh2aWWltC6nO4e0=; b=TO9qK2YvAJizDVKg
	mQz4xkmd4zuusiXCw2TsJ3i8hshS/poy6j4mT9Hmm3sJT5e9PcvY+6gLppIzptM+
	wcLzK6ePu1cFZ2VCpWwQDXOcfG6UQEZ80B0O/0r2hnThyRA02zZMjT8ehDX03juO
	xhdNkiHDd9TgxTuGrhvM+Bkg4Y5eb9SRrVwLniN7jy35f6vV2eh9ngado8lfLjUF
	dpQ8Y7yfHX0iZM98ckM+b/Fq7D3ZHAxVNlJdtIwwaUI4+uxtaJM9Q0BNUN5iq5/s
	AIpIxvIM7hxmRUhOGN53rgGdgUTSGFbthNFN7H2jYwtKGj5uGXW6J/HFRx7oBwtq
	nq2esg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfjpxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:00:52 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c6374b678so940290241.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183652; x=1791788452; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sh7R+NUGgsXzLSIuUgY/DFj6UIp4Kh2aWWltC6nO4e0=;
        b=jm934QORdtI4iGTsrtKDtvIH4nWTRxpitUbQgj1F27aoFkawr6A4NYDawzkvmx+ELx
         38rglaazhLjXpbzhBIeyv+ejVkHiL5lp1gf68YOTJsczkpFTKTf/GMjyI47zyxJbSfKO
         18OS7ravyu08A8YcEuZVppnbFLjoa7I/GmkjT4HlyNEebxXC8uBmDAskSxMotUoxnWMm
         +11ELP1hqi7vNG72KaLZgUlPZyWAOu+eq8icIFszHeF8bjyQWRp26QdMKFQa0GuTfrNN
         BkELJH5XIXPtqdcmsPMwck1jF6HCIJWjOH17jEiegQTRDmG5/4E5aH/yPZWehvkVEGZx
         5d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183652; x=1791788452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sh7R+NUGgsXzLSIuUgY/DFj6UIp4Kh2aWWltC6nO4e0=;
        b=FzI5iNbpqSkdwocnR2RP3Ggi3Es619nHV+Mqzepfb6pqQXOX6oslHp7+O0owqq3XCA
         aGfcMDUY8DDreeUSC3TD6MYYdAdUz1snf+bQ93nY6nLEq6Pr6HzjaFbSe9oethDmJzKX
         7v/eviTgs3rZzbOV+mvjXZ9RuJHr5rZhuF6vFF+jGFtphS1bjOsTM6uLqiRe8/pt78E2
         wxpwp0sVeFG2BLC5O2nSgABUXBQfHRHxlM8Rw8ZKu23BGzxuSM0QLZrh0oaxkPGKsb+W
         QEPGeRzi9blrJYP1CcwAkfFCFTaVZndE7c5gUzBW7NwHk9KtU/HsOyTMhc0F3kdGfCNx
         oeRA==
X-Forwarded-Encrypted: i=1; AKwUvBwxObTikkA5Jldorsj6OukGWqbwnNUJ0coIzH2LXB0Sq3YRtuB87XMG5mBHVDPKbZXdqIun959C8ZUs@vger.kernel.org
X-Gm-Message-State: AFq9FYJS0eRl6V9Dto4jr1M0gvpBCXd0qswly0eSc84opV57fyp6KngG
	vIzAr+UeQCS2qaflLRHGFMYALL/smaNeSLDkW08wOTxyUyu8lW1YGAEzuajZeumy2KP6xQY6Zj2
	k2W8OWhbDEluGj/xQd3dB45DCaXYQWimJPv9HToTOhHTxpGnSP98lTRMB5hBu8I+6
X-Gm-Gg: AYBFou3AqAcM6G40bj+ZmoZfOL5EKFys/0NY6g4n/GG8LLGm3z75JwodejshImMEd6Z
	rpX7bGojIm/irxYtXJSTcPhEQHjkP6mPL2IH6JON4GwTt17S9hZ4cd2Cb0kiFuDrUDDN+qSSqab
	RpSEaMacaTXxNfKjSJa9Z5vbDYaRFBkEkDf9bkjVIzM6DFAtJgB3eywIc/7HVzKbNc/dXnZN6X3
	d0wr+f8VL6731Cc1WZlQpGvjZoQkH332DL2JSl9sYudCubZXfo5sH3iDdQJfxsw3ftBICeM+6NN
	Yl9hYcEz5Q+Xopy2qpLjzvkANwXWHdiLX1hPEDG3hZ3jhU5G5C0psQy+NnuSlAYRoInyKMw9RmE
	jMNv222HWjlNp0LInynn1QawhTYLxIDT8SbHJj6rK5Pp936wfsEcNwGol60N/Z5vlC2pe5UmtMp
	RyAe2qBqpArgEJ
X-Received: by 2002:a05:6102:41a5:b0:7c3:7286:c28a with SMTP id ada2fe7eead31-7c37286ca05mr1191222137.19.1791183651927;
        Mon, 05 Oct 2026 00:00:51 -0700 (PDT)
X-Received: by 2002:a05:6102:41a5:b0:7c3:7286:c28a with SMTP id ada2fe7eead31-7c37286ca05mr1191209137.19.1791183651392;
        Mon, 05 Oct 2026 00:00:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7fcesm36896791fa.13.2026.10.05.00.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:00:50 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:00:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: power: qcom-rpmpd: define RPMPD_VDDMD
Message-ID: <qwedh6ykmzp6hs6n3pcjtsvptuh3oisj5xumi6idqlc2hems5r@i2vtyrwuheg7>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-1-95c47d0f26cf@mainlining.org>
 <20261002-devious-mauve-wrasse-66bbeb@quoll>
 <d5e9ecd991990098a4f1724750ed47f8@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5e9ecd991990098a4f1724750ed47f8@mainlining.org>
X-Proofpoint-ORIG-GUID: 8zyByjML1Y9a-k3pwKLP0D8gzis3jw0E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX4hFHtsAqAZ5H
 g5/8pZenl2rhsjJq4PzQrrckSwOY5iKOHS6h/teSMJexyVGyfO9ilcjF34qcaN3+QMrzE39UVuq
 KDim9hVLSVZbac36XXSpHygro5KkkIM=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac34b24 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=OuZLqq7tAAAA:8
 a=1Us7COI9vatZr-rxjUwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 8zyByjML1Y9a-k3pwKLP0D8gzis3jw0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfXzrS2CXRaOXiO
 E/TWYJj6gXmAwFwbdKe6AzDNOqBzSXiCaqVJMnhxF6Kms05p4hN+IdbeJ+grTjliC+fU36EWHBv
 +c4lEqNwnva4KTiu00r6iiF3zAC1BZ9YRW/lhATzD4MT2B9fsDVSkuPv/bQVhiqAr3wX+64yihv
 HHnGvAgzfMa6aAbhnnaLV6VK+6M4Tq64xSSmSmv1NorplfvwJduO04Dwt/0yxFnB6yeJQzQedY6
 2tTN8QE/5+AzrfY7jS57LFTupTsQnSsloYZ/Af58FQ91E1xVRrpAMsFLa5vyy6MW25fayyyIlYd
 JqqtozPfnn+kkliYXWMiOe5MhzIYNY9bQP3tKNz2lT9PCJ3w8ihI1jagKGSJLz1J55HVihE/Ta5
 fncL6Uemcm71289DBH9uc/F1IFlnku8m8PuBCezeWPLrYb+dpSctk9YaknbRqpwTABr/8+uQFi6
 Gh2BoZOujjVdxnKQy6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050027

On Fri, Oct 02, 2026 at 04:04:50PM +0200, Barnabás Czémán wrote:
> On 2026-10-02 11:57, Krzysztof Kozlowski wrote:
> > On Fri, Oct 02, 2026 at 12:38:29AM +0200, Barnabás Czémán wrote:
> > > Define RPMPD_VDDMD can be used for SDM439 and SDM632 MSS.
> > 
> > There is no sdm439 RPMPD... The SDM632 is added later and bindings
> There will be.
> > header come with the compatible patch. Squash these.
> You have previously commented how that is connected to the indices.
> > 
> > > 
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > >  include/dt-bindings/power/qcom-rpmpd.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/include/dt-bindings/power/qcom-rpmpd.h
> > > b/include/dt-bindings/power/qcom-rpmpd.h
> > > index 4371ac941f29..beb066b3aa8c 100644
> > > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > > @@ -15,6 +15,7 @@
> > >  #define RPMPD_VDDMX		3
> > >  #define RPMPD_VDDMX_AO		4
> > >  #define RPMPD_VDDMX_VFL		5
> > > +#define RPMPD_VDDMD		5
> > 
> > Problem is that it is platform specific and comment in that file says
> > "don't do it" yet you do it.
> It is not completely platform specific and if you have check the previous
> reviews Dmitry was asking me to define it. If i set it 10 what will be
> very safe for every platform i will get warning messages.
> By the way 5 is fine for SDM429, SDM439 and SDM632.

It's not fine, if we once get a platform which has both VDDMX_VFL and
VDDMD. THe whole point of having this generic RPMPD_ list is to have a
set of indices which can be used by any new platform being supported.
So, indeed, 10 is a correct value here.

> > 
> > So the device has nbo MX? Why commit msg is silent on this? Explains
> > not much except repeating the diff and referencing users which are
> > almost obvious if this is properly squashed.

-- 
With best wishes
Dmitry

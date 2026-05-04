Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F713A544B
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891181; cv=none; b=NFbXP4BQF4MnNc/nI/8Amn+USWx5RH9/9OvupnW96ygZSavbzgH/E28U5HHxM+mSFZEWyqIueiHLjKXqrCTZJUcClJVFjiavWUwBB+RC/mM819MvAVvAqJ5dyTB/ECNOiMXt/YA/+Q3Li9jKlQCHiNbgXW2q7I5pNlJzwqgPMbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891181; c=relaxed/simple;
	bh=F1TdU09A9xzirY2I2SR1vBE+Y1AaT1Q0DI4ezpGngis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GATRmUJuh6t4AAlh/VeLkI90i8crSGEpU76oP29j+7PBNnXbbvaWbJTz7IdR9Sf2fwYrvcNQg3pWYmTXJyhIw9pFrjM8lr2ZMamBwB/9ESUy4XXz2KizfYIFci81+1QPUb4RkIc+1UNLjW1q/lMYRMlNFFkkeeMa29DUYOpdae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogsYmlsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eR6UxqQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogsYmlsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eR6UxqQT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644A5HBb1024608
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oYWZTZ1RsxbEbFBZBVQrrfVB
	ZqNyJ/J/7qT+XWhlgiY=; b=ogsYmlsU+3arC0cK9Rx6FqrEKHwmiqIKwYd942ZK
	5RENeKiCedaMMebFuhYR7Fw62eEk3mVzs349oKUsog/tfJPo40cSePwUGnhZ1PaC
	GxUbnb68CGUQYEsWlwkRTWhDZWgsEearEw28OE66TIJ77qYjlhkFF4Ogx50vtMn3
	x6K+95Cn3I6jbaFIF+2VNewUJ89GQgEwkPrqy5+qsASsE3fpuYK3tANzfEgzuqiK
	6OZ8KHA6KhYIZNADoLP+1lvlnNtatBc/2i2Ief0rmoFYeTWEZnZR3CeXaxQgN7la
	fVmtskzJxfS0QD5FIFA/ZDlY0dgyTyHp2zIUR7/0XLWgmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy8333-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:39:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf0245b0so88728561cf.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777891178; x=1778495978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oYWZTZ1RsxbEbFBZBVQrrfVBZqNyJ/J/7qT+XWhlgiY=;
        b=eR6UxqQThBwKP9L4iBlY59B2hJWzauRKqUlbuxsY8iH4gzkz7ZaXAcxOr/YyCs0V8z
         bk2Pm49Sxskilf2Q939wdI/trfPC5eaALvghMObUrnHf2G3MZ+DkBVJnm1mXfH8gwfbJ
         Av/hgGz8T5EoxxXtoiLONuwzzGHlZqcYc8DCGfno6FfPEmhoHdb4nigatpvixdJxCq6Y
         RPA75Zdh8va8DbxcOJ94/YoBPQvCo8cUDEfn/dKv15eU9hbymYOA1AAvb4IiEdGhUFtg
         9WvgHmjIYEoL0uNhTJ+hRLSUZSXmKbkjBpK1VjmvUi6d3mJwulnzQqAPHlToCJ7LRGW+
         P85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891178; x=1778495978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYWZTZ1RsxbEbFBZBVQrrfVBZqNyJ/J/7qT+XWhlgiY=;
        b=FAjfa31PbVo/ywZVP9xL+RSQH00drKgriOlaSpKP1Zadxb9lkNkcaHVp2xXHr4wd/l
         BVPkfeIqz+7s7t60uYfskiV0IOl1ww4XQvq4WIRRWYTBH0+WDdK4C+be+EKaiQXtfG0N
         wCu0fXilxUcSQf8ZeDWT0M9lAxEO5B9D4b2BrCDOYjsMrIbAEGnH8OLepoycbqcJVIeI
         cUZYNQ8W8HkBvQRTJwcfKy7nqTvaPDcgGjmbge2Pqjqpx1rjaAaEP2jW0DOFaOlhnVEv
         ksxF77aUkGDc7+5TMxskwSsOicnQDaLB4vx035R6LAwkAefJJbXstbOPKQie6UAGH4/1
         ZbhA==
X-Forwarded-Encrypted: i=1; AFNElJ/CnfRXRZX1YTA2y41a/wSihB76pBQZivw6jaPasPgb2PQofbrAKGhX0JNjSTkBuruD1h/hkvQJYOd+@vger.kernel.org
X-Gm-Message-State: AOJu0YzOx0f35EcXBKpGedAqpPc+u8/fp4+k9DU2GFGXYw9M4mE1uEpn
	RrpeQhw9Uy8hZ+IPeYD9xgeyFr9EkgjhvugTSkf8NlvEytuDguBM5GpVFTwPsmzTlqb9A0iUSBc
	xJA3RdvIsfQMy79KMIeQW0dWJncpuaEonO8SSa0QdIc0wyz+zqVf1oCrQvwPkujNqahsGVp3m
X-Gm-Gg: AeBDietqA/gnoSTcO8A1npwlKVBqk//CkUYlQGekvtAPioONqh9s7rXNjh+gZFiNe5P
	JUNxCdWlSQM+IFDSH+mlfNMWVyBzegzd7MEr01hlRCiT9C0yRLd7kw+SV1NCc7KIoZCY1k/RYE+
	6ePs3OQ7DiWaiBxm47/b3wSJLFEldD5i5llwhgvmldLIfdEEiB95T7wPaaziCEOLV+CPZnqKZom
	kKXXSN5dJLPyw9QvPk5ZtKOZAEG98HFj1wG9brsK/7ux3296GTE/AzDE9qqrA/KKdRTOXfqcKdY
	RtqdbuaLa16piFD0U9eHWCRUBBujWPJihOAOvx/3ib6CL1LFtlKUVdQz+UP5nURE7/4aOTNN/rO
	GVZjD/nX+Ad2hniYrKifvsdij4W0q6kC8PgiDk/uJtbXccoI=
X-Received: by 2002:a05:622a:2b0a:b0:509:2858:3c63 with SMTP id d75a77b69052e-5104be46d3emr130122531cf.23.1777891177870;
        Mon, 04 May 2026 03:39:37 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0a:b0:509:2858:3c63 with SMTP id d75a77b69052e-5104be46d3emr130122081cf.23.1777891177372;
        Mon, 04 May 2026 03:39:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fefbc1esm77851295e9.33.2026.05.04.03.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:39:36 -0700 (PDT)
Date: Mon, 4 May 2026 13:39:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Add support for Eliza
Message-ID: <q7jljxre6j2zgry54dwpvdqjxwsrrsbqtl65kuwihfn7f4w2q2@5tqowtkknidl>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
 <592fc8c8-7389-4450-804c-10b163dd6532@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <592fc8c8-7389-4450-804c-10b163dd6532@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfX1s37fK7LBTkU
 /P/hCeGZa6etgD8QboZX55X8I4QhVXyXR7SVDEWBgOX0wdsWSy9c/oo0KpRAsKpJMHIuQbTcvNG
 8i8U2VQ6zI8xMU3DUJnTxSShamzxFNvKoWdu59/MsvQBuQFfvVm9NQuopMXXP45PxSjpta6EGV2
 GI9PlJe1HLjnsNs+g0WuwzFLOhX53+W2WlX9x6hQYJ+k6wZ2GL2oMdfShQhcXtOjOAfDDzorTi+
 YaW0nB/cYu+mRwKgiQMgHxSIxGnNeeqgve0GOinKcZzWVdgUCPVv85zvwzrRGf+BkvDgbMI2Rj5
 /IdpCtxsDgBonsR+xlg6HZVCSHJhl9PzP3EXfgKV9+M6m7Cojq9rhGoX0bgQzfwM1DUtXCmfOnU
 ATI1QgXBkeFwd3bPxr/TzD+Uvw4zISfzh93QALAcmyDyx6x0VCef77O53NG3ZiKnr0IURUZUBkr
 jPuMaMlGbYXAxChnRgg==
X-Proofpoint-ORIG-GUID: Uw_97lkAGHgO6nZ4-B8HnkXvkLRBbDVr
X-Proofpoint-GUID: Uw_97lkAGHgO6nZ4-B8HnkXvkLRBbDVr
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8776b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=v0xJPtYkcPsxJSDiwUcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112

On 26-05-04 12:24:56, Konrad Dybcio wrote:
> On 5/4/26 12:00 PM, Abel Vesa wrote:
> > Eliza uses a 4-region LLCC register layout made up of two per-bank base
> > register regions together with the broadcast OR and AND regions.
> > 
> > Document that layout in the devicetree bindings.
> 
> :)
> 
> Otherwise, matches the docs

Will drop and resend.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

Thanks.

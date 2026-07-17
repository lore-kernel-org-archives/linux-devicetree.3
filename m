Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8549E2ECE93
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277741; cv=none; b=p877ZbXRwBIeQbgYx3L4zH4H9/os/pEynI1cnWDIPy4g369W5THLCiG9HI0sq+4jdOy7HylQSdcbS/TQwfYB4hhLHpt2jmRCrJDCFPBUAbXluGncmpX3TloyZGaqj1uN6/ojloGr7IdcNn6zQaaJ1G7rE4JygJR3YlyBWNuRkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277741; c=relaxed/simple;
	bh=Ug5IfIufd/F8tkTog7HZS//RCKPr5VJhuqnbPh/oOpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8EAMnj2/mI+cf2c80uohvEDaGHfEEWS1vHFTh1I+Trl5WhY3XiIEKMOdWOYQRj8lXu5OK1DGNPz/x5mKmhEUvfoBg84yYS1DTobr5gJ8LKOMucBJ/aUUOxLnAOKnud3+eWuAuZtPM9sx/hw1v8+86CcZADUZ65ew71w0/Z1fKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIZHdiNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avmWu92p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIZHdiNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avmWu92p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cI3e2098571
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tDAoFsXchHDGsLbGyYQzswa5
	qoUFHTIgk2f6OWlaAgU=; b=eIZHdiNUDtmqDPqlnC7dOjYQmR0Up8wHDOCGLJ0j
	YzKTxWqHJupJAMcNu46AWaJP8muFExEX8KOUcPvYqJYJX1gsBOSbG7qH0/9pC4Ic
	qlXNK2deFdKzJfn/7UMRvFVfDShDRY9KqGtLRYWdJYldXNiO0xKcO96UMBmwRo2I
	M8Btaf/42gkLmcdsYOWUpNZEQbYMfPGxy6+tlJf/Q6pk2NC6wRE7lD5064+se31t
	a9isTctfSyz+TJqBDfQaWZSPOtRb+FVQOwoDXL0BjOMwbmgZvg+YFnYJTdC2xStJ
	HOh+w/XRqkReWwlkeya75k9EVtxRYgSKFtQz1tmFsupLcA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jusp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:42:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso8700646a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277739; x=1784882539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDAoFsXchHDGsLbGyYQzswa5qoUFHTIgk2f6OWlaAgU=;
        b=avmWu92pKXQLX6kHJlzRyFvc5hA8rLcbvEUPtY2nZ8nRy35yj/6V/NK2AOP6CfrLPL
         X4z9XpVxXZc3/74OXXyaZpAkv4H6yWU0boxGYAUwCYWfhdS2//C1Ucrcz/dlrusU4jeB
         +voS1CI/lHCqUvVNLvnJiyPUh4Ldt5IVx2LyMBBzaN8H6S0DtQYTiDXtD2Jd8ZC+vAfL
         S738/V3Y6tom4PwdX3hUvCU8QgS6yaVquejlS3K+FJml+RutX6/pATKDp2iCRfNqbokx
         eEV0n9YEzqBtQskGnC/Xng75gmYls7wfMIV9AaYk2WjrsgCo2fdb9zg/ZXU5jSSNnG8p
         m7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277739; x=1784882539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDAoFsXchHDGsLbGyYQzswa5qoUFHTIgk2f6OWlaAgU=;
        b=jC0FyStA9EDMrpob3rPEtD3dC6ENyro8PBFmyyW6ozl0PY0uavjqdmAphQ78oEcN9+
         9Z5AoURsNsg4OxlLYDwYEmjfSn1YLJf9t8RRxJWR76alj5RX6uTSwWpWY025ubeFRiCo
         HXfMjYfLo0lbkqknkb8LfUohiqtOuCBrtg+A+XIHiKuUuu7kTWQ2XGeKwTkvzJRJV2jM
         peMyygFR5/D0xiPtQs0RuwX07RjX22rp5FHwt5U4NMZeNLVuWameGwvNWmiVEfmFbfud
         YOUVOip4IbSo5zosw3Kfqc9K8FqFXvK7hsE0dKDIMrfn4MLAqM83QjjsZNvk2EXcrxc8
         hgIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRzdgTLC4lKes2TQy7DCRYPknPO5SbIjEqoAiApFd15xlJmKHi3X59iaAZBWfx+lOntOWUsIwRIisJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/JLXGS0M4ZSrNLedA1qjzAtURUvX7IKgceGI+mSyWj5J6weIB
	IWierUdY7qo8S1rvkHmm/5M2hz+ntPgQPJ0QpYA1iKQHhLtnoyC/AZ7doRyhWT4gp6yaxCdwuKv
	+a1fPag7qUFCSfCD8V9Eo/Lk6i6NUTeurRkP2xHV0IfTCZL1MYrk3OaM7UR5HOyV4
X-Gm-Gg: AfdE7cnV6BohhhswxpuCKNaL6GMVjBj1jjgMAChJxAL3qzdm2ChbX3uVH3Xh1mpJqOk
	Cfi/vaVokhmauhT360VjVRlsz5GSTRkxdVrSaBwKYlXzFdq6QIXMWEm57YDZEYVP8xyYAqAFZnV
	l9Qwl0sNc0/Pv0kBJGzO/DOruR5oLKs9eKOc8etsBwyAxchlTfhxM2HnnnCdQUfmxPZg8NLTTTx
	Mq/mKI50QKPP/6hKpHxmAufG0eNS9a1eJGZRgWYbbdJhbK78NkPuZF52i7CGIFzNcABPi0EtaDg
	Z/9Nz2mcQ8hF91CDm5HdMq/AC62DNaDGNyuKDrDJjduWrZvwi65SlNVdtXvltJ8EBtsB3yRREKx
	oGX5hDcfkCyAEh8YF7DwvVWndMI4dwMxM28xY4ITHrAC3VabxSw==
X-Received: by 2002:a05:6a20:9397:b0:3c3:9b44:982d with SMTP id adf61e73a8af0-3c3ad95dcecmr1670302637.42.1784277739029;
        Fri, 17 Jul 2026 01:42:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:9b44:982d with SMTP id adf61e73a8af0-3c3ad95dcecmr1670275637.42.1784277738498;
        Fri, 17 Jul 2026 01:42:18 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2a48sm2896833c88.2.2026.07.17.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:42:16 -0700 (PDT)
Date: Fri, 17 Jul 2026 01:42:14 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <alnq5tDRRJWbloaS@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
 <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX2tJh3V+nKtpV
 Pj/Kibb6kBbE3Cb187fNQrX3VUz8jnhMMhQDtGP+D1Ow8QkGOjwYE8kuZXTnmTSPB/JVSWtBNWK
 ZV/gtMbvZRYH/3NGEdXLkwHgwFy2cQAHeaBKWCKb4K3Os+7zCqNTpx9zkpoSzyqecTLSr6wA7qT
 fhBy9wf7AFxwMG9n+lc6EyVjznY4XRTqPRceduW9OQ2z+ptvSq7zr1n5bX0BHZYiq98tSMli1Iv
 dgsWbKFrB4OSwBmZ55GhfqTGaCK15gzhzgORMMwZ7HZkEddd3bkAam6i2xpYr2FMu972GJl82D3
 mQmh4uB/3EBL4f1yxyDv+SpipU3CQXJX756zeFza1maMklukkRV68rC7lRcLhLTe1R7alniep5j
 59Me2qy6seH6sjppv9ONcnBsGVRDrI4TsCCeHEnjNEkz21wWHl8RmXS73nu/JXgrjBZo/QLyffr
 O1c+PlMl1gYOV7a6Efg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX2YsqmlDdBeew
 fX6KyJf3Q5CV/a8rePao1y9kSi6UBalqUGzNFOE134NJDLDjVdj4OLxkAZIe8vPJSzq0C/6bojH
 HpiqS4fN8gjoccZ32zIu39ugN8WwOrg=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59eaeb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B7WZNfwjtREewDEN4H0A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 5v8U6GuuJA5UmezCbK91ZiVPask8C2dL
X-Proofpoint-ORIG-GUID: 5v8U6GuuJA5UmezCbK91ZiVPask8C2dL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170085

Hi Konrad,

On Thu, Jul 16, 2026 at 05:16:56PM +0200, Konrad Dybcio wrote:
> On 7/7/26 12:12 PM, Ananthu C V wrote:
> > The currently listed SoCCP and SoCCP DTB reserved memory regions
> > don't align with the memory requested by the SoCCP Firmware. Fix
> > this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> > memory region requirements of the SoCCP firmware, as described in
> > the Glymur v21 memory map release.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..9ec7c256b80a 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> 
> The updated regions point to "SOCCP Boot [DTB]", whereas the old
> regions point to "SOCCP [DTB]". I'm assuming HLOS potentially loading
> FW to the boot regions is fine?

The reason why there are two seperate memory regions for SoCCP is because of
some Hyper-V limitations not allowing HLOS to reuse the memory regions from
pre-HLOS context for SoCCP. This is a windows specific issue. KVM is not
limited by this, so we are able to reuse the same memory regions loaded by
the bootloader in HLOS context as well, and do not require two seperate
memory regions.

> Konrad

Best,
Ananthu

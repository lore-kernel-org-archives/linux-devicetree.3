Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6931CD1E4
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703740; cv=none; b=PkKoCobhKZ5Gcmp/91pA6UFaiGIYl8G5mchmSE/kePIAJuvfdsdO0weYlFpnWbM6Y9rNZ7vRMpr5SHw4pe3XGk4YffJF/EFe+DiiCSQK0Zj448iv9SyybS6DWVfdPSpMm2GWmlHwwsrf5ReL4NbysZP52e+o/7oBuNUOavucDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703740; c=relaxed/simple;
	bh=rbhuDJgekdkHv+bVDNi84AE5LM+zHeiCMyce3W5naTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYcu+K3y7ZQqVzMhpEIgUsfpupKRhmK9tuUJyLkJBmk9usvVLXxZBid1c5cRPSOFtybj388sP9CNFAFT+r//PBPPYK7G7VU3viGWykHVZ3uvsVZHqD0uyNq6VDw9fj/mk5VJWCAiM5W75/jCz8Hh5iKud7TE65OFQPG90BWq6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfgNmMml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib5maFv4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfgNmMml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib5maFv4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9QEsC2812390
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IhQx+fQN8NMYGyoe+FxB1LZO
	zEN9L+wVzrVejV2yZ4g=; b=OfgNmMml1DZ/CmCKWR0hegPNSABNWmLY2PsdIEQ/
	yJB1nBPr4xxP5Q2xNGPGwfT32zWPQJHTVwhFD67V40iISKNaN9Djid5qEJPQz88W
	qlgLUEQ1NUBSozgBkH9/oTwxrxogy+DM4EKr1J/ajGGOAZXP5g3lliR0Aja/Ck82
	IaGKMexr0dxmyZ5o2ISRDRA2YHAez6iYvHIDVWxgs3AQ7+Op5i3qEeePpY8D9WAh
	XjndcPKoJXfFFL9FXXlaKdnqr5l34L0yvt6OTdTga3AbacGavwWHYgLDGCaFBDl5
	BO57a7xSHYkr0GCeTx0/x01DDAzl9Z3DfcDRtQHWK/DpcQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3e58k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:08:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-58489da5374so5075779e0c.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703738; x=1780308538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhQx+fQN8NMYGyoe+FxB1LZOzEN9L+wVzrVejV2yZ4g=;
        b=Ib5maFv4HahrLXRywMgEHiT9pvVk7sQM8h5RIBCh2QPhNiVxM0wm375srpHRXEM05B
         wrxt4meOjRCu5IJQY+p6b9LE1gkXv5fyMn1WLWt2DrMJ2+OBBnkI4bvYcWmXZFfoyaDT
         rSleiNXPWWLREMv3jwyxIrpD+3bnyi6nloIUHFsKhFPw3orG3upn1eTaeyIwPv4Z9Ewf
         hoEAcCNIjmIcD/6Jm/Lz5ZAAr7QSPxQjTyqSXkW2/Bz945HUIivyIp2C7FMXTb+cN3LZ
         AbRpMTGgr0E6q379O6UfHpfAeNKs5mBuVWFxg2bW6Ai3NkRpd2dUUXRC9pm6A9tMMZAU
         wklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703738; x=1780308538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhQx+fQN8NMYGyoe+FxB1LZOzEN9L+wVzrVejV2yZ4g=;
        b=pZxb/PUe3W/QOFsjEKTXdRDo9eyc8DMzP4LmcnE5EHAZuLHbOjYMs7OXCdxxB02IJ4
         qz2ZIShvvonDJEUHP0GFGKODFRrkWBgyjLB8TnL9QE9Ye6cnSgf+Vj+6UI885xCMhgmq
         FGcL0DYt0eZxDyX623cwP55L+AeC6sMs2VsJCDFY5fV5C8emBnPPrNkEQQEUGTg6rzj5
         S2YM2xu+ov8iRvqeerOcL3v11r0A8+CbItY7ozwzYKKK/9fTPrNhwkX/SpW8a7qwKZWW
         G1F9mctprUtEtg3n66JT4wadmOPKtkSLSwJaJS8Y5NG1w2K8ZuNkJrMtRCvKvEEED0Nl
         w4Iw==
X-Forwarded-Encrypted: i=1; AFNElJ8+Va5mDKkz+RINLsy7jqxUP1Hl3SxBNH4k8XlQOB2KrG0EaPJvZgzSNl0e6ijkVli30pjGUOwB01JG@vger.kernel.org
X-Gm-Message-State: AOJu0YwPXe1TMjG1dMhVvdnEn6I8Q40q5UDJSfZNftE460Nmr1PccSL3
	6zeeI5SwmY6M6+HbMCXSllz4cFgn4mYt6D1hAiOjZVzECzqTOhPrGSTLzKL3X4vwfs3uH//KJie
	bwvosyA3ZSpskK/rQuWh9/NIGK45sDDbXtvuUvxJGzgJsWTyx9y+DvIP7/QM9fSxw
X-Gm-Gg: Acq92OH5hOaaMWVMF/ZOSDPD6uENZ84JN1zusLMyKW4s8RwqYWruOCoeqS1HBcWTba1
	/2B1GeI+gNQGcSRAvTSY+bEbg/1LNuXNNPOmmaYCa8fYANaQTNIV4m4n6/U7m9pWSKCujEWd1dE
	hTdtTvTjH8T+W9Pg3yP7ivc3HkHI3SfXn6EDbjlpyIxoAHi+bt4yupvLUVqYrk3GBliTeuTLhm8
	gCd6lGozjGgzKe/bh7yMLcn0etunptjsQYZgKNviYcPGrO+2cHKY5/W5Rf5UMfdGEhjAgfQXIrW
	tIB/Bz0USZMV2oSDGaXIGUvaumbeZICJ7i32VG1IY2lWztYAjbprLHzIUt74aA5ElUqE659CVHX
	IPORnl0/6scHiBK12qmFxfyHRjDZYR5ETbm9J0+4Cz5jDk5ykrXRmVwCHsCBZ0z1iMZuySlWZSI
	NppTGX5rTqgnu+1HFP6PcbvYE4/7+87dPx2Kp8KbGeTbmD0g==
X-Received: by 2002:a05:6102:610a:20b0:608:d017:471c with SMTP id ada2fe7eead31-673c1842bf7mr1390547137.6.1779703737786;
        Mon, 25 May 2026 03:08:57 -0700 (PDT)
X-Received: by 2002:a05:6102:610a:20b0:608:d017:471c with SMTP id ada2fe7eead31-673c1842bf7mr1390545137.6.1779703737408;
        Mon, 25 May 2026 03:08:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf945fsm2557294e87.75.2026.05.25.03.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:08:56 -0700 (PDT)
Date: Mon, 25 May 2026 13:08:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
 <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bioUdqVfOeJLGJRjpZ6A28fHszbedNTK
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a141fba cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=N0EbhCz5inPs_2rfm9cA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMyBTYWx0ZWRfXwpXJy9+nwvgF
 oDT8mx5RO7v0YTurVAICrkgmpVMDsH1A8pJWwNl0spPoG/mAp0Ma0pAYTDUrk0aOVxfVlEtZbdh
 B3ZpjXOXGAZ1tKYx8XK8USugfpvW146itAdhMQ+D7ebV7CAFBIwXJKen8pBd+6vfwrmQeGfxmpr
 jnRphOxX7GfHFP95Rda5yuwKEYOdOLN91u4exYyydUDAywP+exskZ9Mbs0FJM7ry09qwdFc6VZB
 VgiAS8bJ1oFbibPtp6F8rPvVZUO9P592fMcC3Feh3ZOB7QZmt4ssaVEnt2pIwpTyrWkuYDASnIa
 CJRsy1hn/673StsMFqWdkdd8UcuanY+FeGIOOqvOWDj5BQ4CJlUIb15wiITXf28TtsywfgtYT5f
 HdIPjwZUKa34+4YemWHvjGysFHGCMHm0AanxkENfnFKCl/bX1arypCN1S53anQr5O/bQ78819Hp
 D2o+numUC3YVAHnVoiA==
X-Proofpoint-GUID: bioUdqVfOeJLGJRjpZ6A28fHszbedNTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250103

On Mon, May 25, 2026 at 05:37:23PM +0800, Yijie Yang wrote:
> 
> 
> On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
> > > Document compatible string for the FastRPC interface on the Qualcomm Maili
> > > SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> > > fallback to Kaanapali.
> > 
> > Can I assume that it has the same bus width as Kaanapali?
> 
> Yes, the DMA width for CDSP and ADSP is the same. If you were referring to
> something other than the DMA width, please let me know.

Thanks for the confirmation.

> 
> > 
> > > 
> > > Assisted-by: Claude:claude-opus-4-6
> > 
> > Claude assisting to write a one-liner patch? It's becoming ridiculous.
> 
> This patch was generated alongside a set of Maili-related patches and was
> not created specifically on its own.

Okay...

> 
> > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 

-- 
With best wishes
Dmitry

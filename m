Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB5514AD20
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682878; cv=none; b=homF/+pPZpG9yHQLj+1Pn+Pk0z8HoVxh5LOPstPhosA+JPSqwxf9PBfvgujl8/wCaAjo1FlUmAyKr05T1VgocazEgTIfuDYo8OLKb0i/ppPncrYiv2pGWuu4v0IXZDFgDUmyREgYA8vFb9dy8V03HjFlY+l8RFTUwEq87dO+Z3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682878; c=relaxed/simple;
	bh=/pdfpnwvAQYfQ5gh7pBGcP7YLdoTlGoQcnR738kvo3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiMSAy7DI9v+CVyjaAfYKIL7AHoaB6ATwgiuG6YF6AqjzrDtW1UOR9NkpgY5Y6A5WHRsBLd24ChdMSj4Z8nR0tciXYsvHsh2x+bKE+J8bDaRUtPZQRE4xSQwfdK0YoBKhPRdfwgRjEdjlHgOlIq62YpQfJeApUhpjNbMMgYCctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRyIGmXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LA8n92iY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRyIGmXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LA8n92iY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVlfE978133
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3XxYOiP/1DPzB49oJMVBmPZ/
	RAdf7R3nS8r+qfrQbwg=; b=aRyIGmXPhtT50lMQOIYHV9y7f4c+SnxnXsY2gUnf
	42v2aP4LSfoW9aGNVVkOgdLmzcaG9EoNb2lttZyx7XG/ddpXrZdg6CUSAsLJX+dg
	T0gqAtNptLIVEhZH6w7Tu269aMHTVoDWMFqmmFQ3g/+acFTaaZcu9YuEqWzzouu9
	7sKVvlPQRMYJiYnPz0b2ZHfceE/lkis0qZN2/Q4qBmXoBiwdVivhhFu27oSgJWaI
	5TkAz+k9Irs9yWOcEySevNyqyJ1TgnxwBUdNw0FAjic9XcXrjgJSMkz0NVHqNqJE
	4+7P7GtNZhp9h4Ga50hj4bPJA87mTOL3ENWYB6UR8bkxYg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vqq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:34:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6374098885eso1680110137.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682874; x=1779287674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3XxYOiP/1DPzB49oJMVBmPZ/RAdf7R3nS8r+qfrQbwg=;
        b=LA8n92iYvqQPoLJyTLpJl4zbnbrTK7bLK+XY/k2uE+Hpf9xpRmDB/7nmC8CHvyXlsG
         DmY1F1/fVi8LvOuPv6sy1eqaA2OWkJvFFfOLc+1/Nqp6LhQbf6UjDZKaSl+h79NWfBVD
         rVcxGsX/YgN0y60v7Uw0HgrT+RjM9fceuSyDOhDtS3mY43pAwBpbMBh3Egu7lvOBjEAI
         BzX6M7eY2/nBd57Y4RV1VjUMIRYizvG8JnFW6ppRzijU+4bktEMbnQY+md4B7M5lZpk3
         F/VnTXY1VlbOr6Lts8q7fntfdupPWJriz+gxpt3e4Jf0xNggDaKUTMv2bBtk/uisSHpz
         fJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682874; x=1779287674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XxYOiP/1DPzB49oJMVBmPZ/RAdf7R3nS8r+qfrQbwg=;
        b=N3Srr5pL9wLs7zNgaGcXGm0YYXE792RbmTPOwDDVm/ay2LOl0meX++qGM5u02+RPiF
         bN94HfNbYim8wTRaX9q0GPrMd69nNZxKY1AH/vMfsw7/mUCMoh9mWcloMAgJt/Yz2rkY
         gE6gYmlbwKoaxt/A/3Voj3KHiX54resAPDYWgmnMz+JGPzXrQa2e1Jn9gSQ93HyYNE32
         aXy4rZrbgZdSHbr+vPlrn+C85arofi+liDPgg2N1MCTzr3zZtZK9FXc+baVMMqj/9fuy
         gwIOEJDLELdmryMBStrMWbegkpixMJLBdNk2PC/PBDouOG5+L96lEYfP5p/wRs1Xge+k
         dnyQ==
X-Gm-Message-State: AOJu0Yxa+ROhrvYosDCDwxhPw0g50wt96KrIlTqk6XKfPgaSiT1URgi7
	rdTR1njV67k1p/ISoB6Ys/rjP56KglR0cyx0qbuD/P/l1HhWr3vLP5ddmB7Diew+7pBqD6RNQqZ
	Fvs/Fav/mEeHxNXT5Lwqdo/xi6wbGT7/jqLEpOEeOD4KG1aZ80pqXml+Iw+WKI5mf
X-Gm-Gg: Acq92OHbNDW2lTqpizrLrlNfOD8Iarzy9JP606MoQwB7WNnZJFcwPtSQhcEvtShZZVC
	yCGkZhubL0m7UJfks+nekfIi7xcuatWcwyhPOIfWb6pkXM7pH3Ka+KEIQ9AzlkGQrABe1ORSFvh
	POZeXM8kzV+pwdOBGUTSECtsJMDGQrrolNdtEZcJ1desm1MTH0k8cRIziTc0uO8djepPQM2GitI
	LavIDK/8xQKv4pAAAeJSNR2/rGGuZ31ZCtDUxc95xnbxfbLj/yJkjejpNv4mZqTihXY2JNaPI03
	jsJDPQ04TwQlEZGKrwJegwVJu06CTAFj4SRJu4FPLzZv8PTi9UQm5X4HZK2KwxfQ8I6DM8C8Uwi
	HEzhZ7F6GOQ1YdZoS3k6GWfDqFHROPMl65HfyF7pFDFIaRl3MPoZB7FRiNeVaMnWj+QLxiHsAv/
	S+0C/lNzh/qfmgR6BTH8IdhOO6PXFkKH9M2USL3tlnFH0U9g==
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr1922762137.6.1778682873841;
        Wed, 13 May 2026 07:34:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr1922729137.6.1778682873393;
        Wed, 13 May 2026 07:34:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956629bsm4052821e87.69.2026.05.13.07.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:34:32 -0700 (PDT)
Date: Wed, 13 May 2026 17:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <be3ubtrx6or4fyuilgpg5hy7z3wmoybsdj2xctxcacffhmdy2p@efme22p3abuy>
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
 <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
 <8216541f-3615-473f-b9de-139e6d32a7f1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8216541f-3615-473f-b9de-139e6d32a7f1@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX8X405pHDltqu
 QZDS2IMJpseit1txcZNFUdNeUkGJ2QgCS0ySdRb+x5Iy1G7MPmzK1JlyXpJVnsIvHG9lrJSece2
 MIPYYGZsO4KTJvtTaI/8to2esQ5m4FBpoFXbHSdr+0zHh2kVd90OarZfO5fuDXRpLw42AX4770M
 VtEqU2Pvo3UPoHb9PurTt5fl1v2IwhWVBf/Gcc4fuMIqtJbiK1vl6vVI2iHj/4XxeRzavGVjqd9
 ahCiUx5B35b898aD6ZEOjpzPPogSIxMRZxKOCqA+CMGFklp7rxFNHxsDcx//u3d7ZOiv3wsNm+H
 t3h0NepcYsK45rZ/rcJfFpapQr4Zr7tmdbTNjeAFSIoquZ9sBIHIMJ2fFq6S5FMP7hNS4dnkwsr
 sFUb6r615TRfyvw8SiplkdyWGN/6tdnMMTSCb7fiiVG2cHn9MvNzlT11jPsJF1GujP/2ElQ3VF5
 LZzA8s8zjbvYf0aYpxA==
X-Proofpoint-GUID: mNnVO3rIhiLwG4jeR8gapCIci799D8rB
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a048bfa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=__p50U_0yobRTnod7CEA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: mNnVO3rIhiLwG4jeR8gapCIci799D8rB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149

On Tue, May 12, 2026 at 09:59:59AM +0200, Stanislav Zaikin wrote:
> 
> On 4/19/26 1:47 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 17, 2026 at 10:47:49AM +0200, Stanislav Zaikin wrote:
> > > Xiaomi 12 Lite 5G is a handset released in 2022
> > > 
> > > This commit has the following features working:
> > > - Display (with simple fb)
> > > - Touchscreen
> > > - UFS
> > > - Power and volume buttons
> > > - Pinctrl
> > > - RPM Regulators
> > > - Remoteprocs - wifi, bluetooth
> > > - USB (Device Mode)
> > > 
> > > Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >   .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
> > >   2 files changed, 908 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> > > 
> 
> > > +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +
> > > +&tlmm {
> > > +	gpio-reserved-ranges = <48 4>, <56 4>;
> > 
> > Could you please add a comment why they are reserved? I _assume_ that 48
> > is NFC SE and 56 is fingerprint reader
> 
> I can add a comment like this (or you can suggest different wording):
> 
> /*
>  * 48-51: presumably NFC SE
>  * 56-59: presumably fingerprint reader
>  */
> 
> If that works, I will add in v6.

Yes, thanks

> 
> Thanks for the review,
> 
> Best regards,
> Stanislav

-- 
With best wishes
Dmitry

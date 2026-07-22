Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0E34B40F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725637; cv=none; b=O5N2Va3E1gihpA8u5MT7x3yaKbWzU8x7Sft5il38AXQ840XQWbIHpiXES0ZnIT2eJgJbfPmnrg2+Fe4u8XLXD5kYvJOQijrQCFqLMKpIdS+eCrmW6AqQdnyiFzpLngupqHOEFtS8y2p96Whw0np3je7GSscfMdNqZ/FO7emHN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725637; c=relaxed/simple;
	bh=ai6iju6dR/uZIB88E0DRbQrr+GbiczsGOoaTK4Bb5Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTG5ndZDky82b21N5d7+2UyJoxyXU7L+/3DbbdjCjKJG0UyXIBH7nKIAMFIBs49UH5potTtHlT08s1HfZYrCw2rWfAWakIa+C28Y9DcMDw+haWY5hUYHOA2EKbpzrqxAHhVZxK0obQIxWbWdNj6k+i9SdpZhW2WO+A+QmMQYiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCc2DLgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWFG9Nng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCc2DLgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWFG9Nng"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1YZL573980
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cdQWdnKwYrk+rfAfHK1HTim5
	6Ui9MiaZ7SBTJlM+4No=; b=MCc2DLgZ8PyZpMTnnLWBVJDsHNe/We6E31G6uunP
	MzgBb1G54xiFXTMR/kkZX7W+f0cGvouLMmcSlnE+mX5RkWqrixXFAw4M/+XyUgy7
	yxxHBgZArDZ9WXETBXvyUmxgNUxBK/QzwHmD6al8eqqxMy+6/S7VGuuVNZttcBkO
	KRvRnSL/43RHLmcNFiPvkbKxGg4Rfef/6aL1XaNC/54o4cUEVrhSp8HefIGP+urU
	QPozc/cGv6qmuT8K/XQJX2e9vhmrKyuZ2GOGYLAqYzaeARU8GtUDNhYChJzl+ktd
	vx2OfcpPkanhodAiv2xkyWVbAE+FDwUnaWJ7dnIM44xcCg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228xb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:07:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737bcdb48d2so3023014137.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784725634; x=1785330434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdQWdnKwYrk+rfAfHK1HTim56Ui9MiaZ7SBTJlM+4No=;
        b=eWFG9NngWx6qzEY5l71S4pLnZZA7GmBUMNqIzyQPeE3SqOz+IOzu7qujOnjS3SPcZs
         qOj+hTTTEzo/DPM7EnxZ922YNAJmsnKqG6h28FTVlH3jVVUrKUIaddjW5yJUijGkgIyT
         BhInjUZY+7q7ttIeouIuJkqDHdy6yfTO9t3lU1QeQFFjh3gLfnEMJ7FyOydeplL2b+nY
         6sCrqKQvhzTYpti00qGiXD7iy/Xn6PwYEviIYO21tn5hqI6QH+85OKEZVuPWP9Fp5mWa
         MF7vW+vnUcrpoZiTaLZAWlENc2MFemce12IplVMsdm4ttuPlSHT2BH0bvNrqJEGKX9wQ
         gZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784725634; x=1785330434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdQWdnKwYrk+rfAfHK1HTim56Ui9MiaZ7SBTJlM+4No=;
        b=lrmR9Rt/qju8DlukrO07uRd3tyFj+lIU6fGV6N0cLOyheYM+N2Ki5e0vpMuHEjdffZ
         YgjgMcq+BKsvR31AVKtXMmOvEsBdKAkXz2mUNZ98NmbbfVde5JMYdM1SHTXbc4FlVwYa
         W8pVBUo7s69UJjJ/rwaD2AjfHiRxM/t8oLLG1z1HnAYCATxOtZjybM8+LcPkqjzwa7HW
         1STjOmuwNQxz+v6TsjtO0edqofF73cLcQPUEGZt7sH4b6zVRFKDA7I8TS4gPhtZbD/rK
         D6BO/aFgVCt0glriSnRhgzNFjG6PdDdd8z/w9n1BJJF2JpCjAAg9vZojAQPsDqE6LU3t
         nl0A==
X-Forwarded-Encrypted: i=1; AHgh+Rpfy20AR+ExLtpIWtXICr2uHdJHkq+fdKMcOOj4Ce8Sy2wpr/nbIl5K+BVjIYkseOyZcGx3sMa+U37s@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNW/UGmpytIke5sgPcEdtUoMFm1hnJIIY9sWqvHeGVhT5/Xv/
	nQeZBM6oWGhdx7pQNOEd4D0L5bMjq2/s/M42Su/3db7AjRNSPfhy/3y8JwQJrA1GChKszbzlWwm
	IJy7MLrc6G9kk+n33J8/RPIERfs3kPZ738W3mQ2fYyZ7m0BL/B8lqN3LG4l0aTzZq/shdXPYV
X-Gm-Gg: AR+sD10orkUNsyN74ijJueDd9EHy3s4Pov5Jj8C00l52fIh4+kOzY9f+56DewPnvHlt
	Kl2Oz2ImEFFyFxSy6DIdjPqPJWLaPs9zeGFDdK5x3xCbU8wG7++peSirUtiTp9YI0uyjAeUkNml
	Bv5kKH1K5Xqa/1Tk/okYQoIrYTboNJOj0AzNEJoUJf5S39wspFtfRqEPd75qfyDYmMupVfOpDlV
	KrdrHj/vY70aj77k0rADKh3mG2Aar6HEV7eIaHU2l4uh7ULztrF8CehbhYejA83ftcPxSbXQfRs
	fFGbaZljEZ9omOI2tK0I02x6OI58lZGdzzJGRM920YO1eJHFak8pOnlVDvaJldPxMfl5lDC6RBw
	C1YRykFkTsAayIImKJqN/2FH+YSInsBWa5a2WwOZvYo0VCauhS+3MenECTIvzkk+boervQ7Huol
	x42WfKrQ2dtjLPJg==
X-Received: by 2002:a05:6102:e11:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-7475376dee3mr7131956137.29.1784725634035;
        Wed, 22 Jul 2026 06:07:14 -0700 (PDT)
X-Received: by 2002:a05:6102:e11:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-7475376dee3mr7131923137.29.1784725633458;
        Wed, 22 Jul 2026 06:07:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9b68fsm460849e87.24.2026.07.22.06.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:07:12 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:07:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Message-ID: <j7lvoibx7ktdiigm5w672ovwrxu3sedm4xdlaqtss4yymfkbtk@ug4zuiu52fcl>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
 <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
 <gotzbjedro6lkzpk7xfszzymg4rd36jb3qojwlm5yelvi355za@jufl7tenh26b>
 <7aa3a96b-d1ed-4686-b38a-85304ec61425@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aa3a96b-d1ed-4686-b38a-85304ec61425@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c083 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6hxfLnOtrSwZhmOnFAoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: CnsOZMSi18Y_G9Aye523Icho_hvaXGNI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX9a87ad892FME
 lOGBnp28LeG6i9RqjJOmLVojIHAfg/GA92C5NXzS4kqm/9UDEJTrrB765K5LNqpHDedxI6bAoBe
 YvXsEuEeW9P3dE/L0z6nw0Ih4RBHXA4=
X-Proofpoint-ORIG-GUID: CnsOZMSi18Y_G9Aye523Icho_hvaXGNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX/CmjqP0+Pg3/
 XEVvsj8uf/+rt2kph2rCstMw+LcRWR73Sn46hYqZfTxtrjfrjBSTg7X5eTpl2lHnPz4uwobnMl+
 9CvCoMZUvvhIhVsGTdErIzIP1jliwZw3NMdFvBaQRhzy3GUcBse9DH92I1Qd03MF3NRCRoHNIuk
 RUFcjc0K8FRcM2jZm8wKF9uwzgesPDBozLm6ykGUEEfNaDAIayfAcxRRg4iqP/eNTCk9VXeCTAk
 HZ1GW1iBn27AnWqRHsRxYoWhUSWVglssihHCtrm3qsCMrVzD+zq/g0DQiVUZ65m9TxEi0chF/lu
 pI1njnFRomZ81WUnDEZSXDZC49Fe7GZt3J8qKGg1uY0zVQWM2UhU5o+L9+IQiaRkbN9EM70LZly
 +J/RH+rfciYyc+WbBJ/tl3/DwJr6m7BnZpT49yh+NCi+KWIJggZ1ir6IKOqDRClLJlSXt7yjX+A
 W6d8PQpLzY2t/BJZ9Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220128

On Wed, Jul 22, 2026 at 04:33:21PM +0530, Imran Shaik wrote:
> 
> 
> On 22-07-2026 11:54 am, Dmitry Baryshkov wrote:
> > On Mon, Jul 13, 2026 at 06:01:34PM +0530, Imran Shaik wrote:
> > > 
> > > 
> > > On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
> > > > On 7/13/26 2:07 PM, Imran Shaik wrote:
> > > > > 
> > > > > 
> > > > > On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
> > > > > > On 7/8/26 8:25 PM, Imran Shaik wrote:
> > > > > > > Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> > > > > > > CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> > > > > > > differs across Shikra variants based on Audio subsystem enablement as
> > > > > > > follows:
> > > > > > > - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> > > > > > > are required to be supported on HLOS.
> > > > > > > - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> > > > > > > handled on Modem, so from HLOS only resets are needed.
> > > > > > > - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> > > > > > > 
> > > > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > > > ---
> > > > > > 
> > > > > > For the sake of simplification, can the resets be enabled
> > > > > > globally by default?
> > > > > > 
> > > > > 
> > > > > By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
> > > > 
> > > > What does enabling the provider node have to do with changing the
> > > > state of the resources?
> > > > 
> > > 
> > > My bad, I interpreted it in wrong way.
> > > 
> > > We have IQS variant, where we don't have the soundwire codes, and hence the
> > > respective clocks/resets are not required to be supported. Due to this, I
> > > have kept the status disabled, and enabling only where it is required.
> > 
> > Would it make sense to do it differently - disable them for the IQS?
> 
> Yeah, we can keep the audiocore_csr node enabled by default and disable
> it in the IQS variant.
> 
> But Konrad suggested to keep it globally enabled and not disable in IQS
> variant for simplification since no one will consume those resets in the IQS
> variant and no functional impact.
> 
> Please suggest which approach to follow here.

Konrad's approach sounds fine to me.


-- 
With best wishes
Dmitry

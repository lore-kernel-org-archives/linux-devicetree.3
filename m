Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD03FD139
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359922; cv=none; b=aNVbPPAtLHSB9IVDAllag9JNmPog7nmpVNDIoVKRJ7GSDN8u17YVArBZRKL0ksqCPxncOV5pN/boN8La7xYVDJBwA7BSJYxUKZKEsi5keC4CcB5V2r7AQpiWmNRmHc++dm8ObSAMDwu9qAvDr4R16apMI8EQNLuIdGXUBX8w7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359922; c=relaxed/simple;
	bh=gMkO268GjxErRWLCU4OA2gNERKV4bWWnwoExRYieo4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwNhd8+GHKoFZJciYf1nsvEMKlX0PaV4L9/08v9MqNBN6BKo0Dy9qik599l8du4+tISbOMCSn0jzgnISozrvmcgL7D+VuERQ3u60ghKDFvUbrh6lcSiz79TXCuySxIpBvL5hA+YgFY/A2JyUu1ZQfzV4JuDImlw7n3IHTx4nvEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7lil+Lu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhPdGb4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7lil+Lu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhPdGb4t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OBaoBP1291144
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X2razetQ/31YyAbP3U9Rogwd
	HzP3G4Gbg0GFFivJy9s=; b=f7lil+LuJsAkxbqkg1+rg8+GKabxKSoOewUVB3Ex
	CbosMfczSRWjoX7pH3J7U0mUgZTPEbbLiNsAIR7DmVbseHA9RvnrEu/GZ6aUS29r
	T9LtXtmgwn/xLv9+XbPrM0PkpH5TZrZqDhwFzOoZZ/QU4fXWdlzDo0y9CxbmEZnV
	RpQhKZp5ovnpqjQGSQLZ/X+spYTxrSJd4Qh4ND1YnyTdS3AyjWnFsneb0w8MGxLZ
	ezijnQDdVmHGHmRjP1mflGsAb2dGmH8w6jXYnzitHG5Jw7g+1+1MNtUfiUy2mn9f
	SGSHkDAmYdseP6q3gj58aFdo8CsbulQX0Ij1rRGrVI2g5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw40h7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:45:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso245299751cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774359920; x=1774964720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2razetQ/31YyAbP3U9RogwdHzP3G4Gbg0GFFivJy9s=;
        b=PhPdGb4txFBprdX5rgo4o5RHrkg4BD9WIor4vrdu+kzW+lGtHv7KYYFuEj6wfGeB6a
         b6N52WOJTS68w+WkdTTjkUe+o6Z+7gS/FszIt6uz3wqv7Vn95g1H5GXYwnTWUHZ/a1vy
         gZERUns+33V9748zCUH8tLrDQB1iN1rL3ONV/t3rv/9HnO4m33CoVHCF5XXc9LgtyG86
         vYXCUMtFWH5sZa+BC1CST6zbkqfJpDb+Ghdrp4EOjAIVbZqwRXgpsZqHHZ/n1XFxEcKx
         Bt6ZFIdXKaBtreoWsRcvbE69rGXMq359fFEGqPVTScDjisizT/Z+sTdNhoGJYLaa4u8q
         IS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359920; x=1774964720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2razetQ/31YyAbP3U9RogwdHzP3G4Gbg0GFFivJy9s=;
        b=ECW4bi1UJr5ybofmUoSevStLJm1S2OmZX8pVJ90YnOuFsnQvwvqglUUBH4k0VdSBMP
         +2i3OZ/ahCwZpK9Tsm4b7E+Hbg2plFxM020Tgq4t03h41r53SGTamHTvrA3aejqjjcUK
         BXDoH+hgI/8PgHJLOPnB3iE791ZOJNnI6qmmIcTXRTFVM4KGjQEWLXRbex1TXQnZ+Cgy
         WQLR1mgiAImrGNPkvpG3wIUbRoTwpkZ1O1/WkOwP7AJw+wHE1Kg/1hsZm2saUjDDFWiq
         9tGWgEwQjDYkxY8XkN6aWHfx/CX11MLiSIfKm5mmBHgOsmB8fHg98RRTgGLjrYeS2WaQ
         XhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXICSwQMP6nFRfUDS0X1rHyAwK488MD1G9WqrOqDoh1Dy+jqAB9lf2dqLGREYmxU/bXLh7asjCgm4eb@vger.kernel.org
X-Gm-Message-State: AOJu0YxTMYdBAYQiOOoPe/qsqJSOAMfLzK4lMFs//EhSUetv0/kweEu0
	1TTioKZmfGIS7NVMIJze3SlFM0Y/vz8YlOYfsEhYXipD6ucC++55pX9Oz0rKZtDe2AlvrcwquNm
	XhqOnPA6WU3KfKAGNL/29ZNYsLlAr1G2seP/L9DfTAzgwNTlF1vg/MpMOCpdNXTva
X-Gm-Gg: ATEYQzwkY94dEERcsK6ERz8vJb93t3UokV+olJqfmjULRH+n6fLAumLKBe/mTmCFgIe
	1hXw6E4re9brieBbaAANB0d/uwsPjtmtLxuw4Igt/meN2jwv94kACsQlGa5/12gaiYjAVnJ1ZtP
	8OEpkiUi06TlSCJDhKmDCUupJy38vJLuWRAQKzKfdZ7uh1tYZCtJE5NuJ3dZJsIs8GK1BOk28yw
	1P19H1ktzyoebw5qK5o30Nw77bAImVMdAvjm/EuB1glzqWlien2hNQgPLVIFJ5/jzWhgGCMgVtS
	I0ukxcNuD0fVguxAclpFvZUZXbpbhRi2fimG5vzrR1vY2V7n87V2mopMnNG97oCFq6A3J5qQy4o
	mo/5Zi6RWKt3yciEOmkyUrV7gBD7tjnvJow==
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr37721261cf.34.1774359919759;
        Tue, 24 Mar 2026 06:45:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr37720771cf.34.1774359919061;
        Tue, 24 Mar 2026 06:45:19 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm37217953f8f.37.2026.03.24.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:45:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 15:45:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <acHxosznN-xbWtjJ@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acHxosznN-xbWtjJ@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwOCBTYWx0ZWRfX563VLY65tzxh
 EYnBo/jys5TM/nxw1ZfboNTW7W6fCjdAN94cW/64QRUzckPb7djiOL/1JZE0X0dCJfUBDVoPu/I
 L6mmj1nKnPHXnUcD4se7eCI45GUwRhKi42IYDesk+7OiX3wa0pPwhLkitQoKf9fgeWZPhEqL73y
 xNgbr3Pnu2kkSmT8xUnRzFRS0cexMRc6ZVMVo83nQF08kbcBavhSa/3HV4SrVGXTPj7rN2hjtuw
 9FNarTWDz6xvY/LTujCM372aZHHkWr1nkh2xoLgw7lYHHgSbP/n3+qxnSlt7rYdcPiR+67SZsd6
 iTDSg0//rIePKhwCh25R5opGr4DAdNEcxbDemDuZB/Gzi+SlZj5n+SLIrO8mnTcN9UOiaSpOX5z
 QQs2gmNLimW2jbSXyxuGervSRvKbbwMTPGdnzp6c5n7kp03+9qY56FKUhRIYjNv5OtGlm5GUljd
 4agNUN4nOn5HR4CADpQ==
X-Proofpoint-GUID: F3lulEmJF2vETJnQunm-PjLBuR0v1Ker
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c29570 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=k09oGH0Gmf3NLY7qN1kA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: F3lulEmJF2vETJnQunm-PjLBuR0v1Ker
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240108

On 26-03-23 21:15:12, Bjorn Andersson wrote:
> On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> > Recent discussions off-list highlighted that the GCC should vote for the
> > RPMh CX power domain on Qualcomm platforms.
> 
> Your commit message should describe the problem that the patch is trying
> to solve, not the story about how the patch came to be.

Sure. Will fix.

> 
> > Without this, RPMh may not aggregate the correct load for the CX rail,
> 
> "may not"?
> 
> In what case will it aggregate the client votes cast on the GDSCs
> aggregate to anything without the power-domains property?

So my understanding was that RPMh firmware aggregates votes
internally as it knows the actual parent-child relationship and we were
supposed to replicate that exactly in kernel for reliability purposes.

Meaning, in theory it should know to aggregate proper load for the CX
based on GDSCs voting, it's just that it isn't always a sure thing.

Maybe I missunderstood it though.

> 
> > potentially leading to voltage
> > drops and system instability.
> > 
> > Add the missing power-domains property to associate GCC with RPMHPD_CX.
> > 
> 
> I think the commit message should be something like:
> 
> """
> Unless CX is declared the power-domain of GCC votes (power and
> performance) on the GDSCs provided by GCC will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> """

Sure, will respin with this commit message.

Thanks for reviewing.

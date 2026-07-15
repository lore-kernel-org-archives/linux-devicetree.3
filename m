Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5573C1F2B
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099814; cv=none; b=Eo2ZtK/PwnI8TAlKhN36v/e3LiCFomenHjp4DlsZyP1LOLMfcfnb1/5PK/pFmqS+LeWqEz49IRMzi1orf9Ht6sBoHB3BoPzwyOAUM/2GTFrbpPYvNiuiqsGOmhijR9EfR7eG75hOI8jYbQfNvliB0aiq1mPoDCx2vQauVD6CQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099814; c=relaxed/simple;
	bh=peEZeARG0HEMoCiHLDH3PVgVIFFbTBPIugxcmGQ/+qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbZXlCYLDif/iXhfooLJWYfAvx32HV7EcKnGeHKe08e/NoMnsol67C/W1QONMI1crTZRzmIZud/VC2pcohDA1bDIFAbOgcFgazxgQrZ0syFEVGxeZxsbaFOWcDVf2OBF1sttl9vfYbcRDBheAF/nZ1Nk3sT2f3F01mEpq68ywbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXra97zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XccGGVd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXra97zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XccGGVd3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lx4S2529562
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l55Dbn+uB739qkNMJrfJN0It
	ChWvhwJWIh3jTf2LSE8=; b=dXra97zrzYHtaS4DfcQ3OpnFrOiRtH3slBd+CqoJ
	3xpy2WHHNkmxxAQugUG7iuIqz5wxAZMnRkqy2lKDfNgPIEnWkDlXm/K6I+oyapaI
	FobOZh2DJ3TgN0yjHjYCIKtQ5EJrF6R3zWQUcbRHgFMtoAsys/YJDegCkSNqLTD0
	ePVWv1qL1ywHQF2sfztgjL4ueuYyQ8BtkJBUML92NF9DcrgkO1Pol87ZMaqCdBBP
	Lg+gzYXCMtj5x2SPqlbmdZ3I3Exlp3sFwvtvK/OY7RK1NGuXFs55v+IwkKhGMbYG
	xfJ5nkMJsNnRTrK7zLSm1ws8/CKI8k9lV9HnzNMTj3IjmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr3h0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:16:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0ab07320so31358131cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784099805; x=1784704605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l55Dbn+uB739qkNMJrfJN0ItChWvhwJWIh3jTf2LSE8=;
        b=XccGGVd3djFEocJMfiD8IInQTka9uZnTzCoQA+ARfLL9sba716l0pA1uryc+2RRZgs
         FVilmtG8DVMMs318Zhing7fTQRWUievF+rOMq7g1h1Npxfo8INhXEAV1VB+vMsI3/snU
         zT/0mVr5B7WIRJmEH6Bv/ISm/12NjtQkH9EDbiH3pzSfIVksp2yjbVyRYgkpj9dK0Ykx
         sDqvaNDlvlxKVzSWYk266EP39RL9TkoDkKchSqu+sGOeCKX54cG+p1/qOdIMEdnYvZYI
         EauQdlLyFd/G35663RmxIu4Yvdg5uRyPzl8Mwlq3i9Cqjv8tLonQNi0mi0gTG/3NcZtS
         EiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099805; x=1784704605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l55Dbn+uB739qkNMJrfJN0ItChWvhwJWIh3jTf2LSE8=;
        b=cRBHJwbaDZzCaajLHVO0UJVwcjmsfuhvN34+ZekOfPU0g7wgZ5KsUTKvyzBx+rqXp0
         /U6L0LMAMoO5vmWC8GT0T5Wzpz9IDh9tQacMrc3/nKTEeMIfrdiDN2fO5stig3EZtG52
         QZB7Y/wHAB/O//spRk3QB6Fh2zIWFF/H90ymNy2tHqKTnL9AiwUD5jbIfKti7ANetRnX
         Tb39H9hLahRcj02xoRpw3WZ0WetutZsQcPdKIjraXpsAsyE1Wh8ca72JOONH0oBcFzRp
         lobm6ZcxYo963eVnrcjV9PEToZrxb6q9pXoBGp0FtF3sdqBl4ybe8NbyFEoeE537l8Cb
         ODPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxfQG7ww/FoTArgNHVDa1nWMxV+iTRy615DA3WXPh6vpAfMUfGFf8hRJtthvOYUgROE+QhgDJ5LuDx@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfl5RjlJyZ+ynllwbTOwuYJQBd4LIvJsahiwaQTMCOjsKLydy
	RtSauD6JOzn9JQX4nmjl5jA1/TaAFAKqX+2sL56A+qoVTmcnWTfno2IT2MbXOgMIYtngslI8rof
	l97aBqYZNE+DBAPktf1LzwtLjxs2n+7ZEEcnkynK2oyVDUAb5xt5IkBgcrkMgHtTulSlZ2cs0
X-Gm-Gg: AfdE7clThOqHdou29UUsh0b2yafOtx8E3+d8forGrYc1GyTorqEimvfKcBSBpM0nvqN
	5lZyIt9QuE/CRzFXOKETzDwysLq9+gBmVd/KirAi46iexWv9QJh8Mjeg2haGka8ZUHWmO+4eiec
	ywBRf+/fuIoJdn1ihkB/dX5TipOou84xj1ABysfckJUw4XWIKCQrx/uBsc1ak5S9tgOqKwideoU
	TNkM1I5saFRER1OhkhsFr5hcN/e/mFQvhWqwsnJ997Yz7uxA+IzCQL9szmKUAfPSxJt/inikNcz
	ZiJ5gABNbuf0hW5lumf6rrzQEUxwSE7RTn5ycfcLsgz59dS6NoPqHOc/33LL6k5zyS/O8n+RN9+
	thlrRSMGIMBmXiL7iJdGxfg==
X-Received: by 2002:a05:622a:229a:b0:51c:7b12:5ff0 with SMTP id d75a77b69052e-51cbf3dec76mr162829081cf.76.1784099804956;
        Wed, 15 Jul 2026 00:16:44 -0700 (PDT)
X-Received: by 2002:a05:622a:229a:b0:51c:7b12:5ff0 with SMTP id d75a77b69052e-51cbf3dec76mr162828851cf.76.1784099804356;
        Wed, 15 Jul 2026 00:16:44 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322dc6sm137697535e9.10.2026.07.15.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:16:43 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:16:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Eliza
 BWMONs compatible
Message-ID: <j6p2aqqn427lr66n6e7gsegtrilcyidmprhyqvmsa3tbv42zgd@mgcz6xp5wi4d>
References: <20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com>
 <20260714222740.GA3177936-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714222740.GA3177936-robh@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2OCBTYWx0ZWRfXxo+IWDrnysTc
 cNbV9OtwUk03r7KvKXkDMsYsjxyXQfTV5vAQf5q03xkJzva1nY1NSfBPgWWDXSdTefVtYzXQ91w
 ooNbJ9DDHeHdTwVnscIqTbgFOVdCHv8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2OCBTYWx0ZWRfXzGW0FK00yqGX
 qPn6UrUTtnztM1S8pEsw86wuBA/jtuDt1WI+YRiCAEpIDfu4/bQN5y+fFgGIkAqp6zRLFItXIOj
 o5DQJFEgQ6G/b6UzOnuCCb4iDrrB9mvsTFMdEzm2HJNBS4rH9+MioJ/sTPVwv19algecUCppNEF
 lStt1APX+95D0gzHEWCGu6xUYYabNpACGEGFQQo/s8B5DKrjtnm+482JV/WVXpFARTE1I6IdL9A
 CA19FNgCak4oEFX3MGUD6AaDz1m+eT/QytF9nupFb/P7jihwRp/WYxeJWKs1q73wdMxAHvbZEaT
 swFH5Tbmf5MrRRVfirVLMfB3iIqeXgk3oc6u0dWHAhuX3ZVncS59IX5aehiOMqZgs2CP0A3/3AB
 EUEoAmV0JZF2thtV3bNNx6wCKUCJOVVOEtjs2RzqqVE/fNLnPt1dz1nT3DjJEuRuRJQByoakLz5
 VMJcPyTg8ctMxbizZ2A==
X-Proofpoint-ORIG-GUID: 5RmXimK9hpJFgjd9FcPGJTbGCJxQvcZn
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a5733dd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Q5Zv6aI2IZJGwc6Qk4wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 5RmXimK9hpJFgjd9FcPGJTbGCJxQvcZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150068

On 26-07-14 17:27:40, Rob Herring wrote:
> On Wed, Jul 08, 2026 at 02:57:20PM +0300, Abel Vesa wrote:
> > Document Eliza BWMONs which has a BWMONv4 for CPU-LLCC and a BWMONv5 for
> > DDR-LLCC paths, same as SM8550.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Applied, but this should have gone with the .dts using it.

Thanks. Will do that from now on.


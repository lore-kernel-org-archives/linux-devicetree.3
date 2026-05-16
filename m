Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7DC37BE8E
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929944; cv=none; b=maoO0blmanZApGh6Chk7Wzq/aQgP15/RUXmBGuJR16hFPxsFsqucvtylBpc6vgPvwtmMvzwZ2BmvnNdjWyyO5y6QOTVT9ghwqZ4SWbGHJebhVvbblErsuoSBlzKONc4eNTysswGyiTgAO/SpNYEnJHj4Wd7RNtkbopwkdtdMwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929944; c=relaxed/simple;
	bh=3vnKfbc1VkmlR1G1GHlzJBAcgSt3U4rxFgtv2H4ZahE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkR9uLTrpNA/mtPZJCyRBLgKMrl5WXhqcTygI9DcXcVcPV6RLe/ZVdmLTog6z9B+jw90zkY8JFeBW5/iaI07o5OkiftCpg1NKJfwKTy+t29LGuv7DeD5IzRcHM8sb/lYCZchCknJcubl+/GpgXt7HFhVYz+Aj3iKCP3UOGIwTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzeVtIF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cY1A4syV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzeVtIF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cY1A4syV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G7xSMI400399
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+2qT5JovX7kfP0I+bMIJ3G9q
	zVfq2Vm0XOgaxrq5B2w=; b=KzeVtIF/+YpjYrIpUGuD2B8b+mTz8csXz+rMq1vy
	trHGC2OrrHd0HAUmAAgDaZ+1JGQcY7JV2UNXaxeN/oGjPKVMlMlPka+K4HcANxkb
	Zk1K4NA/DEhB3E5azARuA1n5z8SMkfHiqiXiaWKSh4Z1M0Izh5icfg88SjMAIXbD
	gHtw/o+BZGmlDKRTYbOqYs48Ahfhn1lz0xn7alE2g4+He2QtdREjZKM02TdfCPr6
	XbnbWD2SLCJzNyCJFugsehAuqFfl2P9k6JFsjHW5EjkBNaykVa7zzORHpGBZ/YYi
	Y8U0amibKQRulwrkHMxYuRDhH0tcdr54TAsnGzPNTLZ5KQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0q8qkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:12:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so35406581cf.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778929941; x=1779534741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2qT5JovX7kfP0I+bMIJ3G9qzVfq2Vm0XOgaxrq5B2w=;
        b=cY1A4syVeoi+3n4WPzRLz8min+hX1aew4rC3sWeUF150xKYVrwLd+RCWowhITOLTme
         LW23WFyS7Kxyuo19yNpPIbVcBoM2Yi27xTY10HmHPJJwMPOTGi3NaWjfzDvzqAtAPhXc
         nkga2W8ZsYB1DDZ+c9gODgB1R7vn26wKboVOtvx3lexZmdyXNPv1Kf2oI7fiaq5pGhlv
         9Cg9wDYkMQD911NqJobWxDQrRu1zUAUW5P2jxUpz2p68pIufEKyQi0FBOzv9OOwL7zts
         JbpOb9+V8kPJxDoev4EE6N1Pv80Q9DnlexCyIJdoIApe0bE+X0en7h05xzc0AmUYdUOJ
         Ptwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929941; x=1779534741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2qT5JovX7kfP0I+bMIJ3G9qzVfq2Vm0XOgaxrq5B2w=;
        b=n7t5WqLto6e1ktxGVPmcZGSk2tRZ7FgX/iOc4mwdlNGlQlUEuwkPeJiJglbHpLnBJk
         Oub9cBSKrvHsshhCa4B8BB2EJZ4m1iom64Oo1cUIS97XMR+U4/TaeGkeJXihD4NcaLPV
         Klh++NOr7Lh5WRfuC9/POY4/EYjsrqV9F/4QZNzV39KTMultxNAm9de9DEsLxWus/YiV
         WssIdnxwiO5iVV4flnEp75TV7/x9SkHNy64KygpzdaS7bSvTUeRaMjzCTUeOJoG9v9ei
         rkjPENYegQDei2VnfFX9HDrBNPllYb19BtCdofzXzEK7jSNfGF5JpVQ1Vffmm+EpVui2
         R28w==
X-Forwarded-Encrypted: i=1; AFNElJ9i0v27eQAfw/QwsqQ9ePQaFXeZlNNxQZ+/1cwKCiII1tUsM5q/IQkCdLh2PCMUG5lwuTibF/owv8t1@vger.kernel.org
X-Gm-Message-State: AOJu0YyGA3njgrJu2dNrI6TgRkk2cTyvY8jGw1KoTuDuaEPiAxsiMJ+2
	v/5+V8doj2TR+Hypu7KOunRpIIakFq4dXB88742pZl8XAbP9CSKH2tKV3sUsv7raB5cbwjaZfO6
	eMOI3loTpzFwNnXCkPU05+cdJm3tRc4g5IVFU3n7d2Y4O46kJH8uJ78PBfIlp9CUu
X-Gm-Gg: Acq92OHw7kSVuAlpDM1X/38e41HHKOVIk/eq+qCIdT3YEtDkslo/F+dfn0N/AxeyLti
	EY+UCmCMZBLFxMrfRDPCm7c91iMi+nG0tbceoOVbm5eCE6nVx91tVjMWnEExTo8My0UBxk7Oc1f
	KeBvLBFdPerFYCgIVeUtiO41/VwnJWJlQ9eMteUBlT9NippAGDwJOInmJpela0VAYuSBKOnku+J
	resyd8MvT/yEXdEuEcCVX2W20pwRsE26JaJCgWDf9Eh1Mq/tXWG5S9gbllWSS5HoRfF1Z5Gxoqg
	AwFEqJ5QCxbqK0/nZ4zli0tkzgV3LBOsK/oj0ADdHv7tJeXQwVkCQ+clUNA1lHiDFuPMtLDlrhg
	/qWHOt4My7g54pJ7oiVqjBuAcFsb2YxC41m0=
X-Received: by 2002:a05:622a:588a:b0:50e:5e0d:98a2 with SMTP id d75a77b69052e-5165a04061amr109389931cf.26.1778929940950;
        Sat, 16 May 2026 04:12:20 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:50e:5e0d:98a2 with SMTP id d75a77b69052e-5165a04061amr109389561cf.26.1778929940447;
        Sat, 16 May 2026 04:12:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm22310497f8f.23.2026.05.16.04.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:12:19 -0700 (PDT)
Date: Sat, 16 May 2026 14:12:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <igtojkmahfoubhkbv2dn4c6h2fzu24patv5n6etjdw3jsy7wss@2qbxzsxg7ph5>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
 <if7u76ecucdpjff7v5a5nryb3oiyouofn4ldpu6dmfweg5tjmh@gxdvexjrazvh>
 <d946b45b-cef0-43a2-b31c-a3860836745e@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d946b45b-cef0-43a2-b31c-a3860836745e@kernel.org>
X-Proofpoint-ORIG-GUID: 8vzw0fgBu4S9ot1yGsuAR4PjZIPUR2dz
X-Proofpoint-GUID: 8vzw0fgBu4S9ot1yGsuAR4PjZIPUR2dz
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a085115 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iPrq9hpNfqLAvcWrCccA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExMCBTYWx0ZWRfX2FlnoKQ1dFpK
 nhK7zQOxSheXz+I3hMB4uPld42nLlavQmOyYaj/grduOo8iTX/Aus1XXbm4HNE7vpItTX9PJVn8
 M1GwUloQ2CFTOU5BF+i82cfULvHbyii10ODmpIoBOlLTcjD3PddnfV0Zi0sQh/5iLf1cHJzhmQ3
 NbeA8RFCU3KD2cBc+XjOOR+FQkaPlQ5TvI41csP8S/1Z3qD4CLH4b39R2q7Rd/xQAz9541O2+te
 Qo/Jzn6MrPYjjaT4eLY63T88fatFPsQvKvqZ0OSmZ3KtC/mBw9QAzwLT9p7mAPthGmQ8N6a7336
 U0i24DxbwaKyOoocJqmUFdzxocu3RQMRRFCY/geYCY0le8ULD6h4MYhwwkg8x1NRjmljd9smjZw
 F0HAMvCGQr+gjgG6NkYGAmBwvjt1TlMHZKALotVQfGfPvllgfw5RbKOQoIZIgCGvS5VX1WvfcS7
 y17OIO7G3bmkS5+41aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160110

On 26-05-16 12:37:03, Krzysztof Kozlowski wrote:
> On 16/05/2026 12:34, Abel Vesa wrote:
> > On 26-05-16 11:59:37, Krzysztof Kozlowski wrote:
> >> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> >>> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> >>> boards. Both boards are built from a base board paired with a SoM which
> >>> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> >>> LPDDR, eMMC and UFS.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>
> >> Heh, I noticed only after sending email - where is any user of that?
> >>
> >> I expressed it many times - we do not take bindings without users.
> > 
> > Well, my intention for the DT patchset was to include the eliza-cqm-som.dtsi
> > and eliza-cqm-ek.dts as well, basically having the eliza-cqm-som.dtsi
> > include the eliza-cqs-som.dtsi and later on add the modem (and the rest
> > of the CQM) in there.
> > 
> > But then, I realized that I don't know exactly the differences between
> > CQM and CQS, specifically the SoM related ones.
> > 
> > So I decided to send without the CQM entirely.
> 
> But it is not about CQM. There is no user of any of these - neither CQS
> nor CQM.

I'm not sure I understand this one. Here is the CQS user:
https://lore.kernel.org/all/20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com/

> 
> And still whatever intention you had, it cannot bypass the rules - we do
> not take bindings without users. They make almost no sense to the
> project, because the goal is not to document entire world's hardware in
> the DT.

I agree. I should've replied back to this thread to say it should be
ignored as I should send a v2 without the CQM.

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B08459AE6
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776637; cv=none; b=pDf+L6yJWmOxLoUMkS7bsInj3DGy6Qjhm/z9MuEYjYPr0+cp+a7xA45U/39jeBgLNUIzvk7PGA07aXCqM8iNfSd3s7VJ+2/FAIyQOJ6lIxyJAMSA5o9TSa1sukFMqtaSa8981NeFij5xmwTn7FltwFbgDIqB9SAVxt3I5eUqDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776637; c=relaxed/simple;
	bh=oS6kmuwgfDj95lMaWeSfrxYSbJkNg5dusu6lI99bMG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ue4bnN+kv/d6wJWDjS5FBIfwfePlNcTZARB0xJ67yat9gU7Dn3HPNa35bnwVqnmWupFNRed30hqnQAOWDkR1MkDvsILDCUuRc9fTI9hMwqBF3n4wHLkW8xLgK2eKHwqx5ixkHe0bpl183uFD5yq40Po1QHwdN3RDupugdfWAsNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+V+Uc3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0GrazFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+V+Uc3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0GrazFn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879c1dn3619000
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tJDqJTCqI/57p+zQssr36qnZ
	iecBMtZIMFQgWWk9P4Y=; b=Z+V+Uc3bFR7qMd5Tlzkta/hlJgQtLWAkUx8cYms+
	YAVHcbGGRqAP2C+adpTdT11lJzWKerA2GktZs8APnYAbRvwp17vwsjyMrqvJDwlW
	YYBMljWaKfVqwkc8X8YCCivb+RF2JKmiPS3BxCPd6KyImgtudaWGso6Mbt8Mihoa
	h3ZcJpY8zWQQHmToMAtcJkteuhuxn3kkrEMsUhSz+Xh5lEtC+umvK1YBL5R+U3Nh
	7sNa+u6KwdoG4uyDMdVwORV01WLDGq2sQuNlEf08MtrArngLkx47XEKTNGEwZ0/+
	Y1lSuC7rzgyrvXYqpun7eXNWuPpz9kcM+KsZdtIa9fHhFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygm06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:23:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so189589985a.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788776634; x=1789381434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJDqJTCqI/57p+zQssr36qnZiecBMtZIMFQgWWk9P4Y=;
        b=T0GrazFncpn5VpkHmdaNY+Au5YQmRHnXx5xS7h4XfEPTy9ei3cQxU6iZIRVISlM375
         oerQoKnuvCEbsDRSTb9eqgzRp3DyQEGWeVBjXzeWBNo8pWRbYpwxn04Wo+2tuU2dbR0P
         SwvlZgRvcZjh9bQp+URAxfWAyEryhhkWktHLWuKtx56J2vXOrI/jWwN5upoSs98BcPNO
         Ir80Ins1LZaP2QVwR8fzcUUyoJW4XplUrkl1ajA8156/D1lXQRaPfXpZJiAfNocqSXKW
         zZwJ+tZgc9b6c2utQdxqBdL5fS+iFYwVI8ItRxXQeEO8zaTZO49pP+8m8UCH9fHlzyVF
         B3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776634; x=1789381434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJDqJTCqI/57p+zQssr36qnZiecBMtZIMFQgWWk9P4Y=;
        b=jOlduEpoSH95TBRED8lX071f034DOCP/hwf997nBX0zwVzSHrW98hoMFgQl1pUTSy2
         cWcDHwMwoaQnYT+uUZZqRLGVTFqU9ybmZrwrBX48ndqsOd/FkVny5EH9EkuTh9pYX37d
         Q9Of4+LvXaIByLborZOV7QyOOYythJ641HOSuwwJpXwduIZOg48ug87Oq+H68W2oHnRR
         BbKDV2++wdZzuRZUI1lbaRjQVTqg0XLc4ktbDwKW2Bgj7YuRqQWzTI15gyvOLZbkOZv7
         4D4EA8iv7xowjlvDnKpSRrIlBHeUWCQwcO4FECfV/4iKmhMu6BFXpwneTP7dENssO99R
         BQ+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbHpYEOpXxvYzqEd/2BH3eBO/iziz7ENu5mLfjsvLr3ePOISPp9D2PkkYy2FxATzqR2IBNQvbW1RXt@vger.kernel.org
X-Gm-Message-State: AFuF++lmKtFjihMbtc5EXqXsJaGePVguPo8+tW0IAWWXjFxPDW6fGxMv
	3o9i8Tm/m0LHN8lY0g9xLsCrh3ORDxSEauLKsx3f1UXOxq12QrVRupkI0Fc/8bJHM/l5gFqLhx8
	l3AUR0jDaiFdtR4DyWEjYXCS9hNc7VFXCVwl6sCXjhslTR8YxFncPmBQK2LAQcxDz
X-Gm-Gg: AYBFou3lfVEhSAa15yS/3KpjsOtzs4epZOnp97jofKErT1GIkrbmyQRKNtdyL67TAbf
	fKHa+JKmji6zq2Bcr/Vt9RnfeajU3DIA51BU9TfSKudINl0pBtWqlV/BH7k2SAS2M5GjiVCmYrx
	wXrx/5vLnsvB1+pI7A2RfftsQ09WXjBKRPCzpSB0Dpg4bfOQTK+FGNvbB1eRZDrbm9GTmLBuKVm
	0EDvTay/LoBl/CuSA2s6ljjrVmTKCp8WggSPYgbQZwy5TqdQn8OnORavdNnKnIKwrx8ehgnGwQ5
	fpWQEj5u/X0qww1nDcV9Uw2Gob07UjvqFC4fF/vjm7Uj2nww1tMzK1E3apgj/vsXc7GgEDFXQAQ
	nnzBadnO8Nd6New==
X-Received: by 2002:a05:620a:410f:b0:939:112:d526 with SMTP id af79cd13be357-93980361ca2mr2334915985a.18.1788776633748;
        Mon, 07 Sep 2026 03:23:53 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:939:112:d526 with SMTP id af79cd13be357-93980361ca2mr2334908885a.18.1788776632956;
        Mon, 07 Sep 2026 03:23:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm26488749f8f.8.2026.09.07.03.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:50 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:23:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <ztw6gups4eji3jw33fdcgikrxx6o27glmuwfmzzo6gghzgz6nk@e23oq6d5rb6c>
References: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
 <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FlISzgb59X5I5Q4UXeMeIi8R3HQ314i2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfXyi6qqq2TxOeO
 XXrzP9wyhQL6uB1DSooceP/je48xQExAb5Wizchajc5PhbSgkMQLdc5r/yGqIcr/6R9mDwxyqXj
 51585W0xlV7A+bReQfdEifCKxiVrimHd/vKjvjj26Z/3eaGZp1bES6lfgwC+paX+wU/xVf0BRjz
 f59m6BcAvWvl9+AebW+HBEG0SGjLAf4tiRARWLCTnCbls4t4mYv137qZIxxVcgvBKoEF+ScD5uS
 K1/CJf2BUcJFeV06qNFlanTtctyqbe6IZEZUhPLmVPcqtitaWAFF2S803pqQdKRETnrLdS9ZZ55
 ieU+Q9hwq5LIrvDpnOGOzZoLBu7HZLfvFDdYgf5Ogc7aS9BWEjEFlZwaIzM5xk+KbpA9MEd1acU
 j6MbbhsCIhSJZcb9oqi/yjSwSQe0fD23ssukI7kJQBiQe32lmZkjCSWVh5sEoXvoMuEOGNY9S6f
 gcgWyqg/6OS3mrlojYw==
X-Proofpoint-GUID: FlISzgb59X5I5Q4UXeMeIi8R3HQ314i2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfXzPZKKCCulG0S
 wF974uCdUbY2gbrv1fHf4GtIIoPGTw9F+8cEMdFBhp/+f1lv9dOVkrMo6h0uuUn0YY67PInZX0o
 O8TPVHtuo7lc0Ka9aTmbobC8bCO7dr0=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e90ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IQIXi7P2SUzvV5KgbDYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070113

On 26-07-21 16:36:36, Konrad Dybcio wrote:
> On 7/21/26 11:30 AM, Abel Vesa wrote:
> > Describe the glink-edge for CDSP and the FastRPC subnodes for both ADSP
> > and CDSP.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > FastRPC nodes were not part of the remoteprocs patchsets because they
> > weren't tested in time in order to be sent along.
> > ---
> 
> [...]
> 
> > +				fastrpc {
> > +					compatible = "qcom,fastrpc";
> > +
> > +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> > +
> > +					label = "adsp";
> > +
> > +					qcom,non-secure-domain;
> > +
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					compute-cb@3 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <3>;
> > +
> > +						iommus = <&apps_smmu 0x1003 0x80>,
> > +							 <&apps_smmu 0x1043 0x20>;
> 
> nit: the doc specifies '0x1063 0x20' etc. for the secondary
> streams. They are of course equivalent with the mask

Sorry for the late reply.

Will use 0x1063 instead.

> 
> [...]
> 
> > +					compute-cb@7 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <7>;
> > +
> > +						iommus = <&apps_smmu 0x1007 0x40>,
> > +							 <&apps_smmu 0x1067 0x0>,
> > +							 <&apps_smmu 0x1087 0x0>;
> 
> Why does only this one get the tertiary stream?

I'm told that it is for some different subsystem stream which shares the
same address space. But looking through the SID mapping documentation,
it seems this 3rd one is not available on Eliza. So I think I need to drop it.

> 
> [...]
> 
> > +				fastrpc {
> > +					compatible = "qcom,fastrpc";
> > +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> > +					label = "cdsp";
> > +					qcom,non-secure-domain;
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> 
> also 0x0c00 @0 I believe?

According to internal doc, there is no S1 compute for this one.


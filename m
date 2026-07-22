Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083B43F4C3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708150; cv=none; b=ntf8+Glym3OxHOuCbx2iLW+f/Fa4Nkt92cJ6JvCXurfSfvdJ0wJNjAgsWP0QhvjhwQrxL96k+PYSpB6R9370r7oIILiCqBH9M8HZJQpRqnDjx7SqG2VnTBL3LEu/6Joja559AM2j7oHGQYth/Q0rieFoEIIDpb+KKvYW139itmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708150; c=relaxed/simple;
	bh=YOaSQS7mfs2dsch8T+Nlj7nJ9XrXyIuO+ReKOVLD32k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3lWAUeoknpgXQb0hJApzFQE2O2CAl5gd/J2QrME6NIQWB5/zbfS8JoUyBJut0xXeRK0jDCfGx8O47HEdrJ7jcodOh7KZ6+V9AlU7SdYLsAZvDm6PttaPwV80ggpbTueeK2URx0jNsbMokNz54hAGf2A4Xbrc9fB6MRoXHjsp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxV79/Il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cp3NK9Ku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxV79/Il";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cp3NK9Ku"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M548a93997344
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0j8xuDtg5Kq4q4D4yG7OURjm
	0XBVX36B3+/WX75C1kI=; b=VxV79/Ils3emI2dpmfW2j53x+Z3J+Xn4Woe2RxlG
	vpu9h9NaHTrhGW4yXHzmqPkLXAVi8IdiigLXujEnHXsf14rxdkUoNxHi+hGeo2IM
	xxMr9s9KVDqg536A4RI6QNpoIqwE+R7BBHf1rb5/biSvQQvSQkWj+wIEBMCxetvK
	2MzxjvBJH7mEqqZrIoyeyhIvn0C/BMuhODmD6+Vnif60Xq7u8helIYIw3akXwGug
	36kAF9ACA8E/sOqkXFu267SK+kP2SFBLBHg9ha66mD+xrykUyrzzn8mtogsggohg
	QINBXdLv8QaUhqy5/Nb8g/gsGtIRbQ7XUikgQOH2uQbodA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d30us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:15:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso190907301cf.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708147; x=1785312947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0j8xuDtg5Kq4q4D4yG7OURjm0XBVX36B3+/WX75C1kI=;
        b=cp3NK9KuOvKlfWo6Dxe9SC1Kzod67e4Y432jf+rJhKHepI4JzbsngNQRRaXtNM+Xcl
         oK+layYjcFS0VxS8806PyrD4GuNK9x+4R2cTfujaEU25gFXVcyEZGyrEVqDcEjMPxRyW
         KGSLj13u5JwQFyYSVKdMsNF7zmf+gQpB6fmKJTaLTso37V+LhdtRQsiqULAESdVWnxGU
         UYsVFhgDfZonoC0ihsDfoTlDiwlPcxzXrLADhuSSwpNqMWiEeKTLGrONVPjl9keyZlly
         WxNxpKCCju8yW1EMOmzKDEEivb2JxQp9mVBxYBHO8PHc+TlVjLrzDMVoNKlXY9QRh5a7
         m4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708147; x=1785312947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0j8xuDtg5Kq4q4D4yG7OURjm0XBVX36B3+/WX75C1kI=;
        b=k/XXIhmwCn+k/Wm/e5Ij/HpX+A+MPXALQximB4BYk0oNxqJ4L2kazdH5X7uUdNlrTi
         opbslpFr8vVPpZ9OxKOtBhtzpOQOVn4HhWZkerxEOBuImN7NNUUdPRBXIO2ynNqoQ3LV
         vrJmBB4WrkzQxt4rwyQf4w0MAsuPmzyYjBLCyY6OgjxOXfFFD2nL8KRjdkzeZmvRCYbp
         TdHQ9LozVQxrRdvJTxzXHBYacu6jUdSNmOr0SnnuXEn8X1LjR8M6ZpKsJslXkxQnVRBY
         jogVxpw6syLyd4GsU4P628hHCquhej1rC0vUNMCE9QABz+NxnkwArhXsFt+jxpYDpmVJ
         LvGA==
X-Forwarded-Encrypted: i=1; AHgh+RrheDo9g3mtYAYhWwup2JEBGrCyDbJWJi8QxisxqgQL6OsQh3L5dTmVPS0cc8zztu4GjtKFN5/vJ4jk@vger.kernel.org
X-Gm-Message-State: AOJu0YzLEHF2Ws5Anv1wNfW7Qil4kD99Q/A9u4s8L3wtVByo3L4M2Ro9
	zBg/cyjdDXMg9h7L6LmQUiWI9auXtthDvgMmg89SqTtfsGx96SgR+rpKpKbtvWD0DAyYayYM1n0
	LJxOZ67RqMnxY84TyNIUQOdK8a+SkPpdRV/Ho4lG+isHk79KXLl7nvOl1KbECDa1Z055nU76y
X-Gm-Gg: AR+sD12vZ+jjkTVYcWKGosSAYbptJEf2ul0A4bfyD3JQBdQSZIlgpON6jqBZuq+fgAA
	jYc8DzAf67NsKsSqPrNMGD6qMk4O2L2DcycURNeFmCxUpNaEewxSLKGCyIJDPX0nv9KzQsLLTaF
	3XBlkmLhRUXddEA1o4vFPZJFOHHUAk8lszxtQISzM64vIE/2Sm+cCG94DeSUq4Y/QwrZMWACIU8
	Lo5m3ky3+H4Y0KFza1iKAy762xqjVr/9KqOCg0Q9JkHFHfVM33KGAJ1d+FufS1ImpuwEQ0D1Rf+
	PvW+UwIH+fUJWnKrHozGwTdSg22q9u9FH8dg25P6QQlvHl2lEsHr2ACa8CKcPloqHfYCES+MIEf
	0eSsgKtV3RdyOUk/9HGO2/uEHxjVztik5NMMldA4J6t2920VaawE4pxuon2zOBDJlKKLQLeMoI6
	GUYWeScBIXmVyxWw==
X-Received: by 2002:a05:622a:1b88:b0:51c:7b12:1218 with SMTP id d75a77b69052e-521403549e0mr206507171cf.86.1784708146692;
        Wed, 22 Jul 2026 01:15:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b88:b0:51c:7b12:1218 with SMTP id d75a77b69052e-521403549e0mr206507001cf.86.1784708146170;
        Wed, 22 Jul 2026 01:15:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31657sm343186e87.40.2026.07.22.01.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:15:43 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:15:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on
 Shikra CQS platform
Message-ID: <p4xjcjl3bhgqrdoxys4fnxsdrddokdkgkpwicob7zl6a4qil2t@rdvngehbxnzb>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
 <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
 <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
 <2xpkigm32q6eq7nh4bgsfgswwjquru4pa5oxeciyx3jpywjf2i@qnc3i5sumo2p>
 <e0a0a184-b1b9-41b9-b502-124644500d37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0a0a184-b1b9-41b9-b502-124644500d37@oss.qualcomm.com>
X-Proofpoint-GUID: 1YUbxd5jZJ0gtKwmro3okbiE3xys2K75
X-Proofpoint-ORIG-GUID: 1YUbxd5jZJ0gtKwmro3okbiE3xys2K75
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a607c33 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=JoB8s8tbtwL2jFHueSwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NiBTYWx0ZWRfX5xWI1d9fRGKa
 ytWsRPmwiLt7M18qTINhZspbmDLEcmmDukFzK7MnWO4uDSiDupfiVYjE7/uZui3kHb6Hq4kXRJG
 YriUFT5B+zN5Siexem+41z+wv1NSM/pkYtDK000IWQ3+G6koN0Pgd/peCvTJCsp3FdpJ7+J6ahb
 ub8FsUaQL9xeJbWmypZieEfDGCIGGT2ZpZ6rMV9UAWqS+a+FtwfQSsh3gPHsloCKI8xtLZYUn2Q
 osLTj0cRy4Mf7rohnPdlQTz4C/3fLKs3+Rz9lCLaw6jt1DPKx7vaK/FZF+KcwtU5PG+S/8bCk1o
 AZfIPInHXsR8UKE2mexGQBAeXlfoIna6HP1CJLcly+4j6lH2AZXOmTYV/dFLHUI5garUg0WgshY
 ZKNUIF3tYsLyAE3Odtyde51vyqKzvb6PSvZ3Ko2nK7kShk1tZlELeqN7B9HmGw5XhIHvK+CucZq
 CtiJ4yP7iC3etzpdZ9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NiBTYWx0ZWRfX4IiSTxqJaKC6
 dxevtQ8CdydqAP+QP2mjg9mxiQP9W114NkgN4MI/qE3LCoVWwBFVJ2TOF/E4HkXLNGDcT3mfLbn
 F1qTQKbaOS271OY7MsRye4nArKR5IbM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220076

On Wed, Jul 22, 2026 at 12:33:55PM +0530, Krishna Kurapati wrote:
> 
> 
> On 7/22/2026 11:03 AM, Dmitry Baryshkov wrote:
> > On Wed, Jul 22, 2026 at 07:22:47AM +0530, Krishna Kurapati wrote:
> > > 
> > > 
> > > On 7/22/2026 3:07 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
> > > > > Enable both USB controllers in device mode on Shikra CQS platform.
> > > > > 
> > > > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
> > > > >    1 file changed, 35 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > > > index b3f19a64d7ae..006e24a62f5c 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > > > @@ -38,3 +38,38 @@ &sdhc_1 {
> > > > >    	status = "okay";
> > > > >    };
> > > > > +
> > > > > +&usb_1 {
> > > > > +	dr_mode = "peripheral";
> > > > 
> > > > Why is peripheral-only?
> > > > 
> > > 
> > > On First controller of CQS/CQM platforms, usb-role-swtich is controller by
> > > PM4125 and on second controller of CQS/CQM platforms, and both controllers
> > > of IQS, its controller by Cypress PD controller. I will push out the PM4125
> > > changes in a different patch set since couple of issues are under debug. And
> > > the cypress pd controller changes are still under development. Hence enabled
> > > both controllers in device mode for now.
> > 
> > That needs to be explained in the commit messages.
> > 
> 
> Since putting in commit message that there is a PD controller or the PM4125

There is no PD controller on PM4125

> will take care of OTG would be out of context, in cover letter can i mention
> that the above information, and state that future patches will enable OTG.

Cover letter doesn't get recorded in the Git history. No.

-- 
With best wishes
Dmitry

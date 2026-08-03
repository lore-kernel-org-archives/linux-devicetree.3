Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23129313540
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784922; cv=none; b=LL13b3++u+K2dpgF8eP8yahiM07ExfYsmvEB0sfY6gMugwF5G58TxGnz17t7QEeUU6lzawX0Gox9fHhbZDm+pTEACs6xFeN9Bi9aaEMsGsI6nzwtygjw/WoEc9tSaybT23tsfCJYPcJmWdbB2OzRWZ2K+RZrLapi4IaLSttrJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784922; c=relaxed/simple;
	bh=ka9pZYorikH/+AX9xWMbsMbRslRscRB9YtvwabqJVSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCsYtusAldTwAIJY8YEz7+XGcFfNzOMpbMdKabZ9DmI357dEiGTVaCdr9Rq12gR3+tjGjqS0+EhwSnx2KGUxx1bmB7wonC4I8ZO5dOVkefjy6H7ARsUHJ674tqxU/l8k4iQIN53BdfkNI2iFvbsJAtVyb9he9Qy7AWjgUdks0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLv1Oms+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yec9sL2x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLv1Oms+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yec9sL2x"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H6inu1376774
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TJPpfpFXuY4bIF8inKW++aSW
	F0a6s51cvEaWJL6aVlc=; b=bLv1Oms+Pw4WOd/h5pWc/CGSai2gswyJrG2ldlKo
	FI0QVJRRZIybstIB26rN0rDf3vHf5asjypqnBNSV47AKKLJ+bHY8M5tUV36RDp4D
	E9HSOqwfIv4TI3sWDXbg0dWmlBln4Y6VW5LLAUcknuZcsOcd0By3YnvQUIacQNNn
	uyocmP/uflMH3OpcNQxRb1m3DuLRXSIc1OoiilrLhHVLnjA1l4plC2GNbJVlhK94
	/Xb5LfnyTcR/Nfye9PCusJ8dh8tDZz0NlQZyRML5+JDqnuDzYx22GTwUcSx2UDCE
	sm7r0n1dl471viP8/L/+TFX58QOV/2v4ms4CytS+IDQfsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r0kqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:22:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso41878001cf.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784919; x=1786389719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJPpfpFXuY4bIF8inKW++aSWF0a6s51cvEaWJL6aVlc=;
        b=Yec9sL2xvmWDjuu15jk18iCHaWUpK4McPZ+z1TJqvWTxzFK+f8FIrQAZRqIXFqJ01v
         W3tksJ/WpSQrX0OfQwDCxejvetBEOWyakVtN7q3CMDulWmfg4wvWNom4OfISInJhVgq8
         0Nm+7Ep1HjNnOMHJTUjxk2Akr+tkA+VUe9ORPlxJttaJrAqk1ycuNoE6c00qAJydZOpz
         H3udjlkHYkyPYQK7WwLoFAM0sOdL2LwepV042axaIYeRJ72yQdETYiHOEX189aUbrVyW
         yxucWmTW21gdT/mwzu+ELVlZ5CHuzCv7/VxftkSmMiVG8eYPHecoPL51RU68FWjPDRpL
         6wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784919; x=1786389719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJPpfpFXuY4bIF8inKW++aSWF0a6s51cvEaWJL6aVlc=;
        b=YGpx4VfTzp29nDVm+BVVtpwi9ijACpKlWmEtGX5bLfOTzRqauSPZLvu1y35HQen2B7
         IGBlMu/4eU2+T/nkjojaTOIcvBvUmJGQTnNmRlC8bpu3GydAgMy981bB/0PB0WjAT1rB
         IzTdJ7r0p4JE0XR1dUoZ9fMIZ1RYTxBMIJUbrBKfZDlwWdSPiCJjdsJ1iqbd5GLVVjp7
         N3wpmW8JipQ3VHUtSRZoeyQgAOWwphinLaR5b+r+Fh/gpMFU+3Z2hBC0f0B41TJRpUqc
         jCR1NI45hApKNcIn8NwFIQ3NcYW8SEFrkZMfOl/ZfqGgeE3sW4Vi0xIldRBqaZDZ4hTB
         oOgA==
X-Forwarded-Encrypted: i=1; AHgh+Rqk21QNQup41HXPmaCtMBTvmSNv7b+hMrtUwm0JXGjo4NFcif22vAjNllio/Y8TLEQqVk/eycGeFQQr@vger.kernel.org
X-Gm-Message-State: AOJu0YyMsBpZWhw+z2wUCXG/OCj+0SRdPF37oVL2BavZOjtT+suJdfvB
	Cvx8gfYllz/Jbj3+t57nWrsdenCyenNyMwjPCHuaz9B/jquPf+d7h2TnmsYTzBUMGa+VSjSeyne
	JFbkIc3MiEHS+vBj6pJN47hDlg4oB/QNvTls3WhezcuQ6tIH/y90j44vpMKWBIVr2
X-Gm-Gg: AR+sD12eyyd+4K7dB2mRGrtcrbfdw46Uvr5247JZHtYdAKtLLY+xcMwZ3c9Z/wSSY5M
	ckjUI1GnmhUxn50EhscpV1W5KS9fIT5A4/Ld2ddMHWprdQQ2npXowNvarFHB4OFCNPRrFntDbNn
	nJ7SYInUvo/1MyCQzD+pv8Nm++JjawkTVVlvgDIIarX5883+HR7umRcKcx2zZ46nEk82TKTqFj0
	YFbdVNGP6fJr/5AqE/AQRLAAF3OsL+TEvrWMcWG+gtLO7dnMOQff2MHfLdjb7y2bc9bQdsWF0B6
	MTYeqCe9Gm0ubepxS5jf6K1iQLa7Vd4tjbtUDE1WdQl6CxsWa2RvPpKL40/0MnqwqVj6fHerYgA
	gPfI8XB+vGtKbJrRRGIKATjh/kD+7jlVlMDiIa1JbAaEIn6UTyzPKcNrLaFakLkLVIIZ4pgunZg
	NUawrh23mzft8dDw==
X-Received: by 2002:a05:622a:1f8a:b0:517:8a18:7624 with SMTP id d75a77b69052e-52b5667173emr238620221cf.3.1785784919204;
        Mon, 03 Aug 2026 12:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:517:8a18:7624 with SMTP id d75a77b69052e-52b5667173emr238619761cf.3.1785784918711;
        Mon, 03 Aug 2026 12:21:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e245c435sm2172029e87.82.2026.08.03.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:21:57 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:21:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
Message-ID: <m34hrwskvjfcqxwyahuqeicl366ymqoeqr26vrlti4ovv3u5w3@ccbebp4w63qk>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <20260721-lurking-polar-macaw-b4abba@quoll>
 <520ce780-8935-4f72-bb62-e1db58568a1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520ce780-8935-4f72-bb62-e1db58568a1f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a70ea58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=0HlRHcsJaQFR_tVqW_wA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MSBTYWx0ZWRfX2r8w9xLnmevn
 ffDGJVZncfKnytsX7rN8d0ezbbiS1PebmBd1F5epxzSxYVCGUs/E97oiVp9/plXAMOe4siTIHj0
 4Y+7k8A9JFeJ3FxG0bpjspdmsapwoMA=
X-Proofpoint-GUID: tHFVuhljxmrPSqT1V_W2z08axNuKmgS2
X-Proofpoint-ORIG-GUID: tHFVuhljxmrPSqT1V_W2z08axNuKmgS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MSBTYWx0ZWRfX+XjHLFZoZ3fO
 11gH+es9336PVK9AGdr3xhhLF1Sh1rC6vVs63uGX00CsFskJDyU1tBeyLBTVc/2POVLue37qfxH
 xk3jR8oYm8EZgdLW7XBDiRlsRxmPRaPHV/Bl33df3zZ6GILUz+yzPwwRY4+ap6O2govfp46C+QV
 F22BVwNZWnpZl9lF5AYJblxxpXn3jCo7Q9mAtUsAW4CzvXWiOGyZ4aMtZQdJj7qvU0Tzzv1+4zJ
 2oE5zrAvXC+uqq9MQ2RUDiBQfXoubrE4yDw6nAJSpxHF/YvfYQLYN9KWooubi38psQvF8hgHnu7
 RlfL191RsAhtCJVa5qdR7ZU0Eujlx9aLTUGJanpvjSCEOqIS7kDAopAyB/rlZ6hFG8L5S1neHv+
 MJpSWVzNiuBBqlD5nOhZaHy5JhZnz0SYHlUR01fI7oKpp6j1PKL/2gZxy1VXQ3/4vciR/bshrdp
 /L5aOe0pFTprQVNJC5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030171

On Mon, Aug 03, 2026 at 11:00:40AM +0530, Sneh Mankad wrote:
> On 21-Jul-26 2:36 PM, Krzysztof Kozlowski wrote:
> > On Mon, Jul 13, 2026 at 03:55:41PM +0530, Sneh Mankad wrote:
> >> Remove #power-domain-cells property and add power-domains property for
> >> MPM device.
> > 
> > Why? You just repeated the diff, so not really useful.
> 
> I did not mention since the explanation is present in cover letter and driver
> change, but I agree there should be a brief explanation in this patch too. I
> will add it in v2.

Cover letters don't land in Git history. A lot of developers don't read
them at all.

-- 
With best wishes
Dmitry

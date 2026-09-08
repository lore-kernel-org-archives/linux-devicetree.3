Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD9139CD06
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853165; cv=none; b=hfI8yjBCM+JMam92NsoKmelL97l0QpXR/Yh6KuT49riTUSzYX/AkUMnKtElBCrZPRXy2UvztZfN33V18dH4xD4JBAWQA8296NDuE3UdR073eNNr70sy4jLJ4C8MBC+8TcR0GBU9MJS8Cd6L/qzfy8dlT0e7mhC52sVksmN4XMpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853165; c=relaxed/simple;
	bh=ndiQlkOabMvz2xRfex4FJpIVycP1b2hV2Ntdbd/KTmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIHeJ8PZZmwl6I7xyZ4VtA7gJoUmr/TZQ43mT+3k4wFNAwJbiqPM01QPHqNkE5mD9/2VEmfb7i0/AQW3GCCbDgJRj4bhMf4bV5yot4aFULjDop86AJaPQBPObz1Zc3x1FextP1PhfwlpfCI+EI3JmCYIDERWoJSAvzcHwf+W7Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWkQPERk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZC8unHgk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWkQPERk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZC8unHgk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LswN2502535
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jnh6/unQ/9XWBJ9cydh2x/HD
	zEEBeHRIBD4szcO5/UU=; b=XWkQPERk/SJnvY1Kg6J4/nK3lXG04D+vm2X2Pu51
	nmZFWvjP17uighXN/Kc3CFy2U3G3h+ADg0xwexAID9uv368cqi3CGsBuqLylQBaV
	WDX/iS+owaGTSb5586+8OLJHxPmRHN5JU8LsXM4RvguUuOaZvJyNqz1gXJwgXHWe
	F555Nm21UAp0gpPRBqTbe/ze5h37HIoipbMPSXO4//uf6NVpd66CRmsNLYevgKVf
	mTV19pvzFTi5P9XOrXeDZzRnv73P19X4K7Kz6zsZ4IujA9ycHMdXM7Q1QeMiyOv6
	JxVbZmPU23wDlwM0gOHg/7SiBxzJ/ni9zELIVBDMsykVIA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7gcag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:39:22 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so6312891eaf.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853161; x=1789457961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jnh6/unQ/9XWBJ9cydh2x/HDzEEBeHRIBD4szcO5/UU=;
        b=ZC8unHgko+pySsAR1fyMQq4hCjIiGOLLRoY3wzbL/iFXbT1zPZmL2xcG45rcp+dPJx
         /CaPjSBVqbaXEhoRyiA4/H+y8JUwq4/d/1ZyeUW/c2FHwPDIWYljfLpcNe/F1LJv8cT1
         UJkOK9OeH7n1yBkuDhuenlrbv3YHQQpF1uaG4z//DQhSffJwgAW8zrSKXVYopHqomxHG
         CkaWpY/Z9tQchGjZambqiR3RVG1nGLv1wSw4kXZMMiW2FT3ovn1pbEtmG7vPDVEFhZwY
         qUsZ3K4YgAorelXAzxclP9luQtmbxkuHkWSont5TFhnpybpy+jFaw4F9BWiPiTH5jknI
         tueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853161; x=1789457961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnh6/unQ/9XWBJ9cydh2x/HDzEEBeHRIBD4szcO5/UU=;
        b=UF+jR2lrHh5ceot47jQcTswIjONbROqzKof/9lz+3VyS2te1d9OwgCycBSx6jz9KGU
         jhh4BmI20QxkO6t45O01ujU5TJNgLZnBUChAWokuZnDe7Neh32SYiP1v1+bsHw0RK1jR
         fAofO58teakSUQFN6aPyG+DoqAC9Jyrq0tmPp27c8mS+orHrE94nGQxxO2jXu7vU8nIQ
         qGW2byGRjACbXGrSHvq+xYeg8AQiijjZ3c1Lb2xhkqXk56ZicGo5B13eAMYxB1lkan8E
         QvFMSlEHKzMHzdyv9auwjq53o+/cTpG7rMcLnfqPTGh5wYgzHW5oOdpv4sf29S0xTfHB
         l3Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxXUV8vdfRgNuKv2t++VSXCXvgiV4YaE7I0Meob1N7Q3s5MjZPQ3Le1VLIEOkeS+EY1pFFLjScVAdMU@vger.kernel.org
X-Gm-Message-State: AFuF++mUxosD0FbCSeQv1MZ+PyWpZFsX2Verz2Zd3wfIsgmMyVDf5cKB
	3AvWp2yvJdd4Adm5EE727Ph83ipphV3GyzmPkBC2XfzzJcp7JPGwkfJxrwQPFVmkb/dHdeWeoFi
	ryRwChoxWQeP5aOXSisRF+gmDkqQco5R5oAEMt4jWI+f0eV4CLfbpgXcxnbTTiKTS
X-Gm-Gg: AYBFou3ddRqkZv2AL9oWlDLQepIOWcP4vhh9BXPM777OiIRBP+OP+eMEm7zypiCGl0M
	Wcu4I95u3SuEao2VyODrWNbLg9TGDuDH72gFyItdD7V8rbcoOwwpWoYVBHJFM5xKCmCp175gbt3
	vLdPvfoBx3UtQy4z2/pSW6Hbm+xRlAxl436Tg+4d6Yn485UI1z2S5mL1iE9lSlLvOByik6mqKS5
	DGtfiOQs5rf1fPfBBR1enfciji/myDTCtnuEAGPm8Z/UNNOoFYjToU2gh8aPoxeNN5SRTA/xGKC
	z3kFlxpxVNExiGuqA6glZggkO/0/NalPrPoDfPMjkmaLNkZpL+ttAm6CnFXc3vBLZ46fEdJhtgD
	xbfGL8ynseRK+hQ==
X-Received: by 2002:a05:6820:f034:b0:6b7:46fa:16a0 with SMTP id 006d021491bc7-6b746fa1a27mr14489630eaf.53.1788853161231;
        Tue, 08 Sep 2026 00:39:21 -0700 (PDT)
X-Received: by 2002:a05:6820:f034:b0:6b7:46fa:16a0 with SMTP id 006d021491bc7-6b746fa1a27mr14489613eaf.53.1788853160705;
        Tue, 08 Sep 2026 00:39:20 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm29571562c88.3.2026.09.08.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:39:20 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:09:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap+7oEcW6GONVdEk@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
 <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fbbaa cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fpx1x3OIhUlXpLwz0nAA:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX4TTT0magduDi
 IT+R/X8YrivbHAM4lk4IyzXur4fDQbRVAo386bR4qS0cz9vVJSnFzRqXafRzJUXZNxoP0yiESw/
 INpCUabS0+Z9gRmJNtLDnHnRj9sFGHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX8UYW0eXm8hT6
 2JDLouZWcNGJZt7dWa5eVgccZj2GaCnggphx8qYwpr1SxQeJWx0sMkI7l4PoiZNhuCjnKtarA5l
 zbngbJZN2KFbPzVNzM2VR3nRNAuK7FXnLPHxCtB2KMSusL4O10uEYgqpMT3M4ew2jsw0zMqH8IW
 skKmCqEP894XHR/bTbX24T6JNGoFMgCv0/t6P0ACkLJJgXo8ELIH/EMIqB7wp+OdTVrnfTynvo6
 I50/7W5BX3d4EOCxjZ34as6V2bKJZrw4CltIa5hCPx8nqinJEMBO2ctaa7tjz1zbHcYykyyOngh
 WUwRKLIcYT1mirind2NDOm9KaC/DVelr7lIJnT26i6p+YD8NVgvXi0DkEjdW8c9+yR5QT5iZ9G7
 BSVs6vy66FrkJWm4XQQb0KrTRORA7F5nIsIJR65hBAkVqnlOqTjJTsS1Ph9VU9TRPPklsaMKaJk
 rHEDDBVJCgc9Djl5iWg==
X-Proofpoint-ORIG-GUID: gkanu5pDxB9pYeaXrJfcAdNUBiB1YzN_
X-Proofpoint-GUID: gkanu5pDxB9pYeaXrJfcAdNUBiB1YzN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080078

On Tue, Sep 08, 2026 at 12:53:46PM +0530, Mohd Ayaan Anwar wrote:
> On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> > On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> > > The only reason I added a PRELIMINARY tag was because these DTS changes
> > > should go in after the driver changes and dt-bindings.
> > > 
> > 
> > DTS cannot go after the driver changes. If that is your requirement,
> > then original work is broken and needs to be fixed.
> > 
> 
> I should have worded it better. I am only worried about the dt-bindings
> going in before this DTS. The driver changes just add support for
> whatever we are desribing in this series, they can go in after
> dt-bindings and DTS without any issues.
> 

...would it be preferable to instead have the split like this?

  - This series + dt-bindings (on top of linux-next)
  - Only driver changes from [1] (for net-next)

	Ayaan

[1] https://lore.kernel.org/netdev/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com/


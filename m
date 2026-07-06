Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABD2566D3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348418; cv=none; b=VF1vOxyuNCIqOmOyQJGioSj0NaX0rBc5g2RNOoiBNI6kxS4ocNSRl4g6VShrZ2yRhJoUJcgmhvfuKKDNwAiZm2FUMh/yJCN0dbUQHyDwpiR9IfJHU2GrWZj0v79cgnZXOFqY/WCjtLNCW3q3SGqPs4jbczfUDQqzxHehjYvOA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348418; c=relaxed/simple;
	bh=Zv19/+GZ6cOuxDrtBFdPj15RwKwBFX9aaiyloecDSXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Wlt0LNQ4SJf0vbFRm2i2hzOmCOzwI0Iw3obP5LO966vOPmP5wTxLQS5ruvsarXEuH82+62YqsABXdv8agFTOk+UCTadfDkq7JaTznpnMlMe87OQMzyAkDRTH51Cpp6CedrxZ2SLntMpw1mo4PT5x0im7NI/WJCImA1rRpmPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtyUQ98j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONcllna2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtyUQ98j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONcllna2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE8cI757469
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zyQtYGJ8z5oEr6iVTxJjS8i
	/YH8lsktPhQpqrHWPME=; b=RtyUQ98j9IpUKUc602VLeGGpME6N8e++WX5Sk30Y
	TEjQqCaSAMJefSnvSzoIgbtSqPFcVBD8CPO2aaqBCh5gjeAd4V4hmMZyvlAw6YAy
	NF7vEMfySEWcf1+B6IX/+6lOBT+MqtHH58xIs/dsFYewozMsWij+409wKyDB1lVg
	jIOYhsJVETDIFq9CGTmaS1cgQADykmrRGeWe+fddvQXA9rT4KH3q5FEN3JDjiCvm
	uiAqjPs09RaSesvrjq0frXKlm+xfXLhwDRKOW+h6BxrWUngCVK0mhHTWRg3d0xyg
	ivJF4be0WwZ9Bkor0Fvh3BbKNlxobGsu1zFOgOKfRg9ImA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7hu1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:33:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55721a8cso318522885a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348415; x=1783953215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zyQtYGJ8z5oEr6iVTxJjS8i/YH8lsktPhQpqrHWPME=;
        b=ONcllna2CAD7IZ7g3PnjjqSUqX6zaNScLmhTr43Nx0lLWOPp4lliQlHwcr5vUI/gjB
         d5XlfzPJ1aXMFZRZHZ+UY1kMFvOebbl7ZYGlQPwdMbor+s3a7u2NL4OIjmQSK8nQSUwH
         NZ7QID+rmQGDRwRrBJw1Pem7nJ2Nfpqq+idhovGlibo4R9Em/Fwafemk3z/uxTBm/78c
         +53rdbrkCinNxITpSiru9EU0gtebaCx/k17WNdexT+M/oYJ+xUi7Zighcr1243zbPEUy
         WNoJQ3IdzEHv/4hIYAA1GG4Mo7QAC1p2a3NG+NhzGD64mnizRhzB93sOCPhWdZ+kqXMb
         Ji3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348415; x=1783953215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zyQtYGJ8z5oEr6iVTxJjS8i/YH8lsktPhQpqrHWPME=;
        b=R1qXIi7pmUJEjx9xcizCQerINZR7vT/c4HuJ+vPYp6ayQPoUM2wpJpnOu2ECXWh9Bl
         L0hP2r2crrtDZewRQc4QSnotqsrgNVL6hVbQ2tqI9r38vEtFJjkmdJllGAZG5ZAE+Q4v
         AynE+Ypyzpf1GZu7K4kBNoANiyTUjB0UR8XOXh4Kt0WJZbFd1EDv3SAgwx5S1Lrqk5eB
         3/OKHUAjKE1XkXwv5Z4Vns9Zx99OsTAUZOQRKbyjWyYq+1qCKFS/B9WNjb1jQyQi9y9L
         F1pcSZueq/vKWe9tasWD4Oqd8fsaUE1eXIhfshiE90hjmHT/0kHkctitzeqmHXkMB8jq
         sF4A==
X-Forwarded-Encrypted: i=1; AHgh+RrFxRIM1Rt+EQsyzHk+5beWTTKKGybl+O9xblHYXz75ENHqdFhtZgDQjgnmfaSFWpGaa4urthlVMD0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwJE4raRDncWnELy/fEKJ89MyHVyXDPJ041Lq/ZGsrPlg71wL9W
	JwgLBK++bfPGci37CiyrKbuQJYucYCxjtKBnWgSwuIdw14seqSh39JjFwaanvb+wXXNvOvdpQVz
	aAW0tJZHTHYlN4wipiDSYmTb7QLQzphCbNLGmb/P0mpiDmudC8srMW4pHTb5ag+FY
X-Gm-Gg: AfdE7cnARBqdE7jxh2VmeUozwqufp9mm3T0KvKaibWlcMXpdjbV+ODy6rnlO3I35++7
	17JYGtJJdHeqeimJAj162ovUdlUTeLYmsNZWZhTkHKEqLpqO1lX/usYFJM7mrKOJHWyVFUsKcEA
	McxSoJxokad8+/cCHoOTNOnKGPR53RuTevIcwphrOOWtSc26bVIEJLMwzJmtMjIWePANsHOAzmt
	pitMRUjKPsgJaY1h3cgxAjOl4ZvxvYrFhqCbPgWFDBDbPek3TNpHwFKt1LZi66Q4jwWI6Vqw0cY
	DAyAJ8buu3D+GITLA9aXdVK/RXrBphgPTif7FH4BWV1B7Zr4a30M2Yik9kcGjnrMmzjj6/FvPWI
	NjWppPNS94o/H2fv63rOFDlqyb+weHIkM9y6TNsM0MFo63nYOl0q0p/weeO9jaN6wA9tNkAgLQM
	wDLix/QNcywKRKC+adDb0ZcxcI
X-Received: by 2002:a05:620a:1728:b0:92b:6805:91aa with SMTP id af79cd13be357-92ebb5c875bmr113683785a.66.1783348415414;
        Mon, 06 Jul 2026 07:33:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:92b:6805:91aa with SMTP id af79cd13be357-92ebb5c875bmr113676785a.66.1783348414849;
        Mon, 06 Jul 2026 07:33:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8d0esm2964202e87.84.2026.07.06.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:33:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:33:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
Message-ID: <g5qoveh5kp4m2ororxwpima6c3nlzp4s72oakanlma6vngc257@sli6for2zmo6>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
 <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
 <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0OCBTYWx0ZWRfXzC8e1cGHdle2
 vQ6t0l5e8PgRPkEupXZaYER6Jf9xpiK29OvBh/FZFDx50Fe8G+XmgrFlLYebDOVOj9a3UBqdYFf
 1p5nVLWP3RYZ7paoRnA28Vjdv2/EQnYUPFhNQsSgMfal2ZCxdS+zJh3vZsXTACIjbwVj/w2Mvk0
 OiCpbCiZL4BB6YJgiXpVvxThGKHSCjIIQbTSkxoJfXrGUrSjyswj10q4hwPvEryMYD6qIX6fouT
 z4zcmFOTG+8DcnO3O0lnyxoHK+PnE/qmgHmBNcwTg3CsNXN10vrfRgdVgEfhalBEIiUq3jdpkfx
 lr1VoJvtOpK4Xt6GtPlQg46VcG3Qf898LJoJpNSOCxJ9IzDFCZqSaJ0FqW7ESGMTsZCM+pRyi+i
 p12V/tKpLa/ooYwfvrqT391HiS9cYAo+CM58d5XURB+dgYSDQiJsHr777c7m9pkAJDx+64Sz24A
 RKbxtYFxt39C+qtmv0g==
X-Proofpoint-ORIG-GUID: NbOJ0eejeQLyUoMQqjwL8Z_JPvFocdiO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0OCBTYWx0ZWRfX/m2dTNZ/OFNx
 GY1YUidXQuu1SswiVSawsJMch+cst8wm1InQiueJ998+Kniv+VBPAASwZhlLz/6WzrZeVUmUj1d
 FypKI2yZH4Hte0RO5wXINcQ7fXvn9Q0=
X-Proofpoint-GUID: NbOJ0eejeQLyUoMQqjwL8Z_JPvFocdiO
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bbcc0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=30hatntaN9mTsT5xc2EA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060148

On Mon, Jul 06, 2026 at 03:38:42PM +0200, Konrad Dybcio wrote:
> On 7/4/26 10:55 AM, Erikas Bitovtas wrote:
> >>> +&usb_1_dwc3 {
> >>> +	dr_mode = "peripheral";
> >>> +	maximum-speed = "high-speed";
> >>
> >> Does super-speed not work (if you also remove the qcom,select... above)?
> >>
> >> Konrad
> > 
> > I can make a file transfer over scp, but the speed is inconsistent and
> > slower than with high-speed. Must be because this device does not
> > support USB 3.0 (super-speed).
> 
> I'm asking whether it enumerates as super-speed if you make the changes
> I referred to and use a super-speed cable.
> 
> Some devices wouldn't, because not all manufacturers connect the
> necessary TX/RX lines on the Type-C port.

the GSM arena lists those phones as having USB 2.0 only.

-- 
With best wishes
Dmitry

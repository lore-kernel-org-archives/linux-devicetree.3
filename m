Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06F38887D
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745545; cv=none; b=TZh/7O4CEyFOw0Y5ZmW/veSKxaAqcr2FG+cNnEqqnRIlkXqJ+cg+5ybpgPWvtdnoSh9uaWYragLVpIHp4sWx7twDUbPX78pmHWD0/Usjo/sTYCJ2ixlJztvzI0ss2kK1vRYHive7ISH6q3VIpTgWPahex83VB/rx/M3Sw5+Dmi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745545; c=relaxed/simple;
	bh=HaxKgkGgNYx0k9XNSRNrvt/BbgC1++5qnpO6UiN+C4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EW+EXhXsFsupkVgVu6syXb1plm92L6ttk/vVCs9hQJM0epkS2cjr6AZj9Esp8lp3biVlV6qhKswuAtAzLPmIkOmRympXUqy5HfzmwLplSYKgURfox3S4kYRW6Gs2sgfR2RGXxu/squMOpsMJmQyqWo4o9wYxGxVaKMnAl/fNUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+n9r6bn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emRfwZc6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+n9r6bn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emRfwZc6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHQr31297707
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 11:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nvXT/1SfUOoEE6ujMaH6turp
	9EtLMNdFzLZalWYo4ww=; b=E+n9r6bnlrP10pod15j20uxn8JcrvuRDXcF69D/x
	c1pRhGk+THtylw4ppFLTU0dfX9GedtgbizGitF3NpYThFJUTTd4FdAEugQ35lQuL
	d0a+aCSxw1wt4iK9eqZ6krc9fQjPz1/Q/ipp/ZN0bSR0+ReyC4iijfaJRLEG/3ke
	Dqtlx0OFr+LOialjOJg+7mw3Uz8eT41oTPx0Ov0yQc6XOkxzYf6MQ3Pgemsa/lzN
	BmU9CBsLsXCLQQ14C2Cyr5ZWpvyhB2/+YUjFFOOWLVoAr0hBh8V0BWmBSgu5jEh9
	t2Ci7CkSZwox7Jl0SVXSMY5PNoCPKEGXqztsnudl6Pg8IA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3hca7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 11:32:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c554284973so3398391137.2
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745543; x=1781350343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvXT/1SfUOoEE6ujMaH6turp9EtLMNdFzLZalWYo4ww=;
        b=emRfwZc6T1rZ8c+87XzFAEdecTLVQ0zvn/UvNIkNpjg24MQ/d9N8AYjlmoH8i05a/e
         L3voDdESBJosFH4eIwjBkz4mBh0+rP4yzlkRrfFMZpAt9RPYPHqpfGMcLOre4+DAceXq
         UiKCgV4tSzS2IMSGrzvXRppwe0/awXs9W/pZ+qu8IfuY2pUE+ZXnqfmhR6dK38Z0eJl2
         KSY5gSyad8Y4YIaab7o7ajPN3NIZHOiuT8z4ApmAZunPgi8Vti4WupymoLAv0B4lwXGb
         3LzmbzhILi7OoIOcMcr1o1COdLFvKiEqXo1mFATOGl4gYFQT0BYb+jdBRIhblyjP8Oes
         l1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745543; x=1781350343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvXT/1SfUOoEE6ujMaH6turp9EtLMNdFzLZalWYo4ww=;
        b=Fbgo3IrzrTek5B/gLgKKhmTSMiaA0FsfWDxB0wf2T2PQ/pUnHMGzdW7D1/7Tm7TDBK
         unstPrgCs8vuehQyrlrQZq0AQ17Grxk/291yyjlut5UfBtluFfGAoilB7f3dlbrsB6Eo
         4rgcBLPiHOUpJs7L1UWg0kY+/0gLhaqOXMtWEk9qL4PqD+2N07m7bjTLXChrAA1++fzf
         ZVHY0fht/K7k5ozWIgqjQRjQ+OhJshGqPBzcHWKNKzNOX+ztik/zkK3n23l8Ewo3GWi1
         18MmJ51Mn9l/EOuBU85mXHd/mQFROZ/0Hmf0cJe49+NlWJ8hpElua07tjFOjUxRt782m
         VyFw==
X-Forwarded-Encrypted: i=1; AFNElJ83TJMNOmuZj2eIbL05j3ZlZCwrz6fknpt2vIOAvSy5Ou7uQoR9H2MgthewZic/JwJ1H0EviPdZeu+J@vger.kernel.org
X-Gm-Message-State: AOJu0YxAEWVRcqGWlUUyybS1pL0O01hP5Kp4qTYznHhFKuQUgXQqclue
	a7RuusQhaQ91GcaWlaNtsI+YA6Of6yGygw/31/RcMRAEMvDxdrdHbh5hHQsAe59y3wEXkIQZh/+
	z2eIek/7z0R5dS05wgnJR2cy6xivcj7N/M3iSwuTk+BY/VLehYXBJ/OPFrlwTk73u
X-Gm-Gg: Acq92OFE0Kl8NpNEDv0ZzfFD2USw1MxahmpqllLY5RLvEDsd9GWLGMGozxLbhMc+VIJ
	ApBDzNmtyrnlmgX7xK23+DYKNlqLzw4XzwQyKCyFPRvxgmOK3Eh2RejaliQDnxwyzkS6gividbg
	jQa5a3muU129MMbss3eR9cfrFGmGNQIgNx5b6uDuqEfLSghYLXLH/DNMAMooRFbByKBYLW3udAd
	8MaSE6RCKyY7DM5lBea93AraCbOAiSrUsCeJwyLm3LSidFcWOo1du8YaAI/WsATcmMUv+xGQVZz
	Pappj1WYJCKkgR/POuA88G3MoIAaMYc5viegrW/hDZcTomKhXCW7G+ER+kCC6Dy205UvteQqEtz
	/7yjqQyru7Jrptk8hRqqCKt8f/X/evGR1AwTrwPoOAN3clxNO5My4EZY6yT6R3Qibj2+OcXLxlI
	d9WovKhdFTakoW/iJT13ljWdXA61KGfz60LNWYhJwLFio4xQ==
X-Received: by 2002:a05:6102:304d:b0:638:944a:49a3 with SMTP id ada2fe7eead31-6feff817b15mr4051922137.11.1780745543274;
        Sat, 06 Jun 2026 04:32:23 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:638:944a:49a3 with SMTP id ada2fe7eead31-6feff817b15mr4051910137.11.1780745542847;
        Sat, 06 Jun 2026 04:32:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b985a4esm2372309e87.56.2026.06.06.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:32:20 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:32:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and
 sleep clocks to DISPCC node
Message-ID: <6rrerd5boc3x7kwuwatxk53a5dsirjqzndptskwfiyli22ds5s@dvmondtb2mfu>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfXy2eG0KQC+Upo
 WKIUPDquIlA3YxA94rxUx2HMvfQ9yR2/rNvaKUawH7kjk9suOHJZVuRq45lhFQ6n85JSS75UiGK
 UAmvSN7ufsTQ5mrKytQ+PVHzZhvhPrzYRvIntK2zoTpPqJdd8Ey6GNwcQbMvaW4wDYZLN/HARF9
 dM/o90McSjtynZ+9EsYU0HzhE8SxgM3qgMdwoQCQ7DNDmVRvUB47aoRoAX1AaF/NcYMP8R3ryp3
 23PO5l01yKnS13opDE4VdSF9ZSSAsTK75ncaW5qoCN+6vXeKqEErX4oxARXD0G+U37aJkA1u/c5
 E/B7fI/fEIs9dk4tjMcjZoJzBsg8q+WJM3LeQ6LgZccasemY7y7ktgIDPSKw6BMdRA1PU00GnV8
 8wbf/8Q1PbVO6DZ8ZiKzM2BXlRLMEUc3NjkOa2LWpKFe0C9Tq5J9e/uVaxChKhzs8jGACv5jQTB
 6JUkgewW/Elu333KC+g==
X-Proofpoint-ORIG-GUID: L1VGf8rxMth2NACn4VXPhfzAQb0Oyqzz
X-Proofpoint-GUID: L1VGf8rxMth2NACn4VXPhfzAQb0Oyqzz
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a240547 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MnNUYsW2gAO4r4gG23sA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060114

On Thu, Jun 04, 2026 at 10:56:18AM +0530, Imran Shaik wrote:
> Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

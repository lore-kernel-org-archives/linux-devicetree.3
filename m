Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9F1EA7DB
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784423504; cv=none; b=CA2itIxwwJ5bzpNvHbGovVJAefAnUe1b3mkC2qe5pZjYslshwQlXpWzeawblppiedu25vwpI4HkFwUguAILdJYCcy7PdkybiqS3M52MorlOzjn30jSsQtfR+JGsdbErvu2NWa7qL2UC5Hjx1o7W/Tp8yATXEeQrE9/KULef7rU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784423504; c=relaxed/simple;
	bh=0TfEzFFGXqmt4Xl+O4yLjBvtmcrtUB9VahO854SBzmE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qf0HX8Ozj5PN+8vKyz2spH0N+gXcdLxgXV9g2Re8dE/6VaefHjGtDgy7cGgpUp6FWAnFOv6b/fNYOmnJrpjxfQLWNekDvkF08CbcTSP7337T2nkw6jsGgzZLZ8ib+iiCm6QCvx+m5AYcl4BxdDA2eez/0jWi9+sJIfxvNgetruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaIRoWwY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEzr40hY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaIRoWwY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEzr40hY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN2lSg3060006
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ju/k8V62Ud0g8qqzByRylNWN6L6LzWDAf/Nkbc0IKfk=; b=iaIRoWwYMOrpfvEC
	lWzZ3GuoH2ux5OVyTdwd2N/627pEf8oUOpsh6R0pBvbcswoI69JWakE+zibxTT9A
	9vWD3z0ELAn0/ZmoAxspqHSsgkCkWfKX2ahjfDa5bmJClynPHMjhXKhV0NAGo5qo
	kN9F9mck2FAWnqrtI3qJ/wYc/Dah4U8nXCnpjjOlGAAIl1VPFwCVV8ykjsViFWSU
	71gVRuPnKPRUCWvUSUFDdKT0sXJOB9NUNB1Nqd2usnSdPSt4qb+a/pxG3cN/7jLa
	iiAzckuIsteVlXVwOGsUXNmt8MPxklANDT0Nx8A7/JXVPcG3sAxyizyThH06uMDs
	XKkzAQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aasusm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:11:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so4152781b3a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 18:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784423502; x=1785028302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ju/k8V62Ud0g8qqzByRylNWN6L6LzWDAf/Nkbc0IKfk=;
        b=JEzr40hYCcswKTq+SnlOWKAVOZFQ1zmAh64OEsEOwNCQmXFmWeaB57aHrKmghgA+15
         wJs/6vA+d8w+97iEb7wfa8nrhMN8VI9BFrDNSaFYN/muCndf/VtEH1iNie15w4nLC3dH
         q1gOaU24aWOKIeJ1+kVO2EuZ13YUGK9z0w2TCLNniw1yzP4XAWFicUEKjNUmeLltq0K7
         TDKSuS+GamLb+gQ4RfqijCX4bEejsqzbacZsrzv4BV8DuIr3Wqb6TgXUI3uRLJco87ux
         lwznqrAiFrqiwQI3pDbnFAzVZQ2r/JgosKXPRyebLkJUEetyo3P+qiF917GZHxiESdGf
         yoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784423502; x=1785028302;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ju/k8V62Ud0g8qqzByRylNWN6L6LzWDAf/Nkbc0IKfk=;
        b=gdOMX3ABExIxAs0Ro7HW57cJUXU9A+ofAXyemb6F4uabGr/XcXMCicGcfmesR8fqnZ
         FgB/lsZtZqUN1IOIjF0gPA3eN3J1UFNPrFrGsvpgZPBBYR2VJtQM6pwlL+6lIFHQ0S99
         7zjV6mG4X+AaQ4hd53Ml5a1Ev54H3jhELglOzyxobWD5i6JnJCGd2gG8Bq6IbJamNP8X
         HQVPnCsUy1kBaS4r4Z20eCDYqpm98WLV3BRxVX8M8tu03Z4xeUXOKunFRFtbb/5Z0wiL
         MbTdc5quG1Wwg0nbXFsrTFkf0YP1GVHwR9rZMjsn/4gKuc3E9fRAMSYVJlc4+Td5PjDT
         zpGw==
X-Forwarded-Encrypted: i=1; AHgh+RpImVvVGQTajNOJQBENoqMlOAuIApE8KpGwDHK4oPx6qyfQ6/B7cyUQuOYsbq/aKXuWSBv0oR5w6aKF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgfy7mDrJyxw9039a+re9YUztVdW4YvV/2aKrCGqgAlWVMJ0dc
	uw12JPTwPylWDeRcruVenu6vMT2TO5j2Q42dMCbC/Nw99x/khpiJAOSVOSg4qFgb2T1PhGXvZyL
	TAJaQWOxZrIqTq2Cu37V18cXMA64RMLXpmXbfqhOm4bFrEiyDqbnEmLxJm8gGI2gY
X-Gm-Gg: AfdE7ckFtOqC8WoBcjy5t3PCWKFNFKUYjhJRCNbCy89vnH8PISEWN76Xz1jyx00xFTb
	53YaKJc+HFK0MpqPBY5U7DJmGytqMep/oJcCfV/+BG0aQKDqd8BFa0Nw0DYOuZI5B5HJOeuPVPz
	GDBymEuuIP/JpcWegEDS0tJj2ESNvq9mOG9RlWYsplPhCu6RmUwNVjtOpCB5BTNO+wZgR92Sncp
	4Z6+KFeXBqKrnnCpAmvtm+5MvR0lF1dm3IHO5S9SjRU49A2Y1ZwYkpAPNGmVE1OpdchBxHzCCK9
	C6/ULCa1F74uzX3Fr3+qAR23lyLkTgTxh2+fACVca+0/hc9fzj6bCBbUIX8ogQUiIK/0+/4IYc8
	C3tHUEcc1NIPsi3km
X-Received: by 2002:a05:6a00:428d:b0:845:e011:5b83 with SMTP id d2e1a72fcca58-84c29069af3mr8992863b3a.0.1784423502057;
        Sat, 18 Jul 2026 18:11:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:428d:b0:845:e011:5b83 with SMTP id d2e1a72fcca58-84c29069af3mr8992841b3a.0.1784423501638;
        Sat, 18 Jul 2026 18:11:41 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm3588167b3a.18.2026.07.18.18.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 18:11:41 -0700 (PDT)
Date: Sun, 19 Jul 2026 02:11:37 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Esben Haabendal <esben@geanix.com>,
        "Lars-Peter Clausen"
 <lars@metafoo.de>,
        "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Martin
 Kepplinger" <martink@posteo.de>,
        "Sean Nyekjaer" <sean@geanix.com>,
        "David
 Lechner" <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>,
        "Andy Shevchenko" <andy@kernel.org>,
        "Martin
 Kepplinger" <martin.kepplinger@theobroma-systems.com>,
        <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] iio: accel: mma8452: Allow open drain interrupt pin
 configuration
Message-ID: <20260719021137.6acb5dee@jic23-huawei>
In-Reply-To: <20260715150148.000045ad@gmail.com>
References: <20260715-mma8452-open-drain-v1-0-b1dd2a440c60@geanix.com>
	<20260715-mma8452-open-drain-v1-2-b1dd2a440c60@geanix.com>
	<PLKuTyVcES-o-CEsU7WA3Ir7-phI9WLM9PJ5UErJeahWgus8heVF4GPky0SC-EpaHLv54lZya37ivhub3W9kNQ==@protonmail.internalid>
	<20260715104542.0000433d@gmail.com>
	<87pl0oo5iq.fsf@geanix.com>
	<0RfJ6kNIpjdTDIh2uWC-FK3HRObOpQWqSWRm6hTgOFq6_wdHDyRfpatKMsvApvfFc0r-ye6piEWG888mBhp3yw==@protonmail.internalid>
	<20260715134053.000012d4@gmail.com>
	<87bjc8o32z.fsf@geanix.com>
	<20260715150148.000045ad@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gtl421edvh30GYo1ZdX8BLaM5qwMEGa5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxMCBTYWx0ZWRfXwX+VwHWytWrK
 TjUNq8fqRCk7115rA9vmP0osXx1eAua7Kf1zlAHZP0XDUVQtSZNTgOZWELWnvptqapnjd47XRFT
 8Hr53d6JlYwMpis2GulujNQ0hmiJZrU=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5c244e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=ilKATfAMAAAA:8 a=DeELNmMnKrt2i4icEn0A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=73awMTU50e6eLoBjGbzZ:22
X-Proofpoint-ORIG-GUID: Gtl421edvh30GYo1ZdX8BLaM5qwMEGa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxMCBTYWx0ZWRfX0FQGDLXsBD5n
 iLmsriG+EKAEMCaghLu+emxejU4Z4STNOX7P8u/TBO3TXSiQ02SU0S3odj5r8ltaxLVLlefh2UN
 S0UMzka3fWm32kzFTXZnFGHYANyE3oZ8aCJiFK+g4pgP/nRjwgC1uh01xr3mZMOBjp0C5+Y6VqD
 30t/bQE3Ic4+uty4++Dqy/UpdCCqwC09Cwzn0pDCvcIREl3gSytUzY9DhYTNy8eL9ywzZte1z6O
 WFujhfv0wkd/f8RQeTaWSuKoVG+Rj6G+rueSCnR9y4GBjlWXI6WqnhSNGXq4Gxtbtt/GHEYSX2o
 T2HIVI7AOGpTutlGvNu3ogNokax2owWGAH1IMU9hQqriELRBK4Z33gW4wPneRYGL/xhdnZWwx9J
 vDGb+Y5tmXxX2Rjpef4bsmX3DIDlkY1SPaOT1C7ZfpuJxt6CUKjcUgC40PshknnV4AgrnI3q30I
 dGrL8sycK6Rhx/yP0UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190010

On Wed, 15 Jul 2026 15:01:48 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Wed, 15 Jul 2026 14:21:56 +0200
> Esben Haabendal <esben@geanix.com> wrote:
> 
> > > I'm not sure if this was intentional or not in the original implementation.    
> > 
> > Ah okay. I assumed it was intentional, hinting at the hierarchy of the
> > defines.
> > Should I flatten that, or is it okay to leave it as it is?
> > For what it is worth, I like the current format :)  
> 
> Up to you of course, nobody can force you to do anything :P
> 

FWIW I often ask for this style as it makes it visually much
easier to see what each set are. 
No extra spaces == register addresses
2 extra spaces == fields in registers.
4 extra spaces == values for those fields.

Naming does this to some degree but doesn't span multiple registers
or fields in the same way that a bit of indenting does.

Jonathan

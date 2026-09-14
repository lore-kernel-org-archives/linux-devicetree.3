Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102653F4DF3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371521; cv=none; b=H4KOR98IAPB8h4LJ9CkoAwundRMzLFDs7PcuKf5/tzvN5ELKqEjJvWARTL+srKz6PgvsoxEoa1qAQX5N7X7UjjRPbDLFH4bjetH6pAefMGDP4POXmnjp3gOEehi0BqA3VWUnZgv1SOTyVqZPMUITmP25LkS/94xwFPtDpGaRLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371521; c=relaxed/simple;
	bh=9lhWc9Q0YUdhC/rcymm8R0voA5GEGve0e7eHh6Z1qqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+9u0TafYyrpSFxMvOv5bYcvkQfufD8qNhk7CroNMgIYzJESKGWPsSyYDkzDWYsQHf5yKqUEm/fR0ByzAgElljFep1jg0ugxqxKezmo0mhh+yOmxOa/tBKzZ+mGTM9zEoP8kVfpHB1uvuKUjB2Y/an9Th1H4gjBJnAXVh4Vjt+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVALo1y3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfavzusE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVALo1y3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfavzusE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwXj543122
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0tTsNx29CoG6/4vw/G06mPMr
	5YxJX+XX7lhbZ+hijuw=; b=eVALo1y3fejK7+uPWF2QkjP1WZhAe73qN0dyxw7m
	CCGaKZtRZXayaF6abO6B1pOSMvgpMmeUnwJR4Mpz7Cyqn0pXcnED0fKzBBmpvDOC
	0Jcs4dDMVyZh1PtToH5C2ZNuO2KI0gEDbqB1smE2/OVrdqX+gNGuIF8q6jYIl11u
	agO0xk2K7Yky+hVxd9eNUhjNGatF89qOIS7HOC0sYH/HjIEN6cQwjZEMdITOnEvq
	xX7i9Lcx6J3x1ExtqzfRriAI5oCrLJDif/HHaGnFoEVlArRTMH2iq0fn3aVXm4Ny
	qkPi9F4GhTvmd6We/ack3mYQXH/+PluKaTLgqt6BXH81sg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09cxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f1847fb9so325098685a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371518; x=1789976318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tTsNx29CoG6/4vw/G06mPMr5YxJX+XX7lhbZ+hijuw=;
        b=BfavzusEL72duVok3pZPPptkfaew/efItXU0BcZuh1RPJEutHuaPwct1FJWmnsETnm
         CvIsD8ZbafP8OXIKXsZnNBZfILNe5MDsCpCHoeav9TmvxowKLMcbB7v3LoOA7Be9YZ4l
         AXzg2emOGxqmPykTAELtp8Al2YqUYgHSNSTAkrdnpJfvnzdUuxt4bSdeVtC3gYO4audP
         K6rPlXGmlucqfThaJAT1iPzsOt8NC9HYWyyuPl1W1gQypzRPgONry78ec2TCCb3+OPCD
         fuzxKuTme4gB+8igfrS2AHDXfVj2tQGYOkEtEcSW0MUeqvi6D8dUlWEfo6unqul1Vge7
         Fvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371518; x=1789976318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tTsNx29CoG6/4vw/G06mPMr5YxJX+XX7lhbZ+hijuw=;
        b=Z+RzJsEhvuZ/hgvsRD4n5HyYLviKx9d0NehPczvGZ1tdhi18Ro8TJuqdKRaU78KzpW
         xmN8CZ/6cDPP+ks3gfECEG+DP8QLfydZbjdKFXEablJT2QyDEXTQeKt98LZbAf/9s5qh
         lZmIkn2Rb/Fj1NsNtdnqLa3DRTwVLc5klejNYW9uTIZjyYQbuJLRuWx9EkqlUoCUiU5Q
         MgJJVJOl9RJR75X3PSUy9FuY2QrnQKLlBpSh7l9b41CFQFznKDl2XyTvk6Fh8S5xr0n8
         8bEEnE+/Ejg4lWZlwuunigxPkZdxl6DdNh+y++H7kt20Ihw8i9aBr34cevuk9+dQkVhr
         jyFg==
X-Forwarded-Encrypted: i=1; AKwUvBw4JCqwmA7g7xbhexxdLdY3j1/ORa871VLXnwdQ28v8dgtkuJwnnYnJ/YUnl8p+mIXyBMunaCBlhJFz@vger.kernel.org
X-Gm-Message-State: AFuF++m4YUYm4HjtupkQXZTDXXAW1wyBFbRcOlRziJZXrJwt1iTLNX1C
	v3gVSm80lshxS7HP8vtFXdnRBe4f6MzsLEfpYVs2u+eO10DRzxOHPIF5rUOE2etntwyAELDdnZ5
	cY9QZT3jtLdjFuOqSxQcOybs9Y9wy2LDGjMWJmKD7leyWxyGZ145PAfTf66G3c6QP
X-Gm-Gg: AYBFou0GRKgBopGZv9KpQRBgC9/2IzIgAGhnCdc9eQ8Qi8KvoOz/MWsLrnTBipf776h
	V9T6H2JCNz/sd4dlaYbBxoNy5K7rlnd49e0FDH90btp0TJmwgyTB8u36awpHPrAnXusfw6c6Iv/
	70VgCOA/SeXxgamTIhbE7blPAMpoovOu7Y8FRN5eoScs0RS6YB69thRFTT4LZzB1jgsai4yPWSk
	rCXt/x0LXh+t1SyLArd0jtKDhruCBLcC854hEaJayWsbVBpxlk0pVah5YPYBOChkyIrWVdxLYhQ
	TajhzcMCoyqfoXordjECHYkc1ZgXBhbaiB94EdY80wp9avF6xLDcbgftGW1caJnFn2w/tNOWj7e
	I9Vrpc9mispOo7Q==
X-Received: by 2002:a05:620a:1983:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93a29947dc7mr176250985a.27.1789371518285;
        Mon, 14 Sep 2026 00:38:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93a29947dc7mr176222385a.27.1789371513008;
        Mon, 14 Sep 2026 00:38:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm440823315e9.3.2026.09.14.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:32 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 11/31] arm64: dts: qcom: sm6375: Add domain idle state
 names
Message-ID: <yh7ote3ijg5vlvdd5v4twoa3yumuwc72mlckjimjqdjohaikjt@2il3lgvyhhst>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-11-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-11-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXzYoqj+Xp/KYl
 7ioQ/8aRQHgE/T31zpvdZeQ0wnLn3xddwcXrZR6kj+hfD8lVzQ4E/x73xgKlj1/u/RP3ENA7+AB
 07LJKnwv3AWPZajldxzu2NoJunSMPfA=
X-Proofpoint-GUID: gfcX1puDR97guyfunfHLKNgmUkvYDGtD
X-Proofpoint-ORIG-GUID: gfcX1puDR97guyfunfHLKNgmUkvYDGtD
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7a47f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXyuSoj/qMpwux
 C72S61I0MpjkeMruBzv5e6S8H+3mWDPt3ibZvksWA4DuqvSz3oOQ7NGyWhzCHsZgQaeLXRfFZXM
 X3osY8nClt+LpgALKmlAW1W/qL8E0O96WAI9E6OT0H6Rb78+rmiEPyN4bVCBLZlLkgY5WAsVJD9
 yMs2nnjIejJDBYWwkECoWnMx/PBM+aMO3z5DUFLbMVfOXt+a4c6iP6F+akKSjQRwM3P4vDkgt80
 3lr0BxdjfcFBPsTiOkmO/JZUKBFVEHITtzXxcV6uvgvkVoHiA9pM2ns9x+DjoyWqlK6maK7HhiH
 BE7JPItd8gduXZYHSFI+2NWQXH5ersX/ogAj53QPWFV1kgBe+1WXEzMZFHrADylh5qyGU/KmLjJ
 cxS9YEUGw5sADH+GpcKwnkhCwNS3F17bijiK9QeNnTNPLuJrttFItZgfu2n/WfXFEZXcNCm0cvr
 SAQ1zaNGZsKD3LPeoEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:43, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AB3F482F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371695; cv=none; b=icxT/rYHHFGb6c6VQcnihZEB3dT1zJpJ9EPezSnSACGqWRxPVu2TVVG8yxNGTj4NMGKoaagNPMMDWD+xiD1umbYE++xbCPkcmLbTf3SuYpJSy2qK6nxAx4EM20Tvupz5FBBjzaVt1iqq/FFQa2uLMMZchTWtd/rC27Ji48i4Kxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371695; c=relaxed/simple;
	bh=M0xL8A1MLG14YYpIHMTe9AZyHw3LRq7oQAFVYejE5Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHv9UCMw5f+80OYccUUIiupSCDlFH8i4wwaQx3/mfrNUYs3plfhoWP2GzvbqcC6mdoZmXDmeCIzyq48MJRZYdPJV4N4OCGYt91l6Urtd7pM71qOP5c9rZCNUBYNr4GP0ar9J8r1Twn2ucKBuTlO4R5XqW5eTXKVjC6Dh1UZvgh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9lLhaIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z74p+Oqv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9lLhaIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z74p+Oqv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jPZp3842778
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UOzHFgngzR2fvDrsDDS/Q47T
	gX3el0oe162wnyjcEuE=; b=T9lLhaIADCRRJeOMV7cbh+wUYOJB5ABiTEUyL6+5
	N5yKi9f9Gxqxd2Q+dC3VypeiCFpVhyWDVlYcKlMFHkc4w17czdnaiQX6iP/kWRJC
	bIKnZzvYu5EV209Pf4FhWC17FOHOpMy3wNEDFLIlrjMIKeHuziyR4k0VonE26Em7
	q+cj6Lwo8Jdb0iE189bAKb9eXUpIiorKNp8Zd5abTNUgPPXLdX8+CajYl+0H1AAX
	oce/DYPxMb4xKnarG8gES5LiGYAqRANAi/fZxq3M0sTu55JjMqBnI4jpDW92RreO
	Fc0LK9JYEaMJjx9kd1C8c9iTgE+y3yhidj+cXwcv7kMQPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5k19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939665a1ae6so784549685a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371692; x=1789976492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UOzHFgngzR2fvDrsDDS/Q47TgX3el0oe162wnyjcEuE=;
        b=Z74p+Oqv6k8QioPPde0I9cJOm1iuVHRonb/OLR+GsOhaKcU+yEI7+fqkYFbtogkfJz
         JP7YxPAu2vad6vJUvl5pmbvsED4y7hYfD/CM/1ZtqJdRcqCTPdxnJAy3jkpbL91jq2MF
         JwC9Cye7EWAydTHxpUJmrleXP65l0znKctMZr0wHxLf8sezh8B4jgD5U10LFWPiEQhOy
         OhSixllMEfUtHfh7ziv+d4Len2W5uKY9kcBpSC+1fRuHrx/DAuQ2GSKE9iFDI1/3WO2z
         cIdBDCTfle3B5PzU/wzPy+dATJHZFiZRteM+jvN6bmKI0AyOCTAAv1GpNtS+lf+h+KDd
         zJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371692; x=1789976492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOzHFgngzR2fvDrsDDS/Q47TgX3el0oe162wnyjcEuE=;
        b=fh/NCxPYgWY++UwBm0+w2wsqZ25eJO4rxjGN0QbKXGoSuqnhB3dpsspRuHsfazw6ou
         203RduREAkBPxTr29sonRP3i+wlbsASXGNUbS5ufQwqd2pE45JNeabr/14MoymNZEyQV
         Yrhp8I2NonXJW3Y1udfPhQhwmfN6jS6RoWDDWnCUva9OE8FvRIoMKE4oxPlOpxNSXy38
         FuUwo4cxrheUAy1CmOuvoLZPeulO4GHY8y6n43zycGdehgIc9XGSzXj+gAfQm/EG8rOO
         DD6Y2d6wmu7T6fLg+w4IW754ayUlW/SgTKk2CWt6vMN62ockuX4OxnsgDsk102Oj4vtZ
         8izw==
X-Forwarded-Encrypted: i=1; AKwUvBxEg7Y6+PRLNCwqnLlbY6OHrosDi0mW4vIVoQzLG34H061ELZ7KKTlr07TwpoPQsTfthDAzKO2/0gdI@vger.kernel.org
X-Gm-Message-State: AFuF++lUMn9UDX7aX+NWg1Rk2KYKNYaSYUni95lYGElLcqsf/DciJaGH
	atvas98LKWKeCWL3qxn2gf8Fl0Ul+8q5oJKybF89zy2x28OTChYkzgzVCq1hpLkpkgvcvtro5ee
	JW+NUxo9nr8xSmiF74dxSz6vUIBW9hA2gUtXNghq0fzYAsOLRnFk9oLkrwSSvJLsq
X-Gm-Gg: AYBFou32Mqz3feSDxkthaQcIikDRPSHG8hf2/U+6yOyPSYCQZIKfDG0aV4aFg7CFoZi
	FACqGWaCzTVsTWHDw4dnxGPlFAySe6l0g7G7vD9QBgU2r+SI3k12t6z/GS0i4YvNzclhWRH3cGY
	qMNEEryKEdBDfngULr4MfWjSTT6GJoEcOOu3mEELaiydbqdn9myvsxtgMLuvU0HVl8VWw/BYhhL
	YEXUFE1lh/YC17nUBVssI4l0UyPED8cFoH2OJB+hZTqLMNyyY0vEfkUM7gjjgRcfwIENNDVwXTn
	/+1nHrvIy1CnnHG3QPpt2WuJU1h4v+UIi3vXLPCKRUNT0qPKB080t+5CdbPgiK8pSVUKpv/GeTJ
	QRXvTElpDz4nVkA==
X-Received: by 2002:a05:620a:6f01:b0:937:65d:d89e with SMTP id af79cd13be357-93a297e8fefmr202464385a.3.1789371691832;
        Mon, 14 Sep 2026 00:41:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:937:65d:d89e with SMTP id af79cd13be357-93a297e8fefmr202423585a.3.1789371686637;
        Mon, 14 Sep 2026 00:41:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm26403471f8f.37.2026.09.14.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:25 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:24 +0300
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
Subject: Re: [PATCH 21/31] arm64: dts: qcom: lemans: Add domain idle state
 names
Message-ID: <gpfab6uc7gp2nxp73d26zd5iuewtxwoahmjv5dny7xrw2erblj@dpwmpdepgcyp>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aFR0acXcezxDAEV3WH0kZ18xE6d5hFAg
X-Proofpoint-GUID: aFR0acXcezxDAEV3WH0kZ18xE6d5hFAg
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a52c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VzlDMD57B-Cyvd2ajsMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX9aJFPFBcAWcX
 gnBxvqQYb+kW3vzHwaSeLZGnWaysnRTmhg40/HWRl+yQp2ypxtdRuzl9jMNScAmUk3homOK3rjl
 JRgfQAGsfnCCEPTosWRtjRijjUzw/0X3xbCDaFGJxY9m1rgjakqMrjMFbohVIF5UoYUz01R3WTw
 AAD102hi3Zjwy+909Ho9XCOqgioTScdFJb8VQWAydgneh9NDFeRRiaeFcVE9PIvlpVNI88548xh
 J2HBgbPOS+mFfi6IW28h+CVfGXqRXVY7W5Wf+G6oGUmYDJXlBMo5X8Qz4y19nYL6sEFXEoaiZce
 LvwlyR5rAlacM6euvL0yGYbe49rn+V2UPIyBryCWtj5kzJl5llgU6uMw4xKTW7IsRnwg3oMEmfc
 Uxf7IztfZb5NJqPgULau+v7AGT9jcS0jEC8bOdKfNkp7fvFYVKZKCnTN12AE8RRM/ctIXLg+mnS
 t3sE8oxgEPMD7dRrajQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX2Ph20KaBT3H/
 np5e73mdJv+9d7ZKoRy9+7orXh4gNOUpf3OYKyUfcF//ujHXPzbh84fokHc1o1GQlzazPkmrZZF
 a3TKQLOAFKAsUlUFPv58Zu9/5PZ2n6M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:53, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle states so low power
> modes are described consistently and their names are printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Use a big CPU idle state label for the shared CPU idle state, since all
> eight CPUs use it.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

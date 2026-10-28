Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185723;
	b=h05qenp478XdnXy8fAHBAsoCCWN22B0POw/ePZPwRIBzZJ6CK0G182AbuGx3GwEtqjuL
	 6LTnT34Xwfo849i0W116Hzlj+tJfwpqUG4LNqTvlwuFNLw/ZeHStv+gkHQNojVyMp26NF
	 m1lQcmzTRcGJLNs6Rx1sKQrme1eXLX2S4/VFikZ6oMDlv5kx80N3o7hzNOj0nTHIYVmwT
	 cWjL7JdueUz7G6i2qAULyI+V1xjvJcIrWZQsrTQ4N3ijiGzLc30H99/0nDpyh2a87J2qw
	 Yxtk/RgllNMwQXjuHLcJFs3hMcRq1HEuxXr1G5cQqP2iFpT0Rj2qV8pcJmG6SwJ5qqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
	b=qQYh5WTkEJQk1Z2pnu889UHmX6EqGtq288cHoe6+3a0PkRl4pCs/SXag1gTy5xKWed5b
	 X8AJjK1fD5213W/cuD/Me/m+sFvCCO3eCjQKWhIkPM2wcGcJMI2Ngbq6hfAuhb0QbIsZw
	 zwxiZPlXFK8Yl+a2kjCBvTM/6tyB8RJKfRBgBB2fLn2P0O0jhix/QAfHwCpcYLz5yqaPS
	 hOFC1ArwZYgspLsaZHOXO2YGvhQlOYSmdWKwmcJQ2vwcoaDaaxxjO9FLwi09aTFX0rlpW
	 8OGHJdcG74wClat4/NBNc8o39lJPSueI/oRzuL/gQEuqiCuN+sSiDp5BEw38fUOwwKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VTI+T6L4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y91F471c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4120606A323
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4120606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VTI+T6L4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y91F471c
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SAZrY8872063
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=; b=VTI+T6L4Z9CiZiQF
	rw+rxOjjh/WXgmJqhzDU0iNumlGEaKCjHx8hm/nyMgBV/SbIPdc3rfDPZvzwZYrg
	LBGKwxV/EvH6oCffX5UeZxrjy/XkE15aNiaERvUelJSKGfxz8/0Yw5rajqh22Uu9
	YIltgvVvJe8k0mh3NuxOJ0RrsSFh08oJEc3YvsX7UOZ+hobzEKSaERniKcDOncyX
	mEfBafKgGtDqkxrFVFze/76pP6sJxzWOhVwLXUSMMTJORi/TlvUHIM/OhZPOdmbw
	YKEXQhGcdNWWCiKhHbWD7hroVXp7UXicw3mKUiTXsMpAQBItoNRQ2sPbDLH+47Yh
	F11rPQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg3tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:08:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so763969b3a.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185720; x=1793790520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
        b=Y91F471chSpQyRh02stbXtNnTIIhcmmVxr9bTrkiRJnOC+pXB70u/+Fj90KAuSUpxF
         RYnu+QDH73QB8Gyz0YLd/KfCcRohxgi+6KqBkjft/QAbQZ7X6r0Rq1ZvAAvAMIhJU6Rf
         iOGuECNhd9LrZhyKogzAVkmmk5r0T4tf35Z1GnxzXYBN9dsIe1tFP3BbMYKcdm8gfpR7
         BuNKGeZ3t3PTFwm+V5ZjaV2zvhFkPoHy7b7arNdV1OsZqW/rqsQQwgF1/R1QDcIlt3o+
         EX0+VJ7OtLCFSsGTwV8xumwjhogxVubBQorDS2ajJZGUCgdP2AquHlee2yUJP5LRoEqS
         AAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185720; x=1793790520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
        b=mvkJrzSMZOr0b63ZjUsx+t7k/SrecxslYLts9dAxxiM3OyfYVpWYKicYakYU2I5M0l
         TjZmxSsTVjHwoE+MJD/PtO3sd3nzqlCcahtqyEF7fR2lpAXhFt6iPs8gAZw4tjh7GgI2
         gp1pKEV/3GiDzlA5RQU9YdndQkneKKFzQa4BBin2Dc6MsS5p+4XQXI3dnljKm10n0L3h
         mIGXnLFDURsWXClWSBpHUq/IIkmQ6c7JZU2A0CzxMJzYXCJDTgt+cl2bM613g53vnpcf
         how7HRKedj+JMnls/qwvyyRXtkMz0M4svMt0JzSHcN0DG/yHeMO7j9sZdqH00apSA4Kv
         ieIg==
X-Forwarded-Encrypted: i=1; AKwUvBweK8y0IW/2hiuifKmiaeJKEGEDW503v4PCH72II7qkWo+82vGlW6X/vv7aHSMrLSoFppFiRPH4xk0W@vger.kernel.org
X-Gm-Message-State: AFq9FYJz930oo4D1tPd+SjcZKScE+ImqTSfUBjXjlSS9KK9Paju8MMS8
	uT3oB0DvOhhVuJ5sm42TZJA/SZJIWKgkxLp3zAiq9xOraL2LlG9kVwKrnNGzRv8eOxVmwo2+1t7
	8a02XgkLmB+nyuOvO3YVXZ+xV8JQGfGz1Gx4fMa1njGaTUuhv+jUKVq2VOE0ONa/M
X-Gm-Gg: AYBFou2AAFe4smukqWL5WJ4ejjWTuxCUnmVvqlyVZr70AYw9gPff4CWB/xZra4IJFxs
	vLgMar/Wgb2QMQ4Liy1CUDecpPoRL19yDbGwmVmDWnkC+77ShgdaYSi4yvhbLL7F54YgGtAs7mq
	CECHJhKbGfqCP3nuB64v5VS76OskTbZABW5IzBYSMSQ0C8m69c0LLQdJTedMwuXxmiGeAqXFhTn
	LpmRW4puSR7InvHVGKJxAnxK6FLY2ffxxKZRFnx+Eeqh8SLAp/ZYLr5VxZ+JAGZm614FW2ayHPB
	rv4Ly2NkblmyZTFmM3SsyhUdC4HQYqnPY+yKY+5mCg4S3l12WJR4SkddwLu7XQQo1gy2H0aLWc6
	TalceXFptQWVBghG/HudOpnjoBsVGqoh55obXzqdjOGul0sh4FSRZrn7PwqTwDvATXykX3mhnJd
	07A+v6iSl7oEOj+OCIqF/AFEbArOinC1uhkQmPHYdDGC82aW9RmaGv16z1c2+XKWqQLY8eAInVS
	QOu
X-Received: by 2002:a05:6a21:46c4:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e9020e8011mr1722642637.2.1793185720572;
        Wed, 28 Oct 2026 04:08:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:46c4:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e9020e8011mr1722630637.2.1793185720153;
        Wed, 28 Oct 2026 04:08:40 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e3a4sm1000512b3a.28.2026.10.28.04.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:08:39 -0700 (PDT)
Message-ID: <7b2ff0ec-74c8-472c-9ea4-1195bbf04e1a@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:38:30 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX5JClQNPPkLuF
 WJ26G7LufYFyNcIqfP/xfXEX673SHxFOdhEKmEewYhJNoFJ00wB6BpxvJO83/d+HpPH8iK5i/ke
 6ZbK9haDvZyRJQRSR3AK336/3jxW6wDfgAr2w1bh8QgOjlqhYl1VjdMCZhr3RadciE/wifPOfiZ
 7SgKsY0Sr+VazP8VuG4uQB/sVWtHfV4OTurqD1nzSRnOTGq9ogA3Ma06Q8gooCMAFF1yT/5qOzO
 YysESfWdMuMn0uomRVg92jI6Ek+LmRf0Tjf5JeX09leInDYrV+TcIw0cyHZpu0SHdXgVa7Smpf2
 3wpcRfQdDjt1XiU/v0IYyb5ptbHCOmwHcr/MZi0p71tQ1eQoGZZPCIDb1lySiQAKuiy8OPCAvxb
 dCjvel8svfPf+KH2d+xtBUJHLRqu14MDwqzf1sOuK6QBQE/Di817E1WjSY/MjSjcmVAB70IrkW2
 vIfxj78mxp30s6PGbEg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1d7b9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VMI7CB12i6EQ-IQ_HUsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: jFAtSZc305P09P6RAQvQBgQTPZh5C-Fd
X-Proofpoint-GUID: jFAtSZc305P09P6RAQvQBgQTPZh5C-Fd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX3RdG98JfTaSh
 hBVlkUiPrHuJ2kU5kkq2tKCkf4zna5JFxL3OzS1S8IHaF3r5Wr+DVKXr6JVVmRdJl8hbLFV6uYS
 R82TZ6pBD3CGZzEMfi+MK8snwKMHJYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280044



On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout. Also, the GMU chipid is
> different when compared to Glymur's GPU. Add a new catalog entry to
> support this GPU.
> 
Tested on the Microsoft Surface Laptop 13.8" (8th Edition), GPU/GMU 
enabled in the board DTS on top of next-20261026.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com> #
Microsoft Surface Laptop 13.8" (8th Edition)



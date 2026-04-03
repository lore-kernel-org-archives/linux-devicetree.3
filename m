Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D660D317152
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209040; cv=none; b=oj5s8hUHkhRKOhkmsjR73nJrOPg8t2RK885JgXmxsgCTTdvNksNIrVcmAe0829KYaacToP6+96gvxQqu563IorIc5p5rjsZT0TH5bEw3AULFeLPC1dlt2y65TJmJ6WYPUptu9pMaYQpkglfVNszkf4kQjPLJAiHtrPU6r5b0qps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209040; c=relaxed/simple;
	bh=SocuiM4ILZ9cYRA8mSWtuuuo4+IGmqWsxZXNi9/pB0E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoAIV15qur++FxlEyIeDB574lTErEvDYwvT7J/v7hxdxZkhpU/sAHxTqFvhSghjD4fqRrIAZAnW2swWnS8xx1mDXp2XVqg4Xadem1rt0RaEe0Gb6wN0ICS+MVsd/jBPDBGW9HmuYAs9icxaPxb7Vc+EzfgN3G2SupwsTxDNU0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isxJvM2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts6zm3i5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isxJvM2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ts6zm3i5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337GX5c2707221
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 09:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H0MsR4PHC7LRNEDJ02SXHtGh
	86o8LwWKhT/z44z5dSo=; b=isxJvM2K/Cv3Pm0NShfaaEwkY51/yH2P37+roCBv
	lYrCcgbdhQHUYJxt9ZaYRXWC20+urqqeQP2i3fq42SxtBdpAbOyHaIPnzRWp93qp
	QhAms5skdcgdocGbuW8EEkhEUxZ3sTcKnETvEuiyk1+Pm3OocQu1n8HzYcRw66t4
	536ts+kxzBAJIVeVFBFgH3T8x2hYC18mMhBZriiWcTHzQDNU9C8b+kQqmV4xadiD
	mTBOHSS2dOrTwiGXGNamY2DF5T1mQ/6TJ4GlxtarDcpWup0gReaWKh75SsJBMArq
	yJ0mRgfT8xA5wWGvPp4wQ33YQwu38eZi/2RiBGwkpqwHTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjhyer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 09:37:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so21920931cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775209036; x=1775813836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0MsR4PHC7LRNEDJ02SXHtGh86o8LwWKhT/z44z5dSo=;
        b=Ts6zm3i5LV2Cj3ZCIDP5zmEHhU2cXXBxGlKB8zByjE4Sh2KHe0nhc7I+KJmtFXeWqE
         EL1+WxQqj7Hn3MH2Hyqt3uKTyRLa8ABdBu4x6qmQzC2E+v4mHrqCtH3gb4rID1AFjZXt
         /89RgMclwFajbfRO0pq3av88ZkdawVmQlG/NwSBELCIxxIsvM66VB9FoTDlfLpcIzNRQ
         /4BNj6t/RnTn/5r39bLw6HQJ2IJ7phm7qxyvcrnHp0EXTDSuKT8q11tOYBY2EpRLwP/l
         ByxCJWDeOyzL0TBOYj5B6y4qSFVDE4w+/zhywavwDZUs3sEMCY11HaYyljshng9QZjtM
         C76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209036; x=1775813836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0MsR4PHC7LRNEDJ02SXHtGh86o8LwWKhT/z44z5dSo=;
        b=eAlr6Kl7QDFRLTioMhc9WyW3lyzQds5Kp2PMpmzUPCOzIrTXiyffr0zUbeg/v9GK0N
         UaThXZ3drggFI28S4Qvpsxn7fCh1CC+HHCWJ5tdCIabQnvF85BXf+1dIAhOoaFf5yrbZ
         t5FXQEyhsK5pQfHO90avJDmQ3Fjj226Cs96vd0UbGC+MGOKua2vvwimrhg85Ste+Vut/
         i1v8wRqXirIuBsRS53EpyYs1h1meGOWiM5WD31EElsKSAol1MBBYsOjv6b/4zb1M25AF
         lhEWlfjfXZ8RGq8NRrzOPVwYTTYZSYbVehdkVFy1eeJIE2K5S5JC6SU0JC4Wlfg5oG8I
         WQog==
X-Forwarded-Encrypted: i=1; AJvYcCX4lM8eIHBWOMHx/fH3OGnYK2KrsyOyGJg4OvzUqb072OkaenVSbvZFp+lyqa0k3zXj1wQB4x58FWk7@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcc8vhYmhOrB9Vwb/L1L3svduvrWsf1lJvaTupDjJqZ9uaSq6
	OCnWhX8fBweA9q3DowDJv6KuW1dEOzOgY4POEueX4MhDo3XY5SWqPv9WF2bN0sMWo3Ui+ytG31l
	fyJjE770f5sY1ELyLWt+RR1v6kmoV9s3amUShQ+MHGhwdfX3S1sWhytit7nu9koem
X-Gm-Gg: ATEYQzxpjb+zq9fQGo85n8CFR36pFIRL7TgDIfwWTTm3kL1KTpIxFUoWlF3qbcfIORK
	DV9yg9XUla2C85DFMd1OOTaSUgMUUYPxQaYnkqpZFG8O+N9wdQq6xAs0HRb5NioUFl3suNnhMew
	dNE54KH5kwsTBQ5Kpxyz3T9fgUOjN645AoWdU9wo/7xGDN6upm625wEhJUfTL8ChW+s7EstbipF
	H9/wfd0TyOEVZUKB5AS1K+to18MRfMPZoacTo0tQBGHpICJaDb3uvV/8E2a9ennMPoIKfmQdU3+
	fe/ktFbZXvYAb2nG0bHog8iZFJnpB6pfFR6ciLdRN6suMucC5LRGBgFkvO0DCxlSY1CjWe8Ryje
	EjnNcWt8XjcXEGG+q2C11Gu8wfcWlEsBXO8kDzwStrH1rzd4kGIdJ1XmZ
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr66236551cf.38.1775209036469;
        Fri, 03 Apr 2026 02:37:16 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr66234201cf.38.1775209031263;
        Fri, 03 Apr 2026 02:37:11 -0700 (PDT)
Received: from trex (187.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm15010561f8f.3.2026.04.03.02.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:37:10 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 3 Apr 2026 11:37:07 +0200
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <ac-KQ7e8-syph1Zl@trex>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327131043.627120-12-sumit.garg@kernel.org>
X-Proofpoint-GUID: Y35Jc6iUyD_6ARaPsajL9BagDgfs0hGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4NSBTYWx0ZWRfXzH1j5wHRhpou
 iZ6o8flLycRd5KAbvMj+Xi8BZHqD/L+8JYE+iGCtjNVB/GSsPiifSxDHGuwdRD8TPOFZPUzK7VO
 BNy9vA8InucsN7jQGhMDxIJDh7eznEhmgBrxg2e6SkPHfpaABQFRvZJVWpbLnFI2kKRliZSfWkY
 zoTs/mtxOtmNtkQFZymaGwh8/XWS898sL5xlWyA3JuclmFq79TfgeEWNfQ7K2ZvJbHtQ8AZl1Qf
 LdtSnyJv/vout7Ohm65YnaPPDqU4GzuwugUHbJ4kbBtXchzkGOCIrnecFfgC8yFPJG9XX8uKx32
 9FbK3I+ICtQ69CTDsFcggcNYVxFwqvKlgkFSTPCq1zeZKOfm4aIwH/1i9+CNqwBl/DAIdI1cmku
 b7bbuN3PqL5b0BNWQ2eni/txfZLMVmLwooWsvptGSj6uyPekGjVnsfnF9Vt37tugHYtvS1YGbAY
 YVeR5xLsynP9Fd0djoA==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cf8a4d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=VPdg2FrOqWfiVCzsz0q0YA==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vWT0tKtjkO2eN-vK3vkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Y35Jc6iUyD_6ARaPsajL9BagDgfs0hGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030085

On 27/03/26 18:40:39, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.

OP-TEE based PAS service relies on the linux driver to configure the
iommu (just as it is done on the no_tz case). This generic patch does
not cover that requirement.

Because of that, it is probably better if the commit message doesnt
mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
implement the same restrictions that QTEE (ie, iommu configuration).

I can send an RFC for OP-TEE support based on the integration work being
carried out here [1]

[1] https://github.com/OP-TEE/optee_os/pull/7721#discussion_r3016923507

> 
> Along with that pass proper PAS ID to set_remote_state API. As per testing
> the SCM backend just ignores it while OP-TEE makes use of it to for proper
> book keeping purpose.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 25 ++++++++++---------
>  .../media/platform/qcom/iris/iris_firmware.c  |  9 ++++---
>  drivers/media/platform/qcom/venus/Kconfig     |  1 +
>  drivers/media/platform/qcom/venus/firmware.c  | 11 ++++----
>  4 files changed, 25 insertions(+), 21 deletions(-)
> 

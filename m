Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AD30BB9B
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189658; cv=none; b=QImXJnUAr66FF5av63NjpGgFYA9EMKQuRP9ZChbpgQbRncXQGzOMtIMCnTxhdkJKVrIsuPTNOXDGRy7VC1s9oCFD4CNDAwnbADjMzbr+6p4cLj19jbKWmyLUdHPVKY9i2MRET5CNebzVYUjzSnpeWZY79uCXdpWplxWCCYMHgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189658; c=relaxed/simple;
	bh=kUfdx7gUHyI6QETEVlPznOfKLyhENuPqzqw7yoOLTnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThB4p0U53jxdKbMoxewmaygwqth2mhiQ8zRqK2srmkQTZNzHPri9un+a9poC9N5emg6ZvHy/NICmgE8mImdYx/OPcez24l2zUXbeX4/KBBXsL0z/GWFTpJJC5JJD7M09En9kxDA2tcAYjej9IHzsKA4CuUSJcc3Nm01Jam/xi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8P05sQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8IA8THE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8P05sQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8IA8THE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG3Oi5966080
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6EeSe5tf7NpDqNPZfyeQBWoD
	QvTfUNSRRnuEMGJYQ2c=; b=N8P05sQmyqWJOtzH0JUrwR53wLrsCMUUzaBo4lZJ
	+G/IVeFZZWO//zdEVrZn7fNTuxWwJoYjmZxK4iefOOYO/HhMphRYvhuWFLyq1BfE
	meZr976TgHLUoZGLjVhHS1hqUMMks6489H025hwTSimCEejV3JnlKCeeRGFDJCPO
	Er3YTU12UPpgDKdxHDXhPkJCg6uCTIhjKw4eJL/SrsKk8emQJyr2q4HA4rVkAmwN
	5/HR+HMcwlZ2L9You4BP5NbFNYKwfgxIXioWgiEM2pONa8fNdqo2gozdIvtref8Q
	RWmjPE5OPt0w0jVLfoGBE9h7WR0RCxGR+ehNy0C0pKZFXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrs1rg45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:00:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb3daf2d5so61136796d6.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189655; x=1776794455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6EeSe5tf7NpDqNPZfyeQBWoDQvTfUNSRRnuEMGJYQ2c=;
        b=h8IA8THE/1Kt6Jbt0pL4E8hojzN1vgZzKVXrcbfxT/Pro9XWYFcSIGaM1v1o4XXHJI
         npFhx25UaSxShpyx9eW51syySwawk1/NhtySR8xKyWEGOcUKTmztc339fiN1lYMczo72
         e30aSoCoNilUGjaJloys+xzslMdhazqpueYCCFfMwn1tFxbhr6m/zLbVIiQZpH2qx2DG
         cUj32NSHaChIC8wVIR394Vmtb04YRWp83TEldfnbrgqpYi8p+q0OQmTkJAm1m2VlXHNq
         JKtgqf5ogQMVIDkZNA3TT8inhK28D1dIpifIX+M7UxJFIBzpApQtHuVF71I/mLZefs0W
         hqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189655; x=1776794455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EeSe5tf7NpDqNPZfyeQBWoDQvTfUNSRRnuEMGJYQ2c=;
        b=pHCB8fhvGH+xdc1wYI2QGbCzgcOCa1hYbSxb8pVJTDsER4qChZKrKn5sqL1ZiMN/EI
         0E6G0HmRm3XYzmzh4QEFGZuKnu8r6RN9OH67WLv4WZTIbN3fEtTnALN6Nu9JJfyLYO2H
         LOCcbRPrWe6LQdhskPW27518GZByNqdBX2bgwjm+KQygYvfKnkvPshhHwflCybElLqKh
         zCAAoiYy0YgTHuBmrdS/oHYXDMIR91b1zhjxgPs6M1YTK4LMeUgp54QeHjM5tZiUiv7D
         0L/FBfRdsVxYg9CnYrM3CBbeym9k3DfuoJhIH0XtO6yQyt3Loveh5a4OvbmCPPgcMVNN
         ExAw==
X-Forwarded-Encrypted: i=1; AFNElJ/wMQiaPAWz/A+21CMvJX4K5MF4CSZLfIDbptsULFC01bttOShHnP0xrGEgwTrvGSNAIbImWeQBF/0S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/dQ7fG4CcaU+0WciFXggNAhreGFaJ7T1Awpl7rawXk9Cf83bC
	eP5palDCEicdJW3Dh0gdm1QbcRw7jmyDIdeVY6rwZQ2fji782KKhKBwOpCvidtfDAohTq2EB3t3
	TNpXNjYkiOBs2FXYysf6CF47mzNyRzsoyFSyqROrmd115qx2JNVry176N0KKbuRt2
X-Gm-Gg: AeBDievfYesJfY1q1ipfyPw9uYYz5P/xkcu3kek126FMsbhJ23jEK9nA2HcmlzXYnUH
	l0Eqr2nA9oNfdRKLRgGo08qCauNfwBKSs2SdKAxhZoxnJ9a0WySWdZ/UJuFd36k6AOMEHz2hZVd
	CKQTHRx4OFV6rYiXi36rZe/j9QsmmBatdlus6Qt3sHQvipxsm40/160wYphucW5Qal74p15aJey
	CkpYM5aADS+hA9k48oaH5ghLr6/BN8zvfRVAeHt0magFgj0N7vFYMbbT3sg6Mzk6YQOsX4fXLo5
	ZExQ2EGNQsQEPohCtnMzP3k5rlRVvghdRZQ9x5V3g+W/dtuYM3JQt72FitgyL1PTVAJB6UakiqR
	DETecN03V3piiy5sqKOZ12ftuKiUq8Ag9NJZW1+cjJFWecIrrpVB1x3M9LI6DZ2ksuhQ70IxvRG
	K5t4fPt6UTempA+U4QSA174gsHEXJwbnM5rNNQXQU5FJkgRA==
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr278308811cf.17.1776189655162;
        Tue, 14 Apr 2026 11:00:55 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr278307921cf.17.1776189654482;
        Tue, 14 Apr 2026 11:00:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4926eb14sm34363961fa.2.2026.04.14.11.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:00:53 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:00:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/35] irqchip/qcom-pdc: Split __pdc_enable_intr() into
 per-version helpers
Message-ID: <y53xe7arbjuxsghvi67uwc5w75ulbti7wfujasho4vwd7dmza3@qnnciwzlr6ej>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfXzBCuLDWmQZuL
 zLm9U2Kg8lE2Vb4D4Brk4v8g2duHIOquh57BVmZ9xa8EFroWZ708ZKYAgU4VkZHG2KmPeDYvV97
 2YsHOGFBVF6YNgS0EstRRpUp3xz/4Br5bCxLuBhRLVzXpRh1sidwvodDsoYWAaqBMyaRWsWFmx8
 rJPLnqGT9NW68EzpQWo26I07cAKWZIam0zQBAvqYynhSChNuSzJ4+hz8sHcldFtjzQG36fgWq+4
 MSHNSjMtTn3c5AsFp0faW+akjEwJ4+TicEF8UXCnQpAB2ary7jvDaoKq9S3z3F3SW+lIkeV0JqD
 wOJKCIZRvRT4rCJWWA2h3Xy4K0iCgyr7Sqtip9rALY7RB4DxaS7iowvBQGMP2uQjAMM2y7O1ncH
 XonaHSY/p7PXdXNfusJp3mTtmzdPsm8GJanDGFzw4m72Vj8S8rZX1aEOdlJQePprOSYQyb87fx9
 UHKpxYTNWzdtG8xdJPg==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=69de80d8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7VHkyeIEd6B37TvAa9YA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gWaomXufwtTDoNiis--YlkyPH5cIjIrc
X-Proofpoint-ORIG-GUID: gWaomXufwtTDoNiis--YlkyPH5cIjIrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140167

On Sat, Apr 11, 2026 at 12:10:39AM +0530, Mukesh Ojha wrote:
> The __pdc_enable_intr() function contains a version branch that selects
> between two distinct enable mechanisms: a bank-based IRQ_ENABLE_BANK
> register for HW < 3.2, and a per-pin enable bit in IRQ_i_CFG for
> HW >= 3.2. These two paths share no code and serve different hardware.
> 
> Split them into two focused static functions: pdc_enable_intr_bank()
> for HW < 3.2 and pdc_enable_intr_cfg() for HW >= 3.2. No functional
> change.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 42 +++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

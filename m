Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A383947A0AE
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843818; cv=none; b=emeEq6e7z2vknvfzvdxRo4dsjit2TqXcd6WyAE+6glzQFJn6lspm4ZK73lc58f5OYcddrx5FZqU+XV2NP3ehJDXGg3AGRMgStnaKuNFUnfToSxQNKJaHlwrYFPUnMZhcFnAGu1qhcW+Zk84hwn8iPaD0bslqkG6PiK4D0zF434I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843818; c=relaxed/simple;
	bh=IWnII/8of5Gkw/ETzfubG/lxFjHghKOesWQK+yljwLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/UZHNsNbTRuXO/DKe84YgkW9xnEM5yePImQIEwfJa1KvPRauKGUXTk9wnGzgxLXWU6L7yzUgi1lpaziEeSV2ZcpSRAPnGktifrDQE/AEcXr3mFNxoO1BXGgRaKguWgD/7WmTfObCj3Lv0E9wqh3OfX+4vq92q3EHZixURs8IHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhZ5vfio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3V1DOkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhZ5vfio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3V1DOkg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBCUL5656082
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s0fs7treef/YeBXhb+YaPUyD
	DWnHEq7xUjHiT+MePCI=; b=hhZ5vfioM01WUPLnn4NidiUbotqj0lrj/LNZwPG1
	bs0uFcA1cXS7pIuGAPeLZTkEqt1qfkRBZzA6X0iqoJIQ+AFZvU2VHz9JqHCIyEao
	aNgzBOTLW1fxyy5RRMt6zdzWC9sF3skk/1AxXWg2EiqP8bZU6r/wN6P48m6fRn3D
	zK7CTtSk+eQio2OdhKWKXWHefGUuUcjJ19AA5k6MfBUAPZQPqdXKI27PoY5ezT80
	cMcQPt5Q8wZp+VNByJukmPUUdJ9K+qxRcl49jpmM8eSumDIIdwDQ3lxOs6nakFJQ
	Bmu5oo0ZQ7t9BVB6E33hlnWZzRDxgtCSCeGZfOUH1k851Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu25d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:16:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso97731345ad.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843816; x=1779448616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0fs7treef/YeBXhb+YaPUyDDWnHEq7xUjHiT+MePCI=;
        b=R3V1DOkgPjJbPSDYuFRlPPxte+U6Fg2RIerL/TQQudIxRiidwG5sAnJUEsP6l4D+UD
         dRtGE29AalqTc4l1jg5dCvUr8BJjaCNuiOG2SuwZkXyGIIY+AMn/whhw1pPsMOxSzuMg
         PNRzqUgM7ViRrk+gE0N27wH5RGy0LFGXFACVqIOakU9UDwx8JNpYrktjuxzwDa7KAQZg
         h8GFQya2RRhHvUoQu/UDzjLgBJo38OggjvWQWAwV23Ib1c7iFvsLUwIuBsBDb7NCO03i
         VVxT9Qs5N/8rWY/CMAqJ8NhcsSr4tsSeANQF05ldz+uimXKkmZYeZQHW095diJI8SYuv
         eEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843816; x=1779448616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0fs7treef/YeBXhb+YaPUyDDWnHEq7xUjHiT+MePCI=;
        b=Y4TwgzAVkHgQc+v9TxckfwN/QA7iEmyCFMk/f9+k1a6aGEs0mASa3++x4/46SI7pR1
         FLXivN9iJOqo0Y0WgkrWWjzfBPlRmxeCtF9e714R0Q0ops+GcHkwcpADl1LdwodWyivi
         ElPSyrKLnF4GL0EjT1DTzpvUn4mlcu/IJqM8T/1otaA7+lnqfTPY0D7q78tCW9FXrnu6
         J/tKcchbqcF/Hiz03SdjS2Ir88er3yWnGFHX9092zgHcFJJP6le6jgglj2OF0W2NE6N5
         r4cY+/8dowPAUJBRIkTdibLfej0aum3SpqtGdUeGABCoTU/2ly1SkYAVYcKNS3lEnbjx
         giug==
X-Forwarded-Encrypted: i=1; AFNElJ8Kyg+kGJyBh42xPPTAkJPzoH1ft1NpHRmr/QzsJ30uNXwA9JBH5RDI9CJ42i7PFn7L3QwiE5foVEhB@vger.kernel.org
X-Gm-Message-State: AOJu0YzibUwChlTlBYresbgMux8xnyi6Z1YnudlBEFz/qW9WbhC+Md7X
	N1OYsgrgLLdr83J6kfRT3gWgebGSdYgMjKaDGDIyNaoF+X7q/oVKbzM4w93N7MTlHYgH75GIhUl
	jz9kxUsM8+EtGLzkG4H7C7uTfgO88bM0JTHjBXDHmNciYXsZpTFfk6UyI6nKrTDuz
X-Gm-Gg: Acq92OHkuefFx5IdrWdCseeN1MwNhfKxO4wx3FHz9ZcR63b3BuZbRxlIVyFNmw/kHCn
	YeoPaxCoX+I8g7+aGGRx5gEIzMjgUwN2yjsdF9Jnc2fJM6vsJIakfHysMPOAyb2fHaXX9vZcgn5
	Az954YR3GWotbH7nasELnyMZtrxyJnAfj6KjFJvRixn36+k/hc3VUvTUuEZiN4PR5pbPtJ2iDLk
	MNopYk9JJ8NBTx8YfmJ+Kf9SpnNYqKcVNY9a8XqvFy+f0gVl8nZBXaCaeOPSqNsKyQXVokqhkmv
	lIqtyWVL/4Cgv6rXYxDJgD1E5rl3uvIbPLz4cNvHDmss72Co9U9yAn1L8p6AIyHEfoDHNOCp9E0
	E+Aqho2Mx7jodHfPGJDhQ6v2o6DTmJwcZKIHfMYziUarGv4QZd2c=
X-Received: by 2002:a17:90b:5348:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36951733ddcmr3600610a91.0.1778843815975;
        Fri, 15 May 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5348:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36951733ddcmr3600570a91.0.1778843815350;
        Fri, 15 May 2026 04:16:55 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517ed182sm2498172a91.15.2026.05.15.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:16:54 -0700 (PDT)
Date: Fri, 15 May 2026 16:46:47 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, andersson@kernel.org,
        konrad.dybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127190211.14312-1-bjsaikiran@gmail.com>
X-Proofpoint-GUID: 27eO1_ciipBrKrf3njV9R3ERNl0vPTgS
X-Proofpoint-ORIG-GUID: 27eO1_ciipBrKrf3njV9R3ERNl0vPTgS
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a0700a8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=sm6vtEfadFUgZexyShEA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNCBTYWx0ZWRfXwqNkGnqF7/v0
 bZgJnYieIp8Qj+koa56leftAB0f5MmM7ZVsm1zWJLXOUJgH/rH/s05j+ryZwYIwicb1y2xLa8y+
 RWrwPqXO6LhLXyoIzHcqBIcFKHV/bcVKCxjJedvadb9Orb5HmsjIHsKR+IMC96/u5hZnyLRur7d
 fcAcQdQ1Ee2XvmN+iXzRSFtumsjRl5ErXGFKz23nrENtwdaS6zewi70x6ACJF5dZo9QaVhzXLsq
 DjUXBecrWmLzmteuHTjT+AToYOBd/iezasuumIwhKsn+fxUgmhRT9QUWwVQyu84zU3DGIE5lrZU
 4wtfpOaTEVVEdw6jaT27cBfzNUNrbh0rKNCIAhOxMkO2cpAW9oCwCzDpkn1zghFKuW/C1wWVSNh
 hiWwLAQuA/kKDmHkQdF/5jOw3ex5WHUEHvYSmgot51295c2zYw8faWhPpW8eOeXOo2Y1QOJtC8C
 92DSx0rtG7fM18HAGlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150114

On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
> This series adds support for the standard `regulator-off-on-delay-us`
> property to the Qualcomm RPMh regulator driver and updates the
> corresponding Device Tree bindings.
> 
> Motivation:
> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
> When these regulators are disabled, the voltage decays very slowly. If
> re-enabled too quickly, the sensor experiences a brownout and fails to
> initialize.
> 
> Verification:
> I verified that the core `drivers/regulator/of_regulator.c` does not
> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
> Therefore, the driver must parse this property explicitly and populate
> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
> 
> Changes in v3:
> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
> - Updated Patch 2/2: Refined commit message to explicitly mention the
>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
>   (Requested by Mark Brown).
> 
> Changes in v2:
> - Moved the motivation/context from the cover letter into the commit
>   message of the driver patch.
> 
> Saikiran (2):
>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us

Hi Mark, Bjorn, Konrad and all,

We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
helping.

Issue is seen 2/10 reboots and it happens in the UFS probe defer path:

1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
2. UFS probe enables the regulator
3. UFS probe defers (due to some other dependency un-related to regulator)
4. UFS regulator disabled on probe exit
5. UFS re-attempts probe and re-enables the regulator
6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 

Issue Log:

[    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
[    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11

NOTE
- Issue is not seen in first probe attempt, because UFS regulators are left ON
  from bootloader, which gives enough time between rail turn ON and UFS init
  sequence start.  However in issue case, it seems re-probe is happening too
  fast, which causes init sequence to fail and UFS brownouts (similar to camera
  sensor case)

- Also, we compared this board with other RBxx EVK boards for UFS rail, it
  seems that this board has more caps on the VCC regulator, as the board is
  designed to have both EMMC and UFS, and we have DT option to pick one of them.

  So for EMMC those extra caps were added and they are impacting rampup on VCC.

Since this is not entirely a UFS part issue, but a board design constraint, it
seems better if we handle this in the regulator side itself, as adding it in the
UFS driver may not be acceptable from UFS reviewers.

Please share your opinion, if this seems to be good reason to accept this patch?

Regards,
Kamal



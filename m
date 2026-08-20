Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F82E0B5C
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218333; cv=none; b=HD3oECriWilI35Jn06rSHGWXY787g2/gHls0MUtqaZB18jnErTiGUUAQIrpVpXf+jG0QZyoqgFTQeGe+eKUItmYh3WL9P1i122XECZgTQuwPovAOLWesMnGfFaUulsXgUGBffRNXq3KrB+BRjrFgcns7B68loslvoXW8NAw2TO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218333; c=relaxed/simple;
	bh=hZ6uac8KvPRXkV9vhOLj7nXAkbqQbTg7tlS1trEqZEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djEIbN+6Q5nWQcNkZGZIUEkXcJJNmCD3h5mRszZQ0KZ0G1cGDf/6zxKQHV4EWZ34B+q8qOvo3oDAhQYKO0/63v98neYf3O3m390oi9J6KrrkpIsoUSYSTa5JyBotv50elTPKU7jH1pZkfqU4wC9XzjR4aFfPQwTnLYt5wh1kWvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3phCS9w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7OA/cZI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3phCS9w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7OA/cZI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K61DM81777132
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=73zzu+rzJFAbor3RD8lFIDp9
	aOc9697rkNpBh9N8V4o=; b=E3phCS9w/25IRarG2tPwxxa8UUXhqCVR9tF6ghUt
	MKPTrIFSONLLxRVAX3r9shxTjT9Gx3UQUHyXOnONUr3t5G+bdjiUNChGFw7PeObs
	6nkFjBRrJcyQMLpNxN3u4nXdh1ieuMwWd0LYrt5H6qOHmyRAwBYxRyNnYGoYVKy4
	9UHlNQkF85IOjswXZuM0AConAR9sPOsdY4tIlxVsccOpWmUGPV9PI8OGnGWLwlEc
	hsoaMjQTOqb8ny00uBUZosFGBIlO4flXpPZKAz7ckFqwEs4YgB0R0DDcfiUg/Zvo
	wlunJIrNNCpeKp3k8jzTbg7RUWczJM9Bnb2zEG1QgmZTaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3m4kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:32:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa3d9dfbso255827285a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787218320; x=1787823120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73zzu+rzJFAbor3RD8lFIDp9aOc9697rkNpBh9N8V4o=;
        b=a7OA/cZIFXpmngJ9KmzBlku2jbmBc7Ys0ygLptTDe2M7+dxefkkQydWJoEmSn+0x6U
         ZKFe2W4LQCfb6ELkpdCkXTdZdVY+bmpz+83F/W5NgQwFO3OZeTEwQ1McJzywa1Y2PU9i
         /Xx7n5ucRTpdD2ct9BRRTqP8ofNHrpJjNAUhdpZVQ8zcVdYOlXiLChsVc0Mtc+w/1bnQ
         nueVwnCRTcXO6H5IYaiw9pPLHiV9w/Cm4TbtrjNkv2Rk40vl2D7HPLZin4CBl95YRyU7
         DEcl3w9U/0Uustt988DU1Ch6EGyKImsHH7FnBUMn8YTPoLCBkMrEfFdMIvHkrV/NvPGq
         0cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218320; x=1787823120;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73zzu+rzJFAbor3RD8lFIDp9aOc9697rkNpBh9N8V4o=;
        b=CmI0e6pbE6udq+MQsiIbdEtXUYXXRDq9L7JFyK6YgiR9uYv2P/L4fr3bEPkcZJrg6x
         KsOQeKc7qwYk1bZpEbfLjnKLjqIdRejVa5+Ho1PN7YL/zON0MsPz9XKdbyis/W/FMstm
         JYlNQ+6EgY0GWJ+KdZxGtmZgO3ddXWwqZqWKRCM+CnSVwLsyzGs/fWRbieHE+rEF3hU9
         AGJ0XL+qzST+XAbBxJqOCZ8H0p7PCuFhtzBSDZt1xCtqHB9lSm0osU84ClSqpODIkh7g
         UGBz2dcpFbbnSxHwNQXdBgU/i69Z6NhobpAdxPvBOUh1r7b0+AkJOSZkD/8wNAKnFhau
         AaFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2SAbACtT5iQRA4Lo30cYdniKyL+xZVa5O0octE9lnJJF7ZP0CKyFIg5NcgTfEF92F03/tWopE+MzF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DtZjMKrGvVe4RPX9OqZAEzRcufFNfCNip3CMnKb30/gnJ/S7
	NdLo8vBG0LEdZo1B/fsG9g9+3Rlf5MR46tWIAa7nw7Mp7Px6JvN+2g94o7PFvE/CdkVUITD+3DP
	E5W1ZFLnxqz6E2u4cWh0TYf2bdEY6i2AV5GSrjuKHfxA3hGs1eCYr1e866w1jPP/k5GlBCBpKMq
	OPYw==
X-Gm-Gg: AR+sD10QSLLOGtvSpNuuFP50zq6V6YABf4PRsZMJMfZA3YZ8NcHQnd4WjBW/4KwZQdt
	MMI5dqffUZsBaPVFTfgJnTwHaptn7BT2tTlrpxklBx6lxNROhuxVBxJQeUEMyqxNDI1eaRFkJlH
	KUAFw/HY6uR4bjqTMOuwCwhiD65kMgR/qBQbnFSeGFswDICIGK0ss9fytOlUFTVD6u8VzVFmHrh
	iY2MLjpeLHNwxk8uHinC/t7UBnrwrnTHInZk1eKSGm/j3KBkCAUoGEQk2agnzB/AiJlIBgrd68p
	9DNQZzbUB4nIh5Ks/N/0KjQy7bSLHLr95jQWajE2kL9Cye+hiIdlee7IKK0e9pLHxl0SlP8qgrH
	vS+HCwmsQbACFyY8=
X-Received: by 2002:a05:620a:3712:b0:936:9f47:e908 with SMTP id af79cd13be357-9371e259c99mr940645485a.19.1787218319923;
        Thu, 20 Aug 2026 02:31:59 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:936:9f47:e908 with SMTP id af79cd13be357-9371e259c99mr940640885a.19.1787218319338;
        Thu, 20 Aug 2026 02:31:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b20bdd75sm36843015e9.2.2026.08.20.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:31:58 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:31:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <2ed6ai5ms7bvjlfi4fq7o37jmcfasrkgkniyzskkjr4wpc5hpv@ypnwmx5rvru5>
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a86c990 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1fqHp006aO9jO71P8i8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2OSBTYWx0ZWRfX/hnl0MT1UecY
 ISAYoe+OfNG8VCT2B5fJd2keW1Yl2ap2Ocj19MBVHOwknzj7tv1IE7fy/KYaRPSNYKDGSrq9mZh
 Ok7TFdoCvenoYwvLN6j50bjKFd+W4r7udqggN6CK0MW2w4IqDgR6e1xuGkvWn1v+ZxjmwuauOQP
 ShFql8fINPXq9KJEOc3ONRVhplDSlpDKchWcOOZ3rS0zAg7oRkX8lGPcjyyDIehCrc1AcfZXyde
 0dek39GqXCpYhS0X4dhcAcpmt5yBP/dtcEIaJv4x45VKzeBgbpL+NFJbgV9ePMJhMSyxWCc3Hw4
 uAyf2c4vUD0hXEbT0XMqmsQEhHHDp7nzWFK6V81wXNdTCs4Uog/CbLl/TeeRXopGhr1up1YBaFY
 xUykR8nufLvrs/SLYdnw95HZf8tPGj9ln8reDOi76auIZuiQ4iB4+zT5DPCEOKGmo+7Mk8yKM3a
 NnRZJ6gFtHd7f2bByog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2OSBTYWx0ZWRfX0m1GUrNNw5m0
 bYSQV18Z3AXn3mR8OSs3W9NTrh3/YHXHwDaGzg+2QMgI00jrX3UEUEkI42nTfMTdoqblIcpZaKw
 v10kgBPoMpmBitcRmjOzaHF5XWt5LTA=
X-Proofpoint-ORIG-GUID: IdzA03bAh7BYltF9wZGB6j7WRuceAzC0
X-Proofpoint-GUID: IdzA03bAh7BYltF9wZGB6j7WRuceAzC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200069

On 26-08-20 14:46:07, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

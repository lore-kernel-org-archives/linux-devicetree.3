Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A9242D6B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 04:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753981; cv=none; b=pxOHtq8ytdQ33EM8xpLUTVRWOg7qNvRHoAIrxpsAJ9bSPCEC85ONMsZ0Bfsaf3U4aWI0920dc/RxP99bfYbrbYpqTvDwDixNx1hCfqEpVUqDNMzOGlXp+KYFHOJ+udGP0impd8rYQk2nOTeMeH7BKrO6zLgbVNPO7XH/5ldsxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753981; c=relaxed/simple;
	bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPjPhQOUF7ksZ7tspm+8so8ldAMFBdRukUQlRhKotbXB0Q0swLQC92UCapS7FD9r8+MZz1KCPgV/K9nolvCsOby/Fh7qHkLf7Q/YkgFcUdLdBYA0PCuLAvQ4dNU07w6Gfm4y3oz14uiivoxrQb4k0cf26cmT01df4K4ELxbRhRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKXU1pl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWiAfJcM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKXU1pl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWiAfJcM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lB7M3102729
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 04:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rH1aIPieBsj/Nd4+aNKiR1Bo
	k0SetKXp/h3famtzCNQ=; b=VKXU1pl3f3oJnygHRfy5/zI1H1lGWcQI9A3aaMlM
	AQ33hb1OanlXpvXv7XVTKJqdsV2M1Bhs02mjLb50dBcCCwBaMmgGF88iaPGzLOJ8
	g+qGBJTpR9ItqET0ROQKDv0/dRazKtThyxQ6og7q059OCROQIWSkM6PhxDeyejWO
	eFbCgLY17anTMw2TeMUSnOT7YsP/Yt7RcYCwYCjS19OAgj+z6PnI0Ge3QhaBrCbU
	sPex3n2e1uuBK/hitm/jMkrUDvwnTFaY+fzVkjzz/s0DpLAfTZTtQrPhQ6J39oXP
	oOlkF9iePmncw4EdpEnYxS9HGr+pRo394cA9UH7Ne5k36A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vcsng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:06:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso3727429a12.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 21:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753976; x=1789358776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
        b=JWiAfJcM0PlxfF9M9pzwVbtqF9niFqyCIWAyAyi4whGJ1GpDcOXuSRUhOZlT2Rmc+b
         8KHLgGrnHl1uc0od85TzQyIaPi3boVhnYyU/SGbaZHTReAKekrzWdVeDFdh25/ZTJJY/
         0/Cb13Cdr0ep1oyfmKbeguoYVeUdPAI0f71Pldi+Ju+5EvAkncBJE2cud6I/7adAlPLx
         2kMfHYsD/loGwpeKPRjx3knmcb94W6C/RjhVMi8UBoK90Fn/Uf1s3c6pMJI30xrEm71R
         u9Oc92+Xj0PwuUVQIFsowXxb1IIlSGyt61CwR3y3HqU1Av1Pm2i57zk55lFp08mga0oC
         sA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753976; x=1789358776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
        b=fLm5GANHUuiwbVX/pcNSkcuL+cSYfn41S5eRrm9SvxvjnPCKEh56EojQOg/zwqQ4zx
         F5HTchydXUxY3MzR7SMj9+C9UPKxkXJFmM+h3uZKbSH4AycSN3ZH/NGz8r7IPSX9cfSx
         kv+jXdH+L0kJ1ZKi7MkQ9dsGtZotqukDUJeZKusir60gWIA5i4tb0CuLHROuP7zoSZB2
         fRkYbm6tUeJ6nOAJb2ym7+ucV0OxbWQ3wrM77J+mcciCePTIHowf9iD7o3ok82ny0uRi
         TW0TTLeFLnSVGDayRV+RXtofelvU+8s676Urp5izzyw7hwG71+B3JYjiG7/GV4WbvI0Q
         yTKw==
X-Forwarded-Encrypted: i=1; AKwUvBxDO8X8LtOldkBv2+BXh35qokDdboaVilvNyifgIAUlfSppJZOeo3fN5uLP+qrynQGv3tqaeMMu2ikF@vger.kernel.org
X-Gm-Message-State: AFuF++k24LK+Fek+FqlxEe9tseUc+RMjyo7YQe9Kr6yucYbLKQ39/l/r
	Gvb26+CKiPr5BWZ2VtPomMIzLXDw+rVXBvyyprdwcqHpEI5DY+ouRmIGyWIMcn9RBlyRY2MUsnK
	bCKxfLung5dlCLoipGwXp9raoKY1i5QLlmuo71ry76s9ov+4QBsEK8oqC3FKQxBHC
X-Gm-Gg: AYBFou3cyhbk19g3sVSc5TmeO/PA3B6BtMls3CxIV1rk/5NppyFyVv3MlLAYZMf2N0g
	BtEHZat35BlbA/n/SLuOooK+kuqWkcu4SFY8kL1W6/Xeifh4nOlqkwC/50wBt1ELYjZ60esSE1V
	3cb97nYZj+fXb9My7c0m31LveDPMs/xp/Bv6Bu0IzFGTZZHFn/rDoDYeEu4IQh14oX2sz9O+RYE
	wTszn+pZG3bQxJjRlLeAnMY75ZUopsdFKZe0BYqB9T+kfHZfnYfuBdTXAPmkpWcPmAzvk2FsyT6
	mCH0KjsbQ+Tw+XLIFY73PK4PB2bGnkc1GhaLiO2qKSZSRAvd7wK4XuhncmUeQXHC47mpjMgXQCD
	9mh100f/9EuqiG7OUxq8hLJnPPVPA0b1+6cqyak9D8yvZtPPkcW/VAuW3MM1zyl8QQPzogxsc8r
	YCnLeU5RR0B3NxHr5hD55IhoLP3tdFQA==
X-Received: by 2002:a05:6a21:b84:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3da39eacdedmr31469482637.2.1788753975957;
        Sun, 06 Sep 2026 21:06:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:b84:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3da39eacdedmr31468840637.2.1788753970728;
        Sun, 06 Sep 2026 21:06:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm20112549c88.6.2026.09.06.21.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:06:10 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:36:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/10] usb: dwc3: qcom: Add support for selecting UTMI
 as reference clock
Message-ID: <ap44Ki0U+B2ctqeG@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com>
X-Proofpoint-ORIG-GUID: r4zN-WM_ddlNfimDuzjFTMNaPAbgN2Q4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX38GFZI7e9xd7
 soqi8zNT2KCNvk6O8obuXCx9eQ15b9DKYKMWkNCUIPt+zkiHt+4WWBUO7Df5bxw/EH99VIhweh4
 vaP1Ii+TNx77AhJJBuHGjZtoWr7j/Fz3Y/clcftxfUVWNS9rB0pqabwA1BhMV0aiK/Bj8lyr8Q7
 Rrfgmsw5FH4zZ2AU22fnSUY6bqE95dmCU7CsSf8BamEcA1O1iDy+sxobA6q1dIafs/qKydFUq1Y
 Wc+JHANMwzNjgcTc3LsdZS4MdZeD0miG8NKowVU7xmFGs/T/pVG0wok+fXIv0eVCzR5MVEZS0lj
 Em/ssp+sfSlBbKIzEpEg1rm0e9NO9QXV6/pgVW3N8oQ7SEnxSWBEvsNIEyUaBuVhoPhkf6K2sg7
 lptGXfL9Ea/Z9HQc6KQVXfby/2KQQqhHNZaH6rCOBHU9Si9rzQJaVVrWTjgjBxk2i8KlhrmMT73
 3PVtpXQs+qLtaUPq6Rg==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9e3838 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=JVfIVJ-FkFmCULzTX5EA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: r4zN-WM_ddlNfimDuzjFTMNaPAbgN2Q4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX3CoEV4mXi+Mc
 MvoHAEZe1wunUNdRAX17hlr7pq1oHkUUBniEEgyQmMbf8ahMjs09G4z0DS1plSZ6vIQYQvi8oQ5
 IgKFh0JjYnbgiDZbT1ie6fi/JHqLrNc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070039

On Sun, Sep 06, 2026 at 08:46:41AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
>
> The clock rate is used by the dwc3 core to compute the reference clock
> period and frame length adjustment. This is needed when the reference
> clock rate used computes values that deviate from the hardware defaults.
> Above mentioned SoCs require values different from the defaults and, as
> such, the core initializes with the wrong values which leads to
> non-functional USB operation.
>
> In Qualcomm chipsets, if available, the UTMI clock is used as the
> reference clock. Therefore, acquire the reference clock by name
> ('mock_utmi') and pass its clock rate to the core using the probe_data
> structure.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

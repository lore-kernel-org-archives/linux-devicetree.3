Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE823A3E98
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558298; cv=none; b=mjBLoicmQ4UTSlS7Vnuus//uR5Yg6VEMRz4sztWGSBNYaRuSt3XPceYBie0N1ecBTmlYwgeChGKuDz0n2EOVIlwjEHPMsng8+34YFI5Tg4SCBH1ZWmBuw5uEisEEPdUgsd4IwUUh0s8O/tqZMwRb8MNQ2D60XPJbN9xEwyWsJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558298; c=relaxed/simple;
	bh=7w/Cop/8rNMh5YXb1tw3zR8IZlpF/K6B4/PsyH/OZpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il7WVZb8BldvQu5u/2s4OH1b4+fwQgzBTW9sHR+EFoRJw4a27kUJjcfxKbjNO12uf140CDLLkFF+gthb3SdGVx5Mz3fwZUXm8nC1hP6NxnxRHF+b2WE+ShW038Tda3ClV/kdxt2ArUZ/HdbsPfR4/YzKBkdmkBFDaD8qKFZS6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YaoAd8OC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xora3GP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaoAd8OC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xora3GP+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R8MC2041417
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3JASRzJPlo+L0XP2XXFPrSY
	1nf08xrvhVUiRcRtrM0=; b=YaoAd8OCi9DqGPBxfZmdQzFZTBGOTh05ZV4pMxUQ
	nBWSDydWpm9WYRA2YudNwG8ywZuOH4YfoTvOG1jlIK+/o/t9gRzlBCXH9tfrcQpc
	ZjpCTSribdeK46rPIgTh70Slq3s/zGsFnQhzFfWIXXTRB6deKvvzUPuS1YQmpaTn
	LhtposxvL6rY6AqzNsz2NyZ8IVrgugMYY4eyLs/t1E3olgJQShZ1hooGalPc6lBQ
	XOmJdT2atBWdyZR+Efg+HEm96e8f0MLW2ORq+WFiWXTcg+k2xt+UlbrOXukSvPFj
	Ph4EmJYaGZvoy3iHFC7Vkb0UyUleXSQsSIdeeb5tvK2Xhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hhxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:58:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so42253461cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558293; x=1788163093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=Xora3GP+ZyvTVwCW6eqPDjBSh5ZJi2kQYY3ghwq5D20+xe7q19MveUo85EMhdZ8KeO
         IYUzNeyN50d+4Q6QET2+Y/iJY3opGQN9Sl1ac7pbPt+hoMWuePPGXBYr++593FknW6Pn
         rk+QX8hiHVEA+bbkpD8UzTxRLeITzK/aIdKvXuuXrRy8Uq7MKKAbv5Fh4raVcFD+3acr
         Dy0SzJVQmJ217qF/4H1h6rV52ONT7yIvQ4dZrhJtZ+PgMJUXOF2xOrgmZTRFxq0vwYyy
         heXH/AW5ZyXAd0OOjBQMQVFRlorKcdaPu9Jxz44iZcH8lqopHmwFRQAbK33Eqae6EvJs
         S6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558293; x=1788163093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=UdsG2fzdW6H12C4kuRBnxjfyTjCRtgndFNcJAsVtz4B17ERJRZOZstVS8AbZrCIGMw
         XoSH5q7LTcXu0hdRFDrI/eQEb3huMnQy3YOJSF5TsDHnWx3MC7yPhYTDOkyY4SwlhBTF
         zAFxDcvl1VLZ5LLL8wdNpdfZBXwkkiV2ne3rcSZt10JEXsJPxNLvXB7cuW/weImip1cI
         Wi+41+KTzDJbhvJN2AZ9620SkloUK+I4rUK1GRB97Kd0zEiZKrM0j/M0+/rI5gXc2L4L
         SmMz4xDj+lIaf4aXs9TM4NM7S6Fqj9qoZKl1tPEPek2/aNYAuYwRecp7ZHdGhQRHJKiB
         qwWw==
X-Forwarded-Encrypted: i=1; AHgh+RrdYzULsAP5RyL+CrX3v93USh4/KL0Bsyjc2botulaBUA4ZmsKZ8fipYdF11zmrijn98BvYBcXJgXlS@vger.kernel.org
X-Gm-Message-State: AFuF++lq169zbT+0DHJYK5SZOu3VMORwca1WsdzUFnn9LwQOafMP1cio
	RZtIkFePfHHUYvLEG+93ue3ml2ykA6DTeg8FqtqL1y11CBST323TTLKk3tDX7UpP+O/PVWBpnIi
	YudD3F1jxDG+jKhJ+6bPA9pyQke5uq33BrmZyXnqyC7K5aPwc0rJBoIWBEErEu0X4
X-Gm-Gg: AR+sD13O6LCowH8s89Vv8zJPBFsMiQ+1+OF/jc4P01TBsyw/Edm4EOQGyuBYnlUV1iv
	lRG8sH19T4sLSnsy+hqhRjv3RQfyYw8UnO1Ib2SKQ8qBmJpUujXuvFU8mIyoAtM0ZkGH8X0L+OW
	OWc8zqr9PPMGFiNWKZii6YSiABySR8FlCwAOA9J3CEyCdKlWzn5w4LyZdRqs5cKYxbK09fxsiVM
	TKnSdfE1/z6gTS0Fjgtha75pKYSiYGDlhReAU9xgEab/RlTpjp6k5xVbymteWcsHDe/yzvrRH+F
	35vpe5w1yR1/LOEipp8ut56zdmSFeJxCawkNR9BAblmFNi1b7YK5oypTnMoAgkmshNrGH2PUjtk
	1GUH5Rf1mtiBlyUs=
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269751911cf.33.1787558292498;
        Mon, 24 Aug 2026 00:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269751541cf.33.1787558291971;
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296aa0sm1198117166b.19.2026.08.24.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:58:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Message-ID: <gqmzboqh3njrjgyf3yla7gzmagk73hgeb7qt3qcg3afi64suww@4llrqww5kke7>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8bf995 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ugQu5lbr4eJmBGCNh1wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX2H4fOUfAi/qw
 sI13i1GyIa+kVfpTPu4hyNNm71Y2yYC29jD749UDteG4HfxaaXWA8l9tC5ZW1lg8tK/ROf8EECJ
 0w6XffyboAEKM/Y5+LVUvoV5XJXadCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfXy6L1pGZ//ruP
 Eg7ahQwPu1OsGxA03DUaZnhXtT6JnGSdT1LL0qn/Y1VLRwy1RNmovA8V6sbPr5r69vqVbuDfN+3
 zglTAw1QRBJ2OAWd617lj0ZCoGTEBOszdB/DiUtXY7Xp9DQQFxr2kcjf3JSMa5ZIvII1u+OHfVu
 +CiqyL5T+ZOd9AzWkZwc9Ie4yYpnVcdNStKQ+6FWgkeUYxMFbHfTm06PjqGrUPLPMTaQnSLy+4M
 n9ou0SCnDZPZs3NA1y1cjzLQFxKFhJ04h7dFCIoL6MIYUfdVGKX5CDlj1c4ohWW+lTn+74o171N
 0kgQrdiqfwkeTy+iQmvQU1mg12WMb0fBpqA8xYPoLkor/svLRpFfK0JX4xqDCrZ6yxoKhkwJInL
 RskTICvOXh9ltqZelzRzlxINjIgXsrzlJfO+SxilicbODL4/jVsZOuEaW8CoofyGF00noVXvbJJ
 rI7kJIW6L6ZHJM6NhNA==
X-Proofpoint-ORIG-GUID: tHyb9ta6OSujZBK8QX9PPm4034oVJm-Z
X-Proofpoint-GUID: tHyb9ta6OSujZBK8QX9PPm4034oVJm-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240069

On 26-08-21 21:38:56, Hardeep Sharma wrote:
> Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
> new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
> exposes CX, MX and MXC domains (including always-on variants).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

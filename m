Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C439E17E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557578; cv=none; b=VJGQT8iZE9EyEzbMDbWncJI3bcEhims9Lpds7PfOtfmqDbsEwam/vqYWO+qWsMM6Da0Hac2EJ235tIizy4NkjDFU96UwL0nypWV8oaxft3H789H3GXX4tP/j7QzJ7NorHePZJ9ae1/b+p2SRNaAxncwZMmlve8+8S2mgcRQOEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557578; c=relaxed/simple;
	bh=oHDdeDzlMyKWjdnEU5UCzfkNdo9yiXY2stBua2Rdasw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4ZQZCzK65tsi/a9LFSi0HXxZR1bzGMCHtbk0REUiqTF/3/udSNiDusAMdEqVYQeb5faq6w1iNnpxpFH42mTh93Podi7ZpiPpBHE9kklILbSu/nqblZA+3TlvVIMjTXnwWDv2k3yEFt6jKTz+vMXMdS0ly+13IXaQ7CQ6LvfvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebbm179a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtraYgrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebbm179a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtraYgrk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9rw2041444
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1UEfkp70xx0vLD/E4HUvwEd
	QnrJJo29zF4VvLZULIE=; b=ebbm179aTnExabRNo4ZQbYNeLgKwGWYOFwJVTYbe
	oqQKvsXbPIS8I8elsQS98Vxx9+ifEfmF2xl6pwR0vDpk1THK6e+KBrl2ngSuAuZE
	NlNcmveh9r3Un51vCDYyzd9prwusYrTg0ZrHqFp3IRpvv3nqvT/EOqmwRdr/jJ/3
	nITnt5Y0CrHAwJrnlowRDDzADz0VWXFHak9NEHJTYIxuxCXSLaaf/7bXXMiOLKV9
	sym8Elu4gUEqfg9qD/dJ3SRo/dhjM0+q8v6d9VtuK5t8HYXa2FdrnLcL4BUjZmvH
	Ak1AlFCYbns0RZO3jS/Lyo1Pw1ONdjoR5h4Rm/SrBPO0Lg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hgej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:46:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dd69b00cfso39469191cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557574; x=1788162374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=JtraYgrkcKsTYJncOuz6ucyu2ZmXE+4A32a8nmiOs3iMOIUKKQD/AdNPEmNBTHBDBf
         sJu1MC3PS9V0Vl5u9BEYK0aCyRVRTf1XGItpRUztssjQFvcCHkGXDMEgSDrTq8ZU9mFD
         nQE2Yu9PziKVgdNFG7g6flTl3rW1ZWQs7zGteeevloWzOnDZZhEq8lXrRuozN6NaE9Hs
         5PuYF8Sztx+cSmt3t0iTctlhKu0cj4wNYzkD/uK5WZFuUybpkYCmAMfGioLUGr1oaedY
         25Wu9hbMo5GGwqkS6tjDQ/3q254sqn9keOPUpa1yLXgy0mxh5vd/Cgdm20FtsXJgAZ+3
         oeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557574; x=1788162374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=ogvs4Aw05xxBKN12vjJ81xt4zV5QXmGvnyx8NK1nybo5BfqBmmgwQcF49PPSMk2Yp2
         XRMEDxwPsudaYw07Wo8nlaoEHCzvn1G211oUcivXLlERFkhny4D4e79Nc3jP3KMQ3VJA
         e9o5Z9ZkwQ2yFrbyc4dIpRs/ISzuxnf5qu97qYIltlaeMQxWLjb0M1TWI/3747NJOB/G
         5GEi4aIih2eTCM9S6XGAeqQU2eBKLU/vnVrgOT53FStmPo197GFC/FemgNyQuk/M203d
         EEFUBRm5p2kOKVh9XxMdf19ioWn1I5LKS8vRjebu6ktSut60ptBkyPpi6yg1hv+Nzekh
         Ldmw==
X-Forwarded-Encrypted: i=1; AHgh+RoIYG34Vp3Li3/I3FwbQvhGKWqsBPO5kANtciz0c7nKABDULO5uezbZHnyHnDKPdO3zlo11ybGAcSPU@vger.kernel.org
X-Gm-Message-State: AFuF++kGZS3Iwev86b0/QwR890s4lP0ri0hMbylJC9K6U8/hIZ91QwR8
	Ixj1rCcwJSwNlQIuSA/Xd6/3sp8xddpQpbBMJga02EiUXjS2pKAUG6ZfcKW8pLYz+8PAeXy1SCM
	CyPliVx44qpAU0oSF9QguEwRgTxk4OyYuMGbjmVBi9gtmPoYeip+YTyEi9AjQXRMl
X-Gm-Gg: AR+sD11GcfRIVXszlASnPgPYfYsuBpUHUdUZTbZ1jggJx6A9FxuUmbsq20RlXdtLnL1
	NWQDOfoZNp7zmGKV2BE4g8K2XYcYHHQ1xNtNgekOHVRdr2/w12Nkhmiwu3f2CQ9fsABLg//8EYa
	EHN9djqt1sOj49WDD9Dc15Xq0JrVw1DgYZLbULagudFaevOwXKMmDfvTUww3bua61cyPG4OVsox
	9SdA4blME6HCO6Fu17iSWUogDncafSA9SzH44WuO/sbsoC6lPyYw+WBDdP+PaAq0ajGU+ggil2v
	zCRGgK2UI8FK/sX+jaF6aO1PdHq51IUf/odA6RgF8KFtg0o49rQZGxw1Lus1PMIO+XvJ3ujDO0B
	KKGrhFbIibD6EtQU=
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846501cf.3.1787557574361;
        Mon, 24 Aug 2026 00:46:14 -0700 (PDT)
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846011cf.3.1787557573742;
        Mon, 24 Aug 2026 00:46:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9cbcsm1254309066b.29.2026.08.24.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:46:12 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:46:09 +0300
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Message-ID: <5gwqlrycd36aqu2xhzcil6rs55v5qbe7yshhbedwacq3xvaufh@5xi4z6xyhxls>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8bf6c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX/onjhzFW3d9o
 0yzRF1u7DLnivCkGLtqnIdpaAclEW/mrZ+lflGpyv/LOEbwjHGhGNFkjR6HjfxNiyj/pAEbkT2a
 Cs1/1SNA/6MrSSfh+l5XPT5XCwY5YcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX7d73tR/TrZJa
 +qpcufXvq/brI86XaMmQI6trJ+1JobSdK1APPgXuLaV66kDDH/o0w9b2fqXuoZN6XwCPaFooRfc
 N83kTWehLBnBk9/3xjyINIriU0CuOIuWy2wrsSV6jtw2fGw1WlFSMo14EhDMzont+c+V/UhExsH
 Xb/NbgAUmimiTq+DA2qkxXlfs6BNsCq5mqKVLdmKA/DYyac9snA+ChCcw4l9WWFVb0p3tc/E7DI
 Rh8G8K2k2vVKSpLqlAb1Og9BT0pwIsIQTpdm2oAwa5INvBRFrNkEgTS0rSjuczUWxELODBBrrfD
 3HGfm8fbjO6vbATNZ+tsqFjZTkzI1SsHL86VTbKzriHwSEaeh8IG4kBKKSfhy0EYDQpNbQXL7d3
 LDawM0pNFIrsvQ59GpxMondSKdzwQw6F/TsFgkMKk3cmchQqURw5ZOx/tAvoXzVtd8KYa8TbCRd
 q9I0uXodlJo8cByIlYQ==
X-Proofpoint-ORIG-GUID: b3GpT-2ogrI4g4T0qbl0qFEBswsaHNNB
X-Proofpoint-GUID: b3GpT-2ogrI4g4T0qbl0qFEBswsaHNNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240067

On 26-08-21 21:38:58, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

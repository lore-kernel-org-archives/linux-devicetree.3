Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79CE399364
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557266; cv=none; b=IzG5Wbf8iqDrZHnHdBurqoyINVxp8JWiBnJ8Z2ySiEY9apkuAIRcYCv+UEp+3oWln4FrkYLwmLmpeEhvPaNQQJiKf0wWSBq9hJxXgRfLYSrKI021dTPfWPXJytdCnX3X5JRy4A3kQhmrpvwvXvF23cxEnKk7svy2cM1TUDfFaPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557266; c=relaxed/simple;
	bh=7BYh+G7YBii9wdLvZ+tmlYcpEQFULmxAXTs13S8xs7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hB97w+OWgdRMGUuKlYSimFaMDaf+Rz2ZWWdzFlc7fyYCWO99GEy6WorPJ8POaRHVJBAmPdVUc8F51GaM4YwGce4hqIE9jhwFfLRoZzqpO5D4VZNhIk6IZMmi4v2/UP53Wrvt7jaKYjlFpHP41Isp/3JzTs3BerVSDtF77AraY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi8LoCT7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgbRxfiO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi8LoCT7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgbRxfiO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RJea3067035
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27aV82B2iwHpqeN6UcRflHNO
	30IeqGoP2gG6U77lA7U=; b=Qi8LoCT7QC+bCW8Y2IWJiN22jB6q9JMo+jE/HwLZ
	1NYR05hrm6/W1X4knaq/TtgBHPHYQYo2wtHFucITlI8bi88cn1da77bNqvxtiNe7
	gShKs3D8nA1kf80Aq0jRgM6HE4CJw3PN19jyVdDGamiulJPYzN961GiuqI5vFUuQ
	QNmBLKaFOeTUsk2vd6aXG9Mm/Qw7/l42zmxIzeNfj26JkM21P/JXzbd34CVu/6oj
	y/4K+Puzwcpf5a1E+fGY/Q8FD3N39JuAK6Yr1KuC3aAm4cTBj83gZtB8zQLMg5Fg
	iy6v6TT12KeEB26h7ucCfb6whHwP8q9AbimerF7Wa2KCwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphfrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:41:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso29928401cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557263; x=1788162063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=IgbRxfiOHztY0d4ZAqC4l20er3YPbJ1dXCPkzJpwSIHGLUNZyRjLwZ9D5IkB67mdjj
         Wj7ttgwzcoyKiZha5isPPq+ZOUK+LBSu0qlwRQvoUyigHuWBzy/27Gfvy+qQ3faABLTV
         QnAy7aDbCklyYZ7l9WitKbYxg41S4f6xUwfZgPFwZX0JIAPizFqOwB2b6aM2c4l4N9/0
         E/iNLiQtViCkWFlmJqGAmtVYK4y8RR/BaYyAqwNfxw35FvZHC9klLjRxIe0cpBelvfdf
         8azKrwCm7HwG9/mQckRRhzLjGc5FnN07K/1Muwy+/qa1EzziKigCCR4hmdHMLtEGwTqp
         ubEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557263; x=1788162063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=ThfgnP0iNXJCBhoKsiLuYAeTwi0UZYCBsAj3Q1ZgkMuMPNYUonI0oKx0xy9SgEmUcs
         nXdYCUhI6g/W+2snJLnlrJc79iLhvAcKIcolbb4ZsDcQ0Ti0FncF+CnFZL+oMFV71uis
         tqwsUWPKvrUshmqFkhum7m/fE33XxuqDLv90nPoew3JpSzycXj3PrhxowGxIthVCj8nL
         eEZsVhbRDLXuFyDkDKfd2nsTbYAXfAe50iH3pDFnf8stZUBr1OGLQ0QRRHkNmzcmA/9I
         dCglbs8J2W/c3S6U7FhBhyPw6NouMT9NJnuyOLnQct7hiIbhV+TNedJbIWKDVaaKQysl
         pJlw==
X-Forwarded-Encrypted: i=1; AHgh+RpSj1R641YoU63jZ0KVo438gh2y07uNgRiYpC0nCm7DCHeMyASWKLyLHQ6v9a+bBvByMLNDrgmUO6S2@vger.kernel.org
X-Gm-Message-State: AFuF++mJ9edPEHY0owTNPnHf/mS8DZ110g/A7/AE9QSwLREo0a+WImPz
	n4JtoEl5b2TmX3jiGRsznZa7YnS3+F5ZTWY08mJJTzvrzozyU1ni+Zmo4uXb0OtFnb9xeh2GAGJ
	ELZF9CabMIaNmNfMf+Xj0xuAHUGleiwM9QlODwdM9zy34MJhZ1hcf7ClWSpo9Rkm6
X-Gm-Gg: AR+sD107Nbm83FrS/SMoBYs7o4oi1/AHOnOEg316PQs5gH7AvJwkZf1dILug996NcXa
	QQyf5LCPzRbDEMMhpKYHFqgpBscxBY7oMpXrIIY29HjreKTku5vAPpOLAMnR86d7S/Ga2EfvbAE
	lqGK/Fzd4FGOv34amRFWNkaBXLYjpknJ+QuoADX31cGw8zCML9Z9DzpXBrFHZBCOcx6sMoT9YLE
	BxYTZhciCARXDNOHlCW1inXMdgf/JJl+SScjlTxDqyayt5hVAJoSJPqJ98r9I6Vwa+N8aQ9jZHA
	/ddkzkdMtPdFstq0tqDVMC+delH9ThL/aEfJEXWSupTrB/UhFK1XX1Yrt/S2b3wktdOfFZOuhAn
	JocyzrqxTHmNYE/s=
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786531cf.19.1787557262888;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786031cf.19.1787557262330;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1717117466b.28.2026.08.24.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:41:01 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:40:58 +0300
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
Subject: Re: [PATCH v3 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
Message-ID: <jvtygc6q3hts3vynb6jaivlmryrhzkifxiyiaxoghukkfbt7qi@ch4k4adkpdci>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfXy/bJfnsbnbtK
 WsfQiMNqVFJ6o+EZ7d+ypoxiIpXpcjWpkMaLuwJsDILsv+wjULi6or0rhbfZeqBBM4nHyrA888e
 guFJhtDfFmf5ByFsrRJfWthSKw3TEGyqDHocHqREPVHGhgev5WsgB6WgcYfc5wpraQukiN6mjB4
 Ev9YEj3K4Hcii9OAald80dLMn1IG92su2UTnRJsPgrOVTd2KwExqfyY/PPLWthgZl+T9QqaR9af
 /QMF8x1uvfJXHGOTXQn6wUY/RZRlNyHHM7EPCCO6pVbSM0lJVfJ5x/MLj5U5gPMMMKMyNfoNK0A
 9kAeV0oD9mQAYrZIb0GuVGLBg+uRLh4jOeJQFDNPrLimPC0lX7XwD7tchJ1HczranJpZFiuwBrF
 3dJIxS20wFhPX0IKbywDYGXNzQFD63mXi0yz9yG/WocAvo5fUs1eZfCOzVzs0AyYD0MbpNZPCnV
 +5jZLcf31lXRz/s8F9g==
X-Proofpoint-GUID: 83x5c1paIUHHzwyATPoBAPVB83du3FDC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfXyHfczB2iCypE
 66ng/fXh0X2t0deQ2yBGQkrznLPvL25Xk05e0B9DfK324Ob60mWHeOiycXOe6lsWL+iJMLvNjQe
 WO7PDHEp3abjVSxiEjaMePzPrKrFfYk=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bf58f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 83x5c1paIUHHzwyATPoBAPVB83du3FDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240066

On 26-08-21 21:39:04, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

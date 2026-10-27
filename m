Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098762;
	b=DHdAbTP8pVEFGzbyZ2tc6TWlk7VApcMaxWj7EuyiGHINtQav5Z3K0NiNrcIGHH1MyzBB
	 YTOutQFBVODsDY4g+MKPkE34ltww5AoS+4b0npjCJMsvVFvtG/mbKNCU5v4V+Vn8TI5Ri
	 M7ZMDYTYq7+TwAgwPvUIZP/dUs6EmNgEqbX07RvMSSdnDWqgMkp0yDSx3iXNjoeM+oo0W
	 uZ3+ryOdRvpCA+zz8LoB1Xo2rhc8PXtgZzdWMJZsCCq+3Jx6MPKr1z+9nQqZSZzCDSqjJ
	 /uDGwRncVO7uWrwzq5LiEHII5W7Z4H6ShoDdv6586482Xqc2044Zs7+9D770D+loWkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
	b=xHQXLiVLEYfwlJ9rIFbxYLGm1dmZbK8EBHbn1XeCebtshGpT7D0J8+JJVH76uQ0BDuSM
	 9AXHRFrwXzYP/ZiY39JXQDo3THMJZBsWo+eAYVBAaqkuTpoOmiRhDtd4eKGevEyJ6Ey5a
	 z8TgGbYl2zmOSfWKFeqJUaKV+ZnBtgYH74xUuwqN+Gda0yCONEuvzTJm/+R3B23htPNvP
	 QePNl0tdC8bprNKoySRF4un7grNq7sh4bc9p/3M8RcMrpOlNSTK+r69CNA6/4Xq5fhFya
	 5ky26yvLHYKZqfsCipIdsdyGIV8+slpLNCcB4FrwFOQsEglAlFmiyDLq8+8ESOsVkoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMBgYIPt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hueOEQT/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F88606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F88606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMBgYIPt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hueOEQT/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe9VL894501
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ykAqLoi1r7lMGwbeK2sUFMAR
	w3wZakPbFC2fhUJSl/o=; b=OMBgYIPt9T08DlmnRfVl6Gi+DMt6ReICnWuXECkd
	MBE7LkZ0raB+jlsfl8WtH+h+vzcGxO9v8OVBBodYX/wiPt2R/aOn9n5LNav3++IP
	W6Wa85taDipM9pgkzo1cjPrwGnvXJ2Lr4Vih5YOtu1ZnkUW9bSnnVd7DXalmFbi3
	Zp1YXpZuTlCKjZWlbePxsCCTglCpukctIPvppBeFpqjmPc1AWHq64ek9UMzqqDQ3
	BKBLgFL8YEHTHg6ZOu+SUYIGTXEr71oojboRRdLYw98rH00DSTAPiukDrjx5xc/s
	ZTJ0QOxQ5/rZfPoLR+/zcD2GrBrvaFVCZSIrSEE96WdwyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv44y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535131e4c25so109674411cf.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098760; x=1793703560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=hueOEQT/1f8F+8ejN0tfrj+PWmvO8rcKLox5IHvLDu/0azAYz84w1OuyRUxs7ylFA4
         2NBwl0ELm2a/5JONVpDPLnT22l/XbT/Ro1hxpUrvF5QuC4IWcX3W3wa/LX2A6Hh1LbAo
         zFIsWV1IFnHDgxVECn7Aw+aDjKcXGYnowOlxHqpoOdvSvh7ImFKgOlzoLNtav0NNZPfh
         tO/ZIVg6DHi47JiM1tCQJ5yamnTLuDw5SgnG1bpP9ytEX23JWNXDg/LUoUGpNlWwELa9
         45t/VZRAVoGNF34CRAJqiSNKQcN6l9aYTMcJKHb1AsyEeD+pF5XqLICTyksRVhSqfYqY
         hSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098760; x=1793703560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=JyIXqoYNFCDspK4LHTaVa3/S5aCNmd3dFFqfMJu+ejPC4gENA5ONqUFoTAdlH4vRFw
         tRmfh7cKbnwHT9Bh5cWFABgfh67t3zxiARoEF2PyxVGlaWEKjCbZnm+f5rrgugskMtGi
         8x6Hw42NjdC7QiNjaVFyiEhn2p1i9PIlg9aVyMCRX1sgZSHJwN00PWfCTTeozz0ucNbI
         tsKF2W+Ehcwnj317T+Tp4ge4NDKQrB62pIu5cZ/NWiflpyHpUdIfXTh2+V0Q1Yx7srIV
         9rHWORa8OZS0tez+quKtImWkH+GaMTuzg4QS1GnxqN2+Tki3RJcRMDac3FgnqNIctPLF
         fxBg==
X-Forwarded-Encrypted: i=1; AKwUvBx+zOGOiwR4l88jdve23yWOyWT7az/C3GjNWRcqpJP/Xb8SHcrb6tF7+D61FRuxVLnYP6eFO1nHwycm@vger.kernel.org
X-Gm-Message-State: AFq9FYJuS4o9v0OOsspRTdczKwDbhoedPT4PX6uc0GId0QFkonfmzZgn
	PpMKMIZ1hHovqE4cmoR7R+1ZnjymesSOdK2cnD3bLORTlTX2tr2o2Pr9WhU+u5ft1MHXHSFG3nD
	L9x6AksnoSXZKrp0s8ANj2xhRup79fO33pF9k6fdOfBPWBbHrWUQEYUntpFDzL4/t
X-Gm-Gg: AYBFou155ojx8suMZTbp/CxH68nWzPtaqMRUwjeqMglIsNJ2xZFvrMZhzrJoNBv3yzR
	DjyzeMJRERl9/zaICKdxM2ToxPBbcAvrT1RmPmZV4NPAD7a3bxxWc7bKenkOFcIDed/pG856iqt
	SPDrbwP6szwIs5AYSLX3uJh0l2CwLgQuxEdW1rFFLfthlO8VR6mHE1m50LpxVmfTle3e/JSivJK
	Q3S+NmnspOuCop4pBu5CvYjcq/5z6B/DRNc+E3BlGojcFPKlZxpi5vxw/5q0LnVgWA+hUlNa+GS
	15ko6hafuObyrQc8dTz/d95E7XxUWG+uL+oFjFOtOqlGq4pLtN32ah2XLYQv6Tby504bXUe+hZl
	gxn+oywuKsXXYqO81CBfbZAhXHqpi3OXT3hZc3BG9UxpTa7wcQrp9xAHwWx3w4Qee4g==
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740271cf.3.1793098760184;
        Tue, 27 Oct 2026 03:59:20 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740191cf.3.1793098759624;
        Tue, 27 Oct 2026 03:59:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm178309875e9.3.2026.10.27.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:59:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:59:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YCSh1_KeEznXlXsqV6FMLaCFRMniC0KG
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae08408 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bcB-52WucOyEF5bHse4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YCSh1_KeEznXlXsqV6FMLaCFRMniC0KG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX4Q/CPrgGUSFv
 fwI32O7N/yQGoDNtfzZko7IGKFZl6txCXsjAawHXv1XJPyuYZJ+aMJgP0t05Ozml0jTfbiuXlF6
 Vo5/dW4eVF7NQK4qWhAbAOXtC73jhqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX+Y5O6KI2wiz7
 QkDJEGlOtHQ5KwTrdiV6RpkCVa9e6rMWMmaxQTlTbvV4R6pUCtMyr5j5M2eWUPyN/pMi67CdSCe
 Z3gZeKUg/RHX5eN5L6f9l1z5UhuVcFF/7L76Iyp7PATUi1neTJc+CbKXPgFj913LflvpBHVOSuJ
 Kq3DSONlObPYPABuwa6QnxoJR0kZEeZuS2yYddlX7XM25VfLJf4ZFz/2mdISlAAx2dPmylWnGfF
 IRZd8EDmTpWwTVlsxQJH6V1h9mtqIovsVG3WrIzzo9aY73p33QfxRhcofvkHdGt0AJ2tM2VXigT
 CTzOoHi5EHr98YdaehLI9XTGpQtc2GgQKAJlauVCGar+2cQSa6vENvWOUzvuPaBEt6xv41zMCwL
 UzTdbMCpihSa46UCni614uqiHqgwJvnnlUMjXDolVkB07bwgFU9jClZYabZ6/mEy4TeNKVW1L6L
 LPGgJAS8WnWC4GjXFsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 26-10-27 11:23:25, Sneh Mankad wrote:
> On 20-10-2026 18:30, Abel Vesa wrote:
> > On 26-10-15 15:25:22, Sneh Mankad wrote:
> >> To make the MPM design more logical and avoid probe dependencies, the RPM
> >> notification is managed by registering for CPU_PM notifications.
> >>
> >> Remove #power-domain-cells property from MPM device.
> > 
> > Can you elaborate a bit on how the two phrases above are related?
> 
> The MPM driver now supports two ways to handle sending the RPM notification,
> either in the genPD's power_off callback as power domain provider, or within
> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
> driver to follow the latter path, which as explained in cover letter would
> help avoid probe dependencies.

This should go into commit message, I think.

Thanks,
Abel

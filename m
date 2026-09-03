Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460D142589D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421737; cv=none; b=WnWdNz1tWYdywza5+b2TdMJTHxqegFXtqYf/ZLaJiZI4QzOF2a+QxsPwFXpYJpiEsS8sL3EIQeth67o8HX/7aO46lxq/QmNOQKBDWFcXvB2TedRn3ftYDcIDenEw5z6EYJ4bX5LXYPJ2GMfpZJg0RlnM7f+YBGo0y/8WMhWu9l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421737; c=relaxed/simple;
	bh=7ijGiS2+wzo4PwNz/evt6IxgRjZZ4JMihlDGZHu76oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OE1SDYVthnycLF4L7Y6ttVILISN9khaNChuhxqYh6GlRL6lODbjm4bXWdYyrg3AFM6wuLH8UUseCrBdO9iegC2dFW3gk0IRfDmfMTHf8j/GPgQqGRR/50Vuv73xvkMzVxglh07BNpQLBFU127AtG6rvvd2xIZDvjzJEvsf0aC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sco4QHmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhpTOrxt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sco4QHmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhpTOrxt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lwrB4024082
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mz1cnQxwXtL2p1I+qlbL81gs
	7OQn/pzuf5bl8EXskxA=; b=Sco4QHmrz6tuR1a2suvlpCxvgAALq1WPq9fZogAk
	w9dejBQ6ae32A1bNP0zTxORjwMchVn2JpmtvuJryBDIYts9tcXJhgt9Vbqz/gVjS
	xGgVDqjg2knRSJAGwrLKgrO3PAQXJz7lFzOlbd/8FKaTG26NGKPfZ2O1ldVKFuld
	sjL2tmJow04q3AD3JUDm6qVGNFSRhg+WsbaM+lhGzirlRE0MCN7MfywdBKpahdiu
	wxoGBXADc6cNmJ8HappuKRxNICRRcFfHcRpn4LBAJDhTdf46AVWKK2jPhW1FcMXH
	aqfWsv6kUp/1yiqCZLyvdMchNWvSLXsCBBqJtUbYSve2Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc2bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:48:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso124256085a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421734; x=1789026534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mz1cnQxwXtL2p1I+qlbL81gs7OQn/pzuf5bl8EXskxA=;
        b=BhpTOrxthyntywDRMd0jyPZ5cclnf+O0oBxarbSTnp/Dk+NstJPQn/bhZrWGoQCBhl
         Aj+eIA2xAUlHH+9aMGPaV29i80nriLe6KQ5eL0SSSHNEl/0Oh7lpwna/wRASxzCKUW1m
         7KXVTfBVVLJrbPUInpR9QeSEMnxgw9ATy8uL8FdEocgvV4k/l6gGpps8RC0FOL9ziNXJ
         TnJDy4/gIpg8RisH90JgMtbZ3beaJsFk+k0SSLpFoTMQJANVQH0BF40UuPmFFJczkDW6
         YIRAcR4eKDnFjE/PhDTOUscNmncnF0FU82NBpQDWHlDS1jV4lEodz4brTkTjq4k8YavX
         cEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421734; x=1789026534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mz1cnQxwXtL2p1I+qlbL81gs7OQn/pzuf5bl8EXskxA=;
        b=VOasMDqrjJr5gabrtlq2Pcor6BxWmGenbbl4DHNEW+6IGDYM3A/H43Y/xDRRU/qIYK
         yOdFk1huUUekoFyVTGgRjj4/OOlndaduGCsLz1Yme7BkfmGZDAZ1aK4qVmKIDOH8Rcse
         LH8GByEwNihNf9Ied/dMOz1NcPZhxN3jbjPQRb3XO91nmjdlJTGi1MHS8NPT9aCi5n1n
         lVlekvXfqoAZAFYtDDj3jI85lBIkLhOA/o8hB4UaMfe9CqeYnRqn5C8aC3GLxvXbAgOI
         ++Og6+Znty12O/Xc2RaU+Zg/y27Wnko2TLyOU84y6jjMPUZerM6Fva+W84TNIWPi0f3V
         dcgA==
X-Forwarded-Encrypted: i=1; AKwUvByub8ggEoRiwLbkzGAbbv25BF38o7CexeNHGEOPeiwbZAY/Ln3L6p3hHs5f+g+T0Y5K/GIlVvrDHmI+@vger.kernel.org
X-Gm-Message-State: AFuF++l1QsTe7qyb/lB8Dk62FWW9mp5RuGHvnT/AeGzdjnWK1YiIiMbN
	eefq8GJyGjyvWCF64o1+DEFEyPEOXzAO48IlQlmHoLWHEkjYoTfXQgSIBc6GPA8UbTMO26vamTA
	pLt29QDZroMmpaKwcyBkp14rghEDAjLiiOu9Xrn6zIxAfvDsxsXv+MLCupjvGH10W
X-Gm-Gg: AYBFou0Ki/XsCU611mBfSvDdfLyjVc63GGw2btWeA0i5dV2NSL8hKFguJfeMdPhrzdv
	uMsmdGPxGNU5GWdS2X94F8FKw419lFbQFFbqTB0M9vag0IQRazewGFDhUDEHfUwq1b6NssN+T4i
	FJvPSWkhBmlweQzVGyLaFzV9SEbNW+di+nsR4QJgqb6tqzKrSFC1ljY3l+0Th2jaaAVyTF8JqMt
	jxx0eNaSbD+5n4yI6NsOeuZz4WAbdGKs42pS+07LCqI8E2t3wihfYR3UuPJADstCJnUhGYERNSB
	gsGYr1SJpGAbTiSzK8OgG9oh3rLDeM+cYgVfmHhcnkESWJP4KCjLwGgrsU9EiSszo5ld9Hpxn1a
	a3doO23CQaHP9
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc2mr145334785a.29.1788421734333;
        Thu, 03 Sep 2026 00:48:54 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc2mr145311785a.29.1788421729142;
        Thu, 03 Sep 2026 00:48:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm10924848f8f.19.2026.09.03.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:48:48 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:48:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Message-ID: <d6l62gsplmvzip2cdoatgrz4dy2ko2e2kqc7ecdfcfuljwumpl@lxs4au7jhoqx>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
X-Proofpoint-GUID: zKVWPBkdE0Hit6v7G1zhloWbv4fQBsgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX0s3h9rW30mvL
 w3i081SeOXD17C+QW6+rfbMmlND7cbHI8xU3k+5DrV0ggDcInXlVCa/bD9sNUxUYxakjWOOMI0p
 Ng5P5GozMbGoEJFKks+gr/87dEDSHo2meFxrFrmNuX2NpKtvG11qECDSzliPCcHw1F1Uj3Ke891
 Tw2H6i6SVzNwhNCUMKIokb4A7Net/zu5Mbc8vk2ldykHURI9VLlLq8mV2oMWyn/TlwKQ1k/u0wx
 vIEB4GiL1XI7k7A0qRNAXtgzhYZE2SstU9lbTXV7f2de7TGIU3FxC4eL8Uwypd5EyDhrrtu8xx/
 0Zx6SX4eQINMshKFUyQVZRi/suq7XlON9ZzvEHWc41vgGPtbXxHmOxELLzw6hUoqGvsOdsQp8A3
 9KwkimW1NvBZvCSRmGav5BvEoBy3qkyCvtB503hpNqA/oAy5FbWK+RZZ/mq2XeQdpY32LhHgNyb
 BNI78ZrQw0ke9ZVSNXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX4VBnLnoIUngW
 i2ZE5DviMxo1xM1CRNA0lhncMWCknQ2ebumahdAi+xpQ2SRWDEbUHnZC/OvpIkEPRAFlxrikFmg
 zcRvTvQPQcowzVlgTbhrG8r+Q459L2k=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a992666 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rJE1ynEhMgyPisKzH1EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zKVWPBkdE0Hit6v7G1zhloWbv4fQBsgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030068

On 26-09-03 12:48:53, Khalid Faisal Ansari wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Removing them from the reserved
> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
> for dTPM usecase.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

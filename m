Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EC0446050
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055252; cv=none; b=WNyZCUjbNQI7C1axWg+VHsd6WWVh5PHsyo85npsNxbPRqRdHs+GJw2iwoNNBWcvv7l6M9437yYaNECiwxVZ9OA0DH8k7oh1mEOOnbaT/Yvo3w7rKdh1rtVv+2EN2ZArU9yWNQa+AXziBNYdEcE0gkWAMc+PRFD1LExRSn+mxagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055252; c=relaxed/simple;
	bh=pT28VLTnN6oTqyjUQpAeSvi86mvUtNst48iT3ncZwpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcqO3l3aQhwmJFRQAGu5J3DbHWEEvurOC++kPStwgJOgS3deMNkd2GF9oflqcx4ULOdW6LEkVtE1Xujl4F6s87CPs3/yWn/dMvSlGSZZ+bLOBPmSKY9Mmzm8tgwFZDQOqfNjg4s5KE1Ix2BQ/L/LuvWazRngKn4MFteSNm2qw8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlojPCFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjNZ0T7D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlojPCFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjNZ0T7D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xCWF1640507
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16+CFkNGAgeFwZgp4qxyDtMVX6T+gcJkkNHWBb7Gj+E=; b=MlojPCFML10sz+jZ
	ez9F3H6RpIIgwnQ7Q7C869aOC6Worx0NvXOsfcLDvXpzx+IU9HM+TJ6wf1trLmFg
	vI0nxWo3T16gyUPtWpAF2NjUG6sEXVE/a3Jjvy3igsnA/DwarmBuBjA2MDh2J1dI
	mRLo7Z6iE2l63xvKMincG1rlBEBMDbmwkzjLr34aCrjFcuHU1WZvqdtipjrki0q0
	N9ync8pq49qLGwApNaabvzyYvpTZo1NwSLDn8ikZgjRbKpY4A6hwoFDVZGgrEBCJ
	LokP1pUF3GlzUL2EXmGX2TgP3b+0OmdaQXn4foaOroDHxmwDpLJvKntkQRxddQ7O
	T7WW+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhh7be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:07:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a04d1cb2so13176826d6.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055249; x=1792660049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16+CFkNGAgeFwZgp4qxyDtMVX6T+gcJkkNHWBb7Gj+E=;
        b=kjNZ0T7DrG4xBVPCclQO0n6MOkPv1Wc4XuVHjfgUBbY8n8AjPdpf/E4fkKt89CwcxB
         HozeR7hkzsF+ZIZ0i5YNuZSbV9Ekhot84oTbqFE+eXLhQSGrWXiJouPQmVyjj5s2oTvF
         LnERUpjiDdacIGktArvLc1QBF3WWZHpLgxIVdsPkpyKbBhP1XSelDM6BnYTme1uDQzyg
         nP2vuU5wUwxB6qI/B+0B211Srn00Wl2XdfVTWIpLTa/XEZDH+485gSQh94nAv4TLCh2a
         EBSqurt4k6lGvKA7hWGl2hmV7xuZEQMDwYHhHzQRWb3A+Lk1hOGlCAYZjzyko8vpA9W9
         HJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055249; x=1792660049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=16+CFkNGAgeFwZgp4qxyDtMVX6T+gcJkkNHWBb7Gj+E=;
        b=zOPz0avGPAJ2u39cK6WmMWcGHqZbbP4ugm0oJFbM4JKdj5aBHj46zcpoAabgbrd7g0
         6ErOqWSNPDV7hpagQOh/HIGheDhLoomNkzG3esLTyIIK0J/BKRO1KdoKu6Op7tMlNFRX
         GgmL6UGLZVVU38wPTizuL/ZCAYkiPecxrq1JQpDQkuOtcHA6zzuXi39Q35bJQ/+5QC+5
         oEtqxnugVBpkCSHv57ggNfWvUuaE83Xz1BMwfDKuqc7BimvYuaL56xAO+R0k6ogs0zxi
         R6YS0ujMCDk5nCxKKHOVb0zzJqrqAStU09OReAgRNRU68GxYOh2wUnJGHkQphABhZ2ed
         oybQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6Ud6RVlXKk+Kg1E6+tiaHCeC8KtD1wJyUpisVdYfHf5gFlRRU+wRhIKuR+h2e56ow48QqCEI0KeFF@vger.kernel.org
X-Gm-Message-State: AFq9FYJCHHDLOn9WZ+ZwdDkEXwTpI/5JSNflVsrTyiyEcz0GPfC9Axnv
	F1moxxCxoxwoebBgpfKRcdaNhEW4uJEWgQKJwy02oUq/eTP9RqH2SX0+V+gt0vjIBjYNbJBEcTZ
	ohTNvXHieRVdOl+8q7B4/+vZ5TtlRVhCRUwDySOn6cuvoOntwXkthGi0vtjKB54qd
X-Gm-Gg: AYBFou0iLl/ukmv1KXWuIT5qlvGMcwQxec9wGYTpntK56rzbTPUB7graasgI16zWskQ
	AodXElzVBoGuniHpoS44Oki3Bn1uA+rWjHduEQyHCK9gecoZZCfRqIQu6rB1jc5cYfmkuMYWbP3
	KxBcq+WFB54Xa2A3rmk6BNDSr4/KT4kyhcN6Iggt9uucaKKgX6lz+FkCr9tNd6ltwv29diakKoh
	bwNQ9o//jQkfoDCtGBetU59FPykUcyRCfxndr3jaeaP6EOjHxY8v++RgoF5KKF3mW0WDhXc3so0
	WhbLtmhuFRuKfrDNvxHUNwdu6/fthQRhORubMnSaIDH+pW7J0kCpcoBCLwHP/YW6gUzVvwONqdP
	z0/R3bi9HpXxh+zr50WdrEg==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3625341185a.1.1792055249301;
        Thu, 15 Oct 2026 02:07:29 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3625337785a.1.1792055248826;
        Thu, 15 Oct 2026 02:07:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b86sm2295665a12.3.2026.10.15.02.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:07:27 -0700 (PDT)
Message-ID: <61d16700-ba79-43e9-91c1-41185363eb92@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:07:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
To: Luke Macken <luke@phorex.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014234949.1730808-1-luke@phorex.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX8ne3pJ1AQ4iS
 nNkWjZcQhzhGOmsShqXA8UpSVkTDMSJH9MhB1nc6vo8RFmJdAbRWHOHTKYG9VDCVNcNE7uD9cLF
 HCySEcDl6gnT7bf5CjbTelhLVi4gAsCKQfZj1oL8XifXx9zLVBSiCPM7F1K4T53YNxRBc7NV+fX
 LPXsb+SWHSRqZECpFDMV6C3AHCXJ+xDxEM2gasv5l0NvwrdmD52RORgI67GFIdRvTPpD+bdddbW
 vjmq83877S+Mma4GpzcNC1+G8Ctg3t5Uqf3loCaY+IQUGF4pZFEUPUvr0SMr/Kgfvlq9mx5wzMV
 FizolRsRtEuTyD9UTNsDlF8kk96+NWgv70QyBonTTbGbyBp8/yPbEuqglt1All9MeszAiL/RcXJ
 IrCc0HDitihFq7omoyIyZ2QxlWrVAyLy0aUS3zc2hmpC5EMdZMUSTrudFSHjmT7F4le8PUTY9x3
 6HAuJPzrrO3fnQlzc3g==
X-Proofpoint-GUID: b2zA8Dob9SSgy07FDpvc7-TyU5D1Y344
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad097d2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mO8_gwkcAAAA:8 a=EUspDBNiAAAA:8 a=mPIaOuxEOtotnp-c5OAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX1NXp+XFbbOLz
 EVhZuyhXcXoPCwo6jdDL9rFj08H/BUvvMx4EId3LfObF21nH5yBxdeVzaFZrPsoaHM0DSR/2mzC
 zvc+axw61peTsguH8AHV2TLf99Ya15w=
X-Proofpoint-ORIG-GUID: b2zA8Dob9SSgy07FDpvc7-TyU5D1Y344
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 1:49 AM, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> Assisted-by: LLM
> Signed-off-by: Luke Macken <luke@phorex.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

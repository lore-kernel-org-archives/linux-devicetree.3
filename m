Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273A364EA5
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164107; cv=none; b=TiEwS1MS/oUJRMssEiR1IJRnEMFfSZzFnnRzRTKu/+Izx+Uau3kV0YZM5klyhiuW0IuHl7e5utv4WwNzopsjTkSqPASsq57ZOQai70sz4KhuYbtO3rJ4s/CkmCeF6LkdbWCVI7bGzXIQDbwiTJIqNiausKjL/NVVo+oRa9bSSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164107; c=relaxed/simple;
	bh=EqFfdWMLZ75/MZ7WYh37/a/iG4ZiQankO21U0rtRGIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYNElVTnl+qfnYMpwOhyBfRcVQ1EupFSpOpTmL+Lmce6Jym/wypVZm8UvCwYZtYrBPD1xAep3fpA4IVvqLN/FWOGNpgl83QeBoS1qGf0b+6D8CK8gh0d8gcBt3icxaxShIGf+sYhUK7aSku4B0G8kqBZ7+yUJC00KLXiOyrqs/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8QjI/w+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6hyGMJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8QjI/w+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6hyGMJD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GnE03846610
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PM0fS+lk/KoC0nDbUIgggUlzlD3UNjmpQw/M3rIgjVQ=; b=n8QjI/w+miGM/9Xm
	4Zf1ubcZ7N6pCnUCtF9Y88UuFa5RL7ErUCYo9CODievoVUcjWAsi0FqTLbjTG6sK
	mam2zq4iIncRziHd8T6sMozY63M/gagINLNrVFqCVzX8rX2NajiaiSqWTSm96I2B
	HvFENB/e/e5Blii6uuVmcjogtS1ReR0UGYxlCzepedLg90Nx5nfMgoDVLqb7uU2C
	UTL44HR/zV1j5tIO3/7XIYm2haFyu0arsZtNuJwJ/fmWGVqJlKvRwXOOzwtXoQv3
	QjKHiODpJK9bfF1PhgQno+//+lHexLb3Tjc6qQsJHcDMWX0ICuswX8q58GOCxZDS
	n0BEDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2955-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:48:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91550f68e7cso182039785a.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781164104; x=1781768904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PM0fS+lk/KoC0nDbUIgggUlzlD3UNjmpQw/M3rIgjVQ=;
        b=F6hyGMJDU93B/ep69VMBostzZGaAH6ue4J0ZTda0lWEdrckuLKwoaITK8v3JiQKdFg
         sXdY7TB1hQJl0WGI7U2e7zwPfmlJmsmFCg5CEOjZMnYuHoaHIu64pdhqxqGto6ujei3m
         /nsCON/gs6v5puOehACiTaMJLRoxap7QhzoRtnsp1a5W7NzqrVmsDn64JpJfottIc30V
         F0tf+vy2YDqvdmJeB5WlpxKS9fHg+2ZFcTo70lj6wRLHbpKSvzOjFLmB1VjfG+36X5o0
         7SoJIJ2soSmSN8pn02JuSuYZcygF6hwTUyYHUlECBFG1gkfW846Uhdru/bE+mviysQkv
         ecBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164104; x=1781768904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PM0fS+lk/KoC0nDbUIgggUlzlD3UNjmpQw/M3rIgjVQ=;
        b=kb88Tgd34MA9UF6rZW1RYHmlwajeHOC/WWEZsWp1dZBA/Ds3wOUCN4g6v8drF8pubu
         HhLQ46xSPDZJNvmViZQicL4H4TMMWS9rG8lTYIp9cwGWZC91lJ8frf31DsNqLVue2V/v
         uQgfV3HEV9Gg4D/L63qQ3BLu+XSMTQts/pLR70pHfzc/MAHZGb46yI1o1hhSI8vdOjsd
         eOPCEHXnn+ct+oymv1o9Q+RTeqef3fwDD9ychKCdXr2DcdoMcYxM66GgXCvqC5t9pMEy
         21h4ExQ+JoLjKekdNtVli57HURP6N4FCf2+EgxZRCrqXVAOzGbzyPWhk2p8t5qZR/USk
         nwFg==
X-Forwarded-Encrypted: i=1; AFNElJ/C5ad9iwuIxbTy5CweA+6910flBZCLeQZ1dZZGskxYO0fXBJQUkpbB6LL4dzW6mjcLFQicClDbotgA@vger.kernel.org
X-Gm-Message-State: AOJu0YwrIA5W1AJoFwbHY2brnLveCzlnj17L0G2U21ipsqzXifEDdqGV
	unhkasWnHn9d2wcGylJBQ8ktac6K07j0PLFEXKxgYYfmWleUquKukgW5ZaR4ZNf2UHbmJrGuUss
	IL7pPZalkG6H6cBdpCiCMu+k36kqG1mMXded6wqllO+IC+rbc0n+RLd3ukmNw30zb/pilIyLs
X-Gm-Gg: Acq92OFPEmVUebd14GnAerGcb/ameRZ38OxMUZI0cJPO5cT/fg6HNJec0K6Il1ObKlJ
	Iw/MTHF7Bcfpd3w4UyP0NihEtscS0HMmnpfNzjPfHPFhVPUdTqPwTpnuF9mtG0xWXCLnOjpIMIY
	ndsMUuvWZ8mP+z6WRe5XbMwFVmpzMqWarBrP2anHCOpVnb27Qgn12xoKto+6mVf29JqxYGj40tb
	WZY+E/nh+z2Gk6NTKv+Bh4PKDcCr9Wmy3WongQjN1+lqxWzsxOnnhtxX734/MyQr6a3brBvrtXQ
	1z5bArqb05KecoBSbsNVh5pLCkX2/aMddaAetlg7/xilAnGJut9qh3bcuJZ1+4IRGfD1auw3jeT
	b/Oj8H/u+JhY74KUCTzLNlmFxGZiBQrSRW6IyGn6QudROziBsxDKKYZJ6
X-Received: by 2002:a05:620a:19a6:b0:915:7c1a:1388 with SMTP id af79cd13be357-9160ad1d321mr125854185a.5.1781164104457;
        Thu, 11 Jun 2026 00:48:24 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:915:7c1a:1388 with SMTP id af79cd13be357-9160ad1d321mr125851885a.5.1781164103978;
        Thu, 11 Jun 2026 00:48:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14edbsm23291666b.3.2026.06.11.00.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:48:22 -0700 (PDT)
Message-ID: <2a095c3b-735c-4955-a2e7-a8ff5204c457@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:48:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/37] arm64: dts: qcom: sa8295p: Move PCIe GPIOs to
 root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
 <20260611-wake-v2-23-2744251b1181@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-23-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a6849 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qQnc-EaX_wiEaOCXXosA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0jAsY0-czYslz5fx3fx8inRFuZjLrvXh
X-Proofpoint-GUID: 0jAsY0-czYslz5fx3fx8inRFuZjLrvXh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX7kZKpC5EFy0x
 bqY2kOhPL03ZyM5TsC0Qg7oNss+WEibPHx4US9yFsW2e6naJHyNFyZKAKZmTE6v3Z1Mi6SScb0s
 VQahK2VrO/sMiOiVs2kDmSGNdW8/yEuCB0RH6zkdcdrtg1iQeEVHzUjM/CGeDtHCbKCwT/eVfU3
 PvA8AoVLwDXCRdgSeLY8NYkYapETrV9JxlNDOPD05T3mT3cc4jvE5iTFT/hxV/VRrz6r6Qfluvj
 zd+jiK6ya7ypFT5XT4iJ3cs2y10jd3t+KEdZrbvSqzwt6l26oSAteuPiSO3WSEAV5sFgjt4NrgP
 9ZqGFaSzmciVQc1yCtvaK4ZXhLRC7wFOt8NBTQLzlX0HzP5Wo3Im2ZFJieQPuW6P8Tj9vgqAgA8
 6l/6pUUonAvAKGGlgarTHpyCrk8WlEHfR3aFFmLoTJ7AMVsqIYuHINU+f6s+GJJayHBG3gYozhz
 d2KV2dEPZgo+50HIgCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX0OmSj0IVc5PU
 6k5VMxQ9JMIbt8y+QZ8B2sQ+XE92mGi2kxCcRn2mFyVbc49ZXkLJGumUYUQdrdjzsf57FFho0L8
 tOlFhblfrlliYAZt49Nv3BGs7QTsQsQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110076

On 6/11/26 6:58 AM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie2a, &pcie3a, &pcie3b, and &pcie4 controller
> overrides to the respective &pcie2a_port0, &pcie3a_port0,
> &pcie3b_port0, and &pcie4_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
> ---

The other 8280 SKUs should also be converted (and the phys reference
moved to the port node) - sa8540, sa8295 and sc8280 - they can be
done in a single commit

On a sidenote, extending the scope of your series looks "odd" (mildly
related changes) and may delay it getting merged (perhaps not now since
we're at rc7 so no more merging for some 3-4 weeks..) as the new pieces
may spark lots of review comments

Konrad

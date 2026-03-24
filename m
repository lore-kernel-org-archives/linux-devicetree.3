Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD803E6DF4
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334805; cv=none; b=tAthQ6nXk9w723+HgM1RvDeDzQmMcwYojrQW4a2y7VtuywkbnDBGFA5Gfp+C5M/G5EdHucSV4NaSfFXGwAtPA6+CjK7J3bD7yZXCB/pYgA/f6T51CH+464urWuaHqoZlLUlHavbARQrOBVb2nYLDQjWcX2kBaRhpE4EoBWtjYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334805; c=relaxed/simple;
	bh=fGCpUkoKe978LSwf7t4/v0KFGU2faQE7KMH2bq/ZRGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkOBEdJrCWblna85sNlimLcTgI1WbEfHHR/HQ7vrUAyoHcqld39tW1+ouK88zctM2QNAK6CLVu8TYR12T0AEbhs5bnzAq8Ij9OctJ4NBQKphvTALkN5hK9N7b9j4rAhdZfQY0iyixJpw5Mhk1H8k4K7dcrndeVIOzZr9Y2rrn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVV/KMQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJV6F2tp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVV/KMQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJV6F2tp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4k6bw1910825
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NYuTseJFBUPqV9MEIUKhKhNN
	lm0Ex0p1HsOBprRiReE=; b=AVV/KMQDJnKFF5KVNFnoVjFeVHROhH3S4sc/NnJ0
	6knmGD1U5d094hnnMmq3oRQoq6KLXM0QnGuTLSZt/eV7FNeLrvb/381VTUMzsNNw
	N2kEYcDnCVOonF7irXFFZ+ZGsI+bYlHooI7L50NRFCjycfGy2HvN4MlsWjeMRRnP
	SGROw1y2i00Xy0A3CqoZcDPjbzCizRzh96a1brtDJlCWQ0vvwsWZcohNNMnaUaI3
	QTmhS4MBfyiCV6zWWelymswgbeyWQcWaJ10ULuT48zlush+awXzs3w5lKdhXK4+G
	v5jvAzm61OThRUoDxnJrZ/TV+aA0UdohUBtdEgB6RyXTvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyt57f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:46:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0998a441so31612211a91.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774334796; x=1774939596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYuTseJFBUPqV9MEIUKhKhNNlm0Ex0p1HsOBprRiReE=;
        b=KJV6F2tppoMYpbXqM296bUqHd+HHAvWZIuPBmJpxrAiTOS4JHrrsPdlgeOEQXL4ZCX
         28MQ9pf8926Cn02V0Bdy+ZmY/vPSEIRs89sljy29MLfAmWMtzoyzW2/Ul+z3PcH03R7F
         fV/4JVAKvYv90ZyQDTcchtvmpcy+J6JFtpkiRMuMuuxucQF1g3z0JKXpQk+Akkk008gF
         sT/n/iZHI9SY5FmX1k382yllpdpCRAPFvShZzLLNHOiyxVQq9TIUBM/p3FgQJQYg6tFA
         524fJ6TA7OK8E/mWadhUzVn38AYvUu9TeBAjMqFnqVB+2XtPQMiA4BOEsT7676wJOB1e
         Z6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334796; x=1774939596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYuTseJFBUPqV9MEIUKhKhNNlm0Ex0p1HsOBprRiReE=;
        b=CTgx2jwBd9pRnAAguElNYssDk4c4MpyXaaWsZd8I4f5d5Yo4jn19V0A4lU3Zxl2UU2
         CxKX7qBakQ8z9Sks2RZvyAj093kwsPp0pwCvX1xYlUIsibgWjLym6vPCsoyaLavZohv7
         4nPi+wPDjLV8vpyQaBxlZTsdgikoqpf9EL7mHiX1jh9V60CMly0YWN0ntPqKyoS4gnRI
         CYGKZevWd6dcMNZPuXBBbygsyI8Dnnh0HL8vXBoCcHlZv94hW1tvP/KygZTwj5azwXIb
         1SkB5FFVUZU3c2N8Gnl6t8lTcyjYar4c9ePhUU0bwoP1iiCFJCvSjk9uKLioZdXSi1g4
         P0Og==
X-Forwarded-Encrypted: i=1; AJvYcCWFwYTgt9ABpeiY/7UxAHzyEVO2/V82N4+N7a3WBaqQ8CbHF6FN53Ipr+ZSEJUsXTK2L1UCgj3OibRK@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUlCDgU5uefzNrheG0BTrj36+BPPWemiF1OO7Z5yDP8EU3aoh
	VmAByq91ENbHXRfN5pQpdtrEhODQAkyBSFP9b+EpjWIn1JGcxlqR+FRofBs8UiRBuGYDJ7ZHVy4
	ZaqAz99AA1oS29UXyB1eGyRot7rq91WITolwvhUNtxj1g8i9khxHfvIdR15JJtepp/vf27zrP
X-Gm-Gg: ATEYQzzj8af3GEn5Jj7btsGR4fUAN/XT/ptdWt1aMfBhU1nyQdXCkiOOUzE82wXGK7s
	B4++Doskx3QI5I9eTFJz57zVP4fPHqHDQVz4i2Dv15ob6Z7TfTP8isvrTaiZL8+vebTHKHhAJ6x
	dhvQIPxPhbUvm+GgVER/kQZiTgITMIED27iDimW2CKYqMM8bNyWA7DceIsU7vyHdn+bwmDa7iO+
	kIgOxGoq7VKvPtPjvE08xk91qCmRNpGzZB+Lu3cfsq/3jhg+O5z+bBL5seKuGbyQjK3ryPHiHSH
	X9glfLO+r1g1sXUFS42G693Cd7hhFKrd8RQ0jfjCxq4v8krcIPYBBXh6LoUcByG7WJMlSDRmxPm
	vlQx/S0K/oKiJaiz1DqEg1SYkHgwtlMbbWDoUUCIy6BGBphTT
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr12356201a91.23.1774334795693;
        Mon, 23 Mar 2026 23:46:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr12356175a91.23.1774334795134;
        Mon, 23 Mar 2026 23:46:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0314a191sm1437792a91.10.2026.03.23.23.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:46:34 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:16:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: Add EL2 overlay support
Message-ID: <20260324064629.ftmc5uc2463eeefu@hu-mojha-hyd.qualcomm.com>
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
 <177311073315.23763.2004308327563144008.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177311073315.23763.2004308327563144008.b4-ty@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA1MyBTYWx0ZWRfXwa2IhKe3BeD3
 H44dBdGatBQen7bc9u78SzP8OKo8mk9Uzyz+MMioU2Ec8od+QSBHcHVDPvnrymlKr4amruBkm/U
 qqYijHBfJ0gqCgihg77jcYFLF3FmSToN63f88cutEWbnz7VA4LTSuCcKcgmU4+fst7YkD5KB86L
 jFNF0BJakSCL13V1xg3VPg7zKkBiYeF58kiP7QOH8iLXoP3lXiJMLVLhUDVtvVkg9fF7UbuKQ+Z
 OilHcaoU5OU9MenOq593eUKEZgpyOtc1F7qZ7DYyPrtO5rfZvVqX/7ToPRQxeKXOHMvc2b9vLQU
 4qSzfKp/QU5pxiddC7cI1E+KSw8XmEi20qpA4Qlj5JAStSNVReymUzauyUz2SMJdpCHZjpk/vCo
 g0eIBGZ3ZywXvMYR8rz97W5BxUhtg7O0aSA/LFIJnlTrBGL/d7aHjf7ogDKDaoInvGvpKuME7ng
 RIGxakr4IUG2xW5pV+g==
X-Proofpoint-ORIG-GUID: yHMn7snBH5uxDJ4f5vIWGydHM8myK5IS
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c2334c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BaCGQVPK2KNeOlgyhCAA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: yHMn7snBH5uxDJ4f5vIWGydHM8myK5IS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240053

On Mon, Mar 09, 2026 at 09:45:41PM -0500, Bjorn Andersson wrote:
> 
> On Tue, 27 Jan 2026 17:13:47 +0530, Mukesh Ojha wrote:
> > We have recently added initial EL2 overlay support for Lemans and there
> > it was not disabling zap-shader as GPU changes were not available. Lets
> > disables the zap-shader there. And in the similar lines add support for
> > Monaco and Talos SoC variants as well which support EL2 configuration.
> > 
> > Talos GPU changes are not merged so its overlay file has dependency
> > on https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] arm64: dts: qcom: lemans: disable zap-shader for EL2 configuration
>       commit: b3e0db9d8ec0fbb7367313d888b1bc3cc32cdffc
> [2/3] arm64: dts: qcom: monaco: Add EL2 overlay
>       commit: a3e3203d04e6d25bbd2ee678d82b833af53461a8
> [3/3] arm64: dts: qcom: talos: Add EL2 overlay
>       (no commit info)

Looks like Talos one did not get picked, will you picking below for 7.1 ?

https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t

-Mukesh

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
-Mukesh Ojha

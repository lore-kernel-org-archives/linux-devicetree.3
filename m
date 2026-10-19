Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5D498E0E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401060; cv=none; b=kNqyg42iRz5x9sJrri4VPfyH+GbdFrboumP6wL4LKawSTNOnNZIOlu+UtYCpU0Meb40fc5E60Wkn4JfOc0G8vbgjEg8i3prkZCQ6tlmyP5vaHExJl4KiwfcOvAi2vKXPCV7kYif3uxt5iU37IBmpEDMv+rH84XZfA+n7JU5/98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401060; c=relaxed/simple;
	bh=gcdwFaJgb3bl745WlPsLEYzIlu37uAqRXUzhv/+8Fp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pf7ekbg/54HdKreFRyL8FNTGfugRCLCFDAD2KFYzvoBX7rKiip0jZ9IukWMkfKnp4Gw63BwdrmNF5xP9+F1z/R5PTlKrEwNYV12B0B1OI/bBHlv5Pkv4SUO+DARaSBWc3xHcAVH2xSJLYSEKKWKeAk829usD/IYxW7IIotZQIoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty1RSPF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lh1CtDQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty1RSPF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lh1CtDQP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PDtk2193399
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=; b=Ty1RSPF4gsENtoNF
	/Iklvz1AEoIc2j6ogqpyjHcxL5o6TOs80/FqxwqECUhgXNGw0A+swQgjkgTYGsIC
	0nssr+ifLUlnzkvShc04V1BIUvYUD2cZmVbRxKJm8OIZOsN5pkKlLFTrn4+YXGGk
	tLXBkOV+xNLGko3o327qKCk0/fsdfQD6Cy1xm8JrTrnmoGPbt3IcdaKt2Zd5FF/w
	nzZKOkozyXpHUspnWy9/ZhcOp6zDr+AXS6Ld467L9QL+aMGzq5ip963fx/s/GNM6
	caZBahHTYXKCwI0fufHdYiU1CoKExxg2qmN3wwnmF4w98e4ncyLPao0uQBwz7iq3
	pbnOLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w19y40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:10:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso7367601cf.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401056; x=1793005856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=;
        b=Lh1CtDQPPv8Z5hKaaLHl6TSicMFFqGp7DG3X4V2LcEJou7+YynNL0y3tUes2A3mT/p
         0a4i/yHFu8MexAWOktLe+bifNd80p76oB+LOEYuiNOBq4bAZJdXpeMWpaRXfXnLL5FD/
         jCLym1oTJOxpag0lsMzrfBlJWJmV9eFuCbebR0GM0s0jfn8SobqtcSIKajZdMUsbZcPD
         XapwJLFDeeDD3SSpRJglV16wQ91GDD/F1FnUB22ginMyPyfNIeZtlbpzSXJJw9m7OMks
         cbHPoIuy2jOVMXVu0Dh6uiseMk4m56tke834uMZE9QJLXm76mH/n4ME1JfFlktSWJrGp
         vfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401056; x=1793005856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=;
        b=m6JP6N/KCmeFAUla7yedXKrlhpLNJO5+cx8T4XopcqE14o6CymXIc29eDa6cQCxrZq
         PNUILYgOK/Ajb42nlsuXgo8YDtg0o96jMu8WhMwxPIHzKGNdvc0tP+znBi1PqtPESsSQ
         ozq5BGtFvfy6gHi8JHX6zQMx0HZmv8hUH/ccjZOeSeq86W9w+Ut0uNkxFWE7qgoHa0AO
         H1L85Po500kzGbJsfiPXP/2pQ1Gb9HWGFA1i/LKHmBPdL+TuXw5xAgaotUoVpD00oOin
         vVO3hj6Tc98Eet66yNcLmYOCT47n2aMoBcQVMbjvDJa/HuSsd4LO4uibQZrmPbSMipO9
         QIVA==
X-Forwarded-Encrypted: i=1; AKwUvBz55csMwwrj1AH6MnriXQ8+k6gf9e7BvNYrBCyanINFOUIzwC/T7UKpRf+7IpSB+iYLMdIGUDwjD9iE@vger.kernel.org
X-Gm-Message-State: AFq9FYLtQkyvB4dSqWv5q5bA6l6LwkXDgrGq7KxNJfhdakKnbacERZVM
	WZWZ18mbgqYS1VMZSLHdbabCa+UUKc7KImOyo1bUSe1hG522rtujxd8ywcYLGLJtD68Q83xMPvh
	3YfxEgVA+THRWnIgKSVQog+fUonBhWKo0SxyXqg+qkSJhZPqkuNrFR2r0T6+u7JJV
X-Gm-Gg: AYBFou22BM7UdkF9utQic8ayrj4jiLb0//K7g5Nffun0oJ0ZcpFovVzWsfTIOh+3Jhg
	3tJDuoxN5PyVIwrYbJDlbpEgMDlG71968NhXOBwOAQhgt4CyeW42/zAYQY9JRjIX9TRUqXDHSZf
	BneTI2Q/g9AjjOPEjD7z2QIXR6srQfIPuA/mIKOzBBa6+ih9JoLcWozhL5uoDmZqP57mIiGI7Cj
	zJe8fUh3+kQDWaW4dag7LytMMHiR/Mnm3y9Qxaj3Io9ph0Yf8bS1aWGvgMB7XlQf3Bd0vEtIbat
	wTCcPku2j27NLZThOmjBveXEexiQcrLwkmkwRz8AvY7uu3kLX/miQ1ZoVDJTpdIyPBdbqOhhgW2
	ZhJ0CEa+pJLwdQXA607muMQ==
X-Received: by 2002:ac8:5e0c:0:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-53645cfd307mr122462891cf.1.1792401056180;
        Mon, 19 Oct 2026 02:10:56 -0700 (PDT)
X-Received: by 2002:ac8:5e0c:0:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-53645cfd307mr122462701cf.1.1792401055667;
        Mon, 19 Oct 2026 02:10:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm349444466b.20.2026.10.19.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:10:54 -0700 (PDT)
Message-ID: <3fcaf48e-7973-4fd2-8ce4-7d214d2a6191@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:10:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to
 MMIO-based probing
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8KOFufFKtYmW
 Ezgm67v5V3q5thwnmoJvTNkq9j9mtF4EXi6UDDTOLjesHeX6RcQGCrxliD3X67LHp090Xv/Up0N
 ILFrq/24hWfeHo1Iwcc0Z+PBdc9lzkQ=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5dea0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=l4fDSgpoRc1iC7w1fSEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX/zee5RHuCzbN
 p9VDBwPqS0U20ZIJkpH7xNuh8yobCWrqh41KwCWkpmbgRws0JJfksgm583/HtZFqFjIZmrws1XC
 AHE/CN33ry+Mxdpdc6BpN4XGgjgWSp2PoOV7/lqviiR7OUzMU7sT6mX42X6ouCu8n0I69S813tI
 Pi0BdK//OlO6YcmNUqrrraFD6j7WxzOMXVeBnGtm75jFKOjhW5Waxp7wLhq+yf0IjJnNIZ5UbAP
 vmiEwAIbBoF3mFrnWmvwoGoj2GaXtO3geznoTp1NvKjIUTcfgpoJnQRBLoLpmaiMkxO18B2Jh3z
 eER/gWMGb7OUzJcaP3tESy96+dSdBS8+TL/NlVmkBhfwHt8Ma0XbM26Jov58OqhG7BWxdoDIfbQ
 pb/VyRT/v24KbUA6dTkz6r+F1WWJTsVHd6Kt6wMqo1+zbise1V+HWRmTzop6e7EnVpV1HyGg5hG
 c4RYuMb1dm6jiPML7fQ==
X-Proofpoint-ORIG-GUID: WSJ6djJBKKIze4v_WZ4fjXRIvZQePo5z
X-Proofpoint-GUID: WSJ6djJBKKIze4v_WZ4fjXRIvZQePo5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 8:58 AM, Jie Gan wrote:
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
> so etm4_init_sysreg_access() correctly reports the access mechanism
> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
> 
> The CPU ETMs have a memory-mapped aperture, so switch each node to
> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
> its MMIO reg range.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

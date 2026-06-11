Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC74376BE8
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177681; cv=none; b=Ll+tRQgShcwGIBKjY7z1CfxEtynPEnptTcfG4vpEKXHGAhHicUKcrYBIrcRPR9+Bm+FHWwWn3vgJGrMqUlnWO1HI3aC5h9KEv3Ho4d9S1q8XUY6TL/mJTnkeDYPTDX3W//FM4QpSdCfRTUKtjXkB7tbDq64mL9Kd47r/bNRhy8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177681; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEyVPlYUm36qkhqxh7zOSvjNlB4PjL6nrBKHIQ54s5zv3/6q3mr36fDwwXMK5Pwm4dpPtZQBX9hts3ZYNajZiInAshvlFd2L9sQR6xxCiemJzghA/Gl9PCa9h+AdRXvVZb7obkFpQcg7/eWya+kZm5RSzmplZvP5xbUP/vbSNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk1ydX2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrCQRirc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk1ydX2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrCQRirc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xSnI174165
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=hk1ydX2fW2byFRS+
	7TEOI5TI2gAcI0DaNyzZmxj4hMy4F0zdekzJTP49Ok5Jpa61uWQvOTzC3b9sfj3M
	xhFzSt7kkCA8eIdIX6I7jeokGgnxlqxozjAnL+YEuZR5lOIyKJ6brrfi3fLpNjte
	H/bLQYg1PVQz6RyaiWVo4vu/sxotomuXrSok88rTOcrNQKsfSXeARDslrNiitIND
	OrN8qKH8DWUMUfuWKPg9AscNYvS5qHwb4gq2YXmHEiu58c+MiFDSQ7usT7oRE+WS
	f2/sqBo4LHfbGnVdmvjosThZ1IkSubE3ttoiqT9L4NIfUZyIO1XIGpDj7yTxm72C
	n15bnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb3rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:34:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so25951881cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177679; x=1781782479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=ZrCQRirczWZue/zxGQymlD8k5SQe4B5CfwUv+thfmEwY9MuHFd7Cpjraw0nJcwXOjk
         JTY2wrX1H6P3/uFVB+tIHsOhcqCwiMoQXVUPbj4gkm+F3BlsvDtkK16p+t4e8ysbdFZN
         290g/WR2J5wg+l3LHZII7a5B7c+5xvd1Yqj26yFu46NTq5k0YmIu9QJBXmyyYd1hh683
         uNKzilVneA8EgizQPKuQCEWROImDibgri0sjtZigrwlBGprTz/qD2lRtMAV4JYy7Bxp1
         /Ydjqg0HrptA8Eye5eqHxf2cdEqfuNcLLBU7h5pQCeI2cG0QL4tcls9sSBbns2d88Nih
         xeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177679; x=1781782479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=anLSL9lssk0vCWTtO56IaACZtM0sGK4gFVcMfmEaqcEFe+9RpmVTETs6SsI3l3K6YY
         KDg8nsCnh+rRsKfx0OiyOTlIcxu1+9Fdx+YNzqyk6/DH0l02DbG3V9kexoHrZzMfTyQE
         HXQE65cVtVdJIkZi1yqJiQZCS7+yZG+fRfIXL1QtqtRTrskHuBFmMioQhWdbte685fNL
         0MTFJfOi75FlyswrkvhXJvumFFsb8UthvVJWWLdPumi0Z2JHnqi9N1fid9g1WFcMkRPS
         IrJuYMu3O4GyBJRL44aMUJFQcmEVosuYBEg4ASgsSshOYmHVPAIRS2E+WXRokjduzTS1
         4/qg==
X-Forwarded-Encrypted: i=1; AFNElJ9/5P0NWPE60rOUOBhdbU5totgR08BUYxJ3/SZNFWs7JqlyY/AUlV/FQ3NsTJb1AacZULruWtHWVKeI@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNGWRtxfuSmcCXIJpZ/haxuUaukN8OuDkXUCUG7DnxPHCTG8L
	fTwG6GyOxfHTU7RZMTse3r3IgA1gMB0BVkpyxkDK/UT8XLQnqFR+AgVtahtuncAdtsREuOwAYvG
	Gr9n1ts6Rdf2F92dvavX8qO6PdqzA8LiQcGEsguxYaYP/A+f3RLCntQJUUEdH4cMx
X-Gm-Gg: Acq92OG/Wvts+mqD0NLedH/blnZaW1Ybpz16FZJnt0bxo8PP/VdMtCg2yGN3XxPBr96
	Rcq2IeVt/U82IK9AaRvqn637W5Xb+rm/rGAGzk4Qc1slo8ezurY8XgblxTTMogqWDnmy6m4FTTU
	Nhuf7q7QBujwd7kZh9IUi1RDawJaS8EbN2y296R+b0QS8uij68h++0xDc1Kqf7GPz9OrZyMWjTp
	VmpJS2+bhvlfGhR4XMKCe9tet1ZtxA42GzG9ZkZx55i6YSxgXNGmyqwHF57glgQNaqDftRQauKb
	jHTCU7e4USUvTZAqrzgm81ZhxwdLTBUNY78wY3dje9ZHBZu9ySNeys2s3/uWSkDnOhu/LlCGRwe
	jCnG2eNYLyyaJhDJnSf0Q1P87bIqEWyynU/1S94lNOzu6x2RjvWnIyoMU
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23346031cf.1.1781177678990;
        Thu, 11 Jun 2026 04:34:38 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23345771cf.1.1781177678587;
        Thu, 11 Jun 2026 04:34:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f1478csm54221966b.8.2026.06.11.04.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:34:37 -0700 (PDT)
Message-ID: <9eb7a44d-d3c6-4571-bb81-459035faffaf@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:34:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/18] arm64: dts: qcom: sm8350: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-14-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-14-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gsKAVq3Es3kUH16AoudTD_bowjz8Fytk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX5D8kAcjBtX5C
 2qmsS0pabdoEmiJQtebV8y0LdWH8iW1b/JTt4INN/ThhGU+rbdpMxNjEaX4C2z/3NdZz0o/5nWD
 4ZVdfVi+gQCE+IP1Ot5vEQ7n4/s4Nc0=
X-Proofpoint-GUID: gsKAVq3Es3kUH16AoudTD_bowjz8Fytk
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9d50 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXxK/K0kK4xG5w
 wuJwBiA1wG5hCymhAC+8axIMklROwXgmP4X2af1rQ5wr1fDUYn/9WdxIZoS9U+FkDLbsd8CaWRo
 OWxU1P1yoSoh1/udu3qHqC2guTpmpKVFPw4khtIHDO6oU+Gzx0wSzBn6ex/CG5FlwX4kQYO8Th2
 mTSxF9GCy7o+n5Tf4Bp1h+8C9CEe0AmsdN4cPUyujtHbbP8G+DPPomm1eCt3oX2qkT0c+PpxzCC
 5JGso/TvH7495AS3jTn0/sd0P9i0F98bSk2Abl6oCK4b3TuNbIKtjRpvDa6gTzscLvgkjQv/xYo
 9w2X9AiI5N5/Hr0WmJeErDRgX6dpmh7ORzRfoY2DwLAFuvSod/imdWuK22hfHk23NJ4tJf3J0+t
 leOQOWH7sLbsmGIvqK/i6FDNdxi/fljPEIRMjJJGhMu94DjE+pep+dlRGoDgPf5IceKLlkzC/kp
 CuNyrSNhqhKx6ATrWDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

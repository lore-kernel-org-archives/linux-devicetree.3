Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80069394EB0
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 04:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238547; cv=none; b=G5bdMny57YFeAiJ7p8AV9yJkTVyLaJhrJTEPzZUP6hfQS8tNBcBWJQUQn7OWA6UTzRYq13408akk72w2Gpt5I7hYEFsZttjk22nEa6yY55aY/ORRaz3EXeE2nF8POVA7IBFH6Lj3uhVrLE9AXgOkgCFNb9b6yuFFgKXQt6xVf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238547; c=relaxed/simple;
	bh=Qq3QPHQQplIj6vQL+RwVx0v0hCi7JnuK1p9NR1v+1HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9ZBtqHui2+XifrEBx8a7oUbkttv7yOsCL+W1HILZyCH0jpokeArGYG3v1H+BKHOXZV03flYYakGq4OqGlwFCgl2ChvLNcrL28GrLTwPMZZEeWjfoEL0b5hFLfh1QIDLhItiSdya1QpkIv0rpLuWMmLjh4PcXOltb3Ba8TQYk1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeNuPdkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OE5KSVAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeNuPdkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OE5KSVAK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C66g2534717
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 04:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=; b=jeNuPdkj9czCH5HS
	Qt/sYulB+z5oP1QJXs2uwCW5tjaz1/QC5zHG5zG/ouxsZMCgo/zFXi5AMzUI3kaW
	Tidbokmz2FhKgBRrloIaek3XOLVs7HFbdvIXr5LV0klebXwQGtgh0aTznMcRZGLS
	Jzq0L+adYfkhdzni7WrAvoqtkjqCH99MkXju/iRzPwC9CWQb9b/0v72h5jnz+TfN
	UJ977nI/ixrn2D59bRs1M8aPtdcCWQoKMKn3RO7lfc/ZZgPJSfHk2yX3a3aCWalI
	F2hyK1MP99EXqPY1s5hngemSs068soo91mr755/CwLObP3U31/5bGydZVkEjfuOi
	ZI/3Lg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76egn45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 04:29:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842446a3851so338562b3a.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 21:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781238544; x=1781843344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=OE5KSVAKWlx6vnVLft00DR0uO/adVaZZ3icZLORGW8sLQHJ0akG37TeLLTHJf9izvY
         zbNzcgBIxOUSjJ3jLngw15J+hUviYXnEDzlG2FJ3I9aMdOqzkp65nM4eXQyTNrsMOnA4
         i+hpiaJ0YPk7pwVNLQFKz2Uh29U/sb7dBWigsgAB9jQa5RjUvOibMf5JE+eTP86Y1BmU
         SLu9/Vdu1ogl7cW4EOGEt3rQPkkYlpjaO2QMDoKTetXORLCVOcXsPz6eG7rFYTdzJVYl
         y1DCZ0uD52oVyhZI7CKQnnDrYEAZcE740JfareTOaiENlDKDjtigYCHnRKks7EYsE6zS
         QIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238544; x=1781843344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=PE69xJ0hm9h3bZfR5TUOPz/YnQu/ONQfF+tVgFg2Z8fcjR0nqIKEzBIvoJeKuQqIUg
         31OjZQKdh/1CVNoE3xcYc9AOJhCLvIsUkm+C8aMMmxeIMSq86KisH03jHb5B2j3Mnv3u
         QRZcTPbbabz9h807031LMQk1t+dgP4jGO0eeTtdlYfdTRVZS7psjvj2+CX72afmewFw7
         0YbAoZA7ddtQ8Ra1KfzCEhQY++asvF4lTG7cV5K2HwwjBvyY6qiY69MnVSoI/tRXY6cQ
         foCpcrZKEcHq5o/m3n1hBL6DEmDa68dmgT57dcwrKbANGCZSdZG09RjMWizfSc1ELa3l
         gFLw==
X-Forwarded-Encrypted: i=1; AFNElJ8mpshhQCbWhC71nK6wM9Qlsca3ktIZA8RFcyKxQN5AuT1CbkZr7ceKtJIOS5prkU0j2cdTf6dihxM5@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEi8mMMJa8ffF+0OUOC0HhHLVjWQ7wZAjibIWp30ac/Ki6ar7
	kQ/m54qG5t4yNfVHFkVALZMdv24dmjTleYQMrv2j3w4uJ6XsHfEVJQbaPB3ZaAHkN+0qWSOFgnM
	ymiDmrd0WbiEEe2lONQNS21qCmqJVLUZPPCBL1ptV5ZKduAvWdjR2+qbgjHHhemB5
X-Gm-Gg: Acq92OG7ll11v+Z+B8O0Kc6Dp/KQ+b6V5mr3m9y59Oo0yk3a2tqrwbvn5z0BJwDjDZ4
	mArgOQPfHB3ZxN4DjIOIoE1ZkZklbEal7t0atNk73ZHpfpm9t5ojwRjyCrgtvQuMEoVjly5dFf2
	fyahseHRhTHEP1haFBUPnLZV//ew2zK/i1+bvsr93+35J4mnBtA40xSMegdgTsU1G2x9xjcwtnb
	IxtDyJNjRfVUIlsRE6TquAuPrW6PGXXDSvp+xBzcoHAgmhW8JyJI4RP9p87uiSXPeyJ5hf6dgjv
	3fN7c5wFqznvCvr8DXq5ZPnLBHSabCfJnJf9STvQcJwYTaNiwn45wleoPbWHPiEnZAwIu56TnEJ
	i30a+lAZlnbgVbhM/4qWeCW0KuEj48KNujdbmV+cjh98hi4eQDh8=
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229421b3a.31.1781238544393;
        Thu, 11 Jun 2026 21:29:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229378b3a.31.1781238543954;
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50e6sm711452b3a.30.2026.06.11.21.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Message-ID: <ce7a9067-bde1-4989-81ce-c5663a20ad32@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 09:58:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
 <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2b8b11 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OmvEUramPnncoLCXQdkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: BS5uWoAeTBw2J-a2HmNugb-CSrRGAO3h
X-Proofpoint-GUID: BS5uWoAeTBw2J-a2HmNugb-CSrRGAO3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfXyy/SKkDDMLcy
 YCVc1VnDah4izhvaQ4XY7Pu3H8y+3tWFe3opZtAHm1VIAPpvquWZL8zDSL4Yx8qmRN8Y+V6L3FA
 wKfFqrNZF0l26k6TvIlARzg/aEsD+u7fL5h+5ya0E78MzFfyBqPh/NTupJ3+usjdq6vwjKnEL0A
 vnbSnTiLVuklZHhaeuZIKZ9eTyfz4gxSz41wLG+PF2SNmqt17nWv+M6nKly3k1lt4qwj1Rpjmh+
 GTjlneQmnmkZxhhfbab/Ae9KHLDamotToBMQXfb1lTHxnqPqBxmX+YNJIfeqhFrSoxKYTS9BAyG
 qNq8/9cfam/jUUyaw/+jpolV/ClIvBW3soQB47bfDaCaipB8B/Spt1AG52nE0gfoT8eMK54935Z
 wv4V8KE/+aSUsdJp79776iNCJ6ytenoyB1uhHKSRvxJr6yomvLZ142M7hqUQljPHeYlEfNy8mKb
 iO6gpRLpUisDwdVEGBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfX5nE3ceDKgyu6
 cejzZ+UZ0ta/XFsuOxr6eXFqZoo7xj97JbUMrbXj84HNRMEcerq4LpQVxmCrqcmQU11DIqCwXid
 7a2H6Dpfizf5/Xx7hGesBqLTlkqDem0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120037



On 11-06-2026 20:06, Bryan O'Donoghue wrote:
> 
> @Nihal.
> 
> If this is the only change you get asked to make, I will just fix this up on application for you. There's no need to v3 the series for this.

Thank you for offering to fix this up on application.
That works for me!

--
Regards,
Nihal Kumar Gupta

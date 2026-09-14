Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5844E042
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388722; cv=none; b=jGL9Fg01AsDPIs60fwjx4/yxxV3nF4L9KnXOAcGYU4jhxEfZCsVvy1ScDFEYo5kt7HhoKiYc0CqHTVUIwetFB/6Db7Qz0IA4vI4yoG62cORsV4QodyaunJQMNoCvVk8JCmsYBIC5RusDNu9E/gBD00VyLyZEP9RyKl2mgwtY0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388722; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iu/iWhgkHd8iHexZP5vLFzWZtbHsxlCqGOim+x24V2NAdJ2iGSMnR2mA3b3I1JhDFYQJLDjYVbE2U0ou5HWAFynV5W5Kva40/dQoILjBe7vD9yq85WvcTby+iYrs5tTvF+3tgdngF30mWZG4u6/pJaBY82l7Et2+7DVNR1ndmdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2zGUWx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jq8RKuV2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2zGUWx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq8RKuV2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6Bg3793274
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=e2zGUWx82zMgo6Oy
	YYz8LezhLHZVD8F4TN6D83L2SIiCPTIzAkr7lbBu6Nr4NXpiS3j+Fis4Ynxp0044
	NBbpwjO8QV6Wt72rGGxzWtIBy0xPMAm0nW8ZQvTIgeWolNbJuvYTBeuvqf7tALHd
	wYPJFfhICCNCdRrNim52kD0t8/kL8zd3tN3DE97Tgj7+3ECcleh+u9yRouPrLyS6
	lDkfptHxrIJWZhLOOIjhO/5KazuxRCzV9mM2Gga+Vr/+yIsRlPVGndHLnhTTy01f
	YoeL3O2CK0SpREmxKIQ7HfBiqdmX6qw6UUrTcp9wLZrA6zUl6mnDFLvafsokNA7D
	JIRoYg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg135w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:25:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79812f74f7dso23713137.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388720; x=1789993520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Jq8RKuV2amWD+Dw5+MbU4m6lKi1wC+6WrsFqExYoX2RIrrl/+UpwFRWq5kCtQtoDlq
         j57gIo0lfNy3guvFZFIKI/OkkdVQWmD7q+v0A5uyCNoKBuaZhcURRfHjJUQwwQwHcPnA
         QGC2lPKxBjO4dzQloA9CjVVmo0vCBcM5UdrE8ezskzx5eQ1D4q2icGE7EWjwyS+g93Mr
         wy4+UEvwd7BqrxwK595gE86nLXGI2mNZdcB/KEPwQ+HgdXfII1Q5QPnzq1vpNjDaE7fR
         WuxO0nx5myfjN9iQYA9Z1Fj/8JKj2E2BNeu1w/BRgxo9YMxOymYijanNScaFjpxeTRnf
         glSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388720; x=1789993520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=IwA3hdwCDgBRMsI+nRTFB1STqT3rfgYdtnaNUPDlPP6Hv01q86fc8I3EmMXv+OFxTv
         oQBFIJLnkNmEYowp9OpB6oUY9vpim5zU18hodcLjw0a/O6C3aoaym5onISWl8BLMfd9H
         KIxo9MtbSSW1CykSQ25vNVVUaEszRd5JtLXVZgPf3tSUyVuoguwg7+DB6Wtf9qL2g/jA
         UFCYXHuwuwMBViqQQq45QuCVOfQaYzwkh0I74o+KrSWEgcFIQmpz/JX3fbHFAti/mZDo
         WQFAb1+C02r3fyNUfj26LIBDlL57c8awCP+SL+6tFM8qEpBQAt/akjSf+s2PIix02aG+
         MhWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAlfJ/+Bed73OxaTamxqJOAAMSweyvaOPKdHuNCVK19nFUp30Sq2Y8JF0ujhFXwFBqo4cfwIPXXoTP@vger.kernel.org
X-Gm-Message-State: AFuF++nWdiEUQGF/F+VtEnB8UXpSVdl8GfPKonZcMn448LXBPIL0id7t
	CvARQisDeIN/lcHB2bfJAiJPuP0SfxS3bAxlZOriow+u3WsQUEFek4JZrHXqqz69eaSQKdGswrz
	W+G+GC3uLgwxub7tL+rndduqlHe721q5sWguNQA72/goFR33dyjXSY7wIQQ49dvnp
X-Gm-Gg: AYBFou0jefqLQZkptgmRYmUkJCHWkdMuX/0t68CrW8nNQ6SlDdYbJFkv3f1oJC+khhU
	FFDtEuLewCYBl0HR0Q0DvMamrnuiIYtNV4SU1TsNQycB//K2fkc7H0Kn/cx13WW11X9FYEEdVAu
	/CBcd0jbuoIOlvi9UqFln5MJ51CA3BTQl756/cnbj2blAKJnk6gmaWpPT/ivKA85CSBB4E8REJF
	jDOc624vixSOj91zZDBYPjwuLcV1vGBIZNPToBs1QkpuVKctkb4lJFRf0jdKvsR8MBqo+XqZhwZ
	vrKIaJpd80efVh2xohvXeaQl67LlDFJpbYSlB0abs7XEgQnvY0Vi/mIb+N5l08TE1zRkVBG7ovT
	R/AUhO8aqZ/BJ5flpBNiOvA==
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219888137.2.1789388719987;
        Mon, 14 Sep 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219885137.2.1789388719658;
        Mon, 14 Sep 2026 05:25:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2440450e87.42.2026.09.14.05.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:18 -0700 (PDT)
Message-ID: <0b78a330-b2bf-4dc3-99f5-86850405a4f5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/31] arm64: dts: qcom: sm8250: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7e7b0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: JME2puE57VafO1W5P23xLL6iLQCi7zSV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX4M7pd4pOHHhF
 SuIs4Y/abwoXhZ0B4lXJ5mmbVa07jTGJBZy3yfCYzKHryskN1vneHXvKrYmE6/P+o0lHIHnJYzq
 dfg6L/2MG5AE40/78MlOn0rBG0kKLj0=
X-Proofpoint-GUID: JME2puE57VafO1W5P23xLL6iLQCi7zSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX4Ng+1hc2S+90
 gLfu3QsyYaVE0wu9ABOdbWqpEREn/cd7ODZJlP4bHBbOZH4zPVNczNnWuxb+uqFOkwm4FKbhwHH
 4sWXV4Q8FIijll1vyfYZ/tBjY94vcnzIfSa5TZ5/ZktZ2E6n74hDxdBgHFFv3GNwB++KJJ9MgUU
 2vATbsTdLuPfhCAuE8jTLIeZZMytnaVwtieOb/DnWN0JtlZOIP7fhKL/ybSRrFJwLofVtwcj4hE
 z3R+9Fu1Mrb9LB0IHTXcCcVGxChwW5SgAfx0y3uZbtJHBq1dNHgcSS9gF2n/dJvJP92qhgTZHJD
 A9dTjjiJYWsfJBUoy4lVbnpTvHdfTdaXhc6M3jD/2Hir5E8m151S5adS3PuQaPTRbcji94QJTfp
 kTG4Mp4M2UyT/rqaQPe05nqT+vbx2UcoDkaQVsi8xXkaBm6VtoRxvUmYyM2noburAiBMBCbekuI
 HptkrSmkVZVbkFkR2Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

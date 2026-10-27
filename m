Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082567;
	b=hFgNLkvycxXmKZ3Sx1bBASE/Em+FxqHddiA559BRvK0pUouD4JViMiH326w0ZAJJKRr1
	 hWdZwE4xflcbIW/Fk7+5Io/zwE8uuxAqnFaMCShKHDID/maxO87JrOFrP3oEDNL8ekmMg
	 q3hZvZm4o3zNj56xlXGcWyEFjm4WvR5Zcj7qcb46eL5BiO9Iu2R1ExCOaWsurj3ppSqiw
	 QuEXc57ESBm0bbw51jepceNDEsQxiypWUG+2qiVN56yKwaS2/7NGKv9yM3tx70+bxLkN8
	 t/ru8J0fUHOy4PNhUrQH6xtncmFShj3kbMPehLw8LSv+kowyGMA/WyixBQAwY+5fCMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
	b=IO4KU2cuP0+mgcAnot2hlt5aryR7wIh3AAHWNXTUt/xbYkp3ofko4FqQ3EvQ8tgKfSLa
	 qjLyPz+I2E2qbsEGCijelJ81JNJczRYaU/0pCuz2ePIIMINJk12PMoh4j6UVs9lzBkWSY
	 DOsrte7yQU66CCMsk4+uPdTeFqMWUpJT06Qen83QtepoDrua+QoRO+Qgxq7ElDbwEP105
	 fTlQS6kDU1Jc+hCqDFkzypucBlkWJCL7rjmejk4OZaKFMGo1vYu/QIk9ermwR2lRr07Gf
	 jtt8QDpOijzkhNtzEFygwMCBOUnj7UBcWqYudYGyyFLvQXcRFHQm+Kus3Hh7iwkP6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKbobUZK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nnld3526;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C7606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKbobUZK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nnld3526
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z6na2350094
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=; b=bKbobUZKdgeegorE
	Ynl1GjUhN9ePA5k8f3olTI/fhso3lM8IrDZIsXt9GWQqv/muihJOiB53p/glZMZ7
	Q52QQdKM7HwrqaLNeW6qUBV1Re024YbU/EqT4UXU3/KuEucujLAqppwB/2eqd/9p
	G7oLoAKqgUyp7OJJmloruE1GiL/9NPAzhvMmuXfdtgfeYCBPk2XxBph/D+7Hamh8
	bFch8a0jCohJfj8XZPzoaWCAp89JmllPRzu6QsoCkrLIT6b/KGfijSopJQ8usTGi
	uPAqbh879kGzTfR/5J7NpcJ2m0eQXuD4mTw+w82p/s4RUt4ODp2ibiGg3osBxWeq
	966rSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91930t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1539687a91.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082566; x=1793687366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
        b=Nnld3526dJYvZg2D0po+GwQiiq8RqPGhpH74W6AoBCgxZVAhf+9i33BPjzr3J8N6Gf
         bumB6iyvHwIhzWbEs6+iqz3svoAcVALECWookEdY1WZMAbrpRbmcx9K1Yg2nE6mkH2HF
         aLHuuG7Q361NtbUEridVBM3HeYbFLSlq9cJhJGFaWbeYaoHxMRp/KkzDEkHc3mDO58kj
         WQrgqASq6lUG0uVV1628ovWMXydzJJMFkdPKsCpX0lBQ5SjwUzilm8HfRicQiegg2aDI
         Wt+ivf8AvVCninL6PqKuKDly4rtOPcJdhexuO61wzIPwipqHtgjNxFgZUrpc+SnSoQRi
         xxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082566; x=1793687366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
        b=ftxpVj/wQZLfWErVjLB7JhODr0/RavBvvvB4ajRlImwlj0X9QkOuzqn5L8lgDHNlId
         YsqUO4fOHb4XBF8aTw1y0bLoZks5yQCcBy9ni9kCFRnCKvG/T2N1DbVQqFNPj48T7zHl
         TsFbRrBVAMrj9+1yNWaSf5jR7zZ1i7vDKqg0ha37CWmDFVmC+LOLPL6NuPTOOsNDtT9n
         yxwm+KXj32v4j/K/cyQyx+yMof33NkSStyf3X60BqGdsyY2+EDnJLKetB/5gZW2tcf/z
         kfATbhk5dAxdw5e2BvAc6esb2ENhErOU+CSk8pt/iZxyVHW8vh2iGMkik+wf8mFy6CNQ
         qu5A==
X-Forwarded-Encrypted: i=1; AKwUvBydkqmr/PiicAbUV2uTDWGCnfryHL9sARE+a1yaOeDvknF1nRcoMv3hiUPwocP1VOldpmtsLKrHG+JN@vger.kernel.org
X-Gm-Message-State: AFq9FYIcIT+nJN2kUTiBpY5hotIvoJTqX4hNOkxHlFXybIvDhFRMBzXu
	taqhqjZydnqFR3OH2Rxjqa3up0O1x9eBRm0r4kpIZnKc4YUnQ5qLdAwTG5g18uVvnPOVnZIssEI
	SSjWUfoPF2mZKcBIOgo/0QvPS7KWI3ChxKXYUa57mklLyOpXIV7qMnmnFfOkvYZFs
X-Gm-Gg: AYBFou2nxcXjKVRksPmwlbtsd+smiPoBQ8/fyMKjeOZjHJ75LjAK10fg/MArV8egADB
	dqL+GAePOYybNgKwQmV5FFfAStKo4BfEyDvWRVnWy9GF3O0lZVYChFP8QGZGDjE616vUaze3+uF
	YGC22Af7FarnsL/1Hy+DYjFRnCA6bxS8KvIkIGYzQdo+x8VtE415rVyhG6IEP9flqOL+0x0M1K8
	QnuwUPeX+IvajQJ96OBoOmWNQRZiNmb6vv2OOa+E56wMfZ4HPr3XYm9zs6QKfIggFGHgYuFFzvE
	tDXiL+EduxZKOjKGHkDYWbNPGFNppB9jfek2p1RkmVf4afujcISq1B/b7hBhVpyecNUGnxTKCLD
	RaTI+aO6vKndfRggdJd+1hLSN/Q==
X-Received: by 2002:a17:90b:4406:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3adeae6d6ebmr6442718a91.44.1793082565740;
        Mon, 26 Oct 2026 23:29:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4406:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3adeae6d6ebmr6442693a91.44.1793082565262;
        Mon, 26 Oct 2026 23:29:25 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404ddf1bsm2216463a91.2.2026.10.26.23.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:29:24 -0700 (PDT)
Message-ID: <34a17861-771c-485f-ba41-6bb2d539ab3f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:19 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n9-Db5WraiUhViyKX-tpVfc5e4UvGVMe
X-Proofpoint-GUID: n9-Db5WraiUhViyKX-tpVfc5e4UvGVMe
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae044c6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=X_4YwSRDM6R9hu7WxWMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfXx3dHtQz0+2IU
 r1Pjv3Z+cExTyYY1dotXs/3e0SgQz7i7TNXQTdIdJWV7xl/LONF05wJM8OKz6wUo0Pyj91QKl84
 Mgk6B2kRe7fknH/Zes2sN9XMvj6QDnUgg0nKlU3wfqQjNN/hrAAbCVGyA8TgYd1SW1kmgrER1Ps
 +vRX1vTlSUdT5rde1hcAFkoR3c1IAyurlB89fbWMlF3c0UWsI5P2ZQMqbLXVm1DHVwsrriK309O
 9lrCV3tlEyHrSDHh8UPqtMt/S/AUBSVxFetLa5wLiWVB6AFA3RUcZtthbjrJzrcxqPHpIqDSuR6
 k7ACiygEvj+mss2DAvg3FZMdOz485UyGsiTy6ENu1F+zpBuwhcBiykSMP+RBxGyvzBCTfK5gqqO
 kHNqpBT2FsknWCn3rjteH6ZSMYQm8c3JGbZoJsaDXRZ+X8ouqgq7xrWg6bWm8UnXHTJi12+vT0p
 WAy5Nkbl8JcQVFL1cbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfXy4IuRA+9d/E8
 irOUFqYo5uYB0PzE06Ghl83/l0T9d9mkponkTAbc9pNlc9JsKejH2PckIY2XjmgWdLvcl3zAsDc
 R7DOgq6LxFyfbN6PcIddUtQiYJYVJpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270025



On 10/27/2026 10:05 AM, Ishu Brar via B4 Relay wrote:
> static const struct qcom_cc_desc gpu_cc_sm7250_desc = {
> +	.config = &gpu_cc_sm7250_regmap_config,
> +	.clks = gpu_cc_sm7250_clocks,
> +	.num_clks = ARRAY_SIZE(gpu_cc_sm7250_clocks),
> +	.resets = gpu_cc_sm7250_resets,
> +	.num_resets = ARRAY_SIZE(gpu_cc_sm7250_resets),
> +	.gdscs = gpu_cc_sm7250_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gpu_cc_sm7250_gdscs),
> +	.driver_data = &gpu_cc_sm7250_driver_data,

use_rpm = true,

-- 
Thanks,
Taniya Das


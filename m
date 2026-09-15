Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D87B46AF0A
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463855; cv=none; b=gUbBqo+uLkj7Cnm/X4rLEb1EiI5SOvlkHlAp/ZGc5ElW2dOwlzd7gcoq9wBzQJM7v2beu4H/k1S6HxMqNOn0jrH3Ayy7PjP+R+ys7q04SBdC2thy/dHn5xF6uQi9peXz9+jfbuFcgrtlbDJ4oFQXHTSHENDN1DgvO2hqUxV3Xc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463855; c=relaxed/simple;
	bh=tY1MOYDvOTOALx7bK4ntWt55Mt0hKWZ8N7VKYioOlGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aw+GFJePslfr+Hpi2fDalH8GfJJesigv6w6P9HclOeUrZxHP1dUIBcuVjWSuVXPbB1RndpZAmZZkkG6MTru3Md4A4xsdJuFNzDMa+w0RPAqyEZAm2PR6bFEbcEstsLEvPMBLlRGVSPPDHK33k9bW0nlVdE4oD4hvbYGWQD1GcmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6UeoPz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7R9sLpK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6UeoPz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7R9sLpK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zhkr3126584
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNil/sGuVL8Zrqf1tjoBL6CeHg8YTPOAPR5Uy/3XI3c=; b=i6UeoPz/tS32n0SG
	rhoD4BTLwZiv9075Z5db/zfxTz1+u2SjNvqGicI0OA0JqCjmRmEltPvsN8tz5/jC
	G0mieEfVAkKx1wF7hbyFOTgQ66mlB8sKgJgBk9wlRsdlDQ+/yG2W0HUZ4xi8Jh03
	8WTEarQdWeZpNPjMRKZqO/m2C5eVQqOESgaS+zPFCwIXIywIkyF0gVJMqD1tpURm
	pA0f0EKEveX9utZgLsQVyRdVZm7Z0vIVLg3TdZItmlLp40gUk+WBPzuD1EfW2Ruc
	VEO4Kq5UUNlqSaOSVAKrjY+b0bUacq7GI54ddbgI7TuQPP+fuBEAJhQ9Ak3KAj71
	OqmlwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9unsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:17:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so8374822a91.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789463851; x=1790068651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNil/sGuVL8Zrqf1tjoBL6CeHg8YTPOAPR5Uy/3XI3c=;
        b=A7R9sLpK2Wx4ExZNM1eKKhweWcYcx0NFF1+vRZcXWpTCAfA4mndl3mVASYSRf8rsKw
         1uHvtN/WK4BCTHN1y90Ext/vBg9KYmwAiAoy9AL8D1h2KLwoGcNFaQAZ0iIewedckAjO
         Qi9DE3BSw+fhMhtTvEafGhrvz2D+whlicXssQEOvHHiAZpGp9FJzpsvSXsgrm13e3dAr
         8ueZ3Y8kAH4FH77m+ufbrcjt/kqAaJ7hQFXDLbxvFHcCfuybim2TGl08fXlNg+WFVN14
         z4TlpAq7cz4yhi3GlePUoQKaVC8G2KJ9IJBUzcVzQDXkMtzvgIEk3IR8vepDz3N0I/dA
         u4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463851; x=1790068651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNil/sGuVL8Zrqf1tjoBL6CeHg8YTPOAPR5Uy/3XI3c=;
        b=Ojd4RiXToV6Cd8t6dCjMViOp8YNaScojgDwjyy3HDasyHa4ljR1+HJH7F5n1v4QFeQ
         Q/KpvdKkvTGrKsX7bIsm7wolNA6KuLiDLDs5LYYbe+YWI31eO2UpRG3XlNq9hZ0Xy4tL
         wXXqwtNyXsmeujJWRtqMUe0ITWiebzMzMKHrzIlggPmeTwlakOBlY3ObC58EPjc/qwuk
         dQMNJBQIyK0bNRY2J8+5JqpeDupmxHxi9XJ9VQP6jnfN595vihyZkR2R72vOGUh2+Wgz
         NLI8cL5u9J946/Gu2IFrFNU9mPYSj4DS9vo/+b+i/fOobGvOIFBZDUKZwIjITXxpE8wU
         q09Q==
X-Forwarded-Encrypted: i=1; AKwUvBwiruOWdnaP4ItUFMc48HE/Q+slbelLWnAcmvS+OOOl4god88JAhGLQUFwjx1Z07RHGs4YctnWNiNqT@vger.kernel.org
X-Gm-Message-State: AFuF++kg4ybPQ6uoI5df6ESe58EkDi4MALHxww11Ki6PgeAP3f0c4cF9
	p3i16/U2heVu95GMKRxAWOYGuh6hmuy2IsunezkyxAVkmFSlMxnF+gOqrGuJ27EyKgPkWc2EBwn
	EtUujrbwuWcnuMUNakgiq4IeZbfyls/TRoCw1A/Dyl988KoJCz3cytSm+Wjgk9cAiqcjHtEQl
X-Gm-Gg: AYBFou2i8IpqGMJjEz4ZrKprjTyjbdf7lkVkNYxOX5qzPQeBWkMnAidaJoKvVJ+OK6q
	kdz36d0dbzOvPz76OX/ASp9JQy9Go6yzi6ZhE+4YOD4M9S8ebXKshbcAhqmHVsx59Awg7mtFd7z
	FNj8CCS1G9ztTySkdYrCzHi6Z4VljIws2zv46o8IHazE13Xg+kBFTYJLrJIdIZNm36grVG7cEzt
	6EEQYhIAc23Rylx6i3wAZBnnZOLZrEfc/uCC7GGYYrsYpLTgpt3AzcoW5HaqHKv6zU+FhpVlzFU
	0OzBEHZX4PNXCjnO5Zcj8bcKIUooPe0xBj+eyhtZuNN/SpdlIcY0mXsKvefi7FKyJMvx1Lto/3J
	Pq2thJpUjGD7DlCSssjBeVP8=
X-Received: by 2002:a17:90b:4b81:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-39df95dc372mr7989975a91.14.1789463850983;
        Tue, 15 Sep 2026 02:17:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b81:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-39df95dc372mr7989913a91.14.1789463850480;
        Tue, 15 Sep 2026 02:17:30 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.86.190])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm50688024c88.14.2026.09.15.02.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:17:27 -0700 (PDT)
Message-ID: <ba9f32e6-0557-4915-8071-6faa0dd76097@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:47:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 Embedded Controller node
To: Birk Skyum <birk.skyum@pm.me>, Daniel J Blueman <daniel@quora.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260907225557.73539-1-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260907225557.73539-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa90d2b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=YsbRjcmUuq6dkflYeO58cw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=IA0wh2spAAAA:8 a=9tsOQyAU_BjFFAdcUv4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMiBTYWx0ZWRfX9JYcyumq99pQ
 IeGKRMGL33WFoXDkrImQVDuFvW1Z3RGZ+Bl80t2Ondfdv5H43g3FYJzTkPfRlRcTMBMksn6Q6TT
 g8LVzQjkonBKO6H2ImPKA9CQNhFcI650kxHPSASEZt3Uy0rxQH4Ivf/h0aMpv61gQUHmLIkGVx9
 G/QDCR1kNByDKbskLfPtlbC5ZjGU9mWJ4qz0GftypFZSlivfgVpvizFDS1oLqFa1vRUu+oRCGuR
 h8iZjMwleT/42hl3y781IUwgbW+aCJUVaXqiXbezJTY0U+X6MUxefqlsom1d72CfBZNs0WyFyA4
 BbVvou+KUEKtsotQvbKiiUZu4DeY3Wpgr/jny8GRiFZhvj6raCMcEXkWp+6ADa4QhXh2d2A9Ug/
 owKDohbyeBHJSt1tHoo2vevqSb7ExfG8X5YQ1+OVA1VYoG/1fd9hzWdvcoBRxixpECVAysoHB7L
 0NUNL/OSiCBiNQANICw==
X-Proofpoint-GUID: QomF08R2Zh-wJA1-2_8VJ5lQmxOom4t3
X-Proofpoint-ORIG-GUID: QomF08R2Zh-wJA1-2_8VJ5lQmxOom4t3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMiBTYWx0ZWRfX2JQJIhp/fsez
 cBwDad4yAArWgTWsJY4itHNNfrDlhaeHqdrtSz5LewT66dEpyR3HetiZUP+cHt0bY9+CaE9w6Pj
 kqxXx071CyZKAxf4FpQ8C/TRoyzvRT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150132



On 9/8/2026 4:26 AM, Birk Skyum wrote:
> Hi Daniel,
> 
> Thanks for working on this. I tested the board wiring on a Yoga Slim 7x
> 14Q8X9 (83ED), BIOS NHCN62WW, dated 12/02/2025. The EC is reachable, but
> the thermal-capability query prevents the driver from binding.
> 
> I built qcom-hamoa-ec at upstream commit
> 1b04f556e8428a3865a95627ab7a0acb5d9b93a5 as an external module against
> 7.2.0-1.1-aarch64-ARCH-camera1, with your board wiring adapted to an
> isolated DT overlay. This is not a stock-kernel test. The driver source
> is still identical at current master, 28924df2a08f.
> 
> At I2C address 0x76:
> 
>   Firmware query 0x0e:      03 00 63 00  (driver reports 0.99.0)
>   Thermal query 0x42:       00 00 00     (repeated reads)
>   Probe result:            -EINVAL: Failed to read thermal capabilities
> 
> Instrumentation confirms a three-byte transfer, but the leading payload
> length is zero, not two. This is not a valid report of zero fans.
> 
> The legacy interface described by the public Yoga DSDT and Maya's
> protocol notes does work here:
> 
> * Writing 22 01 and reading three bytes gives a count-2, little-endian
>   RPM reply, consistent with Anvesh's pending RPM-query patch. During a
>   bounded 44-second CPU load, RPM rose from zero to about 2,800 and later
>   returned to zero after cooling. Maximum sampled SoC temperature was
>   56 C. No manual fan command or temperature-reporting loop was used.
> * Thermistor 1 at byte register 0x29 rose from 37 to 44 C.
> * Smart Fan register 0x82 read 0x15. A six-second idle switch to 0x11 and
>   back read back correctly, with 0x15 restored. I have not measured the
>   profiles' effects or reproduced the ACPI setter's thermal-threshold
>   update.
> * The second RPM query returned 01 00 00, not a valid count-2 reply. Only
>   one exported RPM channel is validated, not a physical fan count.
> 
> I published the exact read-only hwmon test source, focused logs and
> protocol references here:
> 
>   https://gist.github.com/birkskyum/59318b36f45664eff3a6f9be620c8afa
> 
> It exposes fan1_input and temp1_input without changing EC behavior, and
> passed three unload/reload cycles and repeated reads. It is only a
> protocol-validation experiment, not a competing production EC driver.
> 
> Would Lenovo-specific match data be the right way to support this
> interface while retaining strict capability validation on the reference
> boards? I can test a proposed change on this machine.
> 
> Separately, this failure exercises the SCI cleanup Anvesh agreed to split
> out of his July series [1]. Testing just that conversion, with logging,
> showed:
> 
>   EC probe SCI enable=1 ret=0
>   EC probe read cmd=0x42 ret=3
>   EC probe reply cmd=0x42 data=00 00 00
>   error -EINVAL: Failed to read thermal capabilities
>   EC probe SCI enable=0 ret=0
> 
> That confirms the disable transaction succeeds after the failed probe,
> not an independent readback of firmware state. Both Qualcomm test modules
> were unloaded before the read-only monitor test. Suspend/resume and full
> thermal behavior remain untested, so I am not adding a blanket Tested-by.
> 
> [1] https://lkml.iu.edu/hypermail/linux/kernel/2607.3/10628.html
> 
> Thanks,
> Birk

Hi Birk,

Could this be a firmware mismatch? Daniel tested the same hardware with
the existing driver, while your system reports EC 0.99.0 / BIOS NHCN62WW
and an invalid 0x42 response.

Daniel, can you confirm the EC and BIOS versions on your system, and
whether the 0x42 thermal-capability query returns a valid response
there? This should help determine whether the monitor-only path is
needed or whether a firmware update resolves the issue.

-- 
Best Regards,
Anvesh


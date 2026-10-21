Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579156;
	b=B1ITiGIaHSJV6gcF9OtUUaQxyruqvBrZrbBhIeHWFv22ggqvjNKvpevZpkHL5S0AH70y
	 7fve0kiuE/v8uXCsARm8ga9KW59uQTIJ4lt15Oh1zHtKT3JrLPID3pBGB2ccBBAlV0syZ
	 e9KGD5Cbcftc6gC/KRvFzr+2usqPFc7A9xn0vkwEco67f0Wpk1y9vKVEPruUnKZDM3A+v
	 BQvs39AOTnwQDhXJeVVC9Nc52ujMiYtISepZdPMxSnJ+4Z6/+HvCZVWf60t92mJgycwOm
	 QboknPoP7xFZAYO4B0XoPEqIoeGkYjjTLE5G1R1LSJaeveFsz0JSA5uEKSxc3VW2U/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
	b=b5VIcfBa7CfNDC3OE4r14YaLlP0V7leeg/I6viES1Pk59ziulY0JCzu3DsWsuoYcj/eA
	 DnrkOeb+x8aYnOkEzy2K3VUkAIAolb5/XoIzFM3OkOs9ynCBn5GS6/x6JazJuqq6mGPTp
	 XAOTejwOmjg30JY7qY1in1WqpEiK8SA2AFCTI9Jaxb7dQOeKklH7c6Iws77IuNEkiz+7X
	 ax9k5cpy+dGc8CaCkn+lI1zS1DF3L0r35rOIflrE5ARlKZ/kbZYOfjfui+oN//lXc2EG+
	 Ukk1D8Sv104WpsYceepuLkn0+TnqDosfjCA68jd07ZDUBjlJ7qjSOYey6cQ9/TqIt7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LBrZ6vV9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0C4IUtC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4D606A324
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C4D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LBrZ6vV9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0C4IUtC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5toO3958124
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=; b=LBrZ6vV9wbfCWKyN
	OgAUV5H/hxe1IAjXkR/Z8oQTaii0qMQ9HIYkXmwL5dBHk+rNCLykzKOJ9xhPSJhm
	FFBvU62YZNPzgkH/+ni0ZsjwmFnF/7EBFaCk1XcOxUj2EaKYj/8QkbwQqRJ4fJEU
	bsXQtTJQskbjLc6aU8Po4V0r+StW8HwISFRcTyu2w+aNSCBrIpftoncudeQN8ua3
	T3BRizN9ZCLqr4bTXHU0YPlbe12pcWUO7nnKUzTfkr7YYYt5CM6W6U0sKy1xDsYy
	1bnW/DBS6u1dIFMuDJNIg1jxO7z5AwDCy1U6EjgDaTV1bK89pweMc3ThAAVAXXrY
	NWUrMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kg3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:39:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so16269385a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579154; x=1793183954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
        b=Q0C4IUtC/bw2tDKyj0LFJeQOva2JOPNwbT3Kvd13egyTrGJjdSthLEdGedRhLHGHsd
         /b+AxOhKhBex7PtiOrMQ45PmgUZ8XywgrcutJaw7keo5teD6o1gEc7D6jmx1LTuDqi9k
         dt8xui3O/mTaoHc7E3u6j1OwPVgk4O/vZC/A2eTOJ0aFdJbT+rZblKCR2bBjUjcTsvyE
         ESoy2cQc8Yd0EZKdduq26HFpWDXc6WhTMxQURKQLjMxmSPsoiN5Kunup46rIPq/aLq3L
         GZJVo9LRJnbesuecLn4fRPH/DM5SzN4Ob5e+AmZEU8jW58b7oPOD1suDoWYmFl6MJZaH
         URrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579154; x=1793183954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
        b=Wzfb7211oVsMZj/wVDAAR5K/BiazrKrY8WA8SKPhcaJ6Nvbe+0ueeB+wW/5TRxGEWb
         xsJ6ixWEcqmf1NYAdldM8V9OCuVmsB/s7uhh0sRXmDNyUgGSnN/jAh9Vd8eLssJvZNgI
         nsOBOngh+/4NdfEwmHRn+/CFU5P8LWWSM+Nd/PR6OcrME6mJerlnKMzkvrdxZAmZ/Pp4
         dW4jfWh9Zg6zhnGhD0lFVe8KyxGS91XxNZo1YDnLrV68je//MntEZa4YeeapZe3V/GP4
         nGOJqjIA74g3jVdibbp7GKAqWZ7BfUxsOxV4hHxV0REZKFpLyjFNrDUN1bSItdwjEQWp
         Chmg==
X-Forwarded-Encrypted: i=1; AKwUvByVOJG/UXQinRBxC66fVxjOTuq03uV7OwMClGDVj+pVVx6pTmqNIosH3zpR69KfQi3ZFWSShzMT5G33@vger.kernel.org
X-Gm-Message-State: AFq9FYKBlJiM3pkrwXUH8D+DYXSUCbva2VWD7BE0NiBDDhgEF2SzJpUM
	3oJjldrdHT4WN/NJnWsz7zw7b1HkcWzO8AqRgY0PaDy0ezsy57xRUnRXBQAsTB254js0sSFWJvM
	uCtKrPo9S16WIOOmZ3jjcsXqjn25FXRxppbgrrGLg/6HLOleJDwVhxULgDmsdcE7A
X-Gm-Gg: AYBFou2+rzk2sDO5bxP2WOy/6Yg/jfo8k9lJyKlPrA3agZHlbRDEh7367Gz3W/JBWqb
	45le/nODJlToHrl6/ftLuDqYUqzffDF8YJ08t+RoUS5x+DUBOj9XYZ0LHONQOzk33J/NbksUyWm
	mlSpOPxUdVa8TTNTyMXFPM3V9kS4wfeqZcEOTeuIVZ0FU/MjvDqz0xSa649KgJKTj11DA6Db5l+
	y/Gjy29XaRLcZjf9GshD10o2xvUJdG1uMQErlr8r8SJIiUwfcacozKVPJb/mz7eWqC+uDdHbggK
	q2FEW44HbHh5cJd9IVH0yig84tNJznkqea9ZbYKZdtwWA/S1/G9zxKxxKS3LccPC25CEQ31z4sd
	ubbVSxQnCzSQ3uuWsvtLODA==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr393138685a.3.1792579154390;
        Wed, 21 Oct 2026 03:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr393135785a.3.1792579153968;
        Wed, 21 Oct 2026 03:39:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78b22sm63381166b.15.2026.10.21.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:39:13 -0700 (PDT)
Message-ID: <dd641bbb-6012-4d6b-9bd6-5dbf4cd849dc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:39:11 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: store the RTC offset in
 SDAM
To: Luke Macken <luke@phorex.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016232528.4012876-1-luke@phorex.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016232528.4012876-1-luke@phorex.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX4vB22vKhRiEO
 oKrSNqqdaURqmm4oHsQCp4xnQPGZ7Vwmyu91LWMqp+q/q78izJvamjzNfAZAqP1cmPliosiTmtV
 ziikJMveBLAtJYAF4yGQnK55lDS50AaB4GoFHOpjnma2C/+fmvsLtXtGhNcLLQPb+t/XZnUp0td
 VXb1pq2paw/fwZXw16euiPqBg6B9nH3gk6Q6SmdvEjp9SAbQjvmlCSgZPoA7ynwv/CHb5kcNX/6
 1WCnV8NBRn9KsFHe3nppJFSJheEne30Nq5hcpXxVOONlqbFP1T6EZrBkDIzBO3CbV8CJldP0FBF
 bSX/JZUMXE7MNKpYzpIqnHwd3hirfOwOYzNF5r2F00nEeiEF/lZzZj7RS3jPwbRUJ+qasJokb8O
 NtRnBqlD6r3aQzwnkQq1GXiq5KhkKNxcwhUBTa8jGQ2GWYGgsSu6IZb8aPmvgPFKMRnMMK/JxjD
 XMF21W1kXy3OuFtiGFQ==
X-Proofpoint-ORIG-GUID: HLDrD0U0_NPQZytq-juaCL6nngIfu_Ez
X-Proofpoint-GUID: HLDrD0U0_NPQZytq-juaCL6nngIfu_Ez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX3fCwlARbwTHF
 XU1jHwn2/Y9XsCU5s3LyUUwvjkBuJy7tD2s6RwgXH1Lr0l/KjygDwqTiW+e8DHCU1rnDI4aEFhX
 igYN3uPLKOzlYzd6WDGTDzsogTMIluM=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad89653 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=supTg-EGvRqL_ogkzMIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210042

On 10/17/26 1:25 AM, Luke Macken wrote:
> The PMIC RTC registers on the Lenovo ThinkPad T14s Gen 7 are read-only,
> so an offset needs to be stored in machine-specific non-volatile memory
> which the RTC driver can take into account when reading or updating the
> time.
> 
> The firmware on this machine does not provide the RTCInfo UEFI variable
> that other Glymur based machines use for this purpose, so, as on
> sc8280xp-crd and the QCS8550 boards, reserve four bytes in one of the
> PMIC SDAM blocks to hold the RTC offset. SDAM 2 on PMK8850 is 128 bytes
> and its last word is not used by the firmware.

Bold claim, there's a lot of firmware!

On Glymur machines, the RTC is coordinated through SoCCP. We're working
on providing an interface to that.

[...]


> Note for reviewers: Qualcomm's "rtc: Add Qualcomm PMIC RTC-GLINK support
> for Glymur" (August 2026) would move the RTC behind the charger firmware
> on these machines, but it has not been resubmitted and needs firmware
> that at least the ThinkPad does not ship yet. This patch uses the
> existing rtc-pm8xxx nvmem offset mechanism in the meantime and does not
> conflict with that work.

There's another access mechanism to pmic-glink that may unblock this.

Konrad

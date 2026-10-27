Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104751;
	b=YIL4jCmg7o1cH6JiYR0NsRj622iE5CzS1AJaRfh257IG0w1kxdBEfyKBgoC8iYylmdZa
	 9HaOtAxkiYqrZIeGGryZCbvQWuOhs3hRbOO7JOfadzk82JQuaROAEi3pGChSAgy5vMazS
	 2iM8L1ky8Czsa38BPa1gY58FJI2QiDIP5v3YCMsxoOd0wX8EmRPGV5jrLxEdBIYYZPiA9
	 pBKL+HvU+U17YB3ZNdT4aqLeCg3wOxcrpuROSiy0f9FX/zdB2dkspr5fhRgTp2Fd1Cvsf
	 TwCE8ZRE6s92ZEOSu2bv5iYaasxRcrfgrkn56edg2l8yPPBeUt+LQQYtBdk9hvMUiPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
	b=hD2wKVZHZVY96oDzaeY7kIr71zzPQpWfp7+d62XZaoROvcqzVLyOkH2RdwWk4JjyCNP2
	 WRuY6L5NmTUJTOw3JdLJ+wgte96SnUoYzt0u1QAW/ARGQQishwMXvMj2HAn7C2pvGm9Sm
	 E9MsBAMKvw5V8wKz7vzpQsONZamKI+cQ2WR85/k61n0qWzS/ZeefC5xrrmomyEBmwFMOp
	 g/VVPu2cNu2DAg24CNvWtlKE4dMn/WidXKeIJSJlOTP+qdjPboyw/3eds9ExIeGICMdgE
	 OuoZAR8TBW74JYFjDVDEQcfQNLgKdmSm5ANF/yJ3ZSFCjoZefdhsOmY8C7qw6yZs0FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvjtCN0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pe4Dxl0C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FA560A2628
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FA560A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvjtCN0W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pe4Dxl0C
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBiu3011968
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=; b=pvjtCN0Wqj2XrZ4e
	UIBV36XzWZKnwFhOsem/tlER2xVxXi+vo69aqus5wuFWUS3l/LEEoDJYO1TXnnbw
	tm1nPIJTrU8ZX6hIcggcXVOTRrDHfZcI/NEQPrv4s6O/hmxqhzo9ka0t2DAXPUcj
	aeb9Q5vSYIkUmFj2cYb4sIXzL1JDcFDXnxZX3cNDrI2/QLZpwPZtsc+H5PPYmqPC
	y3uybWlAQwuKFIKH05gI8z96UfDdrln6SHvcj7N+yI198I1GZnNPN+8F7GCWnl8C
	yZLrOWvyFJlCvBhlpylbO//huC6JJTfqw54eiwsbrObrESipRCHb2WAx5aqGuFr4
	dScenQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3db1eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:39:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so2985833c88.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104750; x=1793709550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=Pe4Dxl0CYe8xc5+N88zDpxkzJFNkxh37wyQlTRvvXcK/A/8OhMlNf5muaRX+JITTGA
         +EEVvcqtcLeUvfREps0bmLfH9exRbeyUUB+pI0ZcGZLh8Qx269coeCiyyRbMb0fW1X2E
         IyJx6JjvLbubrioncE6wCqswrPJMRvpRcsCrYmGXbGaRxQ56U8uDxO1GbYCNQMOyPfiB
         PBRpbzO3JYUHIRHx1eThI1diV3KworGf7ObLMgEK4sqezE5RieEPD3KK5ZoZVkQWrWge
         2aFD1MOYezJMCJ1hbNuCR0A4T+dyvbz5f7VTLaqXmJXTXqtSBw+9SWE6JdeJ9dL3Pw8S
         PTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104750; x=1793709550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=aL5x1NGxSNYSwAth6zk/bt6NKMclUcLTnjarLmEuH2kxVWleFOqcootrr72/lqPnot
         V2+FTGprXpiXw0pVJvvyXADtWadsS2pf7E77S9eebVuzd2RflQ7sqliifOshiST1GEjU
         r+iW1FxyiFw+n+MMm4Q8G7FGPE9xKeCvRcFHQNFL+CnJkfIIfSP1+gfl4KiKpswk6dMh
         r4qt+wxrJHqdAMaLC8kfzpL+NToao1W7+7EFuXmCxOl9aixYYKnCY51TZtLjzqfGZANT
         k407bmq0QvProjeo1VOpLW8erraLXHucRquDVMNiAKAgWDIy7ILfp1g+r0zX4R2Qlk8f
         w5ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD1TeCgD6jGUR0Vu6UjuV/VITjS4vGvYhRkSE0xK8LySXF35DVQsrfiiHSnSxEo1M5hZig4CkJjhfD@vger.kernel.org
X-Gm-Message-State: AFq9FYL+o0Qt5nugoVKrwnTWMJ82TCcugl+M6hfQAaXw+7LTiROckFA4
	d7sOMr/2JGPhaeNE6UuNCdTquDt2s22aPMHB+5VghG5TdugjhOTSELz7ZOny9LXmr0WIsWjMNO5
	F9fhDIrL/KOls6VYG6TMXRp2MjfWo2G93/gbdelPSaXBH9tKD53sNAugd8KYfPiSs
X-Gm-Gg: AYBFou2u8sd0MmKh4oXW1MSVbzQs6BBJi//d0idC70Q1OtXL6Irm7bfsvVHrnI4k/Vy
	tPQpkjUPkjLT7t1slOuBN4RKE8NCv5dF5SFbO7YQL3EnX4K5gqO90SMaByrzgRuwgZWlqUs+NJA
	668CxYoh5V5/toioMVn9YNW5DnVJW63ANZTeB/phV3JW9m7zkyaqJ+mz6Tak+bD9fz7kqZwrlz1
	TgEzMCZNA+9ZgYVYQ4fOoaghcwSy+Sjvp4Y54FO9EgKbRMZoURhkAmCsQ52wCA9P+ybN98ELwTu
	xEYF829qYAmGzlJqOUKKSo7aGUEoBwJiBKJdM6UHUhdF/P7PCgYQCC8Z98PwaLSc9mZExJfAQXF
	jaiFoBF3fSvcBUezMNEJYZRNbO5exJ5yidUf7rVfPKWRHm100jwoJY1OArgxp532nXrx6XMTQ54
	c=
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466965c88.37.1793104749673;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466931c88.37.1793104749144;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm32798498c88.16.2026.10.27.05.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:39:08 -0700 (PDT)
Message-ID: <3ad598f5-2e02-45ed-bc17-e4b6119ba2ec@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:09:01 +0530
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
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
 <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX/pVUkuTd4/WN
 DL9+Dx/eHVMf0kuF4E976gu2yHgNW/koQe8mebFetHYR+qUo/IGOuhE7frVcEJKgc3o4rYATfO1
 UyiZgpFuMDFIBsm4ZgFm8h9zTtb6s+k=
X-Proofpoint-GUID: rEjnknm80GlUuaZXSqQ0utAGrWdl3Hk0
X-Proofpoint-ORIG-GUID: rEjnknm80GlUuaZXSqQ0utAGrWdl3Hk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXyhAe1ryi6911
 z/Y7GX+nBNXo9ynxQxMOu+lSuLzgNLnTAMFY9FcB7/o8jqExgmuyziL6cBQHCsExsnbx0Xg43t1
 6UafnwfkYA1F8+GOYxyFNn9eUU5cCswPkpmIdC8W+VIpxeCDsBPYIQzzEbdwJ+SqObGQZDwcjoV
 RBTJ1AKgKw2XSTAH/LD7WZAvFU/QFxpSTeF8RY78oukO+j9BRP6i5JYihZ3hhXR0Oko8swrExpj
 zJ+9Pc15shmt2H6wuEvmwe5DLKVO5V5789G/8Atr6DbEXRLeW83sg5KfCp6+UCH1/0ry3Yt57bb
 Pz2lW7u/CUS0uQ0pyS/2TszKUnvgprwvHUimJ/QsAoTM+rb0RuFs1tiwkzgS3d8cq9RupdUmGdB
 XLUWuKDj7YqeQvS/WFBYQzObSZVr50kgaegI0gO0A5OQGSq4SQHleYTrnslg8zohqawMsjRfMfm
 JfA3h+5X21F4hmWyf3Q==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae09b6e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ddxl3Jw30jVTiRF8AwAA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050



On 19-10-2026 16:40, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>> the latest wake up capable interrupts when the CPU cluster is entering the
>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>> implemented as .power_off() callback by registering MPM as parent power
>> domain to CPU cluster.
> 
> GPT suggests to register the notifier later, so that if
> mbox_request_channel() probedefers we get a clean unwinding.
> 
> It also suggests to skip pm_genpd_remove() in the non-legacy
> case, but the API tolerates nullptrs (although it does return
> -EINVAL, but we ignore the value)

I will move the genPD/cpu_pm registration after mbox_request_channel() to fix this.
As for pm_genpd_remove(), as you mentioned it is harmless since it will return -EINVAL
without disturbing anything else.

Thanks,
Sneh


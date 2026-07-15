Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E99C44683E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112357; cv=none; b=Llul3HHdJ1afCADWXt7i2zeLANE230N1XWYBwfyc7vE8VUHWmThQgEWA5TTXsamWtqneFtq/UxalE6uDTxvGbOV7e37fg8nFaGMGaOT+bFhCHr+g9ZjO39c1vMO2k83l3NtynFvXjzfpvevYTbgCaVgBcnuk2ZC1CuV6ubdOqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112357; c=relaxed/simple;
	bh=yd9N7LIeODrAaKjJZhnWWcAD1DLOtvdRG80PmzSZIZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRUW4WX7uXBpLNGZMzWQ6j+WYDTpMLWtK38leemEZjvVt9Nq+/lKdP86w+AmP7GUA6+bSFMsdyFsNQKlZMP3zOnrYHCHM1tlYNr/Z3ebeo6p2IZsNeOms64QBAzCW3+aVLPfKQPvxvKtREisi0XU2lStarrKcLdssw+H2+H3RAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6Uh9ez5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGryAKll; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6Uh9ez5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGryAKll"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9bJvB2269601
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygiVS8yKBN52g4G5MgSgFARI1f6Qx8LFoeq5saxBaeE=; b=N6Uh9ez50RbqJ8yA
	6NSlLqh4zLZVnIStQfN1578HpEJoyEB6fsLlBlVvkWwN0bUKLe4sraOrEnhrVQdO
	aWZjfo1YElVGf+Ljxd7EICb5Ew3GJyT88nF5ae7FXLDc7j2p1AAbF2V4Pwvmb3Nc
	B1IUDLzz4WmqDk2P5dG92ylSP5KG0VRhN2SkUhwtGjgB+HFSQ/cH+DXRa8ADGz3V
	ZV76xAlg/vpyrhMmEcwW2qu4rPAb1rCLLxjb7g0/2w3pcGeLTs69Y3SiqgkRQolE
	71PHztaeMIhTUSnBer4LUJ/59mYAoDzFQ5QMZnzpLzSDeaCOmioXwjbo5YMEhgNM
	ZaTsMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mk7u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:45:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6415f279so76186185a.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784112353; x=1784717153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygiVS8yKBN52g4G5MgSgFARI1f6Qx8LFoeq5saxBaeE=;
        b=bGryAKll0EFh8bleJex0Ke7VxAXaTkKDLdrrT+lggCr4ELHdeUIyBfaGyecVUAV/td
         x4sHvi7cu/2TRlHrXUZHKNMdqz/K3xM8Afc45sptSlJJFt15MMolVFIYe1udfTnKstbG
         yLtJvpvuqyxwhhcNrsQS7PsQRtFlTMkUjfTkPtlEZZwXmk9IPEut14GYYS/J3jK7JKfO
         tF/AOpZlei+qin2YgwGEHZ/mShO9H10dUZZBlWlAuwHqUwCZARSSHoOnOcqlXnoF6fJk
         iNpcp0xpdWtNB6N+goR4EWZDoNnQ+7kThVhqz/dR2XDYSsDscgSvrVOz3xBhIexQy5VM
         NrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112353; x=1784717153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygiVS8yKBN52g4G5MgSgFARI1f6Qx8LFoeq5saxBaeE=;
        b=QxQl9VGIhe5YdF6iw3S7Olz5Iw3sykH31R7NOAnXnLPxs6SydLAl4vMoRcC3yXVziY
         teLYEPRCGY8Z9+t1AqBM1MHzAG0p+3iMZ1B4bNI78MC7Kxt4TGQFb11hBMatP+L2y8oU
         rGCbJbK1mUAbVozDCvuC/cbO1qWNUwr2jBCB3349yooeR5puHp+XwiDUU/H0ImWkoo1F
         mYF9ZYDJG4S10f+tL+nNtPN/VAgQgwjzLKHteBhAAPvloSaxyP+v8m0oe45miHnMOVI9
         NxfmL/BEgUQ09Xq8XvYuWshCu++ACZ/JfJMHVhAYudDuy0Z5Kj22I2UT3wDo3zEcdv2h
         suAw==
X-Forwarded-Encrypted: i=1; AHgh+RqOl5wC/p31qhlc2vZDbe4atIGX75ecJ4iisGqy8/g9Q5lg/DHVVHBpY78OwDWLTMf8Ctpb/H9FcmNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRefdcqeTxl0/TZcFB/2n1Ex8IBIpOlbYWx8bVqtaHrKYh+oSp
	m9WGezZ4oQwOrAALmvokXui3eS4e9rAqr/GWD5ti4hozz7IRkSMrVfo+OkElyTh5eKP+OgqEdIJ
	UqXoX1Am7j+919b3uh4ChZ3cZv7h7IaiHekk6cpbfLnQNoOcE2ttEvp4oOY7tUbJb
X-Gm-Gg: AfdE7ck/QxF8Kd+qpGxn8E5WrJukSuMcIGYS9Szksvj7DNJV+paSXorvZ68Jb95V4py
	qCDoWtXEcp/63vVGBSOIoY7Lfsl3ym2+E5h911A2zgp2R7OVIHQM3UG4taAVRrF/IoTWClPsj8+
	CDsjJBgaUYzY1XPTrM4u/ORQAvNJXgRettkfrgOF5lqsZRReOdWz9IrIngh/NLqrHA0rX1d71fr
	HXesh0X9c/tEEzaBYwNqvoMKCZR6oWKZziX/pAPDgeOiVus/TXdpWMcHxY0/JLsfW3fNywYdEeA
	akZfhiLmZeHLZYi5slOpoaCnQl0AcbkO/o5HldpjKZ3JBwJ2q4MkW5QCO9H+O7rNYsQ950SNQnv
	Ftobocshwc20gN/rKcClxyVWh20bYR1oGPuc=
X-Received: by 2002:a05:620a:4721:b0:92e:601b:8d43 with SMTP id af79cd13be357-92ef2af9c3emr1426629185a.1.1784112352970;
        Wed, 15 Jul 2026 03:45:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4721:b0:92e:601b:8d43 with SMTP id af79cd13be357-92ef2af9c3emr1426627985a.1.1784112352422;
        Wed, 15 Jul 2026 03:45:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168716f6dbsm3186566b.15.2026.07.15.03.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:45:51 -0700 (PDT)
Message-ID: <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:45:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aldiLuYib1jCK784@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfX1QIBu++o4ry8
 3jXtVeZCp6KU/CJNGts0/d9xBdMSJDuGIeORZ+/9X7p8maO2VX33k3ICfw4CgEhXPtPxjT/V2kP
 kubaxjxLPocp7zeZC88vDScqIHqDpcSzViwjykKpz8075G8xTOFONUhj3feHMPOKA+wL6kdsS9O
 o4ThXIFQ/seMg9+633TS/sb3tfWGQ0wK+QxX0e5LfI0sbGZrQKX97HoRdVnR6Ont6oiKXsDYZ6y
 A5jGedaNYLuro3/k0zTmi4DgDyQp7fE9NaNyyeYQ4PZJwH5oP/4SWJtq7HfT0iaW5ef+J6Vb3lN
 gLKZsCYiIWaRMjs13eRvo52LIDjKXj7/X76O7MCkr27mRoHS9xD7sv2Uyk0QyOoDPrsKNV+X6fl
 l/Bcxpi7B9N8dp0WhFObH4tI3WrFF0PcoaHGpuo55+v+EHKQ5mWaqWw0gz5uUEwINlC24DKG7U3
 EXGxpFUvVpuNwkqdgwQ==
X-Proofpoint-ORIG-GUID: fT3-fPuilRuj8ganpjtPWvzBoH3GsIC3
X-Proofpoint-GUID: fT3-fPuilRuj8ganpjtPWvzBoH3GsIC3
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a5764e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ERnfXskPEjP3n-q0xIsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfXwmLWNIDj+KUX
 5Jkd9f+vUXj1MB6qsLb+TJjXQwn0OYHVi85oHw1lN085fId99aaKnvmMOtO+6YR1tz7bRQfY8VY
 GSlzklvSg7+S5OPf7qYK7h52V8zRy/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150104

On 7/15/26 12:34 PM, Stephan Gerhold wrote:
> On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>>> the latest wake up capable interrupts when the CPU cluster is entering the
>>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>>> implemented as .power_off() callback by registering MPM as parent power
>>> domain to CPU cluster.
>>
>> [...]
>>
>>> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
>>> notifications to manage RPM communication when the last CPU goes to power
>>> collapse.
>>
>> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
>> fallback for platforms which don't have PSCI OSI mode specifically.
>>
>> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
>> all of the arm32 platforms) that don't define any CPU power domains, so
>> perhaps it's necessary after all..
>>
> 
> I don't think this fallback is relevant for the non-PSCI QC platforms,
> for the following reasons:
> 
>  - They don't define the MPM.
>  - They don't support cluster idle upstream, so they don't need to
>    define the MPM. They can't reach the idle state where it would become
>    relevant.
>  - The setup for cluster idle without PSCI is essentially equivalent to
>    OSI, except that the SPM/SAW driver needs to program the idle state
>    to enter. There is one SPM/SAW for every idle domain (e.g. on
>    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
>    SPM/SAW instances as power domains to get the same setup as PSCI OSI
>    (I had a draft for this at some point). So if someone ever implements
>    this, we should be able to use the same approach as for PSCI OSI.

Yeah I said 'necessary' because of the arm32 platforms. This would probably
be the preferable way forward.

> I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
> when this fallback would be used.

I think it's generally only SC7180 and there's definitely no MPM there.

> We probably do need some fallback for the old sm6375/agatii DTBs though.

The sleep logic doesn't really matter without the platforms hitting a
specific power state anyway, so I'm not sure we actually have to (i.e.
the regressed path can't be exercised today anyway)

Konrad

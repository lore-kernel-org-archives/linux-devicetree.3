Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578908;
	b=EKej5KDB1J6I2fj/JpvirrNjbLSdHeidiW5fh4HF7xHBmnsudUxcxHp70GAcneWkp5FO
	 lb1qZCutIhIUjTFYuhjaadyi+ced0bBD8KKVSPgo//3peEcSJ5ZpU4R+T/3tg74TCvUAd
	 7WIBpidnHL0Gag1jtEC5nDlIP3jZsHkXY1533Z6CJ08DuX1wOH0z1FflUHGQ+rR3nRJQQ
	 6kat7LYsV1+tSl2dJec3skEH9sdIcvJ/aXaTjp3jigATCKOdNm6QqrXTUHFnuFJvWyLmJ
	 xnjFTeWVSHRLoJvyE20n8+caswSSQzoPN53YGB4voQBEdvnawAf5M5cZo22hXDXkwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
	b=dqwhwhjSFNxZhLxhoPbaALiLofIi0YI8OO5S9yhUU2lSmwy8Dhdxaa8wLwaSUrvKzfEk
	 q4JISrJCK4lWriw6LEYHOSsDa2fzCJOvQ+USEOOVsrn2cGa8RRT29jE0H5qTMZ8tNiug1
	 1LtVWTlkwVKSgv4tA4MSXC14CpVwaJwiEZhghoX76Eio15dBBClLOhKYbzOlw8gRV9OA1
	 XON0+TStgWQH1cn7KAfMWBsMs2ZKGBjJ0hoqr9Y9B1lZQcs76dx2LnlcKkYykPA+hz00k
	 qRYWy8L05P7zSPnFyyIhA5fJ/ZMGz80mcPPhwdxLjVubMIt4G0eMOEYoIu1M4vVvH8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bL6ph9CU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRnMKTp2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25618606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25618606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bL6ph9CU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRnMKTp2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5jdA3015966
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=; b=bL6ph9CUm1kadnCo
	jss1z55EW/pdqxJcTXajq0aPpwZRRyDUXw5TLiBJ+MzWUHSYayJsQC9aTtwrERBm
	84hylA/dv04uC//3FPxvauvVZjxTP66amQSgvQjlrvYZklzF4xWprryYwEHxG2L6
	4AxjqxOtg74iUSBvOS9lTNWT+Bjz/wV3cwpuETXKKE6JiZEJ28sYxQhshstao5DT
	ZcSMz+8MJXMfDLdm+hIno27dvphFjfEvMxBW9khvGLK+jOTVb+bHdWt2jwkibax/
	bNTEQ6j8Gqm87UD+FLsGnAisQ7BS9GHd5Y/pTGZI7lh+EOoNQnu+yrBlc9pgqOhB
	pvuBuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78kyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:35:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so9423885a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578905; x=1793183705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
        b=SRnMKTp2kLJje4tGPbhU6d8rjST87RlIqCRx6DKkgc0krtYOrPq+gKGRt8zuI3D1e5
         cfqDLnbs7xiiZdNaY5pdtXXxvZQt1+AuHHJz1qSTgpmZcGKwlYP+WJ8ukR8HeMqUKMqB
         MNVX4WYucxPGX7EPAfLxywgKJn1UZ45UJD19mlIeGkgjWZ9S7iGrJYEkEh4t8EALmm0t
         Fzu1CbQ5tmThzUXfZzzYPGOD6990Yd2sffQFc9jqeGVwNsrmksTp5IKNvbKbJsltRp+E
         UGsBhOwMSdyTZmL1Twbf6vlx8utxma34d3v7BHX8wgFBTAiUKfP/Wghc+4WnRFBr0414
         KbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578905; x=1793183705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
        b=tSRC2amLJ0bCk76+Wrh+5NTfzGpuxv1CNoNdfjkwziqOdZzlo6iDb+4lxcUtK1wkTV
         H4uJBmGmLbeUKh/s6CUbCvI9DShugQkXnGG7KdRcXR9oTtzPJFi8qDFOudO1Tcx5hT95
         vj94ucPdhnGYzfRoQRNgsxabBEfIOwA/TtpKQR7Iwb2qmvltQa4eqh09t4aBNGLxFgTt
         g3XDvbCk0Lm7AuxmQxk9VIwQnjVhy+lSIfDhvRQz2av69fLKypmr85s1ygaBSsKK+2bk
         xYvPUiVZ7UY2sUqQpOjMABCnVIcbtEdS3m6rkyjewmgUoPutxF9vCSiwXmn1EvCr0YcC
         h/4A==
X-Forwarded-Encrypted: i=1; AKwUvByGzYXf+tfvRRobrWNth31m/lMl4BS2x1kpgXUt5y54XqcyhVhcKt4ekp98oDmBA4pUcEhJqqQkB3JS@vger.kernel.org
X-Gm-Message-State: AFq9FYKp6oH72Zn1frjkno0unmnGerhu9ahn4xX0baw+mzuKbm1WX20G
	HTNwzjQ2fB6f/ueWjgCXS+tz1CxeF3iVjQFPu0WYhH7cTuFloWlQm0Hkk19MUVZA2HHLeVaN6Q9
	mwUgjXxEjn3rQF9vw70La9hIOyjguZ9CxSaVBRrMqNNjH70P1v9tAkjf0Oa/7LpkB
X-Gm-Gg: AYBFou1wXzo4CWwdUo2DOGWWnYPaXc62CO2W5DTNERIyz9iJ8XTUUw+gIVE0ulpiHz+
	Ix/6eTpkzRsXpM35CJLwqOuEhDqmSUxiogrOTrbdF0P5IQvSWF6HzCTVrrtWhQHnXUnCwQLmq+o
	/ZjJiL6RMkQPfhC3Dqa4cJ20h63RSSgmqD/uEXnM6hoZkF5Y/x5T2M6r1uucZE+puWqDggpEYxs
	fNjqsCnfvMod4QNh9BBO9/QHWu27r4rhtkPVexFENmVzhkBA5isMqnJNXCLBKuROub+OgrPsWqd
	FVPQeKLb5yFWU/EnuS/ziG+oapnWevXXn8lzrYwC0q8WXMpb1ym5NoNI+xz/I3OZVBkDu22IKCT
	83xJ+tX5nMdAmN0H/o7hLFQ==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr366241285a.6.1792578905351;
        Wed, 21 Oct 2026 03:35:05 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr366236185a.6.1792578904793;
        Wed, 21 Oct 2026 03:35:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403132037sm647584a12.26.2026.10.21.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:03 -0700 (PDT)
Message-ID: <26d4788b-fa4f-4f37-bd9d-ded731fb1e0a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:35:00 +0200
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
 <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4i-wF3n4-n0uGaJg8c5871myv25wO7k3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX2UHOKfd6UIPa
 ueo+Q5D6U/czPhdMiM7YS3lYuRtcoQoBhTXWAM7rG7R3MfzEMkaqoZpT4N41FBoGTdrJfBhavOM
 iuWucYnITMNJqdn60XCLh02CgvqAOURPZJv3OQgGFC40Xwo1v8sAqQcOgDWNFdcp8wQGYoJidnr
 C3x3ZQU/mYATqCAKrMOemKgAc3FAL2l99Yyd4xE2cNaMtPsc+LdvOwyBNHzAdN2IesUJFxzqCSM
 VFnXpDm4GPjqhPWUHbenDAuWSaNi26YqiOGUifOtH6dkDup8JB9ys/pJTuJOtZ10XxXp2JEwF0+
 pd/oC2iFKSvIvqziLOnS30pUjfkphNholAV7zGAl7sW3qN4DmepVI0dKcHaHejMjwX1+07INgor
 IO7Rv3SoFdl6mnE8MTKnmbHoBOt3SiUTVGHKTQojrJzc/fAFe4LKabBaTqTCId8u9ZQx/IVvEOg
 buG/Lzu6TOYyl13WG+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX8t7wJzanZ0Nw
 L6iijwinvXCdqQl+3ZA3uyxyn8+KIqAR36yVAOzAYBC1/9y0lTEgli/tw2gXs/iKdsuvdf7QXsL
 2bubMGFq8R86bPkcJNSRbuYryVVcq/0=
X-Proofpoint-ORIG-GUID: 4i-wF3n4-n0uGaJg8c5871myv25wO7k3
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8955a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=J5tutDk3-wnuWQUDz_8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/18/26 6:29 AM, Reza Kurniawan wrote:
> The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
> OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
> NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
> probe of psci-cpuidle-domain is aborted:
> 
>   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
>   with error -95
> 
> Skip the mode switch on these platforms and continue with the topology
> that was already built.
> 
> This is expected to be safe since it matches the downstream kernel
> behavior, which manages the cluster power level in addition to the CPU
> power level, just like Linux does when OSI is supported.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


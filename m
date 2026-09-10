Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4683DB629
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031984; cv=none; b=QCRnopxQ3ZD5zW4Y6ZopdalB2Apgr2c3FxXaSiKGNMRfj/cEangc+Ak/f9NdfOywkj6PXfaASTQSHEeX1Hq/BYHhhAKqCKNb6eMdPoHzSuAV1fiXn4SBFXzLbyhHuYrXCM8jQ9OJWh1+zwq9VhWtyhtQJN3AsneFIJLIIgw/5qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031984; c=relaxed/simple;
	bh=ESXLYzb3JTJ09wZ1b2tTlT3LLVkVF6VqP9DwTjEEhjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRfOCMgyfHyTfRO98ceuZSmtVw71Ad3RPeRfYy0M+4yPZyVl+Zc+d5P7FLK2RCY6amoEKE8E9YvQlB0HhwLimU7MV8lGX1vmR9SnP0ecAFqpOmApWhn40917GABFcbitEB5pzi9dVoemnx2NsMAXwn0bOzgFXXNdu6f1bj6ZiQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHhhVjrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xa7mQ0R+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHhhVjrN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xa7mQ0R+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pqmV1000695
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=; b=jHhhVjrNUw1iOuwP
	yx9xHNU68EVXImp3wcBTnlUMPowCBALxxLu6a29zK+eRU2e5Rm6255/lU/M2YnMh
	0dtkZXQ5iLZozDI0a9TZC225Hip/C5slJdg3c+j+EYKVntEDA10rtL/D6smDpSgC
	C2xD+0wdCfiXGEKsE5rMXEgdb2sMKzhE1/YUs98HO1PAdpY1htoxjElG4uMnYFua
	SsO9aV8pGlm6/3twZ2PG1Wvua9e6x4iMwF3ySvg4FqXj8WYqhhAqtmHUZuu9uKXm
	1QSyhq4CRUf+dYbJ4aHu/80efzlJxWWvLCgG/DQmOWCjtCkrJHp/0oHcg77SnbH1
	MnrA0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvrh9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:19:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so139574185a.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031977; x=1789636777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=Xa7mQ0R+zAdGUqOypjY+4JLyixlLI2/dQRM2rNrIvj7owcND6Nr4SEMK9BnY8LpZcB
         pNAm/sPsfHKfSfgieM3qYc/JqJNvhEXOiFeK8saBoG/RzXaEtZxLx3pUiVElbdzJ2oon
         ogFEQXdY9hXrbCXmpsTNDzuPQs5OMXe34owX+fVi3Xe4J+/gxzdoJoEbPVGad6y4m/Hw
         rfror8RVBfVmYycdZQms+W3QdmsLeSuyM8MDW4qLjGTykHKIdUBCQpOoSUy28QEwG3vx
         KAuCRqqs7njNf2H2D3Q4rCvomuegO0+ke8VtmbcD5G9NEP2EwvIjJf5Q8Vi+EjAkOBG+
         ivbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031977; x=1789636777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=F7CRgPD1fTfScPVRxfUalZVXlPBAzBqUIqgJzkP14e7JLtigWtBG67h1gvfF02k7Cm
         MaOYrQxP4N/Nx41iLr8tViZ5Vcon+O9pEnvw4CQU5JBfZVX/SNmj5I3s0hzeLeO2Q6yw
         o1FLv9YSFZkzg9/HV6n6vWaXuICFzAyf9r70Nps7zrZBjrsz4dr1jQjW1CBfy7A3Xsu5
         iiL/TOyvLI/iZzEUCDKQBKlVY9rsVtTQwMRufogqr29CWKXw0snWfgNCNZLQiWvlvVSM
         LePjNJSwprN3GDVMvhP/1QSt1kIpMEDZzgGkkYLgMvCAgYi8WRmSAY/Opxdux1KIsmUP
         R1Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwACv5aTnOgRLLFQDM28Lu6jRwY1EpG7W+seYCrkKDt4gVFskKay6cMaYpH2uhQtxYDz7ZsGi2Rz95j@vger.kernel.org
X-Gm-Message-State: AFuF++mfeoqTcnwXskasTUqyTVUoTOYPU1WaZYG6Ie3AfhBvqdn48sUA
	m/LGPe0bsWuDj0dQ6IqDpAy3s4KTGC4ZadaNUAj2OcV1JLrJCA93ERyjM5+f1Rq3ddAEbeJIaTS
	CRDjeTkG3p+ya08auQUH9mUVjUhLU/Lt8vhwOFhXMoXn9n8MEVpgAzXZjscl0Kbh4
X-Gm-Gg: AYBFou1mAf7TPU5O5PrAOQXLgAvFayKjarKgcXOOVJ8ZZ760LJVchTCy+cvY1aBmgu2
	IP8QQrJWIbFRUZKjw0QK/RRx8ldpm1d0Sbyiwh0NEzekQl468XNhVd/n8leO2+92r8LZeR7tVzK
	xrS/WLwN+t2eYNGEoyxUSYvxK+AsBwX8rmU41hHBlmKt/lKLrtKdQiJowzTRIFRc9kndcq8Ap83
	/1XCMtPArhCu5GcSyshan1IwaCbGUmCIXCtcGQDva4cbz0cjd6oaqXCZYLEgRvrwxMRSDXdHxZp
	uhjiNaNg1YZISyo4jEKg2DM+xJFF+vEGU5bt/wosT0EsoRQ831WoX+ECmMz9SGodvCbrB9hmWPI
	pYkVZ7FsoOLWaCAxBJ3kvdw==
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425512285a.1.1789031977639;
        Thu, 10 Sep 2026 02:19:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425479885a.1.1789031972468;
        Thu, 10 Sep 2026 02:19:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98505ec28sm2830486a12.16.2026.09.10.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:19:31 -0700 (PDT)
Message-ID: <6435193a-caaf-49e0-b219-ba91230014d8@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:19:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <178887481187.4612.2819576206036967152@gmail.com>
 <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2762a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=oIgkIcNInMogrUYK5KIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX9x2op2o+0yAl
 CfHqhUv5KCVaJma8+FJ/0w9+8xTYVnZ+EHg9W+wkzvkXJn2TZ6CpwO6h3lIBkeMktYYhlNDFuOx
 MtspT3C5+d5yL3wpA6E4dId6sZWidTkv5r3mo5ma1uDprw9Y2jng1b/jNdb5Wxt/QGShXvn2ZAp
 oEA0x3P2hhX7AdVdA1vbKnMwmo+qE2dgFOLtIvUmzCCbmfiFW8OKAVgf1Yg5XeTVuqhY0mRge78
 ZEouKieh+a8pYCU0kBj7CIhRSXbEUgfxctXbWCZPjN9BCZH0BPG1BUhlniBdRF0ulLAwitC3TAn
 IoCU2TB7qVcqoupst+s9yb0hVbfBo9+8CXkQFtHNJkfPXFA9nBdxg7KtBAfRDTE9zQcdYXwNSWO
 qsFVJKCn+AEEHUiAAKKBMZMHwbCkUTLFk0u59Uq8vacax6gHkA+HciGBqbG0lXJz3n7yPR/bpHi
 sL2OQXTwNafqEhdSKuA==
X-Proofpoint-ORIG-GUID: 4CEIgu-T88rVvv0jVHYkpOr220hKN9xw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX2R3JtaEIETlJ
 l150XIeYSddZe4VCe0fXDyqFmk4XB/119lcfpDvuXKPCd1+Y9S+wIiWwzKGS32kI+/N6m645hLc
 4u2MaEBdk00T+8HhFXLgx/1zIGF31TE=
X-Proofpoint-GUID: 4CEIgu-T88rVvv0jVHYkpOr220hKN9xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100104

On 9/10/26 11:10 AM, Jishnu Prakash wrote:
> Hi Oleg,
> 
> On 9/8/2026 7:10 PM, Oleg Keri wrote:
>> Please drop this series.
>>
>> It duplicates, as a strict subset, work that was already on the list a day
>> before I posted:

[...]

>> The camera works on my board today despite this, which I would treat as
>> luck rather than evidence that it is harmless. It does mean your series
>> fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,
> 
> Just asking, have you noticed any boards doing this currently ?

Not upstream, I don't think:

$ rg qcom,pm8008 arch -l                                                                                                                                                               
arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts

Konrad


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8695A32142B
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120244; cv=none; b=CKqyI+NC/ijwIxSt7VpIK1p1vvrM0amOgqhe3YDcwRHw9eA5Pz7FSYpi5/E6C6ht+a74qvDL7SkMZQhgoFPPB6XBxtEVqCo269NpzLln/Nl8//3Qy9vmdam1SNIIbn5ZUPtaj6chmEwzF9DwTdKj4yZySzTy5lzbsxxzYRLZDUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120244; c=relaxed/simple;
	bh=gSxFOsowoDl0iP5vks3jNKSdjjPdJuAGxSqU4gowIlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njtGhay1205HAqnpO7RDw6F0Lf4ohukIGePAT0m94YpadtxgwknR0Kd3Fsq6m8+R43x9KKdC4SXw7EvUZwUxuUurCEy6f9CHss+PE0XZ41KVrkWREn8fQZ3nT12I7SnCChrq5E/8lETmaKVFYYErWjQ6ZNEGs/naukE0FMjj9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF1k3Iue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7zNrDKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF1k3Iue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7zNrDKc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QgIf1551206
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGC7undiBQq4aF+qMpkovLyUIFDlJW9+4j//dEMPgJ4=; b=ZF1k3IueQAdW8o/o
	2Al0TIZLU/ndMc/IYAVodT4qksDciy6mx/7qHo++UMPrXPbjGD54twC4Kdmmyb1r
	sA0QOJbzBXyFX9//+lzpNibEUhTqrqnYsZTsJQYyr4OWBkGAyI+6LbaTM2Wlhz5M
	zTNmzR08ouIAmOpD9UlvrgQKYs5XsQNM4P+aikKZOkHEJB9wIq62ufWbi++f3awt
	OjtXr027jec5DhJCpbGly21HOgOnHVyshMcj8GKSqtvs2qL+2lF+hw2q3JOTwP8K
	au+owg8SVRx9puFtsRcBDG1ctNV8tjjYOzY40XeNuRTAzdrvFfDL/o3HKXGUMce6
	Gw2Azw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9hees3cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:57:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfe29579d5so19661185a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120242; x=1775725042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGC7undiBQq4aF+qMpkovLyUIFDlJW9+4j//dEMPgJ4=;
        b=S7zNrDKcKYZSXdcoZ2RsmSTdXZAL8zVMQWk3b4ceJKUXibpDNRrjlmsFdcVzkIJfK1
         cEHCPsECgodsgeCaDxnulhh8vTyeYsWdYCQFHELw3h5126pDTgbsyGVNJ2dkXEBuIPQT
         voDKYGNdQetdMo5nB1sQ4s3U8ueSZ03NEatGB/727Q0dhAdZ1ZWlSf5XaCODG8LMm3iW
         Qkl+LYi9z2qBNCcByWGURLI7hxsrqap8fXlDVBhQh4EbNiLIUWznQVReZSHEs4nm7NDy
         fT9yk3G38x+4mb37h4dpjEBW2SGpWxaZjDEtel3bmv/BxihLKnq5HduD9sON4WRAmxK+
         uBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120242; x=1775725042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGC7undiBQq4aF+qMpkovLyUIFDlJW9+4j//dEMPgJ4=;
        b=gjA/3MGKY/R7x7QjBJnCRY4eVHyAvSy8k+56HmuuL2hQvoHQZ4wJYU5IwyM0XNdjbT
         ZIqqxJgj5Vug+NCz6ftElwo4PH/vVJexj5kbcWW9j14wDAf3/DLOJgGmjK8UzoXIBRKw
         OBgTkTHZ8eGNDWiMhVRc/1Ct+swqAOPo2hffaIxXlfcenRlHFTPN53LmM4bDkPc0HVTp
         EOaGI9OtDr1vy/6aHN/4FyrPTG0DQICWnP9ErOFEyHI7GKFywpIn5P4kIxnPNwVbSXkg
         yWzbmBJYLrYn6eD0eJ4Ln9oOmkR94HqTKXdIrWnYpFvLpHAhgopJ5uh9SmJozsiJxzFC
         VXQg==
X-Forwarded-Encrypted: i=1; AJvYcCVwzfwW4JacSpsDTVuDMGReempJCrvPHdsvUjKNqXuI8buyiKAdnX5dMKe4efKAqW1BHx9E/ixCCTvi@vger.kernel.org
X-Gm-Message-State: AOJu0YwKOZ5SE3kcLcg28QqN74yY9SfUgqKuOET8Qks5eD3NZS1P7Ufu
	mPO3q7Ksd95M75syqBPAqx4qFFL5vpQmUu7M5oBLUwsWlGhEh0kBO90rzlFAdu0KZH/FQX4n17N
	QOslxWV8lAMYGzqUZRvmX57mqDu+8KIUJ2iK3jyf/I/FVpCni+olASswUyDKKaGM2
X-Gm-Gg: ATEYQzxCKMx9LTO0+NDxBfdag01c8gmTACRD2ps6+ASsY4ySq9VgKuGjRZ00O1XCtmI
	mhep1q0avtuocw+OfuO4CMnAtDmH0G9dCQSwrGeD795e/bHmnzq7vIOv7s91Bz530kEZ4xjqSQ9
	mkfvBm6OHJpcDPCW2vE2ZNRY3RM2tC3YNybO+a+zwN4aw9CkR9weZYesg2HALY32isf3YaJaIqm
	59Au4iCEdfY8ELxfDI15xvIvdAhKEpfpsE/Z2fZNphUENkQOM9VZljmhOPfh70mag6tDYE0aDV6
	X9/sdV+wGJqhCIOfWT7Te0Gypbu7xzfFLQKBNnPjZztdx9eWM/GYpkojeI48dKCLdwurrTUzTq0
	68UsN3mH8Jeuh/TIeGec/IA3Jfaph3aQbE8fdwDsYcnArpVIqE00Y7wjXnHmE0tKFk2mFlet+XZ
	GcQRk=
X-Received: by 2002:a05:620a:29d3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d1b5bc1729mr751144385a.4.1775120241785;
        Thu, 02 Apr 2026 01:57:21 -0700 (PDT)
X-Received: by 2002:a05:620a:29d3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d1b5bc1729mr751141985a.4.1775120241264;
        Thu, 02 Apr 2026 01:57:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a787fsm537156a12.14.2026.04.02.01.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:57:19 -0700 (PDT)
Message-ID: <2b94ed9e-b4f6-494b-8fd3-e45f29d8d91f@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:57:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8450: Fix ICE reg size
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
 <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CdHEGlJOLEQJFwjnE66Thv7cxgweqfoq
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce2f72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ADlz52F4lO6kqzZzDJcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CdHEGlJOLEQJFwjnE66Thv7cxgweqfoq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfX/gZhtVnPmMfF
 RjaiWh8kK0xbXa6gBBUHsKEwU/82PwJlvN4ejjRqq807SmLkKOXdfDwH/ciNL9Yknq21vyMOWC+
 psN67KUk/7fq+C56odx+WgR7w4MAqzV7GvkxFccDpApp+K7+JP94rLTZZSM2FR9flnZWPW9yiDd
 +/sYqCg4cIc0CdfzHdH/SPjTSgiFvqIKgX8cvHd2zDVhtXZgFGoyWyMXjPmr5UN26VLL+2wBUEZ
 hH3DI5b9E5alFYXHKfuIVxf4jCiPUVv/CRnkLlcEg8CkilXCE/oIMw8Q6Q9q9x2PyitY6mv2eZH
 v2s9zzpZFXC9jYaNTzAjzi8XZP3I72yHpJLqOTmchNKA39qEqMEc+gLzcPBjefO9tpXifjgT0GU
 zdENhn6vVJPNSMw/XO2pIPfzKit3N3ihGYzC9tUL/8W5aM0w7WDx1G6MnWe4SSzadpy2zmnSutc
 +HkcyY912PAtcxaCiTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020079

On 4/1/26 8:35 PM, Kuldeep Singh wrote:
> The ICE register region size was originally described incorrectly when
> the ICE hardware was first introduced. The same value was later carried
> over unchanged when the ICE node was split out from the UFS node into
> its own DT entry.
> 
> Correct the register size to match the hardware specification.
> 
> Fixes: 276ee34a40c1 ("arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

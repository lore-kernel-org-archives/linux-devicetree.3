Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A037F00D
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477987; cv=none; b=ZnLIv5XtXAA4XdFPcvr5G2Po/0p7QyD2bLIxQYC6mv6WaR8xi0tEiuxiEcT0wo/fpVKnDRgZwie9SSSZy27wTmw7frzkwxJdgnmOIT2GEQ32Vb24ZVvanO9YetrGvHgPXCUX8QFpvarvSy/Ymp9MXXe2UZDvvhNlwr/qnhj5s1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477987; c=relaxed/simple;
	bh=TGSz45bAa51GW3JYy9+OgEGO1IyCbLKsvBst3zfkub8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HK0HN9AplD5T8/Rm8ppbBpztfhZuPpIz5ft706ysEf6wwME/v8nOiETnLfw9TiHAZRMyjzFANtMRrMkBLtH4SABUhMlCXlpMFvJmaWkVfkKYi0j/oJ5d0LjcHSwceAPcjyvdkO9c/IWwq3loJYgMDdw4a41STjqTFqpgpGqpUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edONtCl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ds8/5X9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edONtCl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ds8/5X9q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFTjkA1641981
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsulGSvKt5+B90X7opqTC6uDAze5yO3lFk0legS6Ob4=; b=edONtCl4aA95CSAD
	mpMvPYynHqhy4nyVuIl/VzgvFFJ9eqUmH3L0eblb14g8xJ0rgf4LCN0wg9LgU6Kp
	wybojh5/59d8Gr0VsU060ITkDWuGy5uIGUtxuqhkq3LjDNO9SYqoBPwc+7mGJcWr
	ab9TlKYpXwqQpE/7/UM623sG0FshvbCu14dcpptxtJTDCNSqQazAzXLVz96usV4d
	KUWNjSyeLVwt3f2SIve4fsFPJXtn13ANWmoVrR2dXgjQkpDKVQHTj8AQFOu1QfUA
	zYbB8xUWrOpUTVRSb0y6wekHSFxB0cv22iIS1Pbeu+Od6n8oSkhCES0SHbszAbDE
	+11YTQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj829rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:53:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c6280732so14429246a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777477981; x=1778082781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsulGSvKt5+B90X7opqTC6uDAze5yO3lFk0legS6Ob4=;
        b=Ds8/5X9qladdxLvFA5dliBiWsqqARZzBv6JLYyBFJ3JPQ1qdtY5lDSBHG7UjxeWDNZ
         9FtIwGot15SSz+yFKCe2gGCt9NQrM+CaSAh/fqvpKueuD8tUBdVwoipbNdHGe55IJYMb
         shJhXgXqqtmOxLNH56r4dQZBxxpcu7h/aOhrl9QUSZwyc2auYFF4iqJ+Ek1elnccVz4z
         tiW930tisHhGZWyMo5sRZZxeFFTnRXNuZIbb90OiZxJTtqv5H6FTiwV1TLm6AmRzBujI
         gSdfBWUvL7z9uG1sTGag/3JhV0oX5zwPX3frkDzSGwgEZhAnA4yCa5Pgw/hF2vvtjrEm
         Gm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477981; x=1778082781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsulGSvKt5+B90X7opqTC6uDAze5yO3lFk0legS6Ob4=;
        b=Jk36yBDc/qa1/vvo5dcul81Dqnf0ZR4wP3YKy4BCQSYHq95D6JyWdezpcpLKFxizJc
         nMN/V3Iy73bEck6t1hz6miIKidL2MPRJAy5wqD9d1yCOn0jl12t0pKlX9CnRaAh226GQ
         TJY3DGg6ye30tHDNIQHvDZ+3lEa2ZbrNI+VGhcNWycM1z2JOmKPSSTw8ZICOxy78VxsB
         YS5d8dqEI5p99naWjY3k5xsp+fwu3mowhduoJBW3eOpnxZuGjgIzfZ3HJN/2dF3jwo8N
         ANZREVydOUXrqaOg5pEoaHeWfvxOjsh+Y8DjnwzvZ9kQdHQccjDiIQHOpHMm/CIywNzp
         sDlw==
X-Forwarded-Encrypted: i=1; AFNElJ+eVMODPmswn/9Fbywiv2cIWAv88iWz+GUznJyHbnNWCcEJCNkLU9m+1ZNuZ/YQ5Q2MQUmKDM4kt3sv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3M4UasW8vI4wkQP6GAnlPOSlyl/B+UMJqLjjb5Lm0Ufc3OdsE
	shZbtuGyo3rp11u9cMUbdy4sQTpnM7lDDBIcPEFTnGD0opoxyJ7748V/4umLHg2X7oMKXuVPlGf
	ljEq/JtHq7/pjKv6/r7N0p83OZqlG+EN1QouTJZ3wxW+rOMB77x3Ts7HzdyDWbjfmPAEqzcmO
X-Gm-Gg: AeBDieuJT8IK37Xy4dPZ/JsBi2AdiHFoenDAVhnXPJtA5tK56Dx0jDd9tIOZsYeHdRm
	Zq5VF/PsfQsykn3mX7PI4FPz9Xu2w099N4kDRDpjahOS8+azXXQWmpTxNdOCSNN6nCaLuNInaiT
	5MxD94F87x+TnFF+usdEe8DKQsIfpbWOQJr19GXgRdRepNrLogPZRIUL8gcq0awdNBRWyVdNMAZ
	YWkiszwqQ25g5eWOHMTOk05lruCrQLSRbMOINNYztdTnV7NCuCW37NuexQHD67UVjhA3C9DNHvU
	O+8x4Tc/kttO8vQsCFUKwf7fj/j0GPdo1gl7j6zSy1hOThv2xW8xw/YmF+ZfY30jw9qXwwYQPSi
	zq0RcopZps+U+LUmWJBzFf4XHw1W+mcUSLuCtU6RJ85IHeb2IYBGoXuLbyvfFiZy/k0c=
X-Received: by 2002:a05:6a20:258d:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a39c174b39mr9500666637.14.1777477981551;
        Wed, 29 Apr 2026 08:53:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:258d:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a39c174b39mr9500615637.14.1777477981057;
        Wed, 29 Apr 2026 08:53:01 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6514688sm2588534a12.32.2026.04.29.08.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:53:00 -0700 (PDT)
Message-ID: <dcdd1d49-a1e4-4c7b-a29b-187b2cbbdb7a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 21:22:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
 <afGNdfKrJCzGPy6y@sirena.co.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <afGNdfKrJCzGPy6y@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9iYuqw26In8Wq7WI129F45h3CmHo24Fb
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f2295e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=wpQWusq9l5L7COxpp74EdQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8pjqX-Atbf6zV5YDAiYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 9iYuqw26In8Wq7WI129F45h3CmHo24Fb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MCBTYWx0ZWRfX2iNNOJ7OZTgF
 weoIkLGo4VfvlzD2FuCl3gXyi9zDHyDjPKiv40N7YdBgblRWlqtLLMxBRXAsF1cxkeqXBGUuiD7
 OzhQKVpPxyTJnu8arkIGvh9QfoNtSwrLZR9xfIMENohWFgVSMZGPJqs3LcF6l4kyyDys3aNkg7n
 Lpt79d1yJ1wU+ljISUru2ZrR3B8SgpTWOI/mpwIncOaV3ylcOKbNe/MvqOuFi/ZNEO98uxxhHH7
 y16aTOGqsE06DuqAnUUhpc8UEaWT9IxY4tivdtXPgCHoWA8B1+XvO/2TrkcRnl4b9O8Gtbo6Br4
 9y4eOdG0oz9EgO2fs6/WIKEr23rr14sNSTdbvha2hm89ZtwQU7BgVdFKngNQqIrcniwLNouOmgJ
 L7gJ/v0h9h3VqS2KKfX3eRAlbYkK+F2gV3mfRd4+GQXwx4HIcnz2+JARibdZeuN+gDrKIpT/X8n
 NrpxfmfzU+gzo3+jDCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290160



On 4/29/2026 10:17 AM, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:52:39AM +0530, Viken Dadhaniya wrote:
>> Add QSPI controller support for the QCS615 (Talos) platform and improve
>> interconnect bandwidth management for QSPI controllers across multiple
>> Qualcomm SoCs.
> 
> This doesn't apply against current code, please check and resend.

Sure, I’ll rebase the changes and send them.

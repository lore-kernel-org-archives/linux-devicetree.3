Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC7D3128A3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094020; cv=none; b=Eea0KkAJ4sh0vc47+XWv3QxY61G+mwWZkIeMzvQ6bqvOHJ1pKtRZa7n31/4JVmun1ckK1IpKUmbcuDZZp7iBeeLCsc5uQYBqglJAYv83LFQ6qqkenxm/KHbMYBMnLeN3Mvhkw5lZ+1ruTKwK26ARsVUSpBZrCgvYD9fcNe6ZWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094020; c=relaxed/simple;
	bh=n05w7UKa4EOGpacFVht3bcetkCd2ImYv2BLEkQIR8ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lL4P5wIpSXkWv9fGNCex7MNj1fVsLqS3uDOmvLrYRZhZ4BXMn5OrBWr7PGyqMYB3beO6SPazIIQfsReHn0bY0WRi7yz/zNFHwVMYcnGAvrg9TVwB6Fi9UNElQmtxifE4VfDB01g6uO49HFhMP3qFCFy8E+zjVYyGRMJLjWaR0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rro6mXnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1eMuy+9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rro6mXnw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1eMuy+9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC0WJ1606472
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=; b=Rro6mXnw2bwZJ9kd
	tAEdKPr/Yu453AEL85ph0zrTEDSXmP1sU5EICBb9z2bS3+SEOxLbVbQV36x4tyZu
	JRQGSHrMl03F1jaA5OoFEkE34A1ez5Up4VY+4DmYrHsaJ8N1KZwa/duytBYycttg
	aqxqjghoYF+Kx1uqlMpX8kaCWs7ms/nR2OwGF7a71RQnvSKiX4VbTObbSSgwseb3
	rUeKo++PUvWmrUsBlxrM1fGRfHucZ7ZCp6rTZD4t9o//boO/Z+AiUNQweWEsdW08
	5D0ctAr0b+2Mch+G0ccnCp/bHHmiVrwqxBj+dQfgUB/a3rGsnSNVu6TGG1MWXp1E
	Hnnzdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9qhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:20:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91571f0d3e3so99083785a.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781094016; x=1781698816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=;
        b=N1eMuy+9ess7gU1xqQ4AqLL0ZGtWWZwL+hmCdfnrIAsWyBcAzOaMYa/ivX/S9KEMT7
         WoNAKNAbZXqPODq5DBfIbWNXHAXDdRm5cRJhBxMIbdYMqJmPcWn4ZaOYLBiRyX4hEiWq
         5S1IrfulhFbvYgJNEibVJ2WFUIosO7pkql9/NuRrirsCjKlYy7BUbY8QznpktxPl8Vnn
         4LNo1oJNaRU1TO6PFkz+sqw7X1bp5Yvfy5+TsUyMLL+xTkk5bpNMvLv4Jre1GNGmjZhZ
         F56QcrhJnySdxATk4gJlnbwnZ4Moro3tGdDvBgieK//nM8KkT/7HmI18fB1xuIYdLdOb
         DIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094016; x=1781698816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=;
        b=PeU54b6BCbtmtviXaPvA3d8UYAhbnjZRW+G36lso+JJTLnrhc0micYnjrnkwvInssp
         rLgJWrUjmkqGzk2g7QA7gesD+0Zo7yHUTB6NyiFRxz7E/GyDMPlJpwsx3dRwt0CDyQp7
         mWwihVPpqT+wKnJjAa3tI1pPS0WRm5zKV164ZVPQUhuL1oGV/Fn/n/6KgVHQruh6U6hE
         wWif3kMeFsIBjgIXAcWLGKYoUpoveoK5NjgIrtu8qFPttjIIz0IkvswaBgoXOKxpaPGb
         0sj8RVzXHsEpded4tKlVbEJH20ii0q4+sV8qobjqza+0B+JVEOss20WtSKCjed+o2LiW
         0Psg==
X-Forwarded-Encrypted: i=1; AFNElJ9DRIhQUyDe+BDDrGnEGIVDHAEkHnJDSmSzWOdqd/fYVwkMg6sj8/iEUY2LsAmy8VhJTvVcGiDoJGrX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfsu1aPebHrraC/eh9AHI3HAYzbBQDWe7xni2ETRaddQphllfW
	uMR2ePigMZ/R8km5wnRaN5nLdvmZXupUtGluTcLBOUtQGdCbfW5fVQ9TPRLywWSvBPUbEZZmGmj
	0SXKeVTu8P7GKAs8kcoJrFtYtjD/AsnAgCHAev848PHqZSAzZLNVa099+vtUCad6h
X-Gm-Gg: Acq92OEOZDHhE6oMu6vWe5kXawTJ3trmggPL0et66XQE1UfIcclcf4jGjc5j3yjuaL3
	88Pe03gLeYq8FJSNt5vin+WiRD0lxpK+c5i8TZWsoEAg3bylXhZGqerAA3oy6mxmp8bQPZ4YJix
	AFyDGU/OsEMleelCwIOJ4EIeYv+OSQt+2Iy2vGypeL2d7UNc9V+zf2enTTKqVb3Hki2apVClcz2
	gMrjsQ0E5L5zwvU0WeoCPszjgap+prih2ky+6RGGVsJprSwHe94c1Pq8L/h0J+0RAV9wgJgIduM
	JwwVoK+7wUvZ6GU5gZ7EYT5Dg9FvJA0Vc0X0mYqrrcmRXUw+d71qAEBOYW/A/n+4YilCdGop6bs
	XMIj2sgz6FllGJoz81skuQdlFWBuOknnOZX1AwZMRBGFMAagAoa5OfC8T
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr715460085a.1.1781094016419;
        Wed, 10 Jun 2026 05:20:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr715453785a.1.1781094015831;
        Wed, 10 Jun 2026 05:20:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm1189730666b.38.2026.06.10.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:20:15 -0700 (PDT)
Message-ID: <29e58a22-fe1b-402f-81c0-e12e540730ce@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:20:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a295681 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B3kY6bDR6iGi-FOxjEwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sLqA6c0vwaHaLBG6pWwCOJ36hOkxHVb-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExOCBTYWx0ZWRfXwQFmTVLHz97j
 i2xtXw+WG4z1zrQ80ANzaGuYe8rS/HZEl8/+Mg1jFSf4JHZ0MRedIuhhGtNB+lvAk60ii6ArHb+
 iacF4o8S0zQWfghiQsNvQhqYlZtlcRuFvZmy8HEaKiICKOvnZPLCT/1cM8E2gQUbP7wOni00aWF
 +bXubvVwXFuAeOdYFbgwijwGe5O1C19DUxzdYfUEiRL2D+lFC6harkRleMq0lGuLy8ojVDfebU+
 JBH2ZS7Q9tLk7Kk3AlJU1bhVb6HcYHJa7oyZKkaEG4ky/fPpDuzJj64pW1f4QSc5QNtPU5hby8J
 Gwr1iSkA7gcsiiVdg4rRih91o1cDbu2Cvsjq2W6M+OQUZnyFFUS4FcfezCAyvWRMzlQoJmoTJKk
 2WzQs76PvQ1clITdnWl7YU8bgZTkmsByOTcRHHhHxwxbPC+mFqOSiIiubLUBFkCOYa8yKHHmYk9
 ty1P0z+SDm5wfMY7veQ==
X-Proofpoint-GUID: sLqA6c0vwaHaLBG6pWwCOJ36hOkxHVb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100118

On 6/9/26 8:00 AM, Vishnu Reddy wrote:
> 
> On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>> MMCX voltage levels.
>>
>> Add MMCX domain to the Iris device node.
>>
>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 7076720413ab..6150380795b8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
>>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>  			power-domains = <&videocc MVS0C_GDSC>,
>>  					<&videocc MVS0_GDSC>,
>> -					<&rpmhpd RPMHPD_MX>;
>> -			power-domain-names = "venus", "vcodec0", "mx";
>> +					<&rpmhpd RPMHPD_MX>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mx",
>> +					     "mmcx";
> 
> With this change in place, the backwards compatibility for the incomplete
> SM8250 ABI which was merged from v5 in this series, which handles the return
> value of devm_pm_domain_attach_list(), will never be hit right? If so, we can
> remove that piece of code from the driver.

The point of backwards compatibility is that we can never assume
that the user has updated the DT (because e.g. it may be embedded in
the bootloader)

Konrad

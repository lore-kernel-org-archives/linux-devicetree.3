Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C94BB284
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676487; cv=none; b=N9IqGxA++3bcytN65VorIVSqUFavfLl9uW4rc1ku06E8Hc7QuIdF8RSzHN1CUcI5MVNkAUuP+SUpQ7dku8lAYniq1ndcw8YZ+w8+PRX9qmJaODV521ycXqRjFx8CnYbe5VPG/KaXDDbjZ4kc6oaYAAVy5nPcdLN4DuhJ83AG98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676487; c=relaxed/simple;
	bh=vNUuc8jLi0AHoFh021MS5/u+VB4q5gBEF9MEa7jPgE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gYCr8FwqysB/bA5pzmeoFwxjCgsGcOkhmW4KWjDnL/pWS+POhEl4MQFRJbt76JtQq5KR+86hJqdEWC372bh7Rz1dXwaEgwQHVcQUb/XQ9KNBRzgHU66f5lAdfGVrVv5D+nd0DwxR8pngAoV4J0a+hAY8PJn8gp4QLasR1DBckKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpXcaoh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE51FU6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpXcaoh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE51FU6a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tk8N4097688
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=; b=JpXcaoh3lO/O3j+x
	/VTLyyhJ412SkrwiEiXtPqbhnbk9R5s8fFi5V/9KQgjEtojcqO6etg0XhwSfBBec
	q+vUgXY4jODAYA6k5/1RIs+IUPzvL5uq5IYCbmCpNottNBImUZ1A2YAj6jwMUPuK
	h/CVr27SdOZJ50ZfsE272GqV9AzD+gT3hA5dbuxutMmHAQ/uHoTBygka6sCp/ios
	kyfd7VYQ+vK4dYGAQKuOieU66e99jxiPliFngb+PalXD/NErol21sCpiTYxvS1K+
	rXKvn3yeqRpsPKmBrhddnmRm3BjTvtJ9Hwx9liBvpZqLm9Kl3N0WyYBtdGqDdQ7D
	BYn3aQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1vvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:07:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so6751735a91.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676479; x=1791281279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=;
        b=XE51FU6ayHFgW2icoBCtrMHw/xvDhPxu2TBwh//ix3LSeeJ5ODVTfB9rDHHB2UFW7U
         XKVyFBVe0gY6hLqWFHK+wyQRicw3uqVtM6LTkY52NKEWTgEsYfFlnGx53HGCO1sQEQIG
         vpMpa4svcLapS3CjjeMZzBrkHrpqQ/3PnIUtmm93KphLJPkkyrx/i1Ar2lG2qco0GroG
         8YQACVDKsmjhuruvIhk+XriDYi8HEL089PkyvZWaMTr+79jgQyffvfvKjHzUeP5wqo+J
         pyzPXYftHxIKW/yIJb+pk14TFIPF0TjcQLC7eJcOv+oS0GQTGtu8d7AmMelzOdWjOi06
         dgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676479; x=1791281279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=;
        b=b3QiwIjsecuTrf81Gx67g+5SGBqmvgKl73BV+ej6HnoJWuyjkfNmqZpNmIhNZ6K4Vr
         GEiE2l8etw9NTQ4Sg8dbJkMjRA1uCEq4oxI7tzM5IkFxz7L2v8JcS8j3AMulXz/2dvUn
         F/PAyKQYQ9o8TjKRX+D9vsjInjEjKXGCdMzl5dFUAqkFu4SsVkRFDR3fFdexXyirK8rm
         tZolcwYHo7s9sgNAldBaU3UdsNSYPCMa/HTClwfJSomS1vowzRtGoodzGnEWP9wt+kw8
         vPmC2aE5zIEZd8MCp6zet+2CwxesHAbCyJeyskHOZjArmilXvmpnyEhWNAblxPsjAhom
         efaA==
X-Forwarded-Encrypted: i=1; AKwUvBwGehl9GC20iEFTJ5B986qjO8E01dqvP2MedecVU8oSk5BbmbD/Sdqv/OyJQwcG4nPxD48TUpNC06+U@vger.kernel.org
X-Gm-Message-State: AFq9FYIWYSmHahFAiL9uhWSyuuuqOrlkuxQtln3OF9URV06wJvh/k1hG
	XcHJU5MVoAUQXkQcE6tbt5l0cOk86YWtrBJE+3P/n7t20EQ31QHXxjrZFYPT96O/Wa0E4FmPzCV
	h+Gl/vHoXhjTjZYuFKm821EQEL84FaKTP/4ibwjIAzlMl8GUOTeFuBBRVbcDDze/A
X-Gm-Gg: AYBFou1yqjTEkASt+1/eTZLEw0Nwu8LUiHIRe/GKduvfOg5Uto1pJT56JBfc3iLzaqT
	d9Bez2oVkDguEocJkLRNXV6aqVdRfvK9BGVZfOJTtEiP260j05TBZ38+ptSm5Tkn8mQwSZL3RYP
	9N2hnNCo7jb/jnYrtTEvMbGF7cewzkAzbFrB4DCg87yKvrKGeQOC7uT9UNzbkRpmJKuCAGLR576
	M3ouWVXqz3eZoX8JFYR0jzNPNpZeVgS4fX3vRjlfzAdvoracAWiK6zgHpXxehmuVsfKJhPp0eEP
	VzHPrHtiLAaZ/vSatnnrTwBYyutVEC2+UDG83w2O9oukOhdzBoAbdrJj1ittuisoPxqyrdLYhng
	X4m3JTm75pUpbg8ig6wf80AjcpVr/eG4BXr3i8dgpjJJIJosoUkCqkqzXkFffJCiNZHr0LcNUiq
	OFvCURmQzOl3ci
X-Received: by 2002:a17:90a:51e5:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a0a83de3c6mr8184039a91.17.1790676478710;
        Tue, 29 Sep 2026 03:07:58 -0700 (PDT)
X-Received: by 2002:a17:90a:51e5:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a0a83de3c6mr8184015a91.17.1790676478241;
        Tue, 29 Sep 2026 03:07:58 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858c123sm5582977a91.3.2026.09.29.03.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:07:57 -0700 (PDT)
Message-ID: <23a709ba-2175-4770-96f4-0b09ca9f0a98@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:37:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <20260929-cherry-seal-of-current-bc1b5c@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260929-cherry-seal-of-current-bc1b5c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MCBTYWx0ZWRfXysl7MuIFQSLO
 5oOhTB2XhThmnjz9M4z7mCA01NKoNZJapmvDvw19I7ONec5AJhKqMEJ2+O1lyEniF98p4Wm0VIq
 6KEgx5VciVIRZuLHmnooOXmDYKQn7NI=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb8dff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WLWG-EKfj2tKRMqETdEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MCBTYWx0ZWRfX+tIOmfY37L+r
 cCxpk+qQw2HQX97KXT9zS/+lKYN2aZPehzgQpZvGDhATvH7cUYMyEjD3vtkcJQjkU9TdwQ4KnPB
 VR0XbKuj2++aj3A+oQnuZDoiTHlc42/fvnOZldsUdG7xckEBZ4acU/55fsiRPwqy8WHqhPZajTH
 cEfatrEAfeknWPsjxP004BatO+OMKOjq2TeKiu05Vater7frYnYq5ct/v4C6TVEwuMdylph9t6i
 jBQ2K6fuqFrcNpQY1yh89NJ95JtgukZ60MtL/bmNNyI1i827BoVKuSAjCg2XPlyorxznoZOcODk
 SAxv8kGU87vvJMPM39mgXGTHwCVRMZz/shMHJ02lvr3p2+CCnpzJcRpZdXYThC5uHp5dGmGmrBY
 wMxXeoDs7ON+QR4svRE1Y8PiQ7Li0EVMqqcoBhD0JAu+W09m0PtI1QiZp5Panftdwe2O8iLfYab
 prN38SKTm32ihPNfSZw==
X-Proofpoint-GUID: xG_xz7AZQIYP2kmsHA-85iuzfNjgbInh
X-Proofpoint-ORIG-GUID: xG_xz7AZQIYP2kmsHA-85iuzfNjgbInh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290040



On 9/29/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Mon, Sep 28, 2026 at 12:06:39PM +0530, Anvesh Jain P wrote:
>> Add support for back cover, keyboard, and SoC thermal zones through
>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
> 
> It does not look like you tested the DTS against bindings. Please run
> 'make dtbs_check W=1' (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> 
> Best regards,
> Krzysztof

Thanks for the review. I will update the thermal-zone node names to
comply with the schema and make sure to run the DTB validation with
updated dtschema.

-- 
Best Regards,
Anvesh


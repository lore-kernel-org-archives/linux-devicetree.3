Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B84E431A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733925; cv=none; b=eCZgcpbTltH8q0sGsVlPXS7sWCwDyUOJgzFYW3x/x8i85/q7G3RedOXW0faQO+qANfA85sTqBvRggAbyIKz/aJiNbpENIq3UW7ZoSTIa031Vr1FVWsEP06QhZCot8VMk7VFiGWCPG4oWwwjDvZ9ov7y2TWeymLDxvySdzFfKS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733925; c=relaxed/simple;
	bh=wapxrbOKn0aJ+lRvm1E7CjXQYuLnjYoitWtQ+7teQlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpzBQGUONqWpnGu5Qfccw8TbYKvavuBXUNdwtnixEja6q0Dt6FGmCaaGfgtK15JX26i98AYGg0+l5fNBlQ2HkmJnH53GVel7JoYZvxkYMANpKYi1HfuUZ7uJgxJ4QBLwgOInmPoCVKcOCRt7UaS93QgFNQSpMzZqzf8zJVTUYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIVnV7Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUzbzjZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIVnV7Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUzbzjZc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dh1I1213782
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=; b=hIVnV7Fk2rOPC2+Q
	7XI/n3bpaC6WD9gitchTLUpGTFRPt10Dli4VF/T0zBviQTzRbBnkvlF3j5IZyWc+
	9JMIKkUgFMs3ablTZTGJkI4/Tl38m8GphLLeo+odRedmdfQXJrAWTW8DJapPwUt4
	PZVxGNcLy3mjz457GCKGksfFmwAraseJ4Wye9K9hBh9au1aCPhxF+O+N138QcQwO
	PgQDBsKjYMyG6XIKtu6Ds1ukxX8ODQdbFpoOgxmduyCcKY45hXC669xnhrlEs7AD
	Xe6yESzibXRIRrZXHjjUST69VReCrCfnthb5rb0kqdB26mRh3iYs9EeEccTDrcPv
	QuEGfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg4334q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso14359385a.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733922; x=1790338722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=HUzbzjZcmlDTQt9LEPgf1V5G/kaU0o9ooLDj7lBHDM3DwnAhAVAz/Ud8gLPxGcISn0
         uAlo8vlC111b/K8fzw5UXlTT1RegmcM7nbW3FiIqErd+g0bR7pjdbfgmSVQwjfXCnmJc
         mYkmqO6weRgAHuCUvObHrtWSk4Sp1B4QFkLpqFHkXAUoga4mWN2O16SeZTq53HgU9kdw
         36kTMUeNK0/VL2wPNXkaaZibEV2dok2+Qh07HsKxP0vX8yVnb4zRh9/7Nx2eu6Qj/OAu
         YQ/VVEqaPYJvNlMZk6hXAPZ9qoLMBSK0z1y3wpwnYAGnCcnEZy00Q1aCp035ArA3UFwb
         Z2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733922; x=1790338722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=eazNNxgIynmIqSpUAuQA9//GHbDTQlkhe3tv0mKJAcRH7unbcYAVaG0xej9jzBkKss
         hDlUBJF3nxm/6D9iAxnFPadbeCGMHq33c+6RiAzva4wQqto6wYosKiXdkbPd66nlkXBp
         L2AbdbcAkXzxa+i/sSj1fIeUCrEcEH5hYGeY3Mup9dFgCaaNy+4JhpLWrFgKwXlpmYyI
         rVYKixo4dXsZTfkO4fnaNJlvvvizPtgHkeh85X/K20292aRXpAuUoIsscWBMBlgS+/iC
         rlF+D0u9uFdESsVbcejl0Kb/QzZY+9ETMOdjAkXFl5OPY6sx/a2oAYweLAfqgCR7z2BR
         RU9g==
X-Forwarded-Encrypted: i=1; AKwUvBwXnaH2a6Pq2PXmqTSYuwPMbD+9Zg0dB0VhhiH4DMlP7nPgu13D6Y1szkJehdO4A/PpmHXXVWi4e4ZR@vger.kernel.org
X-Gm-Message-State: AFuF++lxnqWAuHmDecMU0dRorh/PpwE6Fs/EOzdzYgjV20zVRC9nWtDS
	8zEidZqxbkHGBvDzYGrvRc4pCIFU1r1OqKCq4ss1rR6ddNGWldZhi+57rVQ3Lha+c95VOB1hPIV
	kkB3gp0BxqHUbcYnLyNuyXcAsiPHnGrAKe8Jk2xmFngfk7NmW3zXoCJjlIRF+bj5v
X-Gm-Gg: AYBFou3Obb6F45Ya/CHVHyPaYP0rJNBxuGNSWqz3XX3RFpk2hgFHuxae1pqN6XAfJEj
	rR/ujzgOa/v2mv64G2BIH5gvbcsPTUzrDu5Po1zSSv+MqvZvzIQTw3IWABCDfaVnUcnT3NR1C4Y
	iJ1DwK7T/IPnsBDJcDkO/ddqu+/wt21Rnzns++7dPyZ0TdvK5cRYDaUb/ikt1vkp2hXxA4j1xfz
	TSVAj/o7Tnt2ZgEzZl1ncIXDR6V3v9kOLBLpmbTacVs6ZNdHfiDqUViV8O1oK01O6qoGsvSmAVF
	wYu05RpPb8B9aLC6G58t2zr/+D6ZUY65nYXVSwdZ/Pct0h4qrsQZAIApYcRSogXBgCdm4zYUKO7
	iesHiC2UlhplDmpDllE1NvQ==
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240482485a.4.1789733922571;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240476185a.4.1789733922045;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5979cea5sm785612a12.31.2026.09.18.05.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:18:41 -0700 (PDT)
Message-ID: <002eb70b-17fe-496d-870f-ac15c62fe32e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 14:18:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
 <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A-tD7nfqLqWEPzFq225LIz9_Tb00V6KX
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad2c23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=BxavHUX6cQikRYdMHAsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: A-tD7nfqLqWEPzFq225LIz9_Tb00V6KX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX+XKTpfwyan5O
 DJDWt5cLL4/q16MpS7xJBiMBorTdw0knqvCJm13DVvXy3umwmz8TCIMiCpbh33TxdfZdxUKv17g
 ePCF7W4Yx4CNl6nmsfGKLeJ1KtoQysDHmDJLOI7cCZmrZZRrsFr1AH5kTz1YAKQg8IcEux90Ax0
 m+1zPSWAtNcFMXvVSI6awv8B1D1j7/K6rXgtO9SkWFNALkLpybXy0ObTqn1VlAbEEk0hA2Ddc0M
 AYyuSGKv2k8dM+CfAEj7J8VE+zHr+10kiTXEyKZu5h0LnR/HV0AUrqR6z9/6ZBUp0JcoxBEa4f/
 BLhepPWCz1oD9YvRrt4kLHtxBywgj7SjsROxTKParBpivD9sQskhpOrk1wDWTSH6/a5uALXYFqv
 vqxiIso+Kfrh0cfdqBe9ZsuAsNs6ou+VRgntcGA0Lis/dCvpBW+WUhmq5AeaMQ2G6uQ4dBIBOuP
 ZPfc6N1XfOj8fBYnqwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX6BbU/hXOouoN
 FFj2O4AY5nNPpm2ZYcBWL46WsOCbufQOboaeZ98CEpQ7riXZXCu6GSukKOgxSM7j90wlmfX+HeK
 PdSb8RHMTnpTP70wx1AN924jtGrshDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180172

On 9/18/26 1:35 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 12:54:57PM +0200, Konrad Dybcio wrote:
>> +static int asus_glymur_ec_resume(struct device *dev)
>> +{
>> +	return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
>> +					     ASUS_QCOM_EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(asus_glymur_ec_pm_ops,
>> +				asus_glymur_ec_suspend,
>> +				asus_glymur_ec_resume);
>> +
>> +static const struct of_device_id asus_glymur_ec_of_match[] = {
>> +	{ .compatible = "asus,zenbook-a14-ux3407na-ec" },
>> +	{ .compatible = "asus,zenbook-a16-ux3607oa-ec" },
> 
> Does this mean devices are compatible? If so should be expressed in the
> bindings. If not, should be expressed in bindings commit msg, see
> writing bindings docs.

They generally seem to be, but because of the very limited information
we have, I don't think it's worth risking associating them.. Would
a mention of this be enough?

Konrad

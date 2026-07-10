Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80569403123
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684695; cv=none; b=oL6OXzgOBZuXElmEBX0XkyeW49bcfSnrEOEVLSiXq47J0sDtWQT5EbOwRJ2MXkvOn51crmwbAWIuJWupOSLhkxryxHg+PSNdYy/vmxK3yhvhu1v6oCmHM16lvbW21Z9/fTFNJaKwEbKpZqOBEu3LRmDn81AukGYlKKO2lk+6TVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684695; c=relaxed/simple;
	bh=VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=S1fGCgvUt+T2YRJAqkcpcMfvGh5eSCsPnsDv9bEOOZleDo9UbpC8h00/Ug5R3qzU3nkqVdYCyF2tQwh9FAe/3gr6gOfNmVSUlL35eDBv3aoLuiKUsyxyo+NFvFLNpgM8o+hQVuK0cs0OeyHNIPC7fJcSaGHWYS8fRrIAplLSzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPo48QFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fb7YVxra; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPo48QFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fb7YVxra"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmZ6O665399
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=; b=BPo48QFMZtCWxEAe
	1X6yGesA6w9PKpuTL0A8pXSddiV7D1yXPZ72Tp9DcyyhZ9GNG9Z6TN2/cC+4WWBm
	Fgri4sJpV5EHQt7mWtUiP09O2PdMOAYgq6fvdmO6XiQHNhKED1kKNveArvhRyp9C
	lGy3YaUI2cxQIrlcz8rCUHGBuJlKTwOL2oNzDcy3VKq6ko6KFJNyAyLhF3jWhVrm
	ZjDXEFCJZIeOZShFM8gQJhDFHNTAIah5NvTjw+S20o8cu+n81XYE7/XTpGnYt2H7
	iScaKhjh9rm7SL/bTzms1FE76H5XT4hf/kf8QktIXPHO6TiKikJ1XMLa9cnWxnvf
	n3Z84g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3ma9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:58:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so1777522a12.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783684691; x=1784289491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=;
        b=Fb7YVxra8FWmwSwwO7Qq4KJ8nfbUBuTkFISa82uNjSpnJjPoAXYvJRlM/6iw3kPCq5
         QmsMmx7CnSfXIHER7aBSRel5BgXx6pn4R/ZiW99lyWgx15A/41Ndh/ZwL45+LWKs6mTC
         hT4oW0eOPhgM+wG6GlzAha5Z3EvLdPvJ/sglZ8OKcI5I5ZDSjw63iwnkM0VgC3M3tkQJ
         QiLc6fVpQ7jOcrsY8UzmoSBSmQAiGhhJas0wMnrC1aqNFbRJOPA2eP2YwZTiiqjnCaNX
         T8WPhe3rN//ykvpDX77FrUVGpWbX4fHJjHdcJ6OHOhOzv4+VEQzmq3iAzJcSa8Mb4Oj/
         A9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684691; x=1784289491;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=;
        b=oAYsYcXiMFTR4O5+G6X0QGwsiI53bHtrnAtucVdG8YQbTjUZsHzD3MOBC5EzXgncNB
         jPmhW4ucbiNf43GXyx6BWszKKfIX4+snvzHAwwOC2a6RbN0/pjozyrz6ciRfa/xXaaBm
         FA3wyeVO2v361bujHnQRnYSIZzMCaWRaXubs2gMZoLr7vguYvCGXIrIQKBPeqa0n7ABN
         +7FJxxalpSoPrTWQFvxn+YUEYWal4ct0QeFt4f95OQpH6TFuodMifs0RDUm6X+7umgCo
         akVfGEbGQa5yJGZ2pJwBKB/Mne3en0AmrXeVE1NVrhW3hXVwNZqhLy6NvIC9lGeM6t+G
         Zahw==
X-Forwarded-Encrypted: i=1; AHgh+RoOzTm0eYf7LmPMHcsDYGKe9V/B/DqtNI7DJLPqzB+5Vsmc+PROXOfvJ6kyAbk057aDia3WGgBtc9yP@vger.kernel.org
X-Gm-Message-State: AOJu0YzI3RLK+k9MuI26Z2wXl2gQUC+pwdZmONe3xenTuJDe0seY169R
	qmEyYYJUXLL/W/xEPgO7mTm3yRFvsZ54t+MPD5aDp6fR8o4BAONlOip6hEqPhTyc3cXVM6yNCEf
	vLtCNehxoz28B8lLud66cVZUGqa/G0vxYbwcZ+kqmbmhE8yAXcFZ/5iUOL+4ECWM1dlmtIxP7
X-Gm-Gg: AfdE7ckQ83KDGctxFV9E1GsPDMp5AVyXlrCfrgpzNIKlyPFqIaHtd2nGh/ZrsHFJGb3
	752iqgiMEve8qNg1piFY+Jh5P3m8AGwt45mgzZr2gud1LUxB3E+4ZoAbheP8KWTqCV+F+sSZ6Qf
	1i7ndbFroH5F8WvSRiANm9UsiaVxJ/WcFoZb5zpuD3O284o0iynOu+10qbDfdBh0G3THOKXsho7
	TIFh5IxSthazysC9o94oYpVgu+baG+Iv0CQDCyQyZPmPd3n7cOyrCl8ZvVPuiadNAGPqEhIZwbx
	cpIj/xhm3XxUdsCJnHvTg6tUiEOqwCvEZJn1WxVJqlA2La/pLDbqiF+3uiJoK+n7NTv1aUfAPLQ
	ns8g/GGxmfNcYhJ1yY5u5LnaNPphjhGuEEK3Z13yE
X-Received: by 2002:a05:6a21:6e8f:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c0bcea2f17mr13367386637.44.1783684690624;
        Fri, 10 Jul 2026 04:58:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8f:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c0bcea2f17mr13367356637.44.1783684690107;
        Fri, 10 Jul 2026 04:58:10 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm40949164eec.10.2026.07.10.04.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:58:09 -0700 (PDT)
Message-ID: <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:28:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfXzVlkpwumibPa
 8uAo8KUjsm/WQERPxNyx64Wtcx43Y3KiIVtUAubmsggHTz9x+HdShfwbSKrcJaMJu7bz3vfcuXi
 p0DB1GSBGJlEMGUtw2HRIDldtDmF4YX5bouiG2m6ZuDosYPGizSr22/pvTAtbkIV2uOti3PE0AD
 cp9vWqr/Nc8J9VVLj9MqXcPSV2l55S00KF8jZ1qWQfNz0CL7XCTyUP5PxViaLd5/7lmEZOgwnXT
 Acm6o898bB6u+rbLCQJbYEHEbapoJYe5svFGYB0Y5yq1Hb0ZBHqhkQnQQHL2O6xVcMGdzx0/vGq
 LHHv4CiPY0yWuxLC7QI6DadSwzX0n+seZsJYzaoCldyrDcK3OJIZy0SuOlZXRppW6ZcfLE4pZZ4
 0uD04j59rzRqS8vz1XZMXCEOpCHJZh1IY7qQwmGqt2G5oSfM4R6j+lxdCI0e2nZDGwJ7y+GXkwd
 MYVDqqiPa3rNgtq7fAg==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50de53 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FW7Uz84xZHR0K0vXMAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfXxtW0ubOyb4Oc
 Z2vSOiwVoYPGdxkMfzsEXp2gmqI587qCpSC2wbrbBuEVdeHeeGqdhDH5WkXYMbL1npdciMVwnjp
 zJ17PudrNUKbOIJi1owLnJyWMggm4V0=
X-Proofpoint-GUID: 5-tOa30-EwwgiW4FRmBtEVpjj5CoSLO3
X-Proofpoint-ORIG-GUID: 5-tOa30-EwwgiW4FRmBtEVpjj5CoSLO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100119

Hi Konrad,

On 7/10/2026 2:31 PM, Arpit Saini wrote:
> Hi Konrad,
>
> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>
>>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>>
>>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +    panel_bl_en: panel-bl-en-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +        output-high;
>>> +    };
>>> +
>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +        output-low;
>>> +    };
>> output-foo isn't necessary, the panel driver will assert it as
>> necessary
>>
>> Konrad
>
> Ack, thanks for pointing out.
>
> Arpit
>
I just checked,

Normally the backlight EN pin is controlled by a backlight driver.

However, this panel uses MIPI DCS based backlight control with no

separate backlight driver. Since there is no driver to assert gpio91,

we control it via the panel's pinctrl default state..

So this is platform specific pin , we need this to enable/disable

the backlight.


Thanks,

Arpit


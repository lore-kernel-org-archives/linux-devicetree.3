Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D81A5B8C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827108; cv=none; b=taUz6gNa5JxsasRw4AZsyqA7nvJxj0okfu53Ej39tZpWCkIMa+QClyDw+oaexC7VsNYl9SpIOo8pfMvCu5QKSKbjsCmjQUaraCtAjYhNxLUbqCUexmX86DpEKJNWLxhIFpRZI6huk4FhpOPk1y2NZ8GmcWMwAMmRyMhtzyXdzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827108; c=relaxed/simple;
	bh=KISUaWsgNM8awv6Xd8C6fxzb9CVQoaKPTw0NYTkSMsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFaDp1bWVZrRaXK7KNcg+JRLL+xe6CSujApCLZptUthrBJK2+IYq/R/EfGeJA8Dk8FmdIEmLNquQZapyF8hb2LghvwcepalO0rJM4GbcyA9IcS/ETZjQlqpHb3kozz41CtE7DpZLd6VK1exaCeYEXVDgRFzjyMNBHwqrFX1HecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNdUrh3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUFK0jtG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNdUrh3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUFK0jtG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417XQO2351931
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 07:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHHvqgebmTzSmaEA0DpQ2efP2IiYVPYCPSbWYcSigVI=; b=LNdUrh3+DTZX89w7
	NCScYVlg4ymCQEoSaTFR/07J/3ArQgLT7/ZCc1fd569g4cE7bROiB/JSrKpv2ZmJ
	IOxs4JW+K0QzCMjpc8chQQU2E5HwzEBxeMSBA7KytUMcfJpYGQmI/0LYSC2i8cfw
	AL4s0vdlYBdJO3o8JSbteZUzJQ8wrT/wEJc6Ig3xM3Pobgf+ZyeeiBdAY0FkPftL
	zj6ncd7xgTcvkO/bz6Scg92LDeLqjg5K8Xb1DuO8IsHYw/hDUN9fz+5Ntl8Jq7bD
	KekDjWdtgW2W/9w8NJdce4VyGi1/ZVs/Q+XofyjMFIzF2e0+6rnxd0RnDmXfOpnt
	XXh2Ug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8a9pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:05:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so8421898b3a.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827104; x=1786431904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JHHvqgebmTzSmaEA0DpQ2efP2IiYVPYCPSbWYcSigVI=;
        b=fUFK0jtGd/iulvpExnYU5DmDVYVOCrA5V1tnPiIylYn7pahb5NZpll66hVljAkTNdn
         Twf6VtJ6xnbXwLue91LTrYEmJuYtPMUn25gQjyCMa6ndm4Lgg7eiEZM/tmt7lP6UmDwh
         b+oFi74dpMtB03ghrxpyM+Pa5aTgEyfHffJ5TSiClZtYT2ebQNcSpscNmUHPGjyZ1X95
         Viws/FDQOGSuzq0MViuBdfVg3CmXgdl2uGtrRduTvxZHnB2fgW4b+66DOOlk2UqBIMXd
         ZbOktuDDQSCxCd7cDA2puAzseKWF8E2rWPoVFjMsOtq13Y0ATLfCy20L38gWt7jUgQ1I
         DKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827104; x=1786431904;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHHvqgebmTzSmaEA0DpQ2efP2IiYVPYCPSbWYcSigVI=;
        b=DOSIHB6cO/Zdi18sDDXzbhAAepl5jaxXfuizv2sUySDlDByEi+9Mui+FfPyUP7D8Xh
         ULlcgFnbrTqmP//B5ELdskXNVktGSqJrb9JdQGkkTVU4YoBbkqY2hFBws4EGLCwKKySR
         SXScQNAL7Z62HgziPCnVFwYL5nynK99m0dOKY3kFTp5LxxHvi5oTRyotXZaz6c0UBBhJ
         PHgp7s8bg02G47TKoZS1ufRVAAvVM8zTcu6mKKInru7emjpE0JhrGrkPXItGcOWFzScA
         yOhm2lDK69LkncThedazyA7e8bAXMzs5neszCWHHwiR2qSQWLoP8HOjV3f01SWjrYaFT
         /oow==
X-Forwarded-Encrypted: i=1; AHgh+RrcIFxrlVvt9Kn3E8w5TC3CnXsBI41VCPvQF3xs66JxDvUQKwqS/D61Tj4Cze0QsHCkF5PTNH+2M6MU@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4y655+0/YpZetmGCcZPJE2neSJhHheqo2op4UPRY4xyCkMhK
	TXsBe5ElrnYooHa0vfIGG6XA/qX4FNEvr9yg8Kx3HxPM56zk/aunX2HGSEcDssgsOuI4eIJ1YK0
	VXWzTriqbahxMysC1K3OsAKehgcLfWket4iS6zxRimhrqskzThS6focSaXGrQEtb7
X-Gm-Gg: AR+sD108DFAk1m4mOwj9K9PnK53yxosvRL9XV/yJW7dnTZLDg0L4/wzoYpqBAEBb3Hc
	BV8G7Z5MDtgzqDVrbsm1SA0JsGn0xDUpuEcPOejeebq0fYuFcPF9Umwdi9SYu3hBQIfHqf/abQh
	2mu+7E3Jlkul7KNi5wVlAzUDkLF7kiyxykOazjD/BCxEIHshVgsOrM8k+BcJDcbA0qxLPWQXpjD
	6Jlu/ebQTGJKKYr+1Un4SQLzM08bOIjD3mcaDcOnayZEmaGyqXwmLx947+8dsC+iRd0Tg/ecj1y
	kWLhOUp6aKHEX/m/Jb2HhLVfvNM4LC75I83YqCuvDUi2yccELgZ+1FykHEnhJp1mM7ukl/FunMk
	0PZfRpr5yBYhwyxr4BpeKm3HE2y8ULRX2RCXYgVxXVt4qK/df2zLJE4gDVFhcQfy8Pg==
X-Received: by 2002:aa7:9a8c:0:b0:847:7ece:3426 with SMTP id d2e1a72fcca58-84ee48ca4d1mr12140953b3a.58.1785827103766;
        Tue, 04 Aug 2026 00:05:03 -0700 (PDT)
X-Received: by 2002:aa7:9a8c:0:b0:847:7ece:3426 with SMTP id d2e1a72fcca58-84ee48ca4d1mr12140921b3a.58.1785827103348;
        Tue, 04 Aug 2026 00:05:03 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe565d2sm4920387b3a.13.2026.08.04.00.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 00:05:02 -0700 (PDT)
Message-ID: <58940156-c664-4ab2-835c-81fa43365bcd@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:04:58 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
References: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
 <jx5iackeevtgqxycqbmctfohuydyarxxp4uqsu5dpihca5oc7m@gyyd6l67kzhx>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <jx5iackeevtgqxycqbmctfohuydyarxxp4uqsu5dpihca5oc7m@gyyd6l67kzhx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a718f20 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nF2vwnYNiXGi8mvl9yQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX2KFxAwvMR5DB
 1WWjBUOG2XtJV1VfzOwm2eL/UnvomYgu5JIhV7LKA984j10tg9Vek3GYjlzN2pOzMosd8ZHKQp6
 swTwZGKvuZfZU0+oNiC8fHWG+J08+e/kcvTQ0qXbz0LBMUQcodcmfdMEnOrixK0RTxezZAFDW2I
 vN8n+dLFpr7K++koiacRn8B6wNqpdGQwQRwA2pTK3Vz+/lTvuuBSY/EW7+8n5TDizkkurw4Vdq6
 32zauzby9OjaopOhWLpk8vLSu/EdrfR8+NCphwc+9WZlItOUClWALuFlOVk2oW8MCMJ26Mz7SwW
 SFYYXKhRj0YmL96PFMlgmQTeFOlVnPcD2apMYnpw/s5a65Cv7u1Xc8Xt8hLyihRed0js+xzc81a
 COpg1XsDh/LgzAVxSV4NoXyKFhoZCVTaEwMhjvjjKENYvw7amp3KIGFRWg/IfLIyJDvrmIiD+qS
 lBjw6dsg/jM/OOjIoOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfXzygcNoXhEzmj
 llbDwym0kNG/0nj39gJZoKfxytdMFTN/WAuqBCVN16cM5GKBoRCdFd7kcbLhdunFJTwHf/MpOzj
 VPu42Wg2lbPvan1zrFZ3VquoWj7x1YA=
X-Proofpoint-ORIG-GUID: je5C4kMyyK8etekWOOBh9sxG_0isZLy0
X-Proofpoint-GUID: je5C4kMyyK8etekWOOBh9sxG_0isZLy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040054


On 8/4/2026 3:35 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 03, 2026 at 06:27:47AM -0700, Xin Liu wrote:
>> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
>> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
>> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
>>
>> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
>> their stale "Left unused" annotation.
>>
>> The FSUSB42 SBU mux chip is present on the PCB but with all signal
>> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
>> group.
> Why is it still present on the PCB?

The FSUSB42 is retained on the PCB as a fallback for the PS8830's SBU 
mux function.

Should the PS8830's SBU path encounter any issues, the FSUSB42 can 
be activated

with a simple rework to quickly switch to a discrete solution, avoiding 
a full board respin.


Thanks,
Xin

>> Tested on the Hamoa IoT EVK:
>>
>> USB 3.0 SuperSpeed at 5 Gbps on typec0
>> DisplayPort Alt Mode on typec0
>>
>> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>

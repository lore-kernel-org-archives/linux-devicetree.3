Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205011;
	b=ED2Eo+dlZgxShUxUzSXNgf3X6Tr7PRlPGleytbKUezDRX0IO5sOc6RMpTqmT0ToIt6FU
	 XBLTqgGjwrtFbNPD+usOqyLk7bm0232qkKT1NNU5BQooO13VcpIjh2DLOz6vl+7Es6jH+
	 p/1QNR+jE+ZOZF+AHK3/2WwseP/8g2x2y/fsC2gq3+zyr2f2d/7cah2dJaGQDWH5ptiYi
	 AXqjemRtHhCCodpH1OOYiELx0TOveWqFnD0Qkdxb352Refbv5x5rNS1oWVxCJU9iSlsoj
	 4SXarMpCxl5a39AQrOG58hHv6lCWPULS2neHR8A3pm06CZrZ67hv81R+/WyW7yJ0tdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205011;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=;
	b=koAGA1y0tU8g5xf0PLK/Pa3SN0Tvw5Ot+Zb3WfJTNUKzGwP1/xdNQTCV8RtzSntRd4vC
	 NcVUiqkQQycHWHea+RW9bwtYMXja5ROruoxHbNCGY2Upen/n7Vzwk5axXBjeVIS5xSqx7
	 nTrjVNqQLhv9rHl4RHHQj7WK2uU7SFpGsX4XLQGJEUtocdRK47JbCgRRLSb8SlIrvPobr
	 MwcD0MOfWtihfw3teaAGMfdhrDbm8HITAHXCYW0Nly4D+l8X2GMOkYoWVPvLA9+Upat4z
	 IszF5s/hFoGCppvUZFoSA7DvG8TjupQH4o7umuwcJD2Vo5dX4qR9WNmrKaJ68XsbM7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aJZAU/cJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lyk7OTdy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E41A606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E41A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJZAU/cJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lyk7OTdy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969pjK480694
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 06:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=; b=aJZAU/cJ6TWZuKLr
	Zip/P8OdrnyaaE/rZN2lzz10nS1RJaMxos1LhPFXJruZoUkjTv4OUEgGKcAWp3zx
	7/kgTrzEkiPEHIKneLMO0iGNrVn64Z9t1OTNIDix0U22A/oGD1JNRd4HAUuxiipY
	1zo3fc5n6YoSZ/8yHfCkMn3dI6Nz5T/VKh3fcwo/IumTnNXZIvnQTl8DN4OyRVMU
	jhFnGYEgQAvh61/9kZMlIXBocx1J+TsFKfRU6rNtGhgZZdzjQ/5gRSQWexHG3F6n
	yIUlIkyepxGuDo7oHAPa1GWYncOQsHUrfZQwrkQtJAAqg5s8VgeCBfWL2DB5TpaZ
	3EJBcQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsd4dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:16:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so815066c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794205010; x=1794809810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=;
        b=Lyk7OTdyPZLrAxPLceo1z8/wMtJj0+dIdwK/e6tICY3MBsA4gfQfDvp+msjUTlm+WY
         656cAQW2sTI63epgsHgILfaP2+YEbVGxFSNJ2pgEdSn+LlEVLNexeYloH/qVLe5Q/Qbd
         f2TsG91ngxs0H5yDu1F5i8O7qoq08amzToPU8urQoH03pI/PYDw3Lajz0mWA6vPT6d6t
         uB/EcROcHah5swSh7Kyp0yJ6KABGIIIN7TStESS3nvBis5aOFbDSZqmqLw3F4/ECVnzq
         stsAmjprhxukd3DApMnHIadb71yx8t4lJNz/+/8IA4wn/gmMig/lbghdy3pQdXqM/HL9
         tQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205010; x=1794809810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=;
        b=btC0kH49sT54eGQwCiEdDPb5hKVCEmFrU1/4sYwX3cRPPIvjgr7E7eiF2UuyxhlYSU
         JFyuf8CWe59jCVUcZeqaHIIfb852rwtN07W/+D8OID/fzJqyjz2EJ5X508EwTuOorhpE
         DiBCKpgo9oJPbEms+IEv5R/bTBNcAi7kiWcK7A62emODhJMJQOyzEx7vSFPHp5Y7Lh8d
         FlzxIpMEwnP0v8XBAIZnp5n0Kvc+yTjQL2qY4UW0xnlfOTyP0QCiTasBZfoTwwgI6WC1
         FgskBs2nz6e+AaU6ZikuRvUkcJX7KjPyrs6CcOdeos88RL85zo9jLDshGYwOf1VrUgA3
         jjFg==
X-Forwarded-Encrypted: i=1; AL+hErG7jDbZ3NI5NXE8uBOSomQs8l9hMaBacE5plV/9/k79pcrtl3DYL/I+bZ+b791jIu2a8st+u0M9S/q2@vger.kernel.org
X-Gm-Message-State: APuU4Z+9KdrGhUHv2D8A+yrw62VbSiVP1enDieEW7Rnvo9wMlYzmmVbQ
	iRs4Q/ZFXItSH/IH49LOirsjTighqC1Z8tU7zv4pTnVreAtINWy3qEWZvnRK4T8iFx8QvdhuttH
	33UmIOW8OcNLfgeqLIC+rkqXe8KCiDvckhp/7n6Tg0iw63RxlyseYWOTadkyXL9em
X-Gm-Gg: AYBFou03DiJMDojBt/zUTds95a0UlFqPfZR3Ulthxsf1J0VTXDxAPyb7PheI2osnTjs
	PrctfhvGQDt8HaIFEZtWmmMzMJx0yPktbwkTt9YNVkyOvP2NeUh1onEbVJ+WdZnY05zl/G1dwt7
	Tb0dmFELlK1g8XWwnLF2VLbMMltSuIqb6FPsZ8OvST9sPRRbzm7zrzC42zAKZa5gQtAk9rYOfi6
	PlOUypAZRqSrK+wAJlAN4tImDSRX+gQAwZ+2iDBgAPYqi3h0Ji+JME+/z64MwHCapgGN7P+Ru51
	pBRayMd1uRZvmJ0fuJBmJVLxJS/2Pzh1eL+zAq05pcbJqR4s3mmQF4+wRo45fr9vWHAucZ9fL5p
	/CLSl/pcCR9pGMx88d1Rn2v7f4CYFHk93HVjCtPGAV+bPqlaFD2bNfoRCIgMypke2VBNswxVNJT
	kA
X-Received: by 2002:a05:701b:241c:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b39fec1741mr4984660c88.7.1794205009663;
        Sun, 08 Nov 2026 22:16:49 -0800 (PST)
X-Received: by 2002:a05:701b:241c:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b39fec1741mr4984627c88.7.1794205009090;
        Sun, 08 Nov 2026 22:16:49 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm9996618c88.22.2026.11.08.22.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:16:48 -0800 (PST)
Message-ID: <a9ba8ca9-f93d-4a55-9e5e-966121b102bb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:46:41 +0530
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
Subject: Re: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
 <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VEBbQjEwo5PMdjUZ0SYG6Bz41yXY4vt6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfX4wHsW0m7HYnO
 mcKd1XWBad5Cy1LYEELDry6JFXgQtOa3BFZsyBPEck18EkIwCwnMtrCmbklH7LsbU8jriL/QmJo
 GseeD2p/OrfcK+Mo1WE0JZ5d3icxxpQ=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af16552 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfX4ogKkKJgjrD6
 PzFF4ub353/mlF8duZtKJ3+OyiYLhnLhWqXaImDGPMAurrDDT0qRADB3zytTUuQNbaIowzGU5Ae
 FaJGtv9r6PTxMrlQFh1bGyIU67luliCRmgb/wkZvik15xBF2Aum9OSDKz+9hINqQ9AG/h3sLtuT
 o9TbnVzRpz3AzKtG1L6BrrX7zX6Me4JAXOmt40cjtDIFgDMdIqWGXjSd5/PDF8MMB0nxzFEv+07
 0XgMRZ15Nt2rRacPfNAwIXo9E4sxRKF53+RurihefB5UYG6os2/KpuFHasDK5cTvBE7/CfEcnzG
 pGeSibFhSw/twOWFTTbV3JEOWhB+4ige0wg9tdcbmt0ZYP4pob/5KTl0qv1SzdKaKYakmMf6vcG
 mWP+kjUffZKhVinCUQ6ApScOx6LDY4+63QiSCu3ez/4Lcx7y5SJa4DIQ017DJq+UPw2yOrdGZpr
 rkbsEKl+X9MpKhZTEGw==
X-Proofpoint-GUID: VEBbQjEwo5PMdjUZ0SYG6Bz41yXY4vt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090024

Hi Konrad,

On 11/2/2026 5:40 PM, Konrad Dybcio wrote:
> On 10/30/26 7:20 AM, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> This defers the modesetting to the consumer. Please take a look at
> the qcom-rpmh-regulator driver and implement something like this:
> 
> static unsigned int rpmh_regulator_vrm_get_optimum_mode(
>         struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
> {
>         struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> 
>         if (load_uA >= vreg->hw_data->hpm_min_load_uA)
>                 return REGULATOR_MODE_NORMAL;
>         else
>                 return REGULATOR_MODE_IDLE;
> }
> 
> and fill out the max current allowed for LPM for each regulator

Yes, I'll be making this change in the next patch version.

Thanks,
Jishnu

> 
> Konrad


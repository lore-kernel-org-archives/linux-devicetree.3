Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851B33D1AB3
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842585; cv=none; b=aNV2IfxiK6QjM4mF7kOwfLj31lD3KXtYnqs2FyPQU4ajpcpXeqZAGX/sezBtmcZJsm407mSTDHuI2tO05Z0c/igRTyfaUEjFYyCXq2G2yMOOmYib9fCs9LexDMxO5svDjUP7TaVs23OQ6FQbJ7ymjsomw7BJOO7ixNEc9jpup0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842585; c=relaxed/simple;
	bh=7pI2CkgOkj1QdKQPeP82rrYu8n8c8T0fbj+4e6fR9P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txrulaIvfOn3HhTpatLquxao+TqpouhUdPLmy58k3PjglARn+ekm7kHMhVQJV3T6lmpVKPREAj2nXNSDTtajrziqgtWCUKwGBw2nfNxOlquYsM0h3QAanxGvfEhzBNynIBeKbUG4ZBjh9zgLxYUGTHIT3iJWoHzFbn5CmnA3ASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/lhJqZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgghNvW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/lhJqZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgghNvW4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F58mxa3795744
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQl+nNFkbEygaebXDDr/5Cgv/szcdUhD1+tk65nXCHI=; b=c/lhJqZ8Ku0a6NmB
	YHnKzJ+/8keMK2ZrvYZ81OCuIht2aXsbxAwHblgsG65zAS851io8PI/b+EYw/ROr
	25vIpn53sqfs4Z8qwm3FwKOkRYftq6McQ1VnOVIHGlX0edoTYWb8g0Ux1jLx4G12
	GLxzim2frGFv1Ioef7KwBX6e0NcXKeYjIWydGrcZGnfGwW8IuYBQIqC690ht3leO
	X2eTMGx8cOsByWacd9vJEVeiQbQqPQUOspFeJ10BL8FIfKtGJofLIuY21fWuqJvC
	30H6yC2XmSm6t1Y3vj/jTmINktkRfH1ZSESGl1e1PeA9kTOQGwWKKdwjbKOQWjqR
	HKUGZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stvqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f5edb7516so84917385a.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842583; x=1779447383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQl+nNFkbEygaebXDDr/5Cgv/szcdUhD1+tk65nXCHI=;
        b=NgghNvW4g3YOCCDm5+kkPswqI5orr7+M1r1eEoC1yQZXx5mgada5TwySTO2kckbNKa
         mdfqUk8YhS/X3Ou5uBkRBOsXDwy5Zhg81g4PbG/J34UNO8owDQXP9ICYKgUY3jZBdeoz
         Vv5A0K3Qbti8cSD5PBf7cMw0umO899O/0RBHbVz/srM6vFn3R0UBav3NvMB0gJ17P7LW
         BzghBHhY8Ci7MnFO8aplDEkN5s2zWhkRkzjXp5CgyZbBAsmGSaJmpzilNFUwhT3EnYBQ
         4qEQ2IdhSNT40PXo0J/ad1c8iOXDVHJpZPtbqjuK7v/ebQoMSavfilAQiwyRHHzfPPxD
         9srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842583; x=1779447383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQl+nNFkbEygaebXDDr/5Cgv/szcdUhD1+tk65nXCHI=;
        b=mVKI6jUreCPt5OoLTQb9t5hJatDjvnIuFAtIKFBL2Z2UB8NofQyGMLYS5261o7xdCK
         c2Sfhf3u+p5ARA60IX+DocJFHSdBPzTscnpQfC8RYu/e7TJ2i587l5DwibQNlFB/DxuX
         fX7bGCzVMd+cFivZghr4OuoRT58NeXtAYfvhlMgDChmFxHt0kwqBoxfrYr4LqxUwTo0W
         bcpeh4SygQCAgOtzw5UnlzgeNoN0PHZthLMsbL02uc7mPMqxGBHh8jiRbrIHb/urtUdq
         EDRg0F2y1A4Cg9sGXfJ0npdbOPXDHr08gos3vW1V6RzXyTsUvzG3rTsPOJnjVbQCQwEf
         r2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8zzqY3Ivt2s/rYmHRk7NUWbe0H+vfLy71zQjMinZnXL/kWWRdiOxJc4Hly6hV/+beiN8jvozvtcfcJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8u26UjlMStTgasuivVSLrmnI8BoRkl6AbGUf1XuDoJXgDtAR
	G16RdaGeIt7I+6WfjE3xhsthOSN4gdLNazfhZTXrEzAE0lpzWtw0rfCMy+yIfA9HNJ2l8i+/5mR
	doqX3HjXqpmBNEIwR2V9lOM3oGxYI3PMeBfi1HjhPAp0j72T1yZ+mjM3Ktuvm0H2K
X-Gm-Gg: Acq92OHxiSrBuri+cnenLV7NJhia4J1maINNRhhTAgSnpKJqucpdFJRAYSAlcd7GkuX
	oxS8mXqlXE1hf8ZCeg5dg8bjuLlU8eTu+S7KIPDka4UXoRa1aF7W/EyGgBtFaR1bTW/UmSj0xbf
	Ag5SIaLbpdvfG7QwcLtD7sDFXe1L40sQhlT3Iy5ew3VYg0SEkskj1caj6deqav9zy0YtJdBrQ5/
	ya3k+vcPZLQkFMY7CY2rMthgCv4mwdSaerSrW1/eU+IvTWuz8jkEpTmjo2z4nLl8iousjRtkJ+N
	Zd2XoGH+w0bJYEH+itJ48gUx78XnLja2OxHJQ1akXBs2v1sOVfY6yRe1oLsUpRaPv+XtiU7b0hs
	grROgALKSDiYSI68/5x/DT0hFVPgShA3Xxa47A+0SK7KXlsf/ynh2dRAG/gRg0S0I4FwEekRrEl
	KQsMa8XAhYCd4inQ==
X-Received: by 2002:a05:620a:a410:10b0:911:dfb8:37c9 with SMTP id af79cd13be357-911dfb83b03mr212491885a.3.1778842582863;
        Fri, 15 May 2026 03:56:22 -0700 (PDT)
X-Received: by 2002:a05:620a:a410:10b0:911:dfb8:37c9 with SMTP id af79cd13be357-911dfb83b03mr212489585a.3.1778842582381;
        Fri, 15 May 2026 03:56:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f76sm1784549a12.19.2026.05.15.03.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:56:21 -0700 (PDT)
Message-ID: <8bb0140c-bdb8-4ff5-aea4-15879a27f13a@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:56:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco-arduino-monza: Add Bluetooth UART
 node
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXys1FoWgqOVnU
 QAebLI4f37tfCZ+t3tf08g1doC+PVS2pC5NcteaWYwTnfYRvloNjnUhss31MhnCvMUyIzb5k7yw
 As6r4+QGGCYmhPRA+tImL2WDnDXzuoMJV8wAd5ktW5G/wifjEZPrLrqBp7OYa6FcA3Cpyy7YFzf
 irDu6OgVs6nOj7GxJGiGnzWKoTMNjofV/QnCOVz/epZjRI4Q6GKHeu91od5M4FQmT6LMC95/qJA
 l1bGhBoLqS0rn/G6TkzRED5O0beUzpDiFU3ss6VPUZ4zg4BRLG05Dv9HBNj69HDx+0WpF30v3Jj
 e/FJ59pg5swy6HnW7BNuZq2AVGKR2bwElejHigFB/VJgykmyMwb3n4OiYRRFmbuXKoSaU9L8NnW
 bCVT3CuxQ7ekMYQYEViNahZJ+h82iP2fQfgOQ5KZbZpldzQSfNLqc1y3LhqiaNFxurwks+rcXK1
 vCbumXYkraTM8j2l82A==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06fbd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Wk1vn-X9fqPfTJa7il0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BNl7TFUf1seV2xNO7riItmo8KoYSNT47
X-Proofpoint-ORIG-GUID: BNl7TFUf1seV2xNO7riItmo8KoYSNT47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

On 4/29/26 12:35 PM, Shuai Zhang wrote:
> The QCA2066 Bluetooth chip is powered by a board-level 3.3 V supply
> provided by the hardware. This change connects the Bluetooth
> controller via UART10, and the corresponding GPIO is used to enable
> the Bluetooth chip.
> 
> basic function test step:
>  - bluetoothctl power on/off
>  - bluetoothctl scan bredr/le
>  - bluetoothctl pair <remote device address>
>  - bluetoothctl connect <remote device address>
> 
> low-state test and state:
>  - rtcwake -d /dev/rtc0 -m no -s 30 && systemctl suspend
> 
> cat /sys/kernel/debug/suspend_stats
> success: 1
> fail: 0
> failed_freeze: 0
> failed_prepare: 0
> failed_suspend: 0
> failed_suspend_late: 0
> failed_suspend_noirq: 0
> failed_resume: 0
> failed_resume_early: 0
> failed_resume_noirq: 0
> failures:
>   last_failed_dev:
> 
>   last_failed_errno:    0
>                         0
>   last_failed_step:
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

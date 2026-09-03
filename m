Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212A638E5DF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422162; cv=none; b=hec9vwGFVsE6Zy3q2Jp1IwT6ZWM3cCEDnD4lI110YZRXypMsNLmgxt/L8o2XTHTWsTl8ulRdowCEl8gZz0KA53M4WZdQGU4Oqi48H7c0jpwsX5GfiP7sePbForDYBvP6POEYsnsrmTl8PFNPnt6y2avUeG+Gs8Q8okIjwGhJVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422162; c=relaxed/simple;
	bh=S5AbwRD0fqvqga9LGi1pA/jU6vTJnOuN9GDZFXUDnak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tr36fS8c9ou3+IILAE+Qmxa/uDbIE00McI3dKZdXrYRbwhcOVys+P0h/OzOnSTuwG1F82BnXbxUnKGj8wmF27PGqc7/IymSjsPRutARdCwBw7gcZl7MvUiteu0Vfmei8q89//CkkFKNYBsosOLJ/qGUFUbAR18PsjlrOts1qvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALzOi7mn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fucr3kL7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALzOi7mn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fucr3kL7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lLtN3113943
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAkYV6yOiFFE5HQj2p+KiWe4hueb4hGJPzEO7lWuE/M=; b=ALzOi7mnBotAHi+E
	doCAzqMMEmln69d712ZGcF13/fbQdqp6vYBdzWOueWhKb6mRpXi9ycsBCn5c5+wN
	9eBiMoAO/1L+qH/GQ+wY36H/h7xhhxdOrIQeTo63QsFZiDMfNXnDi4EML8D/XCn3
	iz3kZfr8oSXGVKYY2G5ae7vHPTS/YKbwHbcEDf1U2yxLwOdxGLyW3/uH7eokj36e
	tNr+0cvtFEzCpVD3cGH65HwCNwZAKg499DRhyFG+picCSkLA0YXJqQI31Fd5G6wE
	Gk43eDih+wkQYMpRyfmmSE1+mSCPUaxlvE2Odubos+AjZIOJvj/fpdCpiolE13FW
	4z9aVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs126-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:56:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2929737a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422159; x=1789026959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAkYV6yOiFFE5HQj2p+KiWe4hueb4hGJPzEO7lWuE/M=;
        b=Fucr3kL7s6Rqw1IueGOwnYbA1CbJkD8dWGruMaMCNoDn1O/YDbdtEgAqu+UFq8/Mx+
         F9P4JOCeqFNphKiXvBtGvSXkHKzc1K+C4Qd0YjhVm0vvCx+2ITQA+VMuAEXmgtzo8Ax5
         BdfDmhjZNqucjdvgn6GQNNPhKes8JjcD4Ec2emj44Ng9EbL1BUmgu5qXIwNpMMaxlmX+
         wZ0IPdftD1cPCO5oSLaUEP1MeWSuV0xaK4X85EuLh2+eZwwFplaWr+DBemD8eh9EwdsD
         DNPQNiVgkBDJug030N9nfwjsCqeNKnv0xSxBOMPvJMBUJ0G/ziylORnHC0dTzHLQM+nj
         3Fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422159; x=1789026959;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAkYV6yOiFFE5HQj2p+KiWe4hueb4hGJPzEO7lWuE/M=;
        b=iSn+GNGhGqAyKsrV+SMUJTdjkEMONmDZIdYCWq1/+uQLP7YGd12Qc/f97g+dOnaodk
         lyJe9w2vWVPL73/hfa61Bp7x8Kk3rIwQTw6TrWOS1HJtmouC7ckYWgrJy050dHYogCXJ
         JRS6W2xcJuVgG6KRhtzh86Z1vMaMw8Cpjyn9WvAFPe3J37oR6D93GEK/T3pOoP64n1HX
         l+6mQqnmim3X1LNrLQzWDWBJ5eNCp9WvsLixF4asLKiCVJqJgWxKwF9Cgnl2BHhzTH3D
         zAxhNn/2hMPpKi+fL/Gmk79SBvyCEaMyqOU+7HyEgdOi4EvfDMrvaUxh0UJixP5kxYjK
         272w==
X-Forwarded-Encrypted: i=1; AKwUvBxVLxgJkHAhzCPs175t9WELjRgheOu3kP3ud6/uI7dfvVMsXFA0q7vVEPeivXoH/3pWHjRyyqiVrzp3@vger.kernel.org
X-Gm-Message-State: AFuF++m1GAnHPr3RlUJxajTOB2+R8FlqAL6OLMSE4JoQMR5moyKkoRRK
	BKva6kUPjiny3CDyuIuovMXteZqsC5CEz/cwG+13dPhzqEvX1szjieojBmbo8U+Lt78gl2jof26
	bSpXUvM+EODFRXcZvjb7i3DbtimRbYjuqUQoNx5Aejw6X/2oFmbiqvMNJWxkIqNdj
X-Gm-Gg: AYBFou0DW7kGzhmjnNPTII+HmRbfKIICS7fFT10+gybs2C4HC2TfqA+mWFV3yDIgQ5E
	thjLiwkh/3823d19W1fFVsp564KeUQNia5ZghrrHhhjDTuc+QPL0rMm/xHzlsz+ygFIfGWsifA5
	gFk2f/nn3mu3syy94N+N5+hWdTAp499ZYfFoSSKv6fJwN6dafOIPX8PiRtru/j5ln0U/75hIxOJ
	4CzKMaU01YgBWUFvPmfuvrGugP4+dS7WI7lyH7HsRzkPlBb3FVWMeKLbks1qWJePjt5KCyhWRCO
	PNcqCWD5ZwCN/pVmt3TJD0LIjsE3EEGvMHCyJIhF1bC66RmJurMXbK50vpxHOEv1XjkTYyRxS3z
	0btO+GgCH3DO471/j5fI=
X-Received: by 2002:a17:90b:1b47:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39aee084eddmr14851306a91.12.1788422159497;
        Thu, 03 Sep 2026 00:55:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1b47:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39aee084eddmr14851270a91.12.1788422158960;
        Thu, 03 Sep 2026 00:55:58 -0700 (PDT)
Received: from [10.64.68.32] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e6e3asm4054175a91.2.2026.09.03.00.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:55:58 -0700 (PDT)
Message-ID: <bf5458e9-45dc-4a0f-8d47-50e96f22e136@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:55:51 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Guodong Xu <guodong.xu@oss.qualcomm.com>
References: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
 <049be278-8958-4d04-8501-7fb60d2169cc@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <049be278-8958-4d04-8501-7fb60d2169cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX9BBosbJMS8+/
 wUfi7SSGurVB8YNtyjpn25IPZjShyfKpxJNtLJSS8/3hlsziiZEBjeThVKNpHvIX3VFF2iOYAak
 XclNkPscdsWjiSuhgk7CGMNcfSdZzh3gUcwHdPsVxnqXtEpdBxUtsjjm+AYFfRXJmW2PmB1/EO3
 tH11hqvChmve5DOc0QeaEODDMD4nk6GnvN4i7iHaRUwlopdrR98PRAAnj1rn4cAa8ZLJ/93z7vL
 XvWBytgmzceTs2NN9Iqt3+/wHs3Q2J/GGVPrEH0q3l+1uV9Q9Cr0OwzxKPaCjUXYw7eyTtHkorR
 c+zM/AZCy7DqY66a3HRgZVcCmSLuGf4+xXgM9YZfeSAi8oyWvwz0lUk5QCKW3EGUYyq/NMmB8zC
 a5ch+Mv2i1V58aldgH7sPvFGz90bHRrZlueltpLwqYnkSi2MQ2O8coqweMjPb9u63qvAh5Mfdx8
 v3DYOiSC3/pWSBd3/ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX0dCMP8qcA/Zj
 X2/YrhmJZwqZTBvK/WbWL0f8eHQkR8tHUDZjEctGAGJabNYPvkNnwvurDrrEnpk601YoVa/PmHa
 AyqZaE2zi7/2LBALtHkeWuJkLt7bLnE=
X-Proofpoint-GUID: NAXnZPysPkxJx1Vgg-3fNakPeDQKlREW
X-Proofpoint-ORIG-GUID: NAXnZPysPkxJx1Vgg-3fNakPeDQKlREW
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a992810 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=nF2vwnYNiXGi8mvl9yQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069


On 8/18/2026 6:49 PM, Konrad Dybcio wrote:
> On 8/3/26 3:27 PM, Xin Liu wrote:
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
> [...]
>
>> +&i2c3 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	typec-mux@8 {
>> +		compatible = "parade,ps8830";
>> +		reg = <0x08>;
>> +
>> +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> On other boards, the port0 retimer normally takes RF_CLK3 - have
> you verified this bit?
>
> Konrad

Hi Konrad

Thanks for pointing this out.

I re-checked the schematic and confirmed that the Type-C0 retimer refclk
is provided by a board-level external XO/local XTAL, not by PMK/RPMH.
So RPMH_RF_CLK4 is not the correct clock source.

Since the binding requires a clock, I will model the board-level XO as a
fixed-clock and use it for the PS8830/PS8833 retimer node in v3.


Thanks,

XIN


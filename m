Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181333AEB2D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879242; cv=none; b=kjJ9T2Oa79GywyUbiB1jy9ZHZsqD+QyqnVj9KJGIoHb3hsd3OkFcTamx7b7qinw61ZRsFfZuDAyntBfc78CtDUsv12vRFaADSb9NTKZiw+S710lnIy0P1crbLDUpx+7ks00MpzjkQXgn2D9h53RawIlGDZvL2Qfp5wSlsT1WT3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879242; c=relaxed/simple;
	bh=KB48VjcwJcdFoEyL1UN4JBUVOXRybNpELXvG/sYq2zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoRpStdtBf9WwF+HTuQavVasxIWMTPhIJA/g6przVb04Z35hYMc+WeO+YUz3mC32WbltRju46J7fKPSfol8Uu8peBRr2hRJM9NbMjhVVBS8Vrx67XFXAXRNYU4Of8l1mQXTBSMK6yMzEHOHZc/mbgLxWtvae7fkUrGQeC3TRoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akl4rTte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E06oGQD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akl4rTte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E06oGQD5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXAj015284
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=; b=akl4rTtetvUhueYG
	lX71wEvuTkaEw+ZVwYal6+1bouF4goqpDDD36wZVv2tXzlRlAWhZwOdTof0hPswV
	eRhYrEWF3a71sOjjiNYYyQXVTKkfPmgpSemMXdmH+zl0bHlg3BzoUjuGS1e8zfCi
	4kPWIAsUcPZPUcC/lr6HZvL31ALeBFIDySgrwG4qCArjEl7CgNEcf98p30QpOy9n
	oy659c7XwiCTs4qNAtmX2mzbDDkXf9OTsSUU5tzveGOvb6gir5oCg5T7//TUDoXM
	Cme1KNzybjqFwd9/NTCDH8zzQCDIvMulDJyMbeMeMZkrOIkuQr/ZeGcrOvNElQM+
	xwkNow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ug68f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:13:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso34428285a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879238; x=1792484038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=;
        b=E06oGQD5wLsh2fmJ5DWHzYAggFZJfzpoKRItWDWjuF8DNLOWtgUQrfXLsNqrRaAn7k
         C1DPYtjnExt4r5JnOoJHWP+gHEYd2XbkEu/v0VWVZ7XZZztbe8J/YyLF/lCEa5e8Vq/w
         Egd8k0jE/5/j+HLbKXGEMr1Ehp8RGZCHoH0TXFbyjPX0u/RqUlJCUqCr8OVFDT/PzSeE
         bnSMShSUJmJ3UCTKC2dQrHaRbm/Z9S9sXdGBMrj85e0hA5JNbabHEzvBZUW3Bv+y+dgN
         4FzaZRAWLTe5eEWlNqnnFfD8PbwOnYD4rRr6MOI0O45fE0mA+xLlwP+9wBh0UISf1k59
         ZU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879238; x=1792484038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=;
        b=WS45Wa03y0VvpjnOFtEJuxqT/vyxTY4UHYB4vP2RMwAs8XXy8VQE01ZerJER8/albJ
         8g0aXDy8+yKS3t5VraWBH9Kz7p/BwXPT0Em9/Owo67NfNFB+J9wp9GFO/6dN9MlWisq0
         N/S53fNJfnGcwvPcWIzutF5Uj9aLz23ixmbX0Ocyb9IM5cTde8QTB/rL/xnKa5gwffEu
         ne5Fvgw5Q4Nqr2HyVb5cZNX25869nBETgqzMd8yOxnHDfjqau9KV4tuNMMOjxZy+Tf5I
         WHcyw9xbW/Hp5asic95rHAJZIsUpWv+a65yZb2tU/iKHPyIcKEMFQuEu/0WZEQ0PD5qM
         LmJQ==
X-Forwarded-Encrypted: i=1; AKwUvBziBkBNxIhZMh4ylvLINZ7HzcCPS74YH6uz/1by41TUfAUbjpEIjR2fgVXbzOgcsaaSqWVFZmoXkYnr@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9GpMb/Y12GBcaqZQhoalbDZ0aPcackzACKVl/QdJ08MjNXo3g
	o/yN7tHnycRNunnnfPxJre1JopN02ENoCmGP723pO1Vub+lMaBrIesJT45i0gr2aGNpsOGP8+r8
	h9D2V68GGH4H+e+o6AzB2NPw0NnUR2TVe85hmPgG4UmnBYClavnZy0G0lSbQtZafx
X-Gm-Gg: AYBFou0SuPFcjqFsqopAHSGgiy7WIOBwjxJN+0WQnbxYvvE6x0Yn72WeAfMMrfrP6c+
	jk4xmYx5EF3S5xdJ9waDK/IPoQTaJ1nbaeqxsspeJ7Kxu4oUjLRrxu9ABQwi710PlRBDP2SW4QK
	4POwW8xehI/o0DXd3DjWkFg4CpOCNcMJUIDt25n13p2E7azY3oo79cRx3bMtjQZVRFMGpc4KV6I
	QdjVSB214lEMQaCyxvC2TR2YzKga6MdwETJ4ai1CiaY8jiw8F8uouEUJFETUGSoXyGDbNctGYeN
	eOj6EC4thHk6wCpRbmHm5kTsUzLCMq/4riVmtYD65gn1Yg6Bu8gyBu6RXVw3NEDxUtk8vRBu5H+
	h+2rS4nvvt6EqnY6s6cgE7w==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1998190485a.0.1791879238333;
        Tue, 13 Oct 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1998187985a.0.1791879237824;
        Tue, 13 Oct 2026 01:13:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf0751sm197267466b.35.2026.10.13.01.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:13:56 -0700 (PDT)
Message-ID: <cc9c2f25-aaaa-4113-83d8-4965822e4fce@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:13:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY5PR01MB10600FCBB6CF8F9233D1214BBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB10600FCBB6CF8F9233D1214BBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX3HNk9PUHomOH
 0gY5kVWVyqy61R9s1ifJ+ePLo7cO1RBpnD7mr3Q15kYAQ+CP+TxShtSyp2tHEyUXaLbFMnXpa5+
 SLwWNqbtleNWg5Kp4s9kfHp6Xi9Tn4DaIfv6/mZG7kkSRBi90dhlkZviq5jQRBB+7F7eJiPnNTV
 wE0xhlGxhDya36McrrGvaWHeodVXbJ9LsdLpMYjnyHMtveHbNrlINbEZBYQePhXKHREGa44Tlsk
 HY33fmybT6U86m2tXNmApzi9Y7aJkaEUnzm/uxBVL+djqDPADTAFYOdcT2XEHeQNqH14IR0aEKy
 OZ/SACMgcQw2qpjbeNcD+ATijdaOF+TWX3WPKAsx9DebO8y26ijpcH+pC5UHX+InRCLtxQAsU+K
 nQCO95S9HmTEvcb2O6Aloy0JYmJ4ALeypBFG2j43+ZnBdWJbLXuINJTixmH8M3m7EuDpNC9MRS0
 WlifmbqMUCWCdxszshQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acde847 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=UqCG9HQmAAAA:8 a=39_P3G3aOQwE9Waq5pMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nhF5xI5Wkfynl1JAo_5kLtZstKjXDnyu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX8uFrR7uR1Lvs
 RIpF28W0SHzrv2YpaTB+c0j62fQu3aqoL5vOhfoRKIJJUWVO5muvQK7QXea1ICPrtkYMwfBlJfk
 GPErmu4eQVuE5DrfqZofTCEmhla6YEM=
X-Proofpoint-GUID: nhF5xI5Wkfynl1JAo_5kLtZstKjXDnyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130032

On 10/9/26 12:34 AM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the board identity, reference clocks, PM8550/PMK8550 devices and
> keys used by the v165 board. Retain its inherited debug UART alias,
> stdout selection and QUP wrapper enable. Keep peripheral bring-up
> and the Android bootloader memory contract in separate drafts.
> 
> Describe the board from the SoC and PMIC includes, rather than
> inheriting all peripherals of the SM8750 MTP board. Reference clocks
> and key pin configuration are retained from the MTP description
> included by the existing Warsaw BSP.
> 
> Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>
> 
> ---
> This revised minimal board has not been boot-tested. 

Please test it.

Konrad

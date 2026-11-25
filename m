Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601471;
	b=JKmFwWvvXNb0hZIT1JOnvu/PD4JlXRq9AxXGC2NTL9wYpKI7Yppe8XPCegUjmkaO9AqF
	 oh5lCythB47JgTFhW3H3YZhVR6QGFkrG4FnmCk9sdZxbc8JwBlycSNR8PwzUz4H2YTuoR
	 dQD2bBOvBTuT9/bAau1+8BZMFE8ydBxg1/TsPFJqUEsqM7pD0RN2Gsv6LLTUb9oYBT5hj
	 hcAKtdbUpLA2cAN42qLeUkvyTrwNDYfmaJ8WyY1WISED2yGrcrV7vIeBGWS+ftuXoreCP
	 sbb59xGoHdASRC6VMaEyqutVf5uRCzh+3ZXHuoTCGbG/+hDPejq3KTDujjVx3up8fpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
	b=rAoraRonTt5g7ASPsiiuANT7aPEhTOiuKegLkn5sMU03AB2E8K95ttpredY3/NESi+26
	 RDr87hrHfg0IXqMZJj718aA99fYYCL7IbfGfMTl/mY05+eBzj54aOUpiRCaNRjmQfQ0vH
	 g9US3oDZaeYnuZ/TxotRQWsv7aRGxHW81mRPfQKV4CIa6ihlZ9dAjqqPXOpXFZjMVH8nf
	 SoFsF4KqAk923ea9+WDHoVNHbcpBHoRNgHobW17RjQRZLC9uqABoB5dnP7Sl5pW01PyEw
	 I4TGWI7bYgh+qzJAGQUoiaWTX7PCTfp/E0Km8kbJqhVA5rJ+pjuTo0d9cjnfnaQej0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMjLozre;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RVRYn5rk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9839606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9839606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMjLozre;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RVRYn5rk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTF64034158
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=; b=XMjLozreDz8YnShd
	T2K7aVz/9tDfu+Hv4BLU1M6xdfCWHACfDZgpOydPe0kHfW3eayn9Wx/rVDKUiLv2
	B6cHEXQdIsZZ5y6ef/H2sJZ7ms5HNd3b87IqvslZYkxuw/Ybj+LxOu9iIVsocRft
	NdKnZ13Qzu8XeKw4kfoDyRlvfi4fbs9fS8U0RYLHXYp06UJlnP1R3Yuiq6ZPXdO8
	9uyb7Jbo36oxNWynGdfTi9GnHHKnHiL/01TvMW41N30jndCapiaxrtc0wZLKl3zQ
	aTKWKcb6lZzXRzOp+KoAb/5aVBhdBClQruV0Uea2wa2xIqI3w5qdBoxun7QKkTlB
	GVY85g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj7ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:11:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso4424497a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601469; x=1796206269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
        b=RVRYn5rkf+0VVEq8gtKYFJFguuSfkaLBWwsb1Mei2ph88+EQ0wK1pDtCimXelCBIqJ
         ANmBYUTrl+XG8UpY2psdoaXTE4mz1N1/pLGUdb98Wx425SwJPM4jftmbBN1dPVdoWk1P
         h9WCmW/iJetKmgrOM4QFhhU38f3iJHkfoUtiHatx77k/idmaHLWfvgJNyY573advkBLY
         fZJoT11zgsPNRHbJlPUMI3Wa0kd5sJs3XvIk9W1p/z16SEiwkq+Ix7+39FPR5BS3aDo7
         r6HW5KvHs/Ju3hWQ0zxc2bUkD9gDDRk4U9X6mieVPd2LDL1VBlcCm5yrOQyNCuSfoxJo
         +sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601469; x=1796206269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
        b=bOQ25ev15L/GvFBnbIFNkBEWqLA0dZ1Yq+1hD/vjJio8zMepR9nqb4txLQrAEafn8v
         NLeLTAfTw/Sp0lpewhULSsJUlS2zcvj9498kvD5G3ANYBOhQRkJwDbHaQMxEM2OUOJTx
         FH/rjjmvUcVCk0NYSrXaQ2yf9h4EB9P8iF+aTdx2lGkC1agzj9W/8gqEEDgSCcsgzrOR
         b84byTag+r5MtNpdctWM/MZbixmGxJqAz/UPXNqiFzKRyJ0k97JFReREEGzfc1GgpVCs
         MM7UClozNBq7D3ZQHruL7smoHPfwJQaXPhH6z4JdULDGnkwlDLSXB6U4PskD+Ha0H6I0
         4AAw==
X-Forwarded-Encrypted: i=1; AL+hErEwLimkW/IPsS49zAOqQrcs9lYuoWkE7eyhPNnbSyyNnXGahTyzDzxtE4ffJ28+2Zh09GBsyHOyc5KR@vger.kernel.org
X-Gm-Message-State: APuU4Z/edyoyZTtCgU9DMt2hWDOcg1+q70OGIymybuhFryFpYQGWIgVU
	52ODVtCGMAesHz0MFvTAydhu/Pu1DHPRgRKFdvCe55IGrCzRUq9E44nLkozCQB/mn1WUb7myUmW
	OKkbqlSkb8WjYZV/ONUQ9l/dt8cpNSGU2HuNJKCmxyx2k7lGvu7OpX4DMpZXAYZkx
X-Gm-Gg: AZFdTZf2wYzDlAYPv5wa9+LvTsnqg+jm/pI1z8R66p7miWkFEWzywvLgWBi7Zl8vqCH
	n24368JMEWhcL95h3BdoJP4cIK4LGDBrnNYCtguZFGtAW8YwX55uH49zVlhZkhG7noq9V0iEQN6
	HlfYzr8RNWI0la4wjnWkbOAgJgXiSCzgsTZ68GltOx0/6smZAOM25KGh6uR6T08tJODT/JJyuCX
	lUd1gK/EDcW5SgCevrMKmL0pKSlVb1j1JAQnPpemY92m7m39p3rLS+Csj1f+naygniHwmrLr3Nu
	rGTYXC0nmaRKca+KDYsowGJHXA5DrzyyFz8ZteUPGLMOykOHbRnoZ9CEFHNhyI42zAccttmJLjU
	a/ANpUCeKdM3lQP+0zlARd7nqVtn9d3etH/MaTYHCOriQ+Mo9RrPIFnNDzfGCb/e0WeY6u6YrUI
	9IVtv5RLai+kFgFyilzNBBLIuBChnmZJVQE3S5YQ==
X-Received: by 2002:a17:90b:1802:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b41c93ccf9mr16179596a91.29.1795601469342;
        Wed, 25 Nov 2026 02:11:09 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b41c93ccf9mr16179571a91.29.1795601468716;
        Wed, 25 Nov 2026 02:11:08 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm5931651a91.17.2026.11.25.02.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:11:08 -0800 (PST)
Message-ID: <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:11:03 +0800
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
 <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX5CnaFGyV9vRl
 Pi30iJfXFtVtAnfOxtbc6Posqgb9tQNSBzaK37w+YLntM4k2nHz2B1Bdz2zRPuctMpgvDoGQpIJ
 uOqoEJVd5/S39zy6kZLq13AcxTPUhcQ=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b43e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C-wyTywGbBTeqauinx8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX8o1oZR1U3uRQ
 Jlcm3WmDRM0zdyyannu3cLFHoNQTlhCZuxE0oUnR8PM0qsCLWV1gOHadC2D4xkTjgobW7vNs3HA
 FYKQctHIBHqro903ZxkPd5KkjA/W3GULtXST357f4Ihd2K6J8W9gdvhH9LGG2MCKmCBKa1bk3ip
 QGTVchCc1EMQt8JfvsL6tvsuxGe2DZwjG86MOKzvAxex7KTUdMhHWHt9RkSrqxcShGnIPQbQmmq
 vOcdwzCx4d56cc53TTjJ5eedaPCDAbO/aRSDLTG9QUuIA8GyuF8RKJoqOuf3nZWwnaL3aTBGFp3
 5VpVWJ29I/NBXPU96NX3uyAwvU/+R71VQ4ss7Sxp6v60rbif8yd6poJZtdcn2S80N1lL9GYf61Q
 TDWlCTK1/MG9GZIYvotxD+WXSPAlg6wHxqIGMQcUh+Yws5MlNSHF8m/xr6dsad1Xb1651u6q7Vs
 xXa6vaI72AcaFZeckTA==
X-Proofpoint-ORIG-GUID: IIa5C6MTqNvCWS88C1vgV7Dpd4MHSwHF
X-Proofpoint-GUID: IIa5C6MTqNvCWS88C1vgV7Dpd4MHSwHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040



On 11/25/2026 5:53 PM, Konrad Dybcio wrote:
> On 11/16/26 12:03 PM, Jie Gan wrote:
>> The cti_riscv device is suspected to have a clock vote issue on the
>> KVM enabled path, which causes the device to crash during bootup. Mark
>> the node with status = "fail" for now to avoid the crash.
>>
>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> That would mean Gunyah is enabling some clock that the TZ itself isn't,
> which would be solveable through a clock driver patch. Do we have more
> details here?
>

We are currently debugging this issue. What we have found so far is that 
the RISC-V core is not powered on when the AMBA bus attempts to read the 
PID from the device registers, which causes the system to crash.

Normally, the RISC-V core is powered on by remoteproc much later in the 
boot sequence. However, we have not observed this issue with either the 
UEFI or ABL boot stack.

One possibility is that the RISC-V core is powered on during UEFI or ABL 
and remains powered on when control is handed over to the kernel.

Thanks,
Jie

> Konrad
> 
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 0a95ad5a5582..5f5a786fbd2c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -3996,6 +3996,7 @@ cti@982b000 {
>>   			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
>>   			clock-names = "apb_pclk";
>>   			label = "cti_riscv";
>> +			status = "fail";
>>   		};
>>   
>>   		tpdm@9860000 {
>>
>> ---
>> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
>> change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea
>>
>> Best regards,


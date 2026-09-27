Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD15F547062
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517275; cv=none; b=UeHX3rQQew3YQ68vaenJwrTQPttouBz/JkcPJd1A80w9IIh5PYRxA68a46xa2YGIeq+RnE2m9GV8ghGJamKuUNDVKoZ25HSMLVY/sjUQGbMX1y46fx63LgJqzJ/VTVm2Fv2axhg3kDeY7If+hCmz0EP9ZvT5bA0A1ig8N++dffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517275; c=relaxed/simple;
	bh=t6Kx8ZzDKvbf9IjPHXQZzbC69wBFQI6yCYoXIfiT3WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRymb4RcSJBxc733kNZ6jIdlKwC0zyQvKd+h3Mg6KesU/G5BnFL9entyCnli1RnSDJtzpx9l+20nZXZo/NqXsibFCSL3va2lBCzJmHGoeJzv5Paifv2ZihmDLuJtUUrGfnJDso0HrSLwDQMJrrjU8SoLIAB5VnUcnJSdYmXtVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ryge/iV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIiTKraJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ryge/iV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIiTKraJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQem1329820
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsQD/KnjrsgzCX35hm6YWUaXBoN7K3xyctZ2lbnLToU=; b=Ryge/iV4dQd81gUJ
	Ax+mZ+mkmy2WIdZBE0CzyBx0sinSTKkh/lA1HjumqtOSNOM68b3lz4/K4n9A/hVd
	yp8EVfueK56ZJsW+GAiMWn2RkppmqYQQ96OMJ+gLs9Js6gXnXv2tOU1zw3c2+bve
	P4EIX6TJsPiQcMaq1sbs4N5zntgrnT+vltVpKuwyQ/QA42WUWgkWTpIBKh5NIzat
	BIEGgtLSw5amoMxgDUd9LB0UClHAhKSP4BG5/NNzQwr+AbfeztYmuoU1SrrHJEP5
	AFzAhJFKY3QgXeZz5dtpB/5hLgzOdOfSUO7gvN+tJUdQc1i1KC6y0L+cLS0b7L9b
	8k4/2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50sb77a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:54:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so1771003eec.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790517272; x=1791122072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsQD/KnjrsgzCX35hm6YWUaXBoN7K3xyctZ2lbnLToU=;
        b=SIiTKraJZCx4n7udDQ+/+C5Vdad8DP5JKK+HnGU1nPzfLqEoKLE2ENMnZLVwN9Qg9d
         rxegfWPVOPCyNoY+tQKGqJHr0JJE/r3ZVsdS93VuTLK6bchsIi+DWzbgvriCrBEgBqrB
         rUsYzxFXqGESej9iNHx1T2YXGIbnTtjuJ8rKg9JCGM6ubqtMsHg8M92uTVU5XC6Lkep4
         WX8aStrlhaVUMUO2Mpam5zp/e92t8bvpJ7OJG0KTABV41IOPa4dA1wkjT0AlejY+wm70
         fAxHYWaUHjVy5SDhSCsCXeHxtLpHmv78PnaqeHBOPH2CY0L1PeKe89wN0JuePQDCKKVB
         ZjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517272; x=1791122072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsQD/KnjrsgzCX35hm6YWUaXBoN7K3xyctZ2lbnLToU=;
        b=DXybNIXyhx8luG8MN9coDUBiDsYTAiJouoRKR90WF0riqaEiQlIsL1GgICHugvr6dg
         rZ/GXJdWRssH6hAwwu7CWmsDX87i0V0QoduAKjCiWTKlV1iS7EDFj42XXp2Rt1GKKs5h
         4yVCvPIshaZmxZ0LuIHNaF4pnlKAXepXvyGI8vBjv9gDKQ8WN19ekYhdXbYfpiLpX2iY
         T1+aHK8UQq3aLXEet71PIqGjlWMRA1VDDDYErtihe5rdyPXMIVwMaCddoO2lIkz54vjo
         WC8fBGxQClfWL/WWTx1ragmgMAJkTRwr+20VKx+uUpUAE2LFd0FC3+aWaRrprjUWcu5B
         oyZg==
X-Forwarded-Encrypted: i=1; AKwUvBz7yTY78+RxKD4tbvSxnjtZIGKA3xHYhn4+H1kAfDHRT7gSGeUXxU7HSk/QGAsUYQBKSbYEsPN4XBqH@vger.kernel.org
X-Gm-Message-State: AFuF++mpm9q8TymlIlRoJsZgUdMAD2KmNekr11oEcHnf0q0sZNTFubNP
	z2XTe8k4L9rFpEda9ILifEe31ryb2FJUgxgj+Xmc9CBYjMyRN4boRmw0cQVWYSkqpXomH/W96W0
	pcgkpxcvdHK2IG0f8OFTUlGxLmtcTHKaG0fwj2ThXhl65hMsH6miXSGczsTPHlwlE
X-Gm-Gg: AYBFou1HwT8FVF/E1API86q/P+O4nly4zXcHVRiJuuYMJUIUZl6KOo6XHTv72cJfZSU
	KPsnPXQUDy9gOXiydbR/2SI7F1ETo/zT++QV+7+tkRmKNR6m2K2VeWAD4fEnyomufAkV42iWQdT
	nfcuiMxkK85YdBzXWw3JRxOwRhwQ9kKoTMFHLPYdlWpkS8t2rl8/EWNGOnke7RuhpoT8XfQ2iIb
	sW3hDPExpcoLVikCBcBj2M+T/8lOq9POKNuTwnMuV9NRS5m4Z/Lsa/O2lP4FzsGRIh+APFYZZX3
	v8ewzJdsv/0rzkP3cGtLItDbeGYkpDvjE06L94yzcZqOe2nBMf0aimHmByOeAtR8aJoQCx9/0TL
	NQ7y0eY1JbU/q2vt9IiwUIKk7M7+G3wJ4VxD44cSLKsg=
X-Received: by 2002:a05:7301:dd8f:b0:340:9d9f:a5c with SMTP id 5a478bee46e88-34273550304mr5496887eec.36.1790517271493;
        Sun, 27 Sep 2026 06:54:31 -0700 (PDT)
X-Received: by 2002:a05:7301:dd8f:b0:340:9d9f:a5c with SMTP id 5a478bee46e88-34273550304mr5496842eec.36.1790517270590;
        Sun, 27 Sep 2026 06:54:30 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm20103595eec.26.2026.09.27.06.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 06:54:30 -0700 (PDT)
Message-ID: <e21cfbe5-4a4c-4373-af69-33d9b74ac944@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 19:24:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add label to PCIe1 port node
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260927-ipq5018-pcie1-label-v1-1-41f7d42f9a7b@outlook.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260927-ipq5018-pcie1-label-v1-1-41f7d42f9a7b@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfX5tfuHl8UWM/t
 TW/FweRkwCBi9p5WAEDdRzjU7jrBFJRIDf80Sstq2Q9Vwnt4hY9JCARz9vp0OtLbIHGOHkxGHf4
 WdKzsfjVMr+EmHdAHj1ZWAYW1VeC3DI=
X-Proofpoint-ORIG-GUID: OSVLeG1t3-PsIqbR9pY0bpMxe62V3YjC
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab92018 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=M4XmOyF+KGVEWXraXaCqgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=O2R4rtJ4rcfsn_qeZX4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfX1zdkq6QNEZu9
 jTSQFxMY1HMiyw3PNgUkNTqS/bSop9SjRlPhOZLoiLzYQK6H/L6Q+WeXq3hgMjayNmEMD8QXYUV
 QjnaRCJr9RW4pK/GnahBKcwqzZTXV3s95yv+zcSLMFHwMwytatxDbdkVeb5N2+CVXnsFOJp21o1
 BUnOMZIOmmcxf870MwTTAqq+okIyTARPvUjosjMhJ6z5BzvuvkFDa4LSl9CLofsi69AKDv1GXxa
 hqbc3qY8T7TVS5xVEm9IWAYZvUK+gBF0AIZujKGYzwPR/bEJzxR5poT1EOrxn45qKdFPvUl5E9o
 g/8Wi23ZBsdNI4+3Oops+9B6ShAqJDDo/WoltblYuxstTAJsNBrF6oIiA+63rUwduGR/NwnUw2f
 wKQ2NnIU2ScPx9XUAafpAykS6BgRJCh2ucjJuHaynnkWi5VhSSCQuCSMGeWrxrvt76T+OhosMDJ
 M6Fr3mQnVse8t6JwMrQ==
X-Proofpoint-GUID: OSVLeG1t3-PsIqbR9pY0bpMxe62V3YjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270055


On 9/27/2026 10:12 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Commit a95758e9718a ("arm64: dts: qcom: ipq5018: move PCIe phys and
> PERST# to port node") added a label to the PCIe0 port node but not to
> that of PCIe1. Boards that have a device connected over PCIe1 need to
> reference the port node in the board dts files, so add a label for it.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index fe1ed240de59..2f3bcfa888a9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -838,7 +838,7 @@ pcie1: pcie@80000000 {
>   
>   			status = "disabled";
>   
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {

Although the PCIe1 node currently has a label, unused labels are 
generally discouraged. I couldn't find any upstream references to the 
PCIe1 label. Could you please add the label together with its 
corresponding users?

>   				device_type = "pci";
>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>   				bus-range = <0x01 0xff>;
>
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20260927-ipq5018-pcie1-label-d7d405caf28f
>
> Best regards,

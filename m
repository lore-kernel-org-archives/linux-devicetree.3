Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2033530DED0
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885608; cv=none; b=pwpK0ykG0N+Tm8cd/9M3t4wIU7FoqmXqE09GHpGHjcgZMnIE3KUo50P5jLZ2lpVaMSniyCkaGMRVt0ZwSqBl59xnchAy0t3csZNXqLtXtdEM0JEjLQgmpwDN2L8LL4MrIcnoPuKtrZ9Ud21GjZM9ScEQHCmNsIWX8gJFUZ2qMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885608; c=relaxed/simple;
	bh=Jsb64BppIKhCh2w+6BlXRchgQjTK59vwgMt6kvspQOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/NKyLqQWdy8JZcT00zt4kiwUsaWqSNR9E/OWVGTzhlWwNVxr8HGsjkDLDQ74kmQvwpADMbrcH4enCAZ7mrZlJGGz53dVakommAENA3EQL2LUYoAOhphmX90/IRfzUP9TGFYUp60kVRNrO0mAquw0pTEf8rmSspV2LRQnYuWbEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHsfaltA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3Dm3fa2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHsfaltA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3Dm3fa2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EYD71575359
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 02:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1GpJgF86OVuWBXMLcIgc/odzzvOYtSH1/MYLOkxrdc=; b=DHsfaltA2c8kxmJz
	LUaphdhyZePFH4GE6hR7qIpO/yD7kxuPVzSZppS+rrBb4y8J/bHPvmbMd1+nFZyZ
	8RUQrqVgl1qe/JT9sJZmCZeDcGxHBTLNLuhxwgvcvnYSshQy/vIiumvN0zTs79Wt
	hi9r5jt/HE/SGzbn0LdjTwBuDmWu3qHDDHBXV5nIa993uFlcn/2ZFI6vs/omB8FC
	U7erNzSk9ltzLkSVifOyoyLJQn8dVmPFzZRqYsDhXcBFmHswLlwIsav/pzHYMem2
	DBEtbZ+6iUCmXeZkoDhCodF18E4KbLTVqfyudOjK6snGMHcIpdbnAhJ0S/C1HD4X
	owDgIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwwh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:26:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99629fd6so6511225a91.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885604; x=1781490404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1GpJgF86OVuWBXMLcIgc/odzzvOYtSH1/MYLOkxrdc=;
        b=C3Dm3fa2YPrdoULFxxIHH1/HsnoSBayjNjvrscojd00JIE2asND7z2RNkqL/5txbPG
         u8aaoUwfBbrtVR9tfMvcXu3J7An9Dla8PG7NqaYOi+5MDgBaiZO7ET4wmeFNCFDBKC/i
         Np7Vbj/USyI6/79VvCjKE3adNmhuhmilgd4phxSHdUQFnA7exHXYDCr7+EkyxulcJlcW
         y+yqU0PvCBXDhnnH9I8OjaMR0oYAIsg0hwRADau0qK+vzNVCUmlInA7bAjRtMs6pte6A
         oERpinNSC4ti7ROuo73cMe5ACtUX+afMavgf103VYjLJDs+fI6c83UkhQMbj6g/OQ1Iv
         69gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885604; x=1781490404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1GpJgF86OVuWBXMLcIgc/odzzvOYtSH1/MYLOkxrdc=;
        b=elqGD1g75Py5Wr04eCx33dohW6GcrADQqDKYbI2kg29vbe0OpLM5Eo3VDWDwCBuRIC
         HrmzvImG6nSwmJ+rJzeO59DnXsSoE4QTcaCSxaNYC41QjYm8xNp/ebEigIFqXHWJMkzY
         lXqJ5N5+7GaPQqBWq+u0G3rS+94SY7dMQpDnK+3+7xmoFS6DfKoHACl2orCJGreRC1e/
         z5McelmsQpTkZ/JtLcZkxlZFYSbYwlQrNsLte7SBfzykvezwhrKLFkAxSs6djbFVZMgt
         dsnGHrmj3HaYY27VRLae2cGO5TwQWRKFwlFKqdgG8SccNU5Z9NyA+P1arYutdVU6VdRa
         IH5A==
X-Forwarded-Encrypted: i=1; AFNElJ+mYsWRlP72HikEWG83y4g4V1n9g17lmHbTMelmXYivHc8Jt7T+3+CgS8HCRlib55/pkZrTYz15vYzB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywio50/JfX+Wllac/VlSlaGb5CeP6HKbxhV3TxIhH9+oLuqDsBV
	jFl+Qr3w17Yyd2JBmLwDQ7ZkC16BuCQBs0sGsBfMIQhvhmjW//ZdyKGfDDq/8crEeR+GE90cGmE
	+dW/AFmbDVD8wtAhtLKaRPji20++Fm0eBXeDYjNCSft31y4PA/cGtW9K2ynXBnTII
X-Gm-Gg: Acq92OHpPgxNdDg8w3idtzyPR4YXf2ZMakZL6cHd/EGWBQ6949Kqrd0EwCGHnLMen6b
	fJqfCTbOBZ4iv5X4LB/XdGEDz9BVfo8MdbC+UvxvPf/aAHocuI6U1FHgrdoNp4m3A4+W6uSGBKn
	+dW3/x2Diw8Z3J2w6DuSzCBv5VYkB+LYaj1rdZne/FEE/ySAvTVfQ8HQwTsUEhJcFSwk1/GyQwS
	1nky9dhviQ1huXDXiWQdva9X3/5Q5hmFLeoFO1U7NNY+xv6JDB6ulRwk1xLtix4fV7oDDAyxCcw
	VDsyP11G4elUSlOcQm4ZJqIh2/gUk7LtHDxZH6ARcn8bY5bK6XYrK+9qbhMCi1YBWJA14GZR2rp
	ANhejNfMGYCZjRIiXfH9lKpSFztQebA7Qb5sDqhFp/80Pl5/N+rokddNuO4ij6EtGFDCrf+MKd9
	wfLIvHKfBd0Uqe2NUSdoxBT30tyh0w
X-Received: by 2002:a17:90b:3852:b0:369:73a:326a with SMTP id 98e67ed59e1d1-370f096a635mr14237004a91.13.1780885604471;
        Sun, 07 Jun 2026 19:26:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3852:b0:369:73a:326a with SMTP id 98e67ed59e1d1-370f096a635mr14236974a91.13.1780885603863;
        Sun, 07 Jun 2026 19:26:43 -0700 (PDT)
Received: from [10.133.33.135] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d013c9dsm14548354a91.8.2026.06.07.19.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 19:26:43 -0700 (PDT)
Message-ID: <2f963239-e1f3-4966-b442-7d44f372ea3d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:26:37 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
 <CAFEp6-2rT5fXkWaa-Fd--h8zuJ7kQqPyjedGNXrGvco79yMJCg@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2rT5fXkWaa-Fd--h8zuJ7kQqPyjedGNXrGvco79yMJCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAxOSBTYWx0ZWRfX1ytHpQMaFJxp
 zLZENbpcYE7h9scxF9OinW65K+JSDPja/Qxjfy5jX0NBzwUZQMN9gBFpkll5A2/yBYOHgwI/pQg
 fg2a4AK3ktB+eo6LbLZKYK9gq4h7rIiHUUTI7mgwWx67xXGLY41RvjqxdzN3fHrH+ZNbSiJ4cNH
 pDu/hIZq+Zd2i/mL8Aav8TFj3z5EmyklOPbRId5VaMCzWPvAttRP8de3SDgUJb1BC/dSiRKpiMy
 b17wLO1DZS3Vm++CD5yLFftDm8mtYcfQP3xqfdqEmcl8VEi4Z73sO1ebfyJbryO1+FZLsTzT991
 BEVWCJqLL/ePPGRiXJFF/psztJtGTMJc6yzS2W+zkDWkyiWEbY8Mwio73L4hv9VoQBWZmu4wR3W
 RTT/NymRtkf3Tm1ogWcoRWorb8CwDLk/c4+L7FqYpb3s7vGko8OTnIjm3UuWgV6Ncl2JUCxjI1o
 +ys1KZUS8BOwFiUKoUA==
X-Proofpoint-ORIG-GUID: Oog1TqEjFV5PVSJ4k3_nN4MZ7iNlk-lb
X-Proofpoint-GUID: Oog1TqEjFV5PVSJ4k3_nN4MZ7iNlk-lb
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a262865 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zxmW70ayUQ2lO-hVVeIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080019



On 6/6/2026 8:57 PM, Loic Poulain wrote:
> On Mon, Jun 1, 2026 at 2:57 PM Komal Bajaj <komal.bajaj@oss.qualcomm.com> wrote:
>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>> EVK boards using the WCN3988 combo chip.
>>
>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>> EVK boards.
>>
>> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
>> with register space, interrupts, IOMMU configuration and reserved
>> memory. The node is kept disabled by default and enabled per-board
>> with the appropriate PMIC supply connections and calibration variant
>> selection.
>>
>> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>>   5 files changed, 223 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index b112b21b1d79..c2ed0396533a 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -16,11 +16,48 @@ / {
>>          aliases {
>>                  mmc0 = &sdhc_1;
>>                  serial0 = &uart0;
>> +               serial1 = &uart8;
>>          };
>>
>>          chosen {
>>                  stdout-path = "serial0:115200n8";
>>          };
>> +
>> +       wcn3988-pmu {
>> +               compatible = "qcom,wcn3988-pmu";
>> +
>> +               pinctrl-0 = <&sw_ctrl_default>;
>> +               pinctrl-names = "default";
>> +
>> +               vddio-supply = <&pm4125_l7>;
>> +               vddxo-supply = <&pm4125_l13>;
>> +               vddrf-supply = <&pm4125_l10>;
>> +               vddch0-supply = <&pm4125_l22>;
>> +
>> +               swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
>> +
>> +               regulators {
>> +                       vreg_pmu_io: ldo0 {
>> +                               regulator-name = "vreg_pmu_io";
>> +                       };
>> +
>> +                       vreg_pmu_xo: ldo1 {
>> +                               regulator-name = "vreg_pmu_xo";
>> +                       };
>> +
>> +                       vreg_pmu_rf: ldo2 {
>> +                               regulator-name = "vreg_pmu_rf";
>> +                       };
>> +
>> +                       vreg_pmu_ch0: ldo3 {
>> +                               regulator-name = "vreg_pmu_ch0";
>> +                       };
>> +
>> +                       vreg_pmu_ch1: ldo4 {
>> +                               regulator-name = "vreg_pmu_ch1";
>> +                       };
>> +               };
>> +       };
>>   };
>>
>>   &remoteproc_cdsp {
>> @@ -57,3 +94,25 @@ &sdhc_1 {
>>
>>          status = "okay";
>>   };
>> +
>> +&uart8 {
>> +       status = "okay";
>> +
>> +       bluetooth {
>> +               vddio-supply = <&vreg_pmu_io>;
>> +               vddxo-supply = <&vreg_pmu_xo>;
>> +               vddrf-supply = <&vreg_pmu_rf>;
>> +               vddch0-supply = <&vreg_pmu_ch0>;
>> +       };
>> +};
>> +
>> +&wifi {
>> +       vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +       vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +       vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +       vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +       qcom,calibration-variant = "Shikra_EVK";
>> +       firmware-name = "cq2390";
>> +
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index e62ba5aef71f..3bfd0050064f 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -16,11 +16,48 @@ / {
>>          aliases {
>>                  mmc0 = &sdhc_1;
>>                  serial0 = &uart0;
>> +               serial1 = &uart8;
>>          };
>>
>>          chosen {
>>                  stdout-path = "serial0:115200n8";
>>          };
>> +
>> +       wcn3988-pmu {
>> +               compatible = "qcom,wcn3988-pmu";
>> +
>> +               pinctrl-0 = <&sw_ctrl_default>;
>> +               pinctrl-names = "default";
>> +
>> +               vddio-supply = <&pm4125_l7>;
>> +               vddxo-supply = <&pm4125_l13>;
>> +               vddrf-supply = <&pm4125_l10>;
>> +               vddch0-supply = <&pm4125_l22>;
>> +
>> +               swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
>> +
>> +               regulators {
>> +                       vreg_pmu_io: ldo0 {
>> +                               regulator-name = "vreg_pmu_io";
>> +                       };
>> +
>> +                       vreg_pmu_xo: ldo1 {
>> +                               regulator-name = "vreg_pmu_xo";
>> +                       };
>> +
>> +                       vreg_pmu_rf: ldo2 {
>> +                               regulator-name = "vreg_pmu_rf";
>> +                       };
>> +
>> +                       vreg_pmu_ch0: ldo3 {
>> +                               regulator-name = "vreg_pmu_ch0";
>> +                       };
>> +
>> +                       vreg_pmu_ch1: ldo4 {
>> +                               regulator-name = "vreg_pmu_ch1";
>> +                       };
>> +               };
>> +       };
>>   };
>>
>>   &remoteproc_cdsp {
>> @@ -57,3 +94,25 @@ &sdhc_1 {
>>
>>          status = "okay";
>>   };
>> +
>> +&uart8 {
>> +       status = "okay";
>> +
>> +       bluetooth {
>> +               vddio-supply = <&vreg_pmu_io>;
>> +               vddxo-supply = <&vreg_pmu_xo>;
>> +               vddrf-supply = <&vreg_pmu_rf>;
>> +               vddch0-supply = <&vreg_pmu_ch0>;
>> +       };
>> +};
>> +
>> +&wifi {
>> +       vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +       vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +       vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +       vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +       qcom,calibration-variant = "Shikra_EVK";
>> +       firmware-name = "cq2390";
>> +
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> index 8b03d4eafa6d..a79f44aff968 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -8,7 +8,22 @@ &qupv3_0 {
>>          status = "okay";
>>   };
>>
>> +&tlmm {
>> +       sw_ctrl_default: sw-ctrl-default-state {
>> +               pins = "gpio88";
>> +               function = "gpio";
>> +               bias-pull-down;
>> +       };
>> +};
>> +
>>   &uart0 {
>>          status = "okay";
>>   };
>>
>> +&uart8 {
>> +       bluetooth {
>> +               compatible = "qcom,wcn3988-bt";
>> +               max-speed = <3200000>;
>> +       };
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> index 727809430fd1..95bd797d009d 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> @@ -16,11 +16,56 @@ / {
>>          aliases {
>>                  mmc0 = &sdhc_1;
>>                  serial0 = &uart0;
>> +               serial1 = &uart8;
>>          };
>>
>>          chosen {
>>                  stdout-path = "serial0:115200n8";
>>          };
>> +
>> +       vreg_wcn_3p3: regulator-wcn-3p3 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "wcn_3p3";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               regulator-always-on;
>> +       };
>> +
>> +       wcn3988-pmu {
>> +               compatible = "qcom,wcn3988-pmu";
>> +
>> +               pinctrl-0 = <&sw_ctrl_default>;
>> +               pinctrl-names = "default";
>> +
>> +               vddio-supply = <&pm8150_s4>;
>> +               vddxo-supply = <&pm8150_l12>;
>> +               vddrf-supply = <&pm8150_l8>;
>> +               vddch0-supply = <&vreg_wcn_3p3>;
>> +
>> +               swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
>> +
>> +               regulators {
>> +                       vreg_pmu_io: ldo0 {
>> +                               regulator-name = "vreg_pmu_io";
>> +                       };
>> +
>> +                       vreg_pmu_xo: ldo1 {
>> +                               regulator-name = "vreg_pmu_xo";
>> +                       };
>> +
>> +                       vreg_pmu_rf: ldo2 {
>> +                               regulator-name = "vreg_pmu_rf";
>> +                       };
>> +
>> +                       vreg_pmu_ch0: ldo3 {
>> +                               regulator-name = "vreg_pmu_ch0";
>> +                       };
>> +
>> +                       vreg_pmu_ch1: ldo4 {
>> +                               regulator-name = "vreg_pmu_ch1";
>> +                       };
>> +               };
>> +       };
>>   };
>>
>>   &remoteproc_cdsp {
>> @@ -57,3 +102,25 @@ &sdhc_1 {
>>
>>          status = "okay";
>>   };
>> +
>> +&uart8 {
>> +       status = "okay";
>> +
>> +       bluetooth {
>> +               vddio-supply = <&vreg_pmu_io>;
>> +               vddxo-supply = <&vreg_pmu_xo>;
>> +               vddrf-supply = <&vreg_pmu_rf>;
>> +               vddch0-supply = <&vreg_pmu_ch0>;
>> +       };
>> +};
>> +
>> +&wifi {
>> +       vdd-0.8-cx-mx-supply = <&pm8150_s4>;
>> +       vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +       vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +       vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +       qcom,calibration-variant = "Shikra_EVK";
>> +       firmware-name = "cq2390";
> Does the firmware differ from the one used on Agatti (QCM2290)?
Yes, WCN3950 vs WCN3980.

>
>
>> +
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index c1f25ce89bb1..6bac6ebac8da 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -2064,6 +2064,29 @@ apps_smmu: iommu@c600000 {
>>                                       <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
>>                  };
>>
>> +               wifi: wifi@c800000 {
>> +                       compatible = "qcom,wcn3990-wifi";
>> +                       reg = <0x0 0x0c800000 0x0 0x800000>;
>> +                       reg-names = "membase";
>> +                       memory-region = <&wlan_mem>;
>> +                       interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                       iommus = <&apps_smmu 0x1a0 0x1>;
>> +                       qcom,msa-fixed-perm;
>> +
>> +                       status = "disabled";
>> +               };
>> +
>>                  intc: interrupt-controller@f200000 {
>>                          compatible = "arm,gic-v3";
>>                          reg = <0x0 0xf200000 0x0 0x10000>,
>>
>> --
>> 2.34.1
>>
>>


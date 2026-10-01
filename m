Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E825B0B8
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790831584; cv=none; b=fLxtWzs56mUmiE0VO5jOx3JYsoHZ4AD2q4d+wrM3vH+1BV4OUyPaCT71+aFwSjD7yfsz9vzUASh6VQ0sEzXA1DhgQjLCgnRwl521mFdb+XIJcn1R0X2d1E4J+myo+bHJevnvci2i1I++1006tMf+exO2Tmb5s9RyxRxWVH7OW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790831584; c=relaxed/simple;
	bh=as55GXgMR8uuECbACcmh0qK69tBj2anDaOSWj7O1Cy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCcwKLwhD+aKnvQHDso1sOaj9RlthDM9VqBv58kqxgbAq2EapAcYI+7kTYyCo715iGV9gdlSeszcWo9QYF7IJX8gGuhcxwTrjImU+cQjiCU8GZQJT7mOMg1vJ8ZoZWrvjRksPeZj3rBhJv6ozinbIW8Rh2jxIx64HTYYUvTCPf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wzil82vb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffbrdltX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wzil82vb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffbrdltX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913fnh02466555
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU/xdj8u3yx4+bI7VmKan5ZKFN3BrrHHPNXHYBsF8p4=; b=Wzil82vb4K+V44/1
	sJPUwhh3Dgl6SPVYY3K0DaaypN6kSuMhIPF1yCPWiwT4QbXtcWYYq0H9jw66bm9H
	L1cHNy8LK2UCeJ7qlwNGR/nmfL91tR5/nc1bDank/W9yL7+CPXjjITx2xe6Xa9Bx
	3oacsBwLBLMM0gN7AZlJpubFI18RCA9EyE34kF8X4Ysoxy2DnHz/zHqY8tu6WHrx
	vMaKpzY8N2TuETY69vh74uy1HIQHOxveui5apX12Vpx+RiR9IqH5gguZPPZaK0j+
	zyXjSCGHyP5C6hDOhZZZpnLVGzDn7Jrh42UlAeuRM9oKpP5zsfhRCteRuOHYREPD
	pnu1Mg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tkf6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:13:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-886a2dcb9f2so569270b3a.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790831582; x=1791436382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QU/xdj8u3yx4+bI7VmKan5ZKFN3BrrHHPNXHYBsF8p4=;
        b=ffbrdltXCKb9xJsISzcxa4q7N1goGb8w0tN59GOqCZ0WXaJjx2vuKW5TCSpGonh61V
         dGkoV8vhI4UmySGT5S0OKgqybrNIbqGoVzPxjSiozJ9BXREGfN/Zz0h6OQBonOasQErT
         48JNF8pbnBBPxopN6LdftXIQ0V0O4IXH762QTyaBJGYFb2vT77fhzE038xVOyjZe33m2
         nnSW1GbUSze3N6QQyQikA3CulTUKFjagC+Qo09HETyublazSXXxdmGLuoZms5SStuYRM
         JmyIaXsV/9pxqXxvuvuRXPczKR4qSqb1ElrT5a86AaDknpo0CubbPgP8565IPjrDmIzS
         c/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790831582; x=1791436382;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QU/xdj8u3yx4+bI7VmKan5ZKFN3BrrHHPNXHYBsF8p4=;
        b=VxtyN8WoLxuU0J62D3dLv6j1fTs7LOhRI4818bbd8V5nf+e+zsxeprnUF6y7wGG9pS
         MOxCeWyPGJQeFbLK/TjI53BydXM4S+uaJs5Ds+4zS6pvlpfqKFZmxTkNKawjbcafH3DC
         qOCJl6y2A9tuOgt4kZVY+hPHPR8eJTvhAT0pYDqY35ol7yargoY538JPqHLzCorDGdcz
         Nr7XOZaFW1/AElLoBtcrjO16zkooKR7RSSCsOr1FOKpyahF7w179bpt2XPIATLkSOuLL
         JricUw8KAXtV0HBx6GLyCiD+3him81IhGe2nsLY5AjedB+IvcSeI3/Ypv8YEfQYCGUFB
         rOLg==
X-Forwarded-Encrypted: i=1; AKwUvByzT9EQ7Wrcw3NHP95NOTId98AZG0RjwZr3h/p6HNQK/+DdLetmXNz53OhHQcNbLUaoo/ZInh1oAjM/@vger.kernel.org
X-Gm-Message-State: AFuF++kjDfwyE4dv7ijo+ia7/ebL7N8UF54ObQ/KE1IBt+TEmLckXgHR
	RPAow1kce6qR13jQzBN5G+4d7ftzXO1v0JBeLSE7VuglKbzvnluBFtgNqB47J7XLhFeOfD34hHs
	6Ryrgl05Dl7Hk6ShfLGHITmSZTXL6YgjMhZYjJ5VZYv1iXlG5RsV0TRExtsmecXmb
X-Gm-Gg: AYBFou3+uDbfNBUgMrVWd4tBuqGAc7Sz2i8QCr/a9iaEAbYpI/ioeO3NrGxLinqvrxj
	8dJt0izodYyfm6YuDOTx+7kXWn39peNjH7r5ZD6wfjKZMelHZOybEFuxKdhmwDGVRpNHQ5sW1zm
	JZxcljIhagA53I2qLRf7RKcz5fq8qP7u7LXTYd5d9wnS+V+To53vpucSEH7GTGy1XXCXkMca0mN
	PmbCGiHw8xC538sO6tM9t/DRYZike5W4DiScPoZFwQzNEWGdQqRohKEOeaYI1dumAFuxafa9+LS
	toQNnl2grRhllBzSwHIniB5US3LE9jv/0I4m7m3VQKWaxt+dmUpypzH21xKDliphg04LYaTxMcq
	SwLcI0/PM7xvuRXU6CI6gzrYzh9TS
X-Received: by 2002:a05:6a00:410e:b0:869:f065:f499 with SMTP id d2e1a72fcca58-8874e05d337mr2769070b3a.25.1790831581797;
        Wed, 30 Sep 2026 22:13:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:410e:b0:869:f065:f499 with SMTP id d2e1a72fcca58-8874e05d337mr2769054b3a.25.1790831581308;
        Wed, 30 Sep 2026 22:13:01 -0700 (PDT)
Received: from [10.219.0.151] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818814b2bsm484461b3a.19.2026.09.30.22.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 22:13:00 -0700 (PDT)
Message-ID: <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:42:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com
References: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
 <ar3LTBFtF_qqw7U2@zenbook>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <ar3LTBFtF_qqw7U2@zenbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMCBTYWx0ZWRfX36+HYgZQfHZO
 YQGfI2ys7lVvtOVTT8YcVpJeN4q6aYv5mWFul6JFrtOExkEcMiEHgZsgWAZxS7JFegJZJpb1b6I
 AolSiJCdRH1JZfTqf+EaSwiYWyydUOs=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abdebde cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=8Bn8hASM-QoYp5_zaJkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: FIMZB_6v31G3cRrmh81lR7mpx0dal411
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMCBTYWx0ZWRfXwgd0VKkZsDvp
 GGQ2ZgnidJg75DRsByU8je4JZ4mSF1Og9sMkElNRB6z1nx79296JQfV8QvbekxCamMmaCj1Sp/O
 r29aj+R5dJZ2Yv3O0cpfE39Z3NkWmgJVVisBUItStXSbg+LbT50cNvoxjdsdsIefbD1/lD5zKpp
 6MUXRG4CGHTzsNuJr7nbGhr92YXwPzbrs/SQTxNB/hZZRJVwnNwbIZYOv/hhzKZsAM9weRLQiqb
 imn8gMrC/sx9weL9g75OsiXVBFFCyhkYcpf2W3VJgFCi//Pnb6ogpTnbCC33syhg0CA2nugWjyi
 5H08Ubbu2HFqpqz8493SWFi7iTkNPHqWmAFTFgX6VliqUa4J+qxfE1jxyLmuSIVGeqFLztqtlJW
 W6pFXKy1xSysZbVOGyN1klZPEoxr0SKP7ffQPJ5UlwfwD2KU2E4dIUKR1h+IW8n+w7lM2dif/gY
 +vqvXYMuzlQvsSR1JMg==
X-Proofpoint-GUID: FIMZB_6v31G3cRrmh81lR7mpx0dal411
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010020



On 10/1/2026 8:28 AM, Bjorn Andersson wrote:
> On Tue, Sep 29, 2026 at 03:31:29PM +0530, Yepuri Siddu wrote:
>> With RPMCC proxy vote removal, the WCN clock must be explicitly declared
>> so the wcn3988-pmu driver can vote for it during WCN power on/off.
>>
>> Place the clock in the wcn3988-pmu node since the PMU driver owns the
>> WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
>> RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
>> variant.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
> 
> Why do you have one problem description above and a different one below?
> 
> The information after "---" is not merged so the git history only
> contains the one above - and there's some interesting details in the
> description below. Perhaps this is the b4 "cover letter"?

Yes, the detailed description was in the b4 cover letter body which
gets placed below "---" in the email automatically and does not make
it into git history.

> Please revise the commit message above with some of these technical
> details.

Will fix in v3 by merging the technical details into the commit message.

Thanks,
Siddu
>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>> every clock, keeping them non-zero until a consumer takes over. On Shikra,
>> the BT WCN clock was surviving on these proxy votes. With proxy vote
>> removal on QCM2290 [1], the sleep vote is no longer held, which means the
>> WCN clock must be explicitly declared in DTS so the wcn3988-pmu driver
>> can manage it during power sequencing.
>>
>> The clock is added to the wcn3988-pmu node in Shikra DTS. CQM SOM uses
>> RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1, reflecting the WCN
>> clock assignments on each board variant.
>>
>> Validations:
>> - BT enable/disable verified on Shikra CQM, CQS and IQS EVK boards.
>> - Confirmed WCN clock voted on BT enable and released on BT disable.
>>
>> [1] https://lore.kernel.org/all/20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com/
>> ---
>> Changes in v2:
>> - Move clock property to wcn3988-pmu node instead of bluetooth node.
>> - Drop hci_qca driver changes; clock is managed by the PMU driver.
>> - Link to v1: https://patch.msgid.link/20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> index 8ac42ff625a0..48af2bb87cf3 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> @@ -45,6 +45,8 @@ wcn3988-pmu {
>>   		vddrf-supply = <&pm4125_l10>;
>>   		vddch0-supply = <&pm4125_l22>;
>>   
>> +		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
>> +
>>   		regulators {
>>   			vreg_pmu_io: ldo0 {
>>   				regulator-name = "vreg_pmu_io";
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
>> index 4ff97945274d..90aceaa6e1e3 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
>> @@ -52,6 +52,8 @@ wcn3988-pmu {
>>   		vddrf-supply = <&pm8150_l8>;
>>   		vddch0-supply = <&vreg_wcn_3p3>;
>>   
>> +		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
>> +
>>   		regulators {
>>   			vreg_pmu_io: ldo0 {
>>   				regulator-name = "vreg_pmu_io";
>>
>> ---
>> base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
>> change-id: 20260925-bt-wcn-clk-enable-9de068334aa1
>>
>> Best regards,
>> --
>> Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>


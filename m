Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B533DF00B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675439; cv=none; b=B9uWPvbgvNI/Nl/FlaQ1zBFCBQxuIllji8xs2f73dESQ+csMkuYNt4IGxQCXCIZ1vqeMmN0+hLrYyxS0f9cPqXMLYJf5oHvExoZYgcjpIbdLUU8rq30f5yvhOAsEDylMGCITIwywMiGmR2jn6H5elYLh9TTDK3L9DS+n5wthpW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675439; c=relaxed/simple;
	bh=YoVUDj0VmVAC2jmbVX6pbD6bZIFZCdW/Q0ywRUHMsJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvmak6wYAXyOJPmx6dNpVMoc1AOtqsv4qTa0ytbXm0RsIn4yebDqKC0lC+6B7bi1u36WG5AfxSsyibmAt+6vnksm0/DBCARJDOmI/V1ghOhV+FL4o32Np3aU3MwOJqiMANq6ovycysDIwPM0EzO9o0jJ+tnX3MxrQyRw4b2DGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh5zxbbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvPYxgXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh5zxbbw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvPYxgXH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dXQn4194213
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66CNho0zRKeJhcUQz19hKeeEOAaD98LvwCXadn+4LsM=; b=Uh5zxbbwI1VKccuM
	b93P9bjn0BjqDmDT9Pj3cSoLHYNPkJEjf8fhIM0AyitIMR7cDabw7zPz3djCM6cx
	9X6KO3cT2D9jFVoSzRCLBnXSOVHeed/YyMjobcCqR9nptteX79LsvnNXeJN6lNn5
	Crz+8J8Jl72+ByJR/ZD3qvPwAEinjoYmKdzMvAOWROWmtuGxyiH9gXA5Bw3fHl5b
	n9vMkMKe6MGRThvPsgKj5yUbsL6GqRZt+dOl9EfOiktolWLY5O6Bw8txwiyUtGcM
	mSZ4QpoulhBQE8emu0KfDJUI5HhQIoW1LK82sZUkEPcIZpGBS4nfQU1ms7mrmO6s
	93PCqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24uk5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:23:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eb5f54b6dso19192485a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783675435; x=1784280235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66CNho0zRKeJhcUQz19hKeeEOAaD98LvwCXadn+4LsM=;
        b=AvPYxgXHH7HIZre96xpaZPYA5DMHZCO9jvagOmyOv3TP5rUZKdjNC3qVHTjNFxiTzM
         3cmhWxxCF1O9zSINRJtfXPbu7vNpSIxrrkCpfO5qW/mXV8u3HwNbpLL012Fn8R+6EVNG
         VA7rSMcoiNuJlojTUzAkltJMNXEaFQwrXdA4cf+ZL4SIy/qfMJOy+Qc64foxsG7p8Scf
         H1fi9J7GQGmckaXJBmWTyGPQBX10eslUunArus0Lk7KC9sHh6rh41E2jFREBsXEwgiY/
         dgNbWleqFM8aMYxbBgQWQZpiNemo7W0zzNKO1ZlbxSfg2pTALF2ZIwOLXMBpACHiL7F5
         mxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675435; x=1784280235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66CNho0zRKeJhcUQz19hKeeEOAaD98LvwCXadn+4LsM=;
        b=cvGSdPaoadmBwSmUODQdZ3UGAMiNTbHyltLkGQkl5BboHz4tBDMD6SevILAc7PRapC
         i0DsRk+Qk5EGkyfLV6ZkBvKSoR24TYPAqbBWF3duzIVWn4aZ5iN+UnzOD5S9RHk7bPBM
         5JlL8cWBw+Q29INj5G2myGPMMQ69SshgP2uK+tA3KTnjwjlIjQCRcNV/34gSxb2gDdKt
         xHIY1vsjiuCiQuVL7nmIxnSa65F/bplaKa/HgNmXBOVakBZaVp6o8xOS1Y19/y8sVGjL
         NWHia8Ff5RD0guJBeRRs+rhablm4LeEIeK5/IsgQdOvU0S/Feyy2HAnPnKvVrWCyE6RS
         76LQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgdgznYM78Wuo5eu8wDcnKo4dtdhf/dDeF1+HObpShmCsYwPGmISPoz4cfKmK+8JjSNE74n1t4xUDW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx04h022FewuhIJ2Kp4YLofsqLtEm+wgpY35rGEnbchj7QP4yL1
	NamhkOIqLk3DUa381tropDAf1BEsdl3BvXa0PgwT5T2ctJLUPPN8BFGEchhFACp/eMw8fv61FN2
	aiLAdfFMD+KbzUvJdbRYR3MnZwU1lKNvYHwblMXjR52V4giebekmN5L1+aco9Ohax
X-Gm-Gg: AfdE7ck5eMOxqSCqHS3I4jG5mC9QvOpNR4uslv/PbdTWGTyHAXET5YXKrJHyfFAfbac
	JBv9KJEl+hayEB1XaEwiIKMwFitVwuoulKnld/RhW8USfu0SBivdN7dzWCwTDCBDZpE4v3THj7Q
	12Dv+y8BQNfzJmIXXjoaoDtVK253gRdtppxF/oWYA+fW1furAHGhDzxRqzails2vWLi70I76rjQ
	L7X7TIaWn8JAYY8Fksh4W9glyT95Vzn6F23x5yi13w77/kNAdI/IwFwt/+ZfsGLSXoywMTLfkef
	FsAC1gbqsVV3mf+xIAxIuPnnDctthsh3XXreVtymSvuuBSuMtTrUyVNHc4x7lXlL5OiaQkuum+G
	ANP7lZU53emu6S7MOTwVYRwKuNfcBmoD6kLM=
X-Received: by 2002:a05:620a:444a:b0:92e:72a4:f283 with SMTP id af79cd13be357-92ed7a3d1fdmr672201185a.8.1783675435393;
        Fri, 10 Jul 2026 02:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:92e:72a4:f283 with SMTP id af79cd13be357-92ed7a3d1fdmr672199285a.8.1783675434826;
        Fri, 10 Jul 2026 02:23:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c38c164asm436634766b.3.2026.07.10.02.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:23:53 -0700 (PDT)
Message-ID: <c75c88bc-3aba-44cb-a530-1d994bcd8954@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:23:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
 <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <fab734fd-adfe-45b6-a10f-a8a25f7affb1@oss.qualcomm.com>
 <CAMRc=MccvtBxJaddbX0PjjMpV+6iwZeYf2ebq953msbMeVN=Aw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MccvtBxJaddbX0PjjMpV+6iwZeYf2ebq953msbMeVN=Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G1eWzC0_soHx-kTaSscqc0kDRmKYSlRl
X-Proofpoint-ORIG-GUID: G1eWzC0_soHx-kTaSscqc0kDRmKYSlRl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX7ACA6WVR6sNi
 MMhVhCPmH9fmHLGQa8XuaHUmBOt2gzmaTUH1S1IZTvCFCyuSem7tCx+1Ql6s70MGGtzJjfKz4qK
 La4YTDiRpVZtKYYdxB5B0PR97YvkelM=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50ba2c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=0aS1VzSqY7UWMrxkMG8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX0M5a2RciJHZy
 bHtqdemN+yB9xX/xX2tdopr4/CO03tAnldX6jGOcbwS4TsRAKG17MNZOKFpms6cD0KaUzrEfO9c
 yL4lSlshHv/ddqDew4Xozxw3F2DpNS9krpsvbvwc2NoLWImT0U/9pkFl1jiGVXqpnxuZJlwHmNH
 7JN4HVyonju1I1pjDuDFz5BftCpWt2VByZEUYnkdXGW/tzdGsAWEjkFtD7NBpNzTv2guyPes8w9
 HTLdm+Jsk3OEXW9zc7AvQTgsfeWZxcnW3Vlu40rYeJJvYHQv7r1S9D8hP0jttW7IWB5ti0Juzzl
 Vtx9ZZ/mlLk67hAWd2LpsKs8mjH5V5hYHLcWm7O2bgPteLDomY9a4fB0C3T72/Hkx1EkPuf5erB
 sqPZRALHcSxdJhsmTNc1ScUt8JJi9o061l69oR6oKRbznW+NNOWQLJJdzBTaoIt8+kA/5muH/bp
 BRspTgsniN5d3U7zV2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100091

On 7/10/26 11:14 AM, Bartosz Golaszewski wrote:
> On Thu, 9 Jul 2026 20:40:04 +0200, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> said:
>> On 7/9/26 8:25 PM, George Moussalem wrote:
>>> On 7/9/26 22:17, Konrad Dybcio wrote:
>>>> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>>
>>>>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>>>>
>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>>>>  1 file changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>> index 6f8004a22a1f..8c252fa3ff5b 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>>>>  			reg = <0x01937000 0x21000>;
>>>>>  		};
>>>>>
>>>>> +		bluetooth: bluetooth@7000000 {
>>>>> +			compatible = "qcom,ipq5018-bt";
>>>>> +			reg = <0x07000000 0x58000>;
>>>>> +
>>>>> +			firmware-name = "qca/bt_fw_patch.mbn";
>>>>
>>>> Hm, rethinking this, it must have ipq5018 somewhere in the name
>>>
>>> I agree but all QCA BT firmware and rampatches are published in the
>>> /lib/firmware/qca directory, see:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/qca
>>
>> +Jeff, Bartosz?
>>
> 
> I'm not sure what the question is. This particular blob doesn't seem to exist
> anywhere in linux-firmware yet. I agree, ideally the platform name should be in
> the firmware name so let's upstream it to linux-firmware as such? Am I missing
> something?

That's what I'd like to happen - just wanted to make sure you're in the
loop, so that a platform-specific MBN doesn't end up with such a generic
name in case that was the plan.

Konrad

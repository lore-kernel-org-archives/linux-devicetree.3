Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A302839A818
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778345894; cv=none; b=KeSR/E/Z6qYDXD66q3rzjs6DLr9A5Jm6MQIvTy08V5o+kFEE8/er6EkiwBZUtFhQIsW1YBfgrMyCoFXmh7EP0Bh5LDrh6k2lmj+EKDxMhPblWvscpC8utZZo/riB+y4KEO8ehGxizep71treJxy39/RiQVzzLjqYEsBDGnZ7A1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778345894; c=relaxed/simple;
	bh=WNTc0OGO2a4taecvbw4qU+LYVnU1uXeaDf9Wyp0bAOE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cwhntIRP6kGDxikh7tNCYLmODkV2lSHHo9+Jv23uey2XtlBHh6NNL7Tt3qARhn6N2atmUH6HtZcDofPYd5su/9Quqdl5GcCzk7+zwQCWyheV8RmsEkgCdMAr0gh9jZjSMO0b1qATphNz+Jq8IIYzCR8mPOuTm4TUC0AiI3QcXjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGwKaC+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjCRj4LW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGwKaC+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjCRj4LW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6493k2lJ2819423
	for <devicetree@vger.kernel.org>; Sat, 9 May 2026 16:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=; b=GGwKaC+2k6E2YZ7J
	dtwr1lKS/PsHv+vQ7zpR4RDncYap1jlbTL50665hbiCqZa6LOTAU874d2yCAxRbv
	aSdWaqS+0GL4DihkQ/Uevpa4kpaehth/jG/LIUroyNfqjwvLQvBMYx6abr9PHeY/
	ZpEJJ+yZBvtyNDBoVRCK3NENvSPyYforSwWYwli7+6oUnMn+GSy0BWYb53ly+5Co
	VSK3o1NB0i0yISa/klcRo/Wzz6p9VRzwh6JLQAonXjGN9Bn3We87ss+OvDh5F9AV
	Hy+41KrfSocn4D3r9A+Gana0OBgJanSL8L4ND8wXO6YEVKt4KNqoWYKmfCmg+9Hc
	wrAP6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wa99adx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 09 May 2026 16:58:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so3946370a91.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778345890; x=1778950690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=;
        b=DjCRj4LW5npJeFk9nzdUUK1pwogvIaERNaIFOcbaBKC+K9sdYq8o0gyROtT4wk51Zf
         oGBXYHkFvI3JJNNjK9FABDsB0s9UGHbTk9tfYlEXkGcxwdq4CbCO+8eUuHI5NKamiGJy
         IGhgNWfTgaFnX75GYPbz8tObjLe5Dr2Y3qlVztEpTARGRKD9HXuOApmP3jzk8B6sUozK
         MC9ffdazICDXC3a2JW6WrPrvdel1ipqkdI5hJj/W4txv55AGUQlJsROAzA8N3SdBfk+n
         Zu7MI+TreGWXPyG+jnI4sypNEFPXMwXN6JzymQHAurW75dfVIbTnsK0JzAQDZ4tVmth3
         duuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778345890; x=1778950690;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=;
        b=YGKVjAeXL20NNe/VY1/GCNTZjwytHlwOQVmCg4lGzXIFfjYntXHi8I2UfjyS4XOgp6
         XGY9EZ6Pg2oK+Ue/RoAGy7jNo3u+bKsL0rotSHnopTup0WtizzLMYVp5kDk45ia91ItB
         W7vSMzftMySKsu/GYxeIIZK1G0MlQ6sVcCZstX484n8XDBBdGfCEJkwVf+pE+c4VBzbr
         KLRuxZLT1Zr20eGxGwRCBg857vZ8U7moePyqD6Er0KggskLgm+MO7Zq2ASb9WoHDKog8
         dFdEqFvfaBgFugtxt9b4HnchziK2SSQStLMDkVF1B7Svb+S+mleFYHP5lp7OIgx73w60
         Mrbg==
X-Forwarded-Encrypted: i=1; AFNElJ/gQci3+0KwUM1pp6AeurGi0uVRU14ZRF9jcUvdgdEAxqWPi7ynUq9IOe/+wO0abZi70As82iBAxGTD@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNqT8XZ+iqRH8OPFNN9w6ThqcAH8luDa4N+ZfsIyp2kp8GZ+q
	tY4jo6jgZbJi0oiLFcebRtMfnkd+njPqdjJRHPp6NqaCojRJ5lopGyMrqomSvSpDaIQdeC9m+NB
	xfyDAJGbsecyJu8XKQBD1X46KA3iOtEN4vKdLnTeHT4gK7PU+PIg+CG4ReO3j8OdQ
X-Gm-Gg: Acq92OGT9keMzaQJCian3WdcNd51hDaN90J0yddNFf5eILjCBu1f2hf5g42o9M1hWzJ
	95K720xJoy4JBmrrrMb0hLd6WhTx06Deme4mLEIFcCGd+aY8HmS1Tm9fKmDOijpOf1nFx1x/jk4
	+YyKBgmX5SJIvwJrdfmLvtvBFLm5rBomW85faJ3v9F8+52WI0BMTl15mggp91zN1SSeSLEG7QQ+
	sCY5YIQjqYtsDj1gJ8fdoDTfcwsrWr0oshz9Zm6MeldKB4iXYOAy2MsI0AU7l6pw3uLXxqx1jGR
	GqhDuAG3qKpyoeYFIeNgT9G+s18tgqLQj49+5VbqNrsqz1J3LP6E+7WsB9/yYhO38H2/sVB8gmV
	Yb7akJDCAy2YAnYYXZpLXb/K/S22Gv0S3sgVV8hnObHBnt1DysAM=
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr8171401a91.8.1778345890025;
        Sat, 09 May 2026 09:58:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr8171370a91.8.1778345889474;
        Sat, 09 May 2026 09:58:09 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35632sm58541735ad.53.2026.05.09.09.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 09:58:08 -0700 (PDT)
Message-ID: <34962003-c54c-a64a-2846-8f741fec5802@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:26:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
 <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
Content-Language: en-US
In-Reply-To: <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NCBTYWx0ZWRfX4ooOX2lX6Sec
 Gnf7xviUzuL4KxgzeIZko7z+vO1lno9MZezG8RgEBuKePb2Jw7IdmECnOCBAjOb7muZkL9cJky5
 b7/Ub0vpp1EjI/ZdlOEIWPkr0TT1D+I/spTeHbVOC9QQR8+allmAK/b3LwP8uLg2Oz8QburtLBP
 kl3YbveSXHfTMl5ofb59DRgsQEY8HTAD7wn7R068XsLcdVStNahcbo8XBGtktnk4pMOFqH6tWZw
 Xi3UhA37dnHc52FCIy8unsTxJft6dISL9XbtkVn99yWJFpayTRZTQ51R++S26kOzMLYIMfs7cI1
 Xh/oum41jz3/U7zmxe6rpG7yF9xGB5yFtRJgu6N3aao9EhmRGzhViaVdsV9o+U+Ldd6XKklZFo0
 u+udua9pDy/GbRtPdjIBn2lc8s8CdNOuLnr6FZIxZyg471sRwjUzcgtLNI5B+LLOAQKdXwQ1QHq
 rZGNRYLD6AMXSmnBH9A==
X-Authority-Analysis: v=2.4 cv=HO7z0Itv c=1 sm=1 tr=0 ts=69ff67a3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tcww-dwagKCKl4DpuMYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: qdOuMwPfs_m_dz4raUnvjdzx8c3dBGyR
X-Proofpoint-ORIG-GUID: qdOuMwPfs_m_dz4raUnvjdzx8c3dBGyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090184


On 5/9/2026 12:57 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
>> Add iris video codec to glymur SoC, which comes with significantly
>> different powering up sequence than previous platforms, thus different
>> clocks and resets.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..c47443174f97 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,glymur-iris";
>> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "iface1",
> I first wrote the comment regarding resets. But the clocks seem to have
> the same pattern. It's not just "iface1" clock. It's the clock for one
> of the cores. And there is another clock for another core. Please make
> that nicely named.

In v1, I used iface_ctrl to reflect the clock purpose, but received the
feedback [1] to align with the iface1 naming convention used on earlier
platforms.

[1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/

>> +				      "core_freerun",
>> +				      "vcodec0_core_freerun",
>> +				      "iface2",
>> +				      "vcodec1_core",
>> +				      "vcodec1_core_freerun";
>> +
>> +			dma-coherent;
>> +
>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "cpu-cfg",
>> +					     "video-mem";
>> +
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			iommus = <&apps_smmu 0x1940 0x0>,
>> +				 <&apps_smmu 0x1943 0x0>,
>> +				 <&apps_smmu 0x1944 0x0>,
>> +				 <&apps_smmu 0x19e0 0x0>;
>> +
>> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
>> +
>> +			memory-region = <&video_mem>;
>> +
>> +			operating-points-v2 = <&iris_opp_table>;
>> +
>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>> +					<&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>,
>> +					<&videocc VIDEO_CC_MVS1_GDSC>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mxc",
>> +					     "mmcx",
>> +					     "vcodec1";
>> +
>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
>> +			reset-names = "bus0",
>> +				      "bus1",
> The names of the resets suggest that there is single "common" reset and
> then one reset per each core.

Two resets for controller and two resets for each per vcodec core.

>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "bus2",
>> +				      "vcodec1_core";
> Are there two codecs? Or are there two cores? Your naming suggests the
> former case.

Two vcodec cores.

>> +
>> +			/*
>> +			 * IRIS firmware is signed by vendors, only
>> +			 * enable on boards where the proper signed firmware
>> +			 * is available.
>> +			 */
>> +			status = "disabled";
>> +
>> +			iris_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-240000000 {
>> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-338000000 {
>> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-366000000 {
>> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-444000000 {
>> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_nom>;
>> +				};
>> +
>> +				opp-533333334 {
>> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_turbo>;
>> +				};
>> +
>> +				opp-655000000 {
>> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
>> +					required-opps = <&rpmhpd_opp_nom>,
>> +							<&rpmhpd_opp_turbo_l1>;
>> +				};
>> +			};
>> +		};
>> +
>>  		mdss: display-subsystem@ae00000 {
>>  			compatible = "qcom,glymur-mdss";
>>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
>>
>> -- 
>> 2.34.1
>>

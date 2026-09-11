Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C2648B374
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134968; cv=none; b=QwQIGYMP+OP/iJogcYVcQdAzc0ERLGc8y09iN1bbK6FNIg/PM28YOOkpC8WxoNxLLaV2/9o5m1f6UJNAYMTzIsC85lY98lZBw7iBazm1nn9+/Nsk/SYF4397rXEc/dbrvhs6SYN6yNhC+ZiQq1Wsp/1h88B4fkunwkp5b0u3BIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134968; c=relaxed/simple;
	bh=cukm5itfAPwrG7E4wMUta7WQ4h+mlPDdBSjVU2+d3cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJdrzB9f73IjjfavLB+JJoL8nBIhXh2E2w4KgXNhiP/dddsDK4P38Rlq5aAxygrDnTFREsU0AYRTeXHX4S1kJ6krR4/dKnDKz9UZ6TjvpYQvwHQPLdCTf5F5VWNa1IWa6dCoYIXAqw4EdtCyNVpi9Q0eJm6WxGp1hznj/pXsc1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=li+lSFwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEee1ch/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="li+lSFwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEee1ch/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiaSM3473515
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WcoSTgZldw5sNhCNrDcKYu36cNESSbeb6L762/E+G7Q=; b=li+lSFwN7iDnJM4p
	69OmGvPCOg98yLgAITzFGJL0RwBruJgghuMXp/50TE/9ITOjxcX8/BoPoh5/AiUT
	BiPYHfKfmbrlBkiOcPpft+HYC1FmDoQhj1u65Ciqtxa4hnCBot7PYxf3nZdcmCvt
	zZJM+ABVaiQCq+WJTha5z5DR5ing0ODwhZqad4tPyq/cNgtl5PxWUfoIIqOitwun
	s8LSwIVDxNTgaxj09XxA772Zrgu+aqfY3sheGXI/tJRvaBIQ9mNR+yRNm9Hx4bGq
	sSEdvlxEHgE8sIBHlae7T9ocgWNp+sngZ0n4r5CD/NIY3fVxYkdUAvdhiKWJjM5e
	IccHfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729jxv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:56:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868db1b2c64so1504635b3a.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789134962; x=1789739762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcoSTgZldw5sNhCNrDcKYu36cNESSbeb6L762/E+G7Q=;
        b=AEee1ch/4t8jYXgpG8CQYiZIG6ZkPAmXXOenhi8n2omDJ4zJcOS2lDUJF2R4UqXgmS
         Jh3r5i7WivLOuMVOtcE5fcr7QS74OdiC3tCaPm31ycjZlN8TsuHyHK3Ld3PBw2RQlggl
         6GPvlv5pdD7ec89stT6HpPGZ/WF3Rzb89uMVGFtnTmQooDE64ih/FSEeeOLPXxPYqKDm
         fmDSU2X/HiQ03cIEr381+1K/tDxFdiL6K08Z/D6KVJGoxtammHFSun9IwioWK/OqOYZ6
         +YvLl72E4ZruvlvbTJqXUY/+nTrtiqAlmzp+R+2stzDwCM0Wr7oLMWKQ4pRdNgSfhfUC
         aPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134962; x=1789739762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcoSTgZldw5sNhCNrDcKYu36cNESSbeb6L762/E+G7Q=;
        b=b5kk0A5i703FXwFXmU9E840Er7shObiTBJl8LPta1mALIT0mssqnkUp5CeXMyI353i
         YsvFel3H5suobTgHyMfx5dIcZEnRoYbzyzLxg5VOouohMDn9jOrqx35PVfV3PcySEqQ9
         F10Rsm9DRTBajGSFapDeyBq8ipvp2IjdhcmJ4oyKO/1CUUL1gndT8tcDKpESBYNtES5m
         AWCP5b3QpVZrJ0uaYkubBtzoJCdxdqCoUpaoApY/Zuw3qkml6WzzalJLgunEQmrmubop
         lLJq4JbaE1n+e8OfdurH76Cpu7kH2k3zcjqPQkFVHDxewMZTo2d//r3trv7JFz8obnOH
         ezAw==
X-Forwarded-Encrypted: i=1; AKwUvBys0dJ2PLP3u4q94rzaF/GK7QqzPeAkbGp5Kgtd9gAH222nPYfa/1Nf1fJKA0ENWehZEkeVYrdK9d14@vger.kernel.org
X-Gm-Message-State: AFuF++l8bpWakA2y0UiKkq+wnB0DMTfQHohqT4bq0X+yG5Xun99SWVMP
	o2sTqcpKmXkraUAlmhvaEoD6jJpT1W3MQpU74pl8wvVZU8OsendwkcwNKHO738Zg4gm11E9xVIi
	RqSayVNzLVRShjUcvZUALU+iA+Kaj06COTVvh3kcJrDpZxHsTymELuzS7skK7o1rf
X-Gm-Gg: AYBFou2Ui37lgkDDhkFLBMSxU/4zlx+SM/kIGUiMbUl9luRKONgVlR8VKb1CfgNfTgW
	mzKW6BsLmVcvZ31qrI7Qv0WyQFoQAEnMUf83uXauFgJntQ2m3x2yqmd6D5wzBJdisZgx1d5bov8
	nfrQR4+DvJc0VIgALACLitkvfKt0VlElgtAhUd5DuVZBLYim6qYPzLy9e1+H4ci7TiIHLNlFTSJ
	3gXZf+9IvyNJ+QJ5SGgEw044iUyBYR9qpTCTg0/n+MyK1EjwgBBDGahRdj9v1JlSPSIe+grtXre
	jHnVbBOz3sVzgsqMDHPV2mmxM8BHSKGXmRO7lFayQ48HUVGgZoM+EOT3FXmP28XZarILOpVTI+F
	5rGFr0fYx+Lx+LyvJG2Nfsw9Q0Nx5
X-Received: by 2002:a05:6a00:12c6:b0:869:edb6:522f with SMTP id d2e1a72fcca58-86b304124f2mr6902767b3a.5.1789134961579;
        Fri, 11 Sep 2026 06:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c6:b0:869:edb6:522f with SMTP id d2e1a72fcca58-86b304124f2mr6902725b3a.5.1789134961164;
        Fri, 11 Sep 2026 06:56:01 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c49e9sm1212856b3a.17.2026.09.11.06.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:56:00 -0700 (PDT)
Message-ID: <0fa0637d-b93b-47c7-8359-6ee70c5251ca@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 19:25:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NCBTYWx0ZWRfX5CgQtEa9phGu
 TzJvRQjaVjGp1ZFxzKwduQ2f6hLLOx6FE4ZqKtoO3hP2ygCKLLbNKNpROzqucTmRtjHbtmidocm
 BPeyl7LZ9fRFc6/wDG9tP6CRMhNr3tw=
X-Proofpoint-GUID: E_K-bnqnqksRgGiyF-U7Q6HJxtlFC-o3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NCBTYWx0ZWRfX3WXLjHhx4Ynu
 ac+6Q7Gf2cHW3SniNX7UeJ75lhQ0VphS9C+acFh9GKoqcyv+DeYn16wj/mIJx/ldMTF+Z7NJDWm
 JoOsuH2y/UxhVi6nr7KEkVSsJDzOSgqKqhp8h3P0pfqcg6WpnNE8G6WehnPw3gu1Je5pZrG2/Jt
 cTmL884K83vujElNKDNeDwcS7FH59/ftJ6mnmCSXnWJRpEDiko99ayKlsUFUDUzAu8A5X/YPoGG
 uct/n1S0NazllyJ1F/idsYjPbsTh9T0wKy+PvAq8uf0My9nCUybBnbUWd+88JErkmYm6UEbbqx4
 9FYa9VeKw0O5agYITYjL0/ZgGZ+Q/5uXtlujMbXkZXkEa4aMZ6YEv29q4ED0CpIYawA5nhsLzig
 MQu1PhlSgzjEKtg96cjj2RpZXEMcH8mFVLAV2DLiE+OSaCuRaf5FhWNIfTwoDDjqwvyCHkBpi/7
 f5HrqeBns4fpShd5Dyw==
X-Proofpoint-ORIG-GUID: E_K-bnqnqksRgGiyF-U7Q6HJxtlFC-o3
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa40872 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6Jtp9WtjP-3LHkia-DoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110194


On 9/11/2026 6:06 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
> This patch is rebased on top of Shikra USB DT series [1] to avoid merge
> conflicts, and there is no functional dependency.
>
> [1]: https://lore.kernel.org/all/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com/
> ---
> Changes in v5:
> - Dropped the bindings and driver patches that are already merged.
> - Link to v4: https://lore.kernel.org/r/20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com
>
> Changes in v4:
> - Dropped "clk: qcom: common: Register reset controller only when resets are present" patch
>    - Sashiko AI review pointed a valid GDSC-only corner case issue with this
>      change, will address it in a separate patch.
>    - This patch is not needed for this series, after splitting AudioCoreCC
>      clocks and resets into different devices.
> - Added NULL check for device_get_match_data() in driver [Sashiko AI review]
> - Removed unnecessary <linux/mod_devicetable.h> include in driver [Uwe]
> - Collected the R-By tags received on v2.
> - Link to v3: https://lore.kernel.org/r/20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com
>
> Changes in v3:
> - Rebased on next-20260722, as the dependent RPMCC/GCC and Shikra base
>    DTS changes were merged.
> - Separated the audiocorecc and audiocore_csr bindings into separate schema
>    docs [Rob]
> - Moved the AudioCoreCSR schema to bindings/reset/, since it now only
>    describes a reset controller.
> - Updated audiocorecc DTS node to use status reserved [Konrad]
> - Kept audiocore_csr node globally enabled by default in DTS [Konrad]
> - Collected all the R-By received on v1.
> - Link to v2: https://lore.kernel.org/r/20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com
>
> Changes in v2:
> - Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
>    different register spaces. [Konrad]
> - Updated bindings and driver patches to handle the separate node
>    compatibles.
> - Updated resets in driver patch to handle HW_CTL bit.
> - Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
> Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Cc: Taniya Das <taniya.das@oss.qualcomm.com>
> Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
>   2 files changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 286ea46d0c36..079a1636cb6a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,10 @@ chosen {
>   	};
>   };
>   
> +&audiocorecc {
> +	status = "okay";
> +};
> +
>   &pm4125_hs_in {
>   	remote-endpoint = <&usb_1_dwc3_hs>;
>   };
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 1395c182a2b1..999b478e1640 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
>   #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
>   #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>   #include <dt-bindings/interconnect/qcom,icc.h>
>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
> @@ -3594,6 +3595,22 @@ cti@9900000 {
>   			label = "cti_apss_2";
>   		};
>   
> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible = "qcom,shikra-audiocorecc";
> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			status = "reserved"; /* Owned by Modem firmware */
> +		};
> +
> +		audiocore_csr: reset-controller@a0b4000 {
> +			compatible = "qcom,shikra-audiocore-csr";
> +			reg = <0x0 0x0a0b4000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
>   		remoteproc_cdsp: remoteproc@b300000 {
>   			compatible = "qcom,shikra-cdsp-pas";
>   			reg = <0x0 0x0b300000 0x0 0x100000>;
>
> ---
> base-commit: ae800ad8819a6d89308031288a6ab6789eb5d2d4
> change-id: 20260605-shikra-audiocorecc-85efef073474
>
> Best regards,
> --
> Imran Shaik <imran.shaik@oss.qualcomm.com>
>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>


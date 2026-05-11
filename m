Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3822F12A1
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467312; cv=none; b=FpK4G8dGl1pPQZtImdxkFk+Qmm4gcjoVhHGNkxuCm6gO5YPVsU3Z2tjXqqzDWCxYZIl9T26M8Kij8U/OhOd9eYGzdzs/C4Wa78XqSbI5jqVdEu/WGlcaoK4/KRl5BifZeUUUSnROLvwTonpaqqYuU9dxOBL+hOeH7peEzL5ctbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467312; c=relaxed/simple;
	bh=wtJs8ouGpD+raMzVMs0C6/YAsEI9+P+SIYwaGl8xsz8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iFpxI7TbE2LDKpF36t4zlrLbOVEWQw10qYp+AbiYlSw566jtk9QgGBczhTrHcFQMvbPETCyFHANg+opcdsOTvYmalPs99Nj3tpB57SfAwuacIPjjW9u3WME0G6ECjQwOP6bxc8iTDs+u5BljtCY56kl/tXzwqkhbw9QACd4QJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4UAqiyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITyu4q06; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4UAqiyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITyu4q06"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AJrKvk250813
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csTFQhCS27/TD55NnmDyE77bhxVaxEVxBVRrSVfa5Fc=; b=Y4UAqiyW06bE9Nuh
	yD+U5y8MhKA7x6q8OpGzR7A70I/chbJzeFaHq5W/FFDtQm8YNtmzoiNGTz83ALlF
	c1vDPtpIWYPb7rKrGN1s9IWEcmzrdsdFXgoG/ROfSE1Ahi+cYVssJFgcHrfDr3mv
	m8TyjRxbMWPyyfuUCb2mvLQbxTYKwBhtL6C/H+k3JQm4ncNfS8eb1yEQoR+WKXRu
	3N+to8kh3OpbZ0g4naxhC82rZOxrNKQUVbRUej1y/gweUsFio+UgRtafx2r4CvDR
	8UCxSiRpBB689UNie5Kp0j6xhOoITBqjRY1hYw7PhjnadlzCGuM5hr56JSWjYSvD
	Lc8Saw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvsm93j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:41:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8281d4cef8so364680a12.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778467309; x=1779072109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=csTFQhCS27/TD55NnmDyE77bhxVaxEVxBVRrSVfa5Fc=;
        b=ITyu4q06/hrggNhwaaEwD3+u2ECDBT0QhRR+yfNmLsrSCCn64sxEDbF0LdL/ya2sc8
         cIJvkiZI/Abl4ShHBJdmG9qdZnsS6D3x3DwIPTqpoqXhwxNBM9OO2L3MufvZvkbwOh91
         6pxLdPQckb6GO3amSNygw0YZIyX3aBudY+Io/HrNrRja4s0lEwPZ10UWJ1sJOqbGwJTX
         Q1nxvs6QSGCGDlPR3SKSNAyUXoURApfzlgaxR0ooXk514sQfVvNpgeSfHvLtWLJMl/Ao
         wB0jz1G+CheDvUL3gl8aTUm4sJKzAbshcXEADaSFYCQf78kZtXDSnPkmJIuLHWgUGZSq
         yD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778467309; x=1779072109;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csTFQhCS27/TD55NnmDyE77bhxVaxEVxBVRrSVfa5Fc=;
        b=Y9qiN2IbSsMn0tLKMdLyXnKVcPLfJK3j0yKPKFtGn5y/H9D4kEp4RlcuekwrPM1SIq
         uJpgWNEjTgxNvDPEaCcl8xZG66YHHMQBFfCfvzt/PFR1Pj2/0ePg6bd/ka+U7MrS/Mjm
         4BWdFZNSXJsb2knMU76q+WP9YnisCnOd7od1l4Le7qeeYNyif8TyVvhSQsRXtSxRaTwA
         0UvjUU8V1uaHSMNttjAH3q4Re0cciiZwoFpUM8m7TrFVsiEdv5uOg/U50iR0eBDCFKQK
         NwyQTuozqf1UPEL/TxOYmabvVMIqvXkwE5I8AqCjUy94rsJCRRxoME4yQtVsUIEXlUKx
         UWog==
X-Forwarded-Encrypted: i=1; AFNElJ+Ol+X+mU2nTJ7zK3Hw+XEdyLDYg9GjKJJ+e3t6i4XEfFjqLwz5XwK5vs1VPRk6tt6tIC+UdM0ViIA8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8c565kseb5cE1rahW1v9kYOrCcb14IuS8XmDb1Sw/AeyGLWu
	BNTrH+AfhxbKNXqHy4xgQFqsP43ngyMVB5AHdoKfwkyXhgWMBCpoFp+0Z6k1XDMYFpkTYj62q6Y
	G9VnPyelg10/iIPAJqatRWOsEt+rE132UBQAKOd6qLo0rj6Nxln68JOGxJn4t4NhG
X-Gm-Gg: Acq92OFJgixhqro9SU9CqlTL0nAj/+H7yLKCqGMLwHAqwnCkWlgqneHJ3NH5MKVzOFR
	g0rEFfVKktyn2Sfr0UP3Nxw1kKny4Cq+uX0jxeojUUQ6FzunTNq8N0IjGijfOzPzocYVGTQ9EMQ
	RompsX6A8mQI+Sf/DSe4O8a7WdweFyk2ELu6ZNVzuHyalQmCufB9RXwlNIUXUJvKLVeDQ/irN+n
	rb/VYyWE5pqbLpsb3uskHceaozIt2kBPk1Dp6QqLD1tcNEIuxwXe8/LA6ncgqF7MvwRLiFOJaTm
	Vb297GcoPHy5YO+kEUMrZDiSdvaHlvtc5vpEmuZ3nvvmH3w3GMpz6dDeODn5kaayypsclKhlpnq
	sHguMXGmZ8/dCV8r4dHZR2do89PXIocuFrmV4jHFRrR9tUqb324Hh
X-Received: by 2002:a05:6a00:c95:b0:82f:74dc:5f48 with SMTP id d2e1a72fcca58-83a5b2d34ffmr20957185b3a.2.1778467309323;
        Sun, 10 May 2026 19:41:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:c95:b0:82f:74dc:5f48 with SMTP id d2e1a72fcca58-83a5b2d34ffmr20957150b3a.2.1778467308715;
        Sun, 10 May 2026 19:41:48 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.195.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7ba9sm18671564b3a.35.2026.05.10.19.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:41:47 -0700 (PDT)
Message-ID: <06380d7c-e6d1-4245-9518-a1155011c68c@oss.qualcomm.com>
Date: Mon, 11 May 2026 08:11:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 4/5] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
 <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAyOCBTYWx0ZWRfXxMZvxaT0XMsd
 JvZhShE1tYH493jAX767+Ofl793xx3m9AnQMrTRp672gsNpnhIkejyG8aavyho239QiblZ25DUV
 KxbVx3OtMaRkZBBpx/k641BZSaWcV9xTj2KUyb7/z1+BlPn+mxdVcvQt8jKxc1o0AXmkdAZT/BF
 RX0IziP4TirsMki1EOTULb+lYIY6n+AELJ7aDpRf/keswvNiQLG/AsvrEi3Aod1tQdLyf9qwoiG
 n4fZUB8uqdBtcIgCK+e3oqdKEaN9CZRktXz+e58zSVza0ptWSVleF+bVXx+Ta79izT4pp+6xZhi
 RU6vZAcQZ7pWSrlfebhquzJ59wo9TpIsWHSTZqP6DzuwoLPmAidJ8Bfj1AQ+PxkmioLgZ4EzJ55
 MLLg9byzu4WssKFCluPO9NTBe2waRopbNFHIq8moY6LNySFSK1mvNehISpnpUIQ3f/X0ZJNO1Hj
 yEewsVxX7mlGVQ7gfHw==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=6a0141ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q0yBPzA-_2TLdE4bsmYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: NlDejNS6QmyWrx4LpmOHSmzz85czIbR3
X-Proofpoint-GUID: NlDejNS6QmyWrx4LpmOHSmzz85czIbR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110028


On 3/25/2026 9:23 AM, Sibi Sankar wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>
> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
> for proper sound support.
>
> Also add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 263 +++++++++++++++++++++++++++
>   1 file changed, 263 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e571710de40e..61a5f263f5ad 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -17,7 +17,9 @@
>   #include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>   #include <dt-bindings/spmi/spmi.h>
>   
>   #include "glymur-ipcc.h"
> @@ -3818,9 +3820,138 @@ compute-cb@8 {
>   						dma-coherent;
>   					};
>   				};
> +
> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu 0x1004 0x80>,

This SID mask should be 0x1001 0x80 instead. Current listed SID 
incorrectly overlaps
with the ADSP fastrpc node. Will fix this in the next re-spin.
-Sibi
> +
>   		lpass_ag_noc: interconnect@7e40000 {
>   			compatible = "qcom,glymur-lpass-ag-noc";
>   			reg = <0x0 0x07e40000 0x0 0xe080>;

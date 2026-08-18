Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F8C3C1D41
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043930; cv=none; b=GWZxOrcWJVyIJMOJDjhQ4O0VViOiV1g/xo30HD30BL1ngRXv75JwVtA8X9//e8ZRkcJzDWPNXVglH7yyrr/3xAymo8lGojjEkkb6GNVqVTMuvUEUXlzzBOYJIsGHQvVc8YyZS1PJPA8V0onmJKvcTbq11eqYVsvtxNZiPPWp9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043930; c=relaxed/simple;
	bh=RVtwFuhUJgUcHEDCgo3IekEMlPvs4oM/6xaTaNcKoV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Inxy1cgRncfuNRB6an0k9MTCTv9GUExbquOUKB/FlcFg2PvRxQM6lHHCx+K8qQykBo3GL1PlUs+X8AHEguMJGxhXqfo1MZEd8oxu6nXku6bB9Yaz0XV1USWunY0/8IcqlM7l7dFW5D16uBfIMmQh+fI1hcA/upwedtUSBHDMpb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/qXW6Iy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtAinJ1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/qXW6Iy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtAinJ1l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BOR9243225
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVsl8LA6QDxrYkwyUvOEgaTIiz3CrQGPLrxqITO8Sbk=; b=a/qXW6IyPmOjZlD9
	zPlkBesoLG5auMRYnUJbR143u1a+GJmV3i580T2Sgfz1Tv9M32Lu+qw5bAnC9cqI
	6qGxjKJB+Q0P0U9IZ/ETu8lPyDR3EYqxktyNGE+tf14ji/QeBVjc4fG30IuVJcZi
	eJxFpEDO8z8SUn3E+D5hqJvBHzQ9pmLIj8xc/r1dE/D+dYak+wBOT8VnL+MUCSaL
	CwZFJRdB3Vk60woIvN4J+v7ia3lhh8Ygsvk26xqk7tIZcMsOvwpk0GPP8OfDuN6J
	IJKfHbIujqEovEOH/CJM1q+7svNG78tQ72OJHMzEfYVvq8FoqDLoePMpiC4Dq2br
	783oPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hpk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:05:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so120773085a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043927; x=1787648727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVsl8LA6QDxrYkwyUvOEgaTIiz3CrQGPLrxqITO8Sbk=;
        b=ZtAinJ1lKQBb2aoU3LKb/YxJaig2LApYmfT2bpUbJRiMjAZ8z7Fry54MwQaSzrH29U
         enFZO4/YHwKXoiyS+9XAXJULNtKrwkcQBCQbTB6uGgUGo4v/ktrZxW3OaHa+WWhR08Nl
         KY7xti5ihUNxkHlpMIEa/iLZExk57kuYPeyBl11JB7vrjZDOjiT5O+OxnxGSd+ozkzex
         QW5J8yhYwN8AaJ7SxqUuPg7stpnP6u3Q1yIoW2eizadv/8RCj2UnxjqjJLf7hpf/l5FK
         KXcsz3W81Agj9ZVdBuBf6GMz17GDJvmltN8ZrGhLPGh91LtAbb/eKw3pYeajH1yUeyif
         sluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043927; x=1787648727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVsl8LA6QDxrYkwyUvOEgaTIiz3CrQGPLrxqITO8Sbk=;
        b=VvOUcDbK/QvTfEwUyFLmNuCWoEj7gNmM1BjbxMJhZIqj5TbaUOdw0B72kfot6SJJBH
         NyX0UhuAOPSuvEJ4dPICLdHOermfDCLxeUVj30ymz0S3JxMCdJ0vs8ZkM6iO2zdkRknS
         JPB8Xr1DjXC78uM9vnYFvNi/7E0NYDkdm+WHOKqYvjeulFLdm5V4/iQsPqcmzj1wISEk
         tr0U1gVuum1BG1zqkbH8Xk5t5zBLUtLJGYvWNUkTRggHWsSGe6fBm8XeBG0YEpuX1oUk
         H1ngm2A8pn5VnwOJL884ADWISPif2dqc6nlcuzfr2WiM3loNRlIiw0AwEMv5N6Lfp0qO
         +o7g==
X-Forwarded-Encrypted: i=1; AHgh+RrIT+Ewvkh5bObLAl8xebLiWv0kj8pEKi/bFcJxKAXGOlLkj9cgNW4j/yc3Mq9yrzxtGv+2m+l1qXAw@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVczxg2EzPhIR8d5lTB7aYpRZY0SRA/Bxid26UfKTdlikUgtq
	q7ZI/UkHZdX+Dwam58sjZHBIyR/QVKUgID9y41erz8Lr9PlMXIn+XcqaO0elpN0uhG/ur47hf7W
	Y2P7OOrJkOJUc8ty2vMLxcjczyBjyVJ8UABbYqY7+HS3DgaBtkH+T8TemI6tjLW/S
X-Gm-Gg: AR+sD131Q1H/b2xdLn9HjcZaYpgItKPCejO+1mg3AiSP0cyKIr5OoRK6SkPSYql2DJv
	m9yIYiJnIAeON4hVwoTQHCEVg7rc1nD3IsOVmvg0QvcvWrEA91lJNJwNUPPIpQof/47qHAcGJJl
	o+Fn1RbEASRIMhNetsMtk3c8BbGYhBndkfHvuuER1YGXHTXYvYwbzoJ1Hp3MSAEkhYvannzrTlU
	IG+jZ/derVm3T7wGuIzXgTjrjh0VKVgGpLEPK3t9o6jk6aJxV+xztyXtrqjn/HzFK0Zi8xPmRt/
	dbTmU0iyD0rUe6ue286/SwZDjQRS8nrS6zBgTiQffqsBVZTjYL3MKvQdoFK07FqSSlEeb7lzsA+
	ueHzDSDtIUpLk1DgBCp2XRuM0
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2230381185a.0.1787043927007;
        Tue, 18 Aug 2026 02:05:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2230376285a.0.1787043926484;
        Tue, 18 Aug 2026 02:05:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc9697sm126034166b.61.2026.08.18.02.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:05:25 -0700 (PDT)
Message-ID: <c938fd61-a01f-448f-8a9a-bee0b427806d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:05:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the USB3 controller
 and its PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-9-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-9-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX79lxv9J+wfDR
 2K7EEhNC0JA/HjKPfyMVb77zAdb8IzYk9hIrerR0RhWNNcpeITgrQlnKc/anTyIjOqojQdtNLKt
 rmZHf6F8dID1gwKKQ3ECnEsqklRckmV29ZfWS7DYwSpucHJcjaBdm9F2eOI+/lpZewfxaVkeDR3
 8BjBuedOdPypv1Pag0Z4Luq+WTWhzOtbtI2FLnTiHzaI0bk667xtHowpWLYmXMbI+xzQdWZH21t
 lJ+1HSssXN1+MgIcVkJsw9wqcQhC2F2rlX5u1oomsP+YLbTq2l4tS84vf4t8VP8TYP3ytbatkOW
 MLlh6OvFD0CpISn2KxgxTPHrZYDe+0cEZDBvojam6kVxdDz95OhR5PWfWvrpxk1P36pVTNrK1VM
 dDgwzP0HKdUSJeSmkaStQsLKF97za9+UROR0nqPv2U+tBCtTwDXQDia+eCEjz8FGsPp29KPj+kA
 lMh250JHEOHBLBkE2Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX0FBFsAXmC2p7
 6QaQ/Rpjl1CYzma3sJozqjLOcZLsOidZe/HCEYy09R1FgpmSoEwSf50EjWMnjYndOPOUleqMdID
 xncczOr3akNn0HeBcd6meOdTsvTOAAk=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a842057 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=lS1l__rWwDhSR1qZn34A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Yt4E6invKrBd_PlKO9tmI58AFpcrIeUC
X-Proofpoint-GUID: Yt4E6invKrBd_PlKO9tmI58AFpcrIeUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180066

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The primary USB port of MSM8974 - a Synopsys DWC3 behind the standard
> Qualcomm wrapper - is not described, so boards can only use the two
> ChipIdea controllers.

[...]

>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 47 ++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index 06c0af0aa317..bac3c8772e0a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -713,6 +713,53 @@ blsp2_i2c6: i2c@f9968000 {
>  			#size-cells = <0>;
>  		};
>  
> +		usb3: usb@f9200000 {
> +			compatible = "qcom,msm8974-dwc3", "qcom,snps-dwc3";
> +			reg = <0xf9200000 0xfc000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3", "pwr_event",
> +					  "hs_phy_irq";

1 a line (also in a couple cases below)

> +			clocks = <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
> +				 <&gcc GCC_USB30_MASTER_CLK>,
> +				 <&gcc GCC_USB30_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
> +			clock-names = "cfg_noc", "core", "sleep", "mock_utmi";
> +			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_MASTER_CLK>;
> +			assigned-clock-rates = <60000000>, <125000000>;
> +			resets = <&gcc GCC_USB_30_BCR>;
> +			phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;

We usually have 10x as many quirks here, I guess +Wesley may not remember
the suitable values at this point, but I think he mentioned there is a set
of "common defaults"

> +			status = "disabled";

\n before status, please
Needs power-domains + required-opps

> +		};
> +
> +		usb3_hs_phy: phy@f92f8800 {

I don't like re-claiming the memory space.. Should we make these PHYs the
subnodes of the qc glue?

Konrad

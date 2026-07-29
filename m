Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8B7480953
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328312; cv=none; b=SM1ck6NGfx8xYkstgSWEccCgX7j7avibOgPIMu6ZEz8e4tWTavOXRZCl0kaNCwiNFo+2s4NTBUhCLdsQa0EQHv8Sx/D9vQXV843wdspJyRNni34YkA+qKwbQDsfs296lGfRlssC2w4dvnIidqm9F/AGzYlCmH7dLk0EWSCJfN70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328312; c=relaxed/simple;
	bh=K7JENK6sa1LbpG3FYRwucrEeQvC/xIG5ldJRqbSaYOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PghhWwdqomVr4LH8EJsCm4dzpfVNvMDtFK2wS2vMIBGQWobBvXpeY1nhgCiIAkZ/amH4MENArq7JjlQXzfrMpqeqGaECHTrwuKfYxcnH936Bc/epFwXqbmgtk2RBi7W6WA6ZKF7+MbFBQ/KwjutHJ2IwqrpVAJHj6wvvQn7wqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oimkaaSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XB182N89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oimkaaSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XB182N89"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TCJxnc1977136
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxiDiTYlOyIpoH+2VCVs4iz6grC8x089+hk593hC4o0=; b=oimkaaSGYveBTVoV
	NF53THaowvNxWrC4+ahInrr7lPlHlaj2dt7cdHXh7yQsp1anuipsBiiZWGgZX1nE
	OzbVZWbolbrK9WZkD8MNuOBZO2Npe+0CFnB9aHJcI5np66pCARahSPetP6v1qmKy
	rG5YMf3XA+vKy9BD8ld89TYf2fuQ/tknyCnhWum5lbwhaYTmy9hl8JbCX26RPQLe
	jXCIPhHupJLakuDls2Oel/5ZvE63fRaO2S2bV+SiCnXTpcnM+y8zNtRYszmCX/3n
	8sgpZ1Vj96aQLGfc4dmc+1tWcjmIU2zLWP4UEImOefuNI86dSxG1WGs8/09K+Wgt
	cjEmBg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe981fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:31:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bfc23053f6so17098e0c.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328296; x=1785933096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxiDiTYlOyIpoH+2VCVs4iz6grC8x089+hk593hC4o0=;
        b=XB182N89nX7Og/BC4q2B0hPVdRolT4uX4owvsRA7TuQeDxmCucYuB+gGw/MMe51uZi
         hlEPyzKb/3JfnfgOQm76UFrwkvnNBLRcYhitrhBFiDcg+y8FRVe5zl3sLxLgukpTU/SF
         nGoD+NQlsBYVOvOAbgdugUnOVaBtAHdVx1yXOMjaZip04Qkk/ZOlU0K2EJiqWRHOOXSt
         FBkNeXsSbMRt93VEK2E41bVijTRwQtgkdhdmksH096l+ZcEzU0LHaG8unCYpM4OOCfvj
         qgKKyATy47NvSj7BtB74YaiOJMuMKwVp3o8H/g/32u9WdrXf5N93B1mr4Mu0kvE0BeHP
         LCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328296; x=1785933096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxiDiTYlOyIpoH+2VCVs4iz6grC8x089+hk593hC4o0=;
        b=aW7B+Kkl94U+ktpW/uaKcvPUhMQH45j2zxqKAqFFu0SRLeM5UJjS/dfd7XSNcKS/1y
         tm/aPrKeMWC9bzZ2OQLdevikYsHGONsDvK5dJ034Ss0Xbg76upioUhKThhjyVw7vuStr
         D5NiuVE6ZVn3Pi0CPCvmFQeOcod5ogcTJkYjRkTw1Yauv+O9QkFrFW4+UxJZvMP3tmf4
         /gXVZMYPoFzKNlkBqphKuTuEJkhE/eExBv0HCVH+DLxkGWdHE8duGETQ9jBLPbc24Dbe
         P1H//mopxYXkTFu23SIHmAjSQujXAwE2ATCuHC4WZM6Tf0EP+X5QOFOXNBCSvSvBifwc
         iPug==
X-Forwarded-Encrypted: i=1; AHgh+Ro/8NUnFAa+9a0ujur2VWz/gBpYzyqUI/BCA4ygL6d+BqVfpSRUslwVU00d5jQKs7KTiPIME0BcmzAU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DsmjuGydf3kyDv7I082xlQ+5nC0I/RZeI52dcNnJ1VwSLRAp
	x25rZWFPnWW5uqPtV/28rcT0CRL9tjwxrLooy2sNGufRk/p+g55w8z4HlubDtW1GVTUYoC9yX7x
	wPOWT+DV2EWIVG6/5pWmBGUqmwk01N+Nhf8VgizHRdAd05rAjqowVlOJVQEehzdrG
X-Gm-Gg: AR+sD113xYy6VY3bYpKC4UzK/PdSCwoXkQzxtVBNP20qNmcUCyiaZT0dVJTKGfflM6Z
	ni0dnzz2rskDs+a7HLNMS+Run3eMUgSn4eObZg1SETowCRFYFFqx2U6cI5rSewT4QoR+FQfGm/p
	EdcNnXsEIdMgT7LgPukzagyA7igHlomi3+4CJRNvQLBN6pvoZHp8+dvAEydBB3h7Pm9bVDxzFQV
	8mmsRmgYCsgfv3beStdXyiNANr8V66OdchgHvJUfB3zuae0uxefqhTpIVFji6/KOCLPfLoccE+L
	tkJVhvokd9BEPHrpMY/HJlP1wUANRWTZ9ZNJDtjzAvb0+1fU6Q2CQt4tqMWRXWtdES4xqrXcxyE
	7ZuN9OqDXyDeWchUt0W/jpaJA
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1358152137.3.1785328296368;
        Wed, 29 Jul 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1357686137.3.1785328290927;
        Wed, 29 Jul 2026 05:31:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cde9cbsm109495366b.16.2026.07.29.05.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:31:30 -0700 (PDT)
Message-ID: <794424df-4714-43a4-b4b8-e960998ad1f1@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:31:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
To: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-6-2d100f30e202@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-6-2d100f30e202@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfX/kU8G0v76gXp
 IiNLsN+ojGPkAKp41IRPcvi6UKJUkUH/7OIWq4sEsRCRKKAAl724WvoIS9MJyDVs4p0KvhdJUUx
 eKosVKa5v1CR9dDRTC+zUanQUBtUudXhGudJVJOl/WufOP4r7pZNzSHpZ5aObaOIHl8xtfIHUKL
 hx6Yyp3l4yFiOCGu5BWbuKmBEntq8ipRaglaM3uqO1vbmEx2tsY/Tu8V92XTM8Qmo2+zGmQSHbA
 1OeBS0LMpqrgI6tu0mm5cYdzy9068iETjKh3UR7QIT01B3e6mekJkMyB7ZmJuXNhFdsl3KKuluB
 XXOgDdH54qWA5qsjedXSFfBQLMdi3q8IAz7z3k4VXSOa81ZfDRS1ANLrtdB8gWeYx3OXlObDDcL
 UTCzSIAqGmnxdzGYbadXLGz28ho/pn3u0rE2kZnKn1R9d+zs9IHrRKS/D1q7xY3ZXnRiWJh8KJE
 WEqisU5FIRzXxXklrsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfX5B2aZe+WdR1y
 aKqYwvXIzcz1tYGtzEIYqih89XwW4oNkfp4dL2KGSLrcg0nMecUk7MOGAOhKxTKDJes2Qz000Jo
 QqIgTeMU9l8s5wWu9OvvNUo1/biifJA=
X-Proofpoint-ORIG-GUID: gMPnNvbRWP6xjawT40_f_-_mkpcfZYaD
X-Proofpoint-GUID: gMPnNvbRWP6xjawT40_f_-_mkpcfZYaD
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a69f2a9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=iMgkBSKgpprIcW5G8oEA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290104

On 7/27/26 5:45 PM, Rahul Samana wrote:
> The reworked RB3 Gen 2 Industrial mezzanine keeps the common Industrial
> mezzanine hardware description but routes QCC2072 Bluetooth over UART4
> instead of the default Bluetooth-over-USB path.
> 
> Build this variant by applying the common Industrial mezzanine overlay
> first, followed by the BT UART overlay. The overlay models the M.2 E-key
> connector graph endpoints for PCIe and UART, and disables the on-board
> WCN6750 PMU and UART7 path so the M.2 QCC2072 Bluetooth controller can be
> used instead.

So is the onboard module disabled? Can we not just use two in parallel?

[...]

> +&pcie0_m2_e {
> +	port {
> +		pcie0_m2_e_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
> +	};
> +};
> +
> +&uart4 {
> +	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
> +		    <&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;
> +
> +	status = "okay";
> +
> +	port {
> +		uart4_m2_e_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
> +	};

Let's define both PCIe and UART endpoint sin the SoC DTSI. And don't
mention "m2" in their labels.

Just pcie0_port0_ep and uart4_ep respectively.

Konrad

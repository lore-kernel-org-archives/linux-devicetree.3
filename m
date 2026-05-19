Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7C33F5BE
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189922; cv=none; b=UHHREEXAszVqjbPp3BCsFEb1Ffn/c7heMd8dzG8BHnfkFCYAIU1SnqA5CA7FhLJT+jIXrUVDeIE7+rQxDZJNhU0jMRplMeH8usY+89BnLAKgsbQ8QNnpFMeRdRhoSrXKTt/xKq2Lrs5El+LlDoQazrKBIfSLF2zlpuwI2N9sjd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189922; c=relaxed/simple;
	bh=DdlYAH7YYC/uFEG6PShPTwU3kyoumx8Dw/obSoed2pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ik5BphmCwVC9avZ9ASGunOKV2vWCraxF/aP8YP1XZe8XUq4IQRpmHoVIQAIq0psmsGPo3zJCtjmwjexHJSm5ZEpEFBguqjylJHxeyjKiYFuIs249whiwNc5ZMTHGlRf/LYb+A4Sg0OwJS+uS10SuaEmU5dr4hUIHys2nlU+mGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIfAg4ZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZFffMB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIfAg4ZC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZFffMB/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vEq91055023
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=; b=QIfAg4ZCaWfbcV68
	Y89gr/Y80ttsyMuKvNpnNp0gB5vV+wla1PSODH/FEwCHlLUpPslTMBYmbgL7F3Vi
	c9y7uhnQN6jeUONiABBP8H0Ip9w6MrKirrCY0LKMkjnuO0JjKcusvjcnZFQNfY2M
	x+zaEQDitQTahSCzeVoSteZeQbHj1/CTRTmXLvJW6ui8y7mkpZbrv0xLPACS5CEl
	2xG6cK0/JshtSTBCPjGMwBa+rTVep3HTkFsHUb/sug5QiV5QJgbKRpRajYdtwQjw
	5nu0nsaUdxBY62ymVH6Uxmm1TxNri8SQAmrNNluihOlIdsjTy4/mZH+dn6tDpRtX
	5cUHmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nparama-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:25:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d840206c3so11814221cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189920; x=1779794720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=;
        b=SZFffMB/7m8SKieBZaHqeZ4wn4rxldBOX76LODD6DV6HbFFa92DEzO8X+jqnnI/DRu
         hQazO4T5VKXjeG/OuLRDAh3MBvU6HMZwYPsChBX4gIuukO84ZJYs5fv+I503pDe8Pa88
         KsZHNvJSsHtD3dUwc4mf9LoAYRJP8EoabXDxBuDf0ZYjhHdjMlXX67HeKcpB+rPQZ2gG
         vcFNyF/QZ9zRK4xzfJaQY88PZAzFl9lWx/qzyBSiWbUVUNXKjb8/aR7g/uXRKZLyT5sH
         a234gMMQEuBtZb2cmAMJnprcdCu4YeEvGp2VqbGZS/WXcoIEYbwdgQYmHEOQtQJfBsXR
         Y8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189920; x=1779794720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=;
        b=DnDbvFPSfOubMJeADCnZ6nZcBi27RQOGo0NiAoKbNVgz2fZJF1VSl0BxfV20y7nywF
         b1GCPki6yq225pFH0otqvslQKz4RMKFIUM/tfXU+AoliOe+RcuErGf7wR/1p1FatBRAV
         aNmlK81CcpHoqI+8sc9U+hqjmEaPUhNvaeCLBuyGbXtt7Os7tYT9Sl50h+gpxjfSGEQJ
         66xodkIO2M1ZcFex/UzhumpqJZnnf3QiGM8eK782Lja6vaZmj6/DR0xtMscqn2JjOJth
         Pbn9EN09hC/HLJCi3y6X1/aS6NpSj+oB3I9Ydx/XJu/XeQgYJwIuqpciUcPdsFNURXQB
         IbgA==
X-Forwarded-Encrypted: i=1; AFNElJ/GBhBp2Uyj70dELb3MMZnYABuWwHQiThnqlQ5oQA9JQeiiMCGuLhx0R1jVbtIRokv+C/t7vcYJ2uW1@vger.kernel.org
X-Gm-Message-State: AOJu0YyXczp3R8GQ3X3XezNRbotA1g/aaZ1WRbgu4toClt2O1TsBdNpX
	DgNpOwNjVQKNEjfstdqGA2+wsbnoFtgC/6csE8RCc8zCWXY70DO1kU6I/MGNcwNoP6uFgeoXZEf
	9g8Hqkny/+PGzP+xkT1J0HHooPPVPF3iIOLQlua+UF29Q+IZ8p8ux1SSGF8IXhrj3
X-Gm-Gg: Acq92OHe9Ow8LoCOV0CjN0pFDqf5oz8PKx5m6VPMozDUY9q2N6Ss/Inn5NxttiYUV+b
	bDfbcpfe08jlrogzS9H1r2gTHiupxSD8J+6l617Nz75wX8sgGXSICUDwfwUAG4aXVAo6oZhT7iE
	2WNRrho0lRZ01YOGHsMdz5XvRPsOPj3+9oz05fvIfwcu8pvtVCRtnpn9zahh3FQZISNXP+NXibA
	W9m2bVP5K/S5MGYRQlfgcdLkzT74Ix4TVfRAp+mLTrlYWnAdNZirS92fXgMoHvZtY2IAVAYZfhx
	RKnax0HjiD9Bzy2VtEwzLO+ounHTqCoOqDd6ARzoZHu3r8pyXSRb2ggHygbyOHKptmYnX7KkXC8
	+WlP2ICao/ZZkdkHvydvMX1FHYgh52NPdSLJSInzNkxMQjkTKwjTFqWu+ZQurvIIWao8Yzu0Yxw
	L3078=
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197475291cf.8.1779189919914;
        Tue, 19 May 2026 04:25:19 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197474941cf.8.1779189919482;
        Tue, 19 May 2026 04:25:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm687291866b.43.2026.05.19.04.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:25:18 -0700 (PDT)
Message-ID: <dd74004a-cf60-47be-9799-8b658830af8f@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:25:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX7JkcaSad7fR0
 xUGQnYK4vWPZt6CDk0otJZ2MrNDqhpBTZ6340MNf9Mp2CwxQ7dSHz+nCEVQ0+XpXKyDfW+swvnB
 Hc3jZlSymA7zMLDHsstYTxUk/AB18VwDk0Kb2dZE28l+hkiLwV1G8tIJj7nLWmuWU4KThERuWQK
 +B3dzGZ8kDo1kCE/nPxhBUFuFEhn/DGXn0NZ25O616w4A3T2+yBh6Ei020BVmDCIyToCpZb3u6b
 sFDkvq9F68z0hnh4d4THspZ+iho5ISR5ptkWJXYPpJGYgChPZuwiMinKN5o2Oq3mDTEPfn6fys6
 MBdkfE+8aDKwC25Ms960OhG+XQc/G21tXqLIwzpBHqCPoENeDBlLgAxXbrP8eFnvJyBy4Te1xq3
 4IUCga8mQQdPEXATwd/bqluLTqQNpPrmZSJd7bqC8HlPBfVEMXG2/q7MEb2zvaqONJgkqn29v3I
 fEvpAxMYfQCL5iSNbuQ==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c48a0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K9uqyr9RctTKKMavoioA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: M45bVZvlNymTRNb28Zdzo6HxXMb9zwYp
X-Proofpoint-ORIG-GUID: M45bVZvlNymTRNb28Zdzo6HxXMb9zwYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Current way of specifying VBUS supply (via the device's vdd-vbus-supply
> property) is not ideal. In the end, VBUS is supplied to the USB-C
> connector rather than the Type-C block in the PMIC. Follow the standard
> way of specifying it (via the connector node) and fallback to the old
> property if there is no vbus-supply in the connector node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 8051eaa46991..429bd42a0e62 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> @@ -704,6 +705,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct pmic_typec_port_irq_data *irq_data;
>  	struct pmic_typec_port *pmic_typec_port;
> +	struct fwnode_handle *connector;
>  	int i, ret, irq;
>  
>  	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
> @@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  
>  	mutex_init(&pmic_typec_port->vbus_lock);
>  
> -	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
> +	connector = device_get_named_child_node(dev, "connector");
> +	if (!connector)
> +		return -EINVAL;
> +
> +	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
> +								   to_of_node(connector),
> +								   "vbus");
> +	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
> +		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");

One could decipher this by reading the code, but please leave a comment
hinting why this is a thing

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

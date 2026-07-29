Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0929448CF2
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321916; cv=none; b=aMANLhqUHrNPG4xZqiPAPLLhlPq5sqhA67rAuy6mzK6Ts1G6Cl7fxNjVs9kNlRzfU8Q6mNSMPGjbjRPWnR3JcaUUFakwX13zBS7J62HjQ5pMQQEQO6Q65hoh8kwTZgSH87nnoFG7dtZ80JdHf5QYI1TaztRCZhn+kes2YtfZaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321916; c=relaxed/simple;
	bh=uY/V7SXitW7NqiyUcidG7uPzvRLMUGfgLk6jiSJvDM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5R/O24DPlPGzDGk5ZtrkYReq49XNMZiSmIFrkW59vxR0LF98J1p/lBB2BW4+cH1LbNOi7gTorO4wG0VYRZg2fpSkgubqU89u/T88r3d24c+O/tSkZ2pvL80QDsB6p0D9ge/XXv8SxIJ/6h3jjqzJ27I/YF/HTH3ewqMKjgXzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eE5VJhRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aq3PvVnl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eE5VJhRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aq3PvVnl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fCWw1390275
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdIOpVMisBlsRPUZFhmWrSDH9SI6cuR7B5qB+ZnLerA=; b=eE5VJhRxb2utr5ab
	y1JqY/2M6OWCcwpvkZ/jh185Cer8diemMJZz6pQs7iipHN62ux9zpdfiAnfVCOUc
	4CUUoUd2xjvBK58zHZ5sGDgeFj4sUUZAr8jFK2eC3ZAWpk7U1h5HpUR+oRkFjNQe
	9barrI1OC63yScNDCYH7SGb9Y+CWTYvl/ZNRiKGeoIf5ZD9/VTUzBMqDpcfd2lbB
	UsSHQfMT8Q5tv0azM/cAtEiNVq09lhiRidmVrYhwo1kt5HZUhFlvLYR6pn6+pDqN
	Bxqym29faxnPAK/ndaV+aRldqYKKKn5Itz2IbAmiG/fTKeP0cqlOsmullXqn8FUk
	UTd0qQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmxs7rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:45:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so1755986d6.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785321909; x=1785926709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdIOpVMisBlsRPUZFhmWrSDH9SI6cuR7B5qB+ZnLerA=;
        b=Aq3PvVnloTkYsCg9Po89EGRgcdmp01BWDNm90HKSb18A0XqzNuX8Kp5q42fSH5M3NC
         85OFWi+9aWKGrF0rNMXzDTgiKjtn5ycqzaqfy462WyfXKP91olfeie5USKFZQV9rvXOI
         AKh3PYkSoM5UV0t/Lda6gBP+1+pRzJAM4iCryeRNPsgs9pMdtrVBNtNuaeBeoVX/txBi
         M8QhtzKUXXYLPWxYC/qdqJ+S8R5hCAeO8zUCT0MKm79yz37nO1CQn3qIJ4JPFnfgKyd2
         ijlwcWQC2NfGWKTtm6dV/pCwmvDVtVOxXYPktZfo3rGQkOFg3cLUMS/C8pySM4I2EJ4r
         AMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785321909; x=1785926709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdIOpVMisBlsRPUZFhmWrSDH9SI6cuR7B5qB+ZnLerA=;
        b=l3wowyQmvLZVBu2oXB+Yn0Pp7PczDN7pNA61vGXxpoV6cW9YHWkTX/VhIG3Q1DbRY1
         0jBDn9BhmzJvWcTVmWVVxoD2UE2CvlVl6lzcScC/52nnSHCQ7yer98OhlpOqnpEpj8vC
         lEOX9K9YidiI9qdT5VnhPO383Kv6Kt1OkxOaUYapGGBl7SJNFxyHqXYA+EDuPUKSe5QK
         YJNcg98d5N/mgJrzHS4aZCt75Peem1VqoCVqCVyAOV7QmkE20LzZ2IgyxI22QqglXwAJ
         hYSUFXHAEQT351U1/AKCbNm7bjGBKkJfWYJf64VB3Vi556vfmWi5qhkgxGTecoRtmWFW
         ZdQg==
X-Forwarded-Encrypted: i=1; AHgh+RqQc7Mfm74lAWQQMGKtRSBVL5X7U61A5qWBpaT9JKb0y2Km98madEjBCvIl8O8Gyne8cNY7w9dg+xd+@vger.kernel.org
X-Gm-Message-State: AOJu0YwyaATqhEC9iVM/fygItNjOXWjbPjTTZRm8rbpDH2pBtUUVNBY1
	N9KizQML78RZKjzP0HetV//hw9YxM3ButturrB7IUeG8NA3E6gzzHnqR84AtlT8kKN0rBxBHd45
	fkIcGP0w++x2P0guyrdjJVAe5X/7WazHal6EXXlk9BGNz1ivI2lcFIczXya24aPw7
X-Gm-Gg: AR+sD12ejism2swQS9e0WKUOhe96z+fcw9y4wxlPB31p/MQtUTCtHwFW2tWCJIgl+24
	lgwoZcY6R3YFKwjw+gE/p1qWj2GSytHakFhv5F+wg3rbF0QnCuVoxOEr/k3chxUkS40JLOCFaAo
	n/LhkT+XBDlaDkkI/ONPHGS1iKOWgiNhRX5tNnzQG/ax4oeqmhLR6bKORZCs5kdZc5AhltxiLBw
	0FpZktNtn3EF8YxQ931Ec5UhOCsPg8Ln+zOi8z5qGeH2jIK0NBW9nKP8g8z3a50UCU1zdAKugww
	sW8GKNvyacnLohC9qQs+AZOQJFZh5yDMF+q19yUFsNSroYalbrSvJY41T/xmMsx4SJ4BsYNcgP/
	o521gAPFEgZ/7CETsi5XRx+8E
X-Received: by 2002:ad4:5c69:0:b0:8fe:1f54:95d6 with SMTP id 6a1803df08f44-90816f4f49emr60077176d6.0.1785321909109;
        Wed, 29 Jul 2026 03:45:09 -0700 (PDT)
X-Received: by 2002:ad4:5c69:0:b0:8fe:1f54:95d6 with SMTP id 6a1803df08f44-90816f4f49emr60076446d6.0.1785321908693;
        Wed, 29 Jul 2026 03:45:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4de5bsm97275466b.29.2026.07.29.03.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:45:07 -0700 (PDT)
Message-ID: <805bbf27-450a-44e6-ac70-91b594be6656@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:45:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
 <20260729-hamoa-m2-dts-v2-v3-3-4d7ef9274575@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-3-4d7ef9274575@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OCBTYWx0ZWRfX+1ob0p7BNaSj
 hEjwgXw3JnU9VxzR3LvagCZkF7mtjTV6HC6cb3HVA9uZOYpQXYW/jpSJ42Ap9hi8sE7yJoCJprC
 aSauy2nA/bqd+XpYVpYJWXsTeXy+VXS1qgpdfLcS0e0kedTU+Y/jTlyvSxkCqsurDp3MQayioML
 Gl+gqV5uBAbONeonLBt3ZbWKdDlskcxRmXXr+5HPLZqINhPsjtMlHjyVj9z8TQWJfPaxgdIKb2S
 GjEVSOX0Crf/d4Amyul83ioeONQSKCEZQ2+CVCIYH77ZZwX90eXIZVi+ZqaFtvTeznlFB6aI8SZ
 K9Np8P4qz4FNYvavyzZ2gVSGRQ3VnidGszlGKT69G/Cd5a+0swH919LHXcD9TTy2QX47TUvuHdG
 f1YnBPwbApIWXyRPivjRvojOD2v/wV4fhS+mfRv+wWRkJj/nHk+kffUPcMKP4XyFXKa7PSHLPNz
 CEmMhKc1MssSCb+S1vg==
X-Proofpoint-ORIG-GUID: lHB6XYWmF6U3a33DrWMOYpXZmv88slQW
X-Proofpoint-GUID: lHB6XYWmF6U3a33DrWMOYpXZmv88slQW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OCBTYWx0ZWRfXzN1siy21Kjpn
 Zn+th455fzzPRMHoOGcwij9MOHa2hiNrldSQj0AdS1eoNrh7LdPZahrXNNd5b+EL+a8CYk33erz
 ZEX3WWq4n4hnVZzqxAiM2lxVzmWwfMA=
X-Authority-Analysis: v=2.4 cv=fLIJG5ae c=1 sm=1 tr=0 ts=6a69d9b5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6WoBsH-PcZNXEBUzj7sA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290088

On 7/29/26 12:27 PM, Wei Deng wrote:
> The Hamoa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
> connectivity cards exposing Wi-Fi over PCIe and Bluetooth over either
> UART or USB, depending on the card variant.
> 
> Describe the connector node with:
> - port@0: PCIe for Wi-Fi, linked to pcie4_port0
> - port@2: USB for Bluetooth (USB variants), linked to usb_2 port@1
> - port@3: UART for Bluetooth (UART variants), linked to uart14
> 
> This allows the pwrseq-pcie-m2 driver to manage card power and
> dynamically create the UART serdev for UART BT variants, while USB
> BT variants are enumerated via the USB hub pwrseq path.
> 
> Remove the chip-specific wcn7850-pmu node, the static bluetooth
> serdev under uart14, and the wifi@0 PCI child node, as the M.2
> connector approach replaces WCN7850-specific power sequencing with
> a chip-agnostic model.
> 
> Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
> fixed regulators whose only consumers were the wcn7850-pmu node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

> @@ -538,6 +512,55 @@ vreg_wwan: regulator-wwan {
>  		regulator-boot-on;
>  	};
>  
> +	wifi-bt-connector {

[...]

This node is out of sorting order now

>  	sound {
>  		compatible = "qcom,x1e80100-sndcard";
>  		model = "X1E80100-EVK";
> @@ -677,66 +700,9 @@ usb_1_ss0_sbu_mux: endpoint {
>  		};
>  	};

Konrad

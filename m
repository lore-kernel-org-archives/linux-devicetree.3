Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114942F7EE6
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480846; cv=none; b=lPWuK0sCjAkm8d1xSrijZ/LmaIIOV1HWY8Cg2oXFU/b5eBRN3saNC9+GXSyn1XH8hhBsbysHdVyTXoWsm5o1/wg0X7EMzvy2nk5Iv7q06QGFv1nwGR7/P+Eh2aeiw/zAb2xkokAjsC0bqcOtRE66x+PxhN2bZJKxZjR8q8DZMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480846; c=relaxed/simple;
	bh=X96EtKQGRkx+GYgOWXgKTsQyCo1hlz/5BogBnNd5Okc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeBAQQBDJ67wP3uFnXYzwpFhfEHO6jmAirlns5gqP/xRtMJN5EXWtr7vmM803BdytOhqJ3Tia/Cmv4PeZqHjUaAhBOo/HMzf5U0WK8ThZGSKglXeMo/G6wu1RhmZ2XfxC1zUnx9cJQPlYFnbjTxSeW447j9HDuQ6FMc7SnSxs3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3yeNwWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXakCY6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3yeNwWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXakCY6N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5HRnD3235722
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8r3nwsUV7dCZxExVXM2EEkbrRp98mWiLhmFsQB5NK4=; b=E3yeNwWsxku+9GAl
	R0JtsbAyXzjwygvQHEnG0ZBGKHDLqgfWSA1gE0prS1AUGtVVoA2CZVxzoeohqhXg
	0aDSvP5g6kFJTG0ed3U/Q9uKLbzr88R8RANTNVz+qOM6VkzfdROnqz1JNCYFIRzD
	YBsOMFaa7LqueSAN0fLZoN+12gnWBCtIDEdFxfiKlpoGZljQAOIBxb5aSfGLERoh
	vwveEzaRu4Xt0T54nVZs4kRK/rR460u5Hwbr30ku3f2fuaY81PzLTjt8dUd77gCI
	QrA1HwY3+UF909oGPG/nApXK+7jlVljcG0ynykbPloZwmVgAZb33aRrVbiSwJrC4
	AssJgg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frne50b8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:54:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc5faecf01so12433055ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480842; x=1786085642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8r3nwsUV7dCZxExVXM2EEkbrRp98mWiLhmFsQB5NK4=;
        b=WXakCY6Ndn3I3n+Bu7gaQJJyOKW3DlBdguA7TKMgDIHJyDSM1hzyVrNrhh4INyFkmE
         /d8N/pBFEluB22v2Rxq+MgC0D06oHvq4ZoAY0tKbYf5opntKKDMb6RlSC6fmtE9ns1aU
         m8WLsZt32QAEQJn4Z55Da0FyuMXNtT72YiZF7sIkZ6DQjNmevS0Ax8+qqh8PDpl2C4k9
         x5yYDDY20lW8mqNhEOi0faj8BEHsDOco0dMA7rChdR1+wNvkaU1iR41QXzfVquFKOIEw
         GF14ljySqkDjUdP5XPjT4jH5bFlUiFzhs1Y87sMPqOW2xhAhKXVKWev7ejUx1rgHAt9C
         tCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480842; x=1786085642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8r3nwsUV7dCZxExVXM2EEkbrRp98mWiLhmFsQB5NK4=;
        b=daLY/YjJ1OMjb/ZxATwODnC3Wa4e45U3b40H8ly5hLTE/L0BzpDD6g3/3/KRqwsZ3T
         amn7ZC0N979vriEpYcFhtttxg3/s4liFu+WCtlzt1u85B1/A0YULoBf3QpnwtQJKccEm
         2bwSrJG8bF5yf0FxrB+cMkQ0wUUw6gHyGs2WFgvt1AiSgH+pQvQnnfSRiwWQX+fOPvFW
         feMbSYqhDV78fUxBf7ovDVYBPBCTJDVmMj1aH4/+6mUBCyMBvkgBX4WRWjNZUfkTBJzd
         SQ8nQuLUCVWkMBiCBVIJ+sBzhaufqDN8k6RoEMqA5x8FKVmLafgP7xp+4vR5g7MpCwGJ
         DV/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp8gU7I3H+lYNaLAaZ0basIw/NdW2LeXF/1ZJKKyahOIpu7xMnTU/KFo0wMGwi4D451vq+hfybqQdM8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Fg6eZPR/guuxkFyMDDafZJCOKnAUoFotBC9SExUpIDkJbTbQ
	fAyxy6cmGr3EEW5W3HdxoGz5ySNcMDAjfEL2wwsDfjeowVgOIGm7afQfHJZYt2X9FAEoHhIiY/j
	kj39RKR1tbaM1qLnPRhsd5ZdqNttVhB7WQgE/BrtloWTzPYG+3Cz3hwP/2wHeF+4n
X-Gm-Gg: AR+sD102S5Yrl3eRjmPPViwcSm8ycbYRWKzPt/uQLMv43CYSuEZ9j49vuVHp7aBR7/9
	tiI17GtNKaFCFWJHu0mOhee6Tr2jVtT1MPylRzNcnE2733+zzcosROi49mXHQASNJrSYPQFWPRT
	N0gUSoprKY5Q8doVCy7Im6FI9YlivYclvVr/bt8iZboaO1uEGOItALDzQyR3kxx6FTfENziI4L1
	XuB7SnpQQcxg5IaXITRDSVyfBhZRLYgYBp346f1ySYaRgBqSa+rvbZyLF3UWJWON/lQOEp5AVka
	PfHD3huH4kb9f8PzrZUgiB4toApNC7XxfnSe/ccD4TUrpkyEd5CC7nInTxB5gVrnHIurgOMpWWH
	Q04jbhkaS0Fas81SgJf130JUdZfsrg1Pz
X-Received: by 2002:a17:903:4b08:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2d046eadb8cmr9012065ad.37.1785480841627;
        Thu, 30 Jul 2026 23:54:01 -0700 (PDT)
X-Received: by 2002:a17:903:4b08:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2d046eadb8cmr9011935ad.37.1785480841193;
        Thu, 30 Jul 2026 23:54:01 -0700 (PDT)
Received: from [192.168.1.10] ([122.177.247.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15914bsm1273885ad.74.2026.07.30.23.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:54:00 -0700 (PDT)
Message-ID: <ce283ef7-2460-4fa4-a1f5-9757fd6b42b5@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 12:23:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <794424df-4714-43a4-b4b8-e960998ad1f1@oss.qualcomm.com>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <794424df-4714-43a4-b4b8-e960998ad1f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ftzsol4f c=1 sm=1 tr=0 ts=6a6c468c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=wVA5pQU3D6HtJETKl3oCcQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Lfqoa_9HXnV3lTQsdxcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfXzxa/Phudw5Z6
 nxJNsVulOdDrYXv5uKio8xCeCaYGYx/BO30p4vVyhmnOglNxz56yfpFCbFwCIdnr4cvm0A96bO0
 lq+MMPqx6o4RrSmaozTP0brCd+dgqr4=
X-Proofpoint-ORIG-GUID: uB9NSpWGZlY8dLNUN0IZ5uTUnGL-Z2N9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfXwSmSOaATTEOw
 C0doacuG1i+W7lAWHfHzEz+Vnw9xcSxm3OTamX+5Hj8LIucGXMbapWDRsgYiq38X3YbRQ5OflAf
 HrP0ASa0z/Yak7q4g87wCHBEsEfvzXDGw/nGpYGAJytm7/sX7CRrsRmxlRojK/Pxz6vYtDJDicc
 lynK9WSssfSE2XClfdvfmzQ0ZMFrt/lbq+GBOUthGsP9eX+1S/ZxEUzPZizNqxLs9LHDmVsfL98
 0c8GD7hdWCsPQFSDV3PeUq0mgLDhp1EM/S4QMXAhibRAQJRCbIAy8lOfjuMyA2M+8vUZGysEHTi
 u+YgBpTmwxAmV7Iex561wCpdxNsTsiGNZUvJf5KFkgtvWhOuwcEOzziodU3lBS2T9ZXg9XTqDV1
 2yeeLFQvNEF4p/XmOq9BM9ZGbBrl7zpdYvB8w+TX+E7s7JXluJkysr7s6+iIPmFY/6WLG3hu7/8
 BRXi6QT90RYCwf7wZmw==
X-Proofpoint-GUID: uB9NSpWGZlY8dLNUN0IZ5uTUnGL-Z2N9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310047



On 29-07-2026 18:01, Konrad Dybcio wrote:
> On 7/27/26 5:45 PM, Rahul Samana wrote:
>> The reworked RB3 Gen 2 Industrial mezzanine keeps the common Industrial
>> mezzanine hardware description but routes QCC2072 Bluetooth over UART4
>> instead of the default Bluetooth-over-USB path.
>>
>> Build this variant by applying the common Industrial mezzanine overlay
>> first, followed by the BT UART overlay. The overlay models the M.2 E-key
>> connector graph endpoints for PCIe and UART, and disables the on-board
>> WCN6750 PMU and UART7 path so the M.2 QCC2072 Bluetooth controller can be
>> used instead.
> 
> So is the onboard module disabled? Can we not just use two in parallel?
> 

The Industrial mezzanine variants do not support the on-board WCN6750
wireless path. The common Industrial mezzanine overlay already disables
the on-board Wi-Fi node.

I will move the on-board BT UART/PMU disablement to the same common
Industrial mezzanine overlay in v3, so the BT UART overlay only models
the reworked M.2 UART wiring.

> [...]
> 
>> +&pcie0_m2_e {
>> +	port {
>> +		pcie0_m2_e_ep: endpoint {
>> +			remote-endpoint = <&m2_e_pcie_ep>;
>> +		};
>> +	};
>> +};
>> +
>> +&uart4 {
>> +	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
>> +			      <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
>> +		    <&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;
>> +
>> +	status = "okay";
>> +
>> +	port {
>> +		uart4_m2_e_ep: endpoint {
>> +			remote-endpoint = <&m2_e_uart_ep>;
>> +		};
>> +	};
> 
> Let's define both PCIe and UART endpoint sin the SoC DTSI. And don't
> mention "m2" in their labels.
> 
> Just pcie0_port0_ep and uart4_ep respectively.
>

Okay. I will move the PCIe and UART graph endpoints to the common SoC DTSI
with those generic labels in v3, and keep only the connector-side wiring
in the overlay.

Thanks,
Rahul

> Konrad

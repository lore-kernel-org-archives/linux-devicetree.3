Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593974;
	b=uX+YIi69wrm5I1C0b9uWarIE2QjH15t+PmsolBnGjU7c4ZRMLN1GQtlNhm34lhiixOJQ
	 HaD+twvIXDLVyVUWy9GUEIG5QXBkOVh/+9MUvOGnT+CoxFmm0D0hwwI+XBv7te7gu5gQX
	 mflVKHmKrNEO12/h6jc1460Kf4RlO1L2Bo+pDlHpNB99xbmJlDLSA9VPHbQqG3/XftmdI
	 pNczBFkn9GiZpBYjkFW42VFd79hXXKZZsaf1hfEO9P4g9+B+Qod/PHC+t9r5orZxIkeRu
	 X1ZNFgIiTqRQWgW0+Np+7hsmlcANYi0UBgiYJmKBxb0Jp0t056B4J2AC32ywFa0Ua9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
	b=48g0m4EYaux3HibCuPyNqAnyNA7VOettdtadPVDke/Jf2NlHjxdVhIQlmoc+q1bdmqLr
	 aOofunzh+In+gQgBURZMSzNVJIF7h3zHG9mUUjQqYSoq/5g9VaNgwvfTZptQBH31nLNC9
	 DZKEtqpg7Ahwf6vCL3n6ppILWrby+Kc/tou68SUFTen/P9wBsgN3W0kykbd2tXYP6fYDb
	 DwQTHpU5XSbtJ6gkwTibjIZMZSzXSOOdhayBZPQFrJnABZYzxZR7oectCnIWGmQUwdqJc
	 tLedUILcvZxoRKSOyNriaH7da6FDkiCSuvQDWwuIgiV2Q828iP6etZPBkjnSrOzUEyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VticY2ci;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXooyExh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962F0606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 04:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962F0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VticY2ci;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXooyExh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23uxis3721883
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 04:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=; b=VticY2cihfFLCDyw
	a7fpmLIQtwYsoHmu5fMOcfnHUfhcAjAT7hxuTq1gVTv6fpDcBsJ0k08aVakzNCmU
	PmuLzcvg7gvyLllTC72QWlQiQhVnCZ+Uk6SYc/RFuTS4Kd68M4jCEo//sanIgMYR
	ED/0m0a7AiQP0XX5pSoa226Rew5xRKQ7IEoE5f6LUUtVMILdkFRVP5unr96eq5ZK
	MKH8agA1iyz7y3s2gsz2lSQc0rcVB8y2U13vLOMP5b7b+bkaWSLuIlOEO+rdUKpN
	/+sE+YosHELDRLK7z+O75jQSv+SnDXvZ3GBaU7ddgZuwVvT+LyrjIpd+xmUcaDSv
	j5ssBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fwe7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:32:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab27c28489so417251a91.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 20:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793593972; x=1794198772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
        b=dXooyExhp9ZQcD7y+ASUcaY2Kane5RFEdUyHQ5GAsMyG1T76atmToLpnGetti95AMm
         nuI5vvV0DIZJopAfT4R7jEMSfPruVn/Kg2+2mEu7qbJidi0K9MUeWzaYIPTxrx8TeDNt
         4LEhq3BaI9hxvJbSeX/8pt8UGlBKulGO8yqEFeuwvioF9webEc3CmmrtNFbUAe1wkUz+
         kxlsK6O/m5PiNzv18Ef2HvTy0zkB58f7LhzsO3JplG0IYCJEjzNfSlboRz4xdDtwKLl8
         tIfvuwrHVokrK1lYcfrDwBQ6dHzwaeJVGYrQ1UoY0CQSQ1o1cUFXehQ1Nb+j8bpFmhOv
         7NIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593972; x=1794198772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
        b=Lt9twP1KTW8hZSCJEVKPnFTgimo8cOo3aCc6C/Wha8zGpRiS030A7/N0H/G7cc7e45
         zieBKeCA+QrTPCCUCquYa6xf9L6Qs1kNj2inJfp5Ha9hmD65V8fMKw2bYH9u2JL9O0dt
         D2EvESc9wYBT1Bw/X/40pNvbzkzr7XrsD86cvnzlq5ZVbZV1GzXQF/ocO4N+VTJlXij2
         yWIGAlmKZMCmglrU7wYJh621kL0P5fLA1taVVDtvHiMEWzLH7jjhXOxjyF7wre70h/h/
         W0aN98O+IB1w5g6SfU6N4kctRU0H2qaBR/liizzLLRQ5f6db5uETO4E4zLTJC83v6NiQ
         P+Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwb6OoLQjGN8EbaBaEH9jep1Y8VdJVdZ2yWmtWA/YBfuZ9gqodmRx1PXo49bgmILJ4P5CligiRlkBR0@vger.kernel.org
X-Gm-Message-State: AFq9FYIYRp4KgM/QbDuecf8e+KjYOJUQKy/KNiqR2HYTLWeWWYKenpXy
	QgTOViZkFSLefw2A1dGa5fG6pYCSaxpqyO4MnHUUt9Qhsc9+yx3C9dWr7MvjpAXfwYG3u/Aa1ZV
	Ox/xDoiKolGg5tPNivAYMsgUUBdAizFTJ8D5g09yIejCcfvFa8IdrsGaHSaWVmBe2
X-Gm-Gg: AYBFou3Kvh5DLTG1iGTD80DILAVYkXRnGewWidEDtDTl60ZfU1oXTvktGssIfmM6oeu
	2StC4xEKxYAL8OEJ9FeG/uE1SLGaEUL6xwQFSEi5DDvlXupwPzF+I4vqeWAJ404PUv0YiJDOGxH
	81ZmuWEZSivCmWqGM5iRsR+ajEOFuu6RZaqoIwaSOPFngb2W8t1tQedeIhKC8Psx2LJP0tU2EhF
	Uux+6X/VPTRgr8/Vt35H6uHOgTb6u2+/17PdwRcbwLqABt9gu0j4PHdMiOsABNHcmMfSNFa14pr
	8sVPs/whD5cA3AAB7TNByRXtvXkt0AsxHDWTG31EghzeUlo8sozuYeLKqEeeFA6g1pXMJanOrDb
	jNLPqMsdaHSTJawV0M+GxiyTDQ3MJ6RoavyyAgQmMOwmXmK8LjW1GgypKRKL9PD5b72hRJb21/Q
	==
X-Received: by 2002:a05:6a20:6f89:b0:3e2:7c10:d48b with SMTP id adf61e73a8af0-3e9288ece44mr13630151637.2.1793593971953;
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
X-Received: by 2002:a05:6a20:6f89:b0:3e2:7c10:d48b with SMTP id adf61e73a8af0-3e9288ece44mr13630135637.2.1793593971514;
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
Received: from [10.253.75.206] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm1391140b3a.55.2026.11.01.20.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
Message-ID: <2798317e-69e0-4dfe-9d2d-30e3ba8e1aed@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:32:46 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
 <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
Content-Language: en-US
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
In-Reply-To: <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX56S8EVp0n/Qt
 aDfjyrDbIcXGOvTl+o+RTcASqB8Rns4fneXqEkvQ88udNP9PuGst9gVSrkMzXrWXdAzvRpvKRwY
 HddvC88aZyOEnOCIHhnEn1jBzev/GE8=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae81274 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=x9Xzq8uMDaG3QzGCHd0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 05BVk_2yiIXZSwH7os8WFuwoO9uIjIJl
X-Proofpoint-ORIG-GUID: 05BVk_2yiIXZSwH7os8WFuwoO9uIjIJl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX6CzngmUoL/r8
 SpG5et8eUf2ba6JUNCIry54Lc3VCbMlXeQNxI20tdmdQZGSR5iqN/py8kisVVgUv8aX4xUS0iEL
 XbtozvAWh878WxCqjjSWFXsnQW3hKI8tC90ZOkjARyqqFfjcskaI/5DIJ9cof0IAVHBCWdNGB06
 jOJDTqOdwqB9oRccFro08eeNFH/hlqYLbOlU45Ta16gSSe2jKpV1zzaO6qyZYC+ldvEk5gZSFLg
 0gj2DBSImfrTKPCDakhDCCGWz162HgGB+YfaJlat7a/3FY+ZGU1YS1d0xPH5waiUwtzf98W4loB
 FtT71qdwFi2sJXHX8QNyIDT1pj+/bht+GwvWhE5ksNOHbSBZVeJKbtuZ0TQQ8tBdyzy/7UrKn0l
 hPzsG19wPO6KK1TCFuDehzHucm0e3IO8w3TmLpcg3ZtWD7Y+pGWJ/xTQ8xcoimz/L7dH6OwIZWK
 GNkKNV9A2xocmC183Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017

Hi Rob,

Thank you, and sorry for not replying to the earlier Sashiko reports.

I have updated v4 to use the existing composite DTB build pattern:

shikra-iqs-evk-m2-wifi-bt-dtbs := \
         shikra-iqs-evk.dtb \
         shikra-iqs-evk-m2-wifi-bt.dtbo

dtb-$(CONFIG_ARCH_QCOM) += shikra-iqs-evk-m2-wifi-bt.dtb
dtb-$(CONFIG_ARCH_QCOM) += shikra-iqs-evk-m2-wifi-bt.dtbo

The composite DTB target makes Kbuild apply the overlay to
shikra-iqs-evk.dtb and validates the symbols and fixups during the build.
The standalone DTBO is retained because the existing FIT flow loads the
base DTB and overlay separately.

I am rerunning the kernel build with this change before sending v4. I will
also reply to the individual Sashiko findings rather than leaving the
automated reports unanswered


On 10/22/2026 1:18 AM, Rob Herring wrote:
> On Mon, Oct 19, 2026 at 9:09 PM Linghui Wu <linghui.wu@oss.qualcomm.com> wrote:
>> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
>> Shikra IQS EVK.
>>
>> The M.2 variant uses the external module connected through the Key-E
>> connector instead of the onboard WCN3988 devices. Disable the onboard
>> Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
>> matches the hardware variant and does not probe the unavailable onboard
>> connectivity path.
>>
>> Describe the PCIe and UART connections through the M.2 connector, the
>> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal.
>>
>> The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
>> module. The overlay was applied, the link trained at Gen2 x1 and the
>> endpoint enumerated. Bluetooth UART and HCI runtime validation is
>> pending.
>>
>> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.
>>
>> Changes in v3:
>> - Drop the unused reg override from the disabled TC9563 node.
>>
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
>>   2 files changed, 106 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 1c86e7e98f55..799faa32e2d9 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sdx75-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-cqm-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-cqs-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-iqs-evk.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)        += shikra-iqs-evk-m2-wifi-bt.dtbo
> Overlays must be applied to a base DT to test that they apply. Sashiko
> has pointed out that this doesn't apply on every version you've sent
> and you've not replied to the report. Please reply on the other
> issues.
>
> Rob

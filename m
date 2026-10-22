Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661674;
	b=Qi6yhJx0GSGWG9x6YHVgDgeupbEt878mv6A3NeLA/+39MXUUa0JtQvhfC0/XWSYWyMEV
	 NEcEr/z4TX6/w0k+nDiWUGbFC8ZYZUkimoCz3zwSkO3QZCRuBpgZna9j5zX9rkXjmG1Ol
	 9DUyy5ZDqZGOfsyDOjB1f++pCN8hz7aWx2ky8nHIolOoq18+FBOoHZevaXbxSMn/dysFB
	 sGMnY9lmUKO0uT4D5hi0QujEsPzTPJMgCBef2PNweVSGGNeV9gZzNsYR8XCj/ZO36aIRZ
	 4qw+KTu4WihqzpCO/+KTguQ6jIsehvIulJjP5nrnvjlWPMSb3VxidP8c6i9ZGhBzsyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
	b=h6+GsHlxAX/f60d5Y/GX4pPIZAHzymWsli1u8BQ3Kqgc9ERAHtwdoOwjggsanMLhJwt1
	 Bqu4W7goMSgU9ueYduWX0zPRNykG88aPQv3HUyikQeYh2O7xdg2GMqUO4BZWhr0+mUFOU
	 FSZ60TxaENHpNf0F+JolIF3ION8wj8wSsvX6q+lk5jrhVIGxYaCLic0tS19xbtaj0ErqQ
	 Vnef2xgxaHO0n0dlgTkvSMJovXEdWcn7V1b1WmXkfqaxDPXBW6o6Bwhiej0HwLUJaA4hB
	 +nmWYybcC/2NLo+cVLLQ4Z6AIE7kF/kHsHQ11nS5iQjFRnYX1MdOdeF/bdO8S7aJSVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwrcdF+D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hRMlyKlM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B7606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C8B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwrcdF+D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hRMlyKlM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xwrp3076267
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=; b=PwrcdF+DzUJmRnde
	hI8F1YEjOk3dDfEL5mPGuYlg5y0weZGfzUQvhEGuLehfcUPQnezsoOltce4qCb4a
	bmPBXs1OV01hZAOhn4bcnQWyIoJghdPK9LhVpFL5LaJGTb37Fm3u0Xlx2UnwiDXK
	jsl9tPr5zVPw8tidZPUcLjYo3IInZ/qeMxL2AOkpLF6m+xmqOrz+9gM58ZkNOqH6
	Ggkbama+CbUkq5ipxnbhKEBCjpb9Px3G45hfg7+A0eDpqgl6khjQCo6BC9sW6tPS
	6+wo3Bkk0dpz/4EzjVlGUpkCGhHZrqmqE4tPEJjtwGY+0fxaeDeEwDK0H7u4IlZB
	H721Gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1qd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:34:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso42456685a.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661673; x=1793266473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
        b=hRMlyKlM/PU0rsEmYtQAf6/7UWB0RhstTZv67YqjnA/LEr09Khj3cxON7Xmj85I//J
         Y/BKpT00bzRF54MxWuIzCuliHKYX1WarCNYHimoJPohkKrXRWtVlKvwUNqL8XWkavRAC
         w8WjIeVYh+KC5qQjQRbLBozfZdaQrMado8q7hJEJ1JtAuSNsg/m22GerQaQb6UAUz89b
         hftNHCtZzv4vhtN0cgsQDWR8OWJPXmVfj87a34SLysAS9r9Bm5F3j/jx29/lP60QmYrG
         eVsHJhs14jX92ahWfA1EkMSZyQMEH5Vf4MqJSjuYiL9kFSv1eX2HwNnxYakPeLQ1ztG9
         8IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661673; x=1793266473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
        b=VFZrYxyHZh+N9XA4nfVkJflMKSdIva2vcjwGDCLrYzixbFIcEzaEjag3dMKSrEATDq
         GOMuC2WHGAVb0dROYbWL7+iH+OTwpP8+hq9HEKLTLFLwzzRBKWdAx5qA1jM5T6v4Jeyo
         jBWv6tVcughgoGbfXC/UsJDf7Ss4AQWHCr3Rwad2l2BTze1eOoEQGukDaFx96HhrZirq
         9hroHC6Gw2g2XIv2vLADJSCANfrEfcWYRIJtaXxT245sNV7muuq0kkcsQTR3HL0+8yxV
         hhDi1slLBIoxQs8G2ZA50QBEqWW2HgiEg//pEm+HuP/WkCy+qbX/KtJFfen7jTHLwIU7
         ChwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP+h96/USx1Lrqf+8r1RuTxqlZxkojHcHY1qP/ti7jONwO/0HPKdeePJmeJfjhnmjFGjkKfeStoVgM@vger.kernel.org
X-Gm-Message-State: AFq9FYLSBkNQnC6AzC9tgVH+m06CRLkRFgnCfWhE81EJAKupnCuupYKy
	+xQ6Wfrzd8AzGPwe5lXzskLeQkpZMoJRTilCLIfvG6l961uCFvDBsfyX4yEIA/3pqaTgoIhGTaL
	GUnLPf6KMkXaLu+b7Za2WE3BXTonLrNpXYabva4wHBeJciAgvVKVCz9HJewqG3Arw
X-Gm-Gg: AYBFou2XkVFGpIGsVjkuKgzIghGURkfUAbuzRz+xMgS5mlTO8tj4/7LLVGOARNSueD0
	rBCk6uxHFGTnnz4Zb9pFvcA9zoGWA6g1CbavN4i+Ie/TpLhFhrDEHysZJaKvJcqZLixNR4kBbfz
	Zha+LI1NSmdFhgEXx7ttzB0dVeXmPbNtuPuKnFJViM16OVcCvtff4785tFrd2REf+e1/O0IJKCh
	VY/ZSlYje/oGfbB55CM1ij1opUviiVgY6yeWbtRXe4VKhTecdAEDFxmK0z+FUNik9bOkF1JHO/M
	ZjPdNWF4t/8JBaTFif4VA+D19ggl5FaLaKckPgc1fVEbJvplUQpPRRY86/t+RlOExG0zcmZjGCV
	1wpiWA0+DZJMBzJcs5+fEDA==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr930306785a.5.1792661672549;
        Thu, 22 Oct 2026 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr930303085a.5.1792661672043;
        Thu, 22 Oct 2026 02:34:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm84619866b.31.2026.10.22.02.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:34:31 -0700 (PDT)
Message-ID: <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:34:29 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
 <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX4z+jozRsX+QR
 htobFmOxhKaEeKvabCQAvjYJZASjfxVRUXEww7RQxo0bexpxGy96WZD+P4UZIG/dv3ObgjQjGm4
 Xyprs40Kkdr+4liV+WOx/OMncLLqEw+9YD7CWNdJXxpZLlYu/5iF1Qz4eD2Mj+QD3pP4CdsDXUk
 FYnuHPIYwtabHp7ZPFDCfaALUBfomHSvhH1xZnRqydcE8LXXOadZgv394LTaIP1k8WboUXUlEp0
 Nx4JrTUYNOTxnnViAPDEOWe7gpKwf+e9eRPhRcHa0Y45GlFbM0QOqsYaiab1+gltIJ1aylC0JjS
 7cLgEGj7NWtVGSk6yhIgFntlPLwtu1Pc6xQU0nVEis+BIs4U5/bvEpH0lQm69pUHo9/S2Lbu2Sq
 FLZWOkDpOnma3+zYnN2kXbQ/JvLZrLpJg26jTMmEDJo2Wtn5I6+LQIPSg8qPh+dOrBEghrQeRQj
 MpvFbHv4EaHiVzNTHmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX4TCF+aR7U3gi
 u3mAe4Zr2axOKBo7BShBLJ6UB4iAghJuveqOrWAOoKr5Va3Q0XqTAM1zRPCsIM1nOfTl0IwsW4a
 F1ki0WpsOUWyn0Yqwcto2bMiLIqGSQU=
X-Proofpoint-GUID: -gSt47EQMzrFap9THGRbWNk5x2k4UNZZ
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d8a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9AbZo8Gtoo8lc68VITMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -gSt47EQMzrFap9THGRbWNk5x2k4UNZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/13/26 10:13 AM, Loic Poulain wrote:
> Hi Folks,
> 
> On Mon, Sep 21, 2026 at 2:38 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:

[...]

>>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>>>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>>>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>>>
>>>
>>> This means, the dummy port/endpoint node will always be present even when the
>>> M.2 connector is not used. I don't see a compelling reason to do so.
>>
>> I don't really see a compelling reason to defer re-defining them to each
>> device DT either..
> 
> Adding an empty port/endpoint at the SoC level is problematic for
> uart, port is not always expected, this depends if the uart is exposed
> through a connector or to an onboard device. So we may end with an
> unconnected endpoint but still have a bluetooth subnode, which can be
> a bit confusing... Also why adding a port/endpoint only for a specific
> uart in the dts, and not for the others? This is a board/SoC level
> choice to use a specific uart for M2 or not.

From my perspective it's removing boilerplate. Currently all USB and
PCIe hosts already define their ports and endpoints in the SoC DTSI
and if they're unconnected, then simply nothing happens.

Both 'ports' and 'endpoints' are an abstract property that signify
'X can be related to Y' and I don't see how that's a problem here given
UART is very much expected to be connected "somewhere" (with the
"somewhere" perhaps being external/a pin header)

Konrad

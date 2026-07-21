Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1878547DFA7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629349; cv=none; b=WlyMngi2K56L1aOdQ3SC48ywWpQyA55ovtvONEtdd8+dwtUMAvhiVejjXT+1OA1LQklcSeOQc20zjbHmK7mFe1w8bc2d6HbXTK5PpeZCjv9/pooqWsUtOIu/F6Otwrcnt7i6S3S+iDIggVChzkhrfHRheOC3c3gwJFDMVZtBU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629349; c=relaxed/simple;
	bh=hmwoCbwWvkCtS9tmmXgUi85MTocjsJhkMJsg8UhFpzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhMze9TJPlIpSl0ZE8vSyFnQjUu5BIT3yXrCtMKjp7WaNfKZfVyQdLTr6U5rkhG5Ov1jmm1uHhohJnAIea3i6K5ll30W6mBk5OFrjc9lSN7iyF/1hjFQT3VWZ1SAPsvZpJH4nhZxyNPVd5+J3xjN5hqJzEtttixISpKP/3kqO6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc2jVzdw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbRgAzDm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc2jVzdw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbRgAzDm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L832nH092220
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3dFPmTwtjrj1RVxOWYtlC2ykya29qSCI2uc6cIHJhY=; b=oc2jVzdwxONCEIgG
	kdBawBnQsUUEkbSV2TBc/MthwGaBNmk4R70RUEhKs6r2ynLvGxsSHJqjez4CoMzD
	26yuGwWAYe3U/YoEE/AQw4O7tTJCKBZO7m41wYDYXXsCPBDR0Oo1fC4wA33356Z+
	kTnCED2DbjA1buBM4zi0FZjDj1orOd22aHX1lFWbh1FMsDcC/toJoXvrZi1zRb96
	kxLGeORoZtD2WYpafJdmjdbYy4bJGN7yMA//f8CduqfkG7c1Dx1l4uDEdV3TFn+n
	kxmrefo5NnKuSItAqREn3RJ9HvvWw3Hzl93zpDJy2msjg0rx8Cdp+IWJEd8hMsEO
	xeq71A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01aa29f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:22:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e57e56ce9so183474685a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629346; x=1785234146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3dFPmTwtjrj1RVxOWYtlC2ykya29qSCI2uc6cIHJhY=;
        b=QbRgAzDmhgOhQwLOcCNira4ftDaw+XraxtoiZub4auvCJ8rgx+0jdjUa4b2AdfEp5R
         V9BUPseaOEnG7GPuQY4TC7XEp0ZbuqAcJGVFIGQ4Dj6yTCiG9xlSLvps4/qmAR7ITwx8
         dhHb+wzjvFAmrn9cXs/7Crxa2/TYl/jVMVIjZko94T6XObDcu7OYtBh8RPyJclpy5zsF
         CufPzZwQAR8B3cbdo57iprxBt8JcYgzsfwz+W0eNp2rk/K3d9TSg1mwzF8PqNdJ34Kni
         BMEm6mgHdrNEXuVYjOsLfNnXN4r/8Iheis3c2HMugJrzAwktgsR0U++15ew4CInMr1jR
         RODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629346; x=1785234146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3dFPmTwtjrj1RVxOWYtlC2ykya29qSCI2uc6cIHJhY=;
        b=D69P04dDLqPZv7YHcPiA15gN5+HVRf4WWQaTclFfDuTrjbe6KhNx/Y6NFRxiawlF6P
         IZRGaeOFRJx6fCqYLaWPuF/XPQQG9/WluleEdq1HKdfv3huzZSgBrjPWNM+AzPD7gwI0
         zSBrMnV9tRvV10OQ0jW2t7zrAqjw0QNuiom5fSl4CH0LRg7RwqJbEdEFMRXAGc+pR6Dt
         vu2++6gFdoYGUw7u/1cr3hGFsYSPE3NdOg1abR+W2/PVUonFLNffwWoNoVIeva6HuwGZ
         BQX6xQRWSBZCYxRC5QsXvCTqR0mZoH8J/O3qmATZ0CZcfJDeX0XrTdRGB6ELjtUNV/Oe
         zksw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5g5yJwYufdH5VqlkmmAF+FNL/xFfh0f3Is/PWYLWKK+ZYtoaV2o4uailaMruYWmz0STx8skmZ2m/N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66+x2QD2pzMCTEKUIccRbcFGLomJPgpGBZ/cMoU0mqgh7FQHU
	0kqOPUvl91cyEr5NVdYFZ4JvT17Q+cpqQqRnN7oRbqgNw+90fHnIIQ3e3CmnP3WZVxTRPK//yHD
	rt/psAT5tYnEKSMN033f5UHJvyEaPwQFgQzLg1tvBvZnc+4oZRYx0Qe65BFbs95Rc
X-Gm-Gg: AfdE7cmxIjsINUTtbPXjWtnCXwjcPmowmrelwJIhIsbKLiywZX730dsF1BBYHkTIjgN
	WQVCZdtZXaJG1PzeUVE3GfVRWO/Kki4t0TsBWZA5MVyKm5CUn+eN2N06pIlByvMvJwLDC0bLzPm
	BmJj8hqtceOd/C/L4uo8a1BbYr49aOXnzCWqpvgTPHQnH/KQjRPWsDIEmA0nnABvoh69JIMSXMB
	xfvkQtqWUzIAYxdtu/CsD0UpAqwRlyhw2UDvvWGp+xlbZ6QWqK1LrCYSCUfEuGG9jLvfFzYnF1I
	DIiEFhQ55I+l6Tx6WvfH9UyoeHpX9Y2uJI8eutFIlVDscay0k14EfcTnSEBSv9uZ5y12vj4uI5f
	tQOKsI8sH8zIehAhn0kNgDGy7
X-Received: by 2002:a05:620a:d88:b0:92e:5ef1:9072 with SMTP id af79cd13be357-930e6f7c82cmr206024485a.2.1784629346157;
        Tue, 21 Jul 2026 03:22:26 -0700 (PDT)
X-Received: by 2002:a05:620a:d88:b0:92e:5ef1:9072 with SMTP id af79cd13be357-930e6f7c82cmr206022985a.2.1784629345615;
        Tue, 21 Jul 2026 03:22:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf5df5sm567088066b.61.2026.07.21.03.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:22:24 -0700 (PDT)
Message-ID: <aee1e26d-d3f7-4903-a34f-02fcda6a6beb@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:22:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260721082410.18275-1-kaipeng94@gmail.com>
 <20260721082410.18275-3-kaipeng94@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721082410.18275-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f4863 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=lrF0KJXTGCPXGnsG3aMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX6E1fIWc+qLQw
 nmGqKZ0n+MkYk9wqbL8LbBk02wjZooN0JbzNaE/GVxiWv28z4BDwB7NFD6Bi0GxJx+CJH0iJuH+
 IR3JfhWA+irXqqHMmuj8eMEx6PsThOuAP9yVShLeto+puRiAsZ9WYZZUkCmMB9TPvxDI3vEsxH/
 hNrSucFCB3xKi9/p9Yla1b8/tpIeAGueQ5iTuJLPbtADKHiSAg+SXfnxPwdOsBRLH5sR8W1BvJe
 FFvuZFco7FxOVaVcTXJ4JktmrGCoFibhaJmyEeI79LzUe83izjDDqZcFFLB9y28UdshYRuofcQC
 WGhSj7FBl2bVAlyxolDxRAIwqzi1rKWuiRRzryBo2ik+VgRMqTM0l21+wB0VwTOvP0d7M8ByyEM
 xX5k168Vm0eObJu7Fuc7DE+xs/e0JZXVmvsrdf5mwVR7HREYRqOCIA+RSBBIKioamrY4ylNARl8
 UAH2j5v17gxil8RHA6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX8bThFqPzcYgz
 Dyyw+UBUgrdkEFjkxB0am7y/wciOPXuO8r7r7/D1zGrwD3RPLugt/hapvXqqxws2L/ivf2gPmMP
 0cBhwvEUUCVyBoKPhZhYhMtjF02lJyU=
X-Proofpoint-ORIG-GUID: 2TrinxHaxOJjEgmmzPqJD7zbDhMbaF7u
X-Proofpoint-GUID: 2TrinxHaxOJjEgmmzPqJD7zbDhMbaF7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210110

On 7/21/26 10:24 AM, Kaipeng Zeng wrote:
> Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> This device tree implementation references nodes from the x1-crd.dtsi.
> 
> Supported features:
> 
>  - Internal display & Brightness control
>  - Keyboard & Touchpad
>  - USB Type-C, Type-A
>  - Wi-Fi & Bluetooth
>  - ADSP & CDSP
>  - Adreno X1-85 GPU
>  - HDMI & USB Type-C display
>  - Webcam
> 
> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> ---

[...]

> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};

'co'dev < 'cp'u (other nodes have it correct), please also re-sort
the -link {} nodes alphabetically

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/ACER/SFA14-11/qcvss8380.mbn";
> +	status = "okay";

Let's also keep a \n before 'status', file-wide

[...]


> +&mdss_dp1 {
> +	ports {
> +		/delete-node/ port@1;
> +	};

Hm?

[...]

> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio191";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

You don't need to specify output-foo on TLMM pins, the GPIO consumer
will assert it as necessary

Konrad

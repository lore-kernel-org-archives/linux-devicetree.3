Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2D2E7165
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330230; cv=none; b=TrMffaSqZ0uPdICBWgTPMAO7NCuK4T8KAp738naBpiAqJpy3du+FFJaEDFmdZrWItwIaxXb8v2QNjCYDWXGuf2XFCE1zGRH2CGHi0y0xCrOzT/YRux6cTTapBZzXLykCDuBbOLi0/bsdjiY5lZma7KGJ4pk13aDMx75eY6kO1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330230; c=relaxed/simple;
	bh=2GSHbF3YXVluZAKbyVS6Nt6058MWLjB86rDBXAHt+ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbnyEGyZGm9iRb1I09vnau0j9kvP0sTeVzeCTSLqDcxP44LNM+8yWzZx0VO95DRdKuDINgusIwT6BT/upNXMinE6aQ8K5Yt1V3JG8RjQrTZYwST4JwBM9yD9TCTKQpezpmR7LUNF4ZhuJ1jYr6JXG0hohBbaoT5m1up5XbRuqaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTXR5kR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFDG1V9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTXR5kR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFDG1V9m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yhuo3532171
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=; b=gTXR5kR0Unq8X40S
	SK3/+9fH6PfVZKnE0FJlMV155Wu6TO4ZZuSwvXLTv+M1jfhqhDJp3mIy+FwCpTHL
	1tOHkn8r8eo4WGzTk0G31+3r+vxerLiy9DYM/y4nrLR9NJw8P9dj1lYUGeMKAcLo
	GARCugl6mbkfU2W30wBfobo5Jl5Q29Fa42N/KuSPBAMYQPzShV4PaWNSYmXPAdAb
	bpfVv+VtWVXCjZ73lg7ZaeY+lpkba2FB8K0VvgBBm7uPW+bL8DHyAYMX2NCOcLDs
	RZXEM2+ZHu9wADkkMnpNQ5Enl/NlKEctETmG77REYVTB/ivt1tdB+TpIErJ1Ele7
	pBIzNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kany9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:57:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso928547eec.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330224; x=1790935024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=BFDG1V9mqWydypQe0gNr5o2ETM2XxrarfOoBjCZDerEuarwmZPH9fJCc5E7bdMWCXe
         wvd58io8tHC91u3olcCDIYrvNxqM4QVI/u1QYrTAyCXPhK7DkOqzwvb04qFpHIL/TXz7
         fmAK4NxBNPltGbMzhRCOSGgJSB8LKFUbLplxepHnjgN3WiBOr+7uy84F8ZJR9NP5p26/
         RjGkoibgFLRlwkMEksQWqEnHpIR8NSFV9rcbRdhgsOMKsbGhO58hsF1SoVTwOp2IfP3V
         A/tf4uJAZ+SnLl82REVcY15KzPWw+qk4QmoA4G+cRSV0igh9NchMu2TgyiCwq90jiheB
         Buvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330224; x=1790935024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=HP8FC1c8+4/k9Kq9tfXtlmic0sQJVObmZmkfv+z4c7MkhEpYfXw0iVEuF1O8c+1ApV
         KGFWzozra6q9QPxQ16WdaPU7sGOEsD31iT6QoFpVtePx0lGtKtkgn/7E30ea1OxWszjG
         QqRZfmc41A5iwV9Axwkb6ABIHN4nPN7CIiBvvblKj5LKW1WtTO1X2EQn3Vr2ZlKhOMid
         5BpnBY14MPXiU4mRJKbuUSnOhSJAnnn6k2LUgPRiuZeT2b9UiJr0ixh3R35ICQUGKN9i
         hIGXlCKCZUJzTFamyMq+OFkfMmMUSdVz6VnqdfTC7PLCEWKNWXZ1z6EfNu90Kp0cKPEn
         DkgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwusJOPdaYtpoEmkGtkpuVXOFoyzvyRH6Ng+dbqe8HYMxQg1yFdVmAubvSBm1+7j8n5hc9RN1v2AU1H@vger.kernel.org
X-Gm-Message-State: AFuF++noflOCPJoqRcJnLrYeunSaTppGYp1v+hjZBYOppq4G8Nlm9o10
	X9yIxwXXe2Nb1WC1JkCzlSN3Cjfjd2tJGqLljaUgfl8FZdaDrLznDzljbxl4pw2ubt69kIePkmy
	MtxT3KqMgD1Y55T9UHX2J9CeqEixDaEGyXkbVl64XjmN2dpO8nXROuWFpkwWVZOsh
X-Gm-Gg: AYBFou3FQhU+nOBNn65uv8ZbxiaIMWSAkoA17qBFy3tczYTQX4vergbcDeH8DTJmL6M
	AGJTJw5NnrVQ+Ci6iomtDIW688a46qh4T9cLTulmNVmQ6Nf6DcqtHAZcgdzATY+LK8KIBDrdgqy
	sDUOBbjp+qWy49iNPwtTmmKOKmhy/XEgAub+j/udqdDpoqVUfwIhqiL6pC21KAfUpmbExItI8Yr
	SrNECEZ6Xdv7HqYvba8slVcySFmWFBWsd7rQ8L/779vYN/TGgsV1Ovr0Jw6OU6Zu2gYZgxuFUe8
	xCtgcxvJdU8Fwb509FLuezVkRV6BT7nKA6Vw7qWBF/EAfxN5b+hGka8V6V44XUo//JK8qVtQoZ6
	TFowe2up1xG41MQ8=
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802311c88.2.1790330223757;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802280c88.2.1790330223054;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm4731779c88.7.2026.09.25.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:02 -0700 (PDT)
Message-ID: <5eb29865-5d14-4fb6-9d79-5e2af6a08c8d@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:26:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab64570 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: T9BGIJzKRHFc6TjW4wFoM9mURPOjATca
X-Proofpoint-ORIG-GUID: T9BGIJzKRHFc6TjW4wFoM9mURPOjATca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX+RypKZPiTs0G
 F2ISLufCER7Zo/CEnfkEkd1hgDZCHIa5KREAeLzslbqX6BjmgKYBPZxXgnD0DQDxKaCtCQ8RVr7
 bPqAQDA1NAeZYBtScihCrpYrrW0+58qEyoyA3Mk8iGTzS+MpKD9JbX+wYUnNbXHpKilZYvn1P2n
 TW2Tao6ZQlcHoAPZ2B+lvhArQCRUNa0GM/QcEL+OoWTcfiKgZNFfP+kuwpT4I5RqkHBBBhihNRp
 vPYhakIehdM8uJc3A6jOn7WEGYDfe26bFoc+2Id2IskG/9BYney4pIIFuNEmCnRfGpNrspj0Iya
 62cQRqRRfZdnB6tYI6S4RpvL9xS6isHkOQ6uWS4GeElwpcSAm5IaWLv/ejQyg8mQxCZWfTOisKv
 mLlwymxOq+nFt071+SDckvDRZrdS03sokuGQ2FKsZPo1WRc4AwDEa/OJUAHxEe+BRktBjzcNIF1
 kbxMCgC+sa/YTkCKE6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXw83bkdOZ2zla
 +gANMjsj2Db7KlbTM1I9AtjcpYdQT7ebqljdvroMJuXBEmxAfZ7BE/PcSgIBUtTJm5jwZWhsceE
 0GIO0+FtgEKVmQMK7Er+xixhLtyAsFw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 2ad26902ffe6..98dcf57652fe 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -442,6 +442,12 @@ &dp3_phy {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

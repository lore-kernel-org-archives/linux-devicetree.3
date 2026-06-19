Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B43AE188
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883422; cv=none; b=XDCh8oe/xOcmnii2dnlmV0v7Z+P1m7GPqd4fBzqPw/aqLN3vZVrVXaE1Ujcf9zYFrtwSB4O1mslsJeUYRlIM+j5zu0pk8O4+5XrHDTVdyteP0xDTSIbXhSGgtnis60hP46+g0XpZTX9/sGLbWyREJg+RowCVGjfuw6RPf87hPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883422; c=relaxed/simple;
	bh=Ue+aoWk4rNKM0Od3UOoy/W5n1XtBpOFjK2/UGI6BV0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OubDuBPdashFcl0qOy424OyZRsXwEMOwVb3+Pi6sZ9+AUxGNiGReYD09zn3pB5ML9q5D+tLfWEdnOnMBS3nPTFbdU+vqmeKmBrXQH1SdJjHu1iwpXmEcUEj3/Eszy7MFpPOVWr1Pzhb0lIrtpliKqtrlvJ0Sl9kIHsBwoPxCWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTEjpDPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyVJCngV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTEjpDPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyVJCngV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDCGGH746256
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=; b=NTEjpDPMMF3fClMq
	99XprWICtZJqKb5hCefZmSdGR+n4Vkjm9DPB8qEYu4aFFUqW2+3wERYRO6NZ0K8x
	/CEeFego/qLHer9/xB+4BypzIfgNNXuTCrTCaXilPy5mq136KVEOcvXNaRH5XvN6
	HldYzixLRRiHk0Y56tfhsC7n58hRLQxe00jmpLmO5nw0vUwIma1wZAclSEFMqHV2
	NSrx1uZVHLd8R7FJjvQY8RTQrPCIqx3hZCF4Z9dAHvAGx4KPp9LcAOBQ9z+FvQ5s
	TCw8URFrGr/P+AC6guothYIFhpWY/TVtHZ+gaFTl1W46sULmb7p5cgr2Hav5XWPi
	gLJLnw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sbvkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:37:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dd10a7e0ecso6167456d6.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883420; x=1782488220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=OyVJCngV6+IxrgWniWczhsi614GdXH8gCRS6g90jaTouhvojI2vDeXhlNdz54+2XkK
         tqwbphsLNYSjU2M1VspEWSq9yj9NI+PqJG/lbFmb0ZQqXKdKvHzGr319aNyIWcQBZV1O
         80Rgbu5jUCxPFLfSUVmn5C4q+Hm2GwCMAc8JF5O2ZSQnFakP+ypPFOKqOLjslh/US15U
         zL4+jCabbFUKSC1SbwmSVeG73TQX5Mt2pZ5oV1px0pKJPnkEpKPI+PXIkyKGd1ArX4oc
         +lv06EAAmrJYDWoA79ITAm7aahMOvnLcXtuq99/uEZg5Pszmm7361cHmXdxnW0YkCRTP
         veJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883420; x=1782488220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=B7QObij0ZzQOAsIhx63U567zJQARucVfP/SQsAdL3mVv2s0Lm2uVtfauoYpbkzfnKj
         ZR9ygCT+QlcceK1hbhuogSeag7mh+U6awVr2c9APBNs30BBFYVuw/lyjOzZQlBjaN0cy
         VZg1i6K0vk7+AIyyWZhUUJd0zfjxlaZ4KRmiIHnexx+o0cBeEezwec3N90F4Y9a9cWRj
         fB7iaBgPN5LNr0+oTA9i+yO3hCzem1ihIDqKwQ3gmTL+HQG1LxTQ+R7CR45FuKbIdoFX
         8M+6Tl6YSaBa32Dej66BecR+EeO2dsWlJ+gVRM8EhS8TXCkKR3T77aULhXF3CqsbQXLn
         rrUg==
X-Forwarded-Encrypted: i=1; AFNElJ/gOfbImZs5uoZ8iMqfMIjvM0JOkcw3WiQN4oalihP+1nYEHeTlDMKIvbTrhborIYeXxqNrgsWwVUIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZP1RIvvO6QYvUGCOikqZc+n1mt++g9XMeWkprD4taAIsJ440
	stJb2n412R7uaoUCIdFIgv/UqErd19Up0t05xSYyEnLM2Di9vgdMF2saFBkvbQOui3kFUzgiUE3
	KBl460faj4b5zJmDE4PYeQfx7TKyBKwxzcVexl0TMPu3GojJOA+5F65TBpNzoAMCA
X-Gm-Gg: AfdE7ckm10d8QftODuVl2WXcWibmfoeQkix40vXAV4kzOfwrMnNQ9bOYKhfCUwEPAZP
	LG1vF7q+sxGJTkOFoaNvSPzDvwPpZpXIBJ3UR7l/o5uv1C8pNeSIzEtLCLDb4QSwQTE353RtZqZ
	1MQRCRdxhT3b4JtLrdTH3qe+vUDrN6TPGIN6nidbW8LirTA51oQNY0mZVxaLVuGzQspJOCx3eM/
	4LxzT2JP90B9btKHa7+hK/pvCRN3+xVgdiMxYdSn4jCWP0iR/Ip96XzKUbF/Jssv5evYOcFi0zg
	AQpKZRISPPCj2ZKiNQJnZRBM1aN9cRFPO8YiGuwN7DUIyMhRBJe/WIlMfaZL8V3lV40Da5y+aip
	HOcope13ZeTLcZZI6PVRA5lkcHcay2KMgDao=
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39022191cf.2.1781883419843;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39021521cf.2.1781883419316;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc76242sm1042750a12.4.2026.06.19.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:36:58 -0700 (PDT)
Message-ID: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:36:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UZlfLXnV3lNA3obu8NUo7o4DES6q0_gy
X-Proofpoint-ORIG-GUID: UZlfLXnV3lNA3obu8NUo7o4DES6q0_gy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX/1PH1llxTqwm
 mE/hBGhgVCNLw0XVWDq1BbihmiTHpVJlE0v6JMXDq+6riTVmR+ZZhf3RTJvVICzjqBQfyqk5xWi
 28jEVsySa3Bjo7N3XTK4YBxvkE3IzxYa3VlCgu50/bW1Z3IC3L74WkKH68CGC+ARdaD+D65RZPg
 uZ8x7CPiZAwaYHNfM1FMdrkD34dNOoF+KREpLcv3J6G8UO1paUsg3gAtDypmtmohFI0Y/hzXHcd
 F54P4WTFOsgM7IGTwSUh5HvL1I0wSxfx+8EHMzGJzIq+o1FGoF+OR08jKDJ09Mjz8HDODpGezIB
 xAkat26CDbLJCBnlC5abJnF3u5CRK4emGX32iGl8pr1Y2CYJcs/R5ZrEVFay8XEYVWSb0RqECbI
 0iliaFOV0FmE8dS0eR2ugMGcNaCkM0z9wANOkb8QACqTHeRhYKQVL+ck/cKxlTqu1wrxqsIsXrU
 /Z7X5HlvSt/ReXGQARw==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a35621c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX/xNx4enD9miY
 hiLDJV/nOttCadR6AO/jPO9YXpnGinkaJncf+EZfKha+8H3cgDmgaobEbAemtrDXgw0Zg1TN8CK
 KvN/ymFV3NNP/vYt+R/zzpEokaqIvS8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190147

On 6/15/26 10:33 AM, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>  				bias-pull-down;
>  			};
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

Please try to keep the entries roughly sorted by the pin index

For the entries themselves:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

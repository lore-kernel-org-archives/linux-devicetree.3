Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C80D52CCF4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068509; cv=none; b=FvhAW8LKzDoZ0mBeFIgnBA7NIiGMvbRkdmDvBe3khqM1fiVyOL5QAGKZVuzAR1+lNaFM8A1sS0HEboYRoHUZ97FpVJJiZ4Rn25gZq2Xx9ziYrbv49+iZK1GWGSK+tIft4Tx4v6xY/76H/FfZgqhNVJ4OAtp+fKtRnsicit8T2h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068509; c=relaxed/simple;
	bh=8aE5deZqZPFwMCXvNfgGk0kvRqPcCOhyMdfVtngPmno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvrnvgKqPSjVOYLdDmTEE+IXsIfh7O/+hlbmV4gTqfSIMLYWhqBtpioeMgU1jA2zuiUom2z3DXT1PTvCjFlH27gb4wCqfKaBNKKtX7IqkUo7FQKO06S/N19CRJJHVhw5Ih3eX/QwLFTbWyFPyMvuBsMinG3OWmNVwI7OQb0LYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkWEtPfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCmaEslT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkWEtPfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCmaEslT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7BuW82166354
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=; b=jkWEtPfd+a9OyVHJ
	4UDX5+PU5SxeXgJ/2Ny027y/HSSbKye5ovB2dHpO12sr/FT2XekHd0JvrZQ0hDE4
	68qmRoGYZSOyosM9/C0r1Cp52AQHYI8VR6toLE4i/1Zb2ewTlvg+WVU8ltsyPV1U
	+C6K7IIYC2o36DFf0vyiyrqUDtM0X+0iZrKKwF2CuSN2JGm40CmZPt8WBBDl03Dv
	AJOvJADQWwdWMKq2mmaXXw2n7OWTJbU2HZYUslqgjjurXpR1BClHfPZ+H1dhFRXt
	VaioNrbfrZC1GlEXXLCR+x2g+WGD6qvfcPBFQn2FeGBYA2vS3jI+y49OTRsx/KTa
	Wfn9eQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeu7hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:15:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so82274285a.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790068506; x=1790673306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=;
        b=KCmaEslT7XCzW5RsJNbhhZ3gc/QQf1YzqQiJsyJHgYx3AuFuPw+b2IE0j9cbyxQYi4
         iTrLQnzQaO1URjc5X1JwF/J3lfZ8EjxMoOH0po6ggYIPrfmR4pPRboYd/ZbDAlR3JBt8
         L3rbXG+6aV7cNAbP4osuHdwhzu3t+AxNA/lXi+gOlHzzXh12twl1KQOF97oyvE0BxEvy
         FqyG/bF8vw+kRaQ7bBK9S6Zdy6QPaMMLN5kzxSSvFx/xQk3a/bKKEPppSue5JaIfni+a
         ISrffgSrlQZgjF6NlDhjYmxoNMad/z+P5XZILS4AZafcRCyzqpYs+Lijej+baHttP8Px
         zJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068506; x=1790673306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=;
        b=H8/kkIkz8AICvGuQKI/psKXNA0gHX6cGgiTmNkoLzpaNRLaq4pbDI5r5asL3Yfepkj
         GVt69OEBOShWBUU3iKhWDVKykgVUkHJnaNR8G12slrrDQJAPurJFZjpQUerGpMvE/vER
         L5ZWPzMcatZtpEslJQxwx49otmU4yF4m0XAOBRcbWGp7zHcwIHHbxI65BVGC6rL0ZuHF
         IcSP9ntJpdI1VtD4M30sgbBzGS9EIpXbhQ5/w+/sVHUJXawCyJ8aVS2ERlhLesT4tFYm
         ktgG/gyCZORGFpfPlEybZzmMRnUspcDvvvSdS10GzEr6E2+rkxUWVTxFWOLVuY6P3hBm
         8hAg==
X-Forwarded-Encrypted: i=1; AKwUvBwqMcjOIhOSzSmpIklG1i4FyxYF24M/0uq5RjInpm4EOh+hvwW96eR0FSNPUap/SmZNej2nLYL65D9t@vger.kernel.org
X-Gm-Message-State: AFuF++lCd42ka5xAdYM3WBGJ4Kn+yZ0YWu+Xg1pC7xlJSo0lxvxISoHR
	gQ31EPcDbrUB42K19Qz74DGWBJPtpMwnGGPhVyatHlsvnO13gYiRlP1Q1gyCP9Ck+A9AsujD5wi
	1LmIXbtFqj+Rn/pcWQYPDbbjF2r3CFkJQ6TxoxdI+bCdwib4/9IM7fFJki0GsFnNd
X-Gm-Gg: AYBFou0IqDJU2lcwMYrplTICAMHk3Y8A+14nCKOHZ6gKFIB3WTTATRV9LQptr5Gzi+m
	YeihbKCnoRRXeM1oKNBX61ES9bdpw8Q+ui8MgjQf/q2T6J+1wuUi08As1Tzr+0a0kbYGl+FaRQV
	Q7oMelyYvCa1BzTXXDxMqgCmKm9hKA69bABZ47Aw8yjNd/2+ueFLbeaaQartXGavGR3DnzPcNXS
	xQb1RRe5gPRdLLjbGypWaThPTOPVSJ/teRJl4Fd2VrVPsrgXQOSGmUHxUoziig9W8aRS2RWLRHa
	kp8MCJSgaMvsQkUEPt8uwKW2zspB3H4O9ATLIbeZjwDChEpcw2npxeVmEeS7rvgJEXgoVqi5rTx
	NRXD/Hdrn35GUx/DDGBSkww==
X-Received: by 2002:a05:620a:45a2:b0:939:b8da:1242 with SMTP id af79cd13be357-93c15ba3243mr481847685a.0.1790068505726;
        Tue, 22 Sep 2026 02:15:05 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:939:b8da:1242 with SMTP id af79cd13be357-93c15ba3243mr481845085a.0.1790068505388;
        Tue, 22 Sep 2026 02:15:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5b0c6csm51663066b.31.2026.09.22.02.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:15:04 -0700 (PDT)
Message-ID: <eefde985-c807-4905-a33f-616a1898ad72@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:15:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3eeMoMJBaqPoepyBbEmjwm0BcL4PJlBo
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2471a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=SmOWCKbkXSXCNfC1NdcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3eeMoMJBaqPoepyBbEmjwm0BcL4PJlBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfXyM6JDanbTob6
 bNU40P+ZddQ6EQuqhVNwBvD0AnquWS6hjwLQ7O97Wtud5LaDr/IT20kHaCv8fZvX/3L1j/XYCH8
 1OrK8l2KhL4/brObwJHA9WiQQI141ZegMGuDD0p+TT2rhxij0ELmjIH1/GjF89nvcwltpWsFqbM
 H+UXfVATFPe3Is7i0qIdUgzfdfRt/3t3pv01Ba7/Oh4RFDsylYHdMfxHOKYTI+vHZt6ifUG7niF
 J++a4od3yNXBBBOkyTqDH/6UChRBa+6KdhXvk61isTQnxj8FPdDlqHWCSdrStosTNhOFKNMu34m
 u0k7/J9jSSV/e4GCucOGUF7HPn1B+cFhZGMG9ce9OAmraWZUzO7CQryuSeruwmAIQhVlKbqa5St
 BAoUjqe3bKViTmV7D4Hb932zf1KqeYkdmO7ARE3SY+uuW0M2qR/Ta+wLr8ARqwvTdAv8qEwCJkN
 m3pwUVsIXncgOxeXhJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX7kDYXSRgHwR3
 HbZxTVYIAQmJLgvnZe6UTzHkEFAP6UdlWKOMr89ofv/Xj8OXPlNaa0sfNl0dVxXOJbYIsNmJSeh
 eqFiXNBPqAoBYtl6ksNXFgD9EohBJLI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220133

On 9/18/26 3:56 PM, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

This and the following patch conflict upon applying after:

aedd77ea8168 ("media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code")

Konrad

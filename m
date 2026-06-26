Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694CE3B6370
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473180; cv=none; b=qXipAJVzypQ1IwcH/kSz7+P9mgK0HwjIG5bcYPtf22NQ51ymZ7rVZQ6jEDj1pwsaxCSlvkQOal7qf267EcdBLcPnRZ/jh/xXskzXsyFltq5BjJMC+cO9beetrWcT96jgtwjFqCDOrGhblHgt+mnvsHYd4ZtoHUkowHS4zVqIcws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473180; c=relaxed/simple;
	bh=W1Ih8jNWQ5ERX4DCHAykcTcyM4AQM8TjlVlPwDmSVaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgoRZnRIji2NsT2vNzVLu7Fymj3NK6UVP2eWvu2rKvv5JQEChHY2QoDFmaImxydSlirgJXeSM56LMKSEbHLmpgaD9Ey82LoeEyX2vfZ96IjvrMOAqG2hfv0T01Dl/sVEuh10aiBKjaFpddT/kl/uI6BObV88Xa9dtvIzpbZqpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhm6enFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfqTiGam; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhm6enFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfqTiGam"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcUg71052451
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9WVpuERVGCGY3+HjGLXL+TTPCsSSyLWS1hk7uKHeGM=; b=Jhm6enFnzQDViS4w
	WNcDwnYHfyPzCiM4goR5wyU/40P7A5q6PZ8m5KcQ/dp0akMFf2YHt2+KSZHui+KB
	B7V6z7oGOOCYxokBiq4AOmxVx+5vgKTWLKmoPb2DuWq6jLlegzLPGMY/mIVn7zPo
	R/WsJOp/5EmOKh13mEuTGhn3W5XYV9q8bkM8K7KSPwVcDDp328bB9YMxPfuztskM
	xGqJEMUj1K53z4BpF71X1hT88ETBuroPjUlVDDXv2mFLjCCBOjE/KxDH43Xbbw9Q
	j3QsU7ct6zg4G+MtQOxpKWDHRaByYr4AbqGdNsP+6YYd+5YbzZ+u7sh2hJE17iS4
	1YNWlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ngggnqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:26:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b07c34456so1494585a.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473178; x=1783077978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9WVpuERVGCGY3+HjGLXL+TTPCsSSyLWS1hk7uKHeGM=;
        b=AfqTiGam4QHKZ/Wn90yjjDhLJINBhBsaspYqpLvJqveQlg6xLDgUYGwysd6NQMns6Q
         34Wd3Z/M2lHXxtCc1jGWH/umR05k7loM78/SU/grVpFygpz3UW84WL1Xh1vMb8abqQ5I
         ANuDaXG8JyJ5sQJFHyntO7nh44XSUzDodiq5+LQnq2WxzpXlj8hQ9QMa8h/mVICpew0p
         P8IZwCZdJNQnyfV/4BoPctDaW2FNhLFShvqBkXFFKp3zUYN2PYUKfXxm2tcQPe9TFHA2
         OtFYrEayATV0Y4Fyqt5tgQpn7CyAc8BfSfdimQp4CxDChp0v/0Qx/KX3SbBUtwY3k6qx
         QQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473178; x=1783077978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9WVpuERVGCGY3+HjGLXL+TTPCsSSyLWS1hk7uKHeGM=;
        b=KYdKH+Dcu2opvb+saW/QDffvUfYN4hFOaWXeaNVEkvD8FOKaH5Marpr7Jy/qiIHqIt
         4BxgDeRicgAROuh6zRT4yrlFigGHvlj8x0+Qm8ehJ3+Wc0YglcGj83LykpH79Mc5oMAP
         fc/trc/fiI1jQM5NvzHwNcrpIRj5vz5yyhHI2p5WOx/OB4/agm8Gn94nuoRUh+NEgehM
         x7mzmrRjs1izTkXgxWirsr9ifphaH5Sbc5d57qik7/Qa/DnyvYmIge6+nvVBjS+Fv5rt
         eaUEi2NlCbU5opc8RIKxRkNp/8EJ7E3QeIiCsM37xbandGT+OokJHynPzF0H1Hpm6MtU
         zb+g==
X-Forwarded-Encrypted: i=1; AFNElJ+j3+JSRAo/Z1RDJXzDUlvJNs/XqTOx9GYyDwQEQEIGTw2nlaRcvnJRRZwbS0pv7Ry5o05+nWWI3GzU@vger.kernel.org
X-Gm-Message-State: AOJu0YyyH/5AGfV+hkzSYSr6UulomJl3Fn5/nFk0mh94hvIX3QvWRjmQ
	NKFxttg+oP3G2H1Ea3HnTrfNcPgP60DzOd8ne6FrJx6dVwUrg8zLo3jRnNqz9kOHNeJD+2WhkbE
	IAbbFTywP1R6eaYrMSyZG7I+QfRVWyfDftCOZFYgFBDOfFEza4z6JXkPJT1r1o+4O
X-Gm-Gg: AfdE7cmP508NmxzBqJ/5i9f/qczLVpZA/qiLFeIuUrRDMxVVWoOV1hhvVm+MdMfbX8j
	lRzhwIXVg2Jt8togoyOusnDQRR7yIo2TYEvWRVPnzCc++GekdbvtuhXNOpsMBUTbTDn7l9RpbCg
	rI5WC87Xfh7P1+KDG1M60Rj33FmBBd6TlDADlbQdITNqjyuUQkaqZ0oN6W4636lvYX+pKx5q7Tc
	pXHKKBNPooxkFM5xSV1/2XbUdNuToGj15xt7b/Hv29V+8Zr6T+0MkbGpTn7MJ78tqQRpo+GlfLy
	KMPOxisJpnOWFmH71OSmV/PYCXX4G+zkgK9CvQMFbx3HgbtDcXljc6hhuLVeSJ/+XXWUbSVSmLN
	iGzk7B2Mwi3Q0hcVAvF8lM9u8GAqMaky7hj0=
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr604758285a.5.1782473177755;
        Fri, 26 Jun 2026 04:26:17 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr604754985a.5.1782473177249;
        Fri, 26 Jun 2026 04:26:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbedf971sm336308266b.62.2026.06.26.04.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:26:16 -0700 (PDT)
Message-ID: <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:26:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfXxNPOPdLlFHEB
 R4aTgs2St9hthuMMrKlCIQe4+ulLTJ7UuUbsFNSxWUJSpBtJtTMaaYQOzbf1WNXgXl2qkxfwR+U
 U0WCwYKeh+rP9RnCF3WWdIo5IdDO/gkBLQlw6lJNlneqhYOo9ugzuT31179I/t6tsEtJd12qjeG
 6hxnsMhgKDtI0ZE1pj2pjteH+bDhhOkVvSAjgwB2d3FwMtEm+DE443uXslFCgMrnbmCYbaFPefG
 I6eQnxnLbNCWVK8oFv4T2I0xszXobLC/A6PEUSC4jVl0X9yGM9zXBwIuO8tzqd+S7ckJXQoEPff
 CmscLygIFcDCgrGadsNueCd3lBvwPov4IxRDC1uTs+yZcl3cJCNAa7lESwCKIRsz2cSo3LX/6qE
 lkijfDtY7Qd3vg0bdW9yykhDxcbAl8C2o9X0G3gZhchacCU/47uOk/7m2PEiYOeH2tbsPDe6rli
 8+QsyWxqEXnZU3t0S9g==
X-Authority-Analysis: v=2.4 cv=KNlqylFo c=1 sm=1 tr=0 ts=6a3e61da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bU9JLcj44ShPMj4K6xMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX94OH4Cy4P1AM
 fQrZ3oKc/1kejXZcHdLVOY3Lajjs47Dcv6PJdaxH4JmhM6oLp0varMKGp5fAftzZ+p6hm691pZ8
 amgR4a2mjZfACoG1z2QhsZjFenS4AY4=
X-Proofpoint-ORIG-GUID: rzLdd4JvrCjcV1N0ndle8buJrBOaA3AZ
X-Proofpoint-GUID: rzLdd4JvrCjcV1N0ndle8buJrBOaA3AZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260092

On 6/26/26 7:47 AM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.

[...]

> +/*
> + * usb_2 is a fixed DP-to-HDMI bridge; its SID-11 eUSB2 repeater is
> + * firmware-gated and never probes, so leave smb2370_l disabled.
> + */
> +&smb2370_l_e2 {
> +	status = "disabled";
> +};

I would assume it's simply not present (as every SMB2370 is a separate
physical chip) - perhaps we should just add status = "disabled" in the
DTSI file and enable the nodes on an as-needed basis

Konrad

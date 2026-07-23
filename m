Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65341A925
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809060; cv=none; b=fdnmSSrUi0eH98L/gtHNUMETyvlWhDqjRmeP4jBqDvbwZgfMwNwqNC6X5Ds/GcWMoxDXQO2SKiwe8wagz0QeaD+CiDbdoPCq+5f3iGi65tR38r3ukvQed+RGPk64vLRVpKfU8H2xb6aei5axC7HVPYSUa7DUYXGgdG2BCxcKJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809060; c=relaxed/simple;
	bh=/bruNzIxfbcHvHDo3iooeiIAT9FyhKYP2GlTk3uuBSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWDmmOWvIPbxFi88Ay1mXMpZD4q8VBHA1IJnhElutBoXWoY1JcXR7EOZPKoIradLiUbp5DdFCGsGf5C2zZ40c08EMFqUZHdrP8LmdV4sSeEXXp/Ek21giJicUqFDJkKzpgNIknHuxjvcjN/n0pVMtePHvgWMr4RU+Ts0lWI8HMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3E628Zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0gZcxT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3E628Zf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0gZcxT7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbNu3489435
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3m3dFbsSVHjGzv2+/KA2dKLaq99Nxpr4huew9CjjxFs=; b=a3E628ZfBw+cJT+G
	SyYA3wWuOC8c3VkQnfZNMtiY6VR5lwXZusziGXMB8KWiubLoODMytIaqyuJaZFSb
	EmY2orLNK9IY4/tdyPU7zI/tWLrw/XPeLWudOsUAgk/Ec1x15VcQRm8KYyd6Q+9e
	yxNrdKlFdxSE6HOSsKImAIYPn5WeU3ouXHN1YWfqT1b+hgoBIHZJL84F8oVfu0D5
	0KwdF3evULMZiubD+LykB+7Oe08rGhIzo1dFHa8MDM3+NpqKkyxdepxHFVhmzJeH
	EvHWf9xAg3jlXApeXjCbSWRVB8bYvK0UYvK9dUVyGPmlOnNvMXu75VPES8N5O67X
	o9qZuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vm1kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:17:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so2323151cf.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809057; x=1785413857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3m3dFbsSVHjGzv2+/KA2dKLaq99Nxpr4huew9CjjxFs=;
        b=R0gZcxT7q05sYaOAGxYNZoIdxNV5sSd9GA8sk+t5sPMauEDk15TKCbxgaoLcD3/O6P
         VZRfqyJR/SXYyUlLO6ekn6D1NyPAfVrlrcqN1ZPrPfzT5AF6url6eQLVTvVoa6D9qB4P
         mMbvwizxVzDqH9SYqMP3UQx5MwgukuttWRD/Vv2BpK9doYYveT/MQLZCWvQ1772urZZE
         HHMGFBUCRoM0Wr6OvG7Bv4szAco+E2h48LaBNGpUHRyOOSb8f0A5N7WPslfvr2nGAji1
         xru2kZpl/sSulEOp4+mpvmCh1gptSesxyzc/qx9OGaq5O2FoiBKRNsQtvbuEGixSImne
         3M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809057; x=1785413857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m3dFbsSVHjGzv2+/KA2dKLaq99Nxpr4huew9CjjxFs=;
        b=WwijgzYAmXbe/VKTiFpXTYwhhiqh2mXYVexHGm14iTM/xF60Bdkfx368fv4/rfxDs5
         j2aVakzk6ZzQAbimiaYdrzXC1C/b76U520T3Iod4kuPMvKeiAzPgaks4LAIYRZypzRB1
         QyrsKG5N17HW1xKhIQnjPkdMEg1dpnowL4IpntLr3xWSRqr3rQPBra1ohlBW0gt8v5g9
         3ro/ozALTdzp7ijenlfHIHA0mybMR023PG3Pdkdk1ePwUlYY9Jq4t5MILphoxbBIK1Qd
         qCUYc/vQHo0eQYoAaG5D6IOOi5YhaoUUijFoDDYGMFAEfWRb0bnEl2pMKLYQBWSmQ7hy
         vYLA==
X-Forwarded-Encrypted: i=1; AHgh+Roy4OHAN83VN5vYi/VHFYuE/KpO0JwES+hioZvUxh+P5WLmhwBF2Mx0ku1bLTX0dFWLfzIMxwchDSe8@vger.kernel.org
X-Gm-Message-State: AOJu0YyzFcseCovHH2VcmgMvRKIqpHrtxKr9dSrASxtup8c5ph9oosJB
	ypxMSEHpESHIp6FNyWQWpbJ3eYl2LiGUH793uTNPFEbxPmKXluxaBzQscYG/BcAtV/7gUP7COx7
	A8etPJyaxIH6hhyqJbrIS4DdsqhtK8qn1Ao0TyETcD+JXXRkya2EkY+Ehw5k8Z917
X-Gm-Gg: AR+sD10F6YTwqqnTDsa7UHbpk4IReQk8LdxO/KLiUPiM6FfAI6/eLLSUdBmbqxmm90X
	Qq1QZcYvxJG0i2ZjD2FNQaFWCH/4Vf50fjeUXAig5IUyvMrqbeFP2J1m59g+XGS9MJp+qFBTxvm
	9qpZ1aHnUHuasrgHEMunZGkxYoZXiLEw5J1MHxrDDCa7c9jFBnQvmB+Hq+bVd9O/zwlF6pB1xVU
	bgdGsHsQ4jBsOwUWpqbeZpwYGLsXq0ocAVLGHa0Ia0mDxUytVhYPGy3JC1azgquumZAt3dRyruM
	CJupeAlMqUXviVnyO/O0KjGwhsLmoxfTr5cvBoCPU6fQ4rfT41QRH9AjZ9QykDRi6S+zL0IkemF
	1q+XzvlAvJmQgVP873T6mMypZ
X-Received: by 2002:a05:622a:1b8e:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-52847441d12mr2688611cf.10.1784809057497;
        Thu, 23 Jul 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-52847441d12mr2688261cf.10.1784809057014;
        Thu, 23 Jul 2026 05:17:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm221020566b.20.2026.07.23.05.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:17:36 -0700 (PDT)
Message-ID: <758cdf5f-a1e9-4001-a163-be45d0082438@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:17:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb
 controller nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMSBTYWx0ZWRfX6i40ahNbtoPg
 EcNbov3JOhaTp4xa84lb8mV/1jK0VWi50kGk54RYx7VpdsWk6dpeLl37E8/M2lOMChWsu2Wy2W3
 9q5hMTzhLfIGI8/IaijyJAMmy3HOWls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMSBTYWx0ZWRfX06tGqnnMePlv
 LNEUuI3IOOaai1dTtcFZ2vGLu0spVWzM0Mb8tcbrDgfyRYOFcySdr0waGFPffw3HfzkzKjJLtp4
 OzxcpOuEV9O3RdH6NzMi8dCWj2LDMyS2nawV4X9/k4TGCJc1bfPTbYbs/zVSYSExZD9T/EglHIg
 ujokaGHYynUunt0LwxDo/pa+R9V9acwbMuKbhb8YIGS28Ampn7pz1VNLPPxYt0w7yC+G+Bwy/uj
 9Y+HOInP/8/56S+5R9TmqtH7Nm/iLy7eh4d5OORJvCfOSnFrOS8pgF/RBB0z1WDn8jUDG80SrOV
 C+xEDF6adjI4bOGACtzz8l/ahXKAQ8SMSgkv0JLCGPGDK7Yi3xTkJcUUdCIZHvE+L4kLL7ESHdN
 Y//iZ0hUIn5itQLlYXpCvwts5ulyX3Qrn/6h2D2uY4JW385cHMrUDTwYURjobJXfERPSFA9Bi/x
 T/3Q7wc3E+ntoIL04lg==
X-Proofpoint-ORIG-GUID: sW1VFhio5PzONU4oc0f77lOuVBpqpk5f
X-Proofpoint-GUID: sW1VFhio5PzONU4oc0f77lOuVBpqpk5f
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a620662 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Tttc8mTvhuDqHDTqi8UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230121

On 7/23/26 10:17 AM, Krishna Kurapati wrote:
> The following errors pop up when DTBS check is done for qcs404 based
> platforms:
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> Modify ordering of hs_phy and qusb2_phy interrupts to fix the errors.
> 
> Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> This series has been only compile tested as there is no functional change.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

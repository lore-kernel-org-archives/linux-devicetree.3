Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D0F4A43FF
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819091; cv=none; b=sfQZ97a1C9XRGmBZQEh3REAhSpnwY5EbKLVcN6ghOut2l8PhHpK/hXzJz1oIPn2eqF1c+HwUpXK8MJdPWtjuFQRNqVwZjuKYZQk0X9ae+JOHl6pTrp4k4i6xnhisfqkJzO93wzL2Gh/NV2V8ePyRnnrtFjbeuakYzc93zHwpMPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819091; c=relaxed/simple;
	bh=wzwLMct+jxWDcRWFsjfId4DR9r8u7mdmPxs/TknAVIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gm30DPUq0uOqfbNOr9lBrJdZx/B+/YKFkm5CmrjNKhIxw9q5wi3eiFEQMVuflH+9JywqJCWV4ZWvLT5H5d8zNE4UKNegIb4EQ6xk2ATCeymRn8BbZefy1KGGDbfVI85TVTqn4w6NmNcYEnu1XP9HhzA0EERGhRrwP53jVTUdHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCi8Tsa0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KODns6kT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCi8Tsa0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KODns6kT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC04o73365243
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=; b=cCi8Tsa0igx6Mba9
	NNSG0X66Wkvx/xuk3B+WPguet89ME/MPmmA1Iu4YI1sfeIWKwGWzme3lbtF2murb
	d43etTsHwsFunGUxKRKYzu/Xz6mDRgt+fJOaHyLftzfyvZhUxBAXf1jqVSTOs6Qt
	xK7xBA7z7obboYI54hlwW6pZXCzXJNbTfafbkZHGjo9BxFlXWdpF93rlDD4mz3hR
	jr84kALGmJBAA6dMD5TyjfztZ1Lt2HTDJOYzzu2bSuZdY30sftLnmxa6D/wCHabi
	WneSMI9hYvP+OqdM8bWzjB+VGocgX/NXjnmrOsJ5w1s8kmvUlyD1rXyNIYuOVAb7
	lQ3y5w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9enq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a6634ef51bso36324137.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819088; x=1792423888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=;
        b=KODns6kT27eX8YxpkCdnC12LQvj2p4vx2jRKprfQJFJX9APAc5UXQXc3yitj6RYzb4
         ZIfP7tE5CMwoM6jyUmTy5IO2/EOubfaEFaoy1cC/cjp089yuQlfcpVrSvdXSzLfygoqA
         sQopudHR6xm5L3WBoRofR1+92OM9/yWpN83sI+PIEb/JvXo55vtpqvCwcORaX/dDPNVH
         SG+vhKwKTXGDpHauWqhlNnoeBWkPZUYK+k0y+ihV7SkjqGFxlRRCNtDHNwkkWPd8EHQQ
         b4HWIn8kcAeor6s6G2wtpCWfAyKir90O224I8C1034Bi6eVXr6ibjRwVvn6AfQGcx4Ny
         9Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819088; x=1792423888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=;
        b=uF5jzXXbrYuAq47CiE0apFzVCSxPsEEOeVfifgub/s+seBsplaDPIadzBAIVITGI1j
         w7yaClPflPpb2lxxz36ulpVViMKkS7KL+YT88oEzRGKf9yXdA37o7SwuwoSLBRYFDu7S
         4zD7hHG2uiHt7MLkflBTw5OnXSdJ7FJA+TFWAIFcrEpQFFYakv3r9WrEy1xHYTW6AivO
         MsZbk60levHv2d51xVi+slyyM8yM0AIh/WORlU9jRicvdad3efmvd9gn3xStVJK3/zB+
         V0PODlPf3PfJl/EhL2IhRhq9tDh4E9/NvzyGmE5Gax+4jXdDfJN5lUbTAaueih5+1DqJ
         yVJg==
X-Forwarded-Encrypted: i=1; AKwUvByDF4lQMOi2FT9sh3s9RvPninu11qWnCoPS+jLECS2mp4V1Y6OWieoDh9M31HCt1Ap4+PvsMOvfkuQO@vger.kernel.org
X-Gm-Message-State: AFq9FYLjDWJU0+XzFkhdsEIot30gdhQHYWKKXNgaFTJ6dXYv3eUzd2Sj
	K34qYV3cVwGJxFH5bSYN9WAfopXRAlKZGO2b5iUV4LRDpafTDL9rcFvmA26E940xM4azNTABcvw
	CJ2tUA16LkhqsvuRfOYK1scJsuVDzSBtohM69tIWVgg/A0kasW0zOwW3EQ43aR2+Y
X-Gm-Gg: AYBFou2oBUfqeqa3cmJX5ZC956XvHshNzeIiX3pQAoBMGeT9oSqzlyU3sg7URAS9gl9
	GVSr9z3By8nmz9WPFTnFp1FpeVQPfeRL521pLzJxfx25pMEchdZN3w3Qy0jjs0yx1rE+mo5yLQs
	ORq1vfNRjXnhG4roeskOi1L+rQoSv9B6P6TshZjSfAZNr6tWkDzI2Zvs0IPf7v+70K83e40tCyr
	tJj+tD7skJsOE5fi8mPOee6J19pD+/6pkGMKzOMtQNJpipO6dKKYrt1b/EDkrHTyqKQXTOdT24g
	zGe9NLr2Vt4wNpevkXJDRzQ0UQMyFes6Knot7AOyiSPQFM3/AcqUwZrxE44SzmBHSr0iM7j5QcS
	+I2t4SOIZUZREl4Q699JNRQ==
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr2232329e0c.2.1791819088589;
        Mon, 12 Oct 2026 08:31:28 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr2232246e0c.2.1791819088011;
        Mon, 12 Oct 2026 08:31:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:27 -0700 (PDT)
Message-ID: <2e4f695e-5242-48e7-86f8-1438a0604e0e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/38] arm: dts: qcom: msm8660: Remove space inside array
 property
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <45014dc590b7a704673610a5059a0e6e572a27c8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45014dc590b7a704673610a5059a0e6e572a27c8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6WIOcQkPDQOh
 Osg2piWVSCHbjVGcfPj13v6aqe2cmBavybBy7jSyGMXwHSYP/Ln3llUq05FyobbTrSPBJQt8oY7
 +yElC+Cva/68+58L4khisARJZMRo/mSqLjftX4xjvNyjLVqCnllEFD6XS7OZ8gE2jP9KfAwPyyN
 qLlGXh/6jD+y2amE2uTowWdaPvKWIoYkG7cFR/a+vRZpdaGNbOHjRPQVC7jEJEFGukOR0t135E7
 nhKGzbCWiv+MTWu90QLUFtaBmXMDrcoz3lM/bv0VFr6zUQMQtIQ2TxIN2abNV5MExqemUjbtM3p
 w4peSHp6YA90QHHKYwlMoFhaXxndbYfVwciF++M5KO+9HIl0Dr60eDDZHUNHzMFp5divTZu0V7c
 KehwcJL/GO440KtLjll9zS+ESqLTzBCnC89ncROeEmVazlw5/Ndx5YJhdmfC/gKi1fcczEJyLRM
 eSbLKzJRRS7BRw5vj8w==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accfd51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=iLvDT8BEKJY-rmnIixsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzinR01gWtL27
 9s/XLisJSJFh3qFW1OZ7mhuWpyMSNXTJJF1EWT7H3oXE7gAl1esaU2HwWPwhTmu/Cc9O++Al84R
 yLV7lYkzQGLfQ3mVO5AFhdqug4iAmOw=
X-Proofpoint-ORIG-GUID: 10qHJ3VCJAwKaAUdmhWuyyDr2yLeYUQs
X-Proofpoint-GUID: 10qHJ3VCJAwKaAUdmhWuyyDr2yLeYUQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be spaces at the beginning and end of an property array.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

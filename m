Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606647;
	b=mRaIVyyX1+5VzYbuafks70jlrlBXNAOJA47ci111TpfpZ75kYR5btZD8BVHJbTFdfE7P
	 2mvJtK32ckM7VLVYWpY3LWZqHuQ0dAA0p/N2siCT5D9KbtwqVFYaLIqD+ZP+pgMfSLssx
	 RsDKf8y8aiAtonznLGeBGR8zDs0s8OsotWdBsz4WrEARYI9dwDvgtdDIXEKNEKE9f1Ouh
	 y7yT2gTQqJr2tXbmBS5wcW3Em0UeB7m6YTjYE6HxKKE+EPPDUk804VVQnIUCW69k1oLIb
	 VA6G/F9v+i2zB0Kh+/hZqw9yP0Em/OUVdpjAF6DhR9fu2ELcixiVyJn1MpdfZhTcY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
	b=NxfMZkEIcGelPiTqdXUZgTNaEBGuwzf6FIYhf2+72tW0hRb88qIIIGyRCXPIc6zWGwRE
	 SJ6lJu2tbRHYrrJeznrZPkzLhuAC8FvRIb1peF7zcD975HCW1hbJITz+MjlXL52BcrKW5
	 6hhSXbbsbg7qlVEw1Yk94Wbv3NdrtHhsxWFBQzFeKihxI4uRStNhMzePCKN/IrWoYzkQw
	 EaDxWyHa8thaeyGy73rGRZPdqaIMpLNbc4MWMLGNg5PZEp9wgaxZywMR8vVo9XhGkeTO5
	 npXhoCOCkKlDx6r1B2VA3/m2/GI8dbsjlKeyzyAozcZuv2zPYWFmhJ4cWdb3d85/Jug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZvBbmKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ3a302Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D5C606A32E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D5C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZvBbmKc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ3a302Z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nkK61505201
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9VTXGJpWFmC
	/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=; b=YZvBbmKc6OJ2tRxwr/7FDYNRNFx
	2j5d98N77o219gSqvowGPYymW31u+dzXCNXI0QNrYfyrzFIcOSfkj/p1dTvnGuye
	9fqDO3XWEZdZH4Rkhwsfd7bpfMZVt6UYIS0HGgJxEWVHb3vvkdnhZus5zTlTHk7u
	JbcLBNZrN20nt3Y4GNHhxI71qdveEp0X3AEKst4fCS0NWwKGhBH9NIndXSAvsAjG
	Z6WTUEPoBAVNZhgTD3zhSPQzA475WTcKd0oai9cqRovfcZgmWsc9CEb2/frbXuMC
	FgqtZUIe3cF+0waIW3A76BeimqCBzYXqEGlJwIyG3/Zf8A82IZcF9f99RHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa2a0ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:37:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso3846632a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606645; x=1796211445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
        b=HJ3a302ZE0VnH/F9dpnH51nNFjlJczGndvaC2zLHHfXETeN8BAcdXiRVjN5SDPK3Xj
         NYDz1FlijB0K2RXUVBzRWeSLHCKHLgR9YY+mYISsVsNX51GFuPN1IAwFggNdZbqXWpzG
         5aHCJ3qCqAOVmwK0at97fxvkKp3dia+vnzhvV7SHUHIVJSfttQ/YqW6bE5GCuo/2sQzk
         Jwwte9IdhFo4/cZJrpAWcUM+x/wODVsUPkn7KW/GssTrwRv2F+nN1QlcLKmQTGiF0lIU
         sSA0DLr3BKl6HFcGy7Oo6+6NrSMVkHAqtxLLoCbzll4+POkxHBg1wbcRZVuUIA0/SUyK
         wXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606645; x=1796211445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
        b=YDslm74tq+vX29bpfpXnqgVo5o8dutC+/QcHO+AYnn/USfE1gydFRq5RsttTCeivPX
         ZHJ2KvQ18FmeVDFQwaS0n4F6DRaHsEpsdlK0zMroK5Tjtbt1DciWZrtcN8sRsInaoaAo
         NbW/HuDjWaka3wRn3VZ5seCKe26YIcM3bjDm8gLvr5WHYWX0bLeGgtPC5azQgZqxSXyI
         WDZDiNMgzexkvjqG8MgFthXpGRV07cuotcFzgcYKJUb988RW+ChqH5wrIfXp2i8OLls0
         XrpLi2fyXzLgJnKGf1wXvhQyzVGSfBhXGTcnPxLSx0xL5ZahMweywbwvklVvtMFge7X+
         AZhw==
X-Forwarded-Encrypted: i=1; AL+hErFyRMZ4V2bxpD5ggfUXJwbZO9EkI6aAwPLslWEfJeezEojQvUXPArSGhf17PmY4HnyK3Uq4YMVfwT+Q@vger.kernel.org
X-Gm-Message-State: APuU4Z9jnzqpzJwPIU6kMviIBG+uXcMUiweRslhk4YJrCMvYdH+mwl5l
	L6mRotbUOzF+huv7AVm4nCP0bK+13deEcAIQgG71g62hvEa6LXoGP8zrpovkPQ4pX1G8yM0mi7r
	tyf/DAYJwysmplsnGLc5H6V58nVeMnTLBXS3L0PAqKVecdWsYeUwoMRCzp9jxcqE7
X-Gm-Gg: AZFdTZd+WAeQIofOhZ4Mn3ocJBaGLxGx1DUfPiD4WnIMPLhdtqFYTq+rk+LMh99WRim
	g7mnlIsVXTwkEMut6D18hAuQSgOOsth3CB5aJh23LN9gmv3W8daDoT1L8Uuuz1MktoWca82hLgg
	Cl7t+BzST+e1x7DCglzSTVCqryLjg3EzFdJoxIXXGJvJMPLHjWG3F94qmgfenvxl0ZM395Xeohc
	NeEJ5PhcX7xYVliNbZrFlXSOojjaOlTTE2eUScUCEpf7KBhemp79K266luWukh3Fmj4JF8cJSyW
	YVvn/LspRezXvxS49r+myTlUChISiq3j1Xo+M0J87OuIUgZWFJv/HEEMW/oPmT0YTAv5dwrEJTP
	26Q/v+vavGyqZ6pUVNShviizUK8mK29pbqUvQizTSmvd1Qztt7m5rrVFfLF3/vFhs8RswFUKtGX
	+gJOnrTyxJOCTGyXZL2Zlu/bH2DjpOXw7y95noNRf9kbbtdsoQql7gcbU=
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr17722220a91.54.1795606644780;
        Wed, 25 Nov 2026 03:37:24 -0800 (PST)
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr17722195a91.54.1795606644336;
        Wed, 25 Nov 2026 03:37:24 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm8697911a12.9.2026.11.25.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:37:23 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Seca Ride board
Date: Wed, 25 Nov 2026 17:07:17 +0530
Message-ID: <20261125113717.334604-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e07f2f6a-31e8-4d7f-a533-c55c51237868@kernel.org>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> <845a24c91ea424ff30faa8e1d357c326eda2e5ba.1795517711.git.yadu.mg@oss.qualcomm.com> <e07f2f6a-31e8-4d7f-a533-c55c51237868@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RI5xq-v7icqhm5sl96kTsODdsVRhoZ_H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX8GsyQ52a2IxD
 MHY/qI6R6TqIzSBCwYdLVk34L307c4ZvylMP20V4ikXsQCSZoxBC2J9H3lyHPdecwYqPHFxbD8L
 8JnVqV5NeRZigaRkODdUuzIONP2Ujs0=
X-Proofpoint-GUID: RI5xq-v7icqhm5sl96kTsODdsVRhoZ_H
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06c875 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=GTQg-DUb7hVcNCLWfvkA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX0y72dYFEFuZ1
 /ZlqjdjGkSPH55941fhUVrKV8iUEMXQrNWS6jGfGVDqdLo5RAka6nb1gOyB7Pn1eNxI4E8W/JiL
 X6NqGWEHfprNUbKqrfAxsoPJU69guVwVvijlPFYdwXoGld5/2qd9sL2LZrY6YlIMZYpIFs5G/iw
 e1SZXrmMYOnx58R41n241Dp3hcnaRZoHqHn0NhkZ7JnfNmZ4B88HDt9OO+VuOsMypxemiZYLEGa
 jQScbCraKO+hMGQ9TijTvmsQddlu6o80iF4JpEAgR6hi2fAsBGA96adatL13S5EtgMfjE9o8S3R
 bXcuSDVpK+LY/I0DTjhNAw7ngvf6EBS2YNNOnfXbTzOYC2xlh9Kqo5jzh+VLRk05GEQ60geEOJR
 gxEZKRztd8bPv9de0D+9PDRcqJyBPfYBYMacWsEMFt8cG1P5SHOga1IhQV72DzDLHVgRMINhdMQ
 HuLSHdhnO4r1354uThA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250046

On 24/11/2026 16:47, Krzysztof Kozlowski wrote:
> On 24/11/2026 11:55, Yadu M G wrote:
>> Seca is a Qualcomm automotive SoC. Document the Seca Ride reference
>> board, which is built on the SecaAU GearVM variant of the SoC where
>> platform resources are managed by firmware through SCMI. The board
>> compatible therefore uses the "secaau" prefix, with "qcom,seca" as the
>> SoC fallback.
>
> Incomplete, missing seca SoC in naming bindings.

Right, v2 adds Seca to qcom-soc.yaml. It also adds "secaau", which
names the firmware-managed (SCMI) automotive variant used by the
qcom,secaau-* compatibles. The commit message explains that naming.

Yadu

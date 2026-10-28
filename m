Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193636;
	b=ZOznL6A6CnLZBrUcT9ykm0keBmWMupDJnP3VyyQxb+rsvvSt12wLOb9eN8uWgHN//NpO
	 1g3rYAt4JTZlUG+F6x+m6Y4h3oRcXDovXNQ6eRBSdh0LVvQ4FrpNXBrq6Ht+gJku+oAc/
	 0hdxSku3HM9Z1ui3ZKEOtyZiNz9zwiQx5zGJ6wFnvtZ5YBxYG+vrqxidLh/dMzk5AEXYU
	 21FTDbF2JuuNaD9vsBTlq1dx3vTy/jOdFY8ueunlKQFZBPwp0FoeF4UCzgSppQI3kRfTi
	 xpOC60Qb/G4E+5nhLvXhsb3haRiKxA9NSjIvg5nJ26zmztH4VbnYcJfY8Y4pldZBArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193636;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
	b=YKEplVti8IxDrOhdtFv5e6zjYeiGoIB24QOg3EZZw9JQDduWzKmmIRLON2SG3CfqXaRr
	 XKax56/+Mieon1kwOFDFy0iTbzr7qno04S35ImXZHXDF2JajlRu39aAlUWvwMaKne/Oe0
	 SqrkGXI93aYgd7lqR5fnUFZ8JgvjG+UM2A4oqh5zuBoEaRU7vV7QRRDHlwF602+y1d61/
	 5C1hjhYh/+VpBYcYcWxyodRpIZFsRFjFk7Jk6SbEG670lU08/EAMEVU0No0Ep0cyL/9qG
	 AUjNiVqVv6/JBHu8oo//M0wlXNLU0lcXdiZianezNb1sHWTzMOfeIzooMhheRH1iXjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5BE0rI4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FngDofrG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5376606A32F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5376606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5BE0rI4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FngDofrG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdq3L137458
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=; b=N5BE0rI44UcfV1FE
	Y1CPquxLO/iZMblydFhDbdqy6Wm+RDCjygga63UP6OZCRgXRklyhQfR+Jl0rpG1v
	veDMj0CRboY6Y88yCki3DoVpPBuskoL+s/jd/iJVokIBUvZ++DVzx3orDntZXFtJ
	MbpKmEsM+x+WuGzPRxMM2rx7irkpaAdqhJbv4Z6TWZaeUtFfZEWXALkuoXDZRtxV
	xUR5nHlMeJHpOVYO/Mxh+AP3lwkM/KHTbnNgGdE90Blu7IpDcjgiX+um9GpC/l+h
	BqEBo1PefKhrc0lpN5aMI4Bo/VrrWDfkrn2w2OLZYfUpg2f90DS5vIxGT9lKNHCt
	N0i6CA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92k89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so72169e0c.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193634; x=1793798434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
        b=FngDofrGM/Qt6TwFYzOFjkmc7Io4MWHX5NG55K7POqrcyzCaAupEt3IrlIzg0N3y2B
         K7b2oMB1AXYYsdZywg0uqcuNFFMSqmfs0J3R7/82H/eoeY7oRb9eNvRbMp3NgfCRRzVC
         6iEy1o4d95ITwj+OW99C9NJt2viL7+VKw9puyBvS9LcH9kaJBUzjiQuMU3/ozCaJQwUs
         QXSAXZgCFi6nvnQSLZHk8XmxBEYlElGa5K0RYouuVKhDC+m3UCn4oJ8dNJQXa2L/FIh7
         kwbLRk2L8fSVw2NZWgCokEmGjDW4R6KASKZF40UWyyXz3TEtZ25HN8jyNNsAELEZcPBW
         Ewow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193634; x=1793798434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
        b=q7L65I1Mnbd61GiwArCPdt8X5AaDpGe4KFEaX6qp0h2paYyf/HZ1Yb6yag6QnVSoo/
         nIBmqFqB+yP6S9a+S83zXZuEb0qMBsZuzl89AO13ORR97Xy4Ef9B4J7w4kfVIEqXtkyy
         M36btCFDAse60Y0powbJEAbvwkdvhTlyaxKO/1mi44O2qQ37f2BZUYjFd5bMvm7p5zcL
         cgVxgryXfUPgiWL4MRBUe6IreBOZyb7TgIl95h/v4wen4R4LC52FtwQXyeiZ4f4MWLlO
         ZX3E4BGwg9oMDPu1A8wwQ4eLfkzRlbuK3FsgSK9xRXizTY0uKgMiZXn+GZ9hwks89H/6
         UTYw==
X-Forwarded-Encrypted: i=1; AKwUvBx/0xPGOklf4zZz0BzIzbgyiZJY0o7o8sQg7ZmUFLMQuvuWFEKtnzQPC811mPU5fx7nzCtJHlOSuoY2@vger.kernel.org
X-Gm-Message-State: AFq9FYJOWmm+lAV0/sYxrw9KlCQ5AtCHXNmzJ+3d/OTsQqfD6OS/95mS
	KaGNaMMFPCPv6LZelUZb2yAofEWInOifHt+NDnmsePlEzql5wtYcWVnWe0+4G5a0yT3kBeJo3bg
	+9K8+6N63xx0LGc53hcc9PgWru9FysbdYVHwjoRdkHeUG2q45+hKhAqSSlGCdE9kL
X-Gm-Gg: AYBFou3gC/1lIrLTkZN6ZGIWJJRKQc3Ao0ngF/vcqCmZv7V1/l6OrmbOHPnfjGSuI3Q
	RI3XdGfawXZ/JVmhBxyy7dSsJr6b0NX0becOB0y4BVE95dLyv9anoLX3Co/vLVRhqGpGQzGP9+H
	o3k54tPVhIE6rP7wHPNC8sQwb+zT4HVGTbUJvKxCLrZX52uRq49vz1ZxslohlFlTjuO1tZvtlOY
	A2zS1yMQFs7dI8ZIsZD5aB7VohuqTRowc395gyDoHqfqCkVe9eJ6sy8e2IHBbN3RVvU6byNYifI
	2S1yCqI4+Nekwyq689bYYLU+oBcUmxx6UX6uCAcYKQl663Mnqba/K9xmHK5wg6SnO3mV5zW8jxw
	AANrzwBsW8r9CHvX+x4Lb+DsxzHrDB9+w+vFW/3IHo7eMavi4gzjEOSREThQ1UaZ+MjyIWyg=
X-Received: by 2002:a05:6122:1a8a:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec4caa71bdmr805401e0c.1.1793193634013;
        Wed, 28 Oct 2026 06:20:34 -0700 (PDT)
X-Received: by 2002:a05:6122:1a8a:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec4caa71bdmr805377e0c.1.1793193633498;
        Wed, 28 Oct 2026 06:20:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca57dc11sm590055e87.33.2026.10.28.06.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:20:32 -0700 (PDT)
Message-ID: <fc444b2d-9bc6-43b0-9054-ba04c7820352@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:20:29 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com, mani@kernel.org
References: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1f6a3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WKNOtjYE1B8OkmgEoC0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX+CwM3ToRTOA7
 wlruJdR7CHI0mwnM0ySdIF/IiMIco15Q2CPViqiVC+VtCN73PEPBSdNYQn8Ns9dr0UTirzES4mY
 ZEvHHOLyc6i0O+NHDUrqcVJVgXz8O74=
X-Proofpoint-GUID: wDXXh3-WfLbUb9Nys08RYXa1BIaGviSa
X-Proofpoint-ORIG-GUID: wDXXh3-WfLbUb9Nys08RYXa1BIaGviSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX67YTyRhD+6EM
 ehgzvqF+ln3qQ6c4sGYJOUMbHbu8rvm6DXHHFbe2zNOCL/QpMQbXkocAC9Xc3VyaKag9alWOJEb
 qHbUfqXzEcH7qj3c3RmckffroxgVWplebmHoeTWmDKCw0O/Kp+gSPrFVLRj4bncUypfI75B4Qj7
 o2J3udpFtBGCnOudLfc1k96n6auIK77TQxixDTAp7yw9BWDdbJQP3rX35kHTXVLvUhG9bkte5wJ
 ZOND4SgkMCuBOggQjhcgiLTHTVpr/KnEYpsIILnyCTCKdkyXVtH3z6DdCOL8XZYugou135eMmY1
 ctkCYhGfb11HgMC3O900c1zUWg4ORxB7Kjb6CNtEuYZW3pNi0QR5+bvw81TSYcFMpx5b0gv9ESn
 G7m94TI/ddGklkrTfY2tfFuy1ex3nj30gL0jfm4Q2s2GfFjd+iCigayD+vVaLqwQ/oDlYBUqGHv
 fPpWo4yUGbG4VvJ80UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 10/28/26 2:14 PM, Monish Chunara wrote:
> The SD card detect signal is active low and requires a defined high
> level when no card is inserted. With the GPIO bias disabled, the
> card-detect input can be left floating and result in spurious
> interrupts.
> 
> Enable the internal pull-up on the SD card detect GPIO to keep the
> signal at a defined level when the card is absent and avoid spurious
> card-detect interrupts.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Fixes: 51fe74e44c69 ("arm64: dts: qcom: glymur-crd: Enable SD card")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

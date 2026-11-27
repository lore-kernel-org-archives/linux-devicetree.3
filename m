Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784083;
	b=JHpQ4pMIwIzNbuhfYpDz7DZqYydFjRNZ/ramDErZx/wphsz2LGboAC6aJT7QLhtsItjl
	 B5iNS7yyMMpmahGKfEyUtP5tyGoEng5NfCsy1ldosUEGXtrUS12Z7x83bSO2anBHUyCWz
	 +YUq3NOC+kkr89gBIYjC37Tg/uWarBei7b2eU4ObEayhVuwdm8eplGOPf6nb+6PLRpBw9
	 8Q1SeVwObisrPVMKVLdB+p6nL7mURVe0upBPEhVHdMqtpIq7Y7EC3bZ1RxvnXIupQsIKx
	 7RGfIiJxo9511bmM4nSy4XcHJpxSQaE4nnZhao502kQQLPtZ9nWNvFf5B26wVBcUpeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
	b=f2PqqalNDP70VzkjEnGGvLksXifEZXlkGDWh30k0hmXa3tCXAPbe708O2u3TvDhv2z55
	 PqHriRq01yS3jLyDJjkJB03LWOBpNlPxEfYPWaycQ8l2A7md0Az0Vdd9Z4V9ewWsgwbJ2
	 OdllFoHGeRHoTckXinHIEe5q/MH8MPB5QEaopFVZJKHhLICpbox3HqmcvyKV/9RNnpBzF
	 rBgXg9+f1a8N2Mb0B0qNKS3RWxwAosNkWEpfee2sAeKvFcW1r1spUjqPGl+CELZYxb1TF
	 wxlhsNAM/CweQCjvNNa4haCtGr1u+9mBhlQXsMEvmvFoP65expu35iY2DZ4vrJvNRNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PIz1R/Qh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/RJQl35";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC74606A336
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC74606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PIz1R/Qh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/RJQl35
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChFiq1803134
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=; b=PIz1R/QhdUpCx97W
	tWM0/xr0ThcMO0YawZmNyMiHAyWJ/hBs5RDKuyLd8tkeQ7h4VbaqSsPs/sYmaSg3
	o2IFqUo5zOfS6w93MD3YB10yItDy7rejlWYWPARD/2o13K5dGoT+WATdk4wTHCRE
	SNeZfImpSbrUR2rg5UIZbyczLM8/N5Q26ZJTGY4s2VVaPE//3qaOSSFcD+xYnyht
	r+aInWF4BQw3KbHtC7a9NQiWO8/t3MgYvSN3i9HrzmTix1iW4hIRiKdi4QgmvVS4
	enCbsYffVPiHwa0tCDNXtigGVGMJnrgDr7iHVQlzmZVt+2yLXHd89FFHA+R+SmX2
	/v5/Ew==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55u11b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:54:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so296799e0c.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795784081; x=1796388881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
        b=X/RJQl35OwXkpBuFVpiHbXoujn4OxURb244259C3upSvs+Kyb6up2BIgvRdaWjv/vs
         trrv6UHlc+xzYKBdRiCUwXDY2WfSasI66D0hVKLHMtgVe9MsNZtARLPpSEO3SSwl46VR
         lngISoaEjIqT1wodpCXnbX+uLzc+SyMop42tZm+9dMlYXeeNI4RMPEyO0FG4aRdNwXU3
         zxPLPvv8RlFeghWKTm7KoSS65Lsf1HYqN4jAItRYerIMgm6Xvlt3NtVxqrvTq4Cavuqj
         S7AMiYUxH5pza1X4uRNNfrlefwq2bfM66X4roc3zlUeJuwIE56SnfNR+NEKHSfudBhH2
         uDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784081; x=1796388881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
        b=PkYU0OIdLZQ5OEWatLmTUq5pnmvQcJUgt7R1+fY68C/EY/O9gHVal0ilA7CF1oIVwf
         tau7n1tntVtQGDdvTF63VFZoEck5mX3wat6R7EZL3zL3FpczHJWSqMXcy2SPopg4/PMJ
         FrOjsQZYwMn20R2DeI5GTvuAR21xCAV8Vbb2WIC3Fphl+KtMZDYiDnlftdzHnEmCASN3
         zWK+Ww5qYSMa4oB28Ag+f+TbabTXfO9iCrocuXhMDQBZqkM6pokMsP+VdjfYpkyrs32S
         9rU+eyM/qAWUhAkCJ+t7wZ8sgxB8rrCNINs3iqlnNx02cL9i4rZJjKAfWL4sCcgjOVAk
         9GNw==
X-Forwarded-Encrypted: i=1; AL+hErFob9JdTrQ6WiOSgH03SgRBWG0FUjhKuQNsQRUBX+GicJ8VG2xriL0XbMEijafpdWHh5TH05ecSP1UB@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q4FQT62n1gLlnoq8cj5nMDB3BGsTGh+pX6krija0lWtld6c8N
	DQgva5ttcOGQgHcpgxUD/kfssM4UyF4NwVqu2VEQJGSOCJRZbo0mGYpU1J/Yew71ozxZH5oTJl4
	3em1/GCmkj9Q+ebfzf3iLT+yYDFLeAisuihQXAdpYAESjG1MEIpU9+C4+9rJGyiP/
X-Gm-Gg: AZFdTZf2Uy5+gSw3C1ArFWQq3MYGEVyvWSiSUaJrO+hd8qnqGGO4JLIMYIYWAsfJd1J
	GFAKzEgvcNaPuabuM80VZxDqEf7ydQwT5o0rWv5jJwGtFlG6EH+4s+YX2l6diB9+BuUqhAwrFcQ
	S3h/ucSkbCwQF7Pb31RwIfUwZxYcnrn8HM7/JDVoNAiIkFyKY1qpsKhj6wFNz863HTNtI+5zNCa
	Sj9r2hwlLKGBJvefQa90pwfnH2G47MZA2GFaavngAQGsRj3BGwXwyGPLrvv51+5hHL1RWOamo3h
	DoKdTxBfP5nIKxE0ZamFOCgWWaHsgT0Qp0J/WAAYm9d86KU1CjRfu7pJAlnpcJooI6INzKp1UjJ
	J9JHItcw3srhbaG5v9VQaqjdRnQBLbR+H8ws0vW2BdBK70aGbcZKGBKl1KebmAFFoCN3pMr8=
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr16430676e0c.4.1795784080745;
        Fri, 27 Nov 2026 04:54:40 -0800 (PST)
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr16430642e0c.4.1795784080301;
        Fri, 27 Nov 2026 04:54:40 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm11126122a12.28.2026.11.27.04.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:54:39 -0800 (PST)
Message-ID: <bebd75e6-3d67-4f1f-8909-f7a9786ce3d6@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:54:36 +0100
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
References: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX7y6LH0CFc4K3
 xMGkgQX7WKGDEzD2AzUPYSEt7LI75qzLTGxDhgbEJk0CyTYwFbwwbWf5BD0arzybJUBOpOr5BYA
 U/yqzKc8vQteJCAMT59U9x6p5PzlrYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX+tf/RDVjDqbX
 jBK11shwOf+wpW+139v5IKtkz2REuwuCEFILdcHXOukL+5Wc0QmBiDKeAWiFMLe3NDUNUWUs2kG
 u+5NodeBtXWvZZTeNJL7oWFZzQkRlEwoy3ihT9TVf/8jAFl8JFG08ePkZBD+3QfbMCQ+B45frSG
 dRzGOcsRqHA0dugPKsIxHG+30/7icBCcP0nT01PrdDh81rakrB3mm/OWaSK5RZLWfVacNjHi8h2
 qahjOtcNddPbxLkuEOJ+bQwnDL2B+altdueafXUREEILMsoSGzne+p8bC11N0tn5ckeRz98ZLtM
 Vhb5EuRdKg8p2GXj1f2lAxQ0irEotHDUx1o4nYQ8Ic5mRgS0pMN/gfS/RoDJQ2Tal/W/Ou/D/Ye
 YPkopdcyNpkHiJoBtjn4Dja7qf6JcEYDnyAvHoPgOqTHxUIlHAf55bPoXD77uIjS8y0rry1kUKv
 ruW+qWrWSVRHY+Asu1Q==
X-Proofpoint-ORIG-GUID: IRXoocgVkhwDNPwcX6FCY8pP2ZrWhXW_
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b097d91 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MsdpSpnpVP8ozw9Nrd0A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: IRXoocgVkhwDNPwcX6FCY8pP2ZrWhXW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270051

On 11/17/26 6:54 AM, Arpit Saini wrote:
> From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> 
> The NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> While 1.65V is within the range accepted by the panel, the power grid
> documentation specifies L12B as a 1.8V rail, so set the minimum to 1.8V
> to match what the hardware is expected to use.
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> Co-developed-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

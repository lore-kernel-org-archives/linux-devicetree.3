Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115545;
	b=OBAZw9NXwV10PTazOplWmgwwvsRtQeATz2fg0YF+5f0mgtbqFOKFMtYY2pCgCJYlVgqk
	 Skn9FfmWrrEbEzMsGh1yyB/lx4zo6gXbepVq7lUPAQdwuc7XfY7iTP7aVa9SVhJorowwE
	 /1m1B5LYuZEYBnCLJYNdDNzw/i9oMCw1iPhQ86k8uJzcPuG+GiVV1hpBKrf4k/oSLqZQE
	 VOpoHLDH8tQV7kMarsn94e237Vudx8Qbl+GnN76iKuaB4GUnLnwLXJt6wvDUD2wApbMSJ
	 MAOMRla21E3xhOE5jo3xydC6SURGTLfe5u0bAgxBDkr8Nr2NdwHe1xbjltDPc5pDkJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
	b=tTyc/7PtoB7BKvF1u68mGgcBc8RNFEqIqepUFot0jnIt89MiLwaQPLsdOwaO9IqBHNtk
	 +eSMgXNwHk/Xc1WnD/PhVLKBt+tKzslu3z22pAYsaujabPRB7V7cPDrYjfqh2FPgMlqZF
	 eu52q2SQMo0YZIyHXpjfQLoS4dm628QB8xA4XUIasvLB9g37zILBcq5Vh54GVjzFs5HVG
	 Zs0dwW8EmqkrpjWc25QwL5xOE03mjp4v431lVWglpyYY7LdQp3ZlGBcOHoB2UlecC+GNb
	 PPsorlAmypQB8MAULt7lDqG091PMC5M7G9Kfusc5T5zsrG/yAW7IzzNlu6qRqYUhv7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8gFv7xz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVyrVSjJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BFE606AA2B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7BFE606AA2B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8gFv7xz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVyrVSjJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL9bi2549212
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cPUuvJa6t5ywKGHuerzirPTG
	KYB+uX1njxJG93Lbo7c=; b=P8gFv7xzUPPnaLk5NNPXANJeFnWlwmzQlk728piM
	J5GWtWXRLSTZRCb+O4F/+8vMULH5fuAOwHn7Jz//o98PxjD70k0JwCKhWCPFVJUF
	FUpVUa7MK/qvikQAOeqIT6zz3lwCnkyYvZtxvuuI0yjNSL+XS+NW0nfxIpYvFMX+
	cbqepRAmlDOve2zgLPTHA75dPamdAWkqLddGYrkoudz/vfafr5RnlkuXHKN2i/D7
	4HJaBt54EgiiUvcnkeYwl0wUM0paYBDJfO5L17St5sQ1D5/ywQs+FCqXvSSzDnE4
	IAp+WQPvDth4/9l8cyXpzdXz94FpRhIPo304+k7Ab85c9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69p9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:39:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so457318485a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115543; x=1793720343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
        b=cVyrVSjJg+ZyvVakVuyRFyV+fmKDb06I34uvSmYJmXvyB3ebXvpd3hxqLf5JSF24MQ
         Aoa/EV4doK1C6vv+bZ7u35vPDt6G8MM9AwDkKWataaiScQUq84+s3/p1wrjLfmXRlqzW
         3gCBW7br8e/ojPzXJBhWImZcxKBOCdP7A5UuNZtxNcn47BViTvHaRg8plhtnAghnhLiT
         nNzLtiJjmBWVOtZNfDnKHtHoxhSgW9rhqo/Ek8bj8wrnfQ6ekalsqJh4IiJYEt8dENtT
         3EMhW81z9T34hu4neq/WB5Rvtp8MJPleuKlWzNA88WjuUcu+FLD5fgrd8aQvPd9MKrp1
         Z9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115543; x=1793720343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
        b=iVieYg8ZF5rrl0yIqkO7lPYKh0U+hIx+OeQNjzPScA2CR1dIsZ3ku+9J5tftHrqSQL
         fyKv2DVfho111qwUtoVW9O3RjBi0ZJggDeI2YBGN8R1ltX7TYj900qKN7PihC3WPHCYu
         sL2qFKIaECuFwwbnTtMd3vwsAlln0y8cl32iyV3IkAO2bVURAsXWSIs7zUU6gG2t94oE
         WZG7mutYd3P+LYwN1SL1Oma0OmObvWxZTRVSnDV7VehLj6zV3BBZkKBThTQz1T0MANnG
         AWAPKrij38856pwPPAS18cKY9X5LiepfybPtTaiVqShK8djdf8IuSefVWgeL09g8D2vS
         /wEA==
X-Forwarded-Encrypted: i=1; AKwUvBzmxgvkX3xdygtiPQC/5HUcLB8a0pYTnwJR522YG1oD17zHCwXbRNWhp1VpSPVJp7PMMF6l+qwutLBi@vger.kernel.org
X-Gm-Message-State: AFq9FYJm5zmHEAv9lW3gnPq5F/1GepXLtnN8MFcYaOaLsX5XwFNXGIei
	t5wfJMh6Z8vKdAQ9fIWm5sgRCAg9ynY71kSsFlNu8a5HCYWCoC+N33reQlxNk00hH2j6/QE7w1M
	3CZCUE0EDmpTkyfhWzzUvFG3zDgWawfJsJ1TQYpwZxUAMYhkw14aNedIN06X9v9ja
X-Gm-Gg: AYBFou1HLb/wm85to+Q1DBnmnG8Ctd/ib3BfjoEN9Z/FHoK1+F4zFTkViYcZejF7Jtz
	LqKUFHyHJ5Bcab81CxPEknE3CPMWTOluYRLHogKDNxokQXB8SIunTZMSbbL/3dJKjGTFhYeSdqq
	ww4I25GUJ/b4NpojCmzUo2B6VeStHBmH+xdM8bWsBLf0Cu7TqDTnAPmfWi503CfpiyugkuIhbFk
	2dfG0v0YXVoDmK/1DbF2IB+68ZFts+mzNj3P1mvNtV9tQnWnbcraZuzm2fLlSbBcjabnqYtI+6m
	jcNq9wqCJmmkdWAKoA4Hc5SL/sUEtQyCF1VteTiTGvf1Y732h4Ow94IfZsLs3bwZ92AETdHxNZo
	4+cPlptVkx5jNIga8
X-Received: by 2002:a05:620a:4542:b0:93f:2bc8:283d with SMTP id af79cd13be357-940ef95fe8bmr1459354585a.47.1793115542425;
        Tue, 27 Oct 2026 08:39:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:2bc8:283d with SMTP id af79cd13be357-940ef95fe8bmr1459347385a.47.1793115541726;
        Tue, 27 Oct 2026 08:39:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm23240126f8f.4.2026.10.27.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:39:00 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:38:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
Message-ID: <gdo6dqplzniqwxpk5dlkghn5ha2vh7staziddoa7frxhxfqj3h@6urgosis4rgn>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0c597 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4MzwNv8qEO_iqFDzjXMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XzyGpTs5qjZ889uARw8qAx09mQiv8sQM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfXz9WDf/4pxe8L
 K7/2W39f37naitVArFW/6hpeXsLRaIt815o4BZSPmQMiWiw+w5jrZ3DfMTg+YB6rVsyuJjL8RzO
 QKvD3umYKYAFf9iOFTbnWmCh0gEepI8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX/M4sBJ0DYRsw
 ZZM2J2dTjT7eT/62yMyLvSFqpU6xcgbG+HSA2Sbohzr9Po4WRkxtEg11L34xV+zEod/vI84PKYZ
 qrIy+4MjqbEyPw9DdoflxweiYMWy0sPbFtdq/im+lL3uoLDdrHGjbI5LoT1RKBvgvAT0ow836E+
 eHnjtANECfiluby4tFesAUQa7p1sfuUhiOmF5+F7tMks6fJjKrM3owSmqIs7HynMNXJdWoXHMdA
 a8TWqXYnJ9vooG6wrx1XxxpXZ7P51L+9L8Clgbok3TN3Ad8P4sWDHnOVy9mZjgfkXUca69DLCiH
 JNiVr+5xnrsoKqZvLkBMf7lrtxKaAh+xLkV1O8y57jr3RKhFqXk7Zz6vJ9Xr09Pu4eI7Q5qwNXY
 BDAWpLzkEHYjxMXhRQBKOx4L4J25YduPJ9cptmrKnly5+h8wpItSjD62mcQteK90PsQpUBjclq3
 5HFAx9TW+HUxLgsnL4Q==
X-Proofpoint-ORIG-GUID: XzyGpTs5qjZ889uARw8qAx09mQiv8sQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270062

On 26-10-27 17:19:55, Sivansh Gupta wrote:
> Add initial device tree support for Mahua QCB. Mahua QCB is a variant
> of Glymur QCB but using Mahua SoC instead of Glymur SoC.
> Mahua is a 12 core derivative of Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads, power
> measurements and oscilloscope-based hardware validation.
> 
> Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
> adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
> nodes.
> 
> Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

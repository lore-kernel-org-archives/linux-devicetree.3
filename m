Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9AE3911CA
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766270; cv=none; b=i1OECA7MD9k9JEz/catlZ7zPi5mn5WZAf15SKQIHPj1h17rUFv73dzL+Y5cOVb99hj+GJXxNOa6U1tBRaQsuzrJBlHoxz0q/pTszR4DyQBul/Z0LiRv+zWPfoD6ozZjd51g00Q9DlFHYg6JwZNqc926FQ2V3PyuvvXlM5Geo4HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766270; c=relaxed/simple;
	bh=WHjYXjStzMmqMyYH9wOSdVai7dC1PDsS7igyYe9Q38A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APoWAytGjnRCQC5K7q3YLkzlBhakZMenZGjF9SZUsrqRMQPKJznFwYIpS8qbCJL7fhTQTMZlspVfJnxe4s6+57CA9QhA3+YYn4pCpjChPGPa/xgX0pK8KHQobgTsbb3gRHo0qF/+XZC9Y1s4OUjDXOxq//SG8qsqGRR6hFZ2Ti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGXBYoyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4Ii6t0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGXBYoyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4Ii6t0Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWG52432992
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MB1YFkf6eCm9O8OWocrq35QgOGGFbKE3tag7uTxWMg=; b=LGXBYoyu6Eos3XqK
	peeGPyxpgcYpLPn7o+NSKH9XIlreVoO821DyZ7Xfp3HKQ5iVEiIONUSsAngQkUdH
	Stn2JSJ+AYa4DYGR089XZ+Z29mlGjSAcd1AFiqJhmCylEl5jZIMm+n4UsXAf8Y20
	76ek2ZmdRjkELmmsRoZAe3zuTXM4XXT3E4AOQwp/AYFXt0u+2InxLR8hmhaRA6mW
	/Qwm2DPBE2ZQ57yOXUjPslYkEKMxi26DCSmr2vxQRIjyy7J8KFEpcUp+R+rhjayE
	ZlE224avAWU2KObjtOlQ5Rb55+sPV/JJhneRx83qko0qwoE54+MgEK/Sri2vO+U8
	H/O4PQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn1ufu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bc8d92ce52so15391137.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766261; x=1791371061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MB1YFkf6eCm9O8OWocrq35QgOGGFbKE3tag7uTxWMg=;
        b=H4Ii6t0Y/Li6DsNKakhlH6rFgZ4nU6jRILuwfZzUp7hc2vp+HVC4ppdOC7LAQltp/B
         kGw1H4yHoXWJhWigsDibupippM1JkXf3jaq4k6yiQZ/ZnE7bylSAwUshZwzWtOZZdpSJ
         jJoDsKzikNNSzP7neVXuHFhnXDyhPv4btmiVbRaqco8TH8wn/3OA2RGI/Oe3iyRcAWUj
         FcLqU+8cJp+Ur/7SUMJBod0D1BC1SuilBRVBdxGCysqFKtZK+A/YVXZEgH6aRH4+hAuG
         fGdivoctpxZCDq8BmBFaNSnF58EivUatQQLWOs2WTLb97d/zOuqFWGhcF8DjQqF3vs6J
         m7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766261; x=1791371061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MB1YFkf6eCm9O8OWocrq35QgOGGFbKE3tag7uTxWMg=;
        b=urvmyDuc4CSGgaNV0sBao8uMMK7YQrI0yg2Nxm/E0iwugl+PqaSu5H6RfSyz8MMjdE
         Bdttw6nD6CYTOsNmbtH33JHox3bgnTh2eUtHTbcCXRRHvZ1J9Q9rFaOPd+tKeM8juKso
         oKJBwBUgVXlRMI6l5dTwSBeDX6iU/Qe4tLBhUjmFxAXjS63ZqPBPhOaUTlyb2qDt39n8
         sdzC5xye+OZI4QRtnMsXJIUWKIhkYlFx3irLgtCnL0wVEqOrH20KR5lEhXqPrzSzpKBz
         nnPtedT5oL9JVOixMIM5Kq0SOgS+hgsucbG1nBjCQZ+ilZs/0c2pQ5oYaS8hwD6XC17B
         UIQA==
X-Forwarded-Encrypted: i=1; AKwUvBwkKo2N6m4FBZE4l4nI5Pe2kiGU7QRo65zTR6Wf9Imxqy/QksMswAqsAE3dmdPVFed7bMwLgY4ghKCT@vger.kernel.org
X-Gm-Message-State: AFq9FYI0perAoeS0cC6FTol/G0UMKXQ0tRDX7d2VYqhSxJDkD3eFFAbA
	M/Su2aCaxMjOE7//yJY0WTzWKkUkz9tyx9iEaYkLCw629letAyCl/Xgc165xjOCGBzPDQkYgCvX
	mDwk3oyDFpKQzeTHwyr3YsAU+qHlen3Qag7uL5uBD9r6Fq/brrxT7u6ncZ7hWt2yJ
X-Gm-Gg: AYBFou3Y0Acji60tyQHmqtBeaws9o9QWn0JrxHimWnMp7O5efe0imfCHfUMwLf7hGoU
	oewF3GlaiL+vkJdIcNbMy7aMY09Kf5VOmD4CnEq+fcOUBtpuQonXEyDFi17JsgtUEw3gSuySQrG
	vRG0Czu0WAJwOcSDiuOU9Qf/SgWSB9+DKZ0zGAoZRg/afbgtjcexNwFxtRT6osjaXRidAijGmXz
	RbzNjzmvEHcI3E5VKg1Uk4ZInzcb8H+/k63UuFoPiYrSOQf8Szi2BjdbfG2Ah0/1rGBKY3q/NS+
	QMrPtS6COHkcuPjkYw3mScB1DcSXN1MzLDfxb4dzEFvoLyEvanWEuUqyLGqoWvyJSeIVHO6qDkI
	1J+wV/I5E7KLNv2Pi9AfGWg==
X-Received: by 2002:a67:e717:0:b0:7ae:c2ca:8d6 with SMTP id ada2fe7eead31-7be61e8f5a6mr105404137.1.1790766261254;
        Wed, 30 Sep 2026 04:04:21 -0700 (PDT)
X-Received: by 2002:a67:e717:0:b0:7ae:c2ca:8d6 with SMTP id ada2fe7eead31-7be61e8f5a6mr105388137.1.1790766260792;
        Wed, 30 Sep 2026 04:04:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7ea6fsm47420566b.40.2026.09.30.04.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:20 -0700 (PDT)
Message-ID: <35b1e5d4-8b52-4403-8f16-735caa21d26c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/15] arm64: dts: qcom: hawi: Add CCI definitions for
 Hawi
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-8-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-8-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcecb6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=H9GO2F0ABltwggOLjD4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: HHlrS12IuWG9a8822qJbHst1FHF3Ztwl
X-Proofpoint-GUID: HHlrS12IuWG9a8822qJbHst1FHF3Ztwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX9B3Sx3MCyc4c
 JbinP7u7nPsDGh3+Ha0Ya1AekLwNyVOa+1Yw0pQrZtIbPucviTVIS5yUMLNlCntxSvC7ukAWtle
 NsLfOmlNf4T7G0BlqkhvEKYiCYQYnI9/eRYk2I7jzmVST8Cx5uu5m9x8N+LpplcYx0vHPWoRoNT
 gfzmN/WS2AvxCsBQYl0UHL2t2uKHa0ikSD/RLXMmQNn1dEo4vXTEIrvAF2UyfuE1nG0cddkYIej
 8xQbjjsdaS9AA4p8RTFotvA1e+q2k19+FJfTnkMcUmUDi5AJ7NwBRRobcsOt6KJtXtAcf03YW4g
 Kr1PLeatV4EX8mRghYD2+r7pAYTh3+jRxArGA6rnq1AxeLMJukxbtCw5naOhyiM3DmZ7inQN0Ja
 8nsryLCUBKCz9by/i9yx2WtJiTEVPQQ1A61tCU+qLC53WJpkg6EqCEuQA/sgLx8M8/bMZhktzWb
 DWfViivgR8MIpfrLApw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX3bgsv4S0nmog
 ELzG4iaNum8jfyCLxAHeNDIEXjGnnjfwwKQZwKMZkrVgKcsrJK7vYMOkcDDUqKO0LK/SezX7J7h
 6bz2CKiKwZVDhi2s4vI3aMNqEcOib4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Qualcomm Hawi SoC has three Camera Control Interface (CCI). Each
> controller contains two I2C hosts.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9093603D8
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168697; cv=none; b=uNEGJBE4zOWCj0o5FD8ffVPG6h0ooN6wbkOwp4/B+UJshe5eWYt1F6+ZPH/vi46gMIwnSGZJwur1VY3hTguftg8acWoOwRM0pwuW27y1S//l2NZj+OEEql26fG1dRgJo1HLr3O1sFgYW3DcBDcVoHm7OFCUhijyFCDmZTdpuMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168697; c=relaxed/simple;
	bh=Ah7Hp7ftJHUPWtLQZ0o+NHG8g+aUB0BccvnJf0PTTVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoWdteRKwhT3hf8cAmbhz6HpilXGB0JDiJtIoKpm9abamyOW8YQU/SANWYUcyXVh4HIbnvxi/lcKmwxMxKR2kxmsVTzzQx/OUGsswgN4qIAcRo1iPTw56Ietrrm677cIYfvIL4mfZ+MTEDTmytcy1gVYZ4Q2vAnGHqenYs5YnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcH+PdUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPNQeGhz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcH+PdUQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPNQeGhz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GIFD3791680
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42ytVJQyLSNNdfS3jOnCdpT27ZxKZp4RInVBR5BAPyY=; b=GcH+PdUQYWcC35Tn
	4/cw48A6pCYIIrrLVRliK1ncR5ScUg2SJiV3W1X9JcJNeioridAgQBiZkWK9T2gt
	Ax3JO8tf1mIDXdXx9d/8dqFCcZmoPsHdBafeeBxiojm/nED+uMIAPW6uBo72qWG7
	J74/qMV6VqbpnYSXqoj1Tn6qY/j8evBVdNVt05muRfQ/gtm7hAP+A3Ib+9PMdL5Z
	rAv7aHXObo7bBozu8nrUorD7Iq5JMfiA3AsTb++oL8EUOSCcIzbfzrppXHswPIav
	2DJ7atJYa3TUr2ToMEPZrqZJsyds2JTuSjM4hmdxd4xdSgH7T2iYdFLVs+n4pfQW
	oRwqPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702mr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:04:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177b12d7bbso14426101cf.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168694; x=1781773494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42ytVJQyLSNNdfS3jOnCdpT27ZxKZp4RInVBR5BAPyY=;
        b=dPNQeGhz5gb0rphKRglGqAqpVRZQ5KeOZx1Mi+q2NcRCuVlFIA5bAGybUqM9ieM0zd
         1SsrMpSdhesEax5ydNWj2Vu+bWDHQpygcguKrZx3ysWeaVfHm1ruiXzneEBBmFT7F+Gr
         PqJjP7swQNy2GBGKRbiyPHByxpG9+A1FyHqYP5eSe5AFJiQN/C/OV+r7OmeseuR0ESGy
         5++1Qjzo3Bw1BuyEw99KRJNqTIJISWVtDPjS6AFUgBCBQntKiwR83zVjpGgttPPgyVOK
         k0aed6kSGx0Oy4UU89yOJEc9kiNROpEAYOs+njIQYYhfV6S3WLBMFFHk6UsBmCwNU9zc
         K3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168694; x=1781773494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42ytVJQyLSNNdfS3jOnCdpT27ZxKZp4RInVBR5BAPyY=;
        b=pZiDbNVS/CneWwHy8fR2HgrwsarT8LB/TfX+9uNwNqbgKdmNwm8nIjJOEpntnhFWme
         /dUhaSNmXyK8s9wEgmLLapNSWjFBotCFdWZrdFuRnJquSn0dc8G4uBWir83Mmgg1ru3s
         C3+ginvSuPn9idrUbP1cb52Xmr+cEiR2b2M7OpFuOQYGBTMQfC0hTm3bnksJuGYkj5BA
         3HkkvViFhQotzxvkgn/EFtMec1B6ro6HxdqAOAwUAe/kUhwbEoknPwO3Kti668LH4G1S
         IS3a8Xg72gOJd95VYrRe5BlgZcX0OQpSyPep0YBkJ2twwAQHUkm8Paf1M2DWLHdvxHtV
         SEWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zrSZVUx5gLnpsps04Jb5IEOl3LlivBlWcShulCGZ674k+AU2FeqnnH4n+0eeoqv9/JJriM5Qi0J8w@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4LgRXnhwJ/lZxgJYZ6cfTzcPOnoDJMJpDufaZOluv1Qp+U1qT
	LICzMM4rZv53se/xrapF0gl9s7LMDHThyKaB7wgYrKvG8qBr7hBNVX60bpKCRMWVRH6QAhAI6hF
	FH4IHEmXdMsVOnZIWsMAPTpugtdBZJLnJlJjSHguz6+rtCsF0O0Ov+ss+jK9CpGm6
X-Gm-Gg: Acq92OF0OUxQIkpEVoedEkJBOmg/DQFCTp1WOHQ6ahhDXhdDUbmNfvUT0ltdDrOm8HK
	h0qK1bLDTSczQoqYOwoHTGJSnV/4CSGDu1UGiT6M0HqCVraDYgRyC3n4tbCWsC2WTflByv9KURI
	GLkJ/SIL3nZVxtSupM4U/aBSDycXyIzoQ6Y/J5EinC5dH9wiKhrxHgZ01lAcIOTChrvMmCqrcrk
	8VRW5s/lFcYpn3HcEZkPWwMbqeNbb2XetjNa37GtV89mInZIZbPQtXNL0KclGUDYOdLSf2rfWpA
	3agchNMGOaI6oHaMAlTp5Hx+0wfZKZe+Gy1DrmbhU6NzdVB6r3Jx91gioHD2foV1XBZVi797l+W
	SWEl0Wd22Wu8UBLZVDs5nR+92rPQxcTkCudeDn/+JyRh+ZXrHfe+A1RZi
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr16805001cf.7.1781168694214;
        Thu, 11 Jun 2026 02:04:54 -0700 (PDT)
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr16804711cf.7.1781168693670;
        Thu, 11 Jun 2026 02:04:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb668c9f4sm35813866b.56.2026.06.11.02.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:04:52 -0700 (PDT)
Message-ID: <1cc052aa-8274-4560-886d-2b821715aa0d@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:04:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-1-d96a91d5b99e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-1-d96a91d5b99e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfXw3vgTIqm7XuY
 LNI/l9OxvnXIltlhzI60SYIt3JSEUYENz3E41lp5LVpIjwqH04Quc5WKMaUiM2DoTZ9ztIa1Ks0
 WFLVR0St2szWzaLUrkdhelXMRdSYI6Q+OGECP+UgCfLzJkRoNs/AgGCTqXaWeX7GgsxL0i7U9xj
 XkVXS+xZPz8OUfuCfyYGM4apaAyhGWxsXMYhLsWPF5yr6HQeIfuX/RRVSlGzfY2TtZ1f+FuAsG4
 ZgasypKlcJ9xugPZdZsRjqRKsfIx0s5+RFDyMAOCMNC3B3aj/LNpcNvdFZqH4qNqrjrxRJ0rBLm
 ti6uVapuaWo5vD6/2uWc0m1vv7zDe7E2fTB+0ZFAChpB68WmbkKGc9AmLI0GXl35M6mXa+GveHL
 8l6nO0vi4FwXHhXGMszqPCpyP2C18yD89eVvoKLlgG+j64JBWlF2ZnildYRadqReqWE3c/5fTF0
 Xlxpgc6cHpRLnRp1eJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfXzplLp2SFmENE
 jxa56d8EXTsx/4W5Vlm/q+UND4p6ChQoJpfHzu2H2pTseF6kQVWfVySu0cJzobLNRSe1VFbDA8e
 P63seU7NzphAsENrKC+cK34D7weM/ms=
X-Proofpoint-GUID: wcZb3I6msWYEfY2Ym6y5nUNHP-0A2wdY
X-Proofpoint-ORIG-GUID: wcZb3I6msWYEfY2Ym6y5nUNHP-0A2wdY
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a7a37 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NMBPdCelTQKdMlTKoVgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110089

On 6/11/26 11:03 AM, Kathiravan Thirumoorthy wrote:
> As per the REFGEN IP team, this block supplies the reference current to
> the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
> to match with the HW behavior.
> 
> Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

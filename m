Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB27377000
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499983; cv=none; b=Rb7CAls2GaDp82xOK++q0wqY0AQVVby6dzjbfK0vEL+XYNTeaS8TBJcZ84T6PX0ZgKkqcrweu5p4fPW/RZt6YWLZZ3XzJv/HUJu9VXAU9LqFdEb5XErVPRRe9yKtbeaXC0EFG9EnoNV28fh8rcOXzc1JEEi92c1K6sUrsX66EIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499983; c=relaxed/simple;
	bh=noclX/RymRW2NkxukjcocB9/8FFYFplVWyQzzJOzt1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fN5CNyJWp+3YpyVuOM65VyZevM21t60XZgqkuSp4CEQSXLcKuyG45vgNhPg/U8Tl3UcaddOwgHNpLqUGDMQUqO50rpM/0aMit71XmgS5HGGGmqCegFtyv0gh7Lp5rmMa6QZypzAGirdY/iaXcWhr+LfOUNqVgECUYtPW4RzNSDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjGecIuj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZ6LplzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjGecIuj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZ6LplzX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9IN2O652808
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XQLblkDWAWxW/czf9my+DUwdl3Nm8gQabtsWaYe3ZA=; b=QjGecIujEqxvh13V
	7uYpTKxcWv5Okyh65JE3wnjewqEaWohzf6zq+8aZcHlwnvjuiOyJsd84cNBYd20/
	iBIQ4Sg+rlj3Unmvl1bP0fJ6HencNR+aRlW8N2BsbHsMXuPDFOSt43NgQRKT3DBt
	kTv17shPaGoPR7mShiC6bRJRGNeJDuIUv02LNAm1CxPkHwMfFbq0ApcjTf/w8Eoe
	lNKM43QVOIGHYsDi8LBwJ5Jyy8RvMBoaLnfeMTNMMXhbCN1G2BaWJ9Ay0pyj5G94
	T8cajFjMqFinu7M/joWDqXIlK2AqZTHCBX9ehBh5mg/d73QNt/7+b0dMbyY1PKIQ
	GvqHJA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9hjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:46:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575b631c698so33282e0c.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778499978; x=1779104778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XQLblkDWAWxW/czf9my+DUwdl3Nm8gQabtsWaYe3ZA=;
        b=UZ6LplzX9mRVZNemrQ/9ZguqrjQ3sRGYW+DYQpecUC+SCoAiRbZK2GLHTTqBKGc03P
         RCTLZ/i5YzwB/VsXsIrDNMWlFff5fWdSwD2eMLFCC4Mgv6ngIXfNMSnmId/Ceu7YvSMz
         zTkl232irHfhq3Ft9yyXXo7jPZ85wm4Hk3jLsoLRJ8P680mlDJDpVLOrsrRaNFbuxKb5
         CEnw4jaFlAqwoYIqKJNgRPL+svQi4B3SWga1jLpsQt1PvMZG1MDm6RIozzWfn8zZFl2/
         KBDfa+b+qTgo/JEtbH+hxdhAXVjaxZomGhYZsH7Y9fJEASqJzKOcT5xUz9CB6/01nZbf
         /GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499978; x=1779104778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XQLblkDWAWxW/czf9my+DUwdl3Nm8gQabtsWaYe3ZA=;
        b=aQoETR/jYcy5eGngvLlrYZFK+HnaHFk2jYYB3HkVl05hQBjCuoqmZylGgMSsT6FfWe
         3p1pUJ7cjpw4Bg+As/fs50sx3/J1AXJHrDYieFNsiX93D0cq6W26EVY2Vmsck3U5isaa
         C35Rfi5SqMr8N1apAk7ArRTDkGC6Y3hofNbysNINLf9nuugabT34qM9uWAPhau8X9bqY
         WEhFh6DjDm3SNKcuxisMzStk0n/i4WBDU8SpvFvuexfrzSXm5sWOAwffRbBvtiIjASCG
         NGx5E33kdK/gu0P2kCMixGPegsvV4oMkGgFC8rXDd1I/bP5+PoeRiHQMJJflvXj3uzaW
         ggig==
X-Forwarded-Encrypted: i=1; AFNElJ8vl5omwQ0A67+b9yTfsnmJvgSx7AbPDVXv6ac0DSaGARBP2hEQ5AhbedWNaZhbR8VTpPwHpbU4TXjd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr5sw7olcSJ+eUmfLv8dkPwKBtrwyo48H0o2Sk2SScjpA16C4O
	lMgTl+55fi2nleVZkk4uW4xu1Lsiu6vLXAaMWxM85J3x3qMM/fTrxOlgknTCXIFSsUdn3wUX5hl
	NIyls6nr0u2+bwKswZrTP+yhrNX3N8D8lNQDYLts5yA8PMiyc2FUtJuqZj4XVxk5P
X-Gm-Gg: Acq92OHmGQDv7azooYJnaRTw0I1EEO34PewSxehOPRV3sg0mNd6Atb+B2piKNPrM9EV
	r7FangqvDUU2GOSGHBH+EY9gJ3/tVs2eUpxt+t4mhJVhPvj2f9VkB6tusgzdT+PzzcDoEpKOh9w
	cjck4tTNk0df3fhTllkI4TVxNni8Sh5SaubCS8JN/BqMMTFgryvb0SniREDvivPPikwC8C04XnN
	gLyma3GJrdUw8zhW0iUtomJhxGNkS1Vng1ktqJVtxEs2ft9Ntws5QRNJPYo7ZG8YHxpNPgc7sqm
	7Zdy1OjUPUfxhVDFJpK1TdmO1pZPQkZUqe2twe8BRmnY3q9GDWVDz0WjNMHgLN/hUZmXnxQMoym
	uVFpxTOCL0JbN0D7OSRZjO15BwjSRVz6PeTrwCD6zSGUGJW4bNiODHvt3I/sNhLFtPjctPl95ox
	v8NWk=
X-Received: by 2002:ac5:cd48:0:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-5755b4af80emr3913502e0c.3.1778499978119;
        Mon, 11 May 2026 04:46:18 -0700 (PDT)
X-Received: by 2002:ac5:cd48:0:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-5755b4af80emr3913486e0c.3.1778499977719;
        Mon, 11 May 2026 04:46:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd026b13c3esm125481566b.27.2026.05.11.04.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:46:17 -0700 (PDT)
Message-ID: <80632a9e-1d78-4805-bc36-19616ec1e185@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:46:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: milos-fairphone-fp6: add supply
 for Hall Effect sensor
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
 <20260508-gpiokeys-vdd-supply-v1-4-0bb32e8e6428@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-4-0bb32e8e6428@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01c18b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=OHetYUf0uXX_Db3cnu4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzMCBTYWx0ZWRfX3igQyHfm7722
 zL0FlpYuKVRgX8yJfFyWTksUMpI5uAhrIay/hd213fGPGedVuY5K0RsFEtRU9gf+zgd6dketo4s
 lz/apdA1A35VaoAiMCWPcrKnH9f56m5wdOwiIAuOSh58RTnDxCxlLpGxm7XpIyPbBK0vTZfwda4
 OtVfPr/hpsnnI1g7IEg0bOIS+Ck8qpP/P21helOwODMRek3NwYLh9ZGGwrbmhZ7q+kjziV3TOPD
 JbnXnId5aNmUazzoISc4quwmtCyfD4LLMtglVXF9qYk49RQ+76z9QFroh9eHcvmOrz1KscluL/6
 /Yw7pVv/kV9Kz5Zq8wgMBEHnxmN2O76TBpHav0BJuYJuWfjvF3buy5ZatOE/bphBmn5Ua2jjsYJ
 s/A+Ob+3FPnDSB76Hu6fgGAasauRpafYoQzJvoo5o+DIOjN/lfP8YOY+iV3CfrZIzfJ5atEr63S
 TyN3dqSFgP8M7F+kZ4A==
X-Proofpoint-ORIG-GUID: z8ZVgWPUab0IKSilhvQYNO-SbUzjbJdG
X-Proofpoint-GUID: z8ZVgWPUab0IKSilhvQYNO-SbUzjbJdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110130

On 5/8/26 2:53 PM, Griffin Kroah-Hartman wrote:
> Add vdd-supply for the Hall Effect sensor in gpio-keys so that power for
> the sensor will be enabled when it's in use.
> 
> With this, we can drop the regulator-always-on for vreg_l10b.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Modulo whatever the supply name ends up being:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for shaving this yak!

Konrad

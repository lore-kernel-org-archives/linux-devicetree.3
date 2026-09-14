Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C843A1A54
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383665; cv=none; b=I73NVpDuHzjqsoBfLNv8Cqaphi9FmZXKDLPCx3syRX+q/jm9XUvXurus4qtxnD85yRiOQqCbNqIwZ4ZaIfo+ZOsV8Dry0iOJ/CYU0Osse19AWsFgEAXJZrH44Gk/RjQfDCd6t0gTENnG7oymUGiB8xpEdIAHM/mhUAhjxnJCGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383665; c=relaxed/simple;
	bh=99AvjImape4FlYCaQosf9u1laFEzTnvjo0pR4t5IDPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjQYWdn8CIjfFDjKfTiJC9uJt8d09VIzH3UmxUmpRPMlkUtVyBZVskmI+/tPG/+ZmRtzgEr3doYZtq9PCsMmJy/1wcENj1caFT0SAaCctlcKKGlrFXMlY3K57L6eJTVR6CkBN8io0NOOGok3i+mk2YrdwZ1JhwMNvV/WV6tOMQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaRPhCbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVKCCCO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaRPhCbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVKCCCO9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlw1k3860377
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=; b=WaRPhCbGKOmI9/JS
	xodI7wE4EQAmRD/s9VAGw1HTtFF3bvoerOhpJNC4AehgpMxSQmtJlQce7sj/e1CR
	OU7qNSLARs2ZuucZCKSw68FROqcf4LEAnp2IRzeGCLaknj7E0JzGD3TN/I5BKYX7
	X+AX5mLP8XzwuCzx6rEyN2jAzR3t2ZujP9QP8IwpWhIKpEaleEkNRYA+8Hj73jXH
	Q3gNB5ytrnNOpIwsuVsOWVvI1/yN7L0n9LXkwtl8YgISfPQfyNJ2dJY0BZ/l4i6l
	Rk/A3M1LM0t4+22x/xgDJ5E5uMVag1dF4MgLNY65sfBJbt5fMue9b/cDT3nxHmEK
	nPPuZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0nhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:00:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f8e7ff71so35205185a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383658; x=1789988458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=;
        b=EVKCCCO97p4mmDg+bfro2NU/MuEoCDbLEU3sUs8B0Crp8k4mLR6fTxTZxNt4eW2M2h
         OP7YSjpFqgVqrg2sQiIKxwWS/UqBkqbtT5iTi3sVdyc4cCEVBg3EAhjEMJtGuHifNh5C
         1oMXjnb1GKd6QQBHWl/C7d8+pp0qBqjGO34FNkVZMGJgNv1YFRW0lIyIZbttkjyDQY6T
         vjdtfX7t7MpzboO1T4Uq3CIjONr2+TpfgzK0MFadTS67OsvIVeZibVysbHCRBAf8DPdr
         yoyvaxmT4Itp7g1t8PWOFIXHlEkr1zMsH4cmFvm94AGuY85HJCs5B85FXe9aEA1TweNk
         lJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383658; x=1789988458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=;
        b=bqQPXqZb4leP1SeNxIcdL3F/a/Ph4S1rmyKTxHoNrBi/6L7NEjHX1uzDXzMSe1SwmZ
         1lBusAReQWrwE6BN2EyBXCBrxzecKZtxQLOMEqkcOPgLZiexJkAj3158YpD90oNKfE+b
         NOvvGSA+6Y7a/rioMoyopb2hVbs3Ic15ftvcrRBhuUqDipC1m96LV/a53c4IygaI1RGK
         6y6czS6yRlGJmOX5BKtEa1YE9FNvYxxz4osEH2NgThhtiKxJJ7kPI4HAFOISbvcMlBHo
         Ti5yDoyAEiaQIh7FXlu9gldDD9oZ7YHP3fsWqAc04m8eBz72DZaIOOS8UH1IS1Ybjqic
         P0eA==
X-Forwarded-Encrypted: i=1; AKwUvBxvyOAH9+kRn0RzEitBfwi9Xun6ThHOIMdgp0mHHfTGNhickPUXyGvInTRvhcewGckeV2XKlPaM1WLR@vger.kernel.org
X-Gm-Message-State: AFuF++mjPGQOkKER9OWnqC7TbeDjByfr/PQFMxdXTX1xLwBNawVxjRyu
	dnW0PvVV8vq6lgG6dcWSt205N3UplwWgsdXWlAODBi7hrwc6RAPUsHnPlmP9SS6scgfyzTupkzR
	KAQD6EN2Evu7z/oynkjaA5aXGxl6dYO5UOaj9AodyUF6GTDFtkKmGS2Lc8dSUau2n
X-Gm-Gg: AYBFou02J5s2qe0To0ERAbgg44E2/srLKWwm46KIWHlw5YCHGOrNf74/O2DpsTnK4ZK
	7/5fd5HfLJ1q7H0/rBgfQA1eyny8uTBby9EAyg3u7mvun8QlZL9SOY/fGmM5+w/pggG9E4EnNjb
	ZZDQ65wL8+Kek8J4Ar/p6w1pBP7Rin7lwwfm5vwiL3EdcgTx1zc262JDjJ8rFy3gJyudNsyGOg2
	SKhGbAPUhpMM7j3kXBk3KIdQIc4GJirlPMNNifADMBbziEA39ixxDbEa6ndUknC1V8gEGlsOJKy
	hMdJd/2K+3M2+68snBihdDHTbJwGWUF62my2SB0rTHjFFC721vkaQHPiGI2qP40Ai6iEmNKTazS
	nJx9V/+bSAoxlT997pOj+UQ==
X-Received: by 2002:a05:620a:170d:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93a29cd92d9mr263325485a.6.1789383658002;
        Mon, 14 Sep 2026 04:00:58 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93a29cd92d9mr263318485a.6.1789383657547;
        Mon, 14 Sep 2026 04:00:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219d0sm407548066b.18.2026.09.14.04.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:00:56 -0700 (PDT)
Message-ID: <036480ca-6308-4e36-88ef-3af743a85f28@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:00:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/34] arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move
 PCIe phy and GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TmR_zLDDL8RY7fLYG3ZxN6QS95ILI98Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXzBG4qxIBNtsY
 ud6fuXkeJyS8EWdMIJRvtk4rTMMhbza+ELgTEMLc9BWnlFmaOvvb0FI050DH+NFz0f5tRdZjUpj
 G2JOYOFuDpfyD2jLA7HPtKe3YlHQva4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX8Hzd31hR50Uv
 kB63tTwW3uYAIsFAVO5SVxV3IJp/4fXUVFwTm7E9kIcqGcXbaKGniMrndUrYx496wAhH/w6SQfr
 MZu07ddoGuuD9c1msdKSUJPYuaSCji7TI59y5Yc97vogEVHYjYqAUmmt1kI2Bc/R+Iq1cMOOOwG
 POTjnHB8L50R0UVZiADTKLxDCgI7NcrEHaafXKVWlEKi2lzbwsEnupMCz2raQQEgesdUY6sIUPK
 lAcMWFV2rGNZV8yZbEPHEA49evvLPfKgS/3kwaOtXWq9Kh6SZ7a804c/yTGAdjiiieX7zRj4DNS
 VNruGD2VO896pW8x3hoe22c1FXFLLlEIGUQgBAMBYdM6YRlX47Vj81wlgjaG70B59ecRGGRV5xl
 mUp6wLbk/LjxV4vmZ4BAsI2sflVWeb6euGxslN7qtlrkpAd5R1r6OjDZlNPO5VlDS8TkSeiO62h
 rigSd6XXERIvZ5tYkWQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d3ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TmR_zLDDL8RY7fLYG3ZxN6QS95ILI98Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

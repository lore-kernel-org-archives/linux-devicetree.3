Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE84E06EB
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889039; cv=none; b=N/ntf/TigEKbq0dLg0Cg5ZU5r7vs+Ho0ST1qJsiXwAyUEiFfy28vAq+HBkNKC/N71e3/c4vgAfwFx/MFNg6vddLb4Ce76haZUxBFKnYDSjD5fNkJUiyVRdZWcVfUYpPSMx9h4EQuH3xDFL1BRsVkTwb/bDjv8UxUTTpvBvqk8lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889039; c=relaxed/simple;
	bh=oFzLmBDZ1BZ/S7//QkibmaQqya60kfws2K20oEotJMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdAl14Z7d3OZeugeR2FzcfxNVWA+kLZ80yNYMuHgWgjOjTmq/TQAW9SJsPsgNx/C9nMIiaismIRLVSBhAEdeKAnBQ/k7bqyRggiExJctwMJIwaHJRyX1WcI7RJtKK8zqHY8tp2c9WqZ6FbHV0thGB83YzcIR2biWffmxl2lbwyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH1HSja6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d371Iamb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH1HSja6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d371Iamb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CRwM949361
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=; b=RH1HSja6OzwULZOW
	n+75njZxui2mLMKvE+9lWApKRd/Tbf6gBy0ROetmD5BGOaF+zps+guwsEVsPnybd
	4rTQ0B26ue3XCBvmnV39dH7eDhT/rK0hkfufv+DvNDkRDqur9nqZO3Li63raOBJo
	81lLepfchxAxTEohy25WIOJalI7hi/cIEU0ZNStvge34Wv3NKmomoIpJDn7DKYh4
	bHOknMC6Pkvu3az5oF5c7BaVlxRsRbxUu96oHp0QiMTCeQ3wiGx7PCI5RhLbUD6+
	xTFij4jZYcdfVlQz6IhHOuAOfHjisVU0b/nTTmCkz+tVyRH1kp6nskL8DtAKKiAp
	emrhBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6296j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:57:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso6207111cf.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889032; x=1792493832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=;
        b=d371Iamb+O6jD0Pdie6mIOnYWtpnj9keSj4brcyylGUDsSGE9XXXbhEBLS/QW1lozj
         qe4IaI/vlbgj0TZY7YqogRDCpwaONRablBK43YnQU31+75vEKZ0s3u67JGt01F4h2+X5
         PD+2FM0QM2K0YNODJJiWaWnAut7gl9joUSl3S/zSuK0KUjnL3IzzoDxeN01sSvZZylwz
         hlFEiXUYtX4lSnhvmFS9oqOX12bG4mgpW6vNFdSYnMaPsuLlqqPXP8eM0iUS0MHvHZl2
         O4RP6aZyrvnS22d5E4w03cL8R8L4cZ8uvcij4jSY5BebmicRLx6Ss/J2+RGOgoU2O5zP
         sfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889032; x=1792493832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=;
        b=co6nqWtz1p4EumgqSSFwD+CHsYqqevVHNNwyfbT4jVy8Pd2Z6b7tLDtcw6pdvRIkhc
         Wl12s6RjTAS3+nrV7eUNe4IU34X/mf1ZIgch1Crk9kkdDQtoP4C44Zv63g4ZxoRoVnXK
         X6r/fQyMHwKjY22yhrfbcPW1X/pTF4RfjCGGuIOD5jyqrqEa4zT/4FMCbN/HzqG9230Y
         e00gTVywKrBV8y0W2bPRS5jTLTfdKbH9YU6Lm767IxEtr5Wss0B6AZ77oyRFeZSmEFdx
         RoYpya/aEw0nzQvOdzVuQvgAXaE14EN9MZ/tJkdjJ2a5ge3oSO4y6Fgtkb5JG5dL10kU
         MfTA==
X-Forwarded-Encrypted: i=1; AKwUvBy2Vae1ROcKW6/BByRviI0k4uDnawT0IMD21McLVhe11JoYENugLiQpBU0H2Mr1voiT47LkRmMGSdyE@vger.kernel.org
X-Gm-Message-State: AFq9FYKSMUIBcXceBN/ICnEdxEwj+tFaWA1JC25dErOGVp4j+DHu8lrq
	gN7TrRtVV/zaRQE0qgnds47ly6jK1Lo6iBmP8C2zDwQ7MJsRJV8IscHhObdY/dMfZyRJiq0s+NM
	VscGU/Mlel07PQihr9/Vcb+KyseebeEg8qZmBm0LZxCBEFrwrelmBxpkLGMRPP6kZ
X-Gm-Gg: AYBFou3Me9+YJ9YF17lcRMUz4n1eV/+IYdRFTB/u6wJiCvuE1hihDvYebkyQqd6hLzS
	IG4mATeCHrCv5OQaEkW5MnsF193gRaAAWdcqqFADh3/jUHiAQNCl51H9x/IH/jW3h9dp2mD2aFu
	984vU4VuPVj5M1I6sJIUkaSikpRTj4ep7MQmxWURleT2jSCpMA2lqNi5ecupmjVN4f4Aoqb6LTH
	Xeg+puGAe+QsnozmRn2WeacY/MC+B8XuFNz3y9ZkmumqXIyWMIGpN+Rc8FXMiMt2Kf7EjPUUbxW
	ROEs1ZJ1I0y6TfSeZbgKlzakTMYZmlDbonE6yH5RIcQc1iunolR8o287qQnl6anczgUPWE+lzMs
	V2yXvEkVd/OdlZ3faeE04RQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2382463785a.2.1791889032565;
        Tue, 13 Oct 2026 03:57:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2382460385a.2.1791889032022;
        Tue, 13 Oct 2026 03:57:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd395dsm6278732a12.17.2026.10.13.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:57:10 -0700 (PDT)
Message-ID: <5fd88970-e8fe-4dc4-bdf1-f0e9447f4462@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:57:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
 <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0e89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GgWLzTfdAFqkLYX6_IEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX7ycABilqVqRy
 ELyvMBs8Pm6jHqYk+y3FJk0EwaR1hj5LfjVkMyRzUKBARhRkGhyZdNotcS0miJ+tAcPlUBwfLek
 S+IKzeC5WEvG5AHEqRvBYsPWvGXwLho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX1/nX2EP/m8GD
 dgLkblrw60QmwCEaG/82MOhHUYNpqDhX34iu1cpqXxI/rzNptxmT/3DMBd2Te5THwzjdTlGo8OD
 jXz22JAnAUY5w8kNNJUVEMaWpoj0ae6hYCDNSlRKZ/7RX5ldQhfaQL8wVKhNTbKAU6Sru8Nr6fq
 WSQQ2GmH807eRCiFq0IM6AmcSN45aGyYWP7JzJMRc31ToI1l/6BpKBMxARiQrcC+A4NES1THVqy
 27vyjjrrRfvg9DWjhO4CW04UE1CCwZjhusOLXrVr8qFrL/r6gmPw/PK5D2eGEr46DhV5FtM5Om2
 PLyeWtM/Yg86LyCapiapsAkQbB1gLHtuejf4bXgeBsC9MRy1Uxw4tixPgIKFmNMjHnuL9JGPe17
 SwXzmudxxZ4/35OUJIhz1uCcNNcxyDVSHNeYQBcWS8ESUF0nhSH0gqaa/oUNpNar+Xg13jrx5DP
 Td9Ln8JviIS5rZDpb4g==
X-Proofpoint-GUID: ACIOvHq0eNF3zkhplApGLtH6VHRd8BiG
X-Proofpoint-ORIG-GUID: ACIOvHq0eNF3zkhplApGLtH6VHRd8BiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 10/8/26 3:50 AM, Shawn Guo wrote:
> On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
> by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
> fallback, which only requests the "ref" clock, so the bridge clock is
> never enabled by the PHY. When nothing else holds it, e.g. on boards
> where only the USB20-only controller is in use, clk_disable_unused()
> gates the bridge and PHY init accesses go nowhere:
> 
>   xhci-hcd xhci-hcd.2.auto: can't setup: -110
> 
> Add Nord-specific match data that requests both "ref" and "bus" clocks,
> reusing the existing Qualcomm init sequence. The bus clock is enabled
> and disabled together with the ref clock in phy init/exit.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

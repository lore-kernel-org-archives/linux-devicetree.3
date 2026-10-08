Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979C479897
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459767; cv=none; b=AbrxJEryFU4Brim4V/fHYJpQVgCEZtZRJ7AH9WRvyVveWc4YzoLZDv1nAO0ag9H3kil+nIUHTHRzTVgCw50AFAk7PcVaycaczvltu6Lu1TzrnTcAys0ON34MmDGpKQ7xXtIIuOToue5vJ+Mw8U91pzK44Vxho0E9uIIlm8Empqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459767; c=relaxed/simple;
	bh=cAGkPVYlrmH3K4nr2n7hsxNQEWLouB39/2CAuZGLZhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DENfni+gTSTpPlelQp5i3M77dDGvXY5kz55fCifXDeh10WJDDoNcVIgQzwpjtAnKX7L2AewAg/6gd7ZD3m08W0fFNrIvuuGny6+H13u3HoUTNAdbyT8btPGLPiFv19uWmn0uHnyz/pw/YQChDLOQRtQdJ+I3xAyVGKC+T5F9TIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnABhFxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhYy2Noe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnABhFxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhYy2Noe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK7dV2705057
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 11:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=; b=TnABhFxqn5/+RLet
	8wyGelZ8cIJkvWPZ9KH2pi1H8k8O9pWJ+Kw/Wy0jJ5QGwtx1+n4klRvuAWqc+Va/
	gYVTyeS9Vm7twA3BkB/4/f6KOWm5DZAtj/nKhuRdyM1EPongJiGliKyI1FKhm7Pm
	MXaHyh2F8OYUMfy6xJ+Ig0tw0HVbJSEPlx/+DylapCdjLnv6vW1UYE3S338RhlOu
	XqecD6vzJCJMxS7yd2Ys65NB3Q4uFLhgj8NQ+M8diN0igPBXfWA42ZNMMKekqIya
	G1/dC8FESxiiINDlNxK/BDuGl+MG9KpyCi79Tzts/WEkyiOT/rhahcGVhe5l6NYU
	Q5IfVQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tthm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 11:42:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313b1501a0aso827512eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459763; x=1792064563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=;
        b=hhYy2NoeC7pUp6rOr/nbAdtbKJWEjA6hvRNZbf8fxgq2kqrYT5XLMN7OMXwmDshWpn
         x1kLBadTPwtrFdNVqYoCYc8D3p/WxjQIPhvEpqToN6eY/ARpgzgFfMdajOpWcxSazvMa
         3wqifrHS7PZxzPkfpucEvUT4xtAIxU6c8cFupl/dacxdtyv7kV1LfovF+DGQXxmGSn7S
         5BCSI4jyiQso0YzKHoDn9Or6De6clW61D+K80NlZC2x8yp8aB00qw714k7+BC/uQSkvb
         Q7a7/sg2fKsomKxFG+82iwz2oIo3iMiAua9lFyDKR09VK2ddeTqfcF5IMXRLLeoWbqDy
         PlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459763; x=1792064563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=;
        b=2mHYIi7gSdoQxXd0D8UMGckE5VD9EB11+Rg0ZUkcTgI5x9U4d9nP3iNaJK9/n9v2DY
         btOIDTCTVluemqanAkKmqhEFa8PUNcGjmOl3kjVY49KIvQKxYsQ5ZuIHXuNPAryLwjXW
         p1AyLWZ6P+RJZrxK9SUe+1as2yMAx8c04mytKsnnnl6zZXAX+sc+1TrO6kB7TwBUXsmH
         mNrHFFQ5iwrpNSQ2ujfR8BK0129Jx9zVbDKgthCx5jt8Z+Ln5T4ElVONOiQXaOsB0/2/
         voqQa5opQHSgvCNXg3KGgBaF70JfjV5GLe1toJH53xG16d3aMQW4+LBIs1wBcwCaKprb
         dE/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9VIQeV34lqg0RsgixiPUfSuhw0CdrFD9aMErDV/mpXW2HbYLIrRMV8fxXrP6iCEsrge9ansUVTkWh@vger.kernel.org
X-Gm-Message-State: AFq9FYIQfElCuAtMQN/t/6bVbc9GNJ9mQkY0ko1n5seAjrCWzuC2hJ5D
	5on+uhhW02XQmmYfdLkLDWp25pnUHHrYo3QMSOMZM7USlQ1PoaCjvSjCX+2trQJVjQ2f3S08VBA
	7+zrb9ocAjnGNkOxQRVGj2T2NcOvja+IZ/n7v3JWp3qBEe7klIibRwGQf/PLoZEAK
X-Gm-Gg: AYBFou28Eo7+swGy9+Q7b5onsys/gyUHv1qB7feEV/iCpkiRSVxIu5EWJPV6PlwlwIZ
	Le3/hPEhW86hfohFF4kaypaVK4KLdHD9yMpaIx0SAqzYvPYUlX8ufxei78ztoYdZRuuJf11PR+s
	QPrBUli8jZvOV0WFyFrHMlu0SaQly3oZksqSQgVWLTCMEQRDJykNk1HRdJkJd4O5As/rtHJA4f0
	4C3zLkltyp7X/bDwI3wjnZiG0cZ6kncFAp02a1+7WHr0j67Sh1jEtsmyH1jluDvR0bUZPv5ejmG
	sk9RM2u4jubbPvBfOpQQm/2q6U6HORZ8qN+QnPvsTqXLg9lOgAEtLloKlAf28NhO5wqlCNa31YD
	XSA9vgQKp9v5uX3OhH5RurNff6f5dlcM=
X-Received: by 2002:a05:693c:630c:b0:351:d38e:6c0a with SMTP id 5a478bee46e88-351d38e6d5cmr2228645eec.0.1791459762593;
        Thu, 08 Oct 2026 04:42:42 -0700 (PDT)
X-Received: by 2002:a05:693c:630c:b0:351:d38e:6c0a with SMTP id 5a478bee46e88-351d38e6d5cmr2228565eec.0.1791459761768;
        Thu, 08 Oct 2026 04:42:41 -0700 (PDT)
Received: from [10.217.216.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6076sm17870481eec.9.2026.10.08.04.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:42:41 -0700 (PDT)
Message-ID: <3aa2f7ba-734a-4d50-9eb4-cb7322449919@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:12:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
 <20260731203515.GA1619665-robh@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260731203515.GA1619665-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac781b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=txCGJbmANruv-OSAE2cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 8Hfg6XxAm8OH1TvuZmLq9d8HURJuJlsE
X-Proofpoint-ORIG-GUID: 8Hfg6XxAm8OH1TvuZmLq9d8HURJuJlsE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX7OHFVHTIQUFu
 c8tdGMQh0GoN7s/VaCjumKXVf78OAywEnOU7wbApPX7FSMoPqgGP7XLSFULuLjeI1N6oIWfOdY0
 zGxfYg3p1hk1xmJHLewLLRKDrbR1CEI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX3AJ/stTbUPdf
 7F7sZsAHTS7wKbFyLiZ+j744lGKU64HuAlkahnBGAqA0m8SeA3yFtS5e2b4dzxHrigH5f3TwOgQ
 qlXXW1M3rHU+VE6bP6CaOjiJ+D3C7g9b2+IY/CUtrhS/2ySiJDhgsTGWl84yFbIJq8uoLeShz4r
 6nzFz5swkheW+1cac7c+L/VWMkLAoZPatCajfEeu/ZUjbzYKhncOpkoF8AP5/ReYVNQAkclATwU
 hvvRFlyoEweeDVvA+srutEx3qtufm2YmqWHq7FsYy5jz7HnPgzOMK2XrMocplqZk7SkM3FrUs2s
 kIiKjeM5j7RgfiPQm7RTMEZwF2kSHtcMvtNTpS2vBxTzufypLkCsJnQ5SFcEuAO/QrfutQOzpDP
 z1RJoNN9lxwY78W8/Ado0Ch36tOE428AnqWzf0vwZ3PCJ5u1AzKuda3+G9xpAY7QR7QDwJx3T0L
 kmmmxzKx1sr6sfDRvzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046

Hello Rob, Krzysztof,

On 8/1/2026 2:05 AM, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 01:49:51PM +0530, Umang Chheda wrote:
>> ARMv8 and later processors implement the RAS (Reliability,
>> Availability and Serviceability) extensions, exposing hardware
>> error records through a standardised register interface.
>>
>> Add Device Tree bindings to describe RAS error sources.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/arm,ras-error-source.yaml    | 330 ++++++++++++++++++
>>  include/dt-bindings/arm/arm-ras.h             |  11 +
>>  2 files changed, 341 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
>>  create mode 100644 include/dt-bindings/arm/arm-ras.h
>>
[...]

Thanks for reviewing dt-bindings change of v2 of this patch series - I
have address all the comments and posted v3 [1].

[1]
https://lore.kernel.org/all/20260918095746.3347893-2-umang.chheda@oss.qualcomm.com/

Thanks,
Umang

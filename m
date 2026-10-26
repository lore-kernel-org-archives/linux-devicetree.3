Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018390;
	b=f2D9Idqwez+zjconkjqJEWfiFL/izt/bVNPHz0JVE5K5brfWG0ynS9xj7/dxny/DqKlo
	 qmQEOjsmTkae6shcMIrWoSObsyVNg2Yw7UYNQYGCnpW4FHB/GCGWzmP9joTfguDQysRuM
	 E1iJB3f7Rsl1yTD/xbAcRhlUKN5/Y5IE7R/GmjhDR5NHnujn1EG/H2EcFc9Fu/BGkdGVh
	 U6EvXNZxdvLcuLBlYMm0DIOEJsoKJQuCDHo+Iy9ge9k/2T+Yt6E7n1Dq5UYAAxQKnnXK3
	 Eu5cntkaBA2hgRvWVwjnAXP6WKX07oBnA1E5AHe+9Iom/YWL05t7iO3rpz1Pxp7NC3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
	b=ZsuwrbT4/c8pBZw0cE0M72P6nTITfrvKXTmUnPweOGJ5QCrs0qfLB0+m2+tvj+RAMz6l
	 XKP6R1G9fuxkIidmfk6Hh71jmhvk+GMdZBDe0rlpLCFLWVh4ux7MZHg3jL8ueiqPmXGRG
	 Ln5qmaQdjX+ldvIEpOZjX+3laMoYl7/ddbD5BCP4xnaU/pmWvja9kNsuOTAB2LoXwvzdC
	 XlJ9qdaf0qzWErjLi9AxGuro5vwcFidz2jMDkHE3iYAsyXIgzCH2wCd2kFJtb27S42pJ3
	 HnCciRpM+Mh0qOWJmEw6GaYDKFYq5s7J9gnZTZNa9oKeIVlYSN/S3rQQyGxhBJ10+Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFVWfLNs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7bFEDlX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B21606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFVWfLNs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7bFEDlX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspP64131378
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=; b=mFVWfLNsjWIGvAe9
	ahqatTBNXrOW7rBEt7J/1Zj5eKycgNyFO72FzCgv0Hnnc2+qd0aVpmT7GZXIGDqk
	rXHeepTWTpjU2jnwRX+TPwavjcmSaY+tk416jVKV+WWc6Raobc3BCAJSr4ZcNGHz
	lAXJABgdXo70CGnYt1w6qljKK8LL2Jwg5mLUs0meA2Bm0PKd95IToCrGQCcVm0u2
	3emUM7urahv73bHlcaRmSA3K+GHfWZVD5+0cbjXJDqzzXPEdnmcd1W+nWcMPZ3sq
	Sr3lk0xXQ4m/wizgjsEfa6IwfsVH7xTrD3YuuybZ5dnJH9pp41dgmpXxsDxXlTL+
	Qo0vTg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0eqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:39:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc254b8961so33094137.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018388; x=1793623188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
        b=V7bFEDlXa0OgAa72h9HJhGruRotZbuPkT1L9ajtfGn/o2J8d4ZLpNQqPTQ2mVrKOqz
         PQRSNQUoZsOeco4GubqgBInhDfAe3XdX3AepTQjybb4ClckutX1aumRdRBLrK+xs4Meq
         DlEMMj1SkkEn8RwSWgQuFguviEOXdd7gkvv1Hc9hJNUNbV7OJ0iXg+sm/PAS6ifjkowW
         lyxl+ykViAAeexKHKcHWi6J8lwAuRn2Xm0VZR4U8He6ssQqzjAjijpGfWOTbvPTWSBxt
         fpaocdgVENg3ZBwjUz66Oi5SWXsQh8gQLF4Ko7WO8TPF0ElZyxAj4YgZPeuFIG/S3Sx5
         Or/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018388; x=1793623188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
        b=g5s8nUA9wdvrZuyxR/9fQx3OAHS/HtSjxw7I37B8m4PJZQPVZP6kVKjQBk38MFAeh1
         I/l+ZgUswNt6ORjriS/3hzWO23de2Sc4Ehf7Kr7H+9e5XUCKCq0pF4ZbXAOgUP5Tj2cD
         cHV4OOvHr8IF9RcCd1MgqhkHcWhHozJ5OckpO5U0RI3wlrdjdzpx+iQVwddPB82eYF1P
         EAiQciGndtVDtb1BUerFGgX2iCD0RJJnHOTsFNGM4Zt8Gx3L2PUgRtwptWxqccjzPafG
         ey7qXk1TbBYHB4GqZqmDtpFkIjpbvCKh2vP5M6eVGbIytIssMuSoHGFWWZgcuCOmEKWE
         fmBw==
X-Forwarded-Encrypted: i=1; AKwUvBxd6GwEs6Q15vZwvi3xPJaV5HV9GnaLu8N1OijDuOuEOB6PILsR/IvLFx53i8ENVNgqhex7sDxBuYhs@vger.kernel.org
X-Gm-Message-State: AFq9FYKvEz8NrMcRJ/9SwBe8uD/GHqATkluc7MhK0uxxqQDlfnhmQ7yp
	VIWHN9o6SAwDxI4swkLz97fPoapd+ZwJAFGEmUXVlOPJudDZQNssq8LFTqPq4hBB2+x77+8Tnme
	rNwOBpkfXZRmtbxPeKD4Q6MvVJ3keWhmnDJF3Vs3X78HhkTnoGZWT6njRulRjTeiK
X-Gm-Gg: AYBFou1L5DqgD7oWYZEmn7XPZaGW/QLCxiD0ECvEXSHXRmhBBRW40iajoGpqtkmmfz7
	I2LfzljlXzsOpp5AnbgsDa1AaVy7Or7ByI3QQReuWv31mmJZriZ3sCQVSJEM23nzAhUur4KLzlF
	j/AkXS83g0sDlX3Ip4Rz7jj3x63TDSuo4uTsGF8NM0/4U6J3SqWCdWA8vdzRECnH+mYWIvJYl0Y
	x9fqD80q60SkI6Z6o4dO41ntElmif0/cK3ak+VV8SrsxNiV9u1sQMEejI4U+V/WJ7VvdU6Q61P0
	F7GISBW1theUizwhxzQdaouedmOMjnBCiIzqBsoECgVmh4w64BXGe09P5M1wGBvJ5tXnojl9Em+
	BBLQ49j4zdJX53rtJHGptxQ==
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr1757897e0c.2.1793018388224;
        Mon, 26 Oct 2026 05:39:48 -0700 (PDT)
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr1757881e0c.2.1793018387768;
        Mon, 26 Oct 2026 05:39:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm18146581fa.9.2026.10.26.05.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:39:46 -0700 (PDT)
Message-ID: <7056d429-5bd8-47bb-8c9a-5827be7c6279@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:39:44 +0100
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
Subject: Re: [PATCH RFC v3 2/2] arm64: dts: qcom: Add a minimal REDMI K90
 Ultra description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com>
 <20261021-b4-warsaw-minimal-usb2-v3-2-9f4213ab83ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-b4-warsaw-minimal-usb2-v3-2-9f4213ab83ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX7jLv7qc8Do2/
 /impc0fHPGaKODVgtFpAiBu9e/xvF4RVK0auIJ9gIhjY4plSXGoqWNIi5jtsiCrZnvv2S0TMG0k
 EhB9iO69YPzcMvpdhVPDo8qIhS3xSAM=
X-Proofpoint-ORIG-GUID: MKbTaf3DN9h0Y4lPl6tkcNXG4DMYFWGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX2LcCUG8xp/T8
 +Fpe/4az9IarPVt4nLpwVVQYe2VK9tAHl9iBWyWA0ZVAum8fHNiXGHnca1ODQ552L7GbK3aJc9/
 oWsAMBcwUOg2AvTDApSzwckbaUN+HG+PXbudpARI4K/Dci9vrXy0BXUDDX5huYAptgSKBZF2+kt
 sCdLGRxjqzc9RmQsVNZkWw/gOIU7wo59rLUwx87d5TekL4sYtD69PR7kslerZu8F4Yg1EUgLDqd
 ZydZUACZIxDiTMG+CsW3qGLLoSw9uvRzaGzAUWFZPJ10thbWmnwp8+2FUH1Ys6wqt45/haxUKYb
 CJPSrKVrexfrQm0x2318GvxROaY3fJGz3UO/jEyw/Wh5xH/9BAfXlPevY5Xe8UN4AI8njzT8wGo
 SQlrdfg7QAqD389gZF+B7a00kSFZjq8/kpcYTcczB8V6ZUrqpYeb3unExs9VOhh7fDpkZjgawLa
 A6QXd/Qgl8/tdGEGxLQ==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf4a15 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=BhY9DA6nPAixTnPfFlgA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: MKbTaf3DN9h0Y4lPl6tkcNXG4DMYFWGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/21/26 2:46 PM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the REDMI K90 Ultra (Xiaomi internal codename Warsaw) board identity,
> reference clocks, PM8550/PMK8550 devices, keys, debug UART and USB2
> peripheral connection. Build from the SoC and common PMIC includes.
> 
> Reuse pmih0108.dtsi on SM8750 SPMI bus 0 instead of duplicating PMIH0108.
> Keep the board-specific repeater supplies and tuning values. Preserve the
> OEM firmware GPIO reservations without assigning an unverified function
> to GPIOs 48-51.
> 
> The OEM configuration retains OTG and UCSI role switching. This RFC
> provisionally restricts USB to the validated high-speed gadget path; the
> connector, role-control and VBUS path still require board integration and
> review. This does not establish a peripheral-only port or rule out DP.
> Usable RAM and firmware reservations remain a bootloader contract.
> 
> Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

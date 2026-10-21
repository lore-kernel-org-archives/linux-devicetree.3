Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574120;
	b=jhH2f55QK2aOJ3QQFdDlMENHjWEobUe0Bj12kwo+y8Q+VK+tpU2k74nGa23qKlDpZNrd
	 RXcFW0xjXA4/cyrfw1cmTKQxA/uQ1OR0f7C0WaIa7VydJYQZx76lAN2E2XFFiJ5gM33ml
	 4krN4Zb4KPzZ+9i13obkWEW6YU6Xf/BwiUHmpeLBQCxWKm9cBajk21x/uuIl+JWnxId2S
	 sCV3z+5PxNx8jD5sVHOWY9oEn6LbRw8VimAsaBINuyjsvvWOmknJcF0z+llE1jg8JZRXB
	 Bm49p4KTHwMgKllhSWR7P30lcy0ukzy9d4bF50GIZjxt+D+P0ctaRk5g/JPjsSD/t8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
	b=mMnj5kPxnGyUvsYXtB4xU8iD2kpdzY4qw5dy0dfLDCCqwmPZLV8A23KYJtg4KsfqW4WD
	 NiAkKvVjlUliQqh/syMWvN4XKjWb0RTJ8lPmmekv8zgHa8uQW0YdavgQa0/ojnnyw4+Vh
	 J1rU6EPo74dMRmu80IuH8/BlYYe5LwzmneByCynZ3eYSVCUleHyrKWIUOIn/ONZ6gHcwd
	 xT0aZAZaOzKESOdN5QToBj+n+WBkdXR0xCqpdJJNuEArZUxkYND8bXkqut/BdCAHUlZkd
	 F8LJ2wkC1wYW1Zrkqq5Nv7pN48s2/89+aEgjPTKmUJCp48ZiWdweUrQyXOocxPEew5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b12SUz/x";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKlLD3o3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D4606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E0D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b12SUz/x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKlLD3o3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iqa93018337
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=; b=b12SUz/xLhut5xmq
	2IjoHS0WxqtZODDh7nb7E8B6e4EmviGp76fFCN2nzgqmIHyqE339I0khvz6Z9iTp
	uUR3GXs65UxoBg7E8EapYGbTO09B8z/c5D9D2I3vvah1IBx/nYpPJPBUj0tWSQUj
	lzu0jmwLK750MI/AkGmskLGHSpwPmk0/Fpc/mo51MsA458n9dkY/BdtQ0f/HGBmw
	vroFdkh8lMaZYuJvD32n8RnwfFPCqUoQF1/Sk1+jewoTkaYpXBE7H8FoBGlvJ8WB
	f4lbkDjkczn3mhZsQ/SvdVxTYS70Z19U1PCkSWk3VdQduTq+sVP341/G2I4xrKCZ
	Gj66Rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3kwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:15:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so13669385a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574113; x=1793178913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
        b=OKlLD3o3yO+/vB9adGz+imN+eEruFBnT8tQZT4R9+OyQXJdW6ttHt8+acqaarVLNew
         gTWMwpd5QMXpxbIT1//M+d6w+XjcJPf5fWK1XzcNMEKNcTJDPk/c+XtAOITAafc78F6F
         OsXdHGyvrL6w9X1mwI0PbalTLnR/J0z5j/wymwV+FLKqZYemv+arzv5NTG+kvx66tZxI
         HzZaSa7t2bJ+oUpV42Q8Vcx/I9JGPPcBUc8Sv/x9phRzSeOLlC8xQiHbhwVOjE0t1FnJ
         aDjNM0AgRarSc+YDT12VGhypv9TTrSZTUAqd+1eio97pKlHKKqU2B7WBgwV34aTINpJR
         Tisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574113; x=1793178913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
        b=G3DHEZMNPh54uumq2WHiQ2W6mnjlaD2KTiYUwMBsuv4vMdZQomrM+IQDBU+4XTdeu+
         2A8cZC87+CFtEHRdxoYeLlicPyP+Qs00mapLmHbgjnnJ+n4A7l1EiQLTaos2wyVPd5D4
         t+J10FtlS+RxLhq8Om6kS+1jb73zuVJICPJji6iHnDkMFJAx8Udt5royQcBf0LFTGxF5
         MzBYC3MxThIcCQMCM1aecg4oRZjXplqAt9vEluS7LGfAXV7FOtrKAtCsepKEs3La9cqt
         kD4tXsN3ddQX8cQTsuFTmDqk/v0/3ywBpxX39NLRkuQ5G4j6m6AUBN8m3m+VHA8TXqF1
         Of5g==
X-Forwarded-Encrypted: i=1; AKwUvBxsP8rjRySniVUf/ckUZTYsV92if1pJKQtWMoqVgnRl3C+TLWpu79oJjxrzsyZe2EcY42yuNhVhxqig@vger.kernel.org
X-Gm-Message-State: AFq9FYIAlSY207kQX6mJdbAMHi2PnBcDiKT1fccEr9M/b2CUCwRH8fUL
	Xap0cA0o5Ok7yekWGPdejCsTXDenNB1PFkuSSpcOsVb3bpSfPkACB7suF41cqHLpwusqPkSK7iU
	0kGf+xSyGLv8yX5pLX/SPoAqMa2g0Ie7n8q9nMH8L5x7pKyav+FtP14Zm86QIJQkC
X-Gm-Gg: AYBFou2igpD8HFQ44T5w1ruVczqaia29FKwcN8wCXpW3Hw14WQQsMJ4dvwQqbOhkmFA
	In389tl+488dMhIWyiLqHA0Jkpvub1mt7oQxRslvKwKyKb5WeUHVkMibvlmKS5OhMDePLwIlMt9
	LO8q48oNCUOGYVSPe2SFof7JPESPxBukk59JUnWlnxoHPserDyMz7tJmmzfQ8bTLAcH4h7DmypX
	gxhKfW9G68kKKlqqjI4qFnGshFPat0PnAfVNRfYodTu5mJhZQlR92Lxhn+7y+YINpp3GoJ8MGRW
	Q56S7UfYwuXV9w9A1B0UR7S6oXQlr2ZjiD0L/F3nxD3mWSZeL3V7ySACRrE8+riiflPfDwOtIii
	iKj8hqR4pNX4jtjMeln+ZqA==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr367645885a.0.1792574113565;
        Wed, 21 Oct 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr367643185a.0.1792574113116;
        Wed, 21 Oct 2026 02:15:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db3e8sm620229a12.8.2026.10.21.02.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:15:12 -0700 (PDT)
Message-ID: <3530adcb-a7ce-46c9-95b7-28aa544e8fef@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:15:09 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
 <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
 <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX6TXzlzgBkEkx
 3zSpsE5Y1YzAPlewI4/RRgZI2pweZ5OelaKhKAZqScL2lZvv4hXq8MOp1AU8qJpnmGHjP8Cjyjd
 1GzDi9y6CiTP71kcLMOi7P9hSuHEHZK83tlKlvOm7nuTtkElZwGI+A6THPY3AGfvGwn5aLJvC5K
 NrYvSFJKTcNhUIIpvIc+b5ZhIgC8NYRA5GIjZFIknz+7kMj6VnPchBW6WTnqU8n0H830R2Vx1jm
 nawBXoiV9k1mcEUg4x3k1GzzJxN0h7HJFD2kxEj7li8Sea5TLgsOpFdkaIeqaZFd9/iQK4rcSlf
 ZSyozUgqsV/ZzwiLrLe4Hi247/BN+IiGUwfrVDgo3HOMRbiXH2FF1hJEcQGXseOFXmq0fTL9ixH
 Cr7ibHVknnnZlyQSbbLJ2GXeVQEQFew7SPFxoF+UQybEPGq+DTSSXMLRPPSlLEZxCBBLp4psMOP
 zotHkw+49d6p6JiHX9A==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad882a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=s_4eQB3tgPlORBrTjR8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: C067XuZQU1HMVoV4Ww_40vLw2jW2a4GO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX1WlMTJ5V866N
 X0m7fVq6/z3CggaZz168k+6kaKdaylT1REtR90/wbhXrdosSL9rUWjaBkHwRfyvzxbQG65Vkkc9
 LlXxQETwqj53XepwBzSOMy/ZUkKcLtc=
X-Proofpoint-GUID: C067XuZQU1HMVoV4Ww_40vLw2jW2a4GO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036

On 10/21/26 11:05 AM, Cheng Jiang wrote:
> Hi Bjorn, Abel, Konrad,
> 
> Please drop this patch.
> 
> I re-tested on Shikra EVK with and without the RF_CLK2 clock described on
> the wcn3988-pmu nodes, and Bluetooth comes up in both cases. The
> commit message claim that Bluetooth fails to come up without the clock
> does not hold, so the patch is not needed for Bluetooth. Thanks to
> Abel and Konrad for the reviews.

It may be that you're lucky on the timing (or that clk-smd-rpm keeps
all clocks online). Please verify the schematic / clock map. If that
clock signal is connected to WCN, please go ahead with this patch.

Konrad

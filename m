Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479366;
	b=OTBCZFfIdcANEj0IRKtcTbZwwNRvI+D8XnxRarYkNBxhJe3+liNlBOdev4fZRAG6BmRX
	 23PQ1WcOsfGoexT463LF/aPqApP8J/41enFfQmfboK791Zq7+rRl0NXJ+y/Nofxl7IgTH
	 +wW/n5viZVOXu7t7CWqDBOQyLUJYIenBipAog0p+s68n6STnISG45uQB7yok28SEvsfJ+
	 UVHVN1tFzW9xYLuO12sV1XzOJ5OsaYh1HFrvFm2G4nRhdpVP+EAcaaBJBmVStkfjaIpMG
	 rxKDBxtFYmYwpntUxkTiKBHCu79djShYpRTo6T4Q6tzES/X/wut9wNeM5YBWqAGl+UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
	b=D1n7/RcY1eHMDz1jPWF4MgsJBN5xg9EN0l0dJ+4zZoyZ6HPRos+JZWP1x9E1JIr7nJGT
	 wgS0ftkqH4uh/jX92peqsPpnvnv4f21DjCSosTXyj19MM6jgF0rsewjh+X52O4IplS10w
	 ivV2nskI4ahLmmltjXrQ4pjaGfPekhTgdNKGWuEl71dEpn8TtT4q0TspG/JjInC79yrf6
	 5rsuXFdFmQuXThpfiZj1Jcx24FjGKz7h/TCLByLgIHAVONT5nhQXbNSnZrUmPI+XyLUU/
	 8GM/1yJ6R0cuAk+OkP70+bNE/RetpUvWTLa/ejCl1rZbHTJiTcryTTS5V9Hqg9xUR+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8871606A323
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8871606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tKYk4178129
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=; b=LJqv1MbGFeFQx84y
	Zqz6oUMNyzFnRgq3tErABOkJutRq6QiG7S1B96fBnQbvKSYwkFSsNmq0xHBAic4/
	24NuWOg+E5S8SXFNqGl82RkeqAdgBRsErkHtfMKScdvg+xUtojufSzxRjak9bvS6
	YIyH9Z9gtg2qgzYpA8nif12JKlvgWRCBowca1GTXkdBWLxFULNbrRh0bYWcGDcH+
	BDm4BvITu4Zwja+2tZWginft2Yh4I+ppxfff+IJRdxJZbYZbQjB+OZ2hHendatC3
	aIAauvR6vd76HhDex17SrBakF+DDlfWSZjKgxm8dId5F0L6KhTvGrzEjOZdQr+J8
	0Y1joA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1827-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:56:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso67132285a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479364; x=1793084164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=OCkAyclT39dKe8WemJMWfwadm7h+/S4s/bqHNztCjcxHtsO2XssNlMymmq9oNB0i2j
         2jXeEG8mQWFius+7z4o/izPe6iwG9qE5PneEGwkFCwbVmQEBlqpurPO4gakTBe41pEg/
         aSx6PKaUBUqu1piXwUuYvaK4GPJu79w/PYefmdgohisspjEntddyIPrDozL6RU7gvyzm
         3/RAHJdv3/Gf0Az7t0ZrNvsciQB0FgMYxEwoXZueAmGlb1kAiDOjVAVz1B1t6Yuuw23g
         BbQK/a/n8nTWZYqJ7OUCC8zrU4AI16jc3cf91E2CkVKAbs+eJL2kE6jeO/zQvvF+cBby
         /JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479364; x=1793084164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=oK+b1f7YfpDWvUQXtCvu4CXWGfO3cf+CpMUzjLYen6kbos8Qszk0io6FpWzWxU1pm1
         7Rwm+AR96ZfxllShvWZDgLmtlsETNKlt+PQthUakWtr3tmkzVC/LtJl0Xkd6w598k/mD
         3ASUEiy0Hg4Kb1rgsjNKtFmnHaRFyn/fMdjSqHlT+q1yCuJlkXzL7p3MM80olKl3TzhY
         WHKxNbHAHlFiUM4srQ9hx2JTWtF+netFStilIQeBvhbzmHJHGziT0d6yNeUatoMgeqml
         X3v+l7UsHqFo0HJMuk4maXn3kCQ3er03Eq5sHQs0o1fpQf+EwcW9HhsjRj/ixfF0tyHk
         5cPw==
X-Forwarded-Encrypted: i=1; AKwUvBwRNTP56gRW7FdPI42MmWT6S4k86ya79R9JjHF2sYN/w1ZBIZO5eFWWCcPcajy5QdCIP2H8wt9gD9AO@vger.kernel.org
X-Gm-Message-State: AFq9FYISLqZmFSIQVcEdmQ3mPoDp6IIhrjxCgJqCC9k2S6dHmEtSl/3U
	PSgm0Qxo/Lqb8qXfrt1ClRz496ur8Lhtmd75rF1nsir34eQlTH6h4B0Vh/bPbzxuRjq6k9SxcJT
	Fk32CNkfYVNNR8ot1z2tTg1NkHQ68/9eFrm4iGLElz7valtI4hMrsvSnX3t4dXR0V
X-Gm-Gg: AYBFou3hoAVZ1MTpBNb2a6edevRQ5ZTEDhP9oOuS4vdDEJnPP9Z13t84JWNVx1Yg9ji
	e5nZ4fgsrasN+T9Xhf0cTbFhjnNtFWynTLpdVlylkoIQaHGkRxgw7xhayBuAJ+UTbEDHcpQQfk9
	O3tpe2YDYmwhU4xZUFio4ix52DtdTxPoL3U7ailUJypX2vyA66Bf9h+8e9x0kg9kPmSE48x68cc
	lmyzgTyND0zdwsDBRt3Br0+yF0TNTPNQYPm/dNVNPurZMpqa7CoxbxukasJOwZLejr5weQf7A7R
	Z1g0aufavL8Ky6DYptGlDSH4Llx4yInmnv3k4CisO5k0JCZ3T3Z6x/hu8qaKAYV27J22bY+bgWQ
	Q0R8aFx1HVky60g/+afbj9w==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922702385a.3.1792479364054;
        Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922698285a.3.1792479363583;
        Mon, 19 Oct 2026 23:56:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3dd83d3fasm1305197a12.5.2026.10.19.23.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:56:02 -0700 (PDT)
Message-ID: <e043f9d7-fc32-4631-9012-f0dee835fff0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:57 +0200
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
Subject: Re: [PATCH 09/10] clk: qcom: cpu-8996: program the MSM8996 Pro droop
 code register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8WdJd_2n4SDE2iauRlWkzulAUp_eXrYl
X-Proofpoint-ORIG-GUID: 8WdJd_2n4SDE2iauRlWkzulAUp_eXrYl
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad71084 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CHr2jc4OuQYqXGn8qmQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX1QiRmfTctl5U
 hQBhuwnUiBVchasesxHKBexDOrFtlAQwTN1onphQGNrdW80WBw/71MIJCCWmrfRkEWdupaSn9mM
 yGyrIczUzkDvaS/P9KuGxa322rEnC7NBRSYIXZ1R3w5TGlRkqzBKdn0WyBCneBi4d8DqXJJKrLl
 HArzTrMDaGKj7imhnEiFB+fbCW3sG79s4urmS6tUltUm3jdUKEpYnpC+b5OgDkuKwWn/d3vm92G
 hVvI6LnotMOkQonSPzRNWcmq2MZb5WS8yr4dzPU30FdIYotAYCmHh1s5rok6C7tCQO+uwWYKqZQ
 LR6U1jFBStr0doIlm804aV4Vl6rGCuPy2wsE6Xkagr3h4oKOQYduDJH/9es7koW/uo1/vj2bald
 ckw0eK12IjnJFWZH5w3ucxVt9W0FNmxDwazx20t6QbiZhUcsvPEjg44gYrrogEbBMtSnFSKBxOE
 uEGqwsy12WpMBqc8lzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXxbxWsg9SB2iK
 cY1HBV7IAoT1BOESncDGNPVB6J6MpjppfM3Se3/P41SIcdcOsr1sl/NfugVCqqaWXlRDalIN4yP
 7OvfcEnf98YbG+okTSs1TKapQ8Dbwh4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> When the vendor kernel enables ACD on MSM8996 Pro, it also programs the
> MDD droop code register of both clusters, so that they switch to the
> always-on clock source when entering the D2-D5 low power states and
> gate the limits management clock while asleep. This driver enables ACD
> on MSM8996 Pro as well, but leaves the register at its reset value.
> 
> Program it on MSM8996 Pro before the clusters switch to the ACD leg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

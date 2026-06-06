Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3DB2D29C8
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 20:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780778747; cv=none; b=qY+qgvEVDdBjGhynqADMZBMgQ+bz1d43TQVauk5qoVVYmz8RPKufJA7oe5mdqg66Z+g/xXpDr5JRdNYG9vq1e2eNnN4WFbyX63oZE9SNSVY8TXnSNGvBOLtKtBBHmYLpHUANFwwTvGrrH1O9+yu7G2qb52sbUdPgFfRB05sOHys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780778747; c=relaxed/simple;
	bh=tVWTUQkuWw5hNrTItWgRA2ldO2VwzHh+EOu7JXnSQ6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgjzlIadJ0k6VTEtOHgWybZCthmCc6vTidiInEbE9lEiQxnxfGHEP8D9gedU0aqbeyLNk0NlOed+6Hj3jQ9m5eg2pEuCa+Qhq8Yexcq4SegPHei0MZyGYloBkJBPLPX2MegxyhbZNwfLNtCPCe+vdwRACnqaFhAQhyvO4uwyJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COVJZgo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYKjmTvQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COVJZgo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYKjmTvQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656KTCqk2450316
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 20:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2gWv+f/fbwdkZymYojg/4SsthxrpUFT8OVRqt0SRylE=; b=COVJZgo8TKzGwP0n
	yHB6ExIclAwo32gvoR8AxF95ZouKIhvTYLSnxyWT3F/0/inlRgvPXo5TG7AZ8n5Z
	dmJbMzgyCKB8qhDNQHUOazrOLaR6cN/QMuR32XEFM85SpxLYguQOnRluHKqObHSn
	3jthKpW3KtwOxqnmCpHIxVdGuB3ApYdTwYtYOBqgty8weWGScBur/wwmkEaFMtb4
	tFuzXQ2l0NPdPahPNIk0nVGQ3DpR+qdPgLPTTbELUP+lGZ+96byXcVE0a8GX74RP
	eIGHTOxm0dYqqzWf4FhIBMN5VdoefIQWyja9LAb3Y1AfzIkjBUfuH7P0y4UsIJWu
	5PtdBw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98ctnxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 20:45:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0b35fa876so38819665ad.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780778745; x=1781383545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gWv+f/fbwdkZymYojg/4SsthxrpUFT8OVRqt0SRylE=;
        b=MYKjmTvQmmqGpHZUU0W7rq4Tw6K0u4n2855YukKOstSOd+hyb35khoZcvv7N1I+58e
         Df+Q8UjTf6duHUsnxIkW3+BaX/DGQMl/T/3552dcQfn93AImlu2gcxxddwJbu3k8p+F/
         4hzGlv3Yx7SU6VYOB33f2WcfB3Uf402biHGByNGvSg5n+/Q0iiC54cf55Vp5pOX9ck41
         ltcd9PU/jIzv77omG532yiy95N3FKdPw3lNbI38bX0r13+HbU8lbBZxV5Qqry6vNq1fQ
         4ZeqknOVy6zQHFmbA7QX0AgQcBy01f7qYLdQb7Xkhsd9P8C6u35Bv/azi4l1zRiAlMqR
         WfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780778745; x=1781383545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gWv+f/fbwdkZymYojg/4SsthxrpUFT8OVRqt0SRylE=;
        b=sBaWm7hN+NiJ5Fcq9ERNBeW45I/yziiFVmvCTRllULunhYHWuRjKF7KTfaPZOPXdda
         urlcj0wcoouKOk+jjsLurZc7e3ST5zMmtAXo8nxrH0Xlleg460cEhN/XD3muaH5Dilpy
         4R8xeSnPqMVNSmayXPXHOym4X/kLzlw70Y/BZrNdupYtDGeMFWlq4VlLk9Gf//cRzQAJ
         Y9CnosW7sZSSRg2TmhxiTCi5iorPCCOJE27vR1XUra4pLuRlijdRN5KSBYcg1bFIuW/K
         xRawVYb0YAnJzhNA8912ya+iDf90vF1tDeFxi7NLZ6GDuGyahZmEMh66ONVyaw4P5X16
         oaNw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZS2ioVmj8llEU9jm1FiI/6nJBbcPbf7MtkH7NZ/JCEYkANc00XdJleM3H2XCnz+AHaQHZtxj/+cFq@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEcaI4Zv2YtyQOLdkDb6NwX1XQFOGZfRXzdiAS0GhDEgLgP+j
	t9efBRby6+OgA+FO68H8vtfkEqLsCU5TMeygB4aFveMU6I+N4IqUEQWH/NADuXhiRp1Ha3X5h9M
	RWz6FvTUHXjbR7uj718HYR1XhwdYkAfXK8U1AmR9tRlmi+nWFmj4jMPd6HQVuWA3y
X-Gm-Gg: Acq92OGyhn2aetlafKTZOTJ2cWlxYLknSGziYBm4RJydeBwvhjKQJsgqSfPHHCOyy21
	9ee62Un6OPHtQqeewitFIhHIgDXGRMLDvFtdSK4Lnegga4ZuS4FncVe+S5gF5ORx8eij2xU0ofY
	tOtq6CBJ6ezXzX9cMYgXIZHiapk3YuZPO81DU++UjeR36Z5hn7QLyTb0Wb428pXs9pWuSAJbdVm
	rtTCaB5k4r54SfpcaqFZO4NCPGH9bdP12elXDSM0e62mr499j/MncPjqXeLulcjUFthH3lkLmtG
	WTAF49MExH6BLc8BAKgd0rlV5yHB1CfNGD0/kBTlc62nLpuVJFXfH6RtzPhAEXbN77KoZdRxkcg
	8GPJFJBv8AbwVZqMOkF0GRsAFZ9z3U4LN8YmU+aPfV8RPVvytT1pPMEhWojRA40c=
X-Received: by 2002:a17:903:7c3:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2c1e8214345mr67680515ad.36.1780778744733;
        Sat, 06 Jun 2026 13:45:44 -0700 (PDT)
X-Received: by 2002:a17:903:7c3:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2c1e8214345mr67680385ad.36.1780778744313;
        Sat, 06 Jun 2026 13:45:44 -0700 (PDT)
Received: from [192.168.1.8] ([223.190.87.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664950aesm125445745ad.69.2026.06.06.13.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 13:45:43 -0700 (PDT)
Message-ID: <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 02:15:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDIxMyBTYWx0ZWRfX+f7s+fJErItH
 aI0reFnuXHitgw/7yt2Rihy4QKYRdTdFyxWWcMmXFqrrQoX1cATCm+K7Ro2TFk9DD/hISaxFZVy
 3fnSC7YrXgih12/3w+Fs95yPeEQscxM36qE1v2yW/23wIfbM8mUuZ++7Mb4ZNrCzQe/wzebP3x0
 Lndppq+yrmEkBGrE2KfROTMelMnPTmYylkIhpei1Wq5coKTUrhrej2KiWmHB/48GZXEVT93pF8F
 e0wUwj7oRYTUHfQxfrtJTgXl4hchauF2BIOEf8wuUcP6ug1yrB6jTCJVuEX2kYa+4JrH1b9kZr0
 /ce6roKGO0l55Htz/FQrpp9O34/rPgbDi556vCN/gpppJFjUWYLC0BCtUedR6ctdpco27DQcDhW
 s/MuT0eHU9/j3ygC5doFo7qOvhuSHVdMKBQBXvm+wgxQZkwbfW/kWAI5LroPLHnFLuf6YO2hj5k
 GcspAjETYM0TdWZuYvg==
X-Proofpoint-ORIG-GUID: bdXzkhZtVv3ovJ-O-dIhuX5HI9lrEAKR
X-Proofpoint-GUID: bdXzkhZtVv3ovJ-O-dIhuX5HI9lrEAKR
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a2486f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hwwt4TTrG29xD97kRhuzDQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xhZcOr--89cURCpmMK0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060213

On 30-05-2026 01:57, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

This patch still needs patch-series[1] as prerequisite and cannot work
standalone. Can you send this patch in same original series just like
other DTs are updated?

[1]
https://lore.kernel.org/linux-arm-msm/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com/

-- 
Regards
Kuldeep


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08183B893C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140106; cv=none; b=A211maSkdecHk3C0YnN4iYBn4IrCWTOoA/Cm04Pu8XeiaJw8yk6y/FpOJLHoFYNTTQhCdgZdhMhUafbcDB7wswiclf/0cqcOEsU1ETkaDbFqO0uHjh0MlDbB9e3tbYd5Q0Nqem3H0diYnkmdTHB+zCxPk/gij+VYNVvcdPHeMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140106; c=relaxed/simple;
	bh=FgduxqAJN/4yXlRUpfXphtaB8HHTRCIniH9Y89dmFHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkRC+OZ73g7UNhKXLegAJzybWa7rtOR/Nh2Vg26bh5dqQAnmXydbcxveLmwZ4dSZSgUIedZGH2Yb2Mo5+alk3dlndJDB8tPehdO3iAxAX+XUwTpknQJNyXgw+Tq5BI2GsGsui2w0vq4SJAa8yQqJRJ5YZ5p3apL4280OZ0AN6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRXKtf8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNLthHSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRXKtf8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNLthHSd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6pPAE3493014
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQSYtoobwSrDaDZCgen9gvuu+ITWOfQ/PJb91VAnNlE=; b=eRXKtf8t8awd+75A
	hyaIANBuZnaZkDz7oEeO347KOb1tuaxti/WURMN78h/85zCOXKh8kgfcKOLJzdbv
	QqzhxLs0ZhQwtg1N2hS7ZVJXQdse96ITb2CwgCMRq3ZV88bow3vuvYZ6gWY8EgED
	9xnRS2LuOxNjTyuDXuh7LFPHOV73qvd6K833PpNqkk+rxYU9ANEqWil+Wn5Qkt/O
	hNp492YYRDobXbJC9EZmAoiK5BxVpjH4bryQmju5V9R4ECifgVd6mSnMHhh87KVz
	Z0oUl5ZhPgbrqDtHkJ0Ch0zafePOUuDscAirYYhAhszUzJB8SZNQyAtmuzlbwn8W
	vpSbzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wud08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:41:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso16975451cf.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140102; x=1792744902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQSYtoobwSrDaDZCgen9gvuu+ITWOfQ/PJb91VAnNlE=;
        b=TNLthHSdtjsHDbHtvlvwPHRsZltBy9osRRTiF15WDiiqfIyyVhTst5Wk0Hn70/PnUj
         //q7ByqhaxuC1fXht/NFtMNAhBbviHa9GpJqhn6IV14YTP2oiauJYBRx6Hy+bXBu8Wzx
         /IDTOWt63lYpvAYIgEpiJBcpu8khySG+v3s7CfX2Bnf6+5X9EU+tJqDcdUrmKh0Uo8Mk
         lXB24aoSkH5s13KhMXDNkDpgedb6NosZ/xOBiaH4LvRKK1wNWFpgPgZt++gc9aiXCnnm
         D860eajXZaNt3UvezFq2Tawlqt0UVEFsTrWr84s7y4XlLINNaEk2EPwLI6gvgoUBYKnI
         LyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140102; x=1792744902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQSYtoobwSrDaDZCgen9gvuu+ITWOfQ/PJb91VAnNlE=;
        b=XFbPM/x84Oc2y+sdM2a4KJ9bb8F/XVXusJQYprFlR9bapRyMvajzrCjrvRiemoQKVZ
         XfyLkRN1PKHI7txR1MBsizCV0kT8QppUHp1qCDt/ISbowSTLTxJ+ukO5h/WvLZOW9vnu
         3XXX6mV4Gt96sHXKVPy4Rwc7vZX0nm33OymkDodvP9UOD+QO9AyOHTd8v61ul6Z8nwzZ
         NTJIfdkQZSq5AOmuJsPFMWsqwibirHYbaCh9juBd4kerrMn4Fs1VUSEV7oE3XiNzIF3/
         B9HJ2qxPh95RegW+/n7K6d5AXCQFj7pM+m5qW/YukUkPmSVfwC2iftJmpB8+8oS/nZE2
         sMvA==
X-Forwarded-Encrypted: i=1; AKwUvBzJd7tQ5WCECBYywz7ArYQQMsrKwBf8H8wdMPKKMkzZPnZSdKF2dl238cppTnSgT0qRh3Dy0h7lVvHD@vger.kernel.org
X-Gm-Message-State: AFq9FYI4k9sOAIBY5MRipH2KcoIGZo3HwCMv1HsUD1EPUencCi3Aqdgb
	IaLgsnuVAmLe2i+1epEFygjCqJ5RZIqys2dbQT0rBdtbbL191lbf6Xee5RnRKRdze8WiKOUV8ke
	fqZjVl1zX1FZoiDCtLmDSDwSwYaqgOjodYd1bjeljuU8H0+Sh+Jo8/1ihBk0uUAwrHvmPE8Ue
X-Gm-Gg: AYBFou3CoTSI/SAjR/HV1od8BfgPQVn5jTF4ABDBVMXM/nlMqWBrx8zh8pGK1zHG88I
	O0fRhmEbYS6WAU4aC5FX57zc6fJPgF43o0cVOObu+Nz7/QOM/oz8Csm0T4r3SECs9/8RPQvn5CD
	Fc09CtbCJgVP+o+2hTi4M1uZngZOqonDdJ26J1nGLt2ESZaViv7GJXQHBo2tGbBoQFNIOHX0kCK
	fwKes5o4PT59zTiJDNL5dpeU5QUtE/ycMZecj2R65aBIuel7wktcVOoywk6wPtG5QvIZQUSGBTx
	8IqW+PVJVHBQpiWV4tcfm6vK2j9tpOCaPlvl5SlDuy8JFOu2ZHaDQV6nl0DSJz+hJ4eUa6E2qu5
	ku8s+nZFG3BC5MzLIX9A2UA==
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr8707911cf.4.1792140101930;
        Fri, 16 Oct 2026 01:41:41 -0700 (PDT)
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr8707651cf.4.1792140101475;
        Fri, 16 Oct 2026 01:41:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40918c5f47sm52057866b.51.2026.10.16.01.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:41:40 -0700 (PDT)
Message-ID: <b46cd925-25b2-4e32-a878-10ace8561a5c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:41:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8350: Add CPU and LLCC BWMON
To: me@fromdisposition.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016-sm8350-bwmon-v1-0-562fe403bf6b@fromdisposition.org>
 <20261016-sm8350-bwmon-v1-2-562fe403bf6b@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-sm8350-bwmon-v1-2-562fe403bf6b@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NfkYGQSM5vnP9855KVoTsk-OmzWTtDak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX//m2H88+pnKl
 7/1qv+3uRuZWoap67zZat5LzmErm2a39iANdab2sU5syf5VG/phlCuZdgCqpYnOF7PqdQRRKxBZ
 5TW2RGBgtvuox46Dqt4650xHsEuLnG+Cn4EVGaTNPPpjkEZBgTwF5YYHunG4sJxNxNQVjiuA2Oa
 6QxG6hbxOq8O4c4BATt/x1Eg9H/gDFBtQO+ecWyTOKNx0F12KSF/ni3B3ngF/SQiaBgq+1GVGEr
 QYVohDVffLvSclroN45M3nndx4qOeYxdu4o9ze3I5kDylDmBP75muv+/eXu+jeaGW5BJmn7tfdg
 iB1wu36roRuU3b3OHkVAYIC5exFlmezHh6ETFaSLdH9ftVcv0/NoN0x/eemxkGpmgkhFEqfQQXS
 IK/tP5fZ3zwVUp0nNWLxOKDhB7Iq/0nV8g9wBNOaDWFg5AbNzOElOsNRxKFssW1PC1ctkWVRpub
 9bZsFeN8jtbS3K0yNNw==
X-Proofpoint-GUID: NfkYGQSM5vnP9855KVoTsk-OmzWTtDak
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1e346 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=57t5E4kTxQTz6f98750A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX84gDqKVeXtta
 CV4m2A9gpjxdL5HSlBQQmbBNCxWwB4uybD9gKUIaJCI/vEQb1IPRANdimOZa31c6ub1/HhEIFnH
 umYdc38YgkUH5SYrcsgnc2EM7zq6/0Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160034

On 10/16/26 8:13 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Add the CPU-to-LLCC and LLCC-to-DDR bandwidth monitors, so that the
> interconnect votes follow the measured memory traffic.
> 
> The levels are those of the downstream llcc-bw-opp-table and
> ddr-bw-opp-table. Downstream limits two DDR levels (5161 and 8136 MB/s)
> to LPDDR4X; leave them out, as was done for SM8250.
> 
> Assisted-by: LLM
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

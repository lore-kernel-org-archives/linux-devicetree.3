Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1E3BBA09
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573123; cv=none; b=TSn14aAE/oKdlalbwyvjl3v09l9ia37sfJoZkVajeOEab+OkBW8+tuMB4V4hkA6xhlzFdTwxzETrBdWD3WkPCyilUzAwiDc7ZGZ7IbWo1nWgUyjVp7O2kXVrJG01epiKyqiOq7ihoypxSN3NIPojZQKkZ2WUdoH3SXwD4hnFCDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573123; c=relaxed/simple;
	bh=6BcyXUedRwNIZg/+M/T5XxIeJ13NgbgCs/YF2n5Wep4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvezZG56BNhFdiB2kCxFSyNNgWasqqLcyU/FU0MIaM4BpStHJ8CJtxfmByGctVU2xl2bVi5g6HTKJYd00+wkn+bK6yZAd8iS0BiaDeukj9eIu38GcJkzM5VtO79UXIr5TWNymipG2sEkNuhTXIV0nkoIdW6O3CwfljmFO0kIgmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKA+fSkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEolQ7c1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKA+fSkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEolQ7c1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZc1A2870643
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 19:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+zoMtv0ZCc2ved9YN/MjY3J
	Xy1JEV7egryQjS3u/wc=; b=GKA+fSkVJcj4UqVgYw5fvYwvP81c0aVgkDM6Lviq
	IpFN2gzfd+MpA//WbHQuidrH/zzQ2PmEHgA5XPTixa+9kOXkD7o3FRUVriBu6OMg
	22rDa0fATY/aNkinlm+oc3VwOC7AkBbjWvEXAQUQqXVW7IdEZ9G3aTUf5mNFhdQG
	l1LXBkem9hupA8NFtp+NZ0UHinzBONfXvy6Gyabh0+fqN7vdHqHG0oN5KowLBQQP
	qo6HqKtQD3B2GH8mq40pim6cvquFkSnKPB50wmWELmKGppTFv5nXV0d76cxQ1wcI
	Qg4kxyLKU0OCsCWH1yzKPHQrXg+NWlPIuFcKR05+s8IwCQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7gdca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:12:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-919879b09b7so3503086d6.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791573120; x=1792177920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b+zoMtv0ZCc2ved9YN/MjY3JXy1JEV7egryQjS3u/wc=;
        b=EEolQ7c1zp/bbDa590AePIyRfpm24RC6WPyBdBghaUuSIfBiGaMqahSHlEDq/y4JP3
         vRWtLas2SCW3fLSPFf7YYzDaGywFqtDXkSjKskw/JfnNCaqBsBM1SSEplNkE3WEOHLJ7
         2VC4Zqt52bg13xQQVdgFENOKPJJ3iMPL5YIqMDUxbwTK1SkVCPUdg00kzolG9unNa03g
         x/f815TplTVYB31D9svYYQ+CnD8OqANo/UlysqlYTKsFApPz6iyFSI/XQPXTNY5pGlyZ
         oUzl1w+FbQaJQIIRis6sSw0gtwX9b13P5Bsp6+7jXhoSugpyi5cNrKBf+BpjsSd9WyBx
         vNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791573120; x=1792177920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+zoMtv0ZCc2ved9YN/MjY3JXy1JEV7egryQjS3u/wc=;
        b=jbmYdALx+xaQ8z9jQg4fLWs8I2P1FmE3rKfe5F7L2NTLOWohYy2muCdt+to+ULeI/M
         bivA/OJhtFYMAmBypWXGQXpLslGeQlTpRyyjkQO2upVSjPK7nmt/4FumKeHMxyjqYOiF
         O3aR4XodCrtNMgj4+8FRsmGyz0xsja2Ix6r6faO36iaRHpSWO3mfLlgr+mvX0uY7maBs
         UKgGl5zsv0f9hZC5EPmjNhExQF8qYPKAFN8cAQk9Rlp4BqO1yvjDlvmLBVRumsnu7mrS
         eIG7BnRwv2tr0GTVQGcTerQRozOgWQylj5h8gVWxKeL9N53g8od8ul28NkQJezlH0F/v
         D/rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr/lMRnPE1gQrpcqP36YXj7ZsTfXV+tezihCwz/gXq7zZPAr487lJOfF01NvgcU0Vo3cZJ1J7qaRi9@vger.kernel.org
X-Gm-Message-State: AFuF++k1f+ElYkMhKMlvGAlPKXvT5OWBeUgQfqHFFv4elUfJ2h2z95de
	51RvtWVHfAN5m0VKD/YqhntQ9hbjP1us3dj6cqjKSkzKYa3vgEgZ5sy6t/MOCU0+iPoVJ1pC0G5
	RyOWAEjAy7XyZjB+zx71Pmrhdui4/h2vojALJF6m/NunJrE4rGDfhLnw+04IgxTb+
X-Gm-Gg: AYBFou3BxLFR74DmVMu/rFk2EC/bN23AzN+M0OnqJpAR71fs1Obmo5LPVrpeNZour+7
	GgGV0Vor3TceuDYO2KHVzTg2FTPJSd1p/T9nDPabTdawb8E6x8ZEQNgE7mI6X8mW956NV6E2hzE
	mHWUXfqCrlSragsVa/mDHiZTw1QAIp3ix5kuPPV1MgbZsdj4aFUJCkiAYmTa9XPTMKK/n+68UNx
	DUUwo4UNzigqBYY/N/CFobF9BiB88LIaZylErlr+eO3JJa1VGc3Mcg+/bhORcoYv9Mn/Ui9WRiz
	VeReYcBhY878agI7Av4VgPV41Yi9xxP9Ja7Qv+R+DpSENyUA94iYwcs0IxUQN2tey6MYbh4CBTx
	C8+yhMwuD0SCe6Ck=
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr471118985a.23.1791573120408;
        Fri, 09 Oct 2026 12:12:00 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr471112185a.23.1791573119702;
        Fri, 09 Oct 2026 12:11:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1fefsm88705995e9.11.2026.10.09.12.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:11:58 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:11:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: juerg.haefliger@canonical.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop
 omnibook-x14.dts include
Message-ID: <3hc574blvlfxelyvrki27dc3pjabf36vc3jh7muiisz7cjuvbd@qv5cjqvao6he>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
 <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac93c81 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=7U0OwENbvIhYZRclMzIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: e_FUjaQj_aUMNrGeLIMxOVPTuILi9G8A
X-Proofpoint-ORIG-GUID: e_FUjaQj_aUMNrGeLIMxOVPTuILi9G8A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX2hn7NEh7rb/o
 bLq+P66p+rU1N2Qb0ZWRGGtdztyhPI8LwodEFffeyubCU5m4/HuqS1BEhMCae/0Og+NqpzdmyIg
 2a7kKk/RkTOVV7ReRJ8TZSDMA+6vJG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfXyuNyOsMPkW4q
 8ZvvqTT2+W1JEbcNaXc4JP+t/DZcwm8LSoeQvObw0tuADEsRL1if9IGnPgP7FnaVRfOnzuI1gXS
 +rdMyqQaw5aEWmRsFA2fyKVd3AD2GDCU80u4Rk3bjaEYWv0yepmvoAhktXUBC12X4lbSsZpMkoG
 xmYr8dtjy5+9XV8a3B5bUA/0JIDNBDlzq/8u/U5UzAcu/ZRYnyv2ovjxedC2N8zNEqzuMSgJGJ7
 Gnu+QpdTy/r2DMqllvEFgJH5OD0bcGI+Y2QwZngXJrbbDJWn0alnVxeGpVgeDBo4uH7mQWoa6cF
 74G51HIArVW80wk2tSgRGiFKAGkXeZ8HoAKlbcnS2R3t7Ds3u3E3puiafqZNModXIRyacmkwO5P
 tpXUNScnBfxLx6rrUg/0zmkaUxZCLJrHZMNMI9BfSoZ5nmNXCfu9B7yJAQM/8y1+5nKII+ShAbU
 xiiPXCXQlIr2MX+32Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 20:34:46, Juerg Haefliger via B4 Relay wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> The EliteBook Ultra G1q is a different product from the OmniBook X14 that
> happens to reuse the same mainboard, not a variant of it. As such, it
> should not be a child of x1e80100-hp-omnibook-x14 but rather a sibling.
> Include the shared base platform dtsi to match the other OmniBook X14s.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

You are also enabling the some remoteprocs, so please mention that in
the commit message.

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

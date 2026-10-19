Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5D4B1CF0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405925; cv=none; b=FYIyLqfzoAYpeKgH4lPj2GVmv96w+J0lW400ht1AJVvak3Iw3IglI80BWcF7/gsSpWbmfOdCSWiJKDHTscc771+p4ROQT5kuwUiVK2W9nl/Qzt0yXg7x1sBzAIA/KJ4WgG6kkayYoG1RLgIlLbDhNIGPfyA+lxWUjEMHZmHpOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405925; c=relaxed/simple;
	bh=4trbUtUGxdoEwUCtKJvBBNIQl3//HqfI14DxYCxZ1JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUfL97srDQPFpBsVOrXhYcDLmqubMFMj6w/8aHVjTUdcoWzp5yqZ0IZ2o03nxN/+g2yVNKG47mNNLTwL8n225a7uAJ6hfcuN/wVccc1D6t3EiwIgYgQZD3TyH95fYFfyR7TfiY6wunmeTD9ZsX3VLbkeHxs8xt1xB/X+kvXmftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERcGbE9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A64ug3e+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERcGbE9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A64ug3e+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OmVL1348084
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5EmfudG/tQAKyrwRj4Laa20s
	3oN5QSBgeQVVbHVa7ls=; b=ERcGbE9CK/4fSPW/p7zn8UToX/Yi7ehIEyomS+Zg
	NTYqDCss3W9PfGf3Wgjcj6FLyfNMSq9FbZ8yTXUTnJMSxzRUwHA3EKzfriI26Jkq
	Uqx3J1pJa0ApiZLnyshJVRADpidW9+fO2dnxtaIdutAvycUdnR24TfJ5jBSNxdxr
	fFr+xuJW0wragQO1/aoqlIZBO24XeophYnUHOlaY71Q4h3k+SPniY8uiSH8lyF6n
	YrsqzhFxZLnIcxoeKGE2+t/+9OB718Ake761gYAH+2SIJ6l3jKsrUjmaaCe+gtdr
	+CKj3zZqYZX7ArQlF6D7Z0t1ujI9bZ5CazrfZjLrTfvBZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgm9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:32:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso469810685a.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405923; x=1793010723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5EmfudG/tQAKyrwRj4Laa20s3oN5QSBgeQVVbHVa7ls=;
        b=A64ug3e+eIXPqL/u1M86fEwgQJmgjdDTiSS0CusmvhvGpz4MpjeLSO8QDqhdf9LYrc
         FeI0+8ydiDPSe56K5y74QaDNwehJ7DijnzS/XnQMD8j/XvT3zZstoQ9cZrZY3vfkhGge
         CUcgbspS/QoE6y18unVG7b68+x9sY+7VCFzOH0lInLlsx1gc9ZakHKaIVXWTHKX+6iJf
         3i77bzrdidD3Z7z2CUSsB2YaJlZr16iydi8QJluIPqo8TmU2FwUOprkf0azAcDBjH39h
         ehXMcODrgKyrD5tUGfqZjgkrVrFWGSHCDYe3JLi8rXf9uk+C+lIuHvPTTHJzln5yM2cx
         uEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405923; x=1793010723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EmfudG/tQAKyrwRj4Laa20s3oN5QSBgeQVVbHVa7ls=;
        b=SvCp+eJZDS+C2CDxLwG8X5DhHjJJFJgA83alGDwnsWpV4tE93UHu8arQk72isqi4E4
         UlrEeuIJQG6Vs2cdxYrBkCMdfs8ld2u5/dBF4L3PY8oyrkB1NR9345KLR1D+lCWxnaYI
         vXRyQr0nw/oPvV6N/35ffCBf+lvKpf8lgpli7VYcrMQN64luaCuLS+rd7yr0ZO0zMy7S
         hNsfHIGZQTWKTs+/KYTDXHz1wcXgPmv5XEiQkB3wKtKREJctLNYTvrAuAW+5nlZRUQZ7
         RXdwcYJd50BLPOYD38L5x2sv9cgqBMp6yVMWlguGcX73QgBTRuu/WOceZTAz1DtApyt2
         Qh1g==
X-Forwarded-Encrypted: i=1; AKwUvBz0+w8p94mjov8gpK/zU/Q5qdjtXgc9DctOyBQfqOtooWxTiAnWHvzY6Yox7cx6zykUHNA2SwP0WoKD@vger.kernel.org
X-Gm-Message-State: AFq9FYIFwbyplTBEVvLnKkKfXZ2sI3TvSIdzX0utZfCqPLdd8+EGYTtm
	SlCIQZ92NMo49R00Ye4Fu0KdCzzSBUBPBCqpQFKmzmcrDD/J//bb5BRVeamzxU8ZZwZsN0igoEw
	GXA9mkoWP/sCCkHW7p162bEERLErvrTYe/wMFL55W6hKNZDH+HfuRxhpHMooCSUoF
X-Gm-Gg: AYBFou2LiLjGOb7aqGfSfc2J83GMyjsYU68MSh3BLAgwBEKd41UttrUrXMKZpJm/WXl
	5nNfGb6DWY6SY8vOfqvJrinQUSxMFNd1Y+YpSD8mTxP0PMc1P5pyv12Nia1cx/XvxdoCUBCfXZX
	l6mxiyW9f4hlyeN6OHv2cjg7EZzWZxgI6O7OeO7U41cuaX7cH8kiHlVzLZi9PKt2e+8WrlxVT+v
	1JXmxTGnjd/0N87sH6hNfe+ZCJFW+mjoIZC6CUFp6t276IFn1J55H0tQ+g4rdr6Nz9cVVrlROEO
	AyBv3yaGMVPPIiY5m7CdMseNx3s9jevpAxdgkpoJ5wpNTkObFzCbQ3hkNKqZH//zFZBBP5j6MbS
	aj3SyuOHxfjAOdBKt
X-Received: by 2002:a05:620a:29d2:b0:93e:910c:5fbd with SMTP id af79cd13be357-93f29db8a92mr1174459485a.63.1792405922704;
        Mon, 19 Oct 2026 03:32:02 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:93e:910c:5fbd with SMTP id af79cd13be357-93f29db8a92mr1174454785a.63.1792405921989;
        Mon, 19 Oct 2026 03:32:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm22322630f8f.29.2026.10.19.03.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:32:01 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:31:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for audio
 PD
Message-ID: <yjsxmoecw6o2guifj2kprmb3l5x4rqduo6hnvkzzz4bp6efghk@zssuwn6d36eu>
References: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YlwZKjD-N5BDV3YmE-VjPjjQ6K1fFPQU
X-Proofpoint-GUID: YlwZKjD-N5BDV3YmE-VjPjjQ6K1fFPQU
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5f1a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uWrXBvF99A4s_EMQbgoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX4zS0UTdp3sPP
 UPmab2HmO083UFI+yZLjDQQJdRNUGHG67nFkIX8XSd3AGmDYJ3fI8EssUUAIhJwQU5zeoNoEtgJ
 A+Y0iB2eRhCtoakJdSWtgoht2z0T9+KxYbm0Wp+enRrnY+h33TECJB9YA84G9vRtrkaEMC0Rx2p
 RqVmUTwP2/xJaY/bMYjHjuRSuGSs1R49AAjjz2gcIYG0ZqaQgbaH3rOgUJXKvjhPuq/SVB5gy4m
 npBShiaHqpzI0v8agUT8FSxC8YQdgwg8jDgNs5n2ds9Wrx4gy3LYlORgO4LUEreqJWy7yhaWGCk
 Cn5StvWhuUAG1YThqOBbybwPTcPFJKuiENy4JeRwaHu3VBmBWXcdsPch2u2PkyE5EWSC4d7Q66+
 5tjeU3fS8fNN6wZ8vrigsn7OcFUaa8EQIa+3e0ctfsN25HWFV2k1QJMq0/gPabWBRssenQPQmFm
 xmE9NxbhvEtQyjGdxuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX33Wcl09d1iB3
 GZvuaRUmpa+0mjpaQeBMJ1BF1LHZcVNHBjnrwHBKeK/wDTWMv7PWnMkL4w1U18Da6Czsg9suJwc
 dp8KKlwavJaSBs2YnWcKUmT5hepNEtY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-09-22 12:57:36, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

With Konrad's comment addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

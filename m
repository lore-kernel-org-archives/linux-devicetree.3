Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E96509F07
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787952; cv=none; b=WhEnmWvE8WJOs0zsmEbRHoocGcU4DE4CwU9Gcmtj2Q7I9uu3cY5c+CJ48Q7YvdXvbnDjcQcX3zGGIAKLj/i/AJDFUzH1YYE254boo6wcxqjo1+U5gBMZ/SV4m2qqjUXYgZFhph3/PI/NwtwDS2eWU5TZZzjLiC5XBIc2yhPLdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787952; c=relaxed/simple;
	bh=DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvOgg7I93jNajq59dre3eQmMihNll9C6m18tJbu9s6Rca97yaAWea5FN3JX2+5lTqyzVx7g7k2wFRh7cjb42ggki5Q+PEIhsNtGTGZBaOTwsnBl9IvcyjCZj9+TNyOUEvlZ9buVrQK0DZJzYYnZIknAMHrXibRFkG6aAtQ6B+lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ud8ylrjn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXPojz+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ud8ylrjn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXPojz+Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxsU52404711
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 17:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=; b=Ud8ylrjn6gYb06bc
	iYxkVcqcJXH++8WPDYQ1lp6I5wzr2KAq8JLzHMjq6EH6c0riMlwl1jrabnrvA8RJ
	kWVx7VwNA6FOmYmOrwsFGje5qsROkvDYiMUHLIw+adwwmpuldekaaRySDhwk+zZf
	JmmVaCexOQcocxjUV//JWyWJKKp8agU04FuETL3bDc5f2dUI0OcUHHv0cgzsF13x
	6ble15madvXYl2/OEGf4gJg23K+ROL+ohrKwEXfA30KFq9rTto7kCPCt999pjK/M
	msfUeMdFUQsIXhChwURX734Ual6hFS6/xYAE8UWIUgAD0RjKV79hQ3GDGigSdEnA
	OWq3fg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2je9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 17:05:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2e0bc619fso8974735ad.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790787949; x=1791392749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=;
        b=FXPojz+YNYS0cLT3m1n5Zg2D53ynUXfp9dH3JhStsCRkZ3WoHMvmdSjxYpZFNe7hUm
         FhH6foJ0bLKAKCMDT4HVnl5ZGjlYNhMyb/VvdTdUfYXSQeLTYuLAxBpHELpjvogXKcKz
         iv8gy7Arf2a1Lo65Tr6qOxTPLXRk+squTQrwmVXoSt/N29W3qSo5tny0cWqWmrJLRt72
         BIDj7aLhERMaCY90VUXY1npIZyP1qBZzq3gWJjEncFZ+QMEUu7uSvAcfb2AaGx0+rA7V
         3zQqlg0fF7ET7fAYjsEIYbjyxYysRvemMZ8c3xFT05/mR5neGvWoSwEbhrgRoCptg1na
         gs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787949; x=1791392749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=;
        b=T2IzadD8XPmb3di42+rIVy08KeMq4Q9pUaCa1kqZycrjAS+ZoMZLgzQRJvitFE2vCD
         4jkBxwx9a6Ma7ySHCHMVzj7dp50wJ7FrMpj+jNxATeRK657q+7p0L5Y4z4bDpr6Ytls2
         z+T6W88dDqjnkaIfkcE2phtZKMLDFXODms+uZhkGT0EBrmUxoyjzGhwvsRTlnlZegwvh
         oSrCQmhAHMwkKGb37ak1029xzjwmXHsVbR8Os+owwUDB1IlzpsJ791bE9F10GkdBq7HO
         ZHHi6XwbeEUPazRI9ohxH5mrxyYSsVcUdu3ZzgecyGivpX2MXSwSCyxzVtPu1dVkEN0E
         xXFg==
X-Forwarded-Encrypted: i=1; AKwUvByYADvHNX46GlgDh9Hdpv0VMjsRwo7954QnQLdVxx0moZXDwPf/6KVey/PJF/qbqUPT/BJugtc8asGh@vger.kernel.org
X-Gm-Message-State: AFq9FYLeATtp7VY9PP6dQAOmA3AvrhgH8eKHId6AIfETHZ58ipG/Hzn8
	cDERNq7D0B9EzAK9d07QV3GFnfgv8xcbLAKVh4LqOTljhfPW9lpfp1BuXXDzJTuMBqRhL0G8fJZ
	gmPlWFtYDcpdNP5zJG1csF8iISBwPbyi7LP/Bb/VzDn8MWXSBGTC34I0qt27pk2/u
X-Gm-Gg: AYBFou08OoCT91XUnhqjpgnpunG1B0FlHi6iWXiioZosiSQ4Jz61N3LcwDOB7ZvzalW
	cn93RWq9R0LJzs9/6U+R/ujiW5Iy+4IvTWkUgpFzUOWw5F76Ryr0RX4OusL1qrj4N7bT9gRhxWP
	qxtPLZq2CF+FrX4kJvKREpKJJVqV4KRJzYwN2uAdy+LDyAVuOJMYp3ubsA5cMZqWL7IgZr9tlz7
	hO1EXtbZsNC/vQXLbTLMiXjYAEf7cQ6X9B5MtE34s8XgPtf4am095/Q9Ant01kA8dlyxxzLrpr7
	HUvM0I4YLxsJ3nCG10KmKkpweyMullOREXV+dcHhdxdVzFDfHIheln61egLdTvdB+3i53m/TYJV
	ktkGAuOr9rnNwXQXhNksCcblgDGmcIVzIyF0=
X-Received: by 2002:a17:903:2b0c:b0:2e2:cb85:60d with SMTP id d9443c01a7336-2e2e4bb19fdmr16830595ad.53.1790787949288;
        Wed, 30 Sep 2026 10:05:49 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2e2:cb85:60d with SMTP id d9443c01a7336-2e2e4bb19fdmr16830275ad.53.1790787948702;
        Wed, 30 Sep 2026 10:05:48 -0700 (PDT)
Received: from [192.168.0.106] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b31e05sm572195ad.62.2026.09.30.10.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:05:48 -0700 (PDT)
Message-ID: <e25bedbe-8ccd-478d-882d-3707e176fb51@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:35:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] Add LPASS VA CSR HeartBeat pulse clock support
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX5ZmyW4c6rPyz
 hg/4Fthpa7s7p+k1H2tPBcxcQvB2vJpXsvPXGeC7KeiePC6FpMw/8HzwLTJTna4OR1uKGFh9kQR
 CNhynmNzBZIypUi/ZZISn7rbe5aZ+a4=
X-Proofpoint-ORIG-GUID: 9ae0IJRfvWiUhQGTd1Bh4kIXUa4pjKwR
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd416e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EGVZlqAv5GW_eZpGnoMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9ae0IJRfvWiUhQGTd1Bh4kIXUa4pjKwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXw9cUAep57v5A
 jggMWcBkaTRJjw3eXnR80E/6F7gomNsXl9oRUU+3CnBv3d6vJGLU647KLfbxcr2ClrKQq3opTng
 +B2IOUghxJH8H+kOVx93XhVnqnv7x7Iuhim4ZxZ9RqOjUXPJFDdz9hKAi19WEUhOJvwQe+h0/j/
 fHcUh7D2PdGfencC997t6v68t6FInv/+73BKkmjaCTlOLyaCM5CdMJ1NIT4+3fsBtfX4gO4vGgF
 xPM745tmFZy6ebmGlg47j/AIzVOuqAuzdwbsKvDEfGRql4D7YJbaqdwR3B8u2laTPZ5bFeSXcxN
 k3TYMAm8bZnhQ0E0cbCcmx2cJfYNM9LiOQNKCuUhOKDZbLtflEHtimUYjXrf83a5gR2ikihy6Kt
 ggFGQdEDCdi3Z7MpObTsnpfMFiyWmapBw6eFYZY7arj/WTeY5dAJr9BiStq2+0ql4BDCFJcr2k9
 dp2oNSMNkQfE1ksnh/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068


On 9/30/2026 3:21 PM, Sarath Ganapathiraju via B4 Relay wrote:
> The LPASS VA CSR block contains rate generator hardware that produces
> a HeartBeat Pulse (also known as RateGen Pulse). This pulse
> synchronizes the start of the DMAs and Codec Interfaces for the audio
> usecases and can serve as a periodic wakeup source for the DSP.
>
> This series adds the DT binding and driver support to model this
> rate generator as a clock provider.
>
> Patch 1 adds the YAML binding for the new qcom,hawi-lpass-va-csr
> clock provider node under Documentation/devicetree/bindings/clock/.
>
> Patch 2 adds the lpass-va-csr driver under drivers/clk/qcom that
> registers the lpass_heartbeat_pulse clock and enables/disables the
> rate generator via regmap when the clock consumer requests it.
Tested on Hawi - WCD Headset Playback and Record working fine.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

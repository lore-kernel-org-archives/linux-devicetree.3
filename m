Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584674;
	b=JbncBdAzDAxWp/roCmeeqYXsxFesYbf5+Xw+o4YRMSH9JFuh5hTDekOD9I+XPRzs78UM
	 bUTXdtgeZKDLU0ai0MnVSRW2Wx2WazDqDNwVOsG3ks4PBs+9V3AN7T9T5kS2Ird5m0W6J
	 q1Uq77/VwcasFxDWpzEH5S2leRdzUETSOft85MbF6mQtM8wK4RyxMu2emDYI61C2dfvSN
	 0qg+AfsXc+2DRa2ZQB8JMTX7i1DajJiiP0F6KEGuizPgLYIccbl4JcYjhpOpY4LHht7CG
	 XNNa0stNo6WYr0j75lBSC94iMoKd3XvWXXjPANkV5Q6iYTef817v+wDvYfgm3TxQrrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=;
	b=IwxJsQhXu5BEB9SBnGJks8Xb93B7qVqJiV9LTgm6id5BamxAeD6PWH7DPaSctN9n/1b9
	 y+vv6zEbSh319cev4Kw9LxjfN2chwBtWRo0l/fWYaGdFG5rvqK7O3U4fFhDNHoPCbkGak
	 T0a1M8r8HQM7/AKs96cvZvTJASWZkPxCAbp4nuMe5vS5wDzfZHOJYDDKa3drNclkKRJUC
	 5zzUBn46DYZ0bFNOcMKH6SpT4jDp3+oXuFGSHjjFdOHSFjU3NKXhIvHOY+Cx3/KE2xNvp
	 dHsxSBVTYlI1ThcvAc5PAdV2wg/2chOtVQORu/m446QCc9k+yfhZquRopOYUYRldwEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MEIdCMK/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zn+qX8o8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41504606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41504606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MEIdCMK/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zn+qX8o8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B2MI1096782
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=; b=MEIdCMK/LuwkdpNR
	93/yWb4TDT0kAnXFt/vUOMBUYgatoskzQlslxdeF4IrVukwHLxB/eXSEYnERiSqa
	xuHc/9NsyTf1vjDwS1B3bSsb2HOEdycYrMscWTk0i9XYG6uGcsN076kwgfp6REoS
	D6Qit8k47rVADKbX6R0KMP/Vr1+ZVSBOkBjbyd8kZCRv7kShCGFxhVzp9grCim1F
	V1+kf35DEd8tWwJRp4GUe/IGj/Li1uYrox7P1sK3RL52CbWW1AFnhYy+fRjUEUdh
	L8Hemk6cEWwgL0iueBe/HxvxhGPwMJnWTV3an6kZ+a7qr9EtfMZMsWyrNaN2Qnuu
	y1TUKQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5efftkgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:31:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cddf142187aso2579920a12.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795584671; x=1796189471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=;
        b=Zn+qX8o8ljDRGcebLRYsy585B8hV1Q/agiRR568uBQJnTJnYfCFGr/7E3GvuWZpKyD
         jA4cbStfA8o7EuZw1FeJ+ymRBfwV0Ij6ZPVlUviLId5Yk9g9GlhOveqgyQHR5QJoc/fM
         kIf+f5LZNY1tXZF+eDm+Ql04MFaTRm/F+9LvVyz2Jv4sGypgPAYj4xZFTw8j5Qa9h7Cs
         GT4pTF6pC2nbLef9lpQWcGiWMlta2NlPXHpLkcs/LnV3YlbrgTOHzryY85/fBwveBH2Y
         tmOXmujNNKoDNiJ71LWqDDwbRfDl4Z5L6HzFL4l/GgapADpT1Iz1kCZ5+cYPggKYhZsZ
         5qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795584671; x=1796189471;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=;
        b=rBEkYFQOmtPj0smYun0Oeu/9ubPhf/xBZtVNwyq0HJ6xk8rOT7fxSjpUNklaK4MCKj
         h1tEZ84v+dtSBQiIG9fE7IUkn2dXcrxuv79+BGx/jCCST3qCUU29/Mb4Z65rUUbcuK7a
         fHURJJqKQZ+eVv3sg37q8nNQGPz7uHyDOqfWnmrduHW5WNOJAFdH/ZbIvBEOaSXETqM4
         ow+6qM1nGe4ezgEE9SoQqVwQ5aI7yjs8sQrP1wN+eW0zGgMuEbF9zeNH78UZwTyNayxL
         vSv0T4TtBx75XHmgbeE5vpRCaFXxjK+tB0KYvbYgoEKAjKshXoGhZ3Dh6Y6WGWQR7VoM
         q0bw==
X-Forwarded-Encrypted: i=1; AL+hErE9D0td4XPEDkpmFkw0WAgVS9ZjZCN1piMabz+lbIItx47IIqeecINHbAueKiSHF9c81eZJyzgh6a/V@vger.kernel.org
X-Gm-Message-State: APuU4Z+77yTVjnt8Jj4fLjhtcB5Dxcr3hgGDaB0Haa2CmqQPVLjJF7Gs
	0QW2yTeuftgDl2UAlsFJq/wEldUVvymCWM+PSh8d/gGyO2Pve1gAFgw1H+5sxxynPlGGH2uJInN
	dqffqixkcJDpXeedjPsJpmbtC5Zl3m1f0Ov3P/KUDfSnDgVcMvvhSSuq7j/3yNiPP
X-Gm-Gg: AZFdTZcDUB5oOhN1yT7VV17v9c4ggfsUk74o1m7RWVecepUG3eEsQUCJaYAEPRNoyEw
	VR1OIR0ND0H0/R9bRu9pIYnjAmDFtxo97iHZuudbN7rV+ZP62Fat0g5izEZeMWaPT7CMqfEZe4y
	7r9j3OxS4lukUZzTYDy6gdU0/DqminqgxKSwGkF0eHNTrl1b9ukTVD5v/E+x8nljtUhMq18XBF2
	MdR8YyD6ZP4BfyglTN0l6fwv6KD1NIKU6MB3sme4qhWU+cg9qjdm1apAehCOjOFQ1hNLtBItxnU
	Yf0zd/xw7XCLUJMm/Dtmg3NbJAf7QEKYtyrKbAcgqjwtujz1cMwux8mBJMZOvOVuAFlBANUYUXO
	sXm8Kv1Z+dODY0w5Qi5y3zFJLk7zCbL6ttTcnbu7Vcf5X16VVnSLNbAkE1nF85xuDJ4VHVnt6rr
	2A4HEW
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr14553297a91.1.1795584671018;
        Tue, 24 Nov 2026 21:31:11 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr14553265a91.1.1795584670520;
        Tue, 24 Nov 2026 21:31:10 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm28528572a91.4.2026.11.24.21.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 21:31:10 -0800 (PST)
Message-ID: <45453937-5fce-42c7-ac1f-66aa94dec646@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:01:03 +0530
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
Subject: Re: [PATCH v3 0/2] Shikra: Fix qce configuration
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <f3ee6297-fb83-4b1c-b083-f3b15fa082b5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f3ee6297-fb83-4b1c-b083-f3b15fa082b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b06729f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jYJX1yTOf0vTYKAZykEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMSBTYWx0ZWRfX41vvH2Li30WV
 YGxzDDXtUOBRz1zswgKu0T8QhP+LCILjcfEKPep4T3unK3hdEp3GA9Ol9mLsKfDHrjp9Qee0X7x
 qK20dhDeqASK8YfeNphfRTTtIMkggRPowNGicm6Bs7OOulhqqufPvl/jQtrRCQyjXZ87tJo8Z0h
 o7WVXGurMEFlEv+lO2UPBQ5mQdcmQulbwrMc163zQv+TVMqz1lWM/37mI3VQBqxlAHK1mFyhCS7
 vbUpMj1Y9x+PCUutBSBeu0lxiI3L1VyA/Ml7nusWLNU5N0ZzD+PuadYT08kJmrnlQvEm/TvKztH
 ItVF3vEfL45ScBYxvO9bf3ejj2ssBtJ4aL1QMZlCQ8h105lZ5yyPvnU8pQaCH5zHBlCj9g+3N/f
 4/IlK9hkAGvRajurjJS47AAwmIhBps6aLjw2MjuKWqOVTI6pTdfuSMVrCn6IepOSLRh7foIUv8T
 bmxe86txHpe130THteg==
X-Proofpoint-GUID: fTpCriqFOxLTs6it-zCouPhO8s_aVWLy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMSBTYWx0ZWRfXyeQjALFg6bNx
 utgu/Jvzrb2hkpsnvcoHL2Hkmtvm9RxQxyIsFPEvDobnNOil+M5vRNgCOSPYcnzbVV9ZIBBNR9V
 DNhitWwRG/s/vrcE5GcOaUonup5R658=
X-Proofpoint-ORIG-GUID: fTpCriqFOxLTs6it-zCouPhO8s_aVWLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250021

On 24-11-2026 13:55, Kuldeep Singh wrote:
> On 16-11-2026 14:29, Kuldeep Singh wrote:
>> Herbert/Bjorn,
>> This patch series fixes QCE on Shikra and targetted for v7.4.
>> Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
>> in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
>> backward compatibility.
>> This series updates shikra fallback compatible and hence, both patches
>> should go from same tree to pass make dtbs_check otherwise patches from
>> individual tree will break dtbs_check checker. If dtbs_checker is not
>> blocker, then patches can go from individual tree.
>>
>> Bjorn, will you be able to pick both?
>>
>> The patch series fix description as follows:
>> Shikra require explicit clock which is omitted with current binding
>> description.
>> Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
>> voting and crypto was consuming it. With proxy vote removal, qce need to
>> vote for it's own clocks explicitly which is already being done for
>> agatti target. Adapt same mechanism to Shikra QCE too.
>>
>> Validations:
>> - Qce probe and kcapi_convenience.sh tests.
>> - Correct clk_summary output as prepare_count and enable_count are 0.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> Hi Bjorn/Konrad, Can you please review and comment for this series?
> It's important for QCE to vote for it's own clocks as dropping proxy
> clock voting(patch in review) will result in QCE issues further.
> This series fixes that.

I mistakenly replied to v3 instead of v4[1].
Kindly review v4 for latest.

[1]
https://lore.kernel.org/linux-arm-msm/20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com/

-- 
Regards
Kuldeep


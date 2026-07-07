Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435D280CFB
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783399533; cv=none; b=RIVpLTqEKl6Vfdc4GJTndn94AdzqU68za3xhY97KzzFUSNgHFqV94hUjsFhSP9JJ+h9i+XQz+jRxdkWE7ivE4u8avjJdCnXg5dXJAPkiUoTkVtUzy8IGln42aLOsMjvbobE+tLZEQYmDQcmA5OtwUdCGGmM53YEDyGy04+FYBvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783399533; c=relaxed/simple;
	bh=bOaen4HQBqLDxgRE5hyhkg9PTG8dtkmNvWLObiWeEAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6ax9WID8dULMqqVJ0KGi1SwQNGaMizH4ADBoYUXvUN1LsMu6Bknoj5L++4wlGqsU/dlncGFoHgZdg1X7x/Mdy/BRqPpZU6xKm8nbRm95+IHw1rHDom8OyR8TAyEthNmTQC+JqgPPkswJ9hFys1Qbz9lbIEwtbRtWp1VOh+JzsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2F3xtTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mfi3pp1t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2F3xtTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mfi3pp1t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748gB52514326
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 04:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+k3HncfY880D3KURL9SNiHOlxwrlnkZIkiKMuzSj2I=; b=Y2F3xtTfyd6BLRRk
	BgpGOZOoWOxO0apoZ9nms/Xu0fgEoUlTTi9kW/4wYx9kzSi96rZd5en0OnaFkwHQ
	oay/Rdi+ZtPda9+o/7PpY7NoNgsTaNV9Z4LMG+LkBALufCDA6GF8NfxnpGu+8AU1
	4+KxpMvt57w2yZBl6HCGwVMcnvXUrQsh2GBdbsofVYMkUSzrHmFw/LzD3AP+VLVV
	KoEVOy/SYJyrQ+4GsPKBFS4YZG5EjevP99aAkDP8FsVqhYODsgKzSDvToIjHcCGC
	besq1ArKplIlKmIKnrETi1a+KT3YYzIrYVog1ZFTUcdXmq3wVfPb4gnlNUx5lAPV
	VuQ5Vw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8g6gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:45:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so357278a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783399530; x=1784004330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+k3HncfY880D3KURL9SNiHOlxwrlnkZIkiKMuzSj2I=;
        b=Mfi3pp1teW11+axrC+bBScKRZLUxs8pynUEWG3/cNFv+oPs2fZENe282B/Ddd1+s3r
         bG2rBdXnQWdlNYPuQZyrIejjX4Kls+aGBODS0Md6RvhkCvTzpiJWCKo+z3j8ia6ykV2s
         PrR5Q8clfTwW2Mdss2qdG57GqjoIQHxwxRQsjEXg5H8w7qILwakL+36CFNXt96JPgXtF
         xRLH9V3ZslLwNDvRsAcGX33mxN+TSAIWqBjO1O2l8OGgZYn2p9eOV7o0nDnpJa8EZlsK
         R0V2pjc7QfYVkVkRdUyw9qngW9wIe80WR523hHLCfUH29MvmQ1jxOeWWIVXl8TRlzULS
         Uz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783399530; x=1784004330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+k3HncfY880D3KURL9SNiHOlxwrlnkZIkiKMuzSj2I=;
        b=Xv9h77CYzv38UXihk2SkFMv6s2vdnfnk6BaDlTGDUN0xx2KEvjfGP0MXXzFpqluExn
         Kl9hlHrEcpc9mzgadTRCYXn8use2C1t9lqANC49njmbA2G1dt3L+r3SpS0MXz4rUreaL
         9KUIN8qMNty9Mf5RnKmh33dGssRpAKVj4Oo7JFecHVdJJNR/nQewnqua7Sf+qt4ih9GX
         4UyOutrvboW9hxFqsgHpFSZHtqJW11rracjNzoqpBGRR2PvLvupNqS3xB10i0Wr/ee9N
         Qh6kxhYeEmiuyvsnn/avyWHm0CkY+uAn25pITr2T1y11RNg4Kvw5NfyrIN6qkDkSuZ6v
         p2HQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfWj5DGfeCAPO+l7iut3UR9ExFY08TJbWgVwQtYfi9HhOw8T6HG+JK35S6DlWF+2UKQxHvOBJCU+i/@vger.kernel.org
X-Gm-Message-State: AOJu0YyYcoor+3gWRqEMAJqMDFpk9miR6NzGABXQ9zZ18H/j7cTUUA/V
	n1V6u3FIttd6pmM+cOBXTBOxH4/yPkax0Q0NP9XXEq36/jHTho4Gr4i5PRTD/waSckfA2ORGehQ
	XoXpWw+ZJ0HyCuv97iG9uBd++wB2FzJ5mKCMMj69+V2hO/KkDx2wPGA4g1EUts5wJaZos2Cy2
X-Gm-Gg: AfdE7cnFAu6YlEPl4u9j8o52YtDsFQwhuyn30uqG9w67FCuuKOFgHrYKM2kXiIpF1xK
	FKYvORV3Nc13ZHN2fO+TQciFbTvN6FLmdWwwz3AIgDzmiL1K6grGPaSvGOlu1Jq1k1RlIbxgpsV
	3A+lHH1ic00GFMPsuXbrkDy9bvQn2G1pcZoFLT0+bKzPOJsD3xNqDs+odq+5klUJN613PtiVZ89
	jdGqhYcVwSzXcem/zUGWTOZZEWc0QnTpYjw8Py7zqVxMZK7cfXeGQOxnqDD75F3vLshB86kZia2
	Pckev6JoIHUUZvsLGa7Z3qoYPIxLh4e5wNt5BtQY4on22JCE418qkMmU4WnKiYwpQUlOBDN3Luj
	ql5daLmkE0yE205KzG78BnrDA4gQbCT8TABGKYZBxkA8=
X-Received: by 2002:a17:90b:1801:b0:387:d9cc:7dc1 with SMTP id 98e67ed59e1d1-387d9cc8dd9mr1414271a91.19.1783399530382;
        Mon, 06 Jul 2026 21:45:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1801:b0:387:d9cc:7dc1 with SMTP id 98e67ed59e1d1-387d9cc8dd9mr1414224a91.19.1783399529894;
        Mon, 06 Jul 2026 21:45:29 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483ddd1sm3586885eec.9.2026.07.06.21.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:45:29 -0700 (PDT)
Message-ID: <44d4c55c-bf8c-4baf-aebd-49ad35350909@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:15:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Shikra: Add DT support for ICE, RNG and QCE
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MiBTYWx0ZWRfX5Gan+Kgqm3dh
 5bOEI6P0l61zDHZ2IShJc0+EM+b6CK+7gcUxip3sEVCGCHApR1J8JkbiUEEkaIlSeVfmGPmJcpj
 RsF1rBKYUCNA7Fe72Ojy3gKV719qGWGvJ+diQ0jtccNTX13hryzgrQR4Ld+Vczo+C9AzTmiBmZK
 4/+DnAOaPah7F+D1jrw0Z5WZl1xgNwyHV+rHpNXIDoHSaOcgvtNuq/Gf0qk7tMORKqfHJ7R72t2
 RmK9sX5AIUMqNskRh/Bn3DKi7l1k0H9idgqvlUQ8Ok/6xLwpqahL02YsATgs45GcEB/K6THloGf
 s8F3JzuZBM8NgMel661dnQjNMrmGdmv239xPoKb+Fcd7tPPUgrFQ9zlkzXhiWWV+x6lSUEaGOO8
 plb4OdfecOpSfmySdOytVqSU7M15ORmnSL18omntlFhfpr/VsVNTWWPkwSGC7mSLU8dWrvXKqkC
 SGxhlyFh13HfIdqFdew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MiBTYWx0ZWRfXxZ1t2lcV5LHr
 BcdaYxzybJpgFAZfuJa3qCMrS4S98ycycPeOwZrooOKSBROV3yetoqJZbmAcpRBV6gx4dQlECnU
 ADFAFsqzhmR9XxBu29s3RU0hkx5rx3Q=
X-Proofpoint-GUID: PNIKAVtJzBoYLpUXYYZ7I-FB6YcmHQBZ
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4c846b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hD90gCo8i-7HE4vOkn4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: PNIKAVtJzBoYLpUXYYZ7I-FB6YcmHQBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070042

On 06-07-2026 17:01, Kuldeep Singh wrote:
> This patch series enables SDHC ICE, RNG and QCE support on Shikra,
> aligned with how similar support is modeled on other Qualcomm platforms.
> 
> These DT and dt-bindings updates were previously posted as three
> separate series. Based on review feedback, they are grouped here as one
> crypto-focused series.
> 
> Previous threads:
> QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/
> RNG: https://lore.kernel.org/lkml/20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com/
> ICE: https://lore.kernel.org/lkml/20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com/
> 
> Prerequisite series:
> - https://lore.kernel.org/all/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com/
> - https://lore.kernel.org/lkml/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com/

Above prerequisite is no longer a dependency, as sdhci-msm bindings for
defining qcom,ice property are picked for -next by Ulf.
https://lore.kernel.org/lkml/CAPx+jO8t_kQ5q4XmNJoJ1nR4Kro-2M1s_Xj93qxuFUW7VPQpTw@mail.gmail.com/

-- 
Regards
Kuldeep


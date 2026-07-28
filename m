Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368EA3B14A3
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231146; cv=none; b=P+kaZwj4S/u/vPJ7mqLEX3A/ZODzDcMIEpCiWTKTOpd8RCYwl6hEi3IPKHldMX5M1L9vxwNfOaEDQO71Vq3SIKLK5xqP62idiVTeWL1cjnxxUMFZCmG9vaf1oljElyI4MQQjrBNBAz5dBoRCN2px8VBVRG8K4Ecjga7/Li5F9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231146; c=relaxed/simple;
	bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2+MVVakNu+5pM4riW56WQLtrEJpipNB9aNyqD9tfYj9r52q68/jPNM4mGkfIjTvH+lbwpeN4usELdIlb2gv7sRA5FtZitBePz7+CP7fQtcH9nuwjUyhQBa23Tat+1mGfb9/gC846HFUh5ovZVW2kpD06jpQ4ADGxk5XHnUtyws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwGEsm9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqe/zWcU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwGEsm9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqe/zWcU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81vEc2071250
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=; b=FwGEsm9L14tIqU34
	8JT86Xw9NsHPUDED6BSAzbeV77w0HJQTPPIc/fXecEUHiYR1IuaDMAMIXeWeUxi/
	feZNTCesIvr98vPyp8uHXeGAQfR3uotybbL3LnR3tmdW9p0FC9IF+Bl5NwYL3GEc
	8910FyR1+lxHED9MG2NHYh1HNTxVjaKO5E9ZDGKQcSP3nYNYtNHfUul9RDmkAPKv
	2tBpQMopzrmtd1IRDACOwVIw70+A2gWlKKUbvuA4WC0IAvwWak8jyoyJVW16LAUn
	dY3gSig19aIsvSj1LqADyMIWnyd14qT/K5HmAuTZB0fPu0yd1vjpac5kcpQ17Ryi
	8WxIZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjgh1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:32:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so6805431cf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231143; x=1785835943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
        b=fqe/zWcUinBO6JNzpSdTRXKvR4AOxnGKvK0jAuZ0/UGM3vpUuIs0rzf4hn0ivmYhNr
         0lkUKI8wnGg5oo8k6dusOfke6mAxgHEWFl2jwxs3zMZyyJipkH3fq7WpBFje9x4iWei4
         qhtrwQxz5BzmO5O2gQn1ZMD1L/1WUhdwiyocxVyU7WKfXbuiqSOZXs9KG2yQRfPL/n6s
         CEIQsgWZVyNsqPIU58VgScDxEn+V7bgemYWIXPvlTHJAs9p4wgDtWvk76aV1VMOYQbZo
         Dzb11sBznGbchpGqWqoArqWOD3vjnOAr6oCTSVg6wUt1U6NpHugd8q1SHFXVfnlhzj/c
         pIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231143; x=1785835943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
        b=ev4A8oSYdIeh6MoNxVRJfMWekwyLfDZgD8Czo0qg/N2I7i9gQDgj6oFLe3TkMKJtVq
         DxAsgB/YzVvyszZ7yJuhdpx8NN13wpZ6dwHjMabvK71BOpScgtkh07LYYjewUEWEKbHy
         meDtBYMASiO5tvt6IeDTxbRO2sIKSkMePGN1YCMvfkoomAb46H/iKGTzqxJA9iGwTcl+
         Dg26t7AbcjU68NI+9xpvhEfKRbZGVotBM6Q5yu7+eomLc6fk7GisavzCAqD5xMO+3DaB
         lQXCSrNAlEWu6bVek/67e3KcO4omDGAHuOKFCrANUUPt18zBdHSCgUFUA087IQWij8Y4
         DWUA==
X-Forwarded-Encrypted: i=1; AHgh+RomXEL6XIE9khZ8ihlOGMJAADpWnmwihH82JcL/XhsiKDqdWcHAaj2FftaQ8JvN2fI320Vl8bh0K9Ih@vger.kernel.org
X-Gm-Message-State: AOJu0YytRzx1hX6bGX605i/bitgdCHGpIk/JRXgZJ80PM/v/Ep10V4SX
	Tr8e1PtXHEsxhbMUV6Q1D3tkhkb/nzE2EsnZz82Z9SRy7jBpy0LphN5xH37wc0q14Ot8luopjD8
	laD7+Oo3GXY7HADO95fOF5iPb/aHvrCQMaXoqpeb6wQCSaNEqp/wspYAye4qXLE2O
X-Gm-Gg: AR+sD120bsrrXnHGAy4MDc4DKwX55eoE6+UzAlz5BQbysNPZ7PhrHtwhB8shYPHwaLQ
	iy0aFaPLwTi1HpjA3MGNNwnIX31S5icMc6M4AXhenuQWh01MisrTvHqF5c6/o+TyV7hzxd+NpgR
	/cq5wD/V+fJa+q+2J0YvxhUKkjYNkcjmbfpteqdx3eq6JwIcZHgkVL7XVu517w2TEM/V+xmrDdx
	OJLdMcEBNgLsl40KpnybGBM1+LxUvlR/ygDEb/Tp8m9r1lQ2gd+Mff5PjjA6m0cdpzzjGz8TpUL
	MfEhgVOfj+oKwvLVCVNK5V3ScPOYXWS++VXcGH+ULn+5pTE+k/BbZDyv9v7JQYHJLQ/ltWh4Nw+
	YbggCIxfQlKrkOL4vAIxsDBXB
X-Received: by 2002:ac8:5e54:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-529d708f340mr9811191cf.1.1785231143398;
        Tue, 28 Jul 2026 02:32:23 -0700 (PDT)
X-Received: by 2002:ac8:5e54:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-529d708f340mr9811021cf.1.1785231143029;
        Tue, 28 Jul 2026 02:32:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb59468dbsm3835627a12.28.2026.07.28.02.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:32:22 -0700 (PDT)
Message-ID: <c08192fb-7d5a-43b5-93ce-f17c5a0b3cb1@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:32:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support for
 fixed clocks
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cSDuBiEgZ4aomiwQBZ2pttegqvjmMlUx
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a687728 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=XRWevJX1GK7jOFrGjf0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX994Tt6W2J/Gs
 gGO/GlXSMVA3lCPgGH90bN2oVeXVmTDzQd0/Su9yDGT2sFrLj5JqQjHLRW0G2VwC7lMTC4Ahhrx
 5BMaUQmmrxDGYsVaz+oNLQzvDPs9cAw=
X-Proofpoint-ORIG-GUID: cSDuBiEgZ4aomiwQBZ2pttegqvjmMlUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX4z7rK3kS43eg
 CKLXDzYDT9lxTW4znmyl5FJtsAI5mKbuQQL48U/iWQNXpzezfFve3kJGiTJjW8FrrOfm/qjt3SA
 sB1sQSdKMSMikPq8XkRbDgL7I3Pe2mFDAkxnt3BrEmr3Fh+R3N31qMdGHZ8jPzldDcUwV00qwOI
 7fJLq4ExP9L7q+s7cljscyXytsod4ikQE5+nV5K7lUtIP12yOvN5CvEy76qRnqQQwXudmnBiiPs
 +9F3A9iHqtH/hofk21zbMo7aM+99N5ElYcFKhtOg/A8M9H0ZuK0J3owFhjH4Ax9cynCK6HhSY9Y
 iKFNGVGb8ysTbEBWq8OoWAQ3PYsh85qOls0yU6dZQYceOX9JHT2pCiJ7YJOXbQOLIovivQa9cBM
 2htSQBfVjTuOm/dssKH1PDeEq7DhSKviy3d8Nh6FBMPGXhMtddWy1iNO7Vt4ro0HiKed1eqfm2O
 E5zaCMa5rutROTFQjsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/24/26 5:00 PM, Luo Jie wrote:
> Some CMN PLL output clocks require a hardware gate in addition to a
> fixed rate. The gate control bits reside in the register
> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered as a
> composite clock combining a clk_fixed_rate provider with a clk_gate.

Would toggling this register in .enable/.disable not be good enough?
Do we need to register a separate gate?

Konrad

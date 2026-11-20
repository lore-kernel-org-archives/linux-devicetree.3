Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170133;
	b=cVB7cpcJCTixQLk+YDkusMvW4rWQruQWxqrc7S2dSbjWWzOK623uA7isH/Zq2koG9Lph
	 xVMNWWWUsd9wG0cp9ACDqauSS/nDAz8U/CImVUBtpamtHEYwn3vcBpOgsSv8E8l2rrgMT
	 NXZWIkI0XY/Yb8iHG7SSV7mph3aC9+5Jp4kSxxAFKvkO8t+RySn+IKfN6p2d2QoPuPhPL
	 mgEk2TGvy2w8sl5sAxDq7lryN3yau5wEQQQ51Tn0ALmuCGhixxxVf8CchOWEE5bzms/e+
	 dL8EYxjLVV5MhRPc1rdw/BoK0T3QTbsnywZkLPGFNtXhlnWKjVxZS57sxj20soH4hqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
	b=pA8+9whAp/ADakFwtZRMnJTgP59tMn5f9hDeLN3eTrK2OP5cHtJK0qvUJj4jTebr2zg/
	 +l2x8Ockv7Ww6S+NCqWssPWv64MBQEprCtASlgvFI/WpRVQFTSRtF7C9vrbss5k0QMfP/
	 vHlSWggfZSh9/tFqGcYbQiMtZzoku8OQh+YnfQUXHxox+XqjWnboSvxpd1zjoTvEZ4bDP
	 oP0SQwU4EmTZKg3AYUppYzEk1QqWn26EXGKYG39WtEaBEQKeH8juwIEbKanGrct3kM3lq
	 OtFI6q1ENjkO2zq+Xo4Ms2nyFLFhzD+raz9BGgnr12Bt+HXI3hNPih43LQsj9A2VhhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5960A260A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF5960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9eknd917031
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1MGMcXxwJZ7aC9YYQ26OH+G
	9qkkBjw1QsP0VNbDjno=; b=YEJ2QkekzsvzilqybtrIOF17/qu5tiMJz5gYXq2i
	HFShxDd8O8TMOBOkrs7njtl6bDfpWdwuKea9Q24JMTx9P8lJdjWKehmYDU+PNtik
	ztS4KTSOzgkKO5nylH2EMOUPcfTU8fyWF67Bk2oHWAss21DgNZ/1kF4AC7AwIUmD
	05HxTLs/r4sTBFOOgNwI8Nj8TDohDLI/1aA3EoAfdvWx0ODmOeLTH7m31aSEuRBf
	ihQal+uRFTomuyo+Tas9ZZ8zKZFG86yL3lk5tjOoglZkI8UFmG0BiTrIWRRX/4cg
	mqTjVlIDiyWg4hjDu/Vw4MluqBu3qEvAufJyjIZHNmDz1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk5wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363fa3d3e4so14324531cf.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170131; x=1795774931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=eWOo9ers7osRg2E87cOLSOUzN9Mr7Qy4uMu5swGFJzBnqLl4QHUR2FGhMYNEDfRnAS
         VCCvW2Lhb7VD+bo9VxG84uoGq0Dp3SCQ1zI6dfxLshkb+n726dnJM4DqjkRv2hoDeO3A
         rozocKOY1Lwn16dyFg5l3obFE83VeTD1gN7+9Qq0ydqbeorBPO8BtT7xcwqPxcPbBGdI
         bOfEk8DspeUd9fyQB7UyHM2gAZjdHCNZtAp8ln83ustNec6D+h+EPly3c3BaCKEXeLM1
         3PmRPpAVxsDmQx2vQjIgXGBdH3ZE2THQD4ZUyVHKTJZ6gRCUchj9OIpBscglP12kZD5+
         KoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170131; x=1795774931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=PiYpSeT0LZmWvvKRU1ovSd2pF2Z7jX6wvBvbYl2q1A0vfV1VmK2aLc5Kyi/U6TRgLc
         VR/nrfMH26R9UFvtn09OraBebuoqSRLAy45c2Klc/9CVXZJ3dg/mcoO0v6Vv5+C6fQUh
         IFGDFh2M9OU2pETJNanyRV6EHJ6xKiF2cN5vv6fDmxdJCFYJ4+rGffTzrFwxsSdwk+q6
         nzg32pixMvUV5ezNXZ7wDH166d04Ci7zYCcFbi+ajIDEG22GhTsuzkmxXNmEEOCVHGMa
         Qw/IQC22qbJx1kqOWEKtMy8q/sTN/7dMUB6lFyZy2RQTsLaM+8JRnF7842InksOP4ped
         AEnw==
X-Forwarded-Encrypted: i=1; AL+hErGmr24O0TEjPJj2p/TB0RARamGtG2rLqq6x7fHwdEDAMsnJ/O+yWds3G3v+/ITUKKyGbjc11bqHYpqB@vger.kernel.org
X-Gm-Message-State: APuU4Z+z5XNYLkNK9uG8dlpkwPUqKdJCWdVo9w+lBUZ8ol+UGYxzG/as
	5iuzQODmJKv8iT8iXWV4JEEMtQKnaVF7++qCAxFWsX/Owc9PacR4Irek3TlToiRBeEtBusgi7pv
	MBoFgdLWo8s0BwPP24nZ9ihWyWJ6mOlySHWQw8BkdKvxJAd5w2aWX3LUbkktbcxZG
X-Gm-Gg: AZFdTZck+JU7sHjxQb3qD+yopWd40Gri6dRQ7x8EVMlzjNMda36nHEu7xa7NTiby/Ok
	wDtIxzpaCcVRvQvJ0M3biPTFbUw4T/gkYMEN4FQRek4lOTO+fEBFXo30WlSyGji4uNiTMqMMX4n
	eyAy/0jyQiYmN2UY1NSkELmeD4c0nwOveHkIPT/zt+be3nPraANBlYDvk31xwf82tleRK/4X1pX
	XpfUD9EFcqHU55HtXirm/bOrCH80WFPx4f99R7zdgJ2ZtFuJJ7F1XsOb7kc2eKPUmgyaqfscP27
	J0KyTR6TicSAmO38mXC+RKZnZa/YlTD/DjnstCBxzDq+5N5L67lm144gYZXsBnrVaNlbvtw53dt
	jIIZ8vIBHsuLwF/zBB3O0y9HsSINM9dk5LTP30jiYDaP93aUcy2FXAzQaiOQH7cA/
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563511cf.23.1795170130521;
        Fri, 20 Nov 2026 02:22:10 -0800 (PST)
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563001cf.23.1795170129811;
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm3906179f8f.46.2026.11.20.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:22:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: ipq5210: Fix xo_board parent
 clock
Message-ID: <gejgvl5guwsdfexjqnq7aafesxjn5tjo5xc6ireh6xxi3mkt4y@si3fqc4hj4cd>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX14gJfNFYGJP+
 TioX8DWz+UgvX7qCuwrdvDVBM3C2h+saHymm5M17jFjNZowL1qDeq0dJI9e1ttt9NiloN+NofLh
 hgKSby4t9PunO+kMtC1yZajvDUKV8rc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX1v8Pz7SwhO5t
 e9RqWU0YMPa6CaCwKhNwIm+bnCIbQZh+v41wE6XwZ6Sndfk/jw00IlNjKPYG1OvlwnLt25nnwGC
 g2T5j2j94iAQPCLxKKNoJwEGAmBduGiv88KvIvnJbkw3HqwtG2MKbwHCDL3/ccWEGsZhJgFc/3n
 zkYQsZiNAiqfH1O5IiXFfnBbLj368D4hheEiG757qVodtOSoqbJBNAKGQS2JrZ3ozvcdTWYoWtq
 ck12Yq0yjerNu2JlQrQPMXUF9bbzKXVwegvMdQSDnkgHgsM9nKta2RSObrtubcTvTJeeesB6nGA
 CpJ70qHWAgITH4q8SRjpOyVgfeOhWtsr4c28mj3XUarcyKis7l7+tedftlDvBr09pKdPFyLZ02q
 E7sYdPUJPKMXhG/LStsv3gsgi/siDjzMh/iMZAk7BsSjFZJ/zDY6WrfFXpTB65l+McKGvCufeBi
 hjZ/D3hCxgf2yhmPMLQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b001f53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=M5Hs6WqG2zr0kzIIc3sA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6ZL-WYxDpys5ZIWVKtIDj8st9qOVGpLk
X-Proofpoint-GUID: 6ZL-WYxDpys5ZIWVKtIDj8st9qOVGpLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200041

On 26-11-16 02:19:48, Luo Jie wrote:
> xo_board is fixed to 24 MHz, which is routed from the 48 MHz WiFi output
> clock (also the reference clock of CMN PLL, ref_48mhz_clk) divided by 2.
> However, xo_board is parented to xo_clk directly, bypassing ref_48mhz_clk.
> 
> Parent xo_board to ref_48mhz_clk to match the hardware clock routing,
> There is no rate change, where xo_clk is 48 MHz and ref_48mhz_clk is 1:1.
> 
> Fixes: 1d6abd242b45 ("arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

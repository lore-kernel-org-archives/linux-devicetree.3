Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163980;
	b=DGK8PjnVIZ0LrdS1B7DP0eptICHAouq0V6hcdhSNql4iZ2y7GVvtdIr0pDwvoID8S0v+
	 aQ+yrowMuO9AVW9GQKH1d/Gg5pApuDlfiC4MYvMWLlNJ7M465S8okb237tGEpjW7BRDgy
	 9AwsA7PkwCBczutqShy5dbH7njxyfEVfA8hqSZEktSdZpMYU5tGphpLMESdb92RtVM4Pp
	 dl7ugrtia//TxOkyCgFXXCdwRipQ4xsdW6dK+h+GoOZzCod21P0b2rF5mkKEWsv0/KSSb
	 AKZUfH/ri4m3mBjDMNI9TaJYmCc0h57SHVTPANaap81U7nYL8+04NU/faAYjKsA99yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
	b=x//5PQFuSRuBE9u5ozz3BTRsztwns+kaFw9i8wpjOLiYp3eTkfKY7YJUb0/BRd2sRFBl
	 GQOoCJ1ptcm2ho0rAWl93LWDKm1dEuId7iaswKUL3S06TUNtxVFIpPMHMqUzpSlA6Hg6J
	 7YZVr4qxWIOq40ATSEizfQOqlxzkt4mqxe9jxhtmok246mFt4+jhDbn9raUXFvUGMu6sp
	 s0C4ZVGD/Nklk/Uxnv3cPTlx8gVvqR0k4fcmCeC1FGskKSh2BoJoES5yIsI5eZLRdtLyE
	 a/vvUTjndZB71W+svQz4cAHhyZrjSB0dGMtu99Nzrp6QNKmFmeCGL2OtJYeQa4IdGMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGNIqfNo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i919bdSq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB3606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DB3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGNIqfNo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i919bdSq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2av1742122
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r+JhNs/hZmUB32T/4fK4AcrA
	esi5EoNhHXMKe2hgKWM=; b=iGNIqfNoVZ2GCLVc/iSdDQdEWKccbAIVyLPosy9a
	EcI2rFgZGwOKDn6Kbyqhh2ZdpxCBnAHiOtoQEtPnwZeCJmlwKl6JifwsUVD1zckn
	S1YTiIYhOVDgMasD4u6lURu9PmmbB0QhrhaUj9N6Xhl9Jg8RkDx1bnfbcMwuPzhl
	2Ke9MC5DxtnaBp8d1l1jgQI9Pv6a2E9CuibDfZcxw3Iq+k29HZMAYy6dI8jY8jP3
	0scZD3qqzbc9DnOSF5QuXlVfoBiuCNfkxzZx2JU9tba2nLskjYKNAl9usR1EhbAz
	lMGWqUJQ6c6sEhIuLIjp+/Om+o/fSEVfLS/b6TSGOkZ+rQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygxv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:39:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so124540785a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163978; x=1795768778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
        b=i919bdSqoAW7AvaV4+DpLZlocwtPaBxK89F3Fb1GxIHQIdYxUQJMnvbQTyUwxnIBJv
         ZJlRdiBCokaOHhhFcZRbsqt65T3clpmBBkr5XcnvzjU2tDTR/ymJZCD2BchxLLm+TyjX
         1sAuDUi+X+hnOveMoR7uxzVmJgRWOEYGEnynHGhw3fhArnBZleGxJHbYIuarjgddEmdQ
         a++0GgRISI2n/yk5AIb+OZapoyjRCRgoic/YcipzuK6uvtRpUiPIgcVSxpcAxt1tDkqa
         U20595w1mP256AEjPnk+ucjiazJfeitROC5Hw/ODoqfg+mulkLeb4+Ufq0i56Mhq+EJH
         Z8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163978; x=1795768778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
        b=f7Neicf6ZKlC0XNNN386GR7dCIbFyoNJENqUFQ46/wCcYRfIsUUQ8QRe53cIbXhyre
         DyY4GbBDy+hsB5iFushWFW/mRmSwTYlEx1MwchG/un/tuK58gyri9hcFJmnK1NkiQnO6
         9VHGk7O+VzdjEjrm3n2/A+r6rSbstPh99+V+9ERk/538qIw9xULOgJ0vJiWUQqiafawW
         gWlB7DOUyUVdGkkw5XfeBvx33boBhq5JkoTNHm1vACOmkmbkdyDdgdZR0ZHa0TVvO46/
         O+SjXAl1HMAG7lVZDXvKDOVvh3rW/FTut8esT8dAwmu7E3DRl4oCSsUgU5uOUhpjG5MW
         Vssg==
X-Forwarded-Encrypted: i=1; AL+hErEIs4o0O2YBEYx7FLIBiatg4deKjF/mzpIYHWv4Y97w4OTxecjUWU4OoftlTtilAbV3MDvf63Hn9+Jq@vger.kernel.org
X-Gm-Message-State: APuU4Z81V2iCrOy/izzHmCWEuKZigCzyEwdBvsG1L09rFyb+RYaX3yye
	VwDZ2ElJzFVFcldvtFz8UMIQYcxjyfO5PmN2MXBF1f/4Wya3Uc8HWL3ch48H70RcNi1KiXCWJ33
	LklMa41pW+qkWvslNPtUu14u7VWOmaBZN8zZp6K5a9cPugAzGCe6jCHEu6TvC3v8s
X-Gm-Gg: AYBFou1MErlxzoYG500x6j4yrcLUNoGNTqPY5RRPTDWBf3qGKTE2ntLwucLm5FHInKK
	FkHQex49SPK0bO5DiYFt2WOWvgQWSDPBBammJV+8/W5ZJkGThTQpv4qZlBdCy/59z8I60N5qNS2
	su2g8n2ISQdF0W0ID1bYpG31HfdyBnN0yGgOcGY2GOLxkxGqZf7KnzxHIKiphinEhgYMUmHLjCD
	t4qqrSQZL7niWnqfMeCCNQHkEw9I+cIrbWbU3NY0zbOxJrBRwRG6WilIRB1AcpuU3qOEmBKUWbi
	qM0ixoYIZZt/cEOtPLOG/gF7pkFK0DKuWbtZt1tsxgtmesKZm198isMUm7pNHrq1IqdU1UMLzX3
	tNvBpR9b3/LOr5khzQ8OOjx8u+pSGKQIsePcDNegoKSkdCZNer0Q49OSFauq0r6x9
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr362653985a.61.1795163977872;
        Fri, 20 Nov 2026 00:39:37 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr362650785a.61.1795163977329;
        Fri, 20 Nov 2026 00:39:37 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm111790855e9.11.2026.11.20.00.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:39:36 -0800 (PST)
Date: Fri, 20 Nov 2026 10:39:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
Message-ID: <f3gazpnmbfqjukqi5wetqokl6l5cy2xtuzvdtayft32qadbg6p@kgyw2kcgvk6p>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
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
In-Reply-To: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b00074a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kDRJwTVxGBJz2jiGre8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX8onU45hBlGIp
 jdM6FJgQYOLOwa3wHO+WW5gxlhWxotkAK/cwQfy+o1fu3QNaUsZiwDbBM40NvFQ+T/gSzAb9obt
 ALYPwVjMTsPVF+9J3m8wYO3HdPSrWgfDWkXcVzX/k1ejykEaybVTmNYBuuE60AYgcr++foXizG0
 z4w4hWUfUBk0kmtj0nA9dMNBn3KryOW0Laz6dX0xLUkgrMOD8nWN6bclHuvfD/yhWzGx3LjjBb3
 lpt2qXc9GVm74yWQKC7uC6/RW+v14jvcAbmSM7xo9YcYSzxfbtakp1JfW0gkt4QM3Jue3vlM5Yz
 Tmssdryx9sMTnaXlIEULt4fqbQXcCSWSv3u+MVgDwq84P0fy7ZMM6THK6Ia2y4XAdr4be2t1QEu
 2xbEeO01eb0QN5JWgxCdXk9gLYHlcOhThO1wvPLS8A8T/PYCV+jqczn/kBHUNFLFKs89LKhqqjT
 jK0rzCRSKThbdBYsm5Q==
X-Proofpoint-GUID: 2oq03OQHTZO3GFy368-vHcwryngC1wr-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX4bjiZb0z6yYl
 C8pGmSibJtBTx58mOwN/foXxjxyZwG3wnytzGU4j9+Vs7AB86Ckyp4J5LQn4DWvFbbDCyXA5GTC
 dBd7DqNjHyrfnRiXc0vvu6D8zyU8+kc=
X-Proofpoint-ORIG-GUID: 2oq03OQHTZO3GFy368-vHcwryngC1wr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

On 26-11-18 15:01:45, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462759;
	b=qny0EYPg30okBaKDRhhPlrjZJPVvdRP/e6r3DnJN3T0sz2HsFefsoklyNr8S/iwuRvot
	 tGIvkZDgZVxu6CWbOX0XuDNLW4iZ8r+Hpsba9glboiq4W9+feENOjvaVBtfSCq1S+dFfB
	 lOAGjzb+PZGBjFl8v76vGRz+J3aDwnVhiwTorpRwix7LgXKsYsRiif/FIm7BlqoGsKSS2
	 X/CM76XK/4fdDcB+yafWydoS/cF8rMbcnTctn5iRpBzjW4e6pd8oXqywe/DAvelBwfGq6
	 YDzrZTh7pFrYigpknPcvGbdCKnuwBcB1/RWLCoxNfaCW+xxQ90/giYGZZabm3bZo0cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
	b=VG4gu6lBdLFLszo3co7JKkkAxK/E9oh7SqXa54n/nREsQHIqKk4Lvq6AduRpwu1N5ap/
	 lUFYWN64QCaYp1KgzmOhsjJUeS2MBxFSHYzwRfJt0mLikDBGiQgqgOyQMohXDTpHYqwrt
	 Clv0tHDOC0PnDbKwFaiDRLrPVGdynf69tj69dhfLRPhpiDYCkeRxXmltSs8xfL+rzsZT/
	 Zu7OPGqQGSJeBN67iJnOPewKFz3JYNcv2JgaaFTPz3teQxQbjj+QaFdWrRruUganT6y/p
	 Xa0SO9ywWls9LU0Vvy0dPRCdnKvlWSDUOKUQR+/41aFWSgZTDLCUp0ykWFuAJQ7++Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWbkcHLj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+SNEDGJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA54606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA54606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWbkcHLj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+SNEDGJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3fZ2487357
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kRPbPFA5UaW8RQT7bD0uzKcS
	u4cYs79Tdy4dHl7KdtY=; b=NWbkcHLjy/t72kbbZhxphVhgOotRbFVZeU3gmCf7
	MN8hsmw5vSfH1vrzmSar6UKjUi2kZXsP4XJEtLLIfhEXufqXDoBjseO7zFUYImsa
	Z18VgkFxTBZdnwTX88duQ+/f+ZqAsJwa+rQFrjqD5T4oY1RBfXKRHbyOLQ1HhUip
	wxbUSarHXgl+um7Ebg/v0fdx6Ne9OkXeRNMZRxBkzWrOfUvxmuPxPGQv1Zljr4HK
	dUxXxyTFvIuK2oCAlur7cEHXq6+Bs25PBRpP0X3n8+zHIuluxSePyvqTeTV+emcr
	lNYGpEWZ9RiPpyXitzqqaBSR1IKk7k0ONubHxyRP5zwjbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03623-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:39:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so1050965285a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462757; x=1796067557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
        b=U+SNEDGJvUHMYbZoi3AfabeiVkhYN5w0ezrHjHFiyySCD2EZ+2mzY7Dmp8RoEz2KuU
         14L3dazZFtOsb4MYaZnyBfJgcF9vaZErgm3zOB0R9SjZaua4UuW9z/o+FXdnbD17e5oH
         2X5Npxbna4gec97QnydCFIaDCiAckwVleLBdhF7S0wZMbBOVtyiZdmmu0Ylqxmn/j8gT
         U7hn16tzZFbol7eYpKBAGi+UFDSJRnHQW9TH7JqTpFybue2Lvc8I7+t7qHxdHME9YAIR
         sCsimGw5p4cTnfQKX3k8DzziG9CxfGp6LlN2WBJ+P953jUnyXt3QyICqNvnluhGN9cEV
         8ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462757; x=1796067557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
        b=CO5FfDi11TdmL043OwF+JRkGcMvSlR4YpdyT4Spcwrs1Elh+/gL58RMEK3RB3weims
         Dq1EbBdl8iZiX/NZaWPJ0NGKEeG8bjsg9blNvVtz6p+hHkPyN2CatT9TMhuLB3Y09Egg
         r0AdJPhFNW3O4RtoIXwxVHiEY5pJ48mD27Mkb0j8wkxUpNP/0CBapQKivRPiTfmYW1fo
         sTfVw4w7Ys+cxtNEibOuEq86NgZY3bbW+vEcHyVpe8g+6mHdTct3U1nvm0a4rVL+0lAC
         mcv3lSn8NsdOtaG/PRb6li2ZRMii2CfhsKpq0VjwC/Vh/qm9qvfJN0pfWfg5+/rRO7gT
         bthA==
X-Forwarded-Encrypted: i=1; AL+hErEs3D0yMe6h7OgK0AfY3xgljGaQd6IBGAm5odKAnGREc+G0V01rJRNfrwZp7f62L6QMOy15uHVxQrlb@vger.kernel.org
X-Gm-Message-State: APuU4Z9OCayff5A96I2+FhWbLVtWuXVsBIbumnir3Z4dje57VlOg84tK
	t1961/sOSTsTwH0aFElYsi/h/E5/kxYuQAg5PDHKEfkYCkWmOacRyPv/oOK6lGtuBB0A+qkOpm9
	LCQjQ9WG2JPLxorYYQvFpQEJHPnlCg6X/FfLJzMxW1SIUC01MKiSJmbodKNlJLrBS
X-Gm-Gg: AZFdTZeRjkl0q1NPqDrsIkxtzKaQ7fQGFTIsdu3tDiU5jbKhDMMw1jUe1eYoy6oYwiF
	1xpaSDoGS1quqQtT+qwnGHxDh9y5EHPNhwZTTCHb6BVpAh280GccGCDAdSOhl69Rzn0pAdcelKb
	wEZk0N9bap0w6pdCI9qioPNNQLGTGOisi62l1owPNR+eKM3dQ/ei1k0wN8TOOWFpW7oxeYv+5uv
	ztotc6ruhwa0fRT++KVDPj20vxR02J7u+IaWtb5kckNzq8/sGkm4alLWt/PbXsgxxXnltSt7KaX
	BBldIqWRrTHbJID4uqvUQxKIcYYQzdkZJYA9eoqSnCDf+dDfie0RlNMZIkAgkPqAiO0//j6iFyi
	aL31N0mqU9YglLWoi/11Mt6+/WYzxen3iquhNtNVnCpVUX73oQ6b01rq0DsgMfTuM
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2389700485a.29.1795462757064;
        Mon, 23 Nov 2026 11:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2389694385a.29.1795462756273;
        Mon, 23 Nov 2026 11:39:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm550952365e9.13.2026.11.23.11.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <eyx32yhvf2rk27k74vlordcvqvfzugbq22kjju7mijwccltgkc@jbez65qjij5f>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3VbTpF4ZKoJ+
 PVHyrn0Go1BW2IKK5OYv85RRl2x2tra49FFgbnTAtxiMzVOpC13JNOLGOT08ME+X7lYqmBPMc3v
 mkWMAsPKQp5GQq0h+Evseoazr52N/pC+Pym9/k68dKaLnpXoAE7xMJo1fWWN5JfLzX6PUBUQ+23
 dzONmZWV0yYiucVkS5REy6lQ5cYc2nvAmKx/Az+JcCcfEoWYXZg9xte9NU0oS6EeImpH4lhDMvP
 vLdPPT7UVXbmzEzR2+Msq16RLwaScdJJYfGIUjdfnjP4zSw2fFkwyyqgjThBRf5NNefLVzr0KLl
 OuNo877OrcTMjt6lQ6q1jM69M4DBFcIPpZNI5OZPyGs+4q4LgcvgcCheay88ah5jq7OWOAe28Lm
 vkhhtNqBMpVxHDxrxlgGhDSyurvjIFTehD/Z1RE+SQ/MVd0xfboRBCZTQNxrl3IK437G1u9sAvS
 Q3nsN/5afZGIYxI1ifg==
X-Proofpoint-ORIG-GUID: fuMJtAP2NZEX7Mz4aKiQEsIrz0HplrpC
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b049665 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LikcBPw_WjS6U_9SOOMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: fuMJtAP2NZEX7Mz4aKiQEsIrz0HplrpC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX6CeP6ZGuHf6c
 fjmCcTghPZTQXokzQ4BRtJolhWWKZga/XHNGaSKFFooIBV+l1m/AGK8pdZXlfEMg0qeEv+sahkA
 UHrh/bM4K6iJ0ULM6JKlOhZUgQidvpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:36, Bibek Kumar Patro wrote:
> On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

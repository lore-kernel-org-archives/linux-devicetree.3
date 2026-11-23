Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462955;
	b=n/xqOCJsDc0DVqo9taF+IM13BN10g+6Kl5IhwP3a0Ixf1BLwE/eKyNnao3yriraArKfq
	 0citnTL8hWGGiD8dWw+CfVDqkh6ZGuHazGW4tJX2y0syOze/+BalEP8K4FnAsT9B3Hu3O
	 fm6+YQ1qwq6Sxx6Uc8DOvuXeQYDys5zs8hFBHNHSp2zlLjwYVAWxozNq7t761yq8SFagm
	 JBFDZjIVtcmCYtj4E7/xhjSTMKaprkrMlfBCGn0oIYtGov1tg0JekYEpVvDnUCvFC7be3
	 5FKcA+kWCObiAyjlsutZnddGgXOGcZcJAdP0fuXtaxlWgX/Bs2bTaDtNYjbJIH1wB3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
	b=EoTGzhgiTWU3DBXi08HqskW+e85tbNxl5ueOai15gFfNgOGTd+sYs4OWTvoemiA/tLox
	 wNPk7mBKFbiuvg5+FgCsU33oCIOTy+zhRv7oP5vbIEssC8EhEtFqUdp2l+4u5aEUEOO4k
	 mkCvpn5sCJ38b2robYCilQ1QVHUNNXC9juFKLAWtCmfKemd8PKwgqumURc4h/n4Rcy1wo
	 JqfXj4NuP08LWDCZB2El9npjsU20DZA/LXfR7zcTaYiv9l8hEAgRDd/JL5RKknF7GRnqD
	 bXwyWLmxuhXi3bHVRrtLW5lYCBmCf76G3lQnLoaS2Iev7QVhOKdSmLUPL8ZqnxiiKxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHD4ndNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNIqRFor;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6430606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6430606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHD4ndNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNIqRFor
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGp0t2769023
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FcFkDguCD/ilInffZmCjUgAc
	HpkPgkVvkAaNeAEJ7sU=; b=jHD4ndNqjnzEpOp7UspnMzN5/djWeqmgMuO5E9ho
	DLvkgeW4Dt6EABFF3O7vVtIUcdoVCjho2j362cFdBBbWcpiXdASJz/jJ5PGtw6Mj
	xndbTqmmmiCl3X8ZKTrvuMQFrad2NuNRcOkOnRI8k0WmaO6Rb/2x31Vw8pZ1o/U5
	hwlQApGnztlZ7nQBBb7LuV11IgUob9XhYF56Q6ZzflQ04tLdYXc85XxqY2zN31YS
	1agpdCiZsP7kgh8Uy2MXjNmEmpvXmCpM3iGIOnEsvmHtja0DT6IItDUC976Q/98G
	wZv+JGyxNvSiQZ2XKOug+BgkuPRxKqLDY3Xjm8N9adRg9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb4bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so692760285a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462953; x=1796067753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=CNIqRForyG48SMWcdmLVp4x/M11woHQsgCXYsfV20VuLwlJupVemYIZPh3f7PSI95Z
         JQpa3B/zxU3+KcwKwXuzSzlxLWGyQkaITl2qiB+KXo/IYRQX9Aa3eB8mIo6pbtJBsH1B
         XEib8KLRjSKMOUQYGPP3pATRiCoP/TAiC8WzDJldQNpveRIkNU9htr7u40+THbAGuXu+
         i8PfYB517gbQF94Z5W53q6046kHqXmALihVpQb1OCayFMbhLiSw59XX0nd0Kbx20OeUa
         IuJ9X96zJA5GCPwLnao1f4dwaDJNMUMRBK26HdONzw2Ix6b+kKly9NJsXVF20d3HmCtz
         lMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462953; x=1796067753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=ogLlDnYCb7pkBM8cqwhICTbuSJXZ6w2grIIikEooBWWlRvMc6Hkfrgjf8KvoUXhcKU
         r+J9Akt3TrHexbytGx7iyxmvMF/81AXp9dc+zlg2aA9JIJSzpncJhsMsmXoptKu3/B+w
         CMjhjvDRNVQ3Nqf2krGlMOxltcktnk+DlseEm4POI4WtYkk7z8tB+PvDGH8k7q3sXayw
         so9RgfZLnHv2N0yXqvUt5PG09doeP/THqcAik3hN84eYwOCfOee5JooYApDnaEM2WJsg
         RTUgZEDt1G6TADHMM2BbCQuamZxMF5SfC3D0NA4qwz4+LgvWG4TBLupEdIoqkSylOcMU
         67vw==
X-Forwarded-Encrypted: i=1; AL+hErFWlJl/nDjcAguVBISs+0yB2fNqkkiACXUsUdPQYqTix7CdckE5EK7JEN/A2GQgMoge676gqvwm1DS6@vger.kernel.org
X-Gm-Message-State: APuU4Z/bP5LkcAzXKKVnRPuwk5GOIImld//pF5lDWmF+na4T3GucQ/04
	5ukGep/WXfglG8NvCVxrU0rMCdAOwP9iaLGH5HSgivroTNKtJhz+9h06JEtKRlz9nThjxseqeZa
	2nzHKH7LBX5cwHITSpBIUn1m20WF1wX6QmmbuEtRsfyVYLfeJsiNePGzCMI48RcMx
X-Gm-Gg: AZFdTZefs6gJFNP+Sl3PzH9+2CNxBrxB7jjuNcDcqDTwedzQvHKmuVy8NtORFIyjFAM
	0sLcgdoPyNH+qlgpUB87/OSYCUrkZf0uRq7uQqaE3pSyGq9BdRSiiwg2Yf4n9aFScJnpmKwNPWT
	6Nkm8r/wqcm2IdyfhzsocfNIJetjq8VXvjL9U6U8Tx0autKGYzIsGeQt8eAUQbL6Qh3xJja7Meo
	GFkxv/GNHMBIg6NH5Pu0SHZyejGrOwhWl9bsJpA+5+FN30NiYOdyLIZ0jhyDUSrTcTfvB9AQCWO
	+P7zZEQMoLkySvvvx0Y/FTD8wuqqbW6z54/mz/V3Uug0HKotkptUXd5UIXHG8dUIKg7qRuSZhqf
	XqIzKZGNzh9ktBRNDnySc4oW1gOVu167JvN5DKUb2EcWG57hTg1TiitPuooflkGE/
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148823285a.14.1795462953115;
        Mon, 23 Nov 2026 11:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148815185a.14.1795462952408;
        Mon, 23 Nov 2026 11:42:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm374404505e9.7.2026.11.23.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:31 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:30 +0200
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
Subject: Re: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <2qyauqpne4p3a63jtwvvsbeyulgitvjrqmdija6pjkgh67m6c6@a5qe6jfxerga>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxW9aDSM7qW43
 OfdfMnASj1ZGEVMotQS6HUT5CVb2HFPU7JmUFC+dZyQlog3VTU95fIScMB7DCPnevzjFWzOK1+Z
 E6xbP0tEYd83lFjsIpbEH+UqA2wRx3ZbggQLAx+UJS4UbKsYFIrlvuUQuACPKcMBlMocMXhIJEY
 plHycM8YO4avdmneufRe1iPs36U9rHyMeEa1B5dzZApiU3ixObGT4IeoCm7vSiT4iIcv22bFc43
 aoe86xUcvWIRXrr4MkPOVkNe41/r5xoKSssfph3ECGP5fLru/B1WFZqCBFBmvjaG8kP6Z4qPeAu
 hn/xeBUoiLD0ZzZ8TgFSyqiE5GDfKKAcZa098Oa4vWIE0+ofwFkv2WuxZ7ub63kvdUnPzWSgFvC
 XkqpTm5QOdYFHC5N5juJoRAcJWS+HH6mL+Fp2fOUZpUd7sSQE8hNrS12K5wYbSQSalOEr0xj08K
 ywvDB3o2VPpYBMC83Qw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04972a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=II2oZZyV4uo1nSvD-RkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5gO38J-kYZZ-zzQY0_CykDn2QHvEEn8w
X-Proofpoint-ORIG-GUID: 5gO38J-kYZZ-zzQY0_CykDn2QHvEEn8w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX0ons8jM+0by1
 Bwmy7J2Zly3dH1U01iqOhoeDf2FK8spSR+mUkYn94nuIKd8YfZmAHBhcSK7D2qCWAlf8ewvRhKY
 34AydQHwa8trvkdqL0+PfRmrc2UeRew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:49, Bibek Kumar Patro wrote:
> On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

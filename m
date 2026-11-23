Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462784;
	b=1rOPDMZMiOF+0ZUHpTAiENfSJ8Cc3X7kNzCqwlgUU82RlHzXTKY5jNcB4bv+Q7WGsvz/
	 8RNWi6DZ6/scswqy6+/I/TqVzGn51o2LiwQp5+/DaStnSmwX6FBjDHaRwXxA5sJLEV6n6
	 siRhbQSB92hwtXzAjkG44LXPLarZqmlMGI9GU2xhE52za24nU7DoLKPl/3Mi7MJ95r9ho
	 kFbDvGo3cOxi1giX52GULeLIEjONCnC0WxH8TTrJNKPFQvTtf//IQ1APoDkhovvN4ImGf
	 o3O7dJn+kwmuq8jiKGa3JUbFINIGkXwgXD8X44SE9MCnQdWMJrA0HWI7pIaRMl7D0LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
	b=OteLarRVwQZI77kmlCL80W1j5BshpVY26CGLB3EVGd+wg8tvT2AC5Zcl6GzCf8npxN3p
	 tsUvUfuQWc1QZJzHI6iZ0RR8Lf9+PVYT1lJs6a74Ab5M6phvLz0tnCyjtutOjcA5EK3sT
	 Vo5h5LKuBMZpzlefaLrYNDGL4GfIsUeBcH0WdPmSpPZ+9qA9scGtj69SmODhu0b8JzrGa
	 wuey1SNrL0PgH6YqK6nSP9MpS8SEOw/NTmzmg1LLWr14QXA6UZOEX51COuF1wQ0ABnXYl
	 Y+4uwYbWG6LPgecOimW+7ljFLn5gwFxkWDhQ0pJ0WXZZ2IsFtA5PDo7+SBVph4njPKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCy04Ggb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0X7kGgZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C1606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCy04Ggb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0X7kGgZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGqXH846514
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/AsDNaCeIM26uy2qCHuktfXa
	Kod4efoeozdBzuVQOi8=; b=dCy04GgbJinPkzPCZYLQfsGaaerS4ZPo0o+h7QxU
	Y+cCSOzW9p8JUeiaSEkcfHdy8Vec/bNGlEOzsBhXarz5q0uXV8sjetqj0MUXVLRf
	CpFPwIVs3D9xjiDK5GX/8C0az5rsW5YjOLQdBrk0De6+GomJ7bqjlgEwTCEstDpq
	EcDYufpvAd0jwa6rWIJjnwJCcIttAtSDoTB1xaCvtXi67ULdBSZ74Kpyo1FeP6pR
	3J9uq+XSeZkYIhafRuPMBP01XPN4DQBjKBdHxyrKZVw6nn1zX7zQFSNueJLoTOP0
	BYB3oZ5uqtUVuKWJw63dPIqMoHFG4GFSC4TC6dNgGzgpBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74360c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:39:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d322fbso534335985a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462783; x=1796067583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
        b=W0X7kGgZ2EOgGH2Yqu9ILu2Y/Bfg8hiwlF1ZF5ln4LsJ3KQKEe3OE6c1HvTy48yY79
         xzPGobiYLtU3nFnj2rbUl6XYjSo/xdGbM/S00NjMaBmv5cu+/jnj4vlwHp34W9bV8/d8
         PuyY1JdR9LaYaZ3cfaoO1ms3ouMn/EwyNLfQ+YYoerGg3stovcaSGx2jaGDIB5SmDW0w
         k0FmS1XuXr+XdgILSj7G30PuQZSh0LRfR5OzJ7rHpsNiKjETcaFOXQxgi4rnT5AuOJ9X
         vQDJGzacpiWGBLcPYwA0f+85nyC+JDDiuhqgZ+qTvoMfI6teZwg2bXpqATz2t/AznwXr
         eYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462783; x=1796067583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
        b=Z6NyoVw1hKVFaFWJkfDwg5sg49uDn/a4X/ljUnis+2+D+pnpjQACuK4gCPEACNIqJq
         +rsfvTghHo1G8qHGHrYDgp6ptNux4H6zizH0sGySonbKcrxpg0mSTKsdcOk8gmYeGOlP
         2WDPz3RhyCk09PfUnrni9MLawrfltw4TJFPmyj5ENlirVSLvNAvj6Bxg9SwaDlZDI7JF
         1fVPgkhnm9l6IPkK31hb+ZvIWjxdZ2KR1MeHumYqoSHseiw/JKhJyBlurBQQGCcXGVEy
         C5l5sU2TF0R9WyJy6zxEEZzTHHVLi96zbhnaYMVy2HdB4uw1T/9TY0SUm8RfPspUT8QV
         t0MA==
X-Forwarded-Encrypted: i=1; AL+hErEYWe293Nrs/w+ZdosFy7zqStU6mBrhnBezeR5fvztHwoLTm3xwmawIuP2ZWFumuFl8J82o2p5bX7Sy@vger.kernel.org
X-Gm-Message-State: APuU4Z8IZYACxjFXnB0mWss4CRWfaAakaO1L+feRKPZpTV9uqnVzDWzG
	k90IwePBCoc5WeRV2L8pOlHURJaVSVOozEjG/bk2yBdc35ly59jVGqrFcii5FOy9z98ZeRQDXzZ
	0ubPH9paR4ELL6RuBhhkRN7RmLWwFeTR3DqNLP2IvrN0j8atwuPyAcNOeE5flNG8O
X-Gm-Gg: AZFdTZd3JtdVirK/Hl2yniZZdKdM5hN+biMorgtQ8BNKR39tyX8OYID3Gr6LYqcNzt2
	JUrKGwfQmEqxqOrPTvaDc9ifsrP+xtgwjtBDf7CdIf7tCkCyJuATn06tUWX6Q349Vf1WV3UdJU/
	tebw8GrFB9HPEaxhXDtW91F54yb1GuehhORqMSzOFhFMjcJddtvcKsK8LExFIAEqxLcQdNpyGOw
	cYvNwX26aefwjdNKe8XX6Jtnee2+Lhvhj2JWyxCePqL4c2ETD7UJq3bEHnbdDUkfx0AYt49V9yX
	ueEpkBMb/QfDNK5sbBpDYp4dKxdkZ+221ReSqCirzsBUjsKaoVjvZhkRYK95iSuF5EoOojfFZOf
	0n27fgJ2VQUFXae50wiLS/zCkg/DzS2ZDo4ETn4CV5XXiWtXwA8v4ur2ljJL7cM2u
X-Received: by 2002:a05:620a:1724:b0:949:71fa:5b0f with SMTP id af79cd13be357-949baa053dbmr2113159885a.61.1795462782819;
        Mon, 23 Nov 2026 11:39:42 -0800 (PST)
X-Received: by 2002:a05:620a:1724:b0:949:71fa:5b0f with SMTP id af79cd13be357-949baa053dbmr2113153285a.61.1795462782173;
        Mon, 23 Nov 2026 11:39:42 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm27574990f8f.55.2026.11.23.11.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:41 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:40 +0200
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
Subject: Re: [PATCH RESEND v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <itpvl7qrxxa3ccj6e4q5uaveerqcitp4frv4gmtlxj4y4lxv2q@4tk4mzd5ieim>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: XWrmGsl4KRM8a0rjxtIb41-xFJPUc1OU
X-Proofpoint-ORIG-GUID: XWrmGsl4KRM8a0rjxtIb41-xFJPUc1OU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwc7Ry6dxLP1t
 4puE7riWsTEhgWcOZKpAg8KLOaCSYosN9sMJb+symxvrTY8mPEA7rFIIJwMkB3pmPtfaZVj2XOl
 yYfeUuMSNejtgE0xHrxK72+WrMzXKt8=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04967f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fpZYgbz1ZAxLTqytCXoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/sgVF/mJQYxn
 xbFSVjJvNMroL6TTVgQ9SCjiUSaP2lBxiVYQQqWmXz326qi5A2gwAzM2/2GqqjfArWiOvADUria
 1w+9Z24WkhPFN9OSfcSj0u8TxzyJOYK5kc9Tsg/CwHDHHzW+v1JylFkB7Mh1HEE3Rj0zsnAukFI
 9hgVy3Fj77Vf8GU3yerKXNDA+N6mIih2YTTsVSGd0WeeLPHcBG1PPaXOIGeSNG1AHcI9mG4Yxuf
 2ANMLPrSLmd9B83G6QUH+Atnlqj4g8yDZzzBffvvmASuTQbkl8K273rSH7KA1pzvL8t9oj2QOKG
 w1b7uILyVuljJASifKO04IX68xQwF/JUpB/VB+hDA7QmCLSx7xTqo83mE9vH7x5Hc1zSGpWqY2L
 Ei656oj+0iVTTWpLWoDwelGG0kk2UC11+HmJP2SP+9telBZUT265PGc9PK+XEr07h9UZdZcx6ft
 H/7PQwuv/aB++iUJwkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:38, Bibek Kumar Patro wrote:
> On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

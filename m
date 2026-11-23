Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462882;
	b=QenI7AoTpme3tbzN2ClMlV9NWa3NoRMAhr54t6Z+T73E+g6ry+XnjYN0E8BRwapOBM/O
	 H8HI4WuFA5i2FGDfhEl2U7iCDNt8+n8KxMIlGb5++8WuqBzD18aUIMpLtivjmcZf93tRk
	 zn1mcR8RxO+cIvuBfZJ4hCDH+SbPFtLb47zDxzmvwcOKPGMtOvw0k2iu956ZBuJUftX7H
	 XNmeX1cF8TLjxfrYd2V4ckhIajWj+Y2dBkddGkK2hveyt6MD0DsHt2ohL1a47CvinKNpR
	 kdISLGEco/l/1/LT99xYTLUsqk1q20+QjmliwQUZVhsC8pKWDf1/7aRsUZZ/og1gtYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
	b=EzvgwhoRtMVhZBi75WQrfoJwsPT02aVCk8ML4Hoy7dMUAF5gzWLjK4jeQSbLTRf8pRoP
	 bsdwgIiqLDEi3mdHlNepYCCDqL/Scl5lySbBVuI0unAhQDFxdKdUz81Ag2rJqlAeu752R
	 RCvaHzzOkgD64XrIMveYtQTkNw/jH7tLy8HyiKZJt7o9ylpOadxcHzC/rXcIAFtKgzBDW
	 PTJ/W1I0del1P7wsAwFY0MyXdbZSiYn3JmkKpXzSsGKmIELQu/ahk/Y467fV0b5NvZkWh
	 KUnD2fxbD4/9Gf9FmdWKUjdKBI8d7DmSirIHH7hPBpcnDcMVoUUCHxMmoX2MLEx2vXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gwmsFTUb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNEm+xyY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CDE606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CDE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gwmsFTUb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNEm+xyY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNHX23440190
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vUxC6ouspxhWBpss9anyN8/b
	pVZ3ii1paTC8Jy1Fd2E=; b=gwmsFTUb59Zlc/gg1IMdg77AcKGA2SPYuhe1s2Nl
	e00LRSFZUHuu92szoKHByqwXiKxGIB4AQNljm3o49yyhK8/9ImAeHMGZcLVvkmiM
	ti6br/HGCe5iVbeQ7ldCmOhUUxf6v/MZlWhkgSRGoOlB5hYQFQisbuj2GVIZvjxS
	C4HaAFhERQAAYk2ktkBBn2itn2sydqBOzcNvDrN/t0X3n0EzYiesLa3uVmxIiN7o
	XjaNwU8jKPfBwO1DMbNj5DZ4PzBDla/MFvne+J/fZyYgUHEvqbT0NQ7NoE++VACe
	I2GHZuAK+4p4lNdv90dhhaBhJ5FnFinUWCFrJtnKJ+9VNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr82d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so590147785a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462880; x=1796067680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=PNEm+xyYtYD3WYMLO4JiGXPnu//+YIHMGSP6TKR7ESKmlF++vtlKuz549mAwXbkDK8
         /Q3S2UbOeR2y0qgJq/fBTE2orlnkvvBK+qmzFc9oJv66PZ7cAbuKT1wsD69oc5ic0EI/
         18wuE5btsqgKpHHxD3aYzIlbzE1GKZbBdBe8DVSjzLOC70vbEPmPJhB3k29RsBASh5B9
         dFmBlPdA8/vmHN++i5wJu4Ynzs0TLmMqcPwf4SjC7amcNEJ+KCfdjXg++UNDJwtBbXo2
         XgXD+JPbYEXJQClqP9awtz71jEl0pxcimi4BypKXPfVCuo5rWvn7Ce/nJanM1fnvCsh3
         09Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462880; x=1796067680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=b7u3gXqAASfBhmzuMqVO1R8H7eryd74PFmpW+3SA5sS9/ZwoVvs3ibx1mPpYX1xWwm
         9S8oGTTSTKq+8veV0TTWpFTkMSp6CxZRkrv7ANR9cjtnYUvxn+HyBrsa3tEasTcsaNoR
         rl5ZGywyn69x7BZgEghoNSCHl6Hvk3qMxn9b+VoMIwoGl2shxdsC2WLTR5AAtKpt/yxm
         eutdW5hjnOzwQnNy6zxWCSVbjZkNEqJaU5uKbFwmyNekWsAAuzS8Q1Ho1H2QhAR8T083
         HSrxpxy2alq2JxH9z15rVUSxraHC89oWy4JJKlX4khrkNBzF9ozRbLbMcZmwXmaC2byV
         FidA==
X-Forwarded-Encrypted: i=1; AL+hErFPU/GJOUKuegXvVlVV+d5fKqE2SVW5OZd+yTIV/7CGy3MpKWDU/xlKkhRq/VtCrPrgeafzIbp+GeMk@vger.kernel.org
X-Gm-Message-State: APuU4Z/NvVk+0ELuPxG4KCyYdQ/JrLWbyTiF6mQ0c4mop/6TpNaRZGWA
	ZabNO7M1EW/QXiHulY4EED7K5fZO31XCmYyRYdwj0IrIv9DOKnpLU4QEp0PTmULd6AlY0TV/jiH
	/IjNxwX10MeiSWXlM0BzapZj6IPXE9cP9QigtX0cznFEFrzYDQxPR7yky3a9NM5hm
X-Gm-Gg: AZFdTZdsInbDq5/Bupb8gYiG4Q2X8d1zQSsgYjgHRbEvv+OdnPpgLjwS6uXGbAXpw5N
	JdpsYQ5o8Su/zavSSKIYYTHrUlmbXkFuL9HOvSfocf0272s2dJF54PiiYX+FwYU4+H9f3g2auav
	P09ro7n21G3kYh5T5QI1LNUK8DJRQNXtEU5C+5BCzJ2KKp4kfKj4YRfW2nZZEIsARt+3O0z4w+R
	eByc7Jrg/PLu7FEnYPDZ/05ehUfpPpBxgjWGMJbVtjhEwgMgMckrOu7HvgFyJtZzqR6fKzm1r88
	5Q4c15qzEwXroblIhnHjjb93DXMFNovwz0X2Q8ZsNgoNVO7mTUaKswyVZ5qKjJ96C9SFNq5P4th
	8AQXkcQEoYOgYVtGEibrHppSandnXYprLmeRYHBj0dUXt+x6ebpz3mQIVp+1AEvSp
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832794285a.3.1795462879654;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832790585a.3.1795462879048;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23327384f8f.20.2026.11.23.11.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:18 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:16 +0200
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
Subject: Re: [PATCH RESEND v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ytqrakhhpmy6zdsdpqglpkm657ymg35xuhnmukifcwzowdokqg@2c3dewjxefcm>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3zeaaaWOP83Q
 K1kf+FCeJc5/YXdHRZV/e1TWQYPjNHkp1GTuHCctJRJbP5W9ZlFHKrTn0wzIOkgQcGSrUB1eh2m
 YupGicsGJw/oLCSDWj/FOnjlh1JQsh0=
X-Proofpoint-ORIG-GUID: KmCdWYoYrOQ5DBO00xHbj-oO1Qh6bzwQ
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0496e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4Hi0MLHxifxT
 uCIyhTQtaH4OKh3sIq20J2meNzQAKeQHVNmcSoXQ8l6UBYwH76eMitbxYLxVe/PWy7otAzQPUu+
 HsrRi+XB4KyZ45tSoN6G/rL7fv3aA1+hVPb3HHfTyeHAYBd7S1QImEQ/cNNAneKlVnB5U5SEt90
 i9/uyRwCZk85IDaQZxyaamPminIGKY1Gmawn7FWo49arp+tGVkmhtAjnIBNPbD6WU7nXgoZ50ix
 0I5QDFls39uJ+Xm3uerBBY7uhiHzBk9Vyv+Yjx9KJ2Odv/r52JokgssXcfk4OzsxzxRlMIOQu+Z
 cZ5a4amXdaXO5JfnYKeCIxnahg4R5RVEHz86JvaWKTHbV3Bbvc9Bz96K6LvnEx3/ey9EFnZotvn
 ijiVgOt3j5eebxIepZmxwJBlQBGVy16v+Q+n4rObzk5mVZopUDAG7GpRI+4tKPYWdrbDmKiidZi
 HsNymSBPqjkw7wWWhgg==
X-Proofpoint-GUID: KmCdWYoYrOQ5DBO00xHbj-oO1Qh6bzwQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:44, Bibek Kumar Patro wrote:
> On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463037;
	b=rmUYT7zUHWoLA5NsSe/dl8jEfisBAJ7zn6SsB9hViw7BM6NW0Ctly87julRq4Y+eBnv8
	 sExb7cqV8T1+urrjA5XQDWfA2lA1Nqa4HdVOOIeNuEnxsqV3iJW54f2vaH4L6G3yER9mK
	 Bxtk7PZauPlrWXtoukTw9iyESY9/CmJENw8AzdRfTEUgl5s7MgUiaTeaWBf5GdQ9miNQS
	 +a+NSSrM45qJyWq9tqWPo0mqlmWfcW2PwTlP9O9KI+LWtFgQ9lifdmaiikb/eXFPEFbSA
	 PBrZjQZycowJey/VgiAAsnD0IbnV818OsPCJS7pOJOzztbjmzYqVbgpSOPs4kEzVjmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
	b=ofBn3wBp4nb1CATnQUINyFmWJOkR0vJbig9inwK/AqnsKjYnJDQzRZbP8RLTacOOBqE4
	 JZGGuhz9f6fPu4gwbkM6OQkcbrHWkYBwAv90FpmnH6QCbDckByyQn0C0Em11pw39HlJeU
	 1qKtYJ4LytjpCDSBWc0kVZ0wXgb+DpNDgQzjpb+QHEZ+eUWg7CJvYU/8gbm0qDPCvBI5E
	 4z2nxe7i4naGBX9BqAY0ZszpVb1PGeBLZ9AD5enCzbDX4X+3sjpiCsXQ9szCgvwQ5cmqD
	 ImpnlGSl3rig9ctM9ZVgD7UZt59keCNftBb150jxwms53Gsdbu0Bm9Q/ZW7yvbpX25Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jlR2J6Ge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDa5qWFy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C3606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681C3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jlR2J6Ge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDa5qWFy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGv4Q846669
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fcrUVABBd5BeMh3yq/6enDr0
	xTKRX2RD7vMv5/wMSTg=; b=jlR2J6GeUOvDnOTPhh3wO8ea+tdICFP0OpQ2btOC
	O5un9FGL2kd6S+hOypQb7vGG18+TcYQvUp5jr03s57D2m47fW/1Q6hYTr14jEcAF
	Gj6Rh9x3xtTdw2PteX7tjHkeWGXAPZHW+Dw4NexuvA9hhYmO5033Kwdq2KVL+K2u
	Ns6ja+cE08Q9ygOHZ74KsGKHFtVYNxvwHbjtIgcZOmeQBXK23gNCajT18NHaeHY9
	f3ZpkRiJf4RTGA6IDuWEPG3Jt1MQIK6AVBjnQG3uyYvwHSn15O/O2rGFrIx9LRTd
	SLfth1XV7FJADTB6bqovH0S3yNW79HiHeOl+oAf5OCC4iA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7436rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:43:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so739426785a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463035; x=1796067835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=iDa5qWFyJj3qwAhJCC0v5x5b4M+NIgVjV6kQjYL3NWhfYYc1UfxmNzaJCdOZoPkoL9
         jTGCJg/lMQoyFvAjIUNgMiPdRmFBMweeqDnYDzFIOvKsYRmZPfA6Txr7N7QkEZmMdT7b
         RrjL0OUUTOmFYPYY2pA4802adfZ7QadeH9LOrl/23pGAcKTw5vyg8v8lUdsIqf/I/01T
         71bBIyINshwONZL2SeF6faqfTZ6Oivu6VmZfEVCPoKmqaEEexOs+SfLdF/FXHbkKY7O6
         8GnThM3WcuTflRjCVDmgwUv5XtN3tYeFQ3A60BZuccKzeBCeHFQcEEDluIvTlneH7yBW
         8u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463035; x=1796067835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=mSqHlxV2txNzwGY/37TQKEyFN1mVzkanYxEVpI2o99s38hKPcVA9QCL49+fF14jRlf
         9A2v2/3UqKOoQjAnUzJjNqUa2wF5sqBQQ74ErZGqCJPG0PIz5biczcMR7t8wHqG1Ex6y
         2TWAHpRBuXgx4ccXhl++LWLUxrmqyRqCz0Zst9/Bohwl93uz1wplq8WK+iwAeJcAjYxO
         G6BKIyLV9fQwLYvKi6lL+XN6l8rDEoakHMwxxkuKLJdJ6JvDZNWOtWRp53umBTPJ6g4B
         QpDierroHn4mfE2vWzHM3+UXyJpJfPLeEGFXA0Xgu6MzNDydebiajZce9zYdrhTfup6+
         GBLw==
X-Forwarded-Encrypted: i=1; AL+hErH63zpaQfOzV0cnBQmGgGq9V7W3qNxM5Lk7CPEpDEnSHBWHLAtHotlZNYEOgF1Kpn9HPI8+LrYdwvRT@vger.kernel.org
X-Gm-Message-State: APuU4Z9XTPFWdyshUVXRtcqGSaFDhFTgUC7a0GqNH7HDfYU6zzTfEU3l
	5zvQ8dL46WNM4ZsSo5tVNwfdZrxUMiV3KosBMiBIUIshwifW8N1wlVlT2fie4QhldfVYvus+Qb7
	znrXBIvz3FMGO9qy10FYENtRefsNZTTBHhWNOs+qb4/XKVhtsz2IhSDdhrFF1sdOyiubjjClD
X-Gm-Gg: AZFdTZf+3hrnDu1P4ufVmjxSProdqf/EVUklAFVIIWGN5/dDN/y8XVHCpmhg7AYdu+Q
	Nr8RdiFwUSFAiz0I5TMGNBmVSAQbMdVBQo1QY1UOx06E3FdEtFXX9uCe0BEUVICWaJh7PFduvHV
	s9c6TcP+H6StlzJ00tR0n77MYbzcMARLjyQPfScZSvD3uzZ1JVwhltUG7MgIg6F+sQqlTq+hVmD
	xRDeIvDhQYABf9FNthhPkaqLCgFSiHnQ/YdEQ9N0Bhspt30GX1u/raZyi2VucZ4Imvr7XjOH1DP
	CkyPn3zaPCaJ9kqPUeKnj/bJjJmWt4rT8yG9SIa6IMGNQuWDTsrwT3ar6sENLFJzyLcEOJdP/m3
	7b5xolRups/W9a4COc2yz2j38g74xnS/QRteS44Qkz0Zf/h5oTlQykQXSNY05frvN
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013018785a.22.1795463034444;
        Mon, 23 Nov 2026 11:43:54 -0800 (PST)
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013012885a.22.1795463033726;
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23340306f8f.20.2026.11.23.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:43:51 +0200
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
Subject: Re: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <6yjftfrc3e5xsxqpzpab53x745utqey7ivz3hws3l34qmlxdho@jbcmzbhdq4aj>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: ZzVkKnJYAXmA3fQmXA13rjyzuGF60cEt
X-Proofpoint-ORIG-GUID: ZzVkKnJYAXmA3fQmXA13rjyzuGF60cEt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1Rxc73Q7X0/v
 JqF++GPpIphMNLkf5736ar8K7b47OSogi1Yzr3LY15g3FlECGJkmW1oU1BKwYZ/r0CsQ7Jd9PGb
 dtQmQkZh25UN04Enbw7sqfVJxiV7c54=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04977b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwQM8gVK7l0xQ
 FolztsQJoT/dKAW1+iLa2Jl13bfOe3dvY8Y1n2W/Kicg54gxoBGX1QAhD3dyQf8+PyMgrsUdNVr
 fE3C14QKMp840qiq2VK+02ILFrxEP5FMxTC7td9L0JW9O+LIBPwMCwzKW67s/SyY6Qr0WV7uHI4
 afvTJv7MJ4B36Rru3B4Mk32pMEve7RKEOEsuBUlQwBolimSO+t3w8ggx26mKA0le68RUl/O1X4o
 I/Fb+h7ad11dpp05DD3kKlrXECrEWbAMhth6nXEi+CBYXjcrh5Sxy86aMqra5BZ2gmOuQTazUA/
 jqxuB6fXnh3yro6bGIAIdZ8B7XGgTAJF4LaNyrmhG+q+CRBbe449dp/ByE4CrbEWxZUazdsR9nV
 NUL+B/D1qzTYyP3PcQXYxscoadm2Ck7GtaalfFgFR6eqoG/Kz+eZXrhYpUi3CY3lB4/HCfq8wDV
 1CammPhKBRjhfw2INOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:50, Bibek Kumar Patro wrote:
> On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

BTW, can you please check Eliza SoC as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

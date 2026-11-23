Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462805;
	b=s3Q239MR7Jv/CxxLc64hcgBU62ULvFt7hVE0OEHFjtdiiB9WrdE/PnsGGa1LN6WLelJ2
	 oCZFY6uJ/xEkBIXyeCR+mJ4dok/PmaMp1azAp5KD8xBQtUOtdD2sm1fQtmUvWDklAKDpG
	 WeG7Wp3YFBB+TU+CkZtRSPtLveeVx4W+0AGq01x4jaH4DAsxpFgIlOMhNbrVRUWvcV4eB
	 FF5622fwBbdLdRrm+o941lSrHeh3wF9yyZ2a9/sl/PqTQCc6FGmu8lGodtO0Jx6xYtuqo
	 KvDzUYIqpvCJJ1u2TS5WJcOqTs2gDOcPlq++LR8+0JVkjl1mhyCk5Gq1mVsDc4SEd7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
	b=g7ZURBy5JIF5xO8rwMqebGlOLvoPsE8SIEQoulJqHI5VIa5mxNmxA8gSFnuBKFf3Bm47
	 KpzO8jZRHV3AKr/ApCD2tKp9BrgDjb/JnBxgzKp42URpqszGOUTjSuu8Va5OY6id6MfaE
	 IG3sUTcf+DHJApKoSI2WLvyOrphLOXvn7cSouHhuTUo/DOMXpsSvM8hDkxQIZdV5aN9BJ
	 HksaUbh+8Hl3Er7nkVn1NoDwqtrF/lnZwbpMp8zncBauyT+I7/IUjSLtUw4AWXfvyMFrr
	 zBiPGyegaX6O5YlN5mWdP8gynWtJOyFvVzR1denJlWlnJMjvmfpENBGLaLPtA6Rrcfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WSf8nLax;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdmvZjP4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19885606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19885606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WSf8nLax;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdmvZjP4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNHpK647139
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbTovhPnqtGY+9gis5cd+giQ
	qlIKSt7958zVNJnBgFo=; b=WSf8nLaxYf+BtiJytkdELMlLjzY4U8uDC4sNk2Ia
	R8UENZ7x3KeRV1NFPsgOMV8/o177s801pff3P9uSxgLjXM1daAGoAl2SNuzvCFJ0
	RcnxYbplrZ1rWcPEBMxbJXUFcBVqi8iBX8FD9VmNJCyB2MLRDTxs3pqT7xIpW7Fj
	CQlbtV1BQLewbM3+DleoXMV7pzKGjMn3BzFJ2HwwMf8kwn0l5RCr+Hvjpo94o406
	Q34fI1SdJg3aYlHiobthbcMgJY4czgF9t9Jc9F9GpJq2K06gVnmveaxGd9dqBgbJ
	H0tzJ9iQxpr0o8MfffMphYr/zL5pRJqQKQ56AhP2ChLhng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg1w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495af07676so574696785a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462803; x=1796067603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=TdmvZjP44aF993Cg+Zi/0F3e+LMiBOIABDoOwDbc503AV7V82X9/tTC9mYYFjf++HR
         e+23lsi6HtrNhdcPxAeuKGcC/yjjCSZB28yBEaP/pDvExRFkYmpp60Wlx+m1Hmcs7UK4
         NU6nPUJe4jWC5cNAYpKbxYD1QIVl444f6kI2l1paBxgVokfGEdHklAw7/TflQvRV8cmC
         BJrZe5VlUA6q/v86Dc98mgrsz2BDWyOeWOwc1jzg+FdS+uyHFsy5ihCCTvjzoRvlEU+o
         cs2W6NTQ2aCVqpHJVYKjhPYuGZT2NgNCuGauK7J3vhGg3Vp1LIY/YsSAcXftzv76IV8F
         AEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462803; x=1796067603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=TCEM/jRlNEi42DYhC+Sj75/F/QRb6uzbFCkpt+Q/T5stymaeKfwxjH224U7PyLSVft
         Ups7R40f0FODsnFW+rjYwl2YJthx+zy4fAsFWrIgj0pjn+v2HuCG9WCY4UCOvgl6KYE1
         8OytJv0GW/0Eusb2rV1BcpuY9j0MHHjCtNnx3sB6r6qhn0x5/1slsPS1TxZnIDlM8tZ4
         hII1mNVOjYFByPiCM3DxOLsNlTCMy4cxOvSwH/nn0XNaMHl4jpjxy0GllOQIVkCKUx4n
         o1vmywBw232z7+IXktv4Em0LyuP7dLouuShPUF1VoK8EDc4jTnEp4OtTf5zu3gc1WsPh
         0aBA==
X-Forwarded-Encrypted: i=1; AL+hErFLf3R7uvpVo3WzLfMZ0td9HsPXScka+z5/eCK6RSkbQ0VyQuwlIrsZmwyTprFNihaWUgcoW1quY4JT@vger.kernel.org
X-Gm-Message-State: APuU4Z9/pPtvUzZF5Q15drl1C138PgXnE3jE44JAHg3cCCR96QONXu+S
	mF1fe3jA982NoEwGKa4bsrn+wFMhOPBXF/21LExrQ1yE4RVeyF33g7Wtc+VdUZUJI9rhzxCsJqW
	iJs9QzhPmsRcwEzgLqqIQs2salFCjQEBS3PeynIXkcZHFES3C3Ed4omFHIhrmYYgC
X-Gm-Gg: AZFdTZfHa5dOZdy0Z4bdPBQpLDcGJgmTMoCVwEqXrKVwcA6UF67uKdtfkZa/F4icnFn
	AQtmJ7/ysMVyeCiSITxb03tdrEuZ/3BBvKk1EPrto3BnEHQw49HzNEu4ol1VqL90z1SMIyl83A5
	tiP+Y4dDCLz++N26ZlsFrVYv9kDkDI8BuTIiRNfhhX6UR173/ID9Kc+vfP93iNmozExS/w0es0L
	zTA+mx9CKtrgEGyEkOsGEka1p3i33cz4IFfbNa6U59ohbahXLRnJ5NzSlPPykZbeH99f2Qb+0l6
	iyfP27yoT0IJXXZrKPi7CT6zKQPNRkbBBxcBUQpzLetNgzLTgW4XOIXzHWxny2d82Pd0kG0+RfG
	aa6ulF1dEUwa2QfpIZp/85N2E+yOmEnwriBZDiPq75+fePEIl9wtbXK19d/SiLMQp
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970759785a.23.1795462803374;
        Mon, 23 Nov 2026 11:40:03 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970752185a.23.1795462802646;
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm19966670f8f.46.2026.11.23.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:00 +0200
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
Subject: Re: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <rybbgcckx5s2gqnzqya3kc3kbsqvyp5qqwd6ct4cl6dre75fgu@jxlgzjkork3v>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b049694 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1L5Fs8CdhlNCfOXFGWoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXx6Ee+iazlBOc
 H6h1xSHHRIcl6RH7woW2MlyPDLd/xBMKY56L36hYVx9fAvuM5NJtM3p+IDGDfSba0oSUpxvt8hq
 hiPxGyl7XKYufBA36KCquDvIy68x+EkknfL21APo64EPWZWIv4RhZgpS5TjuwQQeCQMeW4dPVNu
 OpuLcZ/OkVr0pW2gWPWisvY/8H1Cpx8oLv4ohRDrzu0LRKBEH8ruzsWTwPt2JrqNlmVJyt568bH
 M2k6NrFsdI1w/Q8mS41E6mWNly4+NPS2EUmhV/AAb4zIOhpxSfJgYacJa8NGBa95zKLWZJ8ug2z
 LPX5zgqdM2csp6RZ+RzxeIFLWDPr70JTb4XsCKJ+ewFGyFsoWOcnAbkduB1siN0mLlNe7zUiJPQ
 E+72XWfIaniecIbIlQzzvta5wjZ5qI2FmD9I0+Vd7WJjN9UXBCFbG0yu7oEji5kAnh2BLJWDXxe
 hlLSvCptb1ddY3TcSwg==
X-Proofpoint-GUID: qunGGwyvhSWuvMAGykaBVKRxy5AafDQd
X-Proofpoint-ORIG-GUID: qunGGwyvhSWuvMAGykaBVKRxy5AafDQd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX26yiPQk7Qd1s
 r8JPjDXhP8ionD61Gqhf3nRUA75zncSO4vMHN+2YZEezQHaRghl+CBfqz4M6XnxVE4vKdJp3BHZ
 QaBIdRD9UUV3W8vxjHYktUubXzNBQdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:39, Bibek Kumar Patro wrote:
> On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

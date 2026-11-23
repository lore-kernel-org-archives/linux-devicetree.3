Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462846;
	b=mLItmWRh+rynj4PhCO16tjLanUIAJBdlnTrVRl5fvEXVl/+OY5sOwiQ3CBsK39FJaXDb
	 5kkbEHbggucIpAVTp0gbiIQuSans7u2nPS0mH1vh9rGy9Oo6oLNgC8vLYHDxNpqty8ztC
	 3IUiz0H7JHTXNcH5ocE7i4AGEqz733fCnST474fFFFu057NLcKAVq6Qb3ZnGrhCBXYJwx
	 6kbCPjlhTN1PWnzXwW5AyqCdcjVx5ddb8/Y+gPRNgLGedixy9nMPcTkKS1pdTcVElRFMR
	 ssRZ67bqnbx9RVaygYRzucDAsWmXLh2cq8gny0oHK4Ht6rZ0X/LgHvj2TFl8yCNYzeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
	b=EpzEHLL8BID7RTX5QcTak86DUWCN0BemohI9HnVGEcqSZaJFlWUd5k/gvcFHImTHSZ97
	 zPMkXGC7RC/8Cze321xJBKum6IDNiiE/13nAnmDvwaLS4tQ7lOFdru7tzTQSfh3tsDhmh
	 U51aTQfoczND58sVzMV5ezGdVKD+icRN0T2U77D2Iq4qhhwF5b0JrQnyUoe3/TzJIDm5w
	 kUlVSUkPfC/FHHyL7sJR7R09vrUf53wUbaqZOWF+moJigvllyefe/jTwpoTlpIXcGyVSu
	 A27KqwRNGzu84U/bhDY54dJrUubBgylHweDbTy389mAugWk+9SzEwNKRTeDoYpFCFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La0mMGbc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDkAbAeY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63B606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B63B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La0mMGbc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDkAbAeY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGr392769190
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=63/5soKOfoo4s2XYSXdk8j2r
	ZkMsI8L/GaEuPyPYmys=; b=La0mMGbcDjyRM6KXJZm4Sev/JOtC6OOzb7kNxA7J
	iBvGE0jgSSgg+XzZ/vmXHAQjgvscl5Pn0/AQGorYnlhsTzCpuCbcS66h3yorSYZn
	cU0MIRcbKG6hQHlxVx0EzJryehosH7vGqRnOYCr9jaqxIOwA0ElkT2MFCDD9ycIq
	ccEoQ3tiyhG414G+PFhkZUdDSpWfOzsamRqBYaFGNtzV80IhPcKzch1UD17wiqCr
	wLSemY3/km6mytfTXmxEJ0bvMM71W4FmEPJblxG6RcdbmqcrU9Zkj1RikSUoQa1q
	IzNfVIEfbB9yAOfaxA2ydIaCIg0ePI+eGq/20b7NB0F0Aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb43e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so572972385a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462844; x=1796067644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
        b=dDkAbAeY51UOYl3QjyDm+kqqaG6ok66AvWE/dXGcyeabB6pUN7j5/OD4gsP1DlH6AM
         PQv46avdMN/CCANdg/+jx53LakpuQ3ZfVzOx4mYdzOxr95ElZxmVTMgDELIjmW8Y2ALX
         P5TmGFnELJmSsGgTX5tX7A9RSnkzOze394lC6jvQDtxOqzFSPN0I6xeVDCYx2wYzRilx
         f5jYwFyI3Hf2l5P0HGADBBW3YUp4ksmiDmY9+Wj5rVFJNIVR9M7qv/RHWTzFYNgSU+Rt
         DyLiBEc+GE5fRf2XHeQuEMhvtyv1okjsYJpZXW5dU4rJNMn2lrEKivJhsfY0pgzW4LBJ
         z8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462844; x=1796067644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
        b=XES0R7FYP2fPSZEWqzcg9s0r4Ll9UEjZDEyswAo244oVs07lpfJ2jVEfpRHNzQfzks
         5H5vA7fZzQZTmiJiYuNvZdU/Cqb5thYkNd8wgiRRS/e1UdxEDB+p5ldl16GIJ+MfDGy1
         7dJAI0g9GiXj7VhJMflAaSaevG0gk8h0yaiomv8ObDYmVX2yjemJaGNvwyFNeR0CjRMI
         JPhX5XBpZjlLaUR7vA+fr+cWnX1U2RID5ZkZX0ZNHu5pJKHt3w8eofi2o6qPtNXuf8ZC
         jbo9uhdqSP04NkC5UH7myAzl/QuXayFLmOyeRRN/BFKOJQ8mMgngSjhhTnadB86EQXeR
         SVDw==
X-Forwarded-Encrypted: i=1; AL+hErGWwpZbpX00ZUaHehTjDDe5a749YG62Z/mEEruCrcxNuwu3JN6064UzMwndYaoEyY7nlJJjywM6ZR9w@vger.kernel.org
X-Gm-Message-State: APuU4Z/3IxW1qSmFg9s+OalRSntwdaHml1pDuM8a6m167syXE8ZVaLHX
	5LfDetmQ5p6bO91Pwjnp5PnyVSHRGsjqigBaAhC6nQupivQkpVuXvecCBGYljOSpDxV77APBiXi
	EkGORGO48b4YhFV4HD+OeCrIcnYkdMyd/ZWjS16D71QciZOlc/0e5pMXtBUXWr5W4
X-Gm-Gg: AZFdTZeNPb6hLMm1UhA8CrHFPCcCBDW9JS/lnHr7Dez7kp1oUGSpbmxXwXxRuNzUeDR
	vuHBde6Cj4clJ/KqMSnbuCBJc1genW0VYo2Q2Dfvnqj70UoMe4VHT1x3PMFXhisIK7Ps8MTtdta
	qhji7h03XwPmDX4xOtdu8f2Bzigx40GSgmkRfV7QnmcItwgseLJW0sxMXSUWwLpDC1gdIE2hmpH
	lCwYc3J/zpumK6ZxUOX+qq2yvcBkJ7MAX7xPejhdPeC45X2u6XzWcJ9TMWC7p3NEjqcRg+p00xK
	FGqkllrLcRn2FC6TSuDYdSw2nOvWR63fGh75hGiuppjF2fr59cX2zetDF1GCAWUqYmpFqUcEnTE
	fnJzNXxpzX/T0vehD6HiKnIo7aTKI1re8sTgYQvhlHvkQXJpvaX1U6OtZ9S5Dctpr
X-Received: by 2002:a05:620a:318e:b0:93f:59b8:e28a with SMTP id af79cd13be357-949ba9b8046mr2258825385a.28.1795462843726;
        Mon, 23 Nov 2026 11:40:43 -0800 (PST)
X-Received: by 2002:a05:620a:318e:b0:93f:59b8:e28a with SMTP id af79cd13be357-949ba9b8046mr2258819585a.28.1795462843184;
        Mon, 23 Nov 2026 11:40:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm25447645f8f.1.2026.11.23.11.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:42 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:41 +0200
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
Subject: Re: [PATCH RESEND v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <izxzijllmqsw7hswyhtyir35dltvgue4ahwn56izi4ez2p2nv2@qyz5ugzrhg2y>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4+wvjcLkGRfV
 Kl5lYH8LlpXx+Rba2dcyUdZayipWYMEr74QLtW4p5KjBngjLHOgSUKF+qnOEhk2fPRi3ZTrehQj
 UouqaCcUGP4Y0rJJFi10A6xgAJsjXHilF+s1D4L8uw4o0HjWyOCJu185gyfntZtVbQiVgKSt0oy
 paNQkQ7yZZRw8+6c/1CFCX/4DTawSL/ZyaQVZKLb13hoA7J7zx23hMc656xk65gGn56Ed9sd17o
 Cpop+NLg9vkha0CjXdyZ6aevK4wMvDb3I0mBmIrG4StrOVI0ytACC3g7a3BhgXCywR1KVlA/oqs
 46ooj9MtsBCtpiOSPpt/ykGlHGnjT3vmM4nc3vacBpIhNyZUh3kSWsqOCVnY1vXI/DaFKoxkA0a
 TJcXHhGXOBtM2lFsjA/Zquwh23h1DGUhpyCoaIjmgFl38wkCXeu/QaFtiVt1ePyewjO+y1FyJ+/
 HmJfZRrS7S5fBXZbL8g==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0496bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: K2ccnxt8FXnhkcixAnrtpyfuBcynh-gB
X-Proofpoint-ORIG-GUID: K2ccnxt8FXnhkcixAnrtpyfuBcynh-gB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4KH9bcHekvgz
 OpYGhRA+82tvCKcwRWyGOWoI1SNF4Tzeh2aouZqzim/bb/jK8PPRt45EXq/6L7BQK3ZaVvD5agv
 bkF+3NRzMWZi90s2F9ff2M63SISjhgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:41, Bibek Kumar Patro wrote:
> On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

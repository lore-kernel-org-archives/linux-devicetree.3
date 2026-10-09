Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3194F4744
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569949; cv=none; b=fPYLncpv9uk2a3fEjoo+XONnWRUmJepAR00fwCWL5RmuuYiFqh3ktqS5OiTXWekNS+2u3PLWQ/uNN7+7WtGiS7j9wKoqY5I9YQZqbsEgm57yz0uZPp2jlY1pyku5xfxNP88sdEba6rJxVUX/Ra2oG4Or9Df6jR7eGq1f56uYc+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569949; c=relaxed/simple;
	bh=Qvh+KR0Q5Jux2MATytmPh5+5juJq60zRMnUq4HRcvZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InvNCuZu63+4F2TdwruZ1lr99k3veWWCeJzlm0K9sWa1rbH4rdoZWLTurPQZD7U5RddCJdV/ZvVrv5z77PIR4EHq0OAw5jkWwWWXe0GhyB6jmj8jx8SZyTZkARhFcVuaoOjz1XrZ3hyvoMgbLfW7WXu/U5gW37dzt+apX2GyQ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkiQIo85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/8b12U6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkiQIo85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/8b12U6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZkFa1880292
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 18:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fX8nXEvsmi0VscUpFMXtxoP2
	QzTES/GfQKJn9nHIr60=; b=BkiQIo857Mtx31sgPxo3u+kI528WAZvTZHR41Nya
	nSVYBOCaGXKRFJuk1XvQK9UuTh/FjXnT1X04F619pZMaeJikUG5KtjUgD5wEdcfD
	Pf3OdvI+cc7HuI2/dQXn8Zefc3dntvMFaWT9wB/f+xVJH3hHMJXuZk86my3OKMSE
	MxZWVrohSTGIlX8PZi15gXXygmENk9NWY4XxZ49pUoC9c9LjcoSutAB2d8v3FM5A
	vzWKxe5lI4U8yCz0hf2lp8aNl0J0K9s9/E3ZqG0lkA/L2NOvLndRbxZn8lS0Gdj3
	BwUC9oa2FjaL9PuPBG5OS409mGVYJHrQdTCNXmokQLASZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8g5u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 18:19:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc40759b2so1438453685a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791569945; x=1792174745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fX8nXEvsmi0VscUpFMXtxoP2QzTES/GfQKJn9nHIr60=;
        b=e/8b12U6lfS1wUiLUgG921UShCw+/nVT+aMyYVSxYL6+fkB6C/AquJk+RIuxjBZrYy
         Bkgp6H0BcDXJTCduudbI7PBZjWBKhNY0vXgkuLhPrEkNDfOoczNig8lnQqjaXjWCR8l8
         uqdbJie4ZZC0Cw8RvjoudRFL2zQnGLuh3FPgkG4gJBEF8vyRW1fEp42nVK1QCbFU4aOp
         Wcc7wtuCDshBca6pTgsSZ98/ulurA6c8YFlqmyBJfDOhMht1UnCDErq1qRWCi+ZldR0X
         e1RAYmQbCpTm/mMKWwY35BpljrqSJpBCP/DLXN5vahldsf9Ywxma689ML0L4nBuuDi4L
         GrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569945; x=1792174745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX8nXEvsmi0VscUpFMXtxoP2QzTES/GfQKJn9nHIr60=;
        b=co1EDwDJ0c1bRsxp7PQ4bcvFq/p2FBgh4tuAvsp/d2P9uMuoUiBF6zxPZ1JCYGQExd
         Tu3J5l+KnI/G8VjGwg+HMPtzHrU/d6H45xGIj0KPZ4BadQ9Ky28NpOf89KX0xkFhS7Om
         0aTWyPE+ehcuAnXK800CmajVksKpebhCNhipyv44CyIdJbjvGnXdW7T1J6qXGdntIeDr
         Lg61PWVbAqDbGBISunHugK4S2D/LNV5wBX+DkBLScwu//dGuEZQEa1RrUpgrj2kYxdDA
         Jzfc04tuB1k2am/UtEJi+g9cZ7sENnz/sTorY5GD0secPE6kXgi5pYb35Z5Eou3mm5ap
         /ETw==
X-Forwarded-Encrypted: i=1; AKwUvBwVrDPfPhIVsz0VmlSbWCES+VTCWMK1nEdtWoeWxSgltRjnHhXdluDwWyqXdMSFKxyPezrVY0nVaOoU@vger.kernel.org
X-Gm-Message-State: AFuF++mtNmJWZbmHFhWFTJ4Gkn3KhUOO10rGVouKnt+Z3QJYxXdCupZG
	0XuM1wpnwYdUiSbV/s+wsdHE+PezWb6ihiA6g81Msiwm8VhDvHIoNJ1LRSeSd1jhRwqiAsjObgf
	7Wn2wB9B/bQ1eTZf5iKGeVqCMB34ho8rQgXTKMpd+JbnXmB2+WBBkTsy6YDdj/93L
X-Gm-Gg: AYBFou1jYMR/5qaDxXP5WAtpIoSpgrTXLHxUPaJydn5sq9n3Q3+A2MsYhRbQoySkhAD
	D4QDtXVjtaa4YvEZfvYruNtgveDRG9TbW1Jgoz5SFuDOLO1Jnhk72jjDQmSRJp3f4J8rF93uQiT
	3WXyGa14fdpOcyDbt6wCqVeDZNWhc59bLD6jR++i9xwHP/rBsBMyRwi/FJcmnfSoj6w4/VDY3RY
	pi1xXOJPWPw/S0vZkCqnXSJ2Ho842nPCvYrvlpQ5lzQSf3OclZ9PjreImmK8wDhRR4zzcWQ2LS+
	iOxAY2BQ85ZVIgptaRgla9+Tq5tegIOTK71C5lkvm5cTNgDQ/Yo8o2WGO5vqghqgAGUDMI4Pnlc
	v8lsfVSOslpnyFEk=
X-Received: by 2002:a05:620a:1725:b0:93e:94f2:adaa with SMTP id af79cd13be357-93ebd1ff9e0mr444531185a.32.1791569944508;
        Fri, 09 Oct 2026 11:19:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:94f2:adaa with SMTP id af79cd13be357-93ebd1ff9e0mr444522385a.32.1791569943753;
        Fri, 09 Oct 2026 11:19:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm4937405f8f.37.2026.10.09.11.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:19:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:19:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
Message-ID: <3v4w6edwduuayl7wkq2h44iikyx5mtwxer6ihuhsoe3t25rpow@d57gkwe2najp>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
 <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
X-Proofpoint-GUID: hbKNXHeqXxSdnNinmGO9OjtWNYQTm2Ni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MiBTYWx0ZWRfX1I/q7D0JPfrk
 E6Ug02Qg6VJcJpEn+Os6BKJANjRplEjxCnrbVpjzEA8mIwZGPY912Xz9c/KrRIKH4ZzTlw/ABOg
 1UE7GReSdMUva+AxGX9kgqmMzmbRonugCJFtWsmUadw3w+L2xrboYypBqR9HHiv0ePMYm0tQIwl
 MapTMjo1rCPNlAYMt5LgG1tygI5g+/0tGY2nu2KcZlEW00uYhuKxEc2v9oYtvFSfXaa6QMUpBeE
 IZ8Ha/PLcBZVYImQ6XCL0MnKYOg3T2GIHXCq2lHyRHDzVwqpsxWF5HizrKYup4JYi7hLJSsz+us
 PD16jXtWZPmX6QL1t5j15qpEX8RYmRxFQZy60/v83OqrESSOQliZKRdi8yT1nIcKZTCSO2Y1VCJ
 yEioJrEeKpFm9/vJRu1IoZup6gj37THLC3oy35vgYty5Rfaok4BpgSlMK7pZ2gegmfOcXNpLevB
 O72YAd1DIzJ2/29QmLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MiBTYWx0ZWRfXwpJ1jv6GviQZ
 kJMsXsxzr9KRsQrrddG2XYQewLLkFsFoAwOSMI38ofCrxvqAzuGPM1aQ98b3dEQeQDwVIKuoqYI
 VeKTCL9Eica/+frUFmd3WH7ExEPjRf0=
X-Proofpoint-ORIG-GUID: hbKNXHeqXxSdnNinmGO9OjtWNYQTm2Ni
X-Authority-Analysis: v=2.4 cv=ELeTQFZC c=1 sm=1 tr=0 ts=6ac93019 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DNjmE0xhf9-nCuXF3MAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090072

On 26-10-09 19:20:32, Kathiravan Thirumoorthy wrote:
> Add the system cache table and configuration for IPQ9650. The LLCC
> hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
> no broadcast region since there is only one LLCC instance.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BCC406264
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592684; cv=none; b=jPAULGXNNHWs7DI6eS3btS0xbPWlZxY7MBEvltGf88IJBtDXZitK2jThYVJOM5QgGhm5rX256VDNUA56/d0DgGItlOFjrl8jMMWl7DoECBD0vrUPwbUi/1xRH4EisHS6Z1QVhOd7hiXBt7/o+2peEH+uCTRlnk5N7i/akW/aHIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592684; c=relaxed/simple;
	bh=MBGPI8UBVjEAx8vPEBWBX5tpzb6M1I2+YOHMQXF/QkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rC5DQKo17avGAQUu4wBBahou0tb8wKZghGSypsCZBixp+tDWk80qgH5vsP/xV01lSgqRySO7pbIjhXtAtTzSxcCdlbuFG4rW8RLWrka6qNaotYmzP6QkP7fLE5VLgLKtv5WwL1IBgwup1Jo37VuAnUis80MNHsvAZhmQtL0Wais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcVDKQ1f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrzQ71P3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcVDKQ1f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrzQ71P3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANIQV1522093
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEb8PYcLVh0W3xZwHC81e8uRg/I8pPReRXKyfrU7t7U=; b=mcVDKQ1fX32quhVL
	Vgf9xNpibxLnCIyjyayFqngppg6XoS2DIPJW9Cl9uQ9R4L8RlaJ8YpD+buLDEsSj
	Y+bXZgtTh+PGK+KQF2Sl3kR/Z6prtJERbv1PyU+8KtUuDiipHepOhgHyTyMuq1qN
	+wSoECKq2EAnSE6RRyTNPbY8GMjpcgEYNQ3Y7+72/dcq7/VIG7epyk5iQExGu/tk
	Esgl3MgL7w0KTsGMiBcVKzeHNKkwX3P3wgNQEGM+da9xeFkGUzJJadwDhGrfXkXs
	SHC+SjEaDBkUqnZwkrSUvJNv+eLXlS7NAlhNuYTc0xpniny1PatInV35NEEV+HKD
	GAE/VQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3s00w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:24:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9e97b626so986241cf.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592681; x=1784197481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEb8PYcLVh0W3xZwHC81e8uRg/I8pPReRXKyfrU7t7U=;
        b=RrzQ71P390OoLPHtRAjUGW1UyxGp5KZetmASJz6pyAGfoZgQsRUSLIUwxTkSeQS4aO
         zITpBpRq4h8ehV49B33OgrHE+eu1Fb8896x9E360zK1Bd3qZwxDw3tTrb77M/ADVJqM3
         Erp5tNNVeoyHsTCCtDGHH/9jwPB5L/F+z9mCJCh0UtVQW5emtf4DiXLYliJdPBzA9R8Y
         8f1IG3ZwopQyMK6fXVkTY/2P8RcOYiv54DKyd8uceMe7izZBRtb+988eroM4WcSyIdWg
         RPpZz8XikrkKmQkmQbvEQJMoFLlhpSPgWRJx2h1p/TrCNMCJ90FxjdrGZuQd18lLFz2n
         yvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592681; x=1784197481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEb8PYcLVh0W3xZwHC81e8uRg/I8pPReRXKyfrU7t7U=;
        b=gRHzbEHaZp/HR/k++FQnD/JtBhSvFTIN1Cid1sIqTkY0235CNdY7iRFvDep95keLbH
         XPL333uxv/GYLmW28tO+6zaBbZ2UR7Rb5ncZryzFE2wRJ+5HcYwsEE/AE0cj7+C7vzni
         PybnBj1D580fv7J09XJdEBYaheNd5LfvCD6VkC06dp2r4L2QCPw1MDvWWyi0u/166xUr
         N+ePFkeMNO4h1wku0+NuMWR5n81jqHqCi+XFSWHKcH5R5PEkTG5U9sDn+PJIZMOGg5Z+
         EU27eBShfWCg2/A5Z3HBYP8C0ndGPElTeiWPbKhrb5vpR4y5lT8yJBjSESkEzhFwkumv
         peQw==
X-Forwarded-Encrypted: i=1; AHgh+RqYFdL7NESvmITjH5uBEgDnMk9g8K9DHw6CHze5oYTeoJnaGympdInvH1qityRp5qjLHAdEt3C5u0Vp@vger.kernel.org
X-Gm-Message-State: AOJu0YxL76wZW8zmxyLGf3bfExvtpuOw78GTkM96p90kYGMfVKuV8zek
	Nm9wTkL1OYibeADDvyyTnRSZ8DQxUcS0tIZWeI7BMUCMcmf6hyRYcqDz/vD+Brc1q2ScGTdbWY7
	qF962JxyIvSflpeKdfnel0qqLHYU8uuY8Zrvu4jaBDjA09wEX6TGhumiDtAvl1YVU
X-Gm-Gg: AfdE7clnJl0Me40akstxyDS2fHsHD8i6ra/ObDbguBhkrrsYqPeuRPZ13tpn/zPgGeB
	pvwVNDSzmpauKSd7EcDT2A44qCsGQ3gCMmWfVS10jUm7skXs9hiofGpEjVcUUqmKFwbH2Gi8vNR
	ILWhpUqw9uqEDmUuTks6Y5SaIW0FKCJBF9CJWxtgJxw9IztxnX20wgUk7n8jQGeQOZ+RAD4wcFt
	lXXxqpVWN9EqFhQ+FjZ/arOH7teLZknSRGd/gBnycUDQX6lZLjyC2pQBdd7Vu+n+GbTqHvMKVyt
	C/e7Hw3qpWeCnbPRYSwd9igxx91V0TDINuuU4koj2IgBu6vNp4MwzOEEKmqK0SzoBILAOgmmDX2
	zFGeQ/rMOSH4fMo5JxwQCHxhC4FSnY6I8L/U=
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr30850461cf.11.1783592681232;
        Thu, 09 Jul 2026 03:24:41 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr30850291cf.11.1783592680862;
        Thu, 09 Jul 2026 03:24:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm285215666b.23.2026.07.09.03.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:24:40 -0700 (PDT)
Message-ID: <228a2e14-bd33-4d41-b48d-9b477bf1f0aa@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:24:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali-mtp: Add SoCCP node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YPXlpSkLIJjQuXFkrxf2xLIBXvPoVPZx
X-Proofpoint-GUID: YPXlpSkLIJjQuXFkrxf2xLIBXvPoVPZx
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f76ea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xI9PflpFdleAlTMqXZ0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX0/fh6gfPitJx
 VM6JwJeYVNMaYUgZoE5Jwmx24GecySR9iuzAYrVZ08dHmcdAz0gsJhEIGrNne52fTu2o7rXkwEk
 MODXrmx+XLYEOiKz3B5ukBA1pRPVG9E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX4eDOfDa2ODb+
 7jCGpyt9AsB0pmpLAfatBqPFR21vRMyCFbxPBK5wVeQCpEh9MErDDMlgFMBr1PbanhQq21m9hqH
 uoDhqqHYs/uoNH3vJ1Fe2gPGGXMi3K4dhMVLv6KWtsfVJVAPdZY7UXh72AdXOxsVPwqApTwLIoX
 w1Ztf5rNnbFNlAtkT/4sonYQmq56C3BnomUEvKocKk2IX7LJgLFbBMEQbX5ynis7wAchiEtsNjd
 GtMy+ERyosTtrbIlxdDbqIGWN07ew1MaUHEk65bm5Tnnth1iWVpw8C+Vx6Qw35fvNEw+XZ5xcO0
 RKnymoif2fbk0p+kGu2fTrSUZ3F0uynqprayZtDpK2jmtywlQxn09Gul63eYE6MlOkYOKlekjDt
 7x4qKdJwiGH6K8wYXKM/ugijI0d+gmMbY7HHvQWZrpEF9fHShcQaua6Qb1/UmCk/H4fx1WgftBE
 ixPxZXR6i1iFZ9RJE0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090100

On 7/9/26 10:14 AM, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali MTP board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

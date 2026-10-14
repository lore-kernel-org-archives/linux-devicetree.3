Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB44078D8
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968876; cv=none; b=tk8m2+b2y2ZM+X7E5iH40h5zqJ5FbCV3kLam4FqtT9YHneDfRBCllk/OLLF1DDbMjlrx3vM9c3H8oyOizih44pHGkF8QYYZ4D/sWhKWmZI8ZsJJnSBSa6wUePMIFeu4XmFYBI69j6RjJL8zFaTG/M+Az6qcO26niwP9OHwNFfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968876; c=relaxed/simple;
	bh=06KZMJIUNQXNJCVFnyzCSETXB+/y83nIx03PP6KGwaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qo1kvRmup75lbri1e750eeOLQTLS/tR+V9VTDrz5a8XgORViMKgK7of4EYevRcikuLqSz2ReZQv8yXBJnZqaLrUuU+8UlLrzSLxLCVwaInsu43HxrvS5T+EHP45U7icK0mZy8wXaifZr3M1PXcB3lw3wKMneXt+7XsrDGeOESk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgCudtpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2vnH0rB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgCudtpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2vnH0rB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5woK73951265
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zlTHd6uM8BqPWwLPK41RlbISKxDZBLk/378P/d6aGg=; b=IgCudtpRokW5kSot
	h6RcaAfvScD2Bi646rXfNsZlexthrCAzPvjhUCzgGqzOwamJOuqpyBGTufeLNU5K
	zT0pUpjW2QGYZ+slRAbS9db6a8wODXgZ1ar8HP7l6C0107LJKgE4mT8xINNQfRuf
	K9nMqWQgaq9ntX1BWlLPUCVtUHgZR/9B+X3/pMT7dg7QsTe9o4+FWpWoMATbVJEy
	mCTzFQh2z4vjKOYhxaZwUNlGbPxXeTfVck4ytaxdZSLo6+1U3IYfpDaEqhpTw1SJ
	NUUuDqVylKD/RH2AYNEAwplY2NjJgbV4fKX/Cig7YZ1Dad4ySvbdWeRC0CTlhstn
	TPdp5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p0sbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:07:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso69193385a.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791968873; x=1792573673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zlTHd6uM8BqPWwLPK41RlbISKxDZBLk/378P/d6aGg=;
        b=J2vnH0rB+NCdCZtK5Lzd7Wx35Wq9tb2afq+Qbpbg0G8kqhE96Th5Hiyk0RUtvF04ra
         vDe2kWuzA9hdHLWl2H78otEolUx0fFz5L8C6K0Jv/lC1oaFX8nWGM+cwhQsCyB1k6eWS
         btPnzmwXxj3z1AXP0MsKgm4VTMvRn9tHh/Ey7AbmAoadU/TkHR95XtDnTkNwYwWYKiSx
         rcDnqPHQVtuy7phPiuqtPAF0red9xHxjpwiMwr0aaIJLObngpIhvGmntbFf/Lrz/WU1U
         eKHa8UlQBvTmHw5B0EW24zGp0lL8lI9EAM8KW1wdFHEm+vAfHV1ZljiSNkAZP0693LMV
         8TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968873; x=1792573673;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zlTHd6uM8BqPWwLPK41RlbISKxDZBLk/378P/d6aGg=;
        b=GKkcoyuoisbcUiQdxWeM2scxULEj/l17W/eadBOA7Qyj7UNJPIzI3fQIAzpZ9n58dv
         KpiaJ77WvGYR14tu7b1s8GIHbGqUrgTBCgQg7HN8tbk2OP6zsrzBCfEnhV/MIOZYwwcX
         S/S5NMPm/Iz/Ekad5q/vdrMEl1PqctXPpppdskZR2gQapItzZr+OdlyMSY9oRsJjkSYD
         grbflDhyEORY3Op3bRqdDjuR/+M6qCUFXZgef8NfyN/CUp/sI44/Ha0hnmn6GEOb/ylD
         0b5TVqAzBVeSfIVDBHvzKNMT8Opq6cgB0jB5ygfLNOFW7hfGgiUloIyIiqZQxnYb5CmZ
         IZqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuMxt+UY+bTGcQtWBcpPACNRERmHdKzItpAiuI3LCQAiQXMxnCWrpz0U1i3rYChbQshNr+UL2mg8ZH@vger.kernel.org
X-Gm-Message-State: AFq9FYJq186d2tvFYcwdsW9Py1vl5dBwLmTHVblz9Wu89BR00z8JujLk
	2GJagKbvUtSZVeVeVoTn7S6sjyVJZIhoABiHddMbxb1o2ZXQgVOpSVbuNkBU2lcF2B2YubhgLf2
	oaCFLrBVcyrxn0g+1nBKeq2YsUw6RHMXqWybfavCG5lhpUiELi4FYTu4og3bJYNGX
X-Gm-Gg: AYBFou1E1umShALVRyh4x7NVg2Nfxvgd5sjMxBresCptkOYvgqoTNJP4n+TGYMwyTYL
	fGuLsZFg3JD8KuxaHcRqTeG9m5hC0zbH7IgfYsanO3na1JV5xlDLa3pihX6qOyM+1y5q3wpVvQj
	Zf1qqlePOFZRU043jmJWJMq4MQsqbREevflUA4quo0ZQB8uNhbL1zzxdpocvaFZO8qEJCWR12R7
	laC5Rq9YpOpXCy/f2tkdZfQY5JGa9V5S6C507v+GDmr4gILNirqZ8bvLjydhHmQKKGrJY7wIwie
	j0Kzr0Yj47OFcyA0+MJ3Vusxm76E5jOyq+5Ihqcy1QdO1T5wRqFZjo95jbPMegpsQbSxGqnhcA+
	iG76RSJBht4us1XFSu2XIcA==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2654566985a.3.1791968872959;
        Wed, 14 Oct 2026 02:07:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2654562585a.3.1791968872201;
        Wed, 14 Oct 2026 02:07:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbe2sm680030466b.27.2026.10.14.02.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:07:51 -0700 (PDT)
Message-ID: <eb33f0ed-f8f8-40cd-a2b2-69591619b13c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:07:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap
 no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
References: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX6xbx/DESNK7z
 lkTPgnbVgXvGF9mbkNoNzxVsfaymKyKyYa4aFgK04BYRHn0CK5HfZhl+sgoaFW8vW8NfIJT73AP
 PSlkc20kMae4ul78heJWpZFCkdCSDuY=
X-Proofpoint-ORIG-GUID: 0INkt-CCqDdSU3iZQWX2CgTPCXEsRcpB
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf4669 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xGTFGipD0v4Ncps-x_sA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX58Ox0m1yvnoG
 U0ie0XcVF8NFpVIXd1Uvu0PDzg1M+NI9XarRfB1Zuu8Np3Uc5ankL+b+1kJzHXViAQS7sUxz6Jf
 qLXL3caPnuAcgZlniaPWNCc5LdqUhh6axHBDBUdS6y0TH8PXj5b42Biu/32Ceh+XqOqJsp3Qw2u
 E3CeyUWrrvRbGRPQUJR+3gPRSU1wpoDE4+pZQspR2SYWF5v1Q0IB2vCTpZZYSSfurK/P+elcPPH
 /jqSYBB9Urxr+hGOT4k5eSUCTf7Kbk1o7iUAPUuEdOsm9EFQeySzJQLJDKOJL1nNzVpAjF98LZ8
 ioksmacgRBnUvbtpV7dhFw46VB7eiHerv8FD3YrOuCIClh1g+0U5mTe5PYJ5BkUt2ZfIQGRrmE8
 13mN8FQ4dG51nw7ZBsF0QMqqiqrpTSctSzIk7vxRIvo3/fv/5PvCS+c2T0JeaYac9KCrfzGP1yY
 6u7Rnku7dLK7PlFdOOQ==
X-Proofpoint-GUID: 0INkt-CCqDdSU3iZQWX2CgTPCXEsRcpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

On 10/14/26 10:38 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Talos, GPU stress testing triggers a synchronous external abort
> when zram accesses pages within the ADSP remote heap.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: b0b51a5f1911f ("arm64: dts: qcom: talos: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

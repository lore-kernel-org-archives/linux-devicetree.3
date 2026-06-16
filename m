Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1A331A4C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617737; cv=none; b=uODL6K9xEM0pluTGX0v1UlQv8UhTszDiQZ1Zt02v90/xtVZS+xHRBO7mZxEu5l7G/2n4QQYhgyZ1XjK9PPI/D/mvHq++IOS+BNk7p9W7ayhavhXJDHiZHckny+8E/ZlfC4bFKSaysSMaSToTvSlPTIhjJCB97zUmQ2OFIrYn/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617737; c=relaxed/simple;
	bh=/RQTCH2NrU5Xfm8tBS5Kl/O5S+5VhYXMGcdRggEnH0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg5GL3y1ShnUCMopr3nWXU5JJih2N/MEGPKWAIyn0r1sfcqTGzwWopXtPSOdukuPoo8nHilUB2waPIXIIzAEGmiLYxrIxBJiqH7rVNLdFtOohAFfrmZy3XfbNro1FU+4ykc2sAdyc4iRFiX5kMYgWhQN2h0fwhk6AtliA9x1mqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eujTWhOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7yWw5RX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eujTWhOj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7yWw5RX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9KG92914553
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR97z8G+6jgCJqQFZPM27zlVL+SHnlSX452SnbUL4HY=; b=eujTWhOjz0AL5noy
	NigIlm8DuKdAXUdX0pyCMGCgZbnk1Fz0wDsUrfdL7ixMy3W/D+BP6SvUNXMitHaU
	jN21qqR7l0KSXyoLHe5UL0gStrBZM3otEkk5Hig1mvBa54cVQK04IspIjWcDyF3z
	qlEkNh6HEmlKkTMp2gc7eGpBGGaY9610rxvlsnDNMEbFBFt3XvHxraa4j4uY+3dn
	5aN2DHwwH5y2g0/K9MrIUVb809wvTkfcQpNRpkTUHrfwIOHQqtkeb16WsHrMLalc
	5OeKJnDALiKrvtvl7ZmSkr1AAX9udIgHMBGAlneICiYgRTjADSDeixEatbXuUvPJ
	9HAlHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1761v34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:48:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158ecbfbc2so35248685a.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617735; x=1782222535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR97z8G+6jgCJqQFZPM27zlVL+SHnlSX452SnbUL4HY=;
        b=b7yWw5RXPlneuXvwuVrcoOb7w5IRlZ9EtrFfDJH6cmYnGYkya4nrMDaEEwHv/H8IMt
         YEKpYr3mGq1vO1HXHqp3NdDqjbpxj9ZODFOUygeky2bcIVci4WO7VNJI5uq0joLIJwGF
         7RYPqFuWx06DMEZCnjSAwtAfQ+jGbwYuQr9FaOoNAVzTJ533P1LBv9oIGK9LHxPpoA5u
         Ww397+9qWurZDkhdhyRGSPPlE7lHofi1m0CzaA+YzNsdSiCY1oioZafj9ja0o5JSJJY/
         w6ghGqxp+Vj8VMkGKaD7r07wCzE3Hm23EmM47PkOsnMzhJQ5mqmRb3kyGwhcPyljX7kZ
         2TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617735; x=1782222535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fR97z8G+6jgCJqQFZPM27zlVL+SHnlSX452SnbUL4HY=;
        b=dEJDyJwrQ/H2abk5ZpYK9T9x5A9W2rAUQODzResfT5QBblf6R5looAwSDAXGCUaBX5
         127+FfjQsQvR2Ov7lBJyj+Eh2pBVer8yXBcY7NQblw6kE5WAKrb99GWS1ff39Mu6vndk
         9Fhn9eEtVobf0WmbM9sqWmCkD8s7hf2+vtGnqRJfnzdNzhBrJTfJvyM/IR1PH/8Rci99
         Nrw1moWCDmhUiBp+bvcyOKUJxibGDQ8BwIKsrLGWZZED1En+1r1vzr6wtASqcVfQ9GFk
         R3N0RCN42CZTrcw13vMUkh3WGD+4LsHPk759LHuKlw6ckLBgGTICAbCSaU7u9TdO3N54
         jb1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EXTFJM6VxHOZMFz37JmgoAVY3OZRvUKL/Z2TqLttW3/1F5D7aXtRcP1SmJ6catkjBcFYkZIhZXY79@vger.kernel.org
X-Gm-Message-State: AOJu0YzqtFG8NN8oyXPKDtWDD0UoH+7gZEso22/t4kO9UsKz3+nai4mZ
	zhOvbV5wvPaRQaAqoH+c4nyrWg6veMBBUdT4sd0p7xFNDKTecqDlCpzY0CeQkPwQWBoqqSPaGIH
	XLfQMTILPyZveHRueJ1Zps0puLne0S7v7l0vJa0jKXQwvmJJk6lvd0Xr+J5tTpixJ
X-Gm-Gg: Acq92OFD2zxQ7ibioP48JlR3XpIt7by/rL84ZA3fu9Q58v9tj3R9gMl+yntZFc3Y+sZ
	eWBPfWOuGgpP2C22qKpm+M3T+RBjCGFU1T3EOWrTLwjg/bc1tXOiV+ZRZ9kXCLBg7rcBtx20edA
	bwVtaodmn/pYbBXZzy+tthWT1H9i0s9nv6YeaT0KJjuWsNrcgzgvJ9VG6D3Uzqs5QH6SqJt70gN
	TixwJobi47TwKAgjx1KW+c4Z1KfilMvVUSSTjsd1itHQI744pc2aRjhR3tleZIE+JTyIhlOztNN
	GuP1vvg8Qxey9n/cAKvaaeXkcmWPmgLExBlldaX7WcojCN9zf/8PjWLyJxnCs1CErFANdiW6uZm
	X9SRs5V5SCbgR4O//gZ/uHZ8QCIN+sfrQOMK/pFixfkeNsQ==
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1691620385a.0.1781617735106;
        Tue, 16 Jun 2026 06:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1691615185a.0.1781617734519;
        Tue, 16 Jun 2026 06:48:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbd7sm645710566b.29.2026.06.16.06.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:48:53 -0700 (PDT)
Message-ID: <3e9a3ad4-ff23-4b58-bfb7-5dda8f7d7067@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:48:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        stable@kernel.org
References: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PPa7KUTtYVK2h9B7QhFfcqkbdRtzj1FP
X-Proofpoint-ORIG-GUID: PPa7KUTtYVK2h9B7QhFfcqkbdRtzj1FP
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a315448 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MRSJXwsh2T6CJOjOMtMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX+ZYmGajD6NF4
 wzoYS2nBckOkzQltWUvFdNozbaxt+pbHNa6PzrugPUZouCOEIwrUyLIHNMJT3mp8J89BJBrYk3O
 e3MAHOWmbZKruLh5iFnUgE3yZWfqu0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX0ediGiDX/DV8
 n9Z7tWmv5X/O+xlCg6fuzyQWeFXZpPN83jNoujzsdLmSCxSB7GWmZHhkOUJG79bORYI3/dzfBi6
 2RHVYy7akM4mHmB9rGBVKmr4rH005w92fXVGTL6SrXj/EWBSb2KEMHD/7e1YI69kF7in3zTFShH
 YyECwdxkROrOkfn1CiKD+/+MmDT4qOJ2e97kzjILp7XMrxTChNDdbFyY0I78ePlx19IyNHZrqq/
 0KmWNhS2y9rPH9RIVppsAbxPg79u8tUD7Q9WKlSDcBvpL4zdbmLwCjSoX/O+jSxuNDZxJllLipS
 2YN6ttuoLN4YDRKVYfQ12QWJd5w10pE0CNLeQ3M62pAzNlG0rscVV0cno2Qil706Mvsyy7q9Te1
 l/Phfq2pIcY++jcQDE0DCSCZJYDl9vOHMQHVQ3ko1r2VnwD9XB+6S6NPegYj9aFvhPs+1eRvYbq
 M9WBnPStFDl3at9g9FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140

On 4/29/26 9:34 AM, Jianping Li wrote:
> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
> reserved-memory region overlaps with firmware allocations (UEFI/EFI
> runtime). The kernel then reports failure to reserve the region and
> subsequent EFI runtime activity may trigger aborts.
> 
> The remote heap node was described as a fixed "no-map" region, which
> turns it into a hard carveout. Replace it with a "shared-dma-pool"
> reserved memory region with reusable CMA-backed allocation, specifying
> alignment and size.
> 
> This avoids hard carveouts and reduces the chance of conflicting with
> firmware memory maps while keeping an explicit pool for ADSP remote
> heap usage.
> 
> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
> Patch v1: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
> Changes in v2:
>   - Correct the value of alloc-ranges
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

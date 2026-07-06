Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F66D3F075C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329144; cv=none; b=TJjGlTe35gYAmc3aTo14r80AtNxIBGrEIQ2s2zzYQvg3oZCN52MSIy1ex+n7nIeQfqyu+cSs6Uj5hUGMvBZxCTYqMZzaROr9iGaLC2LsJR4TdJrqxJ38/zVdf4goCoNJJA8gDZn6SmDcaPVv8dKC9DGFZY9cV1YYxmQfPabLFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329144; c=relaxed/simple;
	bh=/1RpH2yqnJjPQNIJTEaItpf2Hr7eS1uAWjtzpS9kJTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJuSzmHIeRyRioUdtwXix/qcwNNWPj+f24p6tbwq7PoYzyR5TT8nQKX0jsg5TSQMmh5tLArY5h+ZAo8R8dy+pfsVLPKqMikiG284hPVqJQlazkIvJ6du0F+PCRX0vVdhGr7aZqCba2Eyhu6cePiGq2AzVyF4svTXfeA9HJECmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbcFGi2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MAnMAGvD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbcFGi2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MAnMAGvD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666942on103843
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4k6XIctOMsE4I5wa1lf5vN9/0nZHwVX3CiwfZgZSUM=; b=IbcFGi2oOgmZA5vQ
	rdo75Uts9RobpqOeA3ibXYygsc7tjiNP0TGs/E40Pywm5rpm34E0Keywgi8tXmFI
	iyEqGUY2DXykOPGR7uDhHC0Wonhk+3EINMJKdX2TyvfrhSd/BNncDtjvGRY7HdtT
	mK1OFXKVUL1NY0eHGF/M6P0j3eKKjN5wBvPjGxFI3Nze3ta6Xl3Q/UlpWbJGcAgW
	8v1AgLzyj8w7wjvbSEGZHk1uU8yLvaGMtd7Pq/85IEktjgAqVuH4N+opGg2KOEJL
	62XtiR1UWQFt83csvsKVhcQmOMQyCTgDRuUt8L93gZNx5mb7SefscLKcZ3yU0zNH
	HwWn7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h5092u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:12:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9e994869aso47279685ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329136; x=1783933936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4k6XIctOMsE4I5wa1lf5vN9/0nZHwVX3CiwfZgZSUM=;
        b=MAnMAGvDXq5o89SCBL9uy19p6xADUQKt4p0GM9m1aBP2dNE02cHnXC6cbcojKel6fc
         RPYAgMoCWwG+Vr7GTkvU7u/EcRZVbhOfF9PfMUC63POPE6lm4zkbtCY0SCW6j44oAXTn
         vWY3ss7iukvGLS2ksk6YWplqrcaq3MhLGbLVFTQ27Th1BgU54j8HeZDXIqvT7vLKTcu+
         XQxahan2EvZrU86kOXm+Qmg+wR6mTQip7NAYOhP9022rRerta3FwgfBU+gj9ZYYh2zyU
         4uM3htHpuleembVkTu8lk8ZF+CfPXabHieeQVhUgdz1jVqV2EWdd6FLLSfh6oFNyaLEX
         iJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329136; x=1783933936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4k6XIctOMsE4I5wa1lf5vN9/0nZHwVX3CiwfZgZSUM=;
        b=n1BXvTtLM75bdSt2bzK9TJv95UGMocuDj5sxX0DDDJk2RbVpsIV5Bx1pNAW2520eQN
         pcU8By9tmRpJyGrarA8P5fBO9VXinrkzu3MpJ3tEPxG924q6lW1ceansMMST7Lq6wFX0
         Z3WxRZbKnwu3R/WP4iR7DNuFcDEARaT01UDELt7FrDce8xGENL4ouEOGTq7J6KaFZbed
         0pAQJ5Oic2bJ/ETNeP+Rtcg7FQss8qYhawZCmkzRyjX8RPeLWxWxG+J1LBjyEnByRT5+
         f4uzlrYClu+Y44K+yLZL8w1zB6ML6DZ+ISaQrOxi/oktcag8jlZrzPr0vEgLoBgyoMIF
         qeFA==
X-Forwarded-Encrypted: i=1; AHgh+RpyRNTwuPvsJLXG19lPlLYQ1OO0/g7ihB3lxXrZHURld5GFtW+KJk7d9tZnZnodl4ip95Ryhx+D5QYk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KWD2TOn9EC10QQIgHRGvvg3F3W8PVuztmAmxDEPANp+vaGR5
	kNTu1n1Vq4IlC6EAI2AFrNvS95EdJ/I3RJ4DTGhGHgvhL6TdTbaccvWTB4kyeYbEUZ8hZelp7YD
	CiEUdtT0N0knPecSDufJ3gzAWu+M5wmS9wWj7m7UnD/2hbzFHEfDvlrYcKPyqleui
X-Gm-Gg: AfdE7cny2kRRzBQuXIrJoN29u1ZG0BAG0PbXJIDFFnA9G7QADWLtxXq0M9Q7c5Pr1k+
	9a90aynniwkUzRfj9EJwYwRspWbHSPM7cA7G9ItiluaCLhdzIMdULcWl7tZl8Ijqp0Hmr48uWo2
	3hFttZcLmTWW5D1wQjgQ5Wb5NKEgSXPkQs7tUtHXWPTWxW+nRHk+/8o4B+hg6d4E2HsP6EtwJ0V
	JULOSZQR/Afh2S60wg9RCbrKz6vvg7/gj/gu/mAaEvX9xCIyMm6lLgKs0GAa97/VGv2Z3yZX8Q4
	obdoOXcfVKz7ARQ7/UGrWs0CV0Cy19wlu4OpnLxNfYNL1kqC4EoAI5sNxOXUmW8JpsfsEtlUCPm
	oeco67LK1RZsVW86g3bfT3ScvOgJeJEAXpeJ/oNu7
X-Received: by 2002:a17:903:1ac3:b0:2ca:2753:f3cc with SMTP id d9443c01a7336-2cbb9efe1afmr101025355ad.33.1783329135988;
        Mon, 06 Jul 2026 02:12:15 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2ca:2753:f3cc with SMTP id d9443c01a7336-2cbb9efe1afmr101025025ad.33.1783329135456;
        Mon, 06 Jul 2026 02:12:15 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870ff3sm45614775ad.58.2026.07.06.02.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:12:15 -0700 (PDT)
Message-ID: <91fc1aa6-b237-49e5-be50-87d6a06c6bd6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:42:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M26b8gMisMBMObhRfGc1IH9B1ud_PpZR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfX+6fbNQUIGFHX
 nYJ6AE6pVQD9RdYozrW9Tz+6eMYUnyCKWL5uhYIF943GxI1rzO2/KycSkHnPGziVD8UC2/L2cod
 6OFJat/gVi5wMu/mvvzBxxckWsc9+rM=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b7170 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8IRLu_cne5rxmUM_wKoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfX0+CUGi509HIR
 M8/qLlvWyWVYnf8i+DHyRsUp4F+4o6VQRxzeqet0tggeWyzhM6fXHAEC11f+3caH2hftXabno9X
 eO0A9lb/rIxyJmHbh5Xt5Yrc9uOJcrFz+0ywFPx3yvI9BD4lECr1K4gdFpexK2UxLRDzFzxhgVM
 SYS+KhAWDR14WJJwt2arBsma/9RhNTL8lSAa71ZOG56Ep3EbtNw0PEbuIS8j6b34k2CujYB2fgI
 lC9BcQegS2zc1Cup5VwnKvlrwS+a7Meo6mXRT4akLbqZm5mWPB4y1F7YEiMdCgY3xAV0IEfQgmd
 c5+RMviBLuaQCdlIYcFFMkwY0PhFPHY4G2JmgxYzqaab7GwHn0Aj5qlk2Tp+vv8brPHyLHmG0pF
 hsyqtyM8j1kWmR2xbfQlxZCMLDmzUmeJJm4wuw+jtinLmX+xeY+j//Ip88Z7Dytgb+Qd95EzF1O
 Ypz0qjekcxfoTV7q5Fg==
X-Proofpoint-ORIG-GUID: M26b8gMisMBMObhRfGc1IH9B1ud_PpZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060092



On 7/3/2026 4:43 PM, Sneh Mankad wrote:
> SoC sleep stats are present in RPM message RAM and subsystem sleep
> stats are present in SMEM for Shikra.

minor nit: use RPM MSGRAM term in above line as well.

> 
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c
> was used for subsystem sleep stats since those stats were populated in
> RPM MSGRAM.
> 

[...]

> +---------------|----------------------------|---------------------------+
> | SoC           | subsystem sleep stats      | SoC sleep stats           |
> |---------------|----------------------------|---------------------------|
> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
> |               | (qcom_stats.c)             | (qcom_stats.c)            |
> +---------------|----------------------------|---------------------------+
> 

[...]

> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

other than minor nit:, looks good,

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

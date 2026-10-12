Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E77734F24E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818689; cv=none; b=CkvRbMAdEqJb8ZANRV7wG7q6qZdlvc0n8C3P9eaSE7k7w6B7kqnGfukFAZiQbZWJHCjGXgnsytWdR8Z6HzEXwVpkp0JnUGTHL1k4sa0jeXHkMhMAVzLlEuzCx9N7Qg1G5puu3m8XDBGFAtAtK+lmREyB2NaBSrAF6ZdwrDHS1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818689; c=relaxed/simple;
	bh=5PKfdrYjfLsN56DURiYwbgMF1Kt9itLAG+LUUyOw0MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=leWogqmLMXv78hLN/MUn6FY0q/fCOHzipHhhaxWt09FBCDRDd1spi1HcFl0rfonxyKxslNAmRmO1cV2mEAqxJNz1E+SFafIOrRlhQWW4yih6NYKsY+SZx+X42EBhKWsjq/9Yqe/va8z/JutDq7xhIk0pHOmVJ6IBxUKheg88j90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qhn+ldJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnHhX89b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qhn+ldJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnHhX89b"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC05Nr2786871
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpObNZ8wAMhmftHL6KQaRFI7Ti3lZtsbLDUSzPpXy9k=; b=Qhn+ldJ96WNWxtKm
	g1ji2rPtNBmQGlzQziQsYccZoJoASgnjufnbbswAWStZZBcSyVBgpT1vw6BXzeEH
	joKG/jiEIQdu0+a/n54tIk1J6qooOeCI4BWW5NkaDo13SVruYjmhtFqzwZDdU2Iu
	m9tXTWSGSZGHbywSjuAgi5O5uk/gXnF6YOn3edXDg/UtenQCWKqw4mrz6o5HXuWN
	qSzL0q5fQqFTDAwuoOqCTLpy8SLomQ/pSEat5icZ5cM6aYjMLynzZOVMQnaTaZKr
	mkTBGZ8kTaHVQmCrtOVXBYIql8+7kLqSYlF+n2SVhWH4xL6fDzEvghH+2Bedk7Y9
	emBaCg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhc6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d44237e2faso57639e0c.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818687; x=1792423487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpObNZ8wAMhmftHL6KQaRFI7Ti3lZtsbLDUSzPpXy9k=;
        b=QnHhX89btU9s/k/kfFjjwsGVH6pYCNba4AbVK0hKkgGH+A6GIvvY5lPjJiFlDGoWHh
         GASKF60KGlsuOecs70xVwm74O+MIUPo+ba89C7/nkTMFwBtJqvNUlgn8o2n59NDiZX+k
         ZOz4ZxSRUlenflv+UEoUZ2+unY+fbaLlLs1U98N7+02W6MoehnvagoboWKF9s5wTU4Xf
         gJRH/f7j24CRTuGTMWKR3HO/HgqFofli2y6DtR6m8ym7vHUxQigf94IrurqJrgWFocbo
         kl3T+eHgJUfM81h6qtTVJwuKzxZ+m5xMGeNZhni0ojfnqTA85n1m+9AB8tiOFmDGjlKA
         lBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818687; x=1792423487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpObNZ8wAMhmftHL6KQaRFI7Ti3lZtsbLDUSzPpXy9k=;
        b=fBHL8TxQ9XKbctfas+l1bARfif8q17hXOYCsvYY6xtEtJDy5U0kbq6ce5wIDanAgZJ
         CIYcsuzunQsNobMPXnHhWapI9X6nLfP2Lxbt2sl7aUUedr0oh5TDQeC0jlAttHMLeG8T
         XmnZquUUmqVF+3nYYyoryQpHcbT3RUYuK2ZlC14MnKpQL3pz4+ucPSNpTIGsj2UkPiuW
         s/kOdT8Pl5Z5rgFULpEObOmOmXzCIy1wAFoRuW8JlEksCLiXfy+S/ce+Z0RsR346HLTH
         QrCD6RYldFZAyfw8mXig5/FI9SiyFD1cIx+IsVTLFKb2K6PvNRHIHzIU1h//z0tp/wG1
         2X2w==
X-Forwarded-Encrypted: i=1; AKwUvBxSrd6roeg9Qb5/ruilPRoExUw8Ly1DrloQAGWPWlyAfZZMF+8q/jfrzFdRNiU9exec3MXyAeowXl1e@vger.kernel.org
X-Gm-Message-State: AFq9FYJjCZpVfYIqUG6/tyaxW4qtjIc6LQJW0VQI/5xT1fajROTl2PpJ
	eDnYJrZjT//VVxEdvpm7VOQOAlgrYufvofhP5gjweVob7XvOhinVraq8uEd5RBP5ae6wC7YmSO6
	DET6akT3tiVodMhyTJdgRE/6StpjxxNzRAvwrHFUM1ir0HrsfrFGWSt4Oa2POZ+qW
X-Gm-Gg: AYBFou3YdG5otfvySE1ZJNfvuRqEVEVfFdGZ7+yLEM3ECVEnbh+RWjlHNj7iWD5phP8
	BrpsxrQJ9qAAd2uyLs7dnCJLKNZW8qtYl0VFZd41StCWI0/3scbzdSp6upqixh6YJcFC0kk+FtP
	lo8yN7VGSvuSiOIs/sM4B82o2g4SDrEiRV1KjoQUPVK1JxrV+7A8jzbkFaD8ILB942vr01PDLd6
	i/zaaG5iDKJgP9fDkCrxeP+PiGMjRZKYr5dCRiwR/E2GMQDPMIZbKOJHxUj16qih7/w5l6fMjHw
	g0yW08RmFpX13bEn32HkF7yd/7v/Vtjxtg4PRvKTtIH6TJ7cDFSyRFs3nBeUkBS9KGEn3J5ilZF
	sizQkUQahRCijkt2BKBFzDg==
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr1998857e0c.3.1791818686724;
        Mon, 12 Oct 2026 08:24:46 -0700 (PDT)
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr1998840e0c.3.1791818686267;
        Mon, 12 Oct 2026 08:24:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c353033b3a4sm111033466b.57.2026.10.12.08.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:24:45 -0700 (PDT)
Message-ID: <ef0d4c1c-e070-437c-9bbc-efa02e5bc86e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/38] arm: dts: qcom: apq8064: Add space before line
 comments
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <bdb549b57918f3d06694769b7b9f5c438980cb4b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bdb549b57918f3d06694769b7b9f5c438980cb4b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX7wu5VLHOGuye
 fj1Mq5SZp5mclD6cc4JjTq7iI9WJNKPBycBYo4csJji/UK/80p6G9plKIVy6tw4TnUCF5lgUwYp
 XhINk9q5q11FZ+/Ydsvdu9dOJH5xYYEqaCrDK1Yq89moUHOswnF4QL/J/MQswy5jcrXZNPCMQ8r
 /mlUa3h1lWWraQ2V2spkK3Vx1AFNGSLgs8vurcfyLGYPqx5im18CtYlLzhs52Rh/9sFRltVRHxJ
 7cwdir2hYMss9wIrexz/f7OLK5amav/XjUxwuJh4BiGJPimXcSYUvPxsV3LP/8ug5f5vgzQKtAO
 xwl8tqHiqh0BX4PxfYfYR40VEpFeCuHuNtvVp8SIU2ixYo6E1z7hdYSU/4fc8cgQA/lDUsih++0
 dU2STIFU8iwEhfLikgoSDDub8VqfTm9Bf5waAEShcCFEv/eAsPHBNxeKNM6b9+ZZTcwl3rfd03M
 T68ArAeFGwh6ez03B4A==
X-Proofpoint-GUID: PBDequ2RANlFpw13ZcFlpelVN0nhOHld
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX0gvhWjS0y1Qq
 sS5oEfKAyp4BKEsv5vFssRcGaEC8ci5Cmbxn5bh+V9pJj7q7nf1DFlKydWEZH22OKsYhmZB+eyh
 NbJHPmIyGkbW9mF0wLNBKGkewNjwSF0=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accfbbf cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=tT5mUvbUHgr4e0dpT0kA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=hhpmQAJR8DioWGSBphRh:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: PBDequ2RANlFpw13ZcFlpelVN0nhOHld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space before start of comment delimiter. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

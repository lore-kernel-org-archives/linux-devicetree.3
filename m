Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E0A4AA1C2
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366416; cv=none; b=crz6ZPlbSNLQDX4WKNE3TdWfjXo+aruHVq/6hX/rXMGxlXigkxBHOX9Rc1+t/UKwnqSr2olyoJ+ldNkT49b8esKuoVtSNuhpfggQ+fg+TSFmajHkZmhm9SX0Z4cJT95ol3gtYd30OyTeVdEhREEEnDWdnaT+9Hu7Bbj041GAAHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366416; c=relaxed/simple;
	bh=4V75VXPdJsV3etEtmOB92/leTElAobw81eFBDOD25Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOCNl3EBEbJ2b4goDhORnn6V3lGALZmLMlMW24JcsaNb5hULQyD4daYzFTP3I3dNE5AHt949oeQjAkxp0iaDqp9PSKD8xsvwWxYAqNEB8qXZmtQaD8hIHpcUjs5daN0FawIPm8/eaUFqVHVRZHxKlO0Wt0SkT1gUI+irYlgjQkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgsmkQRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCyGuBWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgsmkQRr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCyGuBWM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Fcv351807217
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 16:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=; b=DgsmkQRrhtcjid92
	Znhb87lnm8+WWhMHrKl4p0WyNyWqrewdrlmVza5UDPrH3MYl7DzjF0C5lZw/PaTl
	7uPGMMKDlh4SX7v7smfmyUSh5QKzh1vMweZWqXs96TeLjLkMTScAcpGCMWdxACeG
	wTE2fEdTBY+znffYJ9zbVlrpQifwrWgPgPjLhcf/xlw2SMnCoOPAfk2J6ZCsvpNO
	tStY44Kh7xJWgj6Ee+rMgVHoMBKusCib/w1SGWRASmLXsqkTxc1lpg5BzIPY+TGl
	znGPSYtEAWTCtaenIXJnlJ5vp3swrQrhKAkZE5H6ZeeIgCK62gjPvfUZZwnWIbz+
	DomOCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdrd7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 16:26:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fa40fed05so1711841cf.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366413; x=1788971213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=;
        b=XCyGuBWMANu3f3U1dDXHchKD+ICOwliLmxw/EqwtoCNt2AeSTq4t2qVMzEmcfCU2N1
         P6CqlcSjJZ0JGBJEOwmWVAaznIj3RKpyJyHoXUYVJZ3JRAlQqSlUSZT5/IbpBWIZHxj+
         nCacCl+1ezCtwfYBBF3SQtkBLdwY6cdNstq0z+BgFvCf3/SuTZS3KC+J+w+twtOxUwpo
         KUxetH29XAfsxsydlpNBev1Xq70be4h6VXww9AiDXojBc+hshDJo6epxBCwy1M+nf3eQ
         thDvDj4eoqLaYhFpGr2eprr/DmEqF2lGgEtxSfJ5o83+BHO0ukoumBerZSYUupw+2Vdb
         7t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366413; x=1788971213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=;
        b=S6CSvqY1cBcEzIY5qGMndHl7dWAquCjUqVYugb/tERsrWtrDtw3HhHGg1Yn7s2D0ng
         3nBoZkplQS5Ea0drRgonHwkW8S4yXJLAceKOJY+xxTmIv1dOWc2xxOrsJ2ByYBZfhH1n
         YZNkA/5sqkg46WVI5nS0w4dX3cwhddNskMW5sblJ7jM5UkOlyVmzgG1cskkVQjA1e/wk
         khWkPBVelbbMEIxH8hla/L0A3yEiIo8m7DKM69/KtPOoWFHKEUrgltKP9/7dmR+8Q4Bq
         EluN1Dhen6uTrUpgpULhltOzokoCokd3oEbmMk+GAu80tfsBndymRnKCC8EARs0g+nor
         i3yw==
X-Forwarded-Encrypted: i=1; AHgh+RrQI7x5GKo0nZyXrJTDsKoAc73jspStUuookI7JyUXwJ+mxa30hQRVlu7xUry+5YrpEVNs9Ph6Ds6i0@vger.kernel.org
X-Gm-Message-State: AFuF++lz5XY74CiLyP8whAT+DXH4CqCCgDpLi2Qqr6d3xYeTNX57GG4m
	3bnKcTakLAxLq9OWBqbzrbYPhbcr4cIz47m66iplI+kCtQb0y6O+TBu3z2TOeXzcFd3eEXV5/Hd
	dSCiP9BFKBVEbHAwAMzd/wSQfhdDVnPnVp2Dmv1uejf+U8fBg0pBtQMyjUFF1mrKi
X-Gm-Gg: AR+sD119O4xEmz12qVmXJC/CHF89QdVITzgHdmNY9FylvlINHC2RjVDCiKkkD4fXDv3
	Tou5e25UsFw7TQakyyfvtxgmK0CVe84UKcApVekSTTwUyRyibWjYZ6hQzp0Fz987e6+hIwIELlo
	dHfAAW42cXv93ix1RMWzljEJbf+jVfSTLW1dMmhojIUg18G2cZ9l/uwI7o7Vfk4bpZYM5d+ABf5
	oMt/n42USmW1eBa6pAYCGelafJcosm0fKOr0CxyjGHBYQxGU4yQAoc08vKoopbEp4YHCNK8LJHE
	OAZmKnY5Jvjzj8oyszy9k2xDlGFa3BV2Gqi6hxQ3LMxt9lkdF4K/ZMorVfRL1tRJP2OKGPQ0TD3
	0rCMxuZiHojFrpIwHTlf9rQ==
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr101469485a.0.1788366412747;
        Wed, 02 Sep 2026 09:26:52 -0700 (PDT)
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr101466285a.0.1788366412214;
        Wed, 02 Sep 2026 09:26:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70fdsm163297566b.4.2026.09.02.09.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:26:51 -0700 (PDT)
Message-ID: <11ddf6dc-f943-4070-882a-f60733dc4f71@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:26:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-4-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a984e4d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sfNJ4pVXpVnTwTOAvM0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7G1U0AkdPxnBwHHjkIxQV-n1ecaCJucR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX3r5JVWBE3Z4C
 gJMRe1Sgj9y95VDmEhtsLQJqYhU3EszwffB80jyetlXcin43idSyVCe4X1YUPCtfYz+PPr8edTr
 TWUOk6+c6krUuKC1w2WzsePIoE6tXCGs7uOaOmzwsVULkzdxpmG5UDp8Njk/o5dbGfQlMvJbH5w
 990vMG34wKfnRZPXROYUYmgDK5kA+NHSLEYFT48Sp72d1vgiT7zinrwbB5YBj7/aeS29A7/79uS
 7QBpTWHEX6uaS1oNlbD6S3/32ufzkp+1HGBNrkO6elKz3bO3voDilt9r1I4qjl6MKKqNCFUPvnZ
 mfJ8mdaGW4b007vwnJFDCSXwJpNDPc0kEIjQtVDVJBdccExbIibSssPKDtSaCr4TqGFwRFzlprD
 hKNJuOD3QAu/5NHOdpqLUoOYhzRBR/T9URsYKrs/Fke8ydLu0tR7EbMTWb4nSANKAno42prY/CU
 w0OCDb3AJTJPywxM+xQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX82TjKVmuhoO9
 LBTjcQhhvIcY1QHZ6/ht7w2Oxi2iRpsBjrxqO5BXItkTNpPnrI5D7iiAW78GW1EVvKAUcTdQAAF
 SBATz0woFUo+E2RRv1oc3239U7hI0qw=
X-Proofpoint-ORIG-GUID: 7G1U0AkdPxnBwHHjkIxQV-n1ecaCJucR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:24 PM, Monish Chunara wrote:
> Enable the SDHCI controller for eMMC functionality on the Monaco EVK
> using a device tree overlay.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32ED3AA9D8
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323060; cv=none; b=Y30SStblajPn0Q4c+GPqjo4YQfEITXXkkDdDeH5Fki4C1GBNRgeSvn98JbhT2NpSP4FK8Uq56W7CiUK9EoDgg6XPQC3QcnK+A4lQzKfM+XwsJcRCnx8M/EQZ3nSuH+MaKhoE5whSNHLQuBW9HPSl6RLusthXuzUarxhcdepxkSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323060; c=relaxed/simple;
	bh=c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfRhJirjpAj5tsmCZSu5CEcSRyheuQ92evE1qfRg4U59EH9iHadtH4hLohkuD3VC/m9aZthhjzPDurrVYvWcUHD3md6LO+bVEjKM+3qDsRRpTz99eLyrBoqgn5KAxSlIB9IBakoEZIbs/qxPBga8+D8/JW7tDGdYvV26h0CaeJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RICXjEuk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQW2nsrc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RICXjEuk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQW2nsrc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI3wOx2397709
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=; b=RICXjEukhZO4uJoY
	LQ3HEWS8Ooxa+CF6s1fOjaYpsJazgBl+8YjrALJ2s9EPJFvAyenNlvM/H89xDCZa
	hmltTIs+btYHy9Tg8d2tE2OzhDfMoD1M0rHK9h43AwCWHrekxuC3zcMMwcQbcghq
	6ln8MA5z1b7anYZaxxdeYZIbgjsw0ZBK3gRQd4vV+ZPipR76jjd21Z7Z4lQK3/1j
	yTtkghUeg3ACq18DJz+2B15uaObcqKiyiHBBqxDrFWe+Ke/dpOo8+9r9r6J/DXXG
	D7j9FWmnMydRNEZd9LoPNNKslu9HoeuaepNcWTBYyM1rIpGfCJrEnEK2r0q4zZvy
	LtI0nw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c3v0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:10:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so5400594a91.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323045; x=1789927845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=;
        b=iQW2nsrc9/v6reg7pTlKP131ZFTviiVUFKS1CMPzZqyjtFO7K+RglBH1nOKiOjoXy3
         cD7TAMPRWfaJXAEO9BwlQgkCjaTxMaOtfghIf8MgIQlokMPetfTMkFuKwYmoPiJwe7/c
         x6i5Sem+h559mJCVXFCJZZ3uj4tyd6pRXolIvJv4aKTP4IghFRBVpM5tcecWAv29GtTD
         zqhtv1gwRcl/h/FCC8WxOyTeCS+sZkTpGIuFrEnSPAHL7az7yaAgeb4Nh2v2cqlIOtbl
         WAvg4nfreb+/0UAKEGWzLQ6IJDcucIAY+wREld3M5y4algv0ohPpYyVqWtEgDFPCTuCd
         ugAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323045; x=1789927845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=;
        b=AKY1lshil53yR3tP45uDUezPFl+TMwveYVVDRJjyBtpio5UueHsKPfJADlUo8zNRym
         adMUvMZZ/940pIDeWiSfYjGOVRATJgypyKWvRJ1eIU1K/7tlRlZqOlxbbjROdwxnBRQB
         BabHgjPm29uTFBvEL7zlVl0MAMSijLIfy58z4Mw28xJxMJt11QT429a6Uvai2Ihcs1rl
         /8C84GIA/obKRNEhXl9VMqohomIGkjBT9rbqkJ6hGpeQfuRPFTF3/64RPhP8p1A84puh
         9JPpcDUEyZvBlrrNhjtPD4MahONFVGmprjEAXh3M0zaErrki71rohNKhaAp21YtAWWfq
         HPoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ7d5xd8/ra5Ff9IUxuQblGh5PcchcSrDYFGlW268iVYTpgn8A/2uscqM4nkKEOkXelVsZLncXdqt6@vger.kernel.org
X-Gm-Message-State: AFuF++lGkEiDezZLCg1zzVLZHJqL1zvORHv/FKAhJlA9nKA2lkb1FkdL
	BhNGcqdDd2vn53LaIFeKEJuq2P6cQBK51jKQGl67qaECKx40LpEaoZI9m0Lfsbh3ZPp691RXTFt
	OD+Mqd25dK0D3rYDPhY+wxlDw7p7hbIDZF6mjf1LvcLeLbEtvZS4woqOjo/NlS1+iCF3ZuDeT
X-Gm-Gg: AYBFou0V5ljqUMUB8vqrmzo1OYB2c7kqgKc0rq3iueWbHpUvjxw1lOwtFPyYJHF0rzr
	dd2hBuRE2/HiJsbrNO5OHW5XVrWPAK2zgmQdFI4P8dDw4g6t+I1RzLM3+hg3sjNFIX7rzyyqXcK
	hBlb/vPdZmXMrSBLtKg1uBoKtzFx6Z9xmO2Fbu8+tBb0k+c1FG44/7+UgJZB4ELi0Zjx4W1zA37
	/MYMgRYwbfx4ObrEzatlHQRvaMzmZzusInbIR1SzsVaVkcnVMvgTiAIGBgdtiwPQ/NJ1kdhuUTO
	3uo//w6F9IflPT7+15bx0v+lGGrS3aH+oY+2Exmur7sHw1JGVE+Z9jc0QdGiqx2ZlfpKM1u3IyU
	1jTCpr5Dwa2SOv2mg8oqdS7tllpca2bE=
X-Received: by 2002:a17:90b:28cd:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39d9b983602mr25214232a91.0.1789323044649;
        Sun, 13 Sep 2026 11:10:44 -0700 (PDT)
X-Received: by 2002:a17:90b:28cd:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39d9b983602mr25214188a91.0.1789323044251;
        Sun, 13 Sep 2026 11:10:44 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8137fsm20539816c88.9.2026.09.13.11.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:10:43 -0700 (PDT)
Message-ID: <44dde4c9-e4f1-498e-8247-94e03e85c521@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 23:40:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: qcom: stats: Add compatible for
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
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-1-3825351f9740@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-1-3825351f9740@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MchJu1a27cdbsQjjdGRIClA46mEG8YHm
X-Proofpoint-GUID: MchJu1a27cdbsQjjdGRIClA46mEG8YHm
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa6e725 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=1XLMJXld7+1tWuaUSnCLHA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WlaKPkoLHFrkzAxCTu8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX6TNLbswHQGs/
 l2xjFJRCauL4JRuRqMR7IC/r8yoGU446flrQTRdg9GkuO6sfhOPzqv6EJ53YUMaM3v17WX97DEu
 k3X4FktDJfyYDLxIszhQVFu57TesHgT0/b2XQ4pYy3aBES2FVtok8thmMX234n3pYnVVgGMk4A5
 No1Bswkxu+IWMXyu8jqCz8ZW4WBJ2RNL7Rbb8PN+THu04KKd8eo6b8Yp3qB8w966JnaATiZcByW
 xY7osGUY16ZR4nfIJqsqYFFTtRkgIbybFD1GCMCsh1BWj51ulNayklVYlcCeSyvAiGnqTf0b9Dy
 /bXbkS/pEPQFnLpzoLWrta9hgcs3iuWCEdvT4qrH3NRgF6XhbCj0UyO+viTMgtiAE25zXa/k34P
 igC51gwtMDaSpuWvu35JfDtotNDvGZ53fCB2+Zee+hMoGJ040YOmOAlIvkJ1K0mY8+RSew9Teno
 T5UHr4YUunWdeCkdljw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX1s7hloD4zs4v
 O2L//XLnkssrt0ud99yeSjq8OudiDO5JWuRNMh+reUbwY5eqiuQMwpsVnB0UGkBdp3qZedvaVC9
 otpgITasOPKU7vkFZ3aneiDt1dJAFx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130257

On 9/7/2026 7:17 PM, Sneh Mankad wrote:
> SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
> in SMEM for Shikra.
>
> A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
> and vlow.
>
> Document shikra rpm compatible to read subsystem LPM stats too along with
> SoC LPM stats.
>
> Keep "qcom,rpm-stats" as a fallback for RPM targets, so that SoC level
> stats are still shown even without subsystem level stats support. A plain
> enum can't express that, since it caps compatible at one item. Add a oneOf
> branch with items for this pattern.
>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

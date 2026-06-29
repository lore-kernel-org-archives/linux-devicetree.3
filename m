Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C2833FE26
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734332; cv=none; b=jlU+cbOi6q0jQVR2nXKf0v0JhLSu6KmDQq0mv/SUGoQUAQiRLpppInRuu2xd7zjc8Xf+kSTXm8H9TU//PPgnBTDG6zqqWgqWtZlWe0Y+nbCBBjZYIRHEUyjmaQId1zdjJZPjQuROJpV5ex9eAjkQIVF8NVms3gNJr4z01DMx01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734332; c=relaxed/simple;
	bh=FwXYfHH9Bx8NHSEp/QsVL+NKdJ9q69t/o0QCtV5eyEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhUWl2ndmzKFBFKL5PaNstmNJFJiWDb0NQRxPBc4MV0CkHvzOutTl3c+3Dh/Mj4vZF+VSB7RHWHXzpPz1FE5qZCp1T7OwgXDtoxirS2tnf9Hk+M8IB14BfZ9TxkSUTypAcTT1yEd5d4A8+qnySTmTE2LkCbaqMGLMD1fhnBzLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjGLDpIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zn3GTSvc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjGLDpIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zn3GTSvc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2WJ2646837
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fk2t87VU0S41KyRm4QWmRpQlMevV5iSeis5udDyMXow=; b=WjGLDpIyR5JJrUSM
	3qneAwwuyLYc4urYxv3scjWGOqiuTLixHcj1OtlKMoEOk6eOW55M5f1U+g3gM8j0
	knhBiLoN+I295n0d/XPYWtuuLUXR0dp6SKUMm2YzuJ9qNoq7X1L4POXp8Vg+g9Vj
	ZCuKzKpDOMtsoARpZ9TMeqoJIdpSPNYHRy6frIw22uNkhyTsJugM3butHzvsZxdI
	OK1NPI/PXWvMuev/+1L79pJH1ebpugYF7awmuOcTi74Z0HXTKiauECbNj/AFB+pu
	0t6dXPqBBEuoiiktGqWmcOmCrQf40laoddhrq6ItKzbaNY6W6KllPznp0RQxIegc
	XjPe8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4ts4a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:58:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so889731cf.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782734329; x=1783339129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fk2t87VU0S41KyRm4QWmRpQlMevV5iSeis5udDyMXow=;
        b=Zn3GTSvcrT9hbi6+5fEMD0ng/zT6wU3vFZIp1uwhg0A+CK00+ovjm2cje4a12jEMML
         xm+wSacUJltgSC2TSoZ8AYp9LWPnj3k/htGyzo5UMuicSiIb3TEf9pwDhYdX+ZMgvKts
         wzHtRp8coPGcEWrCDEBBC6BmfamaLPx2N6TOB5d+cvOM7Ivja7wM4c1a1f9Txx5TF/iP
         /K4ICLDyzKAeznLdj0WAAXaPtFkObM6MuSBvCmfAPBQBVgG3Rk5JTZ+8s5EBugL8zShL
         pXStBv4QbQD8pdyHj1XM1O2SbXw7n0crC7rHefpriZ+sreS/VWrx2yA0PTAHpE1g5GwP
         KSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734329; x=1783339129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fk2t87VU0S41KyRm4QWmRpQlMevV5iSeis5udDyMXow=;
        b=W6rOgPvkiS68EFfqsyqm2QivWb3EaKMcKL11GDkxWPKHK5udBPWiy6nRejHVQBwvWB
         OepFd2OndxdtcSs+mjYy7oMfWia2VIpBT13rO57HEYeVoYPwrGwEhWhy6uKd/jlHPC8D
         E3pLxJceCvb12N3htBNam0/8Qnn41D5HL27br75PmGKmJfJea5taRqG5VIw7DJhCa/I4
         4aYowEfNEdqhBhvdxqcCIWpovOesowqRIjL6syloNkUyGj5728qaBAznJ+oRyWExsQWI
         /xOSOvw6ODdaDADKgTNHZ5PcoV7TMouhY2kzWbM+xCk01g0YXXFdVe+qs/FjdPn8tyVU
         MmJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/juRYXfwqwc1tRVwNwMWLjHipwkJARDBi7I+V37CX4cDKMz0qxqkaF5A5I0RKVGiGq/C6Pb/QQLIKV@vger.kernel.org
X-Gm-Message-State: AOJu0YwPbpcsS24Ifiz0QCFq1pbrBF/WKXbqk+BABjx7zLG7ru1OstaG
	xGUyYZaM0Niq/iJfQs+4+KnMcjNmX7MgQV/ymkesEcMfugRz2lNE1Zqhh5hM7aOic8N2+MLzDYH
	gSuDuzac3eHTWaNTK0eX7pNGoc+I48tS0k3JFsvfG5RBRcV/M5OI2VMMjgYF/9CzI
X-Gm-Gg: AfdE7clCurnSUBkUnwRNq2fPNfhbg6g+KjiG0pAQFssTZ+SlLXaHC8UfKtbzoDIG7KR
	wH7gw5anjqx944p67rnhGWrd+PeZwf/0op4t8TOfLxrtz3wYP5yvKRpRcfSoUAXGQ6FLIZyDiuJ
	OukOK/KsXWmf8rrKi4zp1xjXmregjLR5dhN0j5xw9sPYDr6dziRaWjHzEG51p6khZHdDfhBvAUg
	RPNV8FLVA58995O1LCDv+KhfMnobtMaF63for4QlScCbOhARLb9Sfqp43SgPkpo2qExi/GmcWsk
	Ewl9Fd2Az/q+T5oYmKBW5c46xL8/tnFuANSgJ77j2c0qQC4l1/RdnkrdQuQscRSUMMt91F1y7tt
	8Or/TJLFVcJUcZEoYHJXIGkt51i+KrhBsnzc=
X-Received: by 2002:a05:622a:8d:b0:517:5d21:9899 with SMTP id d75a77b69052e-51a72a8ceb5mr149554401cf.5.1782734329341;
        Mon, 29 Jun 2026 04:58:49 -0700 (PDT)
X-Received: by 2002:a05:622a:8d:b0:517:5d21:9899 with SMTP id d75a77b69052e-51a72a8ceb5mr149554021cf.5.1782734328527;
        Mon, 29 Jun 2026 04:58:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124f1723c7sm260496966b.26.2026.06.29.04.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:58:47 -0700 (PDT)
Message-ID: <fe64f655-75d3-45f0-a1d4-b8222b37d0db@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:58:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX9x9Db6v2UECd
 0K9DTuGcDinCWhGyyLmAk7nb02BbwVR/jtrz0jKI2EUKzVhFy/p25jsE3r3JYvqpvwbpQs7PWtN
 vIhWW6mRM0HhJICSLwQ+bAeuoDrubQhTu/Euptlmyk4l19P0aMjAeMuzlpGticddr7i5oID2t4T
 fwgwhWFTA17+WNfPjyNncpO1Q/LZLn6AfO1sh/JWrCtyYTJnrGktVnYn62LpTxlOyZ9NeReRbd2
 OTYtQWrSy6NoD5WMXoPZhCQYsO++ELQ6rBRu85lVqfZd5pG2MGgrtqgfzi+Nphyjc9s/Z/yxX1l
 jVmJ+EBe7d90SFAmG2aSucPsiv9SaZENEvugA92AH+akLQkDN//ULS4s1OWD5iIuDqjZ4Vleojg
 pSilt2fJS4OeZ0XGqsXQfzvveCjCsiGw1iFBrRzu97INnnVzCB/XLc3xu3ud5Ud+AmYfPiToPTc
 Fy3rWMXSy7g1dMsb6IA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a425dfa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7wtgjnKuI7ixzQLi8VAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX4bWxeIxg2ehh
 aPWBSIT73UEyxNHyJclaTbTY6nHbn1qfim4KGzxZP+8Ygf6BkWUpD1ISKwTdVMp4tidKYINMQ+U
 /CTYz3DRbcLF8ilogSOtLGZukOJTkMI=
X-Proofpoint-ORIG-GUID: gN5C6fiDKGNP53MGKlz4OEzf0P6iDCZE
X-Proofpoint-GUID: gN5C6fiDKGNP53MGKlz4OEzf0P6iDCZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290098

On 6/29/26 12:40 PM, Anvesh Jain P wrote:
> Add embedded controller node for Purwa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

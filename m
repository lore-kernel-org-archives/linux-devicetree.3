Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208A4E80D7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555378; cv=none; b=Rhu1h+VJf8mlrQfLIFlX0eHySr0hm4mMD1pjpnkNBdP/iagq/dpQ5iOMRcJFEUYHBMzvA+VZP92sKuk5CPcNhcIOAiItdnRdTQGHHgE304AS//RdcUdqJQEcOhZ4ze67ynB2I0DLh3tL9Lznn+tHRfJoU+cZPzAnSaDNX7IlCR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555378; c=relaxed/simple;
	bh=UuOyDVyJeFbiCVINs6u9sS+zhZ6hq8NLiSsmu2mcank=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4lH+MW9PnKTXJgvtJDGVIc/VFYzRBydqzgwaSXAvYovjIKJKF46/u21upl9EGrvxCA7Bb73COmLbxmvhAv9nmPS5pIr/jKpnwFIR4JFX+hGFPnE3wGRLlHPVK5P+nvw0KIJBsB6//2/bTMsMFpIMUzWYQr8DaxlzUd8IoCzu0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbzJo7+d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqCCS1xH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbzJo7+d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqCCS1xH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AIK2658322
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XIEuDNYC2iW3h0x2HWVcVoAf
	DPrD9G8wcsAY2SJCqlg=; b=TbzJo7+d3AekQrHqciGIaV83lHNl2JiC3Sdpou37
	W9AFmny++RHIe2QaaUkAfIXfikG+dLCwFLxGMfl2M3A4GS3V4rP77L5MMRJNZIHr
	1xoIIyryOONURoCynr3VWDOcQvF2nCp7owl6htznYfJFPC3t/ZHVEjv8nTrcdk+o
	EuOA+JB6hURQOu2NRQMC5xB5fFymUrcb3Tpo8EIFJTpSCv6RkTk9sGTBJnNwRk5J
	FbZDLzQTKgHSPCO8tAyF0gsGTrvVJTFdZt/4P+XTn+5O/2aE6VlBnPe6O5fGNqC7
	pgb9qjUtBYjgtf2GMiWHdJDTeQfubkT8zdJrqDc9oAmSDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujcb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:42:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90ce8ad8002so124848816d6.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789555359; x=1790160159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XIEuDNYC2iW3h0x2HWVcVoAfDPrD9G8wcsAY2SJCqlg=;
        b=EqCCS1xHIPcnG01Wx8K0s5t8mJaApCFmCwJMhAQYq0kk3I0Q2Mda4595EMs4qbCGkx
         SUW6w36kI5XjB/NfUxujk/F+cTbDVjcVCTcjAGCaPesAqaNPlm8luha5kKm5qjgf8a14
         7X1Twi03cMD4L+iyDG+JVwRnoN0L1rJh+gZpzgrmxS2CK3sU6VgwLDWlR6hCDfpRiK4y
         wqnJiNZJ6SDCJeRUROPupDCH3AgRwzUlUcAmfPISyLT1NMX5YEry8uY3GtYOdWtq2dh2
         j7z8HftRz/4eHFo7DimWpdI8M0Lh9SFTG7TlhkH4W8cv4sFyzYWsgKoNP+cb72OLqi0Q
         5H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555359; x=1790160159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIEuDNYC2iW3h0x2HWVcVoAfDPrD9G8wcsAY2SJCqlg=;
        b=WqMq+qDhbzi5v3MjekhcH1gd74K7WTk1xgiC99qmO6PbSGWwNUu+t6TuReYIwofauY
         2zxThyF/r0xf9T0dOrdbPDj9AuJ3NscG0uMKQfy9vi+x9dXYCh4lquXJF1Zlzs+maz6c
         Xtt1miWGTDoiUQO8rlMPIA7y5Jei0ttWFwUQtcUnmv9KH1/dW2MEHIZRRcQXLXDpz/3u
         SFjVbPif5Wr3c5Aw0ckHNYGbnmUfVsbWzksMsxIQUXyEaUGFSI6ZxzSqxU4U2Z+gLH3t
         rNS2EHk7l98OKMGOlBgGZSG9FnwVE2acAX6uhIHLXP4DnbPlROrqkMVzkNon8iFqpXnN
         tFmw==
X-Forwarded-Encrypted: i=1; AKwUvByNbI2TlKJ8keuU6aBGE5jSVGU+QJuIc8zGI5gv4pCC2avdBxyR2x9yjTKMiojzFQwGyrAjJVP468tl@vger.kernel.org
X-Gm-Message-State: AFuF++llrye2Cx/cM7NB/3gtAM76STX68cSIULbsrYncrJxmlJGWjbLp
	JAhpQXlvxZMfLGBbx+OA4ppzAP5X18eojKR2PLF7+SE2Q3DaSrXFwTh9nWEJZ4K5VKJkKfwWXTr
	tzu7qSqPKIgVxx0e1ncNXPqfrwe/ApjGHY+Hlwt0ADk0spfiFAenx6JTomkPRhk1U
X-Gm-Gg: AYBFou3ekrWbz+mvmv/72lZTtmXmr+zMmMGqHzLiGgmq23vM/CKkMSmLoJcyCXdz0Fp
	AAZ/Wc2qyQl31AfQhVMulwKAgCUjlR4G8Mw5VHrAzBq85yuWixcpu6Myi2CQEN3Qf5XJUqTvG03
	TKbrROXS4ckkMDelOMboFx/dw+rbwFtmSYKWaIH+kYiGn3kvLp/T+acRbBAjHFvtYDWqir1/YtM
	tXbhhmDA9/TRQm9Vir5MZViHxSef+zcf5x0jhM2/YIn0rN2QZR7LfGPGFsoRrSkyu8Tf+5b2B8G
	Be7cXRVHMRWZMANObbs5S0KP/PLEabQeSML08wJJYEXiFDC0UfsVSfjK944+qGUVeLQQSSoco9h
	WncckCeBU0s5P5MA=
X-Received: by 2002:a05:620a:2618:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93bb7881a08mr317137885a.28.1789555359125;
        Wed, 16 Sep 2026 03:42:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93bb7881a08mr317096385a.28.1789555354062;
        Wed, 16 Sep 2026 03:42:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aead50sm78780185e9.7.2026.09.16.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:42:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:42:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicko van Someren <nicko@nicko.org>, Chris Pouliot <chris@pouliot.me>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <oorz3qknsttz5726g5ypr6ypmlo6ucqz7hrjz5lvrv2tgjbugo@qaalsnqnkbgj>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX9WWwHxjikTf7
 Y6U4Kxmyqxu6W4f8FP90LjACHhrI+hq19KO8ZaIe3lFECR5J0AX0gxY+GU1rjzF6FGmidapIT8+
 FfPl7gTV2+hYKgSmUjZGQmM2JVDH81nUbQvjSKVjiQmmRq9jb1qx89qPtAYcyiJ/f5JrnV9UoES
 ZjaJjJCSRmJb6Wt11ZqHmSF/usE/K13A1ONYBQqRDbslTSxKWIn1Sd+DTdfJHBmrKi4TRVcAGJ/
 bFdX9Q0GMdqfTgIs8H2NQVF8RdyltEl85OI1mrLq4FZ6p/ObpI0uFn54k37Gn+7jqs5+wRwrDaP
 B/uimf2PGqjnykDIPxfAOE+eURRjtfvAXVlFVuiiqOHTl3zLnjQd5+gfkpX41MAZ4D3Uonk/5fb
 FwgLWXTXC+vM8d6snJMO/j9LpDEjwFT3OIg9WadRtNuda4Ff779qD1M9a2IWWRDg8ERgLRNIEi4
 N7DVFSLMrzXUvZdV4wQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa729f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6LU_cUpum_TGSJiRvRUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX43oHWg8vSdBr
 Ig/9/8FzTX12f61G6qEVdTHvX450QS7szkNM8yVDHXURoLE92kgbgGNFqBTavemYLDxCOR3WWBw
 Vm1G7A5T4MAP2tG996arE04TQl/q8aE=
X-Proofpoint-GUID: U9Ni6mLOAgogdqVbJMQQ1u3yLzHLmYBP
X-Proofpoint-ORIG-GUID: U9Ni6mLOAgogdqVbJMQQ1u3yLzHLmYBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160140

On 26-09-15 20:54:23, Bjorn Andersson wrote:
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201770;
	b=BY0XT93UB26xp0DFSEXQbR0VjANuWUyW6NH09zBygjfMZmLFNFHqnv6GqsOHgsgrG3Y5
	 tgl8QKfBw4i5z8HIgrDVyRpSxjh3fN4/QJQZ6UQlRi5oRhjw8MPvTX3TRJ049/DBxcf+Q
	 CVMHvBeqgWMYWm53Lufd3JRSg5JbA1k6EzVAA3rZksII/AdOGbN6cQgjwidZdjRFU1SeV
	 wfjffcrDyc9XwYPJwhbPXxKcZdl9Wlx/GA2WAMkUqCf74ACGwSJXUNRsxo161E14JG/94
	 3mVTGx53e2N0Dmr4xPZNhUxunpZb9I/YHW+aBqkNb0IskUEHJ/zUkmo9E1Lelq6uLIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
	b=xfnxp+M3Fmnvy77JX0OVU2KdlMHq+7gkJ/5a19CYFxPiqafulUoSXdDrwavEJdqEBABE
	 u1WyVkWiKe0IEQjfBCmdfrrm/c26eRazlW7BYrvydTkBCNrVuHpy+eRKWJB/Bi2rDO4P2
	 c0wF/M8ahOnzwMUKqsqj+Wqn5L7Vb/WLUwBre0J13t4zOvndYOR6szYboZ+jW5Wtno1WP
	 u7PmtJbd6pkoyMeIYsh9OLza7gIGgEfLRe+bH6Q7xQI3Ecc08qzswK1lbNCnPY1yYcP5F
	 +vgBHaBN/6nkmJxOLwgajCNjklXGT/+zxzR0v23lAXmysF0Bidz8tVdrg94K0y/EFHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPF2g9Vp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPDUxPHQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD2C606A324
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD2C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPF2g9Vp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPDUxPHQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA3QC2543190
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X7BsiEJvpOtzfW72L97F41+W
	NVsWQvFRDOudbh1Aepw=; b=XPF2g9VpKEEzf757oCYGSqfWFGVr/Tx88KHa6+1C
	UDRhUIGXYOkMJHbtqsCrueXtHvnJpPEVIaGAS6j0NXqcfyjsptzwBOkCeG5r6b0P
	JTGEISoiKpcew6AwYx3kakTq9o9eWSEgPjhfP7FKEdWdSBJvRaqPrEdHKcZrp8Ez
	VJLjIqHBp2sJ7rVpreiFM1tux7TRLIm6K+REyhGgMTjEAK1YH//QpZBvVZ4VCRpS
	xqs/I9jZjCVKZ64FNZpEm2kxxp9uGH4F3NOrwJKLHbMaiILW4bEubQyNe9Yzg5Pf
	v+QezbqZdNhMCvMv1oLE4sBrmAoer0TM3EFAx4xYQADyyQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr4em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c71966998so15969246d6.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201768; x=1793806568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
        b=FPDUxPHQ4nvj0bQlFOqnbiqgnO1ECYtZ8X6kdXhg2ptbpEMd9DIB/QyNbh3uLSguk6
         zVy9TiuPt1xDZ9pN2guZdinKfuVqesPDIFTwCrtjmjHX15hBS9Tgrk8C7p6EntUgCSjx
         mhXTANC7JGsJ48kUpy6GaTxGYjk4Jox1hWYd56Z7doApIiGpnawUvYk/+R/aQ6PTFekk
         H+5J0f2zrwVBpNQKbnCntvPwbPO3RJI9DbI/0nl4t9GQNAg69lgvFVx8QUgJ1M00sFul
         HUSGpq40SD2wo7A8m7n8glqKXX2CeiOEuMnA5Wao+cq2Rac/SQBDBR3+kD/iiGZvQX1/
         vlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201768; x=1793806568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
        b=ZwRUNKqaFjRWZjTz58D0cJVoCmE22BUfvceIGabBxzdMldtyktyZFPsrwXhh9gT67E
         4AYwTliwUrkLpUhZiiZkNJ4uQLKCgY/HjDB0SlBn8Vc4dnIjDDMkYlxpJqI979llUhfZ
         2VyvtCcqAMRfOZFtyLz1m3ELKj/2A2qX8E3rF1LgkIiV7iyMeRCsOJGq5d7OZIjppStp
         t02PJ8u0R0+i4lRm/XUek2cSN6EJVnFcUMlMS3koPAkglhTBKUdvyscr0uGNOdtTPmtH
         eFO774T+Xg8jh4GxPWbAyZWyJuza56VPqfO92XWzJ/XisKv5k4D8alHVyn9JlbrmE4Mb
         lWGA==
X-Forwarded-Encrypted: i=1; AKwUvBxmRirRhTAbfSVtTtM/vJuwENwEcxeQYE+tA9ni2imQ4NrfFU6uipx/7yZZhLaN1GIIkAFfrUfX1rRb@vger.kernel.org
X-Gm-Message-State: AFq9FYJW4Rj31czzlVhEZjG1UDlgLLjZ/XN+cb5r1odWyVBqr8pHwBBL
	ca0zEZ7WHs8W4uvUX9fmzwNip0eKznrteKjXkNPLLhjtIsRrU4xtWCP+2RopduZQ5WzRZ5n+Kus
	mxsv5+UbekT8jGf+ozU8/N8dyphurHYKYeY2bEk/ocA78xglcAhcP81woJ1CuJQFb
X-Gm-Gg: AYBFou3E74lYWbvVpL9+vpZq1V3KceNL9GwxKTm6XEx5cheF//S9xweuRyneyX/HiDW
	K6J8XyGkANH8PMQTBuxxtiYZ5fCuoTT4WnfsC459jBLm+C0nEyWSWfN7tpDXNBlbgneAYH18DET
	aV0D3ZzkHULeLwkRBGB7YShpfmvIBJsdjcaOSrokJTeH5nqX+7Q7P76JklcktKOsfM/aE/kSIWF
	HdOh1P0jMpFOuYyYibco+5QDtqvAAy8CGDaM4WwNIVRo3EqxyvxY5ylNra8wWbt1Nv6xnn2UwzZ
	XAU7HDUIZlD0+rfNGKWp2v7H2q8p6sS8MjjWyFyuH5lpqIVsuorDLtllp2YOPkG3qCF0JLjhEty
	3CzEY9iwsudKbSlBEavRFc930qJ4/8fgmgWEu/JE7rPceAs7hKiGZ9HIfX2jFnKI8KA==
X-Received: by 2002:a05:620a:a989:10b0:944:9dd:b6 with SMTP id af79cd13be357-94409dd017cmr240087985a.80.1793201767691;
        Wed, 28 Oct 2026 08:36:07 -0700 (PDT)
X-Received: by 2002:a05:620a:a989:10b0:944:9dd:b6 with SMTP id af79cd13be357-94409dd017cmr240080885a.80.1793201766973;
        Wed, 28 Oct 2026 08:36:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm51470285e9.1.2026.10.28.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:36:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:36:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        mani@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
Message-ID: <ytxypmtfd7opi36ybmb4qd7arbfcb5mu3acthmpo26l3s4fkme@hbmfvg7xfqpf>
References: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pUFirkS8pUP63qiDaGCxG4ms95sg8gtu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX7maDNNvGBk5J
 VFUSNvAD4Gdn8PDlm+nK7iPwer+n4q1D2A2cXhHj/gtZH09GYuF56QOHG64GjQMRq42Gx5r0139
 sfb+jPTnfwxkfQhkacVys77R4FZOydIxLR7xRBmjbHxuTjBKqkivalnysXsCmj7TMe1hbQuweUC
 2KcNr1O5f024e9SxI961HG/ePEwzRgl7ZsZvKqIwmqLIJqf97GAeSyY9vWBwjWtmVg+BuJTHWwX
 C7swJajTSRU+opMlYjTy7FcbtZonTYgkGzAclN537emGoJEhSNqsaYLcaLLCuOTa0Ad5KWE0gnH
 JAgc5kVWCyYF88eBBWlYrzmAT6Nh0XJARWE1TUBejMWykzne8gMVfs9aS+4o2k/+/CskraaStEm
 NoObbCUvSXy5u1Qm6ltrHnF9Vm9Wxjg5H9ZxnnWdomW+2KWzv2gyAoYvoQcCuvHNdBRApEj6mrg
 CjUYPKZroTLPax8fhGA==
X-Proofpoint-GUID: pUFirkS8pUP63qiDaGCxG4ms95sg8gtu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX2ca/yeKqrjUF
 sGgDKZIhPgymm94FGs0VBudEFu1xM6Hh9oFZtXcE/P1m1hSUKj5ulaewmpQks3hKpQTjV0SxDSN
 9xLqP5IpzqxWNGnzAbsEpLuYp/59GnA=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae21669 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WKNOtjYE1B8OkmgEoC0A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-28 18:44:20, Monish Chunara wrote:
> The SD card detect signal is active low and requires a defined high
> level when no card is inserted. With the GPIO bias disabled, the
> card-detect input can be left floating and result in spurious
> interrupts.
> 
> Enable the internal pull-up on the SD card detect GPIO to keep the
> signal at a defined level when the card is absent and avoid spurious
> card-detect interrupts.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Deserves a Fixes tag, doesn't it?

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

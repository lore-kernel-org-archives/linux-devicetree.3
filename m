Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180226;
	b=s6Ntkv2G3KRffLlFOAOoUiyOf216CFpRvlyXHGCl/KPS6tUg9cA/6PEG70SuoPfLHfcO
	 F+5xtrP1c1auvc0isQ1i1jeHmlWwaaAVMZqiBu+IAyJw8s84WZBYvUHvbZ/0gSSqD1C5F
	 DiQP3haiurCNEENCifqWiPe/DkJFv2njQWCczFw0TfLOdS3wsEy5Hw53F3ccfXNi90Nzn
	 bwRMrs9DW9/m2HClcYX7BbjEDRrYZYt2/4ul2ZsazmD1ArDHwGoBdf4IU2Ai+cg0CZ+YU
	 bzQIp6s+23CRT75C0zYuWL3h/Rbb+haR9zmrymBa/a3U58nO8TLABDSbo8EtAWj6NQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
	b=KrcVhGnFwaOmNRjGwbgDRjAp4YO5LFrIyh2bHwYr6Z9PmP5thybiaWP5a1aDmq8jiTpG
	 6+sWpYEDeKaoCZQSNYamFpRK/Gqf2dEJNFcMrXnup/9dxcYGYXQwlx95XpUfI9rKVsWw3
	 opYFUaKgaWZlCmKhbPxtdL/hWSJ183vstLuZQuwaCulX22M77pcbym/iwcn4ENlVyRjus
	 F81SzD6dPV8s3GtUuKu8UlhucipeTYr2gn0tYnGMthZGi4sxfetBGE1B8e7allLSIvXF2
	 hQIa68rkNE83sMd2KnkSHdfdVJSrcN6Kg23eYHq7gjXmw9W8ttW7ZRA85bIROFQ/kJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBqdO2Ew;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ryw+AdFK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC7606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBqdO2Ew;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ryw+AdFK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KN50570433
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=; b=nBqdO2EwPD+OP6+9
	TpY6Zi31lkbEfvB/xizxY6iRFclevysUUTbWecmOMJYpzgADZE4NDk+VMn2iwN8A
	iB1+7f1jHtHsyxgO6xxII43EEK0kAJtkvJQDAWnlJaYfi9lL8v/XboMDuwoPCADD
	hfZxAgBeAB0wVNOL8ug9gRSnE2yal1ntScQNDTbjeCcoVMBCqHxYAddTGyuCrpbF
	olxR/1kt2fBMJk6rR4Nm6O+tsQpFrsnrWAg+u8kKei5pi1IOHnm3whxuLJ8qJFL8
	uy7/9hWgG+d8/g2VOxNXZSpKDdc0tZh5XAgxLQ+gXFcWgMuJEmxZNZySjK3i7Xqb
	1OIoYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy673gbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:37:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so80356585a.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180224; x=1793785024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
        b=Ryw+AdFK5t5+Sl8NMKnleXyGipACJMcpHwJKOJKj1lEY97u3gCGARyfDjF4jQL1rmU
         HZLZKwkhJUMl5PIWJNilk0Q1sw9f7DFMu7989sKC6QrFsJptoryvR01RZZsmW4ybhTJ4
         R2ixY3hGXCDLTURS2T6/tX7xVbS/2jJJ0djpRMMVAW98CW06nITw97OjZG8+x2430M07
         kIRhMlRb5RVMWdoyhMaIAmWpwfM25V/4jEW4Rzw7Yn+33uumG3X457MiVFFYgoGTTsTM
         tWTJz9CP+hSvDOojm/lV6+Bg7jQnepo2brt5RnLBF9Pse8bJ2ZW4nqatrz/XDnnRY/MZ
         JLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180224; x=1793785024;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
        b=znHeEwZHNIFveCWbb3DNLj2Ohfee0aRj5k5IhLCV/LZ3aUxqgdNdlorO5HVevWcGpi
         cjcKtIh1RQVWlK2rtG2PVNwUus6NC7ls0UNlc18FL1x0krgzlSzc3SrPg9ek0l7tvvV5
         3QypVJWNfyd5h7ugaHdT3FrFeLA7+dGse15LEdOZa0vflK0xnmzxLHuVuVHYBwMvKTBM
         51d5uqSQq27SamtGYy3VCgfjb2MVAY0HOqgD5cO3mJNIRm/BHpJDavH7UjMGXMcGLhNa
         QHjapvjqFdku31kDRiwELVy8EN1eBQ4YoghW5nNMzYHol1T/2iC4s/b15WSBusZ52oM9
         R/4w==
X-Forwarded-Encrypted: i=1; AKwUvBw5wYhZoAL6qFfU4jUbs88ZZ99DLebxPU5WmlYq3o3lfv8z7AN5DMNBhDm62fWhGRuUq2SH5XBLpwl1@vger.kernel.org
X-Gm-Message-State: AFq9FYKYtSDWkAvos3GS7erPMbMzP/Md83KPY9ZjF5HdPVRTjRWfMZOD
	bthhOELpIiXlzMvK7JUpL38xnJq1QyyDop2SFcIe8TSWiPF8TyewIE1U4uW9EbK8q0IpRpUiyr/
	eeN1iMXtTqTNrZkXKMzgfZZ11UxZChnxtGWYHeZMN0Zg8qF5R2oH+KrhRhRIZxXmZ
X-Gm-Gg: AYBFou3bBkptlHH7cN0JFwcgMSUEkRQ46ezysKkx2CXt6ENoeh0XAjNX/3HlC1isgYp
	2sa5pBJdSJE/bOKYMlQ3VGKGvbUa2r/9hFEmxq/M+Hm5ztAy9MF6g+WafaqeyDsQnrEY3QxNORo
	LX0mn2NClKyOWTBxwsMC/L4OhEDsusuWs7fdqJ1PbxD9wNVKuFDMuR9r+JZa1PctatBNobd0HLc
	mndP8as9Zjgh9FYj3F9HZbf8GT1U42TzLCODYRPbl1cj46Ez2mQ4DB69UwqwVII/SxwOl2JH2a4
	Lv8xv2yFAU9qJaq63mLSQFjmRHtUdk49qyBqYk9F5iUCnCoZVFq//Sm1pDZpGbJ0A8noQikyv86
	uR9qQB6mpCm6UeLiXxxgqNYiaVU26326JJm+J95kTD6Qv4lSg6NExmDztTbNmCrr3IkGtnyom9S
	yo
X-Received: by 2002:a05:620a:2a09:b0:93a:824:ac8d with SMTP id af79cd13be357-94408a7303bmr234816585a.27.1793180223759;
        Wed, 28 Oct 2026 02:37:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93a:824:ac8d with SMTP id af79cd13be357-94408a7303bmr234813885a.27.1793180223312;
        Wed, 28 Oct 2026 02:37:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d5besm38985905e9.5.2026.10.28.02.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:37:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Guohao Zhang <guohao01.zhang@horizon.auto>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: dwapb: add native hardware both-edge support
Date: Wed, 28 Oct 2026 10:37:00 +0100
Message-ID: <179318021613.11875.15753295922275285962.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yDMI6Gwz5oZ7dCEVGbW4JjGwvonmpPfF
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae1c240 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=o6x5aZxaXGoRFeGydZYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX/IHPOtYmTQLi
 thUew7DnzLH3W/wB9qaZ8jlDFSxV13dH0jUYQdgtMgHkLdMPx4TD7TcLYM6IIcl87YkGSArdrWZ
 yQCKkAxnWMZAPHMAiJsw6rsn62y1uEc=
X-Proofpoint-GUID: yDMI6Gwz5oZ7dCEVGbW4JjGwvonmpPfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX8o6BcPF64CPX
 Zf9M+Ut8L+clbuc4QYkgNMRYZVBEQHfzANpGPLSz6X+MNvleALr276eHap57PeM7qYmwkLxLQU8
 EZj2NmyJa0clRBclm8+47haOAxlmNeU2Zo7EWc9s9ok/e9Oh+9MmmCGtYTk8ADEZkeQt6C7ZoDN
 qhrG1rjdEA96OSk7v01lCs9Rhz0ZAJtPSndJqPJqZMMyg3U/btb9FMAU3UcC7C/TSowsWu9wY37
 C2bG4pPYt7jX4ffZDjKiOK5+aZ1fv2qOIIF+Gqa22FErQuxxlUibaC9oxGhJ5pj3hoFxEPia9jH
 mUB/tvhNT9cthRK+CJC+Cn74ezmJGxh0LABt5TpqHf3yKesn26YevgT9XUg9Z/XKR85je25PQ1V
 NqRB3fi6LWxS5/hB9lTKZbHYD2bmgYdGjHYlbxIz0b7ovA9zggxHcZKgD630sppmrYkU6CeYwlp
 Kfe9TlEc8C/xsBCleig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Fri, 23 Oct 2026 17:42:18 +0800, Guohao Zhang wrote:
> Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
> feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
> edges of a line in hardware.
> 
> This series adds support for it to the driver:
> 
>   patch 1 adds the device tree property "snps,native-both-edge" that marks
>           a controller whose IP instance provides the register.
>   patch 2 makes the driver use the hardware register for IRQ_TYPE_EDGE_BOTH
>           when the property is present, and keeps the existing software
>           polarity toggle otherwise.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: dwapb: add snps,native-both-edge
      https://git.kernel.org/brgl/c/29f8eefb7a41e5012ea8c7f82ebab7b101a242c8
[2/2] gpio: dwapb: support native hardware both-edge detection
      https://git.kernel.org/brgl/c/b41cfa014391694a60f9fd52f758943d52b550da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

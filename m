Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34C35AC28
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729899; cv=none; b=CxZwai5b4ZXchmRFHFJocWDtFdFBH6TVLPEvDhIwqYbUgVPrnG6flEmyAYjFxoRRDH03m7jvwvuxURT2ghK5SR+ieGbtdCIsQRZXQkn7eB6Ep5VujDD9S0iAeo2d2xiT4mzenZlhFotefGuDfLB0KfAikeK2tqvjvpoV2Ubk4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729899; c=relaxed/simple;
	bh=uMAoAmVmA75k4uja9IthJA6zpWfioazFl9+7uS90M9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=geWSFxNuTDGtBTpm8UodVd40Sv9Dg2BLMKftUc1mEHkqXKJfD23IwKS7Mv0Hp0CsT5nXfEPFDh+FR2ec8hUogz04pxXCXKP9Hm7IrfgZipD1qBgUZxUrYMWS5KAHRcviM81NUdYNHwJiZIaNtIQ3a20CnuYoWSHylQlSsQe6qPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iav+R81U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdiuM/5m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iav+R81U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdiuM/5m"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRju765300
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=; b=iav+R81UnCP1OYhZ
	mxqeVxDuvefba52ZHzCQhbYd5Ju/zboK8KLJc8JYitIzTREvm5nAb9BYHTaue8on
	bxfEXkKXSc2VGnMZ39Z+JAfw8DCj1ps50oPg0sw9hj39fV1zw4YXipdey4QZPdk/
	vKcQUTabLsb2LVWcGuT67BqyL9+yt6hmodTMPxa6To6TMnaSUmZTJ523nlHGzHSM
	5Q+ya3TIeMDpflC6iELf9psSSqrNnjEC47eQZLLHxgsxqvJSavHUZrCcOLIYjFYQ
	8cGzQf5Zlw5hd+bE7lK0+/GcBg/Y9nORrfKDcuSjRkScLxU31qQO24m24kcIpsbu
	poD/aQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2sbmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so6241899a12.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729896; x=1785334696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=DdiuM/5mOJ445FZT/megVWJcqSDBxtYaMYei/7h69m86PtHLEhoC9jRtHm77RRmxsh
         ZFtp7efeBfdOJR5L78+pIpb3puC97qtPsfQonN+VWI0VCTy9Ueoyrel6DG+JVOLKqQ9i
         Gjk+kktjJfhJFLrEeWnDhFx5exhKRfL/TTIopbkxVI7nK0/gFI65Ik9h987ik+I/JQ57
         osYT049Pmpq99VAS4eAlMWSLF30wjulxJKZq0OzFn4IVdVlc1i0s91cHiqqlHZhhV9sY
         rwScn3Ur/9FU9cPK2peKbxm3IMk724acAZoC6zRtJFonDfx0WkAW53sBU/3biIov6JKB
         mf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729896; x=1785334696;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=PJCBeBFtdbpTpBIBwZ4Bkvg9bSb5PtCMR2ub/Qa9v5uOF6BfHM+6jtSoM6QZ91oNAv
         EW9Mtk89cZcQV9FrEon5mpMT0bfZ/Bk1Dm9LSh2tlQndEgg7neDNc8IQ7aJkMMvkD3uJ
         2I6RnLQFncs2QfBdMl7QmzadMINuCmPtkD0CayD9H7VSs/iWNrh5RWoUmCFJqLeX3YJ8
         QwYrYnA4Clj7J/DO0L/nz2VxQBXuN9wod/Lf3qOzCo0NRs1nY7p+KlTkr/k6aTFQHwgf
         L9944V/m9wPTThn6sgmubD4H6DcmWQAETLr1oVC6E9u8wTUTlBOVRCOkFADktll4rS/T
         g/LA==
X-Forwarded-Encrypted: i=1; AHgh+Rqvqnuv5qyL+xDmTlmHU8v6DqN+glW0UqXKd/Ul2uKbOZskvKrEkdbNNGeOE46Q6RwRv87DjaOQEiO1@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFdd8zAWLCs2XtEx5tNLKV7lhSfKZ8qCOn7TzGcI75/QvkMAI
	aWprxndYsfjSBIXjVuZePYm5AuAxGhkXrPa+3dKofb1ON5A0c/qoHbPXJRSHBa1ep21wVmhjME4
	07shnQIiVK9k/tf9jCJwr4OJblOId706gQEeFCC2Zo6siXnwg6CyyV0djxgHcAKdf
X-Gm-Gg: AR+sD136VgOyUsGKfBrvUSQqMKGlBNbgVOi2RGtSK7CUQEVICwXebPlDb6VnqLFUSjH
	HHzjQt1FqVZzzrGdmk7F5S6+vLqTJoaTs0Sz4BiELFgVd9xCc4R6n0bRSK8BpE+f5N/MJKaNW/Q
	w6dmnpTSxKWu41IB9dvJ2+vThojz8QSvEcR2KExxCPgHU48BD3wkGXHCFoBOecSZKEBTIzAmqAD
	7Jwl0369+EoW16drMlXD024eTDLcuE7KImQCUVA3xpyMK2rLHmR4Iv4nUN61ceNVRClIhnKwTUa
	HsErbXNV58q7YFK8GaMezMJCKYisRj6f91/Oo7T0YHRnJiO3vcY41+seajonU4Ytza9blUOCFT3
	nBSVk8h/OS8Z2qmoYyA==
X-Received: by 2002:a05:6a21:9206:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c3ad62f4f1mr26477540637.24.1784729896140;
        Wed, 22 Jul 2026 07:18:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c3ad62f4f1mr26477491637.24.1784729895667;
        Wed, 22 Jul 2026 07:18:15 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm9953369eec.7.2026.07.22.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:15 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat pulse clock
Date: Wed, 22 Jul 2026 19:48:10 +0530
Message-Id: <20260722141812.596004-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-1-ae200627ad62@oss.qualcomm.com> <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX3KUPZTEafGuK
 zR1b4rp1b4pL8BfAjOzimpaL/+NofqKCHwYKckl7n38tyQzw0LfJBaXE0GIqUvK/kygHBSWYbjf
 FxxtFegZb+6k9ClpFAVSChcLqhD/TRRdfli8qF/Z3IsHCxvyaHNR5RmUgJQx64xexi46S3vhzb3
 +M6pOJ00kTfQmuMolYBox1lJyFbNDoQxEm8TPVGiS+JOC0jWUxi5pwwva+3XxnHWBQ0i4XFypIC
 e48r+RRle7GMmQOnEGBOyFYdkFDPR6wqj2JArjhrKKBE1ctcJd0R/0IMP4CqnTeWTqHGtTm+WiE
 F72J26fG++ms8idQOcokyGnyLX9YyYAMcRAFOhHTKPrqFyxVhNBCSIG5ecT9E1IAFMd2Dg+NJ0o
 FP154zCTUnokEO1vRY4HHqK2DBJXhmzTLd9gc3MtSpM1/9ma2dsVoPMkHDmboC4Fm54LTGkZxf4
 LvfNOBjyJBhY349iQwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfXyU+roZn8g8IH
 herExzBJ9KJ1MnlngFEZxXXa2QeShQtwZcLrkh2avPoGsjjNlCvbE2NvIfQuHHXMhn3MxzGq8T+
 SXVT8LSBRRWfbZbEGr0KlW/SQixP7wU=
X-Proofpoint-GUID: VN6E5bUfeHrUpGUQYkAVy6bCYj6VCPFd
X-Proofpoint-ORIG-GUID: VN6E5bUfeHrUpGUQYkAVy6bCYj6VCPFd
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60d129 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fneZuzUJNEn-4h4bZk8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:00:25AM +0200, Krzysztof Kozlowski wrote:
> I do not understand why a clock controller is part of sound. This makes
> little sense and desription does not help me.

Ack, will update in next revision.

> Drop last syntax, explain the hardware, not duplicate schema as text.

Ack, will update in next revision.

> Drop description, redundant. Why would not device MMIO address range
> cover full block?

Ack, will update in next revision.

> Drop description. Not even accurate. Consumers reference it however they
> wish and it is not any business of the provider.

Ack, will update in next revision.

> And this...  [unevaluatedProperties: false]

Ack, will update in next revision.

> Node names should be generic.

Ack, will update in next revision.

Thanks,
Sarath

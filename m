Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A1220F49
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729926; cv=none; b=EtkMxlFhJAoKJ1SumQ/UXMhnGUJvB/mnKxM1PRt4C9A3mX/fX3uPHxB0VMZgTaZ1MyLNZriV56HPzNgUsq2ticzYIzt4Mihg2sFJA0cL4d8G0+Ld3A+ksjncTcdvr3aiM1AM8/rGV33jHMcJ7bWffkqvxYZB6znAXVv99kViCn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729926; c=relaxed/simple;
	bh=uMAoAmVmA75k4uja9IthJA6zpWfioazFl9+7uS90M9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5km+9d5HsYx1xSuxR+xNcG8CfHCO5Sc8lACTx0kW6UPwyNh1cBzoY7Y4IPbf9dLAaHhtOyc6IJExci5ZwjElUB0vzzvhDvYQgY8CtT7NrQ7CXME4BsuBzzx8f1EZ7mjYLwckyhOOtIo9TKtPUGhmLHqFcCRRSJNBI+XHNUsqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or2/ckZ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGqTSOMX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or2/ckZ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGqTSOMX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWQhK1016991
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=; b=or2/ckZ+qSLsojk7
	CfhlUJVCNesJDD2GUsadEhs2qIBxRBwLoTnbwMK/GTjihjopeael0Kn/JAL7ND4H
	STy7WZmLYbyRbWJraci8TSUg5mN2ufdtlmJ5DesXqLDAATZANMdkQBA0EKJ+SF2/
	+P1piz/Jmg5O0/eNJq8BPU4S1cZQESsDaqNdewzUBeG7Sxw4cqyc/j5okmszhp4b
	FmvgttjbInbobyskP42AwY3n7zUchAXptXl1yrDriCoionA0K0dKkbtSI/MYELEU
	OrCn/6SH7ogv1dQaPwehnznjvdfdo8Vg0J4FPcQURCL6hM838kCR4AZpvXAx+4xP
	so6wBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929rpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e095fd889so18658153a91.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729923; x=1785334723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=CGqTSOMXwzvKMITHbIFmcPB8Rle1CCHMIHIW2OOYfX9zgaEEEx/zApFfacYxTZiC6l
         F4PPaNDIXppDWSxYNJWeaFjnt1b66Oa7tBT1+ASd50J01pTCjDkF6OihbpDD2yMVx5S4
         1bLZpvK7H6ShQu2Pw+A5Y+PmDm744nkctDK32rino17dJvXU4+h9srz1WPmf1PvwlA86
         zwuyDTjcpuAYJzRTRNHWdDWw8xj5Z/Sa8KnlzLJwlehTe8RpsTaTEYz+il49YibCJG/w
         VHhcDMA7oPMyVwwt2LcMri5CMAW504RAVIfwuH1NKEKxiu63I6wtUyN3hqAU/lo86zbu
         Qrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729923; x=1785334723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=m1ehyBU4j2ntg4P7CO6RqdxqXbCJGEdqLyjB7SkJYneP6C0rLRNGqOIeomzDd1mA61
         rbxXt+8oAlWXXKMR5Hjb/B2QzL7VaDK8a0+qaz9Nbfv29d0bPPQPgQ5BK/liqJAgfy/P
         IYhfjVkXDIb5sQ7/tD2gKrPkxhH+BBG/W2alkeawQx0aNKRK05EoESfHl5Gp9f44OZ03
         XFlEy8taV+J6QMfpIxfxpfNuPI8unieHzUTA41TVXsvu8PhGdQ3F2PLVPSosm8KmqJi+
         80TGIZruRO4hYGXS0WZzLfp1lXJPCdzCxG9O2m6/88OXFbJDkaAMHtdSP1Lnvh/cd1LG
         ylnQ==
X-Forwarded-Encrypted: i=1; AHgh+RokPOc02D+9MW5zoYg+dkmeNdzS7J0PwRojpSv3IFfHFyYV6ZQcaz1st7kAcSPXi0kIDNN48eHS7XMU@vger.kernel.org
X-Gm-Message-State: AOJu0YwRK+Ggd4L8BwB80F2oAhWyBIBT5B+OFA2CgDeezE4nI1ytKbpj
	Z+H9kl0LPWJRBUqzj2QRjshXzwzo5dqfhCQXEY2LPkyHJbXNkpDaShwYgY8qv1mlR/7EgsJFkA+
	sqKuxAvN3TAHkDITRe7t2Y2ya39WfiykKtvKDNLmv11hCzBwz7yanF+6NnAY3yRjB
X-Gm-Gg: AR+sD13UpNPrTaOpxTNXSEox5DUJ8fC0Zw0rsH4kif9DtW6EgkfClFoR9PFlldrmAj4
	3bXD44Xtc+R0Y6UUQu2Gn14g/l7IbhavBgorFNQCzZgjo4XN3KZs6stSfBWz+jHcxVhLN7FiCLY
	TyUlLZR3x7uNvRwgNoaF+NU7T+HuztkVbNq5ODsmAWb2gqTDUGYGOtcKoXSnhSFAzUaZMDje2Se
	hIBBwriFNjx4OqTF2GW4VphoJEt8pu+/bbYeCqY51qcYRaVzjj+/7NexYSvmc61bj9rusLvUj8s
	J3gnzQ1DUEt0Ru1dh+VyU0HWjeKT8feo+w4e29BOq1goQfWmOjMdnbb3mOlKXj/66pmg85IObsi
	tqeaVTT8onx1XUAnTOA==
X-Received: by 2002:a17:90a:ec8d:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38e4b5f2031mr23406620a91.40.1784729923537;
        Wed, 22 Jul 2026 07:18:43 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38e4b5f2031mr23406565a91.40.1784729922900;
        Wed, 22 Jul 2026 07:18:42 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm19256670eec.21.2026.07.22.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:42 -0700 (PDT)
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
Date: Wed, 22 Jul 2026 19:48:38 +0530
Message-Id: <20260722141840.596101-1-sarath.ganapathiraju@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX4qnIVF3UimjN
 4m/bKFRzXkYua3oX4wS9nH7wbAW5VpBxYe2nYzqTVfoOyARcQhAVc6jlrKvEFFRFmWfo3PvS6Z1
 2bnTA4zA2vWtdnm8kapGjTjobqGUc9M=
X-Proofpoint-ORIG-GUID: 4nWNfmiwEqk1ghl7KG6HfBeJ5DKmXFrx
X-Proofpoint-GUID: 4nWNfmiwEqk1ghl7KG6HfBeJ5DKmXFrx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfXzKduKtDPw2m6
 gIfiZK2GuI2R8D4+Rk8hd7ZOJ9v/pamCcR5AqGzUywvEWtkwdHFd9z77x8l9Lp2gEkaHIp94rKP
 uPRS5SGg8fYUq04hZUn3tn0cZnoSZ7cv8fP3tD8xEgg/FMz+zPsyEAMo3SAuNXBPTnODiyye2Ae
 bJSMUaK3ZKBwZkhk6XSjHXNAly5dq2aC/CmfnSHs5Gj7P/8NYL4QYIZTzDZAyJSIagQ/k0NhPyc
 5wpLJIjdig45lALBSZW5GnOI3yBh9P+C2YO73ydYLzYiyquoaID9f0mZsaurrZP9jlt8nEeHLmp
 rJ/SAgmEcUDpoQG7dIdKRPcDIoMj4/7y25aNFRB6Mq3kV7jb4HczNZx4WoYBicCk3HLrfJ0z2Yi
 R5Pp9XQovs5p55UG8CmgIm5F1UcNtqhxcY9/+s4qXditgx581hdxbBOtRtuNBC98dOAJBaQGP8o
 aUQ4u97m+cDf/5gnvVA==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60d144 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=fneZuzUJNEn-4h4bZk8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1011 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220140

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

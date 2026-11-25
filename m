Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608113;
	b=n59fkMz4kWPNDoG88ti8QnGp1GA4jK2gBeIyrFtgSuoHvbIdcxxJZ8eMSjsvnNn+AzMW
	 KG0walyLrXSx8SnZ0f+jkR/uYJC6t++blc4UoZydvuX+ASppL3Z0aq1qFbo/+5Q9D/+yH
	 gXJiXdnKS7Z9w/Ix9Ya4vdO4+NRnDO+hX+h1GFd4XvTq3fBv1KsY7JDPKEuXauS0/paWr
	 eVpWlO+jyPooonVnbZYZGwidHPpDtXKmXmAFTNVU4cY9CWns8FSBZX4X9XQiiHwoRQaXn
	 G82PpXzqUAWK2ekZH+8OZNeSNn6G3oQn2KA17O+hFNKRqQAMq2GKA/69QSz/LrtfkkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JH0+oBZQMbhzUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=;
	b=KyH5XyO/5uD58RUt3vQGB4EykRqqW9SHOI8pYMQ2wQO1wzg0+P7DFo15ZUp6axjpqAwo
	 cCpWbpHJ5AcWSQfgkY1zkfKo+5KM6GKQn1x4mYtbmF2dVoGQtLvQBxLU25N57haV2ZPwD
	 XBT33hlW6qeXvby1jfVM3zcMNNqnCKHBkDeqAr1VD/u+jDqOKq5AkgyHlhpenUbHZJBXf
	 WpK6p5RuXksbXtxOdLr2oLH2wGZ8Sz1yUlTRN+DgpBk6dvQ1VdWdAvxG1tFC/oQfgsxr7
	 IRYqEfdK7UVI1VOU8e6imhOmrNq6WfXvsFoLy41x5zc26KeDlB179s8b0xnw5VLKULg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FcCKHBfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkHEKFaG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB92606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB92606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FcCKHBfO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkHEKFaG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9m8v14130785
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JH0+oBZQMbh
	zUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=; b=FcCKHBfO6oIC01Z1971CkqMK19f
	b6IwpdYxK7hts14LM5Tu5dXXC2NVJ51/nQGpRwbIppx92GgLV70t/KNHAPxBxkqz
	XvKLto4njmstadffJDtTosoHjPRaQpaXtNBebMb2u7680gPo0KlHtKwbd+oEYR23
	+kKxrqMxChitoG9lbTRbKpu5ws/pij2vd/cGzcwWWFGFYgamxCsYtugjSmXfzW8L
	9AvlnbkZumDPo+m31KsO5KzUAqR9F6KShCZf+R769WdClM1jIAmBXECEWncGRJ8d
	KFJaqRIoUXn2fbXkKKEIdgJCVojR4ScF+1dyaVP/RyY7JUsRkyw7kAiSDdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrqwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:01:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so45407885ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608111; x=1796212911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JH0+oBZQMbhzUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=;
        b=bkHEKFaG0ykIpUvTORCKyOWsGdXaMljYg8yfuvaOjiL4hRIr0mp+RN934I+2cSBwUC
         PDM404kvjLEw4kEsCH9kFLNEotlwexNVSl5zuSDK1HCaJnq3eYrGJs0XpiYtaJGhaPuT
         BB4Q/ed5dUqkvdeDShXBlpKAISbOXOVRND+w+xKuRvMOR6AogPir3BhnUpsrhceZENHT
         BO2oE3wJ+Wj1R27auWQnvHHL5xYMNBCeEif42/B4WVSiM8nCw9sq1BhQ2bTRz5nv+pv1
         OcFamE2GU4H6ZgvzYcVPLB+oQSzeztqeJtH/wwX5NIAMAly4W7XpYQf5y1oFnuiyb5vg
         Qn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608111; x=1796212911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JH0+oBZQMbhzUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=;
        b=g4L+9o+ULYLbb4h5BMYdA/yelIBSXxRHV9/l6LBFb8fIu3wiNittGOY8FdNTmDc++b
         AL4d42bnVeEtPoDCgKtl96qXwCh3qsVCXX5dMGy4jorvjpGDExvkdim0aHt7hYuqr1fa
         WTW2NvkfuyzqsuiJm7KJOD6Ajuj6bW5ZFg+UOe5dJcclaaT7aOT7fYTMBCaBMVbhBXfy
         OxIrUgn/jVtkv/wnT8fFTlWZRoGWAiUqFhVunBSxDDSwU9n8jko2SSUxweCPM5KZ7SEM
         6aS8dlY+fS5Rey1zDkwAqjhfYnzZYAdhmkvBB5iwH+UXCrz9K6HWbVMEzNmrSIbNRSIW
         faKw==
X-Forwarded-Encrypted: i=1; AL+hErFHtyutJ2zVSUEaMpXOkryimE5XmFwmVhj8vx4nthBKjQdPajsHsAN1FxJmIhqNq17DX7JTuXaSz1vP@vger.kernel.org
X-Gm-Message-State: APuU4Z+FfclKNwdHPzNg1pi+GyzKwKwnriiAVVY1Y0s/0LnhdV1MMVys
	7AA0AlzZG+rFrFqZtCai9UhJvAOppAW3H0Wd3A3jbi8kdJq1iatUcFCtfyAf+H3fyT5MVhwNvik
	+upLlc3yiTNohoR3D+4UU9JP26AUHdvBiKpV0RmqHblfU/JxAlV3UlPTarLzNyjW8
X-Gm-Gg: AZFdTZeyHlayeX7CFJFs0m+jNxWQ16jtT4HW5nV9n0hyx7NzK1sjNWgcQw426SNwZin
	NvwIZIVoFKsJIkLYP7p0Q5mgeJcGaYuFuVdma5QT8ynxuRVJwXZeKg9L5SD83F7ParPYGjfpf6G
	R7KoP4MPemkRb8JwBty6zloNAIT7rRJ50s0yQvk3AAbf8Idlrw+DvQJrhQhcGcM6IIU0OB03/Ll
	Sk4a+ktKjg7HZq86ostX0zEljBSkvEyOWhosX/MW/VrVVe8hWOURp2kfOnGDzJDks4nhQr+wjx4
	P5HgeY7jnSUEPh1gZR5b3A28ZB2thRPSrfvT928W0jErTo+2ArB8E821uh/iIA52lEvh6ozn491
	EpAAeL086TBYIyZgxU57bbbJUxr92ek6l2r6vbRjz0bg0Y0BdZErrTzmojdrxaD4GrAITy8eAba
	Qwh5hPnPh4ChRj/6PwpIl8uxcvkUhWovCkA1w6caMHexnViikT1yzZhm8=
X-Received: by 2002:a17:903:4586:b0:2ef:de2a:3bae with SMTP id d9443c01a7336-2f03f170047mr176859895ad.30.1795608111050;
        Wed, 25 Nov 2026 04:01:51 -0800 (PST)
X-Received: by 2002:a17:903:4586:b0:2ef:de2a:3bae with SMTP id d9443c01a7336-2f03f170047mr176859435ad.30.1795608110199;
        Wed, 25 Nov 2026 04:01:50 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a8asm84700455ad.24.2026.11.25.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:01:49 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: dt-bindings: Add compatible for Seca UFS Host Controller
Date: Wed, 25 Nov 2026 17:31:41 +0530
Message-ID: <20261125120141.348306-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7401e343-71f9-476c-9143-26d068c28aa7@kernel.org>
References: <61136dcb5cde2c0cfe1b8f3a488e9edcf36043cf.1795517687.git.yadu.mg@oss.qualcomm.com> <7401e343-71f9-476c-9143-26d068c28aa7@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06ce30 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=zTK7sikzi49oAEfBURIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7XjloqHvJ-NfLwzO5_o9YBs-NV88dGx6
X-Proofpoint-ORIG-GUID: 7XjloqHvJ-NfLwzO5_o9YBs-NV88dGx6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX3RUuLa8j857K
 c1Z5W2TUt8kkfs0mf+0POGvJohj0hTFVi1y/J2PsWtLMBiQRHv0HvhNhQLvn5x7CM6+Yggz2mlQ
 Hh5aIVFuOV7TEYydbo1FImzneNHS/KE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX5pWUO7Al2pwg
 DtPy4Ex9zeKbXJKNG1zgQPZJajR2xES5SGaSlOGwYkfr7HQ4ejqr1z1+jLiwKR9DqoA94Np4Bx+
 83i4zReaNfLTr6V3BRkjX1otygXqhr/9l3X1Zoik3clEQyaMFTu4om87T/Eo//JgjtV1xwHMoWi
 zceA3vzIXxK49sKxQgl2eOYHTyALkrN4nK2fvPTRsSInCBMqhb3UAtiMP10MRNST0myiKEHD9L2
 KkDG9ZBSj36jqFbH2o77B1YM1ZOlAwSPcnnworqT/X5gh9fkb4RArkiOlihqoMtsU19/KPKFWCC
 cO5MIELHGZPX+t3PXS+N2CZM8uoUYlKkYhkSm0+8P4eyLo6RtQnDBeXMv3zsG7iOPiGRFpea2/U
 Fosn9j6zOicmaX+yKcRs3IYzCF8FELr3OGP/j2u2XoKXeVP9wx0hSC3OutiFwqe7FQzMkN7VUlM
 DKcNRdGT9AgMOX27DuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 24/11/2026 16:49, Krzysztof Kozlowski wrote:
>> +      - items:
>> +          - const: qcom,secaau-ufshc
>> +          - const: qcom,sa8255p-ufshc
>
> And Claude did not tell you how this is organized? That's one enum.

Ack. It was missed. v2 uses a single enum with the SA8797P entry, and
will recheck the other bindings in the series for the same pattern
before resending.

Yadu

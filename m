Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772204;
	b=IJLC75RmjitaN7QK3A6jWeNXxzHbka10G4VSikB4ilC6kGXGQ1zL54fK9GgI8HZ96VB9
	 EqJybddcBq2QNMBWr3npYZAj6uVpT62yln8NqnZ1YimHIRP2SibMtmGSL9ifvJLvnNJeC
	 y3xF7szlm5Pzy0jPypKbOlbAIe8UCznSiE+wujWUbCUrz0qa5QAo1EiQKF7k1Gl3qEGwk
	 VehcaKYouk3FfHs/QhcXjzmAyehIKgg3vvdjf+KT34LtWWrhLYK6CfnHbDkHljWrqpDXH
	 srxz3a9iDAch/53m/H0reENDpu2RvLgnRIAXMvZOP+JY9jnjwt1QPKmdkS/ck4Do9iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
	b=w5Rfk7acrLxTXR0hTben+cpPFjcHqZ3MypuiFXTlt2pjmFCZqGSXHtJqOoLfxCAZ8Twa
	 1ockijCW5ExU0rFbwFWf0FDOocoKaC96bTLhqSTvRCbegruGw8LhWhCttSMsnLvX3ingU
	 FffEjHPs6hPgdJkwZsENwKLURYEOM7clUnO/0f4MoLNqb92v7pmwtb08dZ9fGhbx85tXt
	 8Z8absZ9bOh95QNBrtT8dw2SzI5MUa5v2gltt+I4y8Xhp0Fu0XpgNQFNZxEsiRzhlH61l
	 ee3egNs6o+xYtCseocxAH66ZTpZ2uFxSf6e5vaz+hE5B9FOf+8lwK8Ls7V007abGrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01616606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01616606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GR0J2188062
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xCYv2w/5Bys
	KW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=; b=eepVaFkOnyM83UTWIHlNgbUxcWG
	BajkL0lCb3KCqRsnLolSsnEx4/6q9o00bp/rAh5ifI/UMrVAw80iSJBQNKSF+Bb4
	zS4zqySl/tXHYsJ8FE1wVkhnaVHV0Q0J+Gp64blhnBaFQlEaCvbETJkdCQYqGAsy
	zGTXhavPSvQfRUUU2AYkHSEkTZWu/uIH5fconA+ZpXJKMLG364732+hSeSa7dq6p
	nZy1Dmd+ruEHXX4pYN30mBNS6DVnElgE9MJ37ZN3Vbt/uVErHEALQuKhmjJS1poc
	eZMJHc48I9PW7CbxHLLHiPJ4a1c/fKI1ozrCQc8oGQLc/cGH/lkGFgmDHtA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh8qr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:36:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so5921201b3a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772195; x=1796376995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=jjk4lqsmdjW0BvlwFEoUMjJR9sikOhsmhuEkKgabTL/3OK2ZUeoAaWycmYK3qgEXVQ
         sAK6wT3YE0LPXwI54x/fdPHgTLnzeQv3oStnsqYT0Qm04WsBy5PYuQDM50yXfy+RyhyA
         7OVlCtm9jolmgha5EGVZspUdjnWgmN2Av65PK1/B2e09o2Kw5GtXJI+0goFeBqMFR3wo
         39jV8+YYAR+WGXddwc77JHNsWMJQB5LCbMZetTSO52cfCTVUXBjAc0xRyCwtqYjdZOhb
         IML8QvWlWzoXf1SXVVrWHp+RZ7UIUsgSJJbpzK/O4TsOmprIH102GSHSiUOhTKGseQdu
         nmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772195; x=1796376995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=NMJdVs601Vf4QhjTGG6Rbw0zUKyI62robnMgxhonx4MA+yJ7yzXqBtu5kBW+b/VaTw
         X5HsvvBeITDt5DDegfsG24xg2aPUlDJnSN5nKkNmsuPIFXaPtt7HVtfqK/dELsHAN9/O
         Z94MuxyQGTjA9nrn9jJa3lg/2KPKYGOVR5/mI2bzFybcoWhXc/p2N2XynKli9hTD+byD
         WHjta1xfUGWk5MYxd/tQB+VvNKZp19Mibe4I+iEtCD2NDZHnUupEailbqcTNfO6zHaS7
         IurVQQxj7Q0Nyeb4pcpB1XxrZsTwxx20wNzSfhexGvt448wdV459Vq6DWs/vncZj1Ddd
         Otpw==
X-Forwarded-Encrypted: i=1; AL+hErGhvq/T6qXa1b0goXGBlo1J29jNtA81l2nqp7UmpkEoxzMOTLgTlJvEb7x4GwYj7maiRWjfGnvBK1vF@vger.kernel.org
X-Gm-Message-State: APuU4Z9uKfVcbLC5JuTXQRJ5gVR9sBmojb7f1qPq63gcYZcuxdlfwT5m
	pbrli0a+AkjflpjRTXxl11EqUExU65quzBWrW1O37aOAs3Ax04QJsr3Bxwjq5BrjgwcNciXeB+x
	7E76u9bePJOcNI3onk4D2xgsCK1t+4MkCx0Y6nkYopo3KUp6ArsJIZS/j+lEtbwEo
X-Gm-Gg: AZFdTZfkXYl/JYacTLOznsFBPmaCzIRcgsMkKZ7Ya58qRe7Y8lKGW6NBezPN1iGsugh
	XWRqTs5cOyIvftXdhAcS7UhLAS+c+HCvBjHZprhhu3K21mbXiJelvj7MaBZCA5WWO3ciIertr49
	sRHtRx2TlmUThpTZaJGgp+M4yKO4vHrFSKQp8wdzHIs/pPhAFCmW/7FxCkzu/ja1YOSRwQOYf3q
	wiGxcFOm0oFltAo80Le2NwFfMATDsk94mrmOeBSrCB7ptsShc6YRIYnvHY4OS/q9ddKzBHGTOcv
	EtQfECUReeKVHtF2B+9RpHIeyOvzi7umco7GL7BKL7tfKyGTituiQPz7P19oPmZBmER79iw0QCC
	mt0UVXACLQgxfCSxQJRemjFxI6SKuzf8D2pvB+uA2vrPMqs+RIeC3Sh6fsZx/+G7uGQ9pQhD0SD
	TLGpld2VCgfFnCewDeHCw/yHcOc/wB5e6qHTZdAMTSDkSLsUN0kUo0EZY=
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23327022b3a.38.1795772195401;
        Fri, 27 Nov 2026 01:36:35 -0800 (PST)
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23326998b3a.38.1795772194965;
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm12384340b3a.53.2026.11.27.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Fri, 27 Nov 2026 15:06:27 +0530
Message-ID: <20261127093627.3292152-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com> <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX73DGVnhknCVW
 0Tn5wJF3AKSNuMQct+TYKBVkJBNm+Sv668TVhp5VY17UOgjcVJbVg1oiEAmhAepbul0TVsKrAsN
 KCJN2c9X/RbgAdio9FJnLfqRBiyuv6w=
X-Proofpoint-GUID: 0my3Az_gI-3bLjK4kPqDU9yJQWEkjMPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX+KvGMlsR+Z33
 juQUJQL/EPXV8srdFXwXAoGpPPE4qrTdLC8H6SRiUbDsFsgjZXnBnhCiFKNVO4SARCB5BXbAEWN
 aw4Fd5PduDZ43RKTLJWTmw807UM6dQp3syF4ZfUZppnH/WWLHKJvFLNoYU7KpyD6q5fMFXGyLbr
 sfOYVWeWA0/WXlmrfOb5wp0i/ERlNrkNhsRUzSS64/r/u2o2pBNgOQfsmTBwuUs0WbZHzqIUqrQ
 jIU7yqNJSGJwlaHQUEkuTujHH1SVSRcHcFJPhD/Bh/W1XCDNcLHIk1Ur7Ox8mGRwrLmYXwnJE7Z
 CcdKQ7zoARKthLR/DjZ8OIYmoULQgUtpRa8SXeFzXe3g8GAqzOba065Pks7L1btaNMEVWnSs4//
 8hwa7fIiFwsHPuOsiOtJKJVotAV5wpmCmnBMuP8mk/ky3SrwH4ehSLspUHpl7DB9me55vHLg4Mu
 Wm8Ms+UV3wugsyNFnlw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b094f28 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RgwWSSqwODVOsrknLmAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 0my3Az_gI-3bLjK4kPqDU9yJQWEkjMPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270038

On Tue, Nov 24, 2026 at 05:26:14PM +0530, Mukesh Ojha wrote:
> On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> > Add the TLMM pin controller binding and driver for the Qualcomm Seca
> > automotive SoC.
>
> Where is the introduction of Seca ? what is  Seca..?

Seca is a Qualcomm automotive SoC. Its base device tree and the Seca
Ride reference board were posted separately:

https://lore.kernel.org/r/cover.1795517711.git.yadu.mg@oss.qualcomm.com

v2 will add a short introduction of the SoC to this cover letter and
link the DTS series, so the pinctrl series can be read on its own.

Yadu

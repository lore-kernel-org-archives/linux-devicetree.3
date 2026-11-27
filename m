Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772531;
	b=YgIDuuQqb59h9wS5j9k+HMpnnViG6N90CW+9J7SIjC6FfvJaG5V6scF1jQFrxLN/rLec
	 X3NHDVSbXdCN3LzAqR5QJ30VQwcxI1Qgj2EGMnn2XbAUE2lhgOOGqVVNXM/Y6H3CUNfv0
	 KPtLy4Ey+SNOgWdCsbRyPC3y/TGpWOvslYTC6C8vjHZgK4A8IvGiHQhrVhj+Je6TVap4p
	 jyu6WWADsthHhlDmKjuUO3cRGDUOk5U6LoZyWn68RPz6+YGYfpEM3WavEIxG9XaxPJ+5i
	 nz9nnsKLf9MGZGIe7INfBxECxm1m7qQi6KE1G3zVPScS5eZG+CW8d9QZ4nzWw4Ny+JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
	b=yLwESJUJW/oK1otj3zmFZZutnM+DOaFn4u4E7WneFsyZoLde53o8X4EGZENwRCW1MziO
	 ZkBoyXsGDEc3tMmPd92ISDr4ZF6INL+VJG3ujJxfEt2Pn5Hes7/mD1mGURo7f3AyhCgnu
	 a10K3KNvTAoiwyIkzIGf3wT7S/uNcqQVEVEEcoHt/eoYxnjcvVAe4n6r9B2iGMC167SyR
	 jRxRr501A6bubEM8BxmFVTfFyp8NMdyX/2aLgBX1dOoPxUZw3sjejtNxdExqyUpEG2Hnj
	 Bd1XF3Man5qbk0IzGiceh9zfc0m8jFchp8i/cRpg5KK2NyQ+C0nPTAOC6xyHsR+b5jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T9qmY/OR";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQx6NqJf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A49606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A49606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9qmY/OR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQx6NqJf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gice1475496
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ao7/wXB+3/0
	9MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=; b=T9qmY/ORaQ/eec7EbCnXPgZufqH
	0tetghcIMyXod3hHqUkKDFyuhsogvweknWot8pj4G5a33fGZpLv7qedF78AJuPKU
	qWVU/Za5PDKcN7Gh2mLBa95GVx2ZNbyMC0DVGd1XTLD+PD9Y0WMYEsiplbhYfhRr
	7av1iqVe0OfH5Ay4B5XBotONZ09gnIYY2CTbHGNz/+aNYbDFf52in773lxMsd6vO
	osNLrShVyE5Nsibk+aFzmMtJ0dwAVhYYYRxhyWRMug+FZIKFdQWqZ3mOI7C9NSzE
	BDtd3BzsptVLxkIvh2N1OZk+qVJUCQvQ4AhI0+RnAi0XEtMu1pRzprVKb7Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htc2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:42:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so2617114a12.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772529; x=1796377329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
        b=XQx6NqJfPy90ngm8wqvnAPHvLgMRst8/gnf/Jgi0SlveraujpEcHpJRjJadHCgw5NC
         hAdAKYurzyb3NTEOkeX2rZIHuOIsDERRLBr0+CBDdkmUeVIBYpfKKHLuOWay/t92MD6U
         487aw/TM0H4gnFrnrhYwKrie6CO/qWqTy6tztgMT3CtV5EanqlFKx0tPu055RlkCJnHh
         xkBE2vwzSOdCFHlW1WO7EMVdSsu/C4+Ug6DtFXyKia+46uYqyT9lNGmuymbCNzD61UNx
         SfVwojroC3B/cfsGh6UNmIbbzKqphAg0d9QaSDpuds3JUrXwYnpZIpu2FH2tXzuHmMz4
         IWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772529; x=1796377329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
        b=yd4aLiibemQNw7SZBnYjTWU5N4zCTuj0UfctPmnlGf5T8F1ooSuKNp+BYgGsXYEE/B
         WXF7PZRHret1T1wJD7Uih6igv88qXgPuQbITgNLBQpZE/cxdlX1aiFUL3leLOUXdS1yb
         0Pb7Myi+VefNPqmBhJR+aMp1Qu0C1317Os6gmQ7krxjMxF05T2IV1e8mT92yL+wJ0VGq
         I38Plc79X8/uPmb651PcriDS3uC3F5+ER/UIbQ5fDi2J20aYsjfx9ES2heKZmt8Rs4S7
         2yMfF9xyF9aqWm9fu1ySkf9YNeN1eAJqzNeLuKgn3sTsaBMjoOXJLTasa4NKu/Xhtlh6
         EsIA==
X-Forwarded-Encrypted: i=1; AL+hErGVULQ74kmwxs5b6XpKkzpzcyAX+TV0902iG4KKRvy21ncnVceHZTTM2TaoIG04c+NBNcHbG5FVhJAd@vger.kernel.org
X-Gm-Message-State: APuU4Z+8HGXY1h1y3wl/o2EK/bjakQxtnqfXWJViMIKJOhnE6GP/U5Eh
	ugA5U7ArTmKBdxagWRA+uPGsWLSyAlnjFyUwyEHYq5gQddWrU06tUASn33NHMqEIloqTPD6crHo
	jMckRJQPaoy0JkbPX848xJKJmC1GRs0s0Z7ohx40CvuRlL2LC2aUa5c512fZ/XcLG
X-Gm-Gg: AZFdTZeD/uQtocB6/ubdD38LW+wnzRWMf4YswmXoEZmzWkd3wElXM3bv+SnISZz0DO8
	eliAMhshgkEmljqF66yTo4h3bMImcAR8kzTJvPx5rXDvZ2ZNHYjR7aQuf9ok7OMWqpEwEDl6hDe
	QXpVLLHkAxqxt5phG88sSVMIS4g1cFOt/DG36rGkk9fMV1huvRp0Q+ll/5pJm+gaeCiL4Sadnqz
	9KKLh6H91ChV7qL+qkw8hzZ2wmdxdlDL8IrXX6VPxSN/qd2mEEFY1HHERxh8jiWFP0PUpPKRGGN
	6KFb/BCn1F1wsgn38hvY2oLHBnz3bymentpqtEi6WV4ULGgNkjrIz0BYAZnZ4dyJv1xAfQkr24r
	MOh9Brh+oiGURs8uB18YldtuBpiyJqbv9xFBy7dgX9bFP+BGlBndTQV8ofRRNYPel1WpvqMYdIQ
	b7etkiSOSpdMO7SkKlSADb+Ee7UEBcLGIG7H8HWEF8Sjwv6IrYGz2l4j0=
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr24941291a91.67.1795772529230;
        Fri, 27 Nov 2026 01:42:09 -0800 (PST)
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr24941266a91.67.1795772528814;
        Fri, 27 Nov 2026 01:42:08 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm16474788a91.1.2026.11.27.01.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:42:08 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
Date: Fri, 27 Nov 2026 15:12:01 +0530
Message-ID: <20261127094201.3296395-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> <d92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28.1795517711.git.yadu.mg@oss.qualcomm.com> <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX5BEacyvG7m4v
 IkGpnF+OxuZTUwgS2MMPooOkVohkHYPVk0MTACbpDbwP05B1MCPKexSkibN99fPTGB8zc1Vd5wc
 dRT+cMmPYoy+tN6DmElG3O4Ehmj4D+Y=
X-Proofpoint-GUID: nPSRsmq3tTvoWLBLYzxmtVDs-yYpB0kk
X-Proofpoint-ORIG-GUID: nPSRsmq3tTvoWLBLYzxmtVDs-yYpB0kk
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b095071 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=c_Yg2YlBmAq_miF6-psA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXzb78p/KEKhxC
 AvXmcEb3L9kMkVtavnjoZfvTRF9Ui1hPzYgIysFPoqm0trpkC251H1nte4Er3+Szyi+9RswTxde
 mrZn5BUbWCrc5Eonyp5dQVJ3JZ8OsrFvGRl3Qv6pmLGz29WCCDnRAupEn+Eg5XIsHStC+rW5b8l
 i/7gJrp+wqpCY2jVP/O5FosEI14rc451WlWP4b81GhxyOP/pv/g6QFMzRhK9/nYaioKir9jBqm6
 /ecX1S7ukkFQCAUkvW9AfqSwevexwN9Z/ceAOB7aAdyUrzgz9JuPS31badmvEwgq7QmZBwkEBR5
 3ebPERAfRGDjrPuWJD4W3xdfAmllI8E5Rvsbos3q25tO1pCrkGCpMyDhwnQOqSVIJQYI13F3MOK
 yX9XIiZfCW4cp+C6eZwOrxuMVqBrVOfsak2ZbBfGdgCZvtKNpM7sKLPpjJWeuuy6d8Ptg9KCJUV
 QP0SiZbHzJla2yLPCBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On Tue, Nov 24, 2026 at 04:18:04PM +0000, Tyler Baker wrote:
> > +                arm,psci-suspend-param = <0x0200c353>;
>
> On Seca Ride SX with stock firmware (UEFI 2.5.5-00052) this resets
> the board ~2 s into boot, on the first few requests for the state.
> 0x02000153 works; the firmware rejects the other variants.
> The downstream Android kernel boots with cpuidle.off=1, so it never
> hits this.
>
> Is 0x0200c353 supported for the OS here? If not, use 0x02000153.

No, 0x0200c353 is not supported for the OS here. As you point out, the
downstream kernel runs with cpuidle disabled, so this state was never
exercised there. This will be fixed in v2 by using 0x02000153.

Yadu

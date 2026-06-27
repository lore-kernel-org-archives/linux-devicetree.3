Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDC731F99D
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782587178; cv=none; b=fxI1e5vz1YVBDMLFIfhLG0s6S+zXOnSndTuUMHLB0KjBy/Ugg3Wid5lWLtHl3rIqFx7ZunM2jYpBt26CBdqxD9+tiDSn1SqEjXrJn3qocS3sePJ1Dca+cP7bvkEgJ6Ol5ES5o7WvsXt87dbZYd6fdZR6eWqX+rVgFAEx1nVhrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782587178; c=relaxed/simple;
	bh=4PgbwLX6mugMjAQPbgIzEAAkT3+7KhaHsv6HM+ZC3j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxEsAUeu2ZP6RE5UNz9FfUDRqyOmCCWHW/4fck6rScFKi0uI65tsDDHDUk3hJfnB84/Ns7Bcporr7lUaVYMPWpl9DuwZH70YA0CFY8ZIgLBF63kXQrHE8cc6yFMvjzxgNpxXQ2ys85GdyUeTWYRwQX3h1B+WmHRCjTBDQgN7NIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEUq8Rgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2qsQ/tW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEUq8Rgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2qsQ/tW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHnapJ1737300
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 19:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RB/JKx8fuoL
	3t1/obHqE2khAtYl7FDhEafemdH5UKzc=; b=jEUq8Rgh2C8El1ipzg+85Rd58DK
	wQAT7g1XIBpPSsNUycWBB8L8OAYNJAJBlTL5CSlr0I7RVLJhDquhpghSK0GVmqlx
	EjZnF5SEydsVzr8Z6Hv2ijo7LSCV0s0WMHmybLaMRM0Jrc15Gd8xwBT+j5DN7acC
	OxG0Tt3tArzildLayWQi/owDLKhesPPQx6CH8dM0bkTyYgybw1dAe9DQz6SjSHkD
	KbyK9+YvY58J8gltv0HExBu17rPp7/vGkaNpT8suXz/P8dV1OV/E1CVcIdK0hhA/
	qVfvEfb/m5nuCh0bEIQTWXNRNiHFwWv5p8fAC560bZXPG+o7ABO4Wjh+L8g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tush6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 19:06:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-808a9e51918so35904107b3.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782587176; x=1783191976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB/JKx8fuoL3t1/obHqE2khAtYl7FDhEafemdH5UKzc=;
        b=M2qsQ/tWEGhYOKe5OSKNn9bTeKGE41W+fauLRqglmd7AkqR1zQm0ueDLYLk67NBvDk
         aRAl2xPF6bGm6bdHoEZ5ddXFGUgFo1zj+6NZ2n990lkN5NvZwJ9w7QbRM3UOIu2AI+7+
         uEyUyqi8WSkbAZFyKhk3pvDd77ALaGzXbt9N5yXiX6ci1vEwJzqUM6C10wZ3Fs0H8p2B
         LryxUzBd7UVCr3fd2qdmlTwK87d5uwS9rELeBT5gCga844G3QuN8bvnN2ZtKAzxTIZ5p
         Hg2/odagoQDxfj7g3E8qtMSSvO0WMg//zF4YZL9efc3fdkPBOsB2MwXkJE0f3ehxohyF
         T2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782587176; x=1783191976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RB/JKx8fuoL3t1/obHqE2khAtYl7FDhEafemdH5UKzc=;
        b=H/+Fv6l3zZVV5qBXm+1RsViKH0gq5Ne2xhZV97lfa/tkcuSjSbGJLwV9i5+sB1zJIG
         CdLaAYL41ZmodM+BFzzVwRSvoBCrN6YY6GteUuxW4wotUFEyzrkntm61EQTqLAgqLEGo
         P74/vZtaM5zusUPMmL3drFHBNjITYmPCelzegbHOJKXylbBsfmQ91INwK0KYLohKjEpY
         xQNtLzHV99iBIbS+OcX4X9Gq3+LFmx4QYARY2zdJy6rkL1rqCaB2oYjS+uPopzx8WqLW
         N54xe5ltnMWVgpWH3WnhcF1G5MtD0vsWBy6dTTzH7ESYi0wPU9n1RNyby/cIxZed3Vn0
         N0nQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr32RIcTCItt7PJv0niXvz5q0jxgopByznc7k7Avoyo3IQPOy+07PoinrDgMctvD6RnyOoPKG2m+LLW@vger.kernel.org
X-Gm-Message-State: AOJu0YwHGTdhMzMtqBe+6WrI6J6lzEx2lW3WMbLBSFE0P35P9Grq3jwA
	Ek5f+r1PDBr/slCg8I2ZFb3qZKgc7tAfYXkK/FPnhy933IKxdbjDjguFW1iyOvtGZu3lVsK+CGg
	OgOiO8VQOW404hzeV45j1K3tv+XWLMShdF6m8+DdfkCExTLTN4A3i/uDMeP8eHTge
X-Gm-Gg: AfdE7cnM5UEdksFk/3HETpJVjbtU6a1dkrkgztgYL/bKJdzP/WymsNsFWDgJYeEnkX8
	/0xd+Mn0mYGPmMAS9Hdgn4MNHQyAtMwn4p6ICWbXYhOJ2qndJDVijNI31updxM1Ecw2iF+jn6C9
	RHC6hDw3UH+yNXXUOIKC6QSkEt76R/nKopP5sBBEn1IwvB5kgyT5fsweukLXn2ZJ3+ka8md0xnG
	8omNAVRbmpao2Scvv0T5PXYesPq4eU/8BABcIWrp7xrjiAlGQEv/6fLwT8jGJrgvm5NzsFlz+NI
	PeL1tZe1pThYeCdwCMtxXr25nSuWyM1JUKL75vTJcWZbwMtRx1XU78iGvWM4XHof72C2Riq8FxU
	p0U7ICqennYDsvkBH8dqCBFOEdrAnPYUhfArfqI5XQxGHmjpjbJ2KrdjQoHD3Zhy/SmJkTa8H83
	o66crqf/Th1lfT2/cb09HDoAU/hduRjA==
X-Received: by 2002:a05:690c:67ca:b0:80b:9114:3b85 with SMTP id 00721157ae682-80b91144497mr79886387b3.0.1782587175543;
        Sat, 27 Jun 2026 12:06:15 -0700 (PDT)
X-Received: by 2002:a05:690c:67ca:b0:80b:9114:3b85 with SMTP id 00721157ae682-80b91144497mr79886077b3.0.1782587175039;
        Sat, 27 Jun 2026 12:06:15 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-806f10837bfsm59866927b3.45.2026.06.27.12.06.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 12:06:14 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sat, 27 Jun 2026 12:06:12 -0700
Message-ID: <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfX9uFH+KsARBr9
 16dAl/slidoPgb6AFBc4+PafmjixjbXeDBQDKRDhAl04qaMHFF6bRXqFCnSPDEtb1Tf7UZvgWL+
 FUyNUcs/L4HWsWii32G3FQkeviakw8Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfX9cFzdOEPwwrE
 5tBX32/TrTRs6HgJt2YH0GUYJZn5maeuRJHB7srAfSTnwcETtOcT0wU8gBbRTm1GIOmOaH0Q+tI
 pcZmFlrdLhzgbm/wKDIbO9ssy8lVJ1eLP2FVk4WNa7sGWKNQsO9OPRw4XQsB/bkXZ/XXB/kItr+
 6ltp19+aOMQbDXYkjYK4HW29ZM2qgvUxRvg3Jc0vrrkZtcleZG/DIsxNnULRQ69pSOPSguLuSfU
 Vg/rcsoMPPgPRdI7f41BzriD7oU2mAil4Zxu8h+ccGpemEhZNIe+8YyXf3tDOIMbOUITnTHbFdQ
 JPyYRAaf7UaAs3xye3YVY0aFHwoNzHsPtGN5v66RY3GHO6b6Df2YI/Dbu0QKX5vuXkw7upzlKa0
 7y5TepAOQWgGw9Sest4DNxWbnj+HNycFAzQfYk4HDXiIzxv8I+SnyVAF/rkzdexXsN5S9WsT5RJ
 oJlM4KfxHgvz1xoIH+w==
X-Proofpoint-GUID: Cbd6faVxO1JAScJA32m8zDZPlhJ3XA_p
X-Proofpoint-ORIG-GUID: Cbd6faVxO1JAScJA32m8zDZPlhJ3XA_p
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a401f28 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ClHHCGylXNJOVoNdELgA:9
 a=O8hF6Hzn-FEA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270167

On Fri, 26 Jun 2026 13:27:42 +0200, Konrad Dybcio wrote:
> If you remove these two nodes, the QMPPHY-as-DP-only should still
> function (it's the USB3 block that depends on the QMPPHY, not the
> other way around)

Apologies for the duplicate. My earlier copy of this reply went out with a
misconfigured sender identity from a local mail setup issue. Resending it
cleanly.

I boot-tested this. With &usb_2 and &usb_2_hsphy removed, dmesg still
shows the af64000 DP controller binding and /sys/class/drm shows the
HDMI-A-1 connector as connected, but nothing is displayed on the attached
monitor. With both nodes present, the monitor shows an image.

So removing them stops HDMI from working on this board.
The comment in v3 will be updated to read:

	/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 enabled. */

Thanks,
Jason

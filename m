Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFBF17DE36
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886559; cv=none; b=Td48yXHpioxSMORPRnWkQAHWOtWDh3GJnmsDdxR0hWacELM7oLGXImsqtZM7kw8OWhB9t3SwaNoCfrUbrSfiCox1xGgEFgKCeLBea5hInhmqTUa/G5qX8H0Tnthx0IoFM1x+Y4F9PMGriX7xEG3Sw4DLcdy0FqUcohp+F7wKWrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886559; c=relaxed/simple;
	bh=ScMOIs+1J/8WlSYk8WiXPB/EF7Oiw8VFJqKqmbj6Fh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i/D/tzppChRvKPTXDiAZ7Zpxa1EBKTme3a1AtzKjXx2nPgUbUoIbyaW11uTp8joRYk34x9XBqMzyAUFo2UYBKvEvujgUF6O0FCVbv4ibpCqGVdI2/78ltzYbw0HEpGp3z2flYcK0yoJWUopdfQ3df7Khtf5KlIA0dOjVhRmyQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEkReE3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOzvlxWD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEkReE3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOzvlxWD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3kLG2012119
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8xV/e4E7hprQ04fsi19fLI2fVcl7PPwdDGjlz7kw5c=; b=UEkReE3c1W8A9wPk
	QXEiIfIKai9HlqHiNmz4bkp+n+SL7wUmHTQ2s0aMJL3o/Xk8+eboWhSKUXrYT2AB
	UbwgAiLlbb5z0S47TcbW4IpbhjsW6Za4//RL7I5GrpAVBs6IvsKKoP8NFwpkFCQi
	WJAsUeQHoLEPnWHPEpv/Vu0Eme8PQnZ1C9XMvdR6BzuUgVR29/Ypan1zmOkIgdnL
	5f5dhWOKvL20qlSidh2I5ELRQR76A2tvlagQzqxhvLN2Y9QOrth+aG2oQVSB2N9j
	/FuoYSD73/NRnBlHDOuSnkeISzGACBRiwd4CL3AAEBJ0yqNbeZ6k2+B59ZIkjKAc
	GkVY/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h78sa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8dac6233so96921211cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776886555; x=1777491355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8xV/e4E7hprQ04fsi19fLI2fVcl7PPwdDGjlz7kw5c=;
        b=JOzvlxWDN4sIapDOEqxS1F+OLgRzZnR1nCO7C6WSIdZgqJscA5o3NKX+F7pYUb5IjW
         G50EpQaJQUX/es1gVztkzQo/DHqZbNQcpEmey/1iNC4lj8cKvjwBvFPrfHMndDLAldlT
         cKP9Lt9yf3nxxn9YP7tCxyGlNAR93A3nekc5UQG5nAirk7WB3Uirxq24Rn2iMOloHIYR
         FzxowKUsOeiFURvvwEa0zGNY5x6VVhScCKapO5CMq1yuOJ94KlNjph+VXp1ihxBre1L5
         v1fIsx1C8XlLYeWFW0Jkn2dqO3SjHyEq8u6/1xZF08aZWT+e3046qLwKOXBoFMeLv0HD
         ZeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886555; x=1777491355;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O8xV/e4E7hprQ04fsi19fLI2fVcl7PPwdDGjlz7kw5c=;
        b=BQg1o8PqAi6jXLgL1tYzLVLtjRquyqAhzzDt19LswQRiMh9wrXIbRhtWKt3KdgRwHq
         xdTU7Y4MArcjlpfmPenZrp1sZAbePf57puDXUZyMaYBWWDhqmq07ak3dLTIe7LLKvYWh
         RRp0csiwEUmCxbc+y3ptmM7KapYBPnPhgx6xhJdqgHr71gI3hytO8cuvTDwuKs957Qft
         4NH14ZWCbiTyyL9pqA2z05NqEX83EJZ7lvuz2EjT5TSHl/5O1w1l2af/LDMMUn/cOFEg
         smRHP70Or+Q5zZ2dvNb6DQeQbIc9Hl3qXq2922MFqC/crJ8YoUzcWQ13uypUnrN5yCQR
         KM4w==
X-Forwarded-Encrypted: i=1; AFNElJ+XEyW8VS6n4Uu90mbCBOGUVjhpRwQIYLFu+qYM6BiJLqU9Gk+45qjSYLUxjsI+ZunvZ6F4s4hiRj/3@vger.kernel.org
X-Gm-Message-State: AOJu0YzZNgENFKCbelAc9OmfzNw48o6H/CxGj4dy1EpnJW5PpfXUONJq
	JvkGwIOZAzecQAiWQLlDAW8GcHI4fHTph0+0yxtvyODqZ07fYBhK4YgfJClR/Q8UxC49WhpTCr9
	Q8TgYjiEKf5BESt1V6fhEzlOXp66uEEMFFYxd+Gj2zArCSNJSysjBWLuH6fTRBD4A
X-Gm-Gg: AeBDieurFTRRfzWSxUr3ok4TkWyL7cz18r7rmBdm95AFFEi/o6HFOV3miOamJhsu7Ty
	rUGmZc4fVM/AqgjTLIMIguX2bvVyJqsmfpfvFwZR413yv7mFuD1yMBJV0snVFguIGI17MbVoVO5
	mq5ZOKX38M+6NX9I0kD0roWER9IYvl4ypFFbwjz1Ay+hrT1QmE2/5M+Hy8Zrrx5szjw0r1c/0Ny
	swNlXmuwie2oXlQy3WgyUb3vrFJdqU3+oPQYbWSG5uExYrfkkOm1qJhG+kr9rtPKxFAK9Hw0Mov
	kz7Fn7aacj/fm7gyKFRDuDYzxYWJvNt3rzayPSPGaekAaIAFddv6dTvsR9v1cjU0h0PKgvxq0b9
	XhKI/H+CAL+H7xUjdtEp1zV/FxDFpkPmmyWeNRKQXQO3hCu9viPJuLmmNflGx0M2s23amYI38b1
	phWZT7Ydv8tVAnb72VCsNnkosjQPEXkYegSK8F5LuSntabuQ==
X-Received: by 2002:a05:622a:1148:b0:50d:89f0:9a00 with SMTP id d75a77b69052e-50e36c768famr341145161cf.42.1776886555544;
        Wed, 22 Apr 2026 12:35:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1148:b0:50d:89f0:9a00 with SMTP id d75a77b69052e-50e36c768famr341144561cf.42.1776886555058;
        Wed, 22 Apr 2026 12:35:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4723395e87.36.2026.04.22.12.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:35:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260417064953.20511-1-clamor95@gmail.com>
References: <20260417064953.20511-1-clamor95@gmail.com>
Subject: Re: [PATCH v4 0/3 RESEND] drm: bridge: add support for Triple
 10-BIT
Message-Id: <177688655365.759482.16461367874412895316.b4-ty@b4>
Date: Wed, 22 Apr 2026 22:35:53 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: X2OdWotfxfF0s9s2DzHPZjUceqkWgJnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4OSBTYWx0ZWRfXzrHTxmhRiwh2
 TfAb/OixEHVz6o/EgkBmhkNnYe+FIUVoGgUya9wWeJ608ZfQJleXbnZx5pE73QK6P2kwPL+KWcx
 g1vtyvFIhDE6cf0bjp3IGlyeNcqogxtANNFexGxoA6914W+yleEqjcMjJZzzRmsDEH2W7QMHHHO
 RkBVr6ZGg24ONfDjcYiiQS/1PMacynY7YDjlNzC6ckm7By34af/hytWRSHaAWJ5Eg7hVyxZd8Pl
 LL8xRPlzTIWYs8vO5dQvs4fjWjhQFtPIINc+LG2R9er0ZP3agpfnIhKlEhpWI5g1zSHVUh7B3jZ
 lr5MgvnCjfFUauk4vnopikgMJj6JDPwPP7Yyn1jALrt7zul6OcQWC6uOHPlSKzAcce96XCcSH7a
 btQTBVjO/YfMR6+EJMbN3nkn8vliDWc1IplSmP38oI6tchtLCYSJUUirqRdULO2hXIBgqZAcKdS
 z9Ro+1t7omDfwT5dIhw==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e9231c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=4sy6PxXrs5WGamlIgqkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: X2OdWotfxfF0s9s2DzHPZjUceqkWgJnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220189

On Fri, 17 Apr 2026 09:49:50 +0300, Svyatoslav Ryhel wrote:
> Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
> MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
> P1801-T.
> 
> Link to v3: https://lore.kernel.org/lkml/20250824092728.105643-1-clamor95@gmail.com/

Applied to drm-misc-next, thanks!

[1/3] dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS Transmitter
      commit: f7e677a23701a95e71569be88759bf195fd9a42d
[2/3] dt-bindigs: display: extend the simple bridge with MStar TSUMU88ADT3-LF-1 bridge
      commit: 147782489b48e7bda472151cee48985d6704a919
[3/3] drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1
      commit: 7dbca56a79fedf40106baffbc8b0e15f1e54098b

Best regards,
-- 
With best wishes
Dmitry



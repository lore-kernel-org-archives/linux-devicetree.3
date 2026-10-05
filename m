Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582CE331203
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180415; cv=none; b=Yi3/7IFDvw3KxyiOOMyLZeuOWAS2WPUB1MjoNBzTmW6B4E8AhlCD6FvCj7ArV585QLxWJ4kl1xPXMMJCGm0h5c9UjwU2LXYYjaAwMgaK8GfjUePND/e0tRRNqLoMSORAPuilO1LXSUNsjHbA2SRqpIyKaKLiLhWb6rr7qN+xc7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180415; c=relaxed/simple;
	bh=3SuNTqlRtjw+n0YfunZF2hfFU7ZZIJF/+3S7ngwKu0I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=isFOAm0ARL92ShQu27u7V1/xNT7M+2UdXYEYlgrP8tDkekV4zl/OhSRFKkKsCHK/k81qbI6a7N6QQooBnm6LlDOGFPtLYJ1JNSKC9Wx6RkDUCMIEOzQgvDqEFgSDEeDLEu+HxXdxOXuPqVscd5XUdKUrc9cc5n8sp7i5zsK8KfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRoSuk/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bG9W8uIA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRoSuk/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bG9W8uIA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510MTi3838751
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0JTQmqx/+td
	m2477yswPyj2KINxreiPb6kUpTysNU3w=; b=mRoSuk/u2RuVZyjPlhZx0n+KjQt
	dtJvZGwWXpi0PcynLunli5dnVvLnGLsCEgSLcupY2ZC1Vw5h5HytZv1nmSZ8iWpm
	7btA+RBA5oG0bIMRYIXr+7yusMUg1vjKXN6QOyBotSENu7xxe7/43zMOrfluBhkV
	uIob3sSo+qYuaPlTD1qAa3WrngfGg+rembdElyJnqfAcIWGeJ1lZHEHAiAedoHq7
	zbmPx8VO2mVedoG0hBgCbM9y9QndbWEhjJJ8fCl1ytV9vNoZZvz+0BPT1MqblzjI
	rehXYzPsf6SdyOIGr5NAPrgoFoGNqokzRYcDu9LNJ2LVaMCyEUzmdDFNoYw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08mj6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:06:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso25372405ad.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791180413; x=1791785213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JTQmqx/+tdm2477yswPyj2KINxreiPb6kUpTysNU3w=;
        b=bG9W8uIApE4WV5SXVIi9pMVqN4PBOH1PPt65eqn6RNw8HgmF38GTdN0ACuz+2GcLtf
         qaIPBH6ebv3V8UNg8pAT11Bg4KHTcaws2yGVkziTEmbZnXRqPcRIsByiMjtP9BNnJJ0a
         UVjijGYUymZNo5M2ZHRJ6Q0s7vwO6PhGJu+BiXdkLUDJv2rvkdgEIdfJA+G3fwWp4y+H
         94UPFwgUENhPzFlp3vvGtua9acypJdMJe0ZgNdjfsqDR/9U+Ugcw9Rsz6r8uBq9Uom+O
         1rjKrdsyDgAuBOrfSfHYv26QGlSxEAVojWy+kU4FcALnZeudjznJs2sxu91HoZ0TfyOy
         6i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180413; x=1791785213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0JTQmqx/+tdm2477yswPyj2KINxreiPb6kUpTysNU3w=;
        b=LCKnFNx75cZ4KpVP+rA7l6bbniOh5lN0wR9B7PJa6B6/EvaA17QZH+ef9DBs+T+Fm0
         QS+iRRswrmn4NgcH6okoEWyWpUuOOYJ6zftwTh2FjZbz/bDyGbLFnVdGPMNnQZ29HrO7
         6Blw3tuSC3ZH7Tt6B8WuRviiCoDFJFn9eq/b52FL1aYW46iuDdGzz31w2ZCiznVFrS0t
         zB5qr05vXywcR8pDhMtVkreu0XTgRdRM3evV1SuVVR7Qb5RDs3KJ+s9tHfyyVGpwLIO3
         7XmtswrB5sn9GBH2399LNODu5sbXVGiWlo5eoEiIwDGW0U/Lxjf1hzXKPgBVNPOTXXTU
         MR3A==
X-Forwarded-Encrypted: i=1; AKwUvBy+aNp9GYQcSzMxLFYtLS2eDPha4Go7iHBLX7MEfjwo5XQht7HZ2rGNcCWoDJqg6zfJzei6t2tS+eeq@vger.kernel.org
X-Gm-Message-State: AFq9FYJB5aO5qbIPBWnjvxiwd6BJJpvRf5JtO5v2m/jk7b9PN3ABTyEC
	OwucV7A9x70V8bM3pTVDyuqZALm5LgIsaHcJX3mExZk6mRdMkktZKD4sKiV+NX2l6tOmjTq/Atb
	BMAXfpj+QKtlx9E5Btpx6p+u3ScEnPOC9+ZIxm+mBNoTcD9F8Pv24o76F1+GXt3LR
X-Gm-Gg: AYBFou2N/lFdTVaUvEp6NYJLGLuYWq9jnbt4vmSljRE0WPAeikQGuEZfPI9FZbARdST
	7jvgd3ai9wt8Bl/HEDVL2EFB525MqtH9MxRhKHenABR6N/7xxcYCc4jn4j2oubysR2LYLLsAj4y
	WgEb2VZgcOE0RC94fpTZC1B2kEsKqvovp2KkWspaMGjmnVMmP/L3MF3k4EMVpRbZiKk/SqH+8Yn
	JLnUWu1NUPPr4VoPo7dTaWvSOz+cMR5M67i5z5M2RaYm5bzHkeTCWupM6nv2fLuOylvESXC8UwX
	/wotqHt5ahCr+BgteCS0Slvk/Ia9NuZgVwi1fm7nKqU5OLi4QthO55VU1BeF3JBaerFCp0vFZQg
	kiApU13jr+2gQnUg+5HCtoNbtxtpp
X-Received: by 2002:a17:903:1209:b0:2dd:c100:a5df with SMTP id d9443c01a7336-2e49b67e212mr86070255ad.51.1791180412984;
        Sun, 04 Oct 2026 23:06:52 -0700 (PDT)
X-Received: by 2002:a17:903:1209:b0:2dd:c100:a5df with SMTP id d9443c01a7336-2e49b67e212mr86070065ad.51.1791180412515;
        Sun, 04 Oct 2026 23:06:52 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae104sm2455035ad.21.2026.10.04.23.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:06:52 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v10 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Mon,  5 Oct 2026 11:36:30 +0530
Message-Id: <20261005060630.3323963-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930-master-v10-2-105207bc5275@oss.qualcomm.com>
References: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com> <20260930-master-v10-2-105207bc5275@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: En9Aoc8RSRegBiBd9Ovh2ovmuJtOy1ie
X-Proofpoint-GUID: En9Aoc8RSRegBiBd9Ovh2ovmuJtOy1ie
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac33e7d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=X3mpNT67QEWHydoHx2sA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfX3MAC+YJXjt40
 a1BPOyR1MgBqf9SW09rTH3Gj00lsQdaX5DAfyC1beviCUIF4Ol/L2Pru3hqf6Jn0uRsG7yZvWbo
 ibVa8/Xb2pdv44oTLm2JcYP8WgBmupE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfX3hPcbg6E2FMH
 A+9VvskJy5nv+3T8RiMDLD4U7sWuwkMkrNQUP54habqMpawpAm7p+aMh4Cxyqa7dv1VTNeqwAFo
 IlufMfjyQy7NxF049OsTXK8tBkBb4KRAfQ4hLDQ25mHlpS1z3OHfG8bjb46seD0svwqjYdzgqkv
 clmYbkhevscYaTPatUDCt6GvPMtKjVUKJ3zFXlZDBSDEnkyhW/0yAcvIF3Z+mVD2ut8lVzOEFsw
 Ntnq3hUGAXGQAwYo7lIT7CEKLriekd4wmceyfYAFwds+Grg0aXBhFCYt8dsi1PoeEvkr0j5Rouz
 VMBIuBwS8QAu7RBsCslDZPtNMmQGWI0uFbqf6cm1AYTafmu2RSB3Y3v8MQfPxn6GUU0PbytMU/D
 tkksDd91bY/WMOi01Mi4uc91C6LWD8VfIOnUvdxBbny/RRyxgfQOTeliJPNrwwacu3sbXZMA2rt
 03Jm6J9qNG/pUlAJ1Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050024

> +static int lpass_va_csr_hb_prepare(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	return pm_runtime_resume_and_get(csr->dev);
> +}

Since this clock is registered with devm_clk_register_regmap(dev, ...)
after devm_pm_runtime_enable(dev), the clock core should already mark the
provider as runtime-PM managed and take a provider PM reference in
clk_core_prepare() before calling the clock's .prepare callback. It also
drops that reference after .unprepare.

So this explicit pm_runtime_resume_and_get()/pm_runtime_put_sync() pair
looks like it double-counts the same provider device rather than adding new
protection for the regmap gate ops. Is the extra reference intentional here?
If not, the custom prepare/unprepare callbacks could probably be dropped and
the driver could rely on the clock core's provider runtime-PM handling.

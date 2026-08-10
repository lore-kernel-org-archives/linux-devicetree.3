Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C03A7F70
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361351; cv=none; b=lExjBn4SLKmb1VYjfcBP5v89V+RtXqc/rm0Q+wj7Uwwi3u8dmntPYHQlg9iw92xj04v3jNOZ6Y/XhjY3LZ2AbLvAP1a2aS78wOyZYSZkmuU2zgRPHLleLI9j0gB3nhMOcKk88P3oLY/cWUpd3iYZ7Acso3tzMmDWj3qGBS682Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361351; c=relaxed/simple;
	bh=P+cSSRXvzNv9ywbkiaiji1QehkPwo0WawB8Vtr8v4Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiGwec/FSfV+6Fdfnl5cHTEmFrwp96ed6b+RMCkwFf7n56wqpnfB4ISRuRwXyqPbBnirvLRQDlLo6ds62BN5i3peYX7dX6rs7zDQzI7bDPAqjir44c+LViVwZ46TKtFgy+5iXEdW3uxr/dh1WV7OMFN3CbIaRYOh4n/wOdQV+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdMs2iTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLb5vd60; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdMs2iTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLb5vd60"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9Sd2k2342267
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66vf1/j/yffpMkpZE7IG5N5/
	5iGkvuETwh2qPT7BKrw=; b=DdMs2iTH088ZazOLL3MAsvXrrv8ePhsyxsykaKGs
	2x8WBfmjCBBHcwBvgEZ0OyeULotkmS4qbAa3Taoz55r9SIBgKM3M+YAMVQ1FrDry
	D+P1drC1tjjmhCagMoDjepG4XNEMylt+Re+ncemdqG6J28s02NepVGOR/JTBV0KE
	gGljREpIcpvzYXgZqplZqaf+cAlPciFs7YgIx46J6Vu8w9AREuun8PDWaD8y+Cto
	ilHGNF2iZiWxfNmGXHz0JxgEAnu5g6NfNqtbXiiyoAqn+0ontKqFONYBtoy83GO0
	kvQAxQvOhZ7fjI9dOj77H8g/Tap8josOz/TuZghcGDT86w==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kj8bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:29:09 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81b0c72826eso45649807b3.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786361349; x=1786966149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66vf1/j/yffpMkpZE7IG5N5/5iGkvuETwh2qPT7BKrw=;
        b=QLb5vd607weGHEImQ1rdNqY/Hm1R7kZqNNn3B/xLjaWOec/EXBTz0TxRuFNjRjwDvS
         z4Qx4rajhaP/cFMbjw1l0Gcfr3GE30wg7BVHp5UZxx2ZVRX6EPGMgtjL+fIhVwM9xR6m
         L/vK5nP8hzMqm25i7p/s3zme4yAWgSVtBTT1MHYxUkybPQmFZf4VxWevFtBmtU0AIR8a
         IXiweAbjzqWPVagMOsHY3bv/q4loEJom9gnvqc4KmdtZDPpriDAawkXVtyVZmdJp6rqP
         2uUiT6B6t7j1R+LAZ09eAGPjpx9KKQYEfZtioEQq7WY76JRveVydcWVv092mC9fwPyEi
         nzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361349; x=1786966149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66vf1/j/yffpMkpZE7IG5N5/5iGkvuETwh2qPT7BKrw=;
        b=qABjC0veaZ2E1OZv+LFW45MFOayVape+fHvoOLPH1i16G6bMEfQRqr6optfIxlDd0t
         28lAuexpujjuWXwi3TnZUCWBckD6j70ZW3muZ38CcSmfT2K4ADozg29IVIMbUj40DvmQ
         1MK+wN3ciyZ8JDf+I8UyNPaENOQx6rWVtyWfIJHOJG5fMjWruZ2qOtI40kCk+Hl9QBht
         9sjHIMATP/aSQdnqR0aFB2hVkSjn1VOkZAd8uvczUGLdazx25by0mtozuMhHA2D4p1rx
         2JUEGYv4GxZX+q4TdlumKJ/KOiw8YciXM6NZ2DpAkwo/UCywIDvoWOf/GEW70eIBaasm
         E1mA==
X-Forwarded-Encrypted: i=1; AHgh+RqEGZbp0x8OosWijQvell3V28cIxTO6TTMuyuAdAQhKXyqWhVOaSDgTTfc7lrC7OFe5B1A7ukvtCxMP@vger.kernel.org
X-Gm-Message-State: AOJu0YxpIPC2et5FxKUvQO32QxeyvkZfrvF4mqDUm3E+MO5ibybeYr9p
	egp53m5okIcC4klIzKNCB2vEOaD2GDTsogyvCK6owB5RdYYiV0/enuOrSC8cVu3BFq3nq4mwjSm
	itczDBlr4u+KeKLJaPUSR56eo05j320j4VbejC8c9K5AanlttA/1Z/7tF43LREnO5
X-Gm-Gg: AR+sD13IoK2n+e/5ttcrHjxl/vd+NiWfMGeGfgOlFS+yncDxzcbTrFAZz457v4scaOw
	6v3WcTzWLCGg9gu+EjAoglhVQV4QwjTaA8f+PU2kIbXhon/H2ZoVYi+7cE5r7V7Xu8xqx2nE3wW
	oidKs+m0WugciqTJBh5NjxEr6uuTIviIX5PE72VigP6a4gDLoBLvinxm9g6dFdDlUApc+CQF6Fj
	Db/0WfOnmOkOVExgn8yq7KhEZG8fnfJHlWJ0Igm9If4Y2MLABp2MzFn0KtGqp7ZGx+WxGyZS2Ko
	g10yLsory5m9JKV8msdQo8fDhqo1o8aTVeOHPHbW3rlEfqe0vUjOVdZCesU6pbB+L05hAEktYrg
	yl2eQcofdljEyIIEcYKJR0DKdrkKjqFXHGMyhEBLjLyk=
X-Received: by 2002:a05:690c:e3e8:b0:820:de0:6264 with SMTP id 00721157ae682-82d238d99d4mr3777807b3.0.1786361348562;
        Mon, 10 Aug 2026 04:29:08 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e8:b0:820:de0:6264 with SMTP id 00721157ae682-82d238d99d4mr3777587b3.0.1786361348055;
        Mon, 10 Aug 2026 04:29:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efa07c0esm53606337b3.1.2026.08.10.04.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:29:07 -0700 (PDT)
Date: Mon, 10 Aug 2026 19:29:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: add HPASS ADSP cluster
 boot-order and SSR coupling
Message-ID: <anm1_dJl2QLmQcw4@QCOM-aGQu4IUr3Y>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
 <20260810110726.775084-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810110726.775084-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: paCYLwcvT9y6qGj2JeA3ll8M_iobHVyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfXy/c2qabL3sYm
 mAp0xJSPwsiW8iWHPih2YM4XH8bFfZLqlGCv7pWaNAo9rEXjtri6hCPCewq0EIISNtW5h0cOWrR
 g8Ml2qaPoa//67ZU2fZIS65FX3kALIPrzX7YUEUP5clrl7ACxBv31F4gaBgoqs6cdCY46Oe7eHm
 NW2NtNIoDJA3KUOX/KnE72bgpthga9R8b31gmv8AGeF9ZkCtLicKZJYmEE2RbWSZbsuAP8El0OG
 QGpp/ifoZcabsKNOuN2Vq416Af4UzxGIRCDzvKdL+l6uBlo1/0iUrVPvqPJOgrTXSYKzotHSz7a
 oNwenKS1n794DCaIryOPkWSIlREezqOJ5qsOXzhp72Ap+GzcqpjH+qk6OICplxcB4QwY55HQgen
 opUnPIyKRI0S3rU1oYtmMjSG9bJ3WkB3lxb1SMZad/qI5B5hKIxCMTI0VqjG/wQke1qY6ObcK85
 OHTp6U5IkBFuWE89v0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfX4qcpgjBSOobm
 aTYWmhwuzmftlIk05Lfw2gz74voa2PdkdL5iFO8cnMsQj8G1uzFve8olm4KTo9STZBVYNbIbcKS
 lhS7U7t9Wd9S8O0Vyypt0JjmtDtvJy8=
X-Proofpoint-GUID: paCYLwcvT9y6qGj2JeA3ll8M_iobHVyK
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79b605 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7UsneLLXRh_0qPm5NQwA:9 a=CjuIK1q_8ugA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100101

On Mon, Aug 10, 2026 at 07:07:21PM +0800, Shawn Guo wrote:
> Some Qualcomm SoCs (e.g. Nord's HPASS ADSP0/1/2) group multiple PAS
> instances that share clock/reset/NoC resources: one instance (the
> "root") must finish booting before its siblings can cold boot, and any
> member crashing, or being manually stopped on its own, must bring the
> whole group down and back up together - matching the downstream
> coupled-SSR ("MDF") group model, which never leaves the group in a
> partially up/down state and has no notion of restarting a single
> member alone.
> 
> Add a shared, kref-managed struct qcom_pas_cluster (mutex, members
> list, waitqueue, booted/restart_pending flags), looked up or created
> order-independently in qcom_pas_probe() keyed by the cluster root's
> device_node (works regardless of which member probes first), and torn
> down via kref_put() in qcom_pas_remove().
> 
> Non-root members now wait for the root to finish booting before their
> own qcom_pas_start()/qcom_pas_attach() proceeds (qcom_pas_wait_for_cluster_root()),
> and the root marks the cluster booted once it completes its own boot
> (qcom_pas_cluster_mark_booted()).
> 
> A new subdev callback, qcom_pas_cluster_stop(), fans a stop event on
> any one member out to every other member: a real crash is propagated
> via rproc_report_crash() so the whole cluster crashes and automatically
> recovers together, while a manual (non-crash) stop instead force-stops
> every other member via a deferred rproc_shutdown() (run from a
> dedicated work item, since calling it inline would race with the
> target's own concurrently running IRQ-driven state machine). A
> restart_pending latch ensures only the first member to observe the
> stop acts on the rest, and is cleared once the root reboots.
> 
> A manual start of a single non-root member is deliberately not turned
> into a whole-cluster boot: qcom_pas_wait_for_cluster_root() just waits
> out its timeout and fails if the root isn't already up, rejecting the
> solo start rather than force-booting the root on the caller's behalf.
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 271 +++++++++++++++++++++++++++++
>  1 file changed, 271 insertions(+)

Sorry! Please disregard this.

Shawn

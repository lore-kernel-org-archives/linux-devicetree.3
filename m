Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB242C4FA
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752563; cv=none; b=dh5JrZHU+dk0m47IP7YQjw8IYPEINFF7KkZsroSV0L4Ogkpp8icFkrSjZqsRrKcs7LEmRcLyG3bbKtB1FTtto0Wt/eUcW7o9a44uy4zVyN7EbHQZaARmCVEV5w3Luuy2XqNM0VLGSHxAVNpDSCWoWlyS6SWEdgDoatoSeNEJuRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752563; c=relaxed/simple;
	bh=Fuk5n0D0xHvMhCw4oobLuLcYYMG2iZyU2fYgQ3JvG78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bU97Ua1vNJKZylpAPGATrIuoL7Z213DzVnxHkke2xJgTL1Vg6ADYf3e7IyeyXP9pNtrBmLXdoUHhYNx0e2eRTRsJpydMiTga/A85g0Aj5r2EUpLUGjR1/qtNlv8ZjEim+twNexsmvTz2fsjk2ryhJPR0jxYSoAYoZ254yPHqn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNzIsZgY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OATq09f1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNzIsZgY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OATq09f1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCIf2882134
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GvF3M2opMH+
	9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=; b=GNzIsZgYoZ+Cp0Ialf+Ep1+MYXo
	Qq3p8AtunjfmGxaWwc5GMV7+vGictha0tVDGoJJxTEn4VChALWuARR2xxiZeZ0kh
	/xo9R0wFcu/RXAuRfF7v6HbAXJTNPg3BjF6vR7WpI6SGARmAXQZi9MG6qHvPr/Ep
	aGNZCtMfXQspnnq3yBm6sd5gf5/qnc33BTvFpP3mbQ/bEiujZLtxQIVKBCAxzodU
	LgMfLRWvnq3cXnLknCmapMz018HzpMcCg//TseSIQNv2drRnhsnwnG+0aTEM3JUU
	IRzRL2VqKFuqXTnGI1XbW9DGIQFKtfr3WZzZlHvEZKK7EwGhJRtH7+m/f1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k2ej6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:56:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so2859947a91.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752560; x=1788357360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvF3M2opMH+9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=;
        b=OATq09f1MWGBl3aKoXjrba6WGCa9wCoPqjbCoYCivbAtxXLVW0msBTJGtRjXtIZ309
         AD6Qw9ENRFP3P7AqTF01fLgV8tqd+gcEomeQqonX4kuILBb5SCp6qM6NDwqfiuIzS0YP
         ZfhhyZ5F9aBQgAcRVccmpF02PtDxF8L4sEMroSfa4fkFBej8wvCl1X5BhFgMs2Il2g+X
         3oEMWUG6UtOUyscbD7x/BnNu5aVWGIsznYtiGAzwoMTPkfFuYrQkoNJp+aWAHg1O570K
         YMb2v6Gm8NDNJIxHFivfF5/8IIYYHkMLnlIZ6Q74V8CUuODX7crTFhwrvc3AaOskgr+4
         3crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752560; x=1788357360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvF3M2opMH+9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=;
        b=XCCipsDdBzdeOU9S2XAb9xZwnDyrLGowzgtHaAo1PVrNicy8H5z6SdHYOVy01fqBGm
         nvYFzYe+zabI+rVDh/QVFIgZ8CbRX04Nu+NdSbgaMOzo9l2wit/ceTKwsL1hpxTZeO4O
         zwKhtQX8Ke4vwu4CnaM57uWzq8tHgFyKUJxqcKw0CzR0U/52XayvBNWdtQvnFdE2H8ZY
         jUN4U4ormIohprRiGNsgM2Y3FmL9dzGm8Tez7ptvJV5GlhJew3I+FWv02fQU9Dkr8+QD
         Kl7Kh9WZOJW5Vb6J2tz5BRvwYakV7W8ojRJa9uncULiY+Q6kduKp33diYEfzRYgMS1/z
         WloA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9CwegdaDqFYTKXV69+vitwD+pRyjyZbLen5o/0XFGRZ6n+msUwDZGe7ZG2V4KtEBJfm6S0VCNW3mA@vger.kernel.org
X-Gm-Message-State: AFuF++k7aaZg7tmNY1UWM25h5roYYcv1OhuzKnjPHaqULdoD6tXgs6uh
	Z8mb4u16m9LgN/D7U5BPFqOzYhCQE1EGb7feh6M10LAVC8GqIPuh2rwtGU0W6UakS6mb83bxTla
	kr55FtjNv1n/C9OvdUQirAnl8xCCGqu9mUqqP9Xy+ewg/9kviK1bWsEnbUNZiN1sK
X-Gm-Gg: AR+sD1136Ti2LRbAQlAmWcTZbRL3h3qMkR9wXOKrm5JvlyNDpR+vO+k+Mzgxf42wlSY
	0D03LwSZwoTqMlfaxhpiy7Y9h7kC2qphtrAxES6i1arMZSl8p2+N7JKxVikE0Yb60vgjm9velEk
	KzYPCVy/mNPuiItSBq2tv5Z4wc++9kFRRqhxEmdIJCA2gCED5/N369/p2lejfRHYYiUJz5yJmrk
	e7BI8jkpg/jcJ0RmOZFLf05bontWGUsxzIg0UCzEmJwprJ57eCwJ4UckUXt6N3PlHTf6k0oMmvc
	nPqsmCt4/UV4U4YUVmUqy3r1/wtQALRKwry+dBB8kwUXnt0MhC7Jys2NLy2Vt+e40OSPrDZATzd
	6UmV2KLSizkCAbpGnU7QXsZiJPlfF9lsUrIWO6u2IJP1W4yD1xwXpPfPACOeE
X-Received: by 2002:a17:90b:268b:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3966d73212emr15756312a91.13.1787752559665;
        Wed, 26 Aug 2026 06:55:59 -0700 (PDT)
X-Received: by 2002:a17:90b:268b:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3966d73212emr15756154a91.13.1787752559073;
        Wed, 26 Aug 2026 06:55:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
Date: Wed, 26 Aug 2026 21:54:54 +0800
Message-ID: <20260826135454.658615-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ef070 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lHabChWoiVafOPoG-uEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfXyP2z3nCq1Q0s
 baJ2RZn4m7daqiPJqoi38DBOWwzqLiUvgxNBcpU0VB8v0tuGm6jWGXkugS4xyvtvQBeQdhWwKEs
 xwIkDLY3TIPra8OrLPs9lsU5xV6nhgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX7h9qG/VCuSKE
 WBMOYvywX4LoF1drRzQnef47y+m3RpGqnEgvzKYrTeTgHajNyqmLAIzOhIBtuLHImCgI5pPUfsK
 vgUljhqQpHE6Igh1EaW3+D4JI9Z/uJ2nCGfHkvlRf+VvTh+YNROCug2yc6oFE3VL7g8JF2isSzr
 SDn6Qxp6D5HdnRf+C2JAYp7HeGvyfDgVyBZ7J4igWuzPB2zLOdOJbxqtzT2B8FBHjkVN+TYvdMk
 x6NqAe24WZBysaH12QWLoS4oUMcD5bs5fi9rFv7/A7l/kWQBQ2bYEU+CMz99IJij0v9nS7ZVtoY
 FN+qyEfaHbmkU0OtMBRAqDgkqGO4zmTYq3Q3x1F3BhAodM4H5xuNp3ytY6P2i5Tq4UxqUfh8zVe
 R3hELPWZgmBBc7IhPDP2eV4GafrJmIeU1t0b2SSkOHERqQJlocNWpwy/Jo4zwIJYJ2z95sHk66N
 B9Z2JvBsMGuftSIk5Yw==
X-Proofpoint-ORIG-GUID: aAvZnbA3PwIRijR-EvXyw0i2-x1PY3jD
X-Proofpoint-GUID: aAvZnbA3PwIRijR-EvXyw0i2-x1PY3jD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260115

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Add the nmxc.lvl RPMh resource and register it in the Nord power domain
table. Nord supplies the NSP memory rail from this dedicated resource
rather than from the shared MX rail, so consumers need it exposed as its
own power domain.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..717c44d1c39a 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
 	.res_name = "mxc.lvl",
 };
 
+static struct rpmhpd nmxc = {
+	.pd = { .name = "nmxc", },
+	.res_name = "nmxc.lvl",
+};
+
 static struct rpmhpd nsp = {
 	.pd = { .name = "nsp", },
 	.res_name = "nsp.lvl",
@@ -331,6 +336,7 @@ static struct rpmhpd *nord_rpmhpds[] = {
 	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NMXC] = &nmxc,
 	[RPMHPD_NSP0] = &nsp0,
 	[RPMHPD_NSP1] = &nsp1,
 	[RPMHPD_NSP2] = &nsp2,
-- 
2.43.0


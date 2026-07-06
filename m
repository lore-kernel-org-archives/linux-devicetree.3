Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4141610E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344356; cv=none; b=MO55q8sKfQzUS6l89DOsTKN63qiY+hoVGpvhwkv9qeu2/GkUSR3/9oMiaQ6qrtblMhc/HV+B2+DHpiIvo4ChCV+217Oxet3Iz8ElK28V1xLPYuQUnyipePjGT5SGLDV/9TFnHWuK/53V4QKyu8Gk3Tc3WMqxvBGpN+CM5fFCW4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344356; c=relaxed/simple;
	bh=2t9CuXwCB2vIl9APo2o4vPRIEb+dUwYD4ysd6rRlclw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFNopKdho2vgxiIQ7z15uMf2URkTXmJbTPJTI2+roYjieNKjNfkS+oV+2HyCVPmdm/oPwok0ebQUtn5ywEqH0K/zcJml2ubOtcNIwA1Y9G0B9AMzJzcsdweLMVYlOdo8/hjKknNLGsuy/kwIu0ZFqV/bXe94ojOrWn4SHcg2nkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK/U3Diu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iv07eVSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK/U3Diu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iv07eVSo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax6YE391042
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HNQVled0KgZDT93hmXfBB2xm
	dP8O3wvyGKZXqdF20ss=; b=VK/U3DiueIz1i3ItQHbF8kARojj2FOMsO8zG7GEt
	fKsvzYU3/tCPTGKUW44BPeqnuU53To2cb/sAdN0LWWN7M6AjP3EvcKvOk7wTKwBl
	9EFnTczJerbN3QAbcbyGhaO4Cu9X9VE9Z5fhIUQ5VCap0vDEHI61xnivWgqZaMoM
	fIAQmeH2nrTZrfJc8OVbcUvhvaZam2gXUofwrWOTqAtwQdpo1C1wmX02ASCqevvZ
	s/WFdJBCp8cMZkpU2EiWisM5cjnjG/dJltmsaAk6wgtYnAbC+AA6JdK4TBrGlt2W
	+h1aiRzgYh1ZvoyrEMM/5uMwoaFyAxIDtHO+zdkmGwofmg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrxdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:25:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc8bde6318so22270625ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344347; x=1783949147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNQVled0KgZDT93hmXfBB2xmdP8O3wvyGKZXqdF20ss=;
        b=Iv07eVSoNfaXIOZfl6Kfb1UxJuv9IsTV1zInhwmfGfJY6AuMWEQcNlRv/PjZsTa7xu
         da8yRMLcBQEc4tLOfwZuIwugNonY02aqmlpZbtij+uBowfpiSMi4bHb2itHMBl2ND4my
         2ANCnUs5x7r/t32pCAy8aS27UztXq4ycKiKXZwA7qlvkQXB7viNwOa/3YGMzCF7DZBA8
         decR1dec9+qfYRicg7X2q7ZAcpdg0RIfg7pI9hSsosfMvYpBC4zixaYo658QMqYi+PBC
         T4YrNZ26xlFLPpIJ//dIZ+0/wVmrh5bGJlfY+fsLKIcw/bySzVQMnt/z2bS0kuY+S5li
         0n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344347; x=1783949147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNQVled0KgZDT93hmXfBB2xmdP8O3wvyGKZXqdF20ss=;
        b=sJbopJYcSfiQSvX+L1H4i+4Wvb3RC/jWn2yWaLPIR7NpXOMMH+PgxpWfh5c1ePJb0L
         Ufm6/cFjcise3gGcleb6ozzIKZQ/ylEAJImwcHC1s1j+fPe8rwvXwv+J+4/h9jW7amqw
         GgcT5/E49fHDRGw/nEoTEUQf7oPfLBbsZ1onrnvLK9p1B7T5pwKa6CdWRj2kY2R4Wrp2
         y2xG1jyMjhEhg5X2tgEGZhFqg61E4sVUTe3RnkfNUoYTdszCwxFuMSnvCbKGe6zUAAGX
         ezmRGiedshp8CXsCQUjI5SwXB685Zr/mbrgSByLvZJpTc+/EqhyrfIOswJ5A6ynCynDt
         uK3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOiZKYibGicvoxVpKvQGn3kEsEn2EttimyuJUpQkKFPdWD0F9hZp5OEbHPyAZxKU6YSqqssozTKqQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwTPjpbKziVXZ1RIDzYXhiTTTs1tQlQyMRcj2+dNNe/SuX8el
	eKjtw0L5f0iOjVYxsZg53DNMQXHgr7y73TaNSC+iZF42YODh3ria8/wTN8SsOyerx01qJ2tgqpm
	LiHu9rzJpw8nBWw88/i13/57/uAFh+znG40EogMcf2dn03SdMOVbaNPqtcDAo/qgL
X-Gm-Gg: AfdE7cmUM+i24Qh1Uuxj+E1FWOt9Z+obaa1HKKebql1BdemB7Ajl/INOxrPtL3+Eqsu
	/Y2ueqMiPnS1ALGZwpOjI+EnIcu8uKTehAr8yxyPCcOIj3FZmQdDPlAGe/GgKCMe4iYF/2+4+Om
	UmqZPBSMEba91uVlVvYSb8gbggZOqmrHvdCCyAo9x3EQhcURrs+z+ZJ7KN195xVDsGpoLIgjjp5
	6d5QV/BPbRRjKVIwGcEY8stFJvKivJBRSzzLT32XmOzl9tbgxWKN3NUHzgKshSZpujn8vviOcOJ
	hM8uBW2aS6RpSOHBW3C8KLZ+FqZ58NOEmutAagocLEcEH4n1CU/B1kZe6zPJXpFjrB8Jhv5bioA
	Zrh2Ay8VR0yMEPXGl1fSpFpUC8tmhdMhRmHIMIiC7jIppncBuiMxectDnSg==
X-Received: by 2002:a17:902:ef44:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2ccbee24250mr4751085ad.30.1783344347089;
        Mon, 06 Jul 2026 06:25:47 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2ccbee24250mr4750055ad.30.1783344345483;
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870f58sm51690345ad.59.2026.07.06.06.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
Date: Mon, 6 Jul 2026 06:25:43 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 3/7] clk: qcom: Add generic clkref_en support
Message-ID: <akus1zcopzgPNaxn@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
 <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
X-Proofpoint-GUID: GNtUxzxVxltcO0d6sqQBnLzn7lsyMZ-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX9pVeMSnahTdQ
 oQ9V4WjX5jvO32Smn/k/G6fcvSsVaPf2EGtwhISt67ZYq7SQofgK5a9L3u8jHGiGzFBbxrol+Jb
 FqjaSZXiUleMxanI7VJPC0vjwz918DeyKBzOkaac/VUdI3I7coO+NWvSHL10qQ1wwtTvZNeJReY
 YlEkpDFQ0LgAZutZeAwvI4AX1FzSCWyvPbI61IrnM0QcJZdRvchyDkJ5TSdX0SBgel1W4eyxu2R
 C4A8Q+D4Mphw3HYJpRNc01dDetM8+rncr6wk4oTNkW1WjzPeKo/5Iqv3a4O+ORzd1zwhWni0AmM
 p028VNWdUUVW0Rj+bVu1ZLSkCEf+3SKWlIY5AHCBV6qwKYUL2KvBhxo1N68Um4J5C7ssLBBOIGv
 T6ZfIIw5ANlyFb6zMrUwPdoevpo+ZHD0hgBAsw9bLfJZfx6O1nOdy0YrqVje4pCAEDgzONk6Mwh
 gWt0fkwZ8lASjotCgMw==
X-Proofpoint-ORIG-GUID: GNtUxzxVxltcO0d6sqQBnLzn7lsyMZ-t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX8dvFDj1b2rAn
 sLoYdye61cxtiChf8jF88N7/ik5oT+ZRVyh3pDfWo9hDY30V95G+ZVFAoMVn0qGNB4dHO77DlCQ
 mtunWDNQUrEx8zmjUMtTxG+bVxgFwSw=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bacdb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ukEeeJt9K7XwON3hb0cA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060137

On Mon, Jul 06, 2026 at 02:24:02PM +0200, Konrad Dybcio wrote:
> On 7/2/26 9:36 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +struct qcom_clk_ref_provider {
> > +	struct qcom_clk_ref *refs;
> > +	size_t num_refs;
> > +};
> 
> If you define num_refs first, then you can have refs be a
> zero-length array with __counted_by(num_refs) and make provider
> a single allocation, like:
> 
> 512946cf0f32 ("nvmem: rockchip-otp: alloc clks with main struct")
> 
> otherwise someone will come around and "fix" it in a day or two
> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the suggestion. Will fix it in v8.

- Qiang Yu

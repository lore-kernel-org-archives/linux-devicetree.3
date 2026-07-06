Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E49424640
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340651; cv=none; b=ODOAghFwdQIOhr4XxhV8M+0yqFUzEVeKst4tKIycAvVJhxQvgvb1z2wMcWWSxckZxISyjMejGvAAcPI0r7JdKcQesGCv6PKb5ewKA89ylJOjGyfnzwWpaH6qhUpi+N6kXpMNeV3JvkXXY4sWo552F16cKk6Q4LJMBEmG0ylaxc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340651; c=relaxed/simple;
	bh=jquZaB5cnyQkXfJHzXzOZTU3Nw87UqHejkSfxS+Ivrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa45z0L2bi5/mN+MFM5hyvLNXKCVKHdUn/hipibXlTOYBUHtOEda5lEs0FE9H7zUbO6W6YwMvF2nQYy5SNQgnu3knYVIVfl16xKiL68Ur3LHzsktR0ZV1nGa+JO4GJJWwbWlVtOf6DdhKBGgAypywk5aufQglixTmi5CYOnRoTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lH/jTr7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2F9HI33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lH/jTr7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2F9HI33"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxE2P361317
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSRw2jkAJBqJzogSTTDVCeRoFnrRmsDwzsYxZO7/CTk=; b=lH/jTr7xhBEUnbJ/
	17N/BLVUO5PNZxCvBZJ7bZ4xO3n5aIsMbTP2oVIixRZoALWJEehhJFeWqrUDYIoo
	5LQgSQ/2tRA6DJSd1lXYq8zEGP/AHQccdecKtrXKXfVaUU/49x5lG+oHNJWsB9vM
	hP9/G2tmbq/PebV7dr9Pv95exCQRpV8l+rW+SbQkX4isS10Hnxc+kAf8VgK66Qxd
	6b3s92XDHf3KHEnMvNMhjqBq+l8Lj2TyIkMXS8EZ6CXRPvcVSpUh3/a46ZRdcfls
	9B3qjsSEuJ9SAFoF5hQ36EOnnRuEXarBpv4mEMojnkLvDdVVCTjH0huOJY8zjkx5
	lihrfw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h50yy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:24:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c27616421so11621681cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783340648; x=1783945448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSRw2jkAJBqJzogSTTDVCeRoFnrRmsDwzsYxZO7/CTk=;
        b=G2F9HI33QmJPl3RM/+A8DcQVHigv/M2f7zF1vS56CYxYLqnXJrfZdgeVkHpoCsJTcY
         Dy4Qzv9YEwxHIDgfw31Ve5JFrsnLaJPnQCI7rc5xXxiY/uZZU+7bHd7mXocAR062JM3C
         NJdhalPDx0OzCClfeB21ZV0di7ZvpyqlMpZ0Fzeub0RVM9D1/ApUYLNOPzvH+YaIlAo9
         GB2n79kaUgWdebDVWTn9seSTBxTydmROymKmQeewsQis9zkZM63Apk6/97iXywgwCsA3
         N+4W96ZXbt31GuhchC6c9JUmiBvM4KAX0sJR0ZdjweyODJkz9jo5/EBZaWV7q0mmQrGz
         Xkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340648; x=1783945448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qSRw2jkAJBqJzogSTTDVCeRoFnrRmsDwzsYxZO7/CTk=;
        b=srQTNqKU0Y1hU6ajwqA6Xjoqh5uc6bJUnjgGEBSW/8eE0ETEvTUcn51bI2YFH0LpKt
         nhRN7IF7DN2TFBrd8DXb8gm1Mgkb9yZgA/aRXH8mrHtSCPteHd4DTwhU7UzO7XXBKkSX
         k9mTpG8PNsGIB/vDW41teAtNsmULIecIGU5SBD6oP3qgQ89iyeGGGnTnnreATSPAM4WD
         rvYm8NEL6WbP+3z4u+42Yh2546kv27rkRMHCq/guIyh7YJOIN60c/81TImTyObHLSrPx
         dd1XdTGCERnft828oAmEfTCy3mKkzwyVbwwgU9YAjQDThkbNlRFGHFLBwqL+bS5fiS47
         SreA==
X-Forwarded-Encrypted: i=1; AHgh+RpsnMuO5tujtr2liwj43eAtmdy81nHy2krcE2vzpQALc/u8WmvJFlx2kT32ve4SMyfUhqIxb7jTTxjA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0XwK/Hd2RvuhkMm/rWYu8HL5mVeCt2vZNGSbZIYhCR0vFs9v9
	734qwe6ohLpQRKAavAkRIZJw/7yGVsaMVKvOafvX5OA6k4w25yyLTv8FdvLyd5+ObcniFwPnsje
	A1g4vVgFMQIN2JL7FbyR54iS9BfKmU+kGkU2QqzbsxvQXieagC3z5K68INThLiU1CE5owVyQy
X-Gm-Gg: AfdE7cmrCRFDUWuA+X6sTFMirp1jkmPmn7vOhO7PrsEtlr6CFGOQ2bW9lgndJklWzzZ
	/Cmr0TNI8CU8qlfhiqpkJ65+yLfKob4AJEeEiz2dInoERgH5PhHxZdc0IMNjQBP1c1bjjtJJ1GX
	ouMs0KaM5qgiT9qkxsxiu95uFaAALW/8KdAI/yxsiaYg2tapA2ArunrLGD0NhgBZHlCmRvbcezj
	CaPf1owW65gqedHVCP6DO9sBKqvCCpLsNS+r56gVuRklWseqvfKvphLlnv1djEVmxvACt1iYBG/
	RLeS74bH4dp4WrNhYhq+sXdu+hUEUHSHOjtwlvl+4Kfq2GqfvMywD2RsV/yDDBc7UF1icVX2W6e
	2/ZuecqNB1IH+h6eLJfJI948vEzxY4rKd+mw=
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr93170971cf.2.1783340648130;
        Mon, 06 Jul 2026 05:24:08 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr93170791cf.2.1783340647458;
        Mon, 06 Jul 2026 05:24:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm731134666b.0.2026.07.06.05.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:24:06 -0700 (PDT)
Message-ID: <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:24:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BDOFP9N3qsTq6uNya6Fr5GVgwJkYdbY_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNiBTYWx0ZWRfX+eFWn0GJKI7z
 SE3KoAOOqW4X43ew5A5HZluTDFWFnqRfx4oqqeBGQox3slud2T3PS6G8v5ctJv/Q+xWs2qpdNIB
 832fdPq2gznknSgf9hxHus1k2NA5myM=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b9e68 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4hBvweVN3K0BpMZFuekA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNiBTYWx0ZWRfX9k/CJOU94Z00
 PjcIh/OYD7iDWKWX/SVdMYty3JEDrqRJT5WSWzetZVYfwmSGRyROkXS5JP5eOh2taMAoFThRhw4
 32oLQ2xubkydH8IaSP8kHmbEdbB2cRmDIQSeidpFPRxI0LFR7j3/ftb16/lNoUdLJHNo8UKCArf
 vXlDkh46bQ5GA1o4brAAbyNYIk7joC/n2zlr2CM0A7lTIueWm+N9Z0beHgs/jViNmxnZDK7imlW
 obP6CZqfK0iVRGJlYy3qR/D/l7NluFNFaiL8lVR5HbEV2aVHTNpyV5dFEJpDyOAKE7AjLSBnptV
 2t8aadOmHJJBSRt3jD/QGaMkb1yX1cOihNMwk61hDDTytSUs3Tnw5w8Qo5U9jvxbDxGj12n6NGQ
 ybUuXmkhsxcv1r9DN0Yct+yzpQzohDw9YwAUvOW0Zmp2/TirtVt1Gy5HneCCo+EzGKumyPb8wwk
 hdyLv5RkroAYeyB9Hhg==
X-Proofpoint-ORIG-GUID: BDOFP9N3qsTq6uNya6Fr5GVgwJkYdbY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060126

On 7/2/26 9:36 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +struct qcom_clk_ref_provider {
> +	struct qcom_clk_ref *refs;
> +	size_t num_refs;
> +};

If you define num_refs first, then you can have refs be a
zero-length array with __counted_by(num_refs) and make provider
a single allocation, like:

512946cf0f32 ("nvmem: rockchip-otp: alloc clks with main struct")

otherwise someone will come around and "fix" it in a day or two

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

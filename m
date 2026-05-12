Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333713D3B3
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590533; cv=none; b=XUqmv1eakL8cWQbpD1lox4G3jpEE0zBzZ9VQhRAkvjtMYfZQYfH+0Xq8tD0sUbOFbrrC69msfzwI2dGxKxl6U+9bu36XCVmtNR0H32gvebmZ8FT1Kw23bsVW6/F2RvBHgEXKz1Z+n3merX8v2YqmGGkXTmN/Mfl0RzsWGtQCufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590533; c=relaxed/simple;
	bh=XogVvcvi90AvvWQgm9fx9TiRwpye5Jkvt/Cl8lSnZfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hepl/zKXx1HE1BRwAS27Jlt2eUcpos8nHfICjF1amrqpQ6zYMcXB1ynACvghyzVgyb4v8yawTCF7X5mm2jiGNqTShBd6csH0pUbeMS8flGpqTyIo+HoBBEAqsu5fxLKKOvAwmJloQ0vUQaY6bU4OGhOCO/J8OCGn53pritVcbN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiuOlbB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5J0eyip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiuOlbB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5J0eyip"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAo24m2518442
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=; b=TiuOlbB/AgwHuWBW
	qs+t9ei6NI0us0ahBN/kkUaZ5BwlyLN/Jrizhtek2O1Rqn/n933rubRmaDLtGjLC
	U8MmoM45eOxUS7jyOhKa4vTvDVvGeRalV/U7j3PBqbpP230xKt3wsCYm4rGO42Js
	uO1Fl4SMQlE+y3HO9+Hr+u0JCVNW1+KjdGhkB28kaDZ8PaB/DiIKgtS7cFAa0A8w
	U3rrUsLxyk9fHTmifvFqr1hg+epkZAdZrZGUHfLL5GUtnrBd4JN5x8vyWAjbLtH8
	pGG5npPUEkY6mB1uBlgxMjs0YtvuvB1LcFxUdYhNCwqhZkyoem9005QZsUktn3GI
	Bn1qjw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1kc4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:55:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so3159691a91.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778590530; x=1779195330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=;
        b=F5J0eyipDrPdb8UR/97e2kbfXUvS9ht6qRDmdfFX1C27v2jgas9KTXVTHovQQCtkVR
         RTzTpoRJNK2/ilj33L2ctLW8gEnaNlm2nW3OXnSoqU1nRuO2qNIz8/iArYOygmWA8vC4
         XeGKE78lHwhD7WSSxMacncPJZsP+gqTY8/FFE8ko6YUVaxeIrtdYFRmNFOV7qc8WJp10
         GRK64Wc/APyxScwVwvCRy2ZPbrdSpS/AKLBO0kU68KDWR2ht8Jhv+1foJpDf2Kc7Q90c
         cwfAG0gUAt5lIdJz6lo2e1dYawlOAMVptTQRpKwzE6ZHBP1ZIk7IM8yUoR/AeAU4xGyG
         2O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590530; x=1779195330;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=;
        b=BGkfu6tyPeIupPxrw5zSpChJbZ6zqJQce3zhqsNCJ/kYs45e9aRx+Ax1F/s2M1frnA
         zcXzV9P6JcXkGRAXqhSIcEo4iXlwxuwUX/z7glCiF88Q9RPMrDfQKPQuKB6pYd72TXgg
         v209QYHtjQt7btTVu5dlV6NsLgUTCqFYabL2GMu/FP19uTSco1z3bfy3YTkHAKcVIdm7
         V7RhCd76aWOKBPg2KXdfXK/hc5MHDgO8CQjZ25MfUbS2LcbAI5U58BjvCiFSos+tLFZ6
         e7IwzKasd1EQJu6/6AvXwsOKY21GfIUombs0bGl9Rb0UaW35OJUeBCkmhPuYfM50JEDO
         bS3Q==
X-Forwarded-Encrypted: i=1; AFNElJ89eqncSgQYnK121PlUEeteUeDD8LIZ0Mk9mrNCNWUM4LfosX641ptIkX36kDN0pWe8RY32B/4gkqjT@vger.kernel.org
X-Gm-Message-State: AOJu0YwGep4rx88X66NTDVWpof8uK2pNaTtZ4KRKzWo0XM/AI1zsvPV1
	18wJcXM68bHHb5Y4DxA5YqqkmvrEGrTo9bewLrcilNT56jFfyyb5CDNQZs3kICWG0ez0GAAvfmv
	GMZeXWC4umRY79hGEMTd/3ys3/dkPkQUmbWc2MEGp2LDoX8VjxO1KDYRE5FMu1APKKvmRRcIc
X-Gm-Gg: Acq92OGMSQ9rijN9sYbcoIi6X69BWNbE8zI76DOcd8lGRzZorgFv59tYoezIkU3PJ7T
	4ducMz7GuiFYmpQg8YzwieM4A7oXNOPIrJcNO2nBxTvbbOS3fFPw+VDxJhj8h9BxKZX2Wp3a+or
	xcSjf5p6tL2YZiT+t2le1w1x5saBN8YTae1w3mHeLvdwj6OrXT0z6vgGyjP6sjj+4zjDRcHyzSZ
	rHZT9BSFR8qpCkXAIBxlcg3ujhqTVcx0PDNTPC88ol8Um1RqP+MoQuHCIgEhrIgxeY4HWkgrSgL
	7C/hxYbbEpJSZQ1J1YVGISSUoyJehYOf3z1KJW+ZV5AgrzUvp/KfiNKaB325XLqLYHROYW4cANb
	X3eRwAmz5NtaLMf5r0t40
X-Received: by 2002:a17:90b:4b02:b0:366:3df3:fe45 with SMTP id 98e67ed59e1d1-367d49bbdc0mr14362013a91.19.1778590530036;
        Tue, 12 May 2026 05:55:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b02:b0:366:3df3:fe45 with SMTP id 98e67ed59e1d1-367d49bbdc0mr14361981a91.19.1778590529512;
        Tue, 12 May 2026 05:55:29 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d64de478sm11080286a91.13.2026.05.12.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:55:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        hongxing.zhu@nxp.com, l.stach@pengutronix.de,
        Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260422093549.407022-1-sherry.sun@nxp.com>
References: <20260422093549.407022-1-sherry.sun@nxp.com>
Subject: Re: (subset) [PATCH V14 00/12] pci-imx6: Add support for parsing
 the reset property in new Root Port binding
Message-Id: <177859052375.25787.11297345759999790209.b4-ty@b4>
Date: Tue, 12 May 2026 18:25:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: Wsi2jA95HLhXOY1kDCROLtuT7tFLRzyb
X-Proofpoint-ORIG-GUID: Wsi2jA95HLhXOY1kDCROLtuT7tFLRzyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzMyBTYWx0ZWRfX3zGHveNIHwr5
 xyl9xtjA0vUrIOlr0MuXHDTRh2ULajiyp2udLV5GbSmKuCHPg4/qGGw6lEAjYDFVI4kjku4OZry
 AMkq97WNf3RNzCgSsk7xQnOxC3LknvyAFp3gY564GcuzciFQ2CuKlMcJaltJImgsawgfXzXAJEz
 QnPkbOpcgzgbskcpQL4oJAHBgyMyY3zi+AcZ0s3ztwJkKSoZETJ0Ad6ZhFgQHX7o0UQlb5tjWWK
 EfumgOi1GN9mTahKwH37ZQsRFqCESIsh1snmd8U3h+jhAlhLl5fkczRByXzVrl4gil6DNY20T1Y
 8WzCGjlc0fmSir0+kWQpnWYV1xes9flkPLUC5mID1tfw0uyRsSLxs6nE0Xmq4IBPJpuQB7jtFB4
 GoLWowDcs8CcgLfhfzhQDUV6LlbpS5ihtxOgNMuExVxVDkU65dXB+6SU4BFpZKFxoxNm/ETEppE
 L8/McpSqzS8amLpxFYQ==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a032343 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=VUCeidzB4OgQmi4dmx4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120133


On Wed, 22 Apr 2026 17:35:37 +0800, Sherry Sun wrote:
> This patch set adds support for parsing the reset property in new Root Port
> binding in pci-imx6 driver, similar to the implementation in the qcom pcie
> driver[1].
> 
> Also introduce generic helper functions to parse Root Port device tree
> nodes and extract common properties like reset GPIOs. This allows multiple
> PCI host controller drivers to share the same parsing logic.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
        commit: 556c5f7aa06d3e8119d35f40b6602d3a547cef9e
[02/12] PCI: host-generic: Add common helpers for parsing Root Port properties
        commit: 6cfd1e2fae1bbaa9258794ba9f3128afb752245c
[03/12] PCI: imx6: Assert PERST# before enabling regulators
        commit: 97eacf72d1754eeff8624114074929606fc3f2bb
[04/12] PCI: imx6: Add support for parsing the reset property in new Root Port binding
        commit: 40b7f61a1a4d7fd18188f3f87e15ff5a90ce1d31

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


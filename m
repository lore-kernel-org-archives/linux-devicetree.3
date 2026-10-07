Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209D943C051
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377498; cv=none; b=S6pk28Sv5ohmUarJ2m1e6w/u/59Zq3AS64wcJY+D+eZvU/GdrlaWEL9Ei5420KhWe6Qd8F/cQxEPXU4tkqs6PKZ1KmrPUwU8NA5WKocUYVBFo7xs2gsIShXgBmEz7hoBw+uupwxv0Feh5/MDRCrNnzPVFyc8ko5moUS/kAyO3IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377498; c=relaxed/simple;
	bh=wtguUlcw0GtiL0z35uyyAK5blBD7fMvV9mBxhqKMXEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHHSXwTtmZKxao3uC0OVzDEQFewpa7KNS9HuqbUZF7AQpjeOOxALn2F9oiXzsK5vxpMntW1IrzepjTep2xfithqLM8+UnjGsdp9yXu0CB7XFnmE3WaVxC1bg3eH9dBRMhV9PJizbrN+NRXq2JHyjheMKgYTJVcCpEwh+BI3urwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZB5KAB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoE0f7Hc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZB5KAB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoE0f7Hc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCil3198240
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 12:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iOU4Nw6gbPDpDYyyYvhCrTJzp3FNRBXEt2PfX5HLqU=; b=eZB5KAB4mgfBa9wQ
	T8wFHlwZC+eeG/bWh78cicxdArDzgCEIm1zauFeJ7Kj9zaL9bdB2mjrKgZ4QSrik
	0+PR678KnG7nnERTzMRKgT/yNS8tkBybMdvF6vDaabd+fupl0W+aWLJDoeXewgO5
	hXCVzHz3XLw7n47J1bPp6nu+bFRuFBpFqqyWmFDexW9xS56bcdjQm13Yuk9BDMbA
	7Whgh1Q2LgkLc6NR5PGWqyu1j4qDe8iURpRlZ5Vv3GsYec0riGZ8xqlPcTfKB4h0
	5ypnE2qzkDWnak+55pVgT5ixoPJkLL6BbMyVJ8+G7J6MuXUU3/ZLReh1fnL23Is2
	c9TfTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s25kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 12:51:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so5872680a91.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377486; x=1791982286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iOU4Nw6gbPDpDYyyYvhCrTJzp3FNRBXEt2PfX5HLqU=;
        b=QoE0f7HcnffZjiZkk64FabqpfwjOJw9Ji/TDdUDOSuaxd9JRx6JKVTFGb6PqozB+Li
         kqN6Q8CJFJsXpLjRzsxtzbri9JZIXy24AB0GE58/OQEjfGfo/HTJbRp33NJtk955PYDp
         zdc2Y3zHHPVu9E5sfHnt76AsDodRvs+FNegSD1somUOTjVh94Z94u2ubElEM+nmUrbwO
         gzbjiRLkTRYdfOA2ZwO2kRyM0Ojdvik1wy1Z5W8upVCzbaYHbPzurhH1wHVT/U1rq+8X
         0uufmqMwF+Nzu7tDkXbVyOqpsxWTFx2KRw3iQcLa8PAp3kMtWRJ/Sh24JIPn6125VgtU
         NePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377486; x=1791982286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iOU4Nw6gbPDpDYyyYvhCrTJzp3FNRBXEt2PfX5HLqU=;
        b=GO68ra3LTG1hNmStporW0c76pdVzLkyEh/cdtVYhhk0e5mHsYfi6oPjywAgC/AxPDI
         E8QMgE46qWRWMPnsXQsZVyc5dnwgxtKj/RvUQzrwR23ty5RBQIFrnk+Uxxezwep01A3S
         JfEH65rjyy3S3Qp36Q+XFtWDG9DFKMbPoZbXTI3AVFlrXVmGsfqgLH8pasr4sPN/DiBa
         4s2qPyWvWXMxtSZSdBRAwFsJvgyO43w6SotUnCcFwIlh0dwNkM6Yo0QnMGGReIZz4gLB
         7940D3EZ+BI59KKI/5+LuBQqZlyXKuHs5Vn6oP8kJERJEpa9BROwlegXiPYV1FNa/k4m
         Dycg==
X-Forwarded-Encrypted: i=1; AKwUvBzdxkIzKeqgtvXJmf+W3fr/V53c2QjZLZcwwqQZsxSpKYMNTOnrikvnrUlTABqy6b0Vn1jKBtst04Fd@vger.kernel.org
X-Gm-Message-State: AFq9FYIfobAHwvgko4OdRw6DM8+4nnvMzCCyEqSGN+juEze/vhD7MGuJ
	BGCzdmNAfoJmJyAbW5N2gFMEdjCHRpk9lqTD+8jTHzCgbTlJpQgpnaepbkxcvUywmSaD9asQgvD
	Vm+KGpZYB4PN85WUokeJcM32KoL9ZQO8rLDRT704227no7E08kLzqjUqUdVj3qUQR
X-Gm-Gg: AYBFou0fXm8sMlz2eXYmH2iKbwWBpjKzNjrwWejHmUI8/Io401HGnSnGQ2+hbSTbUT4
	+mrQBs4cIQ9t9LfxJMa2vNjDg/+0qhYsEAc1dCpMUoJUbJaXMHWLaDKB5e0tiSoUkyfrJfWmGld
	YwSuDhdHoOQIR4YjuerB7noIikQ4qZ7u6AcZom65Qchk6BdVXmtpTINWC6SH8QBHUk17vpmn5m4
	rRqSF9BwPPIVkDBAI3Ma+9BjdQZdFqs3akxbIOwziSco7YqUuwQnYMEI76ShBvXenC53x6Krpcl
	Qs6lA1fVzVcb6K4kJpNhmnL+Awmnkh6DNWynf0lam3dSEIiNI4buyTzmMULlgjJRaIMXs9bnRFu
	lcJLMmhtpse4y0o0B/rrIZ4atcw==
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr2054758a91.31.1791377485634;
        Wed, 07 Oct 2026 05:51:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr2054745a91.31.1791377485208;
        Wed, 07 Oct 2026 05:51:25 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d718333sm1884954a91.1.2026.10.07.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:51:23 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 18:21:07 +0530
Subject: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
In-Reply-To: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377468; l=791;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=wtguUlcw0GtiL0z35uyyAK5blBD7fMvV9mBxhqKMXEA=;
 b=VBXEK/8aItkX1UCekr/1dylQJ4b/NJGEzi9LFC4LrAGrBbEEu+KOqUZoWl2D6bywGrQW8Ag/s
 0BX8PSZrEl3BQL8LpsJOcSGhf/dk27sKT4JPKB7s7LT6IVys8j1swSt
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: TOBImYSZyWdfETLmvD7nHiFltCfimtjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfXwRYo2jrJupAV
 A9BsJ89LgTmIurNwgT3EHA4OFwS+J1PBuNzXZcVx+sGvHr9UHWApYFPHTDN8fXwzr2WuEfkmnEv
 NZNBAae37S/YSo0pnwLhlp62WQM0AduPYSRyxTOUiJeCMoD0H9Uy0zpjeEeXZDoz1+oK24bXaRQ
 GP/C0enox7NcZRs7NT5jfgO7WJ/k+/E8G+eGFZXssJ2RQxdknvehb1G8fBGzUfFMHyLdE6wmNqm
 HIzqRVygaPQuzfHobJfIMoZY3Kbgg5thCZlq8nrGi+Tp44pF4WclglVp5j2Mk4zsQ2IdzTWt9bO
 5nXxUoZxUqPaA2spJNcRCfB2JOX8IAFU7wtM/NiE1rahYWIBWn+s+WVSZS2bcgDlXkJ8zdedrNi
 bsNgIj6vgiTNlqD863O003y/YYs0xLm59ShRp2qHYM19VKgHambibCXzh+cDNA68lQU8Vsqeajc
 ZFa1xFWsHP8N9W5jYIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX1XJEaUQvNsOo
 rB3rf2HFsBhJcvGbhWlXjiloC8d7hVQ4jK2GxMZMYRSQcNnAun9fhoggU3ByD/qAq3DZQGHMfu5
 ZNGAqZMQozt52arXQK1CWEd6JaGVf4g=
X-Proofpoint-GUID: TOBImYSZyWdfETLmvD7nHiFltCfimtjM
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac6404e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JLjO1t5ekhtB3RsVtqAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070051

Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
This driver supports the LT9611UXD chip used on the Shikra IQS EVK
board to provide HDMI output via the MDSS DSI interface.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 65fcbbfc1601..d18f72e55330 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -977,6 +977,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1


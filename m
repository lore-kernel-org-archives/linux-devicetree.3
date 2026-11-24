Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550539;
	b=CkGptxQCzOoDMSTKzHJP5F87TrkXUSgGk4S73vpOVDRs19alTlDfDzyn4DE7HxCxx0Tc
	 fFqFjsA76XG3nS0Udl1CUMTW4mhbbiOHgt+5N9D2HrZpzzdNxeAjBSdw3YpJ/iszeTceE
	 5+frfHB/xoqVEXkxUFoITJr1ijFhsIwTJEavBhd7/nV4PHJqjYwSvyKGQs5JDsoJr1U5d
	 sD2BWpDwqBOE6zyvyS8CqJ62MGK49HXM9Ehxfpk0s4zoAyFar395U5fEfOxbjPLXnfsys
	 BzV0dCxAbjL8TEp6uHILuJc1KZ5U3aGqqVMjM+w+qTWfSNnFZGO5Up58wCO0CSEWTHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
	b=2vMEE1sRHN+adGDaaVCRXajMaHOM9HQ4OI+esVyYlKDJ7nopPZWqxO3gC8J+Ge7Uo/oA
	 vJD2zLd7Kmju6svAJqfzLjDPTbSrhuwX4SEKLUM7CNAexj38+p2u6MOUBCuALFiz1iGhU
	 lM7MTX3HN1WWwXw5+GvD2AM7O/UJo+frNQX+VwXO1DdO2j1SSvGH7sOLjxGDfyBkBwpso
	 h7cta1tJU3puJNlMuVK8UJnH9wZA/TZbypB/eT1NeU/FSSzzFUJ6yF5G7c+onpUBCcjfP
	 0d6tAGwGhVU7YGoT6etRr1eTmN+cqD00DqmQgnXsdmAD+wlBil9hk5gPPpPlQUqbEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFAD60A2601
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AFAD60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXMFb2306275
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=; b=i3fp15zKSnYDtfXL
	12z6eUu4/VTtjGc2lcePyiRftP+y61UDo/+pdLMNaGNwYcd/TKw9SgQizYgxJoIe
	lfWeNQEXGsVa3FdDN5IqqSx/zHZGfv5Il90dCdpUlK+TOoQ9hy0AgY+k4gaaCPyK
	BIMYh0/ackSVhDz8F/Lka77G1RDzM6dcH5kiunCEtDnT9xa8aFYV1WDteRS1KT5V
	0alo11H6TY/2h0xEO6lMSCyRqQObC9BuuH3XsbFRmnUUn4crQ+NCPKcm2pw5NunH
	ZZYNNZLCFpflGr9lG/WUB405kmPWG+8THdm0Nwv6iRHe/iMPVwDeoyjr9QCW/xMR
	cEpLnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9avx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496156f74fso58360285a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550537; x=1796155337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=ixQDEJ+Uq+T+W8OUIEtBUMjm5aQ4+HEzuyThNyVxQIQonsgavURzKyN9NmortfJIQt
         0Dx78KJ1sUICPxrsl8QChOlIb/rYVDuQao7w71J6R5OrCLDznmzUbuxRmvfAGdAtRowO
         upciD05H3e1oCVrqt7EhITHV84xVUkbZvFEdbTljnk3a+hqO2+9nsDjssgmGSddw+tD2
         yujYzQ7WqscaUTMmKr6bfXCALs1NzCZPeCHwAsh3t4K1Gu4EmzuBvYzXm0afxw4C2KqK
         bMZolIahlZKqeBOF+uspsGn2eWp/nhYFhZpmtkNwtD95Jr+hfWXGRq0Jkp36gtTDHgsO
         3yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550537; x=1796155337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=TsDZUIIF668DRfG4YLJTw/4Ax7rP7frZWpAbrDlh8W9zFccNpikeWq2z3fJj1iI31G
         A8BHoQTnwQh3CUHUVZQUml+b87XaqUjLFyL9WEattDjRoLazQxKmq4H7Sy2bdPWbde0G
         OpNffmf94miRXRUo+vlvzV1wpRD13HpWTN8z+kLMo3XCIvAq6CoDnso8Ej8HRCIDmRxp
         eUmBTOlqpm3Lpn0BlMfLaXOmabHrp/IsE080iqBQkDrWISeSygeO/piBAnSyzrf4QoHt
         /xs8Zrr3KqN7FVS2+GFS+sl+1pyso6+tYwu6Y1xicCnReVrWhnbd4T35CCF8zWmajYNO
         rHbw==
X-Forwarded-Encrypted: i=1; AL+hErGsTQzY1A2kVnptoroINJUaqzt9Fvt/CCHKBA3POSnAPFZo8gkG+ymGm4qMmaP+qthxET8U7huv2YDi@vger.kernel.org
X-Gm-Message-State: APuU4Z+l6z004rYtCk7qoRyE+4Ypo2inuyh/NgnAQHYKyrwDG3ziZ9nL
	ExoMRtG2Kpu6wpAfbn3Zdh+k0a89HMVtswmmzzSZCqtniCY/KpKtyZaYENUryY1InIGhrRu0rHc
	0QAZLYHWCpsbHX6+Vyr8XJFRqpzlto0AGftNmVDPj4FTrJ4a3G4xsLwZNbu8KrG85
X-Gm-Gg: AZFdTZerCu1D/HSVffU8t1XZGhABtdGPdSS+m8ucxZUzNcbva/B5P8ag7TiHmO21tzt
	mXjnRDarFae+cpPnSTwCwq2qSzAhIodb6C1dDvDdSr7XBZWOyMM5hBZojISuv30Kbw7XHkSTH/x
	UAbllnsAxB2RJynNW0NpVTnxqWhZrlpSG3St5+XtG0HD0p7f7bDOhqfS+/biCDka/EeVyb4N8eS
	HdvYZfGGBa923I/j4y88oNQtL8ZMtTnuqwz2XWJmKU+8U08PNbyeY7UiGiXXxBPJ4a88TtEJiSB
	tzEiySSoM9cEcHfMXIKDQR/16xN82URIrBj4sLj1mZwvSu4nPAASXqz1D7vE1OvWp6EasoevNYk
	wfVNlKaumvUys4JgVOqAZHDqBdwpCjzkE59ZkW6Cwm7bEFsxuxMhyLKNG/eXzZEDJkrl8/FGx+R
	dbU5SJYkw=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941328885a.2.1795550536670;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941322085a.2.1795550536057;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:41 +0100
Subject: [PATCH HACK RFC DNM 12/15] thunderbolt: Refuse to activate
 DP/USB3/PCIe tunnels
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-12-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=818;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=xwW3bA6llgOPKSqs1BeEuZQOAAAkb355SkxSOtj9lcU=;
 b=z/91Ffst28wbqwkdjx3GfJSrokIzn34lkqLhPQ0QHj3mOadUBYwq9mfP486m5L1tFwqCcuKFg
 U9LW3XliwnnCDiVva3RM6Kb1InyIgYlgQjJ+9aP6K43DNws8/DYTDtY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX4T/UQffaKpJD
 ZTKCRvR/qigDv+VKgw+e6c6nLo+gJbq4H3AfzDX8tHibhBIjYtb1Qla5KG77hKWxCnqQqu+1mxa
 DjVPsYFKOBGkucoALlwvmqEN9Kgtn8bRcMM5YOJAmhLKHisjyoFKka50XcLTYydqPtZ8FjtxJcc
 SxfmG7YlRjytvl5pTpY9YUrNqp+RVwEwVNpp1Y5BDgKMCs4Okg/FHlVP81HbMnMJ7GSOmM4iGf9
 EoCZGGIPdvFARUOILw9JGpjetRLENVv7y2IW9Hw0F3spgTGdLPPGkh6K/bsZAVYb6v15gLJn5WW
 XN6uDrr8lyif74fRXDL9LM/RDCny22EH6pNVvQOEtFIOQhjFenvpD5ArkiABmgyBjtDxV/S/9va
 UKpQvCWPSR5/REU6KpG/MheczgCBaM9g/DLyWN0RO5C6jYMI/TczaSxfikqysztNpv2qfnPPZ2m
 2ZzlcburQgV+oaEzG8A==
X-Proofpoint-GUID: S-8pUS-ZzUw-Vskw_RICwt7mQiFniDGS
X-Proofpoint-ORIG-GUID: S-8pUS-ZzUw-Vskw_RICwt7mQiFniDGS
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05ed49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Jr2PhzqEZPgRj7HVupcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3hbxLSZlwmi8
 tA6oUeJVibYxC855errXSpKA2O3qFjkP+PjcJhPhg/TnC5hU/is0qrZiKnhX9JwsOznr+2yfbtD
 f0xxU65kvJ9OOVnf424+71yQGKbvlEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

This is for demonstration purposes for anyone wanting to try out the
series on real hw, keeping in mind the constraints detailed in the
cover letter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tunnel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8145657835c5bb060812770a303cbf2649082a55..8b497da596b99d7f9d2e04636caa9896617af2e4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2430,6 +2430,8 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 	int res, i;
 
 	tb_tunnel_dbg(tunnel, "activating\n");
+	if (!tb_tunnel_is_dma(tunnel))
+		return -EOPNOTSUPP;
 
 	/*
 	 * Make sure all paths are properly disabled before enabling

-- 
2.55.0


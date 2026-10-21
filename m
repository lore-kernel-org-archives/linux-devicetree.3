Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603730;
	b=uXPM2ib0HcInVVeiirqscg5aO2eIKiFaM2ykpTNN1a7/IFIfhEVi3YMaJiXl+TA4230c
	 WQ36usj+NPdt27NSF8wqK5PlLITl2QWmKxy+o0m/7lNO4ZuvAMnlHs/opUomEjxrBzXVp
	 FU6B7fJoSWA7Mjt0rbMm3Ihr59rgiHhzpRf2Exn4Q352SCF1rAkw8O7jtcUULpQZT7Q2B
	 QnLar0Od/d2+PgOtYtyWfQ08IpRzGTxjzTRXNUCsnkKaOMYlB8w1yupSa1fTronFCDUQb
	 cZhcabDX0R4RdR4mvyu1X9J2Ac7E7OhX8Q1Pzvsn8alQHLjgE6rYZtyMuVAE6KDn9Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
	b=4KzbUptHmKd0R6lJUwxtl2Q48LTISOw+rGXWEtWH7U2JWe8ZHxnMtj8cVL872SVxMuK4
	 DCxztxsQwCKVbm0F6p3OeE7ECdQnhlJK+DB+FUMca1NrVvGl/hIOaNmNcZjW7ZRw7+032
	 IFarZgh3nbCYVOBwM87mioCQvaaVmz/Yvmjr1xddEc1GI9+WdRXfcKBVRDs1qg7Z0Hw57
	 tJWYaVHr+3y1BZXTdHedYaWGShBOWBYtGkILzDX2wWxugG0hB7oIkY8OmON3/CkWmUugx
	 Rxsaz9JwcRO7+qu/pCwX1OTZKoWumJeQSrQ/iKU1uesz839pjbUUWNZoWlX7F5DYkKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXzf2sWl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYcEk9C3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12563606A32E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12563606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXzf2sWl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYcEk9C3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG3QK7900420
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xMItVK0GNTCbTS7wNNLZ9L
	nzLA8lzBLhQMNHQ7KqQag=; b=lXzf2sWlF9yW8h/R6hYGvTTjP3iUWFtv3bf7Ke
	2vM9WEt14Z4b2yJEw8PBwx7U0yB0uGOs4QA4aOYleGhXy/WVhB4QgO0iD1BAEWBW
	YotZ2LV2/LP7z3Uj3nRoJYoOfmLxLNwaLDoqYZtasAD9oIHCDi4388U/n6VNPLIr
	Z59KAHv6ln2H8wwcPPjZzX7FmeMbSGWPAb72bFrhh0SLjrdvvNvsIsPssfgVKWfO
	oqKlDQbjlhR+jvcka69JUvUnDNl9kiKxqV/70FDFKgkpnq641cQnb5ShJS8JFoN5
	3+m8t8BjXGKdYKcUBfATDhHgOitc+x1zDoWGRIWoiuNSSnFg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2gcwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:28:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1599830c88.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792603727; x=1793208527; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
        b=cYcEk9C3HW17Nm4jnwQJDXsIHB/5tRALfGp2G8OH3g8olDWnn0ErpDB4yvCBPLsdgs
         kNwiKPMvK3aNgYM7NljQmQtwaGK6rk80bbmfOXipN+aE4rO/w28+DPBrYO/HY2h1A6tu
         lV0OhPi/LAayG43EUSc9q7yqCFDldpW/JJg2/HBtqesC5twSY+7hQv/Z9UHN36FtlD4b
         7RKROosHMLo0Dt42vdE7UdiRMZ1wLHzr3DZ0pcyiF+1Cc8PSdj+LEgKXVd+HIndycDjv
         HyhvQf9FL6EfsxV+eZeIUGdshJux5FDAcWA6U4PI15+KwZK4kZ2w4LqLla2QYAhD6oU4
         WtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603727; x=1793208527;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
        b=mkttVTmAxk2wkILAvQ/fRM9zBYBWZZLVeqdKcT+OfjxBnHGeRpyxDnZ4InbCDm/l2K
         EqMnEC1F16AeK7EpE4xiUrA0F+LxMDNa/TRbmiWfRJPivlo5rxZscCMPwdwbvJWRobvC
         nMf4zfzOicKQ0S+T15QJCyZmcFYg9umUyHuKrAPs/Hou/6EV+ksaxdGACtuDU1Z4fq+y
         5OyUvXMSSxE7c6R5aQQ+YVRmBqjGlLMKZpBopB6njkoEr+zTKnJwaxWwAB15mYg/74+N
         VVejttTRRhqxnXcaAYhfX8DBJ3/PikPYYBSn3B1AeUPHubEI4P4jY5GlkE91A5SsqPvp
         h2wA==
X-Forwarded-Encrypted: i=1; AKwUvBwa5/jrjfIMTk1g75EJPcwnQFPlPnjRmmKtve6NM+vkFnPtz1qHCIt1KfN3KPOYHFvz41chUDP21UNK@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ6FNJ5UAqPkbowdFNKttc5ehjSiaMl9pMqR1E/Iul7/0bFmfn
	dgZqJNJd3pUo215XmmK9EIajpNHVYu+yJM5Zdyffpj2m/Onrd32RweiMtVdt+JI1Y91BNHrbZO7
	qnihFw3x290nAy4SYjiAXQMNh7DI7cgpkn+I1x8V7ZKvxWcs/PseMebZSedEDkAOe
X-Gm-Gg: AYBFou0oGvYsupiTPlJ7li9JH4zijDwwm7xfWDOYO5sUclcosONbiSYoCIk9z0QgV0V
	VR4Kf66zbx8Z7mkaZrXmFfvckm9N4h9cbC5MKyn7sWI2GoQbAwfPUNMtee8WNovux1EBayRgoHo
	BrHWknr3/wo7SYP86mym7j+90Xk0CT2S4CHxTULLoAZQOdKj79KgKLzgfMiRIb7rF6BhVAGho8p
	tbIG3McUB3TKixPtriwLOSXKoUwAS4HFSsnqFunVsZFA3MTqUcsOifFCWNllsttovB6lWwSKHVN
	gi1q8C4tpsMtdygvjrpxBgaEil3K5DCl3Hv6KEwogKWI8m3BfViinhWEJcLste/mW0BGpYhTwIq
	N1HDRc4iBfS6eSct0oFgc5RWWsXB/V8OvJgly7xXfCUmG51KBmkWaO55+X0r+TfunuW9m
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id a92af1059eb24-190a50ef799mr3709281c88.20.1792603726503;
        Wed, 21 Oct 2026 10:28:46 -0700 (PDT)
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id a92af1059eb24-190a50ef799mr3709235c88.20.1792603725903;
        Wed, 21 Oct 2026 10:28:45 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm8528561c88.0.2026.10.21.10.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:28:45 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 22:58:37 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAET22GoC/yXMTQrCMBBA4auUWTvQGfwBryIu0mRiRzSRTFqE0
 rsb2+W3eG8Bk6JicO0WKDKraU4NdOjAjy49BDU0A/d8pp4Jq3tlw/B26PMoRVLFyQaMHC6ejo7
 pFKHFnyJRv9v4dt9t0/AUX/83WNcfVUu1o3oAAAA=
X-Change-ID: 20261021-talos-dma-coherent-usb-f2d7c14a215f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792603721; l=959;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=ETROyRThRqGdVF4MqJ6uGiPE5n9rvqkcDXa+DnHtkfI=;
 b=MF9aXAxKll2JXritzcmuL4OWujK7XURpVFZSngCES/Q0lAoQjs7TI6cPtM9TYqBZPQVv7ksKN
 NZxTeZaL3cBBRBujJS3iNdROnInd+scXzy3A0M2Pq26avexiCnwPczu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfX2UbeKluGA8gW
 OTDlq+EiyvO4ROU/MIhWAcZbnWYYL5H/HbBTJwts1EO9arj2fuytJ5AiWjqH2f8T5OxMUZ1Fzzi
 BJv+RbxczuuOLtxsmrQAuBJV56SVbCc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfXzd84JiXG7w6J
 1gWDr/s9Qog7H+xkam6KKSsDjRIiuAkL+MBzo10nhk4SyMvhOTQ6vX9Sdo8H276aiUlUqmnNzIs
 hjvNOh1JZN2o+tjIsiA9dbn1Q1nFSLCa19NJB4nNYomhyd2miM8gniPH88L8yhCe0TEWjqoKj3T
 IM7uguPIZq30OULLGlHZTXou4zUZO21loIGNcz3XfBI6Ckc6nFlIpmjRzqZwYek0rqZYytUfxj2
 TchVhLIc2ks8HT3aW/3KzNPlDK7TbeHQrHk2TPF/rrVKdDU3fRUzCJlwWYi+sckgUhS/4TuJhvF
 CMxiPs9EaCfojrjWP+F514/cNJAsu3sHcxCHm88QLGqCT21W4ie5cvP+K5tZzFjETXiTM3QmKaR
 aU4Wets5qSQvpiB4/Ia85YwnLXbAURjSL31vFj3aIfW1KxxabqiFQjbn/EhB604iWHy9ou/644c
 PD4x1c1U3NW5c5Mn9ow==
X-Proofpoint-ORIG-GUID: -PXNFx9xjpcVgR0eyt3Ta9-Rv3t37ILn
X-Proofpoint-GUID: -PXNFx9xjpcVgR0eyt3Ta9-Rv3t37ILn
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad8f64f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210069

Both USB controllers on Talos are DMA coherent. Add property indicating
the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..70b002d29ef2 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5158,6 +5158,7 @@ usb_1: usb@a600000 {
 			snps,usb3_lpm_capable;
 
 			wakeup-source;
+			dma-coherent;
 
 			status = "disabled";
 		};
@@ -5214,6 +5215,7 @@ usb_2: usb@a800000 {
 
 			maximum-speed = "high-speed";
 			wakeup-source;
+			dma-coherent;
 
 			status = "disabled";
 		};

---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261021-talos-dma-coherent-usb-f2d7c14a215f

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


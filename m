Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670245;
	b=QsNU6cSphSZYBI1vQDKg1OxTmWJ6F8MX/PnZsoATwDpD2iuS0N8i3FqQq0ATYNEqnIAq
	 YNZDkWDt5SZL25CbxKvP6X7LO8Eq1xP8R/Dan/gHGaStl6bv3p3uKkxqD1leGB9U8OrxV
	 rCCR6xDzCvN6uGU05tE936qUiTVPaPyvpwPaVW18ni+C5ZgU/WhM0UfCrVXWu5ITP6F/7
	 OnaYyTgD+npqvSOTkv1RYzz8N/3ue87M1kaQFjOZQYXoql27QR8UtvcDFPls8eW0fqCaR
	 ECOfr/+bLGBR3BoSZocwDTZDvWUvw5G7RDt6VwrQM/3Kb6JaFUbrQZUQzwWTTX/5xmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
	b=zwROosMDRGPSKnSl+2QoMWRPfxjinsn9Ln71Ag+ONk/oX6ARXEIW1iDkzFQuaVdCE86D
	 B8LcZN6GtPUKVbS8kQA78p/66omy2Je/IdbKmOk92g5hCbjrV/Ftg4faVez026lSPMYwn
	 kBhMqiIeuE9rDqdyKpFvL99xQZL1Rpu697/5Qa/kZIlfqWJ0GZiT6D74ceGQ085BuTpKl
	 iR1BFz4wcmf6SOAsIl/Sg2E6VJaOWCqEt9VDTIhwO+2kzXjulTbUvwENtEivoEigA84ro
	 sj67OsVs1vGkN+DAexDvvIojpTtZexFgfH5hMxz6nAI84NgUiVhMK+ZZWgJ0HK8rdEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr6jpaM3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0PTY4IU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5359F606A327
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5359F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr6jpaM3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0PTY4IU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0E8G2397031
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=; b=Lr6jpaM3v/D0WZ+n
	GH4ab8fEPnv2/XRAiQ7CFPe0QDovjK30MxPpKPfj+JHV4jY8CWn4n0w4uVKu9y5b
	d2IFTswbtm9BGlSbcW6Hfjz7NVAEDbIkSwhK9hHsJclg/CBK8FM/6QgYDTTshRXE
	ZqRTbzqrc32LIX4CkRFtH5r+kNp6kGoAfKq2tYyxfHXPG+UdjdWC+l35bBeHq1UP
	R6oyKZv+CZ/hbn4meTEJTc3Vnb7HVpZ6zlUJd9jx5tnZykPF2fFwFXpxaHFILxQP
	e3GBwbUOmbUTrjrGOCviEHv30MEa+fJ24NhNl3gRbaMnL9hXqm1/VzlUHfUlIK6O
	Q0RwcA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93btwyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so2957353eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670243; x=1793275043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=K0PTY4IUT60wi5CH6Jak4D2PX4/Kyh8fV8zR8voiu2zfLf2/ccMEdMiKoxy+Uz3R1G
         16FXA+qYXscY1Kz9f7vdKqkxznRDOTd/V6pZclAwzYYPy4AXcaCObz9qhsuwr9ytsBn1
         9zmhBaHRMD2ItyAYRHCPjKUY6H1qH73g7aiDS9JqgE8uDgFiQDXDRySGYSONnI46skaU
         jubNWXLYU+yJ+nPt203g+cB8LgJl3b1JEXuteX3wEzj5JRZlprh1Dra3Phvc0FZ9Vu4G
         2fpxHIsjJIev4UxTX2SLfyrQYDFeKVkAa+OvPCWPeX/TYovq1dcuKPYF5RVTUwWYFntN
         BCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670243; x=1793275043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=Lufth8ycF9q+yOXwWFL6uz7DTyTWRapTX0HKjUySHK+D6PviJFl/0vC+ZocLhnHGxH
         zkELvz7O28f0X51tgTH4t6cucYf6wqMB9XiztnosQuIPBsrPn3DAsBFoCX5q0SkMW7Hn
         lHs3WlDpNvjxAOlPTKjowR9qaABPKHQyt0v4DrNMFVAtVrOD2qAev3qA641YmSBFKLau
         rNNAfOCJVEWUlZlPhSB1uAj9/HBQcTNFkzaVv7arBeZiOt2RCkgRA/fNqP/HxD8fjry+
         ki6EijitH752v44QhQtlzi/fdn+zjXxWxc6fqkIjxvBoMxECe0KDE2b8od73aGHmcGfY
         q+hw==
X-Forwarded-Encrypted: i=1; AKwUvBz3A3B1iIZN2yAp+hQr6Xd6bT3Z/8S42O84AnMmZ9pv31mQL8QQXuJDLgup7L0OB3ASjLU7m9iUnaFb@vger.kernel.org
X-Gm-Message-State: AFq9FYLOPbkWaFfK4ReGSLAM0f7AxnRM9bcRykeE9OS3gLY82ZfodRuq
	0uoeklFfG/TKboD5w+tRriQl5cwTrPtKbpvGzJFhBRLi5xjU3KjiG03ikSkgQIO/PcBqMLhxMzY
	3SEJQzywGi+aeKL3msNlDsRpLWvXIfaCu4PebKwarkhZisUzVSRa252R+yLrn48Rd
X-Gm-Gg: AYBFou3H0gqYqwJWRnCu7Kik8y7MYK63XrWzG+SODqRSjEifVQeBZIFUVbsPLVsVci+
	x2alGMtDnNHOeT1VOUq2N2u+sMe8myCIQIxZDHAEHRMHjaaB+qk5eo9MPtRL23jCyQGg+53EV8O
	f3s1mKjfBxAPXfIpmR5wMOViVWGL1kEjDZLyMtdRgEByA6KPgZVAsabR03MwZTIt+5XNJ385GkP
	xgpVQYupK/N9bHWyPYu9DUf01oi4ryLAT9DFRkbTdsLn8ZBgR9yKi07YyoLCleUIckAERy89L+y
	mWlddCU5tKUdS1GQVj6nyZzDiVfR+f5V+IIU7KwfojBSFg4vfhGmFrMx49ByDdhRG+jLDzBdE9P
	pNtl9aY6NVSe6pjp9A2J+60eEIHI8/TzxeHI=
X-Received: by 2002:a05:7022:407:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-190a52e2836mr8691730c88.7.1792670243196;
        Thu, 22 Oct 2026 04:57:23 -0700 (PDT)
X-Received: by 2002:a05:7022:407:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-190a52e2836mr8691690c88.7.1792670242643;
        Thu, 22 Oct 2026 04:57:22 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:22 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:03 +0530
Subject: [PATCH RFC v3 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
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
Message-Id: <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: mt7P5iVOGmhQL53vEFKr8XfreoHSvhiA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX0kq8A2pO61cD
 wJysfJGCYRJ0dQ6dXOAAhyyGRzEIKitWIxOoWP2mXvtzFPdlMaxjj+lBgGiSff/DC9b9YGmonSd
 sS6vBdBkG4mVZMYNIvCgVho7FRmc8Ms=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9fa24 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: mt7P5iVOGmhQL53vEFKr8XfreoHSvhiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfXz2xlqgYpUJut
 ZKriHbBmRSocgMRtj0bW0f9/mRSUEmfXHK9b8VtyP0Unpo9AXh5tQrrajHPK+0YAk6qxydqoKg6
 sPBjZkpDEIscwe4LrtL19QLbQOt1lpcNf6Q1UVpyTB6vDmq4pkARfBpSwTVFla+bi5Yuen4LRvs
 3bQ2PtmAIajw1yjZl1px7BtVBna35g5vOAyJpPXhV9qb0lYp0ZEcl4hrajJEQG/4ZMKb0R29buo
 IcEw6A4k8jmwQoS8Q+IMYVwO4U7wSnb7ylda9dQJpTk/5jqU0DWLyM0PuwBh9SQnk4gFc4P0U7d
 3yljLY5ZYd9aOVkqAKFx2rn4eeDZUD70aaXR6lbVNhHPtulbCkdPS9mlpALjAvasI9wA8XTg+tI
 rV6m1Op8H62lSNfi3FRQxfwBt9fW57BQYYfHvni7KLlLON4F/NFTGXZh5fg0279UA9dEQfowNh2
 XLtD/iNLE/0DcuSbznw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470592;
	b=NDkTN3gAhKltRURtTRWWRSnMwso081GUAFYKI43u1MThaqF6Vf/jJ8hmB4loDAK40Cm3
	 3j645YE76gwnhb1ZYsfMcjG/M+Fc2s9bZfHstQRGmvdOCz4jymyhep3TGAAkXS0pHnXEl
	 kGNEFzDnSuAV0XzLkYdGp62EPXa8yAqGQhftUyhNngIGdDqRJagaC1henTo4c8r7+W7QN
	 DsEJq0NQYW+xU2zCxxVxbg3jTdqKxKi7Mkq2W8kkvKaj/bdJN9ljb+sgqzcLZl0hCcIxQ
	 o+qbhfEMsWLks2cThpSPlMXWA97LxSz3QYKi9spfyyEY3NbdDhOYawI9aG88MUrD1Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
	b=EZg8R1YRIEjAoODN2igDJ59Gdl/1kV4/heAntct9ckCDb46fFPKKGyuNhpbitI7R+lxi
	 KpAYrA0ChccoH50bmlbrRXRCHtzzjN9gT82glTe0soAg1tdgyWB63J4KC0O/Q6NgEHVab
	 PqTR2ZA/zvJqExXbHCW38v+twih0nuW+dhiLu/Z4vJo8acnB1i3AEamxtDZUkOF3ffzI/
	 pQWxNaclwNjX9sLSKHQ6YL2e71JQ4jy4tykjRxdyJXOnLgYNbuwyzJDSBttFSaPKlB1Rr
	 3LjyCtBlvZl6a2llnvF6B/+JtnqEGPFuVEjZBYmA5x5gtY54EbNGuewmeVoqbY5ILEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdL0wFRf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MEh8W/pt";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D27606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D27606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdL0wFRf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEh8W/pt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j4NE126395
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=; b=jdL0wFRf6Hn5LMZV
	c4Wyu0uf4e9YIuxbbm7EDDu3gx7zdl+gkN0koMGuC23/o5U7BcLiaHSg5Gc+dtGc
	1STEW98k27ENuOfBB4eOU5QRkmg/toHbxU2Udzdo5CZQomaVGuFTg8KYuMqvB6yP
	bdIxLNEuIfYnNMeo1JTnchAvwRV7V3DU8+TjSIQbNKTc69bRQ+xkWpfYorLXhG2D
	VzWSytzwBtpob+RExPk4ZKRNk/TnJI6AH4aNpKjpLNCwPmO9v64nTtA0fGZRSgzq
	CiH7106sN+CirtjDYZrI3WEM5if7Pw18yH4AUajGA5P2CTk9b4IwKfIcanVdM4sz
	DoHRuQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a082hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so5588910a91.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470590; x=1795075390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
        b=MEh8W/ptjPqxuHU01Kygo1uQKHPf5MZYaGLKkZAXzVZPbzPQrWu4TDRFocm99wFfpi
         45mjuILxuwInEPU5Rsr/taMbaj4/imLUCna57z1htU3zaqsPl06LvSFyM5k/u+TWIhxM
         sc4LMQq0LaJsn5fsXpv8PufgQOG6HY/om8jt5klMo2NJy04cWRh9nUJCVybk6IAGvdBk
         cXbieDNuvhBIS5tgJh/5k6Y/7CbGPVLY2UBL+NTlkY7It45GC6kKAbnrfp8Yq2BZwcZj
         O25JlH9DjH8S3PgEeNe//KJXrBv1XmkDRdQRail10+bRdWBU3PIe/F5biKiLNMewPSph
         mJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470590; x=1795075390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
        b=eMKoNlARGFfjNv/ZoSAXmDpQs3a/vgrISfAGYYYZbOJOqARVMI5L+WbaLItK2RH55/
         egVpMwQOat3cxeJ8xvpFLZjKY2STuI0TXn5SGuviOti0DGcTvYIN7zVUA+1+V55BiL3e
         QsZ7lLSTBOcch9/UolFL6o3GUsk57IcU1QkIvfpRseP9HG2Dd1TQd2TsBgVfGG59dgay
         qGRbGsaAs1hTPS2MnpcVno2mA8o7TvMYTuzmqWg+LguGxU6K5AFKCkgoGhEU13jZFfhk
         hE+jgSbc/oVodkGGaBgXzdv5T3ovRTV7d3HLt6CtoUUm+GqzhXij6IwlbRqMmY5pb0IT
         tgkw==
X-Forwarded-Encrypted: i=1; AL+hErG1fso4bBEuV7ZbImBFdQ5Tb7DTcgqHkBUn8AhdrRtv/34vZDKiHUHy/3RtCaCp9XA0U+VjnXYc+Pti@vger.kernel.org
X-Gm-Message-State: APuU4Z+kp0rkgj0T/elIchVv64pnXkZGqjP0MIq0f8jp1x2xQrmAbpmv
	eZbTYWk0m7UbQxkNaKox8bn/CdmRHEBWYAOgT4KRwUk+JOzLS0ZpiiFK20o0v5d3V606DksomMH
	aYbDd3zNDsUfRwMcrOSnnc2dGYV+uDqnmetE5Mj67DVn7M/5PpXh0kZMRk7HhR0C3
X-Gm-Gg: AYBFou1FJKMQz0lvKUFIVbJXtAGcrut4d9wiatm4uIAEItG58ma4ROR5XZg6H12UXyV
	LjpaUgEayGvVkNk1+G1I14OyhFrgT8YDn6HH+SVy0b2QsclYg7PhHxFfxBc0el1ayD7XhPoARaO
	iJz4xyNb0Ex0xAUzk8WOq4zVpCoGyzQci1AFHBMgc1Qc72IqNnpJ//VvARjvv3YdaHf0jGhJQci
	qf+2v2cm+93gfUdXs/YbexZNlAK+aO7UB1DDVmy+IaCZ6YyNjqgMzL4nR0g6XUK8BXY9qwGIN1H
	g1Wby0N7d1gpJ0s/X3vZ4B9zeQTYUZ4HW9yUTynbBySDcKibl3bti5L6FVL78NzI6STxGfi/PZc
	oq2NGOX4GqdM8HBWj2OSr1uouX79YulJPtM4udE8753j9H6XZG0UsmlP63phENOz+dSxBgB5Lq8
	5nFKyadJzV
X-Received: by 2002:a17:90b:4ac3:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b182ebe947mr5019661a91.29.1794470590122;
        Thu, 12 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a17:90b:4ac3:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b182ebe947mr5019636a91.29.1794470589637;
        Thu, 12 Nov 2026 00:03:09 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:09 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:51 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
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
Message-Id: <20261112-nord-soccp-dt-v4-2-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
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
X-Proofpoint-GUID: VzEtBay6wAQG1U9OS-snJXtUDsrmjpSU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX0s54VCILLiiv
 FPEqXRhemkD4I9wSg5CpdE7nO8DXOpAE1/a5Q8iESxiK/b0HJjWHx+hrd6yMApKe3HFUBlB0eUx
 YE6CUx5ved/Y3gulNBWn6aZEc6Jz+0bgiMjJ0NNFYUWG4kUBAkXWI1i8UVRQ0IVXvdQ4n8YHK1K
 dMc0OGDQJLrdHV0Nf8dDeFsSXljqG9+A5hNoKv0sPhe8JLKN876P+tB97t5q0P26cZIHUc8VMi3
 fHDFyrC8ftQ1O0xc7pVi+PyLb46RhFkbcfXQHowOUk6dNloUVgd+BaymvNUsDFx5DcaVDtssq7O
 fdsNSJr8aOgbBLFrSWJkCZENhBpmARnMG6ZKTZREUDCer4PjPiZgUETxhO20i/vMSBbYm3DGvHb
 BbE3my7mFU8l5h2tnUJgqBtIIJLEFQ94hMjD/49bAnmuHTbG4gu+MnAyV9506w1hQLcZUD3lOMh
 KTuDwVAZUj4coOVUeEQ==
X-Proofpoint-ORIG-GUID: VzEtBay6wAQG1U9OS-snJXtUDsrmjpSU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX6PYCtTZYLeE7
 JXcNOFW0iPTC/sknZ7XcyTBy3Zrx6VMw93cPh6eRZqyCHFrVwFuGdhqiL7MtCZJbiFR2rWpDkQb
 ji6zReZzmb5conad/rIJGoXr1KpshLQ=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af572bf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qVuS7nBUJV19qhEaXjMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120031

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..6bed47b8c913 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -430,6 +430,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &spi16 {
 	status = "okay";
 };

-- 
2.43.0


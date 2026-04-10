Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853D3E5579
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846578; cv=none; b=R1A7d+pXbt/gb30JrM27RZ/Ddg0j0CNR6f0dUoHQB69jcnlVjBfP6S8VDNb3n/NnhDzXeX0EKIhk4sfDThUY31PLEEdvu31aMkphjthxdX1wMsujz1nPgNxZxIu6N38ZggcznYUjk3WW/ZmwyzzJb052Rk69+3z7q+Zdf1SRYW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846578; c=relaxed/simple;
	bh=n7jSBNZ5ug0mTS67M+/wUobdD+HV5PHfSedYmprMGa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFQlzO6GsSjjMiVV1WhXH3eKkxpg3x1YYwCAKPmmN95u48aBnHUdumZ3pHeCiV5425NOpDOARmHMvdooa5EZcB+ApuLkz4pn56wos0M/zoc7ntCZfXIli8Xtm1LjKC/+vV8OWlYj4y73npXvr6nhjSvphNQ53knwgmpNIGSmT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZaepC3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKzIlLC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZaepC3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKzIlLC5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AI4bLb2698249
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XOYFutHdZbo
	YMmrl95d+ZAoYIxfqQwvZc4Sdoino6Iw=; b=cZaepC3eiX8EZjpa3cLCS51TyUk
	VO0bCDrNsSsSMOW498JOKbXmF1e0IiMSN0CLxvofzY6t6sb9eb1pe9xQAd5F8qux
	vKiB2GGJeLlv6nHi7Oz7gOOIA5uWiDVFT+dsrB6VpwPMSV8stgj1Kc4gpDdhuCzi
	q0LbsYJdAl6DxyVwj2Hcqsn1wLsOoc2qwl5kjrXEudwUEYxmVsRRyVvirL2DhUT3
	0G7VvZvHSLSnsVSCn+iQ5u0a2yYfynxAHzGF0UXUQxUnnzLO+8kb6wRunuRarGca
	fW8N+t+RchGZ11cowW1lKxDV7TweLG2K0CtPXQ70j6sUvud1wem6YIoKjBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9v9r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso3286682b3a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846575; x=1776451375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOYFutHdZboYMmrl95d+ZAoYIxfqQwvZc4Sdoino6Iw=;
        b=SKzIlLC5kL/5RZooqfxpkcaLshAytKBOkaK/i13RIBwOvX18Wi06R1spSd50sKyZH9
         YfWSz5HN7kbY8Tez4xqKdbJHA5cL1R7kHMjaJQKYi9ITavtWtSSIgimIidg/oZ4Be1kN
         6n5ag8cYN37b6LWlHTXL2641Ssb9KCppHEGVIJ3Koxzy/J2Nei9Nsrq3pEigoiijGnmh
         8+yV70M6VbJW/afQ9hO+gufoQsjn2Ww/CacbMuBlZTIUasBR2q04ddcdS+29rgDLFuEP
         z0XBx4RvNdr3CPbW4Rjy9/Cca5T1r3JmCgQM9SDsJxmlN0K8OPgG2IyYUatssZd4p5Dh
         3fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846575; x=1776451375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOYFutHdZboYMmrl95d+ZAoYIxfqQwvZc4Sdoino6Iw=;
        b=pyoyEoghmiV+eNjTtVt14JJUuzHb/GIzZSwKY4A+YbS2YcadHwz1GYAzCPrNMBrLOC
         HZlZG0fV5Vl4PWiIKUg/+X9B+0Upza8p1ITcUD6WUUZM3FQHkhVLGwDMr9Z3QO4xWshr
         na7HUMandjpd+JYpGp2Vs+6K9Zzt5wnjTvNKsx5WRgtgxlclwacDunrK0LpFVS9O37oW
         k2jyJRYrSTBo2N5mColQZZrdG2YflQ61OV3ztwDC3tGRiHx2d7PMsfA/JmUIzW7xOQS7
         o3NVhLFwQWbJrfUxpzN7SlUYgq2Fr384hgpwiT2e5srUWpF6JXql9FyUQn/gv1hYhu+q
         TXBg==
X-Forwarded-Encrypted: i=1; AJvYcCV2R0XOZXdgA5aUJGwtC7E8HQtV2+ZTQtAiPwkvpWuJG/zQBtw4W9g+PgcFKH0wjnUWyEunV2pe/Wyu@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbmKcfvzhNPpcLePfdJKiCDJ9jhFgMZnCZu+vLHQgRpg0hngf
	T1B2uikheSsfTy8g6XfUcoAe3Zzg9A+lBDpK/ksN2Fz/9TykG4wi7PxOwwYEKVQb8c8L3V2pWYq
	1GQhy4JOWr3fZfRkqU8FZn4w9IvonjECdAMS+8IqDaDgV7vZkTsCPvRlBpweUC6zI
X-Gm-Gg: AeBDiet6rl8PMvHuwHR63zCtiuPMtNRmLtbh+COEP/6URqx/+jI/lx+D7RAEvJkl87k
	46YuVCoyeMh1vIKGZLR+VGBAMHflD+NgDCI61rQiKgUB46UDP9+1Id6RL0ZoHRJfhwJ2PEmJ0aS
	xR0BPVyjqfrqNUjdP13Hm4/5QI7ZrP9sFwewRaKITzdXvhhz51VHo3sFxNM3oGulVh/8LtwQ62p
	el/885TlRpSiuwNra/sbSL/gcHPN6U+Piv3Fnl+mzng0rH8xSojMDLljZK0Z6APYPl1VMNyFlq5
	JepsUnLDy2il8LYoaGgvb9PXPDM1svrCeuHG2O+uDzE4JmzqD3WjxynOC2zh96LsXAS4/56PU4D
	3v0DW3DALnpi4eqNY0pt1JgcYYLZerce/zvHk2KiC8UEl+5s8
X-Received: by 2002:a05:6a00:4403:b0:82c:6f07:2dc4 with SMTP id d2e1a72fcca58-82f0c288e00mr4648322b3a.21.1775846575039;
        Fri, 10 Apr 2026 11:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4403:b0:82c:6f07:2dc4 with SMTP id d2e1a72fcca58-82f0c288e00mr4648299b3a.21.1775846574526;
        Fri, 10 Apr 2026 11:42:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 13/35] arm64: dts: qcom: sc8280xp: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:50 +0530
Message-ID: <20260410184124.1068210-14-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX2Wq6KLLjENAl
 /DfdwaKCgSbvtZAgwmxwqeXOEF+KoTv1tlG9h/akakH2Hnd8ubua65Rr+7001eImDx3P55p3g3t
 vtRt+75AR8lS997WZ0r3fa3P0Qrk4yRQW/ISa6XhRTKqKJtaEJX0qAV7FOvFLQFaVyNzwf5ic7+
 jjLwJe0P1HI6geciTQpFxkV3Fv56977QW+JBhARPCgGFk//9ywRfBZoWua1t4UEUsBv4CmhZYPU
 4yO7CG7FlOzRoMwVa/2cLfXanYVHnw8MGWPqfVcCkpIrlN+V7Gb3zL7uk1ggBX81pEhkjvLzVGH
 RLoCXT6R6TmOdOXFbQw7vtaYr7nVyAhk+iuiCtaRkHO2Q1X/DeUWj+dWH/Pgvn6QmaPt5UGzuvk
 aQwgVazGNrOz6mlKbL5TZmZfM1c5UIzlybv08Vu80G3UlPhJ++JW9sC++scUno0bb16ehO04Fvg
 No/RnASIpAm4VKEC/CA==
X-Proofpoint-ORIG-GUID: FtTiQxHeaHYxgZHsu_V_8xmhd2v7sCXD
X-Proofpoint-GUID: FtTiQxHeaHYxgZHsu_V_8xmhd2v7sCXD
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d944b0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yBSeMOW9QinR9qUfw4YA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309d3f..2c6e48495d20 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5095,7 +5095,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0


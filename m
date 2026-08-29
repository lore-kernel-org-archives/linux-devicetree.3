Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746D38886B
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032492; cv=none; b=tQ/wvinBlSOyOSFjgM7ZT7cTLuSdIwDREsyj2QRQ+jHJ5eCV7yS8y3uMqxYzMy9E3O9jjKbPD+M8iQQ2uaY38RW75PJBW3DxUqbgvrWeacjQioWiEIqxZGiJJlFOmQMvC+5drlEZ/tupw35ykJ03mcUAEMojnR4FFq+ezlTRdB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032492; c=relaxed/simple;
	bh=Jwc+N+RbC/87sl8XYmsrEN6YP76o/LSd2aUUOiwIpJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFnxjL3XxA0cMxvjaBkQdScL5dMC0hOf12bV7d8I95MP4nAWrlInWHteZ80poXBvZpk+cKqY7MT+JanRvH2Ne/RGC7IHbjhi2/AYODbjDW3guwkQoxEg297iQAHoAic5B5xrhN+fzh259jmnym9ZNwPmeJeF8F6puvFfJFioX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1PQ4I8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqbaNmEI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1PQ4I8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqbaNmEI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGwtP41257716
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunn
	DLN/w26A=; b=T1PQ4I8Q9qWQPka9RuZtZ56l7OtsU+dfZrJOz+kakN814EMO5SX
	3pxhLdUnabqyuFDX/oBlNV4KyeyKeglwYtOlx/xsN93ndMoqJE3hM6ewl3S6tZJm
	hU6T+ZelhR5/l5wWAUk0qTau3oVw/7rZAVcQaFxo1vxPpyQCD5GjAh5ovTGnSUbQ
	vwL9QL0RzxP3vB+iVeEZwru29ZzyXucOyoffr+6FlnEhjRx2rHTeNDy4Jnfx0vyN
	CgWducqyrS+mIx0IHXM3U/c7456dv9VFCgUhtHAp+OYLvHfhQmwhKwGF9+2XBY4C
	7hcrmVVvmcn9PxI2rWm9rHiIdoXZV2l7CSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsguh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52e7a49452aso32887081cf.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032488; x=1788637288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunnDLN/w26A=;
        b=CqbaNmEI7k4mII07eSYz/GpbEn0bu+INuGb3H4rHXp79QZagMGl7cEM5Lhntfi7N8e
         WX33eu+FCAqudE/Fu1oL+PNvXHKLaY/Vi1ooNeGtzkuAqmP8pkWZ1m9EUjdvRusTsawN
         LN7uiZ4GXevLM76//1H24ZScgjhdLoXKXF53yz5PsIAIZ4WG8L5HAfIJyEocE5m4/m2M
         VpG7KHhqi6w0ML+vzVvjEG54OJoFMUkJLrAf7k4qionU9/953QUL3EZawmK3AuhKUWWn
         uMfBv8TQ8vLUJ/LOUQAA6bG9HrhVEXzYWHkzZubt46iYKgo4T5r/x1uky6iIoiMLT3xY
         DVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032488; x=1788637288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunnDLN/w26A=;
        b=IeZwva0L5Ptw5swFuXWP+7SW7mS/D5XpIBsh3N0FjF4a/bCo3pILQocKQLC8Uv3/qU
         0vno4ZKMjZ2mdlTMULyEyIzghtElVvrooVjIH+7Dx8ZPaFmLFezxgjZ423M+daRYc/nr
         0XzC8cfxpM+9WeCAlA73fq55LEsYLMPPgBlAzsOyM1D2he/Pu08tZ+CE+TkWlF2QwLbH
         Uzfdytnjrxd6qtEEiuomKi440L8unQ8tUnWFZjwBlBHPfuBnznRC1sW+ONTHiWmv1k1S
         PRSNHH7bv5HZLyWpC4rtZbFSNUO9MAdmEgR90FdavcKWJCphHXMG+KoNdXVJlsvYnEhQ
         SQcA==
X-Forwarded-Encrypted: i=1; AHgh+RqdklntImInajJALhs++f+s9Rc5fO7OdgaYEsU+UVqMQAHtMjgCDxaXg61blvDYzMFIvUKBXXyH14oI@vger.kernel.org
X-Gm-Message-State: AFuF++m2/fkP1sRKgO74Z9pgsws+2nK993Y7u+Xqqt50HFMrofZi/PTq
	GPvBSkXhnkDP9+0iJcwrL+gqBVqK0cfkIXrbvbTf5OURsqmK9fl12xd9kTrJ99f3hibUWTDlqS3
	+vpbhwki+lx00iGz30D8Z46/9fXKLDpVLLSg9WIjNO/PqEdo58suKj2hr79NH9WTveZcELtbw
X-Gm-Gg: AR+sD11hfSdDiUWhsV5GfPdXJwk8uwdgTuFMjJP6nWhKXAqauFDSLoOlQu7pFjTIDYf
	h+DLoqwuWJLaNsNVjGDCYvUm99qk8vDQNCrmv5twM5+K+V22Htlk+zI3iSxV6p82CXq+6xUubI5
	IyBDEl0/KpkmR5yv+RGYSAw/Gzueo8PAwcHh+G5w7HVNRUjYjGSID1SqUrhvoND2VXFhgduQwCs
	CE429tzjCvxAyq/vuqu3Rmtz097rMZxSDVNaiDqBEgSgvaDjWmrjzWGnYsgQYLcpb0KVLAmQT92
	vbkA8Hmu3GDFDHemqt6AafgZDDBsEHeb1L+3r6/FDk4kDAoR/5h6cR2lljhUE4RD3wIvazV9ltV
	KAY0w7ASoliZzQ0o=
X-Received: by 2002:a05:622a:30c:b0:52f:a2c0:1451 with SMTP id d75a77b69052e-52fb93d17e4mr179442831cf.7.1788032487669;
        Sat, 29 Aug 2026 12:41:27 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:52f:a2c0:1451 with SMTP id d75a77b69052e-52fb93d17e4mr179442551cf.7.1788032487295;
        Sat, 29 Aug 2026 12:41:27 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm255293995e9.6.2026.08.29.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:22 +0200
Message-ID: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jwc+N+RbC/87sl8XYmsrEN6YP76o/LSd2aUUOiwIpJU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXhz4Lrehjos+ZwfOwcRyf+/LQ1LjTZQar3X
 ul8U8kyiBqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM14QAKCRDBN2bmhouD
 115CD/9Z7kbeDsNcTxmBstu9LpGXU+YYsTlq0l+F1qf15cR6vnKuyEsjjeSnWb2iU4HzGAnNroH
 Xa+9iS3LmYOlQ13EfRZAtPHQGo9ZvqSRTLUC5VbEtd+SOVr4oQVyHSaXqDRyytsBazln+YcrTok
 ScUwj8pvP5B0oCuJf8mLKupkN6GhCf9l7riwYlt8YDSE0wgOtOzvY24HuklXxqjEhNyvbHP6/0N
 mWoi15+mqlg8CTeyGI1bbLPvDttwXzQXeinNuhPbfZovnhdC5nlCKirJnCyqdVpFH727c0cHZV9
 rm+6HJ5OH1U9AYvItO0iNteWLJxYcnjFx+SeFpRDvhAVl0mz2/+O1SdWNOaMA6KAcLpuqnhIhv0
 0OCtA9gpM7wc9ItWzuHDARHIYWk4Vo4iRA84Bgpjt3XKMSGQgu4qHbw5QHeaufJU6+0In+qO4bv
 LGYyvrWK4O0SHaXS/xmjwx9qRg14xb1DxCRo1s1ysPZfSiOHjdQoh+SCXPzpulS9NiSTijQW1Ug
 QGv5rpAIQtMiCkE+g4IL5lhg64XMOFKGEOEuPkPnANVlUU9Unhe5kq493biy/gWyWTxXL+gzgIr
 g22GrIUDGCgavJu8tbly6e9gLUltMzhTeFRb9hEzZv7f+fqLaO6kKXMSjQBFE3J+l+RwRO3dwMT p336Oa3emrU99KA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX+iAxWwagQx7o
 mDA7PQ/EFu+iSIR9bEhsq2Ubm+9zPVTNkRAuWllYSRzn16PgQz7d/kurmkX393PGnnyfP/EfMUZ
 cXmwkq6hluwnL+AbhnLVmHCL8y253a9OgJ5HqqjhSy3YB4Hx7+ta+QJL9D5bijj84hWzwLPEJGA
 RA9wBRDTy67SFC4FRL8HpMCfyFR6k8SMZ/TV/B64jY5sd0xjxRgwJQ/MaSSlxRppNZFC+2A4K25
 YlWOix5hlYMOPM/ygcnYjsMyrZ3peWTm7L6bs+4GvQBIz1F5k+5SpEyKRFU0svAE1x8UQ1ojU+y
 J7v5uxQ+RC/nSKL5JaEv+LnXP83+FvNPX7iYQ0FE3vJeZGQM4P4yWAAA5B025FWQPsSCIwso7nb
 1+MoYMxgRuzQPMVbESLGXPZJG6ZD88i+nF2c5pBx1VV3/brl5PoLR2LHqjjbrj0jm6smmRUaUav
 nbKdm9MTe/G8Q+twZsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX+wyuNujLhWAH
 3HaPi/HYO1fQ8HMSiZnT2q7ts4mGgIc+uzg+QklPzIYD3UXTUHok9U61LoEBjwEL3RKuXNx765S
 z94XK0ovDzCqIw5JxATjgUcfLEemdA0=
X-Proofpoint-ORIG-GUID: rUoceGhiGO6gSgR7rpici2oHm29_kN3W
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a9335e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: rUoceGhiGO6gSgR7rpici2oHm29_kN3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290171

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
index e3896253f33e..41a98ba33e80 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
@@ -106,7 +106,7 @@ timer@2c000600 {
 
 	timer@2c000200 {
 		compatible = "arm,cortex-a5-global-timer",
-		             "arm,cortex-a9-global-timer";
+			     "arm,cortex-a9-global-timer";
 		reg = <0x2c000200 0x20>;
 		interrupts = <1 11 0x304>;
 		clocks = <&cpu_clk>;
-- 
2.53.0


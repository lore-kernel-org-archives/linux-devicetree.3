Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517646;
	b=xj8/xBziZhs7oMG8oEM/TSJPFtY/JWLvGpHCLMsagCwrpeCa8qWFI4RVWTYFWQxOtftG
	 w26L1n/eeX7ygLYwDxKH5PL3J79ePOtU+6J8DewPeprHtCi92rmzczyzlh+2RzhRUvb7O
	 lH1izrYC+j0wRa7y/s8KYGkfbdWiAXy2fQNh2Cd6h7g6pezIL1fxZ3+obx6H5ETiRPwof
	 ryioulbWjPKHoPDzcFBl8M7EeSCIR6xTq4Dx3ToZOKyIV555kYFfyldJzdEUImGQVLK7w
	 dVZWo2venoG/3udDsBJtqyz1Lj6V9jR1dJ/rv0D30YfWk2sjkDSGTk2cQ6mhezA80wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12Z61n6cMo=;
	b=w3w5ys51MCEoRebEudpteF/jl9aqri5t9wSBln9XRnVmOpZh7m/8akuIj5HJCjhJuQo2
	 gK9YghZqEGnTGHH+A9w93dwdZ2x3JsDSOghlBrJyIA+6ei8oLJnjhNGGF5rMrkX3OFGaL
	 3s0mxnLm60wC4b3WIOJL6YauY7/jxts5dSCoA/acupIM8he4d+2ou8JCjzRY9bdY+tgW7
	 doGG9o3uwZLto3LFrwOEIlUoXpEmMJfDLw4Tpt4xEGWpsb8eRc7b9fSvF+9T1sH+Xardv
	 jMJ2pxBqYy5ldQwR38vSMSSWDoARWjqxg4KvuRris+PPEFr+g+FWwLzOW/fqyxFZfxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eKD/FC81";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQEcDWtG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AF4606A333
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0AF4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKD/FC81;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQEcDWtG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8PtqG3701185
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12
	Z61n6cMo=; b=eKD/FC81T7rqmqlJgCYC64qlEiX9yY0DX/Gwk0jhCbm1U0g7EOx
	EDtiXngclXsuAHvV/+NyGqLBkgfoghqtPTokfhUbpkfq1UCxkRJJY/2pz2SMA6Fw
	5bJrkbE6c4txEJTS9rfEz5vqO9T26ObHyT6zJblbnr3Vq6aRkxp8H8+T5F0UNZJK
	NWoENirWMh4yqXdKGhLpsDZATHZwMeBvr1CfPFYspc1tIaDUk84CL3OdYZC1XKmT
	k8Rn32RHotm55hkPFZZvxh9czmxjwFOTqEdcihEbzvCaiIlblDTatFzWmN2bUEJc
	ydV2EggAyTugiMgs1PI/IeQzLt/3leiPYrg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky2663-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso5400513eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517644; x=1796122444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12Z61n6cMo=;
        b=gQEcDWtGwvL5mHCWdClZPcFIKbwFetGRkgGI8vKD04EEVmhLKEudzBkGOvHiye5pDk
         RzZu8eb6gnDZkQoxiAGXI8WHwCoD4flM1nyG+3+jGjJf3i0Pm7hcdlk1aE6AXOZ4sLqX
         LbCJ0jR9IyuU1ZaqfHl5CyjM8G/V0SN55Cd5h2GjxyEMn0u0kXiDTgc+oj6j4F+9reTE
         kxE6NW8dJB9gaMzqrBAugoFxgWmXGr1vq6J5ELXfnow8OtSoGGMcsNXmtd5EnI4pCzHe
         uSnqnx2gOUq/rz35jx83ty0EZ9VX1y6HTJHqXuWqFhMFVdg74dMAJ9DVRG9GGDbzX4h2
         V6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517644; x=1796122444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12Z61n6cMo=;
        b=gd2Tjxq7ZI9XpNniroR7bLx7qPXemafHZDLpPUxpXD3kKzNKwfmV+8b7XVtEjJmuum
         vN2efut8fQ6oETGzcPcY4kNJiqTYHEENR6N8mlfmeKzK9usfAaxBJ7qFEWs63C9GGA6Q
         ryB/s/n+ZN/zBJUX0XUHronOIP9xIXGBVN9LNYrPHHhHX2DuE5aNECIcHWz2qBVb8e+C
         n2FG3+1pJNUhuxS3yXGRIpNca/qupYcmA6inntULKRovCUwTIbY7IHxdWdOJZIQtTjKp
         uEKoaR6+qBbNAik1EUbqMEqEJoQI4MvP2EqEZAssNK19fJvgVqPAb6vhd3SgJGZa0bhz
         mkNg==
X-Forwarded-Encrypted: i=1; AL+hErFc9XW/f7LaC1wuErJp2w+d5JHsmKYgbZ/jAAwHCExtZLecVfmAB4rUXZayZ8+pE/7R/8kOmpqZoeXZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8lNQ2bh/QALaBUnSDuu4pf9SwAL5P5XXqtyztizwrbVcIBGlM0
	gHrMt7tuYq7S2IdEbqalMThP5AsK4e9dQiaU2rxVhjkPZXNjtUd1Dwqz3lblN2LuLpNwSNqcVsP
	fYNiSLZ93xumEKEZyELdxp9sDWKi2tJ84S8a3755MgCdTXl6LNTTGCDPOY6NDpfq7
X-Gm-Gg: AZFdTZe8y2q76bha+fh/gh+7mPGWU3b4cOk0ely0lwEXgMFwbN1C8uvUgOAb9Wq3zg+
	1pgeWu26xm5KPlNzXZLNr39f0w9w7ZzT7Cn0gVANOnpw0+DCICz0DfxmpCgeNGsJSC9b3stLnWj
	Cr8Xki17MN9wn4w6j9LoVdwlXcnPMBTMqu+wjyyfwLHx2XfcCS+/yRkQnU7aLtVl4DfSYntu454
	/+/XJilOYIVq9ryBqRUvDwdC/NIJ86QLPci3cYjx9ZOCx5rOfbQ92lxZ6SL7m6SHkW99G6j4seT
	bCO8mi3BijR+0yPQ8eXLhTuK25fwAMPy3xmzdxDkrEsRNUXHx2G8O28NwOAN4+GodETLYQpGkpU
	Q9BKQUwrUP+uz/JbeJMIelUpk4TK0o9sT7eOf2BwKAZIvIn5ubMcv1Czl2rJSzMel4jYlI9CDrq
	ZQMpHFFmYtYnkURg0HAatNBYR+c3zV2eUWr0z+/TljnEtffsF9UjEw62y7
X-Received: by 2002:a05:693c:414b:20b0:386:a10b:f709 with SMTP id 5a478bee46e88-386a10bf99bmr10681225eec.21.1795517644118;
        Tue, 24 Nov 2026 02:54:04 -0800 (PST)
X-Received: by 2002:a05:693c:414b:20b0:386:a10b:f709 with SMTP id 5a478bee46e88-386a10bf99bmr10681194eec.21.1795517643439;
        Tue, 24 Nov 2026 02:54:03 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm19415674eec.18.2026.11.24.02.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:03 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: firmware: Add Seca SCM compatible
Date: Tue, 24 Nov 2026 16:23:57 +0530
Message-ID: <80dec38b30da490c8c7a2d0e9c03c9acaae0b8ad.1795517637.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056ccc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: pjAj5gOo0u6pmC_yasBBOWpQ79GTyXga
X-Proofpoint-ORIG-GUID: pjAj5gOo0u6pmC_yasBBOWpQ79GTyXga
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX3hfTBYrZyDsW
 K/XtU4IvSOWM74dphZRfcvv9XUwEyNa6F/GtWno+BE0CaTWLxszCAfxQtPgogI1qHsKe3P3WOZX
 vqaZZ/FQDySzMHusaQ2jbeiQzFtbSgA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX3bsfcSMqRjqn
 XrNq4/q54mljjEkBJC1fFQQfsAFgxJpfdy8n/Wj9TsVVLG0GXU1Oj6LJNQnN98V9PPt1Ec8XHKV
 ssvDPol2cyDnRWKjB6uHjNdFuEemjpYxYrphN1qVNVInbkBebpIapFkCLZFAyoyFbWzuMb/idae
 INPzAiWYe/D2P6A9fdzL7hG0JgaoLxQsS/BLNfyhmaGK/BKp/KoCj7Ac11dfYRVCGeukDZkmJlh
 +cQA2QJiQLI5uwn3Di34h83jdjeIq3vYvCWRZmmNQHKWxxN+0p16CL3FaWYDhUsPHxuXe3GLJpl
 B2KKBA2+p8lzAkxORt5Xtjcr6f+ickN9Yhki7Wlw/71dLS+8i3sOVnbvKeEoCgTiaYeOzJ0XYAt
 CyrSZ39dN5UVo0ms/X+ybaIzqF0ksXexAcuiGDKkKeOXvM1Fy+JTLlGUmonQkyZP4c/s0exW65f
 xuHGoOBF2gjM85Pfakg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,scm-seca compatible string for the secure channel manager
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..c52ece62c9bb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -70,6 +70,7 @@ properties:
           - qcom,scm-sdx55
           - qcom,scm-sdx65
           - qcom,scm-sdx75
+          - qcom,scm-seca
           - qcom,scm-shikra
           - qcom,scm-sm6115
           - qcom,scm-sm6125

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0


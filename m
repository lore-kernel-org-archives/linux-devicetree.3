Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866426;
	b=h8EF2NBIGS5J6hfo7zYhzQCwdDnzZzibIwPhcgYaFcdAXtam9dTEiRCZnkZyqfvFuw+E
	 B2jLLMh/4ZZiOVda75PAd8bmSeI8AKg+pijlIg/F9UvGRJ/1jcltZi+7vWhhKKhkab+uB
	 uZYZI7KJC3CQ/2XcKAhaR1rE4EpNwTS0KW26MKTeu6U92XFb5FpeI7Mwop7ynDCrZRMnO
	 u2pv9Zosp5+FLaVPoPGIHp0Rm4PCXfTh1FmKGWQcS/LFqN22O1OCZm/e+NoC7MHPP1qAI
	 KT1kcLsanuGKgzKIa1ficqr/0/BAzFY0vvleGfbBn71y+6eqr558z3LvKNgwdc6xXSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F4Ic6Z5dshEh48/IeS1jiToLx2ciWkhOhNrVvaKYk64=;
	b=XXh1MA6tDjPnGTrleCkX/9SxryIlKiEsWK7kDPP4+0df8NEUGHjnBVIJVmhebWPLS1OG
	 2smBFOqB3CsVPQO5npprodxg+8sg6MHLwwPbTI6RQWVLOBHG8ao+WfPcPEB2AbQeCQyD8
	 zbWR6vJ4Eu7alidUFyW6yxb2Xj7MOc/Hm/PLDRJU5fWRl4bD2D+Bd/1CTzwXLs3FXqRdy
	 jb3iHax+V4vug9OhoUiVlcBERYElTyWA1djQ/bsahTwAPW+bMGbDcIU5EvWVncHYjtJDd
	 FbS1tG+JEPZOY4uzDj6G8yMMIqWcutjo2/cIT652l88lURt66q74uxmjWAXhhrq5jtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jqFDH/df";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1k1XbQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19B606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 11:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA19B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jqFDH/df;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1k1XbQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASAI97r2966240
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 11:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F4Ic6Z5dshEh48/IeS1jiT
	oLx2ciWkhOhNrVvaKYk64=; b=jqFDH/dfFSK/ZC9h1D+3IzwMj91h/EdZ7roG91
	idVdHR3OFSV1rDpV33cLZvWJSCI0jSCzxHfTh7tMSh0p6vdT5mFdUNe5io8R/BN3
	Qw5gnbM/fjhPnDH/fRKixuvM8HyzMuzeuk/FtjpfOduFv4gtat5ENzzfqZ+/2giQ
	2+dwTV+dnxpPqnCncgR+UZq4Lt3aE7i1ApInU/Eux2Ww1B+T3zllqkIHiqyhwzY4
	OslBg0+AoDpTDUOe6shCtc8zGw+1ck5SdEXc7kJP/Gx/u2rIadQ46KRBUsbYDAw1
	nOp1caAPEqo8OC0qGTM1K+GMNKoymfnM66aZSFqrlEl3rHfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7mans3q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 11:47:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso9554200eec.1
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795866423; x=1796471223; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F4Ic6Z5dshEh48/IeS1jiToLx2ciWkhOhNrVvaKYk64=;
        b=ao1k1XbQPEvh0+WE4zQ44Rxa741B4nz1tsHCm1RkY3S4vDwWHek9x3imjuSOk2Efoq
         zaR2pnNCBSeOUl+o37qGacCwVhY8OsvkTwYzaDiCGFSxSfarkRgI4xVQOt3PZFG+7Vlp
         LnonaR7X0ddI32GJqo8/GXMp39WgA1S16yVOxvFyC4KvDKm8OxIlsMmgGoh4k9ubB9wF
         wpPiNvCo2PyNaaSDYH40ylb3hwH5Vew1oe4awPsXe4V1fe5lDyLgxgPpsR6kIZp9C+GJ
         xGa7F3NKGF5p6U8Hj1zGyXAPRSMFYf/ELCWw983tXwYT7xpoO0wc64uFbnw8heo08gKG
         aHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866423; x=1796471223;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F4Ic6Z5dshEh48/IeS1jiToLx2ciWkhOhNrVvaKYk64=;
        b=0LbYm+yV9vCmhx6PzvybQed1kBLO4+R18wgcyZK3b5asPHYNUp8FnV2wXGA9QHj519
         HSFMt/rdviXcG71vsyCr+5J8Z3IcAcmwXCs/25ewTiDV/H5Uj7JWh80mGuOQiE/P8xlk
         NWlVSTdKYYDlz8KeoV6RHzGExK61gGBcWit+xVmy4thd8htZvP96q62cI0QtS6RRmtIh
         L2Hfl4jlm9BjM3cMHC3aX+si4C/nJsVAMd3dsxMQzolRA3YxIaE3wRtdMXwPhQwQjBHP
         tW/iMpW2fbGNhK59FEyRZXvNFCoJN/GQXudi0lU6nJNQfF3XPeIhUl7PR8GUx39bmPn6
         72Mw==
X-Forwarded-Encrypted: i=1; AL+hErHCkdNEcxdNJ/v/zUkGfzWXf7n2Y8pMdVX1Ll02ltMNmwOmax0pAa6T/Fsqai4KNTCiFvHHqO+29JD4@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vu+sEx/90zAt9wiqU0OCZXfnNq52zkGvfKaPNMo0mSMnOB55G
	wmLMVNy6dvgJxsiB8cxcI4f4pP+jWvBD+GQiXtmT7VQgxE1rorzaNDLLcgHSEf9IbWRr8hEuo3W
	NaxFOWwid1XbJrbwsH0+jAHQ7xcq1QtGOpRB+PIVcInKUCy8OS7aeFIPf2sB+FL2X
X-Gm-Gg: AZFdTZc7u3r+wUyiSIFLqPJubvwF+Q3YCxGa2lQBBNIK9gY0Xb0gu13sI/Leok76RVJ
	kVyYJUkXrMee7xV6TKRtTW11POUeXZhNoOLEevFYlOCuoWukbWFAqPIyR3OcyopvBzcbIS7Maq4
	YT2E8NOgP0NvmwAGTbKJrHYXczJiU+nprHfxlmte211zeNs5OC39gSMSqnSa2iEb+LMEhWNOi9r
	wD9cVhvX6nXBUlhpaJkSDFBXxGUkDUxEZ7AQWHVmSt2cReK+bfRXZFp5sSymU+KnxVLlANNvJdC
	CCTgbr95n0AZYoaHCJ0JDcuy3R1cisyC8Pq4h5uhGz1H+JQ4ZbZnQ7TaRk0DTu1a4Ny5KFRkky8
	Fum5m8kW8skSpZK6e0dq2Eb2c/Mn/zQW0m68VzwyPwbDGE1QFCHH+9LyFOEGqRWRp8/QGy6/0fq
	tALICXv/m2nQ==
X-Received: by 2002:a05:7300:50fa:b0:384:6487:b155 with SMTP id 5a478bee46e88-38570c359d3mr29790965eec.29.1795866423307;
        Sat, 28 Nov 2026 03:47:03 -0800 (PST)
X-Received: by 2002:a05:7300:50fa:b0:384:6487:b155 with SMTP id 5a478bee46e88-38570c359d3mr29790951eec.29.1795866422845;
        Sat, 28 Nov 2026 03:47:02 -0800 (PST)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm142256281eec.3.2026.11.28.03.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:47:02 -0800 (PST)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 17:16:51 +0530
Subject: [PATCH] arm64: dts: qcom: nord: Add RPMh sleep stats
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
Message-Id: <20261128-nord_stats_node-v1-1-bf12bd1afdb2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACq/CmsC/yXMQQ6CMBBG4auQWdPEVqXKVYghQH9wWLSmUwgJ4
 e4WXX6L93YSRIZQXewUsbJw8Bm6LGh4d36CYpdN5mIqrY1VPkTXSuqStD44KAN7xd0++0d1o1x
 9Ikbefsfm9bcs/YwhnRs6ji/SmeK/cwAAAA==
X-Change-ID: 20261127-nord_stats_node-2e73e579b864
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795866419; l=985;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=b3AjDtyl+wmn8UFRD6n4cPWzVrZqag0hsyxUg5dJG2o=;
 b=1F0TvL7oWIbb9VtxrIR5psPw9gUjypKHZogPnTNN9IAYXtmDa951RQsX4Z153kCP2/CKT0ZJv
 LW9Jz2PDvnlA4oaBMwzU5eAI9sTqmGX2wHARQsqh9qrSRedTTc+ftuf
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: zjSw3xM53WISeFPlZ9zcSnb_ZaCNZFgQ
X-Proofpoint-GUID: zjSw3xM53WISeFPlZ9zcSnb_ZaCNZFgQ
X-Authority-Analysis: v=2.4 cv=Qc/zLcbv c=1 sm=1 tr=0 ts=6b0abf38 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v22c7c0WlVfFw5gVLDMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA0NiBTYWx0ZWRfX5/jpQc1EjRqw
 KY00tXuRORpwMO8mz2lGobwxtrL/TLH9udo8+gZqrMXYbLm3gtybuqFScTfnPiejdfITBFn960X
 qyXCt6FzTePtPNkobVoaErWr2Ggwit+O0fZxpuUG8uQPbRm1uke8Z0xQyLRSs0f5t0Xl0RBvbvq
 aGYVs67q7EzkETeQfvEzshFZT9yuNBf7VJs285RIn26CtNKBadRyaol6ubtq/c4zHCeZxNNJlGs
 JTMQIRK6lRNoxlYBLmdH55UuFbWOBr4o5/1vJkXv2JKmKgarwvXnIKJ60/iA64vGEPoJA//n0tf
 b0+gKRqMn7ILVVUa831NcG5CtL2BWo8ZchPRzKMZbaFREZbIV9d7jeZP8Xtk5blomkjWCS7odwA
 JHQp04VnyvrDbxX0cf+BRFE/SKSSrjeNsvSdbQrcXK2ItboXcE+I8xWk1+RyyXDfHbqr1RB/+PO
 5KLcrAcYS04qUm+ofKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA0NiBTYWx0ZWRfX2yuO1nN3+84v
 bDOjSyYjCHZOpDjHuSUiwgu75HhhAL9M1AjfXxLiVp99KkbAIT0qPNUX9iJERCG3xr1mKB8O39r
 aY8oulCPphqzj61QOiINh7BSQi+sfVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280046

Add RPMh stats to read low power statistics for various subsystem
and SoC sleep modes.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index e6d0bd21744e..f0534769f41f 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1845,6 +1845,11 @@ dispcc0: clock-controller@af00000 {
 		#power-domain-cells = <1>;
 	};
 
+	sram@c30f000 {
+		compatible = "qcom,rpmh-stats";
+		reg = <0x0 0x0c30f000 0x0 0x400>;
+	};
+
 	tcsrcc: clock-controller@f1d9000 {
 		compatible = "qcom,nord-tcsrcc",
 			     "syscon";

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-nord_stats_node-2e73e579b864

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

